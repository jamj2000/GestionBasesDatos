# ACTIVIDADES RESUELTAS
# CONSULTA DE BASES DE DATOS.  LENGUAJE DE MANIPULACIÓN DE DATOS

> IES Luis Vélez de Guevara  
> Departamento de Informática



## 11.1. Prácticas
Dado el siguiente modelo relacional:

### 11.1.1. Práctica 1: Creación de BD e inserción de Datos.
a) Obtener el posible diagrama E/R a partir del modelo relacional anterior.
b) Escribir las sentencias SQL correspondientes para crear las tablas en ORACLE, teniendo en cuenta las siguientes restricciones:
CENTROS
Campo
Nulo
Tipo de datos
Observaciones
NUMCE
NOT NULL
NUMBER(4)
Número de centro
NOMCE

VARCHAR2(25)
Nombre de centro
DIRCE

VARCHAR2(25)
Dirección del centro

DEPARTAMENTOS
Campo
Nulo
Tipo de datos
Observaciones
NUMDE
NOT NULL
NUMBER(3)
Número de departamento
NUMCE

NUMBER(4)
Número de centro
DIREC

NUMBER(3)
Director
TIDIR

CHAR(1)
Tipo de director (en Propiedad, en Funciones)
PRESU

NUMBER(3,1)
Presupuesto en miles de €
DEPDE

NUMBER(3)
Departamento del que  depende
NOMDE

VARCHAR2(20)
Nombre de departamento

EMPLEADOS
Campo
Nulo
Tipo de datos
Observaciones
NUMEM
NOT NULL
NUMBER(3)
Número de empleado
EXTEL

NUMBER(3)
Extensión telefónica
FECNA

DATE
Fecha de nacimiento
FECIN

DATE
Fecha de incorporación
SALAR

NUMBER(5)
Salario
COMIS

NUMBER(3)
Comisión
NUMHI

NUMBER(1)
Número de hijos
NOMEM

VARCHAR2(10)
Nombre de empleado
NUMDE

NUMBER(3)
Número de departamento

c)  Inserta los siguientes datos en la tabla DEPARTAMENTOS.
NUMDE
NUMCE
DIREC
TIDIR
PRESU
DEPDE
NOMDE
100
10
260
P
72
NULL
DIRECCIÓN GENERAL
110
20
180
P
90
100
DIRECC.COMERCIAL
111
20
180
F
66
110
SECTOR INDUSTRIAL
112
20
270
P
54
110
SECTOR SERVICIOS
120
10
150
F
18
100
ORGANIZACIÓN
121
10
150
P
12
120
PERSONAL
122
10
350
P
36
120
PROCESO DE DATOS
130
10
310
P
12
100
FINANZAS

d) ¿Qué ocurre al insertar el primer registro? ¿Por qué? Plantea la solución.
e) Inserta los siguientes datos en la tabla CENTROS
NUMCE
NOMCE
DIRCE
10
SEDE CENTRAL
C/ ATOCHA, 820, MADRID
20
RELACIÓN CON CLIENTES
C/ ATOCHA, 405, MADRID

