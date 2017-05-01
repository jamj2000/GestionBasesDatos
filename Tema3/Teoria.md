# DISEÑO FÍSICO DE BASES DE DATOS. LENGUAJE DE DEFINICIÓN DE DATOS




> IES Luis Vélez de Guevara  
> Departamento de Informática




Contenido
```
1.   INTRODUCCIÓN	3
2.   EL LENGUAJE SQL	3
2.1.   Criterios de notación	5
2.2.   Normas de escritura	5
3.   LENGUAJE DE DEFINICIÓN DE DATOS: DDL	5
3.1.   Tipos de datos y conversión entre tipos	5
3.2.   Expresiones y operadores condicionales	9
3.3.   Creación, Modificación y Eliminación de bases de datos	10
3.4.   Creación, Modificación y Eliminación de esquemas	12
3.5.   Creación, Modificación y Eliminación de tablas	13
3.6.   Creación, Modificación y Eliminación de vistas	23
3.7.   Creación, Modificación y Eliminación de índices	25
3.8.   Creación, Modificación y Eliminación de secuencias	27
3.9.   Creación, Modificación y Eliminación de sinónimos	29
4.   ACTIVIDADES	31
4.1.   Cuestiones (I)	31
4.2.   Cuestiones (II)	37
4.3.   Cuestiones (III)	41
4.4.   Prácticas	58
```








## 1. INTRODUCCIÓN
En la fase de análisis hemos realizado la E.R.S. A partir de dicha especificación de requisitos, en la unidad anterior, aprendimos a realizar el diseño conceptual de una BD mediante el Modelo E/R y el Modelo E/R extendido respectivamente.
También vimos como hacer el modelo lógico mediante el modelo relacional que se obtenía a partir del modelo E/R y aprendimos a comprobar que dicho modelo estaba normalizado.
Siguiendo con el proceso de desarrollo, lo que debemos hacer ahora es pasar al diseño  físico de la BD. Es decir, implementar la Base de Datos. Para ello, se programarán las diferentes tablas que constituirán la Base de Datos, se introducirán los datos y, más adelante, se construirán las consultas. Todo ello se hará programando en el lenguaje más extendido para la definición y manipulación de datos en SGBDR: SQL.
Las prácticas del módulo de Gestión Bases de Datos se van a realizar utilizando el Sistema de Gestión de Bases de Datos Relacional (RDBMS) ORACLE. Varias son las razones que justifican la impartición de estas prácticas utilizando ORACLE:
En primer lugar, ORACLE es un producto comercial ampliamente extendido y utilizado, que cuenta con una importante cuota de mercado dentro del mundo de las bases de datos, estando disponible para prácticamente la totalidad de plataformas posibles (Windows, MAC, UNIX, LINUX, ...) con la ventaja de que las aplicaciones realizadas para una plataforma concreta pueden ser portadas de forma automática a cualquiera de las otras plataformas.
ORACLE permite almacenar y manejar gran cantidad de información de forma rápida y segura, destacando además su valor educativo, ya que la herramienta que utiliza ORACLE para acceder a la base de datos es el lenguaje no procedural SQL, y este lenguaje implementa prácticamente toda la funcionalidad y características del modelo relacional teórico.


## 2. EL LENGUAJE SQL
Historia
El nacimiento del lenguaje SQL data de 1970 cuando E. F. Codd publica su libro: "Un modelo de datos relacional para grandes bancos de datos compartidos". Ese libro dictaría las direcrices de las bases de datos relacionales. Apenas dos años después IBM (para quien trabajaba Codd) utiliza las directrices de Codd para crear el Standard English Query Language (Lenguaje Estándar Inglés para Consultas) al que se le llamó SEQUEL. Más adelante se le asignaron las siglas SQL (Standard Query Language, lenguaje estándar de consulta) aunque en inglés se siguen pronunciando secuel. En español se pronuncia esecuele.
En 1979 Oracle presenta la primera implementación comercial del lenguaje. Poco después se convertía en un estándar en el mundo de las bases de datos avalado por los organismos ISO y ANSI. En el año 1986 se toma como lenguaje estándar por ANSI de los SGBD relacionales. Un año después lo adopta ISO, lo que convierte a SQL en estándar mundial como lenguaje de bases de datos relacionales.
En 1989 aparece el estándar ISO (y ANSI) llamado SQL89 o SQL1. En 1992 aparece la nueva versión estándar de SQL (a día de hoy sigue siendo la más conocida) llamada SQL92. En 1999 se aprueba un nuevo SQL estándar que incorpora mejoras que incluyen triggers, procedimientos, funciones,... y otras características de las bases de datos objeto-relacionales; dicho estándar se conoce como SQL99. El último estándar es el del año 2011 (SQL2011)
Elementos de SQL
SQL se basa en la Teoría Matemática del Álgebra Relacional. El lenguaje SQL consta de varios elementos:
Lenguaje de definición de datos (DDL): proporciona órdenes para definir, modificar o eliminar los distintos objetos de la base de datos (tablas, vistas, índices...).
Lenguaje de Manipulación de Datos (DML): proporciona órdenes para insertar, suprimir y modificar registros o filas de las tablas. También contempla la realización de consultas sobre la BD.
Lenguaje de Control de Datos (DCL): permite establecer derechos de acceso de los usuarios sobre los distintos objetos de la base de datos. Lo forman las instrucciones GRANT y REVOKE.
Oracle contempla además sentencias para transacciones. Administran las modificaciones creadas por las instrucciones DML. Lo forman las instrucciones ROLLBACK, COMMIT y SAVEPOINT.
Proceso de ejecución de sentencia SQL
El proceso de una instrucción SQL es el siguiente:
(1)  Se analiza la instrucción. Para comprobar la sintaxis de la misma
(2)  Si es correcta se valora si los metadatos de la misma son correctos. Se comprueba esto en el diccionario de datos.
(3)  Si es correcta, se optimiza, a fin de consumir los mínimos recursos posibles.
(4)  Se ejecuta la sentencia y se muestra el resultado al emisor de la misma.

2.1. Criterios de notación 
La notación utilizada para la especificación de los comandos de SQL es la siguiente:
Palabras clave de la sintaxis SQL en MAYÚSCULAS.
Los corchetes [ ] indican opcionalidad.
Las llaves {} delimitan alternativas separadas por | de las que se debe elegir una.
Los puntos suspensivos ... indican repetición varias veces de la opción anterior.
2.2. Normas de escritura
En SQL no se distingue entre mayúsculas y minúsculas. Da lo mismo como se escriba.
El final de una instrucción o sentencia lo marca el signo de punto y coma.
Las sentencias SQL (SELECT, INSERT,...) se pueden escribir en varias líneas siempre que las palabras no sean partidas.
Los comentarios en el código SQL comienzan por /* y terminan por */. También puede usarse los dos guiones --  y a continuación un comentario hasta final de línea. 
3. LENGUAJE DE DEFINICIÓN DE DATOS: DDL
3.1. Tipos de datos y conversión entre tipos
Los tipos de datos principales de ORACLE son los siguientes:
Tipos de Datos principales de Oracle
CHAR(n)
Cadena de caracteres de longitud fija. Se puede especificar el número de caracteres que tendrá (n).
VARCHAR2(n) o VARCHAR(c)
Cadena de caracteres de longitud variable. Se debe especificar el número de caracteres que tendrá (n).
NUMBER(n)
Dato de tipo numérico de un máximo de 40 dígitos, además del signo y el punto decimal. Se puede utilizar notación científica (1.273E2 es igual a 127.3). Se usa para Números enteros. Se puede especificar el número de dígitos (n).
NUMBER(p,d)
Números reales. Donde “p” especifica el número total de dígitos (máximo 38 dígitos) y “d” el número total de decimales. Por ejemplo NUMBER(4,2) tiene como máximo valor 99.99.
DATE
El tipo DATE permite almacenar fechas.

Comparativa estándar SQL y Oracle SQL

