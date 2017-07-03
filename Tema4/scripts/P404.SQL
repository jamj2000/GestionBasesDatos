
PROMPT ================================ Practica 4  ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE salar >ALL (SELECT salar
                  FROM EMPLEADOS
                  WHERE numde=122)
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE salar >ALL (SELECT salar
                  FROM EMPLEADOS
                  WHERE numde=150)
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE salar >SOME (SELECT 2.5*salar
                   FROM EMPLEADOS
                   WHERE numde=122)
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT nomem, salar
FROM EMPLEADOS
WHERE salar =SOME (SELECT comis*10 FROM EMPLEADOS); 


PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT nomem, salar
FROM EMPLEADOS
WHERE salar >ALL (SELECT comis*20
                  FROM EMPLEADOS
                  WHERE comis IS NOT NULL)
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 6 ________________________________
SELECT nomem, salar
FROM EMPLEADOS
WHERE salar <ALL (SELECT 20*comis
                  FROM EMPLEADOS
                  WHERE comis IS NOT NULL)
ORDER BY 1; 