f) Inserta los siguientes datos en la tabla EMPLEADOS.	
NUMEM
EXTEL
FECNA
FECIN
SALAR
COMIS
NUMHI
nomem
NUMDE
110
350
10/11/1970
15/02/1985
1800
NULL
3
CESAR
121
120
840
09/06/1968
01/10/1988
1900
110
1
MARIO
112
130
810
09/09/1965
01/02/1981
1500
110
2
LUCIANO
112
150
340
10/08/1972
15/01/1997
2600
NULL
0
JULIO
121
160
740
09/07/1980
11/11/2005
1800
110
2
AUREO
111
180
508
18/10/1974
18/03/1996
2800
50
2
MARCOS
110
190
350
12/05/1972
11/02/1992
1750
NULL
4
JULIANA
121
210
200
28/09/1970
22/01/1999
1910
NULL
2
PILAR
100
240
760
26/02/1967
24/02/1989
1700
100
3
LAVINIA
111
250
250
27/10/1976
01/03/1997
2700
NULL
0
ADRIANA
100
260
220
03/12/1973
12/07/2001
720
NULL
6
ANTONIO
100
270
800
21/05/1975
10/09/2003
1910
80
3
OCTAVIO
112
280
410
10/01/1978
08/10/2010
1500
NULL
5
DOROTEA
130
285
620
25/10/1979
15/02/2011
1910
NULL
0
OTILIA
122
290
910
30/11/1967
14/02/1988
1790
NULL
3
GLORIA
120
310
480
21/11/1976
15/01/2001
1950
NULL
0
AUGUSTO
130
320
620
25/12/1977
05/02/2003
2400
NULL
2
CORNELIO
122
330
850
19/08/1958
01/03/1980
1700
90
0
AMELIA
112
350
610
13/04/1979
10/09/1999
2700
NULL
1
AURELIO
122
360
750
29/10/1978
10/10/1998
1800
100
2
DORINDA
111
370
360
22/06/1977
20/01/2000
1860
NULL
1
FABIOLA
121
380
880
30/03/1978
01/01/1999
1100
NULL
0
MICAELA
112
390
500
19/02/1976
08/10/2010
1290
NULL
1
CARMEN
110
400
780
18/08/1979
01/11/2011
1150
NULL
0
LUCRECIA
111
410
660
14/07/1968
13/10/1989
1010
NULL
0
AZUCENA
122
420
450
22/10/1966
19/11/1988
2400
NULL
0
CLAUDIA
130
430
650
26/10/1967
19/11/1988
1260
NULL
1
VALERIANA
122
440
760
26/09/1966
28/02/1986
1260
100
0
LIVIA
111
450
880
21/10/1966
28/02/1986
1260
100
0
SABINA
112
480
760
04/04/1965
28/02/1986
1260
100
1
DIANA
111
490
880
06/06/1964
01/01/1988
1090
100
0
HORACIO
112
500
750
08/10/1965
01/01/1987
1200
100
0
HONORIA
111
510
550
04/05/1966
01/11/1986
1200
NULL
1
ROMULO
110
550
780
10/01/1970
21/01/1998
600
120
0
SANCHO
111

Nota: En lugar de la inserción de datos, puedes ahorrar tiempo descargando el script EMPLEADOS.SQL que está disponible en la plataforma Moodle. Este script contiene todas las tablas. Si utilizas el script deberás borrar las tablas previas. 

### 11.1.2. Práctica 2: Consultas Sencillas
1.- Hallar, por orden alfabético, los nombres de los departamentos cuyo director lo es en funciones y no en propiedad.

2.- Obtener un listín telefónico de los empleados del departamento 121 incluyendo nombre de empleado, número de empleado y extensión telefónica. Por orden alfabético.

3.- Obtener por orden creciente una relación de todos los números de extensiones telefónicas de los empleados, junto con el nombre de estos, para aquellos que trabajen en el departamento 110. Mostrar la consulta tal y como aparece en la imagen.

4.- Hallar la comisión, nombre y salario de los empleados que tienen tres hijos, clasificados por comisión, y dentro de comisión por orden alfabético.

5.- Hallar la comisión, nombre y salario de los empleados que tienen tres hijos, clasificados por comisión, y dentro de comisión por orden alfabético, para aquellos empleados que tienen comisión.

6.- Obtener salario y nombre de los empleados sin hijos y cuyo salario es mayor que 1200 y menor que 1500 €. Se obtendrán por orden decreciente de salario y por orden alfabético dentro de salario.

7.- Obtener los números de los departamentos donde trabajan empleados cuyo salario sea inferior a 1500 €.

8.- Obtener las distintas comisiones que hay en el departamento 110.



### 11.1.3. Práctica 3:  Consultas con Predicados Básicos
1.- Obtener una relación por orden alfabético de los departamentos cuyo presupuesto es inferior a 30.000 € El nombre de los departamentos vendrá precedido de las palabras 'DEPARTAMENTO DE '. Nota: El presupuesto de los departamentos viene expresado en miles de €.

2.- Muestra el número y el nombre de cada departamento separados por un guión y en un mismo campo llamado “Número-Nombre”, además del tipo de director mostrado como “Tipo de Director”, para aquellos departamentos con presupuesto inferior a 30.000 €.

3.- Suponiendo que en los próximos dos años el coste de vida va a aumentar un 8% anual y que se suben los salarios solo un 2% anual, hallar para los empleados con más de 4 hijos su nombre y su sueldo anual, actual y para cada uno de los próximos dos años, clasificados por orden alfabético. Muestra la consulta tal y como aparece en la captura.

