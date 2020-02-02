DROP DATABASE IF EXISTS telefonia;

CREATE DATABASE telefonia;

use telefonia;

CREATE TABLE rol (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(50),
  descripcion VARCHAR(255) NULL
);

CREATE TABLE usuario (
  cui INT(25) UNSIGNED PRIMARY KEY,
  email VARCHAR(255),
  nombre VARCHAR(100),
  direccion VARCHAR(255),
  telefono INT UNSIGNED,
  fecha_pagar DATE,
  total_pagar INT UNSIGNED,
  password VARCHAR(256),
  rol_id INT UNSIGNED,
  CONSTRAINT usuario_telefono UNIQUE (telefono),
  CONSTRAINT usuario_email UNIQUE (email)
);

CREATE TABLE factura (
  numero INT UNSIGNED AUTO_INCREMENT  PRIMARY KEY,
  fecha_emision DATE,
  fecha_vencimiento DATE,
  estado BOOLEAN,
  total INT UNSIGNED,
  mora INT,
  ruta VARCHAR(256),
  usuario_cui INT(25) UNSIGNED
);

SHOW TABLES;

describe rol;
describe usuario;
describe factura;