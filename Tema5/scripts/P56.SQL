-- PRÁCTICA 5.6

-- 1. 2. y 3. Paquete ARITMETICA. Especificación y cuerpo. 
-- Pruebas para comprobar que las llamadas a funciones
-- y procedimiento funcionan correctamente.


-- PAQUETE ARITMETICA – Especificación 
-- PACKAGE_ARITMETICA.SQL 
CREATE OR REPLACE 
PACKAGE aritmetica IS
  version NUMBER := 1.0;

  PROCEDURE mostrar_info;
  PROCEDURE ayuda;
  FUNCTION suma       (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION resta      (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION multiplica (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION divide     (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION resto      (a NUMBER, b NUMBER) RETURN NUMBER;
END aritmetica;




-- PAQUETE ARITMETICA – Cuerpo
-- PACKAGE_BODY_ARITMETICA.SQL
CREATE OR REPLACE
PACKAGE BODY aritmetica IS

  PROCEDURE mostrar_info IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE
      ('Paquete de operaciones aritméticas. Versión ' || version);
  END mostrar_info;

  PROCEDURE  ayuda IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE ('AYUDA DEL PAQUETE ARITMÉTICA');
    DBMS_OUTPUT.PUT_LINE ('============================');
    DBMS_OUTPUT.PUT_LINE ('Paquete con varias funciones aritméticas.');
    DBMS_OUTPUT.PUT_LINE ('Las funciones disponibles son éstas:');
    DBMS_OUTPUT.PUT_LINE ('- suma (num1, num2), para sumar 2 números');
    DBMS_OUTPUT.PUT_LINE ('- resta (num1, num2), para restar');
    DBMS_OUTPUT.PUT_LINE ('- multiplica(num1, num2), para multiplicar');
    DBMS_OUTPUT.PUT_LINE ('- divide (num1, num2), para dividir');
    DBMS_OUTPUT.PUT_LINE ('- resto (num1, num2), para resto de división');
    DBMS_OUTPUT.PUT_LINE ('Además, existen 2 procedimientos:');
    DBMS_OUTPUT.PUT_LINE ('- mostrar_info, para ver versión');
    DBMS_OUTPUT.PUT_LINE ('- ayuda, para mostrar esta ayuda');
  END ayuda;


  FUNCTION suma       (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a+b);
  END suma;

  FUNCTION resta      (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a-b);
  END resta;

  FUNCTION multiplica (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a*b);
  END multiplica;

  FUNCTION divide     (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a/b);
  END divide;
  
  FUNCTION resto      (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN MOD(a,b);
  END resto;

END aritmetica;
/

-- Pruebas
BEGIN
  ARITMETICA.MOSTRAR_INFO; 
  ARITMETICA.AYUDA; 
END;
/

SELECT ARITMETICA.SUMA      (4,3) FROM DUAL;
SELECT ARITMETICA.RESTA     (4,3) FROM DUAL;
SELECT ARITMETICA.MULTIPLICA(4,3) FROM DUAL;
SELECT ARITMETICA.DIVIDE    (4,3) FROM DUAL;
SELECT ARITMETICA.RESTO     (4,3) FROM DUAL;




-- 4. Paquete GESTION. Especificación y cuerpo. 
-- Procedimientos para gestionar los departamentos. 
-- Pruebas para comprobar que las llamadas a funciones
-- y procedimientos funcionan correctamente.

-- PAQUETE GESTION – Especificación 
-- PACKAGE_GESTION.SQL 
CREATE OR REPLACE 
PACKAGE GESTION AS 
  PROCEDURE CREAR_DEP      (nombre VARCHAR2, presupuesto NUMBER);
  FUNCTION  NUM_DEP        (nombre VARCHAR2) RETURN NUMBER;
  PROCEDURE MOSTRAR_DEP    (numero NUMBER);
  PROCEDURE BORRAR_DEP     (numero NUMBER);
  PROCEDURE MODIFICAR_DEP  (numero NUMBER, presupuesto NUMBER);
END GESTION;
/

-- PAQUETE GESTION – Cuerpo 
-- PACKAGE_BODY_GESTION.SQL 
CREATE OR REPLACE
PACKAGE BODY GESTION AS

  PROCEDURE CREAR_DEP (nombre VARCHAR2, presupuesto NUMBER) AS
    num_dep NUMBER(3);
   
  BEGIN
    SELECT NUMDE INTO num_dep FROM DEPARTAMENTOS
    WHERE NOMDE=nombre;
    -- Si existe, no se produce excepción. Mostramos entonces el
    -- siguiente mensaje.
    DBMS_OUTPUT.PUT_LINE ('Departamento ' || nombre || ' no creado.');
    DBMS_OUTPUT.PUT_LINE ('Ya existe un departamento con dicho nombre.');

    -- Si no existe el nombre de departamento se produce una excepción
    -- la cual aprovechamos para introducir los datos.
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      SELECT MAX(NUMDE)+10 INTO num_dep FROM DEPARTAMENTOS;
  
      INSERT INTO DEPARTAMENTOS (numde, nomde, presu)
      VALUES (num_dep, nombre, presupuesto);
  END CREAR_DEP;


  FUNCTION NUM_DEP (nombre VARCHAR2) RETURN NUMBER AS
    num_dep NUMBER;
  BEGIN
    SELECT NUMDE INTO num_dep FROM DEPARTAMENTOS WHERE NOMDE=nombre;
    RETURN num_dep;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN -1;
  END NUM_DEP;


  PROCEDURE MOSTRAR_DEP (numero NUMBER) AS
    emplea NUMBER(3);
    nombre DEPARTAMENTOS.NOMDE%TYPE;
    presu  DEPARTAMENTOS.PRESU%TYPE;
  BEGIN
       
    SELECT NOMDE, PRESU INTO nombre, presu
    FROM DEPARTAMENTOS WHERE NUMDE = numero;
    DBMS_OUTPUT.PUT_LINE('Num. Dpto: ' || numero|| ' - Nombre Dpto: '
      || nombre || ' - Presupuesto ' || presu );

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE ('No existe este departamento.');
  END MOSTRAR_DEP;


  PROCEDURE BORRAR_DEP (numero NUMBER) AS
    emplea NUMBER(3);
  BEGIN
    UPDATE EMPLEADOS
    SET NUMDE = NULL WHERE NUMDE = numero;
    DBMS_OUTPUT.PUT_LINE(TO_CHAR (SQL%ROWCOUNT)||' empleados afectados.');

    DELETE DEPARTAMENTOS WHERE NUMDE = numero;
    DBMS_OUTPUT.PUT_LINE(TO_CHAR (SQL%ROWCOUNT)||' departamentos borrados.');
  END BORRAR_DEP;


  PROCEDURE MODIFICAR_DEP (numero NUMBER, presupuesto NUMBER) AS
  BEGIN
    UPDATE DEPARTAMENTOS
    SET PRESU = presupuesto
    WHERE NUMDE = numero;
    
    CASE SQL%ROWCOUNT
      WHEN 0 THEN DBMS_OUTPUT.PUT_LINE('No existe el departamento ' || numero);
      WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Actualización realizada.');
      ELSE        DBMS_OUTPUT.PUT_LINE('Algo raro ocurrió!!.');
    END CASE;
  END MODIFICAR_DEP;

END GESTION;
/

-- Pruebas
DECLARE
  num NUMBER;

BEGIN

  GESTION.CREAR_DEP ('MARKETING', 10);
  GESTION.CREAR_DEP ('I+D', 20);

  num := GESTION.NUM_DEP ('MARKETING');
  GESTION.MOSTRAR_DEP ( num );

  num := GESTION.NUM_DEP ('I+D');
  GESTION.MOSTRAR_DEP ( num );

  GESTION.MODIFICAR_DEP (GESTION.NUM_DEP ('MARKETING'), 12);
  GESTION.MODIFICAR_DEP (GESTION.NUM_DEP ('I+D'),       22);

  GESTION.MOSTRAR_DEP ( GESTION.NUM_DEP ('MARKETING'));
  GESTION.MOSTRAR_DEP ( GESTION.NUM_DEP ('I+D'));

  GESTION.BORRAR_DEP (GESTION.NUM_DEP ('MARKETING'));
  GESTION.BORRAR_DEP (GESTION.NUM_DEP ('I+D'));

END;
/
