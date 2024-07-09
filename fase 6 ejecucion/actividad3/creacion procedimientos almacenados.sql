
DELIMITER $$
CREATE PROCEDURE `crear_bd_laboratorioSQL` ()
BEGIN
create database IF NOT EXISTs laboratorioSQL;
END $$


USE `laboratoriosql`;
DROP procedure IF EXISTS `crear_tablas_laboratorio`;

DELIMITER $$
USE `laboratoriosql`$$
CREATE PROCEDURE `crear_tablas` ()
BEGIN
 CREATE TABLE IF NOT EXISTs  Cliente(
	id_cli INT NOT NULL,
    nom_cli VARCHAR (30),
    ape_cli VARCHAR (30),
    dir_cli VARCHAR(100),
    dep_cli VARCHAR(20),
    mes_cum_cli VARCHAR(10),
    PRIMARY KEY(id_cli));
    
    CREATE TABLE IF NOT EXISTs Articulo(
	id_art INT NOT NULL,
	tit_art varchar(100),
	aut_art varchar(100),
	edi_art varchar(300),
	prec_art int,
	primary key (id_art));

CREATE TABLE IF NOT EXISTs Pedido(
	id_ped INT NOT NULL,
	id_cli_ped int(11),
	fec_ped date,
	val_ped int,
	primary key (id_ped),
	foreign key (id_cli_ped) REFERENCES Cliente(id_cli));

CREATE TABLE IF NOT EXISTs Compania(
	comnit varchar(11),
	comnombre varchar(30),
	comanofun int,
	comreplegal varchar(100),
	primary key(comnit));
    
CREATE TABLE IF NOT EXISTs articuloxpedido(
	id_ped_artped int,
	id_art_artped int,
	can_art_artped int,
	val_ven_art_artped int,
	foreign key (id_ped_artped) references Pedido(id_ped),
	foreign key (id_art_artped) references Articulo(id_art));
    
END$$

USE `laboratoriosql`;
DROP procedure IF EXISTS `crear_tablas_laboratorio`;

DELIMITER $$
USE `laboratoriosql`$$
CREATE PROCEDURE `poblar_tablas` ()
BEGIN

insert ignore into Cliente(
	id_cli,
    nom_cli,
    ape_cli,
    dir_cli,
    dep_cli,
    mes_cum_cli)
    values	(63502718,'Maritza','Rojas','Calle 34 No.14-45','Santander','Abril'),
			(13890234,'Roger','Ariza','Cra 30 No 13-45','Antioquia','Junio'),
            (77191956, 'Juan Carlos', 'Arenas', 'Diagonal 23 No 12-34 apto 101', 'Valle', 'Marzo'),
            (1098765789, 'Catalina','Zapata','Av.El Libertador No.30-14','Cauca','Marzo');

insert ignore into Articulo(
	id_art,
    tit_art,
    aut_art,
    edi_art,
    prec_art
    )
    values	(1, 'Redes Cisco', 'Ernesto Arigasello','Alfaomega-Rama',60000),
			(2, 'Facebook y Twitter para adultos','Valoso Claudio','Alfaomega',52000),
            (3, 'Creacion de un portal con php y MySQL', 'Jacob Pavon Puertas','Alfaomega-Rama',40000),
            (4, 'Administracion de sistemas operativos', 'Julio Gomez Lopez','Alfaomega-Rama',55000);
    
    insert ignore into Pedido(
    id_ped,
    id_cli_ped,
    fec_ped,
    val_ped
    )
    values	(1,63502718, STR_TO_DATE('25-02-2020','%d-%m-%Y'),120000),
			(2, 77191956, STR_TO_DATE('30-04-2022','%d-%m-%Y'),55000),
            (3,63502718, STR_TO_DATE('10-12-2021','%d-%m-%Y'), 260000),
            (4, 1098765789, STR_TO_DATE('25-02-2020','%d-%m-%Y'),1800000);
    
    insert ignore  into articuloxpedido(
			id_ped_artped,
            id_art_artped,
            can_art_artped, 
            val_ven_art_artped
            )
    values 	(1,3,5,40000),
			(1,4,12,55000),
            (2,1,5,65000),
            (3,2,10,55000),
            (3,3,12,45000),
            (4,1,20,65000);
    
    insert ignore into compania(
			comnit,
            comnombre,
            comanofun,
            comreplegal
            )
    values	(800890890-2,'Seguros Atlantida',2020, 'Carlos Lopez'),
			(899999999-1,'Aseguradora Rojas',2021,'Luis Fernando Rojas'),
            (899999999-5,'Seguros del Estado',2022,'Maria Margarita Perez');
END$$

/*Visualizar el nombre, apellido y dirección de todos aquellos clientes que hayan realizado un pedido el día 25/02/2020.*/
DELIMITER $$
USE `laboratoriosql`;
CREATE PROCEDURE `mostrar_clientes`()
BEGIN
SELECT nom_cli as nombre, ape_cli as apellido, dir_cli as direccion 
FROM laboratoriosql.pedido
INNER JOIN cliente as cli ON pedido.id_cli_ped = cli.id_cli
WHERE fec_ped = '2020-02-25';
END $$

/*Listar todos los pedidos realizados incluyendo el nombre del artículo.*/
DELIMITER $$
USE `laboratoriosql`;$$
CREATE PROCEDURE `listar_compras`()
BEGIN
SELECT can_art_artped as cantidad_articulo, val_ven_art_artped as valor_unitario, val_ped as valor_total_pedido,tit_art as titulo, nom_cli as nombre
FROM articuloxpedido
INNER JOIN articulo AS art ON id_art_artped = art.id_art
INNER JOIN pedido as ped ON id_art_artped = ped.id_ped
inner JOIN cliente as cli ON ped.id_cli_ped = cli.id_cli;
END $$

/*Mostrar los pedidos con los respectivos artículos (código, nombre, valor y cantidad pedida).*/
DELIMITER $$
USE `laboratoriosql`;$$
CREATE PROCEDURE `listar_pedidos`()
BEGIN
SELECT id_ped as codigo,tit_art as titulo, val_ven_art_artped as valor_unitario, can_art_artped as cantidad
FROM articuloxpedido
INNER JOIN articulo AS art ON id_art_artped = art.id_art
INNER JOIN pedido as ped ON id_art_artped = ped.id_ped
inner JOIN cliente as cli ON ped.id_cli_ped = cli.id_cli;
END $$

/*Visualizar los datos de las empresas fundadas entre el año 2020 y 2021.*/
DELIMITER $$
USE `laboratoriosql`;$$
CREATE PROCEDURE `listar_companias`()
BEGIN
SELECT * 
FROM laboratoriosql.compania
WHERE comanofun between 2020 and 2021;
END $$


/*Visualizar todos los clientes organizados por apellido.*/
DELIMITER $$
USE `laboratoriosql`;
CREATE PROCEDURE `listar_clientes_apellido`()
SELECT *
FROM cliente
ORDER BY ape_cli ASC;
END $$

DELIMITER $$
create function mostrar_cantidad()
returns varchar(100)
deterministic
begin
declare result varchar(100);
set result = (select concat(count(tit_art) ,' ', edi_art) as cantidad_editorial
FROM articulo
GROUP BY edi_art);
return result;
END$$


