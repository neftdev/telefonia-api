const sql = require("../database");

const controller = {};

controller.getUsers = (req, res) => {
  const query = "CALL ObtenerUsuarios();";
  sql.query(query, (err, usuarios) => {
    if (err) {
      console.log(err);
      res.status(400).json({
        error: true,
        message: "No se pudo obtener los registros"
      });
    } else {
      res.status(200).json(usuarios[0]);
    }
  });
};

controller.createUser = (req, res) => {
  const { cui, email, nombre, direccion, telefono, total_pagar } = req.body;

  if (cui && email && nombre && direccion && telefono && total_pagar) {
    const query = "CALL CrearUsuario(?, ?, ?, ?, ?, ?, ?, ?);";
    sql.query(
      query,
      [cui, email, nombre, direccion, telefono, total_pagar, "secret", 2],
      (err, rows) => {
        if (err) {
          console.log(err);
          res.status(400).json({
            error: true,
            message: "No se pudo crear el usuario"
          });
        } else {
          console.log(rows);
          res.status(200).json({
            message: "Se creo el usuario con exito"
          });
        }
      }
    );
  } else {
    res.status(400).json({
      error: true,
      message: "Proporcione datos validos."
    });
  }
};

controller.deleteUser = (req, res) => {
  const cui = req.params.cui;

  if (cui) {
    const query = "CALL BorrarUsuario(?);";

    sql.query(query, [cui], (err, rows) => {
      if (err) {
        console.log(err);
        res.status(400).json({
          error: true,
          message: "No se pudo borrar el usuario"
        });
      } else {
        console.log(rows);
        res.status(200).json({
          message: "Se borro el usuario con exito"
        });
      }
    });
  } else {
    res.status(400).json({
      error: true,
      message: "No se recibio CUI de usuario."
    });
  }
};

controller.login = (req, res) => {
  const { email, password } = req.body;

  if (email && password) {
    const query = "CALL ChecarPassword(?, ?);";
    sql.query(query, [email, password], (err, rows) => {
      if (err) {
        console.log(err);
        res.status(400).json({
          error: true,
          message: "Error al buscar el usuario"
        });
      } else {
        const users = rows[0];
        if (users && users.length === 1) {
          res.status(200).json(users[0]);
        } else {
          res.status(400).json({
            error: true,
            message: "No se encontro el usuario"
          });
        }
      }
    });
  } else {
    res.status(400).json({
      error: true,
      message: "No se pudo obtener los registros"
    });
  }
};

controller.getUser = (req, res) => {
  const { email } = req.body;
  if (email) {
    const query = "CALL ObtenerUsuario(?);";
    sql.query(query, [email], (err, usuarios) => {
      if (err) {
        console.log(err);
        res.status(400).json({
          error: true,
          message: "No se pudo obtener el usuario"
        });
      } else {
        res.status(200).json(usuarios[0]);
      }
    });
  } else {
    res.status(400).json({
      error: true,
      message: "No se pudo obtener los registros"
    });
  }
};

module.exports = controller;
