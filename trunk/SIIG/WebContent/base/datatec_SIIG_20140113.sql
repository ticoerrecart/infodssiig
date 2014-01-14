CREATE DATABASE  IF NOT EXISTS `x071vm20_siig` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `x071vm20_siig`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: x071vm20_siig
-- ------------------------------------------------------
-- Server version	5.1.50-community

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
INSERT INTO `entidad` VALUES ('RN',1,0,'','20222222222','Gomez 456',0,'gana@gmail.com','Direccion de Ganaderia Ushuaia',0,'0','CUIT',2),('PRD',2,1951,'','','Alameda 456',22569874,'jlcorrea@hotmail.com','José Luis Correas',5559999,'','DNI',3),('PRD',3,1987,'','','Alameda 564',22369258,'rjerez@gmail.com','Ricardo Jerez',789,'02255-456789','DNI',2);
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
INSERT INTO `canonmarcasenial` VALUES (1,100,'Señal'),(2,200,'Marca');
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
INSERT INTO `marca` VALUES (1,'2013-11-30 00:00:00','GIF89a\0\0�\0\0���9q�Z��1i�s������������e^�c\\�me�sl�^Y�zs�[W�}������������wSQ���������������������\0\0\0\0\0\0!�\0\0\0,\0\0\0\0\0\0\0��e��5��<�Ҿn�1�q]UEQR=����d��[nI)*u��/8�p8�k��H\n�����]H� �@\Z�w@�b�~C�hff]\Z�nprx�X^`G��i`G��\r���������!\0;','987',4,2,'logo.gif'),(4,'2013-11-27 00:00:00','����\0JFIF\0\0`\0`\0\0��\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0/\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0Ţ�(\0��2\0�4\0QF(����O4�k�G`�=I�\na㯽X��}?P����E�U�##�����ּfu�&�L����K�0.ƻ�A��q隧i�+\rO@��\0��y�tlNr\\/N��^<�h��[�$w/q�3l,�J��a0�ۭUӼ[�i�c6�Fd1���Hن�A݌��Ph�h�5�ߛ\Z�2)��\0�k0��8�Y�u�����(�c�Y�>���a}��2[k%���&�4`�!���u8�[k��gʇG�Ԝd�={q�@� ���f���6�&�Lm�T�s��=}rh�m���r\\�\\B��yߺ�>�R�Xs�����Yn�ni��ig���x;A==*����+r����a}�8RA8�\0��\0Ψ�X�:\0���*\n����pG\r��Է����O+d��\Z�q\"��Yb�����;sޞ|W~�Q�d��c*ع%����\0A��r��T�M���6F�Tı6��A����\n7�mƝy�K��e��*ʯ��J���V�φ5(����g���HO/pL���1������R[4�G��$j�#��$��pA�\n�/��.}��n����V���Y:�a~�\'�t �K�\Z��j��x�#	��o�w����5�0��i\"��фRdtU�k��9��U�׮��� #�h6�`na����,߉�`t�0���l��F[��(!��}�I˷|sӁ@��5fh�ȍZHD�|�B@��.I��Q�/^��+���t���\\�|���C{qK��#�����ِ��u\\\'k���{�8)�\0	כk+��I=��H�ub�+�\ny�7�8�@�E�Y.DQ���+ ��ce�T݂IVs�\rR�Ӯl!�K�X�d.�]K�T�^�\0үZ���(��K ĪH$gW�2A���8 �k�^��O��DO.7/�,Y؎[�@�y\0�Nx4<~�e�F��)����Qz�q�v��Q.��3�\Z������@7n�����O�/\"iwIR)��I�a�<u�OcN��7�����E\0��\n�:����3��3Ͻ\0G/��kx�G�T\n�(V�7�,B���pp=E0�\Z�gE�7�	<�\"I��xO�8�@ϩ���=�w��)�d�DVR��!�rF8�z��Ś����4�HX�\'�n�$�۝�9 �\0:b�\'�����H�<�O0}�=�dQ�7m$�Veޕyes]Ʊ		\ZE��e9L�*�$V��D�%�[�&�#��s���g�\\�{�x8��z�����s$G|����3�Ē7m|�Q�����;�֎�\0Q���\0�@Q��\0(��\0����.⷏�H�s�;��5��Ai{l�c�&6��Vw�N$m\0�p{�ǚ�s�y��✙��Cd����@4��wI�4Y��\\C�{�7�s�ִ�m����%ܖ�cfM���PH��#�_L��N��Qg��f���S���U�`��^���&�7[I���Akqs��\"|�a��@瓀{c�K��D�\\�*�#:��6�mR[�t���sŊ�a�	:S� \01�}hN�O��^��3��m�2n\0���ڴ�����a��{%{�]ҶK����w �î+�\'��N;�FN��H�4��YAh�,[��_�&W�\0p}�c�mG��Q	Ô��Cg�ta6#�OR��#�{��G\\���P��E��\"�BZ��P����v���q��.��p���N��\"%�JJp{d��\Z��g��@�\\����C.�n�g�op�:�N,����S�\0���4e���n%��#[��6]��0O\0/N�V\n9v���#�Ab��xǶh�m&�KIi7����t%9����:��Z�G�\r�7�β\0\"��F1�s�<b���e�@<ppx��A���_Z\0��U�[�u/��<�h�I㜀zpy4\r+O�L��!0�`8\rӽsĕPs�ӊFʌ�<qր5�FH�Pwf�m���0���	���Y�/��ʓNm�iL�&rY\0S��9략���ǶiÕ�C���\0m�\0f[�a����Sv7l<s��9�`�m#������@��ߟ� ^k\0����緯Jw\0I���hhi�~B���f�n�x�=�j_쨡Ԡ�ZN�-�q���\nʤ�s��9��}F���<z?���Ia���S�E\0t0hо��I�C̒FIL��\0:rs�t�:}���M0���UtU�\"F�8������}N?*����~:zPY>�i5���E*�Qf%ؙ8U#9\'�������p�\ZFXe�U71`0���R��nzc����1�Fx��������4�+O��<�8_l��U[M\n#&�9s9����(�)=zW<0H c=1ړy�ny��\0n�achnC,ʒ�\Z�Ͱ��ă�3�;�͢�	�đ({��l[Y��1��g�w�y��� �?Z2@��\0��@7zT1��u8o-���\'�2�<��g��������¦w�8$2�O\nְ��v�ӯ�J��N޴���@.d����k�²�td���\nu��ayf�8�ݕ��!��H\\d���px�\\�`ÂG�pv��s�s@/��tO�D�X��Ḥv@8;J��?ʱOS�I��`����N)�{����','111',8,2,'footer.jpeg'),(5,'2014-01-10 00:00:00','����\0JFIF\0\0\0\0\0\0��\0�\0\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r		��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0	��\0S\0\0\0\0\0!\"12BbRr�#AQ���aq���3CDScs�T����������	$5d��������\0\0\0\0\0\0\0\0\0\0\0\0\0��\0<\0\n\0\0\0\0\0!\"12ABQRa#3b�������$qr��ᡲ�4��\0\0\0?\0츤V-��8ß��H�DSyR�;ߎ2��g0i�eho>�D���+�\n��\0��5Qb7zo̬�.��NDZ��ngx�{IrdI�IrUF	�a�� ��\0)�4�\Z��m��{��m���:�I�2��$��eZ�Q�*6Æ��j!������N��>��p�o����eٖp%r�����8�\0��l�\Z6�,kEin�^]�(L;��L!Fm�eo5�����8�[Y��\r�\0��q�Q�֭�9b>��)K��E��>�����~���jy��r$��k�%�{\'+p�����`�V��ϡ��]�$X㈈��D�Uab��*���!��\'I0T⧞J ��z�[_����1�rY�uRn��Wh��\0��as0rQ�����8�}#��g��8A�w��7M��Ѭ��[?����߂4��:0�L�nM8��D�~J��^��fʲo9-.�	�\Z��Dz��Rnz|���T,��lS$�Q[�ܢ%�\nsm�ټ�g$ͻ�0n(+���,�%@��I��ӓB�d�)�T�$H�4�!+��wJM\"�b:UN���B�Ż9m��Es�=��ݣ�#�i��t�)�\Z��2�^>J��-	�*zƐk�(�K�Ik�*����_$l�\0�œe��ʋ�\n��+5�(��mtoM�>J�I�jRYV��C��R�]�\'o5�\'���S��2Es@j�P�S�p|P�fa	QQQw*.i\n;߀��f�)���H�>�}ܡ~�е��R`��S_�]\"*u4r ��|���w���+�����K�s@�i[$�F�f)��q]��/2(L<���Ӽ<c�S�K3+S�u��ŕE�YXDA���Y4O+�b4�(�4�j�؃k�f2���.�IW�~��#�e~K���t@�~+I�)	\Z���[hs_{��t6��%Vp��%���D�8�=$D�|�2�Yr\n��N\'4������i�6a\\����McE\'�\n�a�7eI\\\Z�aW�����M6 �~̗NA�~ˢY������I6F�*z���B�_�ZY�\0LZ��	K�t�׏o��n;,�8ѫn&�E�T�k�q���L���:�xO���.��υ�y�s��:����KMr1����!l�*iW��\\?,i�{\nt(�2��2hu���I�3���\\M��/�w-��.��\"e��(�>���Ѫ�mK��GJ�b�D�!Q�rlg��u��<@	���w#SJA�^>�/��N#���<.7�.k���V�s�9c���e�G�EF\\-��7=�N�չ�\'hو��F�F4����)E&�6���g�*�S7��nWS{�o74�:��i�E��Ш򄾆�2,�#�\"!�&D�EH�}��N\\\'$�)� \Z��{BDq���f&��ț\nJ�QWx�K�m[42�^�[��d��_q�4��dzB\'	�qZ�O�\\�&\'���*����	�pC抓T4��o����O�~���X�癑iu\nz��?\0R~�<n��ܤ�6�l�櫫���#wR���afXPq�R- �٩q&��7����3�6��i[���*��.�TD�P�Fo!6�|�����a��ݲ��\"~���≝����Y@���fM3U]��uή�L.e�K:U�dt�\n$U �\\��0���\nf~�$��W\"�U��|\r�8&��ч�Te	�����f=i�O�F�)fn�u{�����k8VZI�7JK/�6]�.s�u��$�IJdM&��D��?�7\n�=<��nZ��X6��㋼6ޣHە�S�d�(�?�5�����:鸫��Ȋw�;�ѷfze�u;A�q�u�T�h��1}�;\nW$J�4ԟ�x�E�k�9��\0_��\\St�D\\��_D���t_(�۪�o݃}�u�6��h*�0�g�J�.�}$TU�D.��~q��Ḫi�� TN�Z�F\\W�ݡ��SY�I�	�����i^)K\nXXW�T�F��K�.FǣTs<\'G#ENy�ˊ�\"��@��j�巤V�ra�ܤ\Zt_�\Z���{���S�.�4≒���5m	\rc�|~�{S�K��]\"V�^ʇ�CZM@�HrTT�Iz}p��[6Ya�{h��ǭ��`�N��e|I�v\'�kJ�e��I�Q9��$^E��\'�t���PD#�յ)d�dg���9D,|(߼?��=�Uo=��XOI�D�	�s!IiܜiR�pҵ�;C�{�z�-�D�S#e��N�pD��%Lr�X�c�>�r5���V�\n��~�������v�Z�[�jQfd�$�%d\0��uhaC&�4HB�*%P�.�,0���-���y%�a�\"\\13�<fu���T%$��e�Wz!�=\\�o���	tT�	�,ZI�i|\Z�%�Vf�~���y\\ˡ��{Q��&cΜ*%��_^#-��mQ���pq�|Ԛf\\�Ux�x�z;PѸW�ϭI�l����\"�p��H�t����\0�3x�h��T�I���t;i�S.γ�l\0�\\���5���,Pę{<6֧�62�#�8�ƌCIQni�Ŗ���sR\Z�<*Z����ٷ��F�9��9{���S3��KCCD��p𷈖�W�ū����e��$|���Ǳ܉%��C���i̵����(�;< �V�D������=�����1��P�xǂ�llĚ8��u��٠��)/�n��/�\"�᭜I�R[/`��|�N�^�������q˃�\'��.\n���5SE���[� z�G%��l�Z�%XDV~ζl���[FTu�9R�)��}�m~S ]K�e�cufZBi�%OR�z:�磎��~Uf<l�������31R^|iF��j$��������\0��\'��	��?A<�֊B8��_74l�?�p\r��\'XZ]L�r�P���i�p�L�O��WC�w�n\r��!�\0J��f�=*U��Q��m�0�D�jf^ÐADCx�4Ng�\"���=1j�,�ܓ����:���\nl��#��ވ�\0�U�)��m�R ohIP��Ϳ�.n�<���0N[���X{�E�#nU�W��94���n.j��(<�\"��\'I�jTWi�N:y[�|$H0�	P�&�WE*)Z*b<���)����I\"�,)��F�4�e��5Rռ�������P6֧W�RLE��,���S�pu�k���޸DX6<���-���fJ��w��{�\0O�^��Ǫb_������^�\0Dt@$��-�i7�.ٯW9S*�h[eO�#�S�$�ޓv6袘M�lJR��=0��U=wG�8����&��a�i\0��ȫ�i�\nPa�z�%9/72yL1�Z>��UYTX��=��Ro�9T�d5nB�?,I������;.LX�θ�ٱ&�]J��pW`�K_t�l��:nnm3M�qM���X��Rz�w�E�Ra�hYj�.h�_�	��kߡ2��?����m�he/RBPI愯����m6����9����7�P��zБ�\ZdQE*Iv�]�ǈ����Jö�,ו�Im�d�����Ka���2�6�Z:�U�+@����\Zzr�c��T���3屬,^�\"՛<mT�KF�t��%p�v�;,��UApA��My׵��\0�����n�-�$��p��BD(w�a�%*6͟g���3�X�1 ���(�m\Z�������d�7-�vʰ0����ړH�k��%�\Z���O�a�j��>�]�6-��(� �\"���8F#�������EJ�n��8�s6}.��D�70�ܭ�`���z��D���VK�O�/�M����f6M�T?�\'s��}0�^�Z�,���ʑt���ÂTQ����������̱^-�����oeՒ�x���l[<y��C��S�kip����\"R*��9\'��IbOשu\'�w�*1����i�&O0����k�K���17��S\"֙n�bX�!���y�J��Tx�UY�S��:�xMT��2�^f�\n�6���f�RQ��f�qT�Q��*�qw�\Z~Ov�VL��H*�y��t��l~!��p�ڴ�Ԓ�B�9oE!�E�҈����V��Y��4��<��;����xy��f��ߋ��BX�{8�ѳ�_����~P�d���,7Q��f\r��B�\'{�\'�6��$��Qq�J��L��qY��Ô���+��G�7)&���9Z�_��A���,�]�*U�Y��)�ً��^c[A&bk�nbn=6�r����*�jhW����ӓ�V��f�L>\\(�*�ty~i�\'�]��B��[�=��oㆥ�l��3T\n�����y΢/�q|jih�)G9�G�_:�YO%�)S�G]sH�+R�h�r\"�qCF4�J�\'��t��t��[T��#+S)K)�O`�cஂ\"2\"غ-�	�x0n8�ĩ�G�&Ir�-�їiz�Ks1RjH���3ՙ�O��A�bC����h(���\r8 �I\np�%�=��I%��:�n�AW8a��7���G,�j����R2ay�+��[���F?F�.�Z�>�ǝ�Q�&a�QQ�xGھ����p�fRe��ytj�!�Y��0�9��V��(RHj���Og�FL�9�&���$Ĳ\0Z3��8��Ifm����R�\n�L��b4٦�f�N9�2��!㍏�T�46��A3Oј���ˍ.	ZK!i��澅��K�{�x�MR��[v�Y�Ȋ�ݘusA\'d<JB�46��Z�R�H�HM�<�+ky���RƤ]����UW^k�(� _�?�1=���F*B2��n��\0u���p�m��X�{>�\\�/_�.��ڋtk��(O_RtT�ڱ��S��>�]Er�-��L�l�/թ �ǵ	���5��k�;T��x�s���o�_jf�\\�ec�Y\n�V<o5׻�䊫��ڐ8�Y&��5x~!%T#�Yu��F=�KNb��r��^��mۙȕ�5��{�\'����*�j�}qn�°6jj0)�-�|�\'=�������d��\rj��^դ����Ö,�o��A�#��:ƚS�k�CC���Jd�J�&���®�U��>�UyB�93)f��)(91�%C�Wp*2�G��s�;�e�T���DE�uM\\e%I!oYv������X2kf�l\'8K��\"��c_����ߜ�iSE$2�;������ă�lA�ə��#yRS!Q�j�gh8>ިo��6�Gf�,�.&�\Z���yF��yU�$�iGi���r��1��10ZY�6�֥\\���O�k��f���J(ꎢ/I2Wd}��#X�����e�@H���n���\Z*��r4e���t�(��Z�.��aPSR\n\n\"}hEћN��AH�Eb�!.1Fɑ�6ڙ�tKB�l����8G_�%���ƕ^i7:�ZQ����oyA\\�f�eYD#d�TUrRB���M�LF��-�J�+��:K�#Y���W�����U��i�Lo&��2���F۬IGm6������1|�d����OBO�n.y~sB?&�݉~[rsn��-覐^��E�.�$Dq��I����H�-�����FDa�&Hi��c&y	���j�)�%c�o����!���=�3W\r��tH�� �CW�ˠ�8ꛇzRn�i�����=B���V!A�mδ�S��4 M�n�H��l�7h#k�7l��&\Z,���5oVyJ�0�v}\\z��O�E�<��:���ռB��5�����R<E��3��^F��Na��5��g�m��I0LRq�\\0\Z��3�\'6u�\'֟���\"*��XC�yS٭��C�4����^�# �Ğ_ʶ�D�|z|ܳ����9������SJy�.��ϲ�5���u�ܹ&k���~���!��u�Ʌ�E��f_r��Ĺ��M<�g���6���\n��Qñ��/����\\W�9�#Rө}��$A�7*oωc�.w���+�$֘2�hE���=��F���sRMH���ɇI��]��|�f&��^��\0r�ng�.��/�G3�֩	/ʾ�>6��_^`ۢ����_�N�_�Ls�K=#ñ\nV�G �[�G\0��\'�x�VE��,�\\�ּ��\"�G#��\"~КuƔğ\"G�Qr\0!�k��P�r[7�^ې6�]\'�f���8� �T�rS_�7x�~��VYfHQ�Y����MG��xx�� 7y��Ko���	�I7u����-�����\r�h�hT�<ղ|I}�/z&>R��IVՃћ�hԑ�F\\5p���7��vJL�Y��}��i�%h���}�e��(�\r�6ޘ[s6���ܤ�xb�8u�ec6od���g9Hz3����3�,4��OHU �s�}ڶ�(xa�Գd�A��&\'�S#]�lDx�\r�w��=}q~rqQ�Yh��i���N�N���l��g���\rm��*�E����|#��\Z�M�x]�,��o�b(�-��k��X�)���\" ��Eb���\ry� q�\ZqW%��K�%���L\n7h�.��S�z��-mY��FۉP�C��kÂ�蓒�+���Z\\\"�)t�\Z,\ZZW��OK�}i6!���䧸;u%�qǥҰ�t�y��U~�\r��w]~�L%�}@^d���Z�s��~2�6Y�KU��m\\AD�,ƒ!.��x�bY�f�����J䨀��n��K��q�������jy�ֳ�U���6wxfI,F�_#if)i�K\"}Bn �l��võK���1bH�\n2�>B��H\"b\'Q��[ak6rJۓTT%�?L��\0��P��[�r�nX	N�y㪇ۖ\\��B%S�GfQ��&f-8�+!��2H�\0	u?�f�9jb[���iAOKj���\'ʣ�3%�E;$⯊����A�T��̽�nY��C\Z��L�ڴ>�^�?��v,��b$wmEa�~Mr.&͢��*�/�q��\0Dy鎮i�фN���_���s6���}�U§�/�\"x����=R0|��_�^������]���2��g�+������z$���V|Bu��\0����w~�?im/&�6�]���W@�=)oL����M_�)/��p��ߚ׳i\"����4rP��IT��R���&�\0^��\0g��\"��Ǖ��\0�H}׎�˳:���5`�����޵��OY��U1�3�ںc�(Z!g�o�!(#d�N��.��k��4w�:/��2SS�h�$\'(�����\r1�����%��T�ܣc�q�8\\j����b�6ĕ�%����yf����e��:����k3-�]\r=)�y$+$}��f�i2JS!>���R�}h\\�66C��l���4ל>��̚�k����#Ir�@<�$]������t�a.�	�C��U�1j�ى�yf�� f�\0L��E��4��;<��Y}Ҏ��9����\"6n�����Y�ْ⊩�M<��\'i9�g����je��ni�\'M�Ѝw�)����N�@��P���ʴ�Dc_����GF��yf�\\ieR���j��{q��f�vqo�/���xL�\\�o%#���X�\'�� B\"�E`��c�1�Y�@ݗ3k�H�����۠�Qձ�weE��Bd�H�4.ϖ��aumO5�s3�U+\")G�I��p%Ѥ�\"����\"�$<��Wܢ$��|�Rі7�9�Bi�ʡP*�I�Ɗ�`��:iE�-�l�4T�>oF�F�t�yRt_�_�w�^���e�5�\'�\0S>ڛG�\n��&�1��՟�̷���T���*��Y�s��p{]��Z����3,\"�Z\r�X}KB�$%_n�J���=e�S��S�[�\ZPVH�TK���H@�4o\',D�ӳV}�˳-�J봻���[;�\\db�fl��:�Z�k�0yD�]-&�\0�ĳ�&|w�؅��\'���q)���hx��	��Y*���DzߺH�>q6Ҹ��30�PE�C�\Z�0�e�2VL�����Ql�	I7�#�iM\\�,g[�ԕj\Z-���i����~8��v̞��4-��L��ˬ+���5�ۃ�袣����]�kUQ�;U�-�S\0�t��e�ڪ�\r���&f��+RЙ\\����\nl ���i^�1u�.$�����\"A������OY�?�Ʀ��F�\'Xq�v\\s�f;7�\r�bo�+z&��>�fe�Y+̜�m�!=���q�zk]U�0��z)�晳�AF�IV�mH\\x�� ĳ�^\08�ڷE�@�α\ZG�eǥ�W�O���G|�l2��׭6�Zbe��ޘFY�H\\\r�^���j��,�Q��	◙;�$��q*���lh� mGǝ��Y���KtOC	&�Ͱ�r�\'��i�\"���yY�8���\0��o�͙yL�`750�+�\Z�	�R\r.Q�vxG٩3_QuD�\0q��՘˳�+.m��� �l��ï�2���7�MDFft��\Z��?<^}k=�a�lʅP�&�е�!��zfz�u�f���� �oe��8�M���W��.Mړ�h*�q:ԗ�;\r�}��<�4��ї��PEA\03J-!�is����a5�	�I�`Pd�4L��\"�N\rG��@{�D{��E�[�hЕ��$3���ok�\ZU�{*Йl��!f\\A�TF�!�7*�_s�#!�ϸ�4�D���\"���}��mj5���v�\\*�\ZnV꡷��R�`_p�D=#��J�T�\0����\"\"\"&�L�\"�3J���\"6҈�;&]�2�s��PC:�k6�n�Vn�}�WU�!b�� �\" �\n���V L0�G�\\���_nb�c��ݗ$,Mg\\m>��2@&C��9��p;T�2�|Hf�e��н2C��-:��^���!ܦg���ȓX8<`�?�9���<웈ঔ!!u�!Q����-!Y�dI�TQL�C�����)I�lٝ��$iUw8<C�\'�>�:�J�7=*m%J$�Z���(K߻��VM��d�}��h6��K�%�\'8;��2��I�Ⱦ���xyK���o�cx%^�<^\r�Q�����I�+R�,�&Dl�_�����F��[\Z�,��\\%�y�*D|}�8�T��z2L��s�9s�z�y�F�Ze�!qQu�`�b��R0�*��Yy�M	=Uˮ����E�\Z�oF����R��k�l�2N��ˠr�x�V�\0f\nJA�!����x���n�&��[�;�-�!��k�X��\0Z�z(fM�T�����Ui930�/��HE��P��\0������%J�i�C�Б���y�w�ݮīM��$�����\0l}؊a��~̵���e�f�Yw\Z1Mk���z4�}���>Q��\r�ȃ�֥�&�_��^��x����f��+�����#�|��u\\�ti2દ�1\Z?�\\����|�r�1h�Y媐�U�J<��S3Pw;\"��E0b��2j	�t�я�L*��S�M��Z)\'YyQ5fB��*g��YF����Q8�IuE�6t�(�\0�g��6\\��eA�DSAu̶�s��>R����\Z�e��S-+��!�q������	��\"�G	hW�hS�k���x�e�K2U�Fm��ri��he�=N�e�#�ؚ��SB�B�_7�~��Է7��\0�c�ԋ�}��	We�2��.�̏c�	�m��Z`[##We�RDy�����X8U?>�>���#\'_�Y�dx������=fA�Cm�����K���6�Z<:G�\"���˦�-��@��m��Jfe��JR-�.����]�`�*��t� �\" �� B�(�b��1.Ɲ�4K��q7�Cͱ��x�u��E֋F�+��Awk2M\\�e�\"Z��r��S6ȿ��3�6���v�i�Q�M3G٤������<^�\"\'��)TE/���[���W�r�uGin]�*=�R�}.K]x{��.1U��v�ݿ�m�ŭb��$�K������Ƹ�\Z�ye-�if�V\'Yj`y��.�����l����1GOa�%KO�B�e�0�uh?���������(��+��)�n���d桞��?s��65C��Z����o<�e��S�xZ��Ei���u[�l\n���(˶���6�	�ɩ�����b]����9�r\'�J�8�\0D��M���Rs.���`�,�Ha�&�h�k`��(�؊�󴥤Z��!y�&� R*�	��6����X*\ZO��T��è+��żz���q�I��\06��e�@��ҦZ3\"�>�B��%�ė��Ir�9]��E�h��Eo��â9���G���aZ��  �DfWG�S��ިɲqfy���Q�9��q�\Zh֑�4���H��Jr�����u��Wڑ)![C�fX�&P,��e\n�%a����\nN%��R�/H�0�^p��lI���P�m�\'SFTp	Q�u7i�M��M��SITN:C�|E�X��4�ٴ�g�K����	<BTW�:Gq!r��D2���3��N���@ng�L�RE�\Zj�7za��ȿ0�Nd;n\0l�Ǣ��K�l[Sꬲ���&Zˡ�2�����\\$��DQq�֯�����{b>\'�H\"�*8�Y�\0�]����G=Qe-}�0,j��c�˙i���,�W�QǄsWݥ�Gw�$�rh|��]��E�>�m�p���v�qiEWb]�*<C��V`B��әj�2鵚��/��F�,&��<��e��Ū������\0)��������m9��@yhD[e_,1��v�DDDD�7$d�9M��̬�.�gU� �h� B �� �\" ��e�+)�\r�r�C����B!�N�q�H\"�G�7��\\�lmgH�_\0\Z�\nY�$\\�n��	�}q6���73���/�T8���:j�\"x1�w�B�� \r9�����(�-t�\r�{���g/���(ߔ%�	�\n�G���d��JG2�1��u��Oʺ��l ����nT�R]ҌTŢ�l�,��x�M���4�q\"T%�tD�lq�l�\r�E�{l�W{��=�c� ��l����a%Gم�C��ٻs.9*�O!�(�=,JbT�5@|Q�d]�۠�R�<�-��LL\rDT�:f(,f�)��sU)�\"UӕU��8���:ɧE�EOX�U1�.��g&?\n�%�!\'G���2�r򌈲��j@Ј���\nE(���y>�4���EJ����)��{�Hxb3��q-�_�T\'�C!�UC�\Z.�l�+\Z�4���h%���w�#m�Ir��+����|�!�>S�ͽ��M�gN��0�r���ujraG�x�\\B�\'�d*�qكU̳*��\\����}��@�b�����o� @\"�\"R��*�@m�e&�k�F�i.��bXie�i=tD���/�7yEb����B,-fT�+�t� �\" �� B�U�\0l_�@�H���+��=�L@�g����b�@�U�T�Q~pA������Dݹ2��\"�L�]^�R�8��w~*�`}���j��#�}I>gU��^��\"䈉��Q�3\"��	/�(���X�ݸ,��M�e���_��� �qu�mPA!Z��[�� �\n�X	b�@�jW�\0��!V ���','798/89',9,3,'logo.jpg');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denuncia_tipodedenuncia`
--

DROP TABLE IF EXISTS `denuncia_tipodedenuncia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denuncia_tipodedenuncia` (
  `id` bigint(20) NOT NULL,
  `tipo_denuncia_fk` bigint(20) NOT NULL,
  KEY `FK53704F745AF90344` (`id`),
  KEY `FK53704F7452E96A42` (`tipo_denuncia_fk`),
  CONSTRAINT `FK53704F7452E96A42` FOREIGN KEY (`tipo_denuncia_fk`) REFERENCES `tipodedenuncia` (`id`),
  CONSTRAINT `FK53704F745AF90344` FOREIGN KEY (`id`) REFERENCES `denuncia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncia_tipodedenuncia`
--

LOCK TABLES `denuncia_tipodedenuncia` WRITE;
/*!40000 ALTER TABLE `denuncia_tipodedenuncia` DISABLE KEYS */;
/*!40000 ALTER TABLE `denuncia_tipodedenuncia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodedenuncia`
--

DROP TABLE IF EXISTS `tipodedenuncia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodedenuncia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodedenuncia`
--

LOCK TABLES `tipodedenuncia` WRITE;
/*!40000 ALTER TABLE `tipodedenuncia` DISABLE KEYS */;
INSERT INTO `tipodedenuncia` VALUES (1,'Presencia anormal de pájaros'),(2,'Huellas de perros'),(3,'Ladridos de perros'),(4,'Guanacos heridos'),(5,'Guanacos muertos');
/*!40000 ALTER TABLE `tipodedenuncia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denunciahacienda`
--

DROP TABLE IF EXISTS `denunciahacienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denunciahacienda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `dañosMuerte` varchar(255) DEFAULT NULL,
  `especie` varchar(255) DEFAULT NULL,
  `denuncia_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA1CA295A7E6C07D8` (`denuncia_fk`),
  CONSTRAINT `FKA1CA295A7E6C07D8` FOREIGN KEY (`denuncia_fk`) REFERENCES `denuncia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denunciahacienda`
