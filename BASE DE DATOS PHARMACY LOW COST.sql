--PROYECTO FINAL BASE DE DATOS

---CREACIÓN DE BASE DE DATOS

CREATE DATABASE PHARMACYLOWCOST;

USE PHARMACYLOWCOST;

CREATE TABLE Empleado(
	ID_Empleado int primary key  not null,
	Nomb_Empleado varchar(40) not null,
	Apellido_Empleado varchar (40) not null,
    Direc_Empleado varchar(255)null,
    Puesto varchar(40) not null, 
    Edad varchar(2)null, 
    Cel int null,
	)
GO

CREATE TABLE Categoria(
	ID_Categoria int primary key not null,
	Nomb_Categoria varchar(255) null,
	Descripcion ntext  null,
)
GO
CREATE TABLE  Cliente(
    ID_Cliente int primary key not null,
    Nomb_Cliente varchar(255) not null,
    Direc_Cliente varchar(255)null,
    Celular int null,
    DNI int null,
   
)
GO
CREATE TABLE Proveedor( 
   ID_Proveedor int primary key not null,
   Nomb_Proveedor varchar(255)not null,
   Direc_Proveedor varchar(255)null,
   Tel varchar(7)null,
   RUC varchar(11) null,
) 
GO 
CREATE TABLE OrdenPedido(
	ID_OrdenPedido int primary key not null,
	ID_Empleado int null,
	ID_Cliente int not null,
	Nomb_Cliente varchar(255) not null,
	Fecha datetime not null,
    Tipo_pago varchar (40) null,
	foreign key (ID_Cliente) references  Cliente (ID_Cliente),
	foreign key (ID_Empleado) references Empleado (ID_Empleado),
	
)
GO
CREATE TABLE Producto( 
    ID_Producto int primary key not null,
	ID_Proveedor int not null,
	ID_Categoria int not null,
	Nomb_Producto varchar (255)not null,
	Stock int not null,
	PrecioCompra money null,
	PrecioVenta money null, 
	Fech_Vencim datetime not null,
	foreign key (ID_Categoria) references Categoria (ID_Categoria),
	foreign key (ID_Proveedor) references Proveedor (ID_Proveedor)
)
GO
CREATE TABLE DetalleOrdenPedido(	ID_OrdenPedido int  not null,	ID_Producto int  not null,	Nomb_Producto varchar (255)not null,	PrecioUnitario money null,	CantidadProducto int null,	Total money null,	CONSTRAINT "PK_DetalleOrdenPedido" PRIMARY KEY  CLUSTERED 	(		"ID_OrdenPedido",		"ID_Producto"	),	CONSTRAINT "FK_DetalleOrdenPedido_OrdenPedido" FOREIGN KEY 	(		"ID_OrdenPedido"	) REFERENCES "dbo"."OrdenPedido" (		"ID_OrdenPedido"	),	CONSTRAINT "FK_DetalleOrdenPedido_Producto" FOREIGN KEY 	(		"ID_Producto"	) REFERENCES "dbo"."Producto" (		"ID_Producto"	),	)
GO
SELECT  SUM(CantidadProducto) FROM DetalleOrdenPedidoGROUP BY CantidadProducto


