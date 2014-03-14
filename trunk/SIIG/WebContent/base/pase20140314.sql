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
