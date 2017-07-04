-- PRÁCTICA 5.7


-- Tabla para auditoria de empleados.
CREATE TABLE AUDITORIA_EMPLEADOS (descripcion VARCHAR2(200));

-- Vista sobre 2 tablas:  DEPARTAMENTOS y CENTROS 
CREATE VIEW SEDE_DEPARTAMENTOS AS
SELECT C.NUMCE, C.NOMCE, C.DIRCE, 
       D.NUMDE, D.NOMDE, D.PRESU, D.DIREC, D.TIDIR, D.DEPDE 
FROM CENTROS C JOIN DEPARTAMENTOS D ON C.NUMCE=D.NUMCE; 

-- Alta de departamento TEMP donde serán movidos los empleados 
-- cuyo departamento desaparezca.
INSERT INTO DEPARTAMENTOS VALUES (0, 10,  260, 'F', 10, 100, 'TEMP');



-- 1. Trigger que, cada vez que se inserte o elimine un empleado, 
-- registre una entrada en la tabla AUDITORIA_EMPLEADOS con 
-- la fecha del suceso, número y nombre de empleado, así como 
-- el tipo de operación realizada (INSERCIÓN o ELIMINACIÓN).
CREATE OR REPLACE
TRIGGER Insercion_eliminacion_empleado
AFTER INSERT OR DELETE ON EMPLEADOS
FOR EACH ROW

BEGIN

  IF INSERTING THEN
    INSERT INTO AUDITORIA_EMPLEADOS 
    VALUES(TO_CHAR(SYSDATE,'DD/MM/YYYY HH:MI:SS') || ' - INSERCIÓN - ' 
      || :new.NUMEM || ' ' || :new.NOMEM  );

  ELSIF DELETING THEN
    INSERT INTO AUDITORIA_EMPLEADOS 
    VALUES(TO_CHAR(SYSDATE,'DD/MM/YYYY HH:MI:SS') || ' - ELIMINACIÓN - '
      || :old.NUMEM || ' ' || :old.NOMEM  );

  END IF;

END Insercion_eliminacion_empleado;



-- 2. Trigger que, cada vez que se modifiquen datos de un empleado, 
-- registre una entrada en la tabla AUDITORIA_EMPLEADOS con 
-- la fecha del suceso, valor antiguo y valor nuevo de cada campo,
-- así como el tipo de operación realizada (en este caso MODIFICACIÓN).
CREATE OR REPLACE
TRIGGER Modificacion_empleado
AFTER UPDATE ON EMPLEADOS
FOR EACH ROW

DECLARE
  cadena VARCHAR2(200);

BEGIN

  cadena := TO_CHAR(SYSDATE,'DD/MM/YYYY HH:MI:SS')
    || ' - MODIFICACIÓN - ' || :new.NUMEM || ' ' || :new.NOMEM || ' - ';

  IF UPDATING('NUMEM') THEN
    cadena := cadena || 'Num. empleado: ' 
      || :old.NUMEM || '-->' || :new.NUMEM;
  END IF;

  IF UPDATING('NOMEM') THEN
    cadena := cadena || ', Nombre: ' 
      || :old.NOMEM || '-->' || :new.NOMEM || ', ';
  END IF;

  IF UPDATING('SALAR') THEN
    cadena := cadena || ', Salario: ' 
      || :old.SALAR || '-->' || :new.SALAR || ', ';
  END IF;

  IF UPDATING('COMIS') THEN
    cadena := cadena || ', Comisión: ' 
      || :old.COMIS || '-->' || :new.COMIS || ', ';
  END IF;

  IF UPDATING('NUMHI') THEN
    cadena := cadena || ', Hijos: ' 
      || :old.NUMHI || '-->' || :new.NUMHI || ', ';
  END IF;

  IF UPDATING('EXTEL') THEN
    cadena := cadena || ', Extensión: ' 
      || :old.EXTEL || '-->' || :new.EXTEL || ', ';
  END IF;

  IF UPDATING('NUMDE') THEN
    cadena := cadena || ', Num. Departamento: ' 
      || :old.NUMDE || '-->' || :new.NUMDE || ', ';
  END IF;

  INSERT INTO AUDITORIA_EMPLEADOS VALUES(cadena);

END Modificacion_empleado;



-- 3. Crea un trigger para que registre en la tabla AUDITORIA_EMPLEADOS 
-- las subidas de salarios superiores al 5%. 
CREATE OR REPLACE
TRIGGER Subida_salario
AFTER UPDATE OF SALAR ON EMPLEADOS
FOR EACH ROW

BEGIN
  IF (:new.SALAR - :old.SALAR) > (:old.SALAR * 0.05) THEN
     INSERT INTO AUDITORIA_EMPLEADOS 
     VALUES(TO_CHAR(SYSDATE,'DD/MM/YYYY HH:MI:SS') 
       || ' - MODIFICACIÓN SALARIO - '  
       || :old.NUMEM || ' ' || :old.NOMEM || ' - '
       || :old.SALAR || ' --> ' || :new.SALAR );
  END IF;
END Subida_salario;



