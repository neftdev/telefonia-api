USE telefonia;
DROP PROCEDURE IF EXISTS MisFacturas;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE MisFacturas(
  IN _usuario_cui INT(25) UNSIGNED
)
BEGIN
	SELECT
        u.cui cui, u.nombre nombre, u.direccion direccion, u.telefono telefono, u.email email,
        u.total_pagar pago_mensual, f.numero numero_factura, f.fecha_emision fecha_emision,
        f.fecha_vencimiento fecha_vencimiento, f.estado esta_pagado, f.total total_pagar, f.mora mora,
        f.ruta ruta
      FROM usuario u, factura f
      WHERE u.cui = _usuario_cui AND u.cui = f.usuario_cui;
END $$
DELIMITER ;

CALL MisFacturas(123456895);