4.- Hallar, por orden alfabético, los nombres de los empleados tales que si se les da una gratificación de 120 € por hijo, el total de esta gratificación supera el 20% de su salario.


5.- Para los empleados del departamento 112 hallar el nombre y el salario total (salario más comisión), por orden de salario total decreciente, y por orden alfabético dentro de salario total. 

6.- Vemos que para Micaela no se muestra nada en Salario Total, esto es debido a que su comisión es Nula (Lo que no significa que sea 0--> significa que no se ha introducido ningún valor). Esto impide hacer el cálculo de la suma. Muestra entonces la misma consulta anterior pero sólo para aquellos empleados cuya comisión no sea nula.

7.- Repite la consulta anterior para mostrarla como sigue:

8.- En una campaña de ayuda familiar se ha decidido dar a los empleados una paga extra de 60 € por hijo, a partir del cuarto inclusive. Obtener por orden alfabético para estos empleados: nombre y salario total que van a cobrar incluyendo esta paga extra. Mostrarlo como en la imagen.

9.- Introducción a SELECT subordinado. Imaginemos la misma consulta anterior, pero en la que se nos pide mostrar los mismos campos pero para aquellos empleados cuyo número de hijos iguale o supere a los de Juliana. Es decir, Juliana tiene 4 hijos pero no lo sabemos. Lo que sabemos es el nombre. En este caso haremos otro SELECT cuyo resultado de la búsqueda sea el número de hijos de Juliana.

10.- Obtener por orden alfabético los nombres de los empleados cuyos sueldos igualan o superan al de CLAUDIA en más del 15%.

11.- Obtener los nombres de los departamentos que no dependen funcionalmente de otro.

11.1.4. Práctica 4: Consultas con Predicados Cuantificados. ALL, SOME o ANY.
1.- Obtener por orden alfabético los nombres de los empleados cuyo salario supera al máximo salario de los empleados del departamento 122.

2.- La misma consulta pero para el departamento 150. Explica por qué obtenemos la relación de todos los empleados por orden alfabético.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

3.- Obtener por orden alfabético los nombres de los empleados cuyo salario supera en dos veces y media o más al mínimo salario de los empleados del departamento 122.

4.- Obtener los nombres y salarios de los empleados cuyo salario coincide con la comisión multiplicada por 10 de algún otro o la suya propia.

5.- Obtener por orden alfabético los nombres y salarios de los empleados cuyo salario es superior a la comisión máxima existente multiplicada por 20.

6.- Obtener por orden alfabético los nombres y salarios de los empleados cuyo salario es inferior a veinte veces la comisión más baja existente.



11.1.5. Práctica 5: Consultas con Predicados BETWEEN
1.- Obtener por orden alfabético los nombres de los empleados cuyo salario está entre 1500 € y 1600 €.

2.- Obtener por orden alfabético los nombres y salarios de los empleados con comisión, cuyo salario dividido por su número de hijos cumpla una, o ambas, de las dos condiciones siguientes:
• Que sea inferior de 720 €
• Que sea superior a 50 veces su comisión.


11.1.6. Práctica 6: Consultas con Predicados LIKE
1.- Obtener por orden alfa el nombre y el salario de aquellos empleados que comienzan por la letra 'A' y muestra la consulta como aparece en la captura.


2.- Obtener por orden alfabético los nombres de los empleados que tengan 8 letras.

3.- Obtener por orden alfabético los nombres y el presupuesto de los departamentos que incluyen la palabra “SECTOR”. La consulta la deberás mostrar como la imagen.

11.1.7. Práctica 7: Consultas con Predicados IN
1.- Obtener por orden alfabético los nombres de los empleados cuya extensión telefónica es 250 o 750.

2.- Obtener por orden alfabético los nombres de los empleados que trabajan en el mismo departamento que PILAR o DOROTEA.

3.- Obtener por orden alfabético los nombres de los departamentos cuyo director es el mismo que el del departamento: DIRECC.COMERCIAL o el del departamento: PERSONAL Mostrar la consulta como imagen.


11.1.8. Práctica 8: Consultas con Predicados EXISTS
1.- Obtener los nombres de los centros de trabajo si hay alguno que esté en la calle ATOCHA.

2.- Obtener los nombres y el salario de los empleados del departamento 100 si en él hay alguno que gane más de 1300 €.

3.- Obtener los nombres y el salario de los empleados del departamento 100 si en él hay alguno que gane más de 2750 €.
No se ha encontrado ningún dato.

