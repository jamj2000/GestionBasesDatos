# ACTIVIDADES RESUELTAS
# MODIFICACIÓN DE BASES DE DATOS.  LENGUAJE DE MANIPULACIÓN DE DATOS

> IES Luis Vélez de Guevara
> Departamento de Informática


## Práctica 1
> INSERT / UPDATE / DELETE
Haciendo uso del esquema E01 cuyo diseño físico realizamos en el tema 3, realiza las operaciones de manipulación de datos indicadas a continuación.

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
```

### 1. Realiza las siguientes inserciones (los datos puedes inventarlos).
- Inserta 2 profesores.
- Inserta 4 asignaturas.
- Inserta 10 alumnos.
- Cada alumno debe realizar al menos 2 asignaturas.

```sql
-- 1. Inserción de datos 
INSERT INTO PROFESOR 
VALUES (1, '12453645M', 'PACO',  'MATEMÁTICAS', '935210487');

INSERT INTO PROFESOR 
VALUES (2, '12453646N', 'LUCIA', 'LENGUAJE',    '998210487');


INSERT INTO ASIGNATURA VALUES ('MATEMA', 'MATEMÁTICAS', 1);
INSERT INTO ASIGNATURA VALUES ('LENGUA', 'LENGUA',      2);
INSERT INTO ASIGNATURA VALUES ('BIOLOG', 'BIOLOGÍA',    1);
INSERT INTO ASIGNATURA VALUES ('QUIMIC', 'QUÍMICA',     2);


INSERT INTO ALUMNO VALUES (100, 'ANA',       '08/12/1993', '658171701');
INSERT INTO ALUMNO VALUES (102, 'PEPE',      '09/12/1993', '659271789');
INSERT INTO ALUMNO VALUES (103, 'JUAN',      '10/12/1992', '660771709');
INSERT INTO ALUMNO VALUES (104, 'RODOLFO',   '08/11/1990', '689271708');
INSERT INTO ALUMNO VALUES (105, 'ANGUSTIAS', '09/11/1993', '698191707');
INSERT INTO ALUMNO VALUES (106, 'AURELIO',   '10/11/1993', '695171706');
INSERT INTO ALUMNO VALUES (107, 'ANACLETO',  '12/03/1992', '620771705');
INSERT INTO ALUMNO VALUES (108, 'EUSEBIO',   '20/04/1993', '689171704');
INSERT INTO ALUMNO VALUES (109, 'EUSTAQUIO', '25/05/1991', '641171703');
INSERT INTO ALUMNO VALUES (110, 'AMAPOLO',   '27/06/1993', '689171702');


INSERT INTO RECIBE VALUES (100, 'MATEMA', '2016/2017');
INSERT INTO RECIBE VALUES (100, 'LENGUA', '2016/2017');
INSERT INTO RECIBE VALUES (102, 'MATEMA', '2016/2017');
INSERT INTO RECIBE VALUES (102, 'LENGUA', '2016/2017');
INSERT INTO RECIBE VALUES (103, 'MATEMA', '2016/2017');
INSERT INTO RECIBE VALUES (103, 'LENGUA', '2016/2017');
INSERT INTO RECIBE VALUES (104, 'MATEMA', '2016/2017');
INSERT INTO RECIBE VALUES (104, 'LENGUA', '2016/2017');
INSERT INTO RECIBE VALUES (105, 'BIOLOG', '2016/2017');
INSERT INTO RECIBE VALUES (105, 'QUIMIC', '2016/2017');
INSERT INTO RECIBE VALUES (106, 'BIOLOG', '2016/2017');
INSERT INTO RECIBE VALUES (106, 'QUIMIC', '2016/2017');
INSERT INTO RECIBE VALUES (107, 'BIOLOG', '2002/2003');
INSERT INTO RECIBE VALUES (107, 'LENGUA', '2002/2003');
INSERT INTO RECIBE VALUES (108, 'BIOLOG', '2016/2017');
INSERT INTO RECIBE VALUES (108, 'QUIMIC', '2016/2017');
INSERT INTO RECIBE VALUES (109, 'LENGUA', '2002/2003');
INSERT INTO RECIBE VALUES (109, 'BIOLOG', '2002/2003');
INSERT INTO RECIBE VALUES (110, 'QUIMIC', '2001/2002');
INSERT INTO RECIBE VALUES (110, 'BIOLOG', '2001/2002');
```

### 2. Introduce 2 profesores con el mismo NIF. ¿Qué sucede? ¿Por qué?
```sql
-- 2. Inserción de registros con la misma clave primaria.
-- Da error puesto que no puede haber dos registros 
-- con la misma clave primaria. 
-- La clave primaria siempre tiene las restricciones 
-- de unicidad y valor no nulo.
INSERT INTO PROFESOR  
VALUES (3, '12453640B', 'JUAN', 'MATEMÁTICAS', '635210480');

INSERT INTO PROFESOR 
VALUES (3, '12453641C', 'JOSE', 'LENGUAJE',    '698210481');
```


### 3. Introduce 2 alumnos con el mismo NumMatrícula. ¿Qué sucede? ¿Por qué?
```sql
-- 3. Inserción de registros con la misma clave primaria.
-- Da error puesto que no puede haber dos registros con 
-- la misma clave primaria. 
-- La clave primaria siempre tiene las restricciones 
-- de unicidad y valor no nulo.
INSERT INTO ALUMNO VALUES (111, 'EVA',  '08/12/1993', '648171701');
INSERT INTO ALUMNO VALUES (111, 'LISA', '09/12/1993', '649271789');
```


### 4. Introduce 3 alumnos para los cuales no conocemos el número de teléfono.
```sql
-- 4. Inserción de registros con valores nulos. 3 formas distintas.
INSERT INTO ALUMNO VALUES (112, 'LORENA', '20/04/1993', NULL);

INSERT INTO ALUMNO (NUMMATRICULA, NOMBRE, FECHANACIMIENTO)
VALUES (113, 'VANESA', '25/05/1991');

INSERT INTO ALUMNO (NOMBRE, FECHANACIMIENTO, NUMMATRICULA)
VALUES ('SILVIA', '27/06/1993', 114);
```

### 5. Modifica los datos de los 3 alumnos anteriores para establecer un número de teléfono.
```sql
-- 5. Actualización de campos de registro con valores nulos.
UPDATE ALUMNO SET TELEFONO = '652148568' WHERE NUMMATRICULA = 112;
UPDATE ALUMNO SET TELEFONO = '653148568' WHERE NUMMATRICULA = 113;
UPDATE ALUMNO SET TELEFONO = '669148568' WHERE NUMMATRICULA = 114;
```


### 6. Para todos los alumnos, poner 2000 como año de nacimiento.
```sql
-- 6. Actualización de año en un campo de fecha.
UPDATE ALUMNO SET FECHANACIMIENTO = TO_CHAR(FECHANACIMIENTO,'DDMM')||'2000';
```


### 7. Para los profesores que tienen número de teléfono y NIF no comience por 9, poner 'Informática' como especialidad.
```sql
-- 7. Actualización de campo si se cumple una condición.
UPDATE PROFESOR SET ESPECIALIDAD = 'INFORMATICA' 
WHERE TELEFONO IS NOT NULL AND NIF_P NOT LIKE '9%';
```


### 8. Cambia la asignación de asignaturas para los profesores. Es decir, las asignaturas impartidas por un profesor las dará el otro profesor y viceversa.
```sql
-- 8. Actualización. Intercambio de valores.
-- Para poder hacer el intercambio necesitamos un valor intermedio.
UPDATE PROFESOR SET ESPECIALIDAD = 'TEMP'        
WHERE ESPECIALIDAD = 'MATEMÁTICAS';

