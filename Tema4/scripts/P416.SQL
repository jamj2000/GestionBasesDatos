
PROMPT ================================ Practica 16 ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT nomem, salar+0.01*salar
FROM EMPLEADOS
WHERE numde = 100 AND (fecin-FECNA)/365 > 20
ORDER BY 1 DESC;


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT numce, AVG(presu)
FROM DEPARTAMENTOS
GROUP BY numce;


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT nomem, TRUNC((SYSDATE-fecna)/365) AS "EDAD"
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON D.numde = E.numde 
WHERE D.nomde = 'PERSONAL';


-- Otra forma de hacerlo, con NATURAL JOIN:
SELECT nomem, TRUNC((SYSDATE-fecna)/365) AS "EDAD"
FROM EMPLEADOS NATURAL JOIN DEPARTAMENTOS
WHERE NOMDE = 'PERSONAL';


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT dirce, nomde
FROM CENTROS C JOIN DEPARTAMENTOS D ON C.numce = D.numce  
               JOIN EMPLEADOS E ON d.numde = e.numde
WHERE numhi > 3;



PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT DISTINCT dirce, nomde
FROM CENTROS C JOIN DEPARTAMENTOS D ON C.numce = D.numce 
               JOIN EMPLEADOS E ON d.numde = e.numde
WHERE EXISTS  (SELECT * FROM EMPLEADOS WHERE numhi > 3);



PROMPT ________________________________ Ejercicio 6 ________________________________
SELECT numhi, COUNT(numem) "NºEmpleados"
FROM EMPLEADOS
GROUP BY NUMHI;



PROMPT ________________________________ Ejercicio 7 ________________________________
SELECT nomem, TRUNC((SYSDATE-fecna)/365) AS EdadActual,
  salar || ' €' AS Salario
FROM EMPLEADOS
WHERE comis IS NULL;


-- Observamos que al crear el alias de los campos en una consulta de la que 
-- tenemos la intención de crear una vista no ponemos las comillas doble.
-- El único problema que esto plantea es que no podríamos usar alias compuesto
-- por dos palabras separadas de un espacio.
-- Por ejemplo, en lugar de "Edad Actual" ponemos EdadActual.
CREATE VIEW SinComision AS
	SELECT nomem, TRUNC((SYSDATE-fecna)/365) AS EdadActual,
     salar || ' €' AS Salario
	FROM EMPLEADOS
	WHERE comis IS NULL;



PROMPT ________________________________ Ejercicio 8 ________________________________
SELECT AVG(salario) AS MediaSalarios
FROM SinComision;

--ERROR at line 1:
--ORA-01722: invalid number 

-- Nos aparecerá el siguiente error:
--	ORA-01722: número no válido
-- Esto se debe a que estamos tratando de hacer la media aritmética
-- (que es una operación matemática) con un campo al que al añadirle el ' €' 
-- hemos convertido en una cadena de caracteres.
-- Podemos comprobar esto mostrando la vista desde el "Explorador de Objetos"

-- Si hubiésemos creado la vista sin el €:
-- Primero borramos la vista
DROP VIEW SinComision;



-- La creamos sin añadir el €
CREATE VIEW SinComision AS
  SELECT nomem, TRUNC((SYSDATE-fecna)/365) AS EdadActual,
    salar AS Salario
  FROM EMPLEADOS
  WHERE comis IS NULL;



-- Ahora ya podemos hacer la consulta de la vista sin ningún problema
SELECT AVG(salario) AS MediaSalarios
FROM SinComision;



PROMPT ________________________________ Ejercicio 9 ________________________________
SELECT nomde, max(salar)
FROM DEPARTAMENTOS D JOIN EMPLEADOS E ON D.numde = E.numde
GROUP BY nomde
HAVING max(salar) <= 2000;

-- Aunque no lo pide he mostrado también el salario máximo de dichos departamentos
-- para que comprobéis que no supera los 2000 €



PROMPT ________________________________ Ejercicio 10 ________________________________
CREATE VIEW JUBILACIÓN AS
	SELECT nomem, nomde, TRUNC((SYSDATE-fecna)/365) AS Edad, salar
	FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde=D.numde 
     WHERE (SYSDATE-fecna)/365>=60;


     
PROMPT ________________________________ Ejercicio 11 ________________________________
SELECT nomem
FROM JUBILACIÓN
WHERE Edad=60;

-- no rows selected



PROMPT ________________________________ Ejercicio 12 ________________________________
SELECT dirce, nomem, nomde, direc
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde=D.numde
                 JOIN CENTROS C ON  C.numce=D.numce
WHERE nomem LIKE 'J%';

