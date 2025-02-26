
--CREAR UNA BASE DE DATOS EsculaDB
CREATE DATABASE EscuelaDB; 
--DROP TABLE TB_ESTUDIANTES --DROP DATABASE EscuelaDB
GO
USE EscuelaDB    
--  USE master

---------------------------------------------------------------------------------------
--CREAR TRES TABLAS -- Grados -- Estudiantes -- Padres -- Cursos --Estudiantes Cursos
---------------------------------------------------------------------------------------
GO
CREATE TABLE TB_GRADOS 
(
    ID_GRADO			   INT PRIMARY KEY IDENTITY(1,1),
    NOMBRE_GRADO		   VARCHAR(50) NOT NULL
);

GO
CREATE TABLE TB_PADRES 
(
	ID_PADRE			   INT PRIMARY KEY IDENTITY(1,1),
	NOMBRE_PADRE		   VARCHAR(50),
	DIRECCION_PADRE		   VARCHAR(100),
	TELEFONO_PADRE	       VARCHAR(100),
	EMAIL_PADRE		       VARCHAR(100)
);

GO
CREATE TABLE TB_ESTUDIANTES 
(
	ID_ESTUDIANTE		    INT PRIMARY KEY IDENTITY(1,1),
	NOMBRE_ESTUDIANTE		VARCHAR(50),
	APELLIDO_ESTUDIANTE		VARCHAR(50),
	DIRECCION_ESTUDIANTE    VARCHAR(100),
	TELEFONO_ESTUDIANTE     VARCHAR(100),
	EDAD_ESTUDIANTE			INT,
	ID_GRADO				INT,
	ID_PADRE				INT,    
	FOREIGN KEY (ID_GRADO) REFERENCES TB_GRADOS(ID_GRADO),
    FOREIGN KEY (ID_PADRE) REFERENCES TB_PADRES(ID_PADRE)
);

GO
CREATE TABLE TB_CURSOS 
(
    ID_CURSO			    INT PRIMARY KEY,
    NOMBRE_CURSO		    NVARCHAR(50),
	DESCRIPCION_CURSO	    TEXT
);

GO
CREATE TABLE TB_ESTUDIANTES_CURSOS 
(
	ID_ESTUDIANTES		    INT,
    ID_CURSOS			    INT,
    PRIMARY KEY (ID_ESTUDIANTES, ID_CURSOS),
    FOREIGN KEY (ID_ESTUDIANTES) REFERENCES TB_ESTUDIANTES (ID_ESTUDIANTE),
    FOREIGN KEY (ID_CURSOS) REFERENCES TB_CURSOS(ID_CURSO)
);

---------------------------------------------------------------------------------------
-- INSERTAR DATA MASIVA  -- 100 REGISTROS -- 50 REGISTROS CHAT GPT
---------------------------------------------------------------------------------------

GO
INSERT INTO TB_GRADOS 
(
	NOMBRE_GRADO
)
VALUES 
    ('PRIMERO '),
    ('SEGUNDO '),
    ('TERCERO '),
    ('CUARTO '),
    ('QUINTO '),
	('SEXTO ');

