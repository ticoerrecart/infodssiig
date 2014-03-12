ALTER TABLE `x071vm20_siig`.`Denuncia` 
ADD COLUMN `observaciones` VARCHAR(255) DEFAULT NULL;

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

