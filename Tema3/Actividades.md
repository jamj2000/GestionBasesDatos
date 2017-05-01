# ACTIVIDADES RESUELTAS
# DISEÑO FÍSICO DE BASES DE DATOS. LENGUAJE DE DEFINICIÓN DE DATOS

> IES Luis Vélez de Guevara  
> Departamento de Informática


## Cuestiones (I)

### 1. Nombra los distintos tipos de instrucciones DDL que puede haber, distinguiendo el tipo de objeto que se puede crear, borrar o modificar.

DATABASE

USER

CREATE
TABLE


DROP
VIEW
nombre … 
 ; 
ALTER
SEQUENCE


INDEX
SYNONYM



### 2. Pon un ejemplo de un tipo de dato numérico, otro alfanumérico y otro fecha/hora.
Dato numérico: PRECIO, IVA, EDAD, …
Dato alfanumérico: DNI, DIRECCIÓN, …
Dato tipo fecha: FECHA_NACIMIENTO, FECHA_INICIO, FECHA_FIN, ...

### 3. ¿Qué diferencia hay entre VARCHAR y CHAR?
Tanto CHAR como VARCHAR2 se utilizan para almacenar valores de cadena de caracteres, sin embargo, se comportan de manera muy diferente. 
- CHAR se debe utilizar para almacenar cadenas de caracteres de longitud fija. Siempre se reserva en memoria el espacio indicado. Los valores de cadena serán espaciados (puestos en blanco) hasta la longitud especificada antes de almacenarse en el disco. 
- VARCHAR2 se utiliza para almacenar cadenas de caracteres de longitud variable. Se reserva unicamente la memoria necesaria hasta el máximo indicado en la longitud.

### 4. Realiza un esquema resumen de las cláusulas SQL utilizadas en la modificación de tablas. 

Eliminar todo el contenido

```sql
TRUNCATE TABLE tabla;
```

Renombar tabla

```sql
RENAME tabla TO tabla2;
```

Añadir/Borrar/Modificar campos

```sql
ALTER TABLE tabla  
ADD/MODIFY (campo tipo restricciones, campo tipo restricciones, …);

ALTER TABLE tabla 
DROP (campo, campo, …) [CASCADE CONSTRAINTS];  
```

Añadir/Borrar/Modificar restricciones

```sql
ALTER TABLE tabla  
ADD/MODIFY CONSTRAINT nombre_restriccion ...;

ALTER TABLE tabla 
DROP CONSTRAINT nombre_restriccion [CASCADE]; 

ALTER TABLE tabla 
RENAME CONSTRAINT nombre_restriccion TO nuevo_nombre;  

ALTER TABLE tabla  
ENABLE/DISABLE CONSTRAINT nombre_restriccion ...;
```

### 5. Realiza la instalación de Oracle Database 11g Express Edition sobre Windows.

### 6. Una vez instalado dicho Sistema Gestor de Bases de Datos Relacional (RDBMS), lo iniciaremos pulsando en “Start Database”. 









### 7. Y después iniciamos la interfaz web APEX  (APplication EXpress) para trabajar con dicho SGBD. Para ello pulsamos sobre “Get Started”. 
Y se abrirá el navegador web con esta URL: http://127.0.0.1:8080/apex/f?p=4950.

### 8. A continuación configuraremos el Terminal CMD. En Windows, ejecuta el programa CMD.EXE y realiza la configuración siguiente:
- Pulsa con el botón secundario del ratón en la barra de título y luego haz clic en Propiedades
- Configura la Fuente, la Disposición y los Colores como se muestra más abajo.





- Pulsa OK.

### 9. Cambia la “Página de Código” a Windows-1252.
Para que se muestren correctamente las tildes y ciertos caracteres como la letra Ñ y similares deberemos ejecutar el comando CHCP 1252 (CHange CodePage). Esto cambia la CP850 por la CP1252 que soporta el conjunto de caracteres ISO 8859, necesarios por los motivos indicados anteriormente. Esta configuración no se queda guardada, por lo que deberemos ejecutarla cada vez que iniciemos el terminal.

### 10. Ya podemos lanzar el cliente SQL*Plus como aparece en la imagen. Lo haremos como SYSDBA (permisos de DataBase Administrator).

Para comprobar que SQL\*Plus y la base de datos Oracle están funcionando bien, realizaremos lo siguiente. Con Oracle se instala un esquema (usuario) de ejemplo llamado HR (Human Resources). Por defecto está bloqueado. Los desbloqueamos. Le concedemos roles CONNECT y RESOURCE y asignamos una contraseña. 

```
sqlplus / as sysdba
...
SQL> alter user hr account unlock;
User altered.
SQL> grant connect,resource to hr identified by “HR”;
Grant succeeded.
```

### 11.  Ahora conectamos con usuario/contraseña anterior y vemos las tablas que tiene dicho esquema (usuario).

### 12. Insertamos algunos datos con tildes y caracteres tales como la letra Ñ.

### 13. Comprobamos ahora la interfaz web APEX. Pulsamos en Application Express. Luego introducimos la clave del usuario SYSTEM que establecimos durante la instalación.

> Cuidado. En las contraseñas se distingue entre mayúsculas y minúsculas.




### 14. Una vez dentro nos creamos un espacio de trabajo (Workspace) como aparece en la siguiente imagen. Luego pulsaremos “Create Workspace”.
Como usuario y contraseña de APEX, por motivos de comodidad, utilizaremos siempre los siguientes: 
- Username: YO
- Password: YO

### 15. Ya podemos trabajar con el esquema HR en APEX. Para ello pulsamos en “Already have an acount? Login Here”


### 16. Después pulsamos sobre “SQL WorkShop” y “SQL Commands”. Realizamos la consulta “SELECT * FROM COUNTRIES;” para comprobar que aparece el registro introducido anteriormente con las tildes correctas.


## Cuestiones (II)
### 1. Desde SQLPlus crea un esquema (usuario) llamado TIENDAS con contraseña TIENDAS. Concédele los roles CONNECT y RESOURCE. Accede con dicho usuario/contraseña.

```
CHCP 1252
sqlplus / as sysdba
...
SQL> create user TIENDAS identified by “TIENDAS”;
User created.
SQL> grant connect,resource to TIENDAS;
Grant succeeded.
SQL> connect TIENDAS/TIENDAS;
Connected.
``` 

### 2. Crear las siguientes tablas de acuerdo con las restricciones que se mencionan:
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







```sql
Tabla TIENDAS
CREATE TABLE TIENDAS
(
  NIF        VARCHAR2 (10),
  NOMBRE     VARCHAR2 (20),
  DIRECCION  VARCHAR2 (20),
  POBLACION  VARCHAR2 (20),
  PROVINCIA  VARCHAR2(20),
  CODPOSTAL  NUMBER (5)
);

ALTER TABLE TIENDAS
ADD CONSTRAINT PK_ELNIF PRIMARY KEY (NIF);

ALTER TABLE TIENDAS
ADD CONSTRAINT MAYUSCU CHECK (PROVINCIA = UPPER (PROVINCIA));

ALTER TABLE TIENDAS
MODIFY (NOMBRE VARCHAR2 (30) NOT NULL);


Tabla FABRICANTES
CREATE TABLE FABRICANTES
(
  COD_FABRICANTE  NUMBER (3) ,
  NOMBRE          VARCHAR2 (15) ,
  PAIS            VARCHAR2 (15) ,
  CONSTRAINT CODFAB_PK PRIMARY KEY (COD_FABRICANTE),
  CONSTRAINT NOMBRE_MAYUSCULA CHECK (NOMBRE = UPPER(NOMBRE)),
  CONSTRAINT PAIS_MAYUSCULAS CHECK (PAIS = UPPER (PAIS))
);


Tabla ARTICULOS
CREATE TABLE ARTICULOS
(
  ARTICULO        VARCHAR2 (20),
  COD_FABRICANTE  NUMBER (3),
  PESO            NUMBER (3),
  CATEGORIA       VARCHAR2 (10),
  PRECIO_VENTA    NUMBER (6,2),
  PRECIO_COSTO    NUMBER (6,2),
  EXISTENCIAS     NUMBER (5),
  CONSTRAINT FK_CODFAB FOREIGN KEY (COD_FABRICANTE) 
    REFERENCES FABRICANTES ON DELETE CASCADE,
  CONSTRAINT PK_CLAVEP 
    PRIMARY KEY (ARTICULO, COD_FABRICANTE, PESO,  CATEGORIA),
  CONSTRAINT MAYORQUE0 
    CHECK (PRECIO_VENTA > 0 AND PRECIO_COSTO > 0 AND PESO > 0),
  CONSTRAINT CATEGORI 
    CHECK (CATEGORIA IN ('PRIMERA', 'SEGUNDA', 'TERCERA'))
);


Tabla VENTAS
CREATE TABLE VENTAS
(
  NIF                VARCHAR2 (10),
  ARTICULO           VARCHAR2 (20),
  COD_FABRICANTE     NUMBER (3),
  PESO               NUMBER (3),
  CATEGORIA          VARCHAR2 (10),
  FECHA_VENTA        DATE,
  UNIDADES_VENDIDAS  NUMBER (4),
  CONSTRAINT PK_CLAVEPV PRIMARY KEY 
    (NIF, ARTICULO, COD_FABRICANTE, PESO, CATEGORIA,FECHA_VENTA),
  CONSTRAINT VENDIDAS_MAY0 CHECK (UNIDADES_VENDIDAS >0),
  CONSTRAINT CATEGORIV 
    CHECK (CATEGORIA IN ('PRIMERA', 'SEGUNDA', 'TERCERA')),
  CONSTRAINT FK_CLAVEAJEV 
    FOREIGN KEY (ARTICULO, COD_FABRICANTE, PESO, CATEGORIA)
    REFERENCES ARTICULOS ON DELETE CASCADE,
  CONSTRAINT FK_NIFV FOREIGN KEY (NIF) 
    REFERENCES TIENDAS ON DELETE CASCADE
);


Tabla PEDIDOS
CREATE TABLE PEDIDOS
(
  NIF               VARCHAR2 (10),
  ARTICULO          VARCHAR2 (20),
  COD_FABRICANTE    NUMBER (3),
  PESO              NUMBER (3),
  CATEGORIA         VARCHAR2 (10),
  FECHA_PEDIDO      DATE,
  UNIDADES_PEDIDAS  NUMBER (4),
  EXISTENCIAS       NUMBER (5),
  CONSTRAINT PK_CLAVEPP PRIMARY KEY 
    (NIF, ARTICULO, COD_FABRICANTE, PESO, CATEGORIA,FECHA_PEDIDO),
  CONSTRAINT FK_CLAVENIFP FOREIGN KEY (NIF) 
    REFERENCES TIENDAS ON DELETE CASCADE,
  CONSTRAINT FK_CLAVEAJEP 
    FOREIGN KEY (ARTICULO, COD_FABRICANTE, PESO, CATEGORIA)
    REFERENCES ARTICULOS ON DELETE CASCADE,
  CONSTRAINT CATEGORIP 
    CHECK (CATEGORIA IN ('PRIMERA', 'SEGUNDA', 'TERCERA'))
);
```


