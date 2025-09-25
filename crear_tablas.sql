-- CREAR TABLAS TIENDA FAMILIAR

CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proveedor VARCHAR(100) NOT NULL,
    nit VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20) UNIQUE,
    direccion VARCHAR(150),
    correo VARCHAR(100) UNIQUE
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    cedula VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20) UNIQUE,
    correo VARCHAR(100) UNIQUE,
    direccion VARCHAR(150)
);

CREATE TABLE Productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_proveedor INT NOT NULL,
    codigo_barras VARCHAR(30) UNIQUE,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    total DECIMAL(10,2),
    codigo_factura VARCHAR(30) UNIQUE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Detalle_Venta (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
    UNIQUE (id_venta, id_producto)
);
