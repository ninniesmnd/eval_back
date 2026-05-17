-- Asegurar que la base de datos exista y usarla
CREATE DATABASE IF NOT EXISTS bd_evaluacion;
USE bd_evaluacion;

-- 1. Crear tabla para la entidad Venta
CREATE TABLE IF NOT EXISTS venta (
    id_venta BIGINT AUTO_INCREMENT PRIMARY KEY,
    direccion_compra VARCHAR(255) NOT NULL,
    valor_compra INT NOT NULL,
    fecha_compra DATE NOT NULL,
    despacho_generado BIT(1) NOT NULL DEFAULT b'0'
);

-- 2. Crear tabla para la entidad Despacho
CREATE TABLE IF NOT EXISTS despacho (
    id_despacho BIGINT AUTO_INCREMENT PRIMARY KEY,
    fecha_despacho DATE,
    patente_camion VARCHAR(20),
    intento INT NOT NULL,
    id_compra BIGINT,
    direccion_compra VARCHAR(255),
    valor_compra BIGINT,
    despachado BIT(1) NOT NULL DEFAULT b'0'
);

-- 3. Insertar datos de prueba sembrados (Seeders)
INSERT INTO venta (direccion_compra, valor_compra, fecha_compra, despacho_generado) VALUES 
('Av. Apoquindo 4500, Las Condes', 45000, '2026-05-15', b'1'),
('Calle Los Alerces 123, Ñuñoa', 12500, '2026-05-16', b'0'),
('Pasaje El Sol 89, San Miguel', 89990, '2026-05-17', b'1');

INSERT INTO despacho (fecha_despacho, patente_camion, intento, id_compra, direccion_compra, valor_compra, despachado) VALUES 
('2026-05-16', 'ABCD-12', 1, 1, 'Av. Apoquindo 4500, Las Condes', 45000, b'0'),
('2026-05-17', 'XYZW-34', 2, 3, 'Pasaje El Sol 89, San Miguel', 89990, b'1');