
PROMPT ================================ Practica 15 ================================

PROMPT ________________________________ Ejercicio 1 ________________________________
CREATE VIEW VISTA1 AS 
  SELECT NUMEM, NOMEM, SALAR, COMIS
  FROM EMPLEADOS
  WHERE numde=111; 


PROMPT ________________________________ Ejercicio 2 ________________________________
CREATE VIEW VISTA2 AS 
  SELECT numde, SUM(salar) "MAX_SUMA_SALARIOS"
  FROM EMPLEADOS
  GROUP BY numde
  HAVING SUM(salar)=
    (SELECT max(sum(salar)) FROM EMPLEADOS GROUP BY numde); 

    
PROMPT ________________________________ Ejercicio 3 ________________________________    
SELECT numde FROM VISTA2; 


PROMPT ________________________________ Ejercicio 4 ________________________________
SELECT nomem
FROM VISTA1
WHERE comis IS NOT NULL
ORDER BY 1; 


PROMPT ________________________________ Ejercicio 5 ________________________________
INSERT INTO VISTA1 VALUES(999,'RODOLFO',999,999); 

-- SELECT * FROM EMPLEADOS WHERE NUMEM=999;  


PROMPT ________________________________ Ejercicio 6 ________________________________
DELETE FROM VISTA1 WHERE NUMEM = 999; 


PROMPT ________________________________ Ejercicio 7 ________________________________
CREATE VIEW VISTA3 AS (SELECT NOMCE, D.*
				FROM CENTROS C, DEPARTAMENTOS D
				WHERE C.numce=D.numce); 

				
PROMPT ________________________________ Ejercicio 8 ________________________________
SELECT nomce, sum(presu) "Total presupuestos"
FROM VISTA3
GROUP BY nomce; 


PROMPT ________________________________ Ejercicio 9 ________________________________

INSERT INTO VISTA3 VALUES ('SUCURSAL ÉCIJA',200,20,180,'F',20,110,'CONTABILIDAD'); 
-- SE PRODUCE UN ERROR PORQUE NO PUEDO INSERTAR REGISTROS 
-- EN VISTAS QUE INVOLUCRAN A VARIAS TABLAS 
-- O EN LAS QUE SIENDO DE UNA SOLA TABLA, NO INCLUYAN LA CLAVE PRINCIPAL O CAMPOS NOT NULL, SI LOS HUBIERA


PROMPT ________________________________ Ejercicio 10 ________________________________
-- NO PUEDO BORRAR ALGO QUE NO HE CREADO

