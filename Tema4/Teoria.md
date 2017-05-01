


# CONSULTA DE BASES DE DATOS.  LENGUAJE DE MANIPULACIÓN DE DATOS


> IES Luis Vélez de Guevara  
> Departamento de Informática

Contenido
``` 
1.   INTRODUCCIÓN	3
2.   CONSULTAS	3
3.   CÁLCULOS	4
3.1.   Cálculos Aritméticos	4
3.2.   Concatenación	4
3.3.   Condiciones	5
3.4.   Operadores de comparación	6
4.   SUBCONSULTAS	10
5.   ORDENACIÓN	12
6.   FUNCIONES	12
6.1.   Funciones de caracteres	13
6.2.   Funciones numéricas	14
6.3.   Funciones de fecha	15
6.4.   Funciones de conversión	16
6.5.   Función DECODE	18
6.6.   Expresión CASE	19
7.   AGRUPACIONES	20
7.1.   Funciones de cálculo con grupo (o funciones colectivas)	21
7.2.   Condiciones HAVING	22
8.   OBTENER DATOS DE MÚLTIPLES TABLAS	24
8.1.   Producto cruzado o cartesiano de tablas	24
8.2.   Asociando tablas	25
8.3.   Relaciones sin igualdad	26
8.4.   Combinación de tablas (JOIN)	26
9.   COMBINACIONES ESPECIALES	33
9.1.   Uniones	33
9.2.   Intersecciones	34
9.3.   Diferencia	34
10.   CONSULTA DE VISTAS	35
11.   ACTIVIDADES	36
11.1.   Prácticas	36
```



## 1. INTRODUCCIÓN

A lo largo de esta unidad nos centraremos en la cláusula SELECT. Sin duda es el comando más versátil del lenguaje SQL. El comando **SELECT** permite:
- Obtener datos de ciertas columnas de una tabla (proyección).
- Obtener registros (filas) de una tabla de acuerdo con ciertos criterios (selección).
- Mezclar datos de tablas diferentes (asociación, join).


## 2. CONSULTAS
Para realizar consultas a una base de datos relacional hacemos uso de la sentencia SELECT. La sintaxis básica del comando 

```sql
SELECT es la siguiente:
SELECT * | {[ DISTINCT ] columna | expresión [[AS] alias ], ...}
FROM nombre_tabla;
```

Donde:

- \*. El asterisco significa que se seleccionan todas las columnas.
- *DISTINCT*. Hace que no se muestren los valores duplicados.
- *columna*. Es el nombre de una columna de la tabla que se desea mostrar.
- *expresión*. Una expresión válida SQL.
- *alias*. Es un nombre que se le da a la cabecera de la columna en el resultado de esta instrucción.

Ejemplos:

```sql
-- Selección de todos los registros de la tabla CLIENTES
SELECT * FROM CLIENTES;

-- Selección de algunos campos de la tabla CLIENTES
SELECT nombre, apellido1, apellido2 FROM CLIENTES;
```

## 3. CÁLCULOS

### 3.1. Cálculos Aritméticos

Los operadores + (suma), - (resta), * (multiplicación) y / (división), se pueden utilizar para hacer cálculos en las consultas. Cuando se utilizan como expresión en una consulta SELECT, no modifican los datos originales.

Ejemplo:

```sql
-- Consulta con 3 columnas 
SELECT nombre, precio, precio*1.16 FROM ARTICULOS;


-- Ponemos un alias a la tercera columna. 
-- Las comillas dobles en el alias hacen que se respeten mayúsculas y minúsculas,
-- de otro modo siempre aparece en mayúsculas 
SELECT nombre, precio, precio*1.16 AS “Precio + IVA” FROM ARTICULOS;
```

La prioridad de esos operadores es: tienen más prioridad la multiplicación y división, después la suma y la resta. En caso de igualdad de prioridad, se realiza primero la operación que esté más a la izquierda. Como es lógico se puede evitar cumplir esa prioridad usando paréntesis; el interior de los paréntesis es lo que se ejecuta primero.
Cuando una expresión aritmética se calcula sobre valores NULL, el resultado de la expresión es siempre NULL.

### 3.2. Concatenación

El operador || es el de la concatenación. Sirve para unir textos.

Ejemplo:

```sql
SELECT tipo, modelo, tipo || '-' || modelo "Clave Pieza" FROM PIEZAS;
```

El resultado de esa consulta tendría esta estructura:






### 3.3. Condiciones

Se puede realizar consultas que restrinjan los datos de salida de las tablas. Para ello se utiliza la cláusula WHERE. Esta cláusula permite colocar una condición que han de cumplir todos los registros que queremos que se muestren. Las filas que no la cumplan no aparecerán en la ejecución de la consulta.

> NOTA:  
> Con el comando SELECT indicamos las columnas que queremos que aparezcan en nuestra consulta.  
> Con el comando WHERE indicamos las filas que queremos que aparezcan en nuestra consulta (serán las que cumplan las condiciones que especifiquemos detrás del WHERE).

Ejemplo:

```sql
-- Tipo y modelo de las piezas cuyo precio es mayor que 3
SELECT tipo, modelo
FROM PIEZAS
WHERE precio > 3;
```


### 3.4. Operadores de comparación

Los operadores de comparación que se pueden utilizar en la cláusula WHERE son:

Se pueden utilizar tanto para comparar números como para comparar textos y fechas. En el caso de los textos, las comparaciones se hacen en orden alfabético. Sólo que es un orden alfabético estricto. Es decir el orden de los caracteres en la tabla de códigos.
Así la letra Ñ y las vocales acentuadas nunca quedan bien ordenadas ya que figuran con códigos más altos. Las mayúsculas figuran antes que las minúsculas (la letra 'Z' es menor que la 'a').

