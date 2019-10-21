ACTIVIDADES PROPUESTAS
======================


.. admonition:: IMPORTANTE

   Todos los scripts que aparecen a continuación deben ejecutarse en SQL*Plus.

Cuestiones (I)
--------------


1. Pon un ejemplo de un tipo de dato numérico, otro alfanumérico y otro fecha/hora.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  

2. ¿Qué diferencia hay entre VARCHAR y CHAR?
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


3. Realiza la instalación de Oracle Database 11g Express Edition sobre Windows.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


4. Una vez instalado dicho Sistema Gestor de Bases de Datos Relacional (RDBMS), lo iniciaremos pulsando en "Start Database". 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.. image:: images/tema3-003.png


5. Y después iniciamos la interfaz web APEX  (APplication EXpress) para trabajar con dicho SGBD. 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Para ello pulsamos sobre "Get Started". Y se abrirá el navegador web con esta URL: http://127.0.0.1:8080/apex/f?p=4950.

.. image:: images/tema3-006.png


6. A continuación configuraremos el Terminal CMD. En Windows, ejecuta el programa CMD.EXE y realiza la configuración siguiente:
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

- Pulsa con el botón secundario del ratón en la barra de título y luego haz clic en Propiedades.

.. image:: images/tema3-007.png

- Configura la Fuente, la Disposición y los Colores como se muestra más abajo.

.. image:: images/tema3-008.png
.. image:: images/tema3-009.png
.. image:: images/tema3-011.png

- Pulsa OK.

7. Cambia la "Página de Código" a Windows-1252.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Para que se muestren correctamente las tildes y ciertos caracteres como la letra Ñ y similares deberemos ejecutar el comando CHCP 1252 (CHange CodePage). Esto cambia la CP850 por la CP1252 que soporta el conjunto de caracteres ISO 8859, necesarios por los motivos indicados anteriormente. Esta configuración no se queda guardada, por lo que deberemos ejecutarla cada vez que iniciemos el terminal.

.. image:: images/tema3-015.png

8. Ya podemos lanzar el cliente SQL*Plus como aparece en la imagen. Lo haremos como SYSDBA (permisos de DataBase Administrator).
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-017.png

Para comprobar que SQL\*Plus y la base de datos Oracle están funcionando bien, realizaremos lo siguiente. Con Oracle se instala un esquema (usuario) de ejemplo llamado HR (Human Resources). Por defecto está bloqueado. Los desbloqueamos. Le concedemos roles CONNECT y RESOURCE y asignamos una contraseña. 

.. code-block:: sql

  sqlplus / as sysdba
  ...
  SQL> alter user hr account unlock;
  User altered.
  SQL> grant connect,resource to hr identified by "HR";
  Grant succeeded.


9.  Ahora conectamos con usuario/contraseña anterior y vemos las tablas que tiene dicho esquema (usuario).
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-019.png


10. Insertamos algunos datos con tildes y caracteres tales como la letra Ñ.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-021.png

11. Comprobamos ahora la interfaz web APEX. Pulsamos en Application Express. Luego introducimos la clave del usuario SYSTEM que establecimos durante la instalación.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-025.png


.. warning::

   En las contraseñas se distingue entre mayúsculas y minúsculas.

.. image:: images/tema3-027.png



12. Una vez dentro nos creamos un espacio de trabajo (Workspace) como aparece en la siguiente imagen. Luego pulsaremos "Create Workspace".
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-028.png

Como usuario y contraseña de APEX, por motivos de comodidad, utilizaremos siempre los siguientes: 

- Username: YO
- Password: YO


13. Ya podemos trabajar con el esquema HR en APEX. Para ello pulsamos en "Already have an acount? Login Here"
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.. image:: images/tema3-030.png
.. image:: images/tema3-031.png



14. Después pulsamos sobre "SQL WorkShop" y "SQL Commands". Realizamos la consulta `SELECT * FROM COUNTRIES;` para comprobar que aparece el registro introducido anteriormente con las tildes correctas.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-033.png


Cuestiones  (II)
-------------------


1. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E01, contraseña "E01".
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-035.png


2. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E02, contraseña "E02".
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-036.png


3. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E03, contraseña "E03".
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-037.png


4. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E04, contraseña "E04".
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

.. image:: images/tema3-038.png


5. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E05, contraseña "E05".  
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

No pueden ser nulos los siguientes campos: Nombre de Cliente, Marca y Modelo de Coche. Crear una secuencia para el Número de Reserva.

.. image:: images/tema3-039.png


6. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E06, contraseña "E06". 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

No pueden ser nulos los siguientes campos: Nombre de Empleado, Nombre de Periodista, Título de Revista. La Periodicidad toma uno de los siguientes valores: Semanal, Quincenal, Mensual, Trimestral o Anual, siendo el valor por defecto Mensual. NumPaginas debe ser mayor que 0.

