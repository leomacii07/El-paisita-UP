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

-- Tabla de usuarios con roles
CREATE TABLE usuarios (
    id        BIGSERIAL PRIMARY KEY,
    username  VARCHAR(100) NOT NULL UNIQUE,
    password  VARCHAR(255) NOT NULL,  -- Aquí irá el hash BCrypt, nunca texto plano
    rol       VARCHAR(50)  NOT NULL CHECK (rol IN ('ADMIN', 'CAJERO')),
    activo    BOOLEAN      NOT NULL DEFAULT TRUE,
    creado_en TIMESTAMP    DEFAULT NOW()
);

-- Contraseña de ambos: "admin123" y "cajero123" (hasheadas con BCrypt)
INSERT INTO usuarios (username, password, rol) VALUES
('admin',  '$2a$10$7EqJtq98hPqEX7fNZaFWoOa/TYVO7YMJ7L5kKLB0zvF5/aNtRCBKm', 'ADMIN'),
('cajero', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p4UKiyK9D7JJU9JiMOPXby', 'CAJERO');