--

LOCK TABLES `denunciahacienda` WRITE;
/*!40000 ALTER TABLE `denunciahacienda` DISABLE KEYS */;
/*!40000 ALTER TABLE `denunciahacienda` ENABLE KEYS */;
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
INSERT INTO `senial` VALUES (1,'2013-11-30 00:00:00','����\0JFIF\0\0`\0`\0\0��\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0B\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��(��\n(��\n(�&G�\0�����ڥ��Xس��\0r��o����M&ݑ2���e�Z�w��Y�g���N��E�¨�C��~�h�9���\0���ջM2��*���c,�S��4���朾o_�+�\0j�N1k��ó�0�O��~�C�O�����BX�lq�VȉGl�����~��\0��s��I��U�c�Q�����u}|���b�SUd�d�=7��Y�ͦx��o����?��c���l<o-�����.q�~�wG��F��lm�K�PA8���i*u�V���Bxh:��������;ȥI�20 �\"��S�2ϡA�HA>��WS��I8�;�T���>��袊�@��(\0��L�\0�_��=�|)>�g�\\,3̯$��W�Az���U���v�����j�&�H��J�0 �;g�?����\0n-!%�M�x���\0�1��6��ß<�PC�N�7p���$UF.RQ[�g8�.r�K�Zԍv4�3k^�YO+����\n���QZ#Hs$��3��}ϧ�J�l��O���A)��{�1��T���+ʴߋ^8s=�wm{s4{al���|�*���x�*��Ǧ�ft�EU��o%�g��W�N��\rZ��/\ZO%��L��(��\n���uxeo57F��]r��`t⼟�ڦ��|���d�Kê�e��,����cƱxVKo\r�4V�;�5������&�:O�r\r.k��|Jյ]Y�]j��%�/̠6GU8���~*�:.�t-�+���J!��U#��hڷZZ�j���<;,z���$�2��HU������{O�>#i�-�[�Xfu\"HT���i�.N�Wd�q�y���YR4/#U,N\0�+��/�u���ma$�=Z���uO�[#[i�����������J�\n���\"z�]�K\n����.ާ�Q�\Z�#�:��K���4����%\\�;R\0\0��W���=H�EYQH���(\0���1�YOs#m�$.���*�\\/ŝW�+�֨��d�An���B��ww�@9��ͷ�\'Q�z�0�̛ܽWq�r��\0�m�$��� ǫ�;i�T�ț|m�Ai����񮤞(`*�a*	c���V��_��С�l纔�r	�H\0��\0w�)��jk�i���N[5c�o_k:t��r�N#`zeJ��G�-��\0�ۂG?xU�Z���0�%vo�i��2,6�G�X_\r,\'�u˘��c�|��CҺkN�z�Q�o��Ç�_FQ��o��Q��\0�?��?�`��\0�rS�x,�_�n�\0ι��N��xn��L���U_1����#ڛ���6��_�g}�\0h�B2%�A���5�V��\\�RU!�8��=���?�Q�ˏA��½{�Zǂ|52��:]�ޱ ,in�)�Ff#��\\��\Z��^��+���cy]�����u��k�����cya�P>dg��7�1�\n�r׍<_�x�N�k�),���0��%�������G��5_%��8O{��-��z?�4�7G�C��+.�)Tu�^��3�D�\'���\0Ҫ%x�T�\Z��WG��i�� T@\0�\0�W���Z*J�EP0��(\0��(J��soas�͗�x�>j�������I�`q]gj��,���\\��q�<SI7���WG���+�<3��tF��\ZhT�e��`���\'�]S�v> �~˨hM%���M�F�`7�}�i�/,wh�D2��]�0]���Oj�t�Xnf�P�06�\0��g���\0aW��������_�q��@��;]\r`�R\r�0۷c�F~`@##�^�Q���u)�,<>���� -�/�n~V����i&��lC�bP9f�v�Fj}CL�f�=��F�� �ry<��������~W����\"��[�_�D�Jd!��6� �Fk��z���y�6���\0���쏙���^�}��wv��� Ml��`�;b�t�i�/*����\0.w�קg�=����o�g�Sþ�#O�>��HT��1l	>m����=�T�A/�|E��.��$�Gr`�ی3($�2�\\��]����mꓴ$9���===�I��R[{p.�Yb%��?9��`c�Z=�������5�?�X�d<9n�PL�X3Jv\0\n����\'�/ֽ+�vv\Z|�Zi�\0`���\r���A��E�e�p�8*:q����zV���o$Y%�%���($��eB����F�QY��Q@Q@Q@!��\0CER(4QLQE\0R�E ���`>�(��(��(���','123',2,3,'Arba.jpeg');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmenu`
--

LOCK TABLES `itemmenu` WRITE;
/*!40000 ALTER TABLE `itemmenu` DISABLE KEYS */;
INSERT INTO `itemmenu` VALUES (1,'Salir',7,NULL,NULL),(2,'Salir de la Aplicación',NULL,'/login.do?metodo=logout',1),(3,'Usuarios',5,NULL,NULL),(4,'Alta de Usuario',NULL,'/usuario.do?metodo=cargarAltaUsuario',3),(5,'Modificaciónn de Usuario',NULL,'/cargarUsuariosAModificar.do?metodo=cargarUsuariosAModificar',3),(6,'Datos del Sistema',4,NULL,NULL),(7,'Localidad',NULL,NULL,6),(8,'Alta de Localidad',NULL,'/localidad.do?metodo=cargarAltaLocalidad',7),(9,'Modificación de Localidad',NULL,'/localidad.do?metodo=cargarModificacionLocalidad',7),(10,'Período',NULL,NULL,6),(11,'Alta de Período',NULL,'/jsp.do?page=.altaPeriodo&metodo=altaPeriodo',10),(12,'Modificación de Período',NULL,'/cargarPeriodosAModificar.do?metodo=cargarPeriodosAModificar',10),(13,'Entidad',NULL,NULL,6),(14,'Alta de Entidad',NULL,'/entidad.do?metodo=cargarAltaEntidad',13),(15,'Modificación de Entidad',NULL,'/cargarEntidadesAModificar.do?metodo=cargarEntidadesAModificar',13),(16,'Alta de Provincia',NULL,'/jsp.do?page=.altaProvincia&metodo=altaProvincia',7),(17,'Modificación de Provincia',NULL,'/provincia.do?metodo=cargarProvinciasAModificar',7),(18,'Marca/Señal',NULL,NULL,6),(19,'Alta/Renovación de Marca y Señal',NULL,'/marcaSenial.do?metodo=cargarAltaRenovacionMarcaSenial',18),(20,'Pago Boletas de Deposito Marca/Señal',NULL,'/marcaSenial.do?metodo=cargarPagoBoletasMarcaSenial',18),(21,'Modificación Canon',NULL,'/canonMarcaSenial.do?metodo=cargarCanonMarcaSenial',18),(22,'Guías',1,NULL,NULL),(23,'Alta de Legalización de Guía',NULL,'/guia.do?metodo=cargarAltaLegalizacionGuia',22),(24,'Autorizaciones',6,NULL,NULL),(25,'Alta de Autorizacion',NULL,'/autorizacion.do?metodo=cargarAltaAutorizacion',24),(26,'Modificacion de Autorizacion',NULL,'/cargarAutorizacionesAModificar.do?metodo=cargarAutorizacionesAModificar',24),(27,'Autorizado',NULL,NULL,6),(28,'Alta de Autorizado',NULL,'/jsp.do?page=.altaAutorizado&metodo=altaAutorizado',27),(29,'Modificacion de Autorizado',NULL,'/cargarAutorizadosAModificar.do?metodo=cargarAutorizadosAModificar',27),(30,'Tipo de Animal',NULL,NULL,6),(31,'Alta de Tipo de Animal',NULL,'/tipoAnimal.do?metodo=cargarAltaTipoAnimal',30),(32,'Modificacion de Tipo de Animal',NULL,'/cargarTipoAnimalesAModificar.do?metodo=cargarTipoAnimalesAModificar',30),(33,'Consultas',2,NULL,NULL),(34,'Consulta de Guías Legalizadas',NULL,'/guia.do?metodo=cargarConsultaLegalizacionGuia',33),(35,'Denuncias',3,NULL,NULL),(36,'Alta de Denuncias',NULL,'/denuncia.do?metodo=initAltaDenuncia',35);
/*!40000 ALTER TABLE `itemmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denuncia`
--

DROP TABLE IF EXISTS `denuncia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denuncia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `desde` datetime NOT NULL,
  `hasta` datetime NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `numeroDeDenuncia` int(11) NOT NULL,
  `numeroDeLlamado` int(11) NOT NULL,
  `productor_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38FE9FB57C9761E7` (`productor_fk`),
  CONSTRAINT `FK38FE9FB57C9761E7` FOREIGN KEY (`productor_fk`) REFERENCES `entidad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncia`