Cadenas de caracteres: CHAR(n) y VARCHAR(n)
Las cadenas de caracteres se delimitan utilizando comillas simples.
Por ejemplo: 'Hola', 'Una cadena'.
Conviene poner suficiente espacio para almacenar los valores. En el caso de los VARCHAR, Oracle no malgasta espacio por poner más espacio del deseado ya que si el texto es más pequeño que el tamaño indicado, el resto del espacio se ocupa.
Además de los operadores de igualdad ( =, !=, ...) otras funciones útiles para trabajar con cadenas son:
cad1 || cad2 : concatena dos cadenas.
LENGTH(cad): devuelve la longitud de la cadena.
LOWER(cad): convierte todas las letras de la cadena a minúsculas.
UPPER(cad): ídem a mayúsculas.
Números: NUMBER
El tipo NUMBER es un formato versátil que permite representar todo tipo de números. Su rango recoge números de entre 1 x 10-130 to 9.99...9 x 10125.
Fuera de estos rangos Oracle devuelve un error.
Los números decimales (números de coma fija) se indican con NUMBER(p,d), donde p es la precisión máxima y d es el número de decimales a la derecha de la coma. Por ejemplo, NUMBER (8,3) indica que se representan números de ocho cifras de precisión y tres decimales. Los decimales en Oracle se presenta con el punto y no con la coma.
Para números enteros se indica NUMBER(p) donde p es el número de dígitos. Eso es equivalente a NUMBER(p,0).
Para números de coma flotante (equivalentes a los float o double de muchos lenguajes de programación) simplemente se indica el texto NUMBER sin precisión ni escala.
Además de las operaciones típicas con valores numéricos (+, -, *, /), otras funciones útiles son:
ABS(num): devuelve el valor absoluto.
SQRT(num): devuelve la raíz cuadrada.
POWER(b,e): devuelve la potencia de b elevado a e.
Existen otras funciones para grupos de valores (suma, media, máximo, ...) que se verán en apartados posteriores.
Fechas: DATE
Las fechas se pueden escribir en formato día, mes y año entre comillas simples. El separador puede ser una barra de dividir, un guión y casi cualquier símbolo.
Tanto el día como el año tiene formato numérico y el mes se indica con las tres primeras letras del nombre del mes en el idioma soportado por el servidor ORACLE. 
Ejemplos: '1-JAN-96', '28-jul-74'. Además de esta información, un valor de tipo fecha almacena también la hora en formato hh:mm:ss.
Las fechas se pueden comparar con los operadores típicos de comparación (<, >, !=, =, ...).
La función SYSDATE devuelve la fecha actual (fecha y hora). Con las fechas es posible realizar operaciones aritméticas como sumas y restas de fechas, teniendo en cuenta que a una fecha se le suman días y que la diferencia entre dos fechas se devuelve también en días. Por ejemplo SYSDATE + 1 devuelve la fecha de mañana.
Datos de gran tamaño
Son tipos pensados para almacenar datos de tamaño muy grande. No pueden poseer índices ni ser parte de claves. 
CLOB (Character Large OBject)
Utilizado para almacenar datos de texto de gran tamaño (hasta  hasta 128 TB texto)
BLOB (Binary Large OBject)
Utilizado para guardar datos binarios de hasta 128 TB de tamaño. Se utilizan para almacenar datos binarios, típicamente imágenes, vídeos, documentos con formato como PDF o similares, ...
Conversión entre datos
Oracle permite tanto la conversión de tipos implícita como la explícita.
La conversión de tipos implícita (Oracle la hace automáticamente) significa que cuando Oracle encuentra en un lugar determinado (por ejemplo en una expresión) un dato de un tipo diferente al esperado, entonces aplica una serie de reglas para intentar convertir ese dato al tipo esperado. Por ejemplo, si un atributo de una tabla determinada es de tipo NUMBER y se intenta introducir el valor de tipo caracter '1221', entonces automáticamente se convierte en su valor numérico equivalente sin producirse ningún error.
La conversión de tipos explícita se realiza básicamente con las siguientes funciones, y se verá en profundidad más adelante:
Conversión número-cadena: TO_CHAR(número [, formato]).
Conversión cadena-número: TO_NUMBER(cadena [,formato]).
Conversión fecha-cadena: TO_CHAR(fecha [, formato]).
Conversión cadena-fecha: TO_DATE(cadena [, formato]).
3.2. Expresiones y operadores condicionales
Las condiciones son expresiones lógicas (devuelven verdadero o falso) que se sitúan normalmente junto a una cláusula SQL que utilizan muchos comandos. Dentro del DDL se utilizarán con la cláusula CHECK que sirve para establecer las condiciones que deben cumplir sobre los valores que se almacenarán en una tabla.
Las condiciones se construyen utilizando los operadores de comparación y los operadores lógicos. A continuación se describen los operadores más importantes junto con ejemplos de su utilización.
=, <>, <=, >=, < y >.
Ejemplos:
- horas >= 10.5
- nombre = 'PEPE'
- fecha < '1-ene-93'
[NOT] IN lista_valores: Comprueba la pertenencia a la lista de valores. Generalmente, los valores de la lista se habrán obtenido como resultado de un comando SELECT (comando de consulta).
Ejemplo: 
- nombre NOT IN ('PEPE', 'LOLA')
oper {ANY | SOME} lista_valores: Comprueba que se cumple la operación oper con algún elemento de la lista de valores. oper puede ser <, >, <=, >=, <>.
Ejemplo: 
- nombre = ANY ('PEPE', 'LOLA')
oper ALL lista_valores: Comprueba que se cumple la operación oper con todos los elementos de la lista de valores. oper puede ser <, >, <=, >=, <>.
Ejemplo: 
- nombre <> ALL ('PEPE', 'LOLA')
[NOT] BETWEEN x AND y: Comprueba la pertenencia al rango x - y.
Ejemplo: 
- horas BETWEEN 10 AND 20 que equivale a horas >= 10 AND horas <= 20
[NOT] EXISTS lista_valores: Comprueba si la lista de valores contiene algún elemento.
Ejemplos:
- EXISTS ('ALGO') devuelve verdadero.
- NOT EXISTS ('ALGO') devuelve falso.
[NOT] LIKE texto: Permite comparar cadenas alfanuméricas haciendo uso de símbolos comodín. Estos símbolos comodín son los siguientes:
_ : sustituye a un único carácter.
%: sustituye a varios caracteres.
Ejemplos:
- nombre LIKE 'Pedro%'
- codigo NOT LIKE 'cod1_'
Si dentro de una cadena se quieren utilizar los caracteres '%' o '_' tienen que ser escapados utilizando el símbolo '/'.
IS [NOT] NULL: Cuando el valor de un atributo, o es desconocido, o no es aplicable esa información, se hace uso del valor nulo (NULL). Para la comparación de valores nulos se utiliza el operador IS [NOT] NULL.
Ejemplo: 
- teléfono IS NULL
Los operadores lógicos junto con el uso de paréntesis permiten combinar condiciones simples obteniendo otras más complejas. Los operadores lógicos son:
OR: nombre = 'PEPE' OR horas BETWEEN 10 AND 20
AND: horas > 10 AND telefono IS NULL
NOT: NOT (nombre IN ('PEPE','LUIS'))
3.3. Creación, Modificación y Eliminación de bases de datos
En Oracle la creación, eliminación y modificación de una base de datos resulta una tarea relativamente compleja. Por ahora sólo se comenta de forma muy simple. 
Creación de una Base de datos
Crear la base de datos implica indicar los archivos y ubicaciones que se utilizarán para la misma, además de otras indicaciones técnicas y administrativas que no se comentarán en este tema.
Lógicamente sólo es posible crear una base de datos si se tienen privilegios DBA (DataBase Administrator) (SYSDBA en el caso de Oracle).
El comando SQL de creación de una base de datos es CREATE DATABASE. Este comando crea una base de datos con el nombre que se indique. Ejemplo:
CREATE DATABASE prueba;

Pero normalmente se indican más parámetros. Ejemplo (parámetros de Oracle):
CREATE DATABASE prueba
LOGFILE prueba.log
MAXLOGFILES 25
MAXINSTANCES 10
ARCHIVELOG
CHARACTER SET AL32UTF8
NATIONAL CHARACTER SET UTF8
DATAFILE prueba1.dbf AUTOEXTEND ON MAXSIZE 500MB;

NOTA: Lo que Oracle llama una "base de datos" es generalmente diferente de lo que la mayoría de los otros productos de base de datos llaman una "base de datos". Una "base de datos" en MySQL o SQL Server está mucho más cerca de lo que Oracle llama un "esquema" que es el conjunto de objetos propiedad de un usuario en particular. En Oracle, por lo general sólo tendrá una base de datos por servidor (aunque en un servidor grande podría haber varias bases de datos) donde cada base de datos tiene muchos esquemas diferentes. Si estás utilizando la edición express de Oracle, sólo se te permite tener 1 base de datos por servidor.
Eliminación de una Base de datos
La sentencia que se utiliza para ello es DROP DATABASE. 
Modificación de una Base de datos
Se utiliza la sentencia ALTER DATABASE que posee innumerables cláusulas. 

3.4. Creación, Modificación y Eliminación de esquemas 
Según los estándares actuales, una base de datos es un conjunto de objetos pensados para gestionar datos. Estos objetos (tablas, vistas, secuencias, …)  están contenidos en esquemas, los esquemas suelen estar asociados al perfil de un usuario en particular. En Oracle, cuando se crea un usuario, se crea un esquema cuyo nombre es idéntico al  del usuario.
Creación de un Esquema
En Oracle para crear un esquema o usuario se utiliza la sentencia CREATE USER.
La forma más sencilla de uso es:
CREATE USER nombre IDENTIFIED BY contraseña;
Aunque, con frecuencia, se añaden diversas cláusulas. Una sentencia más detallada es:
CREATE USER nombre 
IDENTIFIED BY clave 
DEFAULT TABLESPACE users 
QUOTA 10M ON users
TEMPORARY TABLESPACE temp
QUOTA 5M ON temp 
PASSWORD EXPIRE;

