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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletadeposito`
--

LOCK TABLES `boletadeposito` WRITE;
/*!40000 ALTER TABLE `boletadeposito` DISABLE KEYS */;
INSERT INTO `boletadeposito` VALUES (3,NULL,'2013-11-30 00:00:00',100,1),(4,NULL,'2013-11-30 00:00:00',200,2),(8,NULL,'2013-11-28 00:00:00',200,111);
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
  PRIMARY KEY (`id`),
  KEY `FK46AE21C7C9761E7` (`productor_fk`),
  KEY `FK46AE21CEF42E298` (`boletaDeposito_fk`),
  CONSTRAINT `FK46AE21C7C9761E7` FOREIGN KEY (`productor_fk`) REFERENCES `entidad` (`id`),
  CONSTRAINT `FK46AE21CEF42E298` FOREIGN KEY (`boletaDeposito_fk`) REFERENCES `boletadeposito` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'2013-11-30 00:00:00','GIF89a\0\0Ù\0\0å™Ô9qﬁZäÁ1iŒsûÔ˛ˆı˚·ﬂ˝ÚÒÌe^›c\\ÓmeÔslº^Yzs©[WÒÉ}ÚàÇÚçáÛòíÙõñÙ¢ùı´ßwSQˆ∞´˜µ±˝ÎÍˇ¸¸ˇ˝˝ˇˇˇˇˇˇ\0\0\0\0\0\0!˘\0\0\0,\0\0\0\0\0\0\0ä‡eâ§5çË•<ú“æn¬1≥q]UEQR=¿≈Å∏dé»[nI)*uí®/8¨p8íkªŸH\náïπñ…]H¡ Æ@\Zíw@‚b≠~C–hff]\ZÉnprxÑX^`Gçòi`G†é\r´≠¨´Éµ∂∑∏!\0;','987',4,2),(4,'2013-11-27 00:00:00','ˇÿˇ‡\0JFIF\0\0`\0`\0\0ˇ·\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0ˇ€\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ˇ€\0C			\r\r2!!22222222222222222222222222222222222222222222222222ˇ¿\0\0/\"\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0\0}\0!1AQa\"q2Åë°#B±¡R—$3brÇ	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄·‚„‰ÂÊÁËÈÍÒÚÛÙıˆ˜¯˘˙ˇƒ\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0w\0!1AQaq\"2ÅBë°±¡	#3Rbr—\n$4·%Ò\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÇÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄‚„‰ÂÊÁËÈÍÚÛÙıˆ˜¯˘˙ˇ⁄\0\0\0?\0≈¢ä(\0¢ä2\0…4\0QF(Ù˜†üO4©k∫G`®=I‡\na„ØΩX±º}?P∑ºç‰ÇEëU¡##ëú¸Ëπ÷ºfuù&ÀLë°éËKí0.∆ª≤Aı‰qÈößi·+\rO@ÅÏØ\0ΩíyñtlNr\\/NΩÍî^<÷h•î[œ$w/qî3l,ÖJèòa0«€≠U”º[¶i©c6‰Fd1 »∆HŸÜ“A›åı«Ph◊h¸5˝µﬂõ\ZÖ2)Å–\0«k0±¿8ÔY∫u∑û˘¨í(„cÄYÚ>ÿ¥Ôºa}¢ù2[k%â£ä&í4`‰! „ú»u8¨[kñ∑g áG·‘údÁ={qÉ@Ó ç›‡f∂ï÷6ë&ÇLmŒTÇs¥ˆ=}rh⁄mé†ór\\›\\Bˆ—yﬂ∫Ñ>‰R∆Xs»„®ÓıYn˜niôÿigò ·x;A==*ΩïÙ∂+r±™§¬a}√8RA8˜¬ä\0πˇ\0Œ®æX˚:\0‡íÕ*\n˜Ñ∑»pG\rÉ˙‘∑æºµíO+d±≈\Z±q\"« YbÓ˘ˆÜÍ;sﬁû|W~»Q‡∂dë⁄c*ÿπ%ÂŒÏÁ\0A‰‘r¯ñÍTëMΩ∞˘6FÍTƒ±6ﬁâA‡„®¡†\n7∫m∆ùyˆK•çe›Û* ØÉúJ∑ÿ˚VÖœÜ5(¶πéÛ°Ügâ∫´HO/pLÁ±Œ1ö©®Í”ÍR[4±G∑å$jô#©„$ìépAÿ\nµ/âØ.}€nù§˝‡V‹§ÛY:„a~ÿ\'‰t õKº\ZØˆj¢…xŒ#	ä‡∑oòwÁ”¥Ö5˚0∂Úßi\"Û¨—ÑRdtUªk∑†9ÎÈUÊ◊ÆÊ’Ìµ #éh6˘`naÚÙŒÊ,ﬂâ‰`t´0¯™Ê÷lÌÿF[©ê(!ô√}ÚIÀ∑|s”Å@ßÜ5fhó»çZHD√|Ë∏B@≤ﬂ.Iº˙Qá/^Ó +¥¬ÍtãÎÊÆ\\¶|ΩŸ∆C{qKâØ#óó°µéŸê≥®u\\\'kúå‰{ˆ8)ˇ\0	◊õk+€€I=¨¢HÁubƒ+ó\ny∆7¿8∆@¯EıY.DQ√õ¿+ ∏èceôT›ÇIVsû\rRª”Æl!ÜKÑX“d.™]KÍTØ^ˇ\0“ØZ¯íÓ⁄(¢€K ƒ™H$gWÍ2Aëá¶8 ’kΩ^‚˜Oä“DO.7/ø,Yÿé[í@Œy\0ûNx4<~’eêFñÒñ)ÖÛ„ÛQzÁq∆vıÔQ.É©3¡\Z≈˘·Û¬ôìÂ@7nõ‰åıÕOâ/\"iwIR)ó˜I±aÅ<uêOcNÉ≈7∂÷ˆ÷ÒE\0éë\n¯ê:Ä¿ù˘3Ö⁄3œΩ\0G/ÜµkxöG∑T\n“(Vï7É,BÓ˘Ä‰pp=E0Ë\ZûgEÜ7ñ	<©\"Ië‰xO∏8‹@œ©©£Ò=Ïwñó)≠dñDVRŸÛ!≤rF8ÎúzıÉ≈öçΩëÜ4ÑHX»\'˘∑nﬁ$…€ù 9 ú\0:bÄ\'ÑØñŒﬁHå<¶O0}¢=ëdQô7m$óVeﬁïyes]∆±		\ZEﬂ¡e9LÓ*√$VâÒDÊ%∑[¥&‹#à€s´ÛÛgÜ\\é{êx8™◊zı›ˆû÷s$G|ÊÂ‰˘∑3ùƒí7m|ÙQú∏†ºÊä;Û÷é¥\0Q€®ˇ\0—@QüÂö\0(¢ä\0ö“ŸÔ.‚∑èÔH€sË;ìÏ5π®Ai{lﬂcí&6å°VwòN$m\0∂p{Ú«öÁséy„–‚úô¨¨Cd‡éÿÈ@4öîwIã4Yïï\\C®{Æ7Œs”÷¥⁄mù±ïŸ%‹ñ¶cfM≠ÊÊPH¡Á#∑_LªùNˆÌQgú∞f‡ñ«SéßÎU∂`Öœ^˛üÁ&Ä7[I∑⁄ÛAkqsª \"|¥a£í@ÁìÄ{cìKì±D˛\\í*«#:èÔ6åmR[åt¿ÈÕs≈ä©a∆	:SÄ \01˛}hNÔO∑ã^ä–3≈≠m¸2n\0ú˚å„⁄¥·“‡ñŸaû“{%{¥]“∂KÄèÄºw Ûí√Æ+ó\'˜•N;ÁìFN·ÍHœ4©¨YAh–,[—‰_û&WÁÇ\0p}«cÕmGÂµ‹Q	√îµéCgˆta6#ÆOR«‚π#∆{ÒüÈG\\ı»˙P˜ˆE¢È\"ÂûBZóÕPÿœÀ˜vˆñŒqÎ….åãpñ—€N´Ê\"%ÀJJp{dçΩ\Z¡‰gÎÔ@˘â\\ëé‡–C.ènﬂgŸopí:ÃN,ÀÂ⁄œSˇ\0÷ıç4eéŸÌn%∏È#[©√6]∆‚0O\0/N‰V\n9v» ı#ÒAb∞∆x«∂h®m&ØKIi7ñÚ„…t%9¬ı„©⁄:ÒÈZ„Gä\rÎ7†Œ≤\0\"⁄ÃF1–s◊<b∞æÏeÜ@<ppx˜†AÒ◊ø_Z\0Ë¡UÒ[Õu/ó¢<†hÜI„úÄzpy4\r+O¿LíÁö!0ê`8\r”ΩsƒïPs◊”äF åÁß<q÷Ä5¥FH◊Pwfèm∏˘÷0ÏıË	Î»≈YÛ¨/†ê ìNm·iLõ&rY\0Så9ÎûµœÓ‡«∂i√ïœCüÂÕ\0mˇ\0f[˝ê∏ÇaŸÃ‚Ï∂Sv7l<sœ…9©`”m#π≤òÚÓÊà@å®ﬂü° ^k\0ØœÂÁπÁ∑ØJw\0IÎ»∂hhiˆ~BÆ…Ìf◊n˛x∆=éj_Ï®°‘†àZNë-‘q•À»\n §ısû£9ıÆ}F·È¸<z?«Û§ﬁIaœÀ«S˛E\0t0h–æûÚI¬CÃíFILå‡\0:rs‹t™:}ö‹ŸM0∑öÍUtUÜ\"FÊ8˜Û¨≤¯¬‡Ú}N?*êÆ”«~:zPY>çi5Ù•íE*∆Qf%ÿô8U#9\'ìÅ¡Ù¨ù˝©p®\ZFXeÿU71`0§Ñ÷RÆÓánzc∑¯”í1∆Fx†≠¨í‚÷Æ„∏4‰+O¬Ï<∂8_lÅ˙U[M\n#&Ê9s9ÖÅàê(‡)=zW<0H c=1⁄ìy¿nyÌì≈\0nÕachnC, í≈\Z∆Õ∞ç ƒÉê3Ç;‘Õ¢€	⁄ƒë({Ω√l[YÄ‹1éÄg◊wÆyáÀœ ˆ?Z2@Îúˇ\0üÎ@7zT1ËÎu8o-ªíπ\'Æ2ò<Ù√gΩü§§ñÜÚË¬¶wã8$2ÚûO\n÷∞áÃv‰Å”ØßJÒ∆Nﬁ¥–¡£@.d∂ïô‡k®¬≤ÙtdëÅ˙\nu¶óayfó8ù›ïÕ!á∆H\\dúìúpxÈ\\Ô`√ÇGµpvÉÄs¯s@/•¬tOµDíX∑ªHÃ£v@8;JëÏ? ±OSÎIø˜`ëï˛ÓN)ƒ{Ù†ˇŸ','111',8,2);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizado`
