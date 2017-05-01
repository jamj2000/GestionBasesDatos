# DISEÑO DE MODELOS LÓGICOS NORMALIZADOS



> IES Luis Vélez de Guevara  
> Departamento de Informática



Contenido

```
1.  INTRODUCCIÓN	3
2.  DISEÑO DE BD	3
2.1.  Fase de Análisis: Especificación de requisitos Software (E.R.S.)	4
2.2.  Fase 1 del diseño. Diseño Conceptual: Modelo Entidad/Relación (E/R)	4
2.3.  Fase 2 del diseño. Diseño Lógico: Modelo Relacional	4
2.4.  Fase 3 del diseño. Diseño Físico: Modelo Físico	5
3.  MODELO ENTIDAD/RELACIÓN	5
3.1.  Entidades	6
3.2.  Atributos	6
3.3.  Relaciones	8
4.  MODELO E/R EXTENDIDO	17
4.1.  Relaciones de Jerarquía	18
5.  MODELO RELACIONAL	19
5.1.  Introducción	19
5.2.  Estructura de datos relacional	20
5.3.  Elementos y propiedades del modelo relacional	21
5.4.  Transformación de un esquema E/R a esquema relacional	21
6.  NORMALIZACIÓN	28
6.1.  Primera Forma Normal: 1FN	30
6.2.  Segunda Forma Normal: 2FN	30
6.3.  Tercera Forma Normal: 3FN	32
6.4.  Forma Normal de Boyce-Codd: FNBC	34
6.5.  Cuarta Forma Normal: 4FN	35
6.6.  Quinta Forma Normal: 5FN	36
7.  ACTIVIDADES	39
7.1.  Test	39
7.2.  Cuestiones	40
7.3.  Prácticas	50
```

## 1. INTRODUCCIÓN
En este tema veremos como hacer el diseño conceptual y lógico de una base de datos. 
Empezaremos elaborando el modelo conceptual usando diagramas Entidad-Relación y Entidad-Relación extendidos. Este diseño es de más alto nivel, más próximo al usuario y más alejado del diseño físico de la BD.
A continuación, a partir del modelo Entidad-Relación, procederemos a generar el modelo relacional, el cual ya se halla muy próximo al modelo físico de BD. Veremos las reglas de transformación que hemos de seguir para ello.
Por último deberemos normalizar las tablas obtenidas para evitar redundancias.
Resumiendo, los 2 modelos lógicos, de mayor a menor nivel de abstracción, que veremos en este tema son:
Modelo Entidad-Relación (extendido)
Modelo Relacional
En el siguiente tema, realizaremos el diseño físico de la BD a partir del modelo relacional.
2. DISEÑO DE BD
El diseño de una base de datos consiste en extraer todos los datos relevantes de un problema, por ejemplo, saber que datos están implicados en el proceso de facturación de una empresa que vende artículos de informática, o, que datos son necesarios para llevar el control de pruebas diagnósticas en un centro de radiológico.
Para extraer estos datos, se debe realizar un análisis en profundidad del problema, para averiguar qué datos son esenciales para la base de datos y descartar los que no sean necesarios. Una vez extraídos los datos esenciales comenzamos a construir los modelos adecuados. Es decir, construimos, mediante una herramienta de diseño de base de datos, un esquema que exprese con total exactitud todos los datos que el problema requiere almacenar. Ya dijimos en el tema anterior, que es algo equivalente al dibujo de un plano previo a la construcción de un edificio.
También introdujimos en el tema 1, las distintas fases por las que atraviesa el proceso de diseño de una Base de Datos. Además, previo al diseño es necesario realizar una primera fase denominada de análisis.
2.1. Fase de Análisis: Especificación de requisitos Software (E.R.S.)
Antes de pasar a diseñar una BD hay que tener claro que es lo que queremos hacer. Para ello, típicamente los informáticos se reúnen con los futuros usuarios del sistema para recopilar la información que necesitan para saber que desean dichos usuarios. Normalmente se hace una reunión inicial a y partir de ella se elabora una batería de preguntas para entrevistar a los usuarios finales en una segunda reunión y obtener de ella una información detallada de lo que se espera de nuestra BD. De estas entrevistas, se extrae el documento más importante del análisis, el documento de Especificación de Requisitos Software o E.R.S.
A partir de dicha E.R.S. Se extrae toda la información necesaria para la modelización de datos.
2.2. Fase 1 del diseño. Diseño Conceptual: Modelo Entidad/Relación (E/R)
Habitualmente quien realiza la modelización es un analista informático que no tiene porqué ser un experto en el problema que pretende resolver (Contabilidad, Gestión de Reservas hoteleras, medicina, economía, etc.). Es por esto que es imprescindible contar con la experiencia de un futuro usuario de la BD que conozca a fondo todos los entresijos del negocio, y que, a su vez, no tienen porqué tener ningún conocimiento de informática.
El objetivo de esta fase del diseño consiste es representar la información obtenida del usuario final y concretada en el E.R.S. mediante estándares para que el resto de la comunidad informática pueda entender y comprender el modelo realizado. El modelo que se utiliza en esta primera fase del diseño tiene un gran poder expresivo para poder comunicarse con el usuario que no es experto en informática y se denomina Modelo Conceptual.
El modelo conceptual que utilizaremos es el Modelo Entidad/Relación e iremos profundizando en él a lo largo de esta unidad.
2.3. Fase 2 del diseño. Diseño Lógico: Modelo Relacional
Este modelo es más técnico que el anterior porque está orientado al personal informático y generalmente tiene traducción directa al al modelo físico que entiende el SGBD.
Se obtienen a partir del modelo conceptual y dependerá de la implementación de la BD. Así, no es lo mismo implementar una base de datos jerárquica u orientada a objetos que una BD relacional. El modelo que se usará en este módulo es el Modelo Relacional.
2.4. Fase 3 del diseño. Diseño Físico: Modelo Físico
Es el resultado de aplicar el modelo lógico a un SGBD concreto. Generalmente está expresado en un lenguaje de programación de BBDD tipo SQL. En este módulo, transformaremos el Modelo Relacional en el modelo físico mediante el sublenguaje DDL de SQL. Esto se estudiará en el próximo tema.


3. MODELO ENTIDAD/RELACIÓN
El modelo Entidad-Relación es el modelo más utilizado para el diseño conceptual de bases de datos. Fue introducido por Peter Chen en 1976 y se basa en la existencia de objetos a los que se les da el nombre de entidades, y asociaciones entre ellos, llamadas relaciones. Sus símbolos principales se representan en el cuadro siguiente.

A continuación se detallan los elementos fundamentes de este modelo.
3.1. Entidades
Una entidad es cualquier objeto o elemento acerca del cual se pueda almacenar información en la BD. Las entidades pueden ser concretas como una persona o abstractas como una fecha. Las entidades se representan gráficamente mediante rectángulos y su nombre aparece en el interior. Un nombre de entidad sólo puede aparecer una vez en el esquema conceptual.
Tipos de entidades
Hay dos tipos de entidades: fuertes y débiles. Una entidad débil es una entidad cuya existencia depende de la existencia de otra entidad. Una entidad fuerte es una entidad que no es débil.


3.2. Atributos
Una entidad se caracteriza y distingue de otra por los atributos, en ocasiones llamadas propiedades o campos, que representan las características de una entidad. Los atributos de una entidad pueden tomar un conjunto de valores permitidos al que se le conoce como dominio del atributo. Dando valores a estos atributos, se obtienen las diferentes ocurrencias de una entidad.
En esencia, existen dos tipos de atributos:
Identificadores de entidad (también llamados clave primaria o clave principal): son atributos que identifican de manera unívoca cada ocurrencia de una entidad.
Descriptores de entidad: son atributos que muestran unas características de la entidad.
Siempre debe existir, al menos, un atributo identificativo.
Ejemplos de atributos:









Tipos de atributos

Atributos identificadores o identificativos: Son atributos cuyos valores no se repiten dentro de una misma entidad o relación. Sirven para identificar de forma unívoca cada ocurrencia. Actúan como clave principal o primaria. Por ejemplo CCC (Código Cuenta Corriente) que identifica cada cuenta bancaria. O ISBN (International Standard Book Number) que identifica cada libro que se publica. Un atributo identificativo puede ser un atributo compuesto. Por ejemplo CCC podría descomponerse en 3 atributos: num_banco, num_sucursal y num_cuenta.
Atributos discriminadores o discriminantes: Son atributos que discriminan distintas ocurrencias de una entidad débil en identificación dentro de la entidad fuerte de la que dependen. Lo representaremos con un círculo relleno de un color distinto a los atributos identificadores y descriptivos. Por ejemplo num_transacción dentro de una CCC o num_ejemplar dentro de un ISBN.
Atributos descriptores o descriptivos: Son los atributos que describen diversas propiedades de una entidad o relación (¡la relaciones también pueden tener atributos!). Son los más frecuentes.
Atributos derivados: Son atributos cuyos valores se calculan a partir de los valores de otros atributos. Por ejemplo podemos disponer de un atributo fecha_nac que sería un atributo descriptivo normal y calcular el valor del atributo edad a partir de él. El precio_total también podría calcularse a partir del precio + %iva.
Atributos multivaluados: Son atributos descriptores que poseen varios valores de un mismo dominio. Por ejemplo, si necesitamos almacenar varios e-mail de una misma persona entonces deberemos utilizar un atributo multivaluado. Igual sucede con el teléfono. Si sólo necesitamos almacenar un sólo valor utilizaremos un atributo descriptivo normal.
Atributos compuestos: Muchas veces se confunden con los anteriores, aunque no tienen nada que ver con ellos. Un atributo compuesto es un atributo que puede ser descompuesto en otros atributos pertenecientes a distintos dominios.
3.3. Relaciones
Una relación es la asociación que existe entre dos a más entidades. Cada relación tiene un nombre que describe su función. Las relaciones se representan gráficamente mediante rombos y su nombre aparece en el interior. Normalmente le pondremos de nombre la primera o primeras letras de las entidades que relaciona.
Las entidades que están involucradas en una determinada relación se denominan entidades participantes.
El número de participantes en una relación es lo que se denomina grado de la relación. Por ejemplo la relación CLIENTE-COCHE es de grado 2 o binaria, ya que intervienen dos entidades.

Observa que el nombre que ponemos a la relación usa las primeras letras de cada entidad. En este caso como ambas empiezan por “C” se añade algunas letras más para hacer referencia a CLIENTES. También podríamos haber puesto como nombre de la relación uno más descriptivo de la misma, por ejemplo “Compra” (CLIENTE compra COCHE), pero esta nomenclatura puede conducir a confusión a la hora de determinar la cardinalidad de la relación cuando estamos aprendiendo.
La relación PUBLICAR, es de grado 3, ya que involucra las entidades LIBRO, EDITORIAL y AUTOR.















