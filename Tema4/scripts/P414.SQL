PROMPT ================================ Practica 14 ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT D.nomde, nomce, max(salar)
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde = D.numde 
                 JOIN CENTROS C ON D.numce = C.numce
WHERE presu < 35
GROUP BY D.nomde, nomce
HAVING MAX(SALAR) > 1500
ORDER BY 1;


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT D2.nomde "Departamento", D1.nomde "Dpto. del que depende",
  D1.PRESU
FROM DEPARTAMENTOS D1 JOIN DEPARTAMENTOS D2 ON D1.numde=D2.depde 
WHERE D2.depde IN  (SELECT numde FROM DEPARTAMENTOS WHERE presu<30)
ORDER BY 1;


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT nomde, ROUND(avg(salar),2) "SALARIO MEDIO"
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde = D.numde
GROUP BY nomde
HAVING avg(SALAR) > (SELECT AVG(salar) FROM EMPLEADOS);


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT nomde, COUNT(numem), SUM(salar), sum(comis), sum(numhi)
FROM DEPARTAMENTOS D JOIN EMPLEADOS E ON D.numde = E.numde 
WHERE TIDIR = 'F'
GROUP BY nomde;


PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT nomde, EXTEL, COUNT(NUMEM)
FROM DEPARTAMENTOS D JOIN EMPLEADOS E ON D.numde = E.numde 
WHERE presu > 35
GROUP BY nomde, extel;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
--con otra interpretación
SELECT nomde, COUNT(NUMEM)/count(extel) AS "NºEMPLEADOS/Nº EXT"
FROM DEPARTAMENTOS D JOIN EMPLEADOS E ON D.numde = E.numde 
WHERE presu > 35
GROUP BY nomde;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

PROMPT ________________________________ Ejercicio 6 ________________________________
--SI HAGO:
SELECT nomem, numhi
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde = D.numde 
WHERE D.tidir='F';
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
--ESTOY OBTENIENDO LOS EMPLEADOS
--QUE TRABAJAN EN DEPARTAMENTOS CUYO
--DIRECTOR LO ES EN FUNCIONES.
--PERO NO AQUELLOS QUE SON
--DIRECTORES EN FUNCIONES
SELECT nomem, numhi
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde = D.numde
WHERE numem IN (SELECT DIREC FROM DEPARTAMENTOS WHERE tidir='F')
ORDER BY 1;


PROMPT ________________________________ Ejercicio 7 ________________________________
SELECT nomde
FROM DEPARTAMENTOS
WHERE NUMDE NOT IN (SELECT numde FROM EMPLEADOS);

-- no rows selected



PROMPT ________________________________ Ejercicio 8 ________________________________
INSERT INTO DEPARTAMENTOS VALUES(300,10,180,'F',10,110,'NUEVO');



PROMPT ________________________________ Ejercicio 9 ________________________________
INSERT INTO EMPLEADOS(NUMEM, NOMEM) VALUES(600,'NORBERTO');



PROMPT ________________________________ Ejercicio 10 ________________________________
SELECT nomde
FROM DEPARTAMENTOS
WHERE NUMDE NOT IN (SELECT numde FROM EMPLEADOS);

-- no rows selected



PROMPT ________________________________ Ejercicio 11 ________________________________
SELECT nomde
FROM DEPARTAMENTOS D LEFT JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE
WHERE NUMEM IS NULL;


PROMPT ________________________________ Ejercicio 12 ________________________________
SELECT nomde
FROM EMPLEADOS E RIGHT JOIN DEPARTAMENTOS D ON D.NUMDE = E.NUMDE
WHERE NUMEM IS NULL;


PROMPT ________________________________ Ejercicio 13 ________________________________
SELECT nomem
FROM EMPLEADOS E LEFT JOIN DEPARTAMENTOS D ON D.NUMDE = E.NUMDE
WHERE E.NUMDE IS NULL;


PROMPT ________________________________ Ejercicio 14 ________________________________
SELECT nomem
FROM DEPARTAMENTOS D RIGHT JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE
WHERE E.NUMDE IS NULL;


PROMPT ________________________________ Ejercicio 15 ________________________________
SELECT nomde, nomem
FROM EMPLEADOS E FULL JOIN DEPARTAMENTOS D ON D.NUMDE = E.NUMDE
WHERE E.NUMEM IS NULL OR D.NUMDE IS NULL;


PROMPT ________________________________ Ejercicio 16 ________________________________
SELECT nomde, nomem
FROM DEPARTAMENTOS D JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
-- No aparecen ni el departamento NUEVO ni el empleado NORBERTO, 
-- porque la combinación interna sólo tiene en cuenta los registros
-- cuyas claves foráneas no están a NULL.


PROMPT ________________________________ Ejercicio 17 ________________________________
SELECT nomem
FROM DEPARTAMENTOS D JOIN EMPLEADOS E ON D.NUMDE = E.NUMDE
WHERE E.NUMDE IS NULL;

-- no rows selected
-- No aparece ningún resultado por el motivo indicado anteriormente:  
-- la combinación interna sólo tiene en cuenta los registros 
-- cuyas claves foráneas no están a NULL.



PROMPT ________________________________ Ejercicio 18 ________________________________
SELECT nomem, nomde
FROM DEPARTAMENTOS NATURAL JOIN EMPLEADOS;


PROMPT ________________________________ Ejercicio 19 ________________________________
SELECT *
FROM CENTROS NATURAL JOIN DEPARTAMENTOS NATURAL JOIN EMPLEADOS;


PROMPT ________________________________ Ejercicio 20 ________________________________
DELETE FROM DEPARTAMENTOS WHERE numde=300;
DELETE EMPLEADOS WHERE numem = 600;