4.- Obtener los nombres y el salario de los empleados del departamento 100 si en él hay alguno que gane más de 3000 €.
No se ha encontrado ningún dato.

11.1.9. Práctica 9: Más Consultas con Predicados
1.- Obtener por orden alfabético los nombres y comisiones de los empleados del departamento 110 si en él hay algún empleado que tenga comisión.

2.- Obtener los nombres de los departamentos que no sean ni de DIRECCION ni de SECTORES.

3.- Obtener por orden alfabético los nombres y salarios de los empleados que o bien no tienen hijos y ganan más de 1.500 €, o bien tienen hijos y ganan menos de 1.000 €.

4.- Hallar por orden de número de empleado el nombre y salario total (salario más comisión) de los empleados cuyo salario total supera al salario mínimo en 1800 € mensuales. Muestra la consulta como aparece en la captura de pantalla.

5.- Obtener, por orden alfabético, los nombres y salarios de los empleados del departamento 111 que tienen comisión si hay alguno de ellos cuya comisión supere al 15% de su salario.

6.- Hallar los nombres de departamentos, el tipo de director y su presupuesto, para aquellos departamentos que tienen directores en funciones, o bien en propiedad y su presupuesto anual excede a 30.000 € o no dependen de ningún otro.

7.- Realizamos la misma consulta anterior pero mostrándola del modo siguiente:

11.1.10. Práctica 10: Consultas con Fechas
1.- Obtener por orden alfabético, los nombres y fechas de nacimiento de los empleados que cumplen años en el mes de noviembre.

2.- Obtener los nombres de los empleados que cumplen años en el día de hoy.
NOTA: El resultado dependerá de la fecha en la que realizamos la consulta.

3.- Obtener los nombres y fecha exacta de nacimiento de los empleados cuya fecha de nacimiento es anterior al año 1950.
No se ha encontrado ningún dato.

4.- Obtener los nombres y fecha exacta de incorporación de los empleados cuya fecha de incorporación a la empresa es anterior al año 1970.
No se ha encontrado ningún dato.

5.- Obtener los nombres, fecha de nacimiento y fecha de incorporación de los empleados cuya  edad a la  fecha de incorporación era inferior a 30 años.


6.- Obtener los empleados cuyo nacimiento fue en Lunes.

7.- Obtener los empleados cuyo día de la semana para el nacimiento y la incorporación fue Viernes.

8.- Obtener los empleados cuyo día de la semana para el nacimiento y la incorporación coinciden. Es decir nacieron y se incorporaron un Lunes, o nacieron y se incorporaron un Martes, etc

9.- Obtener los  empleados y su mes de incorporación siempre que esté entre los meses de Enero y Junio (ambos inclusive).


10.- Obtener los  empleados y su mes de incorporación siempre que esté entre los meses de Enero y Junio (ambos inclusive) y el mes de nacimiento coincida en dicho mes.

11.1.11. Práctica 11: Consultas con funciones colectivas
1.- Hallar el salario medio, mínimo y máximo de los empleados de la empresa.

2.- Obtener por orden alfabético los salarios y nombres de los empleados tales que su salario más un 40% supera al máximo salario.

3.- Hallar la edad en años cumplidos del empleado más viejo del departamento 110.
Nota: La edad que obtengamos dependerá de la fecha en la que realicemos la consulta.

4.- Hallar la edad en años cumplidos y el nombre del empleado más viejo del departamento 110. 
Nota: La edad que obtengamos dependerá de la fecha en la que realicemos la consulta.

5.- Hallar el número de empleados del departamento 112, cuántas comisiones distintas hay en ese departamento y la suma de las comisiones.

11.1.12. Práctica 12: Agrupamiento de filas. GROUP BY
1.- Hallar cuántos empleados hay en cada departamento.

2.- Hallar para cada departamento el salario medio, el mínimo y el máximo.

3.- Hallar el salario medio y la edad media en años para cada grupo de empleados con igual comisión.
Nota: La edad dependerá de la fecha en la que realicemos la consulta.


4.- Repite la consulta anterior expresando la edad en años cumplidos.
(Aunque en este caso se obtiene lo mismo, la edad media podría variar de una consulta a otra dependiendo del momento en el que se realice la consulta).

5.- Hallar el salario medio y la edad media en años cumplidos para cada grupo de empleados del mismo departamento y con igual comisión.