Cuando una entidad está relacionada consigo misma, hablamos de relación reflexiva.








Aunque el modelo E-R permite relaciones de cualquier grado, la mayoría de las aplicaciones del modelo sólo consideran relaciones del grado 2.

El Papel o Rol de una entidad en una relación

Es la función que tiene en una relación. Se especifican los papeles o roles cuando se quiera aclarar el significado de una entidad en una relación. A continuación mostramos los mismos ejemplos del punto anterior pero incluyendo el papel o rol de cada entidad en las relaciones:

La Cardinalidad de una relación

Cuando la relación es binaria, cosa que ocurre en la mayoría de los casos, la cardinalidad es el número de ocurrencias de una entidad asociadas a una ocurrencia de la otra entidad.
Existen principalmente tres tipos de cardinalidades binarias:

Relación uno a uno 1:1  → A cada elemento de la primera entidad le corresponde no más de un elemento de la segunda entidad, y a la inversa.Es representado gráficamente de la siguiente manera:

Ejemplo cardinalidad 1:1



Relación uno a muchos 1:N → Significa que cada elemento de una entidad del tipo A puede relacionarse con cualquier cantidad de elementos de una entidad del tipo B, y un elemento de una entidad del tipo B solo puede estar relacionado con un elemento de una entidad del tipo A. Su representación gráfica es la siguiente:
Nótese en este caso que el extremo punteado de la flecha de la relación de A y B, indica un elemento de A conectado a muchos de B.
Ejemplo cardinalidad 1:N

Muchos a muchos N:M →  Establece que cualquier cantidad de elementos de una entidad del tipo A pueden estar relacionados con cualquier cantidad de elementos de una entidad del tipo B.


El extremo de la flecha que se encuentra punteada indica el “varios” de la relación.
Ejemplo cardinalidad N:M
La Participación de una entidad
La participación de una entidad también se conoce como cardinalidad de la entidad dentro de una relación. Una misma entidad puede tener distinta cardinalidad dentro de distintas relaciones.
Para obtener la participación, se debe fijar una ocurrencia concreta de una entidad y averiguar cuántas ocurrencias de la otra entidad le corresponden como mínimo y como máximo. Después realizar lo mismo en el otro sentido.
Estas ocurrencias mínimas y máximas (llamadas también participación de una entidad) se representarán entre paréntesis y con letras minúsculas en el lado de la relación opuesto a la entidad cuyas ocurrencias se fijan.
Para determinar la cardinalidad nos quedamos con las participaciones máximas de ambas y se representan con letras mayúsculas separadas por dos puntos junto al símbolo de la relación. Veamos algunos ejemplos:
Ejemplo 1

Un conductor “conduce” como mínimo 1 coche y como máximo 1 coche → Participación (1,1) y se pone en el lado opuesto a CONDUCTOR, es decir, junto a COCHE.
Un coche “es conducido” como mínimo por 1 conductor y como máximo por 1 conductor → Participación (1,1) y se pone en el lado opuesto a COCHE, es decir, junto a CONDUCTOR.
Para determinar la cardinalidad nos quedamos con las dos participaciones máximas. Es decir → 1:1.

Ejemplo 2

Un cliente “compra” como mínimo 1 coche y como máximo puede comprar más de un coche, es decir, varios coches. Ese varios se representa con la letra “n” → Participación (1,n)) y se pone en el lado opuesto a CLIENTE, es decir, junto a COCHE.
Un coche “es comprado” como mínimo por 1 cliente y como máximo por 1 cliente → Participación (1,1) y se pone en el lado opuesto a COCHE, es decir, junto a CLIENTE.
Para determinar la cardinalidad nos quedamos con las dos participaciones máximas y la “n” se pone en mayúsculas “N”. Es decir → 1:N.

Ejemplo 3
Un empleado “trabaja” como mínimo 1 departamento y como máximo puede trabajar en varios. Ese varios se representa con la letra “n” → Participación(1,n)) y se pone en el lado opuesto a EMPLEADO, es decir, junto a DEPARTAMENTO.
Un departamento “tiene” como mínimo por 1 empleado y como máximo puede tener varios → Participación (1,n) y se pone en el lado opuesto a DEPARTAMENTO, es decir, junto a EMPLEADO.
Para determinar la cardinalidad nos quedamos con las dos participaciones máximas y la “n” se pone en mayúsculas “N” y para diferenciar el otro “varios” en lugar de “N” ponemos “M” (Igual que cuando en matemáticas había dos variables no se ponía x e x sino x e y). Es decir → N:M.
Atributos propios de una relación
Las relaciones también pueden tener atributos, se les denominan atributos propios. Son aquellos atributos cuyo valor sólo se puede obtener en la relación, puesto que dependen de todas las entidades que participan en la relación. Veamos un ejemplo.
Ejemplo: 
Tenemos la relación “Compra” entre cliente y producto. Así un cliente puede comprar uno o varios productos, y un producto puede ser comprado por uno o varios clientes. Encontramos una serie de atributos propios de cada una de las entidades [CLIENTE (Cod_Cliente, Nombre, Dirección, edad, teléfono) y PRODUCTO (Cod_Producto, Nombre, Descripción, Precio_Unidad)], pero también podemos observar como el atributo “Cantidad” es un atributo de la relación. ¿Por qué? Pues porque un mismo cliente puede comprar distintas cantidades de distintos productos y un mismo producto puede ser comprado en distintas cantidades por distintos clientes. Es decir el atributo cantidad depende del cliente y del producto de que se traten. 
Relaciones de dependencia: Entidades Fuertes y Entidades Débiles
Al definir las entidades hablamos de dos tipos de ellas: fuertes y débiles. Una entidad débil está unida a una entidad fuerte a través de una relación de dependencia.
Hay dos tipos de relaciones de dependencia:
Dependencia en existencia
Se produce cuando una entidad débil necesita de la presencia de una fuerte para existir. Si desaparece la existencia de la entidad fuerte, la de la débil carece de sentido. Se representa con una barra atravesando el rombo y la letra E en su interior. Son relaciones poco frecuentes.
Ejemplo:
En la figura se muestra el caso de que un empleado puede tener ninguno, uno o varios hijos, por lo que los datos de los hijos deben sacarse en una entidad aparte, aunque siguen siendo datos propios de un empleado. Si se eliminase un registro de un empleado, no tendría sentido seguir manteniendo en la base datos la información sobre sus hijos.
Dependencia en identificación
Se produce cuando una entidad débil necesita de la fuerte para identificarse. Por sí sola la débil no es capaz de identificar de manera unívoca sus ocurrencias. La clave de la entidad débil se forma al unir la clave de la entidad fuerte con los atributos identificadores de la entidad débil.
Ejemplo:
En la figura se observa que la provincia tiene uno o varios municipio y que un municipio pertenece a una sola provincia. Ahora bien si lo que identifica a los municipios es el código que aparece en el código postal, se tiene que las dos primeras cifras corresponden al código de la provincia y las tres últimas al del municipio. Por ejemplo, el C.P de Écija es 41400, dónde 41 es el código de la provincia y 400 el del municipio. De esta forma, habrá distintos municipios con código 400 en distintas provincias. Uno de estos municipios se distinguirá del resto al anteponerle las dos primeras cifras correspondientes al código de la provincial.



Símbolos de exclusividad o inclusividad entre relaciones
Otros símbolos usados en el modelo E/R son los siguientes:
Restricción de exclusividad entre dos tipos de relaciones R1 y R2 respecto a la entidad E1. Significa que E1 está relacionada, o bien con E2 o bien con E3, pero  no pueden darse ambas relaciones simultáneamente.
	




Ejemplo: Un empleado puede estar en una empresa, o bien realizando prácticas, en cuyo caso está asignado a un grupo de prácticas y no pertenece a ningún departamento en concreto. O bien puede ser empleado en plantilla y en este caso pertenece a un departamento.





Restricción de inclusividad entre dos tipos de relaciones R1 y R2 respecto a la entidad E1. Para que la entidad E1 participe en la relación R2 debe participar previamente en la relación R1. 





Ejemplo: Para  que un empleado pueda trabajar como diseñador de productos debe   haber asistido, al menos, a dos cursos.




Restricción de exclusión entre dos tipos de relaciones R1 y R2. Significa que E1 está relacionada con E2 bien mediante R1, o bien mediante R2 pero que no pueden darse ambas relaciones simultáneamente.





Ejemplo: Los empleados, en función de sus capacidades, o son diseñadores de productos o son operarios y los fabrican, no es posible que ningún empleado sea diseñador y fabricante a la misma vez.





Restricción de inclusión entre dos tipos de relaciones R1 y R2. Para que la entidad E1 participe en la relación R2 con E2 debe participar previamente en la relación R1.





Ejemplo: Para que un hombre se divorcie de una mujer, previamente ha de haberse casado con ella.


4. MODELO E/R EXTENDIDO
El modelo Entidad/Relación extendido incluye todo lo visto en el modelo Entidad/Relación pero además las Relaciones de Jerarquía. Una relación de jerarquía se produce cuando una entidad se puede relacionar con otras a través de una relación cuyo rol sería “Es un tipo de”.
Por ejemplo, imaginemos la siguiente situación:
Queremos hacer una BD sobre los animales de un Zoo. Tenemos las entidades ANIMAL, FELINO, AVE, REPTIL, INSECTO.
FELINO, AVE, REPTIL e INSECTO tendrían el mismo tipo de relación con ANIMAL: “son un tipo de”. Ahora bien, su representación mediante el E/R clásico sería bastante engorrosa:







Para evitar tener que repetir tantas veces el rombo de la misma relación, se utilizan unos símbolos especiales para estos casos y se sustituyen todos los rombos de relación “es un tipo de” por un triángulo invertido, donde la entidades de abajo son siempre un tipo de la entidad de arriba y se llaman subtipo e entidades hijas. La de arriba se denominará supertipo o entidad padre. Las relaciones jerárquicas siempre se hacen en función de un atributo que se coloca al lado de la relación “es_un”. En la figura siguiente sería “tipo”.
El ejemplo anterior quedaría del modo siguiente utilizando símbolos del E/R extendido.