Eliminación de un Esquema
Se realiza mediante:
DROP USER usuario [CASCADE];

La opción CASCADE elimina los objetos del esquema del usuario antes de eliminar al propio usuario. Es obligatorio si el esquema contiene objetos. ́
Modificación de un Esquema
Cada parámetro indicado en la creación del esquema puede modificarse mediante la instrucción ALTER USER, que se utiliza igual que CREATE USER. Ejemplo:
ALTER USER nombre QUOTA UNLIMITED ON users;

3.5. Creación, Modificación y Eliminación de tablas
En este apartado veremos los comandos SQL que se utilizarán para crear y modificar la definición de una tabla, así como para eliminarla de la base de datos.
Creación de Tablas
El nombre de las tablas debe cumplir las siguientes reglas:
Deben comenzar con una letra
No deben tener más de 30 caracteres
Sólo se permiten utilizar letras del alfabeto (inglés), números o el signo de subrayado (también el signo $ y #, pero esos se utilizan de manera especial por lo que no son recomendados)
No puede haber dos tablas con el mismo nombre para el mismo usuario (pueden coincidir los nombres si están en distintos esquemas)
No puede coincidir con el nombre de una palabra reservada de SQL
Para la creación de tablas con SQL se utiliza el comando CREATE TABLE. Este comando tiene una sintaxis más compleja de la que aquí se expone, pero vamos a comenzar por la sintaxis básica. Sintaxis básica de creación de tablas:
CREATE TABLE nombre_tabla (
  columna1  tipo_dato  [ restricciones de columna1 ],
  columna2  tipo_dato  [ restricciones de columna2 ],
  columna3  tipo_dato  [ restricciones de columna3 ],
  ...
  [ restricciones de tabla ]
);
Para realizar las separaciones se utiliza la coma. La última línea, antes del paréntesis de cierre, no lleva coma.
Donde las restricciones de columna tienen la siguiente sintaxis:
CONSTRAINT nombre_restricción {
[NOT] NULL | UNIQUE | PRIMARY KEY | DEFAULT valor | CHECK (condición)
} 


Y las restricciones de tabla tienen la siguiente sintaxis:
CONSTRAINT nombre_restricción {
  PRIMARY KEY (columna1 [,columna2] … ) 
| UNIQUE (columna1 [,columna2] … )
| FOREIGN KEY (columna1 [,columna2] … ) 
    REFERENCES nombre_tabla (columna1 [,columna2] … ) 
    [ON DELETE {CASCADE | SET NULL}]
| CHECK (condición)
}

Obligatoriamente debemos crear una restricción de tabla cuando una misma restricción afecte a varias columnas. Por ejemplo si tenemos una clave primaria compuesta por varios campos, debemos establecer una restricción de tabla, no de columna.
El significado de las distintas opciones que aparecen en la sintaxis CREATE TABLE es:
PRIMARY KEY: establece ese atributo o conjunto de atributos como la clave primaria de la tabla. Esta restricción ya implica las restricciones UNIQUE y NOT NULL.
UNIQUE: impide que se introduzcan valores repetidos para ese atributo o conjunto de atributos. No se puede utilizar junto con PRIMARY KEY. Se utiliza para claves alternativas.
NOT NULL: evita que se introduzcan filas en la tabla con valor NULL para ese atributo.  No se utiliza con PRIMARY KEY.
DEFAULT valor_por_defecto:  permite asignar un valor por defecto al campo que se está definiendo. 
CHECK (condición): permite establecer condiciones que deben cumplir los valores de la tabla que se introducirán en dicha columna.
Si un CHECK se especifica como una restricción de columna, la condición sólo se puede referir a esa columna.
Si el CHECK se especifica como restricción de tabla, la condición puede afectar a todas las columnas de la tabla.
Sólo se permiten condiciones simples, por ejemplo, no está permitido referirse a columnas de otras tablas o formular subconsulas dentro de un CHECK.
Además las funciones SYSDATE y USER no se pueden utilizar dentro de la condición. En principio están permitidas comparaciones simples de atributos y operadores lógicos (AND, OR y NOT).
FOREIGN KEY: define una clave externa de la tabla respecto de otra tabla. Esta restricción especifica una columna o una lista de columnas como clave externa de una tabla referenciada. No se puede definir una restricción de integridad referencial que se refiere a una tabla antes de que dicha tabla haya sido creada. Es importante resaltar que una clave externa debe referenciar a una clave primaria completa de la tabla padre, y nunca a un subconjunto de los atributos que forman esta clave primaria.
ON DELETE CASCADE: especifica que se mantenga automáticamente la integridad referencial borrando los valores de la llave externa correspondientes a un valor borrado de la tabla referenciada (tabla padre). Si se omite esta opción no se permitirá borrar valores de una tabla que sean referenciados como llave externa en otras tablas.
ON DELETE SET NULL: especifica que se ponga a NULL los valores de la llave externa correspondientes a un valor borrado de la tabla referenciada (tabla padre).
En la definición de una tabla pueden aparecer varias cláusulas FOREIGN KEY, tantas como llaves externas tenga la tabla, sin embargo sólo puede existir una llave primaria, si bien esta llave primaria puede estar formada por varios atributos.
La utilización de la cláusula CONSTRAINT nombre_restricción establece un nombre determinado para la restricción de integridad, lo cual permite buscar en el Diccionario de Datos de la base de datos con posterioridad y fácilmente las restricciones introducidas para una determinada tabla.
Ejemplos:
CREATE TABLE usuarios (
  id  	NUMBER  		PRIMARY KEY,
  dni 	CHAR(9) 		UNIQUE,
  nombre	VARCHAR2(50) 	NOT NULL,
  edad 	NUMBER 		CHECK (edad>=0 and edad<120)
);

En el caso anterior no hemos asignado nombre a las restricciones, así que Oracle le asignará un nombre de la forma SYS_Cn, donde n es un número. Esta forma no es recomendable puesto que si deseamos modificar posteriormente el diseño de la tabla nos será muy difícil gestionar las restricciones.
Otra forma más adecuada es dando nombre a las restricciones:
CREATE TABLE usuarios (
  id  	NUMBER  		CONSTRAINT usu_id_pk  PRIMARY KEY,
  dni 	CHAR(9) 		CONSTRAINT usu_dni_uq UNIQUE,
  nombre	VARCHAR2(50) 	CONSTRAINT usu_nom_nn NOT NULL,
  edad 	NUMBER 		CONSTRAINT usu_edad_ck 
							CHECK (edad>=0 and edad<120)
);

La vista USER_TABLES contiene una lista de las tablas del usuario actual (o del esquema actual). Así para sacar la lista de tablas del usuario actual, se haría:
SELECT * FROM USER_TABLES;
Esta vista obtiene numerosas columnas, en concreto la columna TABLES_NAME muestra el nombre de cada tabla.
La vista ALL_TABLES mostrará una lista de todas las tablas de la base de datos (no solo del usuario actual), aunque oculta las que el usuario no tiene derecho a ver.
Finalmente la vista DBA_TABLES es una tabla que contiene absolutamente todas las tablas del sistema;  esto es accesible sólo por el usuario administrador (DBA).
Nota: El comando DESCRIBE, permite obtener la estructura de una tabla.
Ejemplo:
DESCRIBE COCHES;
Y aparecerán los campos de la tabla COCHES

Criterios de notación para los nombres de restricciones
Para la Restricción de Clave principal (solo una en cada tabla):
CONSTRAINT tabla_campo_pk PRIMARY KEY ...

Para Restricciones de Clave foránea (puede haber varias en cada tabla):
CONSTRAINT tabla_campo_fk1 FOREING KEY ...
CONSTRAINT tabla_campo_fk2 FOREING KEY ...
CONSTRAINT tabla_campo_fk3 FOREING KEY ...
...

Para Restricciones de tipo CHECK (puede haber varias en cada tabla)
CONSTRAINT tabla_campo_ck1 CHECK ...
CONSTRAINT tabla_campo_ck2 CHECK ...
...

Para Restricciones de tipo UNIQUE (puede haber varias en cada tabla)
CONSTRAINT tabla_campo_uq1 UNIQUE ...
CONSTRAINT tabla_campo_uq2 UNIQUE ...
...

Ejemplo:
CREATE TABLE COCHES (
  matricula	VARCHAR2(8),
  marca		VARCHAR2(15) NOT NULL,
  color		VARCHAR2(15),
  codTaller	VARCHAR2(10),
  codProp		VARCHAR2(10),
  CONSTRAINT coches_mat_pk PRIMARY KEY (matricula),
  CONSTRAINT coches_codtaller_fk1 FOREIGN KEY (codTaller) 
      REFERENCES TALLER(codTaller),
  CONSTRAINT coches_codprop_fk2 FOREIGN KEY (codProp) 
      REFERENCES PROPIETARIO(codProp),
  CONSTRAINT coches_color_ck1 
      CHECK (color IN ('ROJO','AZUL',BLANCO','GRIS','VERDE','NEGRO'))
);

Se puede utilizar la vista USER_CONSTRAINTS del diccionario de datos para identificar las restricciones colocadas por el usuario. La vista ALL_CONSTRAINTS permite mostrar las restricciones de todos los usuarios, pero sólo está permitida a los administradores). Además, la vista USER_CONS_COLUMNS, nos muestra información sobre las columnas que participan en una restricción.  
Eliminación de Tablas
La sentencia en SQL para eliminar tablas es DROP TABLE. Su sintaxis es:
DROP TABLE nombre_tabla
[ CASCADE CONSTRAINTS ];

La opción CASCADE CONSTRAINTS permite eliminar una tabla que contenga atributos referenciados por otras tablas, eliminando también todas esas referencias.
IMPORTANTE:
Si la clave principal de la tabla es una clave foránea en otra tabla y no utiliza la opción CASCADE CONSTRAINTS, entonces no se podrá eliminar la tabla.
El borrado de una tabla es irreversible y no hay ninguna petición de confirmación, por lo que conviene ser muy cuidadoso con esta operación.
Al borrar una tabla se borran todos los datos que contiene.
Ejemplos:	
DROP TABLE COCHES;

Se eliminará la tabla COCHES, siempre que su clave principal no sea clave foránea de ninguna tabla de la BD.
DROP TABLE COCHES
CASCADE CONSTRAINTS;

Se eliminará la tabla COCHES aunque su clave principal sea clave foránea de alguna tabla de la BD. Automáticamente se borrará la restricción de clave foránea asociada.
Modificación de Tablas
Cambiar de nombre una tabla
La orden RENAME permite el cambio de nombre de cualquier objeto. Sintaxis:
RENAME nombre  TO nombre_nuevo;

Ejemplo:
RENAME COCHES TO AUTOMOVILES;

Cambia el nombre de la tabla COCHES y a partir de ese momento se llamará AUTOMOVILES
Borrar el contenido de una tabla
La orden TRUNCATE TABLE seguida del nombre de una tabla, hace que se elimine el contenido de la tabla, pero no la tabla en sí. Incluso borra del archivo de datos el espacio ocupado por la tabla. (Esta orden no puede anularse con un ROLLBACK)
Ejemplo:
TRUNCATE TABLE AUTOMOVILES;

Borra los datos de la tabla AUTOMOVILES.
Modificar una tabla
La cláusula ALTER TABLE permite hacer cambios en la estructura de una tabla: añadir columna, borrar columna, modificar columna.
Añadir Columnas
ALTER TABLE nombre ADD ( 
  columna1  tipo  [ restricciones ][,
  columna2  tipo  [ restricciones ]
  ... ]
);

Permite añadir nuevas columnas a la tabla. Se deben indicar su tipo de datos y sus propiedades si es necesario (al estilo de CREATE TABLE). Las nuevas columnas se añaden al final, no se puede indicar otra posición.
Ejemplos:
Añadimos la columna “fechaMatric” a la tabla VEHÍCULOS:
ALTER TABLE VEHICULOS ADD ( fechaMatric DATE );

Añadimos las columnas “fechaMatric” y “tipoFaros” a la tabla VEHÍCULOS:
ALTER TABLE VEHICULOS ADD (
  fechaMatric		DATE,
  tipoFaros		VARCHAR2(20) NOT NULL
);

Borrar Columnas
ALTER TABLE nombre_tabla DROP (nombre_columna, nombre_columna2, ...);

Elimina la columna indicada de manera irreversible e incluyendo los datos que contenía. No se pueden eliminar todas las columnas, para la última columna habrá que usar DROP TABLE.
Ejemplo:
ALTER TABLE VEHICULOS DROP (tipoFaros);

Borra la columna “tipoFaros” de la tabla VEHICULOS y los datos que contuviera de manera irreversible.
Modificar columnas
Permite cambiar el tipo de datos y propiedades de una determinada columna. Sintaxis:
ALTER TABLE nombre_tabla MODIFY (
  columna1  tipo_dato  [ restricciones de columna1 ][,
  columna2  tipo_dato  [ restricciones de columna2 ]
  ... ]
);

Ejemplo:
ALTER TABLE AUTOMOVILES
MODIFY (color VARCHAR2(20) NOT NULL, codTaller VARCHAR2(15));

Modifica dos campos o columnas de la tabla AUTOMOVILES cambiando su tamaño y además en Color, añadiendo la condición de que sea no nulo.
Los cambios que se permiten son:
Incrementar precisión o anchura de los tipos de datos
Sólo se puede reducir la anchura máxima de un campo si esa columna posee nulos en todos los registros, o no hay registros.
Se puede pasar de CHAR a VARCHAR2 y viceversa (si no se modifica la anchura).
Se puede pasar de DATE a TIMESTAMP y viceversa.
Añadir Comentarios a la Tabla
Se le pueden poner comentarios a las tablas y las columnas. Un comentario es un texto descriptivo utilizado para documentar la tabla. Sintaxis:
COMMENT ON {TABLE nombre_tabla | COLUMN nombre_tabla.columna } 
IS 'Comentario';

Para mostrar los comentarios puestos se realizan consultas al diccionario de datos mediante la instrucción SELECT usando las siguientes vistas:
USER_TAB_COMMENTS. Comentarios de las tablas del usuario actual.
USER_COL_COMMENTS. Comentarios de las columnas del usuario actual.
ALL_TAB_COMMENTS. Comentarios de las tablas de todos los usuarios (sólo administradores)
ALL_COL_COMMENTS. Comentarios de las columnas de todos los usuarios (sólo administradores).
Añadir o Modificar Restricciones
Sabemos que una restricción es una condición de obligado cumplimiento para una o más columnas de la tabla. A cada restricción se le pone un nombre, en el caso de no poner un nombre (en las que eso sea posible) entonces el propio Oracle le coloca el nombre que es un nemotécnico con el nombre de tabla, columna y tipo de restricción.
Hemos visto que se pueden añadir al crear la tabla, o bien, podemos hacerlo mediante modificación posterior de la tabla. También se puede modificar una restricción creada. Su sintaxis general es:
ALTER TABLE nombre_tabla { ADD | MODIFY} ( 
  CONSTRAINT nombre_restricción1   tipo_restricción  (columnas) [,
  CONSTRAINT nombre_restricción2   tipo_restricción  (columnas) 
  ... ]
);
Borrar Restricciones
Su sintaxis es la siguiente:
ALTER TABLE nombre_tabla
DROP { 
  PRIMARY KEY 
| UNIQUE  (columnas) 
| CONSTRAINT nombre_restricción [ CASCADE ]
}

La opción PRIMARY KEY elimina una clave principal (también quitará el índice UNIQUE sobre las campos que formaban la clave. UNIQUE elimina índices únicos. La opción CONSTRAINT elimina la restricción indicada.
La opción CASCADE hace que se eliminen en cascada las restricciones de integridad que dependen de la restricción eliminada. Por ejemplo en:
CREATE TABLE CURSOS (
  codCurso	CHAR(7) CONSTRAINT cursos_pk PRIMARY KEY,
  fechaIni	DATE,
  fechaFin	DATE,
  titulo  	VARCHAR2(60),
  codSigCurso	CHAR(7),
  CONSTRAINT cursos_ck1 CHECK (fechaFin > FechaIni),
  CONSTRAINT cursos_fk1 FOREIGN KEY (codSigCurso) 
      REFERENCES CURSOS ON DELETE SET NULL
);

Tras esa definición la siguiente instrucción produce error:
ALTER TABLE CURSOS DROP PRIMARY KEY;

ORA-02273: a esta clave única/primaria hacen referencia algunas claves ajenas

Para ello habría que utilizar esta instrucción:
ALTER TABLE CURSOS DROP PRIMARY KEY CASCADE;

Esa instrucción elimina la clave secundaria antes de eliminar la principal.
También produciría error esta instrucción:
ALTER TABLE CURSOS DROP (fechaIni);

ERROR en línea 1:
ORA-12991: se hace referencia a la columna en una restricción de multicolumna

El error se debe a que no es posible borrar una columna que forma parte de la definición de una restricción. La solución es utilizar CASCADE CONSTRAINTS para eliminar las restricciones en las que la columna a borrar estaba implicada:
ALTER TABLE CURSOS DROP COLUMN (fechaIni) CASCADE CONSTRAINTS;

Esta instrucción elimina la restricción de tipo CHECK en la que aparecía la fecha_inicio y así se puede eliminar la columna.
Desactivar Restricciones
A veces conviene temporalmente desactivar una restricción para saltarse las reglas que impone. La sintaxis es:
ALTER TABLE nombre_tabla DISABLE CONSTRAINT restricción [ CASCADE ];

La opción CASCADE hace que se desactiven también las restricciones dependientes de la que se desactivó.
Activar Restricciones
Anula la desactivación. Formato:
ALTER TABLE nombre_tabla ENABLE CONSTRAINT restricción [ CASCADE ];

Sólo se permite volver a activar si los valores de la tabla cumplen la restricción que se activa.
Si hubo desactivado en cascada, habrá que activar cada restricción individualmente.
Cambiar de nombre la Restricciones
Para hacerlo se utiliza este comando:
ALTER TABLE nombre_tabla 
RENAME CONSTRAINT nombre_restricción TO nombre_restricción_nuevo;

3.6. Creación, Modificación y Eliminación de vistas
Una vista no es más que una consulta almacenada a fin de utilizarla tantas veces como se desee. Una vista no contiene datos sino la instrucción SELECT necesaria para crear la vista, eso asegura que los datos sean coherentes al utilizar los datos almacenados en las tablas.
Las vistas se emplean para:
Realizar consultas complejas más fácilmente
Proporcionar tablas con datos completos
Utilizar visiones especiales de los datos
Hay dos tipos de vistas:
Simples. Las forman una sola tabla y no contienen funciones de agrupación. Su ventaja es que permiten siempre realizar operaciones DML sobre ellas.
Complejas. Obtienen datos de varias tablas, pueden utilizar funciones de agrupación. No siempre permiten operaciones DML.
Creación de Vistas
Sintaxis:
CREATE [ OR REPLACE ] VIEW nombre_vista [ (alias1 [, alias2] ...) ]
AS SELECT ...

OR REPLACE. Especifique OR REPLACE para volver a crear la vista si ya existe. Puede utilizar esta cláusula para cambiar la definición de una vista existente sin eliminar, volver a crear y volver a conceder los privilegios de objeto previamente concedidos.
alias. Lista de alias que se establecen para las columnas devueltas por la consulta SELECT en la que se basa esta vista. El número de alias debe coincidir con el número de columnas devueltas por SELECT. La sentencia SELECT la trataremos en profundidad en el tema siguiente.
Lo bueno de las vistas es que tras su creación se utilizan como si fueran una tabla.
La vista USER_VIEWS del diccionario de datos permite mostrar una lista de todas las vistas que posee el usuario actual. La columna TEXT de esa vista contiene la sentencia SQL que se utilizó para crear la vista (sentencia que es ejecutada cada vez que se invoca a la vista). 
Eliminación de Vistas
Se utiliza el comando DROP VIEW:
DROP VIEW nombre_vista;

Modificación de Vistas
Sólo se utiliza la instrucción ALTER VIEW para recompilar explícitamente una vista que no es válida. Si desea cambiar la definición de una vista se debe ejecutar la sentencia CREATE OR REPLACE nombre_vista.
La sentencia ALTER VIEW le permite localizar errores de recompilación antes de la ejecución. Para asegurarse de que la alteración no afecta a la vista u otros objetos que dependen de ella, puede volver a compilar explícitamente una vista después de alterar una de sus tablas base.
Para utilizar la instrucción ALTER VIEW, la vista debe estar en su esquema, o debe tener el privilegio del sistema ALTER ANY TABLE.
3.7. Creación, Modificación y Eliminación de índices
Los índices son objetos que forman parte del esquema que hacen que las bases de datos aceleren las operaciones de consulta y ordenación sobre los campos a los que el índice hace referencia.
Se almacenan aparte de la tabla a la que hace referencia, lo que permite crearles y borrarles en cualquier momento.
Lo que realizan es una lista ordenada por la que Oracle puede acceder para facilitar la búsqueda de los datos. cada vez que se añade un nuevo registro, los índices involucrados se actualizan a fin de que su información esté al día. De ahí que cuantos más índices haya, más le cuesta a Oracle añadir registros, pero más rápidas se realizan las instrucciones de consulta.
La mayoría de los índices se crean de manera implícita, como consecuencia de las restricciones PRIMARY KEY, UNIQUE y FOREIGN KEY. Estos son índices obligatorios, por los que los crea el propio SGBD.
Creación de Índices
Aparte de los índices obligatorios comentados anteriormente, se pueden crear índices de forma explícita. Éstos se crean para aquellos campos sobre los cuales se realizarán búsquedas e instrucciones de ordenación frecuente.
Sintaxis:
CREATE INDEX nombre
ON tabla (columna1 [,columna2] ...)

Ejemplo:
CREATE INDEX nombre_completo
ON clientes (apellido1, apellido2, nombre);

El ejemplo crea un índice para los campos apellido1, apellido2 y nombre. Esto no es lo mismo que crear un índice para cada campo, este índice es efectivo cuando se buscan u ordenan clientes usando los tres campos (apellido1, apellido2, nombre) a la vez.
Se aconseja crear índices en campos que: 
Contengan una gran cantidad de valores
Contengan una gran cantidad de nulos
Sean parte habitual de cláusulas WHERE, GROUP BY u ORDER BY
Sean parte de listados de consultas de grandes tablas sobre las que casi siempre se muestran como mucho un 4% de su contenido.
No se aconseja en campos que:
Pertenezcan a tablas pequeñas
No se usen a menudo en las consultas
Pertenecen a tablas cuyas consultas muestran menos de un 4% del total de registros
Pertenecen a tablas que se actualizan frecuentemente
Se utilizan en expresiones
Los índices se pueden crear utilizando expresiones complejas:
CREATE INDEX nombre_complejo
ON clientes (UPPER(nombre));

Esos índices tienen sentido si en las consultas se utilizan exactamente esas expresiones.
Para ver la lista de índices en Oracle se utiliza la vista USER_INDEXES. Mientras que la
vista USER_IND_COLUMNS muestra la lista de columnas que son utilizadas por índices.
Eliminación de Índices
La instrucción DROP INDEX seguida del nombre del índice permite eliminar el índice en cuestión.
DROP INDEX nombre_indice;

3.8. Creación, Modificación y Eliminación de secuencias

Una secuencia sirve para generar automáticamente números distintos. Se utilizan para generar valores para campos que se utilizan como clave forzada (claves cuyo valor no interesa, sólo sirven para identificar los registros de una tabla). Es decir se utilizan en los identificadores de las tablas (campos que comienzan con la palabra id), siempre y cuando no importe qué número se asigna a cada fila. 
Es una rutina interna de la base de datos la que realiza la función de generar un número distinto cada vez. Las secuencias se almacenan independientemente de la tabla, por lo que la misma secuencia se puede utilizar para diversas tablas.
Creación de Secuencias
Sintaxis:
CREATE SEQUENCE secuencia
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n|NOMAXVALUE}]
[{MINVALUE n|NOMINVALUE}]
[{CYCLE|NOCYCLE}];

Donde:
secuencia. Es el nombre que se le da al objeto de secuencia
INCREMENT BY. Indica cuánto se incrementa la secuencia cada vez que se usa. Por defecto se incrementa de uno en uno
START WITH. Indica el valor inicial de la secuencia (por defecto 1)
MAXVALUE. Máximo valor que puede tomar la secuencia. Si no se toma NOMAXVALUE que permite llegar hasta 1027
MINVALUE. Mínimo valor que puede tomar la secuencia. Si el incremento es negativo y no se toma NOMINVALUE permite llegar hasta -1026
CYCLE. Hace que la secuencia vuelva a empezar si se ha llegado al máximo valor.
Ejemplo:
CREATE SEQUENCE numeroPlanta
INCREMENT 100
STARTS WITH 100
MAXVALUE 2000;

En el diccionario de datos de Oracle tenemos la vista USER_SEQUENCES que muestra la lista de secuencias actuales. La columna LAST_NUMBER muestra cual será el siguiente número de secuencia disponible uso de la secuencia
Los métodos NEXTVAL y CURRVAL se utilizan para obtener el siguiente número y el valor actual de la secuencia respectivamente. Ejemplo de uso (Oracle):
SELECT numeroPlanta.NEXTVAL FROM DUAL;

En SQL estándar:
SELECT nextval('numeroPlanta');
Eso muestra en pantalla el siguiente valor de la secuencia. Realmente NEXTVAL incrementa la secuencia y devuelve el valor actual. CURRVAL devuelve el valor de la secuencia, pero sin incrementar la misma.
Ambas funciones pueden ser utilizadas en:
Una consulta SELECT que no lleve DISTINCT, ni grupos, ni sea parte de una vista, ni sea subconsulta de otro SELECT, UPDATE o DELETE
Una subconsulta SELECT en una instrucción INSERT
La cláusula VALUES de la instrucción INSERT
La cláusula SET de la instrucción UPDATE
No se puede utilizar (y siempre hay tentaciones para ello) como valor para la cláusula DEFAULT de un campo de tabla.

Su uso más habitual es como apoyo al comando INSERT (en Oracle):
INSERT INTO plantas(num, uso)
VALUES( numeroPlanta.NEXTVAL, 'Suites' );

Eliminación de Secuencias
Lo hace el comando DROP SEQUENCE seguido del nombre de la secuencia a borrar.
DROP SEQUENCE nombre_secuencia;

Modificación de Secuencias
Se pueden modificar las secuencias, pero la modificación sólo puede afectar a los futuros valores de la secuencia, no a los ya utilizados. Sintaxis:
ALTER SEQUENCE secuencia
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n|NOMAXVALUE}]
[{MINVALUE n|NOMINVALUE}]
[{CYCLE|NOCYCLE}]