UPDATE PROFESOR SET ESPECIALIDAD = 'MATEMÁTICAS' 
WHERE ESPECIALIDAD = 'LENGUAJE';

UPDATE PROFESOR SET ESPECIALIDAD = 'LENGUAJE'    
WHERE ESPECIALIDAD = 'TEMP';
```


### 9. En la tabla Recibe borra todos los registros que pertenecen a una de las asignaturas.
```sql
-- 9. Borrado de registros en una Relación. 
DELETE RECIBE WHERE CODASIGNATURA = 'LENGUA';
```


### 10. En la tabla Asignatura borra dicha asignatura.
```sql
-- 10. Borrado de registros de una Entidad sin relaciones. 
DELETE ASIGNATURA WHERE CODASIGNATURA = 'LENGUA';
```


### 11. Borra el resto de asignaturas. ¿Qué sucede? ¿Por qué? ¿Como lo solucionarías? ¿Podría haberse evitado el problema con otro diseño físico?¿Cómo?
```sql
-- 11. Borrado de registros de una Entidad con relaciones. 
-- No nos permite borrar directamente los registros de 
-- la tabla ASIGNATURA, ya que dichos registros participan 
-- en una relación. 
-- No tendríamos esta limitación si en el diseño físico 
-- hubiésemos definido la clave foránea que apunta a CODASIGNATURA 
-- con la cláusula ON DELETE CASCADE.
DELETE ASIGNATURA;
```


### 12. Borra todos los profesores. ¿Qué sucede? ¿Por qué? ¿Como lo solucionarías? ¿Podría haberse evitado el problema con otro diseño físico?¿Cómo?
```sql
-- 12. Borrado de registros de una Entidad con relaciones. 
-- No nos permite borrar directamente los registros de la tabla PROFESOR
-- ya que dichos registros participan en una relación.
-- No tendríamos esta limitación si en el diseño físico 
-- hubiésemos definido la clave foránea que apunta a IDPROFESOR
-- con la cláusula ON DELETE CASCADE.
DELETE PROFESOR;
```


### 13. Borra todos los alumnos. ¿Qué sucede? ¿Por qué? ¿Como lo solucionarías? ¿Podría haberse evitado el problema con otro diseño físico?¿Cómo?
```sql
-- 13. Borrado de registros de una Entidad con relaciones. 
-- No nos permite borrar directamente los registros de la tabla ALUMNO
-- ya que dichos registros participan en una relación.
-- No tendríamos esta limitación si en el diseño físico 
-- hubiésemos definido la clave foránea que apunta a NUMMATRICULA
-- con la cláusula ON DELETE CASCADE.
DELETE ALUMNO;
```



```sql
-- NOTA:
-- En las 3 actividades anteriores la solución pasa por eliminar 
-- la restricción de clave foránea y volverla a añadir con la cláusula
-- ON DELETE CASCADE.
-- Podemos conseguir esto cambiando el diseño físico:
-- ALTER TABLE RECIBE DROP CONSTRAINT FK2...;
-- ALTER TABLE RECIBE ADD  CONSTRAINT FK2... 
--   FOREIGN KEY(CODASIGNATURA) REFERENCES ASIGNATURA ON DELETE CASCADE;

-- ALTER TABLE ASIGNATURA DROP CONSTRAINT FK1...;
-- ALTER TABLE ASIGNATURA ADD  CONSTRAINT FK1... 
--   FOREIGN KEY(IDPROFESOR) REFERENCES PROFESOR ON DELETE CASCADE;

-- ALTER TABLE RECIBE DROP CONSTRAINT FK1...;
-- ALTER TABLE RECIBE ADD  CONSTRAINT FK1... 
--   FOREIGN KEY(NUMMATRICULA) REFERENCES ALUMNO ON DELETE CASCADE;

-- Sin embargo la solución se complica bastante puesto que 
-- en el diseño físico habíamos creado las restricciones
-- sin ponerle nombre.
-- Este es uno de los motivos por lo que es importante poner nombre a 
-- las restricciones. Así, si luego necesitamos modificar 
-- el diseño físico podremos hacerlo de forma sencilla. 
```



## Práctica 2
> INSERT / UPDATE / DELETE
Haciendo uso del esquema E07 cuyo diseño físico realizamos en el tema 3, realiza las operaciones de manipulación de datos indicadas a continuación.
Teniendo en cuenta las siguientes restricciones que teníamos declaradas:
- No pueden ser nulos los siguientes campos: Nombre de Socio, Título de Película. 
- Sexo toma los valores H o M.
- Por defecto si no se indica nada un actor o actriz no es Protagonista (este campo toma valores S o N).
- FechaDevolución debe ser mayor que FechaAlquiler.

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
  ACTOR        VARCHAR2(40) 
    CONSTRAINT FK1_ACTUA REFERENCES ACTORES ON DELETE CASCADE,  
  IDPELICULA   NUMBER 
    CONSTRAINT FK2_ACTUA REFERENCES PELICULA ON DELETE CASCADE, 
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


### 1. Realiza las siguientes inserciones (los datos puedes inventarlos).
- Inserta 2 directores.
- Inserta 4 películas. Todas ellas están dirigidas por alguno de los directores anteriores.
- Inserta 2 ejemplares de cada película.
- Inserta 4 socios.
- Inserta como mínimo 6 actores.
- Cada película debe tener al menos el actor/atriz protagonista asociado.
- Todos los ejemplares deben tener al menos 1 alquiler.

```sql
-- 1. Inserción de datos 
INSERT INTO DIRECTOR VALUES ('JUAN',  'ESPAÑOLA');
INSERT INTO DIRECTOR VALUES ('PEDRO', 'ESPAÑOLA');


INSERT INTO PELICULA 
VALUES (001, 'LA GRANJA', 'TELE5', 'RUSA', '10/03/1987', 'JUAN');

INSERT INTO PELICULA 
VALUES (002, 'MANDINGO', 'ANTENA3', 'JAPONESA', '11/03/1988', 'JUAN');

INSERT INTO PELICULA 
VALUES (003, 'FRANCO', 'INTERECONOMIA','ESPAÑOLA', '01/01/1990', 'PEDRO');

INSERT INTO PELICULA VALUES (004, 'COSMOS',V'TELE5', 'ITALIANA', '15/10/2000', 'PEDRO');


INSERT INTO EJEMPLAR VALUES (001, 01, 'BIEN');
INSERT INTO EJEMPLAR VALUES (001, 02, 'MAL');

INSERT INTO EJEMPLAR VALUES (002, 01, 'BIEN');
INSERT INTO EJEMPLAR VALUES (002, 02, 'MAL');