6.- Para los departamentos en los que hay algún empleado cuyo salario sea mayor que 2.500 € al mes, hallar el número de empleados y la suma de sus salarios.


11.1.13. Práctica 13: Agrupamiento de filas. CLÁUSULA HAVING
1.- Hallar el número de empleados que usan la misma extensión telefónica. Solamente se desea mostrar aquellos grupos que tienen más de 1 empleado.


2.- Para cada centro, hallar los presupuestos medios de los departamentos.

3.- Para cada centro, hallar los presupuestos medios de los departamentos clasificados según estén dirigidos en propiedad o en funciones.

4.- Para los departamentos cuyo salario medio supera al de la empresa, hallar cuántas extensiones telefónicas tienen.
 
5.- Hallar el máximo valor de la suma de los salarios de los departamentos.

SI NO NECESITAMOS MOSTRAR EL nº DE DPTO. ES MUCHO MÁS SENCILLA


11.1.14. Práctica 14: Consultas sobre varias tablas
1.- Para cada departamento con presupuesto inferior a 35.000 €, hallar le nombre del Centro donde está ubicado y el máximo salario de sus empleados (si dicho máximo excede de 1.500 €). Clasificar alfabéticamente por nombre de departamento.

2.- Hallar por orden alfabético los nombres de los departamentos que dependen de los que tienen un presupuesto inferior a 30.000 €. También queremos conocer el nombre del departamento del que dependen y su presupuesto.

3.- Obtener los nombres y los salarios medios de los departamentos cuyo salario medio supera al salario medio de la empresa.


4.- Para los departamentos cuyo director lo sea en funciones, hallar el número de empleados y la suma de sus salarios, comisiones y número de hijos.

5.- Para los departamentos cuyo presupuesto anual supera los 35.000 €, hallar cuantos empleados hay por cada extensión telefónica.


6.- Hallar por orden alfabético los nombres de los empleados y su número de hijos para aquellos que son directores en funciones.

7.- Hallar si hay algún departamento (suponemos que sería de reciente creación) que aún no tenga empleados asignados ni director en propiedad.
No se ha encontrado ningún dato.

8.- Añadir un nuevo departamento de nombre NUEVO y con director en funciones.

9.-  Añadir un nuevo empleado de nombre NORBERTO y sin departamento asignado. Inventar el resto de datos.

10.- Muestra los departamentos que no tienen empleados.

11.- Muestra los nombres de departamentos que no tienen empleados haciendo uso la combinación externa LEFT JOIN. Muestra una segunda columna con los nombres de empleados para asegurarnos que realmente esta a NULL.

12.- Muestra los nombres de departamentos que no tienen empleados haciendo uso la combinación externa RIGH JOIN. Muestra una segunda columna con los nombres de empleados para asegurarnos que realmente esta a NULL.

13.- Muestra los nombres de empleados que no tienen departamento haciendo uso la combinación externa LEFT JOIN. Muestra una segunda columna con los nombres de departamentos para asegurarnos que realmente esta a NULL.

14.- Muestra los nombres de empleados que no tienen departamento haciendo uso la combinación externa RIGHT JOIN. Muestra una segunda columna con los nombres de empleados para asegurarnos que realmente esta a NULL.

15.- Muestra los departamentos que no tienen empleados y los empleados que no tiene departamento haciendo uso la combinación externa FULL  JOIN.

16.- Muestra los empleados y sus respectivos departamentos haciendo uso de la combinación interna INNER JOIN. ¿Aparecen el departamento NUEVO y el empleado NORBERTO?¿Por qué?


17.-  Realiza la misma consulta anterior donde se cumpla la condición que NUMDE está a NULL. ¿Aparece algún resultado?¿Por qué?
No se ha encontrado ningún dato.

18.- Muestra los empleados y sus respectivos departamentos haciendo uso de la combinación interna NATURAL JOIN.

19.-  Muestra la combinación de las 3 tablas CENTROS, DEPARTAMENTOS y EMPLEADOS haciendo uso de NATURAL JOIN.

20.- Borra los registros dados de alta para el departamento NUEVO y el empleado introducida en el apartado anterior.


--INTRODUCCIÓN A VISTAS

