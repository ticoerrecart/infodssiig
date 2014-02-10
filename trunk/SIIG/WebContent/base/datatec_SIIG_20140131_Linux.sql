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
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `superCategoriaTipoAnimal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

LOCK TABLES `Categoria` WRITE;
/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (1,'Bovinos','GMAYOR'),(2,'Equinos','GMAYOR'),(4,'Ovinos','GMENOR'),(5,'Porcinos','GMENOR'),(6,'Otros Productos','GMAYOR'),(7,'Otros Productos','GMENOR');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rol` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` VALUES (1,'SuperAdministrador'),(2,'Administrador');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Periodo`
--

DROP TABLE IF EXISTS `Periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Periodo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `periodo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Periodo`
--

LOCK TABLES `Periodo` WRITE;
/*!40000 ALTER TABLE `Periodo` DISABLE KEYS */;
INSERT INTO `Periodo` VALUES (3,'2013-2014'),(4,'2012-2013');
/*!40000 ALTER TABLE `Periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoAnimal`
--

DROP TABLE IF EXISTS `TipoAnimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoAnimal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `categoria_fk` bigint(20) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCFAC7270AA39870` (`categoria_fk`),
  CONSTRAINT `FKCFAC7270AA39870` FOREIGN KEY (`categoria_fk`) REFERENCES `Categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoAnimal`
--

LOCK TABLES `TipoAnimal` WRITE;
/*!40000 ALTER TABLE `TipoAnimal` DISABLE KEYS */;
INSERT INTO `TipoAnimal` VALUES (1,'Terneros',1,0.8),(2,'Novillos',1,0.8),(3,'Vaquillonas (hembras de reposicion)',1,0.8),(4,'Vacas (hembras madres)',1,0.8),(5,'Toros',1,0.8),(6,'Toritos',1,1.5),(7,'Yeguarizos',2,0.8),(8,'Cueros',6,0.25),(9,'Ovejas (Hembras madres)',4,0.15),(10,'Borregas (hembras de reposicion)',4,0.3),(11,'Borregos',4,0.15),(12,'Carneros',4,0.15),(13,'Capones',4,0.15),(14,'Corderos (machos y hembras)',4,0.15),(15,'Lechones',5,0.2),(16,'Cachorro',5,0.15),(17,'Capon',5,0.2),(18,'Cerda',5,0.2),(19,'Verraco',5,0.2),(20,'Cueros',7,0.24),(21,'Fardos de Cuero Cat. 1',7,0.2),(22,'Fardos de Cuero Cat. 2',7,0.2),(23,'Fardo de Lana Cat. 1',7,0.8),(24,'Fardo de Lana Cat. 2',7,0.8);
/*!40000 ALTER TABLE `TipoAnimal` ENABLE KEYS */;
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
  CONSTRAINT `FK53704F745AF90344` FOREIGN KEY (`id`) REFERENCES `Denuncia` (`id`)
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
-- Table structure for table `DenunciaHacienda`
--

DROP TABLE IF EXISTS `DenunciaHacienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DenunciaHacienda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `dañosMuerte` varchar(255) DEFAULT NULL,
  `especie` varchar(255) DEFAULT NULL,
  `denuncia_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA1CA295A7E6C07D8` (`denuncia_fk`),
  CONSTRAINT `FKA1CA295A7E6C07D8` FOREIGN KEY (`denuncia_fk`) REFERENCES `Denuncia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DenunciaHacienda`
--

