-- 1. Listar todas las ventas con nombre del cliente
SELECT v.id_venta, c.nombre, c.apellido, v.fecha, v.total
FROM Ventas v
JOIN Clientes c ON v.id_cliente = c.id_cliente;

-- 2. Productos vendidos en una fecha
SELECT p.nombre_producto, dv.cantidad, v.fecha
FROM Detalle_Venta dv
JOIN Productos p ON dv.id_producto = p.id_producto
JOIN Ventas v ON dv.id_venta = v.id_venta
WHERE v.fecha = '2025-09-01';

-- 3. Top 5 productos más vendidos
SELECT p.nombre_producto, SUM(dv.cantidad) AS total_vendido
FROM Detalle_Venta dv
JOIN Productos p ON dv.id_producto = p.id_producto
GROUP BY p.nombre_producto
ORDER BY total_vendido DESC
LIMIT 5;

-- 4. Total de compras por cliente
SELECT c.nombre, c.apellido, SUM(v.total) AS total_compras
FROM Ventas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente;

-- 5. Proveedores y sus productos
SELECT pr.nombre_proveedor, p.nombre_producto
FROM Proveedores pr
JOIN Productos p ON pr.id_proveedor = p.id_proveedor;

-- 6. Ventas agrupadas por mes
SELECT MONTH(fecha) AS mes, SUM(total) AS total_mes
FROM Ventas
GROUP BY MONTH(fecha);

-- 7. Productos con stock bajo (menor a 50)
SELECT nombre_producto, stock
FROM Productos
WHERE stock < 50;

-- 8. Cliente con más compras
SELECT c.nombre, c.apellido, SUM(v.total) AS gasto
FROM Ventas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente
ORDER BY gasto DESC
LIMIT 1;

-- 9. Productos nunca vendidos
SELECT p.nombre_producto
FROM Productos p
LEFT JOIN Detalle_Venta dv ON p.id_producto = dv.id_producto
WHERE dv.id_producto IS NULL;

-- 10. Promedio de ventas por cliente (solo los que superan 10.000)
SELECT c.nombre, AVG(v.total) AS promedio
FROM Ventas v
JOIN Clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente
HAVING AVG(v.total) > 10000;
