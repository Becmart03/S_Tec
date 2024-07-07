create database laboratorioSQL
use laboratorioSQL
CREATE TABLE Cliente(
	id_cli INT NOT NULL,
    nom_cli VARCHAR (30),
    ape_cli VARCHAR (30),
    dir_cli VARCHAR(100),
    dep_cli VARCHAR(20),
    mes_cum_cli VARCHAR(10),
    PRIMARY KEY(id_cli));

CREATE TABLE Articulo(
	id_art INT NOT NULL,
	tit_art varchar(100),
	aut_art varchar(100),
	edi_art varchar(300),
	prec_art int,
	primary key (id_art)
);

CREATE TABLE Pedido(
	id_ped INT NOT NULL,
	id_cli_ped int(11),
	fec_ped date,
	val_ped int,
	primary key (id_ped),
	foreign key (id_cli_ped) REFERENCES Cliente(id_cli)
);

CREATE TABLE Compania(
	comnit varchar(11),
	comnombre varchar(30),
	comanofun int,
	comreplegal varchar(100),
	primary key(comnit)
);

CREATE TABLE articuloxpedido(
	id_ped_artped int,
	id_art_artped int,
	can_art_artped int,
	val_ven_art_artped int,
	foreign key (id_ped_artped) references Pedido(id_ped),
	foreign key (id_art_artped) references Articulo(id_art)
);

insert into Cliente(
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
            
insert into Articulo(
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
    
    
    
    insert into Pedido(
    id_ped,
    id_cli_ped,
    fec_ped,
    val_ped
    )
    values	(1,63502718, STR_TO_DATE('25-02-2020','%d-%m-%Y'),120000),
			(2, 77191956, STR_TO_DATE('30-04-2022','%d-%m-%Y'),55000),
            (3,63502718, STR_TO_DATE('10-12-2021','%d-%m-%Y'), 260000),
            (4, 1098765789, STR_TO_DATE('25-02-2020','%d-%m-%Y'),1800000)
    ;
    
    insert into articuloxpedido(
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
    
    insert into compania(
			comnit,
            comnombre,
            comanofun,
            comreplegal
            )
    values	(800890890-2,'Seguros Atlantida',2020, 'Carlos Lopez'),
			(899999999-1,'Aseguradora Rojas',2021,'Luis Fernando Rojas'),
            (899999999-5,'Seguros del Estado',2022,'Maria Margarita Perez');
    
/*Listar todos los pedidos realizados incluyendo el nombre del artículo.*/
SELECT id_ped_artped, tit_art,id_art_artped, can_art_artped, val_ven_art_artped
FROM laboratoriosql.articuloxpedido
INNER JOIN articulo ON articuloxpedido.id_ped_artped= articulo.id_art;

/*
Visualizar los datos del pedido 1, incluyendo el nombre del cliente, la dirección del mismo, 
el nombre y el valor de los artículos que tiene dicho pedido.
*/
SELECT  nom_cli as nombre_cliente, dir_cli as direccion_cliente,tit_art as nombre_articulos,  val_ven_art_artped as valor_articulos
FROM laboratoriosql.articuloxpedido
JOIN pedido ON id_ped_artped = pedido.id_ped
JOIN cliente as C ON pedido.id_cli_ped = C.id_cli
join articulo as a ON articuloxpedido.id_art_artped = a.id_art
WHERE  id_ped_artped= 1
;


/*seleccionar los clientes que cumplean anos en marzo*/    
SELECT *
FROM cliente
WHERE mes_cum_cli = 'Marzo'

/*Visualizar el nombre del cliente, la fecha y el valor del pedido más costoso
*/
SELECT nom_cli,fec_ped,val_ped
FROM laboratoriosql.pedido
INNER JOIN cliente ON cliente.id_cli = id_cli_ped
JOIN (SELECT max(val_ped) as maximo FROM pedido) as max on pedido.val_ped = maximo;

/*
Mostrar cuantos artículos se tienen de cada editorial.*/
SELECT count(tit_art), edi_art 
FROM laboratoriosql.articulo
GROUP BY edi_art;

/*
Mostrar los pedidos con los respectivos artículos (código, nombre, valor y cantidad pedida).*/
SELECT id_art AS codigo, tit_art as nombre, val_ven_art_artped as valor_unidad, can_art_artped as Cantidad 
FROM laboratoriosql.articuloxpedido
JOIN articulo on id_art_artped = articulo.id_art
;
/*Visualizar todos los clientes organizados por apellido.*/
Select *
FROM cliente
ORDER BY ape_cli ASC;

/*Visualizar todos los clientes organizados por apellido.*/
SELECT * 
FROM laboratoriosql.articulo
ORDER BY aut_art ASC;

/*Visualizar los pedidos que se han realizado para el articulo con id 2, 
el listado debe mostrar el nombre y dirección del cliente, el respectivo número de pedido y la cantidad solicitada*/
SELECT nom_cli, ape_cli, dir_cli, id_ped_artped, can_art_artped 
FROM laboratoriosql.articuloxpedido
JOIN pedido ON id_ped_artped = pedido.id_ped
JOIN cliente as C ON pedido.id_cli_ped = C.id_cli
WHERE id_art_artped = 2
;

/*
Visualizar los datos de las empresas fundadas entre el año 2020 y 2021.
*/
SELECT * 
FROM laboratoriosql.compania
WHERE comanofun between 2020 and 2021;