3.9. Creación, Modificación y Eliminación de sinónimos
En Oracle, un sinónimo es un nombre que se asigna a un objeto cualquiera.
Normalmente es un nombre menos descriptivo que el original a fin de facilitar la escritura del nombre del objeto en diversas expresiones.
Creación de Sinónimos
Sintaxis:
CREATE [PUBLIC] SYNONYM nombre FOR objeto;

objeto es el objeto al que se referirá el sinónimo. La cláusula PUBLIC hace que el sinónimo esté disponible para cualquier usuario (sólo se permite utilizar si disponemos de privilegios administrativos).
La vista USER_SYNONYMS permite observar la lista de sinónimos del usuario, la vista ALL_SYNONYMS permite mostrar la lista completa de sinónimos de todos los esquemas a los que tenemos acceso.
Eliminación de Sinónimos
DROP SYNONYM nombre;

Modificación de Sinónimos
Existe una sentencia para la modificación de sinónimos, aunque su uso es escaso. Se trata de la sentencia ALTER SYNONYM.
ALTER [PUBLIC] SYNONYM nombre [{COMPILE|EDITIONABLE|NONEDITIONABLE}];



4. ACTIVIDADES
4.1. Cuestiones (I)
4.1.1. Nombra los distintos tipos de instrucciones DDL que puede haber, distinguiendo el tipo de objeto que se puede crear, borrar o modificar.
4.1.2. Pon un ejemplo de un tipo de dato numérico, otro alfanumérico y otro fecha/hora.
4.1.3. ¿Qué diferencia hay entre VARCHAR y CHAR?
4.1.4. Realiza un esquema resumen de las cláusulas SQL utilizadas en la modificación de tablas. 
4.1.5. Realiza la instalación de Oracle Database 11g Express Edition sobre Windows.
4.1.6. Una vez instalado dicho Sistema Gestor de Bases de Datos Relacional (RDBMS), lo iniciaremos pulsando en “Start Database”. 









