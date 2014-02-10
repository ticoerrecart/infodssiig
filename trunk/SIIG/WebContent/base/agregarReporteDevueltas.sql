delete from `x071vm20_siig`.`rol_item` where item_fk = 43;
delete from `x071vm20_siig`.`ItemMenu`  where id = 43;
INSERT INTO `x071vm20_siig`.`ItemMenu` VALUES (43,'Reporte Guías Legalizadas',NULL,'/reportes.do?metodo=cargarReporteGuias&tipoGuia=Legalizadas',38);
insert into `x071vm20_siig`.`rol_item` values (2,43);
INSERT INTO `x071vm20_siig`.`ItemMenu` VALUES (52,'Reporte Producto Movido',NULL,'/reportes.do?metodo=cargarReporteGuias&tipoGuia=Devueltas',38);
insert into `x071vm20_siig`.`rol_item` values (2,52);

--agregar el reporte a mano --
insert into `x071vm20_siig`.`reporte` values (3, '', 'reporteGuiasDevueltas',null) ;
insert into `x071vm20_siig`.`reporte` values (4, '', 'reporteGuiasRegistradas',null);
insert into `x071vm20_siig`.`reporte` values (5, '', 'reporteGuiasCanceladas',null); 

INSERT INTO `x071vm20_siig`.`ItemMenu` VALUES (53,'Reporte Guías Registradas',NULL,'/reportes.do?metodo=cargarReporteGuias&tipoGuia=Registradas',38);
insert into `x071vm20_siig`.`rol_item` values (2,53);
INSERT INTO `x071vm20_siig`.`ItemMenu` VALUES (54,'Reporte Guías Canceladas',NULL,'/reportes.do?metodo=cargarReporteGuias&tipoGuia=Canceladas',38);
insert into `x071vm20_siig`.`rol_item` values (2,54);