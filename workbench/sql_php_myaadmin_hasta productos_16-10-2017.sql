-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2017 a las 17:41:37
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sofi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `codigo` int(100) NOT NULL,
  `Cedula` varchar(50) NOT NULL,
  `Nombres` varchar(35) NOT NULL,
  `Telefono` varchar(40) DEFAULT NULL,
  `Celular` varchar(40) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `Direccion` varchar(150) DEFAULT NULL,
  `Provincia` varchar(95) DEFAULT NULL,
  `Ciudad` varchar(15) DEFAULT NULL,
  `Nacionalidad` varchar(75) DEFAULT NULL,
  `PagoPredeterminado` int(100) DEFAULT NULL,
  `TipoCliente` int(100) DEFAULT NULL,
  `VendedorPredeterminado` int(100) DEFAULT NULL,
  `Observaciones` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codigo`, `Cedula`, `Nombres`, `Telefono`, `Celular`, `mail`, `Direccion`, `Provincia`, `Ciudad`, `Nacionalidad`, `PagoPredeterminado`, `TipoCliente`, `VendedorPredeterminado`, `Observaciones`) VALUES
(1, '1722239967', 'JIMMY CARRION', '09992669329', '09992669329', '', 'COOPERATIVA GRAN COLOMBIA', '', '', 'ACTIVO', 1, 1, 1, 'obsercvaciones'),
(2, '9999999999', 'CONSUMIDOR FINAL', '99999999', '999999999', '', '', '', '', 'ACTIVO', 0, 0, 0, 'ee'),
(3, '1717148371', 'SHEICY QUINTANA', '5555555', '0991781881', '', 'LAS PALMAS', '', '', 'ACTIVO', 1, 1, 1, 'obsercvaciones'),
(4, '17222399655', 'ASASDSD', '9999999', '5555555', 'homer_loading@hotmail.com', 'ASDADSASD', 'SDFSDF', 'SDF', 'ACTIVO', 0, 0, 0, 'ee');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config`
--

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `codigo` int(100) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `valor1` varchar(45) DEFAULT NULL,
  `valor2` varchar(45) DEFAULT NULL,
  `valor3` varchar(45) DEFAULT NULL,
  `valor4` varchar(45) DEFAULT NULL,
  `valor5` varchar(45) DEFAULT NULL,
  `valor6` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `config`
--