4.1. Relaciones de Jerarquía
Vamos a ver los distintos tipos de relaciones de jerarquía existentes:
Total: Subdividimos la entidad Empleado en: Ingeniero, Secretario y Técnico y en nuestra BD no hay ningún otro empleado que no pertenezca a uno de estos tres tipos.
Parcial: Subdividimos la entidad Empleado en: Ingeniero, Secretario y Técnico pero en nuestra BD puede haber empleados que no pertenezcan a ninguno de estos tres tipos.
Solapada: Subdividimos la entidad Empleado, en: Ingeniero, Secretario y Técnico y en nuestra BD puede haber empleados que sean a la vez Ingenieros y secretarios, o secretarios y técnicos, etc.
Exclusiva: Subdividimos la entidad Empleado en: Ingeniero, Secretario y Técnico. En nuestra BD ningún empleado pertenece a más de una subentidad.

Ejemplos:
Jerarquía solapada y parcial



En esta BD un empleado podría ser simultáneamente técnico, científico y astronauta o técnico y astronauta, etc. (solapada). Además puede ser técnico, astronauta, científico o desempeñar otro empleo diferente (parcial).
Jerarquía solapada y total



En esta BD un empleado podría ser simultáneamente técnico, científico y astronauta o técnico y astronauta, etc. (solapada). Además puede ser solamente técnico, astronauta o científico (total).
Jerarquía exclusiva y parcial



En esta BD un empleado sólo puede desempeñar una de las tres ocupaciones (exclusiva) . Además puede ser técnico, o ser astronauta, o ser científico o también desempeñar otro empleo diferente, por ejemplo, podría ser FÍSICO (parcial).
Jerarquía exclusiva y total



Un empleado puede ser solamente técnico, astronauta o científico (total) y no ocupar más de un puesto (exclusiva)
Nota: Podéis observar que en los ejemplos hemos omitido las participaciones. La mayoría de las veces estas no se ponen.


5. MODELO RELACIONAL
5.1. Introducción
Los SGBD se pueden clasificar de acuerdo con el modelo lógico que soportan, el número de usuarios, el número de puestos, el coste... La clasificación más importante de los SGBD se basa en el modelo lógico, siendo los principales modelos que se utilizan en el mercado los siguientes: Jerárquico, en Red, Relacional y Orientado a Objetos.
La mayoría de los SGBD comerciales actuales están basados en el modelo relacional, en el que nos vamos a centrar, mientras que los sistemas más antiguos estaban basados en el modelo de red o el modelo jerárquico.
Los motivos del éxito del modelo relacional son fundamentalmente dos:
Se basan en el álgebra relacional que es un modelo matemático con sólidos fundamentos.
En esta sección se presenta el modelo relacional. Realizaremos la descripción de los principios básicos del modelo relacional: la estructura de datos relacional y las reglas de integridad. 
Ofrecen sistemas simples y eficaces para representar y manipular los datos.
La estructura fundamental del modelo relacional es precisamente esa, la "relación", es decir una tabla bidimensional constituida por filas (registros o tuplas) y columnas (atributos o campos). Las relaciones o tablas representan las entidades del modelo E/R, mientras que los atributos de la relación representarán las propiedades o atributos de dichas entidades. Por ejemplo, si en la base de datos se tienen que representar la entidad PERSONA, está pasará a ser una relación o tabla llamada "PERSONAS", cuyos atributos describen las características de las personas (tabla siguiente). Cada tupla o registro de la relación "PERSONAS" representará una persona concreta.
5.2. Estructura de datos relacional
PERSONAS
D.N.I.
Nombre
Apellido
Nacimiento
Sexo
Estado Civil
52.768.987
Juan
Loza
15/06/1976
H
Soltero
06.876.983
Isabel
Gálvez
23/12/1969
M
Casada
34.678.987
Micaela
Ruiz
02/10/1985
M
Soltera

En realidad, siendo rigurosos, una RELACIÓN del MODELO RELACIONAL es sólo la definición de la estructura de la tabla, es decir su nombre y la lista de los atributos que la componen. Una representación de la definición de esa relación podría ser la siguiente:






Para distinguir un registro de otro, se usa la "clave primaria o clave principal”.
En una relación puede haber más combinaciones de atributos que permitan identificar unívocamente una fila (estos se llamarán "llaves o claves candidatas"), pero entre éstas se elegirá una sola para utilizar como llave primaria. Los atributos de la llave primaria no pueden asumir el valor nulo.
5.3. Elementos y propiedades del modelo relacional
Relación (tabla): Representan las entidades de las que se quiere almacenar información en la BD. Esta formada por:
Filas (Registros o Tuplas) que corresponden a cada ocurrencia de la entidad.
Columnas (Atributos o campos) corresponden a las propiedades de la entidad.
Siendo rigurosos una relación está constituida sólo por los atributos, sin las tuplas.
Las relaciones tienen las siguientes propiedades:
Cada relación tiene un nombre y éste es distinto del nombre de todas las demás relaciones de la misma BD.
No hay dos atributos que se llamen igual en la misma relación.
El orden de los atributos no importa: los atributos no están ordenados.
Cada tupla es distinta de las demás: no hay tuplas duplicadas. (Como mínimo se diferenciarán en la clave principal)
El orden de las tuplas no importa: las tuplas no están ordenadas.
Clave candidata: atributo que identifica unívocamente una tupla. Cualquiera de las claves candidatas se podría elegir como clave principal.
Clave Principal: Clave candidata que elegimos como identificador de la tuplas.
Clave Alternativa: Toda clave candidata que no es clave primaria (las que no hayamos elegido como clave principal)
Una clave principal no puede asumir el valor nulo (Integridad de la entidad).
Dominio de un atributo: Conjunto de valores que pueden ser asumidos por dicho atributo.
Clave Externa o foránea o ajena: el atributo o conjunto de atributos que forman la clave principal de otra relación. Que un atributo sea clave ajena en una tabla significa que para introducir datos en ese atributo, previamente han debido introducirse en la tabla de origen. Es decir, los valores presentes en la clave externa tienen que corresponder a valores presentes en la clave principal correspondiente (Integridad Referencial).
5.4. Transformación de un esquema E/R a esquema relacional
Pasamos ya a enumerar las normas para traducir del Modelo E/R al modelo relacional, ayudándonos del siguiente ejemplo:

Entidades
Cada entidad se transforma en una tabla. El identificador (o identificadores) de la entidad pasa a ser la clave principal de la relación y aparece subrayada o con la indicación: PK (Primary Key). Si hay clave alternativa esta se pone en “negrita”.
Ejemplo: Todas las entidades del ejemplo anterior generan tabla. En concreto, la entidad AULA genera la siguiente tabla:






Relaciones binarias (de grado 2)
Relaciones N:M:  Es el caso más sencillo. Siempre generan tabla. Se crea una tabla que incorpora como claves ajenas o foráneas FK (Foreign Key) cada una de las claves de las entidades que participan en la relación. La clave principal de esta nueva tabla está compuesta por dichos campos. Es importante resaltar que no se trata de 2 claves primarias, sino de una clave primaria compuesta por 2 campos.
Si hay atributos propios, pasan a la tabla de la relación. Se haría exactamente igual si hubiera participaciones mínimas 0.
Orden de los atributos en las claves compuestas: Se deben poner a la izquierda todos los atributos que forman la clave. El orden de los atributos que forman la clave vendrá determinado por las consultas que se vayan a realizar. Las tuplas de la tabla suelen estar ordenadas siguiendo como índice la clave. Por tanto, conviene poner primero aquel/los atributos por los que se va a realizar la consulta.
Ejemplo: Realicemos el paso a tablas de la relación N:M entre MÓDULO (1,n) y ALUMNO (1,n). Este tipo de relación siempre genera tabla y los atributos de la relación, pasan a la tabla que ésta genera.






Relaciones 1:N: Por lo general no generan tabla. Se dan 2 casos:
Caso 1: Si la entidad  del lado “1” presenta participación (0,1), entonces se crea una nueva tabla para la relación que incorpora como claves ajenas las claves de ambas entidades. La clave principal de la relación será sólo la clave de la entidad del lado “N”.
Caso 2: Para el resto de situaciones, la entidad del lado “N” recibe como clave ajena la clave de la entidad del lado “1”. Los atributos propios de la relación pasan a la tabla donde se ha incorporado la clave ajena.
Ejemplo de caso 1: Realicemos el paso a tablas de la relación 1:N entre PROFESOR (1,n) y EMPRESA (0,1). Como en el lado “1” encontramos participación mínima 0, se generará una nueva tabla.
Ejemplo de caso 2: Realicemos el paso a tablas de la relación 1:N entre MÓDULO (1,1) y TEMA (1,n). Como no hay participación mínima “0” en el lado 1, no genera tabla y la clave principal del lado “1” pasa como foránea al lado “n”. 




Relaciones 1:1: Por lo general no generan tabla.  Se dan 3 casos:
Caso 1:  Si las dos entidades participan con participación (0,1), entonces se crea una nueva tabla para la relación.
Caso 2:  Si alguna entidad, pero no las dos, participa con participación mínima 0 (0,1), entonces se pone la clave ajena en dicha entidad, para evitar en lo posible, los valores nulos.
Caso 3: Si tenemos una relación 1:1 y ninguna tiene participación mínima 0,  elegimos la clave principal de una de ellas y la introducimos como clave clave ajena en la otra tabla. Se elegirá una u otra forma en función de como se quiera organizar la información para facilitar las consultas. Los atributos propios de la relación pasan a la tabla donde se introduce la clave ajena.
Ejemplo de caso 1: No se presenta ninguna situación así en el esquema estudiado.     Una situación donde puede darse este caso es en HOMBRE (0,1) se casa con MUJER (0,1).  Es similar al caso 1 del apartado anterior en relaciones 1:N, aunque en este caso debemos establecer una restricción de valor único para FK2.

Ejemplo de caso 2 (y 3): Realicemos el paso a tablas de la relación 1:1 entre ALUMNO (1,1) y BECA (0,1). Como BECA tiene participación mínima 0, incorporamos en ella, como clave foránea, la clave de ALUMNO. Esta forma de proceder también es válida para el caso 3, pudiendo acoger la clave foránea cualquiera de las entidades.





Relaciones de dependencia (Siempre de grado 2 y cardinalidad 1:N)
Relaciones de dependencia en existencia: Se comportan como una 1:N normal. La clave principal del lado 1 pasa al lado “N” como foránea (hacia adonde apunta la flecha)
Ejemplo: No encontramos ningún ejemplo, reseñado como tal, en el supuesto anterior. Ahora bien, se comportan en el paso a tablas como cualquier otra relación 1:N. Sólo se tendría en cuenta, el hecho de ser débil en existencia para en el momento de creación de la BD, imponer que al borrar una ocurrencia en el lado “1”, se borren las asociadas en el lado “n”.
Relaciones de dependencia en identificación: Por lo general no generan tablas, porque suelen ser 1:1 o 1:N. Como en toda relación 1:N, La clave de la entidad fuerte debe introducirse en la tabla de la entidad débil como foránea y, además en este caso, formar parte de la clave de ésta. En las entidades débiles, la clave de la entidad fuerte debe ir la primera y, a continuación, los discriminadores de la débil.
Ejemplo: Realicemos el paso a tablas de la relación débil en identificación entre CURSO Y GRUPO.