--

LOCK TABLES `autorizado` WRITE;
/*!40000 ALTER TABLE `autorizado` DISABLE KEYS */;
/*!40000 ALTER TABLE `autorizado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoautorizacion`
--

DROP TABLE IF EXISTS `tipoautorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoautorizacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `campania` varchar(255) DEFAULT NULL,
  `libre` varchar(255) DEFAULT NULL,
  `renovacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoautorizacion`
--

LOCK TABLES `tipoautorizacion` WRITE;
/*!40000 ALTER TABLE `tipoautorizacion` DISABLE KEYS */;
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
INSERT INTO `senial` VALUES (1,'2013-11-30 00:00:00','ˇÿˇ‡\0JFIF\0\0`\0`\0\0ˇ·\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0ˇ€\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ˇ€\0C			\r\r2!!22222222222222222222222222222222222222222222222222ˇ¿\0\0B\0ù\"\0ˇƒ\0\0\0\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0\0}\0!1AQa\"q2Åë°#B±¡R—$3brÇ	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄·‚„‰ÂÊÁËÈÍÒÚÛÙıˆ˜¯˘˙ˇƒ\0\0\0\0\0\0\0\0	\nˇƒ\0µ\0\0w\0!1AQaq\"2ÅBë°±¡	#3Rbr—\n$4·%Ò\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzÇÉÑÖÜáàâäíìîïñóòôö¢£§•¶ß®©™≤≥¥µ∂∑∏π∫¬√ƒ≈∆«»… “”‘’÷◊ÿŸ⁄‚„‰ÂÊÁËÈÍÚÛÙıˆ˜¯˘˙ˇ⁄\0\0\0?\0˜˙(¢Ä\n(¢Ä\n(Õ&G≠\0Ö§»ı™⁄•ΩôXÿ≥Ãˇ\0r∆Áo√”‹ÒM&›ë2íäªe¸èZßw®⁄Y·gùœ›N¨ﬂEü¬®ıCõâ~Àh°9¯ˆˇ\0Ä‡˚’ªM2⁄‘*•æÛc,ﬂS‘˛4Ìª˚àÊúæo_Ú+ˇ\0jﬁN1kß»√≥‹0âO·À~ïC¨O˜ÓÌ‡ëBX˛lq˙V»âGl”ˆ”Á∂»~Œˇ\0ü‰sÌ°›I˛≥UΩcÏQí‘√ˆ’u}|Ò˛‘båSUd∂dº=7∫¸Y≈Õ¶xäƒo≥’¸?Âùƒcü¯®l<o-ΩË±÷ÌæÕ.qΩ~ÌwG¿¸F≤ÅlmÓÇÖîK∞PA8Æäçi*u˝Vå‚≈Bxh:¥§ÙË›”˚ˆ;»•Iê20 Ù\"§ÆS¡2œ°AÊíHA>ÄúWSöÊ©I8ˆ;ÈTˆî„>Í„Ë¢äÉ@¢ä(\0¢äLÒö\0Ú_ã˛=’|)>ôg£\\,3ÃØ$•£W˘Azé¸˛Uâø‚vªÆ¯ùÙÌjÌ&éH¢ƒJ§0 „Ä;gÚÆ?‚µÎÎˇ\0n-!%ÑMúxıÔˇ\0è1¨Ω6÷Á√ü<ãPC⁄N˚7p©∆‡$UF.RQ[≤g8¬.rŸKÍZ‘çv4Õ3k^∫YO+ûÁ‘˙\nµ¶ÈQZ#Hs$“…3ÚÓ}œß∑J‚l•õO≠´A)¬÷{ë1é¨Túı∆+ ¥ﬂã^8s=ºwm{s4{alôå‰|¿*Û¿Ëx≠*•È«¶˛ftÍEUñÔo%˛g∞¸WÒN•·\rZﬁÈ/\ZO%‚ƒLâ∏(Á˙\nõ·äuxeo57F∏Û]rã¥`t‚ºü≈⁄¶≠™|“Ê÷dñK√™Êe⁄‹,∏„ï·ùc∆±xVKo\r€4Vê;…5 ﬁ›»ø†&±:O™r\r.k¬˛|J’µ]YÙ]jÁÌ%£/Ã†6GU8Î«Ú´~*Í:.Æt-ñ+à‘ÓJ!à»U#°êh⁄∑ZZ˘j„∆ﬂ<;,zÖÂ“$ﬂ2≠ƒHUΩ±èóÈ≈{Oá>#i˙ØÖ-ı[∆Xfu\"HT‰ÔËi∆.N—WdŒqÑy§Ïé‚YR4/#U,N\0Ø+Ò£/ãuÿÏÏ≤ma$«=Z¶æ’uO‰[#[i˘Á˝°ÔÎÙÆª√˛ÉJ∑\n©ñ˛\"zì]–K\nπ•¨˙.ﬁßóQÀ\Z˘#§:æ˛K»–—4ı∞±é%\\µ;R\0\0¿ßWõìª=H≈EYQH†¢ä(\0™∑◊1⁄YOs#mé$.«–í*µ\\/≈ùW˚+·÷® €d∏AnºıﬁBü¸wwÂ@9Ë⁄Õ∑¸\'QÎz≥0à‹ΩÃõWq‹r√ˇ\0≈mÎû$—Ô˛ «´ÿ;i°Tî»õ|m˛AiüºåûÒÆ§û(`*™a*	cúı–Vßƒ_Üæ–°‘lÁ∫îÑr	ôH\0Éœ\0wÛ≠)Õ¬jk°i™¥ÂN[5c£o_k:t†¥rŸN#`zeJÂ˛Gû-πÛ\0‚€ÇG?xUüZ¡´¸0÷%vo¥iŒ2,6˝G·X_\r,\'‘uÀò≠ﬂcã|Áë¸C“∫kNçzäQ˜oø©√áß_FQóΩoÜ›QÈˇ\0„ä?ÿ?‚`ôˇ\0ørSæ¬íx,ñ_˘nˇ\0Œπâ˙N´ßxn›ÔÆLêõµU_1õùèœ#⁄õÛ‚6ó·_œg}ˇ\0hÚB2%œAû‹˜5ÕVÑ≠\\Î°RU!Õ8Úæ«=‹˘?¨QºÀèA±ø¬Ω{«Z«Ç|52‹Í:]ùﬁ± ,inç)«Ff#Å«\\Á–\ZÚèÖ≥^¯˙+êÑàcy]±¿»¿˛uü‚kêøÔÊ÷cyaèP>dg©à7 1È¥\nÉr◊ç<_¨xØNÇkç),¥µõ0≤©%õ¯èåÙ´∏¯G·»5_%ƒ‡∏8O{˙◊-Ò∆z?à4À7GÜCª˘è+.≈)TuÔ^ì3˛Dı\'ßûˇ\0“™%xªT•\Zä“WG•⁄iê⁄ T@\0Ë\0ÈW±ÅäZ*J¡EP0¢ä(\0¢ä(J‰¸soas·Õó⁄xø>j˘ÂÅê‰Ö‡I«`q]gjÕ’,ûˆç\\†êq«<SI7®§⁄WGòËﬁ+—<3∑”tFÄí\ZhTïeîÖ`é«ÔÖ\'≠]S≈v> ”~À®hM%îÏäÚ®M¯F˘è`7é}´iº/,whäD2ÙÛ]æ0]§û˝OjùtΩXnfºP€06®\0ëúgéùˇ\0aWÏ„¸»À⁄À˘_‡qæõ@äÒ¥;]\r`áR\r¿0€∑cûF~`@##π^ÀQ˜Öu)Æ,<>±™†√ -∑/ïn~V˘À˙◊i&ôÆlC‹bP9fÁúv˘Fj}CL’fî=≠ F†Ù åry<Á‘˝ö∫˜êΩ¥≠~W¯˜çÔ\"Ω∏[Ì_ÿDæJd!˚Ó6Â íFkï¬zñëˆy¸6⁄ÿÃ\0ú‰˛ÏèôΩ¿È^ç}£Íwv∂√Ì MlÉÀ`;bâtÌiö/*Ê¬ˇ\0.wÛ◊ßgä=úô∂ío‹g·çS√æ¥#O“>ÃÚHT†î1l	>m‰‰®Úœ=≥TºA/Ü|E®«.ß†$◊Gr`π€å3($Ç2∏\\ñ‰]Ò“ı†mÍì¥$9œÀœ===ÍI¥ùR[{p.£Yb%ÿÌ?9œå`cØZ=úô∂ñæ„¸5ö?€X…d<9nˆPL—X3Jv\0\n˛Ç«\'ú/÷Ω+¡vv\Z|∞Ziˇ\0`Ã¡·\rëªéAÔ≈E˝ï¨®ãeÍpﬂ8*:q–„Î˙zVÊè‹€o$Y%…%ó°•($ÆöeB£ì≥ãF≠QYöÖQ@Q@Q@!¢ä\0CER(4QLQE\0R—E Ö¢ä`>ä(†ä(†ä(†ˇŸ','123',2,3);
/*!40000 ALTER TABLE `senial` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmenu`
--

LOCK TABLES `itemmenu` WRITE;
/*!40000 ALTER TABLE `itemmenu` DISABLE KEYS */;
INSERT INTO `itemmenu` VALUES (1,'Salir',3,NULL,NULL),(2,'Salir de la Aplicaci√≥n',NULL,'/login.do?metodo=logout',1),(3,'Usuarios',2,NULL,NULL),(4,'Alta de Usuario',NULL,'/usuario.do?metodo=cargarAltaUsuario',3),(5,'Modificaci√≥nn de Usuario',NULL,'/cargarUsuariosAModificar.do?metodo=cargarUsuariosAModificar',3),(6,'Datos del Sistema',1,NULL,NULL),(7,'Localidad',NULL,NULL,6),(8,'Alta de Localidad',NULL,'/localidad.do?metodo=cargarAltaLocalidad',7),(9,'Modificaci√≥n de Localidad',NULL,'/localidad.do?metodo=cargarModificacionLocalidad',7),(10,'Per√≠odo',NULL,NULL,6),(11,'Alta de Per√≠odo',NULL,'/jsp.do?page=.altaPeriodo&metodo=altaPeriodo',10),(12,'Modificaci√≥n de Per√≠odo',NULL,'/cargarPeriodosAModificar.do?metodo=cargarPeriodosAModificar',10),(13,'Entidad',NULL,NULL,6),(14,'Alta de Entidad',NULL,'/entidad.do?metodo=cargarAltaEntidad',13),(15,'Modificaci√≥n de Entidad',NULL,'/cargarEntidadesAModificar.do?metodo=cargarEntidadesAModificar',13),(16,'Alta de Provincia',NULL,'/jsp.do?page=.altaProvincia&metodo=altaProvincia',7),(17,'Modificaci√≥n de Provincia',NULL,'/provincia.do?metodo=cargarProvinciasAModificar',7),(18,'Marca/Se√±al',NULL,NULL,6),(19,'Alta/Renovaci√≥n de Marca y Se√±al',NULL,'/marcaSenial.do?metodo=cargarAltaRenovacionMarcaSenial',18),(20,'Pago Boletas de Deposito Marca/Se√±al',NULL,'/marcaSenial.do?metodo=cargarPagoBoletasMarcaSenial',18),(21,'Modificaci√≥n Canon',NULL,'/canonMarcaSenial.do?metodo=cargarCanonMarcaSenial',18);
/*!40000 ALTER TABLE `itemmenu` ENABLE KEYS */;
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
  `tipoAutorizacion_fk` bigint(20) DEFAULT NULL,
  `productor_fk` bigint(20) DEFAULT NULL,
  `autorizado_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC5FD1832936A5810` (`productor_fk`),
  KEY `FKC5FD1832E1E2DE58` (`tipoAutorizacion_fk`),
  KEY `FKC5FD1832EB275FF8` (`autorizado_fk`),
  CONSTRAINT `FKC5FD1832936A5810` FOREIGN KEY (`productor_fk`) REFERENCES `entidad` (`id`),
  CONSTRAINT `FKC5FD1832E1E2DE58` FOREIGN KEY (`tipoAutorizacion_fk`) REFERENCES `tipoautorizacion` (`id`),
  CONSTRAINT `FKC5FD1832EB275FF8` FOREIGN KEY (`autorizado_fk`) REFERENCES `autorizado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autorizacion`
--

LOCK TABLES `autorizacion` WRITE;
/*!40000 ALTER TABLE `autorizacion` DISABLE KEYS */;
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
INSERT INTO `rol_item` VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-28  9:53:48