### 3. Añadir una restricción a la tabla TIENDAS para que el NOMBRE de la tienda sea de tipo título (InitCap).

```sql
ALTER TABLE TIENDAS
ADD CONSTRAINT NOMBRETIENDAMAY CHECK (NOMBRE = INITCAP (NOMBRE));

INSERT INTO TIENDAS
VALUES (16789654, 'romero', 'Valderejo 5', 'VIZCAYA', 'EREMUA', 56342);
```

### 4. Visualizar las CONSTRAINTS definidas para las tablas anteriores.

```sql
SELECT CONSTRAINT_NAME, COLUMN_NAME FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'TIENDAS';
```

### 5. Modificar las columnas de las tablas PEDIDOS y VENTAS para que las UNIDADES_VENDIDAS y las UNIDADES_PEDIDAS puedan almacenar cantidades numéricas de 6 dígitos.

```sql
ALTER TABLE PEDIDOS
MODIFY (UNIDADES_PEDIDAS NUMBER (6));

ALTER TABLE VENTAS
MODIFY (UNIDADES_VENDIDAS NUMBER (6));
```

### 6. Impedir que se den de alta más tiendas en la provincia de 'TOLEDO'.

```sql
ALTER TABLE TIENDAS
ADD CONSTRAINT PROVNOTOLEDO CHECK (PROVINCIA != 'TOLEDO');
```

### 7. Añadir a las tablas PEDIDOS y VENTAS una nueva columna para que almacenen el PVP del artículo.

```sql
ALTER TABLE PEDIDOS
ADD (PVP NUMBER (9));

ALTER TABLE VENTAS
ADD (PVP NUMBER (9));
```

### 8. Crear una vista que se llame CONSERJES que contenga el nombre del centro y el nombre de sus conserjes.

```sql
CREATE VIEW CONSERJES(CENTRO, NOMBRE_CONSERJE)
AS SELECT C.NOMBRE, P.APELLIDOS FROM CENTROS C, PERSONAL P
WHERE C.COD_CENTRO = P.COD_CENTRO AND P.FUNCION = 'CONSERJE';
```

### 9. Crear un sinónimo llamado CONSER asociado a la vista creada antes.

```sql
CREATE SYNONYM CONSER FOR CONSERJES;
```

### 10. Añadir a la tabla PROFESORES una columna llamada COD_ASIG con dos posiciones numéricas.

```sql
ALTER TABLE PROFESORES
ADD (COD_ASIG NUMBER (2));
```

### 11. Crear la tabla TASIG con las siguientes columnas: COD_ASIG numérico, 2 posiciones y NOM_ASIG cadena de 20 caracteres.

```sql
CREATE TABLE TASIG
(
  NOM_ASIG VARCHAR2 (20),
  COD_ASIG NUMBER (2)
);
```

### 12. Añadir la restricción de clave primaria a la columna COD_ASIG de la tabla TASIG.

```sql
ALTER TABLE TASIG
ADD CONSTRAINT PK_CODASIG PRIMARY KEY (COD_ASIG);
```

### 13. Añadir la restricción de clave ajena a la columna COD_ASIG de la tabla PROFESORES.

```sql
ALTER TABLE PROFESORES
ADD CONSTRAINT FK_CODASIG FOREIGN KEY (COD_ASIG)
REFERENCES TASIG ON DELETE CASCADE;
```

Se pone ON DELETE CASCADE si queremos que se borre en las dos al actualizar.
Visualizar los nombres de CONSTRAINTS y las columnas afectadas para las tablas TASIG y PROFESORES.

### 14. Cambiar de nombre la tabla PROFESORES y llamarla PROFES.
```sql
RENAME PROFESORES TO PROFES;
```

### 15. Borrar la tabla TASIG.
```sql
DROP TABLE TASIG;
```

### 16. Devolver la tabla PROFESORES a su situación inicial.
```sql
RENAME PROFES TO PROFESORES;
```


## Cuestiones  (III)
REPASO Y REFUERZO

### 1. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E01, contraseña "E01".

```
sqlplus / as sysdba
...
SQL> create user E01 identified by “E01”;
User created.
SQL> grant connect,resource to E01;
Grant succeeded.
SQL> connect E01/E01;
Connected.
```

Observa el orden en el que creamos las tablas. Las tablas que contienen claves foráneas deben crearse después de crear las tablas que contienen las claves primarias a las que apuntan. 

```sql
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
```

### 2. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E02, contraseña “E02”.

```
sqlplus / as sysdba
...
SQL> create user E02 identified by “E02”;
User created.
SQL> grant connect,resource to E02;
Grant succeeded.
SQL> connect E02/E02;
Connected.
```

```sql
CREATE TABLE REGION 
(
  CODREGION NUMBER(5) PRIMARY KEY,
  NOMBRE    VARCHAR2(40)
);


CREATE TABLE PROVINCIA
(
  CODPROVINCIA NUMBER(5) PRIMARY KEY,
  NOMBRE       VARCHAR2(40),
  CODREGION    NUMBER(5) REFERENCES REGION(CODREGION)
);


CREATE TABLE LOCALIDAD
(
  CODLOCALIDAD NUMBER(5) PRIMARY KEY,
  NOMBRE       VARCHAR2(40),
  CODPROVINCIA NUMBER(5) REFERENCES PROVINCIA(CODPROVINCIA)
);


CREATE TABLE EMPLEADO
(
  ID           NUMBER(3) PRIMARY KEY,
  DNI          CHAR(9)   UNIQUE,
  NOMBRE       VARCHAR2(50),
  FECHANAC     DATE,
  TELEFONO     CHAR(9),
  SALARIO      NUMBER(6,2),
  CODLOCALIDAD NUMBER(5) REFERENCES LOCALIDAD(CODLOCALIDAD)
);
```
  
Otra forma de crear la tabla EMPLEADO es ésta:

```sql
CREATE TABLE EMPLEADO
(
  ID           NUMBER(3),
  DNI          CHAR(9),
  NOMBRE       VARCHAR2(50),
  FECHANAC     DATE,
  TELEFONO     CHAR(9),
  SALARIO      NUMBER(6,2),
  CODLOCALIDAD NUMBER(5),
  PRIMARY KEY (ID),
  UNIQUE      (DNI),
  FOREIGN KEY (CODLOCALIDAD) REFERENCES LOCALIDAD(CODLOCALIDAD)
);
```

### 3. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E03, contraseña “E03”.

```
sqlplus / as sysdba
...
SQL> create user E03 identified by “E03”;
User created.
SQL> grant connect,resource to E03;
Grant succeeded.
SQL> connect E03/E03;
Connected.
```

```sql
CREATE TABLE DEPARTAMENTO
(
  ID           NUMBER(3) PRIMARY KEY,
  NOMBRE       VARCHAR2(50),
  UBICACION    VARCHAR2(50)
);


CREATE TABLE EMPLEADO
(
  ID           NUMBER(3) PRIMARY KEY,
  DNI          CHAR(9)   UNIQUE,
  NOMBRE       VARCHAR2(50),
  SALARIO      NUMBER(6,2),
  TELEFONO     CHAR(9),
  IDDEP        NUMBER(5) REFERENCES DEPARTAMENTO(ID)
);


CREATE TABLE JEFE
(
  ID           NUMBER(3) PRIMARY KEY,
  DNI          CHAR(9)   UNIQUE,
  NOMBRE       VARCHAR2(50),
  SALARIO      NUMBER(6,2),
  TELEFONO     CHAR(9),
  IDDEP        NUMBER(5) REFERENCES DEPARTAMENTO(ID)
);


La tabla JEFE podría haberse creado también de esta forma:
CREATE TABLE JEFE
(
  ID           NUMBER(3),
  DNI          CHAR(9),
  NOMBRE       VARCHAR2(50),
  SALARIO      NUMBER(6,2),
  TELEFONO     CHAR(9),
  IDDEP        NUMBER(5),
  PRIMARY KEY  (ID),
  UNIQUE       (DNI),  
  FOREIGN KEY  (IDDEP) REFERENCES DEPARTAMENTO(ID)
);
```