Relaciones de grado mayor que 2
Relaciones n-arias (solo veremos hasta grado 3): Siempre generan tabla. Las claves principales de las entidades que participan en la relación pasan a la nueva tabla como claves foráneas. Y solo las de los lados “n” forman la principal. Si hay atributos propios de la relación, estos se incluyen en esa tabla.
Ejemplo: No encontramos ningún ejemplo de relación de más de grado 2 en el supuesto anterior. Se verán cuando aparezcan en algún ejercicio.


Relaciones reflexivas
Relaciones Reflexivas o Recursivas: Generan tabla o no en función de la cardinalidad.
Si es 1:1, no genera tabla. En la entidad se introduce dos veces la clave, una como clave principal y otra como clave ajena. Se suele introducir una modificación en el nombre por diferenciarlas.
Si es 1:N, se puede generar tabla o no. Si hubiese participación 0 en el lado 1, obligatoriamente se generaría tabla.
Si es N:N, la relación genera tabla.

Ejemplo:
Realicemos el paso a tablas de la relación reflexiva de ALUMNO. Como no tiene participación mínima “0” en el lado 1, no genera tabla. La clave principal de ALUMNOS, volverá a aparecer en ALUMNOS como clave foránea, igual que en cualquier relación 1:N. Ahora bien, como no puede haber dos campos con el mismo nombre en la misma tabla, deberemos cambiar un poco el nombre de la clave principal, para que haga referencia al papel que ocupa como clave foránea.






Jerarquías
Eliminación de las relaciones jerárquicas: Las relaciones jerárquicas son un caso especial. Se pueden dar algunas guías que sirvan de referencia, pero en la mayoría de los casos, va a depender del problema concreto. Estas guías son:
Se creará una tabla para la entidad supertipo. A no ser que tenga tan pocos atributos que dejarla sea una complicación.
Si la entidad subtipo no tiene atributos y no está relacionada con ninguna otra entidad, desaparece.
Si la entidad subtipo tiene algún atributo, se crea una tabla. Si no tiene clave propia, hereda la de la entidad supertipo.
Si la relación es exclusiva, el atributo que genera la jerarquía se incorpora en la tabla de la entidad supertipo. Si se ha creado una tabla por cada una de las entidades subtipo, no es necesario incorporar dicho atributo a la entidad supertipo.
Ejemplo: No encontramos ningún ejemplo de relación de jerarquía 2 en el supuesto anterior. Su paso a tablas, se verán en cuando aparezcan en los ejemplos concretos.
6. NORMALIZACIÓN
El diseño de una BD relacional se puede realizar aplicando al mundo real, en una primera fase, un modelo como el modelo E/R, a fin de obtener un esquema conceptual; en una segunda fase, se transforma dicho esquema al modelo relacional mediante las correspondientes reglas de transformación. También es posible, aunque quizás menos recomendable, obtener el esquema relacional sin realizar ese paso intermedio que es el esquema conceptual. En ambos casos, es conveniente (obligatorio en el modelo relacional directo) aplicar un conjunto de reglas, conocidas como Teoría de normalización, que nos permiten asegurar que un esquema relacional cumple unas ciertas propiedades, evitando:
La redundancia de los datos: repetición de datos en un sistema.
Anomalías de actualización: inconsistencias de los datos como resultado de datos redundantes y actualizaciones parciales.
Anomalías de borrado: pérdidas no intencionadas de datos debido a que se han borrado otros datos.
Anomalías de inserción: imposibilidad de adicionar datos en la base de datos debido a la ausencia de otros datos.
En la práctica, si la BD se ha diseñado haciendo uso de modelos semánticos como el modelo E/R no suele ser necesaria la normalización. Por otro lado si nos proporcionan una base de datos creada sin realizar un diseño previo, es muy probable que necesitemos normalizar.  
En la teoría de bases de datos relacionales, las formas normales (FN) proporcionan los criterios para determinar el grado de vulnerabilidad de una tabla a inconsistencias y anomalías lógicas. Cuanto más alta sea la forma normal aplicable a una tabla, menos vulnerable será a inconsistencias y anomalías.
Edgar F. Codd originalmente definió las tres primeras formas normales (1FN, 2FN, y 3FN) en 1970. Estas formas normales se han resumido como requiriendo que todos los atributos sean atómicos, dependan de la clave completa y en forma directa (no transitiva). La forma normal de Boyce-Codd  (FNBC) fue introducida en 1974 por los dos autores que aparecen en su denominación. Las cuarta y quinta formas normales (4FN y 5FN) se ocupan específicamente de la representación de las relaciones muchos a muchos y uno a muchos entre los atributos y fueron introducidas por Fagin en 1977 y 1979 respectivamente.
Cada forma normal incluye a las anteriores.







Antes de dar los conceptos de formas normales veamos unas definiciones previas:
Dependencia funcional: A → B, representa que B es funcionalmente dependiente de A. Para un valor de A siempre aparece un valor de B. 
Ejemplo: Si A es el D.N.I., y B el Nombre, está claro que para un número de  D.N.I, siempre aparece el mismo nombre de titular.
Dependencia funcional completa: A → B, si B depende de A en su totalidad.
Ejemplo: Tiene sentido plantearse este tipo de dependencia cuando A está compuesto por más de un atributo. Por ejemplo, supongamos que A corresponde al atributo compuesto: D.N.I._Empleado + Cod._Dpto. y B es Nombre_Dpto. En este caso B depende del Cod_Dpto., pero no del D.N.I._Empleado. Por tanto no habría dependencia funcional completa.
Dependencia transitiva: Si A→B y B→C, Entonces decimos que C depende de forma transitiva de A.
Ejemplo: Sea A el D.N.I. de un alumno, B la localidad en la que vive y  C la provincia. Es un caso de dependencia transitiva A→ B → C.
Determinante funcional: todo atributo, o conjunto de ellos, de los que depende algún otro atributo.
Ejemplo: El D.N.I. es un determinante funcional pues atributos como nombre, dirección, localidad, etc, dependen de él.
Dependencia multivaluada: A→→B. Son un tipo de dependencias en las que un determinante funcional no implica un único valor, sino un conjunto de ellos. Un valor de A siempre implica varios valores de B.
Ejemplo: CursoBachillerato →→ Modalidad. Para primer curso siempre va a aparecer en el campo Modalidad uno de los siguientes valores: Ciencias, Humanidades/Ciencias Sociales o Artes. Igual para segundo curso.

6.1. Primera Forma Normal: 1FN
Una Relación está en 1FN si y sólo si cada atributo es atómico.
Ejemplo: Supongamos que tenemos la siguiente tabla con datos de alumnado de un centro de enseñanza secundaria.
Alumnos
DNI
Nombre
Curso
FechaMatrícula
Tutor
LocalidadAlumno
ProvinciaAlumno
Teléfonos
11111111A
Eva
1ESO-A
01-Julio-2016
Isabel
Écija
Sevilla
660111222
22222222B
Ana
1ESO-A
09-Julio-2016
Isabel
Écija
Sevilla
660222333 660333444 660444555
33333333C
Susana
1ESO-B
11-Julio-2016
Roberto
Écija
Sevilla

44444444D
Juan
2ESO-A
05-Julio-2016
Federico
El Villar
Córdoba

55555555E
José
2ESO-A
02-Julio-2016
Federico
El Villar
Córdoba
661000111
661000222

Como se puede observar, esta tabla no está en 1FN puesto que el campo Teléfonos contiene varios datos dentro de una misma celda y por tanto no es un campo cuyos valores sean atómicos. La solución sería la siguiente:
Alumnos
DNI
Nombre
Curso
FechaMatrícula
Tutor
LocalidadAlumno
ProvinciaAlumno
11111111A
Eva
1ESO-A
01-Julio-2016
Isabel
Écija
Sevilla
22222222B
Ana
1ESO-A
09-Julio-2016
Isabel
Écija
Sevilla
33333333C
Susana
1ESO-B
11-Julio-2016
Roberto
Écija
Sevilla
44444444D
Juan
2ESO-A
05-Julio-2016
Federico
El Villar
Córdoba
55555555E
José
2ESO-A
02-Julio-2016
Federico
El Villar
Córdoba

Teléfonos
DNI
Teléfono
11111111A
660111222
22222222B
660222333
22222222B
660333444
22222222B
660444555
55555555E
661000111
55555555E
661000222

6.2. Segunda Forma Normal: 2FN
Una Relación esta en 2FN si y sólo si está en 1FN y todos los atributos que no forman parte de la Clave Principal tienen dependencia funcional completa de ella.
Ejemplo: Seguimos con el ejemplo anterior. Trabajaremos con la siguiente tabla:


Alumnos
DNI
Nombre
Curso
FechaMatrícula
Tutor
LocalidadAlumno
ProvinciaAlumno
11111111A
Eva
1ESO-A
01-Julio-2016
Isabel
Écija
Sevilla
22222222B
Ana
1ESO-A
09-Julio-2016
Isabel
Écija
Sevilla
33333333C
Susana
1ESO-B
11-Julio-2016
Roberto
Écija
Sevilla
44444444D
Juan
2ESO-A
05-Julio-2016
Federico
El Villar
Córdoba
55555555E
José
2ESO-A
02-Julio-2016
Federico
El Villar
Córdoba

Vamos a examinar las dependencias funcionales. El gráfico que las representa es el siguiente:
Siempre que aparece un DNI aparecerá el Nombre correspondiente y la LocalidadAlumno correspondiente. Por tanto  DNI → Nombre  y  DNI → LocalidadAlumno. Por otro lado siempre que aparece un Curso aparecerá el Tutor correspondiente. Por tanto Curso → Tutor. Los atributos Nombre y LocalidadAlumno no dependen funcionalmente de Curso, y el atributo Tutor no depende funcionalmente de DNI. 
El único atributo que sí depende de forma completa de la clave compuesta DNI y Curso es FechaMatrícula: (DNI,Curso) → FechaMatrícula.
A la hora de establecer la Clave Primaria de una tabla debemos escoger un atributo o conjunto de ellos de los que dependan funcionalmente el resto de atributos. Además debe ser una dependencia funcional completa. 
Si escogemos DNI como clave primaria, tenemos un atributo (Tutor) que no depende funcionalmente de él. Si escogemos Curso como clave primaria, tenemos otros atributos que no dependen de él. 
Si escogemos la combinación (DNI, Curso) como clave primaria, entonces sí tenemos todo el resto de atributos con dependencia funcional respecto a esta clave. Pero es una dependencia parcial, no total (salvo FechaMatrícula, donde sí existe dependencia completa).  Por tanto esta tabla no está en 2FN.
La solución sería la siguiente:
Alumnos
DNI
Nombre
Localidad
Provincia
11111111A
Eva
Écija
Sevilla
22222222B
Ana
Écija
Sevilla
33333333C
Susana
El Villar
Córdoba
44444444D
Juan
El Villar
Córdoba
55555555E
José
Écija
Sevilla