Valores lógicos

Son:

Ejemplos:


```sql
-- Personas entre 25 y 50 años
SELECT nombre, apellidos
FROM PERSONAS
WHERE edad >= 25 AND edad <= 50;

-- Personas de más de 60 y menos de 20
SELECT nombre, apellidos
FROM PERSONAS
WHERE edad > 60 OR edad < 20;
```

BETWEEN

El operador BETWEEN nos permite obtener datos que se encuentren entre dos valores determinados (incluyendo los dos extremos).

Ejemplo:

```sql
-- Selección de las piezas cuyo precio está entre 3 y 8 
-- (ambos valores incluidos) 
SELECT tipo, modelo, precio
FROM PIEZAS
WHERE precio BETWEEN 3 AND 8;
```

El operador NOT BETWEEN nos permite obtener los los valores que son menores (estrictamente) que el más pequeño y mayores (estrictamente) que el más grande. Es decir, no incluye los extremos.

Ejemplo:

```sql
-- Selección de las piezas cuyo precio sea menor que 3 o mayor que 8 
-- (los de precio 3 y precio 8 no estarán incluidos) */
SELECT tipo, modelo, precio
FROM PIEZAS
WHERE precio NOT BETWEEN 3 AND 8;
```

IN

El operador IN nos permite obtener registros cuyos valores estén en una lista:

Ejemplo:

```sql
-- Selección de las piezas cuyo precio sea igual a 3, 5 u 8
SELECT tipo, modelo, precio
FROM PIEZAS
WHERE precio IN ( 3,5,8 );

-- Selección de las piezas cuyo precio no sea igual a 3, 5 u 8 
SELECT tipo, modelo, precio
FROM PIEZAS
WHERE precio NOT IN ( 3,5,8 );
```

LIKE

El operador LIKE se usa sobre todo con textos, permite obtener registros cuyo valor en un campo cumpla una condición textual. LIKE utiliza una cadena que puede contener estos símbolos:
Ejemplos:

```sql
-- Selección el nombre de las personas que empiezan por A 
SELECT nombre
FROM PERSONAS
WHERE nombre LIKE 'A%';

-- Selección el nombre y los apellidos de las personas 
cuyo primer apellido sea Jiménez, Giménez, Ximénez 
SELECT nombre, apellido1, apellido2
FROM PERSONAS
WHERE apellido1 LIKE '_iménez';
```

Si queremos que en la cadena de caracteres se busquen los caracteres “%” o “_” le anteponemos el símbolo escape:  \ 

Ejemplo:

```sql
-- Seleccionamos el tipo, el modelo y el precio de las piezas 
-- cuyo porcentaje de descuento sea 3% 
SELECT tipo, modelo, precio
FROM PIEZAS
WHERE descuento LIKE '3\%' ESCAPE '\';
```

IS NULL

La cláusula IS NULL devuelve “verdadero” si una expresión contiene un nulo, y “Falso” en caso contrario.
La cláusula IS NOT NULL devuelve “verdadero” si una expresión NO contiene un nulo, y “Falso” en caso contrario.

Ejemplos:

```sql
-- Devuelve el nombre y los apellidos de las personas que NO tienen teléfono
SELECT nombre, apellido1, apellido2
FROM PERSONAS
WHERE telefono IS NULL;

-- Devuelve el nombre y los apellidos de las personas que SÍ tienen teléfono
SELECT nombre, apellido1, apellido2
FROM PERSONAS
WHERE telefono IS NOT NULL;
```

Precedencia de operadores

A veces las expresiones que se producen en los SELECT son muy extensas y es difícil saber que parte de la expresión se evalúa primero, por ello se indica la siguiente tabla de precedencia:



## 4. SUBCONSULTAS
Se trata de una técnica que permite utilizar el resultado de una tabla SELECT en otra consulta SELECT. Permite solucionar problemas en los que el mismo dato aparece dos veces. La sintaxis es:

```sql
SELECT lista_expresiones
FROM tablas
WHERE expresión OPERADOR
    ( SELECT lista_expresiones
      FROM tablas );
```

Se puede colocar el SELECT dentro de las cláusulas WHERE, HAVING o FROM. El operador puede ser >,<,>=,<=,!=, = o IN.
Ejemplo: 

```sql
-- Obtiene los empleados cuyas pagas sean inferiores a lo que gana Martina.
SELECT nombre_empleado, paga
FROM EMPLEADOS
WHERE paga < ( SELECT paga
               FROM EMPLEADOS 
               WHERE nombre_empleado='Martina');
```


Lógicamente el resultado de la subconsulta debe incluir el campo que estamos analizando.
Se pueden realizar esas subconsultas las veces que haga falta:
```sql
SELECT nombre_empleado, paga
FROM EMPLEADOS
WHERE paga < ( SELECT paga
               FROM EMPLEADOS 
               WHERE nombre_empleado='Martina')
AND   paga > ( SELECT paga
               FROM EMPLEADOS 
               WHERE nombre_empleado='Luis');
```

La última consulta obtiene los empleados cuyas pagas estén entre lo que gana Luis y lo que gana Martina.
Una subconsulta que utilice los valores >,<,>=,... tiene que devolver un único valor, de otro modo ocurre un error. Pero a veces se utilizan consultas del tipo: mostrar el sueldo y nombre de los empleados cuyo sueldo supera al de cualquier empleado del departamento de ventas.
La subconsulta necesaria para ese resultado mostraría los sueldos del departamento de ventas. Pero no podremos utilizar un operador de comparación directamente ya que compararíamos un valor con muchos valores. La solución a esto es utilizar instrucciones especiales entre el operador y la consulta. Esas instrucciones son:

