-- Datos de prueba para appdb
-- Nota: las tablas ya son creadas automáticamente por Hibernate (spring.jpa.hibernate.ddl-auto=update),
-- por eso este script no las crea, solo inserta datos.

-- venta (autoincremento nativo, no requiere id explícito)
INSERT INTO venta (direccion_compra, valor_compra, fecha_compra, despacho_generado) VALUES 
('Av. Apoquindo 4500, Las Condes', 45000, '2026-05-15', b'1'),
('Calle Los Alerces 123, Ñuñoa', 12500, '2026-05-16', b'0'),
('Av. Providencia 1234, Santiago', 45900,  '2024-11-03', b'0'),
('Los Leones 876, Vitacura', 128500, '2024-11-10', b'0'),
('Gran Avenida 4521, San Miguel', 67300,  '2024-12-01', b'0'),
('Paseo Las Palmas 310, Las Condes', 89000,  '2025-01-15', b'0'),
('Camino Lo Barnechea 750, Lo Barnechea', 34200,  '2025-02-20', b'0'),
('Pasaje El Sol 89, San Miguel', 89990, '2026-05-17', b'1');

-- despacho (usa tabla de secuencia despacho_seq, no autoincremento nativo, por eso el id va explícito)
INSERT INTO despacho (id_despacho, fecha_despacho, patente_camion, intento, id_compra, direccion_compra, valor_compra, despachado) VALUES 
(1, '2026-05-16', 'ABCD-12', 1, 1, 'Av. Apoquindo 4500, Las Condes', 45000, b'0'),
(2, '2026-05-17', 'XYZW-34', 2, 3, 'Pasaje El Sol 89, San Miguel', 89990, b'1');

-- Sincronizar la secuencia para que el siguiente despacho creado desde la app no choque con estos IDs
UPDATE despacho_seq SET next_val = 3 WHERE next_val <= 2;