GO
INSERT INTO TB_ESTUDIANTES 
(
	NOMBRE_ESTUDIANTE, 
	APELLIDO_ESTUDIANTE, 
	DIRECCION_ESTUDIANTE, 
	TELEFONO_ESTUDIANTE, 
	EDAD_ESTUDIANTE
)  
VALUES 
('Hector Agusto', 'Cruz Romero', '4ta. Calle, Coatepeque, Quetzaltenango', '5565-5656', 15),
('Ana Maria', 'Lopez Gutierrez', 'Av. Reforma 23, Ciudad de Guatemala', '5521-1234', 14),
('Carlos Daniel', 'Perez Morales', 'Barrio San Pedro, Chimaltenango', '5567-7890', 13),
('Maria Fernanda', 'Garcia Ruiz', '8va. Avenida, Zona 5, Ciudad de Guatemala', '5550-3344', 14),
('Pedro Pablo', 'Jimenez Castillo', 'Calzada Roosevelt, Villa Nueva', '5567-2345', 12),
('Laura Elena', 'Martinez Vasquez', 'Callejón del Sol, Antigua Guatemala', '5599-5566', 14),
('David Esteban', 'Sanchez Ramos', 'Calle de la Paz, San Salvador', '5557-8899', 13),
('Valeria Sofia', 'Rodriguez Torres', 'Calle Real, Mazatenango', '5522-3366', 15),
('Jorge Luis', 'Morales Diaz', 'Residencial El Bosque, Mixco', '5544-1122', 15),
('Isabel Cristina', 'Mendez Salazar', 'Zaragoza, Escuintla', '5599-1010', 12),
('Miguel Angel', 'Castillo Perez', 'Colonia La Merced, Jalapa', '5545-7766', 14),
('Carolina Daniela', 'Herrera Lopez', 'Barrio Las Flores, Quetzaltenango', '5560-1234', 13),
('Juan Jose', 'Fernandez Gonzalez', 'Calle San Juan, Totonicapan', '5599-3344', 15),
('Patricia Alejandra', 'Jimenez Ruiz', 'Calle Libertad, Huehuetenango', '5551-4567', 14),
('Luis Fernando', 'Ramirez Medina', 'Avenida Las Palmas, Zacapa', '5521-8765', 15),
('Sofia Carolina', 'Luna Castro', 'Calle La Victoria, Coban', '5555-0987', 14),
('Ricardo Andres', 'Vasquez Cruz', 'Residencial San Juan, Villa Canales', '5533-2233', 13),
('Raquel Elisa', 'Paredes Herrera', 'Avenida Nueva, Mazatenango', '5588-4455', 14),
('Miguel Eduardo', 'Diaz Sanchez', 'Colonia Los Pinos, Huehuetenango', '5577-6677', 13),
('Gabriela Karina', 'Torres Mendoza', 'Calle Principal, Chimaltenango', '5599-1234', 12),
('Alfredo Julio', 'Gonzalez Vega', 'Barrio El Reloj, Amatitlán', '5556-8899', 14),
('Jose Luis', 'Ruiz Jimenez', 'Avenida Montufar, Ciudad de Guatemala', '5521-4455', 15),
('Diana Patricia', 'Perez Lopez', 'Calle 4ta., Zona 11', '5542-6677', 13),
('Carlos Eduardo', 'Hernandez Mejia', 'Calle Jutiapa, Jutiapa', '5567-2233', 14),
('Laura Isabel', 'Martinez Rios', 'Barrio Las Flores, Quetzaltenango', '5599-7788', 12),
('Francisco Javier', 'Perez Cruz', 'Avenida El Palmar, San Marcos', '5533-4455', 14),
('Emilia Lucia', 'Mora Ramirez', 'Residencial El Sol, Santa Lucia', '5588-1122', 13),
('Ricardo Alonso', 'Maldonado Gutierrez', 'Avenida Los Olivos, Escuintla', '5522-5566', 14),
('Patricia Sofia', 'Gonzalez Fernandez', 'Residencial Las Lomas, San Salvador', '5544-7788', 13),
('Adriana Maria', 'Lara Morales', 'Calle 8, Quetzaltenango', '5567-7890', 15),
('Gerardo Felix', 'Soto Pineda', 'Zona 4, Ciudad de Guatemala', '5599-3344', 14),
('Santiago Jose', 'Lopez Morales', 'Calle del Cerro, Huehuetenango', '5533-2233', 13),
('Carmen Rosa', 'Jimenez Cortes', 'Barrio El Carmen, Mazatenango', '5521-5678', 14),
('Marco Antonio', 'Martinez Castillo', 'San Marcos, Guatemala', '5599-6677', 14),
('Sara Isabel', 'Ruiz Hernandez', 'Barrio Las Palmas, Zacapa', '5567-1122', 13),
('Victor Manuel', 'Alvarado Lopez', 'Calzada Larrave, Ciudad de Guatemala', '5588-2345', 15),
('Juan Pablo', 'Ramirez Jimenez', 'Residencial Las Flores, Mixco', '5533-4455', 13),
('Lucia Maria', 'Fernandez Pineda', 'Calle Las Rosas, Chimaltenango', '5599-8899', 14),
('Javier Esteban', 'Rivas Romero', 'Barrio El Encino, Quetzaltenango', '5550-3344', 15),
('Jocelyn Lorena', 'Castro Gutierrez', 'Avenida Reforma, Santa Rosa', '5544-1122', 13),
('Ricardo Orlando', 'Soto Vargas', 'Avenida La Paz, Villa Nueva', '5522-9988', 15),
('Andrea Maria', 'Alonzo Rios', 'Calle Mariscal, Antigua Guatemala', '5599-5566', 14),
('Margarita Elena', 'Gonzalez Lara', 'Zona 6, Ciudad de Guatemala', '5557-6677', 12),
('Diego Alfredo', 'Morales Aguirre', 'Residencial Los Arcos, Coban', '5533-2233', 15),
('Marisol Lucia', 'Herrera Espinoza', 'Calle del Sol, Escuintla', '5599-1122', 13),
('Carlos Augusto', 'Jimenez Sanchez', 'Residencial El Retiro, Quetzaltenango', '5544-8899', 14),
('Paola Gabriela', 'Lopez Hernandez', 'Avenida 3ra., Chimaltenango', '5521-3344', 15),
('Carlos Jose', 'Mendez Rivera', 'Barrio San Francisco, Mazatenango', '5567-1234', 12),
('Jose Miguel', 'Pineda Cordero', 'Calle Montufar, Santa Lucia', '5551-2233', 14),
('Ricardo Fabian', 'Gonzalez Herrera', 'Barrio El Reposo, Chimaltenango', '5588-8899', 13),
('Patricia Beatriz', 'Diaz Lopez', 'Residencial El Sol, San Marcos', '5521-6677', 12),
('Cristian Andres', 'Herrera Morales', 'Calle El Pino, Villa Nueva', '5533-9988', 14),
('Sofia Veronica', 'Lopez Rios', 'Calle 15, Huehuetenango', '5599-4455', 13);