4.1.7. Y después iniciamos la interfaz web APEX  (APplication EXpress) para trabajar con dicho SGBD. Para ello pulsamos sobre “Get Started”. 
Y se abrirá el navegador web con esta URL: http://127.0.0.1:8080/apex/f?p=4950.
4.1.8. A continuación configuraremos el Terminal CMD. En Windows, ejecuta el programa CMD.EXE y realiza la configuración siguiente:
- Pulsa con el botón secundario del ratón en la barra de título y luego haz clic en Propiedades
- Configura la Fuente, la Disposición y los Colores como se muestra más abajo.








- Pulsa OK.
4.1.9. Cambia la “Página de Código” a Windows-1252.
Para que se muestren correctamente las tildes y ciertos caracteres como la letra Ñ y similares deberemos ejecutar el comando CHCP 1252 (CHange CodePage). Esto cambia la CP850 por la CP1252 que soporta el conjunto de caracteres ISO 8859, necesarios por los motivos indicados anteriormente. Esta configuración no se queda guardada, por lo que deberemos ejecutarla cada vez que iniciemos el terminal.

4.1.10. Ya podemos lanzar el cliente SQL*Plus como aparece en la imagen. Lo haremos como SYSDBA (permisos de DataBase Administrator).

Para comprobar que SQL*Plus y la base de datos Oracle están funcionando bien, realizaremos lo siguiente. Con Oracle se instala un esquema (usuario) de ejemplo llamado HR (Human Resources). Por defecto está bloqueado. Los desbloqueamos. Le concedemos roles CONNECT y RESOURCE y asignamos una contraseña. 
sqlplus / as sysdba
...
SQL> alter user hr account unlock;
User altered.
SQL> grant connect,resource to hr identified by “HR”;
Grant succeeded.
4.1.11.  Ahora conectamos con usuario/contraseña anterior y vemos las tablas que tiene dicho esquema (usuario).