Ejemplo:
```sql
-- Obtiene el empleado que más cobra.
SELECT nombre, sueldo
FROM EMPLEADOS
WHERE sueldo >= ALL ( SELECT sueldo
                      FROM EMPLEADOS );
```

Ejemplo:
```sql
-- Obtiene los nombres de los empleados cuyos DNI están en la tabla de directivos.
-- Es decir, obtendrá el nombre de los empleados que son directivos.
SELECT nombre, sueldo
FROM EMPLEADOS
WHERE DNI IN ( SELECT DNI
               FROM DIRECTIVOS );
```

## 5. ORDENACIÓN
El orden inicial de los registros obtenidos por un SELECT guarda una relación con al orden en el que fueron introducidos. Para ordenar en base a criterios más interesantes, se utiliza la cláusula ORDER BY.
En esa cláusula se coloca una lista de campos que indica la forma de ordenar. Se ordena primero por el primer campo de la lista, si hay coincidencias por el segundo, si ahí también las hay por el tercero, y así sucesivamente.
Se puede colocar las palabras ASC O DESC (por defecto se toma ASC). Esas palabras significan en ascendente (de la A a la Z, de los números pequeños a los grandes) o en descendente (de la Z a la a, de los números grandes a los pequeños) respectivamente.

Sintaxis completa de SELECT:

```sql
SELECT * | {[DISTINCT] columna | expresión [[AS] alias], ... }
FROM nombre_tabla
[WHERE condición]
[ORDER BY columna1[{ASC|DESC}]][,columna2[{ASC|DESC}]]...;
```

Ejemplo:

```sql
-- Devuelve el nombre y los apellidos 
-- de las personas que tienen teléfono, ordenados por 
-- apellido1, luego por apellido2 y finalmente por nombre 
SELECT nombre, apellido1, apellido2
FROM PERSONAS
WHERE telefono IS NOT NULL
ORDER BY apellido1, apellido2, nombre;
```

## 6. FUNCIONES

