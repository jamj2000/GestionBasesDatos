-- PRÁCTICA 5.5

-- SQLPLUS EMPLEADOS/EMPLEADOS


-- 1. Escribe un procedimiento que muestre el número de empleados 
-- y el salario mínimo, máximo y medio del departamento de FINANZAS.
-- Debe hacerse uso de cursores implícitos, es decir utilizar SELECT ... INTO. 
CREATE OR REPLACE 
PROCEDURE Finanzas AS
  numero NUMBER;
  maximo NUMBER;
  minimo NUMBER;
  media  NUMBER;
  dpto   NUMBER;
BEGIN
  SELECT NUMDE INTO dpto FROM DEPARTAMENTOS 
  WHERE UPPER(NOMDE) = 'FINANZAS';

  SELECT COUNT(*), MAX(SALAR), MIN(SALAR), ROUND(AVG(SALAR), 2)
    INTO numero, maximo, minimo, media 
    FROM EMPLEADOS WHERE NUMDE = dpto;
 
  DBMS_OUTPUT.PUT_LINE('Departamento de FINANZAS');
  DBMS_OUTPUT.PUT_LINE(numero || ' Empleados');
  DBMS_OUTPUT.PUT_LINE(maximo || ' € es el salario máximo');
  DBMS_OUTPUT.PUT_LINE(minimo || ' € es el salario mínimo');
  DBMS_OUTPUT.PUT_LINE(media  || ' € es el salario medio');
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No se han encontrado datos');
END Finanzas;
/


-- 2. Escribe un procedimiento que suba un 10% el salario a los EMPLEADOS
-- con más de 2 hijos y que ganen menos de 2000 €. Para cada empleado 
-- se mostrará por pantalla el código de empleado, nombre, salario anterior y final.
-- Utiliza un cursor explícito. La transacción no puede quedarse a medias. 
-- Si por cualquier razón no es posible actualizar todos estos salarios,
-- debe deshacerse el trabajo a la situación inicial.
CREATE OR REPLACE 
PROCEDURE Subir_salarios AS
  CURSOR c IS
    SELECT NUMEM, NOMEM, SALAR, ROWID 
    FROM EMPLEADOS WHERE NUMHI > 2 AND SALAR < 2000;
  sal_nuevo NUMBER;
BEGIN
  FOR registro IN c LOOP
    UPDATE EMPLEADOS SET SALAR = registro.SALAR*1.10 
    WHERE ROWID = registro.ROWID;
    sal_nuevo := registro.SALAR*1.10;
    IF SQL%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('Actualización no completada');
    END IF;
    DBMS_OUTPUT.PUT_LINE(registro.NUMEM || ' ' || registro.NOMEM 
      || ' : ' || registro.SALAR || ' --> ' || sal_nuevo);
  END LOOP;
  COMMIT;
  
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
END Subir_salarios;
/


-- 3. Escribe un procedimiento que reciba dos parámetros (número de departamento, hijos).
-- Deberá crearse un cursor explícito al que se le pasarán estos parámetros y 
-- que mostrará los datos de los empleados que pertenezcan al departamento 
-- y con el número de hijos indicados. Al final se indicará el número de empleados obtenidos. 
CREATE OR REPLACE 
PROCEDURE Dpto_Empleados_Hijos (
  numero EMPLEADOS.NUMDE%TYPE, 
  hijos  EMPLEADOS.NUMHI%TYPE )
AS
  CURSOR c(numero EMPLEADOS.NUMDE%TYPE, hijos EMPLEADOS.NUMHI%TYPE) IS
    SELECT NUMEM, NOMEM, NUMHI, NUMDE
    FROM EMPLEADOS WHERE NUMDE = numero AND NUMHI = hijos;
  contador NUMBER;

BEGIN
  contador := 0;
  FOR registro IN c (numero, hijos) LOOP
    DBMS_OUTPUT.PUT_LINE(registro.NUMEM || ' ' || registro.NOMEM 
      || ' ' || registro.NUMHI || ' ' || registro.NUMDE);
    contador := contador + 1;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(contador || ' Empleados obtenidos');
END Dpto_Empleados_Hijos;
/


-- 4. Escribe un procedimiento con un parámetro para el nombre de empleado, 
-- que nos muestre la edad de dicho empleado en años, meses y días.
CREATE OR REPLACE 
PROCEDURE Edad_Empleado (nombre EMPLEADOS.NOMEM%TYPE) AS
  -- Utilizamos un cursor explícito por si existiese más de un empleado
  -- con el mismo nombre.
  CURSOR c(nom EMPLEADOS.NOMEM%TYPE) IS
    SELECT NOMEM, FECNA
    FROM EMPLEADOS WHERE NOMEM = nom;

  meses NUMBER;
  a     NUMBER;
  m     NUMBER;
  d     NUMBER;

BEGIN
  DBMS_OUTPUT.PUT_LINE('EMPLEADO: AÑOS MESES DÍAS');
  FOR registro IN c(nombre) LOOP
    meses := MONTHS_BETWEEN (SYSDATE, registro.FECNA);
    a := meses/12;
    m := MOD (meses, 12);
    d := (m - TRUNC (m))*30;-- parte decimal de m multiplicada por 30

    DBMS_OUTPUT.PUT_LINE(registro.NOMEM || ':  '
      || TRUNC(a)  || ' ' || TRUNC(m)  || ' ' || TRUNC(d) );
  END LOOP;

END Edad_Empleado;
/