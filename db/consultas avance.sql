/*--------------------------------------------------------------------------------------*/
/*Consultas - Daniel Alcca Saldivar*/

/*1 Muestre todos los productos con sus respectivos proveedores*/

/*2 Muestre el codigo,nombre,precio de productos mayores a 100*/
select cod_pro,descrip_pro,precio_pro from productos
where precio_pro > 100;

/*3 Muestre la cantidad de productos en stock*/
select sum(stock_pro) AS cantidad_productos_stock from productos
where stock_pro;

/*4 muestre el precio total de todos los productos*/
select sum(precio_pro) AS preciototal_productos from productos
where precio_pro;

/*5 Muestre los productos menores al promedio*/

/*6 muestre los productos mas varatos segun codigo de proveedor*/
select cod_pro, descrip_pro, min(precio_pro) AS precio_minimo from productos;

/*7 muestre los productos mas caros ordenados ascendente*/
select cod_pro, descrip_pro, precio_pro As productos_caros from productos
order by precio_pro ASC;

/*8 muestre los proveedores con mas productos registrados*/


/*9 muestre el promedio total de los productos*/
select AVG (precio_pro) AS PromedioTotalPro from productos
where precio_pro;

/*10 muestre el nombre de los proveedores cuyos productos sean mayor e igual a 150*/


/*--------------------------------------------------------------------------------------*/
/*Consultas - Gustavo*/

/*Muestre el detalle de la boleta emitida.*/
select d.id_detalle_c,d.id_comprobante,d.cod_pro,cantidad,d.pre_unit,d.pre_total from detalle_comprobante as d inner join comprobante as co 
on d.id_comprobante = co.idcomprobante and co.idcomprobante = 'C000000001';

/*Muestre el usuario (Trabajador) que emitió la boleta.*/
select v.cod_ven,v.nom_ven,v.ape_ven,v.dni_ven,dir_ven  from vendedor v where v.cod_ven in (select com.cod_ven from comprobante com where com.cod_ven = v.cod_ven and  com.idcomprobante = 'C000000001');

/*Muestre todas las ventas realizadas según el código de usuario.*/
select co.idcomprobante,co.cod_cli,co.cod_ven,tipo,co.serie,co.correlativo,co.total from comprobante co
where co.est_com = 'a' and co.cod_ven in (select v.cod_ven from vendedor v where v.cod_ven = co.cod_ven and v.cod_ven = 'VE0001');

/*Muestre el código, nombre, apellidos junto con el importe total de sus ventas realizadas (Factura o boleta).*/
select v.cod_ven,v.nom_ven,v.ape_ven,SUM(cp.total) as total_ventas from vendedor v inner join comprobante cp on
v.cod_ven = cp.cod_ven and cp.tipo = 'F' and cp.cod_ven = 'VE0001' and cp.est_com = 'a';

/*Elimine un comprobante y posteriormente muestre todos los comprobantes eliminados.*/
select * from comprobante where est_com = 'd';


/*--------------------------------------------------------------------------------------*/
/*Consultas - Daniel Cari*/
/*11 Muestre todos los clientes que hicieron compras con boleta*/
select cliente.cod_cli,cliente.nom_cli,cliente.apel_cli,cliente.dni_cli,comprobante.tipo 
from cliente,  comprobante where cliente.cod_cli=comprobante.cod_cli

select cliente.cod_cli,cliente.nom_cli,cliente.apel_cli,cliente.dni_cli,comprobante.tipo,comprobante.serie
from cliente inner join  comprobante on cliente.cod_cli = comprobante.cod_cli where comprobante.tipo='B'

/*12 Muestre todos los clientes que hicieron compras con factura*/
select cliente.cod_cli,cliente.nom_cli,cliente.apel_cli,cliente.dni_cli,comprobante.tipo,comprobante.serie
from cliente inner join  comprobante on cliente.cod_cli = comprobante.cod_cli where comprobante.tipo='F'

/*13 Muestre los clientes que hicieron compras*/
select cliente.cod_cli,cliente.nom_cli,cliente.apel_cli,cliente.dni_cli,comprobante.tipo 
from cliente,  comprobante where cliente.cod_cli=comprobante.cod_cli 

/*14 Muestre los clientes registrados que no realizaron compras*/
select cliente.cod_cli,cliente.nom_cli,cliente.apel_cli,cliente.dni_cli,comprobante.tipo 
from cliente,  comprobante where

/*END*/