INSERT INTO EJEMPLAR VALUES (003, 01, 'BIEN');
INSERT INTO EJEMPLAR VALUES (003, 02, 'REGULAR');

INSERT INTO EJEMPLAR VALUES (004, 01, 'BIEN');
INSERT INTO EJEMPLAR VALUES (004, 02, 'REGULAR');


INSERT INTO SOCIO 
VALUES (15405978, 'DANIEL', 'C/ NUEVA, 1', 697565656, NULL);

INSERT INTO SOCIO 
VALUES (15405979, 'ANA',    'C/ ANCHA, 5', 697545454, 15405978);

INSERT INTO SOCIO 
VALUES (15405971, 'SILVIA', 'C/ FORT,  4', 697121212, 15405979);

INSERT INTO SOCIO 
VALUES (15405972, 'XAVI',   'C/ ANCHA, 2', 197232323, 15405971);


INSERT INTO ACTORES VALUES ('PENELOPE',  'ESPAÑOLA', 'M');
INSERT INTO ACTORES VALUES ('FRANCESCO', 'ITALIANA', 'H');
INSERT INTO ACTORES VALUES ('ANA',       'POLACA',   'M');
INSERT INTO ACTORES VALUES ('CARMEN',    'ESPAÑOLA', 'M');
INSERT INTO ACTORES VALUES ('ANDREA',    'ITALIANA', 'H');
INSERT INTO ACTORES VALUES ('VLADIMIR',  'RUSA',     'H');


INSERT INTO ACTUA VALUES ('ANDREA',   001, 'S');
INSERT INTO ACTUA VALUES ('VLADIMIR', 001, 'N');
INSERT INTO ACTUA VALUES ('CARMEN',   002, 'S');
INSERT INTO ACTUA VALUES ('PENELOPE', 003, 'S');
INSERT INTO ACTUA VALUES ('FRANCESCO',003, 'N');
INSERT INTO ACTUA VALUES ('ANA',      004, 'S');


INSERT INTO ALQUILA 
VALUES (15405978, 001,01, '01/01/2017', '03/01/2017');

INSERT INTO ALQUILA 
VALUES (15405979, 001,02, '01/01/2017', '03/01/2017');

INSERT INTO ALQUILA 
VALUES (15405971, 002,01, '01/02/2017', '03/02/2017');

INSERT INTO ALQUILA 
VALUES (15405978, 002,02, '01/02/2017', '03/02/2017');

INSERT INTO ALQUILA 
VALUES (15405972, 003,01, '01/03/2017', '03/03/2017');

INSERT INTO ALQUILA 
VALUES (15405972, 003,02, '01/03/2017', '03/03/2017');

INSERT INTO ALQUILA 
VALUES (15405979, 004,01, '01/04/2017', '03/04/2017');

INSERT INTO ALQUILA 
VALUES (15405979, 004,02, '01/04/2017', '03/04/2017');
```


### 2. Inserta valores para comprobar que la siguiente restricción funciona correctamente:
```sql
- No pueden ser nulos los siguientes campos: Nombre de Socio, Título de Película.
-- 2. Comprobación de restricciones
INSERT INTO SOCIO 
VALUES (15405918, NULL, 'C/ ROSAL, 3', 697565656, NULL);
-- El campo de nombre no puede ser nulo, puesto que tiene 
-- una restricción de valor no nulo.

INSERT INTO PELICULA 
VALUES (010, NULL, 'TELE5', 'RUSA', '10/03/1987', 'JUAN');
-- El campo título sí puede estar a nulo, puesto que no es 
-- clave primaria, ni tiene restricción de valor no nulo.
```


### 3. Inserta valores para comprobar que la siguiente restricción funciona correctamente:
- Sexo toma los valores H o M.

-- 3. Comprobación de restricciones
```sql
INSERT INTO ACTORES VALUES ('PUTIN', 'RUSA',     'H');
INSERT INTO ACTORES VALUES ('KIM',   'AMERICANA','M');
INSERT INTO ACTORES VALUES ('ROSA',  'RUSA',     'K'); 
-- La última inserción da error, puesto que sólo se permiten 
-- valores H o M para el campo sexo.
```


### 4. Inserta valores para comprobar que la siguiente restricción funciona correctamente:
- Por defecto si no se indica nada un actor o actriz no es Protagonista (este campo toma valores S o N).

```sql
-- 4. Comprobación de restricciones
INSERT INTO ACTUA (ACTOR, IDPELICULA) VALUES ('ANA', 002);
-- Si no indicamos valor para el campo protagonista, se introduce 
-- el indicado por defecto en la restricción, es decir, valor N.

SELECT * FROM ACTUA WHERE ACTOR = 'ANA' AND IDPELICULA = 002;
```


### 5. Inserta valores para comprobar que la siguiente restricción funciona correctamente:
- FechaDevolución debe ser mayor que FechaAlquiler.

```sql
-- 5. Comprobación de restricciones
INSERT INTO ALQUILA 
VALUES (15405972, 004,01, '01/03/2017', '03/02/2017');
-- Dará error, puesto que tenemos una restricción tipo CHECK que
-- obliga a que la fecha de devolución sea mayor a la fecha de alquiler.
```


### 6. Cambia la nacionalidad para los directores. Por ejemplo de 'Estadounidense' a 'USA' o similar, dependiendo de los valores que hayas introducido.
```sql
-- 6. Actualización de registros.
UPDATE DIRECTOR SET NACIONALIDAD = 'ESP' 
WHERE NACIONALIDAD = 'ESPAÑOLA';
```


### 7. Cambia la nacionalidad para los actores. Por ejemplo de 'Estadounidense' a 'USA' o similar, dependiendo de los valores que hayas introducido.
```sql
-- 7. Actualización de registros.
UPDATE ACTORES SET NACIONALIDAD = 'ESP' 
WHERE NACIONALIDAD = 'ESPAÑOLA';
```


### 8. Modifica los datos de todos los socios para que el avalista sea un único socio, siempre el mismo para todos, excepto para el avalista mismo que no dispone de ninguno.
```sql
-- 8. Actualización de registros.
UPDATE SOCIO SET AVALADOR = '15405978' WHERE DNI != 15405978;
```


### 9. Elimina los socios cuyo número de teléfono empiece por una cifra inferior a 5. ¿Qué sucede?¿Por qué?
```sql
-- 9. Eliminación de registros que posiblemente participan
-- en una relación.
DELETE SOCIO WHERE REGEXP_LIKE(TELEFONO, '[0-4].*');
-- Al borrar los registros, si dichos registros participan
-- en una relación, por ejemplo en la relación alquiler, no nos 
-- va a dejar eliminarlos.
```


### 10. Elimina los socios cuyo número de teléfono empiece por una cifra superior o igual a 5. ¿Qué sucede?¿Por qué?
```sql
-- 10. Eliminación de registros que posiblemente participan
-- en una relación.
DELETE SOCIO WHERE REGEXP_LIKE(TELEFONO, '[5-9].*');
-- Al borrar los registros, si dichos registros participan 
-- en una relación, por ejemplo en la relación alquiler, no nos 
-- va a dejar eliminarlos.
```


### 11. ¿Como lo solucionarías los problemas anteriores? ¿Podría haberse evitado el problema con otro diseño físico?¿Cómo?
```sql
-- 11. Modificación de FK para añadir ON DELETE CASCADE.
-- La mejor forma de proceder sería eliminar la clave foránea FK1_DNI
-- de la tabla ALQUILA y volverla a crear con la cláusula
-- ON DELETE CASCADE.
-- Después de esto, ya podemos ejecutar las 2 sentencias anteriores.
ALTER TABLE ALQUILA DROP CONSTRAINT FK1_DNI;
ALTER TABLE ALQUILA ADD  CONSTRAINT FK1_DNI FOREIGN KEY(DNI)
  REFERENCES SOCIO ON DELETE CASCADE;