Matrículas
DNI
Curso
FechaMatrícula
11111111A
1ESO-A
01-Julio-2016
22222222B
1ESO-A
09-Julio-2016
33333333C
1ESO-B
11-Julio-2016
44444444D
2ESO-A
05-Julio-2016
55555555E
2ESO-A
02-Julio-2016
 
Cursos
Curso
Tutor
1ESO-A
Isabel
1ESO-B
Roberto
2ESO-A
Federico

6.3. Tercera Forma Normal: 3FN
Una Relación esta en 3FN si y sólo si está en 2FN y no existen dependencias transitivas. Todas las dependencias funcionales deben ser respecto a la clave principal.
Ejemplo: Seguimos con el ejemplo anterior. Trabajaremos con la siguiente tabla:
Alumnos
DNI
Nombre
Localidad
Provincia
11111111A
Eva
Écija
Sevilla
22222222B
Ana
Écija
Sevilla
33333333C
Susana
El Villar
Córdoba
44444444D
Juan
El Villar
Córdoba
55555555E
José
Écija
Sevilla


Las dependencias funcionales existentes son las siguientes. Como podemos observar existe una dependencia funcional transitiva: DNI → Localidad → Provincia




Para que la tabla esté en 3FN, no pueden existir dependencias funcionales transitivas. Para solucionar el problema deberemos crear una nueva tabla. El resultado es:
Alumnos
DNI
Nombre
Localidad
11111111A
Eva
Écija
22222222B
Ana
Écija
33333333C
Susana
El Villar
44444444D
Juan
El Villar
55555555E
José
Écija

Localidades
Localidad
Provincia
Écija
Sevilla
El Villar
Córdoba

RESULTADO FINAL

Alumnos
DNI
Nombre
Localidad
11111111A
Eva
Écija
22222222B
Ana
Écija
33333333C
Susana
El Villar
44444444D
Juan
El Villar
55555555E
José
Écija


Teléfonos
DNI
Teléfono
11111111A
660111222
22222222B
660222333
22222222B
660333444
22222222B
660444555
55555555E
661000111
55555555E
661000222

Matrículas
DNI
Curso
FechaMatrícula
11111111A
1ESO-A
01-Julio-2016
22222222B
1ESO-A
09-Julio-2016
33333333C
1ESO-B
11-Julio-2016
44444444D
2ESO-A
05-Julio-2016
55555555E
2ESO-A
02-Julio-2016


Localidades
Localidad
Provincia
Écija
Sevilla
El Villar
Córdoba

Cursos
Curso
Tutor
1ESO-A
Isabel
1ESO-B
Roberto
2ESO-A
Federico

6.4. Forma Normal de Boyce-Codd: FNBC
Una Relación esta en FNBC si está en 3FN y no existe solapamiento de claves candidatas. Solamente hemos de tener en cuenta esta forma normal cuando tenemos varias claves candidatas compuestas y existe solapamiento entre ellas. Pocas veces se da este caso.
Ejemplo: Tenemos una tabla con información de proveedores, códigos de piezas y cantidades de esa pieza que proporcionan los proveedores. Cada proveedor tiene un nombre único. Los datos son:
Suministros
CIF
Nombre
CódigoPieza
CantidadPiezas
S-11111111A
Ferroman
1
10
B-22222222B
Ferrotex
1
7
M-33333333C
Ferropet
3
4
S-11111111A
Ferroman
2
20
S-11111111A
Ferroman
3
15
B-22222222B
Ferrotex
2
8
B-22222222B
Ferrotex
3
4
 
El gráfico de dependencias funcionales es el siguiente:

El atributo CantidadPiezas tiene dependencia funcional de dos claves candidatas compuestas, que son:
(NombreProveedor, CodigoPieza)
(CIFProveedor, CódigoPieza)
Existe también una dependencia funcional en doble sentido (que no nos afecta): NombreProveedor  ↔ CIFProveedor.

Para esta tabla existe un solapamiento de 2 claves candidatas compuestas. Para evitar el solapamiento de claves candidatas dividimos la tabla. La solución es:

Proveedores
CIF
Nombre
S-11111111A
Ferroman
B-22222222B
Ferrotex
M-33333333C
Ferropet




Suministros
CIF
CódigoPieza
CantidadPiezas
S-11111111A
1
10
B-22222222B
1
7
M-33333333C
3
4
S-11111111A
2
20
S-11111111A
3
15
B-22222222B
2
8
B-22222222B
3
4


6.5. Cuarta Forma Normal: 4FN
Una Relación esta en 4FN si y sólo si está en 3FN (o FNBC) y las únicas dependencias  multivaluadas son aquellas que dependen de las claves candidatas.
Ejemplo: Tenemos una tabla con la información de nuestros alumnos y alumnas y las asignaturas que cursan así como los deportes que practican. 
Alumnado
Estudiante
Asignatura
Deporte
11111111A
Matemáticas, Lengua
Natación, Baloncesto
22222222B
Matemáticas
Fútbol, Natación



Alumnado
Estudiante
Asignatura
Deporte
11111111A
Matemáticas
Natación
11111111A
Matemáticas
Baloncesto
11111111A
Lengua
Natación
11111111A
Lengua
Baloncesto
22222222B
Matemáticas
Fútbol
22222222B
Matemáticas
Natación

Para normalizar esta tabla, debemos darnos cuenta que la oferta de asignaturas está compuesta por un conjunto de valores limitado. Igual sucede con los deportes. 
Por tanto existen dos dependencias multivaluadas: 
Estudiante →→ Asignatura
Estudiante →→ Deporte 
Por otro lado no existe ninguna dependencia entre la asignatura cursada y el deporte practicado. 
Para normalizar a 4FN creamos 2 tablas:
EstudiaAsignatura
Estudiante
Asignatura
11111111A
Matemáticas
11111111A
Lengua
22222222B
Matemáticas


PracticaDeporte
Estudiante
Deporte
11111111A
Natación
11111111A
Baloncesto
22222222B
Fútbol
22222222B
Natación


Diagrama E/R equivalente






6.6. Quinta Forma Normal: 5FN
La quinta forma normal (5FN), es una generalización de la anterior. También conocida como forma normal de proyección-unión (PJ/NF). Una tabla se dice que está en 5NF si y sólo si está en 4NF y cada dependencia de unión (join) en ella es implicada por las claves candidatas.
Ejemplo: Tenemos una tabla con varios proveedores que nos proporcionan piezas para distintos proyectos. Asumimos que un Proveedor suministra ciertas Piezas en particular, un Proyecto usa ciertas Piezas, y un Proyecto es suplido por ciertos Proveedores, entonces tenemos las siguientes dependencias multivaluadas:
Proveedor →→ Pieza
Pieza →→ Proyecto
Proyecto →→ Proveedor
Se puede observar como se produce un ciclo: 
Proveedor →→ Pieza →→ Proyecto →→ Proveedor (nuevamente)

Suministros
Proveedor
Pieza
Proyecto
E1, E4, E6
PI3,PI6
PR2, PR4
E2, E5
PI1, PI2
PR1, PR3
E3, E7
PI4, PI5
PR5, PR6


Suministros
Proveedor
Pieza
Proyecto
E1
PI3
PR2
E1
PI3
PR4
E1
PI6
PR2
E1
PI6
PR4
E4
PI3
PR2
E4
PI3
PR4
E4
PI6
PR2
E4
PI6
PR4
E6
PI3
PR2
E6
PI3
PR4
E6
PI6
PR2
E6
PI6
PR4
E2
PI1
PR1
E2
PI1
PR3
E2
PI2
PR1
E2
PI2
PR3
E5
PI1
PR1
E5
PI1
PR3
E5
PI2
PR1
E5
PI2
PR3
E3
PI4
PR5
E3
PI4
PR6
E3
PI5
PR5
E3
PI5
PR6
E7
PI4
PR5
E7
PI4
PR6
E7
PI5
PR5
E7
PI5
PR6

Descomponemos la tabla en 3 tabla nuevas:  Proveedor-Pieza, Pieza-Proyecto, Proyecto-Proveedor.


Proveedor
Pieza
E1
PI3
E1
PI6
E4
PI3
E4
PI6
E6
PI3
E6
PI6
E2
PI1
E2
PI2
E5
PI1
E5
PI2
E3
PI4
E3
PI5
E7
PI4
E7
PI5


Pieza
Proyecto
PI3
PR2
PI3
PR4
PI6
PR2
PI6
PR4
PI1
PR1
PI1
PR3
PI2
PR1
PI2
PR3
PI4
PR5
PI4
PR6
PI5
PR5
PI5
PR6


Proyecto
Proveedor
PR2
E1
PR4
E1
PR2
E4
PR4
E4
PR2
E6
PR4
E6
PR1
E2
PR3
E2
PR1
E5
PR3
E5
PR5
E3
PR6
E3
PR5
E7
PR6
E7
El producto natural de estas 3 tablas nos da la tabla original.
Proveedor-Pieza |x| Pieza-Proyecto |x| Proyecto-Proveedor = Suministros

Diagrama E/R equivalente







7. ACTIVIDADES 
7.1. Test
MODELO ENTIDAD-RELACIÓN
Para cada una de las siguientes cuestiones elige razonadamente cada una de las respuestas correctas.
7.1.1. Un modelo conceptual de datos:
a) Define una serie de símbolos para describir la realidad de la BD que se desea crear.
b) Es un modelo que describe como se almacenan los datos a nivel físico.
c) Permite realizar una representación del mundo real.
7.1.2. El modelo Entidad/Relación:
a) Utiliza rombos para representar las entidades.
b) Utiliza círculos para representar las relaciones.
c) Cuenta con símbolos diferentes para representar las entidades fuertes y las débiles.
7.1.3. Las relaciones del modelo E/R...
a) Son objetos reales o abstractos de los que se desea guardar información en una BD.
b) Pueden ser fuerte o débiles.
c) Pueden ser de dependencia en identificación o en existencia.
7.1.4. Los atributos del modelo E/R ...
a) Que identifican unívocamente cada ocurrencia de la entidad se llaman Clave principal.
b) Aparecen sólo en las entidades.
c) Aparecen sólo en las relaciones.
7.1.5. La cardinalidad...
a) 1:1 es una cardinalidad binaria que significa que a cada ocurrencia de una entidad le corresponde una sola ocurrencia de la otra entidad.
b) En el caso de relaciones entre tres entidades pueden ser de los tipos: 1:1, 1:N o N:M.
c) Toma las participaciones máximas de cada entidad.
7.2. Cuestiones


