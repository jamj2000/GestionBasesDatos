-- PRÁCTICA 5.1

/* Diseño físico

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

*/


-- 1. Inserción de datos 
INSERT INTO PROFESOR VALUES (1, '12453645M', 'PACO',  'MATEMÁTICAS', '935210487');
INSERT INTO PROFESOR VALUES (2, '12453646N', 'LUCIA', 'LENGUAJE',    '998210487');


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


-- 2. Inserción de registros con la misma clave primaria.
-- Da error puesto que no puede haber dos registros con la misma clave primaria. 
-- La clave primaria siempre tiene las restricciones de unicidad y valor no nulo.
INSERT INTO PROFESOR VALUES (3, '12453640B', 'JUAN', 'MATEMÁTICAS', '635210480');
INSERT INTO PROFESOR VALUES (3, '12453641C', 'JOSE', 'LENGUAJE',    '698210481');


-- 3. Inserción de registros con la misma clave primaria.
-- Da error puesto que no puede haber dos registros con la misma clave primaria. 
-- La clave primaria siempre tiene las restricciones de unicidad y valor no nulo.
INSERT INTO ALUMNO VALUES (111, 'EVA',  '08/12/1993', '648171701');
INSERT INTO ALUMNO VALUES (111, 'LISA', '09/12/1993', '649271789');


-- 4. Inserción de registros con valores nulos. 3 formas distintas.
INSERT INTO ALUMNO VALUES (112, 'LORENA', '20/04/1993', NULL);
INSERT INTO ALUMNO (NUMMATRICULA, NOMBRE, FECHANACIMIENTO)
  VALUES (113, 'VANESA', '25/05/1991');
INSERT INTO ALUMNO (NOMBRE, FECHANACIMIENTO, NUMMATRICULA)
  VALUES ('SILVIA', '27/06/1993', 114);


-- 5. Actualización de campos de registro con valores nulos.
UPDATE ALUMNO SET TELEFONO='652148568' WHERE NUMMATRICULA=112;
UPDATE ALUMNO SET TELEFONO='653148568' WHERE NUMMATRICULA=113;
UPDATE ALUMNO SET TELEFONO='669148568' WHERE NUMMATRICULA=114;


-- 6. Actualización de año en un campo de fecha.
UPDATE ALUMNO SET FECHANACIMIENTO = TO_CHAR(FECHANACIMIENTO,'DDMM')||'2000';


-- 7. Actualización de campo si se cumple una condición.
UPDATE PROFESOR SET ESPECIALIDAD='INFORMATICA' WHERE TELEFONO IS NOT NULL AND NIF_P NOT LIKE '9%';


-- 8. Actualización. Intercambio de valores.
-- Para poder hacer el intercambio necesitamos un valor intermedio.
UPDATE PROFESOR SET ESPECIALIDAD='TEMP'        WHERE ESPECIALIDAD = 'MATEMÁTICAS';
UPDATE PROFESOR SET ESPECIALIDAD='MATEMÁTICAS' WHERE ESPECIALIDAD = 'LENGUAJE';
UPDATE PROFESOR SET ESPECIALIDAD='LENGUAJE'    WHERE ESPECIALIDAD = 'TEMP';


-- 9. Borrado de registros en una Relación. 
DELETE RECIBE WHERE CODASIGNATURA = 'LENGUA';


-- 10. Borrado de registros de una Entidad sin relaciones. 
DELETE ASIGNATURA WHERE CODASIGNATURA = 'LENGUA';


-- 11. Borrado de registros de una Entidad con relaciones. 
-- No nos permite borrar directamente los registros de la tabla ASIGNATURA
-- ya que dichos registros participan en una relación.
-- No tendríamos esta limitación si en el diseño físico hubiesemos definido
-- la clave foránea que apunta a CODASIGNATURA con la cláusula ON DELETE CASCADE.
DELETE ASIGNATURA;


-- 12. Borrado de registros de una Entidad con relaciones. 
-- No nos permite borrar directamente los registros de la tabla PROFESOR
-- ya que dichos registros participan en una relación.
-- No tendríamos esta limitación si en el diseño físico hubiesemos definido
-- la clave foránea que apunta a IDPROFESOR con la cláusula ON DELETE CASCADE.
DELETE PROFESOR;


-- 13. Borrado de registros de una Entidad con relaciones. 
-- No nos permite borrar directamente los registros de la tabla ALUMNO
-- ya que dichos registros participan en una relación.
-- No tendríamos esta limitación si en el diseño físico hubiesemos definido
-- la clave foránea que apunta a NUMMATRICULA con la cláusula ON DELETE CASCADE.
DELETE ALUMNO;


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
-- en el diseño físico habíamos creado las restricciones sin ponerle nombre.
-- Este es uno de los motivos por lo que es importante poner nombre a 
-- las restricciones. Así, si luego necesitamos modificar el diseño físico
-- podremos hacerlo de forma sencilla. 