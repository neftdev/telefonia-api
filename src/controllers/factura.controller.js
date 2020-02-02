const sql = require("../database");
const pdf = require("html-pdf");
const fs = require("fs");
const path = require("path");
const nodemailer = require("nodemailer");
const moment = require("moment");

moment.locale("es");

let transport = nodemailer.createTransport({
  host: "smtp.mailtrap.io",
  port: 2525,
  auth: {
    user: "407cd848f462b4",
    pass: "dd45f76ee8bd1e"
  },
  tis: {
    rejectUnauthorized: false
  }
});

const controller = {};

controller.createFactura = (req, res) => {
  const cui = req.params.cui;
  if (cui) {
    let query = "CALL CrearFactura(?);";
    sql.query(query, [cui], async (err, rows) => {
      if (err) {
        console.log(err);
        res.status(400).json({
          error: true,
          message: "No se pudo obtener la factura"
        });
      } else {
        const facturas = rows[0];
        if (facturas && facturas.length === 1) {
          let factura = facturas[0];
          if (!factura.ruta) {
            let rutaFinal = `facturas/${new Date().getTime()}.pdf`;
            let template = path.resolve(__dirname, "../templates/factura.html");
            var filename = path.resolve(__dirname, `../public/${rutaFinal}`);

            let contentHTML = fs.readFileSync(template, "utf8");
            let options = { format: "Letter" };

            contentHTML = contentHTML
              .replace("{{numero_factura}}", factura.numero_factura)
              .replace(
                "{{fecha_pagar}}",
                moment(factura.fecha_emision).format("LL")
              )
              .replace(
                "{{fecha_vencimiento}}",
                moment(factura.fecha_vencimiento).format("LL")
              )
              .replace("{{nombre_cliente}}", factura.nombre)
              .replace("{{direccion}}", factura.direccion)
              .replace("{{telefono}}", factura.telefono)
              .replace("{{email}}", factura.email)
              .replace("{{mora}}", factura.mora)
              .replace("{{saldo_inicial}}", factura.pago_mensual)
              .replace("{{total}}", factura.total_pagar);

            await transport.sendMail({
              from: "'Servidor Telefonia' <telefonia-a0276f@inbox.mailtrap.io>",
              to: "ronaldnef1996@gmail.com",
              subject: "Factura",
              html: contentHTML
            });

            pdf.create(contentHTML, options).toFile(filename, (err, data) => {
              if (err) {
                console.log(err);
                res.status(400).json({
                  error: true,
                  message: "No se pudo obtener la factura"
                });
                return;
              }
              rutaFinal = `http://localhost:4080/${rutaFinal}`;
              query = "CALL EnviarRuta(?, ?);";
              sql.query(
                query,
                [factura.numero_factura, rutaFinal],
                (errRuta, rowsRuta) => {
                  if (errRuta) {
                    console.log(errRuta);
                    res.status(400).json({
                      error: true,
                      message: "No se pudo obtener la factura"
                    });
                    return;
                  }
                  res.status(200).json({
                    filename: rutaFinal
                  });
                }
              );
            });
          } else {
            res.status(200).json({
              filename: factura.ruta
            });
          }
        } else {
          res.status(400).json({
            error: true,
            message: "No se pudo obtener la factura"
          });
        }
      }
    });
  }
};

controller.getFactura = (req, res) => {
  const numero = req.params.numero;

  if (numero) {
    const query = "CALL ObtenerFactura(?);";

    sql.query(query, [numero], (err, rows) => {
      if (err) {
        console.log(err);
        res.status(400).json({
          error: true,
          message: "No se pudo obtener la factura"
        });
      } else {
        const facturas = rows[0];
        if (facturas && facturas.length === 1) {
          res.status(200).json(facturas[0]);
        } else {
          res.status(400).json({
            error: true,
            message: "No se pudo obtener la factura"
          });
        }
      }
    });
  }
};

controller.misFacturas = (req, res) => {
  const cui = req.params.cui;
  if (cui) {
    const query = "CALL MisFacturas(?);";
    sql.query(query, [cui], (err, rows) => {
      if (err) {
        console.log(err);
        res.status(400).json({
          error: true,
          message: "No se pudo obtener las facturas"
        });
      } else {
        const facturas = rows[0];
        if (facturas) {
          res.status(200).json(facturas);
        } else {
          res.status(400).json({
            error: true,
            message: "No se pudo obtener las facturas"
          });
        }
      }
    });
  }
};

controller.pagarFactura = (req, res) => {
  const { numero, pago } = req.body;

  if (numero && pago) {
    const query = "CALL PagarFactura(?, ?);";
    sql.query(query, [numero, pago], (err, rows) => {
      if (err) {
        console.log(err);
        res.status(400).json({
          error: true,
          message: "Ocurrio un error, no se pudo pagar la factura."
        });
      } else {
        const facturas = rows[0];
        if (facturas) {
          res.status(200).json(facturas[0]);
        } else {
          console.log("No se encontro ninguna factura");
          res.status(400).json({
            error: true,
            message: "No se pudo pagar la factura"
          });
        }
      }
    });
  } else {
    console.log("No se encontro parametros");
    res.status(400).json({
      error: true,
      message: "Falta datos en la peticion (numero|pago)."
    });
  }
};

module.exports = controller;
