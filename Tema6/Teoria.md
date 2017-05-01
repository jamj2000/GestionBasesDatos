# SEGURIDAD DE LOS DATOS.  LENGUAJE DE CONTROL DE DATOS


> IES Luis Vélez de Guevara  
> Departamento de Informática




Contenido
```
1.   CONFIGURACIÓN	3
1.1.   Globalización	3
1.2.   Configuración de NLS_LANG en Oracle	3
1.3.   Instalación de APEX 5.1	5
1.4.   Acceso a APEX 5.1	6
1.5.   Cambio de contraseña de usuario ADMIN de APEX.	6
2.   SEGURIDAD DE LOS DATOS	7
2.1.   Privilegios y Roles	7
2.2.   Conceder/Eliminar permisos	7
3.   IMPORTACIÓN Y EXPORTACIÓN DE DATOS	9
3.1.   Codificación de datos	9
3.2.   Importación	9
3.3.   Exportación	9
```




## 1. CONFIGURACIÓN
### 1.1. Globalización

La versión de APEX por defecto  que viene con Oracle 11gR2 funciona con codificación CP1252 y LOCALIZACIÓN 
SELECT 
  TO_CHAR(SYSDATE, 'Day Month yyyy') "Fecha", 
  TO_NUMBER('2,345.60$', '9G999D99L')  "Cantidad" 
FROM DUAL;





1.2. Configuración de NLS_LANG en Oracle


NLS_LANG indica a Oracle qué codificación usa el cliente, así puede hacer las conversiones necesarias para que el cliente visualice correctamente el contenido.
NLS_LANG=<language>_<territory>.<character set>
Ejemplos en CMD de Windows: 
SET NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
SET NLS_LANG=SPANISH_SPAIN.AL32UTF8

Para comprobar los parámetros NLS de la sesión:
SELECT * FROM NLS_SESSION_PARAMETERS;

Ejecutado en APEX:

Ejecutado en SQL*Plus:


Podemos cambiar la configuración de la sesión. Ejemplos:
ALTER SESSION SET NLS_DATE_FORMAT=’DD/MM/YYYY’;
ALTER SESSION SET NLS_DATE_FORMAT=’DD/MM/YYYY’;


SELECT * FROM NLS_DATABASE_PARAMETERS;

NLS_NCHAR_CHARACTERSET
NLS_CHARACTERSET

In general all your points are correct. NLS_NCHAR_CHARACTERSET defines the character set for NVARCHAR2, et. al. columns whereas NLS_CHARACTERSET is used for VARCHAR2.
https://community.oracle.com/thread/308100
http://www.oracle.com/technetwork/es/articles/database-performance/cambiar-characterset-oracle-db-12c-2996716-esa.html
1.3. Instalación de APEX 5.1



Pasos para instalar una nueva versión de APEX y ponerla en Español:
1. Descargar Oracle Application Express - All languages. El archivo apex_5.1.zip contiene APEX 5.1. Es posible bajarlo desde el sitio web oficial de Oracle habiéndonos registrado previamente.
2. Descomprimir apex_5.1.zip  en C:\oraclexe\app\oracle\product\11.2.0\server sobreescribiendo la carpeta apex existente.
3. Abrir un terminal CMD
4. Ejecutar: CD  C:\oraclexe\app\oracle\product\11.2.0\server\apex
5. Ejecutar: SQLPLUS / AS SYSDBA
6. Ejecutar script del instalador:  @apexins SYSAUX SYSAUX TEMP /i/
NOTA: Tardará un buen rato. Al finalizar se cierra SQLPLUS.
7. Volver a SQLPLUS: SQLPLUS / AS SYSDBA
8. Ejecutar script de carga de imágenes: @apex_epg_config.sql C:\oraclexe\app\oracle\product\11.2.0\server
9. Ya tenemos instalada la nueva versión de APEX.
10. Para poner el idioma en español realizamos los siguientes pasos: 
1. Abrir un terminal CMD 
2. Ejecutar: CD C:\oraclexe\app\oracle\product\11.2.0\server\apex
3. Poner página de códigos a Unicode: CHCP 65001
4. Establecer variable de entorno: SET NLS_LANG=SPANISH_SPAIN.AL32UTF8
5. Iniciar SQLPLUS / AS SYSDBA
6. Ejecutar script: @load_trans.sql SPANISH



















1.4. Acceso a APEX 5.1
Usuario normal
http://127.0.0.1:8080/apex 






Usuario ADMIN 
http://127.0.0.1:8080/apex/apex_admin





