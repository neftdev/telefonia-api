USE telefonia;
DROP PROCEDURE IF EXISTS ObtenerUsuario;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE ObtenerUsuario(
  IN _email VARCHAR(256)
)
BEGIN
	SELECT * FROM usuario WHERE email = _email;
END $$
DELIMITER ;

CALL ObtenerUsuario('admin@gmail.com');