### 4. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E04, contraseña “E04”.

```
sqlplus / as sysdba
...
SQL> create user E04 identified by “E04”;
User created.
SQL> grant connect,resource to E04;
Grant succeeded.
SQL> connect E04/E04;
Connected.
```

```sql
CREATE TABLE CLIENTE
(
  NIF          CHAR(9)   PRIMARY KEY,
  NOMBRE       VARCHAR2(50),
  DIRECCION    VARCHAR2(50),
  TELEFONO     CHAR(9)
);


CREATE TABLE MONTADOR
(
  NIF          CHAR(9)   PRIMARY KEY,
  NOMBRE       VARCHAR2(50),
  DIRECCION    VARCHAR2(50),
  TELEFONO     CHAR(9)
);


CREATE TABLE MODELODORMITORIO
(
  COD          CHAR(3)   PRIMARY KEY
);


CREATE TABLE COMPRA
(
  NIF_C        CHAR(9)   REFERENCES CLIENTE(NIF),
  MODELO       CHAR(3)   REFERENCES MODELODORMITORIO(COD),
  FECHACOMPRA  DATE,
  PRIMARY KEY (NIF_C, MODELO, FECHACOMPRA)
);


CREATE TABLE MONTA
(
  NIF_M        CHAR(9)   REFERENCES MONTADOR(NIF),
  MODELO       CHAR(3)   REFERENCES MODELODORMITORIO(COD),
  FECHAMONTAJE DATE,
  PRIMARY KEY (NIF_M, MODELO, FECHAMONTAJE)
);
```

### 5. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E05, contraseña “E05”.  No pueden ser nulos los siguientes campos: Nombre de Cliente, Marca y Modelo de Coche. Crear una secuencia para el Número de Reserva.

```sql
sqlplus / as sysdba
...
SQL> create user E05 identified by “E05”;
User created.
SQL> grant connect,resource to E05;
Grant succeeded.
SQL> connect E05/E05;
Connected.
```

```sql
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
  CONSTRAINT PK_INCLUYE PRIMARY KEY (NUMERO, MATRICULA),
  CONSTRAINT FK1_INCLUYE FOREIGN KEY (NUMERO) 
    REFERENCES RESERVA(NUMERO),
  CONSTRAINT FK2_INCLUYE FOREIGN KEY (MATRICULA) 
    REFERENCES COCHE(MATRICULA)
);
```

Otra forma de crear las tablas AVALA e INCLUYE

```sql
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
```

### 6. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E06, contraseña “E06”.  No pueden ser nulos los siguientes campos: Nombre de Empleado, Nombre de Periodista, Título de Revista. La Periodicidad toma uno de los siguientes valores: Semanal, Quincenal, Mensual, Trimestral o Anual, siendo el valor por defecto Mensual. NumPaginas debe ser mayor que 0.

```
sqlplus / as sysdba
...
SQL> create user E06 identified by “E06”;
User created.
SQL> grant connect,resource to E06;
Grant succeeded.
SQL> connect E06/E06;
Connected.
```

```sql
CREATE TABLE SUCURSAL
(
  CODIGO    CHAR(4)      CONSTRAINT PK_SUCURSAL PRIMARY KEY,
  DIRECCION VARCHAR2(40),
  TELEFONO  CHAR(9)
);


CREATE TABLE PERIODISTA
(
  DNI          CHAR(9)      CONSTRAINT PK_PERIODISTA PRIMARY KEY,
  NOMBRE       VARCHAR2(50) CONSTRAINT NN_NOMBRE NOT NULL,
  DIRECCION    VARCHAR2(40),
  TELEFONO     CHAR(9),
  ESPECIALISTA VARCHAR2(40)
);


CREATE TABLE EMPLEADO
(
  DNI       CHAR(9)      CONSTRAINT PK_EMPLEADO PRIMARY KEY,
  NOMBRE    VARCHAR2(50) CONSTRAINT NN_NOMBRE_EMPLEADO NOT NULL,
  DIRECCION VARCHAR2(40),
  TELEFONO  CHAR(9),
  SUCURSAL  CHAR(4)      CONSTRAINT FK_SUCURSAL 
    REFERENCES SUCURSAL(CODIGO)
);


CREATE TABLE REVISTA
(
  NUMREG       CHAR(8)      CONSTRAINT PK_REVISTA PRIMARY KEY,
  TITULO       VARCHAR2(50) CONSTRAINT NN_TITULO NOT NULL,
  PERIODICIDAD VARCHAR2(40) DEFAULT 'MENSUAL',
  TIPO         VARCHAR2(20),
  SUCURSAL     CHAR(4)      CONSTRAINT FK_SUCURSAL_REVISTA 
    REFERENCES SUCURSAL(CODIGO),
  CONSTRAINT CK_PERIODICIDAD
    CHECK (PERIODICIDAD IN 
      ('SEMANAL', 'QUINCENAL', 'MENSUAL', 'TRIMESTRAL', 'ANUAL'))
);


CREATE TABLE NUMREVISTA
(
  NUMREG       CHAR(8),
  NUMERO       NUMBER(3),
  NUMPAGINAS   NUMBER(3),
  FECHA        DATE,
  CANTVENDIDAS NUMBER(6),
  CONSTRAINT PK_NUMREVISTA PRIMARY KEY (NUMREG, NUMERO),
  CONSTRAINT FK_NUMREVISTA FOREIGN KEY(NUMREG) 
    REFERENCES REVISTA(NUMREG),
  CONSTRAINT CK_NUMPAGINAS CHECK (NUMPAGINAS > 0)
);


CREATE TABLE ESCRIBE
(
  NUMREG         CHAR(8),
  DNI_PERIODISTA CHAR(8),
  CONSTRAINT PK_ESCRIBE PRIMARY KEY (NUMREG, DNI_PERIODISTA),
  CONSTRAINT FK1_ESCRIBE FOREIGN KEY(NUMREG) 
    REFERENCES REVISTA(NUMREG),
  CONSTRAINT FK2_ESCRIBE FOREIGN KEY(DNI_PERIODISTA) 
    REFERENCES PERIODISTA(DNI)
);
```

### 7. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E07, contraseña “E07”.  No pueden ser nulos los siguientes campos: Nombre de Socio, Título de Película. Sexo toma los valores H o M. Por defecto si no se indica nada un actor o actriz no es Protagonista (este campo toma valores S o N). FechaDevolución debe ser mayor que FechaAlquiler.

```
sqlplus / as sysdba
...
SQL> create user E07 identified by “E07”;
User created.
SQL> grant connect,resource to E07;
Grant succeeded.
SQL> connect E07/E07;
Connected.
```

```sql
CREATE TABLE DIRECTOR 
(
  NOMBRE       VARCHAR2(40) CONSTRAINT PK_DIRECTOR PRIMARY KEY,
  NACIONALIDAD VARCHAR2(40)
);


CREATE TABLE PELICULA
(
  ID           NUMBER        CONSTRAINT PK_PELICULA PRIMARY KEY,
  TITULO       VARCHAR2(40),
  PRODUCTORA   VARCHAR2(40),
  NACIONALIDAD VARCHAR2(40),
  FECHA        DATE,
  DIRECTOR     VARCHAR2(40)  CONSTRAINT FK_DIRECTOR 
    REFERENCES DIRECTOR(NOMBRE)
);


CREATE TABLE EJEMPLAR
(
  IDPELICULA NUMBER,
  NUMERO     NUMBER(2),
  ESTADO     VARCHAR2(40),
  CONSTRAINT PK_EJEMPLAR PRIMARY KEY(IDPELICULA, NUMERO),
  CONSTRAINT FK_EJEMPLAR FOREIGN KEY(IDPELICULA) 
    REFERENCES PELICULA(ID)
);


CREATE TABLE ACTORES
(
  NOMBRE       VARCHAR2(40),
  NACIONALIDAD VARCHAR2(40),
  SEXO         CHAR(1),
  CONSTRAINT PK_ACTORES PRIMARY KEY(NOMBRE),
  CONSTRAINT CK_SEXO    CHECK (SEXO IN ('H', 'M'))
);


CREATE TABLE SOCIO
(
  DNI       CHAR(9),
  NOMBRE    VARCHAR2(40) CONSTRAINT NN_NOMBRE NOT NULL,
  DIRECCION VARCHAR2(40),
  TELEFONO  CHAR(9),
  AVALADOR  CHAR(9),
  CONSTRAINT PK_SOCIO PRIMARY KEY(DNI),
  CONSTRAINT FK_SOCIO FOREIGN KEY(AVALADOR) REFERENCES SOCIO(DNI)
);


CREATE TABLE ACTUA
(
  ACTOR        VARCHAR2(40),
  IDPELICULA   NUMBER,
  PROTAGONISTA CHAR(1) DEFAULT 'N',
  CONSTRAINT PK_ACTUA PRIMARY KEY(ACTOR, IDPELICULA),
  CONSTRAINT CK_PROTAGONISTA CHECK (PROTAGONISTA IN ('S', 'N'))
);


CREATE TABLE ALQUILA
(
  DNI              CHAR(9),
  IDPELICULA       NUMBER,
  NUMERO           NUMBER(2),
  FECHA_ALQUILER   DATE,
  FECHA_DEVOLUCION DATE,
  CONSTRAINT PK_ALQUILA 
    PRIMARY KEY(DNI, IDPELICULA, NUMERO, FECHA_ALQUILER),
  CONSTRAINT FK1_DNI    FOREIGN KEY(DNI) REFERENCES SOCIO(DNI),
  CONSTRAINT FK2_PELI   FOREIGN KEY(IDPELICULA, NUMERO) 
    REFERENCES EJEMPLAR(IDPELICULA, NUMERO),
  CONSTRAINT CK_FECHAS  CHECK (FECHA_DEVOLUCION > FECHA_ALQUILER)
);
```


