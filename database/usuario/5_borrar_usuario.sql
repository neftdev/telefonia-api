USE telefonia;
DROP PROCEDURE IF EXISTS BorrarUsuario;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE BorrarUsuario(
  IN _cui INT(25) UNSIGNED
)
BEGIN
	DELETE FROM usuario WHERE cui = _cui;
END $$
DELIMITER ;

CALL BorrarUsuario(1234567891);

SELECT * FROM usuario;