```


### 12. Elimina todos los directores. ¿Qué sucede?¿Por qué?
```sql
-- 12. Modificación de FK.
DELETE DIRECTOR;
-- No permite la eliminación de registros, puesto que dichos directores
-- tienen películas asociadas. 
-- Podríamos modificar la FK_DIRECTOR de la tabla PELICULA para añadir
-- la cláusula ON DELETE CASCADE, pero en este caso es más aconsejable
-- establecer la cláusula ON DELETE SET NULL. En tanto que PELICULA es
-- una entidad fuerte y existen datos que con toda seguridad desearemos
-- mantener, es mejor esta segunda solución. 
-- Después de esto, ya podemos eliminar los directores sin afectar
-- a las películas.
ALTER TABLE PELICULA DROP CONSTRAINT FK_DIRECTOR;
ALTER TABLE PELICULA ADD  CONSTRAINT FK_DIRECTOR FOREIGN KEY(DIRECTOR)
  REFERENCES DIRECTOR ON DELETE SET NULL;
```


### 13. Elimina 2 películas, las que desees.¿Qué sucede?¿Por qué?¿Como lo solucionarías? ¿Podría haberse evitado el problema con otro diseño físico?¿Cómo?
```sql
-- 13. Modificación de FK.
DELETE PELICULA WHERE ID = 001 OR ID = 002;
-- No permite la eliminación de registros, puesto que dichas películas
-- tienen ejemplares asociados y además, probablemente, aparezcan en la 
-- relación ACTUA. La entidad EJEMPLAR es una entidad débil, cuya 
-- existencia no tiene sentido sin la entidad fuerte, y la relación
-- ACTUA no guarda datos de ninguna entidad, solo sus relaciones.
-- En ambos casos sí es aconsejable usar ON DELETE CASCADE.
-- Después de esto, ya podemos ejecutar la sentencia anterior.
ALTER TABLE EJEMPLAR DROP CONSTRAINT FK_EJEMPLAR;
ALTER TABLE EJEMPLAR ADD  CONSTRAINT FK_EJEMPLAR FOREIGN KEY(IDPELICULA)
  REFERENCES PELICULA ON DELETE CASCADE;

ALTER TABLE ACTUA DROP CONSTRAINT FK2_ACTUA;
ALTER TABLE ACTUA ADD  CONSTRAINT FK2_ACTUA FOREIGN KEY(IDPELICULA)
  REFERENCES PELICULA ON DELETE CASCADE;
```



## Práctica 3
> PL/SQL: Introducción
> NOTA: Las siguientes prácticas se realizarán dentro del esquema EMPLEADOS.

```
-- SQLPLUS EMPLEADOS/EMPLEADOS
-- SQL> SHOW USER
-- USER IS "EMPLEADOS"
```


### 1. Realiza una conexión utilizando el cliente SQL*Plus y muestra el valor de las siguientes variables: USER, ESCAPE, LINESIZE, COLSEP, PAGESIZE, ECHO, SQLPROMPT
```
SHOW USER
SHOW ESCAPE
SHOW LINESIZE
SHOW COLSEP
SHOW PAGESIZE
SHOW ECHO
SHOW SQLPROMPT
```


### 2. Desde el cliente SQL*Plus muestra el valor de las variables AUTOCOMMIT y SERVEROUTPUT.
```
SHOW AUTOCOMMIT
-- autocommit OFF

SHOW SERVEROUTPUT
-- serveroutput OFF
```


### 3.  Desde el cliente SQL*Plus ejecuta el comando HELP SHOW para ver la ayuda acerca del comando SHOW.
```
HELP SHOW
```


### 4.  Desde el cliente SQL*Plus ejecuta el comando HELP SET para ver la ayuda acerca del comando SET.
```
HELP SET
```


### 5. Desde el cliente SQL*Plus pon a ON las variables SERVEROUTPUT y AUTOCOMMIT.
```
SET SERVEROUTPUT ON
SET AUTOCOMMIT   ON
```


### 6. Crea un esquema llamado PLSQL con contraseña PLSQL y rol DBA para realizar las siguientes actividades.Ejecuta el siguiente bloque. Indica cuál es la salida.
```sql
BEGIN
  IF 10 > 5 THEN
    DBMS_OUTPUT.PUT_LINE ('Cierto');
  ELSE
    DBMS_OUTPUT.PUT_LINE ('Falso');
  END IF;
END;
/
-- Salida: 
-- Cierto
```


### 7. Ejecuta el siguiente bloque. Indica cuál es la salida.
```sql
BEGIN
 IF 10 > 5 AND 5 > 1 THEN
   DBMS_OUTPUT.PUT_LINE ('Cierto');
 ELSE
   DBMS_OUTPUT.PUT_LINE ('Falso');
 END IF;
END;
/
-- Salida: 
-- Cierto
```


### 8. Ejecuta el siguiente bloque. Indica cuál es la salida.
```sql
BEGIN
 IF 10 > 5 AND 5 > 50 THEN
   DBMS_OUTPUT.PUT_LINE ('Cierto');
 ELSE
   DBMS_OUTPUT.PUT_LINE ('Falso');
 END IF;
END;
/
-- Salida: 
-- Falso
```


### 9. Ejecuta el siguiente bloque. Indica cuál es la salida.
```sql
BEGIN
 CASE 
   WHEN 10 > 5 AND 5 > 50  THEN 
     DBMS_OUTPUT.PUT_LINE ('Cierto');
   ELSE
     DBMS_OUTPUT.PUT_LINE ('Falso');
 END CASE;
END;
/
-- Salida: 
-- Falso
```


### 10. Ejecuta el siguiente bloque. Indica cuál es la salida.
```sql
BEGIN
  FOR i IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;
END;
/
-- Salida: Números entre 1 y 10
-- 1 
-- 2
-- 3
-- ...
-- 9
-- 10
```


### 11. Ejecuta el siguiente bloque. Indica cuál es la salida.
```sql
BEGIN
  FOR i IN REVERSE 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE (i);
  END LOOP;
END;
/
-- Salida: Números entre 10 y 1
-- 10 
-- 9
-- 8
-- ...
-- 2
-- 1
```


### 12. Ejecuta el siguiente bloque. Indica cuál es la salida.
```sql
DECLARE
  num NUMBER(3) := 0;
BEGIN
  WHILE num<=100 LOOP
    DBMS_OUTPUT.PUT_LINE (num);
    num:= num+2;
  END LOOP;