---------------------------------------------------------------------------------------------------------------------
--CREAR TABLAS TEMPORALES --nombre --apellido --telefono --calle --avenida --colonia --municipio --departament
---------------------------------------------------------------------------------------------------------------------

GO
CREATE TABLE TB_TEMPORAL_NOMBRE
(
  NOMBRE	   VARCHAR (50)
);

GO
CREATE TABLE TB_TEMPORAL_APELLIDO
(
  APELLIDO	   VARCHAR (50)
);

GO
CREATE TABLE TB_TEMPORAL_TELEFONO
(
  TELEFONO     INT
);

GO
CREATE TABLE TB_TEMPORAL_CALLE
(
  CALLE	      VARCHAR (50)
);

GO
CREATE TABLE TB_TEMPORAL_AVENIDA
(
  AVENIDA      VARCHAR (50)
);

GO
CREATE TABLE TB_TEMPORAL_COLONIA
(
  COLONIA      VARCHAR (50)
);

GO
CREATE TABLE TB_TEMPORAL_MUNICIPIO
(
  MUNICIPIO    VARCHAR (50)
);

GO
CREATE TABLE TB_TEMPORAL_DEPARTAMENTO
(
  DEPARTAMENTO VARCHAR (50)
);


/*-------------------------------------
          INGRESAR DATOS
-------------------------------------*/

--DATOS - NOMBRES
GO
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('HECTOR');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('ANA');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('CARLOS');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('MARIA');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('JOSÉ');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('LUIS');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('PAOLA');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('DANIEL');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('VALERIA');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('JULIAN');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('MARTÍN');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('ISABEL');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('GABRIELA');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('JORGE');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('LUISANA');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('PATRICIA');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('RUBEN');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('SANTIAGO');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('MIGUEL');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('SARA');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('PEDRO');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('MARTÍNEZ');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('EMILIA');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('RAFAEL');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('FERNANDO');
INSERT INTO TB_TEMPORAL_NOMBRE VALUES ('ABNER')


