
PROMPT ================================ Practica 5  ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE salar BETWEEN 1500 AND 1600
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT nomem, salar
FROM EMPLEADOS
WHERE salar NOT BETWEEN 720*numhi AND 50*comis*numhi
  AND comis IS NOT NULL
ORDER BY 1; 
