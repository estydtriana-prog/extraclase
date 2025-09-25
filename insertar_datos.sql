-- PROVEEDORES
INSERT INTO Proveedores (nombre_proveedor, nit, telefono, direccion, correo) VALUES
('Distribuidora Alimentos S.A', '900123456-7', '3001112222', 'Cra 10 #20-30', 'ventas@distribuidora.com'),
('Bebidas y Licores LTDA', '901234567-8', '3012223333', 'Cl 15 #8-45', 'contacto@bebidas.com'),
('Hogar y Limpieza SAS', '902345678-9', '3023334444', 'Av 30 #12-20', 'info@hogarylimpieza.com');

-- CLIENTES
INSERT INTO Clientes (nombre, apellido, cedula, telefono, correo, direccion) VALUES
('Ana', 'Martínez', '1002003001', '3115551111', 'ana@gmail.com', 'Cl 5 #12-40'),
('Carlos', 'Pérez', '1002003002', '3125552222', 'carlos@hotmail.com', 'Cra 7 #45-21'),
('Lucía', 'Gómez', '1002003003', '3135553333', 'lucia@yahoo.com', 'Cl 8 #32-15');

-- PRODUCTOS
INSERT INTO Productos (nombre_producto, categoria, precio, stock, id_proveedor, codigo_barras) VALUES
('Arroz 1kg', 'Granos', 4500, 100, 1, '770123456001'),
('Aceite 1L', 'Aceites', 9500, 50, 1, '770123456002'),
('Gaseosa 2L', 'Bebidas', 7200, 80, 2, '770123456003'),
('Detergente 1kg', 'Aseo', 8500, 40, 3, '770123456004'),
('Jabón de baño', 'Aseo', 2000, 200, 3, '770123456005');

-- VENTAS
INSERT INTO Ventas (fecha, id_cliente, total, codigo_factura) VALUES
('2025-09-01', 1, 14200, 'FAC001'),
('2025-09-02', 2, 11500, 'FAC002'),
('2025-09-03', 3, 20000, 'FAC003');

-- DETALLE VENTAS
INSERT INTO Detalle_Venta (id_venta, id_producto, cantidad, subtotal) VALUES
(1, 1, 2, 9000),
(1, 3, 1, 7200),
(2, 2, 1, 9500),
(2, 5, 1, 2000),
(3, 1, 3, 13500),
(3, 4, 1, 8500);
