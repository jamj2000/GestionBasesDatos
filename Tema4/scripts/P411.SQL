
PROMPT ================================ Practica 11 ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT AVG(salar) "Salario medio", 
	MIN(salar) "Salario mínimo", MAX(salar) "Salario máximo"
FROM EMPLEADOS; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT salar, nomem
FROM EMPLEADOS
WHERE  1.4*salar>(SELECT max(salar) FROM EMPLEADOS)
ORDER BY 2; 

-- nota aclaratoria
-- max(salar)-salar < 0.4*salar
-- max(salar)<0.4*salar + salar
-- max(salar)<1.4*salar


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT TRUNC(MAX((SYSDATE-fecna)/365)) "Edad"
FROM EMPLEADOS
WHERE numde = 110; 


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT nomem, TRUNC((SYSDATE-fecna)/365) "Edad"
FROM EMPLEADOS
WHERE numde = 110 AND TRUNC((SYSDATE-fecna)/365) = 
		(SELECT TRUNC(MAX((SYSDATE-fecna)/365))
		 FROM EMPLEADOS
		 WHERE numde = 110); 

--También se podría hacer de esta forma
--pero porque en este caso solo hay un empleado
--con esa edad. Si hubiera más con la misma
--edad pero distintas fechas de nacimiento
--los resultados serían diferentes

SELECT nomem, TRUNC((SYSDATE-fecna)/365) "Edad"
FROM EMPLEADOS
WHERE numde = 110 AND fecna = (SELECT MIN(fecna)
						 FROM EMPLEADOS
						 WHERE numde=110);

						 
PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT COUNT(numem), COUNT (DISTINCT comis), SUM(COMIS)
FROM EMPLEADOS
WHERE numde = 112 AND COMIS IS NOT NULL;
