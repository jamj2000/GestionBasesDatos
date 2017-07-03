
PROMPT ================================ Practica 12 ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT numde, COUNT(numem)
FROM EMPLEADOS
GROUP BY numde; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT numde, ROUND(AVG(salar),2) "Salario medio",
  MIN(salar) "Salario mínimo",
  MAX(salar) "Salario máximo"
FROM EMPLEADOS
GROUP BY numde; 


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT comis, ROUND(AVG(salar),2) "SALARIO MEDIO", 
  ROUND(AVG((SYSDATE-fecna)/365)) "EDAD MEDIA"
FROM EMPLEADOS
GROUP BY comis; 


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT comis, ROUND(AVG(salar),2) "SALARIO MEDIO", 
  TRUNC(AVG((SYSDATE-fecna)/365)) "EDAD MEDIA"
FROM EMPLEADOS
GROUP BY comis; 


PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT numde, comis, ROUND(AVG(salar),2) "SALARIO MEDIO", 
  TRUNC(AVG((SYSDATE-fecna)/365)) "EDAD MEDIA"
FROM EMPLEADOS
GROUP BY numde, comis
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 6 ________________________________
SELECT numde, COUNT(numem), SUM(salar)
FROM EMPLEADOS
WHERE numde IN (SELECT numde	
                FROM EMPLEADOS
                WHERE salar>2500)
GROUP BY numde; 
