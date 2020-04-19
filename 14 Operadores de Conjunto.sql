-----------------------------------------------------------------------------------------------------
------------------------------------- Operadores Conjuntos ------------------------------------------
-----------------------------------------------------------------------------------------------------

-- Operador Union
-- Devuelve las filas de ambas consultas despu�s de la eliminaci�n de tuplas

Select  employee_id, job_id
From    employees
UNION
Select  employee_id, job_id
From    job_history;

-- Union All

-- Igual que union pero no elimina filas duplicadas

Select  employee_id, job_id
From    employees
UNION ALL
Select  employee_id, job_id
From    job_history;

-- Intersect
-- Devuelve las filas que son comunes entre las consultas

Select  employee_id, job_id
From    employees
INTERSECT
Select  employee_id, job_id
From    job_history;

-- Minus
-- Devuelve todas la filas distintas seleccionadas por la primera consulta, pero no est�n presentes en el segundo 
-- conjunto

Select  employee_id
From    employees
MINUS
Select  employee_id
From    job_history;

-- Coincidir Sentencias Select

-- Es importante destacar que en estas operaciones de conjunto, ambos conjuntos deben de tener la 
-- misma estructura y tipo de datos. Hbar� ocasiones en que se quiera coincider dos conjuntos que 
-- no son compatibles, para eso se muestra el siguiente artificio:

Select  location_id, department_name    "Department", TO_CHAR(NULL) "Warehouse location"
From    departments
UNION
Select  location_id, TO_CHAR(NULL)      "Department", state_province
From locations;

-- En este caso, las columnas no compatibles se sustituyeron por: TO_CHAR(NULL)
-- Aclaraci�n: Los nombres de las columnas ser�n dados por el primer conjunto

-- Order By en Conjuntos

-- la clausula order by solo ser� admitida en la ultima sentencia,
-- tomara los nombres o alias del primer conjunto

Select  employee_id, job_id
From    employees
UNION
Select  employee_id, job_id
From    job_history
order by job_id;