INSERT INTO Empleado values ('0001', 'Luis','Mina','Av. La Paz 1388 San Miguel','Administrador','31','977893455')
INSERT INTO Empleado values ('0002', 'Carlos','Holguin','Av. Javier Prado 2460 San Isidro','Cajero','20','936567111')
INSERT INTO Empleado values ('0003', 'Daniel','Ishuiza','Av. Iquitos 187 La Victoria ','Supervisor','29','946744431')
INSERT INTO Empleado values ('0004', 'Raul','Cornejo','Av. Universitaria 2295 Pueblo Libre','Cajero','23','932451121')
INSERT INTO Empleado values ('0005', 'Liliana','Salas','Av. Iquitos 787 La Victoria','Administradora','32','993345121')
INSERT INTO Empleado values ('0006', 'Daniella','Flores','Av. Universitaria 2095 Pueblo Libre','Supervisora','29','910077645')
INSERT INTO Empleado values ('0007', 'Jenny','Sanchez','Av. La Paz 1098 San Miguel','Cajera','28','987667572')
INSERT INTO Empleado values ('0008', 'Victor','Perales','Av. Javier Prado 2880 San Isidro','Administrador','29','955303428')
INSERT INTO Empleado values ('0009', 'Mayra','Couto','Av. 28 de Julio 275 Cercado de Lima','Cajera','25','933452101')
INSERT INTO Empleado values ('0010', 'Ruth','Paredes','Av. Javier Prado 2060 San Isidro','Cajera','26','945673451')
INSERT INTO Empleado values ('0011', 'Christian','Gomez','Av. La Paz 1408 San Miguel','Cajero','23','934534431')
INSERT INTO Empleado values ('0012', 'Felipe','Bravo','Av. Iquitos 577 La Victoria','Supervisor','27','988461093')
INSERT INTO Empleado values ('0013', 'Jerson','Becker','Av. Santa Rosa 350 Santa Anita','Cajero','23','948573003')
INSERT INTO Empleado values ('0014', 'Raquel','Ruiz','Av. Javier Prado 2565 San Isidro','Administradora','27','934220091')
INSERT INTO Empleado values ('0015', 'Marcelo','Rosas','Av. Iquitos 387 La Victoria','Cajero','24','938635301')
select * from Empleado

INSERT INTO Categoria values ('6001','Infantil','productos para bebes')
INSERT INTO Categoria values ('6002','Higiene Corporal','productos de aseo personal')
INSERT INTO Categoria values ('6003','Dermocosmética','productos para la piel')
INSERT INTO Categoria values ('6004','Ortopedia Menor','Productos Ortopédicos')
INSERT INTO Categoria values ('6005','Dietéticos', 'productos dieteticos')
INSERT INTO Categoria values ('6006','Optica','Productos Oculares')
INSERT INTO Categoria values ('6007','Medicina Natural','Productos Herbarios')
INSERT INTO Categoria values ('6008','Productos Básicos','Productos de Primeros Auxilios')
INSERT INTO Categoria values ('6009','Aerosol','Productos en Spray')
INSERT INTO Categoria values ('6010','Equipo médico','Termometros, balanzas, prueba de embarazo')
INSERT INTO Categoria values ('6011','Jarabes','Productos liquidos')
INSERT INTO Categoria values ('6012','Embarazo','Productos para embarazadas')
INSERT INTO Categoria values ('6013','Farmaceutica solida ','medicamentos en forma solida')
INSERT INTO Categoria values ('6014','Ancianidad','Productos para la Adulto Mayor')
INSERT INTO Categoria values ('6015','Salud Sexual','Anticonceptivos y preservativos')
select * from Categoria;


INSERT INTO Cliente values ('1001', 'Oscar','Av. 28 de Julio 878','937894019','76019427')
INSERT INTO Cliente values ('1002', 'Joel','Av. Salaverry 801 Jesús María','956187345','74078956')
INSERT INTO Cliente values ('1003', 'Angie','Av. Arenales 1302 Jesús María','900400765','71904520')
INSERT INTO Cliente values ('1004', 'Sebastian','Av. El Olivar 741','901321409','73025669')
INSERT INTO Cliente values ('1005', 'Ian','Av. San Martin N° 270','918220088','72235909')
INSERT INTO Cliente values ('1006', 'Renzo','Av. Brasil N°515-519','907800209','75709905')
INSERT INTO Cliente values ('1007', 'Omar','Av. Miguel Angel N° 193A URB.FIORI','999005601','77908360')
INSERT INTO Cliente values ('1008', 'Juan Diego','Av. Santiago Wagner 2855','991657331','70293841')
INSERT INTO Cliente values ('1009', 'Christopher','Av. El Triunfo 774','919200760','78505595')
INSERT INTO Cliente values ('1010', 'Carlos','Av. Gonzales Prada 458-460','930007088','70026776')
INSERT INTO Cliente values ('1011', 'Gian','Av Independencia Cda 06 Ex Casa Campesino','940070740','74690007')
INSERT INTO Cliente values ('1012', 'Jhonathan','Av de la Poesia 160','955441768','70106665')
INSERT INTO Cliente values ('1013', 'Jorge','Av P. de la República 3361','977809075','79452120')
INSERT INTO Cliente values ('1014', 'Joaquin','Av. Paseo de la Republica','918370001','71708960')
INSERT INTO Cliente values ('1015', 'Mario','Av. San Martin 685 Pueblo Libre','913009978','777903378')
select * from Cliente