MODELO ENTIDAD-RELACIÓN
7.2.1. Define brevemente los siguientes conceptos:
a) Entidad.
b) Relación.
c) Atributo de una entidad.
d) Identificador de una entidad.
e) Atributo de una relación.
f) Rol de una entidad en una relación.
g) Participación de una entidad en una relación.
h) Cardinalidad de una relación.
7.2.2. Indica cuales son los dos tipos posibles de entidades y explica brevemente cada una de ellas.
7.2.3. Clasifica los distintos tipos de relaciones existentes entre dos entidades según su cardinalidad y pon un ejemplo de cada una de ellas distinto de los vistos en el tema.
7.2.4. Clasifica los distintos tipos de relaciones de dependencia existentes y pon un ejemplo de cada una de ellas distinto de los vistos en el tema.
7.2.5. Explica brevemente la Restricción de exclusividad entre dos tipos de relaciones R1 y R2 respecto a la entidad E1. Pon un ejemplo distinto del visto en el tema.
7.2.6. Explica brevemente la Restricción de inclusión entre dos tipos de relaciones R1 y R2. Pon un ejemplo distinto del visto en el tema.




7.2.7. Dado el siguiente esquema:

(a) Indica cuáles son las entidades del modelo, diferenciado entre entidades fuertes y débiles, si las hubiera
(b) Señala las relaciones e indica cual es la cardinalidad de cada una. Trata de indicar también la participación de cada entidad en las relaciones así como su rol.
(c) Señala si hay alguna relación de dependencia o reflexiva.
(d) Trata de escribir atributos lógicos para cada una de las entidades e indica en cada caso cual podría ser el identificador.
(e) ¿Qué significado tiene el atributo “NumGoles”?¿Por qué está en la relación en lugar de estar en JUGADOR o en PARTIDO?
7.2.8. Obtén el diagrama E/R con las tres entidades siguientes:
ALUMNO (Núm_Matrícula, Nombre, FechaNacimiento, Teléfono)
ASIGNATURA (Código_asignatura, Nombre)
PROFESOR (Id_P, NIF_P, Nombre, Especialidad, Teléfono)
Teniendo en cuenta:
Un alumno puede estar matriculado de una o varias asignaturas.
Además puede estar matriculado en la misma asignatura más de un curso escolar (si repite).
Se quiere saber el curso escolar en el que cada alumno está matriculado de cada asignatura.
En una asignatura habrá como mínimo 10 y como máximo 25 alumnos.
Una asignatura es impartida por un único profesor.
Un profesor podrá impartir varias asignaturas.
7.2.9. Obtén el diagrama E/R con las cuatro entidades siguientes:
REGIÓN( Nombre_Región)
PROVINCIA (CódigoProvincia, Nombre_provincia)
LOCALIDAD (Código_localidad, Nombre)
EMPLEADO(Id_E, DNI_E, Nombre, Teléfono, Salario)
Se quiere guardar información de la localidad donde ha nacido cada uno de los empleados teniendo en cuenta que:
Un empleado ha nacido en una sola localidad.
Cada localidad pertenece a una única provincia.
Cada provincia pertenece a una única región del país.
7.2.10. Obtén el diagrama E/R con las dos entidades siguientes:
EMPLEADO(Id_E, DNI_E, Nombre, Teléfono, Salario)
DEPARTAMENTO(Código_D, Nombre, Localización)
Teniendo en cuenta:
Un empleado pertenece a un único departamento y en un departamento puede haber varios empleados. Pero sólo uno será el jefe del departamento.
Un empleado podrá ser jefe o no. Si no es jefe, su jefe será el del departamento al que pertenece.
7.2.11. Obtén el diagrama E/R para el siguiente supuesto.
Una empresa dedicada a la instalación de dormitorios juveniles a medida quiere realizar una base de datos donde se reflejen las ventas y montajes, para lo cual se tiene en cuenta:
Cada modelo de dormitorio lo debe montar, al menos, dos montadores.
El mismo montador puede montar varios modelos de dormitorios.
De cada modelo dormitorio nos interesa conocer su código de modelo.
El mismo montador puede montar el mismo modelo en diferentes fechas. Nos interesa conocer la fecha en la que realiza cada montaje.
De un montador nos interesa su NIF, nombre, dirección, teléfono de contacto y el número de dormitorios que ha montado de cada modelo.
Cada modelo de dormitorio puede ser comprado por uno o varios clientes y el mismo cliente podrá comprar uno o varios dormitorios. De un cliente nos interesa su NIF, nombre, dirección, teléfono y fecha de compra de cada modelo
7.2.12. Se desea diseñar una base de datos sobre la información de las reservas de una empresa dedicada al alquiler de automóviles teniendo en cuenta que:
Un determinado cliente puede tener en un momento dado hechas varias reservas.
De cada cliente se desea almacenar su DNI, nombre, dirección y teléfono.
Además dos clientes se diferencian por un único código.
De cada reserva es importante registrar su número de identificación, la fecha de inicio y final de la reserva, el precio total.
De cada coche se requiere la matrícula, el modelo, el color y la marca. Cada coche tiene un precio de alquiler por hora.
Además en una reserva se pueden incluir varios coches de alquiler. Queremos saber los coches que incluye cada reserva y los litros de gasolina en el depósito en el momento de realizar la reserva, pues se cobrarán a parte.
Cada cliente puede ser avalado por otro cliente de la empresa.
7.2.13. Tenemos esta información sobre una cadena editorial:
La editorial tiene varias sucursales, con su domicilio, teléfono y un código de sucursal.
Cada sucursal tiene varios empleados, de los cuales tendremos sus datos personales, DNI y teléfono. Un empleado trabaja en una única sucursal.
En cada sucursal se publican varias revistas, de las que almacenaremos su título, número de registro, periodicidad y tipo.
La editorial tiene periodistas (que no trabajan en las sucursales) que pueden escribir artículos para varias revistas. Almacenaremos los mismos datos que para los empleados, añadiendo su especialidad.
Para cada revista, almacenaremos información de cada número, que incluirá la fecha, número de páginas y el número de ejemplares vendidos.
7.2.14. La cadena de Video-Clubs Glob-Gusters ha decidido, para mejorar su servicio, emplear una base de datos para almacenar la información referente a las películas que ofrece en alquiler. Esta información es la siguiente:
Una película se caracteriza por su título, nacionalidad, productora y fecha. Puede haber varias películas con el mismo título pero rodadas en fechas distintas.
En una película pueden participar varios actores (nombre, nacionalidad, sexo) algunos de ellos como actores principales.
Una película está dirigida por un director (nombre, nacionalidad).
De cada película se dispone de uno o varios ejemplares diferenciados por un número de ejemplar y caracterizados por su estado de conservación.
Un ejemplar se puede encontrar alquilado a algún socio (DNI, nombre, dirección, teléfono) . Se desea almacenar la fecha de comienzo del alquiler y la de devolución.
Un socio tiene que ser avalado por otro socio que responda de él en caso de tener problemas en el alquiler.
7.2.15. Diseñar un esquema E/R que recoja la organización de un sistema de información en el que se quiere tener los datos sobre municipios, viviendas y personas. Cada persona sólo puede habitar una vivienda, pero puede ser propietaria de varias. También nos interesa la relación de las personas con su cabeza de familia.
7.2.16. Se desea diseñar una BD de una entidad bancaria que contenga información sobre los clientes, las cuentas, las sucursales y las transacciones producidas. Construir el Modelo E/R teniendo en cuenta las siguientes restricciones:
Una transacción viene determinada por un número de transacción (único para cada cuenta), la fecha y la cantidad.
Un cliente puede tener muchas cuentas.
Una cuenta puede ser de muchos clientes.
Una cuenta sólo puede estar en una sucursal.
7.2.17. Una base de datos para una pequeña empresa debe contener información acerca de clientes, artículos y pedidos. Hasta el momento se registran los siguientes datos en documentos varios:
Para cada cliente: Número de cliente (único), Direcciones de envío (varias por cliente), Saldo, Límite de crédito, Descuento.
Para cada artículo: Número de artículo (único), Fábricas que lo distribuyen, Existencias de ese artículo en cada fábrica, Descripción del artículo.
Para cada pedido: Cada pedido se registrará en un documento impreso que tiene una cabecera y el cuerpo del pedido. Para generar dicho informe se necesitará la siguiente información:
La cabecera está formada por el número de cliente, dirección de envío y fecha del pedido.
El cuerpo del pedido son varias líneas, en cada línea se especifican el número del artículo pedido y la cantidad.
Además, se ha determinado que se debe almacenar la información de las fábricas. Sin embargo, dado el uso de distribuidores, se usará: Número de la fábrica (único) y Teléfono de contacto.
Y se desean ver cuántos artículos (en total) provee la fábrica. También, por información estratégica, se podría incluir información de fábricas alternativas respecto de las que ya fabrican artículos para esta empresa.
Se pide hacer el diagrama ER para la base de datos que represente esta información.
7.2.18. Le contratan para hacer una BD que permita apoyar la gestión de un sistema de ventas.
La empresa necesita llevar un control de proveedores, clientes, productos y ventas.
Un proveedor tiene un código único, nombre, dirección, teléfono y página web.
Un cliente también tiene un código único, nombre, dirección, pero puede tener varios teléfonos de contacto. La dirección se entiende por calle, número, comuna y ciudad.
Un producto tiene un id único, nombre, precio actual, stock y nombre del proveedor. Además se organizan en categorías, y cada producto va sólo en una categoría. Una categoría tiene id, nombre y descripción.
Por razones de contabilidad, se debe registrar la información de cada venta con un id, fecha, cliente, descuento y monto final. Además se debe guardar el precio al momento de la venta, la cantidad vendida y el monto total por el producto.


