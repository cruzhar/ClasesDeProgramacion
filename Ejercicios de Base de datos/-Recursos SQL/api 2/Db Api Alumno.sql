CREATE DATABASE DBPRUEBAS
USE DBPRUEBAS

create table TB_USUARIO
(
	IdUsuario int primary key identity(1,1),
	DocumentoIdentidad varchar(60),	
	Nombres varchar(60),
	Telefono varchar(60),
	Correo varchar(60),
	Ciudad varchar(60),
	FechaRegistro datetime default getdate()
)
select * from TB_USUARIO


---------------------------
GO
SET IDENTITY_INSERT TB_USUARIO ON 

INSERT TB_USUARIO ([IdUsuario], [DocumentoIdentidad], [Nombres], [Telefono], [Correo], [Ciudad]) VALUES (1, N'32504112', N'Regina', N'690577998', N'blandit.mattis@eratvolutpat.edu', N'Rae Lakes')
INSERT TB_USUARIO ([IdUsuario], [DocumentoIdentidad], [Nombres], [Telefono], [Correo], [Ciudad]) VALUES (2, N'20427780', N'Macy', N'270411465', N'interdum@id.net', N'Treppo Carnico')
INSERT TB_USUARIO ([IdUsuario], [DocumentoIdentidad], [Nombres], [Telefono], [Correo], [Ciudad]) VALUES (3, N'47714668', N'Sophia', N'757428589', N'mattis.semper.dui@nibhPhasellusnulla.net', N'Levin')
INSERT TB_USUARIO ([IdUsuario], [DocumentoIdentidad], [Nombres], [Telefono], [Correo], [Ciudad]) VALUES (4, N'32493629', N'Rhiannon', N'794799685', N'posuere@Morbinon.edu', N'Hearst')
INSERT TB_USUARIO ([IdUsuario], [DocumentoIdentidad], [Nombres], [Telefono], [Correo], [Ciudad]) VALUES (5, N'22383970', N'Aubrey', N'711648390', N'odio@arcuVestibulumante.edu', N'Baltasound')

SET IDENTITY_INSERT TB_USUARIO OFF

GO
--************************ PROCEDIMIENTOS ************************--
CREATE procedure usp_registrar(
@documentoidentidad varchar(60),
@nombres varchar(60),
@telefono varchar(60),
@correo varchar(60),
@ciudad varchar(60)
)
as
begin
insert into TB_USUARIO(DocumentoIdentidad,Nombres,Telefono,Correo,Ciudad)
values
(
@documentoidentidad,
@nombres,
@telefono,
@correo,
@ciudad
)
end

GO
CREATE procedure usp_modificar(
@idusuario int,
@documentoidentidad varchar(60),
@nombres varchar(60),
@telefono varchar(60),
@correo varchar(60),
@ciudad varchar(60)
)
as
begin

update TB_USUARIO set 
DocumentoIdentidad = @documentoidentidad,
Nombres = @nombres,
Telefono = @telefono,
Correo = @correo,
Ciudad = @ciudad
where IdUsuario = @idusuario
end


GO
CREATE procedure usp_obtener(@idusuario int)
as
begin
select * from TB_USUARIO where IdUsuario = @idusuario
end

GO
CREATE procedure usp_listar
as
begin
select * from TB_USUARIO
end

GO
CREATE procedure usp_eliminar(
@idusuario int
)
as
begin
delete from TB_USUARIO where IdUsuario = @idusuario
end