INSERT INTO Proveedor values ('2001','Quimica Suiza S.A.','Republica de Panama # 257','4586478','20511501857')
INSERT INTO Proveedor values ('2002','Quilab S.A.','Paseo Parodi #2456','6547891','28561501857')
INSERT INTO Proveedor values ('2003','AC Farma S.A.','Av. Nahuel Lozano # 87 Piso 9','4882514','20070111955')
INSERT INTO Proveedor values ('2004','DISTRIBUIDORA DROGUERIA SAGITARIO S.R.L.','Av. Paula De León # 23953','4898605','20072109590')
INSERT INTO Proveedor values ('2005','INSTITUTO QUIMIOTERAPICO S.A','Jr. Juan Martín Rodríquez # 50075','3005827','20098198614')
INSERT INTO Proveedor values ('2006','LABORATORIOS PORTUGAL S.R.L.','Av. Agustina Sotelo # 332 Piso 7','4575385','20088118676')
INSERT INTO Proveedor values ('2007','MEDIFARMA S.A.','Av. Fátima Sánchez # 3039 Piso 5','6270038','20095086466')
INSERT INTO Proveedor values ('2008','FARMINDUSTRIA S.A.','Av. Luana Tapia # 992 Piso 1','7241567','20077869727')
INSERT INTO Proveedor values ('2009','FARMACHIF S.R.L.','Jr. Juan David Godoy # 595','6792553','20078489142')
INSERT INTO Proveedor values ('2010','AK PHARMA','Av. Mariana Vaca # 847','2739376','20080166226')
INSERT INTO Proveedor values ('2011','ALARA PHARM','Urb. Juan Diego Contreras # 467','7636117','20095128804')
INSERT INTO Proveedor values ('2012','Alcon Universal','Av. María Manzanares # 50983','8885075','20097021310')
INSERT INTO Proveedor values ('2013','Universal BIO','Cl. Miguel Tafoya # 861 Piso 2','8885075','20069443389')
INSERT INTO Proveedor values ('2014','Umbrella SAC','Cl. Cristóbal Corrales # 075 Piso 51','8885075','20087285541')
INSERT INTO Proveedor values ('2015','VirusT SAC','Cl. Camilo Alaniz # 371','8885075','20091601244')
select * from Proveedor;


INSERT INTO OrdenPedido values ('201', '0001', '1001', 'Oscar', '20200310 8:00', 'efectivo')
INSERT INTO OrdenPedido values ('202', '0002', '1002', 'Joel', '20200310 9:30', 'efectivo')
INSERT INTO OrdenPedido values ('203', '0003', '1003', 'Angie', '20200310 10:20', 'efectivo')
INSERT INTO OrdenPedido values ('204', '0004', '1004', 'Sebastian', '20200312 12:25', 'tarjeta')
INSERT INTO OrdenPedido values ('205', '0005', '1005', 'Ian', '20200312 14:16', 'tarjeta')
INSERT INTO OrdenPedido values ('206', '0006', '1006', 'Renzo', '20200313 8:26', 'tarjeta')
INSERT INTO OrdenPedido values ('207', '0007', '1007', 'Omar', '20200314 9:45 ', 'tarjeta')
INSERT INTO OrdenPedido values ('208', '0008', '1008', 'Juan Diego', '20200314 10:12', 'tarjeta')
INSERT INTO OrdenPedido values ('209', '0009', '1009', 'Christopher', '20200314 11:06', 'tarjeta')
INSERT INTO OrdenPedido values ('210', '0010', '1010', 'Carlos', '20200320 8:15', 'efectivo')
INSERT INTO OrdenPedido values ('211', '0011', '1011', 'Gian', '20200320 9:57', 'efectivo')
INSERT INTO OrdenPedido values ('212', '0012', '1012', 'Jhonathan', '20200322 16:13', 'efectivo')
INSERT INTO OrdenPedido values ('213', '0013', '1013', 'Jorge', '20200322 17:30', 'tarjeta')
INSERT INTO OrdenPedido values ('214', '0014', '1014', 'Joaquin', '20200323 19:18', 'tarjeta')
INSERT INTO OrdenPedido values ('215', '0015', '1015', 'Mario', '20200325 22:05', 'efectivo')
select * from OrdenPedido