Oracle incorpora una serie de instrucciones que permiten realizar cálculos avanzados, o bien facilitar la escritura de ciertas expresiones. Todas las funciones reciben datos para poder operar (parámetros) y devuelven un resultado (que depende de los parámetros enviados a la función. Los argumentos se pasan entre paréntesis:

```
NOMBRE_FUNCIÓN [ ( parámetro1 [, parámetros2] ... ) ]; 
```

Si una función no precisa parámetros (como SYSDATE) no hace falta colocar los paréntesis.

Las funciones pueden ser de dos tipos:
- Funciones que operan con una sola fila
- Funciones que operan con varias filas.

En este apartado, solo veremos las primeras. Más adelante se estudiarán las que operan sobre varias filas.
> Nota: Oracle proporciona una tabla llamada DUAL con la que se permiten hacer pruebas.   
> Esa tabla tiene un solo campo (llamado DUMMY) y una sola fila de modo que es posible hacer pruebas.  
> Por ejemplo la consulta:
> ```sql
> SELECT SQRT(5) FROM DUAL;
>```

Muestra una tabla con el contenido de ese cálculo (la raíz cuadrada de 5). DUAL es una tabla interesante para hacer pruebas.

### 6.1. Funciones de caracteres
Para convertir el texto a mayúsculas o minúsculas:

En la siguiente tabla mostramos las llamadas funciones de transformación:


### 6.2. Funciones numéricas
Funciones para redondear el número de decimales o redondear a números enteros:

En el siguiente cuadro mostramos la sintaxis SQL de funciones matemáticas habituales:

### 6.3. Funciones de fecha
Las fechas se utilizan muchísimo en todas las bases de datos. Oracle proporciona dos tipos de datos para manejar fechas, los tipos DATE y TIMESTAMP. En el primer caso se almacena una fecha concreta (que incluso puede contener la hora), en el segundo caso se almacena un instante de tiempo más concreto que puede incluir incluso fracciones de segundo. Hay que tener en cuenta que a los valores de tipo fecha se les pueden sumar números y se entendería que esta suma es de días. Si tiene decimales entonces se suman días, horas, minutos y segundos. La diferencia entre dos fechas también obtiene un número de días.

Funciones para obtener la fecha y hora actual

Funciones para calcular fechas: 

### 6.4. Funciones de conversión
Oracle es capaz de convertir datos automáticamente a fin de que la expresión final tenga sentido. En ese sentido son fáciles las conversiones de texto a número y viceversa.

Ejemplos:

```sql
-- El resultado es 8 
SELECT 5+'3'
FROM DUAL;

-- El resultado es 53 
SELECT 5||'3'
FROM DUAL;
```

Pero en determinadas ocasiones querremos realizar conversiones explícitas. Para hacerlo utilizaremos las funciones que se detallan a continuación.

Función de conversión TO_CHAR

Obtiene un texto a partir de un número o una fecha. En especial se utiliza con fechas (ya que de número a texto se suele utilizar de forma implícita). En el caso de las fechas se indica el formato de conversión, que es una cadena que puede incluir estos símbolos (en una cadena de texto):

Ejemplo:

```sql
-- Si esta consulta se ejecuta el 20 de Febrero de 2014 a las 14:15 horas, 
-- devuelve:  20/FEBRERO/2014, JUEVES 14:15:03 
SELECT TO_CHAR(SYSDATE, 'DD/MONTH/YYYY, DAY HH:MI:SS')
FROM DUAL;
```

Parca convertir números a textos se usa esta función cuando se desean características especiales. En este caso en el formato se pueden utilizar estos símbolos:

Función de conversión TO_NUMBER

Convierte textos en números. Se indica el formato de la conversión.

Función de conversión TO_DATE

Convierte textos en fechas. Como segundo parámetro se utilizan los códigos de formato de fechas comentados anteriormente.

### 6.5. Función DECODE

Se evalúa una expresión y se colocan a continuación pares valor,resultado de forma que si se la expresión equivale al valor, se obtiene el resultado indicado. Se puede indicar un último parámetro con el resultado a efectuar en caso de no encontrar ninguno de los valores indicados. Sintaxis:
```sql
DECODE (
   expresión, valor1, resultado1 
           [, valor2, resultado2]... 
           [, valorPorDefecto]
);
```

Ejemplo:

```sql
SELECT
  DECODE (cotización, 1, salario*0.85,
                      2, salario*0.93,
                      3, salario*0.96,
                      salario)
FROM EMPLEADOS;
```

Este ejemplo es idéntico al mostrado con una expresión CASE.


### 6.6. Expresión CASE

Es una instrucción incorporada a la versión 9 de Oracle que permite establecer condiciones de salida (al estilo if-then-else de muchos lenguajes).

```sql
CASE expresión 
  WHEN valor1 THEN resultado1
  [WHEN valor2 THEN resultado2] ... 
  [ELSE resultado_por_defecto]
END;
```

El funcionamiento es el siguiente:
1. Se evalúa la expresión indicada.
2. Se comprueba si esa expresión es igual al valor del primer WHEN, de ser así se devuelve el primer resultado (cualquier valor excepto nulo).
3. Si la expresión no es igual al valor 1, entonces se comprueba si es igual al segundo. De ser así se escribe el resultado 2. De no ser así se continua con el siguiente WHEN.
4. El resultado indicado en la zona ELSE sólo se escribe si la expresión no vale ningún valor de los indicados.

Ejemplo:
```sql
SELECT
  CASE cotización 
    WHEN 1 THEN salario*0.85
    WHEN 2 THEN salario*0.93
    WHEN 3 THEN salario*0.96
    ELSE salario
  END
FROM EMPLEADOS;
```

## 7. AGRUPACIONES

Es muy común utilizar consultas en las que se desee agrupar los datos a fin de realizar cálculos en vertical, es decir calculados a partir de datos de distintos registros. Para ello se utiliza la cláusula GROUP BY que permite indicar en base a qué registros se realiza la agrupación. Con GROUP BY la instrucción SELECT queda de esta forma:

```sql
SELECT lista_expresiones
FROM lista_tablas
[WHERE condiciones]
[GROUP BY grupos]
[HAVING condiciones_de_grupos]
[ORDER BY columnas];
```

En el apartado GROUP BY, se indican las columnas por las que se agrupa. La función de este apartado es crear un único registro por cada valor distinto en las columnas del grupo.
Vamos a ver un ejemplo de como funciona GROUP BY. Supongamos que tenemos la siguiente tabla EXISTENCIAS:

Si por ejemplo agrupamos en base a las columnas tipo y modelo, la sintaxis sería la siguiente:
```sql
SELECT tipo, modelo
FROM EXISTENCIAS
GROUP BY tipo, modelo;
```

Al ejecutarla, en la tabla de existencias, se creará un único registro por cada tipo y modelo distintos, generando la siguiente salida:

Es decir es un resumen de los datos anteriores. Pero observamos que los datos n_almacen y cantidad no están disponibles directamente ya que son distintos en los registros del mismo grupo.
Así si los hubiésemos seleccionado también en la consulta habríamos ejecutado una consulta ERRÓNEA. Es decir al ejecutar:
```sql
SELECT tipo, modelo, cantidad
FROM EXISTENCIAS
GROUP BY tipo, modelo;
```

Habríamos obtenido un mensaje de error.
```
ERROR en línea 1:
ORA-00979: no es una expresión GROUP BY
```

Es decir esta consulta es errónea, porque GROUP BY sólo se pueden utilizar desde funciones.

### 7.1. Funciones de cálculo con grupo (o funciones colectivas)
Lo interesante de la creación de grupos es la posibilidad de cálculo que ofrece. Para ello se utilizan las funciones que permiten trabajar con los registros de un grupo. Estas son:

Las funciones anteriores se aplicarán sobre todos los elementos del grupo. Así, por ejemplo, podemos calcular la suma de las cantidades para cada tipo y modelo de la tabla EXISTENCIAS. (Es como si lo hiciéramos manualmente con las antiguas fichas sobre papel: primero las separaríamos en grupos poniendo juntas las que tienen el mismo tipo y modelo y luego para cada grupo sumaríamos las cantidades). La sintaxis SQL de dicha consulta quedaría:

```sql
SELECT tipo, modelo, SUM(cantidad)
FROM EXISTENCIAS
GROUP BY tipo, modelo;
```

Y se obtiene el siguiente resultado, en el que se suman las cantidades para cada grupo.

### 7.2. Condiciones HAVING
A veces se desea restringir el resultado de una función agrupada y no aplicarla a todos los grupos. Por ejemplo, imaginemos que queremos realizar la consulta anterior, es decir queremos calcular la suma de las cantidades para cada tipo y modelo de la tabla EXISTENCIAS, pero queremos que se muestren solo los registros en los que la suma de las cantidades calculadas sean mayor que 500. si planteáramos la consulta del modo siguiente:

```sql
SELECT tipo, modelo, SUM(cantidad)
FROM EXISTENCIAS
WHERE SUM(cantidad) >500
GROUP BY tipo, modelo;
```

Habríamos ejecutado una consulta ERRÓNEA.

```
ERROR  en línea 3:
ORA-00934: función de grupo no permitida aquí
```
La razón es que Oracle calcula primero el WHERE y luego los grupos; por lo que esa condición no la puede realizar al no estar establecidos los grupos. Es decir, no puede saber que grupos tienen una suma de cantidades mayor que 500 cuando todavía no ha aplicado los grupos.
Por ello se utiliza la cláusula HAVING, cuya ejecución se efectúa una vez realizados los grupos. Se usaría de esta forma:

```sql
SELECT tipo, modelo, SUM(cantidad)
FROM EXISTENCIAS
GROUP BY tipo, modelo
HAVING SUM(cantidad) >500;
```

Ahora bien, esto no implica que con la cláusula GROUP BY no podamos emplear un WHERE. Esta expresión puede usarse para imponer condiciones sobre las filas de la tabla antes de agrupar. Por ejemplo, la siguiente expresión es correcta:

```sql
SELECT tipo, modelo, SUM(cantidad)
FROM EXISTENCIAS
WHERE tipo='AR'
GROUP BY tipo, modelo
HAVING SUM(cantidad) >500;
```
De la tabla EXISTENCIAS tomará solo aquellas filas cuyo tipo sea AR, luego agrupará según tipo y modelo y dejará sólo aquellos grupos en los que SUM(cantidad)>500 y por último mostrará tipo, modelo y la suma de las cantidades para aquellos grupos que cumplan dicha condición.
En definitiva, el orden de ejecución de la consulta marca lo que se puede utilizar con WHERE y lo que se puede utilizar con HAVING.
Pasos en la ejecución de una consulta SELECT el gestor de bases de datos sigue el siguiente orden:
1. Se aplica la cláusula FROM, de manera que determina sobre que tablas se va a ejecutar la consulta.
2. Se seleccionan las filas deseadas utilizando WHERE. (Solo quedan las filas que cumplen las condiciones especificadas en el WHERE).
3. Se establecen los grupos indicados en la cláusula GROUP BY.
4. Se calculan los valores de las funciones de totales o colectivas que se especifiquen en el HAVING (COUNT, SUM, AVG,...)
5. Se filtran los registros que cumplen la cláusula HAVING
6. Se aplica la cláusula SELECT que indica las columnas que mostraremos en la consulta.
7. El resultado se ordena en base al apartado ORDER BY.


## 8. OBTENER DATOS DE MÚLTIPLES TABLAS

Es más que habitual necesitar en una consulta datos que se encuentran distribuidos en varias tablas. Las bases de datos relacionales se basan en que los datos se distribuyen en tablas que se pueden relacionar mediante un campo. Ese campo es el que permite integrar los datos de las tablas.
A continuación veremos como se pueden realizar las consultas entre varias tablas.
Para ello partiremos del siguiente ejemplo: Supongamos que disponemos de una tabla de EMPLEADOS cuya clave principal es el DNI y otra tabla de TAREAS que se refiere a las tareas realizadas por los empleados. Suponemos que cada empleado realizará múltiples tareas, pero que cada tarea es realizada por un único empleado. Si el diseño está bien hecho, en la tabla de TAREAS aparecerá el DNI del empleado (como clave foránea) para saber qué empleado realizó la tarea.

### 8.1. Producto cruzado o cartesiano de tablas

En el ejemplo anterior si quiere obtener una lista de los datos de las tareas y los empleados, se podría hacer de esta forma:

```sql
SELECT cod_tarea, descripción_tarea, dni_empleado, nombre_empleado
FROM TAREAS, EMPLEADOS;
```

Aunque la sintaxis es correcta ya que, efectivamente, en el apartado FROM se pueden indicar varias tareas separadas por comas, al ejecutarla produce un producto cruzado de las tablas.
Es decir, aparecerán todos los registros de las tareas relacionados con todos los registros de empleados (y no para cada empleado sus tareas específicas).
El producto cartesiano pocas veces es útil para realizar consultas. Nosotros necesitamos discriminar ese producto para que sólo aparezcan los registros de las tareas relacionadas con sus empleados correspondientes. A eso se le llama asociar tablas (join) y se ve en el siguiente apartado.

### 8.2. Asociando tablas

La forma de realizar correctamente la consulta anterior (asociado las tareas con los empleados que la realizaron) sería:

```sql
SELECT cod_tarea, descripción_tarea, dni_empleado, nombre_empleado
FROM TAREAS, EMPLEADOS
WHERE TAREAS.dni_empleado=EMPLEADOS.dni_empleado;
```

Nótese que se utiliza la notación tabla.columna para evitar la ambigüedad, ya que el mismo nombre de campo se puede repetir en ambas tablas. Para evitar repetir continuamente el nombre de la tabla, se puede utilizar un alias de tabla:

```sql
SELECT T.cod_tarea, T.descripción_tarea, E.dni_empleado, E.nombre_empleado
FROM TAREAS T, EMPLEADOS E
WHERE T.dni_empleado=E.dni_empleado;
```

A la sintaxis WHERE se le pueden añadir condiciones sin más que encadenarlas con el operador AND.

Ejemplo:

```sql
SELECT T.cod_tarea, T.descripción_tarea
FROM TAREAS T, EMPLEADOS E
WHERE T.dni_empleado=E.dni_empleado AND E.nombre_empleado='Javier';
```

Finalmente indicar que se pueden enlazar más de dos tablas a través de sus claves principales y foráneas. Por cada relación necesaria entre tablas, aparecerá una condición (igualando la clave principal y la foránea correspondiente) en el WHERE.

Ejemplo:

```sql
SELECT T.cod_tarea, T.descripción_tarea, E.nombre_empleado, U.nombre_utensilio
FROM TAREAS T, EMPLEADOS E, UTENSILIOS U
WHERE T.dni_empleado=E.dni_empleado AND T.cod_tarea=U.cod_tarea;
```

### 8.3. Relaciones sin igualdad

A las relaciones descritas anteriormente se las llama relaciones en igualdad (equijoins), ya que las tablas se relacionan a través de campos que contienen valores iguales en dos tablas.
A veces esto no ocurre, en las tablas:
En el ejemplo anterior podríamos averiguar la categoría a la que pertenece cada empleado, pero estas tablas poseen una relación que ya no es de igualdad.

La forma sería:

```sql
SELECT E.empleado, E.sueldo, C.categoria
FROM EMPLEADOS E, CATEGORÍAS C
WHERE E.sueldo BETWEEN C.sueldo_mínimo AND C.sueldo_máximo;
```

### 8.4. Combinación de tablas (JOIN)
Existe otra forma más moderna e intuitiva de trabajar con varias tablas.  Para ello se utiliza la clausula JOIN. 
Supongamos que tenemos una base de datos de una entidad bancaria. Disponemos de una tabla con sus empleados y otra tabla con sus sucursales. En una sucursal trabajan varios empleados. Los empleados viven en una localidad y trabajan en una sucursal situada en la misma localidad o en otra localidad. El esquema E-R es el siguiente:


Los datos de las tablas son:

EMPLEADOS
DNI
NOMBRE
LOCALIDAD
COD_SUCURSAL
11111111A
ANA
ALMERÍA
0001
22222222B
BERNARDO
GRANADA
0001
33333333C
CARLOS
GRANADA
- 
44444444D
DAVID
JEREZ
0003

SUCURSALES
COD_SUCURSAL
DIRECCIÓN
LOCALIDAD
0001
C/ ANCHA, 1
ALMERÍA
0002
C/ NUEVA, 1
GRANADA
0003
C/ CORTÉS, 33
CÁDIZ

Se observa que Ana vive en Almería y trabaja en la sucursal 0001 situada en Almería. Bernardo vive en Granada pero trabaja en la sucursal 0001 de Almería. Carlos es un empleado del que no disponemos el dato acerca de la sucursal en la que trabaja. David es un empleado que vive en Jerez de la Frontera y trabaja en la sucursal 0003 en Cádiz.
Existe otra sucursal 0002 en Granada donde no aparece registrado ningún empleado.
Existen diversas formas de combinar (JOIN) las tablas según la información que deseemos obtener. Los tipos de JOIN se clasifican en:

- INNER JOIN ( o simplemente JOIN): Combinación interna.
  - JOIN
  - SELF JOIN
  - NATURAL JOIN
- OUTER JOIN: Combinación externa.
  - LEFT OUTER JOIN (o simplemente LEFT JOIN)
  - RIGHT OUTER JOIN (o simplemente RIGHT JOIN)
  - FULL OUTER JOIN (o simplemente FULL JOIN)
- CROSS JOIN: Combinación cruzada.

Pasamos a continuación a explicar cada uno de ellos.

#### INNER JOIN

También se conoce como EQUI JOIN o combinación de igualdad. Esta combinación devuelve todas las filas de ambas tablas donde hay una coincidencia. Este tipo de unión se puede utilizar en la situación en la que sólo debemos seleccionar las filas que tienen valores comunes en las columnas que se especifican en la cláusula ON. Su sintaxis es:

```sql
SELECT TABLA1.columna1, TABLA1.columna2, ...
       TABLA2.columna1, TABLA2.columna2, ...
FROM TABLA1 JOIN TABLA2 
ON TABLA1.columnaX=TABLA2.columnaY;
```

Por ejemplo, para ver los empleados con sucursal asignada:

```sql
SELECT E.*, S.LOCALIDAD 
FROM EMPLEADOS E JOIN SUCURSALES S 
ON E.COD_SUCURSAL=S.COD_SUCURSAL;
```

DNI
NOMBRE
LOCALIDAD
COD_SUCURSAL
LOCALIDAD
22222222B
BERNARDO
GRANADA
0001
ALMERÍA
11111111A
ANA
ALMERÍA
0001
ALMERÍA
44444444D
DAVID
JEREZ
0003
CÁDIZ

En esta consulta, utilizamos la combinación interna basada en la columna "COD_SUCURSAL" que es común en las tablas "EMPLEADOS" y "SUCURSALES". Esta consulta dará todas las filas de ambas tablas que tienen valores comunes en la columna "COD_SUCURSAL"

##### SELF JOIN

En algún momento podemos necesitar unir una tabla consigo mísma. Este tipo de combinación se denomina SELF JOIN. En este JOIN, necesitamos abrir dos copias de una misma tabla en la memoria. Dado que el nombre de tabla es el mismo para ambas instancias, usamos los alias de tabla para hacer copias idénticas de la misma tabla que se abran en diferentes ubicaciones de memoria. Observa que no existe la clausula SELF JOIN, solo JOIN. Sintaxis:

```sql
SELECT ALIAS1.columna1, ALIAS1.columna2, ..., ALIAS2.columna1, ...
FROM TABLA ALIAS1 JOIN TABLA ALIAS2 
ON ALIAS1.columnaX=ALIAS2.columnaY;
```

Ejemplo:

```sql
SELECT E1.NOMBRE, E2.NOMBRE, E1.LOCALIDAD
FROM EMPLEADOS E1 JOIN EMPLEADOS E2 ON E1.LOCALIDAD=E2.LOCALIDAD;
```

NOMBRE
NOMBRE
LOCALIDAD
ANA
ANA
ALMERÍA
CARLOS
BERNARDO
GRANADA
BERNARDO
BERNARDO
GRANADA
CARLOS
CARLOS
GRANADA
BERNARDO
CARLOS
GRANADA
DAVID
DAVID
JEREZ

Esto muestra las combinaciones de los empleados que viven en la misma localidad. En este caso no es de mucha utilidad, pero el SELF JOIN puede ser muy útil en relaciones reflexivas.

##### NATURAL JOIN

NATURAL JOIN establece una relación de igualdad entre las tablas a través de los campos que tengan el mismo nombre en ambas tablas. Su sintaxis es:
```sql
SELECT TABLA1.columna1, TABLA1.columna2, ...
       TABLA2.columna1, TABLA2.columna2, ...
FROM TABLA1 NATURAL JOIN TABLA2;
```

En este caso no existe clausula ON puesto que se realiza la combinación teniendo  en cuenta las columnas del mismo nombre. Por ejemplo: 

```sql
SELECT *
FROM EMPLEADOS E NATURAL JOIN SUCURSALES S;
```

LOCALIDAD
COD_SUCURSAL
DNI
NOMBRE
DIRECCIÓN
ALMERÍA
0001
11111111A
ANA
C/ ANCHA, 1

En el resultado de la consulta nos aparece la combinación donde la (LOCALIDAD, COD_SUCURSAL) de EMPLEADOS es igual a (LOCALIDAD, COD_SUCURSAL) de SUCURSALES. Es decir estamos mostrando todos los empleados que tienen asignada una sucursal y dicha sucursal está en la localidad donde vive el empleado. 
El NATURAL JOIN elimina columnas duplicadas, por eso no aparecen los campos LOCALIDAD ni SUCURSAL duplicados. Este tipo de consulta no permite indicar estos campos en la cláusula SELECT. Por ejemplo: SELECT E.LOCALIDAD o SELECT E.COD_SUCURSAL sería incorrecto.

#### OUTER JOIN
La combinación externa o OUTER JOIN es muy útil cuando deseamos averiguar que campos están a NULL en un lado de la combinación. En nuestro ejemplo, podemos ver qué empleados no tienen sucursal asignada; también podemos ver que sucursales no tienen empleados asignados.


##### LEFT JOIN
También conocido como LEFT OUTER JOIN, nos permite obtener todas las filas de la primera tabla asociadas a filas de la segunda tabla. Si no existe correspondencia en la segunda tabla, dichos valores aparecen como NULL.
Su  sintaxis es:

```sql
SELECT TABLA1.columna1, TABLA1.columna2, ...
       TABLA2.columna1, TABLA2.columna2, ...
FROM TABLA1 LEFT JOIN TABLA2 
ON TABLA1.columnaX=TABLA2.columnaY;
```

Por ejemplo:

```sql
SELECT E.*, S.LOCALIDAD
FROM EMPLEADOS E LEFT JOIN SUCURSALES S
ON E.COD_SUCURSAL=S.COD_SUCURSAL;
```

DNI
NOMBRE
LOCALIDAD
COD_SUCURSAL
LOCALIDAD
11111111A
ANA
ALMERÍA
0001
ALMERÍA
22222222B
BERNARDO
GRANADA
0001
ALMERÍA
33333333C
CARLOS
GRANADA
- 
-
44444444D
DAVID
JEREZ
0003
CÁDIZ

Todos los empleados tienen una sucursal asignada salvo el empleado Carlos.

##### RIGHT JOIN
También conocido como RIGHT OUTER JOIN, nos permite obtener todas las filas de la segunda tabla asociadas a filas de la primera tabla. Si no existe correspondencia en la primera tabla, dichos valores aparecen como NULL.
Su  sintaxis es:

```sql
SELECT TABLA1.columna1, TABLA1.columna2, ...
       TABLA2.columna1, TABLA2.columna2, ...
FROM TABLA1 RIGHT JOIN TABLA2 
ON TABLA1.columnaX=TABLA2.columnaY;
```

Por ejemplo:
```sql
SELECT E.DNI, E.NOMBRE, S.*
FROM EMPLEADOS E RIGHT JOIN SUCURSALES S
ON E.COD_SUCURSAL=S.COD_SUCURSAL;
```

DNI
NOMBRE
COD_SUCURSAL
DIRECCIÓN
LOCALIDAD
11111111A
ANA
0001
C/ ANCHA, 1
ALMERÍA
22222222B
BERNARDO
0001
C/ ANCHA, 1
ALMERÍA
44444444D
DAVID
0003
C/ CORTÉS, 33
CÁDIZ
- 
- 
0002
C/ NUEVA, 1
GRANADA

Todas las sucursales tienen algún empleado asignado salvo la sucursal 0002.

##### FULL JOIN
También conocido como FULL OUTER JOIN, nos permite obtener todas las filas de la primera tabla asociadas a filas de la segunda tabla. Si no existe correspondencia en alguna de las tablas, dichos valores aparecen como NULL.

Su  sintaxis es:

```sql
SELECT TABLA1.columna1, TABLA1.columna2, ...
       TABLA2.columna1, TABLA2.columna2, ...
FROM TABLA1 FULL JOIN TABLA2 
ON TABLA1.columnaX=TABLA2.columnaY;
```

Por ejemplo:

```sql
SELECT E.DNI, E.NOMBRE, S.COD_SUCURSAL, S.LOCALIDAD
FROM EMPLEADOS E FULL JOIN SUCURSALES S 
ON E.COD_SUCURSAL=S.COD_SUCURSAL;
```

DNI
NOMBRE
COD_SUCURSAL
LOCALIDAD
22222222B
BERNARDO
0001
ALMERÍA
11111111A
ANA
0001
ALMERÍA
- 
- 
0002
GRANADA
44444444D
DAVID
0003
CÁDIZ
33333333C
CARLOS
- 
- 

Como puede observarse fácilmente, vemos que en la sucursal 0002 no hay ningún empleado asignado y que el empleado Carlos no tiene asignada ninguna sucursal.

#### CROSS JOIN
El CROSS JOIN o combinación cruzada produce el mismo resultado del producto cartesiano, es decir nos da todas las combinaciones posibles. Su sintaxis es:

```sql
SELECT TABLA1.columna1, TABLA1.columna2, ...
       TABLA2.columna1, TABLA2.columna2, ...
FROM TABLA1 CROSS JOIN TABLA2;
```

Por ejemplo:

```sql
SELECT E.DNI, E.NOMBRE, E.LOCALIDAD, S.COD_SUCURSAL, S.LOCALIDAD
FROM EMPLEADOS E CROSS JOIN SUCURSALES S;
```

DNI
NOMBRE
LOCALIDAD
COD_SUCURSAL
LOCALIDAD
11111111A
ANA
ALMERÍA
0001
ALMERÍA
11111111A
ANA
ALMERÍA
0002
GRANADA
11111111A
ANA
ALMERÍA
0003
CÁDIZ
22222222B
BERNARDO
GRANADA
0001
ALMERÍA
22222222B
BERNARDO
GRANADA
0002
GRANADA
22222222B
BERNARDO
GRANADA
0003
CÁDIZ
33333333C
CARLOS
GRANADA
0001
ALMERÍA
33333333C
CARLOS
GRANADA
0002
GRANADA
33333333C
CARLOS
GRANADA
0003
CÁDIZ
44444444D
DAVID
JEREZ
0001
ALMERÍA
44444444D
DAVID
JEREZ
0002
GRANADA
44444444D
DAVID
JEREZ
0003
CÁDIZ

En el ejemplo que estamos viendo nos mostraría 12 filas (4x3: 4 filas de empleados x 3 filas de sucursales). El primer cliente se combina con todas las sucursales. El segundo cliente igual. Y así sucesivamente.  
Esta combinación asocia todas las filas de la tabla izquierda con cada fila de la tabla derecha. Este tipo de unión es necesario cuando necesitamos seleccionar todas las posibles combinaciones de filas y columnas de ambas tablas. Este tipo de unión no es generalmente preferido ya que toma mucho tiempo y da un resultado enorme que no es a menudo útil

## 9. COMBINACIONES ESPECIALES

### 9.1. Uniones
La palabra UNION permite añadir el resultado de un SELECT a otro SELECT. Para ello ambas instrucciones tienen que utilizar el mismo número y tipo de columnas.

Ejemplo:

```sql
--  Tipos y modelos de piezas que se encuentren el almacén 1, en el 2 o en ambos.
SELECT tipo,modelo FROM existencias
WHERE n_almacen = 1
UNION
SELECT tipo,modelo FROM existencias
WHERE n_almacen = 2;
```

Es decir, UNION crea una sola tabla con registros que estén presentes en cualquiera de las consultas.
Si están repetidas sólo aparecen una vez, para mostrar los duplicados se utiliza UNION ALL en lugar de la palabra UNION.

### 9.2. Intersecciones

De la misma forma, la palabra INTERSECT permite unir dos consultas SELECT de modo que el resultado serán las filas que estén presentes en ambas consultas.
Ejemplo: tipos y modelos de piezas que se encuentren en los almacenes 1 y 2 (en ambos).

```sql
-- Tipos y modelos de piezas que se encuentren en los almacenes 1 y 2 (en ambos).
SELECT tipo,modelo FROM existencias
WHERE n_almacen = 1
INTERSECT
SELECT tipo,modelo FROM existencias
WHERE n_almacen = 2;
```

### 9.3. Diferencia

Con MINUS también se combinan dos consultas SELECT de forma que aparecerán los registros del primer SELECT que no estén presentes en el segundo.
Ejemplo: 

```sql
-- Tipos y modelos de piezas que se encuentren el almacén 1 y no en el 2.
SELECT tipo,modelo FROM existencias
WHERE n_almacen = 1
MINUS
SELECT tipo,modelo FROM existencias
WHERE n_almacen = 2;
```

Se podrían hacer varias combinaciones anidadas (una unión a cuyo resultado se restará de otro SELECT por ejemplo), en ese caso es conveniente utilizar paréntesis para indicar qué combinación se hace primero:

```sql
(SELECT ...
...
UNION
SELECT ...
...
)
MINUS
SELECT ...
... ;
-- Primero se hace la unión y luego la diferencia 
```

## 10. CONSULTA DE VISTAS

A efectos de uso, la consulta de una vista es idéntica a la consulta de una tabla.
Supongamos que tenemos la siguiente vista:

```sql
CREATE VIEW RESUMEN 
  -- a continuación indicamos los alias
  (id_localidad, localidad, poblacion, 
   n_provincia, provincia, superficie, 
   id_comunidad, comunidad)
AS
  SELECT L.IdLocalidad, L.Nombre, L.Poblacion,
         P.IdProvincia, P.Nombre, P.Superficie, 
         C.IdComunidad, C.Nombre
  FROM LOCALIDADES L JOIN PROVINCIAS P ON L.IdProvincia=P.IdProvincia
       JOIN COMUNIDADES C ON P.IdComunidad=C.IdComunidad;
```

Podemos consultar ahora sobre la vista como si de una tabla se tratase

```sql
SELECT DISTINCT (provincia, comunidad) FROM resumen;
```