4.1.12. Insertamos algunos datos con tildes y caracteres tales como la letra Ñ.

4.1.13. Comprobamos ahora la interfaz web APEX. Pulsamos en Application Express. Luego introducimos la clave del usuario SYSTEM que establecimos durante la instalación.
Cuidado. En las contraseñas se distingue entre mayúsculas y minúsculas.




4.1.14. Una vez dentro nos creamos un espacio de trabajo (Workspace) como aparece en la siguiente imagen. Luego pulsaremos “Create Workspace”.
Como usuario y contraseña de APEX, por motivos de comodidad, utilizaremos siempre los siguientes: 
- Username: YO
- Password: YO
4.1.15. Ya podemos trabajar con el esquema HR en APEX. Para ello pulsamos en “Already have an acount? Login Here”


4.1.16. Después pulsamos sobre “SQL WorkShop” y “SQL Commands”. Realizamos la consulta “SELECT * FROM COUNTRIES;” para comprobar que aparece el registro introducido anteriormente con las tildes correctas.

4.2. Cuestiones  (II)
4.2.1. Desde SQLPlus crea un esquema (usuario) llamado TIENDAS con contraseña TIENDAS. Concédele los roles CONNECT y RESOURCE. Accede con dicho usuario/contraseña.
sqlplus / as sysdba
...
SQL> create user TIENDAS identified by “TIENDAS”;
User altered.
SQL> grant connect,resource to TIENDAS;
Grant succeeded.
SQL> connect TIENDAS/TIENDAS
Connected.
4.2.2. Crear las siguientes tablas de acuerdo con las restricciones que se mencionan:
Tabla TIENDAS
Columna
Tipo de dato
NIF
VARCHAR2(10)
NOMBRE
VARCHAR2(20)
DIRECCION
VARCHAR2(20)
POBLACION
VARCHAR2(20)
PROVINCIA
VARCHAR2(20)
CODPOSTAL
NUMBER(5)
Crear tabla sin restricciones. Después añadir las siguientes restricciones:
La clave primaria es NIF.
PROVINCIA ha de almacenarse en mayúscula.
Cambia la longitud de NOMBRE a 30 caracteres y no nulo.

Tabla FABRICANTES
Columna
Tipo de dato
COD_FABRICANTE
NUMBER(3)
NOMBRE
VARCHAR2(15)
PAIS
VARCHAR2(15)
Restricciones:
La clave primaria es COD_FABRICANTE.
Las columnas NOMBRE y PAIS han de almacenarse en mayúscula.

Tabla ARTICULOS
Columna
Tipo de dato
ARTICULO
VARCHAR2(20)
COD_FABRICANTE
NUMBER(3)
PESO
NUMBER(3)
CATEGORIA
VARCHAR2(10)
PRECIO_VENTA
NUMBER(6,2)
PRECIO_COSTO
NUMBER(6,2)
EXISTENCIAS
NUMBER(5)
Restricciones:
La clave primaria está formada por las columnas:  ARTICULO, COD_FABRICANTE, PESO y CATEGORIA.
COD_FABRICANTE es clave ajena que referencia a la tabla FABRICANTES.
PRECIO_VENTA, PRECIO_COSTO y PESO han de ser > 0.
CATEGORIA ha de ser ‘Primera’, ‘Segunda’ o ‘Tercera’.

Tabla VENTAS
Columna
Tipo de dato
NIF
VARCHAR2(10)
ARTICULO
VARCHAR2(20)
COD_FABRICANTE
NUMBER(3)
PESO
NUMBER(3)
CATEGORIA
VARCHAR2(10)
FECHA_VENTA
DATE
UNIDADES_VENDIDAS
NUMBER(4)
Restricciones:
La clave primaria está formada por las columnas:  NIF, ARTICULO, COD_FABRICANTE, PESO, CATEGORIA y FECHA_VENTA.
NIF es clave ajena que referencia a la tabla TIENDAS.
ARTICULO, COD_FABRICANTE, PESO y CATEGORIA es clave ajena que referencia a la tablas ARTICULOS.
UNIDADES_VENDIDAS han de ser > 0.
CATEGORIA  ha de ser ‘Primera’, ‘Segunda’ o ‘Tercera’. 