INSERT INTO Producto VALUES ('3001','2001','6001','Pañales Pampers XXG','100','40.90','45.90','07-05-2022')
INSERT INTO Producto VALUES ('3002','2001','6002','Shampoo Risos definidos','260','13.90','15.90','05-06-2022')
INSERT INTO Producto VALUES ('3003','2003','6003','Facial puntos negros','340','15.90','19.90','01-01-2022')
INSERT INTO Producto VALUES ('3004','2009','6011','Jarabe Ibuprofeno','330','4.00','5.00','02-01-2022')
INSERT INTO Producto VALUES ('3005','2006','6005','Stevia','490','11.40','13.40','02-06-2022')
INSERT INTO Producto VALUES ('3006','2006','6006','Gotas Floril','105','7.90','9.90','07-15-2022')
INSERT INTO Producto VALUES ('3007','2007','6009','Nutrasul Propóleo Spray','185','13.00','15.00','02-14-2022')
INSERT INTO Producto VALUES ('3008','2008','6008','Algodon 5M','195','10.20','12.20','07-15-2025')
INSERT INTO Producto VALUES ('3009','2009','6011','Jarabe Bismutol','160','15.00','17.00','03-01-2022')
INSERT INTO Producto VALUES ('3010','2010','6010','Termometro digital','145','90.00','95.00','')
INSERT INTO Producto VALUES ('3011','2011','6013','Clorfenamina blister 75ml','300','1.00','2.00','10-20-2023')
INSERT INTO Producto VALUES ('3012','2001','6012','Gestasure Leche','210','44.50','48.50','11-25-2023')
INSERT INTO Producto VALUES ('3013','2004','6013','Amoxicilina blister 500mg','300','1.50','2.50','07-07-2023')
INSERT INTO Producto VALUES ('3014','2004','6013','Paracetamol blister 500mg','400','1.60','2.60','12-18-2023')
INSERT INTO Producto VALUES ('3015','2006','6015','Durex','150','8.90','9.90','08-16-2023')
select*from Producto


insert into DetalleOrdenPedido values ('201','3001','Pañales Pampers XXG','45.90','3','137.70')
insert into DetalleOrdenPedido values ('202','3002','Shampoo Risos definidos','15.90','2','31.80')
insert into DetalleOrdenPedido values ('203','3003','Facial puntos negros','19.90','1','19.90')
insert into DetalleOrdenPedido values ('204','3004','Jarabe Ibuprofeno','5.00','2','10.00')
insert into DetalleOrdenPedido values ('205','3005','Stevia','13.40','4','53.60')
insert into DetalleOrdenPedido values ('206','3006','Gotas Floril','9.90','5','49.50')
insert into DetalleOrdenPedido values ('207','3007','Nutrasul Propóleo Spray','15.00','2','30.00')
insert into DetalleOrdenPedido values ('208','3008','Algodon 5M','12.20','10','122.00')
insert into DetalleOrdenPedido values ('209','3009','Jarabe Bismutol','17.00','4','68.00')
insert into DetalleOrdenPedido values ('210','3010','Termometro digital','95.00','1','95.00')
insert into DetalleOrdenPedido values ('211','3011','Clorfenamina blister 75ml','2.00','10','20.00')
insert into DetalleOrdenPedido values ('212','3012','Gestasure Leche','48.50','2','97.00')
insert into DetalleOrdenPedido values ('213','3013','Amoxicilina blister 500mg','2.50','10','25.00')
insert into DetalleOrdenPedido values ('214','3014','Paracetamol blister 500mg','2.60','10','26.00')
insert into DetalleOrdenPedido values ('215','3015','Durex','9.90','2','19.80')
select*from DetalleOrdenPedido

------CONSULTAS AVANZADAS-----------
USE PHARMACYLOWCOST

---PRIMERA CONSULTA
--Mostrar la cantidad de empleados que vendieron la medicina 
--Paracetamol 500 mg, el stock actual y el nombre de la categoria sobre la medicina.

