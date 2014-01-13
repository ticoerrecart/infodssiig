CREATE DATABASE  IF NOT EXISTS `x071vm20_siig` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `x071vm20_siig`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: x071vm20_siig
-- ------------------------------------------------------
-- Server version	5.1.72-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `entidad`
--

DROP TABLE IF EXISTS `entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidad` (
  `tipoEntidad` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigoPostal` int(11) DEFAULT NULL,
  `cuil` varchar(255) DEFAULT NULL,
  `cuit` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `nroMatricula` bigint(20) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipoDocumento` varchar(255) DEFAULT NULL,
  `localidad_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK456F1C9F6FDC4B0` (`localidad_fk`),
  CONSTRAINT `FK456F1C9F6FDC4B0` FOREIGN KEY (`localidad_fk`) REFERENCES `localidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidad`
--

LOCK TABLES `entidad` WRITE;
/*!40000 ALTER TABLE `entidad` DISABLE KEYS */;
INSERT INTO `entidad` VALUES ('RN',1,0,'','20222222222','Gomez 456',0,'gana@gmail.com','Direccion de Ganaderia Ushuaia',0,'0','CUIT',2),('PRD',2,1951,'','','Alameda 456',22569874,'jlcorrea@hotmail.com','Jos√© Luis Correas',5559999,'','DNI',3),('PRD',3,1987,'','','Alameda 564',22369258,'rjerez@gmail.com','Ricardo Jerez',789,'02255-456789','DNI',2);
/*!40000 ALTER TABLE `entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `superCategoriaTipoAnimal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Bovinos','GMAYOR'),(2,'Equinos','GMAYOR'),(4,'Ovinos','GMENOR'),(5,'Porcinos','GMENOR'),(6,'Otros Productos','GMAYOR'),(7,'Otros Productos','GMENOR');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boletadeposito`
--

DROP TABLE IF EXISTS `boletadeposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boletadeposito` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaPago` datetime DEFAULT NULL,
  `fechaVencimiento` datetime NOT NULL,
  `monto` double NOT NULL,
  `numero` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletadeposito`
--

LOCK TABLES `boletadeposito` WRITE;
/*!40000 ALTER TABLE `boletadeposito` DISABLE KEYS */;
INSERT INTO `boletadeposito` VALUES (3,NULL,'2013-11-30 00:00:00',100,1),(4,NULL,'2013-11-30 00:00:00',200,2),(8,'2013-11-28 00:00:00','2013-11-28 00:00:00',200,111),(9,NULL,'2014-01-10 00:00:00',200,1);
/*!40000 ALTER TABLE `boletadeposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'SuperAdministrador'),(2,'Administrador');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canonmarcasenial`
--

DROP TABLE IF EXISTS `canonmarcasenial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canonmarcasenial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `monto` double NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canonmarcasenial`
--

LOCK TABLES `canonmarcasenial` WRITE;
/*!40000 ALTER TABLE `canonmarcasenial` DISABLE KEYS */;
INSERT INTO `canonmarcasenial` VALUES (1,100,'Se√±al'),(2,200,'Marca');
/*!40000 ALTER TABLE `canonmarcasenial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `periodo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (3,'2013-2014');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoanimal`
--

DROP TABLE IF EXISTS `tipoanimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoanimal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `categoria_fk` bigint(20) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCFAC7270AA39870` (`categoria_fk`),
  CONSTRAINT `FKCFAC7270AA39870` FOREIGN KEY (`categoria_fk`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoanimal`
--

LOCK TABLES `tipoanimal` WRITE;
/*!40000 ALTER TABLE `tipoanimal` DISABLE KEYS */;
INSERT INTO `tipoanimal` VALUES (1,'Terneros',1,0.8),(2,'Novillos',1,0.8),(3,'Vaquillonas (hembras de reposicion)',1,0.8),(4,'Vacas (hembras madres)',1,0.8),(5,'Toros',1,0.8),(6,'Toritos',1,1.5),(7,'Yeguarizos',2,0.8),(8,'Cueros',6,0.25),(9,'Ovejas (Hembras madres)',4,0.15),(10,'Borregas (hembras de reposicion)',4,0.3),(11,'Borregos',4,0.15),(12,'Carneros',4,0.15),(13,'Capones',4,0.15),(14,'Corderos (machos y hembras)',4,0.15),(15,'Lechones',5,0.2),(16,'Cachorro',5,0.15),(17,'Capon',5,0.2),(18,'Cerda',5,0.2),(19,'Verraco',5,0.2),(20,'Cueros',7,0.24),(21,'Fardos de Cuero Cat. 1',7,0.2),(22,'Fardos de Cuero Cat. 2',7,0.2),(23,'Fardo de Lana Cat. 1',7,0.8),(24,'Fardo de Lana Cat. 2',7,0.8);
/*!40000 ALTER TABLE `tipoanimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaVencimiento` datetime DEFAULT NULL,
  `imagen` blob,
  `numero` varchar(255) DEFAULT NULL,
  `boletaDeposito_fk` bigint(20) DEFAULT NULL,
  `productor_fk` bigint(20) DEFAULT NULL,
  `nombreImagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK46AE21C7C9761E7` (`productor_fk`),
  KEY `FK46AE21CEF42E298` (`boletaDeposito_fk`),
  CONSTRAINT `FK46AE21C7C9761E7` FOREIGN KEY (`productor_fk`) REFERENCES `entidad` (`id`),
  CONSTRAINT `FK46AE21CEF42E298` FOREIGN KEY (`boletaDeposito_fk`) REFERENCES `boletadeposito` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'2013-11-30 00:00:00','GIF89a\0\0Ù\0\0å™Ô9qﬁZäÁ1iŒsûÔ˛ˆı˚·ﬂ˝ÚÒÌe^›c\\ÓmeÔslº^Yzs©[WÒÉ}ÚàÇÚçáÛòíÙõñÙ¢ùı´ßwSQˆ∞´˜µ±˝ÎÍˇ¸¸ˇ˝˝ˇˇˇˇˇˇ\0\0\0\0\0\0!˘\0\0\0,\0\0\0\0\0\0\0ä‡eâ§5çË•<ú“æn¬1≥q]UEQR=¿≈Å∏dé»[nI)*uí®/8¨p8íkªŸH\náïπñ…]H¡ Æ@\Zíw@‚b≠~C–hff]\ZÉnprxÑX^`Gçòi`G†é\r´≠¨´Éµ∂∑∏!\0;','987',4,2,'logo.gif'),(4,'2013-11-27 00:00:00','ˇÿˇ‡\0JFIF\0\0`\0`\0\0ˇ·\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0ˇ€\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ˇ€\0C			\r\r2!!22222222222222222222222222222222222222222222222222ˇ¿\0\0/\"\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0\0}\0!1AQa\"q2Åë°#B±¡R—$3brÇ	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄·‚„‰ÂÊÁËÈÍÒÚÛÙıˆ˜¯˘˙ˇƒ\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0w\0!1AQaq\"2ÅBë°±¡	#3Rbr—\n$4·%Ò\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÇÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄‚„‰ÂÊÁËÈÍÚÛÙıˆ˜¯˘˙ˇ⁄\0\0\0?\0≈¢ä(\0¢ä2\0…4\0QF(Ù˜†üO4©k∫G`®=I‡\na„ØΩX±º}?P∑ºç‰ÇEëU¡##ëú¸Ëπ÷ºfuù&ÀLë°éËKí0.∆ª≤Aı‰qÈößi·+\rO@ÅÏØ\0ΩíyñtlNr\\/NΩÍî^<÷h•î[œ$w/qî3l,ÖJèòa0«€≠U”º[¶i©c6‰Fd1 »∆HŸÜ“A›åı«Ph◊h¸5˝µﬂõ\ZÖ2)Å–\0«k0±¿8ÔY∫u∑û˘¨í(„cÄYÚ>ÿ¥Ôºa}¢ù2[k%â£ä&í4`‰! „ú»u8¨[kñ∑g áG·‘údÁ={qÉ@Ó ç›‡f∂ï÷6ë&ÇLmŒTÇs¥ˆ=}rh⁄mé†ór\\›\\Bˆ—yﬂ∫Ñ>‰R∆Xs»„®ÓıYn˜niôÿigò ·x;A==*ΩïÙ∂+r±™§¬a}√8RA8˜¬ä\0πˇ\0Œ®æX˚:\0‡íÕ*\n˜Ñ∑»pG\rÉ˙‘∑æºµíO+d±≈\Z±q\"« YbÓ˘ˆÜÍ;sﬁû|W~»Q‡∂dë⁄c*ÿπ%ÂŒÏÁ\0A‰‘r¯ñÍTëMΩ∞˘6FÍTƒ±6ﬁâA‡„®¡†\n7∫m∆ùyˆK•çe›Û* ØÉúJ∑ÿ˚VÖœÜ5(¶πéÛ°Ügâ∫´HO/pLÁ±Œ1ö©®Í”ÍR[4±G∑å$jô#©„$ìépAÿ\nµ/âØ.}€nù§˝‡V‹§ÛY:„a~ÿ\'‰t õKº\ZØˆj¢…xŒ#	ä‡∑oòwÁ”¥Ö5˚0∂Úßi\"Û¨—ÑRdtUªk∑†9ÎÈUÊ◊ÆÊ’Ìµ #éh6˘`naÚÙŒÊ,ﬂâ‰`t´0¯™Ê÷lÌÿF[©ê(!ô√}ÚIÀ∑|s”Å@ßÜ5fhó»çZHD√|Ë∏B@≤ﬂ.Iº˙Qá/^Ó +¥¬ÍtãÎÊÆ\\¶|ΩŸ∆C{qKâØ#óó°µéŸê≥®u\\\'kúå‰{ˆ8)ˇ\0	◊õk+€€I=¨¢HÁubƒ+ó\ny∆7¿8∆@¯EıY.DQ√õ¿+ ∏èceôT›ÇIVsû\rRª”Æl!ÜKÑX“d.™]KÍTØ^ˇ\0“ØZ¯íÓ⁄(¢€K ƒ™H$gWÍ2Aëá¶8 ’kΩ^‚˜Oä“DO.7/ø,Yÿé[í@Œy\0ûNx4<~’eêFñÒñ)ÖÛ„ÛQzÁq∆vıÔQ.É©3¡\Z≈˘·Û¬ôìÂ@7nõ‰åıÕOâ/\"iwIR)ó˜I±aÅ<uêOcNÉ≈7∂÷ˆ÷ÒE\0éë\n¯ê:Ä¿ù˘3Ö⁄3œΩ\0G/ÜµkxöG∑T\n“(Vï7É,BÓ˘Ä‰pp=E0Ë\ZûgEÜ7ñ	<©\"Ië‰xO∏8‹@œ©©£Ò=Ïwñó)≠dñDVRŸÛ!≤rF8ÎúzıÉ≈öçΩëÜ4ÑHX»\'˘∑nﬁ$…€ù 9 ú\0:bÄ\'ÑØñŒﬁHå<¶O0}¢=ëdQô7m$óVeﬁïyes]∆±		\ZEﬂ¡e9LÓ*√$VâÒDÊ%∑[¥&‹#à€s´ÛÛgÜ\\é{êx8™◊zı›ˆû÷s$G|ÊÂ‰˘∑3ùƒí7m|ÙQú∏†ºÊä;Û÷é¥\0Q€®ˇ\0—@QüÂö\0(¢ä\0ö“ŸÔ.‚∑èÔH€sË;ìÏ5π®Ai{lﬂcí&6å°VwòN$m\0∂p{Ú«öÁséy„–‚úô¨¨Cd‡éÿÈ@4öîwIã4Yïï\\C®{Æ7Œs”÷¥⁄mù±ïŸ%‹ñ¶cfM≠ÊÊPH¡Á#∑_LªùNˆÌQgú∞f‡ñ«SéßÎU∂`Öœ^˛üÁ&Ä7[I∑⁄ÛAkqsª \"|¥a£í@ÁìÄ{cìKì±D˛\\í*«#:èÔ6åmR[åt¿ÈÕs≈ä©a∆	:SÄ \01˛}hNÔO∑ã^ä–3≈≠m¸2n\0ú˚å„⁄¥·“‡ñŸaû“{%{¥]“∂KÄèÄºw Ûí√Æ+ó\'˜•N;ÁìFN·ÍHœ4©¨YAh–,[—‰_û&WÁÇ\0p}«cÕmGÂµ‹Q	√îµéCgˆta6#ÆOR«‚π#∆{ÒüÈG\\ı»˙P˜ˆE¢È\"ÂûBZóÕPÿœÀ˜vˆñŒqÎ….åãpñ—€N´Ê\"%ÀJJp{dçΩ\Z¡‰gÎÔ@˘â\\ëé‡–C.ènﬂgŸopí:ÃN,ÀÂ⁄œSˇ\0÷ıç4eéŸÌn%∏È#[©√6]∆‚0O\0/N‰V\n9v» ı#ÒAb∞∆x«∂h®m&ØKIi7ñÚ„…t%9¬ı„©⁄:ÒÈZ„Gä\rÎ7†Œ≤\0\"⁄ÃF1–s◊<b∞æÏeÜ@<ppx˜†AÒ◊ø_Z\0Ë¡UÒ[Õu/ó¢<†hÜI„úÄzpy4\r+O¿LíÁö!0ê`8\r”ΩsƒïPs◊”äF åÁß<q÷Ä5¥FH◊Pwfèm∏˘÷0ÏıË	Î»≈YÛ¨/†ê ìNm·iLõ&rY\0Så9ÎûµœÓ‡«∂i√ïœCüÂÕ\0mˇ\0f[˝ê∏ÇaŸÃ‚Ï∂Sv7l<sœ…9©`”m#π≤òÚÓÊà@å®ﬂü° ^k\0ØœÂÁπÁ∑ØJw\0IÎ»∂hhiˆ~BÆ…Ìf◊n˛x∆=éj_Ï®°‘†àZNë-‘q•À»\n §ısû£9ıÆ}F·È¸<z?«Û§ﬁIaœÀ«S˛E\0t0h–æûÚI¬CÃíFILå‡\0:rs‹t™:}ö‹ŸM0∑öÍUtUÜ\"FÊ8˜Û¨≤¯¬‡Ú}N?*êÆ”«~:zPY>çi5Ù•íE*∆Qf%ÿô8U#9\'ìÅ¡Ù¨ù˝©p®\ZFXeÿU71`0§Ñ÷RÆÓánzc∑¯”í1∆Fx†≠¨í‚÷Æ„∏4‰+O¬Ï<∂8_lÅ˙U[M\n#&Ê9s9ÖÅàê(‡)=zW<0H c=1⁄ìy¿nyÌì≈\0nÕachnC, í≈\Z∆Õ∞ç ƒÉê3Ç;‘Õ¢€	⁄ƒë({Ω√l[YÄ‹1éÄg◊wÆyáÀœ ˆ?Z2@Îúˇ\0üÎ@7zT1ËÎu8o-ªíπ\'Æ2ò<Ù√gΩü§§ñÜÚË¬¶wã8$2ÚûO\n÷∞áÃv‰Å”ØßJÒ∆Nﬁ¥–¡£@.d∂ïô‡k®¬≤ÙtdëÅ˙\nu¶óayfó8ù›ïÕ!á∆H\\dúìúpxÈ\\Ô`√ÇGµpvÉÄs¯s@/•¬tOµDíX∑ªHÃ£v@8;JëÏ? ±OSÎIø˜`ëï˛ÓN)ƒ{Ù†ˇŸ','111',8,2,'footer.jpeg'),(5,'2014-01-10 00:00:00','ˇÿˇ‡\0JFIF\0\0\0\0\0\0ˇ€\0Ñ\0\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r		ˇ¿\0\0¥\0”\"\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ˇƒ\0S\0\0\0\0\0!\"12BbRrÇ#AQí¢≤aqÅ¬“3CDScsTÉëì°≥±¡√‚Ú	$5dÑ£ƒ—‘·ˇƒ\0\0\0\0\0\0\0\0\0\0\0\0\0ˇƒ\0<\0\n\0\0\0\0\0!\"12ABQRa#3bÅÇëí¢¡—$qr±¬·°≤“4ˇ⁄\0\0\0?\0Ï∏§V-ÅÉ8√üü≈H»DSyRâ;ﬂé2¨Êçg0i´eho>ÒD–“À+Ó\nÑÁ\0’›5Qb7zoÃ¨™.ô‡NDZú˜ngxÌ{IrdI¶IrUF	˝aÌ˚ë ∫∏\0)µ4Ò\Zñ≤m•»{§·móÄ¸ù:‘Iı2ßﬂ$ìÊÖeZæQ°*6√ÜâÃj!Ú◊ñî©ÆN∂„>“ŸpÎ£o‡å˚¡eŸñp%rπ¢¶¢–8ˇ\0ˆôlø\Z6§,kEinñ^]»(L;ÓL!FmÛeo5¡£„◊…8Ï[Y∑Å\r£\0∑ÆqúQ ÷≠ó9b>ÜŸ)KíéEó¢>áî∫˝ÿ~·›Ùjyö¡r$‘„k∆%¯{\'+p˜ç∂ëæ`ÛV†™œ°ËÍ]ä$X„ààπÓDÕUab∂˙*ìü·æ!ñ˛\'I0T‚ßûJ Ñ‚ßzà[_ÎÊı°1ÊrY£uRnäÂWh™Â\0¯‚as0rQÄÙ†ìØ8ï}#ŸÔgÜñ8Aäw’˙7MÂêﬁ—¨ƒ∆[?ˆÀ˝”ﬂÇ4ñ÷:0ãL≥nM8ªêDÄ~J˛‹^´Øf ≤o9-.Ç	π\ZàπDzä◊Rnz|ÀÕπT,î€lS$ÔQ[á‹¢%ä\nsm£Ÿº‘g$Õª’0n(+Ô˘º√,˘%@ÑÖIèä”ìB§dÇ)≠Tó$Hä4Å!+§ôwJM\"æb:UN¿ˆ∫Bˆ≈ª9mÃËöEsß=Ä”›£Ëé#£i…»tÍ§)‹\Zœ≈2Ø^>J¥™-	Ã*z∆êkﬁ(åK˘Ik◊*îÙæä_$lˇ\0Í≈ìeà˘ ãÛ\nõç+5Óá(˜„mtoMù>J–I¢jRYV‘ºC√≤RÄ]£\'o5Â\'‘Ï∂◊S§¶2Es@jπPÚSÒp|P√fa	QQQw*.i\n;ﬂÄ≤èf≠)ÀÙ°HÉ>È}‹°~Ì–µ¨≈R`…÷S_¢]\"*u4r Ó¥”|—Ÿ¸ùw∑îƒ+®¢±œ˜K s@úi[$‘F“f)ﬁ€q]´◊/2(L<ß≠∂”º<c„äS—K3+Suæä≈ïEÒYXDAÔ˜òY4O+™b4≠(Ñ4Ùj”ÿÉkÕf2Úƒ“.‚IWﬂ~Ä¯#¢e~KñÏ”t@Ø~+I )	\ZõÉ©[hs_{É‚Üt6ÄÁ%Vpø≥%úû⁄Dá8˝=$D˘ßáÄ|Î2ËYr\näÒ∂N\'4¡âπ—≈Èi‚6a\\Ÿ‹¸ÁMcE\'—\nºa√7eI\\\ZùaWÛã¨√¯üéƒ”M6¬†∂~ÃóNAÁè~À¢Y∑ÖÊ§çáI6F¢*z©€B˚_ÀZYˇ\0LZ¿Ä	Kítë◊èoπªn;,‚8—´n&‚EŸTÏók«qÔúµ¨ ÀLÄ£ :¡xO©¢Â.ç„œÖæy»sÇä:æÙ÷ KMr1Ω∑Ω!lÈ*iW˜¢\\?,iÒ{\nt(≥2ôŸ2hu—÷ﬂIƒ3∞Ë‰\\MÊ¡/£w-…ÿ.Ø˘∫\"e‰˚â( >®≠“—™ÍmKì¯GJúb˜D˚æ!QÆrlg„·uµ¬<@	¶¸∆w#SJA√^>Ç/⁄ˆN#ıö˝á<.7∑.k≤™πV≤s®9c◊∞˘eùGŸEF\\-√˙7=ÉN›’πÚ\'hŸà‹ÎFïF4ö”¬Ëè)E&ä6⁄«ÛgÃ*ŒS7ŸınWS{´o74»:⁄ÊiÌEÊÍ–®ÚÑæÜÑ2,â#è\"!í&D®EHÉ}ÛÁâN\\\'$ƒ)ç \ZÁ£»{BDqæºæf&€”»õ\nJ·àQWx·KÊm[¬ö42Õ^´[Ñód•—_qû4ıódzB\'	áqZŒO◊\\ª&\'Ú¿÷*ŸÀ˙Î	ﬁpCÊäìT4¶‰o´´£áOÈ~´«ÎXÊÁôëiu\nzïÁ?\0R~¸<nıò‹§∞6ôlÄÊ´´áàä#wR¿≥ñafXPq„R- ÃŸ©q&êÇ7óﬁÓ§‰π3§6Ñói[¶¢È*ÉÜ.…TD‹PÓ≤Fo!6©|≠ó≠ô‘aå¸›≤Ÿˆ\"~’œÁ‚âùÙ∑ÂÏY@ñó…fM3U]£ÍuŒÆÃL.e…K:U‘dtÛ\n$U ¶\\°“0âªó\nf~–$ö⁄W\"µU¬Ÿ|\r·8&—ﬁ—áÊTe	ï∑ÀÚ™·f=i∫OæFå)fn£u{‡‚‰Ü˘≈k8VZI∞7JK/Õ6]í.sËèuø£$ IJdM&°´DëÎ?ñ7\nË=<¯¥⁄nZåÀX6¢˚Å„ãº6ﬁ£H€ïïSõd˚(ı?©5ôà¨€Ëç:È∏´ò∂»äwπ;Ò—∑fze©u;A…q»uêTâh´∏1}È;\nW$Jû4‘ü¶x˚EŸk¸9 ˇ\0_óÁ\\StÛD\\¡°_D›˚Òt_(£€™õo›É}ıu—6ÙÌãh*é0Æg≤J´.Ó}$TUÒD.‹Ú~qµ“HÃÆi¨≈ TNóZÖF\\WÁ›°§»SYºI∞	˜ªÅ«—i^)K\nXXWüT´Fß∂K€.F«£Ts<\'G#ENyüÀäÊ\"Ÿﬁ@ ﬁjÕÂ∑§Vóra¥‹§\Zt_Î\Z€˜‚{ÖÿÃSì.‰±4‚âíí»“5m	\rc›|~í{SµKíÍ]\"V›^ áÔ†CZM@êHrTTÃIz}p∂∂[6Ya±{hÆ“«≠„íÏ≥`ÇNò™e|I√v\'ÅkJÀe·‘I¯ºQ9à¶$^Eìñ\'–tàŸÁëPD#≥’µ)dêdgçÏÍ9D,|(ﬂº?òë=¥Uo=ááXOIÙD˚	±s!Ii‹úiRÅp“µó;C◊{≥z•-ïD—S#eƒ€N¬èpDÇß%LrÕXﬁc¸>◊r5£à≈V€\n— ~•üíå‡¯îœvÚZ‹[¬jQfd˝$π%d\0µ®uhaC&˘4HB™*%Pí.“,0ªùê-à¶∆y%≤a‘\"\\13ƒ<fu•úêT%$®ŸeÈWz!ç=\\îo∞™ﬁ	tT‰ß	˛,ZI‰§i|\Zµ%éVfï~úã¨y\\À°—¿{Q±&cŒú*%¿ˆ_^#-ëÌmQ∑◊òpqÙ|‘öf\\…UxåxÄz;P—∏WÁœ≠I§lìÕÂ—\"Îp…œHÈtÜéÅˇ\0é3xçh·ÛîTÁ∫Iˆáït;iŒS.Œ≥Ël\0ï\\°ú⁄5ßõΩ,Pƒô{<6÷ßâ62¸#⁄8¬∆åCIQniÏ≈ñæû—sR\Z¬<*Z¸ˆ–ÕŸ∑±⁄F˚9ˆà9{±óñS3»ÀKCCD”‘p∑àñûWÚ≈´ÆØ…“e∫î$|áßü«±‹â%ÖÄC¥˛ñiÃµìŒø∞(¯°©;< üV‰Dà˚ˆ±ß©=à∞æ¢¢1ßíPﬂx«Ç‚llƒö8∑¸øué∆Ÿ†àâ)/ín©±/ô\"Æ·≠úIÆR[/`∂⁄|©NØ^¯Úëı˝ñü¥qÀÉû\'≥Â.\n©÷‘5SEúøç[ò zŸG%è‘l∏Zº%XDV~Œ∂lΩ¶‹[FTu®9Rº)Û˚Ü}»m~S ]KöeπcufZBiª%OR√z:»Á£é®æ~Uf<lˆØõˆÛ˝‘31R^|iF¯¶€j$ÌØÈÈ˜©Üˇ\0´î\'±É	’Ûπ?A<⁄÷äB8£Úó_74l∞?ñp\rß∂\'XZ]Lïr’PèÕ¯iÜp»L˘Oä±WC±wön\rÃﬁ!ˇ\0JâÿfÈ=*U´•Q∂Èm°0ôD∂jf^√êADCxì4NgÊ\"ıË¬=1j˙,Ñ‹ìÑπ∞Ò:À¡ü\nlê∫#—Õﬁàˇ\0îUƒ)¶ÜmÖR ohIPö‚Õøü.nÙ<•≠Ô0N[å≥’X{”Eﬁ#nUœWé94Ò∏Í‘n.j™ª(<£\"¬◊\'I≥jTWi’N:y[¸|$H0£	PÖ&ßWE*)Z*b<≈Ÿû)ã∂ÆÀI\"µ,)£¨FÇ4ˆeØé5R’ºè›Ë˛≤¨ÏP6÷ßWÚRLEƒÊ,Êº“œSípuÉkı˛ëﬁ∏DX6<ƒ˚Í-°ºÒñfJ§πwãÄ{ˇ\0Oª^ù•«™b_¥©ì¶üª^ˇ\0Dt@$çì-ºi7©.ŸØW9S*»h[eOø#ıSÏ$™ﬁìv6Ë¢òMÇlJRÎ˘=0ö—U=wGÔú8ÚÖ÷‚Â&∂Ëaîi\0èå»´©iÂ\nPaçzŸ%9/72yL1∞Z>¶¨UYTXå‚=Ü≥Ro≤9T‡d5nBﬁ?,I£ÕÕÀ∏õ;.LX⁄Œ∏ñŸ±&§]JêŸpW`—K_t˘æl·÷:nnm3M⁄qMﬂƒûX∑ŒRzπwÑE‘Ra›hYjÿ.hÉ_Ï	ﬁ‰ôkﬂ°2À›?«Ø¶´mùhe/RBPIÊÑØÏ•˜ﬂ•m6Ù≠ãÑ9ãÕÎÔè7¬P≠∏z–ë¥\ZdQE*Ivñ]∆«à∫®·ƒJ√∂Á,◊ï∂Imód˙©ÊÔÒ«KaÌÙÛ©2ò6ÙZ:ÛU÷+@ÌóΩ´\ZzrÊcåπTîÉÛ3Â±¨,^º\"’õ<mT⁄KFÒt∑¯Ω%pîv¡;,Ÿ‡UApAπ±My◊µÚˇ\0îìæ„ìnÊ-⁄$ÎÏëp£‡BD(wÑaÔ%*6Õüg¶≠∫3ØXËõ1 ˘”‡(¿m\Z§Ì÷À’î®òd÷7-Ôv ∞0äÓÙ…⁄ìHªkîõ%∏\ZÀÂ˚OúaœjŒ–>“]…6-∂à(Ç à\"àöë8F#ìÜ™™ªÛıEJ‹nìö8™s6}.≤çDï70‡‹≠È`∏•ûz◊◊Dô˝ÈVKÌO¢/úMÀ˛Ïÿf6MÉT?ô\'s€”}0ﬁ^”Z“,ìı¡ ëtæÂå¡√ÇTQı€‰¸ –Ô’ØÈÃ±^-•ı¶ËÀoe’íåx≤ôÆl[<yÍˆC˙⁄Sƒkip®û—¬\"R*—¬9\'Í¸™IbO◊©u\'©w§*1∫Íª°i &O0πæüúkôK√≈–17≥≈S\"÷ôn˙bX¡!Ç¢¶y¶JãÎçTx≈UY—SΩ‹:¶xMT¥‚2ü^fı\nÊ6§∑¶fﬁRQóñfâqT•Q◊©*ÒqwÇ\Z~Ov˝VL∫∫H*Ÿy∫©tπ£l~!≤Ïp±⁄¥ú‘í§B˚9oE!ßEﬁ“à”ﬂÁÀV˜êYÚÃ4πò<≥≥;ÄâÍòÒêôxy¢ŒfÅŸﬂã≠ôBX§{8ö—≥é_£ªºõ~PˆdÏƒ”,7Q∞‡f\rÜ†Bí\'{õ\'Ã6¡¶$≈öQq‘Jñ≠L∑ÔqY√˚√îáùÄ+â†GÑ7)&éØí9Z˙_πªAƒ™Ö,Ç]°*UﬁY∆€)Í¢Ÿã‰Ê^c[A&bkínbn=6 ràé∏õ*ÒjhWßˆëœ”ììVÑ¬fÆL>\\(ï*ßty~i‹\'˜]§ÊóBﬂÏá[ƒ=í‰o„Ü•£lŸˆ3T\nöé¶õ€yŒ¢/æq|jih˜)G9˘™Gı_:˘YO%Ÿ)S≤G]sH¢+Räh¿r\"ÌqCF4◊J–\'•ŸtÜÇt≈Õ[T∆Â#+S)K)ÒO`åc‡ÆÇ\"2\"ÿ∫-Å	äx0n8‰ƒ©˙Gú&Ir€-¢—óiz„Ks1RjHëô–3’ôéO€˙A˙bCà∏ö˝üh(£≤Ê\r8 ©I\npï%ﬂ=æ‘I%≠ã:◊nÇAW8a·Óó7Ç®”G,ªjÄœüàR2ay·+ì[ú§≠F?F¯.≠Zå>¯«ùË±Qã&aÜQQïxG⁄æåµ¬ŸpífRe≥ìytj‡!≠YÇó09±‹VΩ„(RHjà€ÔìOgªFL∫9¯&ãªú$ƒ≤\0Z3∏’8¡¬IfmÕÊ¸›RÁ\nÓLΩ°b4Ÿ¶€fˆN9§2´›!„çèíTπ46ÉØA3O—òéåøÀç.	ZK!iÃŸÊæÖÚ“KÆ{◊x‰ΩMRÊñÿ[v YóIÃëÈó›òusA\'d<JBÿ46ÊZ¸R¢HÇHMÙ<§+ky¶∑—R∆§]åâ•©UW^k´(« _≠?∆1=•¬ÒF*B2çÛnìˇ\0uéíöpìmﬂŸXÚ{>ÿ\\«/_™.À˘⁄ãtkü´(O_RtT›⁄±ÛÔS…Ó>˜]ErŒ-´ËLÆlµ/’© ˆ«µ	ˆ≈Œ5ı˝k©;T’Êx˜sâóŸo›_jf„Æ\\øec∂Y\n˚V<o5◊ª€‰ä´ó´⁄ê8ÊY&¨“5x~!%T#¸Yuê˙F=ÓKNbìÄr∑©^Ûî∆m€ô»ïö5çÜ{ı\'”≈å•*ôj…}qná¬∞6jj0)§-ô|™\'=¥èîïî ‰âd•⁄\rj¸–^’§È¯ÈçÁ√ñ,ÎoùÁAΩ#•Î:∆öSîkÒCCÓ‚ÕJdﬁJÛ&”ÏÁ¬Æ¥U¯¯>ÿUyB€93)fµö)(91ó%C≥Wp*2G†∂sÍ;´eÖT«æÇDEˆuM\\e%I!oYv∑ß™ü√»X2kf‚l\'8K∂æ\"€˜c_Ö∑©∑ﬂúóiSE$2Õ;≤§Ñ∂π∂ƒÉ¡lA¬…ôŸÛ#yRS!QÕjßgh8>ﬁ®oÜÂ6 GfÒ,÷.&Ó\ZæøãyFÒùyUô$©iGi≠”˛r¸˝1Ø∏10ZY”6ƒ÷•\\ÊΩ«Oèk¶Ì≥fÿÕÊJ(Íé¢/I2Wd}¿à#XŒ¸Ù‰ª„†e«@H≤Õ‚n≠≠£\Z*Îá‚r4e›√ÍtÉ(≥ Z˘.äïaPSR\n\n\"}hE—õNÇ¨AHäEbê!.1F…ëò6⁄ô»tKBÔlÚ’‚‡8G_ú%öîÕ∆ï^i7:’ZQ°øéàoyA\\«f€eYD#dçTUrRB·ÍŸM›LFùê-®Jπ+Í…:Kî#YÉÌˆWÑ≈˛ã§U√…iÎLo&˚Á2˘∫√Á•F€¨IGm6©§ãõãû1|´dêù≤´OBOõn.y~sB?&ì›â~[rsn∫˚-Ë¶ê^≤‘Eü.«$DqÆ–IÁÊÏÌHÛ-≤Ù™íÔFDaﬁ&HiÒ∆c&y	≠ìŸj˚)ú%cªo√À˙§ˆ!‹…€=‡3W\r¶îtHµ¢ ïCWÏÀ†˛8ÍõázRnœiÙ…€»”=BËÏò¯V!AàmŒ¥≤SàÉ4 Mõn¶HËé…ló7h#kÜ7l§•&\Z,ÈÛ∑Ù5oVyJÑ0øv}\\zÚÊOªEà<¥˚:°±«’ºB∑⁄5˙æ•äÈ◊È˚R<Eı˙3˙£Ò^F•ÅNaÊ•≈5‘ÒàgÔm˚ï¬I0LRqµ\\0\Z¡Ò3¸\'6u±\'÷ü„åÁí\"*¢ÓXCÕySŸ≠æ°CÔ4â≠Ê€^ë# ƒû_ ∂≈D„|z|‹≥Ñ’˝ÖÔ9˘πôäÌˆSJyÃ.Ô˝ì∫œ≤—5Æ∏Õu§‹π&kª€£~º≥ÿ!íñu«…ÖöEˆ–f_rµÓƒπ˘∑¥œM<Ægò“·6‹§¡\nœ“Q√±åﬁ/§æîé\\W‘9Î#R”©}ë£$AÕ7*oœâcÇ.wîïØ+í$÷ò2¢hE‰˜ø=Ò√F≈Ú…sRMH¥‚˙…áI•˜]˘·|˝ì•f&—˙^Ãˇ\0r¯ng´.§”/ÚëG3œ÷©	/ æÃ>6Êÿ_^`€¢ûÈ∆Í_ N«_÷LsÌK=#√±\nVÀG ﬂ[™G\0õÔπ\'πx∆VE◊œ,ô\\ì÷ºÉ„\"ÒG#‹˚\"~–öu∆îƒü\"G¶Qr\0!“kàPÿr[7é^€ê6§]\'êfÂÚ—8› „úTòrS_Ü7xó~≤ÂÜVYfHQ∂Y®Ç°§MGµŸxx—À 7y‚ﬁKoŸ˙æÎ	öI7uäè˘-Ÿ‚‘ı¨\rÁ¢hòhTó<’≤|I}Ò/z&>R•˘IV’É—õŒh‘ëâF\\5pÒƒ7ßœvJLÚY©Ú}˘û”i£%h®ÈØ¬}∏e„°(√\rΩ6ﬁò[s6õ¶º‹§πxbÆ8uÑec6odü¥ƒg9Hz3èÈ›˝3›,4ù¥OHU Ês©}⁄∂‹(xaÖ‘≥d¶AÜ…&\'ÈS#]≤lDxª\rÒwˆ°=}q~rqQ¶Yhñëiäâ“N¢NÂ√Úl√˘âgúòò\rm®Ä*˙E®Ñàà|#’”\Z¸MÂx]Â,ûëo’b(¬-•„k˚∫ËX∫)åÇ—\" ÅäEbÖ◊ \ry¢ qá\ZqW%¶™KÊÖ%âä≠L\n7h≤.èúS“züπ-mY‡ÎF€âP“CÌÁk√Ç¿Ëìíà+ñàèZ\\\"Á)tΩ\Z,\ZZWç„üOK˘}i6!ŸÛ≠‰ß∏;u%ôq«•“∞Ûtìy¢êU~æ\rä£w]~L%£}@^d≥¶•Z§sñﬂ~26YÈKU¶ûm\\ADì,∆í!.°¨x¯bYÂf∏ƒ”îæJ‰®Äæ¥n£°K§ÍqØ¥íˆíû“jyΩ÷≥±UœéÃ6wxfI,F∑_#if)iÊK\"}Bn ˛lªËv√µK˜ãÓ1bHÕ\n2Ø>B…‰H\"b\'Qàà[ak6rJ€ìTT%¨?L…ˇ\0ÕŒPú∆[Ær˜nX	N©y„™á€ñ\\¥”B%S°GfQƒ·&f-8«+!™£2Hˇ\0	u?Êfı9jb[¡âÈiAOKjò¬Ÿ\' £¥3%ﬁE;$‚Øä∏◊›€A‘T•…ÃΩÅnY…êC\ZÔŒLÍ⁄¥>À^ƒ?ôòv,≈≈b$wmEaŸ~Mr.&Õ¢πØ*±/¬q≤ˇ\0DyÈéÆi´—ÑN¨â≠_˜Ç˝s6ƒˆ√}›U¬ß±¬ë/Ú\"x„ç¯™‘Œ=R0|êò_◊^˛Èø«óí”]˛Âø«2ﬁÔg⁄+Ú≈ÂÎ›˝øz$Ó—›V|BuÀˇ\0Ëå«Ù◊w~ƒ?im/&©6”]¢ôˆW@Ò=)oLªÆêòM_¢)/˜Êpº∑ﬂö◊≥i\"ÙùÄü4rP«—IT‰¸R“¡˘&ˇ\0^Àˇ\0g˛Ú\"∂µ«ïÈòˇ\0ŒH}◊éˆÀ≥:Û¸•Ø€5`á…À¿ÛﬁµûÒOYãÚU1⁄3í⁄∫c˘(Z!g€oÅ!(#dÎNäù.à˛k¨Ü4wÛ:/ºË2SSÓ™h‹$\'(™™äé◊\r1ø¡æ„ˆ%™éTÏ‹£c•q∑8\\j¢©†£b®6ƒïâ%ö†¢Âñyf˚ŒÂ˝§e¬:®ú§æk3-æ]\r=)Éy$+$}¿±fºi2JS!>ˆºËRó}h\\∂66C≥úlª¨Ã4◊ú>íÚÃö∏kò¢ñÕ#IrÒ@<ü$]úûò¥ﬂ»t¬a.Ú	∏C“ãUá1j¸©ÅŸâÈyfÄú f§\0Lı∏E˜ÌÑ4Ï˝;<¨ÃY}“éŸ◊9êµÆ‚\"6nñÆ÷ƒ˘Y—Ÿí‚ä©ëM<ôô\'i9¸gÓƒ˚…jeÁ∆niÛ\'M√–çwÌ)¿ÉôÓNÃ@Æ÷Pı† ¥õDc_â¬ÿÓGF‹âyf¬\\ieR°‚Õjıï{q¢≈f•vqoÒ/ˆ±∏xLÚ\\Ùo%#ã¢ëXÕ\'àÇ B\"ôE`ÅÕcï1≤YÈ@›ó3kŒHñ◊Åÿ„€†˚Q’±ƒweE°Û∞Bd…Há4.œñ¨íaumO5»s3ÙU+\")G≤I‹‹p%—§Î\"Ú°É¿\"Ü$<‘W‹¢$∏π|ÇR—ñ7π9…Bi‘ °P*Í£IÓ∆ä˜`ò∏:iE¿-§lè4TÈ>oF±FÕtÏyRt_≥_Ûwì^ç¡Ùe‘5ËÇ\'Ì\0S>⁄õGÒ\n∑Ÿ&˛1†©’ü™Ã∑∞¸ÿTü≤“*í∂Yäs˛–p{]ËﬂZáÚıè3,\" Z\rËçX}KB™$%_nÇJì§¢=e·S∆ÀSñ[Í\ZPVH»TKô∫¯H@∂4o\',DÆ”≥V}™À≥-ìJÎ¥ªò‰Ï∏[;≈\\dbóflÏ⁄:ÙZ∫k†0yD§]-&ÔÑºˇ\0öƒ≥∞&|w ÿÖñ˝\'ùó»q)≤ähx¨˚ææ	ÔÑ°¸„Y*ß≠∑Dzﬂ∫H¯∏>q6“∏Ñï30‡PE¬C∑\ZÌÄ0Êe„2VLÁë‘Õ√ÏïQlÎ	I7à# iM\\•,g[∫‘ïj\Z-ßâ°i‘ÔÚ¿~8„ÀvÃûî¥4-ìÆL∞˚™À¨+Æ®ï5â€ÉËË¢£¢ìËÏ]ÌkUQµ;Uƒ-çS\0˚t˘–e†⁄™æ\réàÄ&fª˘+R–ô\\∏ßÌö–\nl †ÆÍi^Ì1u°.$äÜÇ£ø\"A›‚˘„ç˙OY”?ˆ∆¶≥¶F‹\'Xq©v\\sÛf;7‹\röboÂ+z&ÁâÀ>ÃfeÁéY+ÃúŸm¢!=†Ì¿qﬂzk]U˘0∂ôz)ÌÊô≥≥AFÏßIVëmH\\xó≤ ƒ≥∆^\08–⁄∑E∫@ñŒ±\ZGêe«•ÕW≥OôÜ‹G|úl2≥Õ◊≠6 Zbe¨ÂﬁòFY´H\\\rù^èåÄjÑŒ,˛Qò¥	‚óô;¨$¿ôq*ñ§Ñlh˝è mG«ù≤›YäÖ∆KtOC	&ÜÕ∞’rÈ\'µ˜i¢\"ˆéœyYˆ8˜ùˇ\0Ï√oÕôyLÛÜ`750€+§\ZΩ	ÄR\r.Q˘vxGŸ©3_QuD€\0qÃÍ∏’òÀ≥ç+.m®ñé ÎlåÙ√Ø∏2Ú‰·7≈MDFftÄ¸£\Z´·?<^}k=¢a§l ÖPˆ&¥–µ·Æ!∑ûzfz’u…fâ˝–“ Èoe∫π8«M∑œ€W¶¥.M⁄ì£h*Ûq:‘óî;\r÷}ä¯£<Ø4éˆ—ó±—PEA\03J-!Ûisﬁäüa5Ï	ªI¡`Pd‰•4L†•\"™N\rGıå@{ïD{±·E◊[ìh–ï≤ò$3§©Ÿok∞\ZU…{*–ôlüö!f\\AïTFë!É7*˛_s∞#!“œ∏å4õD“Á‚\"ÿ‘ˆ}†Ÿmj5Ù≤¿v∞\\*ﬁ\ZnVÍ°∑©ãR–`_pﬁD=#ä§J¥Tè\0◊¡¢–\"\"\"&§Lë\"Ö3JéÑê\"6“à»;&]î2€s∑üPC:≈k6ÚnéVnâ}ÍWUÇ!b∏à Ç\" Å\në¶ΩV L0„G¨\\À’Ÿ_nb⁄cË≥›ó$,Mg\\m>¸Ìë2@&Cí‘9Ø°p;Tó2Ï|Hf‘e…ê–Ω2C¥Ÿ-:©Ïï^£Üû!‹¶gö°ƒ»ìX8<`Ω?Ü9¶ˆ·<Ïõà‡¶î!!ué!QÈ„‘≈-!Y∑dIÛTQL“CÆ©ìïÏ)IólŸùúú$iUw8<C“\'∆>‘:ÒJÊ7=*m%J$≠Z¡¡·(Kﬂª≠˘VM©˘d }ëòh6ç∫Kæ%Œ\'8;èà2ÛÎIé»æ©ŸÂxyKØÉπo˛cx%^ë<^\ràQÛ¯«≈˝I°+R±,·&Dlµ_–Ëé–˚ıF™Ú[\Z«,ï◊\\%≈y¶*D|}¡8üT€Õz2L¿ÖsÜ9sÔz≥yÏFùZe⁄!qQuí`ùb¢ÓR0˙*ÅŸYy’M	=UÀÆ´®¨¶E§\ZöoFé®éëR™èkèlÛ2N“ÁÀ†r√xÌV¿\0f\nJA¬!à∂ù“x∂•æn«&‹˜[˝;í-¡!˙ÚkÕXßˇ\0Züz(fMƒTØÀ‚ŸÏUi930»/ÓÀHE¸P¶ˇ\0£¢ﬂõûñ%JüißCÈ–ë£üüy˘wÃ›Æƒ´Mëã$¯Ä¶ÙÙ§Ûû\0l}ÿäaÂ»~ÃµÆ¸√e•f—Yw\Z1Mk§Üàz4ú}à’◊>Qˆã\rÀ»É‚÷•ú&à_¨Ñ^‡êx°¢„πfà™+ò™¶Â˙#ñ|æ⁄u\\±ti2‡™¶Ì1\Z?Ä\\é´…ÌÅ|ËírÇ1hÕYÂ™êπUÌJ<Ê–S3Pw;\"ö´E0bôê2j	Ìtá—èøL*±‹SæM¥äZ)\'YyQ5fBÎ¥¯*gﬂËYF¡ñ∂‘Q8âIuEÚ®¥6t®(ˇ\0ãgö≠6\\¶‰eA°DSAuÃ∂‹sòä>Ró¨¶Ê\Z≥eñ•S-+ΩŒ!‡qóÉ≥∏Ωè	í±\"∫G	hW«hSËk¥Œ‘x·e–K2UÎFm¶åri≤÷he¬=Nºe·#æÿöó°SBÙB¯Ö_7Ä~óü‘∑7äˇ\0µc∞‘ã•}ÜÖ	We∞2®≥.£Ãècµ	Ám©ÎZ`[##We∞RDyäûé∏‹X8U?>˘>‡ËÖ“#\'_‘YódxÀ‡éã¬Ï=fA∫Cm”÷„≈∆K”Ÿ¢6ªZ<:GΩ\"Û¢ÔìÀ¶Ò-Ü›@íïmÅ◊JfeóóJR-¶.å¡õô]”`≥*¡Òtà Ç\" ÅÇ B∑(Öbç´1.∆ùÅ4Kõ≠q7ÃCÕ±Ú◊xÒu¨ÛE÷ãFˆ+∫éAwk2M\\åeê\"Z√Õrö…S6»øàÓ3¢6ãÑ“väiÅQ∑M3GŸ§Ñ˚„¿ÁÕ<^¡\"\'§ı)TE/ªãâ[¸ØπW rÕuGin]—*=ﬁRÎ}.K]x{“Í•.1UáÕv”›ø…mÊÆ≈≠bíõ$ÆK¢Ê™“å”˚∆∏€ÔáΩ\Z˘ye-îif€V\'Yj`y•Ù.çê∑§ÁlÅÌèá1GOaÊ%KOéB®eô0Áuh?ùòå‚ŒÀÕ‘„(íÛ+ö‘)ìnÔÔÜ‘dÊ°ûêÏ?s≠Õ65Cà∂Z¿˙«¸îo<†e÷ SûxZõëEiˆàÖu[íl\nöå—(À∂á”Ï6«	≠…©íïñöïb]ππÅö9âr\'ÄJá8ˇ\0D∞ÑM˜ª≥Rs.ä˙ï`Ÿ,–Ha¡&ÀhÉk`∏˘(ËÿäﬁÛ¥•§Zíò!yÖ&õ R*â	ß¿6´®π˘¢X*\ZOÊï‚òT¥õ√®+ÆÆ≈ºz±¡≈qîIŸˇ\06òóe÷@ï±“¶Z3\"‚>¿B∞ì%Ïƒó≥ÌIrÛõ9]ÊƒEÒh§ÑEoöå√¢9““ƒGúññaZñï  ôDfWG¡Súﬁﬁ®…≤qfy©óÊQ—9âëq◊\Zh÷ë‘4äÖ‡H≤÷Jrªø≤ÍÏu∆˘W⁄ë)![CÕfX¥&P,ôóe\n≠%aËÃÙû\nN%íæR≤/Hπ0›^pÑ„lIÆôÁP©m¥\'SFTp	Q≈u7iíM˘öæ¢ëM∫îSITN:Cì|E∑X√Ó4‰Ÿ¥√gêK°Ì®ç‡Ò	<BTW•:Gq!r◊D2ŒÈ’3°√N°úﬂ@ngÚL€REÑ\Zj”7zaÚ¸»ø0ÂNd;n\0lÜ«¢ŸˆK≠l[SÍ¨≤ªë‘&ZÀ°é2Ò˚–Û√\\$îëDQq‰÷Ø∏Çß·‰{b>\'ÀH\"°*8˛Yã\0ª]‚ÏáÛµ«G=Qe-}ô0,jì·c˙Àôi∞◊Â,‰WçQ«ÑsW›•†Gwœ$Årh|Ì¡]í»E§>Òm˚ÄpêæŒv”qiEWb]ë*<CÕ„ÜV`B¢ã”ôj÷2Èµöˆù/πÒFñ,&ñä<ÛóŸeê¨≈™´‰Õ«ﬂˇ\0)çÉˆ‹‹–ƒ¬m9©Ü@yhD[e_,1≤åvòDDDD…7$d¬9MàÆÃ¨∆.√gU  éhÇ B Çà Ç\" ÅäeÇ+)ç\rÈ∫rÛCìÌö≤B!€NÈqåH\"ôG—7∏Ò\\úlmgHÀ_\0\Z©\nY˜$\\≈nïÌ	›}q6πˆÉ73£ô‘/∂T8â˚¡:j˚\"x1ΩwÒâB…Ì \r9ÈóçüÔ(±-t≤\r§{®†°g/Ü⁄˚(ﬂî%Ã	π\nîG•Ä›dÚ⁄JG2È1‰àíu≠ÁO ∫àÎl °àò´nT¥R]“åT≈¢ùl•,Ê›xûM∏ç∏4Åq\"T%÷tDálq±l«\rÂEô{lÄW{îÏ¥=ŒcÔ¬†ç‰©låµ≥”a%GŸÖºCÊµÖŸªs.9*ÀO!ê(†=,JbTÒ5@|QÂd]¥€†€R≠<ÎÜ-à™LL\rDTÒ:f(,fú)¶âsU)Ä\"U”ïU“Ô8‘¿∏:…ßEƒEOXπU1æ.Õ¡g&?\nÛèñ%∑!\'Gïù¢2“rÚåà≤€‰j@–àâΩ¢\nE(¶≤üy>›4î≥ôEJÚÆ™Ò)ñ“{ÉHxb3ã◊q-ô_ñT\'ôC!’UCÈ\Z.…lç+\ZÏ4∆ÊŸh%Á≈…wŸ#m Ir®∂+∆¡„®|ÏΩ!Ø>SÒÕΩÍˆMÁgNæî0„r≠Æ¢ujraG§xø\\BÏ\'˘d*ﬂqŸÉUÃ≥*ó¥\\ıı◊£}õœ@¶bâöûâ¿oÍ @\"˙\"R∞“*…@mŸe&£k⁄F’i.›ÿbXie†i=tDΩ‚„/∂7yEb±ô›◊B,-fT +Òtà Ç\" ÅÇ BÛUˇ\0l_ú@ÖH†Ø˙†Ç+£œ=œL@ÑgØ˘Èã…bê@ÖUèT…Q~pAíî¨∞¶·D›π2›‘\"ÔLÚ]^ÏRË8ÆÂw~*‘`}âøŸj¿Êª#º}I>gUÏ÷^¢⁄\"‰àâû˝Q·3\"πê	/“(øÏÇÖXâ›∏,ñ€MŸeñÏ¢·_ı˝Ë équË±mPA!ZÈÂî[æ» Å\nX	b∞@ÖjWˇ\0à¨!V ÅˇŸ','798/89',9,3,'logo.jpg');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemmenu`
--

DROP TABLE IF EXISTS `itemmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemmenu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `item_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4A06A732EA23B717` (`item_fk`),
  CONSTRAINT `FK4A06A732EA23B717` FOREIGN KEY (`item_fk`) REFERENCES `itemmenu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmenu`
--

LOCK TABLES `itemmenu` WRITE;
/*!40000 ALTER TABLE `itemmenu` DISABLE KEYS */;
INSERT INTO `itemmenu` VALUES (1,'Salir',6,NULL,NULL),(2,'Salir de la Aplicaci√≥n',NULL,'/login.do?metodo=logout',1),(3,'Usuarios',4,NULL,NULL),(4,'Alta de Usuario',NULL,'/usuario.do?metodo=cargarAltaUsuario',3),(5,'Modificaci√≥nn de Usuario',NULL,'/cargarUsuariosAModificar.do?metodo=cargarUsuariosAModificar',3),(6,'Datos del Sistema',3,NULL,NULL),(7,'Localidad',NULL,NULL,6),(8,'Alta de Localidad',NULL,'/localidad.do?metodo=cargarAltaLocalidad',7),(9,'Modificaci√≥n de Localidad',NULL,'/localidad.do?metodo=cargarModificacionLocalidad',7),(10,'Per√≠odo',NULL,NULL,6),(11,'Alta de Per√≠odo',NULL,'/jsp.do?page=.altaPeriodo&metodo=altaPeriodo',10),(12,'Modificaci√≥n de Per√≠odo',NULL,'/cargarPeriodosAModificar.do?metodo=cargarPeriodosAModificar',10),(13,'Entidad',NULL,NULL,6),(14,'Alta de Entidad',NULL,'/entidad.do?metodo=cargarAltaEntidad',13),(15,'Modificaci√≥n de Entidad',NULL,'/cargarEntidadesAModificar.do?metodo=cargarEntidadesAModificar',13),(16,'Alta de Provincia',NULL,'/jsp.do?page=.altaProvincia&metodo=altaProvincia',7),(17,'Modificaci√≥n de Provincia',NULL,'/provincia.do?metodo=cargarProvinciasAModificar',7),(18,'Marca/Se√±al',NULL,NULL,6),(19,'Alta/Renovaci√≥n de Marca y Se√±al',NULL,'/marcaSenial.do?metodo=cargarAltaRenovacionMarcaSenial',18),(20,'Pago Boletas de Deposito Marca/Se√±al',NULL,'/marcaSenial.do?metodo=cargarPagoBoletasMarcaSenial',18),(21,'Modificaci√≥n Canon',NULL,'/canonMarcaSenial.do?metodo=cargarCanonMarcaSenial',18),(22,'Gu√≠as',1,NULL,NULL),(23,'Alta de Legalizaci√≥n de Gu√≠a',NULL,'/guia.do?metodo=cargarAltaLegalizacionGuia',22),(24,'Autorizaciones',5,NULL,NULL),(25,'Alta de Autorizacion',NULL,'/autorizacion.do?metodo=cargarAltaAutorizacion',24),(26,'Modificacion de Autorizacion',NULL,'/cargarAutorizacionesAModificar.do?metodo=cargarAutorizacionesAModificar',24),(27,'Autorizado',NULL,NULL,6),(28,'Alta de Autorizado',NULL,'/jsp.do?page=.altaAutorizado&metodo=altaAutorizado',27),(29,'Modificacion de Autorizado',NULL,'/cargarAutorizadosAModificar.do?metodo=cargarAutorizadosAModificar',27),(30,'Tipo de Animal',NULL,NULL,6),(31,'Alta de Tipo de Animal',NULL,'/tipoAnimal.do?metodo=cargarAltaTipoAnimal',30),(32,'Modificacion de Tipo de Animal',NULL,'/cargarTipoAnimalesAModificar.do?metodo=cargarTipoAnimalesAModificar',30),(33,'Consultas',2,NULL,NULL),(34,'Consulta de Gu√≠as Legalizadas',NULL,'/guia.do?metodo=cargarConsultaLegalizacionGuia',33);
/*!40000 ALTER TABLE `itemmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoautorizacion`
--

DROP TABLE IF EXISTS `tipoautorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoautorizacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoautorizacion`
--

LOCK TABLES `tipoautorizacion` WRITE;
/*!40000 ALTER TABLE `tipoautorizacion` DISABLE KEYS */;
INSERT INTO `tipoautorizacion` VALUES (1,'Solicitud y gesti√≥n de Gu√≠as de Campa√±a'),(2,'Solicitud de Renovaci√≥n de T√≠tulos'),(3,'Otra Solicitud');
/*!40000 ALTER TABLE `tipoautorizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `senial`
--

DROP TABLE IF EXISTS `senial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `senial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaVencimiento` datetime DEFAULT NULL,
  `imagen` blob,
  `numero` varchar(255) DEFAULT NULL,
  `productor_fk` bigint(20) DEFAULT NULL,
  `boletaDeposito_fk` bigint(20) DEFAULT NULL,
  `nombreImagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK936518987C9761E7` (`productor_fk`),
  KEY `FK93651898EF42E298` (`boletaDeposito_fk`),
  CONSTRAINT `FK936518987C9761E7` FOREIGN KEY (`productor_fk`) REFERENCES `entidad` (`id`),
  CONSTRAINT `FK93651898EF42E298` FOREIGN KEY (`boletaDeposito_fk`) REFERENCES `boletadeposito` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `senial`
--

LOCK TABLES `senial` WRITE;
/*!40000 ALTER TABLE `senial` DISABLE KEYS */;
INSERT INTO `senial` VALUES (1,'2013-11-30 00:00:00','ˇÿˇ‡\0JFIF\0\0`\0`\0\0ˇ·\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0ˇ€\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ˇ€\0C			\r\r2!!22222222222222222222222222222222222222222222222222ˇ¿\0\0B\0ù\"\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0\0}\0!1AQa\"q2Åë°#B±¡R—$3brÇ	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄·‚„‰ÂÊÁËÈÍÒÚÛÙıˆ˜¯˘˙ˇƒ\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0w\0!1AQaq\"2ÅBë°±¡	#3Rbr—\n$4·%Ò\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÇÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄‚„‰ÂÊÁËÈÍÚÛÙıˆ˜¯˘˙ˇ⁄\0\0\0?\0˜˙(¢Ä\n(¢Ä\n(Õ&G≠\0Ö§»ı™⁄•ΩôXÿ≥Ãˇ\0r∆Áo√”‹ÒM&›ë2íäªe¸èZßw®⁄Y·gùœ›N¨ﬂEü¬®ıCõâ~Àh°9¯ˆˇ\0Ä‡˚’ªM2⁄‘*•æÛc,ﬂS‘˛4Ìª˚àÊúæo_Ú+ˇ\0jﬁN1kß»√≥‹0âO·À~ïC¨O˜ÓÌ‡ëBX˛lq˙V»âGl”ˆ”Á∂»~Œˇ\0ü‰sÌ°›I˛≥UΩcÏQí‘√ˆ’u}|Ò˛‘båSUd∂dº=7∫¸Y≈Õ¶xäƒo≥’¸?Âùƒcü¯®l<o-ΩË±÷ÌæÕ.qΩ~ÌwG¿¸F≤ÅlmÓÇÖîK∞PA8Æäçi*u˝Vå‚≈Bxh:¥§ÙË›”˚ˆ;»•Iê20 Ù\"§ÆS¡2œ°AÊíHA>ÄúWSöÊ©I8ˆ;ÈTˆî„>Í„Ë¢äÉ@¢ä(\0¢äLÒö\0Ú_ã˛=’|)>ôg£\\,3ÃØ$•£W˘Azé¸˛Uâø‚vªÆ¯ùÙÌjÌ&éH¢ƒJ§0 „Ä;gÚÆ?‚µÎÎˇ\0n-!%ÑMúxıÔˇ\0è1¨Ω6÷Á√ü<ãPC⁄N˚7p©∆‡$UF.RQ[≤g8¬.rŸKÍZ‘çv4Õ3k^∫YO+ûÁ‘˙\nµ¶ÈQZ#Hs$“…3ÚÓ}œß∑J‚l•õO≠´A)¬÷{ë1é¨Túı∆+ ¥ﬂã^8s=ºwm{s4{alôå‰|¿*Û¿Ëx≠*•È«¶˛ftÍEUñÔo%˛g∞¸WÒN•·\rZﬁÈ/\ZO%‚ƒLâ∏(Á˙\nõ·äuxeo57F∏Û]rã¥`t‚ºü≈⁄¶≠™|“Ê÷dñK√™Êe⁄‹,∏„ï·ùc∆±xVKo\r€4Vê;…5 ﬁ›»ø†&±:O™r\r.k¬˛|J’µ]YÙ]jÁÌ%£/Ã†6GU8Î«Ú´~*Í:.Æt-ñ+à‘ÓJ!à»U#°êh⁄∑ZZ˘j„∆ﬂ<;,zÖÂ“$ﬂ2≠ƒHUΩ±èóÈ≈{Oá>#i˙ØÖ-ı[∆Xfu\"HT‰ÔËi∆.N—WdŒqÑy§Ïé‚YR4/#U,N\0Ø+Ò£/ãuÿÏÏ≤ma$«=Z¶æ’uO‰[#[i˘Á˝°ÔÎÙÆª√˛ÉJ∑\n©ñ˛\"zì]–K\nπ•¨˙.ﬁßóQÀ\Z˘#§:æ˛K»–—4ı∞±é%\\µ;R\0\0¿ßWõìª=H≈EYQH†¢ä(\0™∑◊1⁄YOs#mé$.«–í*µ\\/≈ùW˚+·÷® €d∏AnºıﬁBü¸wwÂ@9Ë⁄Õ∑¸\'QÎz≥0à‹ΩÃõWq‹r√ˇ\0≈mÎû$—Ô˛ «´ÿ;i°Tî»õ|m˛AiüºåûÒÆ§û(`*™a*	cúı–Vßƒ_Üæ–°‘lÁ∫îÑr	ôH\0Éœ\0wÛ≠)Õ¬jk°i™¥ÂN[5c£o_k:t†¥rŸN#`zeJÂ˛Gû-πÛ\0‚€ÇG?xUüZ¡´¸0÷%vo¥iŒ2,6˝G·X_\r,\'‘uÀò≠ﬂcã|Áë¸C“∫kNçzäQ˜oø©√áß_FQóΩoÜ›QÈˇ\0„ä?ÿ?‚`ôˇ\0ørSæ¬íx,ñ_˘nˇ\0Œπâ˙N´ßxn›ÔÆLêõµU_1õùèœ#⁄õÛ‚6ó·_œg}ˇ\0hÚB2%œAû‹˜5ÕVÑ≠\\Î°RU!Õ8Úæ«=‹˘?¨QºÀèA±ø¬Ω{«Z«Ç|52‹Í:]ùﬁ± ,inç)«Ff#Å«\\Á–\ZÚèÖ≥^¯˙+êÑàcy]±¿»¿˛uü‚kêøÔÊ÷cyaèP>dg©à7 1È¥\nÉr◊ç<_¨xØNÇkç),¥µõ0≤©%õ¯èåÙ´∏¯G·»5_%ƒ‡∏8O{˙◊-Ò∆z?à4À7GÜCª˘è+.≈)TuÔ^ì3˛Dı\'ßûˇ\0“™%xªT•\Zä“WG•⁄iê⁄ T@\0Ë\0ÈW±ÅäZ*J¡EP0¢ä(\0¢ä(J‰¸soas·Õó⁄xø>j˘ÂÅê‰Ö‡I«`q]gjÕ’,ûˆç\\†êq«<SI7®§⁄WGòËﬁ+—<3∑”tFÄí\ZhTïeîÖ`é«ÔÖ\'≠]S≈v> ”~À®hM%îÏäÚ®M¯F˘è`7é}´iº/,whäD2ÙÛ]æ0]§û˝OjùtΩXnfºP€06®\0ëúgéùˇ\0aWÏ„¸»À⁄À˘_‡qæõ@äÒ¥;]\r`áR\r¿0€∑cûF~`@##π^ÀQ˜Öu)Æ,<>±™†√ -∑/ïn~V˘À˙◊i&ôÆlC‹bP9fÁúv˘Fj}CL’fî=≠ F†Ù åry<Á‘˝ö∫˜êΩ¥≠~W¯˜çÔ\"Ω∏[Ì_ÿDæJd!˚Ó6Â íFkï¬zñëˆy¸6⁄ÿÃ\0ú‰˛ÏèôΩ¿È^ç}£Íwv∂√Ì MlÉÀ`;bâtÌiö/*Ê¬ˇ\0.wÛ◊ßgä=úô∂ío‹g·çS√æ¥#O“>ÃÚHT†î1l	>m‰‰®Úœ=≥TºA/Ü|E®«.ß†$◊Gr`π€å3($Ç2∏\\ñ‰]Ò“ı†mÍì¥$9œÀœ===ÍI¥ùR[{p.£Yb%ÿÌ?9œå`cØZ=úô∂ñæ„¸5ö?€X…d<9nˆPL—X3Jv\0\n˛Ç«\'ú/÷Ω+¡vv\Z|∞Ziˇ\0`Ã¡·\rëªéAÔ≈E˝ï¨®ãeÍpﬂ8*:q–„Î˙zVÊè‹€o$Y%…%ó°•($ÆöeB£ì≥ãF≠QYöÖQ@Q@Q@!¢ä\0CER(4QLQE\0R—E Ö¢ä`>ä(†ä(†ä(†ˇŸ','123',2,3,'Arba.jpeg');
/*!40000 ALTER TABLE `senial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizado`
--

DROP TABLE IF EXISTS `autorizado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorizado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizado`
--

LOCK TABLES `autorizado` WRITE;
/*!40000 ALTER TABLE `autorizado` DISABLE KEYS */;
INSERT INTO `autorizado` VALUES (1,25888999,'Autorizado 4'),(2,25555455,'Autorizado 2'),(3,27549519,'Autorizado 3');
/*!40000 ALTER TABLE `autorizado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia`
--

DROP TABLE IF EXISTS `guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaLegalizacion` datetime NOT NULL,
  `numero` bigint(20) NOT NULL,
  `numeroInterno` varchar(255) DEFAULT NULL,
  `productor_fk` bigint(20) DEFAULT NULL,
  `senial_fk` bigint(20) DEFAULT NULL,
  `marca_fk` bigint(20) DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK220AA6936A5810` (`productor_fk`),
  KEY `FK220AA6F5B6E5D0` (`marca_fk`),
  KEY `FK220AA61B62CDF8` (`senial_fk`),
  CONSTRAINT `FK220AA61B62CDF8` FOREIGN KEY (`senial_fk`) REFERENCES `senial` (`id`),
  CONSTRAINT `FK220AA6936A5810` FOREIGN KEY (`productor_fk`) REFERENCES `entidad` (`id`),
  CONSTRAINT `FK220AA6F5B6E5D0` FOREIGN KEY (`marca_fk`) REFERENCES `marca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia`
--

LOCK TABLES `guia` WRITE;
/*!40000 ALTER TABLE `guia` DISABLE KEYS */;
INSERT INTO `guia` VALUES (1,'2014-01-06 00:00:00',78978,'1123',2,1,NULL,'2013-2014');
/*!40000 ALTER TABLE `guia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `establecimiento`
--

DROP TABLE IF EXISTS `establecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `establecimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `localidad_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD875E026F6FDC4B0` (`localidad_fk`),
  CONSTRAINT `FKD875E026F6FDC4B0` FOREIGN KEY (`localidad_fk`) REFERENCES `localidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `establecimiento`
--

LOCK TABLES `establecimiento` WRITE;
/*!40000 ALTER TABLE `establecimiento` DISABLE KEYS */;
INSERT INTO `establecimiento` VALUES (1,'Las Marias',1);
/*!40000 ALTER TABLE `establecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcasenial`
--

DROP TABLE IF EXISTS `marcasenial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcasenial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaVencimiento` datetime DEFAULT NULL,
  `imagen` blob,
  `numero` varchar(255) DEFAULT NULL,
  `boletaDeposito_fk` bigint(20) DEFAULT NULL,
  `productor_fk` bigint(20) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `tipoMarcaSenial` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK29CCF5B4EF42E298` (`boletaDeposito_fk`),
  KEY `FK29CCF5B47C9761E7` (`productor_fk`),
  CONSTRAINT `FK29CCF5B47C9761E7` FOREIGN KEY (`productor_fk`) REFERENCES `entidad` (`id`),
  CONSTRAINT `FK29CCF5B4EF42E298` FOREIGN KEY (`boletaDeposito_fk`) REFERENCES `boletadeposito` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcasenial`
--

LOCK TABLES `marcasenial` WRITE;
/*!40000 ALTER TABLE `marcasenial` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcasenial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Tierra Del Fuego');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizacion`
--

DROP TABLE IF EXISTS `autorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorizacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productor_fk` bigint(20) DEFAULT NULL,
  `autorizado_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC5FD1832936A5810` (`productor_fk`),
  KEY `FKC5FD1832EB275FF8` (`autorizado_fk`),
  CONSTRAINT `FKC5FD1832EB275FF8` FOREIGN KEY (`autorizado_fk`) REFERENCES `autorizado` (`id`),
  CONSTRAINT `FKC5FD1832936A5810` FOREIGN KEY (`productor_fk`) REFERENCES `entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacion`
--

LOCK TABLES `autorizacion` WRITE;
/*!40000 ALTER TABLE `autorizacion` DISABLE KEYS */;
INSERT INTO `autorizacion` VALUES (1,2,2),(2,1,2);
/*!40000 ALTER TABLE `autorizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_item`
--

DROP TABLE IF EXISTS `rol_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_item` (
  `rol_fk` bigint(20) NOT NULL,
  `item_fk` bigint(20) NOT NULL,
  KEY `FKEFD1438369B6E3F0` (`rol_fk`),
  KEY `FKEFD14383EA23B717` (`item_fk`),
  CONSTRAINT `FKEFD1438369B6E3F0` FOREIGN KEY (`rol_fk`) REFERENCES `rol` (`id`),
  CONSTRAINT `FKEFD14383EA23B717` FOREIGN KEY (`item_fk`) REFERENCES `itemmenu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_item`
--

LOCK TABLES `rol_item` WRITE;
/*!40000 ALTER TABLE `rol_item` DISABLE KEYS */;
INSERT INTO `rol_item` VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34);
/*!40000 ALTER TABLE `rol_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vencimientoperiodo`
--

DROP TABLE IF EXISTS `vencimientoperiodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vencimientoperiodo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `periodo_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC5E02298C9F7990` (`periodo_fk`),
  CONSTRAINT `FKC5E02298C9F7990` FOREIGN KEY (`periodo_fk`) REFERENCES `periodo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vencimientoperiodo`
--

LOCK TABLES `vencimientoperiodo` WRITE;
/*!40000 ALTER TABLE `vencimientoperiodo` DISABLE KEYS */;
INSERT INTO `vencimientoperiodo` VALUES (1,'2013-07-10 00:00:00',3),(2,'2014-01-10 00:00:00',3),(3,'2013-08-10 00:00:00',3),(4,'2014-02-10 00:00:00',3),(5,'2013-09-10 00:00:00',3),(6,'2014-03-10 00:00:00',3),(7,'2013-10-10 00:00:00',3),(8,'2014-04-10 00:00:00',3),(9,'2013-11-11 00:00:00',3),(10,'2014-05-12 00:00:00',3),(11,'2013-12-10 00:00:00',3),(12,'2014-06-10 00:00:00',3);
/*!40000 ALTER TABLE `vencimientoperiodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autorizacion_tipodeautorizacion`
--

DROP TABLE IF EXISTS `autorizacion_tipodeautorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autorizacion_tipodeautorizacion` (
  `autorizacion_fk` bigint(20) NOT NULL,
  `tipo_autorizacion_fk` bigint(20) NOT NULL,
  KEY `FKFC3DF4D4F71B4101` (`tipo_autorizacion_fk`),
  KEY `FKFC3DF4D4809070B8` (`autorizacion_fk`),
  CONSTRAINT `FKFC3DF4D4809070B8` FOREIGN KEY (`autorizacion_fk`) REFERENCES `autorizacion` (`id`),
  CONSTRAINT `FKFC3DF4D4F71B4101` FOREIGN KEY (`tipo_autorizacion_fk`) REFERENCES `tipoautorizacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacion_tipodeautorizacion`
--

LOCK TABLES `autorizacion_tipodeautorizacion` WRITE;
/*!40000 ALTER TABLE `autorizacion_tipodeautorizacion` DISABLE KEYS */;
INSERT INTO `autorizacion_tipodeautorizacion` VALUES (1,2),(2,1);
/*!40000 ALTER TABLE `autorizacion_tipodeautorizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canonportipoanimal`
--

DROP TABLE IF EXISTS `canonportipoanimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canonportipoanimal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `valor` double DEFAULT NULL,
  `tipoAnimal_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEF251FB4EA345518` (`tipoAnimal_fk`),
  CONSTRAINT `FKEF251FB4EA345518` FOREIGN KEY (`tipoAnimal_fk`) REFERENCES `tipoanimal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canonportipoanimal`
--

LOCK TABLES `canonportipoanimal` WRITE;
/*!40000 ALTER TABLE `canonportipoanimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `canonportipoanimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `provincia_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2FA590496844CE30` (`provincia_fk`),
  CONSTRAINT `FK2FA590496844CE30` FOREIGN KEY (`provincia_fk`) REFERENCES `provincia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Rio Grande',1),(2,'Ushuaia',1),(3,'Tolhuin',1);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoproducto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproducto`
--

LOCK TABLES `tipoproducto` WRITE;
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `habilitado` bit(1) NOT NULL,
  `nombreUsuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol_fk` bigint(20) DEFAULT NULL,
  `entidad_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5B4D8B0E69B6E3F0` (`rol_fk`),
  KEY `FK5B4D8B0ECA405FB0` (`entidad_fk`),
  CONSTRAINT `FK5B4D8B0E69B6E3F0` FOREIGN KEY (`rol_fk`) REFERENCES `rol` (`id`),
  CONSTRAINT `FK5B4D8B0ECA405FB0` FOREIGN KEY (`entidad_fk`) REFERENCES `entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'','g','g',2,1),(2,'','gg','gg',2,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `idReporte` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivoReporte` mediumblob NOT NULL,
  `nombreReporte` varchar(255) NOT NULL,
  `nombreReportePadre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-13 11:13:40
