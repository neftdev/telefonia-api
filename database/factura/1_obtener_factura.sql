USE telefonia;
DROP PROCEDURE IF EXISTS ObtenerFactura;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE ObtenerFactura(
  IN _numero INT UNSIGNED
)
BEGIN
	SELECT
    u.cui cui, u.nombre nombre, u.direccion direccion, u.telefono telefono, u.email email,
    u.total_pagar pago_mensual, f.numero numero_factura, f.fecha_emision fecha_emision,
    f.fecha_vencimiento fecha_vencimiento, f.estado esta_pagado, f.total total_pagar, f.mora mora,
    f.ruta ruta
  FROM
    usuario u, factura f
  WHERE f.numero = _numero AND u.cui = f.usuario_cui;
END $$
DELIMITER ;