SELECT COUNT(*) AS CantidadEmpleados,p.Nomb_Producto ,p.Stock, c.Nomb_Categoria  FROM Empleado e
JOIN OrdenPedido op ON e.ID_Empleado = op.ID_Empleado
JOIN DetalleOrdenPedido dop ON dop.ID_OrdenPedido = op.ID_OrdenPedido
JOIN Producto p ON p.ID_Producto = dop.ID_Producto
JOIN Categoria c ON c.ID_Categoria = p.ID_Categoria
WHERE dop.Nomb_Producto LIKE 'Paracetamol%'
GROUP BY p.Nomb_Producto ,p.Stock, c.Nomb_Categoria

--SEGUNDA CONSULTA
--Mostrar las medicinas que empienzen con la letra "P" con sus respectivo proveedor, 
--precio compra y fecha de vencimiento.

SELECT ID_Producto, Nomb_Producto, pr.Nomb_Proveedor, c.Nomb_Categoria, p.Fech_Vencim, PrecioCompra FROM Producto p
JOIN Proveedor pr ON p.ID_Proveedor = pr.ID_Proveedor
JOIN Categoria c ON p.ID_Categoria = c.ID_Categoria
WHERE Nomb_Producto LIKE 'P%'
GROUP BY ID_Producto, Nomb_Producto, pr.Nomb_Proveedor, c.Nomb_Categoria, p.Fech_Vencim, PrecioCompra

-- TERCERA CONSULTA
-- Mostrar todos los productos de la categoria "6013", el nombre del cliente que lo compro junto con la fecha.

SELECT p.Nomb_Producto, c.ID_Categoria , cl.Nomb_Cliente, Fecha  FROM DetalleOrdenPedido dop
JOIN OrdenPedido op ON op.ID_OrdenPedido = dop.ID_OrdenPedido
JOIN Producto p ON dop.ID_Producto = p.ID_Producto
JOIN Categoria c ON p.ID_Categoria = c.ID_Categoria
JOIN Cliente cl ON op.ID_Cliente = cl.ID_Cliente
WHERE c.ID_Categoria LIKE '6013'
GROUP BY p.Nomb_Producto, c.ID_Categoria , cl.Nomb_Cliente, Fecha


--CUARTA CONSULTA
--Mostrar el pago total de los clientes que sean mayores a 50 soles, el stock actual y el que queda, --el nombre del producto, la empresa proveedora, la dirección a la que se envia el medicamento.

SELECT dop.Total, p.Stock, (p.Stock - dop.CantidadProducto) AS NuevoStock, p.Nomb_Producto, pr.Nomb_Proveedor, cl.Direc_Cliente FROM DetalleOrdenPedido dop
JOIN Producto p ON dop.ID_Producto = p.ID_Producto
JOIN Proveedor pr ON p.ID_Proveedor = pr.ID_Proveedor
JOIN OrdenPedido op ON dop.ID_OrdenPedido = op.ID_OrdenPedido
JOIN Cliente cl ON op.ID_Cliente = cl.ID_Cliente
WHERE dop.Total > 50
GROUP BY dop.Total, p.Stock, (p.Stock - dop.CantidadProducto), p.Nomb_Producto, pr.Nomb_Proveedor, cl.Direc_Cliente


--QUINTA CONSULTA
--Mostrar los nombres de los empleados que tengan el puesto de cajero o cajera que hallan 
--realizado una venta de tipo efectivo mayor a 20 soles en el mes de marzo.

SELECT e.Nomb_Empleado, e.Puesto, op.Tipo_pago, dop.Total, op.Fecha FROM Empleado e
JOIN OrdenPedido op ON e.ID_Empleado = op.ID_Empleado
JOIN DetalleOrdenPedido dop ON op.ID_OrdenPedido = dop.ID_OrdenPedido
WHERE e.Puesto LIKE 'Cajer%'
AND op.Tipo_pago LIKE 'efectivo'
AND dop.Total > 20
AND MONTH(op.Fecha) = 03
GROUP BY e.Nomb_Empleado, e.Puesto, op.Tipo_pago, dop.Total, op.Fecha

-----------VISTAS-------------------
USE PHARMACYLOWCOST

