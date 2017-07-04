ACTIVIDADES
============


Práctica 1
----------------

Realiza la instalación de APEX 5.1.

Práctica 2
----------------

Realiza la configuración de APEX 5.1 poniendo el idioma en español.

Práctica 3
----------------

Un usuario puede dar privilegios a otro. No es necesario ser sysdba para conseguirlo: el usuario propietario del esquema otorga los privilegios deseados al otro usuario. La única necesidad, y esa sí es importante, es que el usuario del esquema que se va a compartir, debe tener suficientes privilegios para otorgarlos.

Veamos el código (debe ejecutarlo el usuario propietario del esquema que se desea compartir):

.. code-block:: plpgsql

  BEGIN
    FOR tabla IN (SELECT * FROM USER_TABLES) LOOP
	  EXECUTE IMMEDIATE
	    'GRANT SELECT ON ' || tabla.table_name || ' TO OTRO_USUARIO';
    END LOOP;
  END;
  /

Lo que este código hace es, mediante un bucle, recorre todas las tablas del usuario que comparte su esquema y otorga los privilegios seleccionados (en este caso solo SELECT) a cada tabla para el usuario OTRO_USUARIO (sustituir por el nombre del usuario al que deseamos otorgar los privilegios).

**Realiza las siguientes actividades:**

Tenemos un esquema (usuario) llamando E01 con 4 tablas y queremos conceder privilegios al esquema (usuario) llamado EMPLEADOS sobre las tablas anteriores.

.. image:: images/tema5-018.png

Para ello procedemos de la siguiente forma:

1. Accedemos como usuario E01 y concedemos privilegios al usuario EMPLEADOS.

.. code-block:: plpgsql

	CONN E01/E01
	GRANT ALL ON  ALUMNO TO EMPLEADOS;
	GRANT ALL ON  PROFESOR TO EMPLEADOS;
	GRANT ALL ON  ASIGNATURA TO EMPLEADOS;
	GRANT ALL ON  RECIBE TO EMPLEADOS;

2. Accedemos como usuario EMPLEADOS y comprobamos que podemos trabajar con las
tablas anteriores.

.. code-block:: plpgsql

	CONN EMPLEADOS/EMPLEADOS

	DESCRIBE E01.ALUMNO;
	DESCRIBE E01.PROFESOR;

	SELECT * FROM E01.ASIGNATURA;

	INSERT INTO E01.ALUMNO VALUES (1, 'JOSE', '01/01/1990', '600111222');


El usuario EMPLEADOS puede incluso crear vistas y sinónimos sobre las tablas anteriores.
Para ello, el administrador de la base de datos, deberá concederle dichos privilegios.

.. code-block:: plpgsql

	CONN SYSTEM/SYSTEM

	GRANT CREATE VIEW, CREATE SYNONYM TO EMPLEADOS;

Ahora EMPLEADOS puede crear una vista sobre las tablas anteriores.

.. code-block:: plpgsql

	CONN EMPLEADOS/EMPLEADOS

	CREATE VIEW PROF_ASIG (CODPROF, NOMPROF, ESPECIALIDAD, CODASIG, NOMASIG)
	AS
	SELECT P.IDPROFESOR, P.NOMBRE, P.ESPECIALIDAD, A.CODASIGNATURA, A.NOMBRE
	FROM E01.PROFESOR P JOIN E01.ASIGNATURA A ON P.IDPROFESOR=A.IDPROFESOR;

Para no tener que escribir E01.PROFESOR y E01.ASIGNATURA cada vez, podemos crear sinónimos. Por ejemplo:

.. code-block:: plpgsql

	CREATE SYNONYM PROF FOR E01.PROFESOR;
	CREATE SYNONYM ASIG FOR E01.ASIGNATURA;

A partir de ahora podemos acceder a las tablas E01.PROFESOR y E01.ASIGNATURA a través de los sinónimos PROF y ASIG. Por ejemplo:

.. code-block:: plpgsql

	SELECT * FROM PROF;

Práctica 4
----------------

Inicia sesión como usuario EMPLEADOS. Da privilegios al usuario E01 para que pueda acceder a todas las tablas. Guíate por los pasos seguidos en la práctica anterior.

Práctica 5
----------------

Inicia sesión como usuario SYSTEM. Concede privilegios de `CREATE VIEW` y `CREATE SYNONYM` a E01.

Práctica 6
----------------

Inicia sesión como usuario E01. Crea un sinónimo corto para cada tabla del esquema EMPLEADOS. Crea una vista que contenga toda la información de las tablas del esquema EMPLEADOS. Deberás utilizar un JOIN o NATURAL JOIN.

Práctica 7
----------------

Borra el contenido de las tablas EMPLEADOS, DEPARTAMENTOS y CENTROS del esquema EMPLEADOS. Importa los datos de estas tablas desde los archivos empleados.csv, departamentos.csv y centros.csv, disponibles en la plataforma Moodle.

Práctica 8
----------------

Exporta el contenido de las tablas EMPLEADOS, DEPARTAMENTOS y CENTROS del esquema EMPLEADOS a archivos xml. Busca un programa que al abrir dichos archivos los muestre en forma de tabla.
