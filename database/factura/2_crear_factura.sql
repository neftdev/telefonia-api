USE telefonia;
DROP PROCEDURE IF EXISTS CrearFactura;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE CrearFactura(
  IN _usuario_cui INT(25) UNSIGNED
)
BEGIN
  DECLARE _id INT(25);
  DECLARE _total_pagar INT UNSIGNED;
  DECLARE _fecha_pagar DATE;
  DECLARE _fecha_vencimiento DATE;
  DECLARE _facturas INT;
  DECLARE _mora INT;
  DECLARE _cantidad_facturas INT;

  SET _total_pagar = (SELECT total_pagar FROM usuario WHERE cui = _usuario_cui);
  SET _fecha_pagar = (SELECT fecha_pagar FROM usuario WHERE cui = _usuario_cui);

  IF _total_pagar > 0 THEN
    SET _cantidad_facturas = (
	  SELECT COUNT(numero) FROM factura WHERE fecha_emision = _fecha_pagar AND usuario_cui = _usuario_cui
	);

    IF _cantidad_facturas = 0 THEN
	  SET _fecha_vencimiento = (SELECT DATE_ADD(_fecha_pagar, INTERVAL 2 DAY));
      SET _mora = 0;

      IF CURDATE() > _fecha_vencimiento THEN
		    SET _mora = _mora + 50;
      END IF;

    SET _total_pagar =_total_pagar + _mora;

    INSERT INTO factura (fecha_emision, fecha_vencimiento, estado, total, mora, usuario_cui)
	  VALUES (_fecha_pagar, _fecha_vencimiento, false, _total_pagar, _mora, _usuario_cui);

      SET _id = LAST_INSERT_ID();

      CALL ObtenerFactura(_id);
    ELSE
      SELECT
        u.cui cui, u.nombre nombre, u.direccion direccion, u.telefono telefono, u.email email,
        u.total_pagar pago_mensual, f.numero numero_factura, f.fecha_emision fecha_emision,
        f.fecha_vencimiento fecha_vencimiento, f.estado esta_pagado, f.total total_pagar, f.mora mora,
        f.ruta ruta
      FROM usuario u, factura f
      WHERE f.fecha_emision = _fecha_pagar AND u.cui = _usuario_cui AND u.cui = f.usuario_cui;
    END IF;
  END IF;
END $$
DELIMITER ;

CALL CrearFactura(123456895);

SELECT * FROM factura;
