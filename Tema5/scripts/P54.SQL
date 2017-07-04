-- PRÁCTICA 5.4

-- 1. Crea un procedimiento llamado ESCRIBE para mostrar por pantalla
--  el mensaje HOLA MUNDO.
CREATE OR REPLACE
PROCEDURE ESCRIBE IS
BEGIN
  DBMS_OUTPUT.PUT_LINE ('HOLA MUNDO');
END ESCRIBE;
/

-- 2. Crea un procedimiento llamado ESCRIBE_MENSAJE que tenga
-- un parámetro de tipo VARCHAR2 que recibe un texto y lo muestre por pantalla. 
-- La forma del procedimiento será la siguiente:
--   ESCRIBE_MENSAJE (mensaje VARCHAR2)
CREATE OR REPLACE
PROCEDURE ESCRIBE_MENSAJE (mensaje VARCHAR2) IS
BEGIN
  DBMS_OUTPUT.PUT_LINE (mensaje);
END ESCRIBE_MENSAJE;
/


-- 3. Crea un procedimiento llamado SERIE que muestre por pantalla una 
-- serie de números desde un mínimo hasta un máximo con un determinado paso.
-- La forma del procedimiento será la siguiente: 
--   SERIE (minimo NUMBER, maximo NUMBER, paso NUMBER)
CREATE OR REPLACE
PROCEDURE SERIE (minimo NUMBER, maximo NUMBER, paso NUMBER) IS
  num NUMBER := minimo;
BEGIN
   WHILE num <= maximo LOOP
    DBMS_OUTPUT.PUT_LINE (num);
    num := num + paso;
  END LOOP;
END SERIE;
/


-- 4. Crea una función AZAR que reciba dos parámetros y genere 
-- un número al azar entre un mínimo y máximo indicado. 
-- La forma de la función será la siguiente: 
--   AZAR (minimo NUMBER, maximo NUMBER) RETURN NUMBER
CREATE OR REPLACE
FUNCTION AZAR (minimo NUMBER, maximo NUMBER) RETURN NUMBER IS
  rango NUMBER := maximo - minimo;
BEGIN
  RETURN MOD(ABS(DBMS_RANDOM.RANDOM), rango) + minimo;
END AZAR;
/


-- 5. Crea una función NOTA que reciba un parámetros que será 
-- una nota numérica entre 0 y 10 y devuelva una cadena de texto
-- con la calificación (Suficiente, Bien, Notable, ...). 
-- La forma de la función será la siguiente:
--   NOTA (nota NUMBER) RETURN VARCHAR2
CREATE OR REPLACE
FUNCTION NOTA (nota NUMBER) RETURN VARCHAR2 IS
BEGIN
  CASE
    WHEN nota=10 OR nota=9  THEN RETURN 'Sobresaliente';
    WHEN nota=8  OR nota=7  THEN RETURN 'Notable';
    WHEN nota=6             THEN RETURN 'Bien';
    WHEN nota=5             THEN RETURN 'Suficiente';
    WHEN nota<5 AND nota>=0 THEN RETURN 'Insuficiente';
    ELSE RETURN 'Nota no válida';
  END CASE;
END NOTA;
/