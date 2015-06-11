CREATE DATABASE  IF NOT EXISTS `dbventas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbventas`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: dbventas
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cod_cli` varchar(6) NOT NULL,
  `nom_cli` varchar(200) NOT NULL,
  `apel_cli` varchar(200) NOT NULL,
  `dni_cli` varchar(8) DEFAULT NULL,
  `ruc_cli` varchar(11) DEFAULT NULL,
  `dir_cli` varchar(200) DEFAULT NULL,
  `email_cli` varchar(100) DEFAULT NULL,
  `tel_cli` varchar(9) DEFAULT NULL,
  `estado_cli` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`cod_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='creando tabla lciente y relacionadola';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprobante` (
  `idcomprobante` varchar(10) NOT NULL,
  `cod_cli` varchar(6) NOT NULL,
  `cod_ven` varchar(6) NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `serie` varchar(6) NOT NULL,
  `correlativo` varchar(10) NOT NULL,
  `ruc_cli` varchar(11) NOT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `igv` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `fec_comp` date NOT NULL,
  `est_com` varchar(1) NOT NULL,
  PRIMARY KEY (`idcomprobante`),
  KEY `FK_cod_cli_idx` (`cod_cli`),
  KEY `fk_cod_ven_idx` (`cod_ven`),
  CONSTRAINT `FK_cod_cli` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cod_ven` FOREIGN KEY (`cod_ven`) REFERENCES `vendedor` (`cod_ven`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Creación de la tabla comprobante   08/06/2015.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_comprobante`
--

DROP TABLE IF EXISTS `detalle_comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_comprobante` (
  `id_detalle_c` int(11) NOT NULL AUTO_INCREMENT,
  `id_comprobante` varchar(10) NOT NULL,
  `cod_pro` varchar(6) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `pre_unit` decimal(15,2) NOT NULL,
  `pre_total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_detalle_c`),
  KEY `ifk_comprobante_idx` (`id_comprobante`),
  KEY `fk_codpr_idx` (`cod_pro`),
  CONSTRAINT `fk_codpr` FOREIGN KEY (`cod_pro`) REFERENCES `productos` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ifk_comprobante` FOREIGN KEY (`id_comprobante`) REFERENCES `comprobante` (`idcomprobante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_comprobante`
--

LOCK TABLES `detalle_comprobante` WRITE;
/*!40000 ALTER TABLE `detalle_comprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `cod_pro` varchar(6) NOT NULL,
  `cod_proveedor` varchar(6) NOT NULL,
  `descrip_pro` varchar(200) NOT NULL,
  `precio_pro` decimal(15,2) NOT NULL,
  `stock_pro` int(11) NOT NULL,
  PRIMARY KEY (`cod_pro`),
  KEY `fk_codpv_idx` (`cod_proveedor`),
  CONSTRAINT `fk_codpv` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedor` (`cod_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `cod_proveedor` varchar(6) NOT NULL,
  `nom_pv` varchar(200) NOT NULL,
  `dir_pv` varchar(200) NOT NULL,
  `tel_pv` varchar(9) DEFAULT NULL,
  `email_pv` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('PV0001','Ramiro distribuciones S.R.L','Calle pierola #243','984376546','ramiro_@hotmail.com'),('PV0002','Sagen Peru Wordk S.A','Calle los delirios SN','974627436','sagenperu@hotmail.com'),('PV0003','C.N.C Industrial S.R.L','Calle pizarro #234','984376546','CNC_industrial_@gmail.com'),('PV0004','Corporación Mara S.A','AV Avicion #6702','984376546','Corpo_Mara@hotmail.com'),('PV0005','computec','Calle Muños najar SN','984376546','ramiro_@hotmail.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `cod_ven` varchar(6) NOT NULL,
  `nom_ven` varchar(200) NOT NULL,
  `ape_ven` varchar(200) NOT NULL,
  `dni_ven` varchar(8) NOT NULL,
  `dir_ven` varchar(200) NOT NULL,
  `tel_ven` varchar(9) NOT NULL,
  `estcivil_ven` varchar(1) NOT NULL,
  `estado_ven` varchar(1) NOT NULL,
  `email_ven` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cod_ven`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES ('VE0001','Juan','Fernando Uribe','48571232','Las Gardenias #5762','951204796','C','A','juribe@hotmail.com'),('VE0002','Andres','Galvez Gutierrez','49743120','AV. Jesus #1254','487410236','S','A','galvez_andre@homail.com'),('VE0003','Jenniffer','Condori Choque','47510248','AV. Parra S/N','978410369','S','A','jenni_12@gmail.com'),('VE0004','Gabriel','Hernandez','46218219','las colmenas #360','862182193','C','A','hernandez_ga@hotmail.com'),('VE0005','Jorge','Vargar','46218219','Calle Alvares Tomas','948394546','S','A','jorgito_92@hotmail.com'),('VE0006','Carlos','Tejada','48345235','Calle Sanchez Peraltilla #425','43565356','S','A','tejada@hotmail.com'),('VE0007','Maribel','LLerena','53563325','AV. Las Palmeras','954728495','S','A','mari_12_45@gmail.com'),('VE0008','Alejandro','Portillo','43566245','Calle 8 de Octubre #567','954352245','S','A','alejandro@gmail.com'),('VE0009','Maria','Galribaldi','48356943','AV. Santa rosa #364','954683465','S','A','mari@gmail.com'),('VE0010','Mariela','Flores Rocio','45678532','AV. Javier Prado #2170','964245684','S','A','Mariela_FR@gmail'),('VE0011','Adrian','Shepard','64367859','Calle minerva Piñares','845635678','S','A','adri_shepard@gmail.com'),('VE0012','Daniel','Vizcarra','74583950','AV. jerusalen #873','84376546','S','A','dani_viz@hotmail.com');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-10 19:27:21