MODELO ENTIDAD-RELACIÓN EXTENDIDO
7.2.19. El departamento de formación de una empresa desea construir una base de datos para planificar y gestionar la formación de sus empleados.
La empresa organiza cursos internos de formación de los que se desea conocer el código de curso, el nombre, una descripción, el número de horas de duración y el coste del curso.
Un curso puede tener como prerrequisito haber realizado otro u otros previamente, y a su vez, la realización de un curso puede ser prerrequisito de otros. Un curso que es un prerrequisito de otro puede serlo de forma obligatoria o sólo recomendable.
Un mismo curso tiene diferentes ediciones, es decir, se imparte en diferentes lugares, fechas y con diferentes horarios (intensivo, de mañana o de tarde). En una misma fecha de inicio sólo puede impartirse una edición de un curso.
Los cursos se imparten por personal de la propia empresa.
De los empleados se desea almacenar su código de empleado, nombre y apellidos, dirección, teléfono, NIF (Número de Identificación Fiscal), fecha de nacimiento, nacionalidad, sexo, firma y salario, así como si está o no capacitado para impartir cursos.
Un mismo empleado puede ser docente en una edición de un curso y alumno en otra edición, pero nunca puede ser ambas cosas a la vez (en una misma edición de curso o lo imparte o lo recibe).
Realiza el Modelo Entidad/Relación
7.2.20. Una Empresa decide informatizar su gestión de nóminas. Del resultado del análisis realizado, se obtienen las siguientes informaciones:
A cada empleado se le entregan múltiples nómina a lo largo de su vida laboral en la empresa y al menos una mensualmente.
A cada empleado se le asigna un número de empleado en el momento de su incorporación a la empresa, y éste es el número usado a efectos internos de identificación. Además, se registran el Número de Identificación Fiscal del empleado, nombre, número de hijos, porcentaje de retención para Hacienda, datos de cuenta corriente en la que se le ingresa el dinero (banco, sucursal y número de cuenta) y departamentos en los que trabaja.
Un empleado puede trabajar en varios departamentos y en cada uno de ellos trabajará con un función distinta.
De un departamento se mantiene el nombre y cada una de sus posibles sedes.
Son datos propios de una nómina el ingreso total percibido por el empleado y el descuento total aplicado.
La distinción entre dos nómina se hará, además de mediante el número de identificación del empleado, mediante el ejercicio fiscal y número de mes al que pertenece y con un número de orden en el caso de varias nóminas recibidas el mismo mes.
Cada nómina consta de varias líneas (al menos una de ingresos) y cada línea se identifica por un número de línea dentro de la correspondiente nómina.
Una línea puede corresponder a un ingreso o a un descuento. En ambos casos, se recoge la cantidad que corresponde a la línea (en positivo si se trata de un ingreso o en negativo si se trata de un descuento); en el caso de los descuentos, se recoge la base sobre la cual se aplica y el porcentaje que se aplica para el cálculo de éstos.
Toda línea de ingreso de una nómina responde a un único concepto retributivo.
En un mismo justificante, puede haber varias líneas que respondan al mismo concepto retributivo.
De los conceptos retributivos se mantiene un código y una descripción.
Realiza el Modelo Entidad/Relación
7.2.21. La ministra de Medio Ambiente ha decidido crear un sistema de información sobre los parques naturales gestionados por cada comunidad autónoma. Después de realizar un detallado análisis, se ha llegado a las siguientes conclusiones:
Una comunidad autónoma (CA) puede tener varios parques naturales. En toda comunidad autónoma existe uno y sólo un organismo responsable de los parques. Un parque puede estar compartido por más de una comunidad.
Un parque natural se identifica por un nombre, fue declarado en una fecha, se compone de varias áreas identificadas por un nombre y caracterizadas por una determinada extensión. Por motivos de eficiencia se desea favorecer las consultas referentes al número de parques existentes en cada comunidad y la superficie total declarada parque natural en cada CA.
En cada área forzosamente residen especies que pueden ser de tres tipos: vegetales, animales y minerales. Cada especie tiene una denominación científica, una denominación vulgar y un número inventariado de individuos por área. De las especies vegetales se desea saber si tienen floración y en qué periodo se produce ésta; de las animales se desea saber su tipo de alimentación (herbívora, carnívora u omnívora) y sus periodos de celo; de las minerales se desea saber si se trata de cristales o de rocas.
Además, interesa registrar qué especies sirven de alimento a otras especies, teniendo en cuenta que ninguna especie mineral se considera alimento de cualquier otra especie y que una especie vegetal no se alimenta de ninguna otra especie.
Del personal del parque se guarda el DNI, número de seguridad social, nombre, dirección, teléfonos (domicilio, móvil) y sueldo. Se distinguen los siguientes tipos de personal:
◦ Personal de gestión: registra los datos de los visitantes del parque y están destinados en una entrada del parque (las entradas se identifican por un número).
◦ Personal de vigilancia: vigila un área determinada del parque que recorre en un vehículo (tipo y matrícula).
◦ Personal de conservación: mantiene y conserva un área determinada del parque. Cada uno lo realiza en una especialidad determinada (limpieza, caninos...).
◦ Personal investigador: Tiene una titulación que ha de recogerse y pueden realizar (incluso conjuntamente) proyectos de investigación sobre una determinada especie.
Un proyecto de investigación tiene un presupuesto y un periodo de realización.
Un visitante (DNI, nombre, domicilio y profesión) debe alojarse dentro de los alojamientos de que dispone el parque; éstos tienen una capacidad limitada y tienen una determinada categoría.
Los alojamientos organizan excursiones al parque, en vehículo o a pie, en determinados días de la semana y a una hora determinada. A estas excursiones puede acudir cualquier visitante del parque.
















MODELO RELACIONAL

7.2.22. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.8.
7.2.23. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.9.
7.2.24. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.10.
7.2.25. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.11.
7.2.26. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.12.
7.2.27. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.13.
7.2.28. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.14.
7.2.29. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.15
7.2.30. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.16
7.2.31. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.17
7.2.32. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.18
7.2.33. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.19
7.2.34. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.20
7.2.35. Obtén el diagrama Relacional a partir el E/R obtenido en la cuestión 6.2.21







7.3. Prácticas

MODELO ENTIDAD-RELACIÓN
7.3.1. PRÁCTICA 1 
OBJETIVO: Aprender el uso básico del programa Dia, que utilizaremos para para realizar diagramas. En concreto diagramas ER extendidos y relacionales.
ENUNCIADO: Instala el programa Dia y la hoja de símbolos EER.zip para los símbolos utilizados en diagramas Entidad-Relación extendidos. Con la ayuda del profesor, examina la forma de uso de dicho programa.
Para ello deberás seguir los siguientes pasos:
1. Descarga de la plataforma Moodle el programa Dia.
2. Procede a su instalación.
3. Ejecutalo por primera vez para que se cree una subcarpeta .dia en tu directorio personal.


4. Descarga de la plataforma Moodle el archivo EER.zip que contiene los símbolos necesarios para diagramas E/R extendidos (Extended Entity-Relationship).
5. Copia este archivo a la subcarpeta .dia y descomprímelo ahí.

6. Se generará un nuevo archivo LICENSE y dos carpetas:  shapes y sheets.
7. Reinicia el programa Dia.
8. Debajo de las herramientas, selecciona Otras hojas → EER.


7.3.2. PRÁCTICA 2
OBJETIVO: Recordar todo lo visto en el tema 1 ahora que ya somos capaces de crear diagramas que modelen la realidad de nuestro problemas.
ENUNCIADO: Con ayuda de el profesor y lo visto sobre el tema referente al modelo relacional deberás:
a) Realizar el paso a tablas de la cuestión 6.2.8.
ALUMNO (Núm_Matrícula, Nombre, FechaNacimiento, Teléfono)
ASIGNATURA (Código_asignatura, Nombre)
PROFESOR (Id_P, NIF_P, Nombre, Especialidad, Teléfono)
b) Crea la BD que resulta en LibreOffice BASE eligiendo los tipos de datos y las restricciones.
c) Introduce 7 registros en la tabla ASIGNATURAS, 4 en la tabla PROFESORES y 15 en la tabla ALUMNOS. Además resultará una tabla MATRÍCULAS que deberás completar con el curso escolar en que cada alumno ha estado matriculado de cada asignatura. Asígnalos como estimes más oportuno. Recuerda que en cada asignatura habrá un mínimo de 10 alumnos.
d) En la tabla PROFESORES mueva la columna TELEFONO a la izquierda de la columna ESPECIALIDAD. Pruebe otros movimientos.
e) Oculte las columnas Fecha_nac y Tlfno de la tabla ALUMNOS. Vuelva a mostrarlas. Pruebe otras.
f) Diseñar una consulta del tipo Eliminación capaz de eliminar de la tabla ALUMNOS solo aquellos registros comprendidos entre dos fechasNac límite que nos deberá preguntar cada vez que ejecutemos la consulta (Parametros).
g) Crea una nueva consulta en la que muestres el no de matrícula, el nombre y la asignatura en la que está o ha estado matriculado cada alumno, incluyendo el curso de la matrícula.
f) Crea un formulario para la consulta que hemos creado en el punto anterior. El formulario deberá ser de Tipo Tabular y con todos los campos de la consulta.
g) Crea un informe para la consulta anterior. El informe será de tipo tabular con todos los campos de la consulta y deberá estar ordenado por NoMatrícula.
g) Modifica el aspecto del titulo del formulario añadiendo colores, bordes y cambiando el tipo de letra.

7.3.3. PRÁCTICA 3
OBJETIVO: Recordar todo lo visto en el tema 1 ahora que ya somos capaces de crear diagramas que modelen la realidad de nuestro problemas.
ENUNCIADO: Con ayuda del profesor deberás:
a) Realizar el paso a tablas de la cuestión 6.2.10.
b) Crea la BD que resulta en LibreOffice BASE eligiendo los tipos de datos y las restricciones. 
c) Introduce registros en cada una de las tablas.
d) Inventa cinco consultas y ejecútalas.
e) Para una de las consultas anteriores Crea un formulario de tipo Tabular y modifica un poco su aspecto.
f) Para la misma consulta que hayas elegido en el apartado anterior, crea un informe de Tipo Tabular y con todos los campos de la consulta.


