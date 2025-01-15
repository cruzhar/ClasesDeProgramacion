--No. Abrir Sql - servidor local - usuario por defecto
/* Manual para Crear y Eliminar Bases de Datos en SQL Server*/

/*Sección 1: Creación de Bases de Datos
Ejercicio: Crea una base de datos llamada EscuelaDB.*/
CREATE DATABASE EscuelaDB;

/* Sección 2: Verificar bases de datos existentes
Ejercicio: Lista todas las bases de datos existentes en el servidor*/
SELECT name FROM sys.databases;

/* Seccion 3: Crear una tabla dentro de una base de datos
Ejercicio: Crea una tabla llamada Estudiantes en la base de datos EscuelaDB con las columnas ID, Nombre, y Grado.*/
USE EscuelaDB;
CREATE TABLE Estudiantes (
    ID INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Grado INT
);


/*Seccion 4: Agregar datos a una tabla
Ejercicio: Inserta tres registros en la tabla Estudiantes.*/
INSERT INTO Estudiantes (ID, Nombre, Grado)
VALUES (1, 'Josue Vargas', 1),
       (2, 'Abner Maldonado', 2),
       (3, 'Carlos Samayoa', 3);


/*Seccion 5:	Crear una tabla con una clave foránea
Ejercicio: Crea una tabla llamada Inscripciones que relacione a los Estudiantes con los Cursos.*/
CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY,
    NombreCurso NVARCHAR(50)
);

CREATE TABLE Inscripciones (
    InscripcionID INT PRIMARY KEY,
    EstudianteID INT,
    CursoID INT,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);


/*Sección 2.1: Modificación de Bases de Datos
Ejercicio: Cambia el nombre de la base de datos EscuelaDB a ColegioDB.*/
ALTER DATABASE EscuelaDB MODIFY NAME =  ColegioDB;

/*Seccion 7:	Agregar un archivo a una base de datos
Ejercicio: Agrega un archivo de datos secundario a la base de datos EscuelaDB.*/
ALTER DATABASE EscuelaDB
ADD FILE (
    NAME = EscuelaDB_Data2,
    FILENAME = 'C:\SQL SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA/EscuelaDB_Data2.ndf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);

/*Sección 8: Eliminar una tabla de una base de datos
Ejercicio: Elimina la tabla Inscripciones de la base de datos EscuelaDB.*/

USE EscuelaDB;
DROP TABLE Inscripciones;

/*Sección 9: Eliminación de Bases de Datos
Eliminar una base de datos
Ejercicio: Elimina la base de datos EscuelaDB.*/
DROP DATABASE EscuelaDB;


/*Sección 10:	Precauciones al eliminar bases de datos
Ejercicio: Intenta eliminar una base de datos solo si no está en uso.*/
ALTER DATABASE EscuelaDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE EscuelaDB;

-------------------------------------------------------Desafíos adicionales----------------------------------------------

--	Ejercicio: Crea una base de datos con una configuración específica de tamaño inicial y crecimiento:
	DROP DATABASE ConfiguradaDB
	CREATE DATABASE ConfiguradaDB
	use ConfiguradaDB
	ON PRIMARY (
	    NAME = ConfiguradaDB_Data,
	    FILENAME = 'C:\SQL SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\ConfiguradaDB.mdf',
	    SIZE = 10MB,
	    MAXSIZE = 100MB,
	    FILEGROWTH = 10MB
	)
	LOG ON (
	    NAME = ConfiguradaDB_Log,
	    FILENAME = 'C:\SQL SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\ConfiguradaDB.mdf',
	    SIZE = 5MB,
	    FILEGROWTH = 5MB
	);

--Ejercicio: Crea una tabla temporal en la base de datos tempdb:
	CREATE TABLE Temporal (
	    ID INT,
	    Nombre NVARCHAR(50)
	);



--Ejercicio: Respaldar una base de datos antes de eliminarla:
	BACKUP DATABASE ConfiguradaDB
	TO DISK = 'C:\SQL SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\ConfiguradaDB.bak';

--Ejercicios para Modificar Tablas en SQL Server - Crear una tabla

CREATE TABLE Estudiantes 
(
 ID INT PRIMARY KEY, 
Nombre VARCHAR(50),
 Apellido VARCHAR(50),
 Edad INT, 
Grado VARCHAR(20), 
Correo VARCHAR (20) --Agregar una columna
);

DROP TABLE Estudiantes


--Ejercicio: Agrega una columna llamada FechaNacimiento de tipo DATE a la tabla Estudiantes.

ALTER TABLE Estudiantes
ADD FechaNacimiento DATE;


ALTER TABLE Estudiantes
DROP COLUMN FechaNacimiento; --Eliminar una columna


--Ejercicio: Elimina la columna Correo de la tabla Estudiantes.
ALTER TABLE Estudiantes
DROP COLUMN Correo;


--Modificar el tipo de dato de una columna
ALTER TABLE Estudiantes
DROP COLUMN Correo;

ALTER TABLE Estudiantes
ALTER COLUMN FechaNacimiento varchar(100);


--Ejercicio: Cambia el tipo de dato de la columna Nombre a NVARCHAR(100).
ALTER TABLE Estudiantes
ALTER COLUMN Nombre NVARCHAR(100);

SELECT * FROM ESTUDIANTES

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ESTUDIANTES';
EXEC sp_rename 'ID', 'nombre_completo', 'APELLIDO','EDAD','GRADO','FECHA'   ;

--5.	Cambiar el nombre de una columna
EXEC sp_rename 'Estudiantes.Nombre', 'NombreCompleto', 'COLUMN';

--6.	Agregar una columna con un valor predeterminado
ALTER TABLE Estudiantes
ADD Estado VARCHAR(20) DEFAULT 'Activo';

--Ejercicio: Agrega una columna llamada Activo de tipo BIT con un valor predeterminado de 1.
ALTER TABLE Estudiantes
ADD Activo BIT DEFAULT 1;

--7.	Renombrar la tabla
EXEC sp_rename 'Estudiantes', 'Alumnos';

--Ejercicio: Cambia el nombre de la tabla Estudiantes a Alumnos.
EXEC sp_rename 'Estudiantes', 'Alumnos';

--8.	Agregar una clave foránea

CREATE TABLE Estudiantes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Edad INT
);