### 8. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E08, contraseña “E08”. No pueden ser nulos los siguientes campos: Nombre de Persona, NombreVía, Número de Vivienda, Nombre de Municipio. Sexo toma los valores H o M. Por defecto si no se indica nada el TipoVia es Calle.

```
sqlplus / as sysdba
...
SQL> create user E08 identified by “E08”;
User created.
SQL> grant connect,resource to E08;
Grant succeeded.
SQL> connect E08/E08;
Connected.
```

```sql
CREATE TABLE MUNICIPIO
(
  ID        CHAR(4),
  NOMBRE    VARCHAR2(40) CONSTRAINT NN_NOMBRE NOT NULL,
  CODPOSTAL CHAR(5),
  PROVINCIA VARCHAR2(40),
  CONSTRAINT PK_MUNICIPIO PRIMARY KEY(ID)
);


CREATE TABLE VIVIENDA
(
  ID          CHAR(4),
  TIPO_VIA    VARCHAR2(10)  DEFAULT 'Calle',
  NOMBRE_VIA  VARCHAR2(50)  CONSTRAINT NN_NOMBRE_VIA NOT NULL,
  NUMERO      NUMBER(3)     CONSTRAINT NN_NUMERO NOT NULL,
  IDMUNICIPIO CHAR(4),
  CONSTRAINT PK_VIVIENDA  PRIMARY KEY(ID),
  CONSTRAINT FK_MUNICIPIO FOREIGN KEY(IDMUNICIPIO) 
    REFERENCES MUNICIPIO(ID)
);


CREATE TABLE PERSONA
(
  DNI        CHAR(9),
  NOMBRE     VARCHAR2(40),
  FECHA_NAC  DATE,
  SEXO       CHAR(1),
  IDVIVIENDA CHAR(4),
  CONSTRAINT PK_PERSONA PRIMARY KEY(DNI),
  CONSTRAINT FK_VIVENDA FOREIGN KEY(IDVIVIENDA) 
    REFERENCES VIVIENDA(ID),
  CONSTRAINT CK_SEXO CHECK (SEXO IN ('H', 'M'))
);


CREATE TABLE POSEE
(
  DNI        CHAR(9),
  IDVIVIENDA CHAR(4),
  CONSTRAINT PK_POSEE PRIMARY KEY(DNI, IDVIVIENDA),
  CONSTRAINT FK1_PERSONA  FOREIGN KEY(DNI) REFERENCES PERSONA(DNI),
  CONSTRAINT FK2_VIVIENDA FOREIGN KEY(IDVIVIENDA) 
    REFERENCES VIVIENDA(ID)
);


CREATE TABLE CABEZAFAMILIA
(
  DNI        CHAR(9),
  IDVIVIENDA CHAR(4),
  CONSTRAINT PK_CABEZA PRIMARY KEY(DNI),
  CONSTRAINT FK1_PER FOREIGN KEY(DNI) REFERENCES PERSONA(DNI),
  CONSTRAINT FK2_VIV FOREIGN KEY(IDVIVIENDA) REFERENCES VIVIENDA(ID),
  CONSTRAINT UQ_VIVIENDA  UNIQUE(IDVIVIENDA)
);
```

### 9. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E09, contraseña “E09”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE. Crea índices para los siguientes campos: Nombre de Sucursal, Nombre de Cliente. También para  Localidad de Cliente, Localidad de Sucursal. Crea una secuencia que inicie en 1 para CodSucursal.

```
sqlplus / as sysdba
...
SQL> create user E09 identified by “E09”;
User created.
SQL> grant connect,resource to E09;
Grant succeeded.
SQL> connect E09/E09;
Connected.
```

```sql
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
```


### 10. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E10, contraseña “E10”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE.  Crea secuencias que inicien en 1 para:  NumCliente, NumArtículo, NumFabrica y NumPedido.

```
sqlplus / as sysdba
...
SQL> create user E10 identified by “E10”;
User created.
SQL> grant connect,resource to E10;
Grant succeeded.
SQL> connect E10/E10;
Connected.
```

```sql
CREATE TABLE FABRICA
(
  NUMFABRICA NUMBER(2),
  TELEFONO   CHAR(9)
);

ALTER TABLE FABRICA ADD CONSTRAINT PK_FABRICA 
  PRIMARY KEY(NUMFABRICA);


CREATE TABLE ARTICULO
(
  NUMARTICULO NUMBER(5),
  DESCRIPCION VARCHAR2(100)
);

ALTER TABLE ARTICULO ADD CONSTRAINT PK_ARTICULO 
  PRIMARY KEY(NUMARTICULO);



CREATE TABLE CLIENTE
(
  NUMCLIENTE NUMBER(5),
  SALDO      NUMBER,
  LIMCREDITO NUMBER(4),
  DESCUENTO  NUMBER(2)
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE 
  PRIMARY KEY(NUMCLIENTE);


CREATE TABLE DIRECCION
(
  CODDIRECCION  CHAR(8),
  VIA           VARCHAR2(20),
  NOMBREVIA     VARCHAR2(50),
  NUMERO        NUMBER(3),
  PISO          NUMBER(1),
  PORTAL        CHAR(1),
  CODPOSTAL     CHAR(5)
);

ALTER TABLE DIRECCION ADD CONSTRAINT PK_DIRECCION
  PRIMARY KEY (CODDIRECCION);


CREATE TABLE PEDIDO
(
  NUMPEDIDO    NUMBER(5),
  FECHA        DATE,
  NUMCLIENTE   NUMBER(5),
  CODDIRECCION CHAR(8)
);

ALTER TABLE PEDIDO ADD CONSTRAINT PK_PEDIDO
  PRIMARY KEY (NUMPEDIDO);

ALTER TABLE PEDIDO ADD CONSTRAINT FK1_PEDIDO
  FOREIGN KEY (NUMCLIENTE) REFERENCES CLIENTE(NUMCLIENTE);

ALTER TABLE PEDIDO ADD CONSTRAINT FK2_PEDIDO
  FOREIGN KEY (CODDIRECCION) REFERENCES DIRECCION(CODDIRECCION);


CREATE SEQUENCE NUMCLIENTE;
CREATE SEQUENCE NUMPEDIDO;
CREATE SEQUENCE NUMARTICULO;
CREATE SEQUENCE NUMFABRICA;


CREATE TABLE POSEE
(
  NUMCLIENTE   NUMBER(5),
  CODDIRECCION CHAR(8)
);

ALTER TABLE POSEE ADD CONSTRAINT PK_POSEE 
  PRIMARY KEY(NUMCLIENTE, CODDIRECCION);

ALTER TABLE POSEE ADD CONSTRAINT FK1_POSEE
  FOREIGN KEY(NUMCLIENTE) REFERENCES CLIENTE(NUMCLIENTE);

ALTER TABLE POSEE ADD CONSTRAINT FK2_POSEE 
  FOREIGN KEY(CODDIRECCION) REFERENCES DIRECCION(CODDIRECCION);


CREATE TABLE INCLUYE
(
  NUMPEDIDO   NUMBER(5),
  NUMARTICULO NUMBER(5),
  CANTIDAD    NUMBER(5)
);

ALTER TABLE INCLUYE ADD CONSTRAINT PK_INCLUYE 
  PRIMARY KEY(NUMPEDIDO,NUMARTICULO);

ALTER TABLE INCLUYE ADD CONSTRAINT FK1_INCLUYE 
  FOREIGN KEY(NUMPEDIDO) REFERENCES PEDIDO(NUMPEDIDO);

ALTER TABLE INCLUYE ADD CONSTRAINT FK2_INCLUYE 
  FOREIGN KEY(NUMARTICULO) REFERENCES ARTICULO(NUMARTICULO);


CREATE TABLE DISTRIBUYE
(
  NUMFABRICA     NUMBER(2),
  NUMARTICULO    NUMBER(5),
  CANTSUMINISTRO NUMBER(5),
  EXISTENCIAS    NUMBER(5)
);

ALTER TABLE DISTRIBUYE ADD CONSTRAINT PK_DISTRIBUYE
  PRIMARY KEY(NUMFABRICA,NUMARTICULO);

ALTER TABLE DISTRIBUYE ADD CONSTRAINT FK1_DISTRIBUYE 
  FOREIGN KEY(NUMFABRICA) REFERENCES FABRICA(NUMFABRICA);

ALTER TABLE DISTRIBUYE ADD CONSTRAINT FK2_DISTRIBUYE
  FOREIGN KEY(NUMARTICULO) REFERENCES ARTICULO(NUMARTICULO);
```


### 11. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E11, contraseña “E11”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE.  Crea índices para los siguientes campos: Nombre de Cliente, Nombre de Categoría, Nombre de Proveedor, Ciudad de Cliente. Crea una secuencia para IDVenta.

```
sqlplus / as sysdba
...
SQL> create user E11 identified by “E11”;
User created.
SQL> grant connect,resource to E11;
Grant succeeded.
SQL> connect E11/E11;
Connected.
```

