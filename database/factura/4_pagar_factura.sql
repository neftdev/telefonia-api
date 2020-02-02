USE telefonia;
DROP PROCEDURE IF EXISTS PagarFactura;

DELIMITER $$
USE telefonia$$
CREATE PROCEDURE PagarFactura(
  _numero INT UNSIGNED,
  _pago INT UNSIGNED
)
BEGIN
  DECLARE _estado BOOLEAN;
  DECLARE _total_pagar INT;
  DECLARE _mora INT;
  DECLARE _total_factura INT;
  DECLARE _fecha_vencimiento DATE;
  DECLARE _fecha_pagar DATE;
  DECLARE _cui INT(25);

  SELECT usuario_cui, estado, fecha_vencimiento
  INTO _cui, _estado, _fecha_vencimiento
  FROM factura
  WHERE numero = _numero;

  SET _fecha_pagar = (SELECT fecha_pagar from usuario WHERE cui = _cui);
  SET _total_pagar = (SELECT total_pagar FROM usuario WHERE cui = _cui);

  IF _estado = false THEN
    SET _mora = 0;
    IF CURDATE() > _fecha_vencimiento THEN
		    SET _mora = 50;
    END IF;

    SET _total_factura = _total_pagar + _mora;

    IF _total_factura = _pago THEN
      SET _estado = true;
      SET _fecha_pagar = (SELECT DATE_ADD(_fecha_pagar, INTERVAL 1 MONTH));
    END IF;

    UPDATE factura
    SET estado = _estado, mora = _mora, total = _total_factura
    WHERE numero = _numero;

    UPDATe usuario
    SET fecha_pagar = _fecha_pagar
    WHERE cui = _cui;
  END IF;

  SELECT * FROM factura WHERE numero = _numero;

END $$
DELIMITER ;

CALL PagarFactura(1, 130);
CALL PagarFactura(1, 150);