MODELO ENTIDAD-RELACIÓN EXTENDIDO
7.3.4. PRÁCTICA 4
OBJETIVO: Recordar todo lo visto previamente y ampliarlo con lo nuevo aprendido en este tema.
ENUNCIADO: Resuelve los apartados siguientes
a) Realizar el modelo Entidad-Relación para modelar la situación real siguiente:
Queremos crear una base de datos para una empresa que fabrica y distribuye electrodomésticos. Debe contener información acerca de los departamentos, los empleados, los artículos, los clientes y los pedidos.
De los departamentos queremos saber su código de identificación y el presupuesto medio con el que cuenta. Dicho presupuesto medio no podrá superar nunca los 60.000 €. Los departamentos se agrupan en sectores: Financiero, Productivo, Recursos Humanos y Ventas. De los departamentos financieros queremos saber también y su dirección y la entidad bancaria con la que trabajan. De los departamentos del sector productivo queremos conocer los artículos que fabrican.
De los empleados guardaremos su NIF, nombre, dirección, fecha de nacimiento y departamento en el que trabajan. Cada empleado trabaja en un único departamento.
De cada artículo: Número de artículo (único), nombre, Departamento que lo fabrica y existencias de ese artículo en cada departamento.
Para cada cliente: Número de cliente (único), Direcciones de envío (varias por cliente), Saldo, Límite de crédito (depende del cliente, pero en ningún caso debe superar los 18.000 €), Descuento.
Para cada pedido: número del pedido (único para cada cliente), dirección de envío y fecha del pedido.
Además queremos saber el número de artículos de cada tipo que incluye cada pedido.
b) Con ayuda de la profesor, obtendrás el modelo relacional que aprenderás a realizar un poco más adelante.
c) Crea la BD que resulta en LibreOffice BASE eligiendo los tipos de datos y las restricciones.
d) Introduce registros en cada una de las tablas.
e) Inventa cinco consultas y ejecútalas.
f) Para una de las consultas anteriores Crea un formulario de tipo Tabular y modifica un poco su aspecto.
g) Para la misma consulta que hayas elegido en el apartado anterior, crea un informe de Tipo Tabular y con todos los campos de la consulta.

MODELO RELACIONAL
7.3.5. PRÁCTICA 5
OBJETIVO: Recordar todo lo visto y ampliarlo con lo nuevo aprendido.
ENUNCIADO: Resuelve los apartados siguientes.
A continuación mostramos un modelo E/R (hemos simplificado el número de atributos) del que se ha obtenido el correspondiente esquema relacional.






a) Crea la BD en LibreOffice BASE teniendo en cuenta la siguiente información adicional:

CLIENTE	
CAMPO
TIPO
TAMAÑO
PREDETERMINADO
VALIDACIÓN
Código Cliente
Autonumérico



Nombre
Texto
50

No vacío
Apellidos
Texto
50


Empresa
Texto
50


Puesto
Texto
50


Dirección
Texto
50


Población
Texto
25
Écija

CP
Texto
5
41400

Provincia
Texto
25
Sevilla

Teléfono
Texto
9


Fecha_Nacimiento
Fecha/hora




ARTÍCULO
CAMPO
TIPO
PROPIEDADES
PREDETERMINADO
VALIDACIÓN
Código Artículo
Autonumérico



Nombre
Texto


No vacío
Descripción
Texto


No vacío
Precio/unidad
Moneda
No negativo

No vacío
Unidades en stock
Numérico
[0,100]


Stock de Seguridad
Numérico
No inferior a 2
2

Imagen
Objeto OLE



COMPRA
CAMPO
TIPO
PROPIEDADES
PREDETERMINADO
VALIDACIÓN
Código Cliente
Numérico
Se seleccionarán desde la tabla Cliente


Código Artículo
Numérico
Se elegirán de la tabla Artículo


Fecha
Fecha/hora

Fecha_Actual

Unidades
Numérico
No negativo

No inferior a 1

b) Introduce los datos siguientes en la BD.
CLIENTE
Cod_Cli
Nombre
Apellidos
Empresa
Puesto
Dirección
Población
CP
Provincia
Teléfono
Fecha_nac
1
José
Fernández Ruiz
Estudio Cero
Gerente
Cervantes,13
Écija
41400
Sevilla
656789043
13/06/1968
2
Luis
Fernández Chacón
Beep
Dependiente
Aurora, 4
Écija
41400
Sevilla
675894566
24/05/1982
3
Antonio
Ruiz Gómez
Comar
Dependiente
Osuna, 23
Écija
41400
Sevilla
654345544
06/08/1989
4
Andrea
Romero Vázquez
Estudio Cero
Dependiente
Cervantes, 25
Écija
41400
Sevilla
646765657
23/11/1974
5
José
Pérez Pérez
Beep
Gerente
Córdoba, 10
Écija
41400
Sevilla
645345543
10/04/1978

ARTÍCULO
Cod_Art
Nombre
Descripción
Precio/Unidad
Unidades en stock
Stock Seg
Imagen
1
NETGEAR switch prosafe
Switch 8 puertos GigabitEthernet
125 €
3
2

2
Switch SRW224G4-EU de Linksys
CISCO switch 24 puertos 10/100
202,43 €
2
2

3
Switch D-link
D-Link smart switch 16 puertos
149,90 €
7
4

4
Switch D-link
D-Link smart switch 48 puertos
489,00 €
4
2




COMPRA
Cod_Cli
Cod_Art
Fecha
Unidad
1
1
13/10/2010
2
1
2
13/10/2010
1
2
3
15/10/2010
1
2
4
15/10/2010
1
3
1
15/10/2010
2
4
2
15/10/2010
1
5
3
15//10/2010
3
1
4
16/10/2010
1
1
1
16/10/2010
2
2
2
17/10/2010
1
3
3
18/10/2010
4
4
4
19/10/2010
2
5
1
19/10/2010
1

c) Diseña un formulario para introducir los datos de cada compra.
d) Diseña un informe donde se resuman los pedidos para cada cliente.

e) Realiza las siguientes consultas de la BD.
e-1) Mostrar los nombres y apellidos de los clientes llamados José o Luis ordenados alfabéticamente por nombres.
e-2) Obtener el nombre y el teléfono de los clientes cuya edad está comprendida entre 20 y 25 años ordenados por edad.
e-3) Mostrar nombre y apellidos de los clientes que no tengan teléfono.
e-4) Mostrar aquellos productos cuyo stock en almacén sea menor que cuatro.
e-5) Mostrar el nombre, la descripción y la imagen de los productos que valgan menos de 200 €.
7.3.6. PRÁCTICA 6
OBJETIVO: Recordar todo lo visto hasta el momento.
ENUNCIADO: Resuelve los apartados siguientes.
Queremos un sistema de gestión de datos de un hospital. En él queremos guardar la información para cada uno de los ingresos hospitalarios indicando el paciente objeto del ingreso y el médico que autoriza el mismo. A continuación mostramos el modelo E/R que resulta del análisis de datos.
Las tablas que resultan para dicha BD tendrán los campos que se muestran a continuación:
MÉDICOS
Campo
Tipo
Largo
Otros
Codigo identificación
Texto
4
Campo Clave
Nombre del Médico
Texto
15

Apellidos del Médico
Texto
30

Especialidad
Texto
25

Fecha de ingreso
Fecha


Cargo
Texto
25

Número de Colegiado
Número


Observaciones
Memo


PACIENTES
Campo
Tipo
Largo
Otros
N Seguridad Social
Texto
15

Nombre
Texto
15

Apellidos
Texto
30

Domicilio
Texto
30

Población
Texto
25

Provincia
Texto
15

Código Postal
Texto
5

Teléfono
Texto
12

Número de Historial
Texto
9
Campo Clave
Sexo
Texto
1
Regla de validación: "H" o "M"

INGRESOS
Campo
Tipo
Largo
Otros
Número de Ingreso
Autonumérico

Campo Clave
Número de Historial
Texto
9

Fecha de Ingreso
Fecha


Código de Identificación
Texto
4

Número de planta
Número


Número de cama
Número


Alérgico
Sí/No


Observaciones
Memo


Coste del tratamiento
Número

Formato de moneda
Diagnóstico
Texto
40


a) Crea el modelo Relacional a partir del cual se habrán deducido dichas tablas
b) Crea la BD en LibreOffice BASE teniendo en cuenta la información adicional que se
muestra en las tablas anteriores.
c) Introduce los datos siguientes en la BD.


PACIENTES (las tablas se dividen en dos porque contienen muchos datos)
N Seguridad Social
Nombre
Apellidos
Domicilio
Población
08/7888888
José Eduardo
Romerales Pinto
C/ Azorín, 34 3o
Móstoles
08/7234823
Ángel
Ruíz Picasso
C/ Salmerón, 212
Madrid
08/7333333
Mercedes
Romero Carvajal
C/ Málaga, 13
Móstoles
08/7555555
Martín
Fernández López
C/ Sastres, 21
Madrid

Provincia
Código Postal
Teléfono
Número de Historial
Sexo
Madrid
28935
91-345-87-45
10203-F
H
Madrid
28028
91-565-34-33
11454-L
H
Madrid
28935
91-455-67-45
14546-E
M
Madrid
28028
91-333-33-33
15413-S
H

INGRESOS
Número de Ingreso
Número de Hist.
Fecha de Ingreso
Código de Identi.
Número de planta
1
10203-F
23/01/2009
AJH
5
2
15413-S
13/03/2009
RLQ
2
3
11454-L
25/05/2009
RLQ
3
4
15413-S
29/01/2010
CEM
2
5
14546-E
24-02/2010
AJH
1

Número de cama
Alérgico
Observaciones
121
No
Epiléptico
5
Sí
Alérgico a la penicilina
31
No

13
No

5
Sí
Alérgico al Paidoterín
7
No




MÉDICOS
Código de Ident.
Nombre del Médico
Apellidos del Médico
Especialidad
Fecha toma posesión
AJH
Antonio
Jaén Hernández
Pediatría
12-08-82
CEM
Carmen
Esterill Manrique
Psiquiatría
13-02-92
RLQ
Rocío
López Quijada
Médico de familia
23-09-94

Cargo
Número de Colegiado
Observaciones
Adjunto
2113
Está próxima su retirada
Jefe de sección
1231

Titular
1331


d) Realiza las siguientes consultas:
d-1) Nombre y fecha de toma de posesión de los médicos pediatras del hospital.
d-2) Nombre de los pacientes residentes en Madrid capital.
d-3) Nombre de los médicos que autorizaron ingresos entre enero y febrero de 2010.
d-4) Nombre y número de la Seguridad social de todos los pacientes.
d-5) Nombres y apellidos de los pacientes que ingresaron entre enero y mayo de 2009 y son alérgicos.
d-6) Habitación y la planta en la que ingresaron los pacientes de Móstoles.
d-7) Pacientes cuyo ingreso haya sido autorizado por el doctor Antonio Jaén Hernández.
d-8) Nombre y Teléfono de los pacientes que ingresaron en 2010.
d-9) Nombre de los pacientes ingresados que sufren epilepsia.
d-10) Nombre y fecha de ingreso de aquellos pacientes que hayan sido atendidos por un psiquiatra.