```sql
CREATE TABLE CLIENTE 
(
  CODCLIENTE  NUMBER(5),
  NOMBRE      VARCHAR2(40),
  CALLE       VARCHAR2(40),
  NUMERO      NUMBER(3),
  COMUNA      VARCHAR2(40),
  CIUDAD      VARCHAR2(40)
);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE
  PRIMARY KEY (CODCLIENTE);

CREATE INDEX NOMBRECLIENTE_IDX ON CLIENTE(NOMBRE);
CREATE INDEX CIUDADCLIENTE_IDX ON CLIENTE(CIUDAD);


CREATE TABLE VENTA
(
  IDVENTA    NUMBER(7),
  MONTOTOTAL NUMBER,
  CODCLIENTE NUMBER(5)
);

ALTER TABLE VENTA ADD CONSTRAINT PK_VENTA
  PRIMARY KEY (IDVENTA);

ALTER TABLE VENTA ADD CONSTRAINT FK_CLIENTE 
  FOREIGN KEY(CODCLIENTE)
  REFERENCES CLIENTE(CODCLIENTE);

CREATE SEQUENCE NUMVENTA;

  
CREATE TABLE TELEFONO ( NUMERO CHAR (9) );

ALTER TABLE TELEFONO ADD CONSTRAINT PK_TELEFONO
  PRIMARY KEY (NUMERO);


CREATE TABLE CATEGORIA 
(
  IDCATEGORIA  NUMBER(3),
  NOMBRE       VARCHAR2(40),
  DESCRIPCION  VARCHAR2(100)
);

ALTER TABLE CATEGORIA ADD CONSTRAINT PK_CATEGORIA
  PRIMARY KEY (IDCATEGORIA);

CREATE INDEX NOMBRECATEGORIA_IDX ON CATEGORIA(NOMBRE);


CREATE TABLE PROVEEDOR
(
  CODPROVEEDOR NUMBER(5),
  NOMBRE       VARCHAR2(40),
  DIRECCION    VARCHAR2(40),
  TELEFONO     CHAR(9),
  WEB          VARCHAR2(100)
);

ALTER TABLE PROVEEDOR ADD CONSTRAINT PK_PROVEEDOR
  PRIMARY KEY (CODPROVEEDOR);

CREATE INDEX NOMBREPROVEEDOR_IDX ON PROVEEDOR(NOMBRE);


CREATE TABLE PRODUCTO
(
  IDPRODUCTO    NUMBER(5),
  NOMBRE        VARCHAR2(40),
  PRECIO        NUMBER,
  STOCK         NUMBER(6),
  IDCATEGORIA   NUMBER(3),
  IDPROVEEDOR   NUMBER(5)
);

ALTER TABLE PRODUCTO ADD CONSTRAINT PRODUCTO
  PRIMARY KEY (IDPRODUCTO);

ALTER TABLE PRODUCTO ADD CONSTRAINT FK1_PROD_CATEGORIA 
  FOREIGN KEY(IDCATEGORIA)
  REFERENCES CATEGORIA(IDCATEGORIA);
  
ALTER TABLE PRODUCTO ADD CONSTRAINT FK2_PROD_PROVEEDOR 
  FOREIGN KEY(IDPROVEEDOR)
  REFERENCES PROVEEDOR(CODPROVEEDOR);
  

CREATE TABLE ASOCIADO
(
  CODCLIENTE  NUMBER(5),
  NUMTELEFONO CHAR(9)
);

ALTER TABLE ASOCIADO ADD CONSTRAINT PK_ASOCIADO
  PRIMARY KEY (CODCLIENTE, NUMTELEFONO);

ALTER TABLE ASOCIADO ADD CONSTRAINT FK1_CLIENTE 
  FOREIGN KEY(CODCLIENTE)
  REFERENCES CLIENTE(CODCLIENTE);

ALTER TABLE ASOCIADO ADD CONSTRAINT FK2_TELEFONO 
  FOREIGN KEY(NUMTELEFONO)
  REFERENCES TELEFONO(NUMERO);


CREATE TABLE INCLUYE
(
  IDVENTA     NUMBER(7),
  IDPRODUCTO  NUMBER(5),
  CANTIDAD    NUMBER(5),
  PRECIOVENTA NUMBER
);

ALTER TABLE INCLUYE ADD CONSTRAINT PK_INCLUYE
  PRIMARY KEY (IDVENTA, IDPRODUCTO);

ALTER TABLE INCLUYE ADD CONSTRAINT FK1_INCLUYE 
  FOREIGN KEY(IDVENTA)
  REFERENCES VENTA(IDVENTA);

ALTER TABLE INCLUYE ADD CONSTRAINT FK2_INCLUYE 
  FOREIGN KEY(IDPRODUCTO)
  REFERENCES PRODUCTO(IDPRODUCTO);
```

  
### 12. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E12, contraseña “E12”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE. Crea índices para los siguientes campos: Apellidos de Empleado, Lugar de Edición, Horario de Edición.  Para el indicar si un prerrequisito es obligatorio o no utilizamos ‘S’ o ‘N’.

```
sqlplus / as sysdba
...
SQL> create user E12 identified by “E12”;
User created.
SQL> grant connect,resource to E12;
Grant succeeded.
SQL> connect E12/E12;
Connected.
```

```sql
CREATE TABLE EMPLEADO
(
  CODEMP    NUMBER(5),
  NIF       CHAR(9),
  NOMBRE    VARCHAR2(40),
  APELLIDOS VARCHAR2(40),
  DIRECCION VARCHAR2(40),
  TELEFONO  CHAR(9),
  FECHANAC  DATE,
  SALARIO   NUMBER
);

ALTER TABLE EMPLEADO ADD CONSTRAINT PK_EMPLEADO
  PRIMARY KEY(CODEMP);

CREATE INDEX APELLIDOS_EMP_IDX ON EMPLEADO(APELLIDOS);

  
CREATE TABLE EMPCAPACITADO ( CODEMP    NUMBER(5) );

ALTER TABLE EMPCAPACITADO ADD CONSTRAINT PK_EMPCAPACITADO
  PRIMARY KEY(CODEMP);

ALTER TABLE EMPCAPACITADO ADD CONSTRAINT FK_EMPCAPACITADO
  FOREIGN KEY(CODEMP) REFERENCES EMPLEADO(CODEMP);


CREATE TABLE EMPNOCAPACITADO ( CODEMP    NUMBER(5) );

ALTER TABLE EMPNOCAPACITADO ADD CONSTRAINT PK_EMPNOCAPACITADO
  PRIMARY KEY(CODEMP);

ALTER TABLE EMPNOCAPACITADO ADD CONSTRAINT FK_EMPNOCAPACITADO
  FOREIGN KEY(CODEMP) REFERENCES EMPLEADO(CODEMP);


CREATE TABLE CURSO
(
  CODCURSO  NUMBER(3),
  NOMBRE    VARCHAR2(40),
  DURACION  NUMBER(3),
  COSTE     NUMBER
);

ALTER TABLE CURSO ADD CONSTRAINT PK_CURSO
  PRIMARY KEY(CODCURSO);

  
CREATE TABLE EDICION
(
  CODCURSO    NUMBER(3),
  FECHAINICIO DATE,
  LUGAR       VARCHAR2(40),
  HORARIO     VARCHAR2(40),
  PROFESOR    NUMBER(5)
);

ALTER TABLE EDICION ADD CONSTRAINT PK_EDICION
  PRIMARY KEY(CODCURSO,FECHAINICIO);

ALTER TABLE EDICION ADD CONSTRAINT FK1_EDICION
  FOREIGN KEY(CODCURSO) REFERENCES CURSO(CODCURSO);

ALTER TABLE EDICION ADD CONSTRAINT FK2_EDICION
  FOREIGN KEY(PROFESOR) REFERENCES EMPCAPACITADO(CODEMP);

CREATE INDEX LUGAR_EDICION_IDX   ON EDICION(LUGAR);
CREATE INDEX HORARIO_EDICION_IDX ON EDICION(HORARIO);

  
CREATE TABLE RECIBE
(
  CODEMPLEADO NUMBER(5),
  CODCURSO    NUMBER(3),
  FECHAINICIO DATE
);

ALTER TABLE RECIBE ADD CONSTRAINT PK_RECIBE
  PRIMARY KEY(CODEMPLEADO,CODCURSO,FECHAINICIO);

ALTER TABLE RECIBE ADD CONSTRAINT FK1_RECIBE
  FOREIGN KEY(CODEMPLEADO) REFERENCES EMPLEADO(CODEMP);
  
ALTER TABLE RECIBE ADD CONSTRAINT FK2_RECIBE
  FOREIGN KEY(CODCURSO,FECHAINICIO) 
  REFERENCES EDICION(CODCURSO,FECHAINICIO);

  
CREATE TABLE PRERREQUISITO
(
  CURSOSOLICITADO NUMBER(3),
  CURSOPREVIO     NUMBER(3),
  OBLIGATORIO     CHAR(1)
);

ALTER TABLE PRERREQUISITO ADD CONSTRAINT PK_PRERREQUISITO
  PRIMARY KEY(CURSOSOLICITADO,CURSOPREVIO,OBLIGATORIO);

ALTER TABLE PRERREQUISITO ADD CONSTRAINT FK1_PRERREQUISITO
  FOREIGN KEY(CURSOSOLICITADO) REFERENCES CURSO(CODCURSO);
  
ALTER TABLE PRERREQUISITO ADD CONSTRAINT FK2_PRERREQUISITO
  FOREIGN KEY(CURSOPREVIO) REFERENCES CURSO(CODCURSO);
  
ALTER TABLE PRERREQUISITO ADD CONSTRAINT CK_OBLIGATORIO
  CHECK (OBLIGATORIO IN ('S', 'N'));  
```


### 13. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E13, contraseña “E13”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE. Crea una secuencia para IDCuenta, otra para IDNomina y otra para LineaNum.

```
sqlplus / as sysdba
...
SQL> create user E13 identified by “E13”;
User created.
SQL> grant connect,resource to E13;
Grant succeeded.
SQL> connect E13/E13;
Connected.
```

