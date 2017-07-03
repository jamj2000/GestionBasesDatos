
PROMPT ================================ Practica 10 ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
SELECT nomem, TO_CHAR(fecna, 'DD/MM/YYYY') Nacimiento
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'MM') = '11'
ORDER BY nomem; 


PROMPT ________________________________ Ejercicio 2 ________________________________
SELECT nomem
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'DDMM') = TO_CHAR(SYSDATE, 'DDMM'); 


PROMPT ________________________________ Ejercicio 3 ________________________________
SELECT nomem, fecna
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'YYYY') < '1950'; 


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT nomem, fecin
FROM EMPLEADOS
WHERE TO_CHAR(fecin, 'YYYY') < '1970'; 


PROMPT ________________________________ Ejercicio 5 ________________________________
SELECT nomem, fecna, fecin
FROM EMPLEADOS
WHERE (fecin-fecna)/365 < 30; 


PROMPT ________________________________ Ejercicio 6 ________________________________
SELECT nomem,  TO_CHAR(fecna, 'day') "Día de nacimiento"
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'd') = 1; 


PROMPT ________________________________ Ejercicio 7 ________________________________
SELECT nomem,  TO_CHAR(fecna, 'day') "Viernes para nac. e incorp."
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'd') = TO_CHAR(fecin, 'd')
  AND TO_CHAR(fecna, 'd') = 5; 


PROMPT ________________________________ Ejercicio 8 ________________________________
SELECT nomem,  TO_CHAR(fecna, 'day') "Mismo día de nac. e incorp."
FROM EMPLEADOS
WHERE TO_CHAR(fecna, 'd') = TO_CHAR(fecin, 'd');


PROMPT ________________________________ Ejercicio 9 ________________________________
SELECT nomem, TO_CHAR(fecin, 'MONTH') "Mes incorporación"
FROM EMPLEADOS
WHERE TO_CHAR(fecin, 'MM') BETWEEN '01' AND '06'; 


PROMPT ________________________________ Ejercicio 10 ________________________________
SELECT nomem, TO_CHAR(fecin, 'MONTH') "Mes incorporación y nac."
FROM EMPLEADOS
WHERE TO_CHAR(fecin, 'MM') BETWEEN '01' AND '06'
  AND TO_CHAR(fecin, 'MM') = TO_CHAR(fecna, 'MM'); 

