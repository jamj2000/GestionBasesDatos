
PROMPT ================================ Práctica 7  ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE extel IN (250,750)
ORDER BY 1; 

-- o bien:

SELECT nomem
FROM EMPLEADOS
WHERE extel = 250 OR  extel = 750
ORDER BY 1; 

PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE numde IN (SELECT numde
                FROM EMPLEADOS
                WHERE nomem IN ('PILAR', 'DOROTEA'))
ORDER BY 1; 

-- otras forma de hacerlo:

SELECT nomem
FROM EMPLEADOS
WHERE numde =SOME (SELECT numde
                   FROM EMPLEADOS
                   WHERE nomem IN ('PILAR', 'DOROTEA'))
ORDER BY 1; 

SELECT nomem
FROM EMPLEADOS
WHERE numde =SOME (SELECT numde
                   FROM EMPLEADOS
                   WHERE nomem='PILAR' OR  nomem='DOROTEA')
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT nomde "Nombres Departamentos", 
  direc "Identificador de su director"
FROM DEPARTAMENTOS
WHERE direc IN (SELECT direc
                FROM DEPARTAMENTOS
                WHERE nomde='DIRECC.COMERCIAL' OR  nomde='PERSONAL');

-- otra forma de hacerlo:

SELECT nomde "Nombres Departamentos", 
  direc "Identificador de su director"
FROM DEPARTAMENTOS
WHERE direc IN (SELECT direc
                FROM DEPARTAMENTOS
                WHERE nomde IN ('DIRECC.COMERCIAL' ,'PERSONAL')); 
