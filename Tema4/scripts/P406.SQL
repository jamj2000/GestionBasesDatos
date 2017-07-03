
PROMPT ================================ Practica 6  ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT nomem "Nombre", salar || ' €' "Salario"
FROM EMPLEADOS
WHERE nomem LIKE 'A%'
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE nomem LIKE '________'
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT 'DEPARTAMENTO DE ' || nomde "Departamento", 
  presu || '.000 €' "Presupuesto"
FROM DEPARTAMENTOS
WHERE nomde LIKE '%SECTOR%'
ORDER BY 1; 