-- 4. Trigger necesario para realizar inserciones, eliminaciones
-- y modificaciones en la vista SEDE_DEPARTAMENTOS. Al tratarse de una vista
-- que involucra más de una tabla, necesitaremos hacer uso de
-- un trigger de sustitución para gestionar las operaciones de actualización 
-- de la información. 
CREATE OR REPLACE 
TRIGGER Actualizacion_departamento
INSTEAD OF DELETE OR INSERT OR UPDATE ON SEDE_DEPARTAMENTOS
FOR EACH ROW

DECLARE
  cantidad  NUMBER(3);

BEGIN

  -- Modificamos datos
  IF UPDATING THEN
    UPDATE CENTROS 
    SET NOMCE = :new.NOMCE, DIRCE = :new.DIRCE
    WHERE NUMCE = :old.NUMCE;
    
    UPDATE DEPARTAMENTOS
    SET NUMCE = :new.NUMCE, NOMDE = :new.NOMDE, DIREC = :new.DIREC,
        TIDIR = :new.TIDIR, PRESU = :new.PRESU, DEPDE = :new.DEPDE
    WHERE NUMCE = :old.NUMCE AND NUMDE = :old.NUMDE;


  -- Borramos datos
  ELSIF DELETING THEN
    -- Si el departamento tiene empleados
    -- los movemos al departamento 'TEMP', luego borramos el partamento
    -- Si el centro tiene departamentos, no borramos el centro.
    SELECT COUNT(NUMDE) INTO cantidad 
    FROM EMPLEADOS WHERE NUMDE = :old.NUMDE;
    IF cantidad > 0 THEN
      UPDATE EMPLEADOS SET NUMDE = 0 WHERE NUMDE = :old.NUMDE;    
    END IF;
    DELETE DEPARTAMENTOS WHERE NUMDE = :old.NUMDE;

    SELECT COUNT(NUMCE) INTO cantidad 
    FROM DEPARTAMENTOS WHERE NUMCE = :old.NUMCE;
    IF cantidad = 0 THEN
      DELETE CENTROS WHERE NUMCE = :old.NUMCE;
    END IF;
   
  
  -- Insertamos datos
  ELSIF INSERTING THEN
    -- Si el centro o el departamento no existe lo damos de alta, 
    -- en otro caso actualizamos los datos
    SELECT COUNT(NUMCE) INTO cantidad 
    FROM CENTROS WHERE NUMCE = :new.NUMCE;
    IF cantidad = 0 THEN 
      INSERT INTO CENTROS 
      VALUES(:new.NUMCE, :new.NOMCE, :new.DIRCE);
    ELSE
      UPDATE CENTROS 
      SET NOMCE = :new.NOMCE, DIRCE = :new.DIRCE
      WHERE NUMCE = :new.NUMCE; 
    END IF;
  
    SELECT COUNT(NUMDE) INTO cantidad 
    FROM DEPARTAMENTOS WHERE NUMDE = :new.NUMDE;
    IF cantidad = 0 THEN 
      INSERT INTO DEPARTAMENTOS 
      VALUES(:new.NUMDE, :new.NUMCE, :new.DIREC, :new.TIDIR, 
             :new.PRESU, :new.DEPDE, :new.NOMDE);
    ELSE
      UPDATE DEPARTAMENTOS
      SET NUMCE = :new.NUMCE, DIREC = :new.DIREC, TIDIR = :new.TIDIR, 
          PRESU = :new.PRESU, DEPDE = :new.DEPDE, NOMDE = :new.NOMDE
      WHERE NUMCE = :new.NUMCE;
    END IF;


  ELSE
    RAISE_APPLICATION_ERROR(-20500, 'Error en la actualización');

  END IF;

END Actualizacion_departamento;



-- 5. Operaciones para comprobar si el disparador anterior funciona correctamente.
-- Inserción de datos
INSERT INTO SEDE_DEPARTAMENTOS (NUMCE, NUMDE, NOMDE) 
VALUES (30, 310, 'NUEVO1');
INSERT INTO SEDE_DEPARTAMENTOS (NUMCE, NUMDE, NOMDE) 
VALUES (30, 320, 'NUEVO2');
INSERT INTO SEDE_DEPARTAMENTOS (NUMCE, NUMDE, NOMDE) 
VALUES (30, 330, 'NUEVO3');

SELECT * FROM CENTROS;
SELECT * FROM DEPARTAMENTOS;

-- Borrado de datos
DELETE FROM SEDE_DEPARTAMENTOS WHERE NUMDE=310;
SELECT * FROM SEDE_DEPARTAMENTOS;

DELETE FROM SEDE_DEPARTAMENTOS WHERE NUMCE=30;
SELECT * FROM SEDE_DEPARTAMENTOS;

-- Modificación de datos
UPDATE SEDE_DEPARTAMENTOS 
SET NOMDE='CUENTAS', TIDIR='F', NUMCE=20 WHERE NOMDE='FINANZAS';

SELECT * FROM DEPARTAMENTOS;

UPDATE SEDE_DEPARTAMENTOS 
SET NOMDE='FINANZAS', TIDIR='P', NUMCE=10 WHERE NOMDE='CUENTAS';

SELECT * FROM DEPARTAMENTOS;