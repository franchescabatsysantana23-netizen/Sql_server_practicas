drop table producto;
drop table cliente;
drop table empleados;

-- drop database TechSalesDB;
create database TechSalesDB;
use TechSalesDB;
create table producto(
ID_Producto int primary key, 
Nombre varchar(30),
Precio float(7),
Stock int, 
Categoria varchar(30));
select * from producto;


INSERT INTO producto (ID_Producto, Nombre, Precio, Stock, Categoria) VALUES
(1, 'Laptop Lenovo', 850.50, 15, 'Tecnologia'),
(2, 'Mouse Logitech', 25.99, 50, 'Tecnologia'),
(3, 'Teclado Mecanico', 70.00, 30, 'Tecnologia'),
(4, 'Monitor Samsung 24', 210.75, 20, 'Tecnologia'),
(5, 'Silla de Oficina', 150.00, 10, 'Muebles'),
(6, 'Escritorio de Madera', 320.40, 5, 'Muebles'),
(7, 'Cuaderno Universitario', 3.50, 200, 'Papeleria'),
(8, 'Boligrafo Azul', 1.20, 500, 'Papeleria'),
(9, 'Mochila Escolar', 45.99, 25, 'Accesorios'),
(10, 'Calculadora Cientifica', 28.60, 40, 'Papeleria');



create table cliente (
ID_Cliente int primary key, 
Nombre varchar(30), 
Email varchar(50),
Ciudad varchar (50));

INSERT INTO cliente (ID_Cliente, Nombre, Email, Ciudad) VALUES
(1, 'Juan Perez', 'juan.perez@gmail.com', 'Santiago'),
(2, 'Maria Lopez', 'maria.lopez@gmail.com', 'Santo Domingo'),
(3, 'Carlos Ramirez', 'carlos.ramirez@gmail.com', 'La Vega'),
(4, 'Ana Martinez', 'ana.martinez@gmail.com', 'Puerto Plata'),
(5, 'Luis Fernandez', 'luis.fernandez@gmail.com', 'Santiago'),
(6, 'Sofia Torres', 'sofia.torres@gmail.com', 'San Cristobal'),
(7, 'Pedro Gonzalez', 'pedro.gonzalez@gmail.com', 'Moca'),
(8, 'Laura Diaz', 'laura.diaz@gmail.com', 'La Romana'),
(9, 'Miguel Santos', 'miguel.santos@gmail.com', 'Higuey'),
(10, 'Elena Vargas', 'elena.vargas@gmail.com', 'Santo Domingo');

create table empleados(
ID_Empleado int primary key,
Nombre varchar(50),
Cargo varchar(50),
Fecha_Contratacion varchar(50));

INSERT INTO empleados (ID_Empleado, Nombre, Cargo, Fecha_Contratacion) VALUES
(1, 'Juan Perez', 'Desarrollador Backend', '2021-03-15'),
(2, 'Maria Lopez', 'Analista de Datos', '2020-07-10'),
(3, 'Carlos Ramirez', 'Administrador de Base de Datos', '2019-11-25'),
(4, 'Ana Martinez', 'Desarrolladora Frontend', '2022-01-18'),
(5, 'Luis Fernandez', 'Ingeniero DevOps', '2021-09-05'),
(6, 'Sofia Torres', 'Project Manager', '2018-06-12'),
(7, 'Pedro Gonzalez', 'QA Tester', '2023-02-20'),
(8, 'Laura Diaz', 'Diseñadora UX/UI', '2020-12-03'),
(9, 'Miguel Santos', 'Arquitecto de Software', '2017-08-30'),
(10, 'Elena Vargas', 'Soporte Tecnico', '2022-05-14');

select * from cliente;

select * from empleados;

select * from producto;