LOCK TABLES `DenunciaHacienda` WRITE;
/*!40000 ALTER TABLE `DenunciaHacienda` DISABLE KEYS */;
/*!40000 ALTER TABLE `DenunciaHacienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Senial`
--

DROP TABLE IF EXISTS `Senial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Senial` (
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
  CONSTRAINT `FK936518987C9761E7` FOREIGN KEY (`productor_fk`) REFERENCES `Entidad` (`id`),
  CONSTRAINT `FK93651898EF42E298` FOREIGN KEY (`boletaDeposito_fk`) REFERENCES `BoletaDeposito` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Senial`
--

LOCK TABLES `Senial` WRITE;
/*!40000 ALTER TABLE `Senial` DISABLE KEYS */;
INSERT INTO `Senial` VALUES (1,'2013-11-30 00:00:00','����\0JFIF\0\0`\0`\0\0��\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0�C\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0���?�x���ڼ���u\"�N��Y�~C����������\0!�C��d�\0Ѝ{?¿�CS�=W��21�i��\0�Q�\'���z�z�Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@ �_��?��O��8�xeIbvI�+)�R:W5�����\'��j�\0}�����c|꺵��㧜��������O����έ�����#�c_LxƖ�0��lw��n`����\0d�WEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEPEP�:��u���\0B5F�k_��?��O��\Z\0+O�������u+	6���������(����Z,Z��c?,��D����|���^xCY[�2��<H��;\Z�sI�l��.\rF�Q-�˕a�z��E\0^��(\0��(\0��(\0����k\Z~�`����[��Y�S�R}�\0_���Q��a�4�k��G��U��<�\\��{�w9�\n��@�Eq~��\\EkĖ�r��\r�m,ǰ# �y�Ҁ\n(��Eyd�4�g�&үIF*N���L�\0���&���O�V��Xݭ��mx�Ug�eUn�0�՚\0(���R�ϥi��݄�e㽴�2�኱��@�Fk��z��	��\0���k��mR=kF�Ԣ����!\"��\0��/�E\0Q��<c�����Z]Y\\N�E���\0���W<�k�\\�i�=��x� ���~��E6I(�G`���1�\0�@����9h�+*问��0*3�ֽB�aqm� pl���QE\0QE\0QE\0|���wP�\0��?�#Tj���\0!�C��d�\0ЍQ��(��O��:��:��9i4��|c��������\\]�5��7����ʲ�*�GC���55|����nWG�%�\0�d���\0ǻ�����_@) �\"��(��(��s�֣}�O����I�a����\r�c����\n�2�eך��?�n�\"��\0�*��Fm���\0{>����\Z=�$�|WӁ��t���O\0U�߇����]�<��|�?�O�x����Ie�A���8I�m?�\"��Ҁ<�O�-��J�4[���ؤ�	��Cn�Z��L�Z\0(��\0��\0�>���^���V�]	#ı�r�<��G����χ��Դ�k�R�j��� m^+���\0$����E�\0�����\0\"Σ�\0_��\"��C\nA\nC�*��\0ARQE\0��\0�/����gR�J�K݆O=c�9�95���H�\0�{���\0�\n\0�_�:��E��KO��1By�nw���ۭm`�����$��jF�G��_��k��A�\0�ױ�EP�|t�\0��M�\0�O�3��Sx�<6�NE�ҬNǀR@�$g�?���2����\0��^���\0?��6��������G���\0�i�p?�C���-b}�:��B��\0�V����\0�I��;�}�1\"��z��F�^e�Fo� �\"b�6o�^�P�C�e�<�ty��Ӽ�.�V�i���\0\Z�K�\0�M��pO�W�|iE�Ɩ���U���7={Η�\0 �/�����tQE\0QE\0QE\0|���wP�\0��?�#Tj���\0!�C��d�\0ЍQ��*{;9��l�2O3��Gv\'�#�n%C�#tD]���K�9<��y`~�dB���t�]���`Q^kWK��!�s�(=?�曢x�A�k&��X%��Rb�g?�F�CO��\0x={/�x�|9���ݲ���?����5�_���)�ͦ�|�>h���z7��+ ����]�_�!\rv�4]RQ�\n��F?���\0f�_Z��\0(��\0+��4�ۧ�wAy�WQ��pG���؊�2E\0|���=���6���\0	�M����Mb�8���WV��9,����寨i�=A�@9�_��7Z�\Z_����$W��Ǡp8����=��j�Zh�8�;���\'�Ӏ�r\0��?�}�I$�U���xQ��Tf�-�E��]�\0�w{�\0]\"�\0��b��\0�gQ�\0���kk��������+�_�:��~�@�EP\\�ď�\'���q����_��Ou���?�!@7�o�Z������u���k��A�\0�ױ�EP�|t�\0��M�\0�O��N�����n�l�6>�Q���\"���\0#.��\0^��;W�����\0�x�\0�@<xc���5�2uo1�x�G!gS�o�\'�1]��]\0��]��I��Q�b���,?�ڋ�\'�-G_�<z���m�E;�.�n���z���C��v�}��x�4���ր<#�o�6�\0������\Z_�l���\"��o�6�\0������\Z_�l���\"�-�E\0QE\0QE���\0!�C��d�\0ЍQ����u���\0B5F�\n�?��\\j�z�ʏ&�vD[���\'�_�\n������\0��68��w��\0{���~��5���W��b`��ۃ�1�����I�[K��nẶ�����U�CP�@��H`���n�5�ӲR���O�|���M�3�!��]\Zw�\0G�(A\"�?1��W1��\0�7��8�m��:������9�{��.b�����&��H�E}!���P�L�nc�m�y�������¾j��V�y��pj�!m���Ph�\n+��o���_���8K��g���c]%\0��\\���}hG�lE̙��?\'�~���{Wѕ��xgE��\Z��or��v\\8�9�\0q�Ư\r��>�圝��z�s�\nMO�O�-`cc����Wg���\'��\Z��࿅frћ��c�?�5%���	�JH����3���:\0y�����l��g�b@�2�T#_|\0?S��X\0\0\0�PZX��Z����V� ��Q�\n�@Q@5�����V�I��std^\Z\"��<�����D�yk��2�-ǘ�8�\r�@���|(�|�4��9f$���:��7�\'���\0�\'�\0@���w�p]DO�4k\"��=Cmm��6Юء@�3�\00�SP^U��\0�z\rց��1I9�����ܭ�>�\Z�Z�>�N��{��5�y�ido�H2�rNc��,�W�=�qꋪ<�nLF?.2�wv��x�5}[L���,`�@�$j�?�Rx7����L��Uu�~�o���X�G����#\\��=�\0Z��(��9�\0�˦�\0ק����zG���?�V^����Q\\��m4�&�\"V\\����0����q�U�\n\0��(��>6�\0��o�\0^1�\0�o^��\0�&���\'��+]�/��I~����Mp���	�~PI\0���CI)c�G�\n\0}Q@Q@Q@ �_��?��O��\Z���wP�\0��?�#ThS�zYּK�i���N��˟��Y�F�㪇Դ�#�����:e�_�/�=Y�\0t����k�\\���0>��(�7W3��S�_�\Z��l��ğ��?��4��E=�������h$Y���?������W��Ә�|�vG��l�׊׵�,��Ğռ/t����d��l��P�QR���iu5�˶X]��с���c�>$���d��,d�\'u5��\0���/���Vn�A�C��n���H����3��~�&]�YM���?y�?��%SN�-uM>�)�ky�r:��V�\0��(\0����|U����d�j���CI���c�m��ך\0ۢ�b��q�6�M-�6�	�8#f7dj֠��wmb`�L�?>QY�s�>��PE�PEQ@��g�[�b}*��]���{YS�2�c�s�8�\r�(�����v���{��\n`��Ac�h�Q@qE\0QTn�H-5+	7�ץ�X|���ӊ\0�EGS� ң�{���;d�3�m\\�f�/QE\0QE���\0!�C��d�\0ЍQ����u���\0B5F�=��b��ֹ�\0;e�����\0ǋ\n�Gb�]�Y�I5�$�\0�s�N�`>Io%#�\\����(��O�z��?��ö�o3j�\0�/��\0��.�����6�;Ҁ;��z7�W�g�� �\\x�ߨ\'����I�?��?�`Q�����V@2?\n+��\0��(��o��<+�+�f�n�|��������X�%���u��!��E|o^����\\��:���R6-�c�����O��=�;Q@rSh�Ŧ��j^�lX^:��[��(�T.C)�8�]m`�x?D����Kic���W��H������9�O�Wz���Z��lo�.~�1�\\��\"U�� �\0J��N}^�qiw�iIkgxm�Ys��e�1���:�to�qf�a��T��G9�9��/\r隵��]E0�c��n$���;N�\'�?V�O�|=�Y���\Z��i�u�\\0bw0$v<և�Eōփ�حԶ�-3H�md�]��k���s��tsxwJ�GM%��YFAHЕ�A� ��s�s�I�9��iQi�ۼ��6��ɝ�[$�N�y<�<�?em��W�D��mg�c%�oxgx�cnÞq��dI��o�x^�_U[�B[x.e7l��H� �v du��v�^��-��n�e�K<�4��0Y�?�zc�N�5���[5�a�x��w������4��0\rƷ�l77Ob�r]����+&�RAbO �3uqr��#ҭo����&[��RFiQ��	�� �$c�z_�u���j>W�[B 2n?p��N��ֱW��\r��1Q �#3ɲ6vQway�ӥ\0t��r�7��+?�J�}�VM����ZmR�V�bL�n$`�U-��qڀ8��K}�x�U�S��Օ��Z�uX|�b�Ppzw�wY��Z�<5ܓ��I<��>An6���Nq�J��F�����m�ozҽ�n?9�;��Frz~�����F����ܘm��vH�ѐ0`Aqր9�|ݷ������$�i�K|д�(�&w0�g�����g�|?�jIY��J�ͤ��x\"r�Ic�ۖ#5��xsK������f[Q�J�H���F3�=��6�v�{i��G!�X�]J�	��>vm�Ҁ9�4�t?xj+;��O8�f��Q.!b�$g>��S��:]c�\Z��5���1�7~�8�n���z�%�_�Ԥ�lt�����\r;�̻yf\nlz���[K���\"�-Ӊ&m��`���:P�k�K}o�j�E��l���ϪI��>`��\0������s�/\\HAyRwlz�2kB��:����,�\0j%��O\"��x,P0���ך�:U���Sd��͸��ߞ8�\rb�K\r���-�����rUI���?\r��{yu}s�YI,�\\�$��I�3���z[(e*�F5�C�o�4R�`s�4*g��L�QKay�8�(V��U���m\'�������ͮK�%�Rt����\r�k�������4���H�7��[�	��K�x{L��{���T�)�\'�${*柧�iv1���c�<�Rŏ$��I\'�O4f�(��u�����\'��i4{����q:E��L.��\0!�C��d�\0Ѝu?	���@�b2������-\0u?�ˣ�1�m3(�¯������|W�~����[*@����\0�ū�����</���~�u<_��FB�G��}aq�\\.DbA�RU|}v�@��B�O���\0D���5��ܡ���G�#��?��B��/�t�Ѯ����N�n��^��b�2>0�G½[�����8��nC�\0}n���J�V ��^����]��z-��Ӭ�2�23��ߝs���o�ʸ������\07L��P1EPEP��*��ċú���\n6�N��`������������utb��*A����g�<Mf�f� \Z�ԟ��Q�C�Q��\0=�O?T�\0��t�\0�Y>��/��L}w�ۻnq�9�uu�m��\0��o?��>���}��ٻ~��{;q�L�z\0�y�+kk��8t�N�[�@T\r��Cӯ�z���<?��iid�\'�5����`�#��~��O���<G4Е�������T��X�����Z�������2>ERw���kQ��}��ū__\\�h��Tk����\n\0�\'ӭY��2���5���yl� ��8���T�-�l<Qi��YM}�{Iု������ Ag=:�s����۹,��]AfXP�l]�8�3���^/��N�����v���Β�bȠtM�d���X���$�e�uh��I�v�?�ڠs���zՅ�ρ/,!�����0@%�c�C�i��]x]じYϺs��%�?�(���ì�w\0�����e�t�\\S� ��ߵT�ű�hn��R�.d�5�J��S�$�254�E<M��D.l���f�b�;{��á���\0b����5+k�y/o���r�9��x�;�KĐX��+��K$V�Ƥ�,@���x��Xj���v��L~�$\0ڙ��#۩�T�MCB�N��ǥ��6��p�\0ǩM�:�*�eH �9������Z�ؼ�\Z���&\0$\n\0���v��y�=��8��K(��2��HB��J��|Oa����l��MA��}�?0��Xp9���ֱ#M[A}j�\Z��_\\�sk<L�3 Y2��|�T�xz��/Z���Mb.dS���<����x�\rb{���Z]Z��m�+o���~ձڰm,.c�|�m5���|̬��d~u�@��[v���k���s-���8]���\0)�O�M�moX��\0���Z]�m��k\Z��/0/�D=�K�xF� [�6έ�=�@0F#8�\"���w��-��a��v���\0S��@[i������_�q��\0�$vB��^px�ս#�P�ח6F�����VF���#d$�k4]@x���ټ��\Z�r?vRz�@��r�:��10�}-mĠ�����Ѓ�\0����bqg|t�7�������s��۞7mǾ9��?��z��\Z�����v�.⽺t=p=뎱���4����/�_�������A�d8�~������<��C�,>fF7��ץ\0>��2ژ�hZ��xVRb�?w��s�c�3Z:f�m��_�1h&]�H�� ��Er:ݍ�&�k�\"�\0U�x�1��(�~�y\'$+c��}֗�;����t[�m̌G#�PCEP�:��u���\0B5�_,�$�uY>U�c��7�Z��k�C���|��\0�\Z���=�+Q�>�k+�z叔��\Z\0�\rR��]j�����Ɏ�f\'�zf���h���k�?k�[[���;�]��+�Dހ�=y����&�k��)3۾�G�[g���\0�]�������������?���P��@ּJ���M<p�v�j�\0k�ߏ·>xx��Ꚕy�-��[I���G�֩x�E��4�|c�G�>�w�\0ˬ�\0�>��\0?qT�1��qe�hwd0Я\'���I���Oh����Q��ծX�*�=}NMk�C=�y�t���zߊ5Ǹ�TQ,\r�Ԩ��\0�����=k��ψS�~��WvO*ߞ�7NO�@?�kkg�.�Z��8�G�m�%�	�G��㎚��I�b�$��N>e��7�^E��k�u/��As��,X�����ɠ�f��ܨ�\",2�ЮEz��o٥�׋u�O�Z��?�>Q�e��:ƺ�\rgG�j�dֿg�&�s(?rA�G��ϕ�xἾ*����J���G�)v���rv���$�C)��~���\0n�*�����~���)�H��7i��\0��s���	��5?���u[��VK̳7�\n�<M��\0]�-�z��;\\Z����!���ܿץp��6�ɤx��Ι\'Ȳ��4#��\0y}�~��񵏋��1�MB�]B�/́�Q���p<WW^���x#U���C�hw,a��m�~U�^�M��4X��k�,��O���4�EPEPEPEPEPEPEPEPEPEPEPEP�:�λ�\0_2�F�{�_�H~� �d)z�L��=��/N������&�w��C�ߠ5�|r�<���z������3��*��QE����hz��\Z���]A|������?��\n�ºG�;m[ė�+r�\"����?�c�}���<|M�}��<�vL\ZL�������]���t��ڟ���|�Y��PrG��\\����߈u��N��4͜vE��\n���Rִ�7N��|\Z|e#�nz��`~OU���]R}:�#����ǭR�����z���x~��6��ꮻ[�μb������w��cf�w������\0�(����<~�u�xb��y����S��b?Z�\0k�þ1��g�o#y�ln2~�������e�V�V1,�w�?�c��>�o����5�J�y�	�g�5��_�j���p��t�\'���?�z�������s>�o��.VV\n����i$y�y�;�f\'���E��p��\0�-���as���^B���?������O����G�<Fǆ^��C��\0�ח�^��\rZ��O�.<5��ux��O,�}���}\Z\0�Y����5+	|�%�S�O��_8xc�z��O�隊9��6]B?I���~�DY����Ewk*��$S�ހ\'��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(����k�ݰ�l���m��f�O�����^pr�9�~�6�\0�B�S���E��ayqk!��-�	�d�#�#�#w%��Rh���h�z��m�Y&�lg���}���_��}�\\���tt��#��4��;�-<�+h�������*�����?\n�k������&��U�CSjz�֯�O{)��w���J�@ɫY��S�bkV���v\\B�dq��_�W��T�Auj�R���e����L�%���8���Vt��4�N��/����S��E\0Z����K���\\LҷՎj�PEPEPZ:�w��f�S�}�@۱هu>�qY�P��B��|m�_��x�̪>�G�@����\\��/�\r�����)	ҧ~���c��������|Z4�]�;��\0A�lG�����O�+�7�G��Q$P\0,�G�n��y_�������D�H�#���/�?���xwW��,v������}�?/���EPEPEPEPEPEPEPEPEPEP�:��u���\0B5F����o��\'�yt�2H���NI��T��T��\0�K�L��U\0|�E}/�\0\n����	o�	��\0���7�?���/�\0@4Q_K�\0¦�g�[�\0e�\0��\0�M�������\0�P�W��\0��\0@��\0���?�Sx3��-�\0�2�\0�T�E���*o�%��&_�*��T��\0�K�L��U\0|�E}/�\0\n����	o�	��\0���7�?���/�\0@4Q_K�\0¦�g�[�\0e�\0��\0�M�������\0�P�W��\0��\0@��\0���?�Sx3��-�\0�2�\0�T�E���*o�%��&_�*��T��\0�K�L��U\0|ҬQ�)!��#�My{u�]=��ķ�ޒW,O�k��T��\0�K�L��U��\0@��\0���\0�{��߈_�𦅫M��\Z�	��\0�Q��\0�?Q[���\0@��\0���t?<!o2M�$rF����PT��|���H\0��\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE��','123',2,3,'Arba.jpeg');
/*!40000 ALTER TABLE `Senial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemMenu`
--

DROP TABLE IF EXISTS `ItemMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ItemMenu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `item` varchar(255) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `item_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4A06A732EA23B717` (`item_fk`),
  CONSTRAINT `FK4A06A732EA23B717` FOREIGN KEY (`item_fk`) REFERENCES `ItemMenu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemMenu`
--

LOCK TABLES `ItemMenu` WRITE;
/*!40000 ALTER TABLE `ItemMenu` DISABLE KEYS */;
INSERT INTO `ItemMenu` VALUES (1,'Salir',10,NULL,NULL),(2,'Salir de la Aplicación',NULL,'/login.do?metodo=logout',1),(3,'Usuarios',9,NULL,NULL),(4,'Alta de Usuario',NULL,'/usuario.do?metodo=cargarAltaUsuario',3),(5,'Modificaciónn de Usuario',NULL,'/cargarUsuariosAModificar.do?metodo=cargarUsuariosAModificar',3),(6,'Datos del Sistema',6,NULL,NULL),(7,'Localidad',NULL,NULL,6),(8,'Alta de Localidad',NULL,'/localidad.do?metodo=cargarAltaLocalidad',7),(9,'Modificación de Localidad',NULL,'/localidad.do?metodo=cargarModificacionLocalidad',7),(10,'Período',NULL,NULL,6),(11,'Alta de Período',NULL,'/jsp.do?page=.altaPeriodo&metodo=altaPeriodo',10),(12,'Modificación de Período',NULL,'/cargarPeriodosAModificar.do?metodo=cargarPeriodosAModificar',10),(13,'Entidad',NULL,NULL,6),(14,'Alta de Entidad',NULL,'/entidad.do?metodo=cargarAltaEntidad',13),(15,'Modificación de Entidad',NULL,'/cargarEntidadesAModificar.do?metodo=cargarEntidadesAModificar',13),(16,'Alta de Provincia',NULL,'/jsp.do?page=.altaProvincia&metodo=altaProvincia',7),(17,'Modificación de Provincia',NULL,'/provincia.do?metodo=cargarProvinciasAModificar',7),(18,'Marca/Señal',NULL,NULL,6),(19,'Alta/Renovación de Marca y Señal',NULL,'/marcaSenial.do?metodo=cargarAltaRenovacionMarcaSenial',18),(20,'Pago Boletas de Deposito Marca/Señal',NULL,'/marcaSenial.do?metodo=cargarPagoBoletasMarcaSenial',18),(21,'Modificación Canon',NULL,'/canonMarcaSenial.do?metodo=cargarCanonMarcaSenial',18),(22,'Guías',1,NULL,NULL),(23,'Alta de Legalización de Guía',NULL,'/guia.do?metodo=cargarAltaLegalizacionGuia',22),(24,'Autorizaciones',7,NULL,NULL),(25,'Alta de Autorizacion',NULL,'/autorizacion.do?metodo=cargarAltaAutorizacion',24),(26,'Modificacion de Autorizacion',NULL,'/cargarAutorizacionesAModificar.do?metodo=cargarAutorizacionesAModificar',24),(27,'Autorizado',NULL,NULL,6),(28,'Alta de Autorizado',NULL,'/jsp.do?page=.altaAutorizado&metodo=altaAutorizado',27),(29,'Modificacion de Autorizado',NULL,'/cargarAutorizadosAModificar.do?metodo=cargarAutorizadosAModificar',27),(30,'Tipo de Animal',NULL,NULL,6),(31,'Alta de Tipo de Animal',NULL,'/tipoAnimal.do?metodo=cargarAltaTipoAnimal',30),(32,'Modificacion de Tipo de Animal',NULL,'/cargarTipoAnimalesAModificar.do?metodo=cargarTipoAnimalesAModificar',30),(33,'Consultas',3,NULL,NULL),(34,'Consulta de Guías Legalizadas',NULL,'/guia.do?metodo=cargarConsultaLegalizacionGuia&urlSeleccionGuia=cargarGuiaLegalizada',33),(35,'Denuncias',8,NULL,NULL),(36,'Alta de Denuncias',NULL,'/denuncia.do?metodo=initAltaDenuncia',35),(37,'Devolución de Guías',NULL,'/guia.do?metodo=cargarConsultaLegalizacionGuia&urlSeleccionGuia=cargarGuiaParaDevolucion',22),(38,'Reportes',5,NULL,NULL),(39,'Reporte Vencimiento de Títulos de Marcas y Señales ',NULL,'/reportes.do?metodo=cargarReporteVencimientoMarcasSeniales',38),(40,'Establecimientos',NULL,NULL,6),(41,'Alta de Establecimiento',NULL,'/establecimiento.do?metodo=cargarAltaEstablecimiento',40),(42,'Modificación de Establecimiento',NULL,'/establecimiento.do?metodo=cargarModificacionEstablecimiento',40),
(43,'Reporte Guías Legalizadas',NULL,'/reportes.do?metodo=cargarReporteGuias&tipoGuia=Legalizadas',38),(44,'Stock Animal',4,NULL,NULL),(45,'Alta de Stock Animal en Establecimiento',NULL,'/animalEnEstablecimiento.do?metodo=cargarStockAnimalDeProductorEnEstablecimiento',44),(46,'Modificación de Stock Animal en Establecimiento',NULL,'/animalEnEstablecimiento.do?metodo=cargarConsultaModificacionStockAnimal&tipo=m',44),(47,'Consulta de Stock Animal en Establecimiento',NULL,'/animalEnEstablecimiento.do?metodo=cargarConsultaModificacionStockAnimal&tipo=c',44),(48,'Pagos',2,NULL,NULL),(49,'Generar Boletas de Pago',NULL,'/guia.do?metodo=cargarConsultaGuiasDevueltas&urlDetalle=recuperarGuiasDevueltasParaBoleta',48),(50,'Consulta de Guias Devueltas',NULL,'/guia.do?metodo=cargarConsultaGuiasDevueltas&urlDetalle=recuperarGuiasDevueltas&urlSeleccionGuia=cargarGuiaDevuelta',33),
(51,'Registrar Pago de Boletas',NULL,'/boletaDeposito.do?metodo=cargarRegistrarPagoBoletas',48),(52,'Reporte Guías Devueltas',NULL,'/reportes.do?metodo=cargarReporteGuias&tipoGuia=Devueltas',38);
/*!40000 ALTER TABLE `ItemMenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Autorizado`
--

DROP TABLE IF EXISTS `Autorizado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Autorizado` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autorizado`
--

LOCK TABLES `Autorizado` WRITE;
/*!40000 ALTER TABLE `Autorizado` DISABLE KEYS */;
INSERT INTO `Autorizado` VALUES (1,25888999,'Autorizado 4'),(2,25555455,'Autorizado 2'),(3,27549519,'Autorizado 3');
/*!40000 ALTER TABLE `Autorizado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guia`
--

DROP TABLE IF EXISTS `Guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Guia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaLegalizacion` datetime NOT NULL,
  `numero` bigint(20) NOT NULL,
  `numeroInterno` varchar(255) DEFAULT NULL,
  `productor_fk` bigint(20) DEFAULT NULL,
  `senial_fk` bigint(20) DEFAULT NULL,
  `marca_fk` bigint(20) DEFAULT NULL,
  `periodo` varchar(255) DEFAULT NULL,
  `canon` double DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fechaTransito` datetime DEFAULT NULL,
  `finalidad` varchar(255) DEFAULT NULL,
  `interes` double DEFAULT NULL,
  `medioTransporte` varchar(255) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `nroDTA` varchar(255) DEFAULT NULL,
  `patente` varchar(255) DEFAULT NULL,
  `patenteAcoplado` varchar(255) DEFAULT NULL,
  `trasporteACargo` varchar(255) DEFAULT NULL,
  `estOrigen_fk` bigint(20) DEFAULT NULL,
  `estDestino_fk` bigint(20) DEFAULT NULL,
  `tipoProducto_fk` bigint(20) DEFAULT NULL,
  `tipoEstadoGuia` varchar(255) DEFAULT NULL,
  `boletaDeposito_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK220AA6936A5810` (`productor_fk`),
  KEY `FK220AA6F5B6E5D0` (`marca_fk`),
  KEY `FK220AA61B62CDF8` (`senial_fk`),
  KEY `FK220AA66E0FCF94` (`estDestino_fk`),
  KEY `FK220AA6E4C0434` (`tipoProducto_fk`),
  KEY `FK220AA6B15736E6` (`estOrigen_fk`),
  KEY `FK220AA6EF42E298` (`boletaDeposito_fk`),
  CONSTRAINT `FK220AA61B62CDF8` FOREIGN KEY (`senial_fk`) REFERENCES `Senial` (`id`),
  CONSTRAINT `FK220AA66E0FCF94` FOREIGN KEY (`estDestino_fk`) REFERENCES `Establecimiento` (`id`),
  CONSTRAINT `FK220AA6936A5810` FOREIGN KEY (`productor_fk`) REFERENCES `Entidad` (`id`),
  CONSTRAINT `FK220AA6B15736E6` FOREIGN KEY (`estOrigen_fk`) REFERENCES `Establecimiento` (`id`),
  CONSTRAINT `FK220AA6E4C0434` FOREIGN KEY (`tipoProducto_fk`) REFERENCES `TipoAnimal` (`id`),
  CONSTRAINT `FK220AA6EF42E298` FOREIGN KEY (`boletaDeposito_fk`) REFERENCES `BoletaDeposito` (`id`),
  CONSTRAINT `FK220AA6F5B6E5D0` FOREIGN KEY (`marca_fk`) REFERENCES `Marca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guia`
--

LOCK TABLES `Guia` WRITE;
/*!40000 ALTER TABLE `Guia` DISABLE KEYS */;
INSERT INTO `Guia` VALUES (1,'2014-01-06 00:00:00',78978,'1123',2,1,NULL,'2013-2014',0.15,50,'2014-01-06 00:00:00','VentaAFaena',3.75,'camion',7.5,'','fff555','ttt669','pableo perez',1,NULL,12,'DEVUELTA',10),(3,'2013-11-01 00:00:00',1234,'1798/89',3,NULL,5,'2013-2014',0.8,80,'2014-01-01 00:00:00','VentaAFaena',32,'camion',64,'654','fff555','ttt669','pableo perez',2,NULL,7,'DEVUELTA',NULL),(4,'2013-12-04 00:00:00',888,'2987',2,NULL,1,'2013-2014',0.8,50,'2014-01-01 00:00:00','VentaAFaena',20,'camion',40,'35345','fff555','ttt669','pableo perez',1,NULL,7,'DEVUELTA',10),(5,'2013-12-01 00:00:00',88,'2798/89',3,NULL,5,'2013-2014',0,0,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LEGALIZADA',NULL),(6,'2013-12-04 00:00:00',999,'3123',2,1,NULL,'2013-2014',0,0,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LEGALIZADA',NULL),(7,'2013-11-04 00:00:00',222,'4987',2,NULL,1,'2013-2014',0,0,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LEGALIZADA',NULL);
/*!40000 ALTER TABLE `Guia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Establecimiento`
--

DROP TABLE IF EXISTS `Establecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Establecimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `localidad_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD875E026F6FDC4B0` (`localidad_fk`),
  CONSTRAINT `FKD875E026F6FDC4B0` FOREIGN KEY (`localidad_fk`) REFERENCES `Localidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Establecimiento`
--

LOCK TABLES `Establecimiento` WRITE;
/*!40000 ALTER TABLE `Establecimiento` DISABLE KEYS */;
INSERT INTO `Establecimiento` VALUES (1,'Las Marias',1),(2,'Chacra Ernesto',2);
/*!40000 ALTER TABLE `Establecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MarcaSenial`
--

DROP TABLE IF EXISTS `MarcaSenial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MarcaSenial` (
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
  CONSTRAINT `FK29CCF5B47C9761E7` FOREIGN KEY (`productor_fk`) REFERENCES `Entidad` (`id`),
  CONSTRAINT `FK29CCF5B4EF42E298` FOREIGN KEY (`boletaDeposito_fk`) REFERENCES `BoletaDeposito` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MarcaSenial`
--

LOCK TABLES `MarcaSenial` WRITE;
/*!40000 ALTER TABLE `MarcaSenial` DISABLE KEYS */;
/*!40000 ALTER TABLE `MarcaSenial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provincia`
--

DROP TABLE IF EXISTS `Provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provincia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provincia`
--

LOCK TABLES `Provincia` WRITE;
/*!40000 ALTER TABLE `Provincia` DISABLE KEYS */;
INSERT INTO `Provincia` VALUES (1,'Tierra Del Fuego');
/*!40000 ALTER TABLE `Provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Autorizacion`
--

DROP TABLE IF EXISTS `Autorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Autorizacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productor_fk` bigint(20) DEFAULT NULL,
  `autorizado_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC5FD1832936A5810` (`productor_fk`),
  KEY `FKC5FD1832EB275FF8` (`autorizado_fk`),
  CONSTRAINT `FKC5FD1832936A5810` FOREIGN KEY (`productor_fk`) REFERENCES `Entidad` (`id`),
  CONSTRAINT `FKC5FD1832EB275FF8` FOREIGN KEY (`autorizado_fk`) REFERENCES `Autorizado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autorizacion`
--

LOCK TABLES `Autorizacion` WRITE;
/*!40000 ALTER TABLE `Autorizacion` DISABLE KEYS */;
INSERT INTO `Autorizacion` VALUES (1,2,2),(2,1,2);
/*!40000 ALTER TABLE `Autorizacion` ENABLE KEYS */;
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
  CONSTRAINT `FKEF251FB4EA345518` FOREIGN KEY (`tipoAnimal_fk`) REFERENCES `TipoAnimal` (`id`)
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
-- Table structure for table `TipoProducto`
--

DROP TABLE IF EXISTS `TipoProducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoProducto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoProducto`
--

LOCK TABLES `TipoProducto` WRITE;
/*!40000 ALTER TABLE `TipoProducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoProducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnimalEnEstablecimiento`
--

DROP TABLE IF EXISTS `AnimalEnEstablecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnimalEnEstablecimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stock` int(11) NOT NULL,
  `tipoAnimal_fk` bigint(20) DEFAULT NULL,
  `productorEnEstablecimiento_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCCB98DA1EA345518` (`tipoAnimal_fk`),
  KEY `FKCCB98DA1614C82D8` (`productorEnEstablecimiento_fk`),
  CONSTRAINT `FKCCB98DA1614C82D8` FOREIGN KEY (`productorEnEstablecimiento_fk`) REFERENCES `ProductorEnEstablecimiento` (`id`),
  CONSTRAINT `FKCCB98DA1EA345518` FOREIGN KEY (`tipoAnimal_fk`) REFERENCES `TipoAnimal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnimalEnEstablecimiento`
--

LOCK TABLES `AnimalEnEstablecimiento` WRITE;
/*!40000 ALTER TABLE `AnimalEnEstablecimiento` DISABLE KEYS */;
INSERT INTO `AnimalEnEstablecimiento` VALUES (1,300,1,1),(2,450,7,1),(3,200,9,2),(4,1200,9,1),(5,50,12,1),(6,250,7,3),(7,40,7,2);
/*!40000 ALTER TABLE `AnimalEnEstablecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entidad`
--

DROP TABLE IF EXISTS `Entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entidad` (
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
  CONSTRAINT `FK456F1C9F6FDC4B0` FOREIGN KEY (`localidad_fk`) REFERENCES `Localidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entidad`
--

LOCK TABLES `Entidad` WRITE;
/*!40000 ALTER TABLE `Entidad` DISABLE KEYS */;
INSERT INTO `Entidad` VALUES ('RN',1,0,'','20222222222','Gomez 456',0,'gana@gmail.com','Direccion de Ganaderia Ushuaia',0,'0','CUIT',2),('PRD',2,1951,'','','Alameda 456',22569874,'jlcorrea@hotmail.com','José Luis Correas',5559999,'','DNI',3),('PRD',3,1987,'','','Alameda 564',22369258,'rjerez@gmail.com','Ricardo Jerez',789,'02255-456789','DNI',2);
/*!40000 ALTER TABLE `Entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BoletaDeposito`
--

DROP TABLE IF EXISTS `BoletaDeposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BoletaDeposito` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fechaPago` datetime DEFAULT NULL,
  `fechaVencimiento` datetime NOT NULL,
  `monto` double NOT NULL,
  `numero` bigint(20) NOT NULL,
  `productor_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBE758A44936A5810` (`productor_fk`),
  CONSTRAINT `FKBE758A44936A5810` FOREIGN KEY (`productor_fk`) REFERENCES `Entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BoletaDeposito`
--

LOCK TABLES `BoletaDeposito` WRITE;
/*!40000 ALTER TABLE `BoletaDeposito` DISABLE KEYS */;
INSERT INTO `BoletaDeposito` VALUES (3,NULL,'2013-11-30 00:00:00',100,1,NULL),(4,NULL,'2013-11-30 00:00:00',200,2,NULL),(8,'2013-11-28 00:00:00','2013-11-28 00:00:00',200,111,NULL),(9,NULL,'2014-01-10 00:00:00',200,1,NULL),(10,NULL,'2014-02-20 00:00:00',71.25,12,2);
/*!40000 ALTER TABLE `BoletaDeposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CanonMarcaSenial`
--

DROP TABLE IF EXISTS `CanonMarcaSenial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CanonMarcaSenial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `monto` double NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CanonMarcaSenial`
--

LOCK TABLES `CanonMarcaSenial` WRITE;
/*!40000 ALTER TABLE `CanonMarcaSenial` DISABLE KEYS */;
INSERT INTO `CanonMarcaSenial` VALUES (1,100,'Señal'),(2,200,'Marca');
/*!40000 ALTER TABLE `CanonMarcaSenial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Marca` (
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
  CONSTRAINT `FK46AE21C7C9761E7` FOREIGN KEY (`productor_fk`) REFERENCES `Entidad` (`id`),
  CONSTRAINT `FK46AE21CEF42E298` FOREIGN KEY (`boletaDeposito_fk`) REFERENCES `BoletaDeposito` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
INSERT INTO `Marca` VALUES (1,'2013-11-30 00:00:00','����\0JFIF\0\0\0\0\0\0��\0�\0\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r		��\0\0�\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0	��\0S\0\0\0\0\0!\"12BbRr�#AQ���aq���3CDScs�T����������	$5d��������\0\0\0\0\0\0\0\0\0\0\0\0\0��\0<\0\n\0\0\0\0\0!\"12ABQRa#3b�������$qr��ᡲ�4��\0\0\0?\0츤V-��8ß��H�DSyR�;ߎ2��g0i�eho>�D���+�\n��\0��5Qb7zo̬�.��NDZ��ngx�{IrdI�IrUF	�a�� ��\0)�4�\Z��m��{��m���:�I�2��$��eZ�Q�*6Æ��j!������N��>��p�o����eٖp%r�����8�\0��l�\Z6�,kEin�^]�(L;��L!Fm�eo5�����8�[Y��\r�\0��q�Q�֭�9b>��)K��E��>�����~���jy��r$��k�%�{\'+p�����`�V��ϡ��]�$X㈈��D�Uab��*���!��\'I0T⧞J ��z�[_����1�rY�uRn��Wh��\0��as0rQ�����8�}#��g��8A�w��7M��Ѭ��[?����߂4��:0�L�nM8��D�~J��^��fʲo9-.�	�\Z��Dz��Rnz|���T,��lS$�Q[�ܢ%�\nsm�ټ�g$ͻ�0n(+���,�%@��I��ӓB�d�)�T�$H�4�!+��wJM\"�b:UN���B�Ż9m��Es�=��ݣ�#�i��t�)�\Z��2�^>J��-	�*zƐk�(�K�Ik�*����_$l�\0�œe��ʋ�\n��+5�(��mtoM�>J�I�jRYV��C��R�]�\'o5�\'���S��2Es@j�P�S�p|P�fa	QQQw*.i\n;߀��f�)���H�>�}ܡ~�е��R`��S_�]\"*u4r ��|���w���+�����K�s@�i[$�F�f)��q]��/2(L<���Ӽ<c�S�K3+S�u��ŕE�YXDA���Y4O+�b4�(�4�j�؃k�f2���.�IW�~��#�e~K���t@�~+I�)	\Z���[hs_{��t6��%Vp��%���D�8�=$D�|�2�Yr\n��N\'4������i�6a\\����McE\'�\n�a�7eI\\\Z�aW�����M6 �~̗NA�~ˢY������I6F�*z���B�_�ZY�\0LZ��	K�t�׏o��n;,�8ѫn&�E�T�k�q���L���:�xO���.��υ�y�s��:����KMr1����!l�*iW��\\?,i�{\nt(�2��2hu���I�3���\\M��/�w-��.��\"e��(�>���Ѫ�mK��GJ�b�D�!Q�rlg��u��<@	���w#SJA�^>�/��N#���<.7�.k���V�s�9c���e�G�EF\\-��7=�N�չ�\'hو��F�F4����)E&�6���g�*�S7��nWS{�o74�:��i�E��Ш򄾆�2,�#�\"!�&D�EH�}��N\\\'$�)� \Z��{BDq���f&��ț\nJ�QWx�K�m[42�^�[��d��_q�4��dzB\'	�qZ�O�\\�&\'���*����	�pC抓T4��o����O�~���X�癑iu\nz��?\0R~�<n��ܤ�6�l�櫫���#wR���afXPq�R- �٩q&��7����3�6��i[���*��.�TD�P�Fo!6�|�����a��ݲ��\"~���≝����Y@���fM3U]��uή�L.e�K:U�dt�\n$U �\\��0���\nf~�$��W\"�U��|\r�8&��ч�Te	�����f=i�O�F�)fn�u{�����k8VZI�7JK/�6]�.s�u��$�IJdM&��D��?�7\n�=<��nZ��X6��㋼6ޣHە�S�d�(�?�5�����:鸫��Ȋw�;�ѷfze�u;A�q�u�T�h��1}�;\nW$J�4ԟ�x�E�k�9��\0_��\\St�D\\��_D���t_(�۪�o݃}�u�6��h*�0�g�J�.�}$TU�D.��~q��Ḫi�� TN�Z�F\\W�ݡ��SY�I�	�����i^)K\nXXW�T�F��K�.FǣTs<\'G#ENy�ˊ�\"��@��j�巤V�ra�ܤ\Zt_�\Z���{���S�.�4≒���5m	\rc�|~�{S�K��]\"V�^ʇ�CZM@�HrTT�Iz}p��[6Ya�{h��ǭ��`�N��e|I�v\'�kJ�e��I�Q9��$^E��\'�t���PD#�յ)d�dg���9D,|(߼?��=�Uo=��XOI�D�	�s!IiܜiR�pҵ�;C�{�z�-�D�S#e��N�pD��%Lr�X�c�>�r5���V�\n��~�������v�Z�[�jQfd�$�%d\0��uhaC&�4HB�*%P�.�,0���-���y%�a�\"\\13�<fu���T%$��e�Wz!�=\\�o���	tT�	�,ZI�i|\Z�%�Vf�~���y\\ˡ��{Q��&cΜ*%��_^#-��mQ���pq�|Ԛf\\�Ux�x�z;PѸW�ϭI�l����\"�p��H�t����\0�3x�h��T�I���t;i�S.γ�l\0�\\���5���,Pę{<6֧�62�#�8�ƌCIQni�Ŗ���sR\Z�<*Z����ٷ��F�9��9{���S3��KCCD��p𷈖�W�ū����e��$|���Ǳ܉%��C���i̵����(�;< �V�D������=�����1��P�xǂ�llĚ8��u��٠��)/�n��/�\"�᭜I�R[/`��|�N�^�������q˃�\'��.\n���5SE���[� z�G%��l�Z�%XDV~ζl���[FTu�9R�)��}�m~S ]K�e�cufZBi�%OR�z:�磎��~Uf<l�������31R^|iF��j$��������\0��\'��	��?A<�֊B8��_74l�?�p\r��\'XZ]L�r�P���i�p�L�O��WC�w�n\r��!�\0J��f�=*U��Q��m�0�D�jf^ÐADCx�4Ng�\"���=1j�,�ܓ����:���\nl��#��ވ�\0�U�)��m�R ohIP��Ϳ�.n�<���0N[���X{�E�#nU�W��94���n.j��(<�\"��\'I�jTWi�N:y[�|$H0�	P�&�WE*)Z*b<���)����I\"�,)��F�4�e��5Rռ�������P6֧W�RLE��,���S�pu�k���޸DX6<���-���fJ��w��{�\0O�^��Ǫb_������^�\0Dt@$��-�i7�.ٯW9S*�h[eO�#�S�$�ޓv6袘M�lJR��=0��U=wG�8����&��a�i\0��ȫ�i�\nPa�z�%9/72yL1�Z>��UYTX��=��Ro�9T�d5nB�?,I������;.LX�θ�ٱ&�]J��pW`�K_t�l��:nnm3M�qM���X��Rz�w�E�Ra�hYj�.h�_�	��kߡ2��?����m�he/RBPI愯����m6����9����7�P��zБ�\ZdQE*Iv�]�ǈ����Jö�,ו�Im�d�����Ka���2�6�Z:�U�+@����\Zzr�c��T���3屬,^�\"՛<mT�KF�t��%p�v�;,��UApA��My׵��\0�����n�-�$��p��BD(w�a�%*6͟g���3�X�1 ���(�m\Z�������d�7-�vʰ0����ړH�k��%�\Z���O�a�j��>�]�6-��(� �\"���8F#�������EJ�n��8�s6}.��D�70�ܭ�`���z��D���VK�O�/�M����f6M�T?�\'s��}0�^�Z�,���ʑt���ÂTQ����������̱^-�����oeՒ�x���l[<y��C��S�kip����\"R*��9\'��IbOשu\'�w�*1����i�&O0����k�K���17��S\"֙n�bX�!���y�J��Tx�UY�S��:�xMT��2�^f�\n�6���f�RQ��f�qT�Q��*�qw�\Z~Ov�VL��H*�y��t��l~!��p�ڴ�Ԓ�B�9oE!�E�҈����V��Y��4��<��;����xy��f��ߋ��BX�{8�ѳ�_����~P�d���,7Q��f\r��B�\'{�\'�6��$��Qq�J��L��qY��Ô���+��G�7)&���9Z�_��A���,�]�*U�Y��)�ً��^c[A&bk�nbn=6�r����*�jhW����ӓ�V��f�L>\\(�*�ty~i�\'�]��B��[�=��oㆥ�l��3T\n�����y΢/�q|jih�)G9�G�_:�YO%�)S�G]sH�+R�h�r\"�qCF4�J�\'��t��t��[T��#+S)K)�O`�cஂ\"2\"غ-�	�x0n8�ĩ�G�&Ir�-�їiz�Ks1RjH���3ՙ�O��A�bC����h(���\r8 �I\np�%�=��I%��:�n�AW8a��7���G,�j����R2ay�+��[���F?F�.�Z�>�ǝ�Q�&a�QQ�xGھ����p�fRe��ytj�!�Y��0�9��V��(RHj���Og�FL�9�&���$Ĳ\0Z3��8��Ifm����R�\n�L��b4٦�f�N9�2��!㍏�T�46��A3Oј���ˍ.	ZK!i��澅��K�{�x�MR��[v�Y�Ȋ�ݘusA\'d<JB�46��Z�R�H�HM�<�+ky���RƤ]����UW^k�(� _�?�1=���F*B2��n��\0u���p�m��X�{>�\\�/_�.��ڋtk��(O_RtT�ڱ��S��>�]Er�-��L�l�/թ �ǵ	���5��k�;T��x�s���o�_jf�\\�ec�Y\n�V<o5׻�䊫��ڐ8�Y&��5x~!%T#�Yu��F=�KNb��r��^��mۙȕ�5��{�\'����*�j�}qn�°6jj0)�-�|�\'=�������d��\rj��^դ����Ö,�o��A�#��:ƚS�k�CC���Jd�J�&���®�U��>�UyB�93)f��)(91�%C�Wp*2�G��s�;�e�T���DE�uM\\e%I!oYv������X2kf�l\'8K��\"��c_����ߜ�iSE$2�;������ă�lA�ə��#yRS!Q�j�gh8>ިo��6�Gf�,�.&�\Z���yF��yU�$�iGi���r��1��10ZY�6�֥\\���O�k��f���J(ꎢ/I2Wd}��#X�����e�@H���n���\Z*��r4e���t�(��Z�.��aPSR\n\n\"}hEћN��AH�Eb�!.1Fɑ�6ڙ�tKB�l����8G_�%���ƕ^i7:�ZQ����oyA\\�f�eYD#d�TUrRB���M�LF��-�J�+��:K�#Y���W�����U��i�Lo&��2���F۬IGm6������1|�d����OBO�n.y~sB?&�݉~[rsn��-覐^��E�.�$Dq��I����H�-�����FDa�&Hi��c&y	���j�)�%c�o����!���=�3W\r��tH�� �CW�ˠ�8ꛇzRn�i�����=B���V!A�mδ�S��4 M�n�H��l�7h#k�7l��&\Z,���5oVyJ�0�v}\\z��O�E�<��:���ռB��5�����R<E��3��^F��Na��5��g�m��I0LRq�\\0\Z��3�\'6u�\'֟���\"*��XC�yS٭��C�4����^�# �Ğ_ʶ�D�|z|ܳ����9������SJy�.��ϲ�5���u�ܹ&k���~���!��u�Ʌ�E��f_r��Ĺ��M<�g���6���\n��Qñ��/����\\W�9�#Rө}��$A�7*oωc�.w���+�$֘2�hE���=��F���sRMH���ɇI��]��|�f&��^��\0r�ng�.��/�G3�֩	/ʾ�>6��_^`ۢ����_�N�_�Ls�K=#ñ\nV�G �[�G\0��\'�x�VE��,�\\�ּ��\"�G#��\"~КuƔğ\"G�Qr\0!�k��P�r[7�^ې6�]\'�f���8� �T�rS_�7x�~��VYfHQ�Y����MG��xx�� 7y��Ko���	�I7u����-�����\r�h�hT�<ղ|I}�/z&>R��IVՃћ�hԑ�F\\5p���7��vJL�Y��}��i�%h���}�e��(�\r�6ޘ[s6���ܤ�xb�8u�ec6od���g9Hz3����3�,4��OHU �s�}ڶ�(xa�Գd�A��&\'�S#]�lDx�\r�w��=}q~rqQ�Yh��i���N�N���l��g���\rm��*�E����|#��\Z�M�x]�,��o�b(�-��k��X�)���\" ��Eb���\ry� q�\ZqW%��K�%���L\n7h�.��S�z��-mY��FۉP�C��kÂ�蓒�+���Z\\\"�)t�\Z,\ZZW��OK�}i6!���䧸;u%�qǥҰ�t�y��U~�\r��w]~�L%�}@^d���Z�s��~2�6Y�KU��m\\AD�,ƒ!.��x�bY�f�����J䨀��n��K��q�������jy�ֳ�U���6wxfI,F�_#if)i�K\"}Bn �l��võK���1bH�\n2�>B��H\"b\'Q��[ak6rJۓTT%�?L��\0��P��[�r�nX	N�y㪇ۖ\\��B%S�GfQ��&f-8�+!��2H�\0	u?�f�9jb[���iAOKj���\'ʣ�3%�E;$⯊����A�T��̽�nY��C\Z��L�ڴ>�^�?��v,��b$wmEa�~Mr.&͢��*�/�q��\0Dy鎮i�фN���_���s6���}�U§�/�\"x����=R0|��_�^������]���2��g�+������z$���V|Bu��\0����w~�?im/&�6�]���W@�=)oL����M_�)/��p��ߚ׳i\"����4rP��IT��R���&�\0^��\0g��\"��Ǖ��\0�H}׎�˳:���5`�����޵��OY��U1�3�ںc�(Z!g�o�!(#d�N��.��k��4w�:/��2SS�h�$\'(�����\r1�����%��T�ܣc�q�8\\j����b�6ĕ�%����yf����e��:����k3-�]\r=)�y$+$}��f�i2JS!>���R�}h\\�66C��l���4ל>��̚�k����#Ir�@<�$]������t�a.�	�C��U�1j�ى�yf�� f�\0L��E��4��;<��Y}Ҏ��9����\"6n�����Y�ْ⊩�M<��\'i9�g����je��ni�\'M�Ѝw�)����N�@��P���ʴ�Dc_����GF��yf�\\ieR���j��{q��f�vqo�/���xL�\\�o%#���X�\'�� B\"�E`��c�1�Y�@ݗ3k�H�����۠�Qձ�weE��Bd�H�4.ϖ��aumO5�s3�U+\")G�I��p%Ѥ�\"����\"�$<��Wܢ$��|�Rі7�9�Bi�ʡP*�I�Ɗ�`��:iE�-�l�4T�>oF�F�t�yRt_�_�w�^���e�5�\'�\0S>ڛG�\n��&�1��՟�̷���T���*��Y�s��p{]��Z����3,\"�Z\r�X}KB�$%_n�J���=e�S��S�[�\ZPVH�TK���H@�4o\',D�ӳV}�˳-�J봻���[;�\\db�fl��:�Z�k�0yD�]-&�\0�ĳ�&|w�؅��\'���q)���hx��	��Y*���DzߺH�>q6Ҹ��30�PE�C�\Z�0�e�2VL�����Ql�	I7�#�iM\\�,g[�ԕj\Z-���i����~8��v̞��4-��L��ˬ+���5�ۃ�袣����]�kUQ�;U�-�S\0�t��e�ڪ�\r���&f��+RЙ\\����\nl ���i^�1u�.$�����\"A������OY�?�Ʀ��F�\'Xq�v\\s�f;7�\r�bo�+z&��>�fe�Y+̜�m�!=���q�zk]U�0��z)�晳�AF�IV�mH\\x�� ĳ�^\08�ڷE�@�α\ZG�eǥ�W�O���G|�l2��׭6�Zbe��ޘFY�H\\\r�^���j��,�Q��	◙;�$��q*���lh� mGǝ��Y���KtOC	&�Ͱ�r�\'��i�\"���yY�8���\0��o�͙yL�`750�+�\Z�	�R\r.Q�vxG٩3_QuD�\0q��՘˳�+.m��� �l��ï�2���7�MDFft��\Z��?<^}k=�a�lʅP�&�е�!��zfz�u�f���� �oe��8�M���W��.Mړ�h*�q:ԗ�;\r�}��<�4��ї��PEA\03J-!�is����a5�	�I�`Pd�4L��\"�N\rG��@{�D{��E�[�hЕ��$3���ok�\ZU�{*Йl��!f\\A�TF�!�7*�_s�#!�ϸ�4�D���\"���}��mj5���v�\\*�\ZnV꡷��R�`_p�D=#��J�T�\0����\"\"\"&�L�\"�3J���\"6҈�;&]�2�s��PC:�k6�n�Vn�}�WU�!b�� �\" �\n���V L0�G�\\���_nb�c��ݗ$,Mg\\m>��2@&C��9��p;T�2�|Hf�e��н2C��-:��^���!ܦg���ȓX8<`�?�9���<웈ঔ!!u�!Q����-!Y�dI�TQL�C�����)I�lٝ��$iUw8<C�\'�>�:�J�7=*m%J$�Z���(K߻��VM��d�}��h6��K�%�\'8;��2��I�Ⱦ���xyK���o�cx%^�<^\r�Q�����I�+R�,�&Dl�_�����F��[\Z�,��\\%�y�*D|}�8�T��z2L��s�9s�z�y�F�Ze�!qQu�`�b��R0�*��Yy�M	=Uˮ����E�\Z�oF����R��k�l�2N��ˠr�x�V�\0f\nJA�!����x���n�&��[�;�-�!��k�X��\0Z�z(fM�T�����Ui930�/��HE��P��\0������%J�i�C�Б���y�w�ݮīM��$�����\0l}؊a��~̵���e�f�Yw\Z1Mk���z4�}���>Q��\r�ȃ�֥�&�_��^��x����f��+�����#�|��u\\�ti2દ�1\Z?�\\����|�r�1h�Y媐�U�J<��S3Pw;\"��E0b��2j	�t�я�L*��S�M��Z)\'YyQ5fB��*g��YF����Q8�IuE�6t�(�\0�g��6\\��eA�DSAu̶�s��>R����\Z�e��S-+��!�q������	��\"�G	hW�hS�k���x�e�K2U�Fm��ri��he�=N�e�#�ؚ��SB�B�_7�~��Է7��\0�c�ԋ�}��	We�2��.�̏c�	�m��Z`[##We�RDy�����X8U?>�>���#\'_�Y�dx������=fA�Cm�����K���6�Z<:G�\"���˦�-��@��m��Jfe��JR-�.����]�`�*��t� �\" �� B�(�b��1.Ɲ�4K��q7�Cͱ��x�u��E֋F�+��Awk2M\\�e�\"Z��r��S6ȿ��3�6���v�i�Q�M3G٤������<^�\"\'��)TE/���[���W�r�uGin]�*=�R�}.K]x{��.1U��v�ݿ�m�ŭb��$�K������Ƹ�\Z�ye-�if�V\'Yj`y��.�����l����1GOa�%KO�B�e�0�uh?���������(��+��)�n���d桞��?s��65C��Z����o<�e��S�xZ��Ei���u[�l\n���(˶���6�	�ɩ�����b]����9�r\'�J�8�\0D��M���Rs.���`�,�Ha�&�h�k`��(�؊�󴥤Z��!y�&� R*�	��6����X*\ZO��T��è+��żz���q�I��\06��e�@��ҦZ3\"�>�B��%�ė��Ir�9]��E�h��Eo��â9���G���aZ��  �DfWG�S��ިɲqfy���Q�9��q�\Zh֑�4���H��Jr�����u��Wڑ)![C�fX�&P,��e\n�%a����\nN%��R�/H�0�^p��lI���P�m�\'SFTp	Q�u7i�M��M��SITN:C�|E�X��4�ٴ�g�K�?��	<BTW�:Gq!r��D2���3��N���@ng�L�RE�\Zj�7za��ȿ0�Nd;n\0l�Ǣ��K�l[Sꬲ���&Zˡ�2�����\\$��DQq�֯�����{b>\'�H\"�*8�Y�\0�]����G=Qe-}�0,j��c�˙i���,�W�QǄsWݥ�Gw�$�rh|��]��E�>�m�p���v�qiEWb]�*<C��V`B��әj�2鵚��/��F�,&��<��e��Ū������\0)��������m9��@yhD[e_,1��v�DDDD�7$d�9M��̬�.�gU� �h� B �� �\" ��e�+)�\r�r�C����B!�N�q�H\"�G�7��\\�lmgH�_\0\Z�\nY�$\\�n��	�}q6���73���/�T8���:j�\"x1�w�B�� \r9�����(�-t�\r�{���g/���(ߔ%�	�\n�G���d��JG2�1��u��Oʺ��l ����nT�R]ҌTŢ�l�,��x�M���4�q\"T%�tD�lq�l�\r�E�{l�W{��=�c� ��l����a%Gم�C��ٻs.9*�O!�(�=,JbT�5@|Q�d]�۠�R�<�-��LL\rDT�:f(,f�)��sU)�\"UӕU��8���:ɧE�EOX�U1�.��g&?\n�%�!\'G���2�r򌈲��j@Ј���\nE(���y>�4���EJ����)��{�Hxb3��q-�_�T\'�C!�UC�\Z.�l�+\Z�4���h%���w�#m�Ir��+����|�!�>S�ͽ��M�gN��0�r���ujraG�x�\\B�\'�d*�qكU̳*��\\����}��@�b�����o� @\"�\"R��*�@m�e&�k�F�i.��bXie�i=tD���/�7yEb����B,-fT�+�t� �\" �� B�U�\0l_�@�H���+��=�L@�g����b�@�U�T�Q~pA������Dݹ2��\"�L�]^�R�8��w~*�`}���j��#�}I>gU��^��\"䈉��Q�3\"��	/�(���X�ݸ,��M�e���_��� �qu�mPA!Z��[�� �\n�X	b�@�jW�\0��!V ���','987',4,2,'logo.gif'),(4,'2013-11-27 00:00:00','GIF89a\0 \0�\0\0x\\:IFIYZ]iYFs[Gg[Zbbbgfeiddfhmlkjcm`pkh`iqtutwt{ywy}}}�w�j-�h3�o9�w8�y4��{N�gR�yZ�zl�~w��;ʃ$ʈ.Ӈ!ܓ*Ŏ3Џ4˓;ۘ6�/�.�)�<�6�5�:�5�<��R��D��G��K��P��l��n��{��y��|��b��d��t��ǛMÖU�@�CڧGݴKΡZܥYϰWԴV�A�B�J�J�C��D�B�D�I�L�E�N�M�]�\\�\\�T�^�Y̩h߮iܼlťsˮqЫzۼr�l�i��Z��\\��V��d��c��k��g��k��}��|��u��{��r��t��s��y��|��~|u������������������������������������������������������������������������������������������������������������������ո����ڻ�廍鿐ƺ��ɝ�ȏ�Ɔ�׈�ɝ�͕�ל�������������������ۦ����֧�ت�ӹ�����𷛡���Ɵ�ث�Ų�ľ����˨�����ýɺ�ȴ�Ӫ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�	\0\0�\0,\0\0\0\0\0 \0\0�\0�	���/I�.U���^��#�Ǎ�/iϰes&m��i��#��D��8+��\0,xШ0B�^��\"�6c�$IӯM���hW�.NZx�����\nةK�\rR�L����ȑ\r&+���h��y~e�$,[�P�����c -��z8_�?���{.��R���2�*�#; X4��s�>g�����l(T����r�\r]>�����|��i�5��Z�̕j!�H�F��`�����c&�.�r�A�B�\r]�4�Р��J!���n�Aw:�iE��~�l�*K�(X\\��g̨�$��I�ȱ&T����*P�@=�Q��1�D�G`�QG(81+��q�\'���;�� �D�N9ć�\nQ��\n,t�!I�B�@�`�K\"c�;��!�O�1�e$!A>��:�(c	3��s�(U�qF���AF\ZM��=D�O5�l��6�Pr	f�A\ZGLP�*Q���D�u�Dp��`R�V,1\0����\Z+�`��D�O=�C&3��\"@�?���K�`��$P;�d2�<��@����)B 1�!��O2�@��%x;����jx���\0�� �\0rD��FHXq�(����6�H�H��)j�G��2�`�%H4\n-�0Q��Tی0�Hr�u��m@��֓N2�0r��l�MqX�p3�$	5�T(���զ3	6�l�D����1P-:Ԅ�7��&�h���̸��5�$P��ك4���\0�p�Ӈx7?\0;','111',8,2,'footer.jpeg'),(5,'2014-01-10 00:00:00','����\0JFIF\0\0`\0`\0\0��\0Exif\0\0II*\0\0\0\0\0\0\0\0\0\0��\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342��\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0\0B\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��(��\n(��\n(�&G�\0�����ڥ��Xس��\0r��o����M&ݑ2���e�Z�w��Y�g���N��E�¨�C��~�h�9���\0���ջM2��*���c,�S��4���朾o_�+�\0j�N1k��ó�0�O��~�C�O�����BX�lq�VȉGl�����~��\0��s��I��U�c�Q�����u}|���b�SUd�d�=7��Y�ͦx��o����?��c���l<o-�����.q�~�wG��F��lm�K�PA8���i*u�V���Bxh:��������;ȥI�20 �\"��S�2ϡA�HA>��WS��I8�;�T���>��袊�@��(\0��L�\0�_��=�|)>�g�\\,3̯$��W�Az���U���v�����j�&�H��J�0 �;g�?����\0n-!%�M�x���\0�1��6��ß<�PC�N�7p���$UF.RQ[�g8�.r�K�Zԍv4�3k^�YO+����\n���QZ#Hs$��3��}ϧ�J�l��O���A)��{�1��T���+ʴߋ^8s=�wm{s4{al���|�*���x�*��Ǧ�ft�EU��o%�g��W�N��\rZ��/\ZO%��L��(��\n���uxeo57F��]r��`t⼟�ڦ��|���d�Kê�e��,����cƱxVKo\r�4V�;�5������&�:O�r\r.k��|Jյ]Y�]j��%�/̠6GU8���~*�:.�t-�+���J!��U#��hڷZZ�j���<;,z���$�2��HU������{O�>#i�-�[�Xfu\"HT���i�.N�Wd�q�y���YR4/#U,N\0�+��/�u���ma$�=Z���uO�[#[i�����������J�\n���\"z�]�K\n����.ާ�Q�\Z�#�:��K���4����%\\�;R\0\0��W���=H�EYQH���(\0���1�YOs#m�$.���*�\\/ŝW�+�֨��d�An���B��ww�@9��ͷ�\'Q�z�0�̛ܽWq�r��\0�m�$��� ǫ�;i�T�ț|m�Ai����񮤞(`*�a*	c���V��_��С�l纔�r	�H\0��\0w�)��jk�i���N[5c�o_k:t��r�N#`zeJ��G�-��\0�ۂG?xU�Z���0�%vo�i��2,6�G�X_\r,\'�u˘��c�|��CҺkN�z�Q�o��Ç�_FQ��o��Q��\0�?��?�`��\0�rS�x,�_�n�\0ι��N��xn��L���U_1����#ڛ���6��_�g}�\0h�B2%�A���5�V��\\�RU!�8��=���?�Q�ˏA��½{�Zǂ|52��:]�ޱ ,in�)�Ff#��\\��\Z��^��+���cy]�����u��k�����cya�P>dg��7�1�\n�r׍<_�x�N�k�),���0��%�������G��5_%��8O{��-��z?�4�7G�C��+.�)Tu�^��3�D�\'���\0Ҫ%x�T�\Z��WG��i�� T@\0�\0�W���Z*J�EP0��(\0��(J��soas�͗�x�>j�������I�`q]gj��,���\\��q�<SI7���WG���+�<3��tF��\ZhT�e��`���\'�]S�v> �~˨hM%���M�F�`7�}�i�/,wh�D2��]�0]���Oj�t�Xnf�P�06�\0��g���\0aW��������_�q��@��;]\r`�R\r�0۷c�F~`@##�^�Q���u)�,<>���� -�/�n~V����i&��lC�bP9f�v�Fj}CL�f�=��F�� �ry<��������~W����\"��[�_�D�Jd!��6� �Fk��z���y�6���\0���쏙���^�}��wv��� Ml��`�;b�t�i�/*����\0.w�קg�=����o�g�Sþ�#O�>��HT��1l	>m����=�T�A/�|E��.��$�Gr`�ی3($�2�\\��]����mꓴ$9���===�I��R[{p.�Yb%��?9��`c�Z=�������5�?�X�d<9n�PL�X3Jv\0\n����\'�/ֽ+�vv\Z|�Zi�\0`���\r���A��E�e�p�8*:q����zV���o$Y%�%���($��eB����F�QY��Q@Q@Q@!��\0CER(4QLQE\0R�E ���`>�(��(��(���','798/89',9,3,'logo.jpg');
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Localidad`
--

DROP TABLE IF EXISTS `Localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Localidad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `provincia_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2FA590496844CE30` (`provincia_fk`),
  CONSTRAINT `FK2FA590496844CE30` FOREIGN KEY (`provincia_fk`) REFERENCES `Provincia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Localidad`
--

LOCK TABLES `Localidad` WRITE;
/*!40000 ALTER TABLE `Localidad` DISABLE KEYS */;
INSERT INTO `Localidad` VALUES (1,'Rio Grande',1),(2,'Ushuaia',1),(3,'Tolhuin',1);
/*!40000 ALTER TABLE `Localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductorEnEstablecimiento`
--

DROP TABLE IF EXISTS `ProductorEnEstablecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductorEnEstablecimiento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `productor_fk` bigint(20) DEFAULT NULL,
  `establecimiento_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK39D6938B936A5810` (`productor_fk`),
  KEY `FK39D6938B6FE43A90` (`establecimiento_fk`),
  CONSTRAINT `FK39D6938B6FE43A90` FOREIGN KEY (`establecimiento_fk`) REFERENCES `Establecimiento` (`id`),
  CONSTRAINT `FK39D6938B936A5810` FOREIGN KEY (`productor_fk`) REFERENCES `Entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductorEnEstablecimiento`
--

LOCK TABLES `ProductorEnEstablecimiento` WRITE;
/*!40000 ALTER TABLE `ProductorEnEstablecimiento` DISABLE KEYS */;
INSERT INTO `ProductorEnEstablecimiento` VALUES (1,2,1),(2,3,2),(3,2,2);
/*!40000 ALTER TABLE `ProductorEnEstablecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Denuncia`
--

DROP TABLE IF EXISTS `Denuncia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Denuncia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `desde` datetime NOT NULL,
  `hasta` datetime NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `numeroDeDenuncia` int(11) NOT NULL,
  `numeroDeLlamado` int(11) NOT NULL,
  `productor_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38FE9FB57C9761E7` (`productor_fk`),
  CONSTRAINT `FK38FE9FB57C9761E7` FOREIGN KEY (`productor_fk`) REFERENCES `Entidad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Denuncia`
--

LOCK TABLES `Denuncia` WRITE;
/*!40000 ALTER TABLE `Denuncia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Denuncia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DenunciaPerros`
--

DROP TABLE IF EXISTS `DenunciaPerros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DenunciaPerros` (
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
  CONSTRAINT `FKF65BC7AE7E6C07D8` FOREIGN KEY (`denuncia_fk`) REFERENCES `Denuncia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DenunciaPerros`
--

LOCK TABLES `DenunciaPerros` WRITE;
/*!40000 ALTER TABLE `DenunciaPerros` DISABLE KEYS */;
/*!40000 ALTER TABLE `DenunciaPerros` ENABLE KEYS */;
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
  CONSTRAINT `FKEFD1438369B6E3F0` FOREIGN KEY (`rol_fk`) REFERENCES `Rol` (`id`),
  CONSTRAINT `FKEFD14383EA23B717` FOREIGN KEY (`item_fk`) REFERENCES `ItemMenu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_item`
--

LOCK TABLES `rol_item` WRITE;
/*!40000 ALTER TABLE `rol_item` DISABLE KEYS */;
INSERT INTO `rol_item` VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51);
/*!40000 ALTER TABLE `rol_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VencimientoPeriodo`
--

DROP TABLE IF EXISTS `VencimientoPeriodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VencimientoPeriodo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `periodo_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC5E02298C9F7990` (`periodo_fk`),
  CONSTRAINT `FKC5E02298C9F7990` FOREIGN KEY (`periodo_fk`) REFERENCES `Periodo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VencimientoPeriodo`
--

LOCK TABLES `VencimientoPeriodo` WRITE;
/*!40000 ALTER TABLE `VencimientoPeriodo` DISABLE KEYS */;
INSERT INTO `VencimientoPeriodo` VALUES (1,'2013-07-10 00:00:00',3),(2,'2014-01-10 00:00:00',3),(3,'2013-08-10 00:00:00',3),(4,'2014-02-10 00:00:00',3),(5,'2013-09-10 00:00:00',3),(6,'2014-03-10 00:00:00',3),(7,'2013-10-10 00:00:00',3),(8,'2014-04-10 00:00:00',3),(9,'2013-11-11 00:00:00',3),(10,'2014-05-12 00:00:00',3),(11,'2013-12-10 00:00:00',3),(12,'2014-06-10 00:00:00',3),(13,'2012-07-10 00:00:00',4),(14,'2013-01-10 00:00:00',4),(15,'2012-08-10 00:00:00',4),(16,'2013-02-10 00:00:00',4),(17,'2012-09-10 00:00:00',4),(18,'2013-03-10 00:00:00',4),(19,'2012-10-10 00:00:00',4),(20,'2013-04-10 00:00:00',4),(21,'2012-11-10 00:00:00',4),(22,'2013-05-10 00:00:00',4),(23,'2012-12-10 00:00:00',4),(24,'2013-06-10 00:00:00',4);
/*!40000 ALTER TABLE `VencimientoPeriodo` ENABLE KEYS */;
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
  CONSTRAINT `FKFC3DF4D4809070B8` FOREIGN KEY (`autorizacion_fk`) REFERENCES `Autorizacion` (`id`),
  CONSTRAINT `FKFC3DF4D4F71B4101` FOREIGN KEY (`tipo_autorizacion_fk`) REFERENCES `TipoAutorizacion` (`id`)
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
-- Table structure for table `TipoDeDenuncia`
--

