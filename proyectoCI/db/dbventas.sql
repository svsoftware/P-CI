CREATE DATABASE  IF NOT EXISTS `dbventas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbventas`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: dbventas
-- ------------------------------------------------------
-- Server version	5.5.20-log

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
  PRIMARY KEY (`idcomprobante`)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-08 19:05:56