1.5. Cambio de contraseña de usuario ADMIN de APEX.
Para cambiar la contraseña del usuario ADMIN de Application Express, debemos hacerlo desde un terminal de texto CMD. Los pasos que debemos eguir son los siguientes:
1. Abrir un terminal CMD 
2. Ejecutar: CD C:\oraclexe\app\oracle\product\11.2.0\server\apex
3. Iniciar SQLPLUS / AS SYSDBA
4. Ejecutar script: @apxchpwd


2. SEGURIDAD DE LOS DATOS
2.1. Privilegios y Roles
Existen 2 tipos de permisos:


Cambiar contraseña a usuario SYSTEM.
SQLPLUS  / AS SYSDBA
ALTER USER SYSTEM IDENTIFIED BY “SYSTEM”;


2.2. Conceder/Eliminar permisos
Un usuario puede dar privilegios a otro. No es necesario ser sysdba para conseguirlo: el usuario propietario del esquema otorga los privilegios deseados al otro usuario. La única necesidad, y esa sí es importante, es que el usuario del esquema que se va a compartir, debe tener suficientes privilegios para otorgarlos.
Veamos el código (debe ejecutarlo el usuario propietario del esquema que se desea compartir):
BEGIN 
  FOR tabla IN (SELECT * FROM USER_TABLES) LOOP 
   EXECUTE IMMEDIATE 
     'GRANT SELECT ON ' || tabla.table_name || ' TO OTRO_USUARIO'; 
  END LOOP;
END;
/
Lo que este código hace es, mediante un bucle, recorre todas las tablas del usuario que comparte su esquema y otorga los privilegios seleccionados (en este caso solo SELECT) a cada tabla para el usuario OTRO_USUARIO (sustituir por el nombre del usuario al que deseamos otorgar los permisos).

Ejemplo:
Tenemos un esquema (usuario) llamando E01 con 4 tablas y queremos conceder privilegios al esquema (usuario) llamado EMPLEADOS sobre las tablas anteriores. 

Para ello procedemos de la siguiente forma:
1. Accedemos como usuario E01 y concedemos privilegios al usuario  EMPLEADOS.
CONN E01/E01
GRANT ALL ON ALUMNO TO EMPLEADOS;
GRANT ALL ON PROFESOR TO EMPLEADOS;
GRANT ALL ON ASIGNATURA TO EMPLEADOS;
GRANT ALL ON RECIBE TO EMPLEADOS;

2. Accedemos como usuario EMPLEADOS y comprobamos que podemos trabajar con las tablas anteriores.
CONN EMPLEADOS/EMPLEADOS
DESCRIBE E01.ALUMNO;
DESCRIBE E01.PROFESOR;
SELECT * FROM E01.ASIGNATURA;
INSERT INTO E01.ALUMNO VALUES (1, 'JOSE', '01/01/1990', '600111222');

El usuario EMPLEADOS puede incluso crear vistas y sinónimos sobre las tablas anteriores.
Para ello, el administrador de la base de datos, deberá concederle dichos privilegios.
CONN SYSTEM/SYSTEM
GRANT CREATE VIEW, CREATE SYNONYM TO EMPLEADOS;

Ahora EMPLEADOS puede crear una vista sobre las tablas anteriores.
CONN EMPLEADOS/EMPLEADOS
CREATE VIEW PROF_ASIG (CODPROF, NOMPROF, ESPECIALIDAD, CODASIG, NOMASIG)  
AS 
SELECT P.IDPROFESOR, P.NOMBRE, P.ESPECIALIDAD, A.CODASIGNATURA, A.NOMBRE
FROM E01.PROFESOR P JOIN E01.ASIGNATURA A ON P.IDPROFESOR=A.IDPROFESOR;

Para no tener que escribir E01.PROFESOR y E01.ASIGNATURA cada vez, podemos crear sinónimos. Por ejemplo:
CREATE SYNONYM PROF FOR E01.PROFESOR;
CREATE SYNONYM ASIG FOR E01.ASIGNATURA;

A partir de ahora podemos acceder a las tablas E01.PROFESOR y E01.ASIGNATURA a través de los sinónimos PROF y ASIG. Por ejemplo:
SELECT * FROM PROF;


3. IMPORTACIÓN Y EXPORTACIÓN DE DATOS
3.1. Codificación de datos

3.2. Importación
CSV con precios (p. ej:  1.234,56 €) → convertir con TO_NUMBER
3.3. Exportación


