insert into `x071vm20_siig`.`itemmenu`
values(57,"Reporte Estado General de Guías",null,"/reportes.do?metodo=cargarReporteGuias&tipoGuia=EstadoGralGuias",38);

insert into `x071vm20_siig`.`rol_item`
values(2,57)

insert into `x071vm20_siig`.`canonmarcasenial`
values(3,250,'Alta-Marca');

insert into `x071vm20_siig`.`canonmarcasenial`
values(4,250,'Alta-Señal');

insert into `x071vm20_siig`.`canonmarcasenial`
values(5,250,'Renovación-Marca');

insert into `x071vm20_siig`.`canonmarcasenial`
values(6,250,'Renovación-Marca');

ALTER TABLE `x071vm20_siig`.`guia` 
ADD COLUMN `agenteFirmante_fk` BIGINT(20) NULL;

ALTER TABLE `x071vm20_siig`.`entidad` 
ADD COLUMN `nroExpediente` VARCHAR(255) NULL;

ALTER TABLE `x071vm20_siig`.`senial` 
CHANGE COLUMN `imagen` `imagen` MEDIUMBLOB NULL DEFAULT NULL ;

ALTER TABLE `x071vm20_siig`.`marca` 
CHANGE COLUMN `imagen` `imagen` MEDIUMBLOB NULL DEFAULT NULL ;

ALTER TABLE `x071vm20_siig`.`autorizacion` 
ADD COLUMN `observacion` VARCHAR(500) NULL AFTER `autorizado_fk`;

ALTER TABLE `x071vm20_siig`.`Denuncia` 
ADD COLUMN `observaciones` VARCHAR(255) DEFAULT NULL;

ALTER TABLE `x071vm20_siig`.`Denuncia` 
ADD COLUMN `tipoDeDenuncia` VARCHAR(255) DEFAULT NULL;

UPDATE `x071vm20_siig`.`Denuncia`
SET `tipoDeDenuncia` = "PERROS"
WHERE id>0;

CREATE TABLE `x071vm20_siig`.`Robo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `denuncia_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK26F36A7E6C07D8` (`denuncia_fk`),
  CONSTRAINT `FK26F36A7E6C07D8` FOREIGN KEY (`denuncia_fk`) REFERENCES `denuncia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

ALTER TABLE `x071vm20_siig`.`boletadeposito` 
ADD COLUMN `fechaGeneracion` DATETIME NOT NULL;

ALTER TABLE `x071vm20_siig`.`boletadeposito` 
ADD COLUMN `debitoGeneradoPorPagoAtrasado` double NOT NULL;

ALTER TABLE `x071vm20_siig`.`boletadeposito` 
ADD COLUMN `creditoGeneradoPorPagoAdelantado` double NOT NULL;

ALTER TABLE `x071vm20_siig`.`boletadeposito` 
ADD COLUMN `debitoCreditoUsado` double NOT NULL;

ALTER TABLE `x071vm20_siig`.`boletadeposito` 
ADD COLUMN `tipoBoleta` VARCHAR(255) NULL;

ALTER TABLE `x071vm20_siig`.`entidad` 
ADD COLUMN `saldoCuentaCorriente` double NOT NULL;

UPDATE `x071vm20_siig`.`itemmenu` 
SET `url`='/boletaDeposito.do?metodo=cargarRegistrarPagoBoletas&urlDetalle=recuperarBoletasParaRegistracionPago' 
WHERE `item`='Registrar Pago Boletas';



/*MENU CONSULTAS*/
SET SQL_SAFE_UPDATES=0;
update `x071vm20_siig`.`itemmenu`
set orden = orden * 10 
where orden is not null; 


INSERT INTO `x071vm20_siig`.`itemmenu` (`id`, `item`, `orden`) VALUES ('58', 'Cuenta Corriente', '25');
INSERT INTO `x071vm20_siig`.`itemmenu` (`id`, `item`, `url`, `item_fk`) VALUES ('59', 'Consulta de Saldos', '/entidad.do?metodo=consultaSaldos', '58');
INSERT INTO `x071vm20_siig`.`itemmenu` (`id`, `item`, `url`, `item_fk`) VALUES ('60', 'Generar Boletas de Pago Intereses', '/boletaDeposito.do?metodo=cargarGenerarBoletaInteres', '58');
INSERT INTO `x071vm20_siig`.`itemmenu` (`id`, `item`, `url`, `item_fk`) VALUES ('61', 'Registrar Pago de Boletas Intereses', '/boletaDeposito.do?metodo=cargarRegistrarPagoBoletas&urlDetalle=recuperarBoletasInteresesParaRegistracionPago', '58');

INSERT INTO `x071vm20_siig`.`rol_item` (`rol_fk`,`item_fk`)VALUES(2,58);
INSERT INTO `x071vm20_siig`.`rol_item` (`rol_fk`,`item_fk`)VALUES(2,59);
INSERT INTO `x071vm20_siig`.`rol_item` (`rol_fk`,`item_fk`)VALUES(2,60);
INSERT INTO `x071vm20_siig`.`rol_item` (`rol_fk`,`item_fk`)VALUES(2,61);

update boletadeposito
set fechaGeneracion = '2014-03-21'
where id>0;

update guia
set agenteFirmante_fk=1
where id>1;

INSERT INTO `x071vm20_siig`.`itemmenu` (`id`, `item`, `url`, `item_fk`) VALUES ('62', 'Reporte Estado General de Guías', '/reportes.do?metodo=cargarReporteGuias&tipoGuia=EstadoGralGuias', '38');
INSERT INTO `x071vm20_siig`.`rol_item` (`rol_fk`,`item_fk`)VALUES(2,62);

ALTER TABLE `x071vm20_siig`.`Usuario` 
ADD COLUMN `habilitadoFirmaGuias` bit(1) NOT NULL;