END;
/
-- Salida: Números pares entre 0 y 100
-- 0
-- 2
-- 4
-- ...
-- 98
-- 100
```


### 13. Ejecuta el siguiente bloque. Indica cuál es la salida.
```sql
DECLARE
  num NUMBER(3) := 0;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE (num);
    IF num > 100 THEN EXIT; END IF;
    num:= num+2;
  END LOOP;
END;
/
-- Salida: Números pares entre 0 y 102
-- 0
-- 2
-- 4
-- ...
-- 100
-- 102
```


### 14. Ejecuta el siguiente bloque. Indica cuál es la salida.

```sql
DECLARE
  num NUMBER(3) := 0;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE (num);
    EXIT WHEN num > 100;
    num:= num+2;
  END LOOP;
END;
/
-- Salida: Números pares entre 0 y 102
-- 0
-- 2
-- 4
-- ...
-- 100
-- 102
```


## Práctica 4
> PL/SQL: Procedimientos y Funciones

### 1. Crea un procedimiento llamado ESCRIBE para mostrar por pantalla el mensaje HOLA MUNDO.
```sql
CREATE OR REPLACE
PROCEDURE ESCRIBE IS
BEGIN
  DBMS_OUTPUT.PUT_LINE ('HOLA MUNDO');
END ESCRIBE;
/
```


### 2. Crea un procedimiento llamado ESCRIBE_MENSAJE que tenga un parámetro de tipo VARCHAR2 que recibe un texto y lo muestre por pantalla. La forma del procedimiento será la siguiente:
`ESCRIBE_MENSAJE (mensaje VARCHAR2)`

```sql
CREATE OR REPLACE
PROCEDURE ESCRIBE_MENSAJE (mensaje VARCHAR2) IS
BEGIN
  DBMS_OUTPUT.PUT_LINE (mensaje);
END ESCRIBE_MENSAJE;
/
```


### 3. Crea un procedimiento llamado SERIE que muestre por pantalla una serie de números desde un mínimo hasta un máximo con un determinado paso. La forma del procedimiento será la siguiente:
`SERIE (minimo NUMBER, maximo NUMBER, paso NUMBER)`

```sql
CREATE OR REPLACE
PROCEDURE SERIE (minimo NUMBER, maximo NUMBER, paso NUMBER) IS
  num NUMBER := minimo;
BEGIN
   WHILE num <= maximo LOOP
    DBMS_OUTPUT.PUT_LINE (num);
    num := num + paso;
  END LOOP;
END SERIE;
/
```


### 4. Crea una función AZAR que reciba dos parámetros y genere un número al azar entre un mínimo y máximo indicado. La forma de la función será la siguiente:
`AZAR (minimo NUMBER, maximo NUMBER) RETURN NUMBER`

```sql
CREATE OR REPLACE
FUNCTION AZAR (minimo NUMBER, maximo NUMBER) RETURN NUMBER IS
  rango NUMBER := maximo - minimo;
BEGIN
  RETURN MOD(ABS(DBMS_RANDOM.RANDOM), rango) + minimo;
END AZAR;
/
```


### 5. Crea una función NOTA que reciba un parámetros que será una nota numérica entre 0 y 10 y devuelva una cadena de texto con la calificación (Suficiente, Bien, Notable, ...). La forma de la función será la siguiente:
`NOTA (nota NUMBER) RETURN VARCHAR2`

```sql
CREATE OR REPLACE
FUNCTION NOTA (nota NUMBER) RETURN VARCHAR2 IS
BEGIN
  CASE
    WHEN nota=10 OR nota=9  THEN RETURN 'Sobresaliente';
    WHEN nota=8  OR nota=7  THEN RETURN 'Notable';
    WHEN nota=6             THEN RETURN 'Bien';
    WHEN nota=5             THEN RETURN 'Suficiente';
    WHEN nota<5 AND nota>=0 THEN RETURN 'Insuficiente';
    ELSE RETURN 'Nota no válida';
  END CASE;
END NOTA;
/
```


## Práctica 5
> PL/SQL: Variables, registros y cursores

### 1. Escribe un procedimiento que muestre el número de empleados y el salario mínimo, máximo y medio del departamento de FINANZAS. Debe hacerse uso de cursores implícitos, es decir utilizar SELECT ... INTO. 
```sql
CREATE OR REPLACE 
PROCEDURE Finanzas AS
  numero NUMBER;
  maximo NUMBER;
  minimo NUMBER;
  media  NUMBER;
  dpto   NUMBER;
BEGIN
  SELECT NUMDE INTO dpto FROM DEPARTAMENTOS 
  WHERE UPPER(NOMDE) = 'FINANZAS';

  SELECT COUNT(*), MAX(SALAR), MIN(SALAR), ROUND(AVG(SALAR), 2)
    INTO numero, maximo, minimo, media 
    FROM EMPLEADOS WHERE NUMDE = dpto;
 
  DBMS_OUTPUT.PUT_LINE('Departamento de FINANZAS');
  DBMS_OUTPUT.PUT_LINE(numero || ' Empleados');
  DBMS_OUTPUT.PUT_LINE(maximo || ' € es el salario máximo');
  DBMS_OUTPUT.PUT_LINE(minimo || ' € es el salario mínimo');
  DBMS_OUTPUT.PUT_LINE(media  || ' € es el salario medio');
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No se han encontrado datos');
END Finanzas;
/
```


### 2. Escribe un procedimiento que suba un 10% el salario a los EMPLEADOS con más de 2 hijos y que ganen menos de 2000 €. Para cada empleado se mostrará por pantalla el código de empleado, nombre, salario anterior y final. Utiliza un cursor explícito. La transacción no puede quedarse a medias. Si por cualquier razón no es posible actualizar todos estos salarios, debe deshacerse el trabajo a la situación inicial.
```sql
CREATE OR REPLACE 
PROCEDURE Subir_salarios AS
  CURSOR c IS
    SELECT NUMEM, NOMEM, SALAR, ROWID 
    FROM EMPLEADOS WHERE NUMHI > 2 AND SALAR < 2000;
  sal_nuevo NUMBER;
BEGIN
  FOR registro IN c LOOP
    UPDATE EMPLEADOS SET SALAR = registro.SALAR*1.10 
    WHERE ROWID = registro.ROWID;
    sal_nuevo := registro.SALAR*1.10;
    IF SQL%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('Actualización no completada');
    END IF;
    DBMS_OUTPUT.PUT_LINE(registro.NUMEM || ' ' || registro.NOMEM 
      || ' : ' || registro.SALAR || ' --> ' || sal_nuevo);
  END LOOP;
  COMMIT;
  
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
END Subir_salarios;
/
```


### 3. Escribe un procedimiento que reciba dos parámetros (número de departamento, hijos). Deberá crearse un cursor explícito al que se le pasarán estos parámetros y que mostrará los datos de los empleados que pertenezcan al departamento y con el número de hijos indicados. Al final se indicará el número de empleados obtenidos. 
```sql
CREATE OR REPLACE 
PROCEDURE Dpto_Empleados_Hijos (
  numero EMPLEADOS.NUMDE%TYPE, 
  hijos  EMPLEADOS.NUMHI%TYPE )