Tabla PEDIDOS
Columna
Tipo de dato
NIF
VARCHAR2(10)
ARTICULO
VARCHAR2(20)
COD_FABRICANTE
NUMBER(3)
PESO
NUMBER(3)
CATEGORIA
VARCHAR2(10)
FECHA_PEDIDO
DATE
UNIDADES_PEDIDAS
NUMBER(4)
EXISTENCIAS
NUMBER(5)
Restricciones:
La clave primaria está formada por las columnas:  NIF, ARTICULO, COD_FABRICANTE, PESO, CATEGORIA y FECHA_PEDIDO.
NIF es clave ajena que referencia a la tabla TIENDAS.
ARTICULO, COD_FABRICANTE, PESO y CATEGORIA es clave ajena que referencia a la tablas ARTICULOS.
UNIDADES_PEDIDAS han de ser > 0.
CATEGORIA ha de ser ‘Primera’, ‘Segunda’ o ‘Tercera’. 
4.2.3. Añadir una restricción a la tabla TIENDAS para que el NOMBRE de la tienda sea de tipo título (InitCap).
4.2.4. Visualizar las constraints definidas para las tablas anteriores.
4.2.5. Modificar las columnas de las tablas PEDIDOS y VENTAS para que las UNIDADES_VENDIDAS y las UNIDADES_PEDIDAS puedan almacenar cantidades numéricas de 6 dígitos.
4.2.6. Impedir que se den de alta más tiendas en la provincia de 'TOLEDO'.
4.2.7. Añadir a las tablas PEDIDOS y VENTAS una nueva columna para que almacenen el PVP del artículo.
4.2.8. Crear una vista que se llame CONSERJES que contenga el nombre del centro y el nombre de sus conserjes.
4.2.9. Crear un sinónimo llamado CONSER asociado a la vista creada antes.
4.2.10. Añadir a la tabla PROFESORES una columna llamada COD_ASIG con dos posiciones numéricas.
4.2.11. Crear la tabla TASIG con las siguientes columnas: COD_ASIG numérico, 2 posiciones y NOM_ASIG cadena de 20 caracteres.
4.2.12. Añadir la restricción de clave primaria a la columna COD_ASIG de la tabla TASIG.
4.2.13. Añadir la restricción de clave ajena a la columna COD_ASIG de la tabla PROFESORES.
4.2.14. Cambiar de nombre la tabla PROFESORES y llamarla PROFES.
4.2.15. Borrar la tabla TASIG.
4.2.16. Devolver la tabla PROFESORES a su situación inicial.




4.3. Cuestiones  (III)
REPASO Y REFUERZO
4.3.1. (RESUELTA) Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E01, contraseña “E01”.

sqlplus / as sysdba
...
SQL> create user E01 identified by “E01”;
User created.
SQL> grant connect,resource to E01;
Grant succeeded.
SQL> connect E01/E01;
Connected.

Observa el orden en el que creamos las tablas. Las tablas que contienen claves foráneas deben crearse después de crear las tablas que contienen las claves primarias a las que apuntan. 
CREATE TABLE ALUMNO 
(
  NUMMATRICULA    NUMBER(3) PRIMARY KEY,
  NOMBRE          VARCHAR2(50),
  FECHANACIMIENTO DATE,
  TELEFONO        CHAR(9) 
);


CREATE TABLE PROFESOR 
(
  IDPROFESOR   NUMBER(2) PRIMARY KEY,
  NIF_P        CHAR(9) UNIQUE,
  NOMBRE       VARCHAR2(50),
  ESPECIALIDAD VARCHAR2(50),
  TELEFONO     CHAR(9) 
);


CREATE TABLE ASIGNATURA 
(
  CODASIGNATURA  CHAR(6) PRIMARY KEY,
  NOMBRE         VARCHAR2(30),
  IDPROFESOR     NUMBER(2) REFERENCES PROFESOR(IDPROFESOR)
);


CREATE TABLE RECIBE 
(
  NUMMATRICULA  NUMBER(3) REFERENCES ALUMNO(NUMMATRICULA),
  CODASIGNATURA CHAR(6)   REFERENCES ASIGNATURA(CODASIGNATURA),
  CURSOESCOLAR  CHAR(9),
  PRIMARY KEY (NUMMATRICULA, CODASIGNATURA, CURSOESCOLAR)
);

Otra forma de crear la tabla RECIBE es así:
CREATE TABLE RECIBE 
(
  NUMMATRICULA  NUMBER(3),
  CODASIGNATURA CHAR(6),
  CURSOESCOLAR  CHAR(9),
  PRIMARY KEY (NUMMATRICULA, CODASIGNATURA, CURSOESCOLAR),
  FOREIGN KEY (NUMMATRICULA)  REFERENCES ALUMNOS(NUMMATRICULA),
  FOREIGN KEY (CODASIGNATURA) REFERENCES ASIGNATURA(CODASIGNATURA)
);

4.3.2. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E02, contraseña “E02”.

sqlplus / as sysdba
...
SQL> create user E02 identified by “E02”;
User created.
SQL> grant connect,resource to E02;
Grant succeeded.
SQL> connect E02/E02;
Connected.

4.3.3. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E03, contraseña “E03”.





sqlplus / as sysdba
...
SQL> create user E03 identified by “E03”;
User created.
SQL> grant connect,resource to E03;
Grant succeeded.
SQL> connect E03/E03;
Connected.





4.3.4. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E04, contraseña “E04”.











sqlplus / as sysdba
...
SQL> create user E04 identified by “E04”;
User created.
SQL> grant connect,resource to E04;
Grant succeeded.
SQL> connect E04/E04;
Connected.
4.3.5. (RESUELTA) Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E05, contraseña “E05”.  No pueden ser nulos los siguientes campos: Nombre de Cliente, Marca y Modelo de Coche. Crear una secuencia para el Número de Reserva.













sqlplus / as sysdba
...
SQL> create user E05 identified by “E05”;
User created.
SQL> grant connect,resource to E05;
Grant succeeded.
SQL> connect E05/E05;
Connected.

CREATE TABLE CLIENTE
(
  COD_CLIENTE CHAR(4)      CONSTRAINT PK_CLIENTE PRIMARY KEY,
  DNI         CHAR(9)      CONSTRAINT UQ_DNI UNIQUE,
  NOMBRE      VARCHAR2(40) CONSTRAINT NN_NOMBRE NOT NULL,
  DIRECCION   VARCHAR2(40),
  TELEFONO    CHAR(9)
);


CREATE TABLE COCHE
(
  MATRICULA  CHAR(7)      CONSTRAINT PK_COCHE PRIMARY KEY,
  MARCA      VARCHAR2(20) CONSTRAINT NN_MARCA NOT NULL,
  MODELO     VARCHAR2(20) CONSTRAINT NN_MODELO NOT NULL,
  COLOR      VARCHAR2(20),
  PRECIOHORA NUMBER
);


CREATE TABLE RESERVA
(
  NUMERO      NUMBER(4) CONSTRAINT PK_RESERVA PRIMARY KEY,
  FECHAINICIO DATE,
  FECHAFIN    DATE,
  PRECIOTOTAL NUMBER,
  CODCLIENTE  CHAR(4)   CONSTRAINT FK_RESERVA 
    REFERENCES CLIENTE(COD_CLIENTE)
);


CREATE SEQUENCE NUMERORESERVA;


CREATE TABLE AVALA
(
   AVALADO  CHAR(4),
   AVALADOR CHAR(4),
   CONSTRAINT PK_AVALA PRIMARY KEY (AVALADO),
   CONSTRAINT FK1_AVALA FOREIGN KEY(AVALADO) 
     REFERENCES CLIENTE(COD_CLIENTE),
   CONSTRAINT FK2_AVALA FOREIGN KEY(AVALADOR)
     REFERENCES CLIENTE(COD_CLIENTE)
);


CREATE TABLE INCLUYE
(
  NUMERO    NUMBER(4),
  MATRICULA CHAR(7),
  LITROSGAS NUMBER,
  CONSTRAINT PK_INCLUYE PRIMARY KEY (NUMERO, MATRICULA)
  CONSTRAINT FK1_INCLUYE FOREIGN KEY (NUMERO) 
    REFERENCES RESERVA(NUMERO),
  CONSTRAINT FK2_INCLUYE FOREIGN KEY (MATRICULA) 
    REFERENCES COCHE(MATRICULA)
);



Otra forma de crear las tablas AVALA e INCLUYE
CREATE TABLE AVALA
(
  AVALADO  CHAR(4) CONSTRAINT PK_AVALA PRIMARY KEY,
  AVALADOR CHAR(4),
  CONSTRAINT FK1_AVALA FOREIGN KEY(AVALADO) 
    REFERENCES CLIENTE(COD_CLIENTE),
  CONSTRAINT FK2_AVALA FOREIGN KEY(AVALADOR) 
    REFERENCES CLIENTE(COD_CLIENTE)
);


CREATE TABLE INCLUYE
(
  NUMERO    NUMBER(4) CONSTRAINT FK1_INCLUYE 
    REFERENCES RESERVA(NUMERO),
  MATRICULA CHAR(7)   CONSTRAINT FK2_INCLUYE 
    REFERENCES COCHE(MATRICULA),
  LITROSGAS NUMBER,
  CONSTRAINT PK_INCLUYE PRIMARY KEY (NUMERO, MATRICULA)
);

4.3.6. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E06, contraseña “E06”.  No pueden ser nulos los siguientes campos: Nombre de Empleado, Nombre de Periodista, Título de Revista. La Periodicidad toma uno de los siguientes valores: Semanal, Quincenal, Mensual, Trimestral o Anual, siendo el valor por defecto Mensual. NumPaginas debe ser mayor que 0.











sqlplus / as sysdba
...
SQL> create user E06 identified by “E06”;
User created.
SQL> grant connect,resource to E06;
Grant succeeded.
SQL> connect E06/E06;
Connected.