--productos de cuidado:
create view producto_cuidado
as
select p.Nomb_Producto, c.Nomb_Categoria, c.Descripcion
from Producto p join Categoria c on (p.ID_Categoria = c.ID_Categoria)
where c.ID_Categoria in (6002,6003,6006,6011,6012,6015);

select *
from producto_cuidado

--proveedores de productos de cuidado:
create view proveedor_cuidado
as
select p.Nomb_Proveedor,p.Direc_Proveedor,p.Tel,p.RUC
from Proveedor p join Producto r on (p.ID_Proveedor = r.ID_Proveedor)
				 join Categoria c on (r.ID_Categoria = c.ID_Categoria)
where c.ID_Categoria in (6002,6003,6006,6011,6012,6015);

select *
from proveedor_cuidado

--clientes con pagos mayores a 100:
create view pagos_mayor
as
select c.*
from Cliente c join OrdenPedido o on (c.ID_Cliente = o.ID_Cliente)
			   join DetalleOrdenPedido d on (o.ID_OrdenPedido = d.ID_OrdenPedido)
where d.Total >=100;

select *
from pagos_mayor


----------STORE PROCEDURE----------
use PHARMACYLOWCOST

-- Procedure filtrando segun "id" de OrdenPedido y Producto----

create procedure OrdenProduct(
@id_OrdenPedido int,
@id_Producto int
)as
begin
select*from DetalleOrdenPedido
where @id_OrdenPedido=ID_OrdenPedido
and @id_Producto=ID_Producto; end;

exec OrdenProduct '211','3011';


-- Procedure filtrando según "id" de OrdenPedido, Empleado y Cliente----

create procedure OrdenEmployClient(
@id_OrdenPedido int,
@id_Empleado int,
@id_Cliente int
)as
begin
select*from OrdenPedido
where @id_OrdenPedido=ID_OrdenPedido
and @id_Empleado=ID_Empleado
and @id_Cliente=ID_Cliente; end;

exec OrdenEmployClient '201','1','1001';

---------FUNCIONES----------
USE PHARMACYLOWCOST

--PRIMERA FUNCIÓN
--Filtrar la lista de los empleados dependiendo de su puesto de trabajo ya sea (cajero, administrador.....)
CREATE FUNCTION dbo.PuestoEmpleado(
@Puesto AS varchar(100)
)Returns Table
AS 
Return (
Select Puesto, Nomb_Empleado FROM Empleado
WHERE Puesto = @Puesto
)

SELECT * FROM dbo.PuestoEmpleado ('Cajero')

--SEGUNDA FUNCIÓN----------------
--Filtrar la lista de productos mediante el ID del producto-- y que muestre el nombre del producto,nombre de la empresa proveedora y categoria.
Create FUNCTION dbo.ProducEmpre(
@ID_Producto AS int
)Returns table
AS
Return(
Select p.ID_Producto ,p.Nomb_Producto, pr.Nomb_Proveedor,c.Nomb_Categoria FROM Producto p
JOIN Proveedor pr ON p.ID_Proveedor = pr.ID_Proveedor
JOIN Categoria c ON c.ID_Categoria = p.ID_Categoria
WHERE p.ID_Producto = @ID_Producto
)
SELECT * FROM dbo.ProducEmpre ('3001')

--TERCERA FUNCIÓN
--Filtrar las cantidades de ordenes de segun el codigo de cada cliente.
CREATE FUNCTION dbo.CantOrdenes(
@ID_Cliente AS int
)Returns int
AS
BEGIN
DECLARE @total int;
SELECT @total = COUNT (*) FROM OrdenPedido 
WHERE @ID_Cliente = ID_Cliente;
Return @total;
END;
SELECT dbo.CantOrdenes ('1008') AS 'Cantidad'
DROP FUNCTION dbo.CantOrdenes

--CUARTA FUNCIÓN
-- Filtrar el importe total máximo de cada detalle orden de pedido segun su codigo de cada orden de pedido.
CREATE FUNCTION dbo.TotalMasAlto(
@ID_OrdenPedido as money
)Returns money
as
begin 
declare @Maxprecio money;
SELECT @Maxprecio = MAX(Total) from DetalleOrdenPedido
where  @ID_OrdenPedido = ID_OrdenPedido;
return @Maxprecio;
end;

SELECT dbo.TotalMasAlto ('212') AS 'Total Maximo'

