-- PRÁCTICA 5.3

-- SQLPLUS EMPLEADOS/EMPLEADOS
-- SQL> SHOW USER
-- USER is "EMPLEADOS"


-- 1. Realiza una conexión utilizando el cliente SQL*Plus y muestra 
-- el valor de las siguientes variables: USER, ESCAPE, LINESIZE, COLSEP, PAGESIZE, ECHO, SQLPROMPT
SHOW USER
SHOW ESCAPE
SHOW LINESIZE
SHOW COLSEP
SHOW PAGESIZE
SHOW ECHO
SHOW SQLPROMPT


-- 2. Desde el cliente SQL*Plus muestra el valor de las variables AUTOCOMMIT y SERVEROUTPUT.
SHOW AUTOCOMMIT
SHOW SERVEROUTPUT


-- 3.  Desde el cliente SQL*Plus ejecuta el comando HELP SHOW para ver la ayuda acerca del comando SHOW.
HELP SHOW


-- 4.  Desde el cliente SQL*Plus ejecuta el comando HELP SET para ver la ayuda acerca del comando SET.
HELP SET


-- 5. Desde el cliente SQL*Plus pon a ON las variables SERVEROUTPUT y AUTOCOMMIT.
SET SERVEROUTPUT ON
SET AUTOCOMMIT   ON


-- 6. Crea un esquema llamado PLSQL con contraseña PLSQL y rol DBA para realizar las siguientes actividades. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
  IF 10 > 5 THEN
    DBMS_OUTPUT.PUT_LINE ('Cierto');
  ELSE
    DBMS_OUTPUT.PUT_LINE ('Falso');
  END IF;
END;
/
-- Salida: 
-- Cierto


-- 7. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
 IF 10 > 5 AND 5 > 1 THEN
   DBMS_OUTPUT.PUT_LINE ('Cierto');
 ELSE
   DBMS_OUTPUT.PUT_LINE ('Falso');
 END IF;
END;
/
-- Salida: 
-- Cierto


-- 8. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
 IF 10 > 5 AND 5 > 50 THEN
   DBMS_OUTPUT.PUT_LINE ('Cierto');
 ELSE
   DBMS_OUTPUT.PUT_LINE ('Falso');
 END IF;
END;
/
-- Salida: 
-- Falso


-- 9. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
 CASE 
   WHEN 10 > 5 AND 5 > 50  THEN 
     DBMS_OUTPUT.PUT_LINE ('Cierto');
   ELSE
     DBMS_OUTPUT.PUT_LINE ('Falso');
 END CASE;
END;
/
-- Salida: 
-- Falso


-- 10. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
  FOR i IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;
END;
/
-- Salida: Números entre 1 y 10
-- 1 
-- 2
-- 3
-- ...
-- 9
-- 10


-- 11. Ejecuta el siguiente bloque. Indica cuál es la salida.
BEGIN
  FOR i IN REVERSE 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;
END;
/
-- Salida: Números entre 10 y 1
-- 10 
-- 9
-- 8
-- ...
-- 2
-- 1


-- 12. Ejecuta el siguiente bloque. Indica cuál es la salida.
DECLARE
  num NUMBER(3) := 0;
BEGIN
  WHILE num<=100 LOOP
    DBMS_OUTPUT.PUT_LINE (num);
    num:= num+2;
  END LOOP;
END;
/
-- Salida: Números pares entre 0 y 100
-- 0
-- 2
-- 4
-- ...
-- 98
-- 100


-- 13. Ejecuta el siguiente bloque. Indica cuál es la salida.
DECLARE
  num NUMBER(3) := 0;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE (num);
    IF num > 100 THEN EXIT; END IF;
    num:= num+2;
  END LOOP;
END;
/
-- Salida: Números pares entre 0 y 102
-- 0
-- 2
-- 4
-- ...
-- 100
-- 102


-- 14. Ejecuta el siguiente bloque. Indica cuál es la salida.
DECLARE
  num NUMBER(3) := 0;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE (num);
    EXIT WHEN num > 100;
    num:= num+2;
  END LOOP;
END;
/
-- Salida: Números pares entre 0 y 102
-- 0
-- 2
-- 4
-- ...
-- 100
-- 102