AS
  CURSOR c(numero EMPLEADOS.NUMDE%TYPE, hijos EMPLEADOS.NUMHI%TYPE) IS
    SELECT NUMEM, NOMEM, NUMHI, NUMDE
    FROM EMPLEADOS WHERE NUMDE = numero AND NUMHI = hijos;
  contador NUMBER;

BEGIN
  contador := 0;
  FOR registro IN c (numero, hijos) LOOP
    DBMS_OUTPUT.PUT_LINE(registro.NUMEM || ' ' || registro.NOMEM 
      || ' ' || registro.NUMHI || ' ' || registro.NUMDE);
    contador := contador + 1;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE(contador || ' Empleados obtenidos');
END Dpto_Empleados_Hijos;
/
```


### 4. Escribe un procedimiento con un parámetro para el nombre de empleado, que nos muestre la edad de dicho empleado en años, meses y días. 
```sql
CREATE OR REPLACE
PROCEDURE Edad_Empleado (nombre EMPLEADOS.NOMEM%TYPE) AS
  -- Utilizamos un cursor explícito por si existiese más de un empleado
  -- con el mismo nombre.
  CURSOR c(nom EMPLEADOS.NOMEM%TYPE) IS
    SELECT NOMEM, FECNA
    FROM EMPLEADOS WHERE NOMEM = nom;

  meses NUMBER;
  a     NUMBER;
  m     NUMBER;
  d     NUMBER;

BEGIN
  DBMS_OUTPUT.PUT_LINE('EMPLEADO: AÑOS MESES DÍAS');
  FOR registro IN c(nombre) LOOP
    meses := MONTHS_BETWEEN (SYSDATE, registro.FECNA);
    a := meses/12;
    m := MOD (meses, 12);
    d := (m - TRUNC (m))*30;-- parte decimal de m multiplicada por 30

    DBMS_OUTPUT.PUT_LINE(registro.NOMEM || ':  '
      || TRUNC(a)  || ' ' || TRUNC(m)  || ' ' || TRUNC(d) );
  END LOOP;

