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
  CONSTRAINT `fk_cod_ven` FOREIGN KEY (`cod_ven`) REFERENCES `vendedor` (`cod_ven`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cod_cli` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`) ON DELETE CASCADE ON UPDATE CASCADE
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

-- Dump completed on 2015-06-09 19:13:11
