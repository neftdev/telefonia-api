const mysql = require("mysql");

const mysqlConnection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  database: "telefonia",
  user: "root",
  password: ""
});

mysqlConnection.connect(function(err) {
  if (err) {
    console.log(err);
    return;
  }
  console.log("Sea conectado a la base de datos.");
});

module.exports = mysqlConnection;