.. image:: images/tema3-040.png


7. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E07, contraseña "E07". 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

No pueden ser nulos los siguientes campos: Nombre de Socio, Título de Película. Sexo toma los valores H o M. Por defecto si no se indica nada un actor o actriz no es Protagonista (este campo toma valores S o N). FechaDevolución debe ser mayor que FechaAlquiler.

.. image:: images/tema3-041.png


8. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño poniendo nombres a las restricciones. Esquema E08, contraseña "E08". 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

No pueden ser nulos los siguientes campos: Nombre de Persona, NombreVía, Número de Vivienda, Nombre de Municipio. Sexo toma los valores H o M. Por defecto si no se indica nada el TipoVia es Calle.

.. image:: images/tema3-042.png


9. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E09, contraseña "E09".
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE. Crea índices para los siguientes campos: Nombre de Sucursal, Nombre de Cliente. También para  Localidad de Cliente, Localidad de Sucursal. Crea una secuencia que inicie en 1 para CodSucursal.

.. image:: images/tema3-043.png


10. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E10, contraseña "E10".
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE.  Crea secuencias que inicien en 1 para:  NumCliente, NumArtículo, NumFabrica y NumPedido.

.. image:: images/tema3-044.png


11. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E11, contraseña "E11".  
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE.  Crea índices para los siguientes campos: Nombre de Cliente, Nombre de Categoría, Nombre de Proveedor, Ciudad de Cliente. Crea una secuencia para IDVenta.

.. image:: images/tema3-045.png


12. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E12, contraseña "E12".
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE. Crea índices para los siguientes campos: Apellidos de Empleado, Lugar de Edición, Horario de Edición.  Para el indicar si un prerrequisito es obligatorio o no utilizamos ‘S’ o ‘N’.

.. image:: images/tema3-046.png


13. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E13, contraseña "E13".
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE. Crea una secuencia para IDCuenta, otra para IDNomina y otra para LineaNum.

.. image:: images/tema3-047.png


14. Realiza el diseño físico para el siguiente modelo relacional. Asigna el tipo de datos que consideres más adecuado. Realiza el diseño sin poner nombres a las restricciones. Esquema E14, contraseña "E14".  
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Crea las tablas sin restricciones y añádelas después con el comando ALTER TABLE.

.. image:: images/tema3-048.png


Cuestiones (III)
-------------------


1. Nombra los distintos tipos de instrucciones DDL que puede haber, distinguiendo el tipo de objeto que se puede crear, borrar o modificar.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

           
2. Realiza un esquema resumen de las cláusulas SQL utilizadas en la modificación de tablas. 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


3. Desde SQLPlus crea un esquema (usuario) llamado TIENDAS con contraseña TIENDAS. Concédele los roles CONNECT y RESOURCE. Accede con dicho usuario/contraseña.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


4. Crear las siguientes tablas de acuerdo con las restricciones que se mencionan:
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


.. csv-table:: TIENDAS
  :header: Columna, Tipo de dato

  NIF, VARCHAR2(10)
  NOMBRE, VARCHAR2(20)
  DIRECCION, VARCHAR2(20)
  POBLACION, VARCHAR2(20)
  PROVINCIA, VARCHAR2(20)
  CODPOSTAL, NUMBER(5)

Crear tabla sin restricciones. Después añadir las siguientes restricciones:

-  La clave primaria es NIF.
- PROVINCIA ha de almacenarse en mayúscula.
- Cambia la longitud de NOMBRE a 30 caracteres y no nulo.

.. csv-table:: FABRICANTES
  :header: Columna, Tipo de dato

  COD_FABRICANTE, NUMBER(3)
  NOMBRE, VARCHAR2(15)
  PAIS, VARCHAR2(15)

Restricciones:

- La clave primaria es COD_FABRICANTE.
- Las columnas NOMBRE y PAIS han de almacenarse en mayúscula.


.. csv-table:: ARTICULOS
   :header: Columna, Tipo de dato

   ARTICULO, VARCHAR2(20)
   COD_FABRICANTE, NUMBER(3)
   PESO, NUMBER(3)
   CATEGORIA, VARCHAR2(10)
   PRECIO_VENTA, NUMBER(6,2)
   PRECIO_COSTO, NUMBER(6,2)
   EXISTENCIAS, NUMBER(5)

Restricciones:

- La clave primaria está formada por las columnas:  ARTICULO, COD_FABRICANTE, PESO y CATEGORIA.
- COD_FABRICANTE es clave ajena que referencia a la tabla FABRICANTES.
- PRECIO_VENTA, PRECIO_COSTO y PESO han de ser > 0.
- CATEGORIA ha de ser ‘Primera’, ‘Segunda’ o ‘Tercera’.


