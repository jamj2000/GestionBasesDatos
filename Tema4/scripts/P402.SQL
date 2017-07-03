
PROMPT ================================ Practica 2  ================================
 
PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT nomde
FROM DEPARTAMENTOS
WHERE tidir = 'F'
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT Nomem , Numem , Extel
FROM EMPLEADOS
WHERE Numde = 121
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT nomem "Nombre", extel AS "Extensión Telefónica"
FROM EMPLEADOS
WHERE numde = 110
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT Comis,Nomem,Salar
FROM EMPLEADOS
WHERE Numhi = 3
ORDER BY 1, 2; 


PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT Comis, Nomem, Salar
FROM EMPLEADOS
WHERE Numhi = 3 AND comis IS NOT NULL
ORDER BY 1, 2; 


PROMPT ________________________________ Ejercicio 6 ________________________________
SELECT Salar,Nomem
FROM EMPLEADOS
WHERE Numhi = 0 AND salar > 1200 AND salar < 1500
ORDER BY 1 DESC, 2; 


PROMPT ________________________________ Ejercicio 7 ________________________________
SELECT DISTINCT Numde
FROM EMPLEADOS
WHERE Salar < 1500
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 8 ________________________________
SELECT DISTINCT Comis
FROM EMPLEADOS
WHERE Numde = 110; 