DROP TABLE IF EXISTS `TipoDeDenuncia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoDeDenuncia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoDeDenuncia`
--

LOCK TABLES `TipoDeDenuncia` WRITE;
/*!40000 ALTER TABLE `TipoDeDenuncia` DISABLE KEYS */;
INSERT INTO `TipoDeDenuncia` VALUES (1,'Presencia anormal de pájaros'),(2,'Huellas de perros'),(3,'Ladridos de perros'),(4,'Guanacos heridos'),(5,'Guanacos muertos');
/*!40000 ALTER TABLE `TipoDeDenuncia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `habilitado` bit(1) NOT NULL,
  `nombreUsuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol_fk` bigint(20) DEFAULT NULL,
  `entidad_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5B4D8B0E69B6E3F0` (`rol_fk`),
  KEY `FK5B4D8B0ECA405FB0` (`entidad_fk`),
  CONSTRAINT `FK5B4D8B0E69B6E3F0` FOREIGN KEY (`rol_fk`) REFERENCES `Rol` (`id`),
  CONSTRAINT `FK5B4D8B0ECA405FB0` FOREIGN KEY (`entidad_fk`) REFERENCES `Entidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'','g','g',2,1),(2,'','gg','gg',2,1);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reporte`
--

DROP TABLE IF EXISTS `Reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reporte` (
  `idReporte` bigint(20) NOT NULL AUTO_INCREMENT,
  `archivoReporte` mediumblob NOT NULL,
  `nombreReporte` varchar(255) NOT NULL,
  `nombreReportePadre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idReporte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reporte`
--

LOCK TABLES `Reporte` WRITE;
/*!40000 ALTER TABLE `Reporte` DISABLE KEYS */;
INSERT INTO `Reporte` VALUES (1,'��\0sr\0(net.sf.jasperreports.engine.JasperReport\0\0\0\0\0\0\'�\0L\0compileDatat\0Ljava/io/Serializable;L\0compileNameSuffixt\0Ljava/lang/String;L\0\rcompilerClassq\0~\0xr\0-net.sf.jasperreports.engine.base.JRBaseReport\0\0\0\0\0\0\'�\0*I\0PSEUDO_SERIAL_VERSION_UIDI\0bottomMarginI\0columnCountI\0\rcolumnSpacingI\0columnWidthZ\0ignorePaginationZ\0isFloatColumnFooterZ\0isSummaryNewPageZ\0 isSummaryWithPageHeaderAndFooterZ\0isTitleNewPageI\0\nleftMarginB\0orientationI\0\npageHeightI\0	pageWidthB\0\nprintOrderI\0rightMarginI\0	topMarginB\0whenNoDataTypeL\0\nbackgroundt\0$Lnet/sf/jasperreports/engine/JRBand;L\0columnDirectiont\03Lnet/sf/jasperreports/engine/type/RunDirectionEnum;L\0columnFooterq\0~\0L\0columnHeaderq\0~\0[\0datasetst\0([Lnet/sf/jasperreports/engine/JRDataset;L\0defaultStylet\0%Lnet/sf/jasperreports/engine/JRStyle;L\0detailq\0~\0L\0\rdetailSectiont\0\'Lnet/sf/jasperreports/engine/JRSection;L\0formatFactoryClassq\0~\0L\0\nimportsSett\0Ljava/util/Set;L\0languageq\0~\0L\0lastPageFooterq\0~\0L\0mainDatasett\0\'Lnet/sf/jasperreports/engine/JRDataset;L\0nameq\0~\0L\0noDataq\0~\0L\0orientationValuet\02Lnet/sf/jasperreports/engine/type/OrientationEnum;L\0\npageFooterq\0~\0L\0\npageHeaderq\0~\0L\0printOrderValuet\01Lnet/sf/jasperreports/engine/type/PrintOrderEnum;[\0stylest\0&[Lnet/sf/jasperreports/engine/JRStyle;L\0summaryq\0~\0[\0	templatest\0/[Lnet/sf/jasperreports/engine/JRReportTemplate;L\0titleq\0~\0L\0whenNoDataTypeValuet\05Lnet/sf/jasperreports/engine/type/WhenNoDataTypeEnum;xp\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\0\0S\0\0\0\0\0\0\0.\0sr\0+net.sf.jasperreports.engine.base.JRBaseBand\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDI\0heightZ\0isSplitAllowedL\0printWhenExpressiont\0*Lnet/sf/jasperreports/engine/JRExpression;L\0	splitTypet\0Ljava/lang/Byte;L\0splitTypeValuet\00Lnet/sf/jasperreports/engine/type/SplitTypeEnum;xr\03net.sf.jasperreports.engine.base.JRBaseElementGroup\0\0\0\0\0\0\'�\0L\0childrent\0Ljava/util/List;L\0elementGroupt\0,Lnet/sf/jasperreports/engine/JRElementGroup;xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0pp~r\0.net.sf.jasperreports.engine.type.SplitTypeEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0STRETCH~r\01net.sf.jasperreports.engine.type.RunDirectionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0LTRsq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0ppq\0~\0sq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0ppq\0~\0pppsr\0.net.sf.jasperreports.engine.base.JRBaseSection\0\0\0\0\0\0\'�\0[\0bandst\0%[Lnet/sf/jasperreports/engine/JRBand;xpur\0%[Lnet.sf.jasperreports.engine.JRBand;��~�ʅ5\0\0xp\0\0\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsr\0,net.sf.jasperreports.engine.base.JRBaseImage\0\0\0\0\0\0\'�\0*I\0PSEUDO_SERIAL_VERSION_UIDI\0\rbookmarkLevelB\0evaluationTimeB\0hyperlinkTargetB\0\rhyperlinkTypeZ\0isLazyB\0onErrorTypeL\0anchorNameExpressionq\0~\0L\0borderq\0~\0L\0borderColort\0Ljava/awt/Color;L\0bottomBorderq\0~\0L\0bottomBorderColorq\0~\0.L\0\rbottomPaddingt\0Ljava/lang/Integer;L\0evaluationGroupt\0%Lnet/sf/jasperreports/engine/JRGroup;L\0evaluationTimeValuet\05Lnet/sf/jasperreports/engine/type/EvaluationTimeEnum;L\0\nexpressionq\0~\0L\0horizontalAlignmentq\0~\0L\0horizontalAlignmentValuet\06Lnet/sf/jasperreports/engine/type/HorizontalAlignEnum;L\0hyperlinkAnchorExpressionq\0~\0L\0hyperlinkPageExpressionq\0~\0[\0hyperlinkParameterst\03[Lnet/sf/jasperreports/engine/JRHyperlinkParameter;L\0hyperlinkReferenceExpressionq\0~\0L\0\ZhyperlinkTooltipExpressionq\0~\0L\0isUsingCachet\0Ljava/lang/Boolean;L\0\nleftBorderq\0~\0L\0leftBorderColorq\0~\0.L\0leftPaddingq\0~\0/L\0lineBoxt\0\'Lnet/sf/jasperreports/engine/JRLineBox;L\0\nlinkTargetq\0~\0L\0linkTypeq\0~\0L\0onErrorTypeValuet\02Lnet/sf/jasperreports/engine/type/OnErrorTypeEnum;L\0paddingq\0~\0/L\0rightBorderq\0~\0L\0rightBorderColorq\0~\0.L\0rightPaddingq\0~\0/L\0\nscaleImageq\0~\0L\0scaleImageValuet\01Lnet/sf/jasperreports/engine/type/ScaleImageEnum;L\0	topBorderq\0~\0L\0topBorderColorq\0~\0.L\0\ntopPaddingq\0~\0/L\0verticalAlignmentq\0~\0L\0verticalAlignmentValuet\04Lnet/sf/jasperreports/engine/type/VerticalAlignEnum;xr\05net.sf.jasperreports.engine.base.JRBaseGraphicElement\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDL\0fillq\0~\0L\0	fillValuet\0+Lnet/sf/jasperreports/engine/type/FillEnum;L\0linePent\0#Lnet/sf/jasperreports/engine/JRPen;L\0penq\0~\0xr\0.net.sf.jasperreports.engine.base.JRBaseElement\0\0\0\0\0\0\'�\0\ZI\0PSEUDO_SERIAL_VERSION_UIDI\0heightZ\0isPrintInFirstWholeBandZ\0isPrintRepeatedValuesZ\0\ZisPrintWhenDetailOverflowsZ\0isRemoveLineWhenBlankB\0positionTypeB\0stretchTypeI\0widthI\0xI\0yL\0	backcolorq\0~\0.L\0defaultStyleProvidert\04Lnet/sf/jasperreports/engine/JRDefaultStyleProvider;L\0elementGroupq\0~\0L\0	forecolorq\0~\0.L\0keyq\0~\0L\0modeq\0~\0L\0	modeValuet\0+Lnet/sf/jasperreports/engine/type/ModeEnum;L\0parentStyleq\0~\0L\0parentStyleNameReferenceq\0~\0L\0positionTypeValuet\03Lnet/sf/jasperreports/engine/type/PositionTypeEnum;L\0printWhenExpressionq\0~\0L\0printWhenGroupChangesq\0~\00L\0\rpropertiesMapt\0-Lnet/sf/jasperreports/engine/JRPropertiesMap;[\0propertyExpressionst\03[Lnet/sf/jasperreports/engine/JRPropertyExpression;L\0stretchTypeValuet\02Lnet/sf/jasperreports/engine/type/StretchTypeEnum;xp\0\0��\0\0\0\0\0\0\0\0\0\0\0k\0\0�\0\0\0pq\0~\0q\0~\0+pppppp~r\01net.sf.jasperreports.engine.type.PositionTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0FIX_RELATIVE_TO_TOPpppp~r\00net.sf.jasperreports.engine.type.StretchTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\nNO_STRETCH\0\0w�ppsr\0*net.sf.jasperreports.engine.base.JRBasePen\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDL\0	lineColorq\0~\0.L\0	lineStyleq\0~\0L\0lineStyleValuet\00Lnet/sf/jasperreports/engine/type/LineStyleEnum;L\0	lineWidtht\0Ljava/lang/Float;L\0penContainert\0,Lnet/sf/jasperreports/engine/JRPenContainer;xp\0\0��ppppq\0~\0Cp\0\0��\0\0\0\0\0\0\0\0\0ppppppp~r\03net.sf.jasperreports.engine.type.EvaluationTimeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NOWsr\01net.sf.jasperreports.engine.base.JRBaseExpression\0\0\0\0\0\0\'�\0I\0id[\0chunkst\00[Lnet/sf/jasperreports/engine/JRExpressionChunk;L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xp\0\0\0ur\00[Lnet.sf.jasperreports.engine.JRExpressionChunk;mY��iK�U\0\0xp\0\0\0sr\06net.sf.jasperreports.engine.base.JRBaseExpressionChunk\0\0\0\0\0\0\'�\0B\0typeL\0textq\0~\0xpt\0imagenppp~r\04net.sf.jasperreports.engine.type.HorizontalAlignEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0CENTERpppppppppsr\0.net.sf.jasperreports.engine.base.JRBaseLineBox\0\0\0\0\0\0\'�\0L\0\rbottomPaddingq\0~\0/L\0	bottomPent\0+Lnet/sf/jasperreports/engine/base/JRBoxPen;L\0boxContainert\0,Lnet/sf/jasperreports/engine/JRBoxContainer;L\0leftPaddingq\0~\0/L\0leftPenq\0~\0^L\0paddingq\0~\0/L\0penq\0~\0^L\0rightPaddingq\0~\0/L\0rightPenq\0~\0^L\0\ntopPaddingq\0~\0/L\0topPenq\0~\0^xppsr\03net.sf.jasperreports.engine.base.JRBaseBoxBottomPen\0\0\0\0\0\0\'�\0\0xr\0-net.sf.jasperreports.engine.base.JRBaseBoxPen\0\0\0\0\0\0\'�\0L\0lineBoxq\0~\05xq\0~\0J\0\0��sr\0java.awt.Color���3u\0F\0falphaI\0valueL\0cst\0Ljava/awt/color/ColorSpace;[\0	frgbvaluet\0[F[\0fvalueq\0~\0fxp\0\0\0\0����pppppsr\0java.lang.Float��ɢ�<��\0F\0valuexr\0java.lang.Number������\0\0xp>�\0\0q\0~\0`q\0~\0`q\0~\0Cpsr\01net.sf.jasperreports.engine.base.JRBaseBoxLeftPen\0\0\0\0\0\0\'�\0\0xq\0~\0b\0\0��ppppq\0~\0`q\0~\0`psq\0~\0b\0\0��ppppq\0~\0`q\0~\0`psr\02net.sf.jasperreports.engine.base.JRBaseBoxRightPen\0\0\0\0\0\0\'�\0\0xq\0~\0b\0\0��ppppq\0~\0`q\0~\0`psr\00net.sf.jasperreports.engine.base.JRBaseBoxTopPen\0\0\0\0\0\0\'�\0\0xq\0~\0b\0\0��ppppq\0~\0`q\0~\0`pp~r\00net.sf.jasperreports.engine.type.OnErrorTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ERRORpppppppppp~r\02net.sf.jasperreports.engine.type.VerticalAlignEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0MIDDLEsr\00net.sf.jasperreports.engine.base.JRBaseTextField\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDI\0\rbookmarkLevelB\0evaluationTimeB\0hyperlinkTargetB\0\rhyperlinkTypeZ\0isStretchWithOverflowL\0anchorNameExpressionq\0~\0L\0evaluationGroupq\0~\00L\0evaluationTimeValueq\0~\01L\0\nexpressionq\0~\0L\0hyperlinkAnchorExpressionq\0~\0L\0hyperlinkPageExpressionq\0~\0[\0hyperlinkParametersq\0~\03L\0hyperlinkReferenceExpressionq\0~\0L\0\ZhyperlinkTooltipExpressionq\0~\0L\0isBlankWhenNullq\0~\04L\0\nlinkTargetq\0~\0L\0linkTypeq\0~\0L\0patternq\0~\0L\0patternExpressionq\0~\0xr\02net.sf.jasperreports.engine.base.JRBaseTextElement\0\0\0\0\0\0\'�\0%I\0PSEUDO_SERIAL_VERSION_UIDL\0borderq\0~\0L\0borderColorq\0~\0.L\0bottomBorderq\0~\0L\0bottomBorderColorq\0~\0.L\0\rbottomPaddingq\0~\0/L\0fontNameq\0~\0L\0fontSizeq\0~\0/L\0horizontalAlignmentq\0~\0L\0horizontalAlignmentValueq\0~\02L\0isBoldq\0~\04L\0isItalicq\0~\04L\0\risPdfEmbeddedq\0~\04L\0isStrikeThroughq\0~\04L\0isStyledTextq\0~\04L\0isUnderlineq\0~\04L\0\nleftBorderq\0~\0L\0leftBorderColorq\0~\0.L\0leftPaddingq\0~\0/L\0lineBoxq\0~\05L\0lineSpacingq\0~\0L\0lineSpacingValuet\02Lnet/sf/jasperreports/engine/type/LineSpacingEnum;L\0markupq\0~\0L\0paddingq\0~\0/L\0	paragrapht\0)Lnet/sf/jasperreports/engine/JRParagraph;L\0pdfEncodingq\0~\0L\0pdfFontNameq\0~\0L\0rightBorderq\0~\0L\0rightBorderColorq\0~\0.L\0rightPaddingq\0~\0/L\0rotationq\0~\0L\0\rrotationValuet\0/Lnet/sf/jasperreports/engine/type/RotationEnum;L\0	topBorderq\0~\0L\0topBorderColorq\0~\0.L\0\ntopPaddingq\0~\0/L\0verticalAlignmentq\0~\0L\0verticalAlignmentValueq\0~\08xq\0~\0<\0\0��\0\0\0\0\0\0\0\0\0\0\0E\0\0\0\0\0\0sq\0~\0d\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0d\0\0\0\0�\0\0\0pppt\0textField-15p~r\0)net.sf.jasperreports.engine.type.ModeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0TRANSPARENTppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialsr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0i\0\0\0pq\0~\0[sr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0q\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0����pppp~r\0.net.sf.jasperreports.engine.type.LineStyleEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SOLIDsq\0~\0h>�\0\0q\0~\0�q\0~\0�q\0~\0}psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�psq\0~\0b\0\0��ppppq\0~\0�q\0~\0�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�ppppsr\00net.sf.jasperreports.engine.base.JRBaseParagraph\0\0\0\0\0\0\'�\0\nL\0firstLineIndentq\0~\0/L\0\nleftIndentq\0~\0/L\0lineSpacingq\0~\0zL\0lineSpacingSizeq\0~\0LL\0paragraphContainert\02Lnet/sf/jasperreports/engine/JRParagraphContainer;L\0rightIndentq\0~\0/L\0spacingAfterq\0~\0/L\0\rspacingBeforeq\0~\0/L\0tabStopWidthq\0~\0/L\0tabStopsq\0~\0xppp~r\00net.sf.jasperreports.engine.type.LineSpacingEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SINGLEpq\0~\0}pppppt\0Cp1252t\0	Helveticapppp~r\0-net.sf.jasperreports.engine.type.RotationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NONEppppq\0~\0v\0\0��\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0tipopppppppq\0~\0�ppt\0\0psq\0~\0x\0\0��\0\0\0\0\0\0\0\0\0\0\0b\0\0\0�\0\0\0\0sq\0~\0d\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0d\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0�ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�pq\0~\0[q\0~\0�q\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0����ppppq\0~\0�sq\0~\0h>�\0\0q\0~\0�q\0~\0�q\0~\0�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�psq\0~\0b\0\0��ppppq\0~\0�q\0~\0�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�ppppsq\0~\0�ppq\0~\0�pq\0~\0�pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0v\0\0��\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0fechaVencimientopppppppq\0~\0�ppt\0\ndd/MM/yyyypsq\0~\0x\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0sq\0~\0d\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0d\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0�ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�pq\0~\0[q\0~\0�q\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0����ppppq\0~\0�sq\0~\0h>�\0\0q\0~\0�q\0~\0�q\0~\0�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�psq\0~\0b\0\0��ppppq\0~\0�q\0~\0�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�ppppsq\0~\0�ppq\0~\0�pq\0~\0�pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0v\0\0��\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0nombrepppppppq\0~\0�ppq\0~\0�psq\0~\0x\0\0��\0\0\0\0\0\0\0\0\0\0\0e\0\0G\0\0\0\0sq\0~\0d\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0d\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0�ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�pq\0~\0[q\0~\0�q\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0����ppppq\0~\0�sq\0~\0h>�\0\0q\0~\0�q\0~\0�q\0~\0�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�psq\0~\0b\0\0��ppppq\0~\0�q\0~\0�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\0�q\0~\0�ppppsq\0~\0�ppq\0~\0�pq\0~\0�pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0v\0\0��\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0numeropppppppq\0~\0�ppq\0~\0�pxp\0\0��\0\0\0ppq\0~\0psr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0\"net.sf.jasperreports.engine.data.*t\0net.sf.jasperreports.engine.*t\0java.util.*xt\0javapsr\0.net.sf.jasperreports.engine.base.JRBaseDataset\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDZ\0isMainB\0whenResourceMissingType[\0fieldst\0&[Lnet/sf/jasperreports/engine/JRField;L\0filterExpressionq\0~\0[\0groupst\0&[Lnet/sf/jasperreports/engine/JRGroup;L\0nameq\0~\0[\0\nparameterst\0*[Lnet/sf/jasperreports/engine/JRParameter;L\0\rpropertiesMapq\0~\0@L\0queryt\0%Lnet/sf/jasperreports/engine/JRQuery;L\0resourceBundleq\0~\0L\0scriptletClassq\0~\0[\0\nscriptletst\0*[Lnet/sf/jasperreports/engine/JRScriptlet;[\0\nsortFieldst\0*[Lnet/sf/jasperreports/engine/JRSortField;[\0	variablest\0)[Lnet/sf/jasperreports/engine/JRVariable;L\0whenResourceMissingTypeValuet\0>Lnet/sf/jasperreports/engine/type/WhenResourceMissingTypeEnum;xp\0\0��\0ur\0&[Lnet.sf.jasperreports.engine.JRField;<��N*�p\0\0xp\0\0\0sr\0,net.sf.jasperreports.engine.base.JRBaseField\0\0\0\0\0\0\'�\0L\0descriptionq\0~\0L\0nameq\0~\0L\0\rpropertiesMapq\0~\0@L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xppt\0idsr\0+net.sf.jasperreports.engine.JRPropertiesMap\0\0\0\0\0\0\'�\0L\0baseq\0~\0@L\0propertiesListq\0~\0L\0\rpropertiesMapt\0Ljava/util/Map;xppppt\0java.lang.Longpsq\0~pt\0nombresq\0~pppt\0java.lang.Stringpsq\0~pt\0fechaVencimientosq\0~pppt\0java.sql.Timestamppsq\0~pt\0numerosq\0~pppt\0java.lang.Stringpsq\0~pt\0tiposq\0~pppt\0java.lang.Stringpsq\0~pt\0imagensq\0~pppt\0java.io.InputStreamppur\0&[Lnet.sf.jasperreports.engine.JRGroup;@�_zL�x�\0\0xp\0\0\0sr\0,net.sf.jasperreports.engine.base.JRBaseGroup\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDB\0footerPositionZ\0isReprintHeaderOnEachPageZ\0isResetPageNumberZ\0isStartNewColumnZ\0isStartNewPageZ\0keepTogetherI\0minHeightToStartNewPageL\0\rcountVariablet\0(Lnet/sf/jasperreports/engine/JRVariable;L\0\nexpressionq\0~\0L\0footerPositionValuet\05Lnet/sf/jasperreports/engine/type/FooterPositionEnum;L\0groupFooterq\0~\0L\0groupFooterSectionq\0~\0L\0groupHeaderq\0~\0L\0groupHeaderSectionq\0~\0L\0nameq\0~\0xp\0\0��\0\0\0\0\0\0\0\0\0\0sr\0/net.sf.jasperreports.engine.base.JRBaseVariable\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDB\0calculationB\0\rincrementTypeZ\0isSystemDefinedB\0	resetTypeL\0calculationValuet\02Lnet/sf/jasperreports/engine/type/CalculationEnum;L\0\nexpressionq\0~\0L\0incrementGroupq\0~\00L\0incrementTypeValuet\04Lnet/sf/jasperreports/engine/type/IncrementTypeEnum;L\0incrementerFactoryClassNameq\0~\0L\0incrementerFactoryClassRealNameq\0~\0L\0initialValueExpressionq\0~\0L\0nameq\0~\0L\0\nresetGroupq\0~\00L\0resetTypeValuet\00Lnet/sf/jasperreports/engine/type/ResetTypeEnum;L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xp\0\0w�\0\0\0~r\00net.sf.jasperreports.engine.type.CalculationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0COUNTsq\0~\0R\0\0\0	uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)ppp~r\02net.sf.jasperreports.engine.type.IncrementTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NONEppsq\0~\0R\0\0\0\nuq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(0)ppt\0group1_COUNTq\0~+~r\0.net.sf.jasperreports.engine.type.ResetTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0GROUPt\0java.lang.Integerpsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0nullpp~r\03net.sf.jasperreports.engine.type.FooterPositionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NORMALpsq\0~\0&uq\0~\0)\0\0\0sq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0%sq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new Boolean(sq\0~\0Wt\0nombresq\0~\0Wt\0	 != null)pppq\0~\0psq\0~\0&uq\0~\0)\0\0\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsr\01net.sf.jasperreports.engine.base.JRBaseStaticText\0\0\0\0\0\0\'�\0L\0textq\0~\0xq\0~\0y\0\0��\0\0\0\0\0\0\0\0\0\0\0c\0\0\0k\0\0\0sq\0~\0d\0\0\0\0�xxxpppq\0~\0q\0~Ysq\0~\0d\0\0\0\0����pppt\0\rstaticText-18p~q\0~\0�t\0OPAQUEppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�pq\0~\0[sq\0~\0�q\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?�\0\0q\0~dq\0~dq\0~\\psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?�\0\0q\0~dq\0~dpsq\0~\0b\0\0��ppppq\0~dq\0~dpsq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h>L��q\0~dq\0~dpsq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?�\0\0q\0~dq\0~dppppsq\0~\0�ppq\0~\0�pq\0~\\pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0vt\0	Productorsq\0~\0x\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0sq\0~\0d\0\0\0\0����pppq\0~\0q\0~Ysq\0~\0d\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0�ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialsq\0~\0�\0\0\0\npq\0~\0[q\0~cq\0~cq\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?�\0\0q\0~|q\0~|q\0~vpsq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~|q\0~|psq\0~\0b\0\0��ppppq\0~|q\0~|psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?�\0\0q\0~|q\0~|psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?�\0\0q\0~|q\0~|ppppsq\0~\0�ppq\0~\0�pq\0~vpppppt\0Cp1252t\0Helvetica-BoldObliqueppppq\0~\0�ppppq\0~\0v\0\0��\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0\ruq\0~\0U\0\0\0sq\0~\0Wt\0(sq\0~\0Wt\0idProductorsq\0~\0Wt\0 == 0)?\"Todos los Productores\":sq\0~\0Wt\0nombrepppppppq\0~\0�ppq\0~\0�psq\0~[\0\0��\0\0\0\0\0\0\0\0\0\0\0e\0\0G\0\0\0Rsq\0~\0d\0\0\0\0�xxxpppq\0~\0q\0~Ysq\0~\0d\0\0\0\0����pppt\0\rstaticText-20pq\0~`ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�pq\0~\0[q\0~cq\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�q\0~�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0b\0\0��ppppq\0~�q\0~�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�ppppsq\0~\0�ppq\0~\0�pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0vt\0Númerosq\0~[\0\0��\0\0\0\0\0\0\0\0\0\0\0k\0\0�\0\0\0Rsq\0~\0d\0\0\0\0�xxxpppq\0~\0q\0~Ysq\0~\0d\0\0\0\0����pppt\0\rstaticText-20pq\0~`ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�pq\0~\0[q\0~cq\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�q\0~�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0b\0\0��ppppq\0~�q\0~�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�ppppsq\0~\0�ppq\0~\0�pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0vt\0Imagensq\0~[\0\0��\0\0\0\0\0\0\0\0\0\0\0b\0\0\0�\0\0\0Rsq\0~\0d\0\0\0\0�xxxpppq\0~\0q\0~Ysq\0~\0d\0\0\0\0����pppt\0\rstaticText-20pq\0~`ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�pq\0~\0[q\0~cq\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�q\0~�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0b\0\0��ppppq\0~�q\0~�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�ppppsq\0~\0�ppq\0~\0�pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0vt\0Fecha Vencimientosq\0~[\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0Rsq\0~\0d\0\0\0\0�xxxpppq\0~\0q\0~Ysq\0~\0d\0\0\0\0����pppt\0\rstaticText-18pq\0~`ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�pq\0~\0[q\0~cq\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�q\0~�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?�\0\0q\0~�q\0~�psq\0~\0b\0\0��ppppq\0~�q\0~�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�ppppsq\0~\0�ppq\0~\0�pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0vt\0	Productorsq\0~[\0\0��\0\0\0\0\0\0\0\0\0\0\0E\0\0\0\0\0Rsq\0~\0d\0\0\0\0�xxxpppq\0~\0q\0~Ysq\0~\0d\0\0\0\0����pppt\0\rstaticText-20pq\0~`ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�pq\0~\0[q\0~cq\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�q\0~�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0b\0\0��ppppq\0~�q\0~�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h?@\0\0q\0~�q\0~�ppppsq\0~\0�ppq\0~\0�pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0vt\0Tipoxp\0\0��\0\0\0asq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new Boolean(sq\0~\0Wt\0nombresq\0~\0Wt\0	 != null)pppq\0~\0t\0group1t\0 ReporteVencimientoMarcasSenialesur\0*[Lnet.sf.jasperreports.engine.JRParameter;\"\0�*�`!\0\0xp\0\0\0sr\00net.sf.jasperreports.engine.base.JRBaseParameter\0\0\0\0\0\0\'�\0	Z\0isForPromptingZ\0isSystemDefinedL\0defaultValueExpressionq\0~\0L\0descriptionq\0~\0L\0nameq\0~\0L\0nestedTypeNameq\0~\0L\0\rpropertiesMapq\0~\0@L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xpppt\0REPORT_CONTEXTpsq\0~pppt\0)net.sf.jasperreports.engine.ReportContextpsq\0~ppt\0REPORT_PARAMETERS_MAPpsq\0~pppt\0\rjava.util.Mappsq\0~ppt\0\rJASPER_REPORTpsq\0~pppt\0(net.sf.jasperreports.engine.JasperReportpsq\0~ppt\0REPORT_CONNECTIONpsq\0~pppt\0java.sql.Connectionpsq\0~ppt\0REPORT_MAX_COUNTpsq\0~pppq\0~Cpsq\0~ppt\0REPORT_DATA_SOURCEpsq\0~pppt\0(net.sf.jasperreports.engine.JRDataSourcepsq\0~ppt\0REPORT_SCRIPTLETpsq\0~pppt\0/net.sf.jasperreports.engine.JRAbstractScriptletpsq\0~ppt\0\rREPORT_LOCALEpsq\0~pppt\0java.util.Localepsq\0~ppt\0REPORT_RESOURCE_BUNDLEpsq\0~pppt\0java.util.ResourceBundlepsq\0~ppt\0REPORT_TIME_ZONEpsq\0~pppt\0java.util.TimeZonepsq\0~ppt\0REPORT_FORMAT_FACTORYpsq\0~pppt\0.net.sf.jasperreports.engine.util.FormatFactorypsq\0~ppt\0REPORT_CLASS_LOADERpsq\0~pppt\0java.lang.ClassLoaderpsq\0~ppt\0\ZREPORT_URL_HANDLER_FACTORYpsq\0~pppt\0 java.net.URLStreamHandlerFactorypsq\0~ppt\0REPORT_FILE_RESOLVERpsq\0~pppt\0-net.sf.jasperreports.engine.util.FileResolverpsq\0~ppt\0REPORT_TEMPLATESpsq\0~pppt\0java.util.Collectionpsq\0~ppt\0SORT_FIELDSpsq\0~pppt\0java.util.Listpsq\0~ppt\0FILTERpsq\0~pppt\0)net.sf.jasperreports.engine.DatasetFilterpsq\0~ppt\0REPORT_VIRTUALIZERpsq\0~pppt\0)net.sf.jasperreports.engine.JRVirtualizerpsq\0~ppt\0IS_IGNORE_PAGINATIONpsq\0~pppt\0java.lang.Booleanpsq\0~\0\0sq\0~\0R\0\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0\".\\\\\"pppt\0PATH_SUB_REPORTESpsq\0~pppt\0java.lang.Stringpsq\0~\0ppt\0idProductorpsq\0~pppt\0java.lang.Longpsq\0~\0ppt\0fechaReportepsq\0~pppt\0java.util.Datepsq\0~psq\0~\0\0\0\0w\0\0\0\nt\0ireport.scriptlethandlingt\0ireport.encodingt\0ireport.zoomt\0	ireport.xt\0	ireport.yxsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~vt\01.5q\0~ut\0UTF-8q\0~wt\00q\0~xt\083q\0~tt\00xsr\0,net.sf.jasperreports.engine.base.JRBaseQuery\0\0\0\0\0\0\'�\0[\0chunkst\0+[Lnet/sf/jasperreports/engine/JRQueryChunk;L\0languageq\0~\0xpur\0+[Lnet.sf.jasperreports.engine.JRQueryChunk;@�\0��4�\0\0xp\0\0\0	sr\01net.sf.jasperreports.engine.base.JRBaseQueryChunk\0\0\0\0\0\0\'�\0B\0typeL\0textq\0~\0[\0tokenst\0[Ljava/lang/String;xpt\nSELECT *\nFROM\n((SELECT *\n FROM (SELECT e.id as id, e.nombre, m.fechaVencimiento as fechaVencimiento,\n		m.numero as numero,\"Marca\" as tipo, m.imagen\n       FROM (x071vm20_siig.Entidad e inner join x071vm20_siig.Marca m\n       	  on e.id=m.productor_fk)\n       WHERE (psq\0~�t\0idProductorpsq\0~�t\0 = 0 or psq\0~�t\0idProductorpsq\0~�th = e.id) and e.tipoEntidad = \"PRD\"\n       order by fechaVencimiento desc\n       ) d\ngroup by d.id)\n\nunion\n\n(SELECT *\n FROM (SELECT e.id as id, e.nombre, m.fechaVencimiento as fechaVencimiento,\n		m.numero as numero,\"Señal\" as tipo, m.imagen\n       FROM (x071vm20_siig.Entidad e inner join x071vm20_siig.Senial m\n       	  on e.id=m.productor_fk)\n       WHERE (psq\0~�t\0idProductorpsq\0~�t\0 = 0 or psq\0~�t\0idProductorpsq\0~�t\0q = e.id) and e.tipoEntidad = \"PRD\"\n       order by fechaVencimiento desc\n       ) d\ngroup by d.id)) r\norder by idpt\0sqlppppur\0)[Lnet.sf.jasperreports.engine.JRVariable;b�|�,�D\0\0xp\0\0\0sq\0~,\0\0w�\0\0\0~q\0~1t\0SYSTEMppq\0~9ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)ppt\0PAGE_NUMBERp~q\0~@t\0REPORTq\0~Cpsq\0~,\0\0w�\0\0\0q\0~�ppq\0~9ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)ppt\0\rCOLUMN_NUMBERp~q\0~@t\0PAGEq\0~Cpsq\0~,\0\0w�\0\0\0q\0~2sq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)pppq\0~9ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(0)ppt\0REPORT_COUNTpq\0~�q\0~Cpsq\0~,\0\0w�\0\0\0q\0~2sq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)pppq\0~9ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(0)ppt\0\nPAGE_COUNTpq\0~�q\0~Cpsq\0~,\0\0w�\0\0\0q\0~2sq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(1)pppq\0~9ppsq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new java.lang.Integer(0)ppt\0COLUMN_COUNTp~q\0~@t\0COLUMNq\0~Cpq\0~0sq\0~,\0\0w�\0\0\0\0~q\0~1t\0SUMppq\0~9pppt\0totalDeudaCanonpq\0~�t\0java.lang.Doublepsq\0~,\0\0w�\0\0\0\0q\0~�ppq\0~9pppt\0totalDeudaDeclaracionpq\0~�t\0java.lang.Doublep~r\0<net.sf.jasperreports.engine.type.WhenResourceMissingTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NULLq\0~p~r\00net.sf.jasperreports.engine.type.OrientationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0PORTRAITsq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~\0x\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0+pq\0~\0q\0~�sq\0~\0d\0\0\0\0����ppppppppq\0~\0Eppppq\0~\0H\0\0��ppppppppppppppppppsq\0~\0]psq\0~\0a\0\0��ppppq\0~�q\0~�q\0~�psq\0~\0k\0\0��ppppq\0~�q\0~�psq\0~\0b\0\0��ppppq\0~�q\0~�psq\0~\0n\0\0��ppppq\0~�q\0~�psq\0~\0p\0\0��ppppq\0~�q\0~�ppppsq\0~\0�ppppq\0~�ppppppppppppppppq\0~\0v\0\0��\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0PAGE_NUMBERppppppppppppsq\0~[\0\0��\0\0\0\0\0\0\0\0\0\0f\0\0\0X\0\0\0+sq\0~\0d\0\0\0\0����pppq\0~\0q\0~�sq\0~\0d\0\0\0\0����pppt\0\rstaticText-24pq\0~\0�ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialsq\0~\0�\0\0\0pq\0~\0[q\0~cq\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�q\0~�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0b\0\0��ppppq\0~�q\0~�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�ppppsq\0~\0�ppq\0~\0�pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0vt\0�SISTEMA INTEGRAL DE INFORMACION AGROPECUARIA - Versión 1.0\nGEOINGENIERIA - Desarrollo RIDIERGROUP\nContacto: tel 02901-15561782 - geo.ingenieria@yahoo.com.arsq\0~\0x\0\0��\0\0\0\0\0\0\0\0\0\0\0}\0\0\0\0\0\0\0+sq\0~\0d\0\0\0\0����pppq\0~\0q\0~�sq\0~\0d\0\0\0\0����pppt\0textField-15pq\0~\0�ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialq\0~\0�p~q\0~\0Zt\0LEFTq\0~\0�q\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\nq\0~\nq\0~psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\nq\0~\npsq\0~\0b\0\0��ppppq\0~\nq\0~\npsq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\nq\0~\npsq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~\nq\0~\nppppsq\0~\0�ppq\0~\0�pq\0~pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0v\0\0��\0\0\0\0\0\0\0\0ppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0fechaReportepppppppq\0~cppt\0\ndd/MM/yyyypsr\0+net.sf.jasperreports.engine.base.JRBaseLine\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDB\0	directionL\0directionValuet\04Lnet/sf/jasperreports/engine/type/LineDirectionEnum;xq\0~\09\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*pq\0~\0q\0~�sq\0~\0d\0\0\0\0����ppppppppq\0~\0Eppppq\0~\0H\0\0w�ppsq\0~\0J\0\0��ppppq\0~\"p\0\0��\0~r\02net.sf.jasperreports.engine.type.LineDirectionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0TOP_DOWNxp\0\0��\0\0\0Lppq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~[\0\0��\0\0\0\0\0\0\0\0\0\0f\0\0\0X\0\0\0\0sq\0~\0d\0\0\0\0����pppq\0~\0q\0~(sq\0~\0d\0\0\0\0�\0\0\0pppt\0\rstaticText-24pq\0~\0�ppq\0~\0Esq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new Boolean(sq\0~\0Wt\0nombresq\0~\0Wt\0	 != null)pppppq\0~\0H\0\0��pppppt\0Arialsq\0~\0�\0\0\0pq\0~\0[q\0~cq\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0pppp~q\0~\0�t\0DOTTEDsq\0~\0h\0\0\0\0q\0~8q\0~8q\0~*psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~;sq\0~\0h\0\0\0\0q\0~8q\0~8psq\0~\0b\0\0��ppq\0~;pq\0~8q\0~8psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~;sq\0~\0h\0\0\0\0q\0~8q\0~8psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~;sq\0~\0h\0\0\0\0q\0~8q\0~8ppppsq\0~\0�ppq\0~\0�pq\0~*pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0vt\0-Vencimiento de Títulos de Marcas y señales sq\0~[\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0\0sq\0~\0d\0\0\0\0����pppq\0~\0q\0~(sq\0~\0d\0\0\0\0�\0\0\0pppt\0\rstaticText-24pq\0~\0�ppq\0~\0Esq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0new Boolean(sq\0~\0Wt\0nombresq\0~\0Wt\0	 == null)pppppq\0~\0H\0\0��pppppt\0Arialq\0~7pq\0~\0[q\0~cq\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~Yq\0~Yq\0~Lpsq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~Yq\0~Ypsq\0~\0b\0\0��ppppq\0~Yq\0~Ypsq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~Yq\0~Ypsq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~Yq\0~Yppppsq\0~\0�ppq\0~\0�pq\0~Lpppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0vt\0\ZNo hay datos para procesarxp\0\0��\0\0\0+ppq\0~\0~r\0/net.sf.jasperreports.engine.type.PrintOrderEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0VERTICALpsq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0ppq\0~\0psq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~[\0\0��\0\0\0\"\0\0\0\0\0\0\0\0|\0\0�\0\0\02sq\0~\0d\0\0\0\0����pppq\0~\0q\0~psq\0~\0d\0\0\0\0�\0\0\0pppt\0\rstaticText-23pq\0~\0�ppq\0~\0Eppppq\0~\0H\0\0��pppppt\0Arialsq\0~\0�\0\0\0pq\0~\0[q\0~\0�q\0~\0�q\0~\0�q\0~\0�pq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~xq\0~xq\0~rpsq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~xq\0~xpsq\0~\0b\0\0��ppppq\0~xq\0~xpsq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~xq\0~xpsq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~xq\0~xppppsq\0~\0�ppq\0~\0�pq\0~rpppppt\0Cp1252t\0	Helveticappppq\0~\0�pppp~q\0~\0ut\0TOPt\0�Provincia de Tierra del Fuego, Antártida\ne Islas del Atlántico Sur\nRepública Argentina\nSecretaria de Desarrollo Sustentable y Ambiente\nDirección General de Bosques\nsq\0~\0-\0\0��\0\0\0&\0\0\0\0\0\0\0\04\0\0�\0\0\0sq\0~\0d\0\0\0\0����pppq\0~\0q\0~psq\0~\0d\0\0\0\0�\0\0\0pppt\0image-1pq\0~`ppq\0~\0Eppppq\0~\0H\0\0w�p~r\0)net.sf.jasperreports.engine.type.FillEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SOLIDsq\0~\0J\0\0��ppq\0~\0�sq\0~\0h\0\0\0\0q\0~�p\0\0��\0\0\0\0\0\0\0\0\0pppppppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0PATH_SUB_REPORTESsq\0~\0Wt\00+System.getProperty(\"file.separator\")+\"logo.jpg\"pppq\0~pppppq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�q\0~�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0b\0\0��ppppq\0~�q\0~�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�ppq\0~\0sppppp~r\0/net.sf.jasperreports.engine.type.ScaleImageEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\nFILL_FRAMEppppq\0~�sq\0~\0-\0\0��\0\0\07\0\0\0\0\0\0\0\0}\0\0\0\n\0\0\0\nsq\0~\0d\0\0\0\0����pppq\0~\0q\0~psq\0~\0d\0\0\0\0�\0\0\0pppt\0image-1pq\0~`ppq\0~\0Eppppq\0~\0H\0\0w�pq\0~�sq\0~\0J\0\0��ppq\0~\0�sq\0~\0h\0\0\0\0q\0~�p\0\0��\0\0\0\0\0\0\0\0\0pppppppq\0~\0Psq\0~\0R\0\0\0uq\0~\0U\0\0\0sq\0~\0Wt\0PATH_SUB_REPORTESsq\0~\0Wt\04+System.getProperty(\"file.separator\")+\"LOGOSIIA.jpg\"pppq\0~pppppq\0~\0�pppsq\0~\0]psq\0~\0a\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�q\0~�psq\0~\0k\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0b\0\0��ppppq\0~�q\0~�psq\0~\0n\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�psq\0~\0p\0\0��sq\0~\0d\0\0\0\0�\0\0\0ppppq\0~\0�sq\0~\0h\0\0\0\0q\0~�q\0~�ppq\0~\0spppppq\0~�ppppq\0~�xp\0\0��\0\0\0jppq\0~\0~r\03net.sf.jasperreports.engine.type.WhenNoDataTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ALL_SECTIONS_NO_DETAILsr\06net.sf.jasperreports.engine.design.JRReportCompileData\0\0\0\0\0\0\'�\0L\0crosstabCompileDataq\0~L\0datasetCompileDataq\0~L\0mainDatasetCompileDataq\0~\0xpsq\0~y?@\0\0\0\0\0w\0\0\0\0\0\0\0xsq\0~y?@\0\0\0\0\0w\0\0\0\0\0\0\0xur\0[B���T�\0\0xp\0\0n����\0\0\0.(\03reporteVencimientoMarcasSeniales_1390396216096_9148\0\0,net/sf/jasperreports/engine/fill/JREvaluator\0\0parameter_REPORT_LOCALE\02Lnet/sf/jasperreports/engine/fill/JRFillParameter;\0parameter_PATH_SUB_REPORTES\0parameter_JASPER_REPORT\0parameter_REPORT_VIRTUALIZER\0\Zparameter_REPORT_TIME_ZONE\0parameter_SORT_FIELDS\0parameter_REPORT_FILE_RESOLVER\0\Zparameter_REPORT_SCRIPTLET\0parameter_REPORT_PARAMETERS_MAP\0parameter_REPORT_CONNECTION\0parameter_fechaReporte\0parameter_REPORT_CONTEXT\0parameter_REPORT_CLASS_LOADER\0parameter_REPORT_DATA_SOURCE\0$parameter_REPORT_URL_HANDLER_FACTORY\0parameter_IS_IGNORE_PAGINATION\0parameter_FILTER\0parameter_REPORT_FORMAT_FACTORY\0\Zparameter_REPORT_MAX_COUNT\0\Zparameter_REPORT_TEMPLATES\0parameter_idProductor\0 parameter_REPORT_RESOURCE_BUNDLE\0field_nombre\0.Lnet/sf/jasperreports/engine/fill/JRFillField;\0field_id\0field_imagen\0field_fechaVencimiento\0\nfield_tipo\0field_numero\0variable_PAGE_NUMBER\01Lnet/sf/jasperreports/engine/fill/JRFillVariable;\0variable_COLUMN_NUMBER\0variable_REPORT_COUNT\0variable_PAGE_COUNT\0variable_COLUMN_COUNT\0variable_group1_COUNT\0variable_totalDeudaCanon\0variable_totalDeudaDeclaracion\0<init>\0()V\0Code\0,\0-\n\0\0/\0\0	\0\01\0\0	\0\03\0\0	\0\05\0	\0	\0\07\0\n\0	\0\09\0\0	\0\0;\0\0	\0\0=\0\r\0	\0\0?\0\0	\0\0A\0\0	\0\0C\0\0	\0\0E\0\0	\0\0G\0\0	\0\0I\0\0	\0\0K\0\0	\0\0M\0\0	\0\0O\0\0	\0\0Q\0\0	\0\0S\0\0	\0\0U\0\0	\0\0W\0\Z\0	\0\0Y\0\0	\0\0[\0\0	\0\0]\0\0	\0\0_\0\0	\0\0a\0 \0	\0\0c\0!\0	\0\0e\0\"\0	\0\0g\0#\0$	\0\0i\0%\0$	\0\0k\0&\0$	\0\0m\0\'\0$	\0\0o\0(\0$	\0\0q\0)\0$	\0\0s\0*\0$	\0\0u\0+\0$	\0\0w\0LineNumberTable\0customizedInit\00(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V\0\ninitParams\0(Ljava/util/Map;)V\0|\0}\n\0\0~\0\ninitFields\0�\0}\n\0\0�\0initVars\0�\0}\n\0\0�\0\rREPORT_LOCALE\0�\0\rjava/util/Map\0�\0get\0&(Ljava/lang/Object;)Ljava/lang/Object;\0�\0�\0�\0�\00net/sf/jasperreports/engine/fill/JRFillParameter\0�\0PATH_SUB_REPORTES\0�\0\rJASPER_REPORT\0�\0REPORT_VIRTUALIZER\0�\0REPORT_TIME_ZONE\0�\0SORT_FIELDS\0�\0REPORT_FILE_RESOLVER\0�\0REPORT_SCRIPTLET\0�\0REPORT_PARAMETERS_MAP\0�\0REPORT_CONNECTION\0�\0fechaReporte\0�\0REPORT_CONTEXT\0�\0REPORT_CLASS_LOADER\0�\0REPORT_DATA_SOURCE\0�\0\ZREPORT_URL_HANDLER_FACTORY\0�\0IS_IGNORE_PAGINATION\0�\0FILTER\0�\0REPORT_FORMAT_FACTORY\0�\0REPORT_MAX_COUNT\0�\0REPORT_TEMPLATES\0�\0idProductor\0�\0REPORT_RESOURCE_BUNDLE\0�\0nombre\0�\0,net/sf/jasperreports/engine/fill/JRFillField\0�\0id\0�\0imagen\0�\0fechaVencimiento\0�\0tipo\0�\0numero\0�\0PAGE_NUMBER\0�\0/net/sf/jasperreports/engine/fill/JRFillVariable\0�\0\rCOLUMN_NUMBER\0�\0REPORT_COUNT\0�\0\nPAGE_COUNT\0�\0COLUMN_COUNT\0�\0group1_COUNT\0�\0totalDeudaCanon\0�\0totalDeudaDeclaracion\0�\0evaluate\0(I)Ljava/lang/Object;\0\nExceptions\0java/lang/Throwable\0�\0.\\\0�\0java/lang/Integer\0�\0(I)V\0,\0�\n\0�\0�\0java/lang/Boolean\0�\0getValue\0()Ljava/lang/Object;\0�\0�\n\0�\0�\0java/lang/String\0�\0(Z)V\0,\0�\n\0�\0�\n\0�\0�\0java/lang/Long\0�\0	longValue\0()J\0�\0�\n\0�\0�\0Todos los Productores\0�\0java/lang/StringBuffer\0�\0valueOf\0&(Ljava/lang/Object;)Ljava/lang/String;\0�\0�\n\0�\0�\0(Ljava/lang/String;)V\0,\0\n\0�\0file.separator\0java/lang/System\0getProperty\0&(Ljava/lang/String;)Ljava/lang/String;\n	\0append\0,(Ljava/lang/String;)Ljava/lang/StringBuffer;\n\0�\r\0logo.jpg\0toString\0()Ljava/lang/String;\n\0�\0LOGOSIIA.jpg\0java/io/InputStream\0java/sql/Timestamp\n\0�\0�\0java/util/Date\0evaluateOld\0getOldValue\0�\n\0� \n\0� \0evaluateEstimated\0getEstimatedValue$\0�\n\0�%\0\nSourceFile\0!\0\0\0\0\0$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0!\0\0\0\0\0\"\0\0\0\0\0#\0$\0\0\0\0%\0$\0\0\0\0&\0$\0\0\0\0\'\0$\0\0\0\0(\0$\0\0\0\0)\0$\0\0\0\0*\0$\0\0\0\0+\0$\0\0\0\0\0,\0-\0\0.\0\0e\0\0\0\0\0�*�\00*�\02*�\04*�\06*�\08*�\0:*�\0<*�\0>*�\0@*�\0B*�\0D*�\0F*�\0H*�\0J*�\0L*�\0N*�\0P*�\0R*�\0T*�\0V*�\0X*�\0Z*�\0\\*�\0^*�\0`*�\0b*�\0d*�\0f*�\0h*�\0j*�\0l*�\0n*�\0p*�\0r*�\0t*�\0v*�\0x�\0\0\0\0y\0\0\0�\0&\0\0\0\0\0\0	\0\0\0\0\0\0\0 \0\0!\0\"\0\"\0\'\0#\0,\0$\01\0%\06\0&\0;\0\'\0@\0(\0E\0)\0J\0*\0O\0+\0T\0,\0Y\0-\0^\0.\0c\0/\0h\00\0m\01\0r\02\0w\03\0|\04\0�\05\0�\06\0�\07\0�\08\0�\09\0�\0:\0�\0;\0�\0<\0�\0=\0�\0>\0�\0?\0�\0\0\0z\0{\0\0.\0\0\04\0\0\0\0\0*+�\0*,�\0�*-�\0��\0\0\0\0y\0\0\0\0\0\0\0K\0\0L\0\n\0M\0\0N\0\0|\0}\0\0.\0\0�\0\0\0\0�*+��\0�\0�\0��\0��\02*+��\0�\0�\0��\0��\04*+��\0�\0�\0��\0��\06*+��\0�\0�\0��\0��\08*+��\0�\0�\0��\0��\0:*+��\0�\0�\0��\0��\0<*+��\0�\0�\0��\0��\0>*+��\0�\0�\0��\0��\0@*+��\0�\0�\0��\0��\0B*+��\0�\0�\0��\0��\0D*+��\0�\0�\0��\0��\0F*+��\0�\0�\0��\0��\0H*+��\0�\0�\0��\0��\0J*+��\0�\0�\0��\0��\0L*+��\0�\0�\0��\0��\0N*+��\0�\0�\0��\0��\0P*+��\0�\0�\0��\0��\0R*+��\0�\0�\0��\0��\0T*+��\0�\0�\0��\0��\0V*+��\0�\0�\0��\0��\0X*+��\0�\0�\0��\0��\0Z*+��\0�\0�\0��\0��\0\\�\0\0\0\0y\0\0\0^\0\0\0\0V\0\0W\0$\0X\06\0Y\0H\0Z\0Z\0[\0l\0\\\0~\0]\0�\0^\0�\0_\0�\0`\0�\0a\0�\0b\0�\0c\0�\0d\0e \0f2\0gD\0hV\0ih\0jz\0k�\0l\0\0�\0}\0\0.\0\0\0�\0\0\0\0\0m*+��\0�\0�\0��\0��\0^*+��\0�\0�\0��\0��\0`*+��\0�\0�\0��\0��\0b*+ù\0�\0�\0��\0��\0d*+Ź\0�\0�\0��\0��\0f*+ǹ\0�\0�\0��\0��\0h�\0\0\0\0y\0\0\0\0\0\0\0t\0\0u\0$\0v\06\0w\0H\0x\0Z\0y\0l\0z\0\0�\0}\0\0.\0\0\0�\0\0\0\0\0�*+ɹ\0�\0�\0��\0˵\0j*+͹\0�\0�\0��\0˵\0l*+Ϲ\0�\0�\0��\0˵\0n*+ѹ\0�\0�\0��\0˵\0p*+ӹ\0�\0�\0��\0˵\0r*+չ\0�\0�\0��\0˵\0t*+׹\0�\0�\0��\0˵\0v*+ٹ\0�\0�\0��\0˵\0x�\0\0\0\0y\0\0\0&\0	\0\0\0�\0\0�\0$\0�\06\0�\0H\0�\0Z\0�\0l\0�\0~\0�\0�\0�\0\0�\0�\0\0�\0\0\0\0\0�\0.\0\05\0\0\0\0IM�\0\0D\0\0\0\0\0\0\0\0\0\0u\0\0\0{\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0\0:\0\0W\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\0\0\0\0\0\0+\0\09�M�̻\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M�x�\0�Y�\0�M�l�\0�Y�\0�M�`�\0�Y�\0�M�TM�O�\0�Y*�\0^�\0��\0��\0�\0�\0�M�2*�\0Z�\0��\0�\0�	��\0�\0\r*�\0^�\0��\0�M�\r�\0�Y*�\0^�\0��\0��\0�\0�\0�M�\0�\0�Y*�\04�\0��\0�\0���\n���M�\0ƻ\0�Y*�\04�\0��\0�\0���\n���M�\0��\0�Y*�\0^�\0��\0��\0�\0�\0�M�\0�\0�Y*�\0^�\0��\0��\0�\0�\0�M�\0b*�\0b�\0��M�\0T*�\0f�\0��\0�M�\0F*�\0d�\0��\ZM�\08*�\0^�\0��\0�M�\0**�\0h�\0��\0�M�\0*�\0j��\0�M�\0*�\0F�\0��M,�\0\0\0\0y\0\0\0�\06\0\0\0�\0\0�\0x\0�\0{\0�\0~\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�:\0�=\0�W\0�Z\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0�\0� +.9<G\0\0�\0\0�\0\0\0\0\0�\0.\0\05\0\0\0\0IM�\0\0D\0\0\0\0\0\0\0\0\0\0u\0\0\0{\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0\0:\0\0W\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\0\0\0\0\0\0+\0\09�M�̻\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M�x�\0�Y�\0�M�l�\0�Y�\0�M�`�\0�Y�\0�M�TM�O�\0�Y*�\0^�!�\0��\0�\0�\0�M�2*�\0Z�\0��\0�\0�	��\0�\0\r*�\0^�!�\0�M�\r�\0�Y*�\0^�!�\0��\0�\0�\0�M�\0�\0�Y*�\04�\0��\0�\0���\n���M�\0ƻ\0�Y*�\04�\0��\0�\0���\n���M�\0��\0�Y*�\0^�!�\0��\0�\0�\0�M�\0�\0�Y*�\0^�!�\0��\0�\0�\0�M�\0b*�\0b�!�M�\0T*�\0f�!�\0�M�\0F*�\0d�!�\ZM�\08*�\0^�!�\0�M�\0**�\0h�!�\0�M�\0*�\0j�\"�\0�M�\0*�\0F�\0��M,�\0\0\0\0y\0\0\0�\06\0\0&\0(\0x,\0{-\0~1\0�2\0�6\0�7\0�;\0�<\0�@\0�A\0�E\0�F\0�J\0�K\0�O\0�P\0�T\0�U\0�Y\0�Z\0�^\0�_\0�c\0�d\0�him:n=rWsZw�x�|�}������������������� �+�.�9�<�G�\0#\0�\0\0�\0\0\0\0\0�\0.\0\05\0\0\0\0IM�\0\0D\0\0\0\0\0\0\0\0\0\0u\0\0\0{\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0\0:\0\0W\0\0�\0\0�\0\0�\0\0�\0\0�\0\0\0\0\0\0\0\0+\0\09�M�̻\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M�x�\0�Y�\0�M�l�\0�Y�\0�M�`�\0�Y�\0�M�TM�O�\0�Y*�\0^�\0��\0��\0�\0�\0�M�2*�\0Z�\0��\0�\0�	��\0�\0\r*�\0^�\0��\0�M�\r�\0�Y*�\0^�\0��\0��\0�\0�\0�M�\0�\0�Y*�\04�\0��\0�\0���\n���M�\0ƻ\0�Y*�\04�\0��\0�\0���\n���M�\0��\0�Y*�\0^�\0��\0��\0�\0�\0�M�\0�\0�Y*�\0^�\0��\0��\0�\0�\0�M�\0b*�\0b�\0��M�\0T*�\0f�\0��\0�M�\0F*�\0d�\0��\ZM�\08*�\0^�\0��\0�M�\0**�\0h�\0��\0�M�\0*�\0j�&�\0�M�\0*�\0F�\0��M,�\0\0\0\0y\0\0\0�\06\0\0�\0�\0x�\0{�\0~�\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0���:=WZ������\Z��� �$%)*./ 3+4.899<=GE\0\'\0\0\0\0t\0_1390396216096_9148t\02net.sf.jasperreports.engine.design.JRJavacCompiler','reporteVencimientoMarcasSeniales',NULL),(2,'��\0sr\0(net.sf.jasperreports.engine.JasperReport\0\0\0\0\0\0\'�\0L\0compileDatat\0Ljava/io/Serializable;L\0compileNameSuffixt\0Ljava/lang/String;L\0\rcompilerClassq\0~\0xr\0-net.sf.jasperreports.engine.base.JRBaseReport\0\0\0\0\0\0\'�\0*I\0PSEUDO_SERIAL_VERSION_UIDI\0bottomMarginI\0columnCountI\0\rcolumnSpacingI\0columnWidthZ\0ignorePaginationZ\0isFloatColumnFooterZ\0isSummaryNewPageZ\0 isSummaryWithPageHeaderAndFooterZ\0isTitleNewPageI\0\nleftMarginB\0orientationI\0\npageHeightI\0	pageWidthB\0\nprintOrderI\0rightMarginI\0	topMarginB\0whenNoDataTypeL\0\nbackgroundt\0$Lnet/sf/jasperreports/engine/JRBand;L\0columnDirectiont\03Lnet/sf/jasperreports/engine/type/RunDirectionEnum;L\0columnFooterq\0~\0L\0columnHeaderq\0~\0[\0datasetst\0([Lnet/sf/jasperreports/engine/JRDataset;L\0defaultStylet\0%Lnet/sf/jasperreports/engine/JRStyle;L\0detailq\0~\0L\0\rdetailSectiont\0\'Lnet/sf/jasperreports/engine/JRSection;L\0formatFactoryClassq\0~\0L\0\nimportsSett\0Ljava/util/Set;L\0languageq\0~\0L\0lastPageFooterq\0~\0L\0mainDatasett\0\'Lnet/sf/jasperreports/engine/JRDataset;L\0nameq\0~\0L\0noDataq\0~\0L\0orientationValuet\02Lnet/sf/jasperreports/engine/type/OrientationEnum;L\0\npageFooterq\0~\0L\0\npageHeaderq\0~\0L\0printOrderValuet\01Lnet/sf/jasperreports/engine/type/PrintOrderEnum;[\0stylest\0&[Lnet/sf/jasperreports/engine/JRStyle;L\0summaryq\0~\0[\0	templatest\0/[Lnet/sf/jasperreports/engine/JRReportTemplate;L\0titleq\0~\0L\0whenNoDataTypeValuet\05Lnet/sf/jasperreports/engine/type/WhenNoDataTypeEnum;xp\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\0\0S\0\0\0\0\0\0\0.\0sr\0+net.sf.jasperreports.engine.base.JRBaseBand\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDI\0heightZ\0isSplitAllowedL\0printWhenExpressiont\0*Lnet/sf/jasperreports/engine/JRExpression;L\0	splitTypet\0Ljava/lang/Byte;L\0splitTypeValuet\00Lnet/sf/jasperreports/engine/type/SplitTypeEnum;xr\03net.sf.jasperreports.engine.base.JRBaseElementGroup\0\0\0\0\0\0\'�\0L\0childrent\0Ljava/util/List;L\0elementGroupt\0,Lnet/sf/jasperreports/engine/JRElementGroup;xpsr\0java.util.ArrayListx����a�\0I\0sizexp\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0pp~r\0.net.sf.jasperreports.engine.type.SplitTypeEnum\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0STRETCH~r\01net.sf.jasperreports.engine.type.RunDirectionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0LTRsq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0ppq\0~\0sq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0ppq\0~\0pppsr\0.net.sf.jasperreports.engine.base.JRBaseSection\0\0\0\0\0\0\'�\0[\0bandst\0%[Lnet/sf/jasperreports/engine/JRBand;xpur\0%[Lnet.sf.jasperreports.engine.JRBand;��~�ʅ5\0\0xp\0\0\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsr\00net.sf.jasperreports.engine.base.JRBaseTextField\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDI\0\rbookmarkLevelB\0evaluationTimeB\0hyperlinkTargetB\0\rhyperlinkTypeZ\0isStretchWithOverflowL\0anchorNameExpressionq\0~\0L\0evaluationGroupt\0%Lnet/sf/jasperreports/engine/JRGroup;L\0evaluationTimeValuet\05Lnet/sf/jasperreports/engine/type/EvaluationTimeEnum;L\0\nexpressionq\0~\0L\0hyperlinkAnchorExpressionq\0~\0L\0hyperlinkPageExpressionq\0~\0[\0hyperlinkParameterst\03[Lnet/sf/jasperreports/engine/JRHyperlinkParameter;L\0hyperlinkReferenceExpressionq\0~\0L\0\ZhyperlinkTooltipExpressionq\0~\0L\0isBlankWhenNullt\0Ljava/lang/Boolean;L\0\nlinkTargetq\0~\0L\0linkTypeq\0~\0L\0patternq\0~\0L\0patternExpressionq\0~\0xr\02net.sf.jasperreports.engine.base.JRBaseTextElement\0\0\0\0\0\0\'�\0%I\0PSEUDO_SERIAL_VERSION_UIDL\0borderq\0~\0L\0borderColort\0Ljava/awt/Color;L\0bottomBorderq\0~\0L\0bottomBorderColorq\0~\03L\0\rbottomPaddingt\0Ljava/lang/Integer;L\0fontNameq\0~\0L\0fontSizeq\0~\04L\0horizontalAlignmentq\0~\0L\0horizontalAlignmentValuet\06Lnet/sf/jasperreports/engine/type/HorizontalAlignEnum;L\0isBoldq\0~\01L\0isItalicq\0~\01L\0\risPdfEmbeddedq\0~\01L\0isStrikeThroughq\0~\01L\0isStyledTextq\0~\01L\0isUnderlineq\0~\01L\0\nleftBorderq\0~\0L\0leftBorderColorq\0~\03L\0leftPaddingq\0~\04L\0lineBoxt\0\'Lnet/sf/jasperreports/engine/JRLineBox;L\0lineSpacingq\0~\0L\0lineSpacingValuet\02Lnet/sf/jasperreports/engine/type/LineSpacingEnum;L\0markupq\0~\0L\0paddingq\0~\04L\0	paragrapht\0)Lnet/sf/jasperreports/engine/JRParagraph;L\0pdfEncodingq\0~\0L\0pdfFontNameq\0~\0L\0rightBorderq\0~\0L\0rightBorderColorq\0~\03L\0rightPaddingq\0~\04L\0rotationq\0~\0L\0\rrotationValuet\0/Lnet/sf/jasperreports/engine/type/RotationEnum;L\0	topBorderq\0~\0L\0topBorderColorq\0~\03L\0\ntopPaddingq\0~\04L\0verticalAlignmentq\0~\0L\0verticalAlignmentValuet\04Lnet/sf/jasperreports/engine/type/VerticalAlignEnum;xr\0.net.sf.jasperreports.engine.base.JRBaseElement\0\0\0\0\0\0\'�\0\ZI\0PSEUDO_SERIAL_VERSION_UIDI\0heightZ\0isPrintInFirstWholeBandZ\0isPrintRepeatedValuesZ\0\ZisPrintWhenDetailOverflowsZ\0isRemoveLineWhenBlankB\0positionTypeB\0stretchTypeI\0widthI\0xI\0yL\0	backcolorq\0~\03L\0defaultStyleProvidert\04Lnet/sf/jasperreports/engine/JRDefaultStyleProvider;L\0elementGroupq\0~\0L\0	forecolorq\0~\03L\0keyq\0~\0L\0modeq\0~\0L\0	modeValuet\0+Lnet/sf/jasperreports/engine/type/ModeEnum;L\0parentStyleq\0~\0L\0parentStyleNameReferenceq\0~\0L\0positionTypeValuet\03Lnet/sf/jasperreports/engine/type/PositionTypeEnum;L\0printWhenExpressionq\0~\0L\0printWhenGroupChangesq\0~\0.L\0\rpropertiesMapt\0-Lnet/sf/jasperreports/engine/JRPropertiesMap;[\0propertyExpressionst\03[Lnet/sf/jasperreports/engine/JRPropertyExpression;L\0stretchTypeValuet\02Lnet/sf/jasperreports/engine/type/StretchTypeEnum;xp\0\0��\0\0\0\0\0\0\0\0\0\0\0R\0\0\0�\0\0\0\0sr\0java.awt.Color���3u\0F\0falphaI\0valueL\0cst\0Ljava/awt/color/ColorSpace;[\0	frgbvaluet\0[F[\0fvalueq\0~\0Exp\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-15p~r\0)net.sf.jasperreports.engine.type.ModeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0TRANSPARENTpp~r\01net.sf.jasperreports.engine.type.PositionTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0FIX_RELATIVE_TO_TOPpppp~r\00net.sf.jasperreports.engine.type.StretchTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\nNO_STRETCH\0\0��pppppt\0Arialsr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number������\0\0xp\0\0\0p~r\04net.sf.jasperreports.engine.type.HorizontalAlignEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0CENTERsr\0java.lang.Boolean� r�՜��\0Z\0valuexp\0q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsr\0.net.sf.jasperreports.engine.base.JRBaseLineBox\0\0\0\0\0\0\'�\0L\0\rbottomPaddingq\0~\04L\0	bottomPent\0+Lnet/sf/jasperreports/engine/base/JRBoxPen;L\0boxContainert\0,Lnet/sf/jasperreports/engine/JRBoxContainer;L\0leftPaddingq\0~\04L\0leftPenq\0~\0\\L\0paddingq\0~\04L\0penq\0~\0\\L\0rightPaddingq\0~\04L\0rightPenq\0~\0\\L\0\ntopPaddingq\0~\04L\0topPenq\0~\0\\xppsr\03net.sf.jasperreports.engine.base.JRBaseBoxBottomPen\0\0\0\0\0\0\'�\0\0xr\0-net.sf.jasperreports.engine.base.JRBaseBoxPen\0\0\0\0\0\0\'�\0L\0lineBoxq\0~\06xr\0*net.sf.jasperreports.engine.base.JRBasePen\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDL\0	lineColorq\0~\03L\0	lineStyleq\0~\0L\0lineStyleValuet\00Lnet/sf/jasperreports/engine/type/LineStyleEnum;L\0	lineWidtht\0Ljava/lang/Float;L\0penContainert\0,Lnet/sf/jasperreports/engine/JRPenContainer;xp\0\0��sq\0~\0C\0\0\0\0����pppp~r\0.net.sf.jasperreports.engine.type.LineStyleEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SOLIDsr\0java.lang.Float��ɢ�<��\0F\0valuexq\0~\0T>�\0\0q\0~\0^q\0~\0^q\0~\0Bpsr\01net.sf.jasperreports.engine.base.JRBaseBoxLeftPen\0\0\0\0\0\0\'�\0\0xq\0~\0`\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0^q\0~\0^psq\0~\0`\0\0��ppppq\0~\0^q\0~\0^psr\02net.sf.jasperreports.engine.base.JRBaseBoxRightPen\0\0\0\0\0\0\'�\0\0xq\0~\0`\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0^q\0~\0^psr\00net.sf.jasperreports.engine.base.JRBaseBoxTopPen\0\0\0\0\0\0\'�\0\0xq\0~\0`\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0^q\0~\0^ppppsr\00net.sf.jasperreports.engine.base.JRBaseParagraph\0\0\0\0\0\0\'�\0\nL\0firstLineIndentq\0~\04L\0\nleftIndentq\0~\04L\0lineSpacingq\0~\07L\0lineSpacingSizeq\0~\0cL\0paragraphContainert\02Lnet/sf/jasperreports/engine/JRParagraphContainer;L\0rightIndentq\0~\04L\0spacingAfterq\0~\04L\0\rspacingBeforeq\0~\04L\0tabStopWidthq\0~\04L\0tabStopsq\0~\0xppp~r\00net.sf.jasperreports.engine.type.LineSpacingEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SINGLEpq\0~\0Bpppppt\0Cp1252t\0	Helveticapppp~r\0-net.sf.jasperreports.engine.type.RotationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NONEpppp~r\02net.sf.jasperreports.engine.type.VerticalAlignEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0MIDDLE\0\0��\0\0\0\0\0\0\0\0pp~r\03net.sf.jasperreports.engine.type.EvaluationTimeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NOWsr\01net.sf.jasperreports.engine.base.JRBaseExpression\0\0\0\0\0\0\'�\0I\0id[\0chunkst\00[Lnet/sf/jasperreports/engine/JRExpressionChunk;L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xp\0\0\0ur\00[Lnet.sf.jasperreports.engine.JRExpressionChunk;mY��iK�U\0\0xp\0\0\0sr\06net.sf.jasperreports.engine.base.JRBaseExpressionChunk\0\0\0\0\0\0\'�\0B\0typeL\0textq\0~\0xpt\0numeropppppppq\0~\0Zppt\0\0psq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wsq\0~\0Yq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0����ppppq\0~\0hsq\0~\0j>�\0\0q\0~\0�q\0~\0�q\0~\0�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0`\0\0��ppppq\0~\0�q\0~\0�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�ppppsq\0~\0yppq\0~\0}pq\0~\0�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0nombrepppppppq\0~\0Zppq\0~\0�psq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0W\0\0^\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0Zq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0����ppppq\0~\0hsq\0~\0j>�\0\0q\0~\0�q\0~\0�q\0~\0�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0`\0\0��ppppq\0~\0�q\0~\0�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�ppppsq\0~\0yppq\0~\0}pq\0~\0�pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0\rnumeroInternopppppppq\0~\0Zppq\0~\0�psq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0P\0\0\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0Zq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0����ppppq\0~\0hsq\0~\0j>�\0\0q\0~\0�q\0~\0�q\0~\0�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0`\0\0��ppppq\0~\0�q\0~\0�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�ppppsq\0~\0yppq\0~\0}pq\0~\0�pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0periodopppppppq\0~\0Zppq\0~\0�psq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0b\0\0�\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~\0+sq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0Zq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0����ppppq\0~\0hsq\0~\0j>�\0\0q\0~\0�q\0~\0�q\0~\0�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0`\0\0��ppppq\0~\0�q\0~\0�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~\0�q\0~\0�ppppsq\0~\0yppq\0~\0}pq\0~\0�pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0fechaLegalizacionpppppppq\0~\0Zppt\0\ndd/MM/yyyypxp\0\0��\0\0\0ppq\0~\0psr\0java.util.HashSet�D�����4\0\0xpw\0\0\0?@\0\0\0\0\0t\0\"net.sf.jasperreports.engine.data.*t\0net.sf.jasperreports.engine.*t\0java.util.*xt\0javapsr\0.net.sf.jasperreports.engine.base.JRBaseDataset\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDZ\0isMainB\0whenResourceMissingType[\0fieldst\0&[Lnet/sf/jasperreports/engine/JRField;L\0filterExpressionq\0~\0[\0groupst\0&[Lnet/sf/jasperreports/engine/JRGroup;L\0nameq\0~\0[\0\nparameterst\0*[Lnet/sf/jasperreports/engine/JRParameter;L\0\rpropertiesMapq\0~\0?L\0queryt\0%Lnet/sf/jasperreports/engine/JRQuery;L\0resourceBundleq\0~\0L\0scriptletClassq\0~\0[\0\nscriptletst\0*[Lnet/sf/jasperreports/engine/JRScriptlet;[\0\nsortFieldst\0*[Lnet/sf/jasperreports/engine/JRSortField;[\0	variablest\0)[Lnet/sf/jasperreports/engine/JRVariable;L\0whenResourceMissingTypeValuet\0>Lnet/sf/jasperreports/engine/type/WhenResourceMissingTypeEnum;xp\0\0��\0ur\0&[Lnet.sf.jasperreports.engine.JRField;<��N*�p\0\0xp\0\0\0sr\0,net.sf.jasperreports.engine.base.JRBaseField\0\0\0\0\0\0\'�\0L\0descriptionq\0~\0L\0nameq\0~\0L\0\rpropertiesMapq\0~\0?L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xppt\0idProdsr\0+net.sf.jasperreports.engine.JRPropertiesMap\0\0\0\0\0\0\'�\0L\0baseq\0~\0?L\0propertiesListq\0~\0L\0\rpropertiesMapt\0Ljava/util/Map;xppppt\0java.lang.Longpsq\0~pt\0nombresq\0~pppt\0java.lang.Stringpsq\0~pt\0fechaLegalizacionsq\0~pppt\0java.sql.Timestamppsq\0~pt\0numerosq\0~pppq\0~psq\0~pt\0\rnumeroInternosq\0~pppq\0~psq\0~pt\0periodosq\0~pppq\0~ppur\0&[Lnet.sf.jasperreports.engine.JRGroup;@�_zL�x�\0\0xp\0\0\0sr\0,net.sf.jasperreports.engine.base.JRBaseGroup\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDB\0footerPositionZ\0isReprintHeaderOnEachPageZ\0isResetPageNumberZ\0isStartNewColumnZ\0isStartNewPageZ\0keepTogetherI\0minHeightToStartNewPageL\0\rcountVariablet\0(Lnet/sf/jasperreports/engine/JRVariable;L\0\nexpressionq\0~\0L\0footerPositionValuet\05Lnet/sf/jasperreports/engine/type/FooterPositionEnum;L\0groupFooterq\0~\0L\0groupFooterSectionq\0~\0L\0groupHeaderq\0~\0L\0groupHeaderSectionq\0~\0L\0nameq\0~\0xp\0\0��\0\0\0\0\0\0\0\0\0\0sr\0/net.sf.jasperreports.engine.base.JRBaseVariable\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDB\0calculationB\0\rincrementTypeZ\0isSystemDefinedB\0	resetTypeL\0calculationValuet\02Lnet/sf/jasperreports/engine/type/CalculationEnum;L\0\nexpressionq\0~\0L\0incrementGroupq\0~\0.L\0incrementTypeValuet\04Lnet/sf/jasperreports/engine/type/IncrementTypeEnum;L\0incrementerFactoryClassNameq\0~\0L\0incrementerFactoryClassRealNameq\0~\0L\0initialValueExpressionq\0~\0L\0nameq\0~\0L\0\nresetGroupq\0~\0.L\0resetTypeValuet\00Lnet/sf/jasperreports/engine/type/ResetTypeEnum;L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xp\0\0w�\0\0\0~r\00net.sf.jasperreports.engine.type.CalculationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0COUNTsq\0~\0�\0\0\0\nuq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)ppp~r\02net.sf.jasperreports.engine.type.IncrementTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NONEppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(0)ppt\0group1_COUNTq\0~,~r\0.net.sf.jasperreports.engine.type.ResetTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0GROUPt\0java.lang.Integerpsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0nullpp~r\03net.sf.jasperreports.engine.type.FooterPositionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NORMALpsq\0~\0&uq\0~\0)\0\0\0sq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0%sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new Boolean(sq\0~\0�t\0nombresq\0~\0�t\0	 != null)pppq\0~\0psq\0~\0&uq\0~\0)\0\0\0sq\0~\0sq\0~\0\0\0\0	w\0\0\0\nsr\01net.sf.jasperreports.engine.base.JRBaseStaticText\0\0\0\0\0\0\'�\0L\0textq\0~\0xq\0~\02\0\0��\0\0\0\0\0\0\0\0\0\0\0c\0\0\0k\0\0\0sq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~Zsq\0~\0C\0\0\0\0����pppt\0\rstaticText-18p~q\0~\0It\0OPAQUEppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j>�\0\0q\0~dq\0~dq\0~]psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~dq\0~dpsq\0~\0`\0\0��ppppq\0~dq\0~dpsq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j>L��q\0~dq\0~dpsq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~dq\0~dppppsq\0~\0yppq\0~\0}pq\0~]pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0	Productorsq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~Zsq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialsq\0~\0S\0\0\0\npq\0~\0Wq\0~\0�q\0~\0�q\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j>�\0\0q\0~|q\0~|q\0~vpsq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~|q\0~|psq\0~\0`\0\0��ppppq\0~|q\0~|psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~|q\0~|psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~|q\0~|ppppsq\0~\0yppq\0~\0}pq\0~vpppppt\0Cp1252t\0Helvetica-BoldObliqueppppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0(sq\0~\0�t\0idProductorsq\0~\0�t\0 == 0)?\"Todos los Productores\":sq\0~\0�t\0nombrepppppppq\0~\0Zppq\0~\0�psq\0~\\\0\0��\0\0\0\0\0\0\0\0\0\0\0W\0\0^\0\0\0Rsq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~Zsq\0~\0C\0\0\0\0����pppt\0\rstaticText-20pq\0~appq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�ppppsq\0~\0yppq\0~\0}pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0Número Internosq\0~\\\0\0��\0\0\0\0\0\0\0\0\0\0\0b\0\0�\0\0\0Rsq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~Zsq\0~\0C\0\0\0\0����pppt\0\rstaticText-20pq\0~appq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�ppppsq\0~\0yppq\0~\0}pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0Fecha Legalizaciónsq\0~\\\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0Rsq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~Zsq\0~\0C\0\0\0\0����pppt\0\rstaticText-18pq\0~appq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�ppppsq\0~\0yppq\0~\0}pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0	Productorsq\0~\\\0\0��\0\0\0\0\0\0\0\0\0\0\0R\0\0\0�\0\0\0Rsq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~Zsq\0~\0C\0\0\0\0����pppt\0\rstaticText-20pq\0~appq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�ppppsq\0~\0yppq\0~\0}pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0Númerosq\0~\\\0\0��\0\0\0\0\0\0\0\0\0\0\0P\0\0\0\0\0Rsq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~Zsq\0~\0C\0\0\0\0����pppt\0\rstaticText-20pq\0~appq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?@\0\0q\0~�q\0~�ppppsq\0~\0yppq\0~\0}pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0Períodosq\0~\\\0\0��\0\0\0\0\0\0\0\0\0\0\0c\0\0\0k\0\0\0*sq\0~\0C\0\0\0\0�xxxpppq\0~\0q\0~Zsq\0~\0C\0\0\0\0����pppt\0\rstaticText-18pq\0~appq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Upq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~q\0~q\0~\npsq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~q\0~psq\0~\0`\0\0��ppppq\0~q\0~psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j>L��q\0~q\0~psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~q\0~ppppsq\0~\0yppq\0~\0}pq\0~\npppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0Períodosq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0*sq\0~\0C\0\0\0\0����pppq\0~\0q\0~Zsq\0~\0C\0\0\0\0�\0\0\0pppt\0textField-15pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~{pq\0~\0Wq\0~\0�q\0~\0�q\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~&q\0~&q\0~!psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~&q\0~&psq\0~\0`\0\0��ppppq\0~&q\0~&psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j?�\0\0q\0~&q\0~&psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~&q\0~&ppppsq\0~\0yppq\0~\0}pq\0~!pppppt\0Cp1252t\0Helvetica-BoldObliqueppppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0(sq\0~\0�t\0periodosq\0~\0�t\0$.equals(\"0\"))?\"Todos los Períodos\":sq\0~\0�t\0periodopppppppq\0~\0Zppq\0~\0�pxp\0\0��\0\0\0asq\0~\0�\0\0\0\ruq\0~\0�\0\0\0sq\0~\0�t\0new Boolean(sq\0~\0�t\0nombresq\0~\0�t\0	 != null)pppq\0~\0t\0group1t\0reporteGuiasLegalizadasur\0*[Lnet.sf.jasperreports.engine.JRParameter;\"\0�*�`!\0\0xp\0\0\0sr\00net.sf.jasperreports.engine.base.JRBaseParameter\0\0\0\0\0\0\'�\0	Z\0isForPromptingZ\0isSystemDefinedL\0defaultValueExpressionq\0~\0L\0descriptionq\0~\0L\0nameq\0~\0L\0nestedTypeNameq\0~\0L\0\rpropertiesMapq\0~\0?L\0valueClassNameq\0~\0L\0valueClassRealNameq\0~\0xpppt\0REPORT_CONTEXTpsq\0~pppt\0)net.sf.jasperreports.engine.ReportContextpsq\0~Mppt\0REPORT_PARAMETERS_MAPpsq\0~pppt\0\rjava.util.Mappsq\0~Mppt\0\rJASPER_REPORTpsq\0~pppt\0(net.sf.jasperreports.engine.JasperReportpsq\0~Mppt\0REPORT_CONNECTIONpsq\0~pppt\0java.sql.Connectionpsq\0~Mppt\0REPORT_MAX_COUNTpsq\0~pppq\0~Dpsq\0~Mppt\0REPORT_DATA_SOURCEpsq\0~pppt\0(net.sf.jasperreports.engine.JRDataSourcepsq\0~Mppt\0REPORT_SCRIPTLETpsq\0~pppt\0/net.sf.jasperreports.engine.JRAbstractScriptletpsq\0~Mppt\0\rREPORT_LOCALEpsq\0~pppt\0java.util.Localepsq\0~Mppt\0REPORT_RESOURCE_BUNDLEpsq\0~pppt\0java.util.ResourceBundlepsq\0~Mppt\0REPORT_TIME_ZONEpsq\0~pppt\0java.util.TimeZonepsq\0~Mppt\0REPORT_FORMAT_FACTORYpsq\0~pppt\0.net.sf.jasperreports.engine.util.FormatFactorypsq\0~Mppt\0REPORT_CLASS_LOADERpsq\0~pppt\0java.lang.ClassLoaderpsq\0~Mppt\0\ZREPORT_URL_HANDLER_FACTORYpsq\0~pppt\0 java.net.URLStreamHandlerFactorypsq\0~Mppt\0REPORT_FILE_RESOLVERpsq\0~pppt\0-net.sf.jasperreports.engine.util.FileResolverpsq\0~Mppt\0REPORT_TEMPLATESpsq\0~pppt\0java.util.Collectionpsq\0~Mppt\0SORT_FIELDSpsq\0~pppt\0java.util.Listpsq\0~Mppt\0FILTERpsq\0~pppt\0)net.sf.jasperreports.engine.DatasetFilterpsq\0~Mppt\0REPORT_VIRTUALIZERpsq\0~pppt\0)net.sf.jasperreports.engine.JRVirtualizerpsq\0~Mppt\0IS_IGNORE_PAGINATIONpsq\0~pppt\0java.lang.Booleanpsq\0~M\0\0sq\0~\0�\0\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0\".\\\\\"pppt\0PATH_SUB_REPORTESpsq\0~pppt\0java.lang.Stringpsq\0~M\0ppt\0idProductorpsq\0~pppt\0java.lang.Longpsq\0~M\0ppt\0fechaReportepsq\0~pppt\0java.util.Datepsq\0~M\0sq\0~\0�\0\0\0ppppt\0periodopsq\0~pppt\0java.lang.Stringpsq\0~psq\0~\0\0\0\0w\0\0\0\nt\0ireport.scriptlethandlingt\0ireport.encodingt\0ireport.zoomt\0	ireport.xt\0	ireport.yxsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0q\0~�t\01.5q\0~�t\0UTF-8q\0~�t\00q\0~�t\0174q\0~�t\00xsr\0,net.sf.jasperreports.engine.base.JRBaseQuery\0\0\0\0\0\0\'�\0[\0chunkst\0+[Lnet/sf/jasperreports/engine/JRQueryChunk;L\0languageq\0~\0xpur\0+[Lnet.sf.jasperreports.engine.JRQueryChunk;@�\0��4�\0\0xp\0\0\0	sr\01net.sf.jasperreports.engine.base.JRBaseQueryChunk\0\0\0\0\0\0\'�\0B\0typeL\0textq\0~\0[\0tokenst\0[Ljava/lang/String;xpt\0�SELECT e.id as idProd, e.nombre, g.fechaLegalizacion, g.numero, g.numeroInterno, g.periodo\nFROM (x071vm20_siig.Entidad e inner join x071vm20_siig.Guia g\n       	  on e.id=g.productor_fk)\nWHERE (psq\0~�t\0idProductorpsq\0~�t\0 = 0 or psq\0~�t\0idProductorpsq\0~�t\0 = e.id)\n	and (psq\0~�t\0periodopsq\0~�t\0 = 0 or psq\0~�t\0periodopsq\0~�t\0[ = g.periodo)\n	and e.tipoEntidad = \"PRD\"\n	and g.tipoEstadoGuia = \"LEGALIZADA\"\norder by e.idpt\0sqlppppur\0)[Lnet.sf.jasperreports.engine.JRVariable;b�|�,�D\0\0xp\0\0\0sq\0~-\0\0w�\0\0\0~q\0~2t\0SYSTEMppq\0~:ppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)ppt\0PAGE_NUMBERp~q\0~At\0REPORTq\0~Dpsq\0~-\0\0w�\0\0\0q\0~�ppq\0~:ppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)ppt\0\rCOLUMN_NUMBERp~q\0~At\0PAGEq\0~Dpsq\0~-\0\0w�\0\0\0q\0~3sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)pppq\0~:ppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(0)ppt\0REPORT_COUNTpq\0~�q\0~Dpsq\0~-\0\0w�\0\0\0q\0~3sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)pppq\0~:ppsq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(0)ppt\0\nPAGE_COUNTpq\0~�q\0~Dpsq\0~-\0\0w�\0\0\0q\0~3sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(1)pppq\0~:ppsq\0~\0�\0\0\0	uq\0~\0�\0\0\0sq\0~\0�t\0new java.lang.Integer(0)ppt\0COLUMN_COUNTp~q\0~At\0COLUMNq\0~Dpq\0~1sq\0~-\0\0w�\0\0\0\0~q\0~2t\0SUMppq\0~:pppt\0totalDeudaCanonpq\0~�t\0java.lang.Doublepsq\0~-\0\0w�\0\0\0\0q\0~ppq\0~:pppt\0totalDeudaDeclaracionpq\0~�t\0java.lang.Doublep~r\0<net.sf.jasperreports.engine.type.WhenResourceMissingTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0NULLq\0~Jp~r\00net.sf.jasperreports.engine.type.OrientationEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0PORTRAITsq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\0+pq\0~\0q\0~sq\0~\0C\0\0\0\0����ppppppppq\0~\0Mppppq\0~\0P\0\0��ppppppppppppppppppsq\0~\0[psq\0~\0_\0\0��ppppq\0~q\0~q\0~\Zpsq\0~\0l\0\0��ppppq\0~q\0~psq\0~\0`\0\0��ppppq\0~q\0~psq\0~\0q\0\0��ppppq\0~q\0~psq\0~\0u\0\0��ppppq\0~q\0~ppppsq\0~\0yppppq\0~\Zppppppppppppppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0\Zuq\0~\0�\0\0\0sq\0~\0�t\0PAGE_NUMBERppppppppppppsq\0~\\\0\0��\0\0\0\0\0\0\0\0\0\0f\0\0\0X\0\0\0+sq\0~\0C\0\0\0\0����pppq\0~\0q\0~sq\0~\0C\0\0\0\0����pppt\0\rstaticText-24pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialsq\0~\0S\0\0\0pq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~-q\0~-q\0~\'psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~-q\0~-psq\0~\0`\0\0��ppppq\0~-q\0~-psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~-q\0~-psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~-q\0~-ppppsq\0~\0yppq\0~\0}pq\0~\'pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0�SISTEMA INTEGRAL DE INFORMACION AGROPECUARIA - Versión 1.0\nGEOINGENIERIA - Desarrollo RIDIERGROUP\nContacto: tel 02901-15561782 - geo.ingenieria@yahoo.com.arsq\0~\0-\0\0��\0\0\0\0\0\0\0\0\0\0\0}\0\0\0\0\0\0\0+sq\0~\0C\0\0\0\0����pppq\0~\0q\0~sq\0~\0C\0\0\0\0����pppt\0textField-15pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialq\0~\0Up~q\0~\0Vt\0LEFTq\0~\0Zq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Fq\0~Fq\0~?psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Fq\0~Fpsq\0~\0`\0\0��ppppq\0~Fq\0~Fpsq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Fq\0~Fpsq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~Fq\0~Fppppsq\0~\0yppq\0~\0}pq\0~?pppppt\0Cp1252t\0	Helveticappppq\0~\0�ppppq\0~\0�\0\0��\0\0\0\0\0\0\0\0ppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0fechaReportepppppppq\0~\0�ppt\0\ndd/MM/yyyypsr\0+net.sf.jasperreports.engine.base.JRBaseLine\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDB\0	directionL\0directionValuet\04Lnet/sf/jasperreports/engine/type/LineDirectionEnum;xr\05net.sf.jasperreports.engine.base.JRBaseGraphicElement\0\0\0\0\0\0\'�\0I\0PSEUDO_SERIAL_VERSION_UIDL\0fillq\0~\0L\0	fillValuet\0+Lnet/sf/jasperreports/engine/type/FillEnum;L\0linePent\0#Lnet/sf/jasperreports/engine/JRPen;L\0penq\0~\0xq\0~\0;\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*pq\0~\0q\0~sq\0~\0C\0\0\0\0����ppppppppq\0~\0Mppppq\0~\0P\0\0w�ppsq\0~\0a\0\0��ppppq\0~ap\0\0��\0~r\02net.sf.jasperreports.engine.type.LineDirectionEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0TOP_DOWNxp\0\0��\0\0\0Lppq\0~\0sq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~\\\0\0��\0\0\0\0\0\0\0\0\0\0f\0\0\0X\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~gsq\0~\0C\0\0\0\0�\0\0\0pppt\0\rstaticText-24pq\0~\0Jppq\0~\0Msq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new Boolean(sq\0~\0�t\0nombresq\0~\0�t\0	 != null)pppppq\0~\0P\0\0��pppppt\0Arialsq\0~\0S\0\0\0pq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0pppp~q\0~\0gt\0DOTTEDsq\0~\0j\0\0\0\0q\0~wq\0~wq\0~ipsq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~zsq\0~\0j\0\0\0\0q\0~wq\0~wpsq\0~\0`\0\0��ppq\0~zpq\0~wq\0~wpsq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~zsq\0~\0j\0\0\0\0q\0~wq\0~wpsq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~zsq\0~\0j\0\0\0\0q\0~wq\0~wppppsq\0~\0yppq\0~\0}pq\0~ipppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0\ZReporte Guías Legalizadassq\0~\\\0\0��\0\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~gsq\0~\0C\0\0\0\0�\0\0\0pppt\0\rstaticText-24pq\0~\0Jppq\0~\0Msq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0new Boolean(sq\0~\0�t\0nombresq\0~\0�t\0	 == null)pppppq\0~\0P\0\0��pppppt\0Arialq\0~vpq\0~\0Wq\0~\0�q\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�ppppsq\0~\0yppq\0~\0}pq\0~�pppppt\0Cp1252t\0Helvetica-Boldppppq\0~\0�ppppq\0~\0�t\0\ZNo hay datos para procesarxp\0\0��\0\0\0+ppq\0~\0~r\0/net.sf.jasperreports.engine.type.PrintOrderEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0VERTICALpsq\0~\0sq\0~\0\0\0\0\0w\0\0\0\nxp\0\0��\0\0\0\0ppq\0~\0psq\0~\0sq\0~\0\0\0\0w\0\0\0\nsq\0~\\\0\0��\0\0\0\"\0\0\0\0\0\0\0\0|\0\0�\0\0\02sq\0~\0C\0\0\0\0����pppq\0~\0q\0~�sq\0~\0C\0\0\0\0�\0\0\0pppt\0\rstaticText-23pq\0~\0Jppq\0~\0Mppppq\0~\0P\0\0��pppppt\0Arialsq\0~\0S\0\0\0pq\0~\0Wq\0~\0Zq\0~\0Zq\0~\0Zq\0~\0Zpq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�ppppsq\0~\0yppq\0~\0}pq\0~�pppppt\0Cp1252t\0	Helveticappppq\0~\0�pppp~q\0~\0�t\0TOPt\0�Provincia de Tierra del Fuego, Antártida\ne Islas del Atlántico Sur\nRepública Argentina\nSecretaria de Desarrollo Sustentable y Ambiente\nDirección General de Bosques\nsr\0,net.sf.jasperreports.engine.base.JRBaseImage\0\0\0\0\0\0\'�\0*I\0PSEUDO_SERIAL_VERSION_UIDI\0\rbookmarkLevelB\0evaluationTimeB\0hyperlinkTargetB\0\rhyperlinkTypeZ\0isLazyB\0onErrorTypeL\0anchorNameExpressionq\0~\0L\0borderq\0~\0L\0borderColorq\0~\03L\0bottomBorderq\0~\0L\0bottomBorderColorq\0~\03L\0\rbottomPaddingq\0~\04L\0evaluationGroupq\0~\0.L\0evaluationTimeValueq\0~\0/L\0\nexpressionq\0~\0L\0horizontalAlignmentq\0~\0L\0horizontalAlignmentValueq\0~\05L\0hyperlinkAnchorExpressionq\0~\0L\0hyperlinkPageExpressionq\0~\0[\0hyperlinkParametersq\0~\00L\0hyperlinkReferenceExpressionq\0~\0L\0\ZhyperlinkTooltipExpressionq\0~\0L\0isUsingCacheq\0~\01L\0\nleftBorderq\0~\0L\0leftBorderColorq\0~\03L\0leftPaddingq\0~\04L\0lineBoxq\0~\06L\0\nlinkTargetq\0~\0L\0linkTypeq\0~\0L\0onErrorTypeValuet\02Lnet/sf/jasperreports/engine/type/OnErrorTypeEnum;L\0paddingq\0~\04L\0rightBorderq\0~\0L\0rightBorderColorq\0~\03L\0rightPaddingq\0~\04L\0\nscaleImageq\0~\0L\0scaleImageValuet\01Lnet/sf/jasperreports/engine/type/ScaleImageEnum;L\0	topBorderq\0~\0L\0topBorderColorq\0~\03L\0\ntopPaddingq\0~\04L\0verticalAlignmentq\0~\0L\0verticalAlignmentValueq\0~\0:xq\0~^\0\0��\0\0\0&\0\0\0\0\0\0\0\04\0\0�\0\0\0sq\0~\0C\0\0\0\0����pppq\0~\0q\0~�sq\0~\0C\0\0\0\0�\0\0\0pppt\0image-1pq\0~appq\0~\0Mppppq\0~\0P\0\0w�p~r\0)net.sf.jasperreports.engine.type.FillEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0SOLIDsq\0~\0a\0\0��ppq\0~\0hsq\0~\0j\0\0\0\0q\0~�p\0\0��\0\0\0\0\0\0\0\0\0pppppppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0PATH_SUB_REPORTESsq\0~\0�t\00+System.getProperty(\"file.separator\")+\"logo.jpg\"pppq\0~Dpppppq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�pp~r\00net.sf.jasperreports.engine.type.OnErrorTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ERRORppppp~r\0/net.sf.jasperreports.engine.type.ScaleImageEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\nFILL_FRAMEppppq\0~�sq\0~�\0\0��\0\0\07\0\0\0\0\0\0\0\0}\0\0\0\n\0\0\0\nsq\0~\0C\0\0\0\0����pppq\0~\0q\0~�sq\0~\0C\0\0\0\0�\0\0\0pppt\0image-1pq\0~appq\0~\0Mppppq\0~\0P\0\0w�pq\0~�sq\0~\0a\0\0��ppq\0~\0hsq\0~\0j\0\0\0\0q\0~�p\0\0��\0\0\0\0\0\0\0\0\0pppppppq\0~\0�sq\0~\0�\0\0\0uq\0~\0�\0\0\0sq\0~\0�t\0PATH_SUB_REPORTESsq\0~\0�t\04+System.getProperty(\"file.separator\")+\"LOGOSIIA.jpg\"pppq\0~Dpppppq\0~\0Zpppsq\0~\0[psq\0~\0_\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�q\0~�psq\0~\0l\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0`\0\0��ppppq\0~�q\0~�psq\0~\0q\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�psq\0~\0u\0\0��sq\0~\0C\0\0\0\0�\0\0\0ppppq\0~\0hsq\0~\0j\0\0\0\0q\0~�q\0~�ppq\0~�pppppq\0~�ppppq\0~�xp\0\0��\0\0\0jppq\0~\0~r\03net.sf.jasperreports.engine.type.WhenNoDataTypeEnum\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ALL_SECTIONS_NO_DETAILsr\06net.sf.jasperreports.engine.design.JRReportCompileData\0\0\0\0\0\0\'�\0L\0crosstabCompileDataq\0~L\0datasetCompileDataq\0~L\0mainDatasetCompileDataq\0~\0xpsq\0~�?@\0\0\0\0\0w\0\0\0\0\0\0\0xsq\0~�?@\0\0\0\0\0w\0\0\0\0\0\0\0xur\0[B���T�\0\0xp\0\0�����\0\0\0.1\0,reporteGuiasLegalizadas_1391190859456_831418\0\0,net/sf/jasperreports/engine/fill/JREvaluator\0\0parameter_REPORT_LOCALE\02Lnet/sf/jasperreports/engine/fill/JRFillParameter;\0parameter_PATH_SUB_REPORTES\0parameter_JASPER_REPORT\0parameter_REPORT_VIRTUALIZER\0\Zparameter_REPORT_TIME_ZONE\0parameter_SORT_FIELDS\0parameter_REPORT_FILE_RESOLVER\0\Zparameter_REPORT_SCRIPTLET\0parameter_REPORT_PARAMETERS_MAP\0parameter_REPORT_CONNECTION\0parameter_fechaReporte\0parameter_REPORT_CONTEXT\0parameter_REPORT_CLASS_LOADER\0parameter_REPORT_DATA_SOURCE\0$parameter_REPORT_URL_HANDLER_FACTORY\0parameter_IS_IGNORE_PAGINATION\0parameter_FILTER\0parameter_REPORT_FORMAT_FACTORY\0\Zparameter_REPORT_MAX_COUNT\0\Zparameter_REPORT_TEMPLATES\0parameter_idProductor\0parameter_periodo\0 parameter_REPORT_RESOURCE_BUNDLE\0field_nombre\0.Lnet/sf/jasperreports/engine/fill/JRFillField;\0field_idProd\0field_numeroInterno\0field_fechaLegalizacion\0\rfield_periodo\0field_numero\0variable_PAGE_NUMBER\01Lnet/sf/jasperreports/engine/fill/JRFillVariable;\0variable_COLUMN_NUMBER\0variable_REPORT_COUNT\0variable_PAGE_COUNT\0variable_COLUMN_COUNT\0variable_group1_COUNT\0variable_totalDeudaCanon\0variable_totalDeudaDeclaracion\0<init>\0()V\0Code\0-\0.\n\0\00\0\0	\0\02\0\0	\0\04\0\0	\0\06\0	\0	\0\08\0\n\0	\0\0:\0\0	\0\0<\0\0	\0\0>\0\r\0	\0\0@\0\0	\0\0B\0\0	\0\0D\0\0	\0\0F\0\0	\0\0H\0\0	\0\0J\0\0	\0\0L\0\0	\0\0N\0\0	\0\0P\0\0	\0\0R\0\0	\0\0T\0\0	\0\0V\0\0	\0\0X\0\Z\0	\0\0Z\0\0	\0\0\\\0\0	\0\0^\0\0	\0\0`\0\0	\0\0b\0 \0	\0\0d\0!\0	\0\0f\0\"\0	\0\0h\0#\0	\0\0j\0$\0%	\0\0l\0&\0%	\0\0n\0\'\0%	\0\0p\0(\0%	\0\0r\0)\0%	\0\0t\0*\0%	\0\0v\0+\0%	\0\0x\0,\0%	\0\0z\0LineNumberTable\0customizedInit\00(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V\0\ninitParams\0(Ljava/util/Map;)V\0\0�\n\0\0�\0\ninitFields\0�\0�\n\0\0�\0initVars\0�\0�\n\0\0�\0\rREPORT_LOCALE\0�\0\rjava/util/Map\0�\0get\0&(Ljava/lang/Object;)Ljava/lang/Object;\0�\0�\0�\0�\00net/sf/jasperreports/engine/fill/JRFillParameter\0�\0PATH_SUB_REPORTES\0�\0\rJASPER_REPORT\0�\0REPORT_VIRTUALIZER\0�\0REPORT_TIME_ZONE\0�\0SORT_FIELDS\0�\0REPORT_FILE_RESOLVER\0�\0REPORT_SCRIPTLET\0�\0REPORT_PARAMETERS_MAP\0�\0REPORT_CONNECTION\0�\0fechaReporte\0�\0REPORT_CONTEXT\0�\0REPORT_CLASS_LOADER\0�\0REPORT_DATA_SOURCE\0�\0\ZREPORT_URL_HANDLER_FACTORY\0�\0IS_IGNORE_PAGINATION\0�\0FILTER\0�\0REPORT_FORMAT_FACTORY\0�\0REPORT_MAX_COUNT\0�\0REPORT_TEMPLATES\0�\0idProductor\0�\0periodo\0�\0REPORT_RESOURCE_BUNDLE\0�\0nombre\0�\0,net/sf/jasperreports/engine/fill/JRFillField\0�\0idProd\0�\0\rnumeroInterno\0�\0fechaLegalizacion\0�\0numero\0�\0PAGE_NUMBER\0�\0/net/sf/jasperreports/engine/fill/JRFillVariable\0�\0\rCOLUMN_NUMBER\0�\0REPORT_COUNT\0�\0\nPAGE_COUNT\0�\0COLUMN_COUNT\0�\0group1_COUNT\0�\0totalDeudaCanon\0�\0totalDeudaDeclaracion\0�\0evaluate\0(I)Ljava/lang/Object;\0\nExceptions\0java/lang/Throwable\0�\0.\\\0�\0java/lang/Integer\0�\0(I)V\0-\0�\n\0�\0�\0java/lang/Boolean\0�\0getValue\0()Ljava/lang/Object;\0�\0�\n\0�\0�\0java/lang/String\0�\0(Z)V\0-\0�\n\0�\0�\n\0�\0�\0java/lang/Long\0�\0	longValue\0()J\0�\0�\n\0�\0�\0Todos los Productores\0�\00\0�\0equals\0(Ljava/lang/Object;)Z\0�\0\n\0�\0Todos los Períodos\0java/lang/StringBuffer\0valueOf\0&(Ljava/lang/Object;)Ljava/lang/String;\n\0�	\0(Ljava/lang/String;)V\0-\n\0file.separator\0java/lang/System\0getProperty\0&(Ljava/lang/String;)Ljava/lang/String;\n\0append\0,(Ljava/lang/String;)Ljava/lang/StringBuffer;\n\0logo.jpg\Z\0toString\0()Ljava/lang/String;\n\0LOGOSIIA.jpg \0java/sql/Timestamp\"\n\0�\0�\0java/util/Date%\0evaluateOld\0getOldValue(\0�\n\0�)\n\0�)\0evaluateEstimated\0getEstimatedValue-\0�\n\0�.\0\nSourceFile\0!\0\0\0\0\0%\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\0\0\0\0\0\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \0\0\0\0\0!\0\0\0\0\0\"\0\0\0\0\0#\0\0\0\0\0$\0%\0\0\0\0&\0%\0\0\0\0\'\0%\0\0\0\0(\0%\0\0\0\0)\0%\0\0\0\0*\0%\0\0\0\0+\0%\0\0\0\0,\0%\0\0\0\0\0-\0.\0\0/\0\0n\0\0\0\0\0�*�\01*�\03*�\05*�\07*�\09*�\0;*�\0=*�\0?*�\0A*�\0C*�\0E*�\0G*�\0I*�\0K*�\0M*�\0O*�\0Q*�\0S*�\0U*�\0W*�\0Y*�\0[*�\0]*�\0_*�\0a*�\0c*�\0e*�\0g*�\0i*�\0k*�\0m*�\0o*�\0q*�\0s*�\0u*�\0w*�\0y*�\0{�\0\0\0\0|\0\0\0�\0\'\0\0\0\0\0\0	\0\0\0\0\0\0\0 \0\0!\0\"\0\"\0\'\0#\0,\0$\01\0%\06\0&\0;\0\'\0@\0(\0E\0)\0J\0*\0O\0+\0T\0,\0Y\0-\0^\0.\0c\0/\0h\00\0m\01\0r\02\0w\03\0|\04\0�\05\0�\06\0�\07\0�\08\0�\09\0�\0:\0�\0;\0�\0<\0�\0=\0�\0>\0�\0?\0�\0@\0�\0\0\0}\0~\0\0/\0\0\04\0\0\0\0\0*+�\0�*,�\0�*-�\0��\0\0\0\0|\0\0\0\0\0\0\0L\0\0M\0\n\0N\0\0O\0\0\0�\0\0/\0\0\0\0\0\0�*+��\0�\0�\0��\0��\03*+��\0�\0�\0��\0��\05*+��\0�\0�\0��\0��\07*+��\0�\0�\0��\0��\09*+��\0�\0�\0��\0��\0;*+��\0�\0�\0��\0��\0=*+��\0�\0�\0��\0��\0?*+��\0�\0�\0��\0��\0A*+��\0�\0�\0��\0��\0C*+��\0�\0�\0��\0��\0E*+��\0�\0�\0��\0��\0G*+��\0�\0�\0��\0��\0I*+��\0�\0�\0��\0��\0K*+��\0�\0�\0��\0��\0M*+��\0�\0�\0��\0��\0O*+��\0�\0�\0��\0��\0Q*+��\0�\0�\0��\0��\0S*+��\0�\0�\0��\0��\0U*+��\0�\0�\0��\0��\0W*+��\0�\0�\0��\0��\0Y*+��\0�\0�\0��\0��\0[*+��\0�\0�\0��\0��\0]*+��\0�\0�\0��\0��\0_�\0\0\0\0|\0\0\0b\0\0\0\0W\0\0X\0$\0Y\06\0Z\0H\0[\0Z\0\\\0l\0]\0~\0^\0�\0_\0�\0`\0�\0a\0�\0b\0�\0c\0�\0d\0�\0e\0f \0g2\0hD\0iV\0jh\0kz\0l�\0m�\0n\0\0�\0�\0\0/\0\0\0�\0\0\0\0\0m*+��\0�\0�\0��\0µ\0a*+Ĺ\0�\0�\0��\0µ\0c*+ƹ\0�\0�\0��\0µ\0e*+ȹ\0�\0�\0��\0µ\0g*+��\0�\0�\0��\0µ\0i*+ʹ\0�\0�\0��\0µ\0k�\0\0\0\0|\0\0\0\0\0\0\0v\0\0w\0$\0x\06\0y\0H\0z\0Z\0{\0l\0|\0\0�\0�\0\0/\0\0\0�\0\0\0\0\0�*+̹\0�\0�\0��\0ε\0m*+й\0�\0�\0��\0ε\0o*+ҹ\0�\0�\0��\0ε\0q*+Թ\0�\0�\0��\0ε\0s*+ֹ\0�\0�\0��\0ε\0u*+ع\0�\0�\0��\0ε\0w*+ڹ\0�\0�\0��\0ε\0y*+ܹ\0�\0�\0��\0ε\0{�\0\0\0\0|\0\0\0&\0	\0\0\0�\0\0�\0$\0�\06\0�\0H\0�\0Z\0�\0l\0�\0~\0�\0�\0�\0\0�\0�\0\0�\0\0\0\0\0�\0/\0\0x\0\0\0\0|M�\0\0w\0\0\0\0\0\0\0\0\0\0}\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\0\0\0\"\0\0G\0\0m\0\0�\0\0�\0\0�\0\0�\0\0\0\0&\0\04\0\0B\0\0P\0\0^\0\0l�M��M��\0�Y�\0�M��\0�Y�\0�M�ڻ\0�Y�\0�M�λ\0�Y�\0�M�»\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M�zM�u�\0�Y*�\0a�\0��\0��\0�\0�\0�M�X*�\0[�\0��\0��\0�	��\0�\0\r*�\0a�\0��\0�M�3*�\0]�\0��\0����\0	�\0\r*�\0i�\0��\0�M�\r�\0�Y*�\0a�\0��\0��\0�\0�\0�M�\0�Y*�\05�\0��\0�\n�\r����M�\0ƻY*�\05�\0��\0�\n�\r��!��M�\0��\0�Y*�\0a�\0��\0��\0�\0�\0�M�\0�\0�Y*�\0a�\0��\0��\0�\0�\0�M�\0b*�\0k�\0��\0�M�\0T*�\0a�\0��\0�M�\0F*�\0e�\0��\0�M�\08*�\0i�\0��\0�M�\0**�\0g�\0��#M�\0*�\0m�$�\0�M�\0*�\0G�\0��&M,�\0\0\0\0|\0\0\0�\0:\0\0\0�\0\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0�\0\0�\0�\0�\0�\"\0�%\0�G\0�J\0�m\0�p\0��\0��\0��\0��\0��\0��\0��\0��\0�\0�&)4	7\rBEPS^alo!z)\0\'\0�\0\0�\0\0\0\0\0�\0/\0\0x\0\0\0\0|M�\0\0w\0\0\0\0\0\0\0\0\0\0}\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\0\0\0\"\0\0G\0\0m\0\0�\0\0�\0\0�\0\0�\0\0\0\0&\0\04\0\0B\0\0P\0\0^\0\0l�M��M��\0�Y�\0�M��\0�Y�\0�M�ڻ\0�Y�\0�M�λ\0�Y�\0�M�»\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M�zM�u�\0�Y*�\0a�*�\0��\0�\0�\0�M�X*�\0[�\0��\0��\0�	��\0�\0\r*�\0a�*�\0�M�3*�\0]�\0��\0����\0	�\0\r*�\0i�*�\0�M�\r�\0�Y*�\0a�*�\0��\0�\0�\0�M�\0�Y*�\05�\0��\0�\n�\r����M�\0ƻY*�\05�\0��\0�\n�\r��!��M�\0��\0�Y*�\0a�*�\0��\0�\0�\0�M�\0�\0�Y*�\0a�*�\0��\0�\0�\0�M�\0b*�\0k�*�\0�M�\0T*�\0a�*�\0�M�\0F*�\0e�*�\0�M�\08*�\0i�*�\0�M�\0**�\0g�*�#M�\0*�\0m�+�\0�M�\0*�\0G�\0��&M,�\0\0\0\0|\0\0\0�\0:\0\02\04\0�8\0�9\0�=\0�>\0�B\0�C\0�G\0�H\0�L\0�M\0�Q\0�R\0�V\0�W\0�[\0�\\\0�`\0�a\0�e\0�f\0�j\0�k\0�o\0ptuy\"z%~GJ�m�p�������������������&�)�4�7�B�E�P�S�^�a�l�o�z�\0,\0�\0\0�\0\0\0\0\0�\0/\0\0x\0\0\0\0|M�\0\0w\0\0\0\0\0\0\0\0\0\0}\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0�\0\0\0\0\0\0\0\"\0\0G\0\0m\0\0�\0\0�\0\0�\0\0�\0\0\0\0&\0\04\0\0B\0\0P\0\0^\0\0l�M��M��\0�Y�\0�M��\0�Y�\0�M�ڻ\0�Y�\0�M�λ\0�Y�\0�M�»\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M���\0�Y�\0�M�zM�u�\0�Y*�\0a�\0��\0��\0�\0�\0�M�X*�\0[�\0��\0��\0�	��\0�\0\r*�\0a�\0��\0�M�3*�\0]�\0��\0����\0	�\0\r*�\0i�\0��\0�M�\r�\0�Y*�\0a�\0��\0��\0�\0�\0�M�\0�Y*�\05�\0��\0�\n�\r����M�\0ƻY*�\05�\0��\0�\n�\r��!��M�\0��\0�Y*�\0a�\0��\0��\0�\0�\0�M�\0�\0�Y*�\0a�\0��\0��\0�\0�\0�M�\0b*�\0k�\0��\0�M�\0T*�\0a�\0��\0�M�\0F*�\0e�\0��\0�M�\08*�\0i�\0��\0�M�\0**�\0g�\0��#M�\0*�\0m�/�\0�M�\0*�\0G�\0��&M,�\0\0\0\0|\0\0\0�\0:\0\0�\0�\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0��\0�\0�\0�\0�	\0�\r\0\"%GJ!m\"p&�\'�+�,�0�1�5�6�:;?&@)D4E7IBJENPOSS^TaXlYo]ze\00\0\0\0\0t\0_1391190859456_831418t\02net.sf.jasperreports.engine.design.JRJavacCompiler','reporteGuiasLegalizadas',NULL);
/*!40000 ALTER TABLE `Reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoAutorizacion`
--

DROP TABLE IF EXISTS `TipoAutorizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoAutorizacion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoAutorizacion`
--

LOCK TABLES `TipoAutorizacion` WRITE;
/*!40000 ALTER TABLE `TipoAutorizacion` DISABLE KEYS */;
INSERT INTO `TipoAutorizacion` VALUES (1,'Solicitud y gestión de Guías de Campaña'),(2,'Solicitud de Renovación de Títulos'),(3,'Otra Solicitud');
/*!40000 ALTER TABLE `TipoAutorizacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-31 15:09:48