INSERT INTO `config` (`codigo`, `nombre`, `valor1`, `valor2`, `valor3`, `valor4`, `valor5`, `valor6`) VALUES
(1, 'IVA', '12', NULL, NULL, NULL, NULL, NULL),
(2, 'UTILIDAD', '30', NULL, NULL, NULL, NULL, NULL),
(3, 'MONEDA', 'DOALRES AMERICANOS', NULL, NULL, NULL, NULL, NULL),
(4, 'IMPRESORA TICKETS', 'Microsoft Print to PDF', NULL, NULL, NULL, NULL, NULL),
(5, 'IMPRESORA FACTURAS', 'Generic', NULL, NULL, NULL, NULL, NULL),
(6, 'NUMERO DE VECES QUE SE IMPRIMIRÁ FACTURA', '2', NULL, NULL, NULL, NULL, NULL),
(7, 'DOCUMENTO PREDETERMINADO', 'FACTURA', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_equipos`
--

DROP TABLE IF EXISTS `config_equipos`;
CREATE TABLE `config_equipos` (
  `codigo` int(100) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `valor1` varchar(45) DEFAULT NULL,
  `valor2` varchar(45) DEFAULT NULL,
  `valor3` varchar(45) DEFAULT NULL,
  `valor4` varchar(45) DEFAULT NULL,
  `valor5` varchar(45) DEFAULT NULL,
  `valor6` varchar(45) DEFAULT NULL,
  `equipos_Codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `config_equipos`
--

INSERT INTO `config_equipos` (`codigo`, `nombre`, `valor1`, `valor2`, `valor3`, `valor4`, `valor5`, `valor6`, `equipos_Codigo`) VALUES
(6, 'IMPRESORA TICKETS', 'Generic', NULL, NULL, NULL, NULL, NULL, 3),
(7, 'IMPRESORA FACTURAS', 'Nitro PDF Creator (Pro 10)', NULL, NULL, NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_usuarios`
--

DROP TABLE IF EXISTS `config_usuarios`;
CREATE TABLE `config_usuarios` (
  `codigo` int(100) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `valor1` varchar(45) DEFAULT NULL,
  `valor2` varchar(45) DEFAULT NULL,
  `valor3` varchar(45) DEFAULT NULL,
  `valor4` varchar(45) DEFAULT NULL,
  `valor5` varchar(45) DEFAULT NULL,
  `valor6` varchar(45) DEFAULT NULL,
  `Usuarios_codigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosempresa`
--

DROP TABLE IF EXISTS `datosempresa`;
CREATE TABLE `datosempresa` (
  `codigo` int(100) NOT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  `nombre` varchar(75) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `direccion` varchar(85) DEFAULT NULL,
  `slogan` varchar(45) DEFAULT NULL,
  `cedula2` varchar(45) DEFAULT NULL,
  `nombre2` varchar(45) DEFAULT NULL,
  `direccion2` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `observacion` varchar(145) DEFAULT NULL,
  `imagen` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `datosempresa`
--

INSERT INTO `datosempresa` (`codigo`, `ruc`, `nombre`, `telefono`, `celular`, `mail`, `direccion`, `slogan`, `cedula2`, `nombre2`, `direccion2`, `telefono2`, `observacion`, `imagen`) VALUES
(2, '1722239967001', 'la casa de ja casadadas', '0992669329', '0992669329', 'homer_loading@homail.com', 'Santo Domingo', 'LO MISMO PERO MAS BARATO', '1722239967', 'JImmy Carrion', 'cooperativa gran colombia', '3700917', 'observacion', 0x6f62736572766163696f6e);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
CREATE TABLE `detallefactura` (
  `codigo` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `valorUnitario` varchar(45) DEFAULT NULL,
  `valorTotal` varchar(45) DEFAULT NULL,
  `Factura_Codigo` int(100) NOT NULL,
  `Productos_Codigo` int(100) DEFAULT NULL,
  `Observaciones` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detallefactura`
--

INSERT INTO `detallefactura` (`codigo`, `cantidad`, `detalle`, `iva`, `descuento`, `valorUnitario`, `valorTotal`, `Factura_Codigo`, `Productos_Codigo`, `Observaciones`) VALUES
(6, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 19, 2, NULL),
(7, '10', 'DISCO DURO HGS', '137.14285714285734', '0', '128.00', '1280.00', 19, 2, NULL),
(8, '20', 'ALMOADAS KL', '27.428571428571445', '0', '12.80', '256.00', 19, 1, NULL),
(9, '30', 'ALMOADAS KL', '30.85714285714289', '25', '12.80', '288.00', 19, 1, NULL),
(10, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 20, 2, NULL),
(11, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 21, 2, NULL),
(12, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 21, 2, NULL),
(13, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 22, 2, NULL),
(14, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 22, 2, NULL),
(15, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 22, 2, NULL),
(16, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 22, 2, NULL),
(17, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 23, 2, NULL),
(18, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 24, 2, NULL),
(19, '1', 'ALMOADAS KL', '1.163636363636364', '0', '12.80', '12.80', 25, 1, NULL),
(20, '1', 'ALMOADAS KL', '1.163636363636364', '0', '12.80', '12.80', 25, 1, NULL),
(21, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 26, 2, NULL),
(22, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 26, 2, NULL),
(23, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 27, 2, NULL),
(24, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 28, 2, NULL),
(25, '5', 'DISCO DURO HGS', '58.181818181818244', '0', '128.00', '640.00', 29, 2, NULL),
(26, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 29, 2, NULL),
(27, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 30, 2, NULL),
(28, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 31, 2, NULL),
(29, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 31, 2, NULL),
(30, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 31, 2, NULL),
(31, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 31, 2, NULL),
(32, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 31, 2, NULL),
(33, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 31, 2, NULL),
(34, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 32, 2, NULL),
(35, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 32, 2, NULL),
(36, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 32, 2, NULL),
(37, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 32, 2, NULL),
(38, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 33, 2, NULL),
(39, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 33, 2, NULL),
(40, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 33, 2, NULL),
(41, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 33, 2, NULL),
(42, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 34, 2, NULL),
(43, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 34, 2, NULL),
(44, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 34, 2, NULL),
(45, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 34, 2, NULL),
(46, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 35, 2, NULL),
(47, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 35, 2, NULL),
(48, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 35, 2, NULL),
(49, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 35, 2, NULL),
(50, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 35, 2, NULL),
(51, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 35, 2, NULL),
(52, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 36, 2, NULL),
(53, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 36, 2, NULL),
(54, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 36, 2, NULL),
(55, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 37, 2, NULL),
(56, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 37, 2, NULL),
(57, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 37, 2, NULL),
(58, '1', 'ALMOADAS KL', '1.163636363636364', '0', '12.80', '12.80', 37, 1, NULL),
(59, '1', 'ALMOADAS KL', '1.163636363636364', '0', '12.80', '12.80', 37, 1, NULL),
(60, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 38, 2, NULL),
(61, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 38, 2, NULL),
(62, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 38, 2, NULL),
(63, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 38, 2, NULL),
(64, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 39, 2, NULL),
(65, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 39, 2, NULL),
(66, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 40, 2, NULL),
(67, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 40, 2, NULL),
(68, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 41, 2, NULL),
(69, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 41, 2, NULL),
(70, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 42, 2, NULL),
(71, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 43, 2, NULL),
(72, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 43, 2, NULL),
(73, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 44, 2, NULL),
(74, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 45, 2, NULL),
(75, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 46, 2, NULL),
(76, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 47, 2, NULL),
(77, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 48, 2, NULL),
(78, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 49, 2, NULL),
(79, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 50, 2, NULL),
(80, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 51, 2, NULL),
(81, '1', 'ALMOADAS KL', '1.163636363636364', '0', '12.80', '12.80', 52, 1, NULL),
(82, '1', 'ALMOADAS KL', '1.163636363636364', '0', '12.80', '12.80', 53, 1, NULL),
(83, '1', 'DISCO DURO HGS', '11.63636363636364', '0', '128.00', '128.00', 54, 2, NULL),
(84, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 55, 2, NULL),
(85, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 56, 2, NULL),
(87, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 58, 1, NULL),
(88, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 59, 1, NULL),
(89, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 60, 2, NULL),
(90, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 61, 2, NULL),
(91, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 62, 2, NULL),
(92, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 63, 2, NULL),
(93, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 64, 2, NULL),
(94, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 65, 2, NULL),
(95, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 66, 2, NULL),
(96, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 67, 2, NULL),
(97, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 68, 2, NULL),
(98, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 69, 2, NULL),
(99, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 70, 2, NULL),
(100, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 71, 2, NULL),
(101, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 72, 2, NULL),
(102, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 73, 2, NULL),
(103, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 74, 2, NULL),
(104, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 75, 2, NULL),
(105, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 76, 2, NULL),
(106, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 77, 2, NULL),
(107, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 78, 2, NULL),
(108, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 79, 2, NULL),
(109, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 80, 3, NULL),
(110, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 81, 2, NULL),
(111, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 82, 2, NULL),
(112, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 83, 2, NULL),
(113, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 84, 2, NULL),
(114, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 85, 2, NULL),
(115, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 86, 2, NULL),
(116, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 87, 2, NULL),
(117, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 88, 2, NULL),
(118, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 89, 2, NULL),
(119, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 90, 2, NULL),
(120, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 91, 2, NULL),
(121, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 92, 2, NULL),
(122, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 93, 2, NULL),
(123, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 94, 2, NULL),
(124, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 95, 2, NULL),
(125, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 96, 2, NULL),
(126, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 97, 2, NULL),
(127, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 98, 2, NULL),
(128, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 99, 2, NULL),
(129, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 100, 2, NULL),
(130, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 101, 2, NULL),
(131, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 102, 2, NULL),
(132, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 103, 1, NULL),
(133, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 104, 2, NULL),
(134, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 105, 2, NULL),
(135, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 106, 2, NULL),
(136, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 107, 2, NULL),
(137, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 108, 2, NULL),
(138, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 109, 2, NULL),
(139, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 110, 2, NULL),
(140, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 111, 2, NULL),
(141, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 112, 2, NULL),
(142, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 113, 2, NULL),
(143, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 114, 2, NULL),
(144, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 115, 3, NULL),
(145, '5', 'DISCO DURO HGS', '68.57142857142867', '0', '128.00', '640.00', 116, 2, NULL),
(146, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 117, 2, NULL),
(147, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 118, 2, NULL),
(148, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 119, 1, NULL),
(149, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 120, 3, NULL),
(150, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 121, 3, NULL),
(151, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 121, 3, NULL),
(152, '152', 'IMPRESORAS CANON ', '2687.1428571428587', '0', '165.0', '25080.00', 122, 3, NULL),
(153, '1545', 'IMPRESORAS CANON ', '27313.39285714287', '0', '165.0', '254925.00', 122, 3, NULL),
(154, '1.5', 'DISCO DURO HGS', '20.571428571428584', '0', '128.00', '192.00', 122, 2, NULL),
(155, '17885', 'DISCO DURO HGS', '245280.00000000023', '0', '128.00', '2289280.00', 122, 2, NULL),
(156, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 123, 2, NULL),
(157, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 124, 3, NULL),
(158, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 125, 2, NULL),
(159, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 125, 2, NULL),
(160, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 125, 2, NULL),
(161, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 126, 2, NULL),
(162, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 126, 2, NULL),
(163, '155', 'DISCO DURO HGS', '2125.7142857142862', '0', '128.00', '19840.00', 127, 2, NULL),
(164, '1788', 'DISCO DURO HGS', '24521.14285714287', '0', '128.00', '228864.00', 127, 2, NULL),
(165, '1', 'DISCO DURO HGS', '1369.130357142858', '0', '12778.5500', '12778.55', 127, 2, NULL),
(166, '21', 'DISCO DURO HGS', '2891.2500000000036', '0', '1285.00', '26985.00', 128, 2, NULL),
(167, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 128, 2, NULL),
(168, '15', 'DISCO DURO HGS', '2053.9285714285725', '0', '1278.00', '19170.00', 128, 2, NULL),
(169, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 128, 1, NULL),
(170, '5', 'ALMOADAS KL', '6.857142857142861', '0', '12.80', '64.00', 128, 1, NULL),
(171, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 128, 1, NULL),
(172, '8', 'IMPRESORAS CANON ', '141.42857142857156', '0', '165.0', '1320.00', 128, 3, NULL),
(173, '9', 'IMPRESORAS CANON ', '159.1071428571429', '0', '165.0', '1485.00', 128, 3, NULL),
(174, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 129, 2, NULL),
(175, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 129, 2, NULL),
(176, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 129, 2, NULL),
(177, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 129, 2, NULL),
(178, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 129, 3, NULL),
(179, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 129, 3, NULL),
(180, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 129, 3, NULL),
(182, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 26, 2, NULL),
(183, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 133, 2, NULL),
(184, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 134, 2, NULL);

--
-- Disparadores `detallefactura`
--
DROP TRIGGER IF EXISTS `UpdateInventario`;
DELIMITER $$
CREATE TRIGGER `UpdateInventario` AFTER INSERT ON `detallefactura` FOR EACH ROW UPDATE productos
     SET productos.cantidad = productos.cantidad - NEW.cantidad
   WHERE productos.codigo = NEW.Productos_Codigo
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `UpdateInventarioonDelte`;
DELIMITER $$
CREATE TRIGGER `UpdateInventarioonDelte` AFTER DELETE ON `detallefactura` FOR EACH ROW UPDATE productos
     SET productos.cantidad = productos.cantidad + old.cantidad
   WHERE productos.codigo = old.Productos_Codigo
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleproforma`
--

DROP TABLE IF EXISTS `detalleproforma`;
CREATE TABLE `detalleproforma` (
  `codigo` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `valorUnitario` varchar(45) DEFAULT NULL,
  `valorTotal` varchar(45) DEFAULT NULL,
  `proforma_Codigo` int(100) NOT NULL,
  `Productos_Codigo` int(100) DEFAULT NULL,
  `Observaciones` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalleproforma`
--

INSERT INTO `detalleproforma` (`codigo`, `cantidad`, `detalle`, `iva`, `descuento`, `valorUnitario`, `valorTotal`, `proforma_Codigo`, `Productos_Codigo`, `Observaciones`) VALUES
(21, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 27, 2, NULL),
(22, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 28, 2, NULL),
(23, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 28, 2, NULL),
(24, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 28, 2, NULL),
(25, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 28, 1, NULL),
(26, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 28, 1, NULL),
(27, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 29, 1, NULL),
(28, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 29, 1, NULL),
(29, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 29, 3, NULL),
(30, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 29, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleticket`
--

DROP TABLE IF EXISTS `detalleticket`;
CREATE TABLE `detalleticket` (
  `codigo` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `iva` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `valorUnitario` varchar(45) DEFAULT NULL,
  `valorTotal` varchar(45) DEFAULT NULL,
  `ticket_Codigo` int(100) NOT NULL,
  `Productos_Codigo` int(100) DEFAULT NULL,
  `Observaciones` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalleticket`
--

INSERT INTO `detalleticket` (`codigo`, `cantidad`, `detalle`, `iva`, `descuento`, `valorUnitario`, `valorTotal`, `ticket_Codigo`, `Productos_Codigo`, `Observaciones`) VALUES
(23, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 26, 2, NULL),
(24, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 27, 2, NULL),
(25, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 28, 2, NULL),
(26, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 29, 2, NULL),
(27, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 30, 2, NULL);

--
-- Disparadores `detalleticket`
--
DROP TRIGGER IF EXISTS `UpdateInventarioOnTickets`;
DELIMITER $$
CREATE TRIGGER `UpdateInventarioOnTickets` AFTER INSERT ON `detalleticket` FOR EACH ROW UPDATE productos
     SET productos.cantidad = productos.cantidad - NEW.cantidad
   WHERE productos.codigo = NEW.Productos_Codigo
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `UpdateInventarioonDelteOnTickets`;
DELIMITER $$
CREATE TRIGGER `UpdateInventarioonDelteOnTickets` AFTER DELETE ON `detalleticket` FOR EACH ROW UPDATE productos
     SET productos.cantidad = productos.cantidad + old.cantidad
   WHERE productos.codigo = old.Productos_Codigo
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

DROP TABLE IF EXISTS `equipos`;
CREATE TABLE `equipos` (
  `Codigo` int(100) NOT NULL,
  `NombreReal` varchar(45) DEFAULT NULL,
  `nombreSoft` varchar(80) DEFAULT NULL,
  `Ubicacion` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(245) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `responsable` varchar(145) DEFAULT NULL,
  `serie` varchar(545) DEFAULT NULL,
  `secuencia1` varchar(45) DEFAULT NULL,
  `secuencia2` varchar(45) DEFAULT NULL,
  `secuencia3` varchar(45) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`Codigo`, `NombreReal`, `nombreSoft`, `Ubicacion`, `Descripcion`, `usuario`, `responsable`, `serie`, `secuencia1`, `secuencia2`, `secuencia3`, `ip`) VALUES
(3, 'DESKTOP-OQEODUI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '192.168.56.1'),
(10, 'pc-PC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '192.168.56.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `Codigo` int(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iva` varchar(10) DEFAULT NULL,
  `Iva_valor` varchar(45) DEFAULT NULL,
  `subtotaI_con_iva` varchar(45) DEFAULT NULL,
  `subtotal_sin_iva` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `Clientes_codigo` int(100) NOT NULL,
  `Usuarios_Codigo` int(100) NOT NULL,
  `Equipo` varchar(75) DEFAULT NULL,
  `secuencia` varchar(45) DEFAULT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT '0',
  `fechain` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`Codigo`, `fecha`, `hora`, `iva`, `Iva_valor`, `subtotaI_con_iva`, `subtotal_sin_iva`, `total`, `utilidad`, `tipo_documento`, `descuento`, `Clientes_codigo`, `Usuarios_Codigo`, `Equipo`, `secuencia`, `anulada`, `fechain`) VALUES
(2, '2017-09-12', '2017-09-24 17:00:42', '12', NULL, '100', NULL, '112', '20', 'factura', '0', 1, 2, 'pc', NULL, 0, NULL),
(3, '2017-09-25', '2017-09-25 20:12:34', '12.0', NULL, '114.29', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 0, NULL),
(4, '2017-09-25', '2017-09-25 20:28:44', '12.0', NULL, '2228.57', '', '2496.00', '546.0', 'FACTURA', '', 3, 2, 'PC', '005-001-00000200', 0, NULL),
(5, '2017-09-25', '2017-09-25 20:30:13', '12.0', NULL, '251.43', '', '281.60', '61.6', 'FACTURA', '', 3, 2, 'PC', '005-001-00000200', 0, NULL),
(6, '2017-09-26', '2017-09-26 06:53:15', '12.0', NULL, '114.29', '', '128.00', '28.0', 'FACTURA', '', 1, 2, 'PC', '005-001-00000200', 1, NULL),
(7, '2017-09-26', '2017-09-27 03:44:58', '12.0', NULL, '114.29', '', '128.00', '28.0', 'FACTURA', '', 1, 2, 'PC', '005-001-00000200', 1, NULL),
(8, '2017-09-26', '2017-09-27 03:48:02', '12.0', NULL, '114.29', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(9, '2017-09-26', '2017-09-27 03:49:24', '12.0', NULL, '114.29', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(10, '2017-09-26', '2017-09-27 03:51:43', '12.0', NULL, '1474.29', '', '1651.20', '361.20000000000033', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(11, '2017-09-26', '2017-09-27 04:00:26', '12.0', NULL, '4245.71', '', '4755.20', '935.1999999999999', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(12, '2017-09-26', '2017-09-27 04:04:01', '12.0', NULL, '251.43', '', '281.60', '61.599999999999994', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(13, '2017-09-26', '2017-09-27 04:05:47', '12.0', NULL, '2078.86', '', '2328.32', '488.32', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(14, '2017-09-27', '2017-09-27 11:45:43', '12.0', NULL, '571.43', '', '640.00', '140.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(15, '2017-09-27', '2017-09-27 11:47:34', '12.0', NULL, '11.43', '', '12.80', '2.8000000000000007', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(16, '2017-09-27', '2017-09-27 11:50:51', '12.0', NULL, '1142.86', '', '1280.00', '280.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(17, '2017-09-27', '2017-09-27 11:51:57', '12.0', NULL, '1142.86', '', '1280.00', '280.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(19, '2017-09-27', '2017-09-27 16:55:19', '12.0', NULL, '1742.86', '', '1952.00', '352.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(20, '2017-09-27', '2017-09-27 17:33:14', '10.0', NULL, '116.36', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(21, '2017-09-27', '2017-09-27 19:22:27', '10.0', NULL, '232.73', '', '256.00', '56.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(22, '2017-09-27', '2017-09-28 01:37:26', '10.0', NULL, '465.45', '', '512.00', '112.0', 'FACTURA', '', 1, 2, 'PC', '005-001-00000200', 1, NULL),
(23, '2017-09-27', '2017-09-28 01:38:23', '10.0', NULL, '116.36', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(24, '2017-09-27', '2017-09-28 01:43:17', '10.0', NULL, '116.36', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(25, '2017-09-27', '2017-09-28 01:51:48', '10.0', NULL, '23.27', '', '25.60', '5.600000000000001', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1, NULL),
(26, '2017-09-30', '2017-10-01 02:34:20', '10.0', NULL, '232.73', '', '256.00', '56.0', 'FACTURA', '', 2, 2, 'PC', '001-001-00000015', 1, NULL),
(27, '2017-09-30', '2017-10-01 02:56:00', '10.0', NULL, '116.36', '', '128.00', '28.0', 'FACTURA', '', 1, 2, 'PC', '001-001-00000016', 1, NULL),
(28, '2017-09-30', '2017-10-01 03:06:01', '10.0', NULL, '116.36', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '001-001-0000017', 1, NULL),
(29, '2017-09-30', '2017-10-01 03:11:39', '10.0', NULL, '698.18', '', '768.00', '168.0', 'FACTURA', '', 2, 2, 'PC', '001-001-0000018', 1, NULL),
(30, '2017-09-30', '2017-10-01 03:12:28', '10.0', NULL, '116.36', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '001-001-0000019', 1, NULL),
(31, '2017-09-30', '2017-10-01 03:26:43', '10.0', NULL, '698.18', '', '768.00', '168.0', 'FACTURA', '', 3, 2, 'PC', '001-001-0000020', 1, NULL),
(32, '2017-09-30', '2017-10-01 03:28:23', '10.0', NULL, '465.45', '', '512.00', '112.0', 'FACTURA', '', 3, 2, 'PC', '001-001-0000021', 1, NULL),
(33, '2017-09-30', '2017-10-01 03:28:44', '10.0', NULL, '465.45', '', '512.00', '112.0', 'FACTURA', '', 2, 2, 'PC', '001-001-0000022', 1, NULL),
(34, '2017-09-30', '2017-10-01 03:29:49', '10.0', NULL, '465.45', '', '512.00', '112.0', 'FACTURA', '', 1, 2, 'PC', '001-001-0000023', 1, NULL),
(35, '2017-09-30', '2017-10-01 03:37:05', '10.0', NULL, '698.18', '', '768.00', '168.0', 'FACTURA', '', 2, 2, 'PC', '001-001-0000024', 1, NULL),
(36, '2017-09-30', '2017-10-01 04:37:17', '10.0', NULL, '349.09', '', '384.00', '84.0', 'FACTURA', '', 2, 2, 'PC', '001-001-0000025', 1, NULL),
(37, '2017-09-30', '2017-10-01 04:39:19', '10.0', NULL, '372.36', '', '409.60', '89.6', 'FACTURA', '', 2, 2, 'PC', '001-001-0000026', 1, NULL),
(38, '2017-09-30', '2017-10-01 04:39:50', '10.0', NULL, '465.45', '', '512.00', '112.0', 'FACTURA', '', 2, 2, 'PC', '001-001-0000027', 1, NULL),
(39, '2017-10-01', '2017-10-01 13:49:53', '10.0', NULL, '232.73', '', '256.00', '56.0', 'FACTURA', '', 3, 2, 'PC', '001-001-0000027', 1, NULL),
(40, '2017-10-01', '2017-10-01 13:53:01', '10.0', NULL, '232.73', '', '256.00', '56.0', 'FACTURA', '', 2, 2, 'PC', '001-001-0000028', 1, NULL),
(41, '2017-10-01', '2017-10-01 13:55:07', '10.0', NULL, '232.73', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'PC', '001-001-0000029', 1, NULL),
(42, '2017-10-01', '2017-10-01 21:05:10', '10.0', NULL, '116.36', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'PC', '001-001-0000030', 1, NULL),
(43, '2017-10-01', '2017-10-01 21:08:16', '10.0', NULL, '232.73', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'PC', '001-001-0000031', 1, NULL),
(44, '2017-10-01', '2017-10-01 21:10:15', '10.0', NULL, '116.36', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 1, 2, 'PC', '001-001-0000032', 1, NULL),
(45, '2017-10-01', '2017-10-01 21:18:52', '10.0', NULL, '2443.64', '0.00', '2688.00', '588.0', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000033', 1, NULL),
(46, '2017-10-01', '2017-10-01 21:21:02', '10.0', NULL, '465.45', '0.00', '512.00', '112.0', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000034', 1, NULL),
(47, '2017-10-01', '2017-10-01 21:21:45', '10.0', NULL, '116.36', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000035', 1, NULL),
(48, '2017-10-01', '2017-10-01 21:24:06', '10.0', NULL, '232.73', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000036', 1, NULL),
(49, '2017-10-01', '2017-10-01 21:31:03', '10.0', NULL, '1274.18', '0.00', '1401.60', '301.6', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000037', 1, NULL),
(50, '2017-10-01', '2017-10-01 21:35:24', '10.0', NULL, '116.36', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, NULL, '001-001-0000038', 1, NULL),
(51, '2017-10-01', '2017-10-01 21:37:31', '10.0', NULL, '349.09', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000039', 1, NULL),
(52, '2017-10-01', '2017-10-01 21:38:56', '10.0', NULL, '2176.00', '0.00', '2393.60', '523.6', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000040', 1, NULL),
(53, '2017-10-01', '2017-10-01 21:40:45', '10.0', NULL, '34.91', '0.00', '38.40', '8.400000000000002', 'FACTURA', '0.00', 2, 2, NULL, '001-001-0000041', 1, NULL),
(54, '2017-10-01', '2017-10-01 21:41:55', '10.0', NULL, '698.18', '0.00', '768.00', '168.0', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000042', 1, NULL),
(55, '2017-10-01', '2017-10-01 21:43:22', '12.0', NULL, '457.14', '0.00', '512.00', '112.0', 'FACTURA', '0.00', 2, 2, NULL, '001-001-0000043', 1, NULL),
(56, '2017-10-01', '2017-10-01 23:43:07', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000044', 1, NULL),
(58, '2017-10-01', '2017-10-01 23:46:32', '12.0', NULL, '22.86', '0.00', '25.60', '5.600000000000001', 'FACTURA', '0.00', 2, 3, NULL, '001-001-0000046', 1, NULL),
(59, '2017-10-01', '2017-10-02 01:45:34', '12.0', NULL, '22.86', '0.00', '25.60', '5.600000000000001', 'FACTURA', '0.00', 1, 2, NULL, '001-001-0000047', 1, NULL),
(60, '2017-10-01', '2017-10-02 01:46:30', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, NULL, '001-001-0000048', 1, NULL),
(61, '2017-10-01', '2017-10-02 01:52:57', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000049', 1, NULL),
(62, '2017-10-02', '2017-10-02 13:57:43', '12.0', NULL, '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 1, 2, 'DESKTOP-OQEODUI', '001-001-0000050', 0, NULL),
(63, '2017-10-04', '2017-10-05 04:38:08', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000051', 0, NULL),
(64, '2017-10-04', '2017-10-05 04:41:06', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000052', 0, NULL),
(65, '2017-10-04', '2017-10-05 04:42:24', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000053', 0, NULL),
(66, '2017-10-04', '2017-10-05 04:48:22', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000054', 0, NULL),
(67, '2017-10-04', '2017-10-05 04:59:47', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000055', 0, NULL),
(68, '2017-10-05', '2017-10-05 05:01:10', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000056', 0, NULL),
(69, '2017-10-05', '2017-10-05 05:05:35', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000057', 0, NULL),
(70, '2017-10-05', '2017-10-05 05:06:05', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 1, 2, 'DESKTOP-OQEODUI', '001-001-0000058', 0, NULL),
(71, '2017-10-05', '2017-10-05 05:06:57', '12.0', NULL, '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 1, 2, 'DESKTOP-OQEODUI', '001-001-0000059', 0, NULL),
(72, '2017-10-05', '2017-10-05 05:07:34', '12.0', NULL, '800.00', '0.00', '896.00', '196.0', 'FACTURA', '0.00', 1, 2, 'DESKTOP-OQEODUI', '001-001-0000060', 0, NULL),
(73, '2017-10-05', '2017-10-05 05:08:04', '12.0', NULL, '571.43', '0.00', '640.00', '140.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000061', 0, NULL),
(74, '2017-10-05', '2017-10-05 12:42:41', '12.0', NULL, '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000062', 0, NULL),
(75, '2017-10-05', '2017-10-05 12:59:30', '12.0', NULL, '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000063', 0, NULL),
(76, '2017-10-05', '2017-10-05 13:09:25', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000064', 0, NULL),
(77, '2017-10-05', '2017-10-05 13:15:15', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000065', 0, NULL),
(78, '2017-10-05', '2017-10-05 13:18:38', '12.0', NULL, '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000066', 0, NULL),
(79, '2017-10-05', '2017-10-05 13:22:55', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000067', 0, NULL),
(80, '2017-10-05', '2017-10-05 13:25:58', '12.0', NULL, '147.32', '0.00', '165.00', '15.0', 'FACTURA', '0.00', 1, 2, 'DESKTOP-OQEODUI', '001-001-0000068', 0, NULL),
(81, '2017-10-05', '2017-10-06 03:39:45', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000069', 0, NULL),
(82, '2017-10-05', '2017-10-06 03:57:04', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000070', 0, NULL),
(83, '2017-10-05', '2017-10-06 03:58:52', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000071', 0, NULL),
(84, '2017-10-05', '2017-10-06 04:05:21', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000072', 0, NULL),
(85, '2017-10-05', '2017-10-06 04:09:46', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000073', 0, NULL),
(86, '2017-10-05', '2017-10-06 04:21:31', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000072', 0, NULL),
(87, '2017-10-05', '2017-10-06 05:03:07', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000071', 0, NULL),
(88, '2017-10-05', '2017-10-06 05:03:22', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000070', 0, NULL),
(89, '2017-10-06', '2017-10-06 05:25:53', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000074', 0, NULL),
(90, '2017-10-06', '2017-10-06 05:28:06', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000075', 0, NULL),
(91, '2017-10-06', '2017-10-06 05:29:33', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000076', 0, NULL),
(92, '2017-10-06', '2017-10-06 05:30:42', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000077', 0, NULL),
(93, '2017-10-06', '2017-10-06 13:52:14', '12.0', NULL, '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000078', 0, NULL),
(94, '2017-10-06', '2017-10-06 13:55:06', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000079', 0, NULL),
(95, '2017-10-06', '2017-10-06 14:53:15', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000080', 0, NULL),
(96, '2017-10-08', '2017-10-08 15:00:18', '12.0', NULL, '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000081', 0, NULL),
(97, '2017-10-08', '2017-10-08 15:03:45', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000082', 0, NULL),
(98, '2017-10-08', '2017-10-08 15:05:20', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000083', 0, NULL),
(99, '2017-10-08', '2017-10-08 15:11:41', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000084', 0, NULL),
(100, '2017-10-08', '2017-10-08 15:19:14', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000085', 0, '2017-10-03 21:04:01'),
(101, '2017-10-08', '2017-10-08 15:27:36', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 3, 2, 'DESKTOP-OQEODUI', '001-001-0000086', 0, '2017-10-01 21:04:01'),
(102, '2017-10-08', '2017-10-08 15:30:23', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000087', 0, '2017-10-01 21:04:01'),
(103, '2017-10-08', '2017-10-08 15:32:06', '12.0', NULL, '11.43', '0.00', '12.80', '2.8000000000000007', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000088', 0, '2017-10-03 21:04:01'),
(104, '2017-10-08', '2017-10-08 15:37:37', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000089', 0, '2017-10-01 21:04:01'),
(105, '2017-10-08', '2017-10-08 15:39:34', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000090', 0, '2017-10-05 21:04:01'),
(106, '2017-10-08', '2017-10-08 15:45:58', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000091', 0, NULL),
(107, '2017-10-08', '2017-10-08 15:48:54', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000092', 0, NULL),
(108, '2017-10-08', '2017-10-09 02:00:50', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000093', 0, NULL),
(109, '2017-10-08', '2017-10-09 02:04:06', '12.0', NULL, '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000094', 0, '2017-10-08 21:04:01'),
(110, '2017-10-08', '2017-10-09 02:06:39', '12.0', NULL, '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000095', 0, '2017-10-08 21:06:33'),
(111, '2017-10-09', '2017-10-09 05:51:35', '12.0', 'Nueva Factura', '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000096', 0, '2017-10-09 00:51:29'),
(112, '2017-10-09', '2017-10-10 00:52:22', '12.0', 'Nueva Factura', '284.46', '0.00', '318.60', '48.599999999999994', 'FACTURA', '0.00', 1, 2, 'DESKTOP-OQEODUI', '001-001-0000097', 0, '2017-10-09 19:51:19'),
(113, '2017-10-09', '2017-10-10 04:41:08', '12.0', 'Nueva Factura', '457.14', '0.00', '512.00', '112.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000098', 0, '2017-10-09 23:41:00'),
(114, '2017-10-09', '2017-10-10 04:45:09', '12.0', 'Nueva Factura', '457.14', '0.00', '512.00', '112.0', 'FACTURA', '0.00', 1, 2, 'DESKTOP-OQEODUI', '001-001-0000099', 0, '2017-10-09 23:44:57'),
(115, '2017-10-09', '2017-10-10 04:46:47', '12.0', 'Nueva Factura', '1290.18', '0.00', '1445.00', '295.0', 'FACTURA', '0.00', 3, 3, 'DESKTOP-OQEODUI', '001-001-0000100', 0, '2017-10-09 23:44:57'),
(116, '2017-10-09', '2017-10-10 04:47:46', '12.0', 'Nueva Factura', '718.75', '0.00', '805.00', '155.0', 'FACTURA', '0.00', 3, 3, 'DESKTOP-OQEODUI', '001-001-0000101', 0, '2017-10-09 23:44:57'),
(117, '2017-10-09', '2017-10-10 04:48:53', '12.0', 'Nueva Factura', '4320.54', '0.00', '4839.00', '489.0', 'FACTURA', '0.00', 3, 2, 'DESKTOP-OQEODUI', '001-001-0000102', 0, '2017-10-09 23:48:27'),
(118, '2017-10-09', '2017-10-10 04:51:24', '12.0', 'Nueva Factura', '1730458.04', '0.00', '1938113.00', '421663.0', 'FACTURA', '0.00', 3, 3, 'DESKTOP-OQEODUI', '001-001-0000103', 0, '2017-10-09 23:50:45'),
(119, '2017-10-10', '2017-10-10 05:00:32', '12.0', 'Nueva Factura', '22.86', '0.00', '25.60', '5.600000000000001', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000104', 0, '2017-10-10 00:00:14'),
(120, '2017-10-10', '2017-10-10 05:04:49', '12.0', 'Nueva Factura', '294.64', '0.00', '330.00', '30.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000104', 0, '2017-10-10 00:04:29'),
(121, '2017-10-10', '2017-10-10 05:08:32', '12.0', 'Nueva Factura', '294.64', '0.00', '330.00', '30.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000105', 0, '2017-10-10 00:08:25'),
(122, '2017-10-10', '2017-10-10 05:10:04', '12.0', 'Nueva Factura', '2294175.89', '0.00', '2569477.00', '526277.0', 'FACTURA', '0.00', 3, 2, 'DESKTOP-OQEODUI', '001-001-0000106', 0, '2017-10-10 00:08:25'),
(123, '2017-10-10', '2017-10-10 05:11:48', '12.0', 'Nueva Factura', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 3, 3, 'DESKTOP-OQEODUI', '001-001-0000107', 0, '2017-10-10 00:11:32'),
(124, '2017-10-10', '2017-10-10 05:13:30', '12.0', 'Nueva Factura', '147.32', '0.00', '165.00', '15.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000108', 0, '2017-10-10 00:13:24'),
(125, '2017-10-10', '2017-10-10 13:32:25', '12.0', 'Nueva Factura', '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000109', 0, '2017-10-10 08:32:18'),
(126, '2017-10-10', '2017-10-10 13:32:56', '12.0', '27.43', '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000110', 0, '2017-10-10 08:32:42'),
(127, '2017-10-10', '2017-10-10 13:34:50', '12.0', '28015.99', '233466.56', '0.00', '261482.55', '67082.55', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000111', 0, '2017-10-10 08:34:20'),
(128, '2017-10-11', '2017-10-12 01:14:10', '12.0', '5269.03', '43908.57', '0.00', '49177.60', '42857.600000000006', 'FACTURA', '0.00', 1, 2, 'DESKTOP-OQEODUI', '001-001-0000112', 0, '2017-10-11 20:13:28'),
(129, '2017-10-13', '2017-10-13 19:57:10', '12.0', '107.89', '899.11', '0.00', '1007.00', '157.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000113', 0, '2017-10-13 14:56:58'),
(130, '2017-10-15', '2017-10-16 04:31:19', '12.0', '1.37', '11.43', '0.00', '12.80', '2.8000000000000007', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000115', 0, '2017-10-15 23:30:22'),
(131, '2017-10-15', '2017-10-16 04:34:20', '12.0', '1.37', '11.43', '0.00', '12.80', '2.8000000000000007', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000115', 0, '2017-10-15 23:34:08'),
(132, '2017-10-15', '2017-10-16 04:43:44', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000115', 0, '2017-10-15 23:43:25'),
(133, '2017-10-16', '2017-10-16 13:44:00', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000119', 0, '2017-10-16 08:43:55'),
(134, '2017-10-16', '2017-10-16 13:46:03', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000120', 0, '2017-10-16 08:45:50');

--
-- Disparadores `facturas`
--
DROP TRIGGER IF EXISTS `EliminarDetalleFacturaAntesDeEliminarLaFactira`;
DELIMITER $$
CREATE TRIGGER `EliminarDetalleFacturaAntesDeEliminarLaFactira` BEFORE DELETE ON `facturas` FOR EACH ROW DELETE from detallefactura WHERE detallefactura.Factura_Codigo = old.codigo
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `codigo` int(100) NOT NULL,
  `evento` varchar(200) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`codigo`, `evento`, `descripcion`, `fecha`) VALUES
(1, 'Eliminacion de Factura', 'Se elimino factura', '2017-09-27 12:24:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas` (
  `Codigo` int(100) NOT NULL,
  `Marca` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`Codigo`, `Marca`, `Descripcion`) VALUES
(1, 'epson', NULL),
(2, 'canon', NULL),
(3, 'lenovo', NULL),
(4, 'lenovoss', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

DROP TABLE IF EXISTS `modelos`;
CREATE TABLE `modelos` (
  `Codigo` int(100) NOT NULL,
  `Modelo` varchar(75) NOT NULL,
  `Descripcion` varchar(105) DEFAULT NULL,
  `Marcas_Codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`Codigo`, `Modelo`, `Descripcion`, `Marcas_Codigo`) VALUES
(1, 'l395', NULL, 1),
(2, 'L380', NULL, 1),
(3, 'MP240', NULL, 1),
(4, 'MP210', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `codigo` int(200) NOT NULL,
  `Permiso` varchar(45) NOT NULL,
  `Tipos_Usuarios_codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `Codigo` int(100) NOT NULL,
  `producto` varchar(145) NOT NULL,
  `codigoAlterno` varchar(45) DEFAULT NULL,
  `codigoBarras` varchar(45) DEFAULT NULL,
  `costo` varchar(45) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `pvp` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `unidades` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `observacion` varchar(245) DEFAULT NULL,
  `minimo` varchar(45) DEFAULT NULL,
  `maximo` varchar(45) DEFAULT NULL,
  `garantia` varchar(245) DEFAULT NULL,
  `Modelos_Codigo` int(100) NOT NULL,
  `Modelos_Marcas_Codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Codigo`, `producto`, `codigoAlterno`, `codigoBarras`, `costo`, `utilidad`, `pvp`, `cantidad`, `unidades`, `ubicacion`, `observacion`, `minimo`, `maximo`, `garantia`, `Modelos_Codigo`, `Modelos_Marcas_Codigo`) VALUES
(1, 'ALMOADAS KL', '', '', '10', '28', '12.80', '50', 'UNIDADES', ' ,  ,  ,  ,  ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- -- AÑO -- -- MESES -- -- SEMANAS -- -- AÑO -- -- MESES -- -- SEMANAS -- ', 4, 2),
(2, 'DISCO DURO HGS', '', '', '100', '28', '128.00', '44', 'UNIDADES', ' ,  ,  ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- -- AÑO -- -- MESES -- -- SEMANAS -- ', 4, 2),
(3, 'IMPRESORAS CANON ', '1234', '', '150', '10', '165,00', '50', 'UNIDADES', ' ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- ', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proformas`
--

DROP TABLE IF EXISTS `proformas`;
CREATE TABLE `proformas` (
  `Codigo` int(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iva` varchar(10) DEFAULT NULL,
  `Iva_valor` varchar(45) NOT NULL,
  `subtotaI_con_iva` varchar(45) DEFAULT NULL,
  `subtotal_sin_iva` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `Clientes_codigo` int(100) NOT NULL,
  `Usuarios_Codigo` int(100) NOT NULL,
  `Equipo` varchar(75) DEFAULT NULL,
  `secuencia` varchar(45) DEFAULT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT '1',
  `fechain` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proformas`
--

INSERT INTO `proformas` (`Codigo`, `fecha`, `hora`, `iva`, `Iva_valor`, `subtotaI_con_iva`, `subtotal_sin_iva`, `total`, `utilidad`, `tipo_documento`, `descuento`, `Clientes_codigo`, `Usuarios_Codigo`, `Equipo`, `secuencia`, `anulada`, `fechain`) VALUES
(26, '2017-10-15', '2017-10-16 04:45:56', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'PROFORMA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000115', 1, '2017-10-15 23:45:47'),
(27, '2017-10-15', '2017-10-16 04:48:55', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'PROFORMA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000116', 1, '2017-10-15 23:48:15'),
(28, '2017-10-16', '2017-10-16 05:08:21', '12.0', '43.89', '365.71', '0.00', '409.60', '89.6', 'PROFORMA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000117', 1, '2017-10-16 00:08:08'),
(29, '2017-10-16', '2017-10-16 05:17:23', '12.0', '38.10', '317.50', '0.00', '355.60', '35.6', 'PROFORMA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000118', 1, '2017-10-16 00:17:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seriesfacturas`
--

DROP TABLE IF EXISTS `seriesfacturas`;
CREATE TABLE `seriesfacturas` (
  `codigo` int(100) NOT NULL,
  `sec1` varchar(45) DEFAULT NULL,
  `sec2` varchar(45) DEFAULT NULL,
  `fac3` varchar(45) DEFAULT NULL,
  `equipos_Codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `seriesfacturas`
--

INSERT INTO `seriesfacturas` (`codigo`, `sec1`, `sec2`, `fac3`, `equipos_Codigo`) VALUES
(1, '001', '001', '00000001', 3),
(3, '001', '001', '00000005', 3),
(4, '001', '001', '00000015', 3),
(5, '001', '001', '00000016', 3),
(6, '001', '001', '0000017', 3),
(7, '001', '001', '0000018', 3),
(8, '001', '001', '0000019', 3),
(9, '001', '001', '0000020', 3),
(10, '001', '001', '0000021', 3),
(11, '001', '001', '0000022', 3),
(12, '001', '001', '0000023', 3),
(13, '001', '001', '0000024', 3),
(14, '001', '001', '0000025', 3),
(15, '001', '001', '0000026', 3),
(16, '001', '001', '0000027', 3),
(17, '001', '001', '0000028', 3),
(18, '001', '001', '0000029', 3),
(19, '001', '001', '0000030', 3),
(20, '001', '001', '0000031', 3),
(21, '001', '001', '0000032', 3),
(22, '001', '001', '0000033', 3),
(23, '001', '001', '0000034', 3),
(24, '001', '001', '0000035', 3),
(25, '001', '001', '0000036', 3),
(26, '001', '001', '0000037', 3),
(27, '001', '001', '0000038', 3),
(28, '001', '001', '0000039', 3),
(29, '001', '001', '0000040', 3),
(30, '001', '001', '0000041', 3),
(31, '001', '001', '0000042', 3),
(32, '001', '001', '0000043', 3),
(33, '001', '001', '0000044', 3),
(34, '001', '001', '0000045', 3),
(35, '001', '001', '0000046', 3),
(36, '001', '001', '0000047', 3),
(37, '001', '001', '0000048', 3),
(38, '001', '001', '0000049', 3),
(39, '001', '001', '0000050', 3),
(40, '001', '001', '0000051', 3),
(41, '001', '001', '0000052', 3),
(42, '001', '001', '0000053', 3),
(43, '001', '001', '0000054', 3),
(44, '001', '001', '0000055', 3),
(45, '001', '001', '0000056', 3),
(46, '001', '001', '0000057', 3),
(47, '001', '001', '0000058', 3),
(48, '001', '001', '0000059', 3),
(49, '001', '001', '0000060', 3),
(50, '001', '001', '0000061', 3),
(51, '001', '001', '0000062', 3),
(52, '001', '001', '0000063', 3),
(53, '001', '001', '0000064', 3),
(54, '001', '001', '0000065', 3),
(55, '001', '001', '0000066', 3),
(56, '001', '001', '0000067', 3),
(57, '001', '001', '0000068', 3),
(58, '001', '001', '0000069', 3),
(59, '001', '001', '0000070', 3),
(60, '001', '001', '0000071', 3),
(61, '001', '001', '0000072', 3),
(62, '001', '001', '0000073', 3),
(63, '001', '001', '0000072', 3),
(64, '001', '001', '0000071', 3),
(65, '001', '001', '0000070', 3),
(66, '001', '001', '0000074', 3),
(67, '001', '001', '0000075', 3),
(68, '001', '001', '0000076', 3),
(69, '001', '001', '0000077', 3),
(70, '001', '001', '0000078', 3),
(71, '001', '001', '0000079', 3),
(72, '001', '001', '0000080', 3),
(73, '001', '001', '0000081', 3),
(74, '001', '001', '0000082', 3),
(75, '001', '001', '0000083', 3),
(76, '001', '001', '0000084', 3),
(77, '001', '001', '0000085', 3),
(78, '001', '001', '0000086', 3),
(79, '001', '001', '0000087', 3),
(80, '001', '001', '0000088', 3),
(81, '001', '001', '0000089', 3),
(82, '001', '001', '0000090', 3),
(83, '001', '001', '0000091', 3),
(84, '001', '001', '0000092', 3),
(85, '001', '001', '0000093', 3),
(86, '001', '001', '0000094', 3),
(87, '001', '001', '0000095', 3),
(88, '001', '001', '0000096', 3),
(89, '001', '001', '0000097', 3),
(90, '001', '001', '0000098', 3),
(91, '001', '001', '0000099', 3),
(92, '001', '001', '0000100', 3),
(93, '001', '001', '0000101', 3),
(94, '001', '001', '0000102', 3),
(95, '001', '001', '0000103', 3),
(96, '001', '001', '0000104', 3),
(97, '001', '001', '0000105', 3),
(98, '001', '001', '0000106', 3),
(99, '001', '001', '0000107', 3),
(100, '001', '001', '0000108', 3),
(101, '001', '001', '0000109', 3),
(102, '001', '001', '0000110', 3),
(103, '001', '001', '0000111', 3),
(104, '001', '001', '0000112', 3),
(105, '001', '001', '0000113', 3),
(106, '001', '001', '0000114', 3),
(107, '001', '001', '0000115', 3),
(108, '001', '001', '0000116', 3),
(109, '001', '001', '0000117', 3),
(110, '001', '001', '0000118', 3),
(111, '001', '001', '0000119', 3),
(112, '001', '001', '0000120', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `Codigo` int(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iva` varchar(10) DEFAULT NULL,
  `Iva_valor` varchar(45) NOT NULL,
  `subtotaI_con_iva` varchar(45) DEFAULT NULL,
  `subtotal_sin_iva` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `tipo_documento` varchar(45) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  `Clientes_codigo` int(100) NOT NULL,
  `Usuarios_Codigo` int(100) NOT NULL,
  `Equipo` varchar(75) DEFAULT NULL,
  `secuencia` varchar(45) DEFAULT NULL,
  `anulada` tinyint(1) NOT NULL DEFAULT '1',
  `fechain` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`Codigo`, `fecha`, `hora`, `iva`, `Iva_valor`, `subtotaI_con_iva`, `subtotal_sin_iva`, `total`, `utilidad`, `tipo_documento`, `descuento`, `Clientes_codigo`, `Usuarios_Codigo`, `Equipo`, `secuencia`, `anulada`, `fechain`) VALUES
(26, '2017-10-15', '2017-10-16 04:44:16', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000115', 1, '2017-10-15 23:43:59'),
(27, '2017-10-16', '2017-10-16 13:23:46', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000119', 1, '2017-10-16 08:23:21'),
(28, '2017-10-16', '2017-10-16 13:44:15', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000120', 1, '2017-10-16 08:43:55'),
(29, '2017-10-16', '2017-10-16 13:44:51', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000120', 1, '2017-10-16 08:43:55'),
(30, '2017-10-16', '2017-10-16 13:52:51', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000121', 1, '2017-10-16 08:52:37');

--
-- Disparadores `tickets`
--
DROP TRIGGER IF EXISTS `EliminarDetalleTicketAntesDeEliminarElTicket`;
DELIMITER $$
CREATE TRIGGER `EliminarDetalleTicketAntesDeEliminarElTicket` BEFORE DELETE ON `tickets` FOR EACH ROW DELETE from detalleticket WHERE detalleticket.Ticket_Codigo = old.codigo
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuarios`
--

DROP TABLE IF EXISTS `tipos_usuarios`;
CREATE TABLE `tipos_usuarios` (
  `codigo` int(100) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(95) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_usuarios`
--

INSERT INTO `tipos_usuarios` (`codigo`, `tipo`, `Descripcion`) VALUES
(1, 'ADMINISTRADOR', NULL),
(2, 'VENTAS', NULL),
(3, 'BODEGUERO XC', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `codigo` int(100) NOT NULL,
  `Cedula` varchar(50) NOT NULL,
  `Nombres` varchar(35) NOT NULL,
  `Telefono` varchar(40) NOT NULL,
  `Celular` varchar(40) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `Direccion` varchar(150) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `Tipo_Usuario_codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`codigo`, `Cedula`, `Nombres`, `Telefono`, `Celular`, `mail`, `Direccion`, `Usuario`, `password`, `Estado`, `Tipo_Usuario_codigo`) VALUES
(2, '1722239967', 'JIMMY CARRION', '9999', '0992669329', '', 'SANTO DOMINGO', 'ADMIN', 'ADMIN', 'ACTIVO', 2),
(3, '1717171717', 'VENDEDOR GENERICO', '0992669329', '09926669326', '', '', 'OPERADOR', 'ADMIN', 'ACTIVO', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `Cedula` (`Cedula`);

--
-- Indices de la tabla `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `config_equipos`
--
ALTER TABLE `config_equipos`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_config_equipos_equipos1_idx` (`equipos_Codigo`);

--
-- Indices de la tabla `config_usuarios`
--
ALTER TABLE `config_usuarios`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  ADD KEY `fk_config_Usuarios_usuarios1_idx` (`Usuarios_codigo`);

--
-- Indices de la tabla `datosempresa`
--
ALTER TABLE `datosempresa`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`codigo`,`Factura_Codigo`),
  ADD KEY `fk_DetalleFactura_Factura1_idx` (`Factura_Codigo`),
  ADD KEY `fk_DetalleFactura_Productos1_idx` (`Productos_Codigo`);

--
-- Indices de la tabla `detalleproforma`
--
ALTER TABLE `detalleproforma`
  ADD PRIMARY KEY (`codigo`,`proforma_Codigo`),
  ADD KEY `fk_Detalleproforma_proforma1_idx` (`proforma_Codigo`),
  ADD KEY `fk_Detalleproforma_Productos1_idx` (`Productos_Codigo`);

--
-- Indices de la tabla `detalleticket`
--
ALTER TABLE `detalleticket`
  ADD PRIMARY KEY (`codigo`,`ticket_Codigo`),
  ADD KEY `fk_Detalleticket_ticket1_idx` (`ticket_Codigo`),
  ADD KEY `fk_Detalleticket_Productos1_idx` (`Productos_Codigo`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `secuencia3_UNIQUE` (`secuencia3`),
  ADD UNIQUE KEY `secuencia2_UNIQUE` (`secuencia2`),
  ADD UNIQUE KEY `NombreReal` (`NombreReal`),
  ADD UNIQUE KEY `nombreSof` (`nombreSoft`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `fk_Factura_Clientes1_idx` (`Clientes_codigo`),
  ADD KEY `fk_Factura_usuarios1_idx` (`Usuarios_Codigo`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`Codigo`,`Marcas_Codigo`),
  ADD KEY `fk_Modelos_Marcas1_idx` (`Marcas_Codigo`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`codigo`,`Tipos_Usuarios_codigo`),
  ADD KEY `fk_Permisos_Tipos_de Usuarios_idx` (`Tipos_Usuarios_codigo`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Codigo`,`Modelos_Codigo`,`Modelos_Marcas_Codigo`),
  ADD KEY `fk_Productos_Modelos1_idx` (`Modelos_Codigo`,`Modelos_Marcas_Codigo`);

--
-- Indices de la tabla `proformas`
--
ALTER TABLE `proformas`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `fk_proforma_Clientes1_idx` (`Clientes_codigo`),
  ADD KEY `fk_proforma_usuarios1_idx` (`Usuarios_Codigo`);

--
-- Indices de la tabla `seriesfacturas`
--
ALTER TABLE `seriesfacturas`
  ADD PRIMARY KEY (`codigo`) USING BTREE,
  ADD KEY `fk_SeriesFacturas_equipos1_idx` (`equipos_Codigo`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `fk_ticket_Clientes1_idx` (`Clientes_codigo`),
  ADD KEY `fk_ticket_usuarios1_idx` (`Usuarios_Codigo`);

--
-- Indices de la tabla `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`codigo`,`Tipo_Usuario_codigo`),
  ADD KEY `fk_usuarios_Tipo_Usuario1_idx` (`Tipo_Usuario_codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `config`
--
ALTER TABLE `config`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `config_equipos`
--
ALTER TABLE `config_equipos`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `config_usuarios`
--
ALTER TABLE `config_usuarios`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `datosempresa`
--
ALTER TABLE `datosempresa`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;
--
-- AUTO_INCREMENT de la tabla `detalleproforma`
--
ALTER TABLE `detalleproforma`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `detalleticket`
--
ALTER TABLE `detalleticket`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `codigo` int(200) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `proformas`
--
ALTER TABLE `proformas`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `seriesfacturas`
--
ALTER TABLE `seriesfacturas`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `config_equipos`
--
ALTER TABLE `config_equipos`
  ADD CONSTRAINT `fk_config_equipos_equipos1` FOREIGN KEY (`equipos_Codigo`) REFERENCES `equipos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `config_usuarios`
--
ALTER TABLE `config_usuarios`
  ADD CONSTRAINT `fk_config_Usuarios_usuarios1` FOREIGN KEY (`Usuarios_codigo`) REFERENCES `usuarios` (`Tipo_Usuario_codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `fk_DetalleFactura_Factura1` FOREIGN KEY (`Factura_Codigo`) REFERENCES `facturas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DetalleFactura_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleproforma`
--
ALTER TABLE `detalleproforma`
  ADD CONSTRAINT `fk_Detalleproforma_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detalleproforma_proforma1` FOREIGN KEY (`proforma_Codigo`) REFERENCES `proformas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalleticket`
--
ALTER TABLE `detalleticket`
  ADD CONSTRAINT `fk_Detalleticket_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Detalleticket_ticket1` FOREIGN KEY (`ticket_Codigo`) REFERENCES `tickets` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `fk_Factura_Clientes1` FOREIGN KEY (`Clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Factura_usuarios1` FOREIGN KEY (`Usuarios_Codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `fk_Modelos_Marcas1` FOREIGN KEY (`Marcas_Codigo`) REFERENCES `marcas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `fk_Permisos_Tipos_de Usuarios` FOREIGN KEY (`Tipos_Usuarios_codigo`) REFERENCES `tipos_usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_Productos_Modelos1` FOREIGN KEY (`Modelos_Codigo`,`Modelos_Marcas_Codigo`) REFERENCES `modelos` (`Codigo`, `Marcas_Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proformas`
--
ALTER TABLE `proformas`
  ADD CONSTRAINT `fk_proforma_Clientes1` FOREIGN KEY (`Clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_proforma_usuarios1` FOREIGN KEY (`Usuarios_Codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `seriesfacturas`
--
ALTER TABLE `seriesfacturas`
  ADD CONSTRAINT `fk_SeriesFacturas_equipos1` FOREIGN KEY (`equipos_Codigo`) REFERENCES `equipos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_ticket_Clientes1` FOREIGN KEY (`Clientes_codigo`) REFERENCES `clientes` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_usuarios1` FOREIGN KEY (`Usuarios_Codigo`) REFERENCES `usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_Tipo_Usuario1` FOREIGN KEY (`Tipo_Usuario_codigo`) REFERENCES `tipos_usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
