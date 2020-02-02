USE telefonia;
DROP PROCEDURE IF EXISTS CrearUsuario;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE CrearUsuario(
  IN _cui INT(15) UNSIGNED,
  IN _email VARCHAR(255),
  IN _nombre VARCHAR(100),
  IN _direccion VARCHAR(255),
  IN _telefono INT UNSIGNED,
  IN _total_pagar INT UNSIGNED,
  IN _password VARCHAR(255),
  IN _rol_id INT UNSIGNED
)
BEGIN
	DECLARE _id INT(15);
    DECLARE _fecha_pagar DATE;

    SET _fecha_pagar = (SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH));

	INSERT INTO usuario (cui, email, nombre, direccion, telefono, fecha_pagar, total_pagar, password, rol_id)
    VALUES (_cui, _email, _nombre, _direccion, _telefono, _fecha_pagar, _total_pagar, _password, _rol_id);
    SET _id = LAST_INSERT_ID();
    SELECT * FROM usuario
    WHERE cui = _id;
END $$
DELIMITER ;

CALL CrearUsuario(1234567890, 'admin@gmail.com', 'Administrador', '8 calle 45-85 zona 7', 56789457, 0, '12345678', 1);

SELECT * FROM usuario;