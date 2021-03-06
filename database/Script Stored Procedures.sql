use innpactia
DELIMITER $$
CREATE PROCEDURE SP_CLIENTES(IN_LIMIT INT, IN_OFFSET INT)
BEGIN
SELECT  persona.nombre, cliente.cliente_id, cliente.numero_telefono,cliente.usr_registro, (SELECT COUNT(*)FROM CLIENTE) AS TOTAL FROM persona
INNER JOIN cliente on persona.persona_id = cliente.persona_id
LIMIT IN_LIMIT OFFSET IN_OFFSET;
END$$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE SP_LOGIN(IN_USUARIO VARCHAR(100))
BEGIN

IF NOT EXISTS(SELECT USUARIO FROM USUARIO WHERE USUARIO = IN_USUARIO)THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'No existe este usuario';
END IF;

SELECT USUARIO, CONTRASENA FROM USUARIO;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE SP_NUEVO_USUARIO(IN_NOMBRE VARCHAR(75), IN_CORREO VARCHAR(100),IN_CONTRASENA VARCHAR(100), IN_GENERO VARCHAR(30), IN_USR_REGISTRO VARCHAR(100)
)

BEGIN
DECLARE ID_PERSONA INT;
DECLARE `_rollback` BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;

IF EXISTS(SELECT CORREO FROM PERSONA WHERE CORREO = IN_CORREO) THEN 
		RESIGNAL SQLSTATE 'ERROR'
			SET MESSAGE_TEXT = 'Correo ya está registrado';
	END IF;

START TRANSACTION;
INSERT INTO PERSONA (NOMBRE,CORREO,GENERO,ESTADO,FECHA_REGISTRO,USR_REGISTRO)
			VALUES(IN_NOMBRE,IN_CORREO,IN_GENERO,1,current_date(),IN_USR_REGISTRO);

SET ID_PERSONA = (SELECT MAX(PERSONA_ID) FROM PERSONA);

INSERT INTO USUARIO (PERSONA_ID, USUARIO,CONTRASENA, ESTADO, FECHA_REGISTRO, USR_REGISTRO)
			VALUES(ID_PERSONA,IN_CORREO,IN_CONTRASENA,1,CURRENT_DATE(),IN_USR_REGISTRO);
IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_LISTA_TELEFONOS_CLIENTE(IN_CLIENTE_ID INT)
BEGIN
SELECT * FROM TELEFONO WHERE CLIENTE_ID = IN_CLIENTE_ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_LISTA_REPARACIONES_TELEFONO(IN_TELEFONO_ID INT)
BEGIN
SELECT * FROM REPARACCIONES WHERE TELEFONO_ID = IN_TELEFONO_ID;
END$$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE SP_NUEVO_CLIENTE(IN_NOMBRE VARCHAR(75), IN_CORREO VARCHAR(100), IN_GENERO VARCHAR(30),
								  IN_DIRECCION VARCHAR(200), IN_NUMERO_TELEFONO VARCHAR(50),IN_USR_REGISTRO VARCHAR(100)
)
BEGIN
DECLARE ID_PERSONA INT;
DECLARE `_rollback` BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;

START TRANSACTION;
 INSERT INTO PERSONA (NOMBRE,CORREO,GENERO,ESTADO,FECHA_REGISTRO,USR_REGISTRO)
			VALUES(IN_NOMBRE,IN_CORREO,IN_GENERO,1,current_date(),IN_USR_REGISTRO);
            
SET ID_PERSONA = (SELECT MAX(PERSONA_ID) FROM PERSONA);

INSERT INTO CLIENTE(PERSONA_ID, DIRECCION,NUMERO_TELEFONO,FECHA_REGISTRO,USR_REGISTRO)   
			VALUES(ID_PERSONA, IN_DIRECCION,IN_NUMERO_TELEFONO,current_date(),IN_USR_REGISTRO);
IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END$$

DELIMITER ;

--NUEVO TELEFONO CLIENTE
descripcion
DELIMITER $$
CREATE PROCEDURE SP_NUEVO_TELEFONO_CLIENTE(IN_CLIENTE_ID INT, IN_MARCA VARCHAR(50),IN_MODELO VARCHAR(50),IN_IMEI VARCHAR(15),
											IN_USR_REGISTRO VARCHAR(100))
                                            
BEGIN
DECLARE `_rollback` BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;

START TRANSACTION;
INSERT INTO TELEFONO(CLIENTE_ID,MARCA,MODELO,IMEI,FECHA_REGISTRO,USR_REGISTRO)
			VALUES (IN_CLIENTE_ID,IN_MARCA,IN_MODELO,IN_IMEI,CURRENT_DATE(),IN_USR_REGISTRO);

IF `_rollback` THEN
        ROLLBACK;
        
    ELSE
        COMMIT;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE SP_NUEVA_REPARACION(IN_TELEFONO_ID INT ,IN_DESCRIPCION VARCHAR(300),IN_FECHA_INICIO DATE,IN_USR_REGISTRO VARCHAR(100))
BEGIN
DECLARE `_rollback` BOOL DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;

START TRANSACTION;
INSERT INTO REPARACIONES(TELEFONO_ID,DESCRIPCION,ESTADO,FECHA_INICIO,FECHA_REGISTRO,USR_REGISTRO)
			VALUES(IN_TELEFONO_ID,IN_DESCRIPCION,1,IN_FECHA_INICIO, CURRENT_DATE(),IN_USR_REGISTRO);

IF `_rollback` THEN
        ROLLBACK;

    ELSE
        COMMIT;
    END IF;
END$$

DELIMITER ;


DELIMITER $$
CREATE PROCEDURE SP_LISTADO_REPARACIONES(IN_LIMIT INT, IN_OFFSET INT)
BEGIN

SELECT  TELEFONO.MARCA,TELEFONO.MODELO,
		REPARACIONES.DESCRIPCION,REPARACIONES.ESTADO,REPARACIONES.FECHA_INICIO,REPARACIONES.DESCRIPCION,
        (SELECT COUNT(*)FROM REPARACIONES )AS TOTAL_REPARACIONES FROM REPARACIONES
INNER JOIN TELEFONO ON REPARACIONES.TELEFONO_ID = TELEFONO.TELEFONO_ID
ORDER BY FECHA_INICIO ASC
LIMIT IN_LIMIT OFFSET IN_OFFSET;
END$$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SP_REPARACIONES_TELEFONO(IN_TELEFONO_ID INT)
BEGIN

SELECT * FROM REPARACIONES WHERE REPARACIONES.TELEFONO_ID =  IN_TELEFONO_ID;
END$$
DELIMITER ;

