-- PRÁCTICA 5.2

/* Diseño físico

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


*/



-- 1. Inserción de datos 
INSERT INTO DIRECTOR VALUES ('JUAN',  'ESPAÑOLA');
INSERT INTO DIRECTOR VALUES ('PEDRO', 'ESPAÑOLA');


INSERT INTO PELICULA VALUES (001, 'LA GRANJA', 'TELE5',        'RUSA',     '10/03/1987', 'JUAN');
INSERT INTO PELICULA VALUES (002, 'MANDINGO',  'ANTENA3',      'JAPONESA', '11/03/1988', 'JUAN');
INSERT INTO PELICULA VALUES (003, 'FRANCO',    'INTERECONOMIA','ESPAÑOLA', '01/01/1990', 'PEDRO');
INSERT INTO PELICULA VALUES (004, 'COSMOS',    'TELE5',        'ITALIANA', '15/10/2000', 'PEDRO');


INSERT INTO EJEMPLAR VALUES (001, 01, 'BIEN');
INSERT INTO EJEMPLAR VALUES (001, 02, 'MAL');

INSERT INTO EJEMPLAR VALUES (002, 01, 'BIEN');
INSERT INTO EJEMPLAR VALUES (002, 02, 'MAL');

INSERT INTO EJEMPLAR VALUES (003, 01, 'BIEN');
INSERT INTO EJEMPLAR VALUES (003, 02, 'REGULAR');

INSERT INTO EJEMPLAR VALUES (004, 01, 'BIEN');
INSERT INTO EJEMPLAR VALUES (004, 02, 'REGULAR');


INSERT INTO SOCIO VALUES (15405978, 'DANIEL', 'C/ NUEVA, 1', 697565656, NULL);
INSERT INTO SOCIO VALUES (15405979, 'ANA',    'C/ ANCHA, 5', 697545454, 15405978);
INSERT INTO SOCIO VALUES (15405971, 'SILVIA', 'C/ FORT,  4', 697121212, 15405979);
INSERT INTO SOCIO VALUES (15405972, 'XAVI',   'C/ ANCHA, 2', 197232323, 15405971);


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


INSERT INTO ALQUILA VALUES (15405978, 001,01, '01/01/2017', '03/01/2017');
INSERT INTO ALQUILA VALUES (15405979, 001,02, '01/01/2017', '03/01/2017');

INSERT INTO ALQUILA VALUES (15405971, 002,01, '01/02/2017', '03/02/2017');
INSERT INTO ALQUILA VALUES (15405978, 002,02, '01/02/2017', '03/02/2017');

INSERT INTO ALQUILA VALUES (15405972, 003,01, '01/03/2017', '03/03/2017');
INSERT INTO ALQUILA VALUES (15405972, 003,02, '01/03/2017', '03/03/2017');

INSERT INTO ALQUILA VALUES (15405979, 004,01, '01/04/2017', '03/04/2017');
INSERT INTO ALQUILA VALUES (15405979, 004,02, '01/04/2017', '03/04/2017');


-- 2. Comprobación de restricciones
INSERT INTO SOCIO VALUES (15405918, NULL, 'C/ ROSAL, 3', 697565656, NULL);
-- El campo de nombre no puede ser nulo, puesto que tiene una restricción 
-- de valor no nulo.

INSERT INTO PELICULA VALUES (010, NULL, 'TELE5', 'RUSA', '10/03/1987', 'JUAN');
-- El campo título sí puede estar a nulo, puesto que no es clave primaria,
-- ni tiene restricción de valor no nulo.


-- 3. Comprobación de restricciones
INSERT INTO ACTORES VALUES ('PUTIN', 'RUSA',     'H');
INSERT INTO ACTORES VALUES ('KIM',   'AMERICANA','M');
INSERT INTO ACTORES VALUES ('ROSA',  'RUSA',     'K'); 
-- La última inserción da error, puesto que sólo se permiten valores H o M 
-- para el campo sexo.


-- 4. Comprobación de restricciones
INSERT INTO ACTUA (ACTOR, IDPELICULA) VALUES ('ANA', 002);
-- Si no indicamos valor para el campo protagonista, se introduce 
-- el indicado por defecto en la restricción, es decir, valor N.
SELECT * FROM ACTUA WHERE ACTOR = 'ANA' AND IDPELICULA = 002;


-- 5. Comprobación de restricciones
INSERT INTO ALQUILA VALUES (15405972, 004,01, '01/03/2017', '03/02/2017');
-- Dará error, puesto que tenemos una restricción tipo check que
-- obliga a que la fecha de devolución sea mayor a la fecha de alquiler.


-- 6. Actualización de registros.
UPDATE DIRECTOR SET NACIONALIDAD = 'ESP' WHERE NACIONALIDAD = 'ESPAÑOLA';


-- 7. Actualización de registros.
UPDATE ACTORES SET NACIONALIDAD = 'ESP' WHERE NACIONALIDAD = 'ESPAÑOLA';


-- 8. Actualización de registros.
UPDATE SOCIO SET AVALADOR = '15405978' WHERE DNI != 15405978;


-- 9. Eliminación de registros que posiblemente participan en una relación.
DELETE SOCIO WHERE REGEXP_LIKE(TELEFONO, '[0-4].*');
-- Al borrar los registros, si dichos registros participan en una relación,
-- por ejemplo en la relación alquiler, no nos va a dejar eliminarlos.


-- 10. Eliminación de registros que posiblemente participan en una relación.
DELETE SOCIO WHERE REGEXP_LIKE(TELEFONO, '[5-9].*');
-- Al borrar los registros, si dichos registros participan en una relación,
-- por ejemplo en la relación alquiler, no nos va a dejar eliminarlos.


-- 11. Modificación de FK para añadir ON DELETE CASCADE.
-- La mejor forma de proceder sería eliminar la clave foránea FK1_DNI
-- de la tabla ALQUILA y volverla a crear con la cláusula ON DELETE CASCADE.
-- Después de esto, ya podemos ejecutar las 2 sentencias anteriores.
ALTER TABLE ALQUILA DROP CONSTRAINT FK1_DNI;
ALTER TABLE ALQUILA ADD  CONSTRAINT FK1_DNI FOREIGN KEY(DNI)
  REFERENCES SOCIO ON DELETE CASCADE;


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

