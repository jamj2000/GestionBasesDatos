
PROMPT ================================ Practica 8  ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT nomce
FROM CENTROS
WHERE EXISTS (SELECT *
              FROM CENTROS
              WHERE dirce LIKE '%ATOCHA%'); 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT nomem, salar
FROM EMPLEADOS
WHERE numde=100 
 AND EXISTS (SELECT *
             FROM EMPLEADOS
             WHERE numde=100 AND salar>1300); 

             
PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT nomem, salar
FROM EMPLEADOS
WHERE numde=100 
  AND EXISTS (SELECT *
              FROM EMPLEADOS
              WHERE numde=100 AND salar>2750);


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT nomem, salar
FROM EMPLEADOS
WHERE numde=100 
  AND EXISTS (SELECT *
              FROM EMPLEADOS
              WHERE numde=100 AND salar>3000);
              
              
