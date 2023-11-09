-- AUTORIZACIÓN GENERACIÓN DIAGRAMA--

ALTER AUTHORIZATION ON DATABASE::[CoderHouse] TO [sa]

--EJERCICIOS JOIN & UNION--

/*1- Indicar por jornada la cantidad de docentes que dictan y sumar los costos.
Esta información sólo se desea visualizar para las asignaturas de desarrollo web.
El resultado debe contener todos los valores registrados en la primera tabla,
Renombrar la columna del cálculo de la cantidad de docentes como cant_docentes y
la columna de la suma de los costos como suma_total.
Keywords: Asignaturas,Staff, DocentesID, Jornada, Nombre, costo.*/

SELECT * FROM Asignaturas;
SELECT * FROM Staff;

SELECT Jornada, COUNT(Staff.DocentesID) as cant_docentes,
SUM(Asignaturas.Costo) as suma_total
FROM Asignaturas
left Join Staff
on Asignaturas.AsignaturasID = Staff.Asignatura
Where Asignaturas.Nombre = 'Desarrollo Web'
group by Jornada
;

SELECTA.Jornada,COUNT(S.DocentesID) AS cant_docentes,SUM(A.Costo) AS suma_totalFROM Asignaturas AS ALEFT JOIN Staff AS SON A.AsignaturasID = S.AsignaturaWHERE A.Nombre = 'Desarrollo Web'GROUP BY A.Jornada ;


/*2. Se requiere saber el id del encargado, el nombre, el apellido 
y cuantos son los docentes
que tiene asignados cada encargado. Luego filtrar los
encargados que tienen como resultado 0
ya que son los encargados que NO tienen asignado un docente. 
Renombrar el campo de la operación
como Cant_Docentes. 
Keywords: Docentes_id, Encargado, Staff, Nombre, Apellido,Encargado_ID. */

SELECT * FROM Encargado;
SELECT * FROM Staff;

SELECT Encargado_ID, Encargado.Nombre, Encargado.Apellido, COUNT(Staff.DocentesID) as cant_docentes
FROM Encargado
left Join Staff
on Encargado.Encargado_ID = Staff.Encargado
GROUP BY Encargado.Encargado_ID, Encargado.Nombre, Encargado.Apellido
HAVING COUNT(Staff.DocentesID) = 0



SELECT T1.Encargado_ID,T1.Nombre,T1.Apellido,COUNT(T2.DocentesID) AS Cant_DocentesFROM Encargado T1LEFT JOIN Staff T2ON T1.Encargado_ID = T2.EncargadoGROUP BY T1.Encargado_ID, T1.Nombre, T1.ApellidoHAVING COUNT(T2.DocentesID) = 0

SELECTE.Encargado_ID,E.Nombre,E.Apellido,COUNT(S.DocentesID) AS Cant_DocentesFROM Encargado AS ELEFT JOIN Staff AS SON E.Encargado_ID = S.EncargadoGROUP BY E.Encargado_ID,E.Nombre,E.ApellidoHAVING COUNT(S.DocentesID) = 0 -- condición para cálculos funciones de agregación--ORDER BY  Cant_Docentes DESC;


/*3. Análisis asignaturas sin docentes o tutores: 
Identificar el tipo de asignatura, la jornada, la cantidad de áreas
únicas y la cantidad total de 
asignaturas que no tienen asignadas docentes o tutores.
Ordenar por tipo de forma descendente.*/

SELECT * FROM Asignaturas;
SELECT * FROM Staff;

SELECTTipo,Jornada,Count(Distinct Area) as Cant_Areas,COUNT(Asignaturas.AsignaturasID) AS Cantidad_AsignaturasFROM Asignaturas 
left join Staff
ON Asignaturas.AsignaturasID = Staff.AsignaturaWHERE Staff.Asignatura IS NULLGROUP BY Asignaturas.Tipo,Asignaturas.Jornada
order by Tipo Desc

SELECTT1.Tipo,T1.Jornada,COUNT(T1.Area) AS Cantidad_Areas,COUNT(T1.AsignaturasID) AS Cantidad_AsignaturasFROM Asignaturas T1LEFT JOIN Staff T2ON T1.AsignaturasID = T2.AsignaturaWHERE T2.Asignatura IS NULLGROUP BYT1.Tipo,T1.JornadaORDER BY Tipo DESC;




SELECTT1.AsignaturasID,T1.Tipo,T1.Jornada,T1.Area,COUNT (T2.Asignatura)AS Prof_AsignadosFROM Asignaturas T1LEFT JOIN Staff T2ON T1.AsignaturasID = T2.AsignaturaGROUP BY T1.AsignaturasID,T1.Tipo,T1.Jornada,T1.AreaHAVING COUNT (T2.Asignatura) = 0

/*4. Análisis de estudiantes por área de educación: 
Identificar: nombre del área, si la asignatura es carrera o curso ,
a qué jornada pertenece, 
cantidad de estudiantes y monto total del costo de la asignatura. 
Ordenar el informe de mayor a menor por monto de costos total tener 
en cuenta los docentes que no tienen asignaturas ni estudiantes asignados,
también sumarlos.*/

SELECT * FROM Asignaturas;
SELECT * FROM Area;
SELECT * FROM Staff;
SELECT * FROM Estudiantes;

SELECT Nombre, Tipo, Jornada, COUNT(Estudiantes.EstudiantesID), SUM (T1.Costo) AS SumaCosto
FROM Asignaturas
Left Join Estudiantes
on Asignaturas.

SELECT T2.Nombre,T1.Tipo,T1.Jornada,COUNT (T4.EstudiantesID) AS CantidadEstudiantes,SUM (T1.Costo) AS SumaCostoFROM Asignaturas T1JOIN Area T2ON T1.Area = T2.AreaIDLEFT JOIN Staff T3ON T1.AsignaturasID = T3.AsignaturaLEFT JOIN Estudiantes T4ON T3.DocentesID = T4.DocenteGROUP BYT2.Nombre,T1.Tipo,T1.JornadaORDER BY SUM (T1.Costo) DESC




/* 5. Se requiere un listado unificado con nombre, apellido,
documento y
una marca indicando a que base corresponde. Renombrar como 
Marca Keywords: Encargado,Staff,Estudiantes */

SELECT * FROM Staff;
SELECT * FROM Encargado;
SELECT * FROM Estudiantes;

SELECTT1.Nombre,T1.Apellido,T1.Documento,'Staff' AS MarcaFROM Staff T1UNIONSELECTT2.Nombre,T2.Apellido,T2.Documento,'Encargado' AS MarcaFROM Encargado T2UNIONSELECTT3.Nombre,T3.Apellido,T3.Documento,'Estudiantes' AS MarcaFROM Estudiantes T3ORDER BY Nombre ASC;