END Edad_Empleado;
/
```


## Práctica 6
> PL/SQL: Paquetes y Excepciones

### 1. Desarrolla el paquete ARITMETICA cuyo código fuente viene en este tema. Crea un archivo para la especificación y otro para el cuerpo. Realiza varias pruebas para comprobar que las llamadas a funciones y procedimiento funcionan correctamente.

### 2. Al paquete anterior añade una función llamada RESTO que reciba dos parámetros, el dividendo y el divisor, y devuelva el resto de la división.

### 3. Al paquete anterior añade un procedimiento sin parámetros llamado AYUDA que muestre un mensaje por pantalla de los procedimientos y funciones disponibles en el paquete, su utilidad y forma de uso.

El resultado de los 3 ejercicios anteriores quedaría de las siguiente forma:
```sql
-- PAQUETE ARITMETICA – Especificación 
-- PACKAGE_ARITMETICA.SQL 
CREATE OR REPLACE 
PACKAGE aritmetica IS
  version NUMBER := 1.0;

  PROCEDURE mostrar_info;
  PROCEDURE ayuda;
  FUNCTION suma       (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION resta      (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION multiplica (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION divide     (a NUMBER, b NUMBER) RETURN NUMBER;
  FUNCTION resto      (a NUMBER, b NUMBER) RETURN NUMBER;
END aritmetica;
/

-- PAQUETE ARITMETICA – Cuerpo 
-- PACKAGE_BODY_ARITMETICA.SQL 
CREATE OR REPLACE 
PACKAGE BODY aritmetica IS

  PROCEDURE mostrar_info IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE 
      ('Paquete de operaciones aritméticas. Versión ' || version);
  END mostrar_info;


  PROCEDURE ayuda IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE ('AYUDA DEL PAQUETE ARITMÉTICA');
    DBMS_OUTPUT.PUT_LINE ('============================');
    DBMS_OUTPUT.PUT_LINE ('Paquete con varias funciones aritméticas.');
    DBMS_OUTPUT.PUT_LINE ('Las funciones disponibles son éstas:');
    DBMS_OUTPUT.PUT_LINE ('- suma (num1, num2), para sumar 2 números');
    DBMS_OUTPUT.PUT_LINE ('- resta (num1, num2), para restar');
    DBMS_OUTPUT.PUT_LINE ('- multiplica(num1, num2), para multiplicar');
    DBMS_OUTPUT.PUT_LINE ('- divide (num1, num2), para dividir');
    DBMS_OUTPUT.PUT_LINE ('- resto (num1, num2), para resto división');
    DBMS_OUTPUT.PUT_LINE ('Además, existen 2 procedimientos:');
    DBMS_OUTPUT.PUT_LINE ('- mostrar_info, para ver versión');
    DBMS_OUTPUT.PUT_LINE ('- ayuda, para mostrar esta ayuda');
  END ayuda;


  FUNCTION suma       (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a+b);
  END suma;

  FUNCTION resta      (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a-b);
  END resta;

  FUNCTION multiplica (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a*b);
  END multiplica;

  FUNCTION divide     (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN (a/b);
  END divide;

  FUNCTION resto     (a NUMBER, b NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN MOD(a,b);
  END resto;

END aritmetica;
/

-- Pruebas
BEGIN
  ARITMETICA.MOSTRAR_INFO;  
  ARITMETICA.AYUDA; 
END;
/

SELECT ARITMETICA.SUMA      (4,3) FROM DUAL;
SELECT ARITMETICA.RESTA     (4,3) FROM DUAL;
SELECT ARITMETICA.MULTIPLICA(4,3) FROM DUAL;
SELECT ARITMETICA.DIVIDE    (4,3) FROM DUAL;
SELECT ARITMETICA.RESTO     (4,3) FROM DUAL;
```


### 4. Desarrolla el paquete GESTION. En un principio tendremos los procedimientos para gestionar los departamentos. Dado el archivo de especificación mostrado más abajo crea el archivo para el cuerpo. Realiza varias pruebas para comprobar que las llamadas a funciones y procedimientos funcionan correctamente.
```sql
-- PAQUETE GESTION – Especificación 
-- PACKAGE_GESTION.SQL 
CREATE OR REPLACE 
PACKAGE GESTION AS 
  PROCEDURE CREAR_DEP      (nombre VARCHAR2, presupuesto NUMBER);
  FUNCTION  NUM_DEP        (nombre VARCHAR2) RETURN NUMBER;
  PROCEDURE MOSTRAR_DEP    (numero NUMBER);
  PROCEDURE BORRAR_DEP     (numero NUMBER);
  PROCEDURE MODIFICAR_DEP  (numero NUMBER, presupuesto NUMBER);
END GESTION;
/

-- PAQUETE GESTION – Cuerpo 
-- PACKAGE_BODY_GESTION.SQL 
CREATE OR REPLACE
PACKAGE BODY GESTION AS

  PROCEDURE CREAR_DEP (nombre VARCHAR2, presupuesto NUMBER) AS
    num_dep NUMBER(3);
   
  BEGIN
    SELECT NUMDE INTO num_dep FROM DEPARTAMENTOS
    WHERE NOMDE=nombre;
    -- Si existe, no se produce excepción. Mostramos entonces el
    -- siguiente mensaje.
    DBMS_OUTPUT.PUT_LINE ('Departamento ' || nombre || ' no creado.');
    DBMS_OUTPUT.PUT_LINE ('Ya existe un departamento con dicho nombre.');

    -- Si no existe el nombre de departamento se produce una excepción
    -- la cual aprovechamos para introducir los datos.
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      SELECT MAX(NUMDE)+10 INTO num_dep FROM DEPARTAMENTOS;
  
      INSERT INTO DEPARTAMENTOS (numde, nomde, presu)
      VALUES (num_dep, nombre, presupuesto);
  END CREAR_DEP;


  FUNCTION NUM_DEP (nombre VARCHAR2) RETURN NUMBER AS
    num_dep NUMBER;
  BEGIN
    SELECT NUMDE INTO num_dep FROM DEPARTAMENTOS WHERE NOMDE=nombre;
    RETURN num_dep;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN -1;
  END NUM_DEP;


  PROCEDURE MOSTRAR_DEP (numero NUMBER) AS
    emplea NUMBER(3);
    nombre DEPARTAMENTOS.NOMDE%TYPE;
    presu  DEPARTAMENTOS.PRESU%TYPE;
  BEGIN
       
    SELECT NOMDE, PRESU INTO nombre, presu
    FROM DEPARTAMENTOS WHERE NUMDE = numero;
    DBMS_OUTPUT.PUT_LINE('Num. Dpto: ' || numero|| ' - Nombre Dpto: '
      || nombre || ' - Presupuesto ' || presu );

  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE ('No existe este departamento.');
  END MOSTRAR_DEP;


  PROCEDURE BORRAR_DEP (numero NUMBER) AS
    emplea NUMBER(3);
  BEGIN
    UPDATE EMPLEADOS
    SET NUMDE = NULL WHERE NUMDE = numero;
    DBMS_OUTPUT.PUT_LINE(TO_CHAR (SQL%ROWCOUNT)||' empleados afectados.');

    DELETE DEPARTAMENTOS WHERE NUMDE = numero;
    DBMS_OUTPUT.PUT_LINE(TO_CHAR (SQL%ROWCOUNT)||' departamentos borrados.');
  END BORRAR_DEP;


  PROCEDURE MODIFICAR_DEP (numero NUMBER, presupuesto NUMBER) AS
  BEGIN
    UPDATE DEPARTAMENTOS
    SET PRESU = presupuesto
    WHERE NUMDE = numero;
    
    CASE SQL%ROWCOUNT
      WHEN 0 THEN DBMS_OUTPUT.PUT_LINE('No existe el departamento ' || numero);
      WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Actualización realizada.');
      ELSE        DBMS_OUTPUT.PUT_LINE('Algo raro ocurrió!!.');
    END CASE;
  END MODIFICAR_DEP;

END GESTION;
/

-- Pruebas
DECLARE
  num NUMBER;

BEGIN

  GESTION.CREAR_DEP ('MARKETING', 10);
  GESTION.CREAR_DEP ('I+D', 20);

  num := GESTION.NUM_DEP ('MARKETING');
  GESTION.MOSTRAR_DEP ( num );

  num := GESTION.NUM_DEP ('I+D');
  GESTION.MOSTRAR_DEP ( num );

  GESTION.MODIFICAR_DEP (GESTION.NUM_DEP ('MARKETING'), 12);
  GESTION.MODIFICAR_DEP (GESTION.NUM_DEP ('I+D'),       22);

  GESTION.MOSTRAR_DEP ( GESTION.NUM_DEP ('MARKETING'));
  GESTION.MOSTRAR_DEP ( GESTION.NUM_DEP ('I+D'));

  GESTION.BORRAR_DEP (GESTION.NUM_DEP ('MARKETING'));
  GESTION.BORRAR_DEP (GESTION.NUM_DEP ('I+D'));

END;
/
```


## Práctica 7
> PL/SQL: Triggers y Excepciones

Previamente deberemos crear una tabla AUDITORIA_EMPLEADOS para registrar los eventos a auditar que ocurran sobre la tabla EMPLEADOS.
CREATE TABLE AUDITORIA_EMPLEADOS (descripcion VARCHAR2(200));

Y también crearemos una vista SEDE_DEPARTAMENTOS acerca de los departamentos y su localización.
CREATE VIEW SEDE_DEPARTAMENTOS AS
SELECT C.NUMCE, C.NOMCE, C.DIRCE, 
       D.NUMDE, D.NOMDE, D.PRESU, D.DIREC, D.TIDIR, D.DEPDE 
FROM CENTROS C JOIN DEPARTAMENTOS D ON C.NUMCE=D.NUMCE; 

También insertaremos en la tabla DEPARTAMENTOS uno llamado TEMP donde serán movidos los empleados cuyo departamento desaparezca.
INSERT INTO DEPARTAMENTOS VALUES (0, 10,  260, 'F', 10, 100, 'TEMP');

### 1. Crea un trigger que, cada vez que se inserte o elimine un empleado, registre una entrada en la tabla AUDITORIA_EMPLEADOS con la fecha del suceso, número y nombre de empleado, así como el tipo de operación realizada (INSERCIÓN o ELIMINACIÓN).
CREATE OR REPLACE
TRIGGER Insercion_eliminacion_empleado
AFTER INSERT OR DELETE ON EMPLEADOS
FOR EACH ROW

BEGIN

  IF INSERTING THEN
    INSERT INTO AUDITORIA_EMPLEADOS 
    VALUES(TO_CHAR(SYSDATE,'DD/MM/YYYY HH:MI:SS') || ' - INSERCIÓN - ' 
      || :new.NUMEM || ' ' || :new.NOMEM  );

  ELSIF DELETING THEN
    INSERT INTO AUDITORIA_EMPLEADOS 
    VALUES(TO_CHAR(SYSDATE,'DD/MM/YYYY HH:MI:SS') || ' - ELIMINACIÓN - '
      || :old.NUMEM || ' ' || :old.NOMEM  );

  END IF;

END Insercion_eliminacion_empleado;

### 2. Crea un trigger que, cada vez que se modifiquen datos de un empleado, registre una entrada en la tabla AUDITORIA_EMPLEADOS con la fecha del suceso, valor antiguo y valor nuevo de cada campo, así como el tipo de operación realizada (en este caso MODIFICACIÓN).
CREATE OR REPLACE
TRIGGER Modificacion_empleado
AFTER UPDATE ON EMPLEADOS
FOR EACH ROW

DECLARE
  cadena VARCHAR2(200);

BEGIN

  cadena := TO_CHAR(SYSDATE,'DD/MM/YYYY HH:MI:SS')
    || ' - MODIFICACIÓN - ' || :new.NUMEM || ' ' || :new.NOMEM || ' - ';

  IF UPDATING('NUMEM') THEN
    cadena := cadena || 'Num. empleado: ' 
      || :old.NUMEM || '-->' || :new.NUMEM;
  END IF;

  IF UPDATING('NOMEM') THEN
    cadena := cadena || ', Nombre: ' 
      || :old.NOMEM || '-->' || :new.NOMEM || ', ';
  END IF;

  IF UPDATING('SALAR') THEN
    cadena := cadena || ', Salario: ' 
      || :old.SALAR || '-->' || :new.SALAR || ', ';
  END IF;

  IF UPDATING('COMIS') THEN
    cadena := cadena || ', Comisión: ' 
      || :old.COMIS || '-->' || :new.COMIS || ', ';
  END IF;

  IF UPDATING('NUMHI') THEN
    cadena := cadena || ', Hijos: ' 
      || :old.NUMHI || '-->' || :new.NUMHI || ', ';
  END IF;

  IF UPDATING('EXTEL') THEN
    cadena := cadena || ', Extensión: ' 
      || :old.EXTEL || '-->' || :new.EXTEL || ', ';
  END IF;

  IF UPDATING('NUMDE') THEN
    cadena := cadena || ', Num. Departamento: ' 
      || :old.NUMDE || '-->' || :new.NUMDE || ', ';
  END IF;

  INSERT INTO AUDITORIA_EMPLEADOS VALUES(cadena);

END Modificacion_empleado;

### 3. Crea un trigger para que registre en la tabla AUDITORIA_EMPLEADOS las subidas de salarios superiores al 5%. 
CREATE OR REPLACE
TRIGGER Subida_salario
AFTER UPDATE OF SALAR ON EMPLEADOS
FOR EACH ROW

BEGIN
  IF (:new.SALAR - :old.SALAR) > (:old.SALAR * 0.05) THEN
     INSERT INTO AUDITORIA_EMPLEADOS 
     VALUES(TO_CHAR(SYSDATE,'DD/MM/YYYY HH:MI:SS') 
       || ' - MODIFICACIÓN SALARIO - '  
       || :old.NUMEM || ' ' || :old.NOMEM || ' - '
       || :old.SALAR || ' --> ' || :new.SALAR );
  END IF;
END Subida_salario;

### 4. Deseamos operar sobre los datos de los departamentos y los centros donde se hallan. Para ello haremos uso de la vista SEDE_DEPARTAMENTOS creada anteriormente. Al tratarse de una vista que involucra más de una tabla, necesitaremos crear un trigger de sustitución para gestionar las operaciones de actualización de la información. Crea el trigger necesario para realizar inserciones, eliminaciones y modificaciones en la vista anterior.  
CREATE OR REPLACE 
TRIGGER Actualizacion_departamento
INSTEAD OF DELETE OR INSERT OR UPDATE ON SEDE_DEPARTAMENTOS
FOR EACH ROW

DECLARE
  cantidad  NUMBER(3);

BEGIN

  -- Modificamos datos
  IF UPDATING THEN
    UPDATE CENTROS 
    SET NOMCE = :new.NOMCE, DIRCE = :new.DIRCE
    WHERE NUMCE = :old.NUMCE;
    
    UPDATE DEPARTAMENTOS
    SET NUMCE = :new.NUMCE, NOMDE = :new.NOMDE, DIREC = :new.DIREC,
        TIDIR = :new.TIDIR, PRESU = :new.PRESU, DEPDE = :new.DEPDE
    WHERE NUMCE = :old.NUMCE AND NUMDE = :old.NUMDE;


  -- Borramos datos
  ELSIF DELETING THEN
    -- Si el departamento tiene empleados
    -- los movemos al departamento 'TEMP', luego borramos el partamento
    -- Si el centro tiene departamentos, no borramos el centro.
    SELECT COUNT(NUMDE) INTO cantidad 
    FROM EMPLEADOS WHERE NUMDE = :old.NUMDE;
    IF cantidad > 0 THEN
      UPDATE EMPLEADOS SET NUMDE = 0 WHERE NUMDE = :old.NUMDE;    
    END IF;
    DELETE DEPARTAMENTOS WHERE NUMDE = :old.NUMDE;

    SELECT COUNT(NUMCE) INTO cantidad 
    FROM DEPARTAMENTOS WHERE NUMCE = :old.NUMCE;
    IF cantidad = 0 THEN
      DELETE CENTROS WHERE NUMCE = :old.NUMCE;
    END IF;
   
  
  -- Insertamos datos
  ELSIF INSERTING THEN
    -- Si el centro o el departamento no existe lo damos de alta, 
    -- en otro caso actualizamos los datos
    SELECT COUNT(NUMCE) INTO cantidad 
    FROM CENTROS WHERE NUMCE = :new.NUMCE;
    IF cantidad = 0 THEN 
      INSERT INTO CENTROS 
      VALUES(:new.NUMCE, :new.NOMCE, :new.DIRCE);
    ELSE
      UPDATE CENTROS 
      SET NOMCE = :new.NOMCE, DIRCE = :new.DIRCE
      WHERE NUMCE = :new.NUMCE; 
    END IF;
  
    SELECT COUNT(NUMDE) INTO cantidad 
    FROM DEPARTAMENTOS WHERE NUMDE = :new.NUMDE;
    IF cantidad = 0 THEN 
      INSERT INTO DEPARTAMENTOS 
      VALUES(:new.NUMDE, :new.NUMCE, :new.DIREC, :new.TIDIR, 
             :new.PRESU, :new.DEPDE, :new.NOMDE);
    ELSE
      UPDATE DEPARTAMENTOS
      SET NUMCE = :new.NUMCE, DIREC = :new.DIREC, TIDIR = :new.TIDIR, 
          PRESU = :new.PRESU, DEPDE = :new.DEPDE, NOMDE = :new.NOMDE
      WHERE NUMCE = :new.NUMCE;
    END IF;


  ELSE
    RAISE_APPLICATION_ERROR(-20500, 'Error en la actualización');

  END IF;

END Actualizacion_departamento;

### 5. Realiza las siguientes operaciones para comprobar si el disparador anterior funciona correctamente.
```sql
-- Inserción de datos
INSERT INTO SEDE_DEPARTAMENTOS (NUMCE, NUMDE, NOMDE) 
VALUES (30, 310, 'NUEVO1');
INSERT INTO SEDE_DEPARTAMENTOS (NUMCE, NUMDE, NOMDE) 
VALUES (30, 320, 'NUEVO2');
INSERT INTO SEDE_DEPARTAMENTOS (NUMCE, NUMDE, NOMDE) 
VALUES (30, 330, 'NUEVO3');

SELECT * FROM CENTROS;
SELECT * FROM DEPARTAMENTOS;

-- Borrado de datos
DELETE FROM SEDE_DEPARTAMENTOS WHERE NUMDE=310;
SELECT * FROM SEDE_DEPARTAMENTOS;

DELETE FROM SEDE_DEPARTAMENTOS WHERE NUMCE=30;
SELECT * FROM SEDE_DEPARTAMENTOS;

-- Modificación de datos
UPDATE SEDE_DEPARTAMENTOS 
SET NOMDE='CUENTAS', TIDIR='F', NUMCE=20 WHERE NOMDE='FINANZAS';

SELECT * FROM DEPARTAMENTOS;

UPDATE SEDE_DEPARTAMENTOS 
SET NOMDE='FINANZAS', TIDIR='P', NUMCE=10 WHERE NOMDE='CUENTAS';

SELECT * FROM DEPARTAMENTOS;
```