.. csv-table:: VENTAS
   :header: Columna, Tipo de dato

   NIF, VARCHAR2(10)
   ARTICULO, VARCHAR2(20)
   COD_FABRICANTE, NUMBER(3)
   PESO, NUMBER(3)
   CATEGORIA, VARCHAR2(10)
   FECHA_VENTA, DATE
   UNIDADES_VENDIDAS, NUMBER(4)

Restricciones:

- La clave primaria está formada por las columnas:  NIF, ARTICULO, COD_FABRICANTE, PESO, CATEGORIA y FECHA_VENTA.
- NIF es clave ajena que referencia a la tabla TIENDAS.
- ARTICULO, COD_FABRICANTE, PESO y CATEGORIA es clave ajena que referencia a la tablas ARTICULOS.
- UNIDADES_VENDIDAS han de ser > 0.
- CATEGORIA  ha de ser ‘Primera’, ‘Segunda’ o ‘Tercera’. 


.. csv-table:: PEDIDOS
   :header: Columna, Tipo de dato

   NIF, VARCHAR2(10)
   ARTICULO, VARCHAR2(20)
   COD_FABRICANTE, NUMBER(3)
   PESO, NUMBER(3)
   CATEGORIA, VARCHAR2(10)
   FECHA_PEDIDO, DATE
   UNIDADES_PEDIDAS, NUMBER(4)
   EXISTENCIAS, NUMBER(5)

Restricciones:

- La clave primaria está formada por las columnas:  NIF, ARTICULO, COD_FABRICANTE, PESO, CATEGORIA y FECHA_PEDIDO.
- NIF es clave ajena que referencia a la tabla TIENDAS.
- ARTICULO, COD_FABRICANTE, PESO y CATEGORIA es clave ajena que referencia a la tablas ARTICULOS.
- UNIDADES_PEDIDAS han de ser > 0.
- CATEGORIA ha de ser ‘Primera’, ‘Segunda’ o ‘Tercera’. 


5. Añadir una restricción a la tabla TIENDAS para que el NOMBRE de la tienda sea de tipo título (InitCap).
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


6. Visualizar las CONSTRAINTS definidas para las tablas anteriores.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


7. Modificar las columnas de las tablas PEDIDOS y VENTAS para que las UNIDADES_VENDIDAS y las UNIDADES_PEDIDAS puedan almacenar cantidades numéricas de 6 dígitos.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


8. Impedir que se den de alta más tiendas en la provincia de 'TOLEDO'.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


9. Añadir a las tablas PEDIDOS y VENTAS una nueva columna para que almacenen el PVP del artículo.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


10. Crear una vista que se llame CONSERJES que contenga el nombre del centro y el nombre de sus conserjes.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


11. Crear un sinónimo llamado CONSER asociado a la vista creada antes.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


12. Añadir a la tabla PROFESORES una columna llamada COD_ASIG con dos posiciones numéricas.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


13. Crear la tabla TASIG con las siguientes columnas: COD_ASIG numérico, 2 posiciones y NOM_ASIG cadena de 20 caracteres.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


14. Añadir la restricción de clave primaria a la columna COD_ASIG de la tabla TASIG.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


15. Añadir la restricción de clave ajena a la columna COD_ASIG de la tabla PROFESORES.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


16. Cambiar de nombre la tabla PROFESORES y llamarla PROFES.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


17. Borrar la tabla TASIG.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


18. Devolver la tabla PROFESORES a su situación inicial.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



Prácticas
------------

Práctica 1
++++++++++

.. admonition:: PLANTEAMIENTO

   OBJETIVO: Realizar el diseño físico de bases de datos utilizando asistentes, herramientas gráficas y el lenguaje de definición de datos.

   ENUNCIADO: Dado el siguiente esquema E/R:


.. image:: images/tema3-049.png

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
  8. Un partido se juega entre un EquipoLocal y EquipoVisitante (no pueden ser el mismo equipo.

d) Una vez creadas las tablas:

  1. Añade una columna NumTitulos a la tabla Equipos.
  2. Elimina la columna Ciudad.
  3. Añade la restricción: Todos los equipos se han fundado después del año1890.
  4. Añade la restricción: La hora de comienzo de los partidos estará entre las 12:00 y las 22:00 horas.


Práctica 2
++++++++++

.. admonition:: PLANTEAMIENTO

   OBJETIVOS:  Realizar el diseño físico de bases de datos utilizando asistentes, herramientas gráficas y el lenguaje de definición de datos.

   ENUNCIADO: Dado el siguiente esquema E/R:


.. image:: images/tema3-050.png

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



Práctica 3
++++++++++

.. admonition:: PLANTEAMIENTO

   OBJETIVO: Realizar el diseño físico de bases de datos utilizando asistentes, herramientas gráficas y el lenguaje de definición de datos.

   ENUNCIADO: Dado el siguiente esquema relacional crear en Oracle el modelo físico, asignando nombre a las restricciones.


.. image:: images/tema3-051.png