```sql
CREATE TABLE CCC
(
  IDCUENTA    NUMBER(7),
  CODBANCO    NUMBER(4),
  CODSUCURSAL NUMBER(4),
  NUMCUENTA   NUMBER(10)
);

ALTER TABLE CCC ADD CONSTRAINT PK_CCC
  PRIMARY KEY(IDCUENTA);

ALTER TABLE CCC ADD CONSTRAINT UQ_CCC
  UNIQUE (CODBANCO,CODSUCURSAL,NUMCUENTA);

CREATE SEQUENCE IDCUENTA;  

  
CREATE TABLE EMPLEADO
(
  CODEMP    NUMBER(5),
  NIF       CHAR(9),
  NOMBRE    VARCHAR2(40),
  NUMHIJOS  NUMBER(2),
  RETENCION NUMBER(4,2),
  TELEFONO  CHAR(9),
  IDCUENTA  NUMBER(7)
);

ALTER TABLE EMPLEADO ADD CONSTRAINT PK_EMPLEADO
  PRIMARY KEY(CODEMP);

ALTER TABLE EMPLEADO ADD CONSTRAINT UQ_EMPLEADO
  UNIQUE (NIF);
  
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EMPLEADO
  FOREIGN KEY(IDCUENTA) REFERENCES CCC(IDCUENTA);
  
  
CREATE TABLE NOMINA
(
    IDNOMINA     NUMBER(7),
    IDCUENTA     NUMBER(7),
    EJERCFISCAL  NUMBER(4),
    MES          VARCHAR2(15),
    NUMORDEN     NUMBER(1),
    CODEMP       NUMBER(5)
);

ALTER TABLE NOMINA ADD CONSTRAINT PK_NOMINA
  PRIMARY KEY(IDNOMINA);

ALTER TABLE NOMINA ADD CONSTRAINT UQ_NOMINA
  UNIQUE (IDCUENTA,EJERCFISCAL,MES,NUMORDEN);
  
ALTER TABLE NOMINA ADD CONSTRAINT FK1_NOMINA
  FOREIGN KEY(IDCUENTA) REFERENCES CCC(IDCUENTA);

ALTER TABLE NOMINA ADD CONSTRAINT FK2_NOMINA
  FOREIGN KEY(CODEMP) REFERENCES EMPLEADO(CODEMP);
  
CREATE SEQUENCE IDNOMINA;  
 

CREATE TABLE DEPARTAMENTO
(
  CODDPTO  NUMBER(3),
  NOMBRE   VARCHAR2(40)
);

ALTER TABLE DEPARTAMENTO ADD CONSTRAINT PK_DEPARTAMENTO
  PRIMARY KEY(CODDPTO);
  

CREATE TABLE SEDE
(
  CODSEDE  NUMBER(2),
  NOMBRE   VARCHAR2(40),
  CODDPTO  NUMBER(3)
);

ALTER TABLE SEDE ADD CONSTRAINT PK_SEDE
  PRIMARY KEY(CODSEDE);
  
ALTER TABLE SEDE ADD CONSTRAINT FK_SEDE
  FOREIGN KEY(CODDPTO) REFERENCES DEPARTAMENTO(CODDPTO);
  
  
CREATE TABLE TRABAJA
(
  CODEMP   NUMBER(5),
  CODDPTO  NUMBER(3),
  FUNCION  VARCHAR2(50)
);

ALTER TABLE TRABAJA ADD CONSTRAINT PK_TRABAJA
  PRIMARY KEY(CODEMP,CODDPTO);
  
ALTER TABLE TRABAJA ADD CONSTRAINT FK1_TRABAJA
  FOREIGN KEY(CODEMP) REFERENCES EMPLEADO(CODEMP);

ALTER TABLE TRABAJA ADD CONSTRAINT FK2_TRABAJA
  FOREIGN KEY(CODDPTO) REFERENCES DEPARTAMENTO(CODDPTO);


CREATE TABLE CONCEPTORETRIBUTIVO
(
  COD         NUMBER(2),
  DESCRIPCION VARCHAR2(100)
);

ALTER TABLE CONCEPTORETRIBUTIVO ADD CONSTRAINT PK_CONCEPTORETRIBUTIVO
  PRIMARY KEY (COD);
  
  
CREATE TABLE INGRESO 
(
  IDNOMINA  NUMBER(7),
  LINEANUM  NUMBER(3),
  CANTIDAD  NUMBER,
  CONCEPTO  NUMBER(2)
);

ALTER TABLE INGRESO ADD CONSTRAINT PK_INGRESO
  PRIMARY KEY (IDNOMINA,LINEANUM);

ALTER TABLE INGRESO ADD CONSTRAINT FK1_INGRESO
  FOREIGN KEY(IDNOMINA) REFERENCES NOMINA(IDNOMINA);
  
ALTER TABLE INGRESO ADD CONSTRAINT FK2_INGRESO
  FOREIGN KEY(CONCEPTO) REFERENCES CONCEPTORETRIBUTIVO(COD);
  
  
CREATE TABLE DESCUENTO 
(
  IDNOMINA   NUMBER(7),
  LINEANUM   NUMBER(3),
  CANTIDAD   NUMBER,
  BASE       NUMBER,
  PORCENTAJE NUMBER(4,2)
);

ALTER TABLE DESCUENTO ADD CONSTRAINT PK_DESCUENTO
  PRIMARY KEY (IDNOMINA,LINEANUM);
  
ALTER TABLE DESCUENTO ADD CONSTRAINT FK_DESCUENTO
  FOREIGN KEY(IDNOMINA) REFERENCES NOMINA(IDNOMINA);

CREATE SEQUENCE LINEANUM;
```


### 14. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E14, contraseña “E14”.  Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE.

```
sqlplus / as sysdba
...
SQL> create user E14 identified by “E14”;
User created.
SQL> grant connect,resource to E14;
Grant succeeded.
SQL> connect E14/E14;
Connected.
```

