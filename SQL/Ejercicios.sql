


SELECT
Nombre,
Documento,
Telefono
FROM Estudiantes

WHERE Profesion = 6
AND YEAR([Fecha de Nacimiento]) BETWEEN 1970 AND 2000

SELECT
Tipo,
COUNT(AsignaturasID) AS cant_asignaturas
FROM Asignaturas
WHERE Area = 5
GROUP BY Tipo

ORDER BY 2 DESC


SELECT
UPPER(CONCAT(Nombre,'-',Apellido)) AS Nombres_Apellidos
FROM Staff
WHERE YEAR([Fecha Ingreso]) = 2021
;

SELECT
REPLACE(Tipo,'Encargado ','') AS NuevoTipo,
COUNT(Encargado_ID) AS CantEncargados
FROM Encargado
GROUP BY Tipo