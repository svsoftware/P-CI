-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-06-2015 a las 21:43:57
-- Versión del servidor: 5.5.20
-- Versión de PHP: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dbventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
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

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cod_cli`, `nom_cli`, `apel_cli`, `dni_cli`, `ruc_cli`, `dir_cli`, `email_cli`, `tel_cli`, `estado_cli`) VALUES
('CL0001', 'Juan', 'Barrantes', '14789652', '12457898521', 'Los Arces 202', NULL, '215487', 'A'),
('CL0002', 'Maria', 'Salas', '98653214', '', 'Los girasoles 303', NULL, '548798', 'A'),
('CL0003', 'Pedro', 'Valencia', '54898652', '', 'Av melgar 202', NULL, '986532147', 'A'),
('CL0004', 'Jesenia', 'Velarde', '78451235', '', 'Los Arces 2020', NULL, '124578', 'A'),
('CL0005', 'Roberto', 'Corrales', '', '14785236987', 'Los Arces 303', NULL, '986578457', 'A'),
('CL0006', 'Luana', 'Cortisales', '', '12345678965', 'Av aviacion 1200', NULL, '457896214', 'A'),
('CL0007', 'Paul', 'Morales', '98745878', '', 'Cayma 205', NULL, '147852369', 'A'),
('CL0008', 'Sergio', 'Tejada', '21578954', NULL, 'Merino Rosales 456', NULL, '95862478', 'A'),
('CL0009', 'Gustavo', 'Ferreyros', '21548798', NULL, 'J.B 47 A', NULL, '147852', 'A'),
('CL0010', 'Daniel', 'Alcca', '98653214', NULL, 'Melgar 203', NULL, '145875', 'A'),
('CL0011', 'Carlos', 'Zagastizabal', '45862178', NULL, 'Paucarpata 205', NULL, '215487', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobante`
--

CREATE TABLE IF NOT EXISTS `comprobante` (
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
  KEY `fk_cod_ven_idx` (`cod_ven`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Creación de la tabla comprobante   08/06/2015.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_comprobante`
--

CREATE TABLE IF NOT EXISTS `detalle_comprobante` (
  `id_detalle_c` int(11) NOT NULL AUTO_INCREMENT,
  `id_comprobante` varchar(10) NOT NULL,
  `cod_pro` varchar(6) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `pre_unit` decimal(15,2) NOT NULL,
  `pre_total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id_detalle_c`),
  KEY `ifk_comprobante_idx` (`id_comprobante`),
  KEY `fk_codpr_idx` (`cod_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `cod_pro` varchar(6) NOT NULL,
  `cod_proveedor` varchar(6) NOT NULL,
  `descrip_pro` varchar(200) NOT NULL,
  `precio_pro` decimal(15,2) NOT NULL,
  `stock_pro` int(11) NOT NULL,
  PRIMARY KEY (`cod_pro`),
  KEY `fk_codpv_idx` (`cod_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `cod_proveedor` varchar(6) NOT NULL,
  `nom_pv` varchar(200) NOT NULL,
  `dir_pv` varchar(200) NOT NULL,
  `tel_pv` varchar(9) DEFAULT NULL,
  `email_pv` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE IF NOT EXISTS `vendedor` (
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

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comprobante`
--
ALTER TABLE `comprobante`
  ADD CONSTRAINT `fk_cod_ven` FOREIGN KEY (`cod_ven`) REFERENCES `vendedor` (`cod_ven`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_cod_cli` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_comprobante`
--
ALTER TABLE `detalle_comprobante`
  ADD CONSTRAINT `fk_codpr` FOREIGN KEY (`cod_pro`) REFERENCES `productos` (`cod_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ifk_comprobante` FOREIGN KEY (`id_comprobante`) REFERENCES `comprobante` (`idcomprobante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_codpv` FOREIGN KEY (`cod_proveedor`) REFERENCES `proveedor` (`cod_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
