
PROMPT ================================ Practica 3  ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT 'DEPARTAMENTO DE ' || nomde AS "NOMBRE"
FROM DEPARTAMENTOS
WHERE presu < 30
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT numde ||'-'|| nomde AS "Número-nombre", 
  tidir AS "Tipo de Director"
FROM DEPARTAMENTOS
WHERE presu < 30
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT nomem "Nombre", 12*salar AS "Salario 2014", 
  12*1.02*salar AS "Salario 2015", 
  12*1.02*1.02*salar AS "Salario 2016"
FROM EMPLEADOS
WHERE numhi > 4
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE 120*numhi > 0.2*salar
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT nomem AS "NOMBRE", salar+comis AS "SALARIO TOTAL"
FROM EMPLEADOS
WHERE numde = 112
ORDER BY 2 DESC, 1; 


PROMPT ________________________________ Ejercicio 6 ________________________________
SELECT nomem AS "NOMBRE", salar+comis AS "SALARIO TOTAL"
FROM EMPLEADOS
WHERE numde = 112 AND comis IS NOT NULL
ORDER BY 2 DESC, 1; 


PROMPT ________________________________ Ejercicio 7 ________________________________
SELECT nomem AS "NOMBRE", salar+comis || ' €' AS "SALARIO TOTAL"
FROM EMPLEADOS
WHERE numde = 112 AND comis IS NOT NULL
ORDER BY 2 DESC, 1; 


PROMPT ________________________________ Ejercicio 8 ________________________________
SELECT nomem AS "NOMBRE",
Salar+60*(numhi-3) || ' €' AS "SALARIO TOTAL"
FROM EMPLEADOS
WHERE numhi >= 4
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 9 ________________________________
SELECT nomem AS "NOMBRE", 
  salar+60*(numhi-3) || ' €' AS "SALARIO TOTAL"
FROM EMPLEADOS
WHERE numhi >= (SELECT numhi
                FROM EMPLEADOS
                WHERE nomem='JULIANA')
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 10 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE salar >= 1.15*(SELECT salar
                     FROM EMPLEADOS
                     WHERE nomem='CLAUDIA')
ORDER BY 1;

-- otra forma de hacerlo:

SELECT nomem
FROM EMPLEADOS
WHERE salar >=(SELECT 1.15*salar
               FROM EMPLEADOS
               WHERE nomem='CLAUDIA')
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 11 ________________________________
SELECT nomde
FROM DEPARTAMENTOS
WHERE depde IS NULL; 