--DATOS - APELLIDOS
GO
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('MALDONADO');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('MARTINEZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('GARCIA');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('LOPEZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('PEREZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('GOMEZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('RODRIGUEZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('SANCHEZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('RAMIREZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('TORRES');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('FLORES');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('JIMENEZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('MENDOZA');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('CASTRO');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('VILLALBA');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('CARRILLO');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('ALVAREZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('HERNANDEZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('GUTIERREZ');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('RIVERA');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('VARGAS');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('ESCALANTE');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('SERRANO');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('PANIAGUA');
INSERT INTO TB_TEMPORAL_APELLIDO VALUES ('MORALES')


---------------------------------------------------------------------------------------------------------------------
--1. CREA UN SP (PROCEDIMIENTOS ALMACENADOS - STORED PROCEDURES)
--ingresa 25 registros -- arma un nombre de 4 CAMPOS 
--Nombre1. nombre.2 - apellido1. apellido2 Y Optiene un nombre aleatorio
---------------------------------------------------------------------------------------------------------------------
GO
CREATE PROCEDURE CREACION_DATA_ESTUDIANTES_SP
		@CANTIDAD_NOMBRES INT -- PARAMETRO DE ENTRADA
		AS
		BEGIN
			--VARIABLE
			DECLARE @PRIMER_NOMBRE VARCHAR(15);
			DECLARE @SEGUNDO_NOMBRE VARCHAR(15);
			DECLARE @PRIMER_APELLIDO VARCHAR(15);
			DECLARE @SEGUNDO_APELLIDO VARCHAR(15);
			DECLARE @VALORINICIAL INT;
			
			SET @VALORINICIAL = 1

			WHILE (@VALORINICIAL < = @CANTIDAD_NOMBRES)
			BEGIN
				SET @PRIMER_NOMBRE = (select top 1 percent NOMBRE from TB_TEMPORAL_NOMBRE order by newid())
				SET @SEGUNDO_NOMBRE = (select top 1 percent NOMBRE from TB_TEMPORAL_NOMBRE order by newid())
				SET @PRIMER_APELLIDO = (select top 1 percent APELLIDO from TB_TEMPORAL_APELLIDO order by newid())
				SET @SEGUNDO_APELLIDO = (select top 1 percent APELLIDO from TB_TEMPORAL_APELLIDO order by newid())

				INSERT INTO TB_ESTUDIANTES 
					(
						NOMBRE_ESTUDIANTE,
						APELLIDO_ESTUDIANTE
					)
					VALUES 
					(
						@PRIMER_NOMBRE+' '+@SEGUNDO_NOMBRE,
						@PRIMER_APELLIDO+' '+ @SEGUNDO_APELLIDO
					)
				SET @VALORINICIAL = @VALORINICIAL+1
			END
		END;

--AGG DATOS
EXEC CREACION_DATA_ESTUDIANTES_SP 10
--   SELECT * FROM TB_ESTUDIANTES ORDER BY ID_ESTUDIANTE DESC


---------------------------------------------------------------------------------------------------------------------
--2. GENERAR UNA FUNCION QUE ACTUALICE LA EDAD A ESTUDIANTES ENTRE 7-13
---------------------------------------------------------------------------------------------------------------------
GO

CREATE PROCEDURE sp_Generar_datos_completos
AS
BEGIN
    /* Declarar variables */
    DECLARE @contador_inicial INT;
    DECLARE @contador_final INT;
    DECLARE @edad INT;

    /*----------------------- Función para asignar edad -------------------------*/
    /* Setear o colocar valores */
    SET @contador_inicial = (SELECT MIN(id_estudiante) FROM TB_ESTUDIANTES);
    SET @contador_final = (SELECT MAX(id_estudiante) FROM TB_ESTUDIANTES);

    /* Ciclo While */
    WHILE @contador_inicial <= @contador_final
    BEGIN
        SET @edad = (ROUND(RAND() * (13 - 7) + 7, 0));
        UPDATE TB_ESTUDIANTES SET EDAD_ESTUDIANTE = @edad WHERE ID_ESTUDIANTE = @contador_inicial;
        SET @contador_inicial = @contador_inicial + 1;
    END
END


/*
SELECT * FROM TB_ESTUDIANTES ORDER BY ID_ESTUDIANTE DESC
exec sp_Generar_datos_completos
*/

--------------------------------------------------------------------------------------------------------------------
/* 3. ASIGNAR UN GRADO A LOS ESTUDIANTES SEGUN SU EDAD
      7 A 8 primero --8-9 segundo --9-10 tercero --10-11 cuarto --11-12 quinto --12-13 sexto */
---------------------------------------------------------------------------------------------------------------------

GO
--DATOS COMPLETOS 1
Alter procedure sp_Generar_datos_completos
as
begin 
	/*Declarar variables*/
	Declare @contador_inicial int;
	Declare @contador_final int;
	Declare @edad int;
	/*-----------------------Funcion para asignar edad-------------------------*/
	/*Setear o colocar valores*/
	set @contador_inicial = (select min(id_estudiante) from TB_ESTUDIANTES);
	set @contador_final =  (select max(id_estudiante) from TB_ESTUDIANTES);

	/*ciclo Do While*/
	while @contador_inicial <= @contador_final
		begin
			set @edad = (ROUND(RAND() * (13 - 7) + 7, 0));
			update TB_ESTUDIANTES set EDAD_ESTUDIANTE = @edad where ID_ESTUDIANTE = @contador_inicial;
			set @contador_inicial = @contador_inicial+1;
		end; 

set @contador_inicial = (select min(id_estudiante) from TB_ESTUDIANTES);
	  DECLARE @ID_GRADO INT;
	  declare @edad_2 int;
	while @contador_inicial <= @contador_final
		begin
		set @edad_2 = (select edad_estudiante from TB_ESTUDIANTES where ID_ESTUDIANTE = @contador_inicial);
		 -- Asignar el ID del grado dependiendo de la edad
        IF @edad_2 BETWEEN 7 AND 8
            SET @ID_GRADO = 1
        ELSE IF @edad_2 BETWEEN 8 AND 9
            SET @ID_GRADO = 2
        ELSE IF @edad_2 BETWEEN 9 AND 10
            SET @ID_GRADO = 3
        ELSE IF @edad_2 BETWEEN 10 AND 11
            SET @ID_GRADO = 4
        ELSE IF @edad_2 BETWEEN 11 AND 12
            SET @ID_GRADO = 5
        ELSE
            SET @ID_GRADO = 6
		
			update TB_ESTUDIANTES set ID_GRADO = @ID_GRADO where EDAD_ESTUDIANTE = @edad_2;

			set @contador_inicial = @contador_inicial+1;
		end;
end

/*
SELECT * FROM TB_ESTUDIANTES ORDER BY ID_ESTUDIANTE DESC
exec sp_Generar_datos_completos
*/


---------------------------------------------------------------------------------------------------------------------
/* 4. CREAR UN SP QUE GENERE
--Direcciones  --telefonos Para Estudiantes */
---------------------------------------------------------------------------------------------------------------------

--DATOS COMPLETOS 2
Alter procedure sp_Generar_datos_completos
as
begin 
	/*Declarar variables*/
	Declare @contador_inicial int;
	Declare @contador_final int;
	Declare @edad int;
	/*-----------------------Funcion para asignar edad-------------------------*/
	/*Setear o colocar valores*/
	set @contador_inicial = (select min(id_estudiante) from TB_ESTUDIANTES);
	set @contador_final =  (select max(id_estudiante) from TB_ESTUDIANTES);

--Edad
	/*ciclo Do While*/
	while @contador_inicial <= @contador_final
		begin
			set @edad = (ROUND(RAND() * (13 - 7) + 7, 0));
			update TB_ESTUDIANTES set EDAD_ESTUDIANTE = @edad where ID_ESTUDIANTE = @contador_inicial;
			set @contador_inicial = @contador_inicial+1;
		end; 

--DE Asignar Grado estudiante
set @contador_inicial = (select min(id_estudiante) from TB_ESTUDIANTES);
	  DECLARE @ID_GRADO INT;
	  declare @edad_2 int;
	while @contador_inicial <= @contador_final
		begin
		set @edad_2 = (select edad_estudiante from TB_ESTUDIANTES where ID_ESTUDIANTE = @contador_inicial);
		 -- Asignar el ID del grado dependiendo de la edad
        IF @edad_2 BETWEEN 7 AND 8
            SET @ID_GRADO = 1
        ELSE IF @edad_2 BETWEEN 8 AND 9
            SET @ID_GRADO = 2
        ELSE IF @edad_2 BETWEEN 9 AND 10
            SET @ID_GRADO = 3
        ELSE IF @edad_2 BETWEEN 10 AND 11
            SET @ID_GRADO = 4
        ELSE IF @edad_2 BETWEEN 11 AND 12
            SET @ID_GRADO = 5
        ELSE
            SET @ID_GRADO = 6
		
			update TB_ESTUDIANTES set ID_GRADO = @ID_GRADO where EDAD_ESTUDIANTE = @edad_2;

			set @contador_inicial = @contador_inicial+1;
		end;

--De telefono
set @contador_inicial = (select min(id_estudiante) from TB_ESTUDIANTES);
	DECLARE @TELEFONO_RESULTADO VARCHAR(13);
	while @contador_inicial <= @contador_final
		begin
		set @edad_2 = (select edad_estudiante from TB_ESTUDIANTES where ID_ESTUDIANTE = @contador_inicial);
		
			EXEC SP_GENERADOR_TELEFONO @TELEFONO_R = @TELEFONO_RESULTADO OUTPUT;
			
			update TB_ESTUDIANTES set TELEFONO_ESTUDIANTE = @TELEFONO_RESULTADO where EDAD_ESTUDIANTE = @edad_2;

			set @contador_inicial = @contador_inicial+1;
		end;


--Direccion
set @contador_inicial = (select min(id_estudiante) from TB_ESTUDIANTES);
	
	DECLARE @direccion_resultado VARCHAR(100);

	while @contador_inicial <= @contador_final
		begin
		set @edad_2 = (select edad_estudiante from TB_ESTUDIANTES where ID_ESTUDIANTE = @contador_inicial);
		
			EXEC SP_GENERAR_DIRECCIONES @DIRECCION = @direccion_resultado OUTPUT;
			
			update TB_ESTUDIANTES set DIRECCION_ESTUDIANTE = @direccion_resultado where EDAD_ESTUDIANTE = @edad_2;

			set @contador_inicial = @contador_inicial+1;
		end;

end






---------------
--SP TELEFONO
---------------

/*
declare @TELEFONO_RESULTADO varchar (13);
exec SP_GENERADOR_TELEFONO @TELEFONO_R = @TELEFONO_RESULTADO output; 
print(@TELEFONO_RESULTADO)
*/

Create PROCEDURE SP_GENERADOR_TELEFONO
@TELEFONO_R VARCHAR(13) OUTPUT
AS
BEGIN

	DECLARE @NUMERO_INICIAL INT;
	DECLARE @TELEFONO VARCHAR(13);

	/*GENERAR UN TELEFONO 502 XXXX - XXXX */
	-- PRIMERA X ES 3 - 6
	-- ALEATORIOS 0 - 9

	SET @NUMERO_INICIAL = FLOOR(RAND() * 4) + 3; 
	 SET @TELEFONO = '502 ' + CAST(@NUMERO_INICIAL AS VARCHAR(1));
		--SET @TELEFONO = '502 '+ CAST(@NUMERO_INICIAL AS varchar(1)); --502 3

		SET @TELEFONO = @TELEFONO 
			+ CAST(FLOOR(RAND() * 10) AS varchar(1))
			+ CAST(FLOOR(RAND() * 10) AS varchar(1))
			+ CAST(FLOOR(RAND() * 10) AS varchar(1)) +'-'+
			+ CAST(FLOOR(RAND() * 10) AS varchar(1))
			+ CAST(FLOOR(RAND() * 10) AS varchar(1))
			+ CAST(FLOOR(RAND() * 10) AS varchar(1))
			+ CAST(FLOOR(RAND() * 10) AS varchar(1));

	SET @TELEFONO_R = @TELEFONO;
END;




--SP DIRECCION ESTUDIANTE

ALTER PROC SP_GENERAR_DIRECCIONES
@DIRECCION VARCHAR(100) OUTPUT
AS 
BEGIN
declare @datos VARCHAR (100);

declare @departamentos table (
Id int,
Nombre nvarchar (50)
);
insert into @Departamentos (Id, Nombre)
values
(1,'Quetzaltenango'),
(2,'San Marcos');

declare @Municipios table (
Id int identity(1,1),
Departamentos_Id int,
Municipio nvarchar (100)
);
insert into @Municipios (Departamentos_Id, Municipio)
values

--quetzaltenango

(1, 'Quetzaltenango'),
(1, 'Olintepeque'),
(1, 'La Esperanza'),
(1, 'Cantel'),

--san marcos
(2, 'San Marcos'),
(2, 'Catarina'),
(2, 'Nuevo Progreso'),
(2, 'Ayutla');

declare @RandomMunicipio Nvarchar (100);

select top 1 @RandomMunicipio = 
'Muncipio: ' + m.Municipio +' ' + 'Departamento De: ' + d.Nombre 
from @Municipios m inner join @Departamentos d on m.Departamentos_Id = d.Id
order by newid();

set  @datos = @RandomMunicipio;
SET @DIRECCION = @datos;


END;

SELECT * FROM TB_ESTUDIANTES


/*
DECLARE @direccion_resultado VARCHAR(100);

EXEC SP_GENERAR_DIRECCIONES @DIRECCION = @direccion_resultado OUTPUT;

PRINT(@direccion_resultado)

*/