--

LOCK TABLES `denuncia` WRITE;
/*!40000 ALTER TABLE `denuncia` DISABLE KEYS */;
/*!40000 ALTER TABLE `denuncia` ENABLE KEYS */;
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
-- Table structure for table `denunciaperros`
--

DROP TABLE IF EXISTS `denunciaperros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `denunciaperros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `capturaAvistaje` varchar(255) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `ibaHacia` varchar(255) DEFAULT NULL,
  `sexo` varchar(255) DEFAULT NULL,
  `señas` varchar(255) DEFAULT NULL,
  `tamaño` varchar(255) DEFAULT NULL,
  `veniaDe` varchar(255) DEFAULT NULL,
  `denuncia_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF65BC7AE7E6C07D8` (`denuncia_fk`),
  CONSTRAINT `FKF65BC7AE7E6C07D8` FOREIGN KEY (`denuncia_fk`) REFERENCES `denuncia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denunciaperros`
--

LOCK TABLES `denunciaperros` WRITE;
/*!40000 ALTER TABLE `denunciaperros` DISABLE KEYS */;
/*!40000 ALTER TABLE `denunciaperros` ENABLE KEYS */;
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
INSERT INTO `rol_item` VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36);
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
INSERT INTO `tipoautorizacion` VALUES (1,'Solicitud y gestión de Guías de Campaña'),(2,'Solicitud de Renovación de Títulos'),(3,'Otra Solicitud');
/*!40000 ALTER TABLE `tipoautorizacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-14 14:47:17