--1º HACEMOS UNA CONSULTA DONDE MUESTRE
--PARA CADA EMPLEADO SU NÚMERO DE EMPLEADO,
--NOMBRE, NUMHI Y NOMBRE DEL DEPARTAMENTO 
--EN EL QUE TRABAJA
SELECT numem, nomem, numhi, nomde
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde=D.numde; 
 
--2º CREAMOS UNA VISTA LLAMADA EJEMPLO1
--CON LA CONSULTA ANTERIOR
CREATE VIEW EJEMPLO1 AS 
  SELECT numem, nomem, numhi, nomde
  FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON E.numde=D.numde; 

--OBTENER EL NOMBRE DE CADA EMPLEADO
--Y EL NÚMERO DE HIJOS QUE TIENE Y CREAR
--UNA VISTA LLAMADA EJEMPLO2

SELECT nomem, NUMHI
FROM EMPLEADOS; 

CREATE VIEW EJEMPLO2 AS 
  SELECT nomem, NUMHI FROM EMPLEADOS; 

--HACEMOS LA MISMA VISTA ANTERIOR
--CON OTRO NOMBRE, PARA MOSTRAR TAMBIÉN
--EL NUMEM

CREATE VIEW EJEMPLO3 AS 
  SELECT NUMEM,nomem, NUMHI FROM EMPLEADOS; 


11.1.15. Práctica 15: Vistas
1.- Crear una vista con todos los empleados del departamento 111 en donde figuren solo el número de empleado, su nombre, su salario y la comisión. La llamarás VISTA1.

2.- Crear una vista que obtenga el máximo valor de la suma de los salarios de los departamentos. Se llamará VISTA2.

3.- Utilizar la vista anterior para obtener el departamento con más gasto en salario.

4.- Utilizar la VISTA1 para obtener por orden alfabético los nombres de los empleados del departamento 111 que tienen comisión.

5.- Insertar la siguiente fila en la VISTA1: (999,'RODOLFO',999,999). ¿Qué consecuencias tiene?

6.- Borra la fila anterior.

7.- Crear una VISTA3 en la que aparezcan los centros con sus departamentos.

8.- Utilizar la VISTA3 para mostrar el nombre de cada centro y el total de los presupuestos de sus departamentos.

9.- Insertar  la  siguiente  fila en la VISTA3: 
 (30,'SUCURSAL ÉCIJA',200,120,'F',20,110,'CONTABILIDAD'). 
¿Qué ocurre?

10.- Borra la fila anterior.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

11.1.16. Práctica 16: Repaso
1.- Selecciona, por orden alfabético decreciente, el nombre de los empleados junto con su salario aumentado un 1%, para aquellos empleados del departamento 100 que en la fecha de su contratación tenían más de 20 años.

2.- Para cada Centro selecciona el presupuesto medio de los departamentos que tienen su sede en él.

3.- Selecciona el nombre de los empleados junto con su edad actual para aquellos empleados que trabajan en el departamento de PERSONAL.

4.- Selecciona la dirección del centro donde están ubicados los departamentos que tiene empleados con más de tres hijos. Deberás mostrar también el nombre de dichos departamentos.

5.- Selecciona la dirección del centro donde están ubicados los departamentos si existe alguno que tiene empleados con más de tres hijos. Deberás mostrar también el nombre de dichos departamentos.

6.- Cuenta el número de empleados que tienen el mismo número de hijos. Deberás mostrar también el número de hijos que corresponde en cada caso.

7.- Crea una vista llamada “Sin comisión” donde muestres el nombre, la edad y el salario de los empleados que no tienen comisión. El salario deberá aparecer en la consulta seguido de “€” y el nombre del campo en el que aparezca la edad será “Edad actual”.

8.- Utiliza la vista anterior para calcular el salario medio de los empleados que no tienen comisión.
	
9.-	Selecciona el nombre de los departamentos en los que trabajan empleados cuyo salario máximo no supere los 2000 €.

10.- Crea una vista con el nombre “Jubilación” donde muestres el nombre de cada empleado, el nombre del departamento en el que trabajan, su edad y su salario para aquellos cuya edad sea, al menos, de 60 años. 

11.-	Utiliza la vista anterior para mostrar el nombre de los empleados que tienen justo 60 años.
No se ha encontrado ningún dato.

12.-	Muestra la dirección de los centros, el nombre de los empleados que trabajan en él, el nombre del departamento concreto en el que trabajan y quien es el director de dicho departamento  para aquellos empleados cuyo nombre comience por la letra “J”. 
