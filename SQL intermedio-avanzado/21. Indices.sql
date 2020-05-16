------------------------------------------------ Indice ---------------------------------------------

-- mejora el rendimiento de las consultas en la recuperaci�n de datos

-- Es un objeto de esquema
-- Puede ser utilizado por el servidor de Oracle para acelerar la recuperaci�n de filas mediante el uso de un puntero
-- Puede reducir la entrada/salida de disco (E/S) mediante el uso de un m�todo de acceso ruta r�pida para localizar datos de forma r�pida
-- Es dependiente los indices de las tablas
-- Se usa y se mantiene de forma autom�tica por el servidor Oracle

-- �C�mo se crean los indices?

-- Automaticamente: Un indice �nico se crea autom�ticamente cuando se define una restricci�n de CLAVE PRIMARIA o UNIQUE en una definici�n de tabla

-- Manualmente: Se puede crear un �ndice �nico o no �nico en las columnas para acelerar el acceso a las filas.

-- Sintaxis

-- Create [UNIQUE] [BITMAP] INDEX name_index
-- On table (column1,...);

-- Ejemplo:

Create Index emp_last_name_idx
On employees(last_name);

-- Crear �ndice con el Create Table

Create Table NEW_EMP
(
employee_id     number(6)
                primary key using index
                (Create index emp_id_idx
                 On NEW_EMP(employee_id)),
first_name      varchar2(20),
last_name       varchar2(20));

-- Consultar indice
Describe user_indexes;

Select index_name, table_name
From user_indexes
Where table_name = 'NEW_EMP';

-- User_ind_columns

Describe user_ind_columns;

Select index_name, column_name
From user_ind_columns
Where table_name = 'departments';

-- Los �ndices de funci�n-base

-- * Un indice basado en las funciones se basa en expresiones.

-- * La expresi�n de �ndice se construye a partir de columnas de tabla, constantes, funciones de SQL y funciones definidas por el usuario.

-- Ejemplo: Este indice lo que har� que el nombre del departamento lo vuelva may�scula, entonces al hacer consultas esto va a mejorar el rendimiento.

Create index upper_dept_name_idx
On departments(UPPER(department_name));

Select *
From    departments
Where   UPPER(department_name) = 'SALES';

-- Creaci�n de varios indices en el mismo conjunto de columnas

-- * Puede crear varios �ndices en el mismo conjunto de columnas.
-- * M�ltiples �ndices se pueden crear en el mismo conjunto de columnas s�:
--              - Los �ndices son de diferentes tipos
--              - Los �ndices utilizan diferentes particionamiento
--              - Los �ndices tienen diferentes propiedades de unicidad

-- ejemplo: para este caso hacemos alter en emp_id_name_idx1 haciendolo invisible para as� poder crear el otro indice bajo el mismo conjunto de columnas

Create index emp_id_name_idx1
On employees(employee_id, first_name);

Alter index emp_id_name_idx1 invisible;

Create bitmap index emp_id_name_idx2 
On employees(employee_id, first_name);

-- Directrices de la creaci�n de indice

-- Cree un �ndice cuando:

-- Una columna contiene una amplia gama de valores
-- una columna contine un gran n�mero de valores nulos
-- Una o m�s columnas se utilizan con frecuencia juntos en una cl�usula WHERE o una condici�n de uni�n
-- La tabla es grande y se espera que la mayor�a de las consultas para recuperar menos de 2% a 4% de las filas de la tabla.

-- No cree un �ndice cuando:

-- Las columnas no se utilizan a menudo como un condici�n en la consulta.
-- La tabla es peque�a o se espera que la mayor�a de consultas para recuperar m�s de un 2% a un 4% de las filas de la tabla.
-- La tabla se actualiza con frecuencia
-- las columnas indexadas se hace referencia como parte de una expresi�n.

