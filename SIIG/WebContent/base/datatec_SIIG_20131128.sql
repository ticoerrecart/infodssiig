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
INSERT INTO `entidad` VALUES ('RN',1,0,'','20222222222','Gomez 456',0,'gana@gmail.com','Direccion de Ganaderia Ushuaia',0,'0','CUIT',2),('PRD',2,1951,'','','Alameda 456',22569874,'jlcorrea@hotmail.com','José Luis Correas',5559999,'','DNI',3),('PRD',3,1987,'','','Alameda 564',22369258,'rjerez@gmail.com','Ricardo Jerez',789,'02255-456789','DNI',2);
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
INSERT INTO `marca` VALUES (1,'2013-11-30 00:00:00','GIF89a\0\0�\0\0���9q�Z��1i�s������������e^�c\\�me�sl�^Y�zs�[W�}������������wSQ���������������������\0\0\0\0\0\0!�\0\0\0,\0\0\0\0\0\0\0��e��5��<�Ҿn�1�q]UEQR=����d��[nI)*u��/8�p8�k��H\n�����]H� �@\Z�w@�b�~C�hff]\Z�nprx�X^`G��i`G��\r���������!\0;','987',4,2),(4,'2013-11-27 00:00:00','����\0JFIF\0\0`\0`\0\0��\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0/\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0Ţ�(\0��2\0�4\0QF(����O4�k�G`�=I�\na㯽X��}?P����E�U�##�����ּfu�&�L����K�0.ƻ�A��q隧i�+\rO@��\0��y�tlNr\\/N��^<�h��[�$w/q�3l,�J��a0�ۭUӼ[�i�c6�Fd1���Hن�A݌��Ph�h�5��ߛ\Z�2)��\0�k0��8�Y�u�����(�c�Y�>���a}��2[k%���&�4`�!���u8�[k��gʇG�Ԝd�={q�@� ���f���6�&�Lm�T�s��=}rh�m���r\\�\\B��yߺ�>�R�Xs�����Yn�ni��ig���x;A==*����+r����a}�8RA8�\0��\0Ψ�X�:\0���*\n����pG\r��Է����O+d��\Z�q\"��Yb�����;sޞ|W~�Q�d��c*ع%����\0A��r���T�M���6F�Tı6��A����\n7�mƝy�K��e��*ʯ��J���V�φ5(����g���HO/pL���1������R[4�G��$j�#��$��pA�\n�/��.}��n����V���Y:�a~�\'�t �K�\Z��j��x�#	��o�w����5�0��i\"��фRdtU�k��9��U�׮��� #�h6�`na����,߉�`t�0����l��F[��(!��}�I˷|sӁ@��5fh�ȍZHD�|�B@��.I��Q�/^��+���t���\\�|���C{qK��#�����ِ��u\\\'k���{�8)�\0	כk+��I=��H�ub�+�\ny�7�8�@�E�Y.DQ���+ ��ce�T݂IVs�\rR�Ӯl!�K�X�d.�]K�T�^�\0үZ����(��K ĪH$gW�2A���8 �k�^��O��DO.7/�,Y؎[�@�y\0�Nx4<~�e�F��)����Qz�q�v��Q.��3�\Z������@7n�����O�/\"iwIR)��I�a�<u�OcN��7�����E\0��\n��:����3��3Ͻ\0G/��kx�G�T\n�(V�7�,B����pp=E0�\Z�gE�7�	<�\"I��xO�8�@ϩ���=�w��)�d�DVR��!�rF8�z��Ś����4�HX�\'��n�$�۝�9 �\0:b�\'�����H�<�O0}�=�dQ�7m$�Veޕyes]Ʊ		\ZE��e9L�*�$V��D�%�[�&�#��s���g�\\�{�x8��z�����s$G|�����3�Ē7m|�Q�����;�֎�\0Q���\0�@Q��\0(��\0����.⷏�H�s�;��5��Ai{l�c�&6��Vw�N$m\0�p{�ǚ�s�y��✙��Cd����@4��wI�4Y��\\C�{�7�s�ִ�m����%ܖ�cfM���PH��#�_L��N��Qg��f���S���U�`��^���&�7[I���Akqs��\"|�a��@瓀{c�K��D�\\�*�#:��6�mR[�t���sŊ�a�	:S� \01�}hN�O��^��3��m�2n\0����ڴ�����a��{%{�]ҶK����w �î+�\'��N;�FN��H�4��YAh�,[��_�&W�\0p}�c�mG��Q	Ô��Cg�ta6#�OR��#�{��G\\���P��E��\"�BZ��P����v���q��.��p���N��\"%�JJp{d��\Z��g��@��\\����C.�n�g�op�:�N,����S�\0���4e���n%��#[��6]��0O\0/N�V\n9v���#�Ab��xǶh�m&�KIi7����t%9����:��Z�G�\r�7�β\0\"��F1�s�<b���e�@<ppx��A���_Z\0��U�[�u/��<�h�I㜀zpy4\r+O�L��!0�`8\rӽsĕPs�ӊFʌ�<qր5�FH�Pwf�m���0���	���Y�/��ʓNm�iL�&rY\0S��9략���ǶiÕ�C���\0m�\0f[����a����Sv7l<s��9�`�m#������@��ߟ� ^k\0����緯Jw\0I���hhi�~B���f�n�x�=�j_쨡Ԡ�ZN�-�q���\nʤ�s��9��}F���<z?���Ia���S�E\0t0hо��I�C̒FIL��\0:rs�t�:}���M0���UtU�\"F�8������}N?*����~:zPY>�i5���E*�Qf%ؙ8U#9\'��������p�\ZFXe�U71`0���R��nzc����1�Fx��������4�+O��<�8_l��U[M\n#&�9s9����(�)=zW<0H c=1ړy�ny��\0n�achnC,ʒ�\Z�Ͱ��ă�3�;�͢�	�đ({��l[Y��1��g�w�y��� �?Z2@��\0��@7zT1��u8o-���\'�2�<��g��������¦w�8$2�O\nְ��v�ӯ�J��N޴���@.d����k�²�td���\nu��ayf�8�ݕ��!��H\\d���px�\\�`ÂG�pv��s�s@/��tO�D�X��Ḥv@8;J��?ʱOS�I��`����N)�{����','111',8,2);
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
INSERT INTO `senial` VALUES (1,'2013-11-30 00:00:00','����\0JFIF\0\0`\0`\0\0��\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0B\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��(��\n(��\n(�&G�\0�����ڥ��Xس��\0r��o����M&ݑ2���e��Z�w��Y�g���N��E�¨�C��~�h�9���\0���ջM2��*���c,�S��4����朾o_�+�\0j�N1k��ó�0�O��~�C�O�����BX�lq�VȉGl�����~��\0��s��I��U�c�Q�����u}|���b�SUd�d�=7��Y�ͦx��o����?��c���l<o-�����.q�~�wG��F��lm�K�PA8���i*u�V���Bxh:��������;ȥI�20 �\"��S�2ϡA�HA>��WS��I8�;�T���>��袊�@��(\0��L�\0�_��=�|)>�g�\\,3̯$��W�Az���U���v������j�&�H��J�0 �;g�?����\0n-!%�M�x���\0�1��6��ß<�PC�N�7p���$UF.RQ[�g8�.r�K�Zԍv4�3k^�YO+����\n���QZ#Hs$��3��}ϧ�J�l��O���A)��{�1��T���+ʴߋ^8s=�wm{s4{al���|�*���x�*��Ǧ�ft�EU��o%�g��W�N��\rZ��/\ZO%��L��(��\n���uxeo57F��]r��`t⼟�ڦ��|���d�Kê�e��,����cƱxVKo\r�4V�;�5������&�:O�r\r.k��|Jյ]Y�]j��%�/̠6GU8���~*�:.�t-�+���J!��U#��hڷZZ�j���<;,z���$�2��HU������{O�>#i���-�[�Xfu\"HT���i�.N�Wd�q�y���YR4/#U,N\0�+��/�u���ma$�=Z���uO�[#[i������������J�\n���\"z�]�K\n����.ާ�Q�\Z�#�:��K���4����%\\�;R\0\0��W���=H�EYQH���(\0���1�YOs#m�$.���*�\\/ŝW�+�֨��d�An���B��ww�@9��ͷ�\'Q�z�0�̛ܽWq�r��\0�m�$��� ǫ�;i�T�ț|m�Ai����񮤞(`*�a*	c���V��_��С�l纔�r	�H\0��\0w�)��jk�i���N[5c�o_k:t��r�N#`zeJ��G�-��\0�ۂG?xU�Z���0�%vo�i��2,6�G�X_\r,\'�u˘��c�|��CҺkN�z�Q�o��Ç�_FQ��o��Q��\0�?��?�`��\0�rS�x,�_�n�\0ι��N��xn��L���U_1����#ڛ���6��_�g}�\0h�B2%�A���5�V��\\�RU!�8��=���?�Q�ˏA��½{�Zǂ|52��:]�ޱ ,in�)�Ff#��\\��\Z��^��+���cy]�����u��k�����cya�P>dg��7�1�\n�r׍<_�x�N�k�),���0��%��������G��5_%��8O{��-��z?�4�7G�C���+.�)Tu�^��3�D�\'���\0Ҫ%x�T�\Z��WG��i�� T@\0�\0�W���Z*J�EP0��(\0��(J��soas�͗�x�>j�������I�`q]gj��,���\\��q�<SI7���WG���+�<3��tF��\ZhT�e��`���\'�]S�v> �~˨hM%���M�F��`7�}�i�/,wh�D2��]�0]���Oj�t�Xnf�P�06�\0��g���\0aW��������_�q��@��;]\r`�R\r�0۷c�F~`@##�^�Q���u)�,<>���� -�/�n~V����i&��lC�bP9f�v�Fj}CL�f�=��F�� �ry<����������~W����\"��[�_�D�Jd!��6� �Fk��z���y�6���\0���쏙���^�}��wv��� Ml��`�;b�t�i�/*����\0.w�קg�=����o�g�Sþ�#O�>��HT��1l	>m����=�T�A/�|E��.��$�Gr`�ی3($�2�\\��]����mꓴ$9���===�I��R[{p.�Yb%��?9��`c�Z=�������5�?�X�d<9n�PL�X3Jv\0\n����\'�/ֽ+�vv\Z|�Zi�\0`���\r���A��E�����e�p�8*:q����zV���o$Y%�%���($��eB����F�QY��Q@Q@Q@!��\0CER(4QLQE\0R�E ���`>�(��(��(���','123',2,3);
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
INSERT INTO `itemmenu` VALUES (1,'Salir',3,NULL,NULL),(2,'Salir de la Aplicación',NULL,'/login.do?metodo=logout',1),(3,'Usuarios',2,NULL,NULL),(4,'Alta de Usuario',NULL,'/usuario.do?metodo=cargarAltaUsuario',3),(5,'Modificaciónn de Usuario',NULL,'/cargarUsuariosAModificar.do?metodo=cargarUsuariosAModificar',3),(6,'Datos del Sistema',1,NULL,NULL),(7,'Localidad',NULL,NULL,6),(8,'Alta de Localidad',NULL,'/localidad.do?metodo=cargarAltaLocalidad',7),(9,'Modificación de Localidad',NULL,'/localidad.do?metodo=cargarModificacionLocalidad',7),(10,'Período',NULL,NULL,6),(11,'Alta de Período',NULL,'/jsp.do?page=.altaPeriodo&metodo=altaPeriodo',10),(12,'Modificación de Período',NULL,'/cargarPeriodosAModificar.do?metodo=cargarPeriodosAModificar',10),(13,'Entidad',NULL,NULL,6),(14,'Alta de Entidad',NULL,'/entidad.do?metodo=cargarAltaEntidad',13),(15,'Modificación de Entidad',NULL,'/cargarEntidadesAModificar.do?metodo=cargarEntidadesAModificar',13),(16,'Alta de Provincia',NULL,'/jsp.do?page=.altaProvincia&metodo=altaProvincia',7),(17,'Modificación de Provincia',NULL,'/provincia.do?metodo=cargarProvinciasAModificar',7),(18,'Marca/Señal',NULL,NULL,6),(19,'Alta/Renovación de Marca y Señal',NULL,'/marcaSenial.do?metodo=cargarAltaRenovacionMarcaSenial',18),(20,'Pago Boletas de Deposito Marca/Señal',NULL,'/marcaSenial.do?metodo=cargarPagoBoletasMarcaSenial',18),(21,'Modificación Canon',NULL,'/canonMarcaSenial.do?metodo=cargarCanonMarcaSenial',18);
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
