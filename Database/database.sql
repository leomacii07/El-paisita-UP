-- Base de datos: el_paisita_up
-- Ejecutar este script en pgAdmin después de crear la base de datos

CREATE TABLE productos (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    categoria VARCHAR(255),
    precio_compra FLOAT,
    iva FLOAT,
    precio_venta FLOAT,
    stock_actual INTEGER
);

CREATE TABLE ventas (
    id BIGSERIAL PRIMARY KEY,
    producto_nombre VARCHAR(255),
    cantidad INTEGER,
    total FLOAT,
    fecha_venta TIMESTAMP DEFAULT NOW()
);
