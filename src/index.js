const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const path = require("path");

const app = express();
const userRoutes = require("./routes/user");
const facturaRoutes = require("./routes/factura");

// Middleware
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Rutas
app.use("/api", userRoutes);
app.use("/api", facturaRoutes);

// Middleware para Vue.js router modo history
const history = require("connect-history-api-fallback");
app.use(history());
app.use(express.static(path.join(__dirname, "public")));

app.set("port", process.env.PORT || 4080);
app.listen(app.get("port"), function() {
  console.log("Server on port: " + app.get("port"));
});
