--------------------------------------- SINONIMOS --------------------------------------------------
-- Da nombres alternativos a los objetos
-- Es un objeto de base de datos
-- Puede ser creado para dar un nombre alternativo para una tabla o a otro objeto de base de datos
-- No requiere almacenamiento que no sea su definici�n en el diccionario de datos
-- Es �til para oculta la identidad y la ubicaci�n de un objeto de esquema subyacente

-- Creaci�n de un sin�nimo de un objeto

-- Simplificar el acceso a los objetos la creaci�n de un sin�nimo (otro nombre para un objeto). Con sin�nimos, puede:

-- * Crear una referencia m�s f�cil a una tabla que es propiedad de otro usuario.
-- * Acortar largos nombres del objeto

-- CREATE [Public] SYNONYM synonym
-- FOR    object;

Create synonym sinonimo_sequence_id
For sequence_emp_id;

Describe user_synonyms;

Select *
From user_synonyms;

-- Eliminar sinonimo
Drop synonym sinonimo_sequence_id;

