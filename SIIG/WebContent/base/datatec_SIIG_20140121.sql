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
INSERT INTO `entidad` VALUES ('RN',1,0,'','20222222222','Gomez 456',0,'gana@gmail.com','Direccion de Ganaderia Ushuaia',0,'0','CUIT',2),('PRD',2,1951,'','','Alameda 456',22569874,'jlcorrea@hotmail.com','JosÃ© Luis Correas',5559999,'','DNI',3),('PRD',3,1987,'','','Alameda 564',22369258,'rjerez@gmail.com','Ricardo Jerez',789,'02255-456789','DNI',2);
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
INSERT INTO `canonmarcasenial` VALUES (1,100,'SeÃ±al'),(2,200,'Marca');
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
INSERT INTO `marca` VALUES (1,'2013-11-30 00:00:00','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r		ÿÀ\0\0´\0Ó\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0S\0\0\0\0\0!\"12BbRr‚#AQ’¢²aqÂÒ3CDScsğTƒ‘“¡³±ÁÃâò	$5d„£ÄÑÔáÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0<\0\n\0\0\0\0\0!\"12ABQRa#3b‚‘’¢ÁÑ$qr±Âá¡²Ò4ÿÚ\0\0\0?\0ì¸¤V-ƒ8ÃŸŸÅHÈDSyR‰;ß2¬æg0i«eho>ñDĞÒË+î\n„ç\0Õİ5Qb7zoÌ¬ª.™àNDZœ÷ngxí{IrdI¦IrUF	ıaíû‘ º¸\0)µ4ñ\Z–²m¥È{¤ám—€ü:ÔIõ2§ß$“æ…eZ¾Q¡*6Ã†‰Ìj!ò×–”©®N¶ã>ÒÙpë£oàŒûÁeÙ–p%r¹¢¦¢Ğ8ÿ\0ö™l¿\Z6¤,kEin–^]È(L;îğL!Fmóeo5Á£ã×É8ì[Y·\r£\0·®qœQÊÖ­—9b>†Ù)K’E—¢>‡”ºıØ~áİôjyšÁr$ÔãkÆ%ø{\'+p÷¶‘¾`óV ªÏ¡èê]Š$Xãˆˆ¹îDÍUab¶ú*“Ÿá¾!–ş\'I0Tâ§J „â§zˆ[_ëæõ¡1ærY£uRnŠåWhªå\0øâas0rQ€ô “¯8•}#Ùïg†–8AŠwÕú7MåŞÑ¬ÄÆ[?öËıÓß‚4–Ö:0‹L³nM8»D€~JşÜ^«¯fÊ²o9-.‚	¹\Zˆ¹DzŠ×Rnz|ËÍ¹T,”ÛlS$ïQ[‡Ü¢%Š\nsm£Ù¼Ôg$Í»Õ0n(+ïù¼Ã,ù%@„…IŠÓ“B¤d‚)­T—$HŠ4!+¤™wJM\"¾b:UNÀöºBöÅ»9mÌèšEs§=€Óİ£è#£iÉÈtê¤)Ü\ZÏÅ2¯^>J´ª-	Ì*zÆkŞ(ŒKùIk×*”ô¾Š_$lÿ\0êÅ“eˆùÊ‹ó\n›+5î‡(÷ãmtoM>JĞI¢jRYVÔ¼CÃ²R€]£\'o5å\'Ôì¶×S¤¦2Es@j¹PòSñp|PÃfa	QQQw*.i\n;ß€²f­)Ëô¡Hƒ>é}Ü¡~íĞµ¬ÅR`ÉÖS_¢]\"*u4r î´Ó|ÑÙüw·”Ä+¨¢±Ï÷KÊs@œi[$ÔFÒf)ŞÛq]«×/2(L<§­¶Ó¼<cãŠSÑK3+Sğu¾ŠÅ•EñYXDAï÷˜Y4O+ªb4­(„4ôjÓØƒkÍf2òÄÒ.âIWß~€ø#¢e~K–ìÓt@¯~+IÊ)	\Z›ƒ©[hs_{ƒâ†t6€ç%Vp¿³%œÚD‡8ı=$Dù§‡€|ë2èYr\nŠñ¶N\'4Á‰¹ÑÅéiâ6a\\ÙÜüçMcE\'Ñ\n¼aÃ7eI\\\ZaWó‹¬ÃøŸÄÓM6Â ¶~Ì—NAç~Ë¢Y·…æ¤‡I6F¢*z©ÛğBû_ËZYÿ\0LZÀ€	K’t‘×o¹»n;,â8Ñ«n&âEÙTì—kÇqïœµ¬ÊËL€£Ê:ÁxO©¢å.ãÏ…¾yÈs‚Š:¾ôÖÊKMr1½·½ğ!lé*iW÷¢\\?,iñ{\nt(³2™Ù2huÑÖßIÄ3°èä\\MæÁ/£w-ÉØ.¯ùº\"eäû‰(Ê>¨­ÒÑªêmK“øGJœb÷Dû¾!Q®rlgãáuµÂ<@	¦üÆw#SJAÃ^>‚/ÚöN#õšı‡<.7·.k²ª¹V²s¨9c×°ùeGÙEF\\-Ãú7=ƒNİÕ¹ò\'hÙˆÜëF•F4šÓÂè)E&Š6ÚÇógÌ*ÎS7ÙõnWS{«o74È:ÚæiíEæêĞ¨ò„¾†„2,‰#\"!’&D¨EHƒ}óç‰N\\\'$Ä) \Zç£È{BDq¾¼¾f&ÛÓÈ›\nJáˆQWxáKæm[Âš42Í^«[„—d¥Ñ_q4õ—dzB\'	‡qZÎO×\\»&\'òÀÖ*ÙËúë	ŞpCæŠ“T4¦äo««£‡Oé~«ÇëXæç™‘iu\nz•ç?\0R~ü<nõ˜Ü¤°6™l€æ««‡ˆŠ#wRÀ³–afXPqãR- ÌÙ©q&‚7—Şî¤ä¹3¤6„—i[¦¢é*ƒ†.ÉTDÜPî²Fo!6©|­—­™ÔaŒüİ²Ùö\"~ÕÏçâ‰ô·åìY@–—ÉfM3U]£êuÎ®ÌL.eÉK:UÔdtó\n$U ¦\\¡Ò0‰»—\nf~Ğ$šÚW\"µUÂÙ|\rá8&ÑŞÑ‡æTe	•·Ëòªáf=iºO¾FŒ)fn£u{àâä†ùÅk8VZI°7JK/Í6]’.sèu¿£$ÊIJdM&¡«D‘ë?–7\nè=<ø´ÚnZŒËX6¢ûã‹¼6Ş£HÛ••S›dû(õ?©5™ˆ¬Ûè:é¸«˜¶ÈŠw¹;ñÑ·fze©u;AÉqÈuT‰h«¸1}é;\nW$J4ÔŸ¦xûEÙkü9Êÿ\0_—ç\\StóD\\Á¡_Dİûñt_(£Ûª›oİƒ}õuÑ6ôí‹h*0®g²J«.î}$TUñD.Üò~qµÒHÌ®i¬Å TN—Z…F\\Wçİ¡¤ÈSY¼I°	÷»ÇÑi^)K\nXXWŸT«F§¶KÛ.FÇ£Ts<\'G#ENyŸËŠæ\"ÙŞ@ÊŞjÍå·¤V—ra´Ü¤\Zt_ë\ZÛ÷â{…ØÌS“.ä±4â‰’’ÈÒ5m	\rcİ|~’{SµK’ê]\"Vİ^Ê‡ï CZM@HrTTÌIz}p¶¶[6Ya±{h®ÒÇ­ã’ì³`‚N˜ªe|IÃv\'kJËeáÔIø¼Q9ˆ¦$^E“–\'ĞtˆÙç‘PD#³Õµ)ddgìê9D,|(ß¼?˜‘=´Uo=‡‡XOIôDû	±s!IiÜœiRpÒµ—;C×{³z¥-•DÑS#eÄÛNğÂpD‚§%LrÍXŞcü>×r5£ˆÅVÛ\nÑÊ~¥Ÿ’Œàø”ÏvòZÜ[ÂjQfdı$¹%d\0µ¨uhaC&ù4HBª*%P’.Ò,0ğ»-ˆ¦Æy%²aÔ\"\\13Ä<fu¥œT%$¨ÙeéWz!=\\”o°ªŞ	tTä§	ş,ZIä¤i|\Zµ%Vf•~œ‹¬y\\Ë¡ÑÀ{Q±ğ&cÎœ*%Àö_^#-‘ímQ·×˜pqô|Ôšf\\ÉUxŒx€z;PÑ¸WçÏ­I¤l“ÍåÑ\"ëpÉÏHét†ÿ\03xháó”TçºIö‡•t;iÎS.Î³èl\0•\\¡œÚ5§›½,PÄ™{<6Ö§‰62ü#Ú8ÂÆŒCIQniìÅ–¾ÑsR\ZÂ<*ZüöĞÍÙ·±ÚFû9öˆ9{±—–S3ÈËKCCDÓÔpğ·ˆ–WòÅ«®¯ÉÒeº”$|‡§ŸÇ±Ü‰%…€C´ş–iÌµ“Î¿°(ø¡©;< ŸVäDˆûö±§©=ˆ°¾¢¢1§’PßxÇ‚âllÄš8·ü¿uÆÙ ˆ‰)/’n©±/™\"®á­œI®R[/`¶Ú|©N¯^øò‘õı–Ÿ´qËƒ\'³å.\n©ÖÔ5SEœ¿[˜ zÙG%Ôl¸Z¼%XDV~Î¶l½¦Ü[FTu¨9R¼)óû†}Èm~S ]Kše¹cufZBi»%ORÃz:Èç£¨¾~Uf<lö¯›öóıÔ31R^|iFø¦Ûj$í¯éé÷©†ÿ\0«”\'±ƒ	Õó¹?A<ÚÖŠB8£ò—_74l°?–p\r§¶\'XZ]L•rÕPÍøi†pÈLùOŠ±WC±wšn\rÌŞ!ÿ\0J‰Øfé=*U«¥Q¶ém¡0™D¶jf^ÃADCx“4Ngæ\"õèÂ=1jú,„Ü“„¹°ñ:ËÁŸ\nlº#ÑÍŞˆÿ\0”UÄ)¦†m…R ohIPšâÍ¿Ÿ.nô<¥­ï0N[Œ³ÕX{ÓEŞ#nUÏWğ94ñ¸êÔn.jª»(<£\"Â×\'I³jTWiÕN:y[ü|$H0£	P…&§WE*)Z*b<ÅÙ)‹¶®ËI\"µ,)£¬F‚4öe¯5RÕ¼İèş²ğ¬ìP6Ö§WòRLEÄæ,æ¼ÒÏS’puƒkõş‘Ş¸DX6<Äûê-¡¼ñ–fJ¤¹w‹€{ÿ\0Oğ»^¥Çªb_´©“¦Ÿ»^ÿ\0Dt@$“-¼i7©.Ù¯W9S*Èh[eO¿#õSì$ªŞ“v6è¢˜M‚lJRëù=0šÑU=wGïœ8ò…Öâå&¶èa”i\0ŒÈ«©iå\nPazÙ%9/72yL1°Z>¦¬UYTXŒâ=†³Ro²9Tàd5nBŞ?,I£ÍÍË¸›;.LXÚÎ¸–Ù±&¤]JÙpW`ÑK_tù¾láÖ:nnm3MÚqMßÄX·ÎRz¹w„EÔRaİhYjØ.hƒ_ì	Şä™kß¡2Ëİ?Ç¯¦«mhe/RBPIæ„¯ì¥÷ß¥m6ô­‹„9‹Íëï7ÂP­¸zĞ‘´\ZdQE*Iv–]ÆÇˆº¨áÄJÃ¶ç,×•¶Im—dú©æïñÇKaíôó©2˜6ôZ:óUÖ+@í—½«\ZzræcŒ¹T”ƒó3å±¬,^¼\"Õ›<mTÚKFñt·ø½%p”vÁ;,ÙàUApA¹±My×µòÿ\0”“¾ã“næ-Ú$ëì‘p£àBD(w„aï%*6ÍŸg¦­º3¯Xè›1 ùÓà(Àm\Z¤íÖËÕ”ğ¨˜dÖ7-ïvÊ°0ŠîôÉÚ“H»k”›%¸\ZËåûOœaÏjÎĞ>Ò]É6-¶ˆ(‚ ˆ\"ˆš‘8F#“†ªª»óõEJÜn“š8ªs6}.²D•70àÜ­é`¸¥z××D™ıéVKíO¢/œMËşìØf6MƒT?™\'sÛÓ}0Ş^ÓZÒ,“õÁÊ‘t¾åŒÁÃ‚TQõÛäüÊĞïÕ¯éÌ±^-¥õ¦èËoeÕ’Œx²™®l[<yêöCúÚSÄkip¨ÑÂ\"R*ÑÂ9\'êüªIbO×©u\'©w¤*1ºê»¡iÊ&O0¹¾Ÿœk™KÃÅĞ17³ÅS\"Ö™núbXÁ!‚¢¦y¦J‹ëTxÅUYÑS½Ü:¦xMT´â2Ÿ^fõ\næ6¤·¦fŞRQ—–f‰qT¥Q×©*ñqw‚\Z~OvıVLººH*Ùyº©t¹£l~!ğ²ìp±Ú´œÔ’¤Bû9oE!§EŞÒˆÓßçËV÷YòÌ4¹˜<³³;€‰ê˜ñ™xy¢ÎfÙß‹­™BX¤{8šÑ³_£»¼›~PödìÄÓ,7Q°àf\r† B’\'{›\'Ì6Á¦$ÅšQqÔJ–­L·ïqYÃûÃ”‡€+‰ G„7)&¯’9Zú_¹»AÄª…,‚]¡*UŞYÆÛ)ê¢Ù‹äæ^c[A&bk’nbn=6Êrˆ¸›*ñjhW§ö‘ÏÓ““V„Âf®L>\\(•*§ty~iÜ\'÷]¤æ—Bßì‡[Ä=’äoã†¥£lÙö3T\nš¦›ÛyÎ¢/¾q|jih÷)G9ùªGõ_:ùYO%Ù)S²G]sH¢+RŠhÀr\"íqCF4×JĞ\'¥Ùt†‚tÅÍ[TÆå#+S)K)ñO`Œcà®‚\"2\"Øº-	Šx0n8äÄ©úGœ&IrÛ-¢Ñ—izãKs1RjH‘™Ğ3Õ™OÛúAúbCˆ¸šıŸh(£²æ\r8 ©I\np•%ß=¾ÔI%­‹:×n‚AW8aáî—7‚¨ÓG,»j€ÏŸˆR2ayá+“ğ[œ¤­F?Fø.­ZŒ>øÇè±Q‹&a†QQ•xGÚ¾ŒµÂÙp’fRe³“ytjà!­Y‚—0ğ9±ÜV½ã(RHjˆÛï“Og»FLº9ø&‹»œ$Ä²\0Z3¸Õ8ÁÂIfmÍæüİRç\nîL½¡b4Ù¦ÛföN9¤2«İ!ã’T¹46ƒ¯A3OÑ˜Œ¿Ë.	ZK!iÌÙæ¾…òÒK®{×xä½MRæ–Ø[vÊY—IÌ‘é—İ˜usA\'d<JBØ46ğæZüR¢H‚HMô<¤+ky¦·ÑRÆ¤]Œ‰¥©UW^k«(Ç _­?Æ1=¥ÂñF*B2ón“ÿ\0u’šp“mßÙXò{>Ø\\Ç/_ª.ËùÚ‹tkŸ«(O_RtTİÚ±óïSÉî>÷]ErÎ-«èL®lµ/Õ© öÇµ	öÅÎ5õık©;TÕæx÷s‰—Ùoİ_jfã®\\¿ec¶Y\nûV<o5×»ÛäŠ«—«Ú8æY&¬Ò5x~!%T#üYuúF=îKNb“€r·©^ó”ÆmÛ™È•š5†{õ\'ÓÅŒ¥*™jÉ}qn‡Â°6jj0)¤-™|ª\'=´”•”Êä‰d¥Ú\rjüĞ^Õ¤éøéçÃ–,ëoçA½#¥ë:ÆšS”kñCCîâÍJdŞJó&ÓìçÂ®´Uøø>ØUyBÛ93)fµš)(91—%C³Wp*2ğG ¶sê;«e…TÇ¾‚DEöuM\\e%I!oYv·§ªŸÃÈX2kfâl\'8K¶¾\"Û÷c_…·©·ßœ—iSE$2Í;²¤„¶¹¶ÄƒÁlAÂÉ™Ùó#yRS!QÍj§gh8>Ş¨o†å6ÊGfñ,Ö.&î\Z¾¿‹yFñyU™$©iGi­Óşrüı1¯¸10ZYÓ6ÄÖ¥\\æ½ÇOk¦í³fØÍæJ(ê¢/I2Wd}Àˆ#XÎüôä»ã eÇ@H²Íân­­£\Z*ë‡âr4eİÃêtƒ(³ÊZù.Š•aPSR\n\n\"}hEÑ›N‚¬AHŠEb!.1FÉ‘˜6Ú™ÈtKBïlòÕâà8G_œ%š”ÍÆ•^i7:ÕZQ¡¿ˆoyA\\ÇfÛeYD#dTUrRBáêÙMİLF-¨J¹+êÉ:K”#YƒíöW„Åş‹¤UÃÉiëLo&ûç2ùºÃç¥FÛ¬IGm6©¤‹›‹1|«d²«OBO›n.y~sB?&“İ‰~[rsnºû-è¦^²ÔEŸ.Ç$Dq®ĞIçæìíHó-²ôª’ïFDaŞ&HiñÆc&y	­“Ùjû)œ%c»oÃËú¤ö!ÜÉÛ=à3W\r¦”tHµ¢ •CWìË ş8ê›‡zRnÏiôÉÛÈÓ=Bèì˜øV!AˆmÎ´²Sˆƒ4 M›n¦HèÉl—7h#k†7l¤¥&\Z,éó·ô5oVyJ„0¿v}\\zòæO»Eˆ<´û:¡±ÇÕ¼B·Ú5ú¾¥Šé×éûR<Eõú3ú£ñ^F¥Naæ¥Å5Ôñˆgïmû•ÂI0LRqµ\\0\ZÁñ3ü\'6u±\'ÖŸãŒç’\"*¢îXCÍySÙ­¾¡Cï4‰­æÛ^‘# ğÄ_Ê¶ÅDã|z|Ü³„Õı…ï9ù¹™ŠíöSJyÌ.ïı“ºÏ²Ñ5®¸Íu¤Ü¹&k»Û£~¼³Ø!’–uÇÉ…šEöĞf_rµîÄ¹ù·´ÏM<®g˜Òá6Ü¤Á\nÏÒQÃ±ŒŞ/¤¾”\\WÔ9ë#RÓ©}‘£$AÍ7*oÏ‰c‚.w”•¯+’$Ö˜2¢hEä÷¿=ñÃFÅòÉsRMH´âúÉ‡I¥÷]ùá|ı“¥f&Ñú^Ìÿ\0røng«.¤Ó/ò‘G3ÏÖ©	/Ê¾Ì>6æØ_^`Û¢éÆê_ÊNÇ_ÖLsíK=#Ã±\nVËG ß[ªG\0›ï¹\'¹xÆVE×Ï,™\\“Ö¼ƒã\"ñG#Üû\"~ĞšuÆ”ÄŸ\"G¦Qr\0!ÒkğˆPØr[7^Û6¤]\'fåòÑ8İ ãœT˜rS_†7x—~²å†VYfHQ¶Y¨‚¡¤MGµÙxxÑË 7yâŞKoÙú¾ë	šI7uğŠù-ÙâÔõ¬\rç¢h˜hT—<Õ²|I}ñ/z&>R¥ùIVÕƒÑ›ÎhÔ‘‰F\\5pğñÄ7§ÏvJLòY©ò}ùÓi£%h¨é¯Â}¸eã¡(Ã\r½6Ş˜[s6›¦¼Ü¤¹xb®8u„ec6odŸ´Äg9Hz3éİı3İ,4´OHU æs©}Ú¶Ü(xa…Ô³d¦A†É&\'éS#]²lDx»\rñwö¡=}q~rqQ¦Yh–‘iŠ‰ÒN¢NåÃòlÃù‰gœ˜˜\rm¨€*úE¨„ˆˆ|#ÕÓ\ZüMåx]å,‘oÕb(Â-¥ãkûºèXº)Œ‚Ñ\" ŠEb…×Ê\ry¢ q‡\ZqW%¦ªKæ…%‰Š­L\n7h².œSÒzŸ¹-mYàëFÛ‰PÒCíçkÃ‚Àè“’ˆ+–ˆZ\\\"ç)t½\Z,\ZZWãŸOKù}i6!Ùó­ä§¸;u%™qÇ¥Ò°ót“y¢U~¾\rŠ£w]~ğL%£}@^d³¦¥Z¤sğ–ß~2ğ6YéKU¦m\\AD“,Æ’!.¡¬xøbYåf¸ÄÓ”¾Jä¨€¾´n£¡K¤êq¯´’ö’Òjy½Ö³±UÏÌ6wxfI,F·_#if)iæK\"}Bn şl»èvÃµK÷‹î1bHÍ\n2¯>BÉäH\"b\'Qˆˆ[ak6rJÛ“TT%¬?LÉÿ\0ÍÎPœÆ[®r÷nX	N©yãª‡Û–\\´ÓB%S¡GfQÄá&f-8Ç+!ª£2Hÿ\0	u?æfõ9jb[Á‰éiAOKj˜ÂÙ\'Ê£´3%ŞE;$â¯Š¸×İÛAÔT¥ÉÌ½nYÉğC\ZïÎLêÚ´>Ë^Ä?™˜v,ÅÅb$wmEaÙ~Mr.&Í¢¹¯*±/Âq²ÿ\0Dyé®i«Ñ„N¬‰­_÷‚ıs6ÄöÃ}İUÂ§±Â‘/ò\"xãøªÔÎ=R0|˜_×^şé¿Ç—’Ó]şå¿Ç2ŞïgÚ+òÅåëİı¿z$îÑİV|BuËÿ\0èŒÇô×w~Ä?im/&©6Ó]¢™öW@ñ=)oL»®˜M_¢)/÷æp¼·ßš×³i\"ô€Ÿ4rPÇÑITäüRÒÁù&ÿ\0^Ëÿ\0gşò\"¶µÇ•é˜ÿ\0ÎH}×öË³:óü¥¯Û5`‡ÉËÀóŞµñOY‹òU1Ú3’Úºcù(Z!gÛo!(#dëNŠ.ˆşk¬†4wó:/¼è2SSîªhÜ$\'(ªªŠ×\r1¿Á¾ãö%ªTìÜ£c¥q·8\\j¢© £b¨6Ä•‰%š ¢å–yfûÎåı¤eğÂ:¨œ¤¾k3-¾]\r=)ƒy$+$}À±f¼i2JS!>ö¼èR—}h\\¶66C³œl»¬Ì4×œ>’òÌš¸k˜¢–Í#Irñ@<Ÿ$]œ˜´ßÈtÂa.ò	¸CÒ‹U‡1jü©Ù‰éyf€œ f¤\0Lõ¸E÷í„4ìı;<¬ÌY}ÒÙ×9µ®â\"6n–®ÖÄùYÑÙ’âŠ©‘M<™™\'i9ügîÄûÉjeçÆnió\'MÃĞwí)Àƒ™îNÌ@®ÖPõ ğÊ´›Dc_‰ÂØîGFÜ‰yfÂ\\ieR¡âÍjõ•{q¢Åf¥vqoñ/ö±¸xLò\\ôo%#‹¢‘XÍ\'ˆ‚ B\"™E`Íc•1²Yé@İ—3kÎH–×ØãÛ ûQÕ±ÄweE¡ó°BdÉH‡4.Ï–¬’aumO5Ès3ôU+\")G²IÜÜp%Ñ¤ë\"ò¡ƒÀ\"†$<ÔğWÜ¢$¸¹|‚RÑ–7¹9ÉBiÔÊ¡P*ê£IîÆŠ÷`˜¸:iEÀ-¤l4Té>oF±FÍtìyRt_³_ów“^ÁôeÔ5è‚\'í\0S>Ú›Gñ\n·Ù&ş1 ©ÕŸªÌ·°üØTŸ²Ò*’¶YŠsşĞp{]èßZ‡òõ3,\"ÊZ\rèX}KBª$%_n‚J“¤¢=eáSÆËS–[ê\ZPVHÈTK™ºøH@¶4o\',D®Ó³V}ªË³-“Jë´»˜äì¸[;Å\\db—flìÚ:ôZºk 0yD¤]-&ï„¼ÿ\0šÄ³°&|wÊØ…–ı\'—Èq)²ğŠhx¬û¾¾	ï„¡üãY*§­·DzßºHø¸>q6Ò¸„•30àPEÂC·\Zí€0æeã2VLç‘ÔÍÃì•Qlë	I7ˆ#ÊiM\\¥,g[ºÔ•j\Z-§‰¡iÔïòÀ~8ãËvÌ”´4-“®L°ûªË¬+®¨•5‰Ûƒèè¢£¢“èì]íkUQµ;UÄ-S\0ûtùĞe Úª¾\rˆ€&f»ù+RĞ™\\¸§íšĞ\nl  ®êi^í1u¡.$Š†‚£¿\"AİâùãğúOYÓ?öÆ¦³¦FÜ\'Xq©v\\sóf;7Ü\ršboå+z&ç‰Ë>ÌfeçY+ÌœÙm¢!= íÀqßzk]Uù0¶™z)íæ™³³AFì§IV‘mH\\x—² Ä³Æ^\08ĞÚ·Eº@–Î±\ZGeÇ¥ÍW³O™†ÜG|œl2³Í×­6ÊZbe¬åŞ˜FY«H\\\r^Œ€j„Î,şQ˜´	â—™;¬$À™q*–¤„lhı mGÇ²İYŠ…ÆKtOC	&†Í°Õré\'µ÷i¢\"öÏyYö8÷ÿ\0ìÃoğÍ™yLó†`750Û+¤\Z½	€R\r.QùvxGÙ©3_QuDÛ\0qÌê¸Õ˜Ë³+.m¨– ëlŒôÃ¯¸2òäá7ÅMDFft€ü£\Z«á?<^}k=¢a¤lÊ…Pö&´Ğµá®!·zfzÕuÉf‰ıĞÒ éoeº¹8ÇM·ÏÛW¦´.MÚ“£h*óq:Ô—”;\rÖ}Šø£<¯4öÑ—±ÑPEA\03J-!óisŞğŠŸa5ì	»IÁ`Pdä¥4L ¥\"ªN\rGõŒ@{•D{±áE×[“hĞ•²˜$3¤©Ùok°\ZUÉ{*Ğ™lŸš!f\\A•TF‘!ƒ7*ş_s°#!ÒÏ¸Œ4›DÒçâ\"ØÔö} Ùmj5ô²Àv°\\*Ş\ZnVê¡·©‹RĞ`_pŞD=#Š¤J´T\0×Á¢Ğ\"\"\"&¤L‘\"…3J„\"6ÒˆÈ;&]”2Ûs·ŸPC:Åk6ònVn‰}êWU‚!b¸ˆ ‚\" \n‘¦½V L0ãG¬\\ËÕÙ_nbÚcè³İ—$,Mg\\m>üí‘2@&C’Ô9¯¡p;T—2ì|HfÔeÉĞ½2C´Ù-:©ì•^£†!Ü¦gš¡ÄÈ“X8<`½?†9¦öá<ì›ˆà¦”!!u!QéãÔÅ-!Y·dIóTQLÒC®ğ©“•ì)I—lÙœœ$iUw8<CÒ\'Æ>Ô:ñJæ7=*m%J$­ZÁÁá(Kß»­ùVM©ùdÊ}‘˜h6ºK¾%Î\'8;ˆ2óëIÈ¾©ÙåxyK¯ƒ¹oşcx%^‘<^\rˆQóøÇÅıI¡+R±,á&Dlµ_ĞèĞûõFªò[\ZÇ,•×\\%Åy¦*D|}Á8ŸTÛÍz2LÀ…s†9sïz³yìFZeÚ!qQu’`b¢îR0ú*ÙYyÕM	=UË®«¨¬¦E¤\ZšoF¨‘Rªkló2NÒçË rÃxíVÀ\0f\nJAÂ!ˆ¶Òx¶¥¾nÇ&Ü÷[ı;’-Á!úòkÍX§ÿ\0ZŸz(fMÄT¯ËâÙìUi930È/îËHEğüP¦ÿ\0£¢ß›–%JŸi§CéĞ‘£ŸŸyùwÌİ®Ä«M‘‹$ø€¦ôô¤ó\0l}ØŠaåÈ~Ìµ®üÃe¥fÑYw\Z1Mk¤†ˆz4œ}ˆÕ×>Qö‹\rËÈƒâÖ¥œ&ˆ_¬„^àx¡¢ã¹fˆª+˜ª¦åú#–|¾Úu\\±ti2àª¦í1\Z?€\\«Éí|è’r‚1hÍYåª¹UíJ<æĞS3Pw;\"š«E0b™2j	ít‡Ñ¿L*±ÜS¾M´ŠZ)\'YyQ5fBë´ø*gßèYFÁ–¶ÔQ8‰IuEò¨´6t¨(ÿ\0‹gš­6\\¦äeA¡DSAuÌ¶Üs˜Š>R—¬¦æ\Z³e–¥S-+½Î!àq—ƒ³¸½	’±\"ºG	hWÇhSèk´ÎÔxáeĞK2UëFm¦Œri²ÖheÂ=N¼eá#¾Øš—¡SBôBø…_7€~—ŸÔ·7Šÿ\0µc°Ô‹¥}†…	We°2¨³.£Ìcµ	çm©ëZ`[##We°RDyŠ¸ÜX8U?>ù>àè…Ò#\'_ÔY—dxËà‹Âì=fAºCmÓÖãÅÆKÓÙ¢6»Z<:G½\"ó¢ï“Ë¦ñ-†İ@’•m×Jfe——JR-¦.ŒÁ›™]Ó`³*Áñtˆ ‚\" ‚ B·(…b«1.Æ4K›­q7ÌCÍ±ò×xñu¬óEÖ‹Fö+ºAwk2M\\Œe\"ZÃÍršÉS6È¿ˆî3¢6‹„ÒvŠiQ·M3GÙ¤„ûãÀçÍ<^Á\"\'¤õ)TE/»‹‰[ü¯¹WÊrÍuGin]Ñ*=ŞRë}.K]x{Òê¥.1U‡ÍvÓİ¿Émæ®Å­b’›$®K¢æªÒŒÓûÆ¸Ûï‡½\Zùye-”ifÛV\'Yj`y¥ô.·¤çlí‡1GOaæ%KOB¨e™0çuh?˜ŒâÎËÍÔã(’ó+šÔ)“nïï†Ôdæ¡ì?s­Í65Cˆ¶ZÀúÇü”o< eÖÊSxZ›‘Eiöˆ…u[’l\nšŒÑ(Ë¶‡Óì6Ç	­É©’•–š•b]¹¹š9‰r\'€J‡8ÿ\0D°„M÷»³Rs.Šú•`Ù,ĞHaÁ&Ëhƒk`¸ù(èØŠŞó´¥¤Z’˜!y…&› R*‰	§À6«¨¹ù¢X*\ZOæ•â˜T´›Ã¨+®®Å¼z±ÁÅq”IÙÿ\06˜—eÖ@•±Ò¦Z3\"â>ÀB°“%ìÄ—³íIró›9]æÄEñh¤„EošŒÃ¢9ÒÒÄGœ––aZ–•  ™DfWGÁSœŞŞ¨É²qfy©—æQÑ9‰‘q×\ZhÖ‘Ô4Š…àH²ÖJr»¿²êìuÆùWÚ‘)![CÍfX´&P,™—e\n­%aèÌô\nN%’¾R²/H¹0İ^p„ãlI®™çP©m´\'SFTp	QÅu7i’Mùš¾¢ğ‘Mº”SITN:C“|E·XÃî4äÙ´ÃgK¡í¨àñ	<BTW¥:Gq!rğ×D2ÎéÕ3¡ÃN¡œß@ngòLÛRE„\ZjÓ7zaòüÈ¿0åNd;n\0l†Ç¢ÙöK­l[Sê¬²»‘Ô&ZË¡2ñûĞóÃ\\$”‘DQqäÖ¯¸‚§áä{b>\'ËH\"¡*8şY‹\0»]âì‡óµÇG=Qe-}™0,j“ácúË™i°×å,äWQÇ„sWİ¥ GwÏ$rh|íÁ]’ÈE¤>ñmû€p¾ÎvÓqiEWb]‘*<CÍã†V`B¢‹Ó™jÖ2éµšö/¹ñF–,&–Š<ó—Ùe¬Åª«äÍÇßÿ\0)ƒöÜÜĞÄÂm9©†@yhD[e_,1²Œv˜DDDDÉ7$dÂ9Mˆ®Ì¬Æ.ÃgUÊ h‚ B ‚ˆ ‚\" Še‚+)\réºróC“íš²B!ÛNéqŒH\"™GÑ7¸ñ\\œlmgHË_\0\Z©\nY÷$\\Ån•í	İ}q6¹öƒ73£™Ô/¶T8‰ûÁ:jû\"x1½wñ‰BÉí \r9é—Ÿï(±-t²\r¤{¨ ¡g/†Úû(ß”%Ì	¹\n”G¥€İdòÚJG2é1äˆ’u­çOÊºˆël ¡ˆ˜«nT´R]ÒŒTÅ¢l¥,æİxM¸¸4q\"T%ÖtD‡lq±lÇ\råE™{l€W{”ì´=ÎcïÂ ä©lŒµ³Óa%GÙ…¼Cæµ…Ù»s.9*ËO!( =,JbTñ5@|Qåd]´Û ÛR­<ë†-ˆªLL\rDTñ:f(,fœ)¦‰sU)€\"UÓ•UÒï8ÔÀ¸:É§EÄEOX¹U1¾.ÍÁg&?\nó–%·!\'G•¢2ÒròŒˆ²Ûäj@Ğˆ‰½¢\nE(¦²Ÿy>İ4”³™EJò®ªñ)–Ò{ƒHxb3‹×q-™_–T\'™C!ÕUCé\Z.Él+\Zì4ÆæÙh%çÅÉwÙ#mÊIr¨¶+ğÆÁã¨|ì½!¯>SñÍ½êöMçgN¾”0ãr­®¢ujraG¤x¿\\Bì\'ùd*ßqÙƒUÌ³*—´\\õõ×£}›Ï@¦b‰š‰Àoê @\"ú\"R°Ò*É@mÙe&£kÚFÕi.İØbXie i=tD½âã/¶7yEb±™İ×B,-fTÊ+ñtˆ ‚\" ‚ BóUÿ\0l_œ@…H ¯ú ‚+£Ï=ÏL@„g¯ùé‹Éb@…UTÉQ~pA’”¬°¦áDİ¹2İÔ\"ïLò]^ìRè8®åw~*Ô`}‰¿ÙjÀæ»#¼}I>gUìÖ^¢Ú\"äˆ‰ıQá3\"¹	/Ò(¿ì‚…X‰İ¸,–ÛMÙe–ì¢á_õıè què±mPA!Zéå”[¾È \nğX	b°@…jWÿ\0ˆ¬!V ÿÙ','987',4,2,'logo.gif'),(4,'2013-11-27 00:00:00','GIF89a\0 \0÷\0\0x\\:IFIYZ]iYFs[Gg[Zbbbgfeiddfhmlkjcm`pkh`iqtutwt{ywy}}}µwj-„h3‘o9w8«y4Ã{NgR‚yZƒzl…~w·‹;Êƒ$Êˆ.Ó‡!Ü“*Å3Ğ4Ë“;Û˜6ê‘/û›.ñ“)ç›<úš6ûœ5ûœ:û”5ó£<˜R©‡DºŒG¸K³šPˆ†l‰nˆƒ{˜ˆy›—|¨ˆb¹—d¹t¶£Ç›MÃ–Ué™@ğ›CÚ§Gİ´KÎ¡ZÜ¥YÏ°WÔ´Vâ£Aí¤Bå¬Jï¬Jó¤Cõ¬Dû©BıªDó¬Iû®Lø§Eã·Nø´Må®]ì¹\\â·\\ñ´Túµ^ø¸YÌ©hß®iÜ¼lÅ¥sË®qĞ«zÛ¼räµlù»iîÂZúÃ\\ûÃVüÆdıÊcüÌkõÈgüÒkâÄ}øÍ|êØuçÖ{û×róÙtüÜsõÚyıá|üè~|u„…†‡ŠŒŒ‹ˆ†ƒ…–‘Œ†‹š•œ’’”›™—˜›œ¥š¤š‘¯ µ¦…³¦‰¡¡ŸŒ‹¥‘¢¡•˜¥˜š·¡¢£¤¢««¥¬¬¬©ª¨±°®«­±±²²¶µµ´´´¶¹¶¹ºº½¼¼¸¸ºÕ¸‰À¹˜Ú»•å»é¿Æº¨ÜÉæÈöÆ†ø×ˆâÉ÷Í•ô×œûì†úêŒğåüòŠùæ˜ı÷üø’ÕÁ¦ßÛ¦ÇÁºïÖ§ûØªíÓ¹éê¦üç·ûğ·›¡Á›¥ÆŸºØ«¬Å²»Ä¾¾Á³¹Ë¨¿ÙÁ¾ÀÃ½ÉºÂÈ´ÂÓªËèÂÂÂÃÂÄÆÅÅÅÂÂÉÄÃÊÊÊÎÎÍÌÊÌÈÈÌÑËÌËĞËÂËÖÏÎÓÑÒÑÕÔÓÙÖÓÕÚÖÚØÖÓÖÙÚÚÚÜÜÜÙ×ÛãØÎßÛÙúéÉıøÊââŞãâÜëçÜıìÕõìßüïÛşöÜßàŞáááåååæêíéééîîîìëìêåèôíâñíìôğëü÷èïïóòññõööôóñöø÷ùøöùøøûúûÿÿÿşşşııııøó!ù	\0\0ü\0,\0\0\0\0\0 \0\0ş\0ù	ä§ÏŞ/I˜.U’ÄÎ^¿#ôÇ“/iÏ°es&m˜¯iìø‘#÷íŸDş8+æç€\0,xĞ¨0B²^ÁÉ\"ï¤6c»$IÓ¯MÀ±hWŸ.NZx‘¨¯˜±\nØ©K·\rR£LŸÄÜò¤È‘\r&+Šˆ‹h¯y~eÊ$,[·P¨À»•c -‚ˆz8_£?ƒ …{.œ­R¸Àá2µ*‡#; X4™Ñs >gãìÕóÆl(TäÎÕÒræ\r]>°ˆ¢ÄÄ|èèiû5‰—ZóÌ•j!¥HFŠ`ÅÌˆø¬Ñc&é.¹rA±BÆ\r]4şĞ •…J!Öî«Æn¤Aw:ÑiE…‹~ölø’*K‹(X\\°ŒgÌ¨£$ŒÜIªÈ±&TÃ®œá*PÀ@=êQ“Î1ƒDÂG`¬QG(81+¯ĞqÆ\'€À;±ó¡ —DãN9cÌÆ\nQ¤Ñ\n,t˜!IÄBØ@ì`óK\"ÂˆcÏ;¤¤!‡O 1¤e$!A>ä‘:Ú(c	3ëäs(UÀqF–ª¼AF\ZM„ğ=DäO5Él‚6–Pr	f¬A\ZGLP‚*Q¤€D´u‚Dp€—`RˆV,1\0‚œòÆ\Z+ˆ`Â±D´O=í¨C&3üœÒ\"@ˆ?ÿ„ÇK„`Åñœ$P;Éd2—< Î@ğèà)B 1Ä!Âò³O2˜@’‡%x;¸‚…jx¬°û\0²‰ ”\0rDıœÂFHXq„(ÕöÃÉ6‚H’Håã)j¨G÷Û2Í`òˆ%H4\n-¦0Q†ãTÛŒ0šHrŒu²Åm@áÕÖ“N2Œ0rÀ‡lñMqX p3ê$	5œT(àĞáÕ¦3	6‰l°Dğüàƒ1P-:Ô„‰7‹&³h¢ÂÌ¸³Î5Ó$PíÙÙƒ4ÕàÁ\0ÚpÛÓ‡x7?\0;','111',8,2,'footer.jpeg'),(5,'2014-01-10 00:00:00','ÿØÿà\0JFIF\0\0`\0`\0\0ÿá\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0B\0\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0÷ú(¢€\n(¢€\n(Í&G­\0…¤ÈõªÚ¥½™XØ³Ìÿ\0rÆçoÃÓÜñM&İ‘2’Š»eüZ§w¨ÚYágÏİN¬ßEŸÂ¨õC›‰~Ëh¡9øöÿ\0€àûÕ»M2ÚÔ*¥¾óc,ßSÔş4í»ûˆæœ¾o_ò+ÿ\0jŞN1k§ÈÃ³Ü0‰OáË~•C¬O÷îíà‘BXşlqúVÈ‰GlÓöÓç¶È~Îÿ\0Ÿäsí¡İIş³U½cìQ’ÔÃöÕu}|ñşÔbŒSUd¶d¼=7ºüYÅÍ¦xŠÄo³Õüğ?åÄcŸø¨l<o-½è±Öí¾Í.q½~íwGÀüF²lmî‚…”K°PA8®Ši*uıVŒâÅBxh:´¤ôèİÓûö;È¥I20 ô\"¤®SÁ2Ï¡Aæ’HA>€œWSšæ©I8ö;éTö”ã>êãè¢Šƒ@¢Š(\0¢ŠLñš\0ò_‹ş=Õ|)>™g£\\,3Ì¯$¥£WùAzüşU‰ğ¿âv»®øôíjí&H¢ÄJ¤0 ã€;gò®?âµëëÿ\0n-!%„Mœxõïÿ\01¬½6ÖçÃŸ<‹PCÚNû7p©Æà$UF.RQ[²g8Â.rÙKêZÔv4Í3k^ºYO+çÔú\nµ¦éQZ#Hs$ÒÉ3òî}Ï§·Jâl¥›Oğ­«A)ÂÖ{‘1ğ¬TœõÆ+Ê´ß‹^8s=¼wm{s4{al™Œä|À*óÀèx­*¥éÇ¦şftêEU–ïo%şg°üWñN¥á\rZŞé/\ZO%âÄL‰¸(çú\n›áŠuxeo57F¸ó]r‹´`tâ¼ŸÅÚ¦­ª|ÒæÖd–KÃªæeÚÜ,¸ã•ácÆ±xVKo\rÛ4V;É5ÊŞİÈ¿ &±:Oªr\r.kÂş|JÕµ]Yô]jçí%£/Ì 6GU8ëÇò«~*ê:.®t-–+ˆÔîJ!ˆÈU#¡hÚ·ZZùjãÆß<;,z…åÒ$ß2­ÄHU½±—éÅ{O‡>#iú¯…-õ[ÆXfu\"HTäïèiÆ.NÑWdÎq„y¤ìâYR4/#U,N\0¯+ñ£/‹uØìì²ma$Ç=Z¦¾ÕuOä[#[iùçı¡ïëô®»ÃşƒJ·\n©–ş\"z“]ĞK\n¹¥¬ú.Ş§—QË\Zù#¤:¾şKÈĞÑ4õ°±%\\µ;R\0\0À§W›“»=HÅEYQH ¢Š(\0ª·×1ÚYOs#m$.ÇĞ’*µ\\/ÅWû+áÖ¨ÊÛd¸An¼õŞBŸüwwå@9èÚÍ·ü\'Qëz³0ˆÜ½Ì›WqÜrÃÿ\0Åmë$Ñïş Ç«Ø;i¡T”È›|mşAiŸ¼Œñ®¤(`*ªa*	cœõĞV§Ä_†¾Ğ¡Ôlçº”„r	™H\0ƒÏ\0wó­)ÍÂjk¡iª´åN[5c£o_k:t ´rÙN#`zeJåşG-¹ó\0âÛ‚G?xUŸZÁ«ü0Ö%vo´iğÎ2,6ıGáX_\r,\'ÔuË˜­ßc‹|ç‘üCÒºkNzŠQ÷o¿©Ã‡§_FQ—½o†İQéÿ\0ãŠ?Øğ?â`™ÿ\0¿rS¾Â’x,–_ùnÿ\0Î¹‰úN«§xnİï®L›µU_1›Ï#Ú›ğóâ6—á_Ïg}ÿ\0hòB2%ÏAÜ÷5ÍV„­\\ë¡RU!Í8ò¾Ç=ğÜù?¬Q¼ËA±¿Â½{ÇZÇ‚|52Üê:]Ş± ,in)ÇFf#Ç\\çĞ\Zò…³^øú+„ˆcy]±ÀÈÀşuŸâk¿ïæÖcyaP>dg©ˆ7Ê1é´\nƒr×<_¬x¯N‚k),´µ›0²©%›øŒô«¸øGáÈ5_%Äà¸8O{ú×-ñÆz?ˆ4Ë7G†C»ù+.Å)Tuï^“ğ3şDõ\'§ÿ\0Òª%x»T¥\ZŠÒWG¥ÚiÚ T@\0è\0éW±ŠZ*JÁEP0¢Š(\0¢Š(JäüsoasáÍ—Úx¿>jùåä…àIÇ`q]gjÍÕ,ö\\ qÇ<SI7¨¤ÚWG˜èŞ+Ñ<3·ÓtF€’\ZhT•e”…`Çï…\'­]SÅv> Ó~Ë¨hM%”ìŠò¨MøFù`7}«i¼/,whŠD2ôó]¾0]¤ıOjt½Xnf¼PÛ06¨\0‘œgÿ\0aWìãüÈËÚËù_àq¾›@Šñ´;]\r`‡R\rÀ0Û·cF~`@##¹^ËQğ÷…u)®,<>±ª Ã -·/•n~VùËú×i&™®lCÜbP9fçœvùFj}CLÕf”=­ÊF ô Œry<çÔıšº÷½´­~Wø÷ï\"½¸[í_ØDğ¾Jd!ûî6å ’Fk•Âz–‘öyü6ÚØÌ\0œäşì™½Àé^}£êwv¶Ãí MlƒË`ğ;b‰tíiš/*æÂğÿ\0.wó×§gŠ=œ™¶’oÜgáSÃ¾´#OÒ>ÌòHT ”1l	>mää¨òÏ=³T¼A/†|E¨Ç.§ $×Gr`¹ÛŒ3($‚2¸\\–ä]ñÒõ mê“´$9ÏËÏ===êI´R[{p.£Yb%Øí?9ÏŒ`c¯Z=œ™¶–¾ãü5š?ÛXÉd<9nöPLÑX3Jv\0\nşğ‚Ç\'œ/Ö½+Ávv\Z|°Ziÿ\0`ÌÁá\r‘»AïÅEı•¬¨‹eêpß8*:qĞãëúzVæÜÛo$Y%É%—¡¥($®šeB£“³‹F­QYš…Q@Q@Q@!¢Š\0CER(4QLQE\0RÑE …¢Š`>Š( Š( Š( ÿÙ','798/89',9,3,'logo.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmenu`
--

LOCK TABLES `itemmenu` WRITE;
/*!40000 ALTER TABLE `itemmenu` DISABLE KEYS */;
INSERT INTO `itemmenu` VALUES (1,'Salir',8,NULL,NULL),(2,'Salir de la AplicaciÃ³n',NULL,'/login.do?metodo=logout',1),(3,'Usuarios',5,NULL,NULL),(4,'Alta de Usuario',NULL,'/usuario.do?metodo=cargarAltaUsuario',3),(5,'ModificaciÃ³nn de Usuario',NULL,'/cargarUsuariosAModificar.do?metodo=cargarUsuariosAModificar',3),(6,'Datos del Sistema',4,NULL,NULL),(7,'Localidad',NULL,NULL,6),(8,'Alta de Localidad',NULL,'/localidad.do?metodo=cargarAltaLocalidad',7),(9,'ModificaciÃ³n de Localidad',NULL,'/localidad.do?metodo=cargarModificacionLocalidad',7),(10,'PerÃ­odo',NULL,NULL,6),(11,'Alta de PerÃ­odo',NULL,'/jsp.do?page=.altaPeriodo&metodo=altaPeriodo',10),(12,'ModificaciÃ³n de PerÃ­odo',NULL,'/cargarPeriodosAModificar.do?metodo=cargarPeriodosAModificar',10),(13,'Entidad',NULL,NULL,6),(14,'Alta de Entidad',NULL,'/entidad.do?metodo=cargarAltaEntidad',13),(15,'ModificaciÃ³n de Entidad',NULL,'/cargarEntidadesAModificar.do?metodo=cargarEntidadesAModificar',13),(16,'Alta de Provincia',NULL,'/jsp.do?page=.altaProvincia&metodo=altaProvincia',7),(17,'ModificaciÃ³n de Provincia',NULL,'/provincia.do?metodo=cargarProvinciasAModificar',7),(18,'Marca/SeÃ±al',NULL,NULL,6),(19,'Alta/RenovaciÃ³n de Marca y SeÃ±al',NULL,'/marcaSenial.do?metodo=cargarAltaRenovacionMarcaSenial',18),(20,'Pago Boletas de Deposito Marca/SeÃ±al',NULL,'/marcaSenial.do?metodo=cargarPagoBoletasMarcaSenial',18),(21,'ModificaciÃ³n Canon',NULL,'/canonMarcaSenial.do?metodo=cargarCanonMarcaSenial',18),(22,'GuÃ­as',1,NULL,NULL),(23,'Alta de LegalizaciÃ³n de GuÃ­a',NULL,'/guia.do?metodo=cargarAltaLegalizacionGuia',22),(24,'Autorizaciones',6,NULL,NULL),(25,'Alta de Autorizacion',NULL,'/autorizacion.do?metodo=cargarAltaAutorizacion',24),(26,'Modificacion de Autorizacion',NULL,'/cargarAutorizacionesAModificar.do?metodo=cargarAutorizacionesAModificar',24),(27,'Autorizado',NULL,NULL,6),(28,'Alta de Autorizado',NULL,'/jsp.do?page=.altaAutorizado&metodo=altaAutorizado',27),(29,'Modificacion de Autorizado',NULL,'/cargarAutorizadosAModificar.do?metodo=cargarAutorizadosAModificar',27),(30,'Tipo de Animal',NULL,NULL,6),(31,'Alta de Tipo de Animal',NULL,'/tipoAnimal.do?metodo=cargarAltaTipoAnimal',30),(32,'Modificacion de Tipo de Animal',NULL,'/cargarTipoAnimalesAModificar.do?metodo=cargarTipoAnimalesAModificar',30),(33,'Consultas',2,NULL,NULL),(34,'Consulta de GuÃ­as Legalizadas',NULL,'/guia.do?metodo=cargarConsultaLegalizacionGuia&urlSeleccionGuia=cargarGuiaLegalizada',33),(35,'Denuncias',7,NULL,NULL),(36,'Alta de Denuncias',NULL,'/denuncia.do?metodo=initAltaDenuncia',35),(37,'DevoluciÃ³n de GuÃ­as',NULL,'/guia.do?metodo=cargarConsultaLegalizacionGuia&urlSeleccionGuia=cargarGuiaParaDevolucion',22),(38,'Reportes',3,NULL,NULL),(39,'Reporte Vencimiento de TÃ­tulos de Marcas y SeÃ±ales ',NULL,'/reportes.do?metodo=cargarReporteVencimientoMarcasSeniales',38);
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
INSERT INTO `tipoautorizacion` VALUES (1,'Solicitud y gestiÃ³n de GuÃ­as de CampaÃ±a'),(2,'Solicitud de RenovaciÃ³n de TÃ­tulos'),(3,'Otra Solicitud');
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
INSERT INTO `senial` VALUES (1,'2013-11-30 00:00:00','ÿØÿà\0JFIF\0\0`\0`\0\0ÿá\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0ÿÛ\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342ÿÛ\0C			\r\r2!!22222222222222222222222222222222222222222222222222ÿÀ\0\0ÏC\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0ÛğÄ?±x‚ïÃÚ¼ßèÍu\"ÚNÇıYÜ~CşÉíéôéì•ò³ÿ\0!İCş¾dÿ\0Ğ{?Â¿ˆCSŠ=W›ı21‹iœÿ\0®Qü\'ı¡úız€z½Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@ ë_òÔ?ëæOıÕ8¥xeIbvIƒ+)ÁR:W5¯ùêõó\'ş„j\0}ğÛÇÉâ›c|êºµºüã§œ¿ßş¢»úøóO¿ºÒïá½³™¡¸…÷#¯c_LxÆ–¾0Ò£lwğán`¡şğÿ\0dĞWEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPÈ:×ü‡uúù“ÿ\0B5F¯k_òÔ?ëæOıÕ\Z\0+OÃúõ÷†õˆu+	6Ëù”ıÙº·±¬Ê(ëø–ËÅZ,Z…“c?,±óDıÔÖİ|«àß^xCY[È2öï…¸ƒ<H¿â;\ZúsIÕlõ½.\rFÂQ-¼Ë•aÔzƒèE\0^¢Š(\0¢Š(\0¢Š(\0¢Š¡«k\Z~‡`÷º•Ò[ÀYSèR}…\0_¢¼“QøéaÅ4ík”å”GŸÀU­ş<Æ\\•{´w9ı\nç@ÉEq~øŸá¿\\EkÄ–·r©\rÊm,Ç°# şy®Ò€\n( ĞEydß4ˆg’&Ò¯IF*NåçëLÿ\0…ë¤Ğ&÷şúOñ V¢«Xİ­şŸmxŠUg‰eUn 0úÕš\0(¢¼ËRøÏ¥iš¥İ„šeã½´Ï2²áŠ±ëí@›FkÊázéô	½ÿ\0¾—ükÑômR=kF´Ô¢£æ!\"£õ\0úâ€/ÑE\0Qšã<cñÇÁ·ğZ]Y\\NÓEæˆ€\0ÉçéW<ãkÛ\\Ëi°=»…xå œÁã·~ÓÑE6I(ÚG`¨€³1è\0ï@¢¼­ş9hË+*é—® à0*3ïÖ½BŞaqmê plŒĞ”QE\0QE\0QE\0|ƒ­ÈwPÿ\0¯™?ô#Tjöµÿ\0!İCş¾dÿ\0ĞQ Š( »O‡¾:›Â:Ÿ•9i4«†|c‡ûëïüÇá\\]ö5µÄ7–ÑÜÛÊ²Ã*‡GCÀô55|ığ¿âĞnWGÕ%ÿ\0‰dÍû¹ÿ\0Ç»ı”÷ôëë_@) ô\"€Š( Š( ¾sñÖ£}ãOˆßØĞIˆa¹ûºò©\r†cøäçĞ\nú2¾e×šãÂ?înŞ\"Æÿ\0µ*ŸãFmØÅ\0{>‡ğÃÃ\Z=ª$š|WÓóÍt»÷÷O\0UËß‡¿’]Ò<÷|¢?ÅO¢xÓÃúıºIe©A½€Ì8Iúm?Ó\"ºƒÒ€<O„-£ø£JÕ4[–šÖØ¤š	ˆŠCn¿ZõÊLŠZ\0(¢Š\0òÿ\0Š>Ğôï^ŞÙéV°]	#Ä±Ærã<ûÖGÁïèúÏ‡ïæÔ´Ûk©Rëj´±† m^+­ø»ÿ\0$î÷şºEÿ\0¡ŠÅøÿ\0\"Î£ÿ\0_Ÿû\"Ğ¨C\nA\nC*ªŒ\0ARQE\0çÿ\0ü/¡ÃàıgRJ´Kİ†O=c÷9õ95èÊüHÿ\0’{¬×ÿ\0¡\n\0ó_ƒ:•­E¬KO·»1ByÈnwçü«Û­m`²µÚÚ$Š×jFƒG ä_¿Õk¿ïAÿ\0³×±ĞEP„|tÿ\0‘—Mÿ\0¯Oı«3Á÷Sxâ<6—NE­Ò¬NÇ€R@ğ$gñ­?Ÿò2é¿õéÿ\0³µ^ø¯áÿ\0?Âú6¿şòŞàœèGÊ‘ÿ\0 iÍp?üCı‹àé-b}·:òBü¸ÿ\0V§Ãïÿ\0ÂIàû;§}×1\"ã×z÷üFã^eâFoˆ Ò\"bÖ6oä±^PæCøŸ”e <Õty´…Ó¼ü‰.íVëiì˜Ì\0\Zú¿Kÿ\0M—ıpOıWƒ|iE‹Æ–±¢…U°Œ€7={Î—ÿ\0 ›/úàŸú tQE\0QE\0QE\0|ƒ­ÈwPÿ\0¯™?ô#Tjöµÿ\0!İCş¾dÿ\0ĞQ Š*{;9õØlí£2O3„Gv\'€#†n%CÉ#tD]Äşû›K›9<»›y`~»dB§õ¯t’]à÷†`Q^kWKó!îsü(=?úæ›¢x·Aø¡k&…®X%½éRbÃg?íFİCOçÍ\0x={/ÂŸˆxò|9«ÍÇİ²Ïå?Ëòô¯5ñ_†®ü)®Í¦İ|Ê>h¥Æˆz7ùî+ àôö]æ_ş!\rvİ4]RQı§\nşêF?ñğ£ÿ\0f¯_ZôÚ\0(¢Š\0+•ñ4ÏÛ§ÚwAyÄWQŒ°pGñöãØŠê©2E\0|ó©üñ=›±³6×Ñÿ\0	Mø†ÀıMb´8ğ€ŞWV±‰9,¥¼¯Óå¯¨i¤=Aé@9à_‹—7Z„\Z_ˆ¼¶ó˜$WŠÇ p8ÁõÇê=–¾jø§¤Zh¾8–;Ö¦‰\'òÓ€Œr\0éÓ?}¦I$ºU¤“­xQŸêTf€-ÑEÂü]ÿ\0’w{ÿ\0]\"ÿ\0ĞÅbüÿ\0‘gQÿ\0¯Ïı‘kkâïü“»ßúéş†+à_ü‹:ı~ì‹@©EP\\¯Äù\'ºÇıqú®ª¹_‰òOuŸúâ?ô!@7ÀoõZïûĞìõìuãŸ¿Õk¿ïAÿ\0³×±ĞEP„|tÿ\0‘—Mÿ\0¯Oı«×N™³àäÓnî®l–6>™Qƒõğ¯\"øéÿ\0#.›ÿ\0^Ÿû;Wµéò±ÿ\0¯xÿ\0ô@<xcÅŸ¯5í2uo1£xÑG!gS…o§\'ê1]çÁ]\0Á¦]ø‚áIšñŒQ×bŸ˜ş,?ñÚ‹â\'Ã-G_ñ<z‘m¸E;Ü.Ön÷ã•z†—§C¤évº}²âx–4õÀÏÖ€<#ãoü6ÿ\0õãş†õï\Z_ü‚l¿ë‚è\"¼ãoü6ÿ\0õãş†õï\Z_ü‚l¿ë‚è\"€-ÑE\0QE\0QEòµÿ\0!İCş¾dÿ\0ĞQ«Ú×ü‡uúù“ÿ\0B5F€\nõ?‚Ú\\j×zõÊ&ÉvD[ ‘‡\'ğ_ı\n¼²½Âäÿ\0Âğ68—÷wšŠ\0{Òòœ~åş5ñøŸÅWšb`İåÛƒü1¯İüúıI¬[K©ìnáº¶‘£½U‡CPÑ@çâH`ø“ğÊnÖ5şÓ²Rì‹Ô¼OÄ|Ãğ¯¯Mø3â!§ø†]\Zwÿ\0GÔ(A\"?1‘ùW1ãÿ\0Â7ãË8×m³Ÿ:ßıÆíøÂ€9ë{‰­.b¸·‘¢š&‡HèE}!ğóÇPø»LòncÕmÔyÑôó÷×úúÂ¾j«šV«y¢êpj®!mÊÃùPhì\n+›ğo‹¬ü_¢­Ü8K˜ğ·g˜Ûüc]%\0ó™ñ\\ğ†µ}hGÚlEÌ™µŸ?\'Ì~éşÔ{WÑ•“¬xgE××\Z¦›orØÀv\\8Ì9\0qšÆ¯\rÜÆ>ÙåœÁzşsú\nMOãO‡-`ccÕìØùWg–¹÷\'‘ù\Zšãà¿…frÑ›è÷cœ?ï¥5%—ÁÏ	ÚJH®®±ü3ÍÇş:\0y¤ê¿¼lúügìb@÷2„T#_|\0?SïôX\0\0\0ÀPZXÚØZ¥µ¼Vğ ÂÇQø\n±@Q@5ñâ®øVóI²–std^\Z\"Êã<ş²şøïDğ®‰yk©É2Ë-Ç˜¢8÷\r»@ş•è’|(ğ|²4¦9f$“ö™:Ÿø7ş\'ƒèÿ\0ø\'ÿ\0@…¥Ìw¶p]DO—4k\"ÁÁ=Cmm¥¬6Ğ®Ø¡@ˆ3œ\00åSP^Uãÿ\0ˆz\rÖ¬è1I9¾ ÁˆíÜ­Ï>œ\ZõZã¯>øNşö{»5Úyäido´H2ÌrNc© ,øWã=Âqê‹ª<ªnLF?.2ßwv˜¯xÓ5}[L·¿µ,`¸@ñ–$jå?áRx7ş’àLŸüUuº~Ÿo¥éğXÚGåÛÀ#\\“€=Í\0Z¢Š(Áş9ÿ\0ÈË¦ÿ\0×§şÎÕízGü¬ëŞ?ıV^¿à­Ä÷Q\\êÖm4±&Å\"V\\çÜÖì0¥¼ÃÄq¨U€\n\0’Š( Ÿ>6ÿ\0Èóoÿ\0^1ÿ\0èo^ñ¥ÿ\0È&Ëş¸\'ş‚+]ğ/‡üI~·º¥“Mp±ˆÃ	~PI\0ä×CI)cŠG \n\0}Q@Q@Q@ ë_òÔ?ëæOıÕ\Z½­ÈwPÿ\0¯™?ô#ThSÃzYÖ¼K§iØÊÜNªŞËŸ˜şY¯Føãª‡Ô´Í#„·ˆÌê:e¸_È/ş=Yÿ\0t¿µøÂkæ\\¥•»0>ß(ı7W3ãíSû_Ç\ZµĞl œÄŸî§Ê?ôş4ÍÑE=•ÜÖÖ÷–í¶h$Y½Šö?Š–°ø“ÀúWŠìÓ˜Õ|ÌvGìİlÄ×Š×µü,¹‹ÄÕ¼/tÙòÃÏdôlŸÄPŠQRÜÛÉiu5´Ë¶X]‘×ÑÁ¨¨cÃ>$¾ğ¶³£dü¯Ë,dü²\'u5ôÿ\0‡õû/èğêVnŠA†C÷£nêŞâ¾H®£Àş3ºğ~°&]ÒYM…¹ƒ?y¼?Úõ%SNÔ-uM>ë)–ky—r:÷ãVè\0¢Š(\0¢ŠÄÔ|U¦é×Ïdßj¸¹CI¥³Ìc¡m ã×š\0Û¢²bñŸq£6«M-²6Ö	ï8#f7djÖ Š«wmb`ûLÂ?>QYîsœ>†­PE´PEQ@•‘gâ[íb}*»û]¿úÕ{YS®2ÄcœsÎ8 \rŠ(ª·öÖ×v¶²Ì{¢Ë\n`üåAcúhÕQ@qE\0QTnµH-5+	7ù×¥ÄX|‹¸çÓŠ\0½EGSÕ Ò£·{øâ;dØ3ó»m\\ûf€/QE\0QEòµÿ\0!İCş¾dÿ\0ĞQ«Ú×ü‡uúù“ÿ\0B5F€=³ábáÖ¹â\0;eÏñÓåÿ\0Ç‹\nñGbî]YI5í$ÿ\0ŠsàNŸ`>Io%#¾\\ù­üˆ¯ Š( »O…zÏö?¬Ã¶Øo3jÿ\0ğ/»ÿ\0®.Ÿ¯ñÍ’6¬;Ò€;‹z7öWg™ß ¸\\xğß¨\'ñ®½³âœIâ?‡ú?‰`Q˜ö³ãøV@2?\n+Äè\0¢Š(¼øoãé<+¨+×fÒnç|–şøş¢¾ŒŠXç…%‰Õãu®§!èE|o^©ğ³âö\\±è:¼ßèR6-æcş¥ğŸöOéü€=âŠ;Q@rShºÅ¦·¨j^ÔlX^:›‹[ÈË(‘T.C)È8ƒ]m`Şx?D½¾–öKic¸˜æW‚æH¼Ï÷‚°€9ıOÄWzÃíZèÄlo­.~Í1‚\\ë\"U¸È ÿ\0J¹â«N}^Şqiw¨iIkgxmäYs÷øeŞ1Àãšß:–toìqf‹aÀòT•İG9Ï9¨µ/\réšµÒİ]E0cò¼Èn$ˆ”É;NÆ\'ó ?VOÖ|=áY­çÔ\ZÜê©içu”\\0bw0$v<Ö‡‰EÅÖƒ Ø­Ô¶·-3HŸmd’]€¾kØù‰Æs…ÅtsxwJŸGM%ìĞYFAHĞ•ÚAÈ ƒsÎsšI¼9¥ÜiQi³Û¼¶ñ6øüÉ[$îNày<ç<Ğ?em«éºWˆDñËmgöc%œoxgx›cnÃqÂ‘éÍdI¦Ío£x^ş_U[½B[x.e7lÛÒHÉ òŒv duëÍvÖ^Òì-îá†nÓeÃK<’4‹‚0Y‰?Äzc­NÚ5ƒÚÙ[5¾a±xŞİw Â÷ç×4Ïé0\rÆ·ºl77ObÚr]”¸¥+&öRAbO ×3uqr¶ş#Ò­o­íŞî&[«RFiQ¥ƒ	Êí ô$c­z_öu¯ö›j>Wú[B 2n?pØÇN¤óÖ±WÀ\rŸ°1Q ‘#3É²6vQwayôÓ¥\0t£¥rº7ü”×+?ıJê}»VMŸ†´»ZmRŞVòbLn$`ßU-üqÚ€8£§K} x£U—SÔÅÕ•åóZì»uX|¶b¸PpzwÏwY´‹ZÖ<5Ü“†¹I<Ãï>An6‘ƒŸNqÇJë×F°ÆöÍmñozÒ½Ân?9“;ùÎFrz~•÷‡ôÍFÆŞÊâÜ˜mŠ˜vHÈÑ0`AqÖ€9|İ·ˆôíŞ›‹$±iŒK|Ğ´Ì(İ&w0œgœäô¨®g×|?à½jIYíöJ¢Í¤ŸÏx\"rªIcÉÛ–#5ÔŞxsK¿³µ¶¹·f[QˆJâHøÇîF3Ï=é‘è6šv‘{i§ÚG!X²]Jò	˜®>vmÇÒ€9ù4Èt?xj+;ëæO8f¼’Q.!b†$g>ƒúSôı:]cÅ\Zù¹Õ5‚Öò1¼7~é8änÜÔz„%ƒ_³Ô¤Òlt¸ìÕö¤\r;ÊÌ»yf\nlzëí´û[K›«ˆ\"Ù-Ó‰&mÄî`ƒÉã€:PkòK}o®jÚE­ölŒ£íÏªI£Æ>`‘†\0„ÖíÜïsâ/\\HAyRwlz˜2kBïÁ:íÍÌ×,ÿ\0j%¦ŒO\"Æìx,P0½ñœó×šÓ:U‘šÆSd±¶Í¸ü€®Óß8æ€\rbêK\rşòß-½¼’¢rUI¸Íô?\rêÏ{yu}s¨YI,²\\»$…Iù3´ØÅz[(e*ÀF5ÏCàoÁ4RÇ`s«4*g¬LàQKayì8ü(V’ûUñ•öœm\'ºµ²·‰’¯Í®Kî%ÉRtÀç¦º\rÁk ÛÁ©³µÒ4€—HÛ7¶À[¹	´ëKªx{LÕæ{¸í©Tš)\'é¹${*æŸ§Ûiv1ÙÙÆc‚<íRÅ$“’I\'’O4fŠ( u¯ùêõó\'ş„i4{Ôõ«ëq:EÇûL.µÿ\0!İCş¾dÿ\0Ğu?	´ï·ü@²b2–¨ó·à¸øó-\0u?ï‚Ë£é1ü«m3(÷Â¯ş‚ÕãõÛ|WÔ~ßñøÊ[*@¿‚äÿ\0ãÅ«‰ Š×Ó</®ëùš~•u<_óĞFBßGŠ£}aq§\\.DbAÕRU|}v“@¨¯BğOÂËÿ\0D—÷ò5šÜ¡ÛûÉGû#°÷?‘¯B¼ø/á¹tç†Ñ® ¹ÛòNÒnù¿Ú^˜úb€2>0ñGÂ½[ÃÒÒÁ¾8ÁìnCÿ\0}nü«ÄÙJ±V àƒ^›ğò]Ç÷z-ÉÚÓ¬2ç23Ÿèßs´Ÿìoê–Ê¸åó£ôÚÿ\07L‘øP1EPEP·ü*ø…öÄ‹ÃºÄßé\n6ÚNçı`şá÷ôõéõõÚøÕãutb®§*AÁ¾†øgñ<Mfºf£ \Z´ÔŸøøQüCı¯Qøı\0=¹O?Tÿ\0…Štÿ\0íY>Áö/µùL}wíÛ»nqß9ÍuuÉm¿ÿ\0…o?²¯>Åö²}£äÙ»~ıß{;qÇLç·z\0±yã+kkÛë8tÍNò[³@T\rœ’CÓ¯·z¥âÊ<?¥ÜiidÕ\'Š5İº£`#Ÿ~˜­Oº¶Ö<G4Ğ•êåÈùÀ‰TŸÌX¶Ú¤ğ­“Z°¸²¼·’á2>ERw¼Ğ²kQèÚ}…«Å«__\\‡híäTk’ ä—Á\n\0È\'Ó­Y‹Å2è—ú¡â5°ö«yl± Œã8Áàç­TÖ-ïl<Qi®ÛYM}´{Iá€¯˜€²ºº† Ag=:Ösèúî…âÛ¹,š­]AfXP±l]Ä8Î3ÇĞ´^/³—N»Ô–¢¶vÖæãÎ’ßbÈ tMÄdşõXøêÅ$eÓuh–åIµvµ?éÚ sßæò«zÕ…ÍÏ/,!„½ÓØ–0@%¶cC¨i—“]x]ã˜YÏºs‘ò%—?™(ö¯Ã¬Íw\0µº´º´eÁt\\SÁ ƒƒßµT‹Å±»hnôRÅ.dÃ5ÌJœôS†$254íE<MâÈD.l ÚfÁb‰;{µÈÃ¡ßÜÿ\0bïğö¤5+kÛy/o®îƒƒµÁrŸ9Èêx€;KÄXêÂ+ËûµŒK$VˆÆ¤à,@ÁÀÎx¨ßXjš¬—v¢ôL~Í$\0Ú™Ãç”#Û©ëT¥MCBñN¥¨Ç¥Üê6šŒpÿ\0Ç©Mñ:¸*ÄeH ä9©®­µıÃZƒØ¼Ú\Zá«·&\0$\n\0©¯ëv“Şy©=®™8–öK(ÁŒ2àHBƒØJÖÔ|Oa¦Ûéól¸¹MA¶Û}–?0¹ÚXp9äõñÖ±#M[A}jÊ\Zâü_\\Ésk<L3 Y2À®|ŒT±xzöÆ/Z¢ùÃMb.dSÂşå—<óÇ±£x‚\rb{»²İZ]Zíómî+oºÃ‚~Õ±Ú°m,.cñ¾§|ğ‘m5œ¤œ|Ì¬ù¼d~u½@‡¼[v·º¢k³¡¶s-¤»â8]•Ğã©\0)üO¥MámoX¿ÿ\0„ƒûZ]måËk\Zæ’/0/ûD=ÅK§xFı [ë6Î­©=Ü@0F#8ê¬\"¬Úéw±ë-™ aï•övÈùñ\0Súñ@[işÑïîòì_ùqÆé\0ó$vBÀ”^pxäÕ½#ÄPê×—6FÎòÊîİVF‚í³#d$Ák4]@xÁ–ÆÙ¼ëˆ\Zår?vRzó‚@âµrŞ:¸¾10´}-mÄ ãçó‘ëĞƒš\0ŒøÎÄbqg|tß7ÊşÑ¯‘ÛsœîÛ7mÇ¾9©õ?Ùéz¨Ó\ZÖöâñ ¤vĞ.â½ºt=p=ë±ğßØ4´Ñïü/©_ÏîÄĞß·™Aád8Ç~•Ø¡ã×Ô<£öC¦,>fF7ù¤ã×¥\0>óÄ2Ú˜‚hZµÈxVRb‰?wœü§s˜c3Z:f¥m«é°_Ú1h&]ÊHÁô ÄEr:İì¾&ºkí\"ÿ\0U°x£1ÛÎ(›~ñ½y\'$+cÀú}Ö—á;Ë³Ï—t[ƒmÌŒG#¯PCEPÈ:×ü‡uúù“ÿ\0B5ê_,•$ÖuY>UcéË7òZòİkşCº‡ı|Éÿ\0¡\ZõïÅ=ğ+QÔ>ì—k+‚zå”¿È\Z\0ò\rRíõ]jòó½ÕÃÉùf\'­zf‡á´hô«kÃ?k¸[[‹§†;€]¶•+æDŞ€ã=yæúªÚ&µk©¤)3Û¾õGè[gñæ­ÿ\0Â]¬·‰ãñ—÷èûƒ˜şî?»ŒŒPïü@Ö¼JÍËöM<p–vçjÿ\0kûßÂ·>xx’øêš”yÓ-›ş[Iıß÷GËÖ©xÏE´Ô4è|c¡G>ñ±wÿ\0Ë¬ÿ\0Ä>„ÿ\0?qTü1â¿Çqe£hwî»Ÿd0Ğ¯\'£êI ¡õOhŞšÎÛQ¼ŠÕ®X¤*Ü=}NMk†C=ÅyŠt×ÇzßŠ5Ç¸–TQ,\ròÔ¨àÿ\0²…³Á¿=k¹ñÏˆSÃ~¼¾WvO*ß²7NOá@?İkkgñ.ãZ€æ8õGœmş%ó	ıGó®Ûãš¦ëIÖbÃ$Ñ‡N>eü÷7å^EœkÛu/øªşAs÷î,XúƒØÇşøÉ ©f¶Ü¨š\",2»Ğ®Ez§ÂoÙ¥¥×‹u…O³Zîû?˜>Q´e¤ü:Æº«\rgGø·¢jšdÖ¿g&Çs(?rAıGøĞÏ•ßxá¼¾*µùšÓJŒ‘½GÍ)vç ¿ärvÚäş$C)²í®~ÌÀÿ\0nÚ*õŠÚÄ~ğæá)ŒHğ7iÁò‡\0Àsô÷ 	ÁŸ5?³¬õu[¼íVKÌ³7¶ï•¿\nä<Mğÿ\0]ğ-Üz¾Ÿ;\\ZÀáÒê!‡ˆöÜ¿×¥pé¾ø¡6˜É¤xÍÎ™\'È²Éó4#Ğÿ\0y}»~”êñµ‹ôµ1¹MBĞ]BÀ/Í–Q“•Îp<WW^âßİx#U‡ÆôC¼hw,a¿œmú~Uê^ñM—‹4XïíkŒ,ğ“ÌOéôô4½EPEPEPEPEPEPEPEPEPEPEPEPÈ:ÈÎ»ÿ\0_2èF½{â_üH~èš ùd)zìL·ş=Šó­/NşÕø•–İË&¤wöC’ß 5Ö|rÔ<ïéúzœ­µ¹û3·ø*Ğ–QEÖøÄñhz„¶\Z’‰´]A|›¸›¹à?áü¿\nõÂºGÃ;m[Ä——+r£\"Ì÷Š?ÚcÆ}¾µç¿<|M­}¶ò<évL\ZLô‘ú„ş§Ûë]ı÷ˆtˆ×ÚŸ„ˆ‚|ÖYáäPrGëõ\\ĞŠëºÕßˆu›Nñó4ÍœvEì£Ø\n±«øŸRÖ´­7N¼›|\Z|e#õnz·Ğ`~OUÒîô]R}:ú#Äµ‡õÇ­R ½Ÿà½Ìz–ƒ®x~àæ6ùñê®»[ùÎ¼b»Ÿ„š§öw­cfÄwˆÖíøËÿ\0(üèµø—<~øu¦xbÑÀyÀÊñ¹Sçñb?Zó\0kçÃ¾1±»gÛo#yúln2~‡ğ­‹ú·öe·VÌV1,ÓwŞ?«cğ®€>oø»¾‘£5£JÇyÃ	ú«gğ5ãõ_íj’†ÌpËötú\'ËüÁ?zñ’ÆÛÁëìs>±o” .VV\nÄöíšñi$y¥y‹;±f\'¹ ÑEê¿¼pÿ\0Å-­²Éas˜íÚ^BşşË?¯êöšÂO¦¡§“G»<FÇ†^ñ·ûC±ÿ\0ë×—ƒ^çá\rZÓâOƒ.<5¬¾uxÆÙO,À}Ù¸è}\Z\0ôY²×ô¸5+	|È%÷SİO¡£_8xcÄz—ÃOÜéšŠ9´ó6]B?IğçÜ~ŸDYİÛßÚEwk*ËÊ$SÃŞ€\'¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(Á¾éßkø§¨İ°ùlü÷ı¦m£ôf®Oâ£ı§ãİ^pr©9…~ˆ6ÿ\0ìµBïS¿ÒüE¨Íayqk!¸“-…	ù¥dÉ#Ë#É#w%™Rhµ¡¢h÷zş±m¦Y&é§lg²ì}€æ³êî•«_è—é}§\\½½Âttôô#¸ö4ëŞ;Ö-<á+h¯‹©¢ıüƒï*¼Çı¦çè?\nñ›k™¬î¢¹¶‘£&½U‡CSjz•Ö¯©O{)–æwŞîÏJ©@É«YÛüSğbkV¢ø‚Áv\\B½dqøõ_ÄWTAujÏR¾ÓÖe³»ÜL»%òœ®õô8ª¼ĞVtÛÙ4İNÒú/õ–ò¬«õSš­E\0ZÔï¤ÔõK»ùÖ\\LÒ·Õj­PEPEPZ:³wáıfÛS³}³@Û±Ù‡u>ÄqYÔP¶üBÑí|má_èëºx¢Ìª>óGü@û¡Ïëí\\¿Ã/ˆ\ráËÅÒõ)	Ò§~Ÿø÷cßıÓßóõÌß|Z4­]´;×ÿ\0A¿lG¸ğ’ô÷×O®+â7…G…¼Q$P\0,®Gnğ‚y_Àş˜ ¦‘ÖDŒHÈ#¡úñ/…?şÌÑxwW›÷,vÙÎçîùæ}½?/§¶ĞEPEPEPEPEPEPEPEPEPEPÈ:×ü‡uúù“ÿ\0B5F¾š›áoƒî\'’yt¦2HÅÜı¢NIëüTÏøTŞÿ\0 KàL¿üU\0|ÑE}/ÿ\0\n›ÁŸô	oü	—ÿ\0Š£ş7ƒ?èßø/ÿ\0@4Q_Kÿ\0Â¦ğgı[ÿ\0eÿ\0â¨ÿ\0…MàÏú·şËÿ\0ÅPÍWÒÿ\0ğ©¼ÿ\0@–ÿ\0À™øª?áSx3ş-ÿ\02ÿ\0ñTóEô¿ü*oĞ%¿ğ&_ş*øTŞÿ\0 KàL¿üU\0|ÑE}/ÿ\0\n›ÁŸô	oü	—ÿ\0Š£ş7ƒ?èßø/ÿ\0@4Q_Kÿ\0Â¦ğgı[ÿ\0eÿ\0â¨ÿ\0…MàÏú·şËÿ\0ÅPÍWÒÿ\0ğ©¼ÿ\0@–ÿ\0À™øª?áSx3ş-ÿ\02ÿ\0ñTóEô¿ü*oĞ%¿ğ&_ş*øTŞÿ\0 KàL¿üU\0|Ò¬Qƒ)!È#µMy{u¨]=ÍåÄ·¿Ş’W,OâkéøTŞÿ\0 KàL¿üUğ©¼ÿ\0@–ÿ\0À™øª\0ù£¥{ÏÂßˆ_Úğ¦…«MşŸ\Zâ	˜ÿ\0¯QØÿ\0´?Q[ßğ©¼ÿ\0@–ÿ\0À™øªt?<!o2M›$rFÁ•ÖêPT„|ÔÙÑH\0”´\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEÿÙ','123',2,3,'Arba.jpeg');
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
INSERT INTO `rol_item` VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
INSERT INTO `reporte` VALUES (1,'¬í\0sr\0(net.sf.jasperreports.engine.JasperReport\0\0\0\0\0\0\'Ø\0L\0compileDatat\0Ljava/io/Serializable;L\0compileNameSuffixt\0Ljava/lang/String;L\0\rcompilerClassq\0~\0xr\0-net.sf.jasperreports.engine.base.JRBaseReport\0\0\0\0\0\0\'Ø\0*I\0PSEUDO_SERIAL_VERSION_UIDI\0bottomMarginI\0columnCountI\0\rcolumnSpacingI\0columnWidthZ\0ignorePaginationZ\0isFloatColumnFooterZ\0isSummaryNewPageZ\0 isSummaryWithPageHeaderAndFooterZ\0isTitleNewPageI\0\nleftMarginB\0orientationI\0\npageHeightI\0	pageWidthB\0\nprintOrderI\0rightMarginI\0	topMarginB\0whenNoDataTypeL\0\nbackgroundt\0$Lnet/sf/jasperreports/engine/JRBand;L\0columnDirectiont\03Lnet/sf/jasperreports/engine/type/RunDirectionEnum;L\0columnFooterq\0~\0L\0columnHeaderq\0~\0[\0datasetst\0([Lnet/sf/jasperreports/engine/JRDataset;L\0defaultStylet\0%Lnet/sf/jasperreports/engine/JRStyle;L\0detailq\0~\0L\0\rdetailSectiont\0\'Lnet/sf/jasperreports/engine/JRSection;L\0formatFactoryClassq\0~\0L\0\nimportsSett\0Ljava/util/Set;L\0languageq\0~\0L\0lastPageFooterq\0~\0L\0mainDatasett\0\'Lnet/sf/jasperreports/engine/JRDataset;L\0nameq\0~\0L\0noDataq\0~\0L\0orientationValuet\02Lnet/sf/jasperreports/engine/type/OrientationEnum;L\0\npageFooterq\0~\0L\0\npageHeaderq\0~\0L\0printOrderValuet\01Lnet/sf/jasperreports/engine/type/PrintOrderEnum;[\0stylest\0&[Lnet/sf/jasperreports/engine/JRStyle;L\0summaryq\0~\0[\0	templatest\0/[Lnet/sf/jasperreports/engine/JRReportTemplate;L\0titleq\0~\0L\0whenNoDataTypeValuet\05Lnet/sf/jasperreports/engine/type/WhenNoDataTypeEnum;xp\0\0œ§\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\0\0S\0\0\0\0\0\0\0.\0sr\0+net.sf.jasperreports.engine.base.JRBaseBand\0\0\0\0\0\0\'Ø\0I\0PSEUDO_SERIAL_VERSION_UIDI\0heightZ\0isSplitAllowedL\0printWhenExpressiont\0*Lnet/sf/jasperreports/engine/JRExpression;L\0	splitTypet\0Ljava/lang/Byte;L\0splitTypeValuet\00Lnet/sf/jasperreports/engine/type/SplitTypeEnum;xr\03net.sf.jasperreports.engine.base.JRBaseElementGroup\0\0\0\0\0\0\'Ø\0L\0childrent\0Ljava/util/List;L\0elementGroupt\0,Lnet/sf/jasperreports/engine/JRElementGroup;xpsr\0java.util.ArrayListxÒ™Ça\0I\0sizexp\0\0\0\0w\0\0\0\nxp\0\0œ§\0\0\0\0pp~r\0.net.sf.jasperreports.engine.type.SplitTypeEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0STRETCH~r\01net.sf.jasperreports.engine.type.RunDirectionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0LTRsq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0œ§\0\0\0\0ppq\0~\0sq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0œ§\0\0\0\0ppq\0~\0pppsr\0.net.sf.jasperreports.engine.base.JRBaseSection\0\0\0\0\0\0\'Ø\0[\0bandst\0%[Lnet/sf/jasperreports/engine/JRBand;xpur\0%[Lnet.sf.jasperreports.engine.JRBand;•İ~ìŒÊ…5\0\0xp\0\0\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsr\0,net.sf.jasperreports.engine.base.JRBaseImage\0\0\0\0\0\0\'Ø\0*I\0PSEUDO_SERIAL_VERSION_UIDI\0\rbookmarkLevelB\0evaluationTimeB\0hyperlinkTargetB\0\rhyperlinkTypeZ\0isLazyB\0onErrorTypeL\0anchorNameExpressionq\0~\0L\0borderq\0~\0L\0borderColort\0Ljava/awt/Color;L\0bottomBorderq\0~\0L\0bottomBorderColorq\0~\0.L\0\rbottomPaddingt\0Ljava/lang/Integer;L\0evaluationGroupt\0%Lnet/sf/jasperreports/engine/JRGroup;L\0evaluationTimeValuet\05Lnet/sf/jasperreports/engine/type/EvaluationTimeEnum;L\0\nexpressionq\0~\0L\0horizontalAlignmentq\0~\0L\0horizontalAlignmentValuet\06Lnet/sf/jasperreports/engine/type/HorizontalAlignEnum;L\0hyperlinkAnchorExpressionq\0~\0L\0hyperlinkPageExpressionq\0~\0[\0hyperlinkParameterst\03[Lnet/sf/jasperreports/engine/JRHyperlinkParameter;L\0hyperlinkReferenceExpressionq\0~\0L\0\ZhyperlinkTooltipExpressionq\0~\0L\0isUsingCachet\0Ljava/lang/Boolean;L\0\nleftBorderq\0~\0L\0leftBorderColorq\0~\0.L\0leftPaddingq\0~\0/L\0lineBoxt\0\'Lnet/sf/jasperreports/engine/JRLineBox;L\0\nlinkTargetq\0~\0L\0linkTypeq\0~\0L\0onErrorTypeValuet\02Lnet/sf/jasperreports/engine/type/OnErrorTypeEnum;L\0paddingq\0~\0/L\0rightBorderq\0~\0L\0rightBorderColorq\0~\0.L\0rightPaddingq\0~\0/L\0\nscaleImageq\0~\0L\0scaleImageValuet\01Lnet/sf/jasperreports/engine/type/ScaleImageEnum;L\0	topBorderq\0~\0L\0topBorderColorq\0~\0.L\0\ntopPaddingq\0~\0/L\0verticalAlignmentq\0~\0L\0verticalAlignmentValuet\04Lnet/sf/jasperreports/engine/type/VerticalAlignEnum;xr\05net.sf.jasperreports.engine.base.JRBaseGraphicElement\0\0\0\0\0\0\'Ø\0I\0PSEUDO_SERIAL_VERSION_UIDL\0fillq\0~\0L\0	fillValuet\0+Lnet/sf/jasperreports/engine/type/FillEnum;L\0linePent\0#Lnet/sf/jasperreports/engine/JRPen;L\0penq\0~\0xr\0.net.sf.jasperreports.engine.base.JRBaseElement\0\0\0\0\0\0\'Ø\0\ZI\0PSEUDO_SERIAL_VERSION_UIDI\0heightZ\0isPrintInFirstWholeBandZ\0isPrintRepeatedValuesZ\0\ZisPrintWhenDetailOverflowsZ\0isRemoveLineWhenBlankB\0positionTypeB\0stretchTypeI\0widthI\0xI\0yL\0	backcolorq\0~\0.L\0defaultStyleProvidert\04Lnet/sf/jasperreports/engine/JRDefaultStyleProvider;L\0elementGroupq\0~\0L\0	forecolorq\0~\0.L\0keyq\0~\0L\0modeq\0~\0L\0	modeValuet\0+Lnet/sf/jasperreports/engine/type/ModeEnum;L\0parentStyleq\0~\0L\0parentStyleNameReferenceq\0~\0L\0positionTypeValuet\03Lnet/sf/jasperreports/engine/type/PositionTypeEnum;L\0printWhenExpressionq\0~\0L\0printWhenGroupChangesq\0~\00L\0\rpropertiesMapt\0-Lnet/sf/jasperreports/engine/JRPropertiesMap;[\0propertyExpressionst\03[Lnet/sf/jasperreports/engine/JRPropertyExpression;L\0stretchTypeValuet\02Lnet/sf/jasperreports/engine/type/StretchTypeEnum;xp\0\0œ§\0\0\0\0\0\0\0\0\0\0\0k\0\0¬\0\0\0pq\0~\0q\0~\0+pppppp~r\01net.sf.jasperreports.engine.type.PositionTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0FIX_RELATIVE_TO_TOPpppp~r\00net.sf.jasperreports.engine.type.StretchTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\nNO_STRETCH\0\0wîppsr\0*net.sf.jasperreports.engine.base.JRBasePen\0\0\0\0\0\0\'Ø\0I\0PSEUDO_SERIAL_VERSION_UIDL\0	lineColorq\0~\0.L\0	lineStyleq\0~\0L\0lineStyleValuet\00Lnet/sf/jasperreports/engine/type/LineStyleEnum;L\0	lineWidtht\0Ljava/lang/Float;L\0penContainert\0,Lnet/sf/jasperreports/engine/JRPenContainer;xp\0\0œ§ppppq\0~\0Cp\0\0œ§\0\0\0\0\0\0\0\0\0ppppppp~r\03net.sf.jasperreports.engine.type.EvaluationTimeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NOWsr\01net.sf.jasperreports.engine.base.JRBaseExpression\0\0\0\0\0\0\'Ø\0I\0id[\0chunkst\00[Lnet/sf/jasperreports/engine/JRExpressionChunk;L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xp\0\0\0ur\00[Lnet.sf.jasperreports.engine.JRExpressionChunk;mYÏŞiK£U\0\0xp\0\0\0sr\06net.sf.jasperreports.engine.base.JRBaseExpressionChunk\0\0\0\0\0\0\'Ø\0B\0typeL\0textq\0~\0xpt\0imagenppp~r\04net.sf.jasperreports.engine.type.HorizontalAlignEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0CENTERpppppppppsr\0.net.sf.jasperreports.engine.base.JRBaseLineBox\0\0\0\0\0\0\'Ø\0L\0\rbottomPaddingq\0~\0/L\0	bottomPent\0+Lnet/sf/jasperreports/engine/base/JRBoxPen;L\0boxContainert\0,Lnet/sf/jasperreports/engine/JRBoxContainer;L\0leftPaddingq\0~\0/L\0leftPenq\0~\0^L\0paddingq\0~\0/L\0penq\0~\0^L\0rightPaddingq\0~\0/L\0rightPenq\0~\0^L\0\ntopPaddingq\0~\0/L\0topPenq\0~\0^xppsr\03net.sf.jasperreports.engine.base.JRBaseBoxBottomPen\0\0\0\0\0\0\'Ø\0\0xr\0-net.sf.jasperreports.engine.base.JRBaseBoxPen\0\0\0\0\0\0\'Ø\0L\0lineBoxq\0~\05xq\0~\0J\0\0œ§sr\0java.awt.Color¥ƒ3u\0F\0falphaI\0valueL\0cst\0Ljava/awt/color/ColorSpace;[\0	frgbvaluet\0[F[\0fvalueq\0~\0fxp\0\0\0\0ÿ™™™pppppsr\0java.lang.FloatÚíÉ¢Û<ğì\0F\0valuexr\0java.lang.Number†¬•”à‹\0\0xp>€\0\0q\0~\0`q\0~\0`q\0~\0Cpsr\01net.sf.jasperreports.engine.base.JRBaseBoxLeftPen\0\0\0\0\0\0\'Ø\0\0xq\0~\0b\0\0œ§ppppq\0~\0`q\0~\0`psq\0~\0b\0\0œ§ppppq\0~\0`q\0~\0`psr\02net.sf.jasperreports.engine.base.JRBaseBoxRightPen\0\0\0\0\0\0\'Ø\0\0xq\0~\0b\0\0œ§ppppq\0~\0`q\0~\0`psr\00net.sf.jasperreports.engine.base.JRBaseBoxTopPen\0\0\0\0\0\0\'Ø\0\0xq\0~\0b\0\0œ§ppppq\0~\0`q\0~\0`pp~r\00net.sf.jasperreports.engine.type.OnErrorTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ERRORpppppppppp~r\02net.sf.jasperreports.engine.type.VerticalAlignEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0MIDDLEsr\00net.sf.jasperreports.engine.base.JRBaseTextField\0\0\0\0\0\0\'Ø\0I\0PSEUDO_SERIAL_VERSION_UIDI\0\rbookmarkLevelB\0evaluationTimeB\0hyperlinkTargetB\0\rhyperlinkTypeZ\0isStretchWithOverflowL\0anchorNameExpressionq\0~\0L\0evaluationGroupq\0~\00L\0evaluationTimeValueq\0~\01L\0\nexpressionq\0~\0L\0hyperlinkAnchorExpressionq\0~\0L\0hyperlinkPageExpressionq\0~\0[\0hyperlinkParametersq\0~\03L\0hyperlinkReferenceExpressionq\0~\0L\0\ZhyperlinkTooltipExpressionq\0~\0L\0isBlankWhenNullq\0~\04L\0\nlinkTargetq\0~\0L\0linkTypeq\0~\0L\0patternq\0~\0L\0patternExpressionq\0~\0xr\02net.sf.jasperreports.engine.base.JRBaseTextElement\0\0\0\0\0\0\'Ø\0%I\0PSEUDO_SERIAL_VERSION_UIDL\0borderq\0~\0L\0borderColorq\0~\0.L\0bottomBorderq\0~\0L\0bottomBorderColorq\0~\0.L\0\rbottomPaddingq\0~\0/L\0fontNameq\0~\0L\0fontSizeq\0~\0/L\0horizontalAlignmentq\0~\0L\0horizontalAlignmentValueq\0~\02L\0isBoldq\0~\04L\0isItalicq\0~\04L\0\risPdfEmbeddedq\0~\04L\0isStrikeThroughq\0~\04L\0isStyledTextq\0~\04L\0isUnderlineq\0~\04L\0\nleftBorderq\0~\0L\0leftBorderColorq\0~\0.L\0leftPaddingq\0~\0/L\0lineBoxq\0~\05L\0lineSpacingq\0~\0L\0lineSpacingValuet\02Lnet/sf/jasperreports/engine/type/LineSpacingEnum;L\0markupq\0~\0L\0paddingq\0~\0/L\0	paragrapht\0)Lnet/sf/jasperreports/engine/JRParagraph;L\0pdfEncodingq\0~\0L\0pdfFontNameq\0~\0L\0rightBorderq\0~\0L\0rightBorderColorq\0~\0.L\0rightPaddingq\0~\0/L\0rotationq\0~\0L\0\rrotationValuet\0/Lnet/sf/jasperreports/engine/type/RotationEnum;L\0	topBorderq\0~\0L\0topBorderColorq\0~\0.L\0\ntopPaddingq\0~\0/L\0verticalAlignmentq\0~\0L\0verticalAlignmentValueq\0~\08xq\0~\0<\0\0œ§\0\0\0\0\0\0\0\0\0\0\0E\0\0\0\0\0\0sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~\0+sq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0textField-15p~r\0)net.sf.jasperreports.engine.type.ModeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0TRANSPARENTppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialsr\0java.lang.Integerâ ¤÷‡8\0I\0valuexq\0~\0i\0\0\0pq\0~\0[sr\0java.lang.BooleanÍ r€Õœúî\0Z\0valuexp\0q\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ™™™pppp~r\0.net.sf.jasperreports.engine.type.LineStyleEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SOLIDsq\0~\0h>€\0\0q\0~\0‰q\0~\0‰q\0~\0}psq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0‰q\0~\0‰psq\0~\0b\0\0œ§ppppq\0~\0‰q\0~\0‰psq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0‰q\0~\0‰psq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0‰q\0~\0‰ppppsr\00net.sf.jasperreports.engine.base.JRBaseParagraph\0\0\0\0\0\0\'Ø\0\nL\0firstLineIndentq\0~\0/L\0\nleftIndentq\0~\0/L\0lineSpacingq\0~\0zL\0lineSpacingSizeq\0~\0LL\0paragraphContainert\02Lnet/sf/jasperreports/engine/JRParagraphContainer;L\0rightIndentq\0~\0/L\0spacingAfterq\0~\0/L\0\rspacingBeforeq\0~\0/L\0tabStopWidthq\0~\0/L\0tabStopsq\0~\0xppp~r\00net.sf.jasperreports.engine.type.LineSpacingEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SINGLEpq\0~\0}pppppt\0Cp1252t\0	Helveticapppp~r\0-net.sf.jasperreports.engine.type.RotationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NONEppppq\0~\0v\0\0œ§\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0tipopppppppq\0~\0ˆppt\0\0psq\0~\0x\0\0œ§\0\0\0\0\0\0\0\0\0\0\0b\0\0\0 \0\0\0\0sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~\0+sq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0textField-15pq\0~\0‚ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†pq\0~\0[q\0~\0ˆq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ™™™ppppq\0~\0sq\0~\0h>€\0\0q\0~\0¯q\0~\0¯q\0~\0ªpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0¯q\0~\0¯psq\0~\0b\0\0œ§ppppq\0~\0¯q\0~\0¯psq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0¯q\0~\0¯psq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0¯q\0~\0¯ppppsq\0~\0šppq\0~\0pq\0~\0ªpppppt\0Cp1252t\0	Helveticappppq\0~\0£ppppq\0~\0v\0\0œ§\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0fechaVencimientopppppppq\0~\0ˆppt\0\ndd/MM/yyyypsq\0~\0x\0\0œ§\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0\0sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~\0+sq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0textField-15pq\0~\0‚ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†pq\0~\0[q\0~\0ˆq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ™™™ppppq\0~\0sq\0~\0h>€\0\0q\0~\0Êq\0~\0Êq\0~\0Åpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0Êq\0~\0Êpsq\0~\0b\0\0œ§ppppq\0~\0Êq\0~\0Êpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0Êq\0~\0Êpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0Êq\0~\0Êppppsq\0~\0šppq\0~\0pq\0~\0Åpppppt\0Cp1252t\0	Helveticappppq\0~\0£ppppq\0~\0v\0\0œ§\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0nombrepppppppq\0~\0ˆppq\0~\0©psq\0~\0x\0\0œ§\0\0\0\0\0\0\0\0\0\0\0e\0\0G\0\0\0\0sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~\0+sq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0textField-15pq\0~\0‚ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†pq\0~\0[q\0~\0ˆq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ™™™ppppq\0~\0sq\0~\0h>€\0\0q\0~\0äq\0~\0äq\0~\0ßpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0äq\0~\0äpsq\0~\0b\0\0œ§ppppq\0~\0äq\0~\0äpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0äq\0~\0äpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~\0äq\0~\0äppppsq\0~\0šppq\0~\0pq\0~\0ßpppppt\0Cp1252t\0	Helveticappppq\0~\0£ppppq\0~\0v\0\0œ§\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0numeropppppppq\0~\0ˆppq\0~\0©pxp\0\0œ§\0\0\0ppq\0~\0psr\0java.util.HashSetºD…•–¸·4\0\0xpw\0\0\0?@\0\0\0\0\0t\0\"net.sf.jasperreports.engine.data.*t\0net.sf.jasperreports.engine.*t\0java.util.*xt\0javapsr\0.net.sf.jasperreports.engine.base.JRBaseDataset\0\0\0\0\0\0\'Ø\0I\0PSEUDO_SERIAL_VERSION_UIDZ\0isMainB\0whenResourceMissingType[\0fieldst\0&[Lnet/sf/jasperreports/engine/JRField;L\0filterExpressionq\0~\0[\0groupst\0&[Lnet/sf/jasperreports/engine/JRGroup;L\0nameq\0~\0[\0\nparameterst\0*[Lnet/sf/jasperreports/engine/JRParameter;L\0\rpropertiesMapq\0~\0@L\0queryt\0%Lnet/sf/jasperreports/engine/JRQuery;L\0resourceBundleq\0~\0L\0scriptletClassq\0~\0[\0\nscriptletst\0*[Lnet/sf/jasperreports/engine/JRScriptlet;[\0\nsortFieldst\0*[Lnet/sf/jasperreports/engine/JRSortField;[\0	variablest\0)[Lnet/sf/jasperreports/engine/JRVariable;L\0whenResourceMissingTypeValuet\0>Lnet/sf/jasperreports/engine/type/WhenResourceMissingTypeEnum;xp\0\0œ§\0ur\0&[Lnet.sf.jasperreports.engine.JRField;<ßÇN*òp\0\0xp\0\0\0sr\0,net.sf.jasperreports.engine.base.JRBaseField\0\0\0\0\0\0\'Ø\0L\0descriptionq\0~\0L\0nameq\0~\0L\0\rpropertiesMapq\0~\0@L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xppt\0idsr\0+net.sf.jasperreports.engine.JRPropertiesMap\0\0\0\0\0\0\'Ø\0L\0baseq\0~\0@L\0propertiesListq\0~\0L\0\rpropertiesMapt\0Ljava/util/Map;xppppt\0java.lang.Longpsq\0~pt\0nombresq\0~pppt\0java.lang.Stringpsq\0~pt\0fechaVencimientosq\0~pppt\0java.sql.Timestamppsq\0~pt\0numerosq\0~pppq\0~psq\0~pt\0tiposq\0~pppq\0~psq\0~pt\0imagensq\0~pppt\0java.io.InputStreamppur\0&[Lnet.sf.jasperreports.engine.JRGroup;@£_zLıxê\0\0xp\0\0\0sr\0,net.sf.jasperreports.engine.base.JRBaseGroup\0\0\0\0\0\0\'Ø\0I\0PSEUDO_SERIAL_VERSION_UIDB\0footerPositionZ\0isReprintHeaderOnEachPageZ\0isResetPageNumberZ\0isStartNewColumnZ\0isStartNewPageZ\0keepTogetherI\0minHeightToStartNewPageL\0\rcountVariablet\0(Lnet/sf/jasperreports/engine/JRVariable;L\0\nexpressionq\0~\0L\0footerPositionValuet\05Lnet/sf/jasperreports/engine/type/FooterPositionEnum;L\0groupFooterq\0~\0L\0groupFooterSectionq\0~\0L\0groupHeaderq\0~\0L\0groupHeaderSectionq\0~\0L\0nameq\0~\0xp\0\0œ§\0\0\0\0\0\0\0\0\0\0sr\0/net.sf.jasperreports.engine.base.JRBaseVariable\0\0\0\0\0\0\'Ø\0I\0PSEUDO_SERIAL_VERSION_UIDB\0calculationB\0\rincrementTypeZ\0isSystemDefinedB\0	resetTypeL\0calculationValuet\02Lnet/sf/jasperreports/engine/type/CalculationEnum;L\0\nexpressionq\0~\0L\0incrementGroupq\0~\00L\0incrementTypeValuet\04Lnet/sf/jasperreports/engine/type/IncrementTypeEnum;L\0incrementerFactoryClassNameq\0~\0L\0incrementerFactoryClassRealNameq\0~\0L\0initialValueExpressionq\0~\0L\0nameq\0~\0L\0\nresetGroupq\0~\00L\0resetTypeValuet\00Lnet/sf/jasperreports/engine/type/ResetTypeEnum;L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xp\0\0wî\0\0\0~r\00net.sf.jasperreports.engine.type.CalculationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0COUNTsq\0~\0R\0\0\0	uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)ppp~r\02net.sf.jasperreports.engine.type.IncrementTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NONEppsq\0~\0R\0\0\0\nuq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(0)ppt\0group1_COUNTq\0~)~r\0.net.sf.jasperreports.engine.type.ResetTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0GROUPt\0java.lang.Integerpsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0nullpp~r\03net.sf.jasperreports.engine.type.FooterPositionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NORMALpsq\0~\0&uq\0~\0)\0\0\0sq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0œ§\0\0\0%sq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new Boolean(sq\0~\0Wt\0nombresq\0~\0Wt\0	 != null)pppq\0~\0psq\0~\0&uq\0~\0)\0\0\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsr\01net.sf.jasperreports.engine.base.JRBaseStaticText\0\0\0\0\0\0\'Ø\0L\0textq\0~\0xq\0~\0y\0\0œ§\0\0\0\0\0\0\0\0\0\0\0c\0\0\0k\0\0\0sq\0~\0d\0\0\0\0ÿxxxpppq\0~\0q\0~Wsq\0~\0d\0\0\0\0ÿÿÿÿpppt\0\rstaticText-18p~q\0~\0t\0OPAQUEppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†pq\0~\0[sq\0~\0‡q\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?€\0\0q\0~bq\0~bq\0~Zpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?€\0\0q\0~bq\0~bpsq\0~\0b\0\0œ§ppppq\0~bq\0~bpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h>LÌÍq\0~bq\0~bpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?€\0\0q\0~bq\0~bppppsq\0~\0šppq\0~\0pq\0~Zpppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0£ppppq\0~\0vt\0	Productorsq\0~\0x\0\0œ§\0\0\0\0\0\0\0\0\0\0\0Ş\0\0\0Î\0\0\0sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~Wsq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0textField-15pq\0~\0‚ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialsq\0~\0…\0\0\0\npq\0~\0[q\0~aq\0~aq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?€\0\0q\0~zq\0~zq\0~tpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~zq\0~zpsq\0~\0b\0\0œ§ppppq\0~zq\0~zpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?€\0\0q\0~zq\0~zpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?€\0\0q\0~zq\0~zppppsq\0~\0šppq\0~\0pq\0~tpppppt\0Cp1252t\0Helvetica-BoldObliqueppppq\0~\0£ppppq\0~\0v\0\0œ§\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0\ruq\0~\0U\0\0\0sq\0~\0Wt\0(sq\0~\0Wt\0idProductorsq\0~\0Wt\0 == 0)?\"Todos los Productores\":sq\0~\0Wt\0nombrepppppppq\0~\0ˆppq\0~\0©psq\0~Y\0\0œ§\0\0\0\0\0\0\0\0\0\0\0e\0\0G\0\0\0Rsq\0~\0d\0\0\0\0ÿxxxpppq\0~\0q\0~Wsq\0~\0d\0\0\0\0ÿÿÿÿpppt\0\rstaticText-20pq\0~^ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†pq\0~\0[q\0~aq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~šq\0~šq\0~•psq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~šq\0~špsq\0~\0b\0\0œ§ppppq\0~šq\0~špsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~šq\0~špsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~šq\0~šppppsq\0~\0šppq\0~\0pq\0~•pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0£ppppq\0~\0vt\0NÃºmerosq\0~Y\0\0œ§\0\0\0\0\0\0\0\0\0\0\0k\0\0¬\0\0\0Rsq\0~\0d\0\0\0\0ÿxxxpppq\0~\0q\0~Wsq\0~\0d\0\0\0\0ÿÿÿÿpppt\0\rstaticText-20pq\0~^ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†pq\0~\0[q\0~aq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~±q\0~±q\0~¬psq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~±q\0~±psq\0~\0b\0\0œ§ppppq\0~±q\0~±psq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~±q\0~±psq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~±q\0~±ppppsq\0~\0šppq\0~\0pq\0~¬pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0£ppppq\0~\0vt\0Imagensq\0~Y\0\0œ§\0\0\0\0\0\0\0\0\0\0\0b\0\0\0 \0\0\0Rsq\0~\0d\0\0\0\0ÿxxxpppq\0~\0q\0~Wsq\0~\0d\0\0\0\0ÿÿÿÿpppt\0\rstaticText-20pq\0~^ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†pq\0~\0[q\0~aq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~Èq\0~Èq\0~Ãpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~Èq\0~Èpsq\0~\0b\0\0œ§ppppq\0~Èq\0~Èpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~Èq\0~Èpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~Èq\0~Èppppsq\0~\0šppq\0~\0pq\0~Ãpppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0£ppppq\0~\0vt\0Fecha Vencimientosq\0~Y\0\0œ§\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0\0\0Rsq\0~\0d\0\0\0\0ÿxxxpppq\0~\0q\0~Wsq\0~\0d\0\0\0\0ÿÿÿÿpppt\0\rstaticText-18pq\0~^ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†pq\0~\0[q\0~aq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~ßq\0~ßq\0~Úpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?€\0\0q\0~ßq\0~ßpsq\0~\0b\0\0œ§ppppq\0~ßq\0~ßpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~ßq\0~ßpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~ßq\0~ßppppsq\0~\0šppq\0~\0pq\0~Úpppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0£ppppq\0~\0vt\0	Productorsq\0~Y\0\0œ§\0\0\0\0\0\0\0\0\0\0\0E\0\0\0\0\0Rsq\0~\0d\0\0\0\0ÿxxxpppq\0~\0q\0~Wsq\0~\0d\0\0\0\0ÿÿÿÿpppt\0\rstaticText-20pq\0~^ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†pq\0~\0[q\0~aq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~öq\0~öq\0~ñpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~öq\0~öpsq\0~\0b\0\0œ§ppppq\0~öq\0~öpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~öq\0~öpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h?@\0\0q\0~öq\0~öppppsq\0~\0šppq\0~\0pq\0~ñpppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0£ppppq\0~\0vt\0Tipoxp\0\0œ§\0\0\0asq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new Boolean(sq\0~\0Wt\0nombresq\0~\0Wt\0	 != null)pppq\0~\0t\0group1t\0 reporteVencimientoMarcasSenialesur\0*[Lnet.sf.jasperreports.engine.JRParameter;\"\0*Ã`!\0\0xp\0\0\0sr\00net.sf.jasperreports.engine.base.JRBaseParameter\0\0\0\0\0\0\'Ø\0	Z\0isForPromptingZ\0isSystemDefinedL\0defaultValueExpressionq\0~\0L\0descriptionq\0~\0L\0nameq\0~\0L\0nestedTypeNameq\0~\0L\0\rpropertiesMapq\0~\0@L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xpppt\0REPORT_CONTEXTpsq\0~pppt\0)net.sf.jasperreports.engine.ReportContextpsq\0~ppt\0REPORT_PARAMETERS_MAPpsq\0~pppt\0\rjava.util.Mappsq\0~ppt\0\rJASPER_REPORTpsq\0~pppt\0(net.sf.jasperreports.engine.JasperReportpsq\0~ppt\0REPORT_CONNECTIONpsq\0~pppt\0java.sql.Connectionpsq\0~ppt\0REPORT_MAX_COUNTpsq\0~pppq\0~Apsq\0~ppt\0REPORT_DATA_SOURCEpsq\0~pppt\0(net.sf.jasperreports.engine.JRDataSourcepsq\0~ppt\0REPORT_SCRIPTLETpsq\0~pppt\0/net.sf.jasperreports.engine.JRAbstractScriptletpsq\0~ppt\0\rREPORT_LOCALEpsq\0~pppt\0java.util.Localepsq\0~ppt\0REPORT_RESOURCE_BUNDLEpsq\0~pppt\0java.util.ResourceBundlepsq\0~ppt\0REPORT_TIME_ZONEpsq\0~pppt\0java.util.TimeZonepsq\0~ppt\0REPORT_FORMAT_FACTORYpsq\0~pppt\0.net.sf.jasperreports.engine.util.FormatFactorypsq\0~ppt\0REPORT_CLASS_LOADERpsq\0~pppt\0java.lang.ClassLoaderpsq\0~ppt\0\ZREPORT_URL_HANDLER_FACTORYpsq\0~pppt\0 java.net.URLStreamHandlerFactorypsq\0~ppt\0REPORT_FILE_RESOLVERpsq\0~pppt\0-net.sf.jasperreports.engine.util.FileResolverpsq\0~ppt\0REPORT_TEMPLATESpsq\0~pppt\0java.util.Collectionpsq\0~ppt\0SORT_FIELDSpsq\0~pppt\0java.util.Listpsq\0~ppt\0FILTERpsq\0~pppt\0)net.sf.jasperreports.engine.DatasetFilterpsq\0~ppt\0REPORT_VIRTUALIZERpsq\0~pppt\0)net.sf.jasperreports.engine.JRVirtualizerpsq\0~ppt\0IS_IGNORE_PAGINATIONpsq\0~pppt\0java.lang.Booleanpsq\0~\0\0sq\0~\0R\0\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0\".\\\\\"pppt\0PATH_SUB_REPORTESpsq\0~pppt\0java.lang.Stringpsq\0~\0ppt\0idProductorpsq\0~pppt\0java.lang.Longpsq\0~\0ppt\0fechaReportepsq\0~pppt\0java.util.Datepsq\0~psq\0~\0\0\0\0w\0\0\0\nt\0ireport.scriptlethandlingt\0ireport.encodingt\0ireport.zoomt\0	ireport.xt\0	ireport.yxsr\0java.util.HashMapÚÁÃ`Ñ\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~tt\01.5q\0~st\0UTF-8q\0~ut\00q\0~vt\0219q\0~rt\00xsr\0,net.sf.jasperreports.engine.base.JRBaseQuery\0\0\0\0\0\0\'Ø\0[\0chunkst\0+[Lnet/sf/jasperreports/engine/JRQueryChunk;L\0languageq\0~\0xpur\0+[Lnet.sf.jasperreports.engine.JRQueryChunk;@Ÿ\0¡èº4¤\0\0xp\0\0\0	sr\01net.sf.jasperreports.engine.base.JRBaseQueryChunk\0\0\0\0\0\0\'Ø\0B\0typeL\0textq\0~\0[\0tokenst\0[Ljava/lang/String;xpt\nSELECT *\nFROM\n((SELECT *\n FROM (SELECT e.id as id, e.nombre, m.fechaVencimiento as fechaVencimiento,\n		m.numero as numero,\"Marca\" as tipo, m.imagen\n       FROM (x071vm20_siig.Entidad e inner join x071vm20_siig.Marca m\n       	  on e.id=m.productor_fk)\n       WHERE (psq\0~ƒt\0idProductorpsq\0~ƒt\0 = 0 or psq\0~ƒt\0idProductorpsq\0~ƒth = e.id) and e.tipoEntidad = \"PRD\"\n       order by fechaVencimiento desc\n       ) d\ngroup by d.id)\n\nunion\n\n(SELECT *\n FROM (SELECT e.id as id, e.nombre, m.fechaVencimiento as fechaVencimiento,\n		m.numero as numero,\"SeÃ±al\" as tipo, m.imagen\n       FROM (x071vm20_siig.Entidad e inner join x071vm20_siig.Senial m\n       	  on e.id=m.productor_fk)\n       WHERE (psq\0~ƒt\0idProductorpsq\0~ƒt\0 = 0 or psq\0~ƒt\0idProductorpsq\0~ƒt\0q = e.id) and e.tipoEntidad = \"PRD\"\n       order by fechaVencimiento desc\n       ) d\ngroup by d.id)) r\norder by idpt\0sqlppppur\0)[Lnet.sf.jasperreports.engine.JRVariable;bæƒ|˜,·D\0\0xp\0\0\0sq\0~*\0\0wî\0\0\0~q\0~/t\0SYSTEMppq\0~7ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)ppt\0PAGE_NUMBERp~q\0~>t\0REPORTq\0~Apsq\0~*\0\0wî\0\0\0q\0~›ppq\0~7ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)ppt\0\rCOLUMN_NUMBERp~q\0~>t\0PAGEq\0~Apsq\0~*\0\0wî\0\0\0q\0~0sq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)pppq\0~7ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(0)ppt\0REPORT_COUNTpq\0~¢q\0~Apsq\0~*\0\0wî\0\0\0q\0~0sq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)pppq\0~7ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(0)ppt\0\nPAGE_COUNTpq\0~ªq\0~Apsq\0~*\0\0wî\0\0\0q\0~0sq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)pppq\0~7ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(0)ppt\0COLUMN_COUNTp~q\0~>t\0COLUMNq\0~Apq\0~.sq\0~*\0\0wî\0\0\0\0~q\0~/t\0SUMppq\0~7pppt\0totalDeudaCanonpq\0~¢t\0java.lang.Doublepsq\0~*\0\0wî\0\0\0\0q\0~Íppq\0~7pppt\0totalDeudaDeclaracionpq\0~¢t\0java.lang.Doublep~r\0<net.sf.jasperreports.engine.type.WhenResourceMissingTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NULLq\0~p~r\00net.sf.jasperreports.engine.type.OrientationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0PORTRAITsq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~\0x\0\0œ§\0\0\0\0\0\0\0\0\0\0\0\0\0ù\0\0\0+pq\0~\0q\0~Úsq\0~\0d\0\0\0\0ÿ™™™ppppppppq\0~\0Eppppq\0~\0H\0\0œ§ppppppppppppppppppsq\0~\0]psq\0~\0a\0\0œ§ppppq\0~Şq\0~Şq\0~Üpsq\0~\0k\0\0œ§ppppq\0~Şq\0~Şpsq\0~\0b\0\0œ§ppppq\0~Şq\0~Şpsq\0~\0n\0\0œ§ppppq\0~Şq\0~Şpsq\0~\0p\0\0œ§ppppq\0~Şq\0~Şppppsq\0~\0šppppq\0~Üppppppppppppppppq\0~\0v\0\0œ§\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0PAGE_NUMBERppppppppppppsq\0~Y\0\0œ§\0\0\0\0\0\0\0\0\0\0f\0\0\0X\0\0\0+sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~Úsq\0~\0d\0\0\0\0ÿ™™™pppt\0\rstaticText-24pq\0~\0‚ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialsq\0~\0…\0\0\0pq\0~\0[q\0~aq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~ïq\0~ïq\0~épsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~ïq\0~ïpsq\0~\0b\0\0œ§ppppq\0~ïq\0~ïpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~ïq\0~ïpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~ïq\0~ïppppsq\0~\0šppq\0~\0pq\0~épppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0£ppppq\0~\0vt\0SISTEMA INTEGRAL DE INFORMACION AGROPECUARIA - VersiÃ³n 1.0\nGEOINGENIERIA - Desarrollo RIDIERGROUP\nContacto: tel 02901-15561782 - geo.ingenieria@yahoo.com.arsq\0~\0x\0\0œ§\0\0\0\0\0\0\0\0\0\0\0}\0\0\0\0\0\0\0+sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~Úsq\0~\0d\0\0\0\0ÿ™™™pppt\0textField-15pq\0~\0‚ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialq\0~\0†p~q\0~\0Zt\0LEFTq\0~\0ˆq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~q\0~q\0~psq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~q\0~psq\0~\0b\0\0œ§ppppq\0~q\0~psq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~q\0~psq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~q\0~ppppsq\0~\0šppq\0~\0pq\0~pppppt\0Cp1252t\0	Helveticappppq\0~\0£ppppq\0~\0v\0\0œ§\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0fechaReportepppppppq\0~appt\0\ndd/MM/yyyypsr\0+net.sf.jasperreports.engine.base.JRBaseLine\0\0\0\0\0\0\'Ø\0I\0PSEUDO_SERIAL_VERSION_UIDB\0	directionL\0directionValuet\04Lnet/sf/jasperreports/engine/type/LineDirectionEnum;xq\0~\09\0\0œ§\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*pq\0~\0q\0~Úsq\0~\0d\0\0\0\0ÿÌÌÌppppppppq\0~\0Eppppq\0~\0H\0\0wîppsq\0~\0J\0\0œ§ppppq\0~ p\0\0œ§\0~r\02net.sf.jasperreports.engine.type.LineDirectionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0TOP_DOWNxp\0\0œ§\0\0\0Lppq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~Y\0\0œ§\0\0\0\0\0\0\0\0\0\0f\0\0\0X\0\0\0\0sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~&sq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0\rstaticText-24pq\0~\0‚ppq\0~\0Esq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new Boolean(sq\0~\0Wt\0nombresq\0~\0Wt\0	 != null)pppppq\0~\0H\0\0œ§pppppt\0Arialsq\0~\0…\0\0\0pq\0~\0[q\0~aq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0pppp~q\0~\0Œt\0DOTTEDsq\0~\0h\0\0\0\0q\0~6q\0~6q\0~(psq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~9sq\0~\0h\0\0\0\0q\0~6q\0~6psq\0~\0b\0\0œ§ppq\0~9pq\0~6q\0~6psq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~9sq\0~\0h\0\0\0\0q\0~6q\0~6psq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~9sq\0~\0h\0\0\0\0q\0~6q\0~6ppppsq\0~\0šppq\0~\0pq\0~(pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0£ppppq\0~\0vt\0-Vencimiento de TÃ­tulos de Marcas y seÃ±ales sq\0~Y\0\0œ§\0\0\0\0\0\0\0\0\0\0\0÷\0\0\0\0\0\0\0sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~&sq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0\rstaticText-24pq\0~\0‚ppq\0~\0Esq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new Boolean(sq\0~\0Wt\0nombresq\0~\0Wt\0	 == null)pppppq\0~\0H\0\0œ§pppppt\0Arialq\0~5pq\0~\0[q\0~aq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~Wq\0~Wq\0~Jpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~Wq\0~Wpsq\0~\0b\0\0œ§ppppq\0~Wq\0~Wpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~Wq\0~Wpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~Wq\0~Wppppsq\0~\0šppq\0~\0pq\0~Jpppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0£ppppq\0~\0vt\0\ZNo hay datos para procesarxp\0\0œ§\0\0\0+ppq\0~\0~r\0/net.sf.jasperreports.engine.type.PrintOrderEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0VERTICALpsq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0œ§\0\0\0\0ppq\0~\0psq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~Y\0\0œ§\0\0\0\"\0\0\0\0\0\0\0\0|\0\0¥\0\0\02sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~nsq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0\rstaticText-23pq\0~\0‚ppq\0~\0Eppppq\0~\0H\0\0œ§pppppt\0Arialsq\0~\0…\0\0\0pq\0~\0[q\0~\0ˆq\0~\0ˆq\0~\0ˆq\0~\0ˆpq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~vq\0~vq\0~ppsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~vq\0~vpsq\0~\0b\0\0œ§ppppq\0~vq\0~vpsq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~vq\0~vpsq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~vq\0~vppppsq\0~\0šppq\0~\0pq\0~ppppppt\0Cp1252t\0	Helveticappppq\0~\0£pppp~q\0~\0ut\0TOPt\0¨Provincia de Tierra del Fuego, AntÃ¡rtida\ne Islas del AtlÃ¡ntico Sur\nRepÃºblica Argentina\nSecretaria de Desarrollo Sustentable y Ambiente\nDirecciÃ³n General de Bosques\nsq\0~\0-\0\0œ§\0\0\0&\0\0\0\0\0\0\0\04\0\0È\0\0\0sq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~nsq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0image-1pq\0~^ppq\0~\0Eppppq\0~\0H\0\0wîp~r\0)net.sf.jasperreports.engine.type.FillEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SOLIDsq\0~\0J\0\0œ§ppq\0~\0sq\0~\0h\0\0\0\0q\0~Šp\0\0œ§\0\0\0\0\0\0\0\0\0pppppppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0PATH_SUB_REPORTESsq\0~\0Wt\00+System.getProperty(\"file.separator\")+\"logo.jpg\"pppq\0~pppppq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~™q\0~™q\0~Špsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~™q\0~™psq\0~\0b\0\0œ§ppppq\0~™q\0~™psq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~™q\0~™psq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~™q\0~™ppq\0~\0sppppp~r\0/net.sf.jasperreports.engine.type.ScaleImageEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\nFILL_FRAMEppppq\0~‡sq\0~\0-\0\0œ§\0\0\07\0\0\0\0\0\0\0\0}\0\0\0\n\0\0\0\nsq\0~\0d\0\0\0\0ÿÿÿÿpppq\0~\0q\0~nsq\0~\0d\0\0\0\0ÿ\0\0\0pppt\0image-1pq\0~^ppq\0~\0Eppppq\0~\0H\0\0wîpq\0~sq\0~\0J\0\0œ§ppq\0~\0sq\0~\0h\0\0\0\0q\0~ªp\0\0œ§\0\0\0\0\0\0\0\0\0pppppppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0PATH_SUB_REPORTESsq\0~\0Wt\05+System.getProperty(\"file.separator\")+\"LOGOSIIM2.jpg\"pppq\0~pppppq\0~\0ˆpppsq\0~\0]psq\0~\0a\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~¶q\0~¶q\0~ªpsq\0~\0k\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~¶q\0~¶psq\0~\0b\0\0œ§ppppq\0~¶q\0~¶psq\0~\0n\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~¶q\0~¶psq\0~\0p\0\0œ§sq\0~\0d\0\0\0\0ÿ\0\0\0ppppq\0~\0sq\0~\0h\0\0\0\0q\0~¶q\0~¶ppq\0~\0spppppq\0~¨ppppq\0~‡xp\0\0œ§\0\0\0jppq\0~\0~r\03net.sf.jasperreports.engine.type.WhenNoDataTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ALL_SECTIONS_NO_DETAILsr\06net.sf.jasperreports.engine.design.JRReportCompileData\0\0\0\0\0\0\'Ø\0L\0crosstabCompileDataq\0~L\0datasetCompileDataq\0~L\0mainDatasetCompileDataq\0~\0xpsq\0~w?@\0\0\0\0\0w\0\0\0\0\0\0\0xsq\0~w?@\0\0\0\0\0w\0\0\0\0\0\0\0xur\0[B¬óøTà\0\0xp\0\0qÊşº¾\0\0\0.(\05reporteVencimientoMarcasSeniales_1390313933221_651129\0\0,net/sf/jasperreports/engine/fill/JREvaluator\0\0parameter_REPORT_LOCALE\02Lnet/sf/jasperreports/engine/fill/JRFillParameter;\0parameter_PATH_SUB_REPORTES\0parameter_JASPER_REPORT\0parameter_REPORT_VIRTUALIZER\0\Zparameter_REPORT_TIME_ZONE\0parameter_SORT_FIELDS\0parameter_REPORT_FILE_RESOLVER\0\Zparameter_REPORT_SCRIPTLET\0parameter_REPORT_PARAMETERS_MAP\0parameter_REPORT_CONNECTION\0parameter_fechaReporte\0parameter_REPORT_CONTEXT\0parameter_REPORT_CLASS_LOADER\0parameter_REPORT_DATA_SOURCE\0$parameter_REPORT_URL_HANDLER_FACTORY\0parameter_IS_IGNORE_PAGINATION\0parameter_FILTER\0parameter_REPORT_FORMAT_FACTORY\0\Zparameter_REPORT_MAX_COUNT\0\Zparameter_REPORT_TEMPLATES\0parameter_idProductor\0 parameter_REPORT_RESOURCE_BUNDLE\0field_nombre\0.Lnet/sf/jasperreports/engine/fill/JRFillField;\0field_id\0field_imagen\0field_fechaVencimiento\0\nfield_tipo\0field_numero\0variable_PAGE_NUMBER\01Lnet/sf/jasperreports/engine/fill/JRFillVariable;\0variable_COLUMN_NUMBER\0variable_REPORT_COUNT\0variable_PAGE_COUNT\0variable_COLUMN_COUNT\0variable_group1_COUNT\0variable_totalDeudaCanon\0variable_totalDeudaDeclaracion\0<init>\0()V\0Code\0,\0-\n\0\0/\0\0	\0\01\0\0	\0\03\0\0	\0\05\0	\0	\0\07\0\n\0	\0\09\0\0	\0\0;\0\0	\0\0=\0\r\0	\0\0?\0\0	\0\0A\0\0	\0\0C\0\0	\0\0E\0\0	\0\0G\0\0	\0\0I\0\0	\0\0K\0\0	\0\0M\0\0	\0\0O\0\0	\0\0Q\0\0	\0\0S\0\0	\0\0U\0\0	\0\0W\0\Z\0	\0\0Y\0\0	\0\0[\0\0	\0\0]\0\0	\0\0_\0\0	\0\0a\0 \0	\0\0c\0!\0	\0\0e\0\"\0	\0\0g\0#\0$	\0\0i\0%\0$	\0\0k\0&\0$	\0\0m\0\'\0$	\0\0o\0(\0$	\0\0q\0)\0$	\0\0s\0*\0$	\0\0u\0+\0$	\0\0w\0LineNumberTable\0customizedInit\00(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V\0\ninitParams\0(Ljava/util/Map;)V\0|\0}\n\0\0~\0\ninitFields\0€\0}\n\0\0\0initVars\0ƒ\0}\n\0\0„\0\rREPORT_LOCALE\0†\0\rjava/util/Map\0ˆ\0get\0&(Ljava/lang/Object;)Ljava/lang/Object;\0Š\0‹\0‰\0Œ\00net/sf/jasperreports/engine/fill/JRFillParameter\0\0PATH_SUB_REPORTES\0\0\rJASPER_REPORT\0’\0REPORT_VIRTUALIZER\0”\0REPORT_TIME_ZONE\0–\0SORT_FIELDS\0˜\0REPORT_FILE_RESOLVER\0š\0REPORT_SCRIPTLET\0œ\0REPORT_PARAMETERS_MAP\0\0REPORT_CONNECTION\0 \0fechaReporte\0¢\0REPORT_CONTEXT\0¤\0REPORT_CLASS_LOADER\0¦\0REPORT_DATA_SOURCE\0¨\0\ZREPORT_URL_HANDLER_FACTORY\0ª\0IS_IGNORE_PAGINATION\0¬\0FILTER\0®\0REPORT_FORMAT_FACTORY\0°\0REPORT_MAX_COUNT\0²\0REPORT_TEMPLATES\0´\0idProductor\0¶\0REPORT_RESOURCE_BUNDLE\0¸\0nombre\0º\0,net/sf/jasperreports/engine/fill/JRFillField\0¼\0id\0¾\0imagen\0À\0fechaVencimiento\0Â\0tipo\0Ä\0numero\0Æ\0PAGE_NUMBER\0È\0/net/sf/jasperreports/engine/fill/JRFillVariable\0Ê\0\rCOLUMN_NUMBER\0Ì\0REPORT_COUNT\0Î\0\nPAGE_COUNT\0Ğ\0COLUMN_COUNT\0Ò\0group1_COUNT\0Ô\0totalDeudaCanon\0Ö\0totalDeudaDeclaracion\0Ø\0evaluate\0(I)Ljava/lang/Object;\0\nExceptions\0java/lang/Throwable\0İ\0.\\\0ß\0java/lang/Integer\0á\0(I)V\0,\0ã\n\0â\0ä\0java/lang/Boolean\0æ\0getValue\0()Ljava/lang/Object;\0è\0é\n\0½\0ê\0java/lang/String\0ì\0(Z)V\0,\0î\n\0ç\0ï\n\0\0ê\0java/lang/Long\0ò\0	longValue\0()J\0ô\0õ\n\0ó\0ö\0Todos los Productores\0ø\0java/lang/StringBuffer\0ú\0valueOf\0&(Ljava/lang/Object;)Ljava/lang/String;\0ü\0ı\n\0í\0ş\0(Ljava/lang/String;)V\0,\0\n\0û\0file.separator\0java/lang/System\0getProperty\0&(Ljava/lang/String;)Ljava/lang/String;\n	\0append\0,(Ljava/lang/String;)Ljava/lang/StringBuffer;\n\0û\r\0logo.jpg\0toString\0()Ljava/lang/String;\n\0û\0\rLOGOSIIM2.jpg\0java/io/InputStream\0java/sql/Timestamp\n\0Ë\0ê\0java/util/Date\0evaluateOld\0getOldValue\0é\n\0½ \n\0Ë \0evaluateEstimated\0getEstimatedValue$\0é\n\0Ë%\0\nSourceFile\0!\0\0\0\0\0$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0!\0\0\0\0\0\"\0\0\0\0\0#\0$\0\0\0\0%\0$\0\0\0\0&\0$\0\0\0\0\'\0$\0\0\0\0(\0$\0\0\0\0)\0$\0\0\0\0*\0$\0\0\0\0+\0$\0\0\0\0\0,\0-\0\0.\0\0e\0\0\0\0\0¹*·\00*µ\02*µ\04*µ\06*µ\08*µ\0:*µ\0<*µ\0>*µ\0@*µ\0B*µ\0D*µ\0F*µ\0H*µ\0J*µ\0L*µ\0N*µ\0P*µ\0R*µ\0T*µ\0V*µ\0X*µ\0Z*µ\0\\*µ\0^*µ\0`*µ\0b*µ\0d*µ\0f*µ\0h*µ\0j*µ\0l*µ\0n*µ\0p*µ\0r*µ\0t*µ\0v*µ\0x±\0\0\0\0y\0\0\0š\0&\0\0\0\0\0\0	\0\0\0\0\0\0\0 \0\0!\0\"\0\"\0\'\0#\0,\0$\01\0%\06\0&\0;\0\'\0@\0(\0E\0)\0J\0*\0O\0+\0T\0,\0Y\0-\0^\0.\0c\0/\0h\00\0m\01\0r\02\0w\03\0|\04\0\05\0†\06\0‹\07\0\08\0•\09\0š\0:\0Ÿ\0;\0¤\0<\0©\0=\0®\0>\0³\0?\0¸\0\0\0z\0{\0\0.\0\0\04\0\0\0\0\0*+·\0*,·\0‚*-·\0…±\0\0\0\0y\0\0\0\0\0\0\0K\0\0L\0\n\0M\0\0N\0\0|\0}\0\0.\0\0ı\0\0\0\0*+‡¹\0\0À\0À\0µ\02*+‘¹\0\0À\0À\0µ\04*+“¹\0\0À\0À\0µ\06*+•¹\0\0À\0À\0µ\08*+—¹\0\0À\0À\0µ\0:*+™¹\0\0À\0À\0µ\0<*+›¹\0\0À\0À\0µ\0>*+¹\0\0À\0À\0µ\0@*+Ÿ¹\0\0À\0À\0µ\0B*+¡¹\0\0À\0À\0µ\0D*+£¹\0\0À\0À\0µ\0F*+¥¹\0\0À\0À\0µ\0H*+§¹\0\0À\0À\0µ\0J*+©¹\0\0À\0À\0µ\0L*+«¹\0\0À\0À\0µ\0N*+­¹\0\0À\0À\0µ\0P*+¯¹\0\0À\0À\0µ\0R*+±¹\0\0À\0À\0µ\0T*+³¹\0\0À\0À\0µ\0V*+µ¹\0\0À\0À\0µ\0X*+·¹\0\0À\0À\0µ\0Z*+¹¹\0\0À\0À\0µ\0\\±\0\0\0\0y\0\0\0^\0\0\0\0V\0\0W\0$\0X\06\0Y\0H\0Z\0Z\0[\0l\0\\\0~\0]\0\0^\0¢\0_\0´\0`\0Æ\0a\0Ø\0b\0ê\0c\0ü\0d\0e \0f2\0gD\0hV\0ih\0jz\0kŒ\0l\0\0€\0}\0\0.\0\0\0\0\0\0\0\0m*+»¹\0\0À\0½À\0½µ\0^*+¿¹\0\0À\0½À\0½µ\0`*+Á¹\0\0À\0½À\0½µ\0b*+Ã¹\0\0À\0½À\0½µ\0d*+Å¹\0\0À\0½À\0½µ\0f*+Ç¹\0\0À\0½À\0½µ\0h±\0\0\0\0y\0\0\0\0\0\0\0t\0\0u\0$\0v\06\0w\0H\0x\0Z\0y\0l\0z\0\0ƒ\0}\0\0.\0\0\0É\0\0\0\0\0‘*+É¹\0\0À\0ËÀ\0Ëµ\0j*+Í¹\0\0À\0ËÀ\0Ëµ\0l*+Ï¹\0\0À\0ËÀ\0Ëµ\0n*+Ñ¹\0\0À\0ËÀ\0Ëµ\0p*+Ó¹\0\0À\0ËÀ\0Ëµ\0r*+Õ¹\0\0À\0ËÀ\0Ëµ\0t*+×¹\0\0À\0ËÀ\0Ëµ\0v*+Ù¹\0\0À\0ËÀ\0Ëµ\0x±\0\0\0\0y\0\0\0&\0	\0\0\0‚\0\0ƒ\0$\0„\06\0…\0H\0†\0Z\0‡\0l\0ˆ\0~\0‰\0\0Š\0\0Ú\0Û\0\0Ü\0\0\0\0\0Ş\0.\0\05\0\0\0\0IMª\0\0D\0\0\0\0\0\0\0\0\0\0u\0\0\0{\0\0\0‡\0\0\0“\0\0\0Ÿ\0\0\0«\0\0\0·\0\0\0Ã\0\0\0Ï\0\0\0Û\0\0\0ç\0\0\0ó\0\0\0ø\0\0\0\0:\0\0W\0\0\0\0«\0\0È\0\0å\0\0ó\0\0\0\0\0\0\0\0+\0\09àM§Ì»\0âY·\0åM§À»\0âY·\0åM§´»\0âY·\0åM§¨»\0âY·\0åM§œ»\0âY·\0åM§»\0âY·\0åM§„»\0âY·\0åM§x»\0âY·\0åM§l»\0âY·\0åM§`»\0âY·\0åM§TM§O»\0çY*´\0^¶\0ëÀ\0íÆ\0§\0·\0ğM§2*´\0Z¶\0ñÀ\0ó¶\0÷	”š\0ù§\0\r*´\0^¶\0ëÀ\0íM§\r»\0çY*´\0^¶\0ëÀ\0íÆ\0§\0·\0ğM§\0ğ»\0ûY*´\04¶\0ñÀ\0í¸\0ÿ·¸\n¶¶¶M§\0Æ»\0ûY*´\04¶\0ñÀ\0í¸\0ÿ·¸\n¶¶¶M§\0œ»\0çY*´\0^¶\0ëÀ\0íÆ\0§\0·\0ğM§\0»\0çY*´\0^¶\0ëÀ\0íÇ\0§\0·\0ğM§\0b*´\0b¶\0ëÀM§\0T*´\0f¶\0ëÀ\0íM§\0F*´\0d¶\0ëÀ\ZM§\08*´\0^¶\0ëÀ\0íM§\0**´\0h¶\0ëÀ\0íM§\0*´\0j¶À\0âM§\0*´\0F¶\0ñÀM,°\0\0\0\0y\0\0\0Ú\06\0\0\0’\0\0”\0x\0˜\0{\0™\0~\0\0‡\0\0Š\0¢\0“\0£\0–\0§\0Ÿ\0¨\0¢\0¬\0«\0­\0®\0±\0·\0²\0º\0¶\0Ã\0·\0Æ\0»\0Ï\0¼\0Ò\0À\0Û\0Á\0Ş\0Å\0ç\0Æ\0ê\0Ê\0ó\0Ë\0ö\0Ï\0ø\0Ğ\0û\0Ô\0Õ\0Ù:\0Ú=\0ŞW\0ßZ\0ã\0ä„\0è«\0é®\0íÈ\0îË\0òå\0óè\0÷ó\0øö\0ü\0ı +.9<G\0\0Û\0\0Ü\0\0\0\0\0Ş\0.\0\05\0\0\0\0IMª\0\0D\0\0\0\0\0\0\0\0\0\0u\0\0\0{\0\0\0‡\0\0\0“\0\0\0Ÿ\0\0\0«\0\0\0·\0\0\0Ã\0\0\0Ï\0\0\0Û\0\0\0ç\0\0\0ó\0\0\0ø\0\0\0\0:\0\0W\0\0\0\0«\0\0È\0\0å\0\0ó\0\0\0\0\0\0\0\0+\0\09àM§Ì»\0âY·\0åM§À»\0âY·\0åM§´»\0âY·\0åM§¨»\0âY·\0åM§œ»\0âY·\0åM§»\0âY·\0åM§„»\0âY·\0åM§x»\0âY·\0åM§l»\0âY·\0åM§`»\0âY·\0åM§TM§O»\0çY*´\0^¶!À\0íÆ\0§\0·\0ğM§2*´\0Z¶\0ñÀ\0ó¶\0÷	”š\0ù§\0\r*´\0^¶!À\0íM§\r»\0çY*´\0^¶!À\0íÆ\0§\0·\0ğM§\0ğ»\0ûY*´\04¶\0ñÀ\0í¸\0ÿ·¸\n¶¶¶M§\0Æ»\0ûY*´\04¶\0ñÀ\0í¸\0ÿ·¸\n¶¶¶M§\0œ»\0çY*´\0^¶!À\0íÆ\0§\0·\0ğM§\0»\0çY*´\0^¶!À\0íÇ\0§\0·\0ğM§\0b*´\0b¶!ÀM§\0T*´\0f¶!À\0íM§\0F*´\0d¶!À\ZM§\08*´\0^¶!À\0íM§\0**´\0h¶!À\0íM§\0*´\0j¶\"À\0âM§\0*´\0F¶\0ñÀM,°\0\0\0\0y\0\0\0Ú\06\0\0&\0(\0x,\0{-\0~1\0‡2\0Š6\0“7\0–;\0Ÿ<\0¢@\0«A\0®E\0·F\0ºJ\0ÃK\0ÆO\0ÏP\0ÒT\0ÛU\0ŞY\0çZ\0ê^\0ó_\0öc\0ød\0ûhim:n=rWsZwx„|«}®È‚Ë†å‡è‹óŒö‘•–š› Ÿ+ .¤9¥<©G±\0#\0Û\0\0Ü\0\0\0\0\0Ş\0.\0\05\0\0\0\0IMª\0\0D\0\0\0\0\0\0\0\0\0\0u\0\0\0{\0\0\0‡\0\0\0“\0\0\0Ÿ\0\0\0«\0\0\0·\0\0\0Ã\0\0\0Ï\0\0\0Û\0\0\0ç\0\0\0ó\0\0\0ø\0\0\0\0:\0\0W\0\0\0\0«\0\0È\0\0å\0\0ó\0\0\0\0\0\0\0\0+\0\09àM§Ì»\0âY·\0åM§À»\0âY·\0åM§´»\0âY·\0åM§¨»\0âY·\0åM§œ»\0âY·\0åM§»\0âY·\0åM§„»\0âY·\0åM§x»\0âY·\0åM§l»\0âY·\0åM§`»\0âY·\0åM§TM§O»\0çY*´\0^¶\0ëÀ\0íÆ\0§\0·\0ğM§2*´\0Z¶\0ñÀ\0ó¶\0÷	”š\0ù§\0\r*´\0^¶\0ëÀ\0íM§\r»\0çY*´\0^¶\0ëÀ\0íÆ\0§\0·\0ğM§\0ğ»\0ûY*´\04¶\0ñÀ\0í¸\0ÿ·¸\n¶¶¶M§\0Æ»\0ûY*´\04¶\0ñÀ\0í¸\0ÿ·¸\n¶¶¶M§\0œ»\0çY*´\0^¶\0ëÀ\0íÆ\0§\0·\0ğM§\0»\0çY*´\0^¶\0ëÀ\0íÇ\0§\0·\0ğM§\0b*´\0b¶\0ëÀM§\0T*´\0f¶\0ëÀ\0íM§\0F*´\0d¶\0ëÀ\ZM§\08*´\0^¶\0ëÀ\0íM§\0**´\0h¶\0ëÀ\0íM§\0*´\0j¶&À\0âM§\0*´\0F¶\0ñÀM,°\0\0\0\0y\0\0\0Ú\06\0\0º\0¼\0xÀ\0{Á\0~Å\0‡Æ\0ŠÊ\0“Ë\0–Ï\0ŸĞ\0¢Ô\0«Õ\0®Ù\0·Ú\0ºŞ\0Ãß\0Æã\0Ïä\0Òè\0Ûé\0Şí\0çî\0êò\0óó\0ö÷\0øø\0ûüı:=WZ„«®ÈË\Zåèó ö$%)*./ 3+4.899<=GE\0\'\0\0\0\0t\0_1390313933221_651129t\02net.sf.jasperreports.engine.design.JRJavacCompiler','reporteVencimientoMarcasSeniales',NULL);
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

-- Dump completed on 2014-01-21 11:45:40