4.3.7. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E07, contraseña “E07”.  No pueden ser nulos los siguientes campos: Nombre de Socio, Título de Película. Sexo toma los valores H o M. Por defecto si no se indica nada un actor o actriz no es Protagonista (este campo toma valores S o N). FechaDevolución debe ser mayor que FechaAlquiler.

sqlplus / as sysdba
...
SQL> create user E07 identified by “E07”;
User created.
SQL> grant connect,resource to E07;
Grant succeeded.
SQL> connect E07/E07;
Connected.


4.3.8. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E08, contraseña “E08”. No pueden ser nulos los siguientes campos: Nombre de Persona, NombreVía, Número de Vivienda, Nombre de Municipio. Sexo toma los valores H o M. Por defecto si no se indica nada el TipoVia es Calle.

sqlplus / as sysdba
...
SQL> create user E08 identified by “E08”;
User created.
SQL> grant connect,resource to E08;
Grant succeeded.
SQL> connect E08/E08;
Connected.

4.3.9. (RESUELTA) Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E09, contraseña “E09”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE. Crea índices para los siguientes campos: Nombre de Sucursal, Nombre de Cliente. También para  Localidad de Cliente, Localidad de Sucursal. Crea una secuencia que inicie en 1 para CodSucursal.

sqlplus / as sysdba
...
SQL> create user E09 identified by “E09”;
User created.
SQL> grant connect,resource to E09;
Grant succeeded.
SQL> connect E09/E09;
Connected.

CREATE TABLE CLIENTE 
(
  DNI        CHAR(9),
  NOMBRE     VARCHAR2(40), 
  DIRECCION  VARCHAR2(40),
  LOCALIDAD  VARCHAR2(40),
  FECHA_NAC  DATE,
  SEXO       CHAR(1)
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE PRIMARY KEY(DNI);


CREATE TABLE SUCURSAL
(
  CODSUCURSAL NUMBER(4),
  NOMBRE      VARCHAR2(40),
  DIRECCION   VARCHAR2(40),
  LOCALIDAD   VARCHAR2(40)
);

ALTER TABLE SUCURSAL ADD CONSTRAINT PK_SUCURSAL 
  PRIMARY KEY(CODSUCURSAL);


CREATE SEQUENCE NUMSUCURSAL;

CREATE INDEX NOMBRE_CLIENTE_IDX     ON CLIENTE (NOMBRE);
CREATE INDEX LOCALIDAD_CLIENTE_IDX  ON CLIENTE (LOCALIDAD);
CREATE INDEX NOMBRE_SUCURSAL_IDX    ON SUCURSAL (NOMBRE);
CREATE INDEX LOCALIDAD_SUCURSAL_IDX ON SUCURSAL (LOCALIDAD);


CREATE TABLE CUENTA
(
  CODSUCURSAL NUMBER(4),
  CODCUENTA   NUMBER(10)
);

ALTER TABLE CUENTA ADD CONSTRAINT PK_CUENTA 
  PRIMARY KEY(CODSUCURSAL, CODCUENTA);

ALTER TABLE CUENTA ADD CONSTRAINT FK_CUENTA 
  FOREIGN KEY(CODSUCURSAL) REFERENCES SUCURSAL(CODSUCURSAL);

CREATE TABLE TRANSACCION
(
  CODSUCURSAL    NUMBER(4),
  CODCUENTA      NUMBER(10),
  NUMTRANSACCION NUMBER(5),
  FECHA          DATE,
  TIPO           VARCHAR2(20)
);

ALTER TABLE TRANSACCION ADD CONSTRAINT PK_TRANSACCION 
  PRIMARY KEY (CODSUCURSAL, CODCUENTA, NUMTRANSACCION);

ALTER TABLE TRANSACCION ADD CONSTRAINT FK_TRANSACCION
  FOREIGN KEY (CODSUCURSAL, CODCUENTA) 
  REFERENCES CUENTA (CODSUCURSAL, CODCUENTA);


CREATE TABLE CLI_CUENTA
(
  DNI         CHAR(9),
  CODSUCURSAL NUMBER(4),
  CODCUENTA   NUMBER(10)
);

ALTER TABLE CLI_CUENTA ADD CONSTRAINT PK_CLI_CUENTA
  PRIMARY KEY (DNI, CODSUCURSAL, CODCUENTA);

ALTER TABLE CLI_CUENTA ADD CONSTRAINT FK1_CLI_CUENTA
  FOREIGN KEY (DNI) REFERENCES CLIENTE(DNI);

ALTER TABLE CLI_CUENTA ADD CONSTRAINT FK2_CLI_CUENTA
  FOREIGN KEY (CODSUCURSAL, CODCUENTA) 
  REFERENCES CUENTA(CODSUCURSAL, CODCUENTA);


4.3.10. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E10, contraseña “E10”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE.  Crea secuencias que inicien en 1 para:  NumCliente, NumArtículo, NumFabrica y NumPedido.


sqlplus / as sysdba
...
SQL> create user E10 identified by “E10”;
User created.
SQL> grant connect,resource to E10;
Grant succeeded.
SQL> connect E10/E10;
Connected.

4.3.11. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E11, contraseña “E11”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE.  Crea índices para los siguientes campos: Nombre de Cliente, Nombre de Categoría, Nombre de Proveedor, Ciudad de Cliente. Crea una secuencia para IDVenta.
sqlplus / as sysdba
...
SQL> create user E11 identified by “E11”;
User created.
SQL> grant connect,resource to E11;
Grant succeeded.
SQL> connect E11/E11;
Connected.
  
4.3.12. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E12, contraseña “E12”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE. Crea índices para los siguientes campos: Apellidos de Empleado, Lugar de Edición, Horario de Edición.  Para el indicar si un prerrequisito es obligatorio o no utilizamos ‘S’ o ‘N’.

sqlplus / as sysdba
...
SQL> create user E12 identified by “E12”;
User created.
SQL> grant connect,resource to E12;
Grant succeeded.
SQL> connect E12/E12;
Connected.


4.3.13. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E13, contraseña “E13”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE. Crea una secuencia para IDCuenta, otra para IDNomina y otra para LineaNum.


sqlplus / as sysdba
...
SQL> create user E13 identified by “E13”;
User created.
SQL> grant connect,resource to E13;
Grant succeeded.
SQL> connect E13/E13;
Connected.







4.3.14. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E14, contraseña “E14”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE.


sqlplus / as sysdba
...
SQL> create user E14 identified by “E14”;
User created.
SQL> grant connect,resource to E14;
Grant succeeded.
SQL> connect E14/E14;
Connected.
O99

4.4. Prácticas
4.4.1. PRÁCTICA 1
OBJETIVOS:  Realizar el diseño físico de bases de datos utilizando asistentes, herramientas gráficas y el lenguaje de definición de datos.
ENUNCIADO: Dado el siguiente esquema E/R:


a) Obtén el esquema relacional correspondiente.
b) Comprueba que está en 3FN.
c) Crea las tablas en ORACLE procurando que las columnas tengan el tipo y tamaño adecuado y con las siguientes restricciones:
1. El Color de los coches es verde, rojo o azul.
2. La matrícula está formada por cuatro números y tres letras.
3. Los DNI terminan en letra.
4. Las Horas de mano de obra de una operación nunca pasan de 10.
5. Señala todas las claves primarias, ajenas y candidatas.
6. La cantidad de Piezas por Operación por defecto es 1.
7. La marca y modelo del coche no pueden dejarse en blanco.
8. Los teléfonos empiezan por 6 o por 9.
9. El precio de un coche está entre 10000 y 40000.
4.4.2. PRÁCTICA 2
OBJETIVO: Realizar el diseño físico de bases de datos utilizando asistentes, herramientas gráficas y el lenguaje de definición de datos.
ENUNCIADO: Dado el siguiente esquema E/R:
a) Obtén el esquema relacional correspondiente.
b) Comprueba que está en 3FN.
c) Crea las tablas en ORACLE procurando que las columnas tengan el tipo y tamaño adecuado y con las siguientes restricciones:
1. Todas las claves primarias, ajenas y candidatas.
2. No hay partidos en verano (desde el 21/06 al 21/09)
3. Los partidos no pueden durar más de 100 minutos incluyendo el descuento.
4. La posición de un jugador puede ser Portero, Defensa, Centrocampista o Delantero.
5. Los jugadores han de tener como mínimo 16 años en el momento en que se dan de alta en la base de datos. 
6. Si no se sabe el aforo de un estadio, se guardará un 0 por defecto.
7. La fecha de un partido es un campo obligatorio.
d) Una vez creadas las tablas:
1. Añade una columna NumTitulos a la tabla Equipos.
2. Elimina la columna Ciudad.
3. Añade la restricción: Todos los equipos se han fundado después del año1890.
4. Añade la restricción: La hora de comienzo de los partidos estará entre las 12:00 y las 22:00 horas.
4.4.3. PRÁCTICA 3
OBJETIVO: Realizar el diseño físico de bases de datos utilizando asistentes, herramientas gráficas y el lenguaje de definición de datos.
ENUNCIADO: Dado el siguiente esquema relacional crear en Oracle el modelo físico, asignando nombre a las restricciones,

