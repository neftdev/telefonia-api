USE telefonia;
DROP PROCEDURE IF EXISTS EnviarRuta;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE EnviarRuta(
  IN _numero INT UNSIGNED,
  IN _ruta VARCHAR(256)
)
BEGIN
	UPDATE factura
  SET ruta = _ruta
  WHERE numero = _numero;
END $$
DELIMITER ;
