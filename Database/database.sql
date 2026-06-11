-- Base de datos: el_paisita_up
-- Ejecutar este script en pgAdmin después de crear la base de datos

CREATE TABLE productos (
    id             BIGSERIAL PRIMARY KEY,
    nombre         VARCHAR(255) NOT NULL UNIQUE,
    categoria      VARCHAR(255) NOT NULL,
    precio_compra  FLOAT        NOT NULL CHECK (precio_compra > 0),
    iva            FLOAT        NOT NULL DEFAULT 0.19 CHECK (iva >= 0),
    precio_venta   FLOAT        NOT NULL CHECK (precio_venta > 0),
    stock_actual   INTEGER      NOT NULL DEFAULT 0 CHECK (stock_actual >= 0),
    stock_minimo   INTEGER      NOT NULL DEFAULT 5 CHECK (stock_minimo >= 0),
    activo         BOOLEAN      NOT NULL DEFAULT TRUE,
    creado_en      TIMESTAMP    DEFAULT NOW()
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