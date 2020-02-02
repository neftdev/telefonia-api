const { Router } = require("express");
const router = Router();
const facturaController = require("../controllers/factura.controller");

router.post("/factura/create/:cui", facturaController.createFactura);

router.get("/factura/:numero", facturaController.getFactura);

router.get("/mis-facturas/:cui", facturaController.misFacturas);

router.post("/factura/pagar", facturaController.pagarFactura);

module.exports = router;
