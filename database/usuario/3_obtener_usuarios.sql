USE telefonia;
DROP PROCEDURE IF EXISTS ObtenerUsuarios;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE ObtenerUsuarios()
BEGIN
	SELECT * FROM usuario WHERE rol_id = 2;
END $$
DELIMITER ;

CALL ObtenerUsuarios();