CREATE TABLE Inscripciones (
    ID INT PRIMARY KEY,
    NombreCurso VARCHAR(100),
    ID_Estudiante INT
);

ALTER TABLE Inscripciones
ADD CONSTRAINT FK_Inscripciones
FOREIGN KEY (ID_Estudiante)
REFERENCES Estudiantes(ID);

SELECT * 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
WHERE CONSTRAINT_NAME = 'FK_Cursos_Estudientes';

--Ejercicio: Agrega una clave foránea en la tabla Inscripciones que relacione EstudianteID con la tabla Estudiantes.
ALTER TABLE Inscripciones
ADD CONSTRAINT FK_EstudianteID FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(ID);

SELECT * FROM INSCRIPCIONES

--9.	Agregar una columna calculada
--Ejercicio: Agrega una columna calculada llamada NombreCompleto que concatene el Nombre y edad.
ALTER TABLE Estudiantes
ADD NombreEdad AS (Nombre + ' ' + edad);

select * from Estudiantes

--10.	Agregar un índice a una columna
--Ejercicio: Crea un índice en la columna Grado de la tabla Estudiantes.
CREATE INDEX IX_Grado ON Estudiantes(Grado);

--11.	Cambiar el nombre de una restricción
--Ejercicio: Cambia el nombre de una restricción existente (por ejemplo, una clave foránea llamada FK_EstudianteID) a FK_AlumnoID.
EXEC sp_rename 'Inscripciones.FK_EstudianteID', 'FK_AlumnoID', 'OBJECT';


--------------------------------------------Desafíos adicionales:------------------------------------------------
--Agrega una restricción UNIQUE a la columna Correo para que no se repitan valores:
ALTER TABLE Estudiantes
ADD CONSTRAINT UQ_Correo UNIQUE (Correo);

--Elimina una restricción llamada FK_EstudianteID:
ALTER TABLE Inscripciones
DROP CONSTRAINT FK_EstudianteID;

--Agrega una columna que permita nulos:
ALTER TABLE Estudiantes
ADD Apodo NVARCHAR(50) NULL;

--Convierte una columna existente para que no permita valores nulos:
ALTER TABLE Estudiantes
ALTER COLUMN Apodo NVARCHAR(50) NOT NULL;
