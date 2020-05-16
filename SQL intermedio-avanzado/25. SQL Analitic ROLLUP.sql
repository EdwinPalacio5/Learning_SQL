---------------------- ANALITIC SQL FOR DATA WAREHOUSING ----------------------------------------------
/*
 Oracle ha introducido muchas operaciones SQL para realizar operaciones anal�ticas  en la base de datos.
 - Estas operaciones incluyen clasificaci�n, promedios m�viles, sumas acumulativas, ratios-informes y comparaciones de per�odo a p�r�odo.
 - Aunque anteriormente algunos de estos c�lculo eran posibles utilizando SQL, esta sintaxis ofrece un rendimiento mucho mejor.

 Group By con los operadores ROLLUP y CUBE

 Use ROLLUP o CUBE con Group BY para producir filas superagregadas mediante columnas de referencias cruzadas.

  ROLLUP
 
  - Produce un conjunto de resultados que contiene las filas agrupadas regulares y los valores de subtotal y total general
  - Es un extensi�n de la clausula GROUP BY
  - Use la operaci�n ROLLUP para producir agregados acumulativos, como subtotales.
  - Utilizado, para hacer operaciones de agregaci�n para m�ltiples niveles en una jerarqu�a
 */
 
 SELECT department_id, job_id, SUM(salary)
 FROM   employees
 WHERE  department_id < 60
 Group by rollup (department_id, job_id);
 
 /*
 DEPARTMENT_ID JOB_ID     SUM(SALARY)
------------- ---------- -----------
           10 AD_ASST           4400
           10                   4400
           20 MK_MAN           13000
           20 MK_REP            6000
           20                  19000
           30 PU_MAN           11000
           30 PU_CLERK         13900
           30                  24900
           40 HR_REP            6500
           40                   6500
           50 ST_MAN           36400
           50 SH_CLERK         64300
           50 ST_CLERK         55700
           50                 156400
                              211200

    15 filas seleccionadas. 
 */
 
 -- Equivalente ocupando Grouping Sets
 
 -- Permite agregar m�s de un conjunto de agrupaci�n al group by
 
 SELECT department_id, job_id, SUM(salary)
 FROM   employees
 WHERE  department_id < 60
 Group by grouping sets (
            (department_id, job_id),
            (department_id),
            ());
            
 -- Equivalente ocupando Union All
 
 SELECT department_id, job_id, SUM(salary)
 FROM   employees
 WHERE  department_id < 60
 Group by (department_id, job_id)
 
 UNION ALL
 
SELECT department_id, NULL , SUM(salary)
 FROM   employees
 WHERE  department_id < 60
 Group by (department_id)
 
 UNION ALL
 
  SELECT NULL, NULL, SUM(salary)
 FROM   employees
 WHERE  department_id < 60;
 
 
 
 
 