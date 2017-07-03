
PROMPT ================================ Practica 9  ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT nomem, comis
FROM EMPLEADOS
WHERE numde=110 
  AND EXISTS (SELECT *
              FROM EMPLEADOS
              WHERE numde=110 AND comis IS NOT NULL)
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT nomde
FROM DEPARTAMENTOS
WHERE nomde NOT LIKE '%DIRECC%' AND nomde NOT LIKE '%SECTOR%'; 

-- otra forma:

SELECT nomde
FROM DEPARTAMENTOS
WHERE NOT((nomde LIKE '%DIRECC%' ) OR  (nomde LIKE '%SECTOR%')); 


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT nomem "NOMBRE", salar || ' €' "SALARIO"
FROM EMPLEADOS
WHERE (numhi=0 AND salar>1500) OR  (numhi>0 AND salar <1000)
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT ' nº ' || numem "NÚMERO EMPLEADO", nomem "NOMBRE" , 
  salar + comis || ' €' AS "SALARIO TOTAL"
FROM EMPLEADOS
WHERE (salar+comis) >SOME (SELECT salar+1800 FROM EMPLEADOS)
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT nomem, salar
FROM EMPLEADOS
WHERE (numde=111) 
  AND (comis IS NOT NULL) 
  AND EXISTS (SELECT *
              FROM EMPLEADOS
              WHERE (numde=111) AND (comis > 0.15*salar) )
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 6 ________________________________
SELECT nomde "Nombre de Departamento", 
  tidir "Tipo director", presu "Presupuesto"
FROM DEPARTAMENTOS
WHERE (Tidir='F') 
  OR  (Tidir='P' AND (presu>30 OR  depde IS NULL)); 


PROMPT ________________________________ Ejercicio 7 ________________________________
SELECT  nomde  "Nombre de Departamento", 
  tidir "Tipo director",
  presu ||'.000 €' "Presupuesto"
FROM DEPARTAMENTOS
WHERE (Tidir='F') 
  OR  (Tidir='P' AND (presu > 30 OR  depde IS NULL)); 

