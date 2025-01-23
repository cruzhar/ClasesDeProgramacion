--sp listar
--sp insertar
--sp eliminar(desactivar)
--sp modificar

--listar
CREATE PROC [dbo].[SP_TB_NIVEL_USUARIO_LISTAR_SP]
AS
BEGIN
SELECT 
	ID_NIVEL_USUARIO,
	NOMBRE, 
	ESTADO,
	FECHA_CREACION
	FROM 
		TB_NIVEL_USUARIO
	WHERE 
		VISIBLE = 1
END


--INSERTAR
ALTER PROC [dbo].[SP_TB_NIVEL_USUARIO_INSERT_SP]
    @NOMBRE VARCHAR(100),
	@USUARIO INT,
    @MENSAJE VARCHAR(100) OUTPUT
AS
BEGIN
    DECLARE @COMPARAR INT = 0;

    -- Compara nombres en mayúsculas
    SET @COMPARAR = (SELECT MAX(ID_NIVEL_USUARIO) FROM TB_NIVEL_USUARIO WHERE UPPER(NOMBRE) = UPPER(@NOMBRE) AND ESTADO = 1);

    IF @COMPARAR IS NULL 
    BEGIN
        -- Si no existe un menú con el mismo nombre, procede con la inserción
        INSERT INTO TB_NIVEL_USUARIO 
        (
            NOMBRE,
            ESTADO,
            FECHA_CREACION,
            VISIBLE,
			USUARIO_CREACION
        )
        VALUES
        (
            @NOMBRE,
            1,
            GETDATE(),
            1,
			@USUARIO
        );

        SET @MENSAJE = 'OK';
    END
    ELSE 
    BEGIN
        -- Si ya existe un menú con el mismo nombre
        SET @MENSAJE = 'YA EXISTE UN NIVEL DE USUARIO CON ESE NOMBRE';
    END
END;


--MODIFICAR
USE [DB_SEA]
GO
/****** Object:  StoredProcedure [dbo].[SP_TB_NIVEL_USUARIO_UPDATE_SP]    Script Date: 1/22/2025 10:02:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TB_NIVEL_USUARIO_UPDATE_SP]
	@CODIGO	INT,
    @NOMBRE VARCHAR(100),
	@USUARIO INT,
    @MENSAJE VARCHAR(100) OUTPUT
AS
BEGIN
    DECLARE @COMPARAR INT = 0;

    -- Compara nombres en mayúsculas
    SET @COMPARAR = (SELECT MAX(ID_NIVEL_USUARIO) FROM TB_NIVEL_USUARIO WHERE UPPER(NOMBRE) = UPPER(@NOMBRE) AND ESTADO = 1 AND ID_NIVEL_USUARIO <> @CODIGO);

    IF @COMPARAR IS NULL 
    BEGIN
        -- Si no existe un menú con el mismo nombre, procede con la inserción
        UPDATE TB_NIVEL_USUARIO 
        SET
            NOMBRE = @NOMBRE,
            USUARIO_MODIFICACION = @USUARIO,
					FECHA_MODIFICACION = GETDATE()
            WHERE ID_NIVEL_USUARIO = @CODIGO
           
           
        SET @MENSAJE = 'OK';
    END
    ELSE 
    BEGIN
        -- Si ya existe un menú con el mismo nombre
        SET @MENSAJE = 'YA EXISTE UN NIVEL DE USUARIO CON ESE NOMBRE';
    END
END;

--ELIMINAR

CREATE PROC [dbo].[SP_TB_NIVEL_USUARIO_DELETE_SP]
    @CODIGO INT,
    @USUARIO INT,
    @MENSAJE VARCHAR(100) OUTPUT
AS
BEGIN
				UPDATE TB_NIVEL_USUARIO SET 
					VISIBLE = 0,
					ESTADO = 0,
					USUARIO_MODIFICACION = @USUARIO,
					FECHA_MODIFICACION = GETDATE()
				WHERE 
					ID_NIVEL_USUARIO = @CODIGO;
				SET @MENSAJE = 'OK';
END;
