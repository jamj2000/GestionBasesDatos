
PROMPT ================================ Practica 13 ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT extel, COUNT(numem)
FROM EMPLEADOS
GROUP BY extel
HAVING COUNT(numem)>1; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT numce, AVG(presu) "Presupuesto medio"
FROM DEPARTAMENTOS
GROUP BY numce; 


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT numce,tidir, AVG(presu) "Presupuesto medio"
FROM DEPARTAMENTOS
GROUP BY numce, tidir; 


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT numde, COUNT(DISTINCT extel) "nº EXTENSIONES TELEFÓNICAS"
FROM EMPLEADOS
GROUP BY numde
HAVING AVG(SALAR) > (SELECT AVG(salar) FROM EMPLEADOS); 


PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT numde, sum(salar)
FROM EMPLEADOS
GROUP BY NUMDE
HAVING sum(salar) >= ALL
  (SELECT sum(salar) FROM EMPLEADOS GROUP BY numde); 

-- SI NO NECESITAMOS MOSTRAR EL nº DE DPTO. ES MUCHO MÁS SENCILLA
SELECT MAX(sum(salar)) "SUMA DE SALARIO MAX DPTO"
FROM EMPLEADOS
GROUP BY NUMDE; 