```sql
CREATE TABLE PARQUENATURAL 
(
  CODPN             NUMBER(4),
  NOMBRE            VARCHAR2(40),
  FECHADECLARACION  DATE
);

ALTER TABLE PARQUENATURAL ADD CONSTRAINT PK_PARQUE
  PRIMARY KEY(CODPN);

  
CREATE TABLE COMUNIDADAUTONOMA
(
  CODCA          NUMBER(4),
  NOMBRE         VARCHAR2(40),
  ORGRESONSABLE  VARCHAR2(40)
);

ALTER TABLE COMUNIDADAUTONOMA ADD CONSTRAINT PK_COMUNIDAD
  PRIMARY KEY(CODCA);


CREATE TABLE CA_PN
(
  CODCA NUMBER(4),
  CODPN NUMBER(4)
);

ALTER TABLE CA_PN ADD CONSTRAINT PK_CA_PN
  PRIMARY KEY(CODCA,CODPN);
  
ALTER TABLE CA_PN ADD CONSTRAINT FK1_CA_PN
  FOREIGN KEY(CODCA) REFERENCES COMUNIDADAUTONOMA(CODCA);

ALTER TABLE CA_PN ADD CONSTRAINT FK2_CA_PN
  FOREIGN KEY(CODPN) REFERENCES PARQUENATURAL(CODPN);


CREATE TABLE ENTRADA 
(
  CODENTRADA  NUMBER(2),   
  CODPN       NUMBER(4)
);

ALTER TABLE ENTRADA ADD CONSTRAINT PK_ENTRADA
  PRIMARY KEY(CODENTRADA);
  
ALTER TABLE ENTRADA ADD CONSTRAINT FK_ENTRADA
  FOREIGN KEY(CODPN) REFERENCES PARQUENATURAL(CODPN);
  
  
CREATE TABLE ALOJAMIENTO 
(
  CODALOJAMIENTO  NUMBER(2),   
  CATEGORIA       VARCHAR2(20),
  CAPACIDAD       NUMBER(3),
  CODPN           NUMBER(4)
);

ALTER TABLE ALOJAMIENTO ADD CONSTRAINT PK_ALOJAMIENTO
  PRIMARY KEY(CODALOJAMIENTO);
  
ALTER TABLE ALOJAMIENTO ADD CONSTRAINT FK_ALOJAMIENTO
  FOREIGN KEY(CODPN) REFERENCES PARQUENATURAL(CODPN);

  
CREATE TABLE EXCURSION 
(
  CODEXCURSION   NUMBER(4), 
  FECHA_HORA     DATE,
  APIE           CHAR(1),
  CODALOJAMIENTO NUMBER(2)
);

ALTER TABLE EXCURSION ADD CONSTRAINT PK_EXCURSION
  PRIMARY KEY(CODEXCURSION);
  
ALTER TABLE EXCURSION ADD CONSTRAINT FK_EXCURSION
  FOREIGN KEY(CODALOJAMIENTO) REFERENCES ALOJAMIENTO(CODALOJAMIENTO);

ALTER TABLE EXCURSION ADD CONSTRAINT CK_EXCURSION
  CHECK (APIE IN ('S', 'N'));


CREATE TABLE VISITANTE 
(
  DNI       CHAR(9), 
  NOMBRE    VARCHAR2(50),
  DOMICILIO VARCHAR2(100),
  PROFESION VARCHAR2(40)
);

ALTER TABLE VISITANTE ADD CONSTRAINT PK_VISITANTE
  PRIMARY KEY(DNI);


CREATE TABLE VISITANTE_EXCURSION
(
  CODEXCURSION NUMBER(4),
  DNI          CHAR(9)
);

ALTER TABLE VISITANTE_EXCURSION ADD CONSTRAINT PK_V_E
  PRIMARY KEY(CODEXCURSION,DNI);
  
ALTER TABLE VISITANTE_EXCURSION ADD CONSTRAINT FK1_V_E
  FOREIGN KEY(CODEXCURSION) REFERENCES EXCURSION(CODEXCURSION);

ALTER TABLE VISITANTE_EXCURSION ADD CONSTRAINT FK2_V_E
  FOREIGN KEY(DNI) REFERENCES VISITANTE(DNI);

  
CREATE TABLE VISITANTE_ALOJAMIENTO
(
  CODALOJAMIENTO NUMBER(2),
  DNI            CHAR(9),
  FECHAINICIO    DATE,
  FECHAFIN       DATE
);

ALTER TABLE VISITANTE_ALOJAMIENTO ADD CONSTRAINT PK_V_A
  PRIMARY KEY(CODALOJAMIENTO,DNI,FECHAINICIO);
  
ALTER TABLE VISITANTE_ALOJAMIENTO ADD CONSTRAINT FK1_V_A
  FOREIGN KEY(CODALOJAMIENTO) REFERENCES ALOJAMIENTO(CODALOJAMIENTO);

ALTER TABLE VISITANTE_ALOJAMIENTO ADD CONSTRAINT FK2_V_A
  FOREIGN KEY(DNI) REFERENCES VISITANTE(DNI);

  
CREATE TABLE AREA
(
  NOMBREAREA VARCHAR2(20),
  EXTENSION  NUMBER(4),
  CODPN      NUMBER(4)
);

ALTER TABLE AREA ADD CONSTRAINT PK_AREA
  PRIMARY KEY(NOMBREAREA);
  
ALTER TABLE AREA ADD CONSTRAINT FK1_AREA
  FOREIGN KEY(CODPN) REFERENCES PARQUENATURAL(CODPN);

  
CREATE TABLE ESPECIE
(
  CODESPECIE        NUMBER(4),
  NOMBRECIENTIFICO  VARCHAR2(100),
  NOMBREVULGAR      VARCHAR2(100)
);

ALTER TABLE ESPECIE ADD CONSTRAINT PK_ESPECIE
  PRIMARY KEY(CODESPECIE);


CREATE TABLE ESPECIE_AREA 
(
  CODESPECIE     NUMBER(4),
  NOMBREAREA     VARCHAR2(20),
  CANTINDIVIDUOS NUMBER(6)
);

ALTER TABLE ESPECIE_AREA ADD CONSTRAINT PK_E_A
  PRIMARY KEY(CODESPECIE,NOMBREAREA);
  
ALTER TABLE ESPECIE_AREA ADD CONSTRAINT FK1_E_A
  FOREIGN KEY(CODESPECIE) REFERENCES ESPECIE(CODESPECIE);

ALTER TABLE ESPECIE_AREA ADD CONSTRAINT FK2_E_A
  FOREIGN KEY(NOMBREAREA) REFERENCES AREA(NOMBREAREA);
  
  
CREATE TABLE ANIMAL
(
  CODESPECIE     NUMBER(4),
  ALIMENTACION   VARCHAR2(100),
  PERIODOCELO    VARCHAR2(20)
);

ALTER TABLE ANIMAL ADD CONSTRAINT PK_ANIMAL
  PRIMARY KEY(CODESPECIE);
  
ALTER TABLE ANIMAL ADD CONSTRAINT FK_ANIMAL
  FOREIGN KEY(CODESPECIE) REFERENCES ESPECIE(CODESPECIE);

  
  
CREATE TABLE VEGETAL
(
  CODESPECIE       NUMBER(4),
  FLORACION        VARCHAR2(20),
  PERIODOFLORACION VARCHAR2(20)
);

ALTER TABLE VEGETAL ADD CONSTRAINT PK_VEGETAL
  PRIMARY KEY(CODESPECIE);
  
ALTER TABLE VEGETAL ADD CONSTRAINT FK_VEGETAL
  FOREIGN KEY(CODESPECIE) REFERENCES ESPECIE(CODESPECIE);
  

CREATE TABLE MINERAL
(
  CODESPECIE  NUMBER(4),
  TIPO        VARCHAR2(20)
);

ALTER TABLE MINERAL ADD CONSTRAINT PK_MINERAL
  PRIMARY KEY(CODESPECIE);
  
ALTER TABLE MINERAL ADD CONSTRAINT FK_MINERAL
  FOREIGN KEY(CODESPECIE) REFERENCES ESPECIE(CODESPECIE);
  

CREATE TABLE PERSONAL
(
  DNI        CHAR(9),
  NSS        CHAR(12),
  NOMBRE     VARCHAR2(40),
  DIRECCION  VARCHAR2(100),
  TFNOFIJO   CHAR(9),
  TFNOMOVIL  CHAR(9),
  SUELDO     NUMBER,
  CODPN      NUMBER(4)
);

ALTER TABLE PERSONAL ADD CONSTRAINT PK_PERSONAL
  PRIMARY KEY(DNI);
  
ALTER TABLE PERSONAL ADD CONSTRAINT UQ_PERSONAL
  UNIQUE(NSS);
  
ALTER TABLE PERSONAL ADD CONSTRAINT FK_PERSONAL
  FOREIGN KEY(CODPN) REFERENCES PARQUENATURAL(CODPN);


CREATE TABLE CONSERVADOR
(
  DNI        CHAR(9),
  TAREA      VARCHAR2(40),
  NOMBREAREA VARCHAR2(20)
);

ALTER TABLE CONSERVADOR ADD CONSTRAINT PK_CONSERVADOR
  PRIMARY KEY(DNI);
  
ALTER TABLE CONSERVADOR ADD CONSTRAINT FK1_CONSERVADOR
  FOREIGN KEY(DNI) REFERENCES PERSONAL(DNI);
  
ALTER TABLE CONSERVADOR ADD CONSTRAINT FK2_CONSERVADOR
  FOREIGN KEY(NOMBREAREA) REFERENCES AREA(NOMBREAREA);

  
CREATE TABLE VIGILANTE
(
  DNI        CHAR(9),
  NOMBREAREA VARCHAR2(20)
);

ALTER TABLE VIGILANTE ADD CONSTRAINT PK_VIGILANTE
  PRIMARY KEY(DNI);
  
ALTER TABLE VIGILANTE ADD CONSTRAINT FK1_VIGILANTE
  FOREIGN KEY(DNI) REFERENCES PERSONAL(DNI);
  
ALTER TABLE VIGILANTE ADD CONSTRAINT FK2_VIGILANTE
  FOREIGN KEY(NOMBREAREA) REFERENCES AREA(NOMBREAREA);

  
CREATE TABLE INVESTIGADOR
(
  DNI        CHAR(9),
  TITULACION VARCHAR2(100)
);

ALTER TABLE INVESTIGADOR ADD CONSTRAINT PK_INVESTIGADOR
  PRIMARY KEY(DNI);
  
ALTER TABLE INVESTIGADOR ADD CONSTRAINT FK1_INVESTIGADOR
  FOREIGN KEY(DNI) REFERENCES PERSONAL(DNI);
  

CREATE TABLE GESTOR
(
  DNI        CHAR(9),
  CODENTRADA NUMBER(2)
);

ALTER TABLE GESTOR ADD CONSTRAINT PK_GESTOR
  PRIMARY KEY(DNI);
  
ALTER TABLE GESTOR ADD CONSTRAINT FK1_GESTOR
  FOREIGN KEY(DNI) REFERENCES PERSONAL(DNI);

ALTER TABLE GESTOR ADD CONSTRAINT FK2_GESTOR
  FOREIGN KEY(CODENTRADA) REFERENCES ENTRADA(CODENTRADA);
  

CREATE TABLE PROYECTO
(
  CODPROYECTO  NUMBER(4),
  PRESUPUESTO  NUMBER,
  FECHAINICIO  DATE,
  FECHAFIN     DATE,
  CODESPECIE   NUMBER(4)
);

ALTER TABLE PROYECTO ADD CONSTRAINT PK_PROYECTO
  PRIMARY KEY(CODPROYECTO);
  
ALTER TABLE PROYECTO ADD CONSTRAINT FK1_PROYECTO
  FOREIGN KEY(CODESPECIE) REFERENCES ESPECIE(CODESPECIE);

  
CREATE TABLE INVESTIGADOR_PROYECTO
(
  CODPROYECTO  NUMBER(4),
  DNI          CHAR(9)
);

ALTER TABLE INVESTIGADOR_PROYECTO ADD CONSTRAINT PK_I_P
  PRIMARY KEY(CODPROYECTO,DNI);
  
ALTER TABLE INVESTIGADOR_PROYECTO ADD CONSTRAINT FK1_I_P
  FOREIGN KEY(CODPROYECTO) REFERENCES PROYECTO(CODPROYECTO);
  
ALTER TABLE INVESTIGADOR_PROYECTO ADD CONSTRAINT FK2_I_P
  FOREIGN KEY(DNI) REFERENCES INVESTIGADOR(DNI);
```








## Prácticas

### PRÁCTICA 1

OBJETIVOS:  Realizar el diseño físico de bases de datos utilizando asistentes, herramientas gráficas y el lenguaje de definición de datos.

ENUNCIADO: Dado el siguiente esquema E/R:



a) Obtén el esquema relacional correspondiente.

b) Comprueba que está en 3FN.
Todas las tablas están en 3FN puesto que cumplen:
1FN: Todos los campos toman valores atómicos.
2FN: Todos los atributos no clave dependen funcionalmente de forma completa de su clave primaria.
3FN: No existen atributos con dependencias funcionales transitivas.
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

```sql
CREATE TABLE CLIENTE
(
  COD       NUMBER(6) PRIMARY KEY,
  NIF       CHAR(9) 
    CHECK (REGEXP_LIKE (NIF, '[0-9]{8}[A-Z]')) 
    UNIQUE,
  NOMBRE    VARCHAR2(50),
  DIRECCION VARCHAR2(100),
  TELEFONO  CHAR(9) CHECK (REGEXP_LIKE(TELEFONO, '[69][0-9]{8}')),
  CIUDAD    VARCHAR2(20)
);


CREATE TABLE COCHE
(
  MATRICULA  CHAR(7) 
    CHECK (REGEXP_LIKE (MATRICULA, '[0-9]{4}[A-Z]{3}') )
    PRIMARY KEY,
  MARCA      VARCHAR2(20) NOT NULL,
  MODELO     VARCHAR2(20) NOT NULL,
  COLOR      VARCHAR2(20) CHECK (COLOR IN ('ROJO', 'VERDE', 'AZUL')),
  PVP        NUMBER       CHECK (PVP BETWEEN 10000 AND 40000),
  CODCLIENTE NUMBER(6) REFERENCES CLIENTE
);


CREATE TABLE REVISION
(
  COD        NUMBER(7) PRIMARY KEY,
  FECHA      DATE,
  MATRICULA  CHAR(7) REFERENCES COCHE
);


CREATE TABLE OPERACION
(
  COD          NUMBER(3) PRIMARY KEY,
  DESCRIPCION  VARCHAR2(100),
  HORAS        NUMBER CHECK (HORAS > 0 AND HORAS <= 10)
);


CREATE TABLE CONSTA
(
  CODREVISION  NUMBER(7) REFERENCES REVISION,
  CODOPERACION NUMBER(3) REFERENCES OPERACION,
  PRIMARY KEY (CODREVISION,CODOPERACION)
);


CREATE TABLE MATERIAL
(
  COD    NUMBER(4) PRIMARY KEY,
  NOMBRE VARCHAR2(50),
  PRECIO NUMBER
);

CREATE TABLE NECESITA
(
  CODOPERACION NUMBER(3) REFERENCES OPERACION,
  CODMATERIAL  NUMBER(4) REFERENCES MATERIAL,
  PRIMARY KEY (CODOPERACION,CODMATERIAL)
);
```


### PRÁCTICA 2

OBJETIVO: Realizar el diseño físico de bases de datos utilizando asistentes, herramientas gráficas y el lenguaje de definición de datos.

ENUNCIADO: Dado el siguiente esquema E/R:

a) Obtén el esquema relacional correspondiente.
b) Comprueba que está en 3FN.
Todas las tablas están en 3FN puesto que cumplen:
1FN: Todos los campos toman valores atómicos.
2FN: Todos los atributos no clave dependen funcionalmente de forma completa de su clave primaria.
3FN: No existen atributos con dependencias funcionales transitivas.
c) Crea las tablas en ORACLE procurando que las columnas tengan el tipo y tamaño adecuado y con las siguientes restricciones:
1. Todas las claves primarias, ajenas y candidatas.
2. No hay partidos en verano (desde el 21/06 al 21/09)
3. Los partidos no pueden durar más de 100 minutos incluyendo el descuento.
4. La posición de un jugador puede ser Portero, Defensa, Centrocampista o Delantero.
5. Los jugadores han de tener como mínimo 16 años en el momento en que se dan de alta en la base de datos. 
6. Si no se sabe el aforo de un estadio, se guardará un 0 por defecto.
7. La fecha de un partido es un campo obligatorio.
8. Un partido se juega entre un EquipoLocal y EquipoVisitante (no pueden ser el mismo equipo.




d) Una vez creadas las tablas:
1. Añade una columna NumTitulos a la tabla Equipos.
2. Elimina la columna Ciudad.
3. Añade la restricción: Todos los equipos se han fundado después del año1890.
4. Añade la restricción: La hora de comienzo de los partidos estará entre las 12:00 y las 22:00 horas.

```sql
CREATE TABLE EQUIPO
(
  CODIGO  NUMBER(3) PRIMARY KEY,
  NOMBRE  VARCHAR2(50),
  ESTADIO VARCHAR2(50),
  AFORO   NUMBER(5) DEFAULT 0,
  CIUDAD  VARCHAR2(20)  
);


CREATE TABLE PRESIDENTE
(
  DNI            CHAR(9) PRIMARY KEY,
  NOMBRE         VARCHAR2(50),
  APELLIDOS      VARCHAR2(50),
  FECHAELECCION  DATE,
  FECHAALTA      DATE DEFAULT SYSDATE,
  FECHANAC       DATE, 
  EQUIPO         UNIQUE REFERENCES EQUIPO,
  CONSTRAINT EDAD 
    CHECK ( MONTHS_BETWEEN (FECHAALTA,FECHANAC) >= 16*12 )
);

CREATE TABLE PARTIDO
(
  CODIGO       NUMBER(3) PRIMARY KEY,
  FECHA        DATE NOT NULL,
  EQLOCAL      NUMBER(3) REFERENCES EQUIPO,
  EQVISITANTE  NUMBER(3) REFERENCES EQUIPO,
  CONSTRAINT FECHA_PARTIDOS
    CHECK (TO_CHAR(FECHA, 'MMDD') NOT BETWEEN '0621' AND '0921'),
  CONSTRAINT DIST_EQUIPOS
    CHECK (EQLOCAL <> EQVISITANTE)
);


CREATE TABLE JUGADOR
(
  CODIGO   NUMBER(4) PRIMARY KEY,
  NOMBRE   VARCHAR2(50),
  POSICION VARCHAR2(50) 
    CHECK (POSICION IN 
      ('PORTERO', 'DEFENSA', 'CENTROCAMPISTA','DELANTERO')),
  FECHANAC DATE
);


CREATE TABLE GOLES
(
  CODPARTIDO  NUMBER(3) REFERENCES PARTIDO,
  CODJUGADOR  NUMBER(3) REFERENCES JUGADOR,
  MINUTO      NUMBER(3) CHECK (MINUTO <= 100),
  DESCRIPCION VARCHAR2(100),
  PRIMARY KEY (CODPARTIDO,CODJUGADOR)
);



ALTER TABLE EQUIPO  ADD (NUMTITULOS NUMBER(2));
ALTER TABLE EQUIPO  DROP COLUMN CIUDAD;
ALTER TABLE EQUIPO  ADD (FUNDACION NUMBER(4) CHECK (FUNDACION > 1890) );
ALTER TABLE PARTIDO ADD CONSTRAINT HORA_PARTIDOS 
  CHECK (TO_CHAR(FECHA, 'HH24MI') BETWEEN '1200' AND '2200');
```


### PRÁCTICA 3

OBJETIVO: Realizar el diseño físico de bases de datos utilizando asistentes, herramientas gráficas y el lenguaje de definición de datos.

ENUNCIADO: Dado el siguiente esquema relacional crear en Oracle el modelo físico, asignando nombre a las restricciones.

```sql
CREATE TABLE EMPRESAS
(
  CIF       CHAR(9),
  NOMBRE    VARCHAR2(50),
  DIRECCION VARCHAR2(50),
  TELEFONO  CHAR(9),
  CONSTRAINT PK_EMPRESA PRIMARY KEY(CIF)
);


CREATE TABLE ALUMNOS
(
  DNI        CHAR(9),
  NOMBRE     VARCHAR2(50),
  APELLIDO1  VARCHAR2(50),
  APELLIDO2  VARCHAR2(50),
  TELEFONO   CHAR(9),
  EDAD       NUMBER,
  CIF        CHAR(9),
  CONSTRAINT PK_ALUMNOS PRIMARY KEY(DNI),
  CONSTRAINT FK_ALUMNOS FOREIGN KEY(CIF) REFERENCES EMPRESAS
);


CREATE TABLE PROFESORES
(
  DNI_PROF   CHAR(9),
  NOMBRE     VARCHAR2(50),
  APELLIDO1  VARCHAR2(50),
  APELLIDO2  VARCHAR2(50),
  DIRECCION  VARCHAR2(50),
  TELEFONO   CHAR(9),
  CONSTRAINT PK_PROFESORES PRIMARY KEY(DNI_PROF)
);


CREATE TABLE TIPOS_CURSO
(
  COD_TIPO_CURSO NUMBER(2),
  TITULO         VARCHAR2(50),
  DURACION       NUMBER,
  CONSTRAINT PK_TIPOS_CURSO PRIMARY KEY(COD_TIPO_CURSO)
);


CREATE TABLE CURSOS
(
  N_CURSO         NUMBER(3),
  FECHA_INICIO    DATE,
  FECHA_FIN       DATE,
  DNI_PROF        CHAR(9),
  COD_TIPO_CURSO  NUMBER(2),
  CONSTRAINT PK_CURSOS  PRIMARY KEY (N_CURSO),
  CONSTRAINT FK1_CURSOS FOREIGN KEY (DNI_PROF) REFERENCES PROFESORES,
  CONSTRAINT FK2_CURSOS FOREIGN KEY (COD_TIPO_CURSO) 
     REFERENCES TIPOS_CURSO
);


CREATE TABLE ASISTIR
(
  N_CURSO     NUMBER(3),
  DNI_ALUMNO  CHAR(9),
  NOTA        NUMBER,
  CONSTRAINT PK_ASISTIR  PRIMARY KEY (N_CURSO,DNI_ALUMNO),
  CONSTRAINT FK1_ASISTIR FOREIGN KEY (N_CURSO) REFERENCES CURSOS,
  CONSTRAINT FK2_ASISTIR FOREIGN KEY (DNI_ALUMNO) REFERENCES ALUMNOS
);
```
