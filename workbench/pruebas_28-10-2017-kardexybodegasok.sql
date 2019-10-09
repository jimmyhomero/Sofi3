-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2017 a las 07:23:58
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
-- Base de datos: `pruebas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bodegas`
--

CREATE TABLE `bodegas` (
  `codigo` int(11) NOT NULL,
  `bodegaID` varchar(45) DEFAULT NULL,
  `bodega` varchar(145) DEFAULT NULL,
  `descripcion` varchar(245) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bodegas`
--

INSERT INTO `bodegas` (`codigo`, `bodegaID`, `bodega`, `descripcion`) VALUES
(1, '1', 'Principal', 'BodegaPrincipal'),
(2, '2', 'el carmen', 'bodega2'),
(3, '3', 'quito1', 'bodega3'),
(4, '4', 'bodega4', 'bodega4'),
(5, '5', 'bodega5', 'bodega5'),
(6, '6', 'bodega6', 'bodega6'),
(7, '7', 'bodega7', 'bodega7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

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
(4, 'PERMITIR FACTURAR SIN STCOCK', 'SI', NULL, NULL, NULL, NULL, NULL),
(6, 'NUMERO DE VECES QUE SE IMPRIMIRÁ FACTURA', '1', NULL, NULL, NULL, NULL, NULL),
(7, 'DOCUMENTO PREDETERMINADO', 'FACTURA', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_equipos`
--

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
(7, 'IMPRESORA FACTURAS', 'Nitro PDF Creator (Pro 10)', NULL, NULL, NULL, NULL, NULL, 3),
(9, 'FORMA DE PAGO PREDETERMINADA', 'CREDITO', NULL, NULL, NULL, NULL, NULL, 3),
(12, 'BODEGA PREDETERMINADA EN COMPRA', '1-Principal', NULL, NULL, NULL, NULL, NULL, 3),
(13, 'BODEGA PREDETERMINADA EN VENTA', '1-Principal', NULL, NULL, NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_usuarios`
--

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
-- Estructura de tabla para la tabla `cxc`
--

CREATE TABLE `cxc` (
  `codigo` int(11) NOT NULL,
  `detalle` varchar(245) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `abono` varchar(45) DEFAULT NULL,
  `saldo` varchar(45) DEFAULT NULL,
  `diasCredito` varchar(45) DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `diasAtrazo` varchar(45) DEFAULT NULL,
  `interes` varchar(45) DEFAULT NULL,
  `documentoCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cxc`
--

INSERT INTO `cxc` (`codigo`, `detalle`, `total`, `abono`, `saldo`, `diasCredito`, `fechaVencimiento`, `diasAtrazo`, `interes`, `documentoCodigo`) VALUES
(2, ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '0.0', '128.0', NULL, '2017-11-22', NULL, NULL, 175),
(3, ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '0.0', '128.0', NULL, '2017-11-22', NULL, NULL, 176),
(4, ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '0.0', '128.0', '30', '2017-11-22', NULL, NULL, 177),
(5, ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '109.50', '500', '-390.5', '30', '2017-11-22', NULL, NULL, 178),
(6, ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '500', '-372.0', '30', '2017-11-22', NULL, NULL, 179),
(7, ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '50', '78.0', '10', '2017-11-02', NULL, NULL, 180),
(8, ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '2.55', '125.45', '30', '2017-11-22', NULL, NULL, 181),
(9, ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '100.00', '0.0', '100.0', '30', '2017-11-22', NULL, NULL, 182),
(10, ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '1000.00', '0.0', '1000.0', '30', '2017-11-22', NULL, NULL, 183),
(11, 'FACTURA -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '100', '28.0', '30', '2017-11-22', NULL, NULL, 184),
(12, 'TICKET -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '109.50', '0.0', '109.5', '5', '2017-10-28', NULL, NULL, 31),
(13, 'TICKET -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '20', '108.0', '30', '2017-11-22', NULL, NULL, 32),
(14, 'TICKET -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '109.50', '0.0', '109.5', '30', '2017-11-22', NULL, NULL, 33),
(15, 'TICKET -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '0.0', '128.0', '30', '2017-11-22', NULL, NULL, 34),
(16, 'FACTURA -- CON FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '128.00', '128.00', '0.0', NULL, '2017-10-23', NULL, NULL, 186),
(17, 'FACTURA -- CON FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '256.00', '256.00', '0.0', NULL, '2017-10-28', NULL, NULL, 187),
(18, 'FACTURA -- CON FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '128.00', '128.00', '0.0', NULL, '2017-10-28', NULL, NULL, 189),
(19, 'FACTURA -- CON FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '200.00', '200.00', '0.0', NULL, '2017-10-28', NULL, NULL, 190);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosempresa`
--

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
(2, '1722239967001', 'COMPUECONOMIA', '0992669329', '0992669329', 'homer_loading@homail.com', 'Santo Domingo', 'LO MISMO PERO MAS BARATO', '1722239967', 'JImmy Carrion', 'cooperativa gran colombia', '3700917', 'observacion', 0x6f62736572766163696f6e);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

CREATE TABLE `detallefactura` (
  `codigo` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(500) DEFAULT NULL,
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
(184, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 134, 2, NULL),
(185, '1', 'AUDIFONO GENIUS HS-02B', '1.0103571428571438', '0', '9.43', '9.43', 135, 16, NULL),
(186, '1', 'AUDIFONO GENIUSS HS-300U', '2.1460714285714317', '0', '20.03', '20.03', 135, 17, NULL),
(187, '1', 'AUDIFONO HSM05 SPEEDMIND NEGRO CON SILVER', '1.4850000000000012', '0', '13.86', '13.86', 135, 18, NULL),
(188, '1', 'CARTUCHO HP 22 COLOR', '3.0535714285714306', '0', '28.5', '28.50', 135, 126, NULL),
(189, '1', 'CARTUCHO CANON 211 COLOR', '2.898214285714289', '0', '27.05', '27.05', 136, 121, NULL),
(190, '1', 'CARTUCHO CANON 145 NEGRO MG2410 180PG', '2.255357142857143', '0', '21.05', '21.05', 136, 118, NULL),
(191, '1', 'IMPRESORA EPSON L395 WIFI', '33.02357142857147', '0', '308.22', '308.22', 137, 226, NULL),
(192, '1', 'IMPRESORA EPSON L395 WIFI', '33.02357142857147', '0', '308.22', '308.22', 137, 226, NULL),
(193, '1', 'ANTENA UBIQUITI 5GHZ NANO BEAM AIRMAX 400MM', '15.759642857142865', '0', '147.09', '147.09', 138, 14, NULL),
(194, '1', 'IMPRESORA EPSON L395 WIFI', '33.02357142857147', '0', '308.22', '308.22', 139, 226, NULL),
(195, '1', 'ADAPTADOR CONVERTIDOR USB 3.0 A VGA', '3.071785714285717', '0', '28.67', '28.67', 140, 6, NULL),
(196, '1', 'BANDEJA SIMPLE 20CM 1 UR NEGRO', '1.6585714285714293', '0', '15.48', '15.48', 141, 26, NULL),
(197, '1', 'SERVICIO TECNICO REPARACION PORTATIL', '19.200000000000017', '0', '179.2', '179.20', 142, 384, NULL),
(198, '1', 'ESET NOD 32 ESET FILE SECURITY  SERVER ', '19.415357142857147', '0', '181.21', '181.21', 144, 184, NULL),
(199, '1', ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', '1.9092857142857156', '0', '17.82', '17.82', 145, 4, NULL),
(200, '1', ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', '1.9092857142857156', '0', '17.82', '17.82', 148, 4, NULL),
(201, '1', ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', '1.9092857142857156', '0', '17.82', '17.82', 149, 4, NULL),
(202, '1', 'ESET NOD 32 ESET FILE SECURITY  SERVER ', '19.415357142857147', '0', '181.21', '181.21', 150, 184, NULL),
(203, '1', ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', '1.9092857142857156', '0', '17.82', '17.82', 151, 4, NULL),
(204, '1', 'ASISTENCIA TECNICA ', '2.962500000000002', '0', '27.65', '27.65', 152, 15, NULL),
(205, '1', ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', '1.9092857142857156', '0', '17.82', '17.82', 153, 4, NULL),
(206, '1', 'IMPRESORA EPSON L395 WIFI', '53.57142857142861', '0', '500', '500.00', 155, 226, NULL),
(207, '1', ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', '10.714285714285722', '0', '100', '100.00', 156, 4, NULL),
(208, '1', 'IMPRESORA EPSON L380', '32.14285714285717', '0', '300', '300.00', 154, 225, NULL),
(209, '1', 'IMPRESORA EPSON 475', '41.14285714285717', '0', '384.0', '384.00', 157, 222, NULL),
(210, '1', 'ESET NOD 32 ESET FILE SECURITY  SERVER ', '21.428571428571445', '0', '200', '200.00', 158, 184, NULL),
(211, '1', 'DIMM HP 8GB DDR3 PC3-10600 G7', '34.40357142857147', '0', '321.1', '321.10', 159, 152, NULL),
(212, '1', ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', '1.9092857142857156', '0', '17.82', '17.82', 160, 4, NULL),
(213, '1', ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', '1.9092857142857156', '0', '17.82', '17.82', 162, 4, NULL),
(214, '1', ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', '1.9092857142857156', '0', '17.82', '17.82', 163, 4, NULL),
(215, '1', 'ESET NOD 32 ESET FILE SECURITY  SERVER ', '19.415357142857147', '0', '181.21', '181.21', 164, 184, NULL),
(216, '1', 'MAINBOARD BIOSTARD H110MD LGA 1151 DDR3L', '8.296071428571437', '0', '77.43', '77.43', 165, 252, NULL),
(217, '1', 'ADAPTADOR CONVERTIDOR USB 3.0 A VGA', '3.071785714285717', '0', '28.67', '28.67', 167, 6, NULL),
(218, '1', 'ALMOADAS KL', '1.3714285714285719', '0', '12.80', '12.80', 168, 1, NULL),
(219, '1', 'CABLE HDMI 1.5', '0.5496428571428575', '0', '5.13', '5.13', 173, 47, NULL),
(220, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 171, 2, NULL),
(221, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 172, 2, NULL),
(222, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 174, 2, NULL),
(223, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 175, 2, NULL),
(224, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 176, 2, NULL),
(225, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 177, 2, NULL),
(226, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 179, 2, NULL),
(227, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 180, 2, NULL),
(228, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 181, 2, NULL),
(229, '1', 'CABLE DE PODER DE TREBOL 1.8MTRS', '10.714285714285722', '0', '100', '100.00', 182, 45, NULL),
(230, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 184, 2, NULL),
(231, '1', 'DVR HIKVISION DS-7104HGI-F1/4CANALES/HDMI/VGA/HASTA6TB', '11.732142857142861', '0', '109.5', '109.50', 185, 181, NULL),
(232, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 186, 2, NULL),
(233, '2', 'DISCO DURO HGS', '27.428571428571445', '0', '128.00', '256.00', 187, 2, NULL),
(234, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 188, 2, NULL),
(235, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 189, 2, NULL),
(236, '1', 'DISCO DURO HGS', '21.428571428571445', '0', '200', '200.00', 190, 2, NULL);

--
-- Disparadores `detallefactura`
--
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

CREATE TABLE `detalleproforma` (
  `codigo` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(500) DEFAULT NULL,
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
(30, '1', 'IMPRESORAS CANON ', '17.678571428571445', '0', '165,00', '165.00', 29, 3, NULL),
(31, '1', 'IMPRESORA EPSON L380', '28.738928571428602', '0', '268.23', '268.23', 30, 225, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleticket`
--

CREATE TABLE `detalleticket` (
  `codigo` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `detalle` varchar(500) DEFAULT NULL,
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
(27, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 30, 2, NULL),
(28, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 32, 2, NULL),
(29, '1', 'DVR HIKVISION DS-7104HGI-F1/4CANALES/HDMI/VGA/HASTA6TB', '11.732142857142861', '0', '109.5', '109.50', 33, 181, NULL),
(30, '1', 'DISCO DURO HGS', '13.714285714285722', '0', '128.00', '128.00', 34, 2, NULL);

--
-- Disparadores `detalleticket`
--
DELIMITER $$
CREATE TRIGGER `UpdateInventarioOnTickets` AFTER INSERT ON `detalleticket` FOR EACH ROW UPDATE productos
     SET productos.cantidad = productos.cantidad - NEW.cantidad
   WHERE productos.codigo = NEW.Productos_Codigo
$$
DELIMITER ;
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
(134, '2017-10-16', '2017-10-16 13:46:03', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000120', 0, '2017-10-16 08:45:50'),
(135, '2017-10-18', '2017-10-18 17:07:34', '12.0', '7.70', '64.12', '0.00', '71.82', '25.5236', 'FACTURA', '0.00', 1, 2, 'DESKTOP-OQEODUI', '001-001-0000122', 0, '2017-10-18 12:07:11'),
(136, '2017-10-18', '2017-10-18 17:08:04', '12.0', '5.15', '42.95', '0.00', '48.10', '10.524000000000001', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000123', 0, '2017-10-18 12:07:11'),
(137, '2017-10-18', '2017-10-18 17:14:48', '12.0', '66.05', '550.39', '0.00', '616.44', '134.84000000000003', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000124', 0, '2017-10-18 12:14:39'),
(138, '2017-10-18', '2017-10-18 17:16:32', '12.0', '15.76', '131.33', '0.00', '147.09', '32.178', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000125', 0, '2017-10-18 12:16:25'),
(139, '2017-10-18', '2017-10-18 17:36:13', '12.0', '33.02', '275.20', '0.00', '308.22', '67.42000000000002', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000126', 0, '2017-10-18 12:36:06'),
(140, '2017-10-18', '2017-10-18 17:38:28', '12.0', '3.07', '25.60', '0.00', '28.67', '6.270000000000003', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000127', 0, '2017-10-18 12:38:22'),
(141, '2017-10-18', '2017-10-18 17:43:21', '12.0', '1.66', '13.82', '0.00', '15.48', '3.3840000000000003', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000128', 0, '2017-10-18 12:43:16'),
(142, '2017-10-18', '2017-10-18 17:51:13', '12.0', '19.20', '160.00', '0.00', '179.20', '39.19999999999999', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000129', 0, '2017-10-18 12:51:06'),
(143, '2017-10-22', '2017-10-22 05:02:08', '12.0', '1.66', '13.82', '0.00', '15.48', '3.3840000000000003', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000130', 0, '2017-10-22 00:01:56'),
(144, '2017-10-22', '2017-10-22 05:12:46', '12.0', '19.42', '161.79', '0.00', '181.21', '39.641999999999996', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000130', 0, '2017-10-22 00:12:35'),
(145, '2017-10-22', '2017-10-22 06:02:31', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000131', 0, '2017-10-22 01:02:21'),
(146, '2017-10-22', '2017-10-22 06:07:01', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000132', 0, '2017-10-22 01:06:38'),
(147, '2017-10-22', '2017-10-22 06:10:28', '12.0', '1.01', '8.42', '0.00', '9.43', '4.714799999999999', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000132', 0, '2017-10-22 01:10:11'),
(148, '2017-10-22', '2017-10-22 06:20:07', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000132', 0, '2017-10-22 01:19:58'),
(149, '2017-10-22', '2017-10-22 06:24:50', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000133', 0, '2017-10-22 01:24:42'),
(150, '2017-10-22', '2017-10-22 06:25:38', '12.0', '19.42', '161.79', '0.00', '181.21', '39.641999999999996', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000134', 0, '2017-10-22 01:25:27'),
(151, '2017-10-22', '2017-10-23 02:29:49', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000135', 0, '2017-10-22 21:29:28'),
(152, '2017-10-22', '2017-10-23 02:37:21', '12.0', '2.96', '24.69', '0.00', '27.65', '6.049999999999997', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000136', 0, '2017-10-22 21:30:54'),
(153, '2017-10-22', '2017-10-23 02:41:00', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000137', 0, '2017-10-22 21:40:48'),
(154, '2017-10-22', '2017-10-23 02:51:07', '12.0', '32.14', '267.86', '0.00', '300.00', '90.445', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000138', 0, '2017-10-22 21:50:40'),
(155, '2017-10-22', '2017-10-23 02:53:26', '12.0', '53.57', '446.43', '0.00', '500.00', '259.2', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000138', 0, '2017-10-22 21:53:13'),
(156, '2017-10-22', '2017-10-23 02:55:08', '12.0', '10.71', '89.29', '0.00', '100.00', '90.33109999999999', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000139', 0, '2017-10-22 21:54:49'),
(157, '2017-10-22', '2017-10-23 02:57:36', '12.0', '41.14', '342.86', '0.00', '384.00', '84.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000140', 0, '2017-10-22 21:57:21'),
(158, '2017-10-23', '2017-10-24 01:15:15', '12.0', '21.43', '178.57', '0.00', '200.00', '58.43199999999999', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000141', 0, '2017-10-23 20:14:53'),
(159, '2017-10-23', '2017-10-24 01:16:51', '12.0', '34.40', '286.70', '0.00', '321.10', '60.04000000000002', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000142', 0, '2017-10-23 20:14:53'),
(160, '2017-10-23', '2017-10-24 01:18:15', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000143', 0, '2017-10-23 20:18:05'),
(161, '2017-10-23', '2017-10-24 01:20:21', '12.0', '11.73', '97.77', '0.00', '109.50', '28.39', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000144', 0, '2017-10-23 20:19:50'),
(162, '2017-10-23', '2017-10-24 01:33:07', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000144', 0, '2017-10-23 20:32:59'),
(163, '2017-10-23', '2017-10-24 01:34:29', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000145', 0, '2017-10-23 20:34:20'),
(164, '2017-10-23', '2017-10-24 01:35:43', '12.0', '19.42', '161.79', '0.00', '181.21', '39.641999999999996', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000146', 0, '2017-10-23 20:34:20'),
(165, '2017-10-23', '2017-10-24 01:37:10', '12.0', '8.30', '69.13', '0.00', '77.43', '17.86500000000001', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000147', 0, '2017-10-23 20:37:00'),
(166, '2017-10-23', '2017-10-24 01:39:33', '12.0', '1.91', '15.91', '0.00', '17.82', '8.1511', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000148', 0, '2017-10-23 20:39:26'),
(167, '2017-10-23', '2017-10-24 01:45:00', '12.0', '3.07', '25.60', '0.00', '28.67', '6.270000000000003', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000148', 0, '2017-10-23 20:44:43'),
(168, '2017-10-23', '2017-10-24 01:46:26', '12.0', '1.37', '11.43', '0.00', '12.80', '2.8000000000000007', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000149', 0, '2017-10-23 20:46:15'),
(169, '2017-10-23', '2017-10-24 01:47:49', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000150', 0, '2017-10-23 20:47:42'),
(170, '2017-10-23', '2017-10-24 02:14:21', '12.0', '11.73', '97.77', '0.00', '109.50', '28.39', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000150', 0, '2017-10-23 20:46:15'),
(171, '2017-10-23', '2017-10-24 02:17:46', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000151', 0, '2017-10-23 21:17:39'),
(172, '2017-10-23', '2017-10-24 02:19:40', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000151', 0, '2017-10-23 21:19:33'),
(173, '2017-10-23', '2017-10-24 02:21:52', '12.0', '0.55', '4.58', '0.00', '5.13', '2.7971999999999997', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000151', 0, '2017-10-23 21:21:45'),
(174, '2017-10-23', '2017-10-24 02:27:09', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000152', 0, '2017-10-23 21:26:51'),
(175, '2017-10-23', '2017-10-24 02:28:34', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000153', 0, '2017-10-23 21:28:26'),
(176, '2017-10-23', '2017-10-24 02:30:05', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000154', 0, '2017-10-23 21:29:59'),
(177, '2017-10-23', '2017-10-24 02:37:45', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000155', 0, '2017-10-23 21:37:28'),
(178, '2017-10-23', '2017-10-24 02:38:08', '12.0', '11.73', '97.77', '0.00', '109.50', '28.39', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000156', 0, '2017-10-23 21:37:28'),
(179, '2017-10-23', '2017-10-24 02:39:50', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000157', 0, '2017-10-23 21:39:23'),
(180, '2017-10-23', '2017-10-24 02:59:56', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000158', 0, '2017-10-23 21:59:32'),
(181, '2017-10-23', '2017-10-24 03:06:15', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000159', 0, '2017-10-23 22:05:22'),
(182, '2017-10-23', '2017-10-24 03:51:21', '12.0', '10.71', '89.29', '0.00', '100.00', '98.5066', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000160', 0, '2017-10-23 22:50:45'),
(183, '2017-10-23', '2017-10-24 03:52:56', '12.0', '107.14', '892.86', '0.00', '1000.00', '802.88', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000161', 0, '2017-10-23 22:50:45'),
(184, '2017-10-23', '2017-10-24 03:57:29', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000162', 0, '2017-10-23 22:57:16'),
(185, '2017-10-23', '2017-10-24 04:06:48', '12.0', '11.73', '97.77', '0.00', '109.50', '28.39', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000163', 0, '2017-10-23 23:06:02'),
(186, '2017-10-23', '2017-10-24 04:10:40', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000164', 0, '2017-10-23 23:10:32'),
(187, '2017-10-28', '2017-10-28 05:05:42', '12.0', '27.43', '228.57', '0.00', '256.00', '56.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000165', 0, '2017-10-28 00:05:26'),
(188, '2017-10-28', '2017-10-28 05:08:08', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000166', 0, '2017-10-28 00:08:00'),
(189, '2017-10-28', '2017-10-28 05:13:01', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000166', 0, '2017-10-28 00:12:51'),
(190, '2017-10-28', '2017-10-28 05:19:18', '12.0', '21.43', '178.57', '0.00', '200.00', '100.0', 'FACTURA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '001-001-0000167', 0, '2017-10-28 00:19:03');

--
-- Disparadores `facturas`
--
DELIMITER $$
CREATE TRIGGER `EliminarDetalleFacturaAntesDeEliminarLaFactira` BEFORE DELETE ON `facturas` FOR EACH ROW DELETE from detallefactura WHERE detallefactura.Factura_Codigo = old.codigo
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaspagov`
--

CREATE TABLE `formaspagov` (
  `codigo` int(11) NOT NULL,
  `FormaPago` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formaspagov`
--

INSERT INTO `formaspagov` (`codigo`, `FormaPago`, `descripcion`) VALUES
(1, 'EFECTIVO', NULL),
(2, 'CREDITO', NULL),
(3, 'TRANSFERENCIA', NULL),
(4, 'MIXTO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `codigo` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fechaevento` timestamp(1) NOT NULL DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1),
  `bodega` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `incantidad` varchar(45) DEFAULT NULL,
  `incosto` varchar(45) DEFAULT NULL,
  `inpvp` varchar(45) DEFAULT NULL,
  `outcantidad` varchar(45) DEFAULT NULL,
  `outcosto` varchar(45) DEFAULT NULL,
  `outpvp` varchar(45) DEFAULT NULL,
  `saldocantidad` varchar(45) DEFAULT NULL,
  `saldocosto` varchar(45) DEFAULT NULL,
  `saldopvp` varchar(45) DEFAULT NULL,
  `productos_Codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`codigo`, `fecha`, `fechaevento`, `bodega`, `detalle`, `incantidad`, `incosto`, `inpvp`, `outcantidad`, `outcosto`, `outpvp`, `saldocantidad`, `saldocosto`, `saldopvp`, `productos_Codigo`) VALUES
(3, '2017-10-24', '2017-10-25 04:09:59.7', NULL, 'INVENTARIO INICIAL IMPORTADO ', '0', '5.4992', '7.42', NULL, NULL, NULL, '0', '5.4992', '7.42', 509),
(4, '2017-10-24', '2017-10-25 04:10:00.0', NULL, 'INVENTARIO INICIAL IMPORTADO ', '10', '22.6632', '29.01', NULL, NULL, NULL, '10', '22.6632', '29.01', 510),
(5, '2017-10-28', '2017-10-28 05:13:01.9', '1', 'SALIDA -- FACTURA 001-001-0000166', '0', NULL, NULL, '1', '100', '128.00', '001-001-0000166', NULL, NULL, 2),
(6, '2017-10-28', '2017-10-28 05:19:18.7', '1', 'SALIDA -- FACTURA 001-001-0000167', '0', NULL, NULL, '1', '100', '200', '001-001-0000167', NULL, NULL, 2);

--
-- Disparadores `kardex`
--
DELIMITER $$
CREATE TRIGGER `kardex` AFTER INSERT ON `kardex` FOR EACH ROW CASE
WHEN NEW.bodega= '1' THEN   UPDATE productos
     SET productos.B1 = B1 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
WHEN NEW.bodega= '2' THEN   UPDATE 
productos SET productos.B2 = B2 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
WHEN NEW.bodega= '3' THEN   UPDATE 
productos SET productos.B3 = B3 - NEW.outcantidad +NEW.incantidad
   WHERE productos.codigo = new.Productos_Codigo;
    END CASE
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

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
(4, 'lenovoss', NULL),
(5, 'SOFTWARE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(6, 'SOFTWARE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(7, 'SOFTWARE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(8, 'SOFTWARE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(9, 'SOFTWARE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(10, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(11, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(12, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(13, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(14, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(15, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(16, 'ANTENA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(17, 'ANTENA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(18, 'ANTENA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(19, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(20, 'AUDIFO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(21, 'AUDIFO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(22, 'AUDIFONO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(23, 'AUDIFO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(24, 'AUDIFO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(25, 'AUDIFO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(26, 'AUDIFO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(27, 'AUDIFO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(28, 'AUDIFONO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(29, 'BALUM', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(30, 'BANDEJA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(31, 'BATERIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(32, 'BATERIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(33, 'BATERIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(34, 'BATERIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(35, 'BATERIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(36, 'SCANNER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(37, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(38, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(39, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(40, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(41, 'BUS VIDEO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(42, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(43, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(44, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(45, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(46, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(47, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(48, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(49, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(50, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(51, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(52, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(53, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(54, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(55, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(56, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(57, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(58, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(59, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(60, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(61, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(62, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(63, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(64, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(65, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(66, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(67, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(68, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(69, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(70, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(71, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(72, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(73, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(74, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(75, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(76, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(77, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(78, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(79, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(80, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(81, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(82, 'CAJA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(83, 'CAJA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(84, 'CAMARA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(85, 'CAMARA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(86, 'CAMARA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(87, 'CAMARA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(88, 'CAMARA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(89, 'CAMARA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(90, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(91, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(92, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(93, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(94, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(95, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(96, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(97, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(98, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(99, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(100, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(101, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(102, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(103, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(104, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(105, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(106, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(107, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(108, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(109, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(110, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(111, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(112, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(113, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(114, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(115, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(116, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(117, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(118, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(119, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(120, 'CARGADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(121, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(122, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(123, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(124, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(125, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(126, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(127, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(128, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(129, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(130, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(131, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(132, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(133, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(134, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(135, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(136, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(137, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(138, 'CARTUCHO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(139, 'CASE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(140, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(141, 'CASE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(142, 'CASE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(143, 'CASE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(144, 'CASE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(145, 'CASE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(146, 'CASE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(147, 'CASE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(148, 'CINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(149, 'CINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(150, 'CINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(151, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(152, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(153, 'CONECTORES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(154, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(155, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(156, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(157, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(158, 'DISCOD DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(159, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(160, 'DISCOD DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(161, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(162, 'DISCOD DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(163, 'DISCOD DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(164, 'DISCOD DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(165, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(166, 'DISCOS DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(167, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(168, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(169, 'DISCO SOLIDO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(170, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(171, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(172, 'DISCOS DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(173, 'DISCOD DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(174, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(175, 'DISCOD DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(176, 'DISCOD DUROS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(177, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(178, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(179, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(180, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(181, 'DISCO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(182, 'DISCO SOLIDO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(183, 'WIRELLESS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(184, 'LECTOR OPTOCA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(185, 'DVD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(186, 'DVR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(187, 'DVR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(188, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(189, 'SOFTWARE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(190, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(191, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(192, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(193, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(194, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(195, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(196, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(197, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(198, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(199, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(200, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(201, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(202, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(203, 'EXTENSION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(204, 'EXTENSION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(205, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(206, 'EXTENSION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(207, 'CONECTORES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(208, 'EXTENSION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(209, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(210, 'FUENTE PODER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(211, 'FUENTE PODER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(212, 'FUENTE PODER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(213, 'FUENTE PODER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(214, 'GATEWAY', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(215, 'MAINBOARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(216, 'HUB', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(217, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(218, 'HUB', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(219, 'HUB', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(220, 'HUB', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(221, 'HUB', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(222, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(223, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(224, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(225, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(226, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(227, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(228, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(229, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(230, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(231, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(232, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(233, 'NUC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(234, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(235, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(236, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(237, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(238, 'IMPRESORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(239, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(240, 'INTERNET CORPORATIVO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(241, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(242, 'INTERNET HOME', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(243, 'INTERNET HOME', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(244, 'INTERNET HOME', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(245, 'INTERNET PYMES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(246, 'CAMARA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(247, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(248, 'PORTATIL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(249, 'LECTOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(250, 'LECTOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(251, 'LECTOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(252, 'TONNER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(253, 'LIMPIEZA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(254, 'MAINBOARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(255, 'MAINBOARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(256, 'MAINBOARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(257, 'MAINBOARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(258, 'MAINBOARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(259, 'MAINBOARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(260, 'MAINBOARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(261, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(262, 'MAINBOARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(263, 'MALETIN', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(264, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(265, 'ESTUCHES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(266, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(267, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(268, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(269, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(270, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(271, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(272, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(273, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(274, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(275, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(276, 'MEMORIA MICRO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(277, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(278, 'MEMORIA MICRO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(279, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(280, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(281, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(282, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(283, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(284, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(285, 'CPU', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(286, 'MALETIN', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(287, 'MOCHILA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(288, 'MOCHILA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(289, 'MONITOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(290, 'MONITOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(291, 'MONITOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(292, 'MONITOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(293, 'MONITOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(294, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(295, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(296, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(297, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(298, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(299, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(300, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(301, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(302, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(303, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(304, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(305, 'MOUSEPAD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(306, 'MOUSEPAD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(307, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(308, 'MOUSE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(309, 'LAPTOP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(310, 'LAPTOP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(311, 'NUC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(312, 'NUC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(313, 'NUC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(314, 'NUC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(315, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(316, 'JUEGOS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(317, 'PALANCA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(318, 'PALANCA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(319, 'VARIOS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(320, 'PANTALLA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(321, 'PANTALLA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(322, 'PANTALLA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(323, 'PANTALLA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(324, 'PANTALLA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(325, 'PAPEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(326, 'PARLANTES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(327, 'PARLANTES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(328, 'PARLANTES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(329, 'PARLANTES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(330, 'PARLANTES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(331, 'PARLANTES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(332, 'PARLANTES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(333, 'PARLANTES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(334, 'PARLANTES', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(335, 'PASTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(336, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(337, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(338, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(339, 'FLASH MEMORY', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(340, 'PEN DRIVE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(341, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(342, 'MEMORIAS FLASH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(343, 'PEN DRIVE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(344, 'PEN DRIVE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(345, 'PONCHADORA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(346, 'PORTATIL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(347, 'PORTATIL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(348, 'PORTATIL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(349, 'PORTATIL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(350, 'PORTATIL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(351, 'PORTATIL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(352, 'PORTATIL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(353, 'PORTATIL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(354, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(355, 'PROCESADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(356, 'PROCESADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(357, 'PROCESADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(358, 'PROCESADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(359, 'PROCESADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(360, 'PROCESADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(361, 'INTERNET HOME', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(362, 'MICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(363, 'VARIOS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(364, 'RACK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(365, 'RASPBERRY', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(366, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(367, 'REGLETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(368, 'REGULADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(369, 'REGULADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(370, 'REGULADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(371, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(372, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(373, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(374, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(375, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(376, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(377, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(378, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(379, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(380, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(381, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(382, 'ROUTERS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(383, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(384, 'SCANNER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(385, 'LECTORES DE BARRA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(386, 'SWITCH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(387, 'SERVIDOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(388, 'SERVIDOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(389, 'SOFTWARE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(390, 'SERVIDOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(391, 'SERVIDOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(392, 'MICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(393, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(394, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(395, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(396, 'SPLITER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(397, 'SWITCH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(398, 'SWITCH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(399, 'SWITCH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(400, 'SWITCH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(401, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(402, 'SWITCH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(403, 'TABLET', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(404, 'TABLET', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(405, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(406, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(407, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(408, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(409, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(410, 'TARJETA VIDEO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(411, 'TARJETA VIDEO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(412, 'TARJETA VIDEO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(413, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(414, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(415, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(416, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(417, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(418, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(419, 'TARJETA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(420, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(421, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(422, 'TECLADOS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(423, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(424, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(425, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(426, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(427, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(428, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(429, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(430, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(431, 'TECLADOS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(432, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(433, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(434, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(435, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(436, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(437, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(438, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(439, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(440, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(441, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(442, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(443, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(444, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(445, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(446, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(447, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(448, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(449, 'TECLADOS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(450, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(451, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(452, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(453, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(454, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(455, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(456, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(457, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(458, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(459, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(460, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(461, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(462, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(463, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(464, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(465, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(466, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(467, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(468, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(469, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(470, 'TINTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(471, 'TONER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(472, 'TONER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(473, 'TONER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(474, 'TONER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(475, 'TONER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(476, 'UPS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(477, 'TV BOX', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(478, 'UNION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(479, 'UNION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(480, 'UNION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(481, 'UPS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(482, 'UPS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(483, 'UPS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(484, 'UPS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(485, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(486, 'VENTILADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(487, 'VENTILADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(488, 'VENTILADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(489, 'VENTILADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(490, 'VENTILADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(491, 'VENTILADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(492, 'VENTILADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(493, 'VISAGRA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(494, 'CAMARA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(495, 'SOFTWARE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(496, 'CATEGORIA GENERAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(497, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(498, 'CABLE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(499, 'AUDIFONO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(500, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(501, 'MEMORIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(502, 'SWITCH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(503, 'TECLADO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(504, ' ', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(505, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(506, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(507, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(508, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(509, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(510, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(511, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(512, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(513, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(514, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA'),
(515, 'ADAPTADOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

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
(4, 'MP210', NULL, 2),
(5, 'NOD32', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 7),
(6, 'NOD32', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 8),
(7, 'NOD32', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 9),
(8, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 10),
(9, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 11),
(10, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 12),
(11, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 13),
(12, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 14),
(13, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 15),
(14, 'UBIQUITI', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 16),
(15, 'MIKROTIK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 17),
(16, 'UBIQUITI', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 18),
(17, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 19),
(18, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 20),
(19, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 21),
(20, 'SPEEDMIND', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 22),
(21, 'KLIP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 23),
(22, 'OMEGA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 24),
(23, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 25),
(24, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 26),
(25, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 27),
(26, 'OMEGA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 28),
(27, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 29),
(28, 'BEAUCOUP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 30),
(29, 'ACER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 31),
(30, 'DEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 32),
(31, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 33),
(32, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 34),
(33, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 35),
(34, 'BIOTRACK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 36),
(35, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 37),
(36, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 38),
(37, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 39),
(38, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 40),
(39, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 41),
(40, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 42),
(41, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 43),
(42, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 44),
(43, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 45),
(44, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 46),
(45, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 47),
(46, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 48),
(47, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 49),
(48, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 50),
(49, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 51),
(50, 'HDMI', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 52),
(51, 'MICROTECH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 53),
(52, 'ANERA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 54),
(53, 'GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 55),
(54, 'HDMI', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 56),
(55, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 57),
(56, 'HDMI', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 58),
(57, 'NEXXT', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 59),
(58, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 60),
(59, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 61),
(60, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 62),
(61, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 63),
(62, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 64),
(63, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 65),
(64, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 66),
(65, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 67),
(66, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 68),
(67, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 69),
(68, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 70),
(69, 'NEXXT', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 71),
(70, 'INS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 72),
(71, 'NEXXT', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 73),
(72, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 74),
(73, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 75),
(74, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 76),
(75, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 77),
(76, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 78),
(77, 'MICROTECH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 79),
(78, 'VGA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 80),
(79, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 81),
(80, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 82),
(81, 'GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 83),
(82, 'HIKVISION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 84),
(83, 'HIKVISION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 85),
(84, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 86),
(85, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 87),
(86, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 88),
(87, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 89),
(88, 'ACER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 90),
(89, 'ACER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 91),
(90, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 92),
(91, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 93),
(92, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 94),
(93, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 95),
(94, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 96),
(95, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 97),
(96, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 98),
(97, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 99),
(98, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 100),
(99, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 101),
(100, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 102),
(101, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 103),
(102, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 104),
(103, 'MAC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 105),
(104, 'LENOVO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 106),
(105, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 107),
(106, 'SONY', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 108),
(107, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 109),
(108, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 110),
(109, 'SONY', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 111),
(110, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 112),
(111, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 113),
(112, 'SAMSUNG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 114),
(113, 'SAMSUNG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 115),
(114, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 116),
(115, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 117),
(116, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 118),
(117, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 119),
(118, 'GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 120),
(119, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 121),
(120, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 122),
(121, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 123),
(122, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 124),
(123, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 125),
(124, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 126),
(125, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 127),
(126, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 128),
(127, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 129),
(128, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 130),
(129, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 131),
(130, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 132),
(131, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 133),
(132, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 134),
(133, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 135),
(134, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 136),
(135, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 137),
(136, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 138),
(137, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 139),
(138, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 140),
(139, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 141),
(140, 'INS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 142),
(141, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 143),
(142, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 144),
(143, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 145),
(144, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 146),
(145, 'QONE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 147),
(146, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 148),
(147, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 149),
(148, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 150),
(149, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 151),
(150, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 152),
(151, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 153),
(152, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 154),
(153, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 155),
(154, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 156),
(155, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 157),
(156, 'WESTER DIGITAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 158),
(157, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 159),
(158, 'WESTER DIGITAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 160),
(159, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 161),
(160, 'WESTER DIGITAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 162),
(161, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 163),
(162, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 164),
(163, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 165),
(164, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 166),
(165, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 167),
(166, 'WESTER DIGITAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 168),
(167, 'WD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 169),
(168, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 170),
(169, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 171),
(170, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 172),
(171, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 173),
(172, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 174),
(173, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 175),
(174, 'WESTER DIGITAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 176),
(175, 'WD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 177),
(176, 'WESTER DIGITAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 178),
(177, 'WESTER DIGITAL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 179),
(178, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 180),
(179, 'WD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 181),
(180, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 182),
(181, 'DLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 183),
(182, 'LG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 184),
(183, 'LG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 185),
(184, 'HIKVISION', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 186),
(185, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 187),
(186, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 188),
(187, 'NOD32', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 189),
(188, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 190),
(189, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 191),
(190, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 192),
(191, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 193),
(192, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 194),
(193, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 195),
(194, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 196),
(195, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 197),
(196, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 198),
(197, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 199),
(198, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 200),
(199, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 201),
(200, 'GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 202),
(201, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 203),
(202, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 204),
(203, 'LBLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 205),
(204, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 206),
(205, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 207),
(206, 'LBLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 208),
(207, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 209),
(208, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 210),
(209, 'INS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 211),
(210, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 212),
(211, 'SPEEDMIND', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 213),
(212, 'GRANSTREAM', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 214),
(213, 'GIGABYTE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 215),
(214, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 216),
(215, 'GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 217),
(216, 'IMEX', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 218),
(217, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 219),
(218, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 220),
(219, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 221),
(220, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 222),
(221, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 223),
(222, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 224),
(223, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 225),
(224, 'TTSC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 226),
(225, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 227),
(226, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 228),
(227, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 229),
(228, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 230),
(229, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 231),
(230, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 232),
(231, 'INTEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 233),
(232, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 234),
(233, 'HONEYWELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 235),
(234, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 236),
(235, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 237),
(236, 'SAMSUNG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 238),
(237, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 239),
(238, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 240),
(239, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 241),
(240, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 242),
(241, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 243),
(242, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 244),
(243, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 245),
(244, 'ANERA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 246),
(245, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 247),
(246, 'LENOVO', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 248),
(247, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 249),
(248, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 250),
(249, 'UNITECH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 251),
(250, 'LEXMARK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 252),
(251, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 253),
(252, 'ASUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 254),
(253, 'BIOSTARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 255),
(254, 'BIOSTAR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 256),
(255, 'BIOSTARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 257),
(256, 'BIOSTARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 258),
(257, 'BIOSTARD', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 259),
(258, 'GIGABYTE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 260),
(259, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 261),
(260, 'GIGABYTE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 262),
(261, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 263),
(262, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 264),
(263, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 265),
(264, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 266),
(265, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 267),
(266, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 268),
(267, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 269),
(268, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 270),
(269, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 271),
(270, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 272),
(271, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 273),
(272, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 274),
(273, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 275),
(274, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 276),
(275, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 277),
(276, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 278),
(277, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 279),
(278, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 280),
(279, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 281),
(280, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 282),
(281, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 283),
(282, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 284),
(283, 'GIGABYTE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 285),
(284, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 286),
(285, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 287),
(286, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 288),
(287, 'AOC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 289),
(288, 'AOC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 290),
(289, 'LG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 291),
(290, 'VIEWSONIC', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 292),
(291, 'SAMSUNG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 293),
(292, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 294),
(293, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 295),
(294, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 296),
(295, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 297),
(296, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 298),
(297, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 299),
(298, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 300),
(299, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 301),
(300, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 302),
(301, 'SPEEDMIND', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 303),
(302, 'INS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 304),
(303, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 305),
(304, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 306),
(305, 'INS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 307),
(306, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 308),
(307, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 309),
(308, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 310),
(309, 'GIGABYTE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 311),
(310, 'INTEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 312),
(311, 'INTEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 313),
(312, 'SPEEDMIND', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 314),
(313, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 315),
(314, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 316),
(315, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 317),
(316, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 318),
(317, 'GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 319),
(318, 'SONY', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 320),
(319, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 321),
(320, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 322),
(321, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 323),
(322, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 324),
(323, 'COPY LASER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 325),
(324, 'HAVIT', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 326),
(325, 'INS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 327),
(326, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 328),
(327, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 329),
(328, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 330),
(329, 'KLIP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 331),
(330, 'INS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 332),
(331, 'OMEGA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 333),
(332, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 334),
(333, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 335),
(334, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 336),
(335, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 337),
(336, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 338),
(337, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 339),
(338, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 340),
(339, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 341),
(340, 'KINGSTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 342),
(341, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 343),
(342, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 344),
(343, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 345),
(344, 'ASUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 346),
(345, 'ASUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 347),
(346, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 348),
(347, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 349),
(348, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 350),
(349, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 351),
(350, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 352),
(351, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 353),
(352, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 354),
(353, 'INTEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 355),
(354, 'INTEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 356),
(355, 'INTEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 357),
(356, 'INTEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 358),
(357, 'INTEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 359),
(358, 'INTEL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 360),
(359, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 361),
(360, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 362),
(361, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 363),
(362, 'BEAUCOP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 364),
(363, 'RASPBERRY', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 365),
(364, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 366),
(365, 'BEAUCOUP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 367),
(366, 'CDP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 368),
(367, 'THOR', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 369),
(368, 'TRIPP LITE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 370),
(369, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 371),
(370, 'DLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 372),
(371, 'DLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 373),
(372, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 374),
(373, 'MIKROTIK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 375),
(374, 'NEXXT', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 376),
(375, 'NEXXT', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 377),
(376, 'MIKROTIK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 378),
(377, 'MIKROTIK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 379),
(378, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 380),
(379, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 381),
(380, 'TPLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 382),
(381, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 383),
(382, 'HONEWELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 384),
(383, 'HONEYWELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 385),
(384, 'TPLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 386),
(385, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 387),
(386, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 388),
(387, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 389),
(388, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 390),
(389, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 391),
(390, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 392),
(391, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 393),
(392, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 394),
(393, 'MICROTECH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 395),
(394, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 396),
(395, 'TPLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 397),
(396, 'DLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 398),
(397, 'NEXXT', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 399),
(398, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 400),
(399, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 401),
(400, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 402),
(401, 'BABUUM', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 403),
(402, 'XTRATECH', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 404),
(403, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 405),
(404, 'GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 406),
(405, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 407),
(406, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 408),
(407, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 409),
(408, 'NVIDIA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 410),
(409, 'ASUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 411),
(410, 'ASUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 412),
(411, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 413),
(412, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 414),
(413, 'DELTA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 415),
(414, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 416),
(415, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 417),
(416, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 418),
(417, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 419),
(418, 'ACER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 420),
(419, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 421),
(420, 'ACER', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 422),
(421, 'ASUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 423),
(422, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 424),
(423, 'SAMSUNG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 425),
(424, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 426),
(425, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 427),
(426, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 428),
(427, 'DELL', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 429),
(428, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 430),
(429, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 431),
(430, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 432),
(431, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 433),
(432, 'GENIUSS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 434),
(433, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 435),
(434, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 436),
(435, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 437),
(436, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 438),
(437, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 439),
(438, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 440),
(439, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 441),
(440, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 442),
(441, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 443),
(442, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 444),
(443, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 445),
(444, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 446),
(445, 'SAMSUNG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 447),
(446, 'SONY', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 448),
(447, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 449),
(448, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 450),
(449, 'TOSHIBA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 451),
(450, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 452),
(451, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 453),
(452, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 454),
(453, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 455),
(454, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 456),
(455, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 457),
(456, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 458),
(457, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 459),
(458, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 460),
(459, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 461),
(460, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 462),
(461, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 463),
(462, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 464),
(463, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 465),
(464, 'CANON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 466),
(465, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 467),
(466, 'EPSON', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 468),
(467, 'PREMIUM', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 469),
(468, 'PREMIUM', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 470),
(469, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 471),
(470, 'KONICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 472),
(471, 'KONICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 473),
(472, 'KONICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 474),
(473, 'KONICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 475),
(474, 'TRIPP LITE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 476),
(475, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 477),
(476, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 478),
(477, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 479),
(478, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 480),
(479, 'CDP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 481),
(480, 'CDP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 482),
(481, 'FORZA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 483),
(482, 'TRIPP LITE', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 484),
(483, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 485),
(484, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 486),
(485, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 487),
(486, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 488),
(487, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 489),
(488, 'HP', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 490),
(489, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 491),
(490, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 492),
(491, 'SONY', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 493),
(492, 'SPEEDMIND', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 494),
(493, 'MICROSOFT', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 495),
(494, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 496),
(495, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 497),
(496, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 498),
(497, 'OMEGA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 499),
(498, 'KINGTONG', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 500),
(499, 'ADATA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 501),
(500, 'TPLINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 502),
(501, 'GENIUS', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 503),
(502, ' ', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 504),
(503, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 505),
(504, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 506),
(505, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 507),
(506, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 508),
(507, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 509),
(508, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 510),
(509, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 511),
(510, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 512),
(511, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 513),
(512, 'MARCA GENERICA', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 514),
(513, 'TP LINK', 'IMPORTADO AUTAMATICAMENTE POR EL ASISTENTE DEL SISTEMA', 515);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `codigo` int(11) NOT NULL,
  `tipo` varchar(55) DEFAULT NULL,
  `descripcion` varchar(345) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  `abono` varchar(45) DEFAULT NULL,
  `saldo` varchar(45) DEFAULT NULL,
  `facturas_codigo` int(11) NOT NULL,
  `formasPagoV_codigo` int(11) DEFAULT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  `diasCredito` varchar(45) DEFAULT NULL,
  `diasAtrazo` varchar(45) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`codigo`, `tipo`, `descripcion`, `total`, `abono`, `saldo`, `facturas_codigo`, `formasPagoV_codigo`, `fechaVencimiento`, `diasCredito`, `diasAtrazo`, `fecha`) VALUES
(1, 'EFECTIVO', ' FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '181.21', '181.21', '0.0', 144, 1, '0000-00-00', '', '', '2017-10-24 02:26:42'),
(2, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '17.82', '10', '7.82', 148, 2, '0000-00-00', '', '', '2017-10-24 02:26:42'),
(3, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '17.82', '10', '7.82', 148, 2, '0000-00-00', '', '', '2017-10-24 02:26:42'),
(4, 'EFECTIVO', ' FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '17.82', '17.82', '0.0', 149, 1, '0000-00-00', '', '', '2017-10-24 02:26:42'),
(5, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '181.21', '4,5', '176.71', 150, 2, '0000-00-00', '', '', '2017-10-24 02:26:42'),
(6, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '181.21', '4,5', '176.71', 150, 2, '0000-00-00', '', '', '2017-10-24 02:26:42'),
(7, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '500.00', '0.0', '0.0', 155, 2, '0000-00-00', '', '', '2017-10-24 02:26:42'),
(8, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '100.00', '0.0', '0.0', 156, 2, '0000-00-00', '', '', '2017-10-24 02:26:42'),
(9, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '384.00', '0.0', '384.0', 157, 2, '0000-00-00', '', '', '2017-10-24 02:26:42'),
(31, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '0.0', '128.0', 175, 2, '2017-11-22', '30', NULL, '2017-10-24 02:28:34'),
(32, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '0.0', '128.0', 176, 2, '2017-11-22', '30', NULL, '2017-10-24 02:30:05'),
(33, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '0.0', '128.0', 177, 2, '2017-11-22', '30', NULL, '2017-10-24 02:37:45'),
(34, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '109.50', '500', '-390.5', 178, 2, '2017-11-22', '30', NULL, '2017-10-24 02:38:08'),
(35, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '500', '-372.0', 179, 2, '2017-11-22', '30', NULL, '2017-10-24 02:39:50'),
(36, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '50', '78.0', 180, 2, '2017-11-02', '10', NULL, '2017-10-24 02:59:56'),
(37, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '2.55', '125.45', 181, 2, '2017-11-22', '30', NULL, '2017-10-24 03:06:15'),
(38, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '100.00', '0.0', '100.0', 182, 2, '2017-11-22', '30', NULL, '2017-10-24 03:51:21'),
(39, 'CREDITO', ' FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '1000.00', '0.0', '1000.0', 183, 2, '2017-11-22', '30', NULL, '2017-10-24 03:52:56'),
(40, 'FACTURA', 'FACTURA -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '100', '28.0', 184, 2, '2017-11-22', '30', NULL, '2017-10-24 03:57:29'),
(41, 'TICKET', 'TICKET -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '109.50', '0.0', '109.5', 31, 2, '2017-10-28', '5', NULL, '2017-10-24 03:58:17'),
(42, 'TICKET', 'TICKET -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '20', '108.0', 32, 2, '2017-11-22', '30', NULL, '2017-10-24 04:04:19'),
(43, 'TICKET', 'TICKET -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '109.50', '0.0', '109.5', 33, 2, '2017-11-22', '30', NULL, '2017-10-24 04:05:06'),
(44, 'TICKET', 'TICKET -- FORMA DE PAGO : CREDITO DESDE : DESKTOP-OQEODUI', '128.00', '0.0', '128.0', 34, 2, '2017-11-22', '30', NULL, '2017-10-24 04:06:13'),
(45, 'FACTURA', 'FACTURA -- CON FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '128.00', '128.00', '0.0', 186, 1, '2017-10-23', NULL, NULL, '2017-10-24 04:10:42'),
(46, 'FACTURA', 'FACTURA -- CON FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '256.00', '256.00', '0.0', 187, 1, '2017-10-28', NULL, NULL, '2017-10-28 05:05:43'),
(47, 'FACTURA', 'FACTURA -- CON FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '128.00', '128.00', '0.0', 189, 1, '2017-10-28', NULL, NULL, '2017-10-28 05:13:02'),
(48, 'FACTURA', 'FACTURA -- CON FORMA DE PAGO : EFECTIVO DESDE : DESKTOP-OQEODUI', '200.00', '200.00', '0.0', 190, 1, '2017-10-28', NULL, NULL, '2017-10-28 05:19:19');

--
-- Disparadores `pagos`
--
DELIMITER $$
CREATE TRIGGER `insertCXCDespuesdeRegistarFaturayPagos` AFTER INSERT ON `pagos` FOR EACH ROW INSERT INTO cxc (detalle, total, abono, saldo, fechaVencimiento,documentoCodigo,diasCredito)
Values (new.descripcion, new.total, new.abono, new.saldo, new.fechaVencimiento,new.facturas_codigo,new.diasCredito)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `codigo` int(200) NOT NULL,
  `Permiso` varchar(45) NOT NULL,
  `Tipos_Usuarios_codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

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
  `Modelos_Marcas_Codigo` int(100) NOT NULL,
  `b1` varchar(45) DEFAULT NULL,
  `b2` varchar(45) DEFAULT NULL,
  `b3` varchar(45) DEFAULT NULL,
  `b4` varchar(45) DEFAULT NULL,
  `b5` varchar(45) DEFAULT NULL,
  `b6` varchar(45) DEFAULT NULL,
  `b7` varchar(45) DEFAULT NULL,
  `b8` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Codigo`, `producto`, `codigoAlterno`, `codigoBarras`, `costo`, `utilidad`, `pvp`, `cantidad`, `unidades`, `ubicacion`, `observacion`, `minimo`, `maximo`, `garantia`, `Modelos_Codigo`, `Modelos_Marcas_Codigo`, `b1`, `b2`, `b3`, `b4`, `b5`, `b6`, `b7`, `b8`) VALUES
(1, 'ALMOADAS KL', '', '', '10', '28', '12.80', '49', 'UNIDADES', ' ,  ,  ,  ,  ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- -- AÑO -- -- MESES -- -- SEMANAS -- -- AÑO -- -- MESES -- -- SEMANAS -- ', 4, 2, '49', '-51', '59', NULL, NULL, NULL, NULL, NULL),
(2, 'DISCO DURO HGS', '', '', '100', '28', '128.00', '31', 'UNIDADES', ' ,  ,  ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- -- AÑO -- -- MESES -- -- SEMANAS -- ', 4, 2, '29', '-69', '41', NULL, NULL, NULL, NULL, NULL),
(3, 'IMPRESORAS CANON ', '1234', '', '150', '10', '165,00', '50', 'UNIDADES', ' ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- ', 4, 2, '50', '-50', '60', NULL, NULL, NULL, NULL, NULL),
(4, ' ESET NOD32 ANTIVIRUS HOME EDITION OEM', 'NOD32HOM', ' ', '9.6689', '84.28', '17.82', '-9', NULL, NULL, ' ', NULL, NULL, NULL, 6, 8, '-9', '-109', '1', NULL, NULL, NULL, NULL, NULL),
(6, 'ADAPTADOR CONVERTIDOR USB 3.0 A VGA', 'ADUSBAVGA', ' ', '22.4', '28.0', '28.67', '-2', NULL, NULL, ' ', NULL, NULL, NULL, 8, 10, '-2', '-102', '8', NULL, NULL, NULL, NULL, NULL),
(7, 'ADAPTADOR USB INALAMBRICO DE 150MBPS', 'USB150', ' ', '5.4992', '35.0', '7.42', '0', NULL, NULL, ' ', NULL, NULL, NULL, 9, 11, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(8, 'ADAPTADOR USB N 300MBPS TP-LINK WN821N', 'TP08WN821N', ' ', '22.6632', '28.0', '29.01', '0', NULL, NULL, ' ', NULL, NULL, NULL, 10, 12, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(9, 'ADAPTADOR USB WIRELESS N300', 'ADAPUSB', ' ', '8.0', '35.0', '10.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 11, 13, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(10, 'ADATA MEMORIA RAM 4G DDR4', 'ADATA-MEMRAM4G', ' ', '36.8704', '28.0', '47.19', '0', NULL, NULL, ' ', NULL, NULL, NULL, 12, 14, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(11, 'ADATA MEMORIA RAM 8GB DDR4', 'ADATA-RAM-DDR4', ' ', '77.0336', '28.0', '98.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 13, 15, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(12, 'ANTENA AIRGRIDMAX 27 DBI 5GHZ', 'AIRGRIDMAX', ' ', '80.64', '28.0', '103.22', '0', NULL, NULL, ' ', NULL, NULL, NULL, 14, 16, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(13, 'ANTENA SXT LITE 5/ANTENA 600MHZ CPU64MB RAM AND ROUTEROS L3', 'SXTLITE', ' ', '58.0608', '28.0', '74.32', '0', NULL, NULL, ' ', NULL, NULL, NULL, 15, 17, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(14, 'ANTENA UBIQUITI 5GHZ NANO BEAM AIRMAX 400MM', 'NANOBEAM', ' ', '114.912', '28.0', '147.09', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 16, 18, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(15, 'ASISTENCIA TECNICA ', 'ASIST-TEC', ' ', '21.6', '28.0', '27.65', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 17, 19, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(16, 'AUDIFONO GENIUS HS-02B', 'HS-02B', ' ', '4.7152', '100.0', '9.43', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 18, 20, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(17, 'AUDIFONO GENIUSS HS-300U', '300U', ' ', '15.65', '28.0', '20.03', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 19, 21, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(18, 'AUDIFONO HSM05 SPEEDMIND NEGRO CON SILVER', 'AUDSPEDD', ' ', '6.9312', '100.0', '13.86', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 20, 22, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(19, 'AUDIFONO INALAMBRICO BLUETOOTH KLIP XTREME', 'AUDIINA', ' ', '16.2512', '28.0', '20.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 21, 23, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(20, 'AUDIFONO MICROFONO OMEGA DE CUERO 862', '662862.0', ' ', '6.0368', '28.0', '7.73', '0', NULL, NULL, ' ', NULL, NULL, NULL, 22, 24, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(21, 'AUDIFONO Y MICROFONO WINSTAR CUERO', 'AUDWINS', ' ', '6.27', '100.0', '12.54', '0', NULL, NULL, ' ', NULL, NULL, NULL, 23, 25, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(22, 'AUDIFONOS GENIUS HSM225 ', 'HSM225', ' ', '5.264', '28.0', '6.74', '0', NULL, NULL, ' ', NULL, NULL, NULL, 24, 26, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(23, 'AUDIFONOS HSM505', 'HSM505', ' ', '9.5536', '28.0', '12.23', '0', NULL, NULL, ' ', NULL, NULL, NULL, 25, 27, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(24, 'AUDIFONOS STEREO OMEGA GAMING', 'AUDIFONOSSTEREOOMEGA', ' ', '13.2944', '70.0', '22.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 26, 28, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(25, 'BALUM PARA CAMARAS TIPO BORNERA PAR ST-202E', 'BALUM', ' ', '2.4976', '28.0', '3.2', '0', NULL, NULL, ' ', NULL, NULL, NULL, 27, 29, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(26, 'BANDEJA SIMPLE 20CM 1 UR NEGRO', 'BANDE', ' ', '12.096', '28.0', '15.48', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 28, 30, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(27, 'BATERIA ACER ONE ZG5', 'BATACER', ' ', '40.0', '28.0', '51.2', '0', NULL, NULL, ' ', NULL, NULL, NULL, 29, 31, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(28, 'BATERIA DELL 5521', 'BATDELL5521', ' ', '60.0', '28.0', '76.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 30, 32, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(29, 'BATERIA HP 326 420 421 620 4420S 4320S 4520S 4525S', 'BATHP', ' ', '88.2246', '28.0', '112.93', '0', NULL, NULL, ' ', NULL, NULL, NULL, 31, 33, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(30, 'BATERIA HP DV4 E68032B H', 'BATHPDV4', ' ', '43.0', '28.0', '55.04', '0', NULL, NULL, ' ', NULL, NULL, NULL, 32, 34, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(31, 'BATERIA HP MU06', 'BATHPMU', ' ', '44.9958', '28.0', '57.59', '0', NULL, NULL, ' ', NULL, NULL, NULL, 33, 35, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(32, 'BIOMETRICO CONTROL DE ASISTENCIA HUELLA DACTILAR CLAVE O TARJETA D PROXI', 'BIOBT-BTIME', ' ', '197.12', '28.0', '252.31', '0', NULL, NULL, ' ', NULL, NULL, NULL, 34, 36, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(33, 'BLUETOOTH USB V4.0', 'BLUE', ' ', '5.32', '95.0', '10.37', '0', NULL, NULL, ' ', NULL, NULL, NULL, 35, 37, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(34, 'BUS DE DATOS IDE', 'IDE', ' ', '0.85', '28.0', '1.09', '0', NULL, NULL, ' ', NULL, NULL, NULL, 36, 38, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(35, 'BUS DE DATOS SATA', 'SATA', ' ', '0.5', '200.0', '1.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 37, 39, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(36, 'BUS DE VIDEO DELL 15-3521', 'BUSVID', ' ', '20.67', '28.0', '26.46', '0', NULL, NULL, ' ', NULL, NULL, NULL, 38, 40, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(37, 'BUS DE VIDEO DELL INSPIRION 14R 5420 7420 2518 9518', 'BUSVID7320', ' ', '24.64', '28.0', '31.54', '0', NULL, NULL, ' ', NULL, NULL, NULL, 39, 41, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(38, 'CABLE ADAPTADOR DE PARALELO A USB 2.0', 'CABLEPARAAUSB', ' ', '4.5002', '100.0', '9.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 40, 42, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(39, 'CABLE CONVERTIDOR DE USB A DB-9', 'USBADB9', ' ', '9.5', '28.0', '12.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 41, 43, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(40, 'CABLE DE AUDIO AUXILIAR 3.5 A 3.5 DE 1M', 'CABLAU3', ' ', '0.784', '50.0', '1.18', '0', NULL, NULL, ' ', NULL, NULL, NULL, 42, 44, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(41, 'CABLE DE AUDIO AUXILIAR 3.5 A 3.5 DE 3M', 'CABLEAUDIO', ' ', '1.425', '100.0', '2.85', '0', NULL, NULL, ' ', NULL, NULL, NULL, 43, 45, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(42, 'CABLE DE AUDIO AUXILIAR 3.5 A 3.5 DE 5M', 'AUDIO5M', ' ', '2.8', '50.0', '4.2', '0', NULL, NULL, ' ', NULL, NULL, NULL, 44, 46, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(43, 'CABLE DE PODER', 'CPODER3', ' ', '2.0', '100.0', '4.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 45, 47, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(44, 'CABLE DE PODER DE DOS 1.5MTRS', 'CABLEPODER2', ' ', '1.1648', '100.0', '2.33', '0', NULL, NULL, ' ', NULL, NULL, NULL, 46, 48, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(45, 'CABLE DE PODER DE TREBOL 1.8MTRS', 'PODERTREBOL', ' ', '1.4934', '100.0', '2.99', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 47, 49, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(46, 'CABLE DE RED UTP CAT 5E', 'UTPCAT5', ' ', '0.2754', '180.0', '0.77', '0', NULL, NULL, ' ', NULL, NULL, NULL, 48, 50, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(47, 'CABLE HDMI 1.5', 'CAB-HDMI', ' ', '2.3328', '120.0', '5.13', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 49, 51, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(48, 'CABLE HDMI 10 METROS', 'CABHDMI10M', ' ', '10.5', '100.0', '21.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 50, 52, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(49, 'CABLE HDMI 15MTS C/FILTRO', 'HDMI15', ' ', '15.5008', '80.0', '27.9', '0', NULL, NULL, ' ', NULL, NULL, NULL, 51, 53, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(50, 'CABLE HDMI 30 M', 'CABHDMI30M', ' ', '38.9984', '35.0', '52.65', '0', NULL, NULL, ' ', NULL, NULL, NULL, 52, 54, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(51, 'CABLE HDMI 3M', 'HDMI3', ' ', '4.2997', '95.0', '8.38', '0', NULL, NULL, ' ', NULL, NULL, NULL, 53, 55, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(52, 'CABLE HDMI 5 METROS', 'CABHDMI5M', ' ', '5.9002', '100.0', '11.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 54, 56, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(53, 'CABLE HDMI A MICRO HDMI 1.5 MTRS', 'HDMIMICRO', ' ', '2.8', '100.0', '5.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 55, 57, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(54, 'CABLE HDMI DE 20M', 'CABHDMI20M', ' ', '20.4997', '90.0', '38.95', '0', NULL, NULL, ' ', NULL, NULL, NULL, 56, 58, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(55, 'CABLE NEXXT F/UTP PARA EXTERIOR/OUTDOOR CABLE 4 PARES CAT6 BK CMX', 'CABLEUTPEXT', ' ', '212.4864', '28.0', '271.98', '0', NULL, NULL, ' ', NULL, NULL, NULL, 57, 59, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(56, 'CABLE OTG', 'OTG', ' ', '4.0', '28.0', '5.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 58, 60, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(57, 'CABLE PODER IDE SATA', 'PIDE', ' ', '0.448', '200.0', '1.34', '0', NULL, NULL, ' ', NULL, NULL, NULL, 59, 61, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(58, 'CABLE USB 2.0 PARA DISCO DURO EXTERNO', 'USBDIS3.0', ' ', '1.792', '35.0', '2.42', '0', NULL, NULL, ' ', NULL, NULL, NULL, 60, 62, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(59, 'CABLE USB 3.0 PARA DISCO DURO EXTERNO', 'USDDIS3.0', ' ', '2.24', '35.0', '3.02', '0', NULL, NULL, ' ', NULL, NULL, NULL, 61, 63, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(60, 'CABLE USB A MINI 5P MICRO 5P NOKIA/IPHONE', 'CABCELMINI', ' ', '2.1168', '30.0', '2.75', '0', NULL, NULL, ' ', NULL, NULL, NULL, 62, 64, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(61, 'CABLE USB DE IMPRESORA 3 MTRS', 'USB3M', ' ', '1.68', '100.0', '3.36', '0', NULL, NULL, ' ', NULL, NULL, NULL, 63, 65, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(62, 'CABLE USB DE IMPRESORA DE 5 METROS', 'USBIMPRESORA5', ' ', '3.0016', '100.0', '6.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 64, 66, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(63, 'CABLE USB PARA BASES DE ENFRIAMIENTO 40CM', 'CABLEUSB', ' ', '0.7056', '100.0', '1.41', '0', NULL, NULL, ' ', NULL, NULL, NULL, 65, 67, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(64, 'CABLE USB PARA CARGA CELULAR ECO', 'USBCEL1', ' ', '0.65', '50.0', '0.98', '0', NULL, NULL, ' ', NULL, NULL, NULL, 66, 68, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(65, 'CABLE USB PARA CARGA CELULAR TIP FIDEO', 'USB2', ' ', '0.8', '50.0', '1.2', '0', NULL, NULL, ' ', NULL, NULL, NULL, 67, 69, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(66, 'CABLE USB PARA IMPRESORA 1.5MTRS', 'CAUSB', ' ', '0.9968', '75.0', '1.74', '0', NULL, NULL, ' ', NULL, NULL, NULL, 68, 70, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(67, 'CABLE UTP 4PARES CAT5E EXTERIOR', 'CABLEUTP4PARESCAT5EEXTERIOR', ' ', '0.6243', '60.0', '1.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 69, 71, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(68, 'CABLE UTP CAT6 305MTRS/INS', 'CABLUTP6', ' ', '61.0', '80.0', '109.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 70, 72, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(69, 'CABLE UTP NEXXT CAT6 GRIS ', 'CABNEXTEXT', ' ', '142.24', '30.0', '184.91', '0', NULL, NULL, ' ', NULL, NULL, NULL, 71, 73, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(70, 'CABLE VGA 1.8 MTRS', 'VGA', ' ', '2.24', '120.0', '4.93', '0', NULL, NULL, ' ', NULL, NULL, NULL, 72, 74, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(71, 'CABLE VGA 10MTRS', 'VGA10', ' ', '8.232', '100.0', '16.46', '0', NULL, NULL, ' ', NULL, NULL, NULL, 73, 75, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(72, 'CABLE VGA 15MTRS', 'VGA15', ' ', '10.9013', '100.0', '21.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 74, 76, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(73, 'CABLE VGA 25 MTRS ', 'VGA20', ' ', '20.2996', '100.0', '40.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 75, 77, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(74, 'CABLE VGA 3MT C/FILTRO ', 'VGA3M', ' ', '3.8988', '100.0', '7.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 76, 78, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(75, 'CABLE VGA 40MTS', 'CABLEVGA40MTS', ' ', '34.6976', '95.0', '67.66', '0', NULL, NULL, ' ', NULL, NULL, NULL, 77, 79, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(76, 'CABLE VGA 5MTRS', 'VGA5M', ' ', '4.48', '30.0', '5.82', '0', NULL, NULL, ' ', NULL, NULL, NULL, 78, 80, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(77, 'CABLE VGA 8METROS', 'CABLVGA8M', ' ', '7.5012', '100.0', '15.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 79, 81, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(78, 'CAJA REGISTRADORA DE DINERO BEMATECH', 'CAJA', ' ', '43.68', '28.0', '55.91', '0', NULL, NULL, ' ', NULL, NULL, NULL, 80, 82, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(79, 'CAJA REGISTRADORA DE DINERO CASH DRAWER TAMAÑO MEDIANO', 'CAJABEMED', ' ', '44.8', '30.0', '58.24', '0', NULL, NULL, ' ', NULL, NULL, NULL, 81, 83, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(80, 'CAMARA HIKVISION DS-2CE56C0T/TIPO DOMO PLASTICA/VISION NOCTURNA', 'CAMHI', ' ', '39.729', '50.0', '59.59', '0', NULL, NULL, ' ', NULL, NULL, NULL, 83, 85, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(81, 'CAMARA TIPO DOMO PARA INTERIOR', 'DOMO', ' ', '26.32', '28.0', '33.69', '0', NULL, NULL, ' ', NULL, NULL, NULL, 84, 86, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(82, 'CAMARA WEB GENIUS FACE CAM 321', '321.0', ' ', '10.3', '50.0', '15.45', '0', NULL, NULL, ' ', NULL, NULL, NULL, 85, 87, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(83, 'CAMARA WEB OMEGA', 'OMEGA', ' ', '5.79', '28.0', '7.41', '0', NULL, NULL, ' ', NULL, NULL, NULL, 86, 88, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(84, 'CAMARA WEB PC CAMERA', 'PCAMERA', ' ', '2.9', '75.0', '5.08', '0', NULL, NULL, ' ', NULL, NULL, NULL, 87, 89, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(85, 'CARGADOR ACER 19V 3.42A', 'CARACER', ' ', '12.5', '120.0', '27.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 88, 90, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(86, 'CARGADOR ACER ONE 19V 1.58A', 'CARAONE', ' ', '14.5008', '100.0', '29.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 89, 91, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(87, 'CARGADOR ASUS 19V 3.42A PLUG 5.5X2.5', 'CARGASU', ' ', '11.3904', '28.0', '14.58', '0', NULL, NULL, ' ', NULL, NULL, NULL, 90, 92, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(88, 'CARGADOR DE CELULAR PARA CARRO 2 PUERTOS', 'CARGCARRCEL', ' ', '1.3', '50.0', '1.95', '0', NULL, NULL, ' ', NULL, NULL, NULL, 91, 93, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(89, 'CARGADOR DE PARED 12V 2A (DVR)', 'CARGAPARED12', ' ', '5.0999', '30.0', '6.63', '0', NULL, NULL, ' ', NULL, NULL, NULL, 92, 94, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(90, 'CARGADOR DE PARED DE . 5V - 2A 2 PTOS USB', 'CARPARED', ' ', '2.016', '50.0', '3.02', '0', NULL, NULL, ' ', NULL, NULL, NULL, 93, 95, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(91, 'CARGADOR DELL 19.5V 3.34A', 'CARGDEL', ' ', '12.5', '100.0', '25.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 94, 96, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(92, 'CARGADOR DELL 19.5V 4.62A', 'CARDELL', ' ', '17.5056', '30.0', '22.76', '0', NULL, NULL, ' ', NULL, NULL, NULL, 95, 97, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(93, 'CARGADOR DELL MINI 19V 1.58A', 'CARGDELL', ' ', '11.8674', '150.0', '29.67', '0', NULL, NULL, ' ', NULL, NULL, NULL, 96, 98, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(94, 'CARGADOR EPSON TMU', 'CAR-EPSON-TMU', ' ', '30.1504', '45.0', '43.72', '0', NULL, NULL, ' ', NULL, NULL, NULL, 97, 99, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(95, 'CARGADOR HP 18.5V 3.5A ', 'CARGHP', ' ', '17.5056', '100.0', '35.01', '0', NULL, NULL, ' ', NULL, NULL, NULL, 98, 100, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(96, 'CARGADOR HP 19.5V 3.33A PUNTA FINA', 'CARHP', ' ', '13.832', '100.0', '27.66', '0', NULL, NULL, ' ', NULL, NULL, NULL, 99, 101, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(97, 'CARGADOR HP 19V 4.7A', 'CARGHP19', ' ', '15.6128', '80.0', '28.1', '0', NULL, NULL, ' ', NULL, NULL, NULL, 100, 102, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(98, 'CARGADOR HP MINI 19V 1.58A PLUG 4.0X1.7 FINO', 'CARGMINI19V', ' ', '11.3456', '28.0', '14.52', '0', NULL, NULL, ' ', NULL, NULL, NULL, 101, 103, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(99, 'CARGADOR HP MINI 19V 2.5A PLUG 5.5X2.5', 'CARHPMIN', ' ', '11.4464', '28.0', '14.65', '0', NULL, NULL, ' ', NULL, NULL, NULL, 102, 104, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(100, 'CARGADOR MAC 16.5V 3.65A', 'CARMAC', ' ', '31.92', '50.0', '47.88', '0', NULL, NULL, ' ', NULL, NULL, NULL, 103, 105, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(101, 'CARGADOR PARA LENOVO 20V 2A', 'CARLEN', ' ', '17.9984', '100.0', '36.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 104, 106, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(102, 'CARGADOR PARA MONITOR SAMSUNG 12V', 'CARGSAMN', ' ', '17.0', '28.0', '21.76', '0', NULL, NULL, ' ', NULL, NULL, NULL, 105, 107, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(103, 'CARGADOR PARA SONY 19.5V 4.7A PLUG 6.0X4.4', 'CARGSO', ' ', '14.7504', '28.0', '18.88', '0', NULL, NULL, ' ', NULL, NULL, NULL, 106, 108, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(104, 'CARGADOR PARA TOSHIBA 19V 2.1A PLUG 3.0X1.1', 'CARTOSH4', ' ', '11.4464', '28.0', '14.65', '0', NULL, NULL, ' ', NULL, NULL, NULL, 107, 109, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(105, 'CARGADOR PARA TOSHIBA 19V 2.3A PLUG 5.5X2.5', 'CARTOSH3', ' ', '11.2112', '28.0', '14.35', '0', NULL, NULL, ' ', NULL, NULL, NULL, 108, 110, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(106, 'CARGADOR PARA TOSHIBA 19V 3.42A PLUG 5.5X2.5', 'CARS2', ' ', '12.3424', '28.0', '15.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 109, 111, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(107, 'CARGADOR PARA TOSHIBA 19V 4.74A PLUG 5.5X2.5', 'CARTOSH2', ' ', '15.68', '28.0', '20.07', '0', NULL, NULL, ' ', NULL, NULL, NULL, 110, 112, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(108, 'CARGADOR PARA TOSHIBA 19V 6.32A PLUG 5.5X2.5', 'CARTOS', ' ', '20.776', '28.0', '26.59', '0', NULL, NULL, ' ', NULL, NULL, NULL, 111, 113, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(109, 'CARGADOR SAMSUNG 19V 2.1A PUNTA AMARILLA', 'CARSAMG', ' ', '13.0', '100.0', '26.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 112, 114, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(110, 'CARGADOR SAMSUNG 2 EN 1 MICRO USB (TELFONO)', 'CARSAMCEL', ' ', '2.5', '30.0', '3.25', '0', NULL, NULL, ' ', NULL, NULL, NULL, 113, 115, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(111, 'CARGADOR SONY 19.5V 3.9A', 'CARSONY', ' ', '15.3216', '28.0', '19.61', '0', NULL, NULL, ' ', NULL, NULL, NULL, 114, 116, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(112, 'CARGADOR TOSHIBA MINI 19V 1.58 A', 'CARGADOR TOSHIBA MINI', ' ', '17.5', '100.0', '35.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 115, 117, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(113, 'CARGADOR UNIVERSAL PARA PORTATILES 15PLUG-USB / CARGA CARRO', 'CARGGENER', ' ', '19.936', '30.0', '25.92', '0', NULL, NULL, ' ', NULL, NULL, NULL, 116, 118, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(114, 'CARGADOR UNIVERSAL PARA TABLETS Y CELULARES 5.25V 3A', 'CARGATABLCEL', ' ', '6.72', '30.0', '8.74', '0', NULL, NULL, ' ', NULL, NULL, NULL, 117, 119, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(115, 'CARGADOR UNIVERSAL VARIAS PUNTAS', 'CARGUNIV', ' ', '23.19', '28.0', '29.68', '0', NULL, NULL, ' ', NULL, NULL, NULL, 118, 120, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(116, 'CARPETA PAPEL', 'CARP', ' ', '0.2052', '27.97', '0.26', '0', NULL, NULL, ' ', NULL, NULL, NULL, 119, 121, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(117, 'CARTUCHO CANON 141 COLOR ', '141.0', ' ', '26.8', '28.0', '34.3', '0', NULL, NULL, ' ', NULL, NULL, NULL, 120, 122, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(118, 'CARTUCHO CANON 145 NEGRO MG2410 180PG', '145.0', ' ', '16.4416', '28.0', '21.05', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 121, 123, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(119, 'CARTUCHO CANON 146 COLOR/MG2410/MG2510/180PG', '146.0', ' ', '19.824', '28.0', '25.37', '0', NULL, NULL, ' ', NULL, NULL, NULL, 122, 124, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(120, 'CARTUCHO CANON 210 BLACK', 'CARTUCHO 210', ' ', '15.9264', '30.0', '20.7', '0', NULL, NULL, ' ', NULL, NULL, NULL, 123, 125, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(121, 'CARTUCHO CANON 211 COLOR', 'CART-211', ' ', '21.1344', '28.0', '27.05', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 124, 126, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(122, 'CARTUCHO CANON 240', 'CARCANON240', ' ', '21.0448', '50.0', '31.57', '0', NULL, NULL, ' ', NULL, NULL, NULL, 125, 127, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(123, 'CARTUCHO CANON 241 XL', 'CAR241', ' ', '42.6132', '50.0', '63.92', '0', NULL, NULL, ' ', NULL, NULL, NULL, 126, 128, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(124, 'CARTUCHO CANON NEGRO 44', 'CARTUCHOCANON44', ' ', '13.6528', '83.15', '25.01', '0', NULL, NULL, ' ', NULL, NULL, NULL, 127, 129, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(125, 'CARTUCHO CANON PG-140 NEGRO', '140.0', ' ', '21.75', '50.0', '32.62', '0', NULL, NULL, ' ', NULL, NULL, NULL, 128, 130, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(126, 'CARTUCHO HP 22 COLOR', '22.0', ' ', '19.0', '50.0', '28.5', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 129, 131, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(127, 'CARTUCHO HP 28 COLOR', '28.0', ' ', '18.0', '50.0', '27.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 130, 132, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(128, 'CARTUCHO HP 670 COLOR', '670.0', ' ', '18.0', '50.0', '27.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 131, 133, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(129, 'CARTUCHO HP 901 COLOR', '901.0', ' ', '18.0', '50.0', '27.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 132, 134, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(130, 'CARTUCHO HP 901 NEGRO', '901N', ' ', '17.0', '50.0', '25.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 133, 135, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(131, 'CARTUCHO HP 92 COLOR', '92.0', ' ', '19.0', '50.0', '28.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 134, 136, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(132, 'CARTUCHO HP 94 COLOR', '94.0', ' ', '19.0', '50.0', '28.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 135, 137, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(133, 'CARTUCHO LEXMARK 105 X NEGRO', '105.0', ' ', '5.76', '50.0', '8.64', '0', NULL, NULL, ' ', NULL, NULL, NULL, 136, 138, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(134, 'CASE CAPSULA 3.5 USB 3.0 SATA', 'CASE3.0', ' ', '16.8', '28.0', '21.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 137, 139, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(135, 'CASE CAPSULA DE DISCO 2.5 USB 2.0', 'CAP2.5', ' ', '5.32', '50.0', '7.98', '0', NULL, NULL, ' ', NULL, NULL, NULL, 138, 140, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(136, 'CASE CAPSULA PARA DISCO 2.5 A USB 3.0 SATA', 'CASE2.5A3.0', ' ', '12.88', '28.0', '16.49', '0', NULL, NULL, ' ', NULL, NULL, NULL, 139, 141, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(137, 'CASE COMBO CON AGARRADERA INS', 'CASINS', ' ', '36.48', '50.0', '54.72', '0', NULL, NULL, ' ', NULL, NULL, NULL, 140, 142, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(138, 'CASE COMBO GENERICO ', 'CASE', ' ', '35.0', '50.0', '52.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 141, 143, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(139, 'CASE EXTERNO PARA DISCO 3.5 SATA SOPORTA HASTA 2TB', 'CSEEXTE3.5', ' ', '9.99', '50.0', '14.98', '0', NULL, NULL, ' ', NULL, NULL, NULL, 142, 144, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(140, 'CASE GAMER SPEEDMIND', 'CASEGAMER', ' ', '33.6', '50.0', '50.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 143, 145, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(141, 'CASE GENERICO', 'CASE1', ' ', '29.176', '28.0', '37.35', '0', NULL, NULL, ' ', NULL, NULL, NULL, 144, 146, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(142, 'CASE Q-ONE COMBO KEY/PAR/MOU OPT/BLACK', 'CASEQONE', ' ', '39.1104', '28.0', '50.06', '0', NULL, NULL, ' ', NULL, NULL, NULL, 145, 147, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(143, 'CINTA EPSON ERC-38B PARA TMU', 'ERC-38B', ' ', '1.9', '28.0', '2.43', '0', NULL, NULL, ' ', NULL, NULL, NULL, 146, 148, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(144, 'CINTA EPSON FX-890 S015329', 'CINTF890', ' ', '8.436', '45.0', '12.23', '0', NULL, NULL, ' ', NULL, NULL, NULL, 147, 149, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(145, 'CINTA EPSON LX-350 S015631', 'CINTL350', ' ', '5.1642', '45.0', '7.49', '0', NULL, NULL, ' ', NULL, NULL, NULL, 148, 150, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(146, 'COMBO TECLADO Y MOUSE GENIUS INALAMBRICO SLIMSTAR8000ME', 'TECYMOUS', '4.710268244387E12', '15.064', '75.0', '26.36', '0', NULL, NULL, ' ', NULL, NULL, NULL, 149, 151, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(147, 'COMBO TECLADO/MOUSE/PARLANTES', 'COMB', ' ', '12.0', '65.0', '19.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 150, 152, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(148, 'CONECTORES RJ45', 'RJ45', ' ', '0.1904', '39.91', '0.27', '0', NULL, NULL, ' ', NULL, NULL, NULL, 151, 153, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(149, 'CONTACT CLEANER ABRO', 'CONTAC', ' ', '5.7904', '95.0', '11.29', '0', NULL, NULL, ' ', NULL, NULL, NULL, 152, 154, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(150, 'CONVERTIDOR SEÑAL DE VGA A HDMI', 'CONHDMIA VGA', ' ', '10.696', '30.0', '13.9', '0', NULL, NULL, ' ', NULL, NULL, NULL, 153, 155, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(151, 'DELL INSPIRON 14 3467/I5-7200U 2.50GHZ/7MA GEN/8GB/1TB/HDMI/BLUETOOTH/DVDRW/14\"/NEGRA/UBUNTU/TECLADO ESPAÑOL', 'DELL-LAP 3467', ' ', '627.2', '28.0', '802.82', '0', NULL, NULL, ' ', NULL, NULL, NULL, 154, 156, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(152, 'DIMM HP 8GB DDR3 PC3-10600 G7', 'DIM HP G7 8GB', ' ', '261.06', '23.0', '321.1', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 155, 157, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(153, 'DISCO DURO  320GB', 'WD-HDD320', ' ', '17.92', '65.0', '29.57', '0', NULL, NULL, ' ', NULL, NULL, NULL, 156, 158, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(154, 'DISCO DURO 1T WD 2.5 NOTEBOOK', 'DISCOSD', ' ', '77.98', '30.0', '101.37', '0', NULL, NULL, ' ', NULL, NULL, NULL, 157, 159, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(155, 'DISCO DURO 4TB WESTER DIGITAL PURPLE', 'DISCO4TB', ' ', '179.256', '28.0', '204.85', '0', NULL, NULL, ' ', NULL, NULL, NULL, 158, 160, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(156, 'DISCO DURO 500 GB  PC', 'DISCO500', 'AAAAA10', '36.48', '45.0', '52.9', '0', NULL, NULL, ' ', NULL, NULL, NULL, 159, 161, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(157, 'DISCO DURO 500GB WD GREEN POWER', 'DIS500WDG', ' ', '43.68', '28.0', '55.91', '0', NULL, NULL, ' ', NULL, NULL, NULL, 160, 162, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(158, 'DISCO DURO 750GB 2.5 SATA 5400RMP NOTEBOOK', 'DISCO750', ' ', '67.26', '35.0', '90.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 161, 163, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(159, 'DISCO DURO DELL SERVER 2TB SERIAL ATA HOT PLUG RIEL 720', 'DISCOSERV', ' ', '224.58', '28.0', '287.46', '0', NULL, NULL, ' ', NULL, NULL, NULL, 162, 164, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(160, 'DISCO DURO EXTERNO ADATA 1TB HV620 NEGRO', 'ADATAEXTE', ' ', '67.2896', '30.0', '87.48', '0', NULL, NULL, ' ', NULL, NULL, NULL, 163, 165, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(161, 'DISCO DURO EXTERNO ADATA 2TB HC660 USB 3.0', 'DISEXTADA2TB', ' ', '148.512', '28.0', '190.1', '0', NULL, NULL, ' ', NULL, NULL, NULL, 164, 166, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(162, 'DISCO DURO EXTERNO TOSHIBA 1TB', 'DISCEXTTOSH', ' ', '82.5702', '28.0', '105.69', '0', NULL, NULL, ' ', NULL, NULL, NULL, 165, 167, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(163, 'DISCO DURO EXTERNO WD 1TB', 'DISCEXTWD1TB', '7.18037807607E11', '83.22', '28.0', '106.52', '0', NULL, NULL, ' ', NULL, NULL, NULL, 166, 168, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(164, 'DISCO DURO SOLIDO WD 240GB SATA III 6GBS 2.5 INCH 7MM', 'SOLI24WD', ' ', '107.5536', '28.0', '137.67', '0', NULL, NULL, ' ', NULL, NULL, NULL, 167, 169, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(165, 'DISCO DURO TOSHIBA 1000GB SATA  PC', 'DISCO1TB', ' ', '53.9728', '28.0', '69.09', '0', NULL, NULL, ' ', NULL, NULL, NULL, 168, 170, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(166, 'DISCO DURO TOSHIBA 1TB NOTEBOOK 5400RPM 2.5INC ', 'DIS1TBNOT', ' ', '60.648', '35.0', '81.87', '0', NULL, NULL, ' ', NULL, NULL, NULL, 169, 171, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(167, 'DISCO DURO TOSHIBA 2TB INTERNO SATA', 'DISTO2TB', ' ', '74.9504', '28.0', '95.94', '0', NULL, NULL, ' ', NULL, NULL, NULL, 170, 172, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(168, 'DISCO DURO TOSHIBA 500GB INTERNO', 'DISCO-TOSH-500GB', ' ', '50.6912', '30.0', '65.9', '0', NULL, NULL, ' ', NULL, NULL, NULL, 171, 173, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(169, 'DISCO DURO TOSHIBA 500GB NOTEBOOK', 'DISCTO', ' ', '47.88', '28.0', '61.29', '0', NULL, NULL, ' ', NULL, NULL, NULL, 172, 174, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(170, 'DISCO DURO TOSHIBA EXTERNO 2TB', 'DISEXTE21TBTOSHIBA', ' ', '119.871', '35.0', '161.83', '0', NULL, NULL, ' ', NULL, NULL, NULL, 173, 175, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(171, 'DISCO DURO WD 1TB BLUE 3.5 ', 'DW1TB', ' ', '59.4776', '35.0', '80.29', '0', NULL, NULL, ' ', NULL, NULL, NULL, 174, 176, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(172, 'DISCO DURO WD 2TB PURPLE', 'DISCOWD2TBPURPLE', ' ', '99.0528', '30.0', '128.77', '0', NULL, NULL, ' ', NULL, NULL, NULL, 175, 177, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(173, 'DISCO DURO WD 3TB PURPLE', 'DISWDPUR3TB', ' ', '132.54', '28.0', '169.65', '0', NULL, NULL, ' ', NULL, NULL, NULL, 176, 178, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(174, 'DISCO DURO WD BLACK 1TB', 'DISBL', ' ', '117.3744', '30.0', '152.59', '0', NULL, NULL, ' ', NULL, NULL, NULL, 177, 179, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(175, 'DISCO DURO WD NOTEBOOK 500GB SATA 5400RPM 2.5INC', 'DISNOT500', ' ', '53.4128', '35.0', '72.11', '0', NULL, NULL, ' ', NULL, NULL, NULL, 178, 180, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(176, 'DISCO DURO WD PURPLE 1TB', 'DISCOPURPLEWD1TB', ' ', '68.5216', '35.0', '92.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 179, 181, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(177, 'DISCO SOLIDO ADATA 256GB SSD', 'DISSO256', ' ', '134.6128', '28.0', '172.3', '0', NULL, NULL, ' ', NULL, NULL, NULL, 180, 182, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(178, 'DLINK N300 WIFI RANGE EXTENDER', 'N 300 WIFI', ' ', '27.0864', '45.0', '39.28', '0', NULL, NULL, ' ', NULL, NULL, NULL, 181, 183, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(179, 'DVD-RW INTERNO OPTICO DESKTOP', 'DVDRW', ' ', '15.0304', '75.0', '26.3', '0', NULL, NULL, ' ', NULL, NULL, NULL, 182, 184, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(180, 'DVD-WRITER LG EXTERNO ULTRA-SLIM USB', 'DVDLGEXT', ' ', '30.78', '55.0', '47.71', '0', NULL, NULL, ' ', NULL, NULL, NULL, 183, 185, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(181, 'DVR HIKVISION DS-7104HGI-F1/4CANALES/HDMI/VGA/HASTA6TB', 'DVR', ' ', '81.11', '35.0', '109.5', '-2', NULL, NULL, ' ', NULL, NULL, NULL, 184, 186, '-2', '-102', '8', NULL, NULL, NULL, NULL, NULL),
(182, 'DVR HIKVISION DS-7108HGHI-F1 TURBO HD/8CANAES/H.264/HDMI/VGA/2USB/HASTA 6TB', 'DVR8', ' ', '124.4544', '35.0', '168.01', '0', NULL, NULL, ' ', NULL, NULL, NULL, 185, 187, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(183, 'ENVIO MERCADERIA', 'ENVIO', ' ', '3.92', '28.0', '5.02', '0', NULL, NULL, ' ', NULL, NULL, NULL, 186, 188, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(184, 'ESET NOD 32 ESET FILE SECURITY  SERVER ', 'NOD32SERVER', ' ', '141.568', '28.0', '181.21', '-4', NULL, NULL, ' ', NULL, NULL, NULL, 187, 189, '-4', '-104', '6', NULL, NULL, NULL, NULL, NULL),
(185, 'ESTUCHE 13 PULGADAS', 'EST13', ' ', '4.0', '138.4', '9.54', '0', NULL, NULL, ' ', NULL, NULL, NULL, 188, 190, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(186, 'ESTUCHE 15 PULG', 'ESTUCHE15', ' ', '6.6406', '100.0', '13.28', '0', NULL, NULL, ' ', NULL, NULL, NULL, 189, 191, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(187, 'ESTUCHE 7 PUG', 'EST7', ' ', '7.0', '100.0', '14.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 190, 192, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(188, 'ESTUCHE DE 10 PULGADAS', 'EST10', ' ', '4.0', '127.2', '9.09', '0', NULL, NULL, ' ', NULL, NULL, NULL, 191, 193, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(189, 'ESTUCHE DE 11 PULGADAS', 'EST11', ' ', '4.0', '140.0', '9.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 192, 194, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(190, 'ESTUCHE DE 12 PULGADAS', 'EST12', ' ', '4.0', '133.6', '9.34', '0', NULL, NULL, ' ', NULL, NULL, NULL, 193, 195, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(191, 'ESTUCHE DE 14 PULG', 'EST14', ' ', '7.28', '100.0', '14.56', '0', NULL, NULL, ' ', NULL, NULL, NULL, 194, 196, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(192, 'ESTUCHE MAS TECLADO /TABLET 10PUL BLUETOOTH', 'ESTU10', ' ', '24.0', '100.0', '48.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 195, 197, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(193, 'ESTUCHE MAS TECLADO /TABLET 7PUL BLUETOOTH', 'ESTU7', ' ', '20.0', '100.0', '40.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 196, 198, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(194, 'ESTUCHE PARA PORTATIL 17 PULGADAS', 'EST17', ' ', '9.0', '75.0', '15.75', '0', NULL, NULL, ' ', NULL, NULL, NULL, 197, 199, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(195, 'ESTUCHE TIPO PORTAFOLIO 14 PULGADAS', 'PORTAFOLIO', ' ', '11.115', '75.0', '19.45', '0', NULL, NULL, ' ', NULL, NULL, NULL, 198, 200, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(196, 'EXTENSION USB 2.0 HEMBRA MACHO 10MTRS', 'EXT10', ' ', '10.83', '55.0', '16.79', '0', NULL, NULL, ' ', NULL, NULL, NULL, 199, 201, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(197, 'EXTENSION USB 2.0 HEMBRA MACHO DE 1.8MTRS', 'EXTUSB', ' ', '1.008', '200.0', '3.02', '0', NULL, NULL, ' ', NULL, NULL, NULL, 200, 202, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(198, 'EXTENSION USB POR RJ45', 'EXTRJ45', ' ', '11.45', '55.0', '17.75', '0', NULL, NULL, ' ', NULL, NULL, NULL, 201, 203, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(199, 'EXTENSOR DE SEÑAL HDMI CON CABLE UTP', 'EXTHDMI', ' ', '11.76', '75.0', '20.58', '0', NULL, NULL, ' ', NULL, NULL, NULL, 202, 204, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(200, 'EXTENSOR DE SEÑAL LBLINK 2.4MHZ', 'EXT', ' ', '26.9952', '28.0', '34.55', '0', NULL, NULL, ' ', NULL, NULL, NULL, 203, 205, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(201, 'EXTENSOR DE SEÑAL VGA CON RJ45 (HEMBRA)', 'EXTVGAMACH', ' ', '2.24', '200.0', '6.72', '0', NULL, NULL, ' ', NULL, NULL, NULL, 204, 206, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(202, 'EXTENSOR DE SEÑAL VGA CON RJ45 (MACHO)', 'VGARJ45', ' ', '2.24', '200.0', '6.72', '0', NULL, NULL, ' ', NULL, NULL, NULL, 205, 207, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(203, 'EXTENSOR SEÑAL USB LB-LINK BL-MP01', 'EXTLBLINK', ' ', '15.0', '28.0', '19.2', '0', NULL, NULL, ' ', NULL, NULL, NULL, 206, 208, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(204, 'FEUNTE DE PODER CAMAR HIKVISION 12V 1.25AMP ', 'FEUNT-POD-CAM', '7258066.0', '5.04', '58.73', '8.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 207, 209, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(205, 'FUENTE DE PODER GENERICA ATX-700W-P2 P/PC/GARANTIA 6 MESES', 'FUEN700W', ' ', '11.1067', '28.0', '14.22', '0', NULL, NULL, ' ', NULL, NULL, NULL, 208, 210, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(206, 'FUENTE DE PODER INS 800W', 'FUENINS', ' ', '10.304', '28.0', '13.19', '0', NULL, NULL, ' ', NULL, NULL, NULL, 209, 211, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(207, 'FUENTE DE PODER SLIM', 'FUENTMINI', ' ', '16.53', '28.0', '21.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 210, 212, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(208, 'FUENTE DE PODER SPEEDMIND 600W', 'FUENTEPODER', ' ', '13.4176', '87.0', '25.09', '0', NULL, NULL, ' ', NULL, NULL, NULL, 211, 213, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(209, 'GATEWAY GRANDSTREAM FXO 8 PUERTOS', 'GRAN-FX0', ' ', '208.4208', '28.0', '266.78', '0', NULL, NULL, ' ', NULL, NULL, NULL, 212, 214, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(210, 'GIGABYTE MAINBOARD H110M-H HDMI 1.4. D-SUB DUAL DDR4', 'MB GB H110M-H', ' ', '66.1656', '28.0', '84.69', '0', NULL, NULL, ' ', NULL, NULL, NULL, 213, 215, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(211, 'HUB 4 PUERTOS MUÑECO', 'HUBMUÑ', ' ', '2.2', '55.0', '3.41', '0', NULL, NULL, ' ', NULL, NULL, NULL, 214, 216, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(212, 'HUB COMBO 3 PUERTOS USB 2.0 MAS LECTOR', 'HUB', ' ', '6.669', '28.0', '8.54', '0', NULL, NULL, ' ', NULL, NULL, NULL, 215, 217, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(213, 'HUB IMEX USB 3.0', 'HUBIME', ' ', '8.0976', '28.0', '10.36', '0', NULL, NULL, ' ', NULL, NULL, NULL, 216, 218, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(214, 'HUB TIP REGLETA DE 4 PUERTOS', 'HUBREG4P', ' ', '1.9', '30.0', '2.47', '0', NULL, NULL, ' ', NULL, NULL, NULL, 217, 219, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(215, 'HUB TIP REGLETA DE 7 PUERTOS 2.0', 'HUBREG7', ' ', '5.5', '30.0', '7.15', '0', NULL, NULL, ' ', NULL, NULL, NULL, 218, 220, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(216, 'HUB USB 3.0 4 PUERTOS', 'HUB3.0', ' ', '13.965', '28.0', '17.88', '0', NULL, NULL, ' ', NULL, NULL, NULL, 219, 221, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(217, 'IM. ZEBRA GC420203DPI YHERMAL TRANSFER', 'ZEBGC420', ' ', '296.8', '28.0', '379.9', '0', NULL, NULL, ' ', NULL, NULL, NULL, 220, 222, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(218, 'IMPRESORA CANON E402 CON SISTEMA DE TINTA', 'E402', ' ', '65.0048', '28.0', '83.21', '0', NULL, NULL, ' ', NULL, NULL, NULL, 221, 223, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(219, 'IMPRESORA CANON G2100 CON SISTEMA DE TINTA CONTINUA', 'IMPCAN2100', ' ', '228.7068', '28.0', '292.74', '0', NULL, NULL, ' ', NULL, NULL, NULL, 222, 224, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(220, 'IMPRESORA CANON MG3100 CON SISTEMA DE TINTA', 'CANON3100', ' ', '233.128', '28.0', '298.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 223, 225, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(221, 'IMPRESORA DE CODIGOS DE BARRA TTSC TTP-G460 PRO', 'IMPRBARRA', ' ', '466.26', '28.0', '596.81', '0', NULL, NULL, ' ', NULL, NULL, NULL, 224, 226, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(222, 'IMPRESORA EPSON 475', '475.0', ' ', '300.0', '28.0', '384.0', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 225, 227, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(223, 'IMPRESORA EPSON L220', 'L220', ' ', '260.0', '28.0', '332.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 226, 228, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(224, 'IMPRESORA EPSON L375 WIFI 33PPM 15PPM', 'EPSONL375', ' ', '275.0', '28.0', '352.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 227, 229, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(225, 'IMPRESORA EPSON L380', 'L380', ' ', '209.555', '28.0', '268.23', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 228, 230, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(226, 'IMPRESORA EPSON L395 WIFI', 'L395', ' ', '240.8', '28.0', '308.22', '-4', NULL, NULL, ' ', NULL, NULL, NULL, 229, 231, '-4', '-104', '6', NULL, NULL, NULL, NULL, NULL),
(227, 'IMPRESORA EPSON MATRICIAL LX-350', 'LX350', ' ', '263.2', '28.0', '336.9', '0', NULL, NULL, ' ', NULL, NULL, NULL, 230, 232, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(228, 'IMPRESORA EPSON TM-U220PD-653 PARALELA', 'IMPEPTMU220P65', ' ', '173.04', '30.0', '224.95', '0', NULL, NULL, ' ', NULL, NULL, NULL, 231, 233, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(229, 'IMPRESORA EPSON USB TM-U220D-806 ', 'TMU806', 'C31C515806', '199.36', '28.0', '255.18', '0', NULL, NULL, ' ', NULL, NULL, NULL, 232, 234, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(230, 'IMPRESORA HONEYWELL TERMICA PARA ETIQUETAS CODIGOS DE BARRA', 'IMPHONEY', ' ', '260.1024', '28.0', '332.93', '0', NULL, NULL, ' ', NULL, NULL, NULL, 233, 235, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(231, 'IMPRESORA HP COLOR DESKJET GT 5820-22', 'HP-TINTA-CON', '7450444.0', '197.2208', '28.0', '252.44', '0', NULL, NULL, ' ', NULL, NULL, NULL, 234, 236, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(232, 'IMPRESORA LASSER HP MONOCROMATICA DUPLEX M402DNE', 'IMP-LAS-DUPL', ' ', '299.25', '28.0', '383.04', '0', NULL, NULL, ' ', NULL, NULL, NULL, 235, 237, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(233, 'IMPRESORA SAMSUNG MONOCROMATICA LASERJET SL-M2020W 20IPM D222S', 'M20220W', ' ', '89.656', '28.0', '114.76', '0', NULL, NULL, ' ', NULL, NULL, NULL, 236, 238, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(234, 'INSTALACION', '99.0', ' ', '40.32', '28.0', '51.61', '0', NULL, NULL, ' ', NULL, NULL, NULL, 237, 239, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(235, 'INTERNE CORPORATIVO A1 ', '7.0', ' ', '72.0', '28.0', '92.16', '0', NULL, NULL, 'CORPORATIVO A1 ', NULL, NULL, NULL, 238, 240, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(236, 'INTERNET CORPORATIVO 1/1 2.5MEGAS', 'CORP 1 1', ' ', '72.0', '28.0', '92.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 239, 241, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(237, 'INTERNET HOME GOLDEN', 'INT-HOME-3200', ' ', '32.1768', '28.0', '41.19', '0', NULL, NULL, ' ', NULL, NULL, NULL, 240, 242, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(238, 'INTERNET HOME PREMIUM', 'INT-HOME-2600', ' ', '24.1128', '28.0', '30.86', '0', NULL, NULL, ' ', NULL, NULL, NULL, 241, 243, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(239, 'INTERNET HOME STANDARD', 'INT-HOME-2200', ' ', '20.0808', '28.0', '25.7', '0', NULL, NULL, ' ', NULL, NULL, NULL, 242, 244, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(240, 'INTERNET PYME 2:1', '6.0', ' ', '56.448', '28.0', '72.25', '0', NULL, NULL, ' ', NULL, NULL, NULL, 243, 245, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(241, 'KID DE CAMARAS 8 CAMARAS ANERA/DVR/CABLE 20M/FUENTE/4 INTERNAS/4 EXTERNAS/ AHD 1.0 MP DVR ACH4CAM DOMO ', 'KIDCAM', ' ', '252.0', '28.0', '322.56', '0', NULL, NULL, ' ', NULL, NULL, NULL, 244, 246, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(242, 'LAMPARA PARA PC USB', 'LAMP', ' ', '1.2', '28.0', '1.54', '0', NULL, NULL, ' ', NULL, NULL, NULL, 245, 247, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(243, 'LAPTOP NEW LENOVO IDEAPAD 500-15IBD/INTEL CORE I5-5200U/2.20GHZ/5TA GEN/4GB/1TB/15.6\"/DVDRW/HDMI/WEBCAM/WINDOWS 10/TECLADO INGLES', 'LEN-IDE', ' ', '560.38', '28.0', '717.29', '0', NULL, NULL, ' ', NULL, NULL, NULL, 246, 248, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(244, 'LECTOR DE MEMORIA INTERNO', 'LECIN', ' ', '2.9568', '50.0', '4.44', '0', NULL, NULL, ' ', NULL, NULL, NULL, 247, 249, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(245, 'LECTOR DE MEMORIAS EXTERNO USB', 'LECTOR', ' ', '1.25', '28.0', '1.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 248, 250, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(246, 'LECTOR DE TARJETA BANDA MAGNETICA TRACK 1.2.3 UNITECH USB', 'LECTORMAG', ' ', '57.0', '28.0', '72.96', '0', NULL, NULL, ' ', NULL, NULL, NULL, 249, 251, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(247, 'LEXMARK FOTOCONDUCTOR 410/610/611 60000PAG', 'LEXMARK-FOTOCONDUCTOR', ' ', '57.1872', '33.0', '76.06', '0', NULL, NULL, ' ', NULL, NULL, NULL, 250, 252, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(248, 'LIMPIA PANTALLA ', 'LIMP', ' ', '3.0', '75.0', '5.25', '0', NULL, NULL, ' ', NULL, NULL, NULL, 251, 253, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(249, 'MAINBOARD ASUS H11OM-E DDR3 SOCK 1151', 'MAINASUSDDR3', ' ', '66.1656', '28.0', '84.69', '0', NULL, NULL, ' ', NULL, NULL, NULL, 252, 254, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(250, 'MAINBOARD BIOSTAR H110MH LGA1151 DDR4', 'MAINB1151', ' ', '57.456', '30.0', '74.69', '0', NULL, NULL, ' ', NULL, NULL, NULL, 253, 255, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(251, 'MAINBOARD BIOSTAR H110MHC LGA1151 I7 2XDDR4 DVI-D HDMI 3 USB3.0 4USB2.0 3PCI MATX', 'MB-BIOSTH110MHC', ' ', '55.4064', '30.0', '72.03', '0', NULL, NULL, ' ', NULL, NULL, NULL, 254, 256, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(252, 'MAINBOARD BIOSTARD H110MD LGA 1151 DDR3L', 'MBIO', ' ', '59.565', '30.0', '77.43', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 255, 257, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(253, 'MAINBOARD BIOSTARD H61 MHV 1155 ', 'MBH61', ' ', '64.4', '30.0', '83.72', '0', NULL, NULL, ' ', NULL, NULL, NULL, 256, 258, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(254, 'MAINBOARD BIOSTARD H81MLV3 LGA1150 DDR3', 'MB1150', ' ', '51.129', '30.0', '66.47', '0', NULL, NULL, ' ', NULL, NULL, NULL, 257, 259, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(255, 'MAINBOARD GIGABYTE DDR4 HDMI VGA PCIE X16 PCIE X1 SOCK 1151', 'MAINGYGA', ' ', '66.1696', '28.0', '84.7', '0', NULL, NULL, ' ', NULL, NULL, NULL, 258, 260, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(256, 'MAINBOARD GIGABYTE GA-B250M-DS3H INTEL LGA 1151 V-S-', 'MGB-B250MDS3H', ' ', '93.936', '28.0', '120.24', '0', NULL, NULL, ' ', NULL, NULL, NULL, 259, 261, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(257, 'MAINBOARD MAS CPU GIGABITE CEL 4TA GEN DDR3X2/HDMIN', 'MAINPROC', ' ', '56.4928', '28.0', '72.31', '0', NULL, NULL, ' ', NULL, NULL, NULL, 260, 262, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(258, 'MALETIN PARA NOTBOOK 13.3 PULG', 'MALETIN13.3PULG', ' ', '13.0032', '28.0', '16.64', '0', NULL, NULL, ' ', NULL, NULL, NULL, 261, 263, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(259, 'MALETIN ROJO 10-12 PULG', 'MALETINRED', ' ', '13.0032', '75.0', '22.76', '0', NULL, NULL, ' ', NULL, NULL, NULL, 262, 264, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(260, 'MALETN VERANO GRIS', 'MALETIN', ' ', '13.0032', '75.0', '22.76', '0', NULL, NULL, ' ', NULL, NULL, NULL, 263, 265, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(261, 'MEMORIA ADATA 2GB PC-1600 DDR3', 'MEM2GBDDR3', ' ', '19.152', '55.0', '29.69', '0', NULL, NULL, ' ', NULL, NULL, NULL, 264, 266, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(262, 'MEMORIA DIMM 8GB 1600MHZ DDR3 HYPER', 'MEM 8G KING DD3', ' ', '73.2678', '30.0', '95.25', '0', NULL, NULL, ' ', NULL, NULL, NULL, 265, 267, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(263, 'MEMORIA DIMM ADATA 4GB PC-2133 DDR4', 'MEMAD4GB', ' ', '38.3952', '30.0', '49.91', '0', NULL, NULL, ' ', NULL, NULL, NULL, 266, 268, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(264, 'MEMORIA DIMM DELL 16GB 2RX4 DDR4 RDIMM 2133MHZ', 'DIMMSERDELL', ' ', '316.92', '28.0', '405.66', '0', NULL, NULL, ' ', NULL, NULL, NULL, 267, 269, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(265, 'MEMORIA DIMM KINGTONG 4GB DDR3 PC-1600', 'ME4GBDDR3KIN', ' ', '39.76', '28.0', '50.89', '0', NULL, NULL, ' ', NULL, NULL, NULL, 268, 270, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(266, 'MEMORIA DIMM KINGTONG 8GB DDR3 PC-1600', 'DIM-DD3-8G', ' ', '66.348', '28.0', '84.93', '0', NULL, NULL, ' ', NULL, NULL, NULL, 269, 271, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(267, 'MEMORIA HP 4GB 2RX8 PC3-1060E 9 KIT', 'MEMHPSER', ' ', '125.44', '28.0', '160.56', '0', NULL, NULL, ' ', NULL, NULL, NULL, 270, 272, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(268, 'MEMORIA KINGTONG 4GB 2133MHZ DDR4', 'MEMDIMDDR4GB', ' ', '46.4', '28.0', '59.39', '0', NULL, NULL, ' ', NULL, NULL, NULL, 271, 273, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(269, 'MEMORIA KINGTONG 8GB DDR4', 'DDR4K8GB', ' ', '77.784', '28.0', '99.56', '0', NULL, NULL, ' ', NULL, NULL, NULL, 272, 274, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(270, 'MEMORIA MICRO ADATA 16GB CLAS 4', 'MEMICRO', ' ', '8.68', '49.77', '13.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 273, 275, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(271, 'MEMORIA MICRO ADATA 8GB CLASS 4', 'MICROADA8', ' ', '5.7587', '30.0', '7.49', '0', NULL, NULL, ' ', NULL, NULL, NULL, 274, 276, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `productos` (`Codigo`, `producto`, `codigoAlterno`, `codigoBarras`, `costo`, `utilidad`, `pvp`, `cantidad`, `unidades`, `ubicacion`, `observacion`, `minimo`, `maximo`, `garantia`, `Modelos_Codigo`, `Modelos_Marcas_Codigo`, `b1`, `b2`, `b3`, `b4`, `b5`, `b6`, `b7`, `b8`) VALUES
(272, 'MEMORIA MICRO KINGTON 8GB', 'MEM8GB', ' ', '4.6', '28.0', '5.89', '0', NULL, NULL, ' ', NULL, NULL, NULL, 275, 277, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(273, 'MEMORIA MICRO-SD ADATA 32GB', 'MICRO-SD32GBADATA', ' ', '15.9152', '44.47', '22.99', '0', NULL, NULL, ' ', NULL, NULL, NULL, 276, 278, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(274, 'MEMORIA RAM  4GB DDR4 SODIM ', 'MEMORIASODIMKINGSTOMDD4', ' ', '39.6592', '28.0', '50.76', '0', NULL, NULL, ' ', NULL, NULL, NULL, 277, 279, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(275, 'MEMORIA RAM DDR3 4GB ADATA', 'DDR3ADAPA', ' ', '39.0336', '28.0', '49.96', '0', NULL, NULL, ' ', NULL, NULL, NULL, 278, 280, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(276, 'MEMORIA SO-DIM KINGTONG 4GB 1600MHZ DDR3 ', 'DIMKINSD4GP2133', ' ', '39.5435', '28.0', '50.62', '0', NULL, NULL, ' ', NULL, NULL, NULL, 279, 281, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(277, 'MEMORIA SO-DIMM ADATA 4GB PC-2400 DDR4 PC4-19200', 'SO-DIMADATA4G', ' ', '1.14', '28.0', '1.46', '0', NULL, NULL, ' ', NULL, NULL, NULL, 280, 282, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(278, 'MICA PARA PANTALLA DE 14 PUG', 'MICA14', ' ', '2.05', '28.0', '2.62', '0', NULL, NULL, ' ', NULL, NULL, NULL, 281, 283, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(279, 'MICA PARA PANTALLA DE 15', 'MICA15', ' ', '2.05', '28.0', '2.62', '0', NULL, NULL, ' ', NULL, NULL, NULL, 282, 284, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(280, 'MINI PC GIGABYTE CELERON J3455 2XSO-DDR3/RED/VID/BT/4USB/1HDMI/VESA', 'SM10BRIXCEL4G1', ' ', '167.3056', '28.0', '214.15', '0', NULL, NULL, ' ', NULL, NULL, NULL, 283, 285, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(281, 'MOCHILA POLIESTER ROJA', 'MOCHILAPOLIESTERROJA', ' ', '12.32', '29.87', '16.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 284, 286, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(282, 'MOCHILA PORTATIL 15 PULGADAS', 'MOCHILA', ' ', '13.11', '28.0', '16.78', '0', NULL, NULL, ' ', NULL, NULL, NULL, 285, 287, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(283, 'MOCHILA XTRATECH GRIS-NARANJA HASTA 15.6 PULG', 'MOCHEXT', ' ', '28.4886', '28.0', '36.47', '0', NULL, NULL, ' ', NULL, NULL, NULL, 286, 288, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(284, 'MONITOR FLAT AOC 19.5 PULGADAS LED', 'FLAAOC19', ' ', '84.9072', '28.0', '108.68', '0', NULL, NULL, ' ', NULL, NULL, NULL, 287, 289, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(285, 'MONITOR FLAT AOC LED 16 PULG 1670SWU', 'MONAOC16', ' ', '69.16', '28.0', '88.52', '0', NULL, NULL, ' ', NULL, NULL, NULL, 288, 290, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(286, 'MONITOR FLAT LG 20 PUL LED 1600X900D HDMI AUDIO', 'MONLG20HDMI', ' ', '92.96', '28.0', '118.99', '0', NULL, NULL, ' ', NULL, NULL, NULL, 289, 291, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(287, 'MONITOR FLAT PANELVIEWSONIC 24P LED ', 'FLATVIEW24', ' ', '274.17', '28.0', '350.94', '0', NULL, NULL, ' ', NULL, NULL, NULL, 290, 292, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(288, 'MONITOR FLAT SAMSUNG 20 LS20D300NH LED BLACK', 'MONSA19', ' ', '114.8208', '28.0', '146.97', '0', NULL, NULL, ' ', NULL, NULL, NULL, 291, 293, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(289, 'MOUSE DELTA INALAMBRICO', 'DELTAM', ' ', '6.27', '28.0', '8.03', '0', NULL, NULL, ' ', NULL, NULL, NULL, 292, 294, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(290, 'MOUSE DELTA MINI', 'DELTAMINI', ' ', '3.0', '50.0', '4.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 293, 295, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(291, 'MOUSE GENIUS COLORES NX-700 INALAMBRICO', 'MOU-GE', ' ', '6.3616', '57.75', '10.04', '0', NULL, NULL, ' ', NULL, NULL, NULL, 294, 296, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(292, 'MOUSE GENIUS DX-110 USB', 'MOUGENDX110', ' ', '3.2592', '99.44', '6.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 295, 297, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(293, 'MOUSE GENIUS DX110 COLORES', 'DX110C', ' ', '3.192', '56.64', '5.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 296, 298, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(294, 'MOUSE GENIUS MICRO TRAVELER 900R INALAMBRICO', 'MOUS900R', ' ', '12.6403', '28.0', '16.18', '0', NULL, NULL, ' ', NULL, NULL, NULL, 297, 299, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(295, 'MOUSE GENIUS MICRO TRAVELER 900S INALAMBRICO', 'SCAN', ' ', '12.7452', '28.0', '16.31', '0', NULL, NULL, ' ', NULL, NULL, NULL, 298, 300, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(296, 'MOUSE GENIUS MICRO TRAVELER USB', 'MICROTRAVEL', ' ', '6.95', '28.0', '8.9', '0', NULL, NULL, ' ', NULL, NULL, NULL, 299, 301, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(297, 'MOUSE GENIUS NX7010 COLORES', '7000MG', ' ', '8.0864', '28.0', '10.35', '0', NULL, NULL, ' ', NULL, NULL, NULL, 300, 302, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(298, 'MOUSE INALAMBRICO SPEEDMAIN ', 'MOUSE INALAM-SPEEDMAIN', ' ', '5.0288', '28.0', '6.44', '0', NULL, NULL, ' ', NULL, NULL, NULL, 301, 303, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(299, 'MOUSE MINI OPTICO USB IS-MS103', 'MOUSE-MINI-INS', ' ', '3.0', '28.0', '3.84', '0', NULL, NULL, ' ', NULL, NULL, NULL, 302, 304, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(300, 'MOUSE PAD CON LOGO ', 'MOUSEPADLOGO', ' ', '2.0', '30.0', '2.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 303, 305, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(301, 'MOUSE PAD SIN LOGO CON APOYADERA ', 'MOUSEPAD', ' ', '1.4', '28.0', '1.79', '0', NULL, NULL, ' ', NULL, NULL, NULL, 304, 306, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(302, 'MOUSE USB INS FM-04', 'MOUSEINS', ' ', '3.0', '28.0', '3.84', '0', NULL, NULL, ' ', NULL, NULL, NULL, 305, 307, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(303, 'MOUSE USB INS IS-MS60', 'INSMOUSE', ' ', '3.0', '28.0', '3.84', '0', NULL, NULL, ' ', NULL, NULL, NULL, 306, 308, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(304, 'NOT. DELL INSPIRON 3467 I3-6006U 6GB 1TB 14INC. HDMI 3USB BT', 'DEL-INSP-CI36006U-6GB', ' ', '470.288', '15.0', '540.83', '0', NULL, NULL, ' ', NULL, NULL, NULL, 307, 309, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(305, 'NOT. HP 240 G5 INTEL N3060 4GB-SDRAM DDR3L 500GB 14\" DW HDMI FRDOS', 'NTP-HP 240 G5', ' ', '302.176', '20.0', '362.61', '0', NULL, NULL, ' ', NULL, NULL, NULL, 308, 310, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(306, 'NUC GIGABYTE CELERON 6TA GEN 4GB1T VGA HDMI MICRO SD', 'NUC-GI', ' ', '304.1634', '28.0', '389.33', '0', NULL, NULL, ' ', NULL, NULL, NULL, 309, 311, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(307, 'NUC INTEL I3-6100/DDR4/HDMI/4USB/LAN', 'NUCI3', ' ', '393.2768', '28.0', '503.39', '0', NULL, NULL, ' ', NULL, NULL, NULL, 310, 312, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(308, 'NUC INTEL I5-6260U NUC6I5SYH/SO-DIMM DDR4 2133', 'COPINTNUC6I5SYH', ' ', '588.24', '28.0', '752.95', '0', NULL, NULL, ' ', NULL, NULL, NULL, 311, 313, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(309, 'NUC SPEEDMIND BRIX CI5-6200 1TB 4GB HDMI USB3.0', 'SM10BRIX6CI54G1', ' ', '627.1368', '28.0', '802.74', '0', NULL, NULL, ' ', NULL, NULL, NULL, 312, 314, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(310, 'PACTCH CORD 7FT CAT 6', 'PATCHCAT67F', '7.8477133804E10', '3.6', '28.0', '4.61', '0', NULL, NULL, ' ', NULL, NULL, NULL, 313, 315, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(311, 'PALANCA DE JUEGOS GENIUSS G-08XU', 'PALANCA', ' ', '6.1', '28.0', '7.81', '0', NULL, NULL, ' ', NULL, NULL, NULL, 314, 316, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(312, 'PALANCA PARA PLAY II CON CABLE', 'PALAPLAY', ' ', '4.4', '50.0', '6.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 315, 317, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(313, 'PALANCA PARA PLAY II INALAMBRICA', 'PALAWIF', ' ', '9.0', '50.0', '13.5', '0', NULL, NULL, ' ', NULL, NULL, NULL, 316, 318, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(314, 'PALITO SELFIE BLUETHOO', 'SELF', ' ', '9.05', '28.0', '11.58', '0', NULL, NULL, ' ', NULL, NULL, NULL, 317, 319, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(315, 'PANTALLA 14 LED SLIM 40 PINES', 'PANLEDSLIM40P', ' ', '75.0006', '28.0', '96.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 318, 320, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(316, 'PANTALLA 14.0 SLIM 30 PINES DELL', 'PANSL30', ' ', '80.0', '28.0', '102.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 319, 321, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(317, 'PANTALLA 15.6 LED', 'PANT15LED', ' ', '74.9952', '28.0', '95.99', '0', NULL, NULL, ' ', NULL, NULL, NULL, 320, 322, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(318, 'PANTALLA LCD 14 PULG', 'PANTLCD', ' ', '77.0', '30.0', '100.1', '0', NULL, NULL, ' ', NULL, NULL, NULL, 321, 323, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(319, 'PANTALLA LED 14 PULG', 'PANT14LED', ' ', '75.0006', '28.0', '96.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 322, 324, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(320, 'PAPEL BOND 7GR COPY LASER', 'PAPEL', ' ', '2.6', '28.0', '3.33', '0', NULL, NULL, ' ', NULL, NULL, NULL, 323, 325, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(321, 'PARLANTE HAVIT 2.0 HV-SK467', 'PARLANTEHAVIT', ' ', '4.0069', '89.66', '7.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 324, 326, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(322, 'PARLANTE IS-ISK01 INS MULTIMEDIA ', 'PARLANTEINS', ' ', '4.0062', '141.38', '9.67', '0', NULL, NULL, ' ', NULL, NULL, NULL, 325, 327, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(323, 'PARLANTES GENIUS 370 WOOD', '370WOOD', ' ', '19.4208', '28.0', '24.86', '0', NULL, NULL, ' ', NULL, NULL, NULL, 326, 328, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(324, 'PARLANTES GENIUS SP-U115 USB', 'PARU115', '9.1163238461E10', '6.5184', '40.29', '9.14', '0', NULL, NULL, ' ', NULL, NULL, NULL, 327, 329, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(325, 'PARLANTES GENIUS SPHF160 USB NEGRO', 'SPHF160', ' ', '6.8096', '28.0', '8.72', '0', NULL, NULL, ' ', NULL, NULL, NULL, 328, 330, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(326, 'PARLANTES INALAMBRICOS/BLUETOTH  KLIP XTREME  PRIZM', 'PARKLIMINAL', '7.98302076853E11', '10.8192', '28.0', '13.85', '0', NULL, NULL, ' ', NULL, NULL, NULL, 329, 331, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(327, 'PARLANTES MUSIC MINI INS FM CON BLUETOOTH', 'PARMINI', ' ', '10.146', '28.0', '12.99', '0', NULL, NULL, ' ', NULL, NULL, NULL, 330, 332, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(328, 'PARLANTES OMEGA', 'PARLOMEGA', ' ', '3.5', '28.0', '4.48', '0', NULL, NULL, ' ', NULL, NULL, NULL, 331, 333, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(329, 'PARLANTES SP-A110 GENIUS', 'SPA-110', ' ', '7.55', '58.94', '12.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 332, 334, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(330, 'PASTA TERMICA 15G', 'PASTER', ' ', '2.85', '5.26', '3.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 333, 335, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(331, 'PATCH CORD 2METROS', 'PATCH2', ' ', '3.0', '28.0', '3.84', '0', NULL, NULL, ' ', NULL, NULL, NULL, 334, 336, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(332, 'PATCH CORD 3METROS', 'PATCH3', ' ', '4.0', '28.0', '5.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 335, 337, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(333, 'PEN DRIVE ADATA 16GB ', 'PEN16GB', ' ', '6.44', '100.0', '12.88', '0', NULL, NULL, ' ', NULL, NULL, NULL, 336, 338, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(334, 'PEN DRIVE ADATA 8GB', 'PEN DRIVE ADATA 8', ' ', '6.1283', '43.1', '8.77', '0', NULL, NULL, ' ', NULL, NULL, NULL, 337, 339, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(335, 'PEN DRIVE DIBUJO', 'DIBUJO', ' ', '7.0', '30.0', '9.1', '0', NULL, NULL, ' ', NULL, NULL, NULL, 338, 340, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(336, 'PEN DRIVE KINGSTON 16GB MINI USB', 'MEMORIA16', ' ', '8.1424', '28.0', '10.42', '0', NULL, NULL, ' ', NULL, NULL, NULL, 339, 341, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(337, 'PEN DRIVE KINGSTON 32GB 3.0', 'PEN DRIV 32', ' ', '14.392', '50.0', '21.59', '0', NULL, NULL, ' ', NULL, NULL, NULL, 340, 342, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(338, 'PEN DRIVE KINGSTON 8GB DATATRAVELER 100 G3', 'PEN8GBKING', ' ', '7.0224', '28.0', '8.99', '0', NULL, NULL, ' ', NULL, NULL, NULL, 341, 343, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(339, 'PEN DRIVE KINGTONG 64GB', 'PEN64', ' ', '25.18', '28.0', '32.23', '0', NULL, NULL, ' ', NULL, NULL, NULL, 342, 344, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(340, 'PONCHADORA INS UNIVERSAL ', 'PONCHA', ' ', '6.84', '28.0', '8.76', '0', NULL, NULL, ' ', NULL, NULL, NULL, 343, 345, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(341, 'PORTATIL ASUS  ROG  GL753VE,360 GRADOS , CORE I7-7700HQ,16GB RAM,1TB+128 SSD,4GB VIDEO NVIDIA,DVDW, 17.3” WIN 10', 'GL753VE', ' ', '1534.4', '25.0', '1918.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 344, 346, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(342, 'PORTATIL ASUS VIVO BOOK CORE I-72003.10GHZ 1TERA 8GB RA/ V 2GB DVD ER/ HDMI/ 14 PULG  ESPAÑOL  ', 'PORTATILASUSCOREI5', ' ', '760.48', '28.0', '973.41', '0', NULL, NULL, ' ', NULL, NULL, NULL, 345, 347, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(343, 'PORTATIL DELL INSPIRION 14 3458 INTEL I3 5005U 2.0GHZ 5TA/6GB/1TB/14PULG/CAM/HDMI/UBUNTU/TEC ESP/NEGRA', 'DELL3458', ' ', '499.88', '28.0', '639.85', '0', NULL, NULL, ' ', NULL, NULL, NULL, 346, 348, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(344, 'PORTATIL DELL INSPIRION 14 3459 6TA GEN/COREI5-6200U 2.3GHZ/6GB/1TB/HDMI/BLUETOOTH/NEGRA/UBUNTU/TECL ESP/8W2H8', 'DELL3459', ' ', '670.66', '28.0', '858.44', '0', NULL, NULL, ' ', NULL, NULL, NULL, 347, 349, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(345, 'PORTATIL DELL INSPIRION 15 5559A/COREI7-6500U/2.5GHZ/TURBO BOSST 3.10', 'PORTDELL5559', ' ', '999.52', '28.0', '1279.39', '0', NULL, NULL, ' ', NULL, NULL, NULL, 348, 350, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(346, 'PORTATIL HP 14-BS026LA I5-7200 8GB-SDRAM 1TB 14INC DW HDMI WC FREEDOS', '14BS', ' ', '587.4624', '28.0', '751.95', '0', NULL, NULL, ' ', NULL, NULL, NULL, 349, 351, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(347, 'PORTATIL HP 15-AY009DX/INTEL CORE I3-6100U/2.30GHZ/6TA GEN/6GB/1TB/WEBCAM/DVDRW/HDMI/15.6\"/', 'HP1515-AY009DX/INTEL CORE I3', ' ', '558.88', '28.0', '715.37', '0', NULL, NULL, ' ', NULL, NULL, NULL, 350, 352, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(348, 'PORTATIL HP NEW HP 15-AY177CL / INTEL CORE I5-7200U/2.50GHZ(HASTA 3.1HZ)/12GB/1TB/WEBCAM/DVDR/HDMI/15.6/WIN10/TECLADO INGLES/ROJA', 'AY177', ' ', '609.76', '28.0', '780.49', '0', NULL, NULL, ' ', NULL, NULL, NULL, 351, 353, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(349, 'PORTATIL NOT HP 245 E2-7110 4GB/DDR3L/500GB/14PULG/DW HDMI FRDOS', 'PORHPAMD', ' ', '295.8368', '28.0', '378.67', '0', NULL, NULL, ' ', NULL, NULL, NULL, 352, 354, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(350, 'PROCESADOR CORE I5-7400- 3.5GHZ - 6MB- 4 NUCLEOS', 'POCESI5', ' ', '209.0', '28.0', '267.52', '0', NULL, NULL, ' ', NULL, NULL, NULL, 353, 355, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(351, 'PROCESADOR CORE I7-6700 3.4GHZ 8MB', 'PROCCOREI7', ' ', '366.0', '28.0', '468.48', '0', NULL, NULL, ' ', NULL, NULL, NULL, 354, 356, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(352, 'PROCESADOR INTEL CORE I5-6400 2.7GHZ 6MB 6TAGEN', 'PROI56TA', ' ', '213.6041', '28.0', '273.41', '0', NULL, NULL, ' ', NULL, NULL, NULL, 355, 357, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(353, 'PROCESADOR INTEL I3-6100 6TA SK-1151', 'PRCI36TA', ' ', '135.3', '28.0', '173.18', '0', NULL, NULL, ' ', NULL, NULL, NULL, 356, 358, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(354, 'PROCESADOR INTEL I5 4TA GEN', 'I54TA', ' ', '206.0', '28.0', '263.68', '0', NULL, NULL, ' ', NULL, NULL, NULL, 357, 359, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(355, 'PROCESADOR INTEL PENTIUM DUAL G4400 3.3MHZ 2 NUC', 'PRODUAL6TA', ' ', '65.07', '28.0', '83.29', '0', NULL, NULL, ' ', NULL, NULL, NULL, 358, 360, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(356, 'PRODUCTOS VARIOS FACTURA ELECTRONICA', 'PRODVARIOS', ' ', '508.896', '28.0', '651.39', '0', NULL, NULL, ' ', NULL, NULL, NULL, 359, 361, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(357, 'PROTECTOR DE TECLADO PLASTICO', 'PRO', ' ', '1.232', '28.0', '1.58', '0', NULL, NULL, ' ', NULL, NULL, NULL, 360, 362, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(358, 'PUNTERO LASER ALTA POTENCIA ', 'PUNTEROLASER', ' ', '7.28', '150.0', '18.2', '0', NULL, NULL, ' ', NULL, NULL, NULL, 361, 363, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(359, 'RACK CERRADO DE PARED 6UR 335X540X500MM PUERTA VIDRIO', 'RAKCERR', ' ', '117.6', '28.0', '150.53', '0', NULL, NULL, ' ', NULL, NULL, NULL, 362, 364, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(360, 'RASPBERRY PI 3', 'RASPI3', ' ', '100.0', '28.0', '128.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 363, 365, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(361, 'REENBOLSO DE GASTOS', 'REP', ' ', '0.0', '0.0', '1.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 364, 366, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(362, 'REGLETA MULTITOMA 8 TOMAS 110VAC HORIZONTAL NEGRO', 'REGBEA', ' ', '29.12', '28.0', '37.27', '0', NULL, NULL, ' ', NULL, NULL, NULL, 365, 367, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(363, 'REGULADOR DE VOLTAJE CDP R2C-AVR1008 1000 VA', 'REGCDP', ' ', '10.9671', '28.0', '14.04', '0', NULL, NULL, ' ', NULL, NULL, NULL, 366, 368, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(364, 'REGULADOR DE VOLTAJE THOR 1200VA 6 TOMAS', 'REGTHOR', '4.710728122866E12', '12.1752', '28.0', '15.58', '0', NULL, NULL, ' ', NULL, NULL, NULL, 367, 369, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(365, 'REGULADOR TRIPP-ITE VR1208R 500W/8TOMAS/PROTC LINEA TELFONICA', 'REGTRIP', ' ', '22.23', '28.0', '28.45', '0', NULL, NULL, ' ', NULL, NULL, NULL, 368, 370, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(366, 'ROLLO ETIQUETAS PAPEL IMP ZEBRA 1.5X1IN DT Z-SELECT 4000D HEGH', 'PAPEL-LABEL', ' ', '5.4208', '28.0', '6.94', '0', NULL, NULL, ' ', NULL, NULL, NULL, 369, 371, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(367, 'ROUTER D-LINK 2 ANTENAS DIR-611 8002.11B-Q-N WIRELESS N300', 'DL08DIR615', ' ', '16.7309', '28.0', '21.42', '0', NULL, NULL, ' ', NULL, NULL, NULL, 370, 372, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(368, 'ROUTER D-LINK 3 ANTENAS DIR-809 750MBPS.5DBI DUAL BAND', 'DLDIR-809', ' ', '43.8256', '28.0', '56.1', '0', NULL, NULL, ' ', NULL, NULL, NULL, 371, 373, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(369, 'ROUTER MIKROTIK RB941-2ND-TC', 'RB941-2ND-TC', ' ', '31.36', '51.24', '47.43', '0', NULL, NULL, ' ', NULL, NULL, NULL, 372, 374, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(370, 'ROUTER MIKROTIK RB951UI-2HND', 'ROUMIK951', ' ', '93.48', '28.0', '119.65', '0', NULL, NULL, ' ', NULL, NULL, NULL, 373, 375, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(371, 'ROUTER NEXXT TRINITY 3G/4G PORTABLE WRLSS ARNPR3G5U1', 'ROUTER3G', ' ', '60.48', '28.0', '77.41', '0', NULL, NULL, ' ', NULL, NULL, NULL, 374, 376, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(372, 'ROUTER NEXXT TRINITY-3G/4G PORTABLE WRLS', 'ROUTRINITY', ' ', '60.48', '28.0', '77.41', '0', NULL, NULL, ' ', NULL, NULL, NULL, 375, 377, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(373, 'ROUTER RBSXT-5NDR2', 'RBSXT', ' ', '85.12', '28.0', '108.95', '0', NULL, NULL, ' ', NULL, NULL, NULL, 376, 378, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(374, 'ROUTER SXT-LITE 5 ', 'SXT-LITE5', ' ', '44.64', '28.0', '57.14', '0', NULL, NULL, 'SXT-5HND r2\r\nS/N 46AE0459356F/347', NULL, NULL, NULL, 377, 379, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(375, 'ROUTER TP-LINK 2ANT 4 PURTOS LANWR840N', 'ROUT2ANT', ' ', '16.1728', '80.0', '29.11', '0', NULL, NULL, ' ', NULL, NULL, NULL, 378, 380, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(376, 'ROUTER TPLINK 3ANTENAS WA901ND AP N 450MBPS 4 PUERTOS LAN POE', 'ROU3ANTTP', ' ', '37.62', '28.0', '48.15', '0', NULL, NULL, ' ', NULL, NULL, NULL, 379, 381, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(377, 'ROUTER WIFI TP-LINK WR720N 1 ANT 5DBI 2 PUERTOS', 'TP-LINK', ' ', '16.2019', '50.0', '24.3', '0', NULL, NULL, ' ', NULL, NULL, NULL, 380, 382, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(378, 'SANNER DE BARRA HONEYWELL MS-1250G2 VOYAGER D MANO LECTURA AUT O MANUAL', 'SACMANVOYAGER', ' ', '85.456', '28.0', '109.38', '0', NULL, NULL, ' ', NULL, NULL, NULL, 381, 383, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(379, 'SCANNER D MANO, IMAGER 1D, HD, INALÁMBRICO BLUETOOTH 100M CON LINEA D VISTA, LECTURA AUTÓMATICA Ó MANUAL, UPC/EAN/128/39/GS1/DATABAR', 'MK1202G2USB5', ' ', '333.76', '28.0', '427.21', '0', NULL, NULL, ' ', NULL, NULL, NULL, 382, 384, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(380, 'SCANNER DE BARRA (DE MANO)', 'SCAN-BARR', ' ', '70.56', '28.0', '90.32', '0', NULL, NULL, ' ', NULL, NULL, NULL, 383, 385, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(381, 'SCANNER METROLOGICS ORBIT MK-7120', 'SMEORMK', ' ', '225.12', '28.0', '288.15', '0', NULL, NULL, ' ', NULL, NULL, NULL, 384, 386, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(382, 'SERVER MINI TOWER EDGE DELL XEON E3-1220V5/8GB/2TB', 'SERTDELLMINI', ' ', '1256.85', '28.0', '1608.77', '0', NULL, NULL, ' ', NULL, NULL, NULL, 385, 387, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(383, 'SERVICIO TECNICO ', 'SERD', ' ', '0.01', '1.0', '0.01', '0', NULL, NULL, ' ', NULL, NULL, NULL, 386, 388, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(384, 'SERVICIO TECNICO REPARACION PORTATIL', 'SERREPP', ' ', '140.0', '28.0', '179.2', '-1', NULL, NULL, ' ', NULL, NULL, NULL, 387, 389, '-1', '-101', '9', NULL, NULL, NULL, NULL, NULL),
(385, 'SERVIDOR DELL POWEREDGE R230 INTEL XEON E3-1220V5 8GB 2TB BEZEL', 'SERDELLR230', ' ', '1614.35', '28.0', '2066.37', '0', NULL, NULL, ' ', NULL, NULL, NULL, 388, 390, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(386, 'SERVIDOR HP ML130 GEN9 E3-1220V5-MCA SVR/S-BUY', 'SERHPML130', ' ', '876.66', '28.0', '1122.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 389, 391, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(387, 'SKIN MICA DE PORATIL 3D', 'SKIN', ' ', '3.8418', '28.0', '4.92', '0', NULL, NULL, ' ', NULL, NULL, NULL, 390, 392, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(388, 'SOPORTE MANITO', 'MANITO', ' ', '3.2', '28.0', '4.1', '0', NULL, NULL, ' ', NULL, NULL, NULL, 391, 393, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(389, 'SOPORTE TECNICO ADMINISTRACION TICS', 'SOP-TEC', ' ', '1.0', '102.0', '1026.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 392, 394, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(390, 'SPLITER HDMI 4 VIAS 1080P 3D MICROTECH', 'SPLITERHDMI4VIAS', ' ', '33.9976', '28.0', '43.52', '0', NULL, NULL, ' ', NULL, NULL, NULL, 393, 395, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(391, 'SPLITER VGA 4 VIAS 1920X 1440 200MHZ META', 'SPLITERVGA', ' ', '12.9', '28.0', '16.51', '0', NULL, NULL, ' ', NULL, NULL, NULL, 394, 396, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(392, 'SWITCH 8-PORT 10/100 MBPS TPLINK', 'SWIT8TPL', ' ', '9.4528', '58.68', '15.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 395, 397, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(393, 'SWITCH D-LINK 8 PORT 10/100MBPS  ', 'DL08DES100BA', ' ', '10.864', '28.0', '13.91', '0', NULL, NULL, ' ', NULL, NULL, NULL, 396, 398, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(394, 'SWITCH NEXXT 8 PUERTOS 10/100', 'SWINEXT8P', '7.98302055452E11', '12.1866', '28.0', '15.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 397, 399, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(395, 'SWITCH TP-LINK 16 PUERTOS 10/100 MBPS ', 'SWITCH16PTP-LINK', ' ', '19.9136', '28.0', '25.49', '0', NULL, NULL, ' ', NULL, NULL, NULL, 398, 400, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(396, 'SWITCH TP-LINK SG1016/16PUERT/10/100/1000MBPS/RACK', 'SWIT10/100/1000', ' ', '65.6432', '28.0', '84.02', '0', NULL, NULL, ' ', NULL, NULL, NULL, 399, 401, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(397, 'SWITCH TP-LINK SG1024 24-PORT GIGABIT.EN RACK', 'SWT-TP-LINK GB24P', ' ', '93.88', '28.0', '120.17', '0', NULL, NULL, ' ', NULL, NULL, NULL, 400, 402, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(398, 'TABLET BABUUM 7 QUADCORE 4GB/1GB WIFI 2CAMARAS', 'TABBABUUM7', ' ', '52.9758', '28.0', '67.81', '0', NULL, NULL, ' ', NULL, NULL, NULL, 401, 403, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(399, 'TABLET XTRATECH INFANTIL 7 PULG', 'TAB-EX', ' ', '68.4', '28.0', '87.55', '0', NULL, NULL, ' ', NULL, NULL, NULL, 402, 404, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(400, 'TARJETA DE RED INALAMBRICA PCI', 'TARJINA', ' ', '14.0', '28.0', '17.92', '0', NULL, NULL, ' ', NULL, NULL, NULL, 403, 405, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(401, 'TARJETA DE RED PCI 10/100/1000', 'TARJPCI', ' ', '9.184', '28.0', '11.76', '0', NULL, NULL, ' ', NULL, NULL, NULL, 404, 406, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(402, 'TARJETA DE RED PCI EXPRESS LAN 10/100/1000MB', 'TARRED', ' ', '8.892', '28.0', '11.38', '0', NULL, NULL, ' ', NULL, NULL, NULL, 405, 407, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(403, 'TARJETA DE SONIDO PCI EXPRESS 4 ENTRADAS', 'TARJSOPCI', ' ', '16.688', '28.0', '21.36', '0', NULL, NULL, ' ', NULL, NULL, NULL, 406, 408, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(404, 'TARJETA DE SONIDO PCI GENIUS 5.1', 'TARAUDIG', ' ', '12.45', '28.0', '15.94', '0', NULL, NULL, ' ', NULL, NULL, NULL, 407, 409, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(405, 'TARJETA DE VIDEO 1GB PCI-E 2.0 ', 'TARVID1GB', ' ', '45.1098', '28.0', '57.74', '0', NULL, NULL, ' ', NULL, NULL, NULL, 408, 410, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(406, 'TARJETA DE VIDEO ASUS 210 1GB ', 'TARVIDASUS1GB', '6.10839354E10', '45.1091', '28.0', '57.74', '0', NULL, NULL, ' ', NULL, NULL, NULL, 409, 411, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(407, 'TARJETA DE VIDEO ASUS GT-710 2GB PCI EXP', 'TARASUS2GB', ' ', '54.7428', '28.0', '70.07', '0', NULL, NULL, ' ', NULL, NULL, NULL, 410, 412, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(408, 'TARJETA EXTERNA DE SONIDO USB 2 ENTRADAS 7.1 CANALES', 'TARSONI7.1', ' ', '3.8304', '28.0', '4.9', '0', NULL, NULL, ' ', NULL, NULL, NULL, 411, 413, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(409, 'TARJETA EXTERNA DE SONIDO USB 2 ENTRADAS 8.1 CANALES USB LARGO', 'SONIEXT8.1', ' ', '5.936', '28.0', '7.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 412, 414, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(410, 'TARJETA EXTERNA USB DE SONIDO 4 ENTRADAS', 'USBSONIDO', ' ', '4.144', '150.0', '10.36', '0', NULL, NULL, ' ', NULL, NULL, NULL, 413, 415, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(411, 'TARJETA PARALELO PCI', 'TARJPARA', ' ', '12.0', '28.0', '15.36', '0', NULL, NULL, ' ', NULL, NULL, NULL, 414, 416, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(412, 'TARJETA PCI A 2 PUERTOS SERIALES', 'TARJ2PCI', ' ', '7.9968', '30.0', '10.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 415, 417, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(413, 'TARJETA PCI EXPRESS A 2 PUERTOS SERIALES', 'TARPCESER', ' ', '14.448', '28.0', '18.49', '0', NULL, NULL, ' ', NULL, NULL, NULL, 416, 418, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(414, 'TARJETA USB PCI EXPRESS', 'TARJUSB', ' ', '12.32', '28.0', '15.77', '0', NULL, NULL, ' ', NULL, NULL, NULL, 417, 419, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(415, 'TECLADO ACER D255 ESP NEGRO', 'TECACERMIN', ' ', '27.9984', '28.0', '35.84', '0', NULL, NULL, ' ', NULL, NULL, NULL, 418, 420, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(416, 'TECLADO ACER MINI D255', 'TECLAMIN', ' ', '28.0', '30.0', '36.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 419, 421, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(417, 'TECLADO ACER V5', 'TEC-ACER', ' ', '29.0016', '28.0', '37.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 420, 422, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(418, 'TECLADO ASUS EEE PC 1201HA-B NEGRO SIN MARCO ESP', 'TEASUS', ' ', '36.48', '30.0', '47.42', '0', NULL, NULL, ' ', NULL, NULL, NULL, 421, 423, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(419, 'TECLADO BLUETHOOTH 3.0 ', 'TECLBLUE', ' ', '18.24', '28.0', '23.35', '0', NULL, NULL, ' ', NULL, NULL, NULL, 422, 424, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(420, 'TECLADO DE PORTATIL SAMSUNG MINI INGLES NEGRO', 'TECLADOSAMSUNG', ' ', '28.0', '60.71', '45.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 423, 425, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(421, 'TECLADO DELL /N4050 NEGRO ESPAÑOL', '1-300', ' ', '27.9984', '35.0', '37.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 424, 426, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(422, 'TECLADO DELL 15-R', 'TECLDELL', ' ', '30.0', '28.0', '38.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 425, 427, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(423, 'TECLADO DELL E6420 E5420 E6220 E6320 E6430 E6440', 'E6420', ' ', '51.88', '28.0', '66.41', '0', NULL, NULL, ' ', NULL, NULL, NULL, 426, 428, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(424, 'TECLADO DELL INSPIRION MINO 1090 NEGRO ESP', '1090.0', ' ', '36.48', '28.0', '46.69', '0', NULL, NULL, ' ', NULL, NULL, NULL, 427, 429, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(425, 'TECLADO FLEXIBLE DE SILICONA SIN NUMERICO', 'TECFEL', ' ', '6.1488', '28.0', '7.87', '0', NULL, NULL, ' ', NULL, NULL, NULL, 428, 430, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(426, 'TECLADO GENIUS 130 SLIMSTAR NEGRO', 'TECLADO130', ' ', '8.436', '28.0', '10.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 429, 431, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(427, 'TECLADO GENIUS KB-110X ', 'TECGEKB110', ' ', '6.2384', '59.15', '9.93', '0', NULL, NULL, ' ', NULL, NULL, NULL, 430, 432, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(428, 'TECLADO GENIUSS KB125 USB', 'TECLKB125', ' ', '7.0338', '28.0', '9.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 431, 433, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(429, 'TECLADO GENIUSS LUXEMATE 100 USB SP MINI', 'TECLUMI', '4.710268251422E12', '7.9296', '28.0', '10.15', '0', NULL, NULL, ' ', NULL, NULL, NULL, 432, 434, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(430, 'TECLADO HP 1000 ESP NEGRO', 'TEC1000', ' ', '28.9968', '28.0', '37.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 433, 435, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(431, 'TECLADO HP 14-D NEGRO ESP', 'THP', ' ', '31.9998', '28.0', '40.96', '0', NULL, NULL, ' ', NULL, NULL, NULL, 434, 436, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(432, 'TECLADO HP 15-E ESP', 'TECHP15', ' ', '29.0016', '28.0', '37.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 435, 437, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(433, 'TECLADO HP 4440S ESP NEGRO', 'TECL4440S', ' ', '30.0', '28.0', '38.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 436, 438, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(434, 'TECLADO HP 8440P', 'TECLHP8440P', ' ', '32.9952', '28.0', '42.23', '0', NULL, NULL, ' ', NULL, NULL, NULL, 437, 439, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(435, 'TECLADO HP CQ42 ESP', 'TECLHPC', ' ', '28.9968', '28.0', '37.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 438, 440, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(436, 'TECLADO HP DV4-3000/DM4-4000', 'TECLADV4', ' ', '28.9968', '30.0', '37.7', '0', NULL, NULL, ' ', NULL, NULL, NULL, 439, 441, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(437, 'TECLADO HP DV5-2000 NEGRO', 'DV5', ' ', '29.0', '28.0', '37.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 440, 442, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(438, 'TECLADO HP G42', 'TECG42', ' ', '28.5', '28.0', '36.48', '0', NULL, NULL, ' ', NULL, NULL, NULL, 441, 443, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(439, 'TECLADO MULTIMEDIA ARI', 'TECARI', ' ', '3.6', '28.0', '4.61', '0', NULL, NULL, ' ', NULL, NULL, NULL, 442, 444, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(440, 'TECLADO NUMERICO K-013', 'TECLADONUM', ' ', '5.7792', '28.0', '7.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 443, 445, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(441, 'TECLADO SAMSUNG NP102', 'NP102', ' ', '25.9952', '28.0', '33.27', '0', NULL, NULL, ' ', NULL, NULL, NULL, 444, 446, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(442, 'TECLADO SAMSUNG R540', 'TESAM', ' ', '29.0016', '28.0', '37.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 445, 447, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(443, 'TECLADO SONY VAIO VPC120AL VPCM12 VPC-M VPCM120', 'TECSONY', ' ', '42.75', '28.0', '54.72', '0', NULL, NULL, ' ', NULL, NULL, NULL, 446, 448, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(444, 'TECLADO TOSHIBA C45', 'TEC-TOSH', ' ', '35.0', '28.0', '44.8', '0', NULL, NULL, ' ', NULL, NULL, NULL, 447, 449, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(445, 'TECLADO TOSHIBA C850', 'C850', ' ', '30.0048', '30.0', '39.01', '0', NULL, NULL, ' ', NULL, NULL, NULL, 448, 450, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(446, 'TECLADO TOSHIBA L45-B WHITE ESP', 'L45-B', ' ', '31.0', '28.0', '39.68', '0', NULL, NULL, ' ', NULL, NULL, NULL, 449, 451, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(447, 'TECLADO TOSHIBA L50-B', 'L50-B', ' ', '30.0', '28.0', '38.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 450, 452, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(448, 'TELEFONO GRANDSTREAM GXP1610 HD IP VOIP 3 WAY', 'GRAN-IP', ' ', '37.6096', '28.0', '48.14', '0', NULL, NULL, ' ', NULL, NULL, NULL, 451, 453, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(449, 'TINTA CANON  BLACK GI190BK G1100/2100/3100/ 6000PAGS', 'TINTAC', ' ', '8.5272', '28.0', '10.91', '0', NULL, NULL, ' ', NULL, NULL, NULL, 452, 454, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(450, 'TINTA CANON  CYAN GI190C G1100/2100/3100/ 6000PAGS', 'TITNACC', ' ', '8.5272', '28.0', '10.91', '0', NULL, NULL, ' ', NULL, NULL, NULL, 453, 455, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(451, 'TINTA CANON  MAGENTA GI190M GI1100/2100/3100/ 7000PAGS', 'TINTACM', ' ', '8.5272', '28.0', '10.91', '0', NULL, NULL, ' ', NULL, NULL, NULL, 454, 456, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(452, 'TINTA CANON  YELLOW GI190Y GI1100/2100/3100/ 7000PAGS', 'TINTACY', ' ', '8.5272', '28.0', '10.91', '0', NULL, NULL, ' ', NULL, NULL, NULL, 455, 457, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(453, 'TINTA CANON CYAN LITRO PREMIUN INK', 'TINTCY', ' ', '9.5', '28.0', '12.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 456, 458, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(454, 'TINTA CANON MAGENTA LITRO PREMIUN INK', 'TINTCCL', ' ', '9.5', '28.0', '12.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 457, 459, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(455, 'TINTA CANON NEGRA LITRO PREMIUM INK', 'TINTALC', ' ', '9.5', '28.0', '12.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 458, 460, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(456, 'TINTA CANON YELOW LITRO PREMIUM INK', 'TINTCYL', ' ', '9.5', '28.0', '12.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 459, 461, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(457, 'TINTA EPSON CYAN LITRO PREMIUM INK', 'TINTEC', ' ', '9.5', '28.0', '12.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 460, 462, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(458, 'TINTA EPSON CYAN T664', 'T66CYAN', '1.0343885301E10', '8.6843', '28.0', '11.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 461, 463, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(459, 'TINTA EPSON MAGENTA LITRO PREMIUM INK', 'TINTEML', ' ', '9.5', '28.0', '12.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 462, 464, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(460, 'TINTA EPSON MAGENTA T66', 'T66MAGE', '1.0343885318E10', '8.6843', '28.0', '11.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 463, 465, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(461, 'TINTA EPSON NEGRA LITRO PREMIUM INK', 'TINTENL', ' ', '9.5', '28.0', '12.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 464, 466, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(462, 'TINTA EPSON NEGRA T66 120 ', 'T66N', ' ', '8.6625', '28.0', '11.09', '0', NULL, NULL, ' ', NULL, NULL, NULL, 465, 467, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(463, 'TINTA EPSON YELLOW T664', 'T66YE', '1.0343885325E10', '8.6843', '28.0', '11.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 466, 468, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(464, 'TINTA EPSON YELOW LITRO', 'TINTYLEP', ' ', '9.5', '28.0', '12.16', '0', NULL, NULL, ' ', NULL, NULL, NULL, 467, 469, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(465, 'TINTA PREMIUM 100ML', 'TINT100ML', ' ', '1.85', '30.0', '2.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 468, 470, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(466, 'TONNER HP 26X BLACK ', 'TONERHP', ' ', '217.1', '28.0', '277.89', '0', NULL, NULL, ' ', NULL, NULL, NULL, 469, 471, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(467, 'TONNER KONICA MINOLTA BLACK C35', 'TONER-MIN-N', ' ', '45.6', '28.0', '58.37', '0', NULL, NULL, ' ', NULL, NULL, NULL, 470, 472, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(468, 'TONNER KONICA MINOLTA CYAN C35', 'TON-CYAN', ' ', '79.8', '28.0', '102.14', '0', NULL, NULL, ' ', NULL, NULL, NULL, 471, 473, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(469, 'TONNER KONICA MINOLTA MAGENTA C35', 'TON-MAGEN', ' ', '79.8', '28.0', '102.14', '0', NULL, NULL, ' ', NULL, NULL, NULL, 472, 474, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(470, 'TONNER KONICA MINOLTA YELLOW C35', 'TON-YELL', ' ', '79.8', '28.0', '102.14', '0', NULL, NULL, ' ', NULL, NULL, NULL, 473, 475, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(471, 'TRIPP-LITE UPS OMNIVS1500 (1500VA) / 940 VATIOS (WATTS) / RESP. FULL', 'TL22OMNIVS1500', ' ', '201.8576', '28.0', '258.38', '0', NULL, NULL, ' ', NULL, NULL, NULL, 474, 476, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(472, 'TV BOX M-LOGIC ML95N MLOGIC S905X RAM-ROM 1GB-8GB  ', 'TVBOX', ' ', '45.6288', '28.0', '58.4', '0', NULL, NULL, ' ', NULL, NULL, NULL, 475, 477, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(473, 'UNION DVI2 4 MAS 5 MACHO A VGA HEMBRA', 'UNIONDVI', ' ', '1.824', '28.0', '2.33', '0', NULL, NULL, ' ', NULL, NULL, NULL, 476, 478, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(474, 'UNION HDMI', 'UNIONHDMI', ' ', '0.9856', '205.0', '3.01', '0', NULL, NULL, ' ', NULL, NULL, NULL, 477, 479, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(475, 'UNIONES USB', 'UNIONUSB', ' ', '0.448', '250.0', '1.57', '0', NULL, NULL, ' ', NULL, NULL, NULL, 478, 480, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(476, 'UPS CDP R-UPR 508', 'UPSCDP500', ' ', '34.9821', '28.0', '47.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 479, 481, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(477, 'UPS CDP R-UPR758 750VA 315W IN-OUT 120V 60HZ', 'UPS750', ' ', '38.024', '28.0', '48.67', '0', NULL, NULL, ' ', NULL, NULL, NULL, 480, 482, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(478, 'UPS FORZA NT511 500VA/250W/120V 6NEMA RJ11 4565HZ', 'UPSFORZ500', ' ', '36.5568', '28.0', '46.79', '0', NULL, NULL, ' ', NULL, NULL, NULL, 481, 483, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(479, 'UPS TRIPP LITE AVR 750U 750VA', 'UPSTRIP', ' ', '89.6154', '28.0', '114.71', '0', NULL, NULL, ' ', NULL, NULL, NULL, 482, 484, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(480, 'USB A RJ45', 'USBRJ45', ' ', '4.256', '375.0', '20.22', '0', NULL, NULL, ' ', NULL, NULL, NULL, 483, 485, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(481, 'VENTILADOR ARGON NOTBOOK', 'VENTDELTA', ' ', '6.8096', '28.0', '8.72', '0', NULL, NULL, ' ', NULL, NULL, NULL, 484, 486, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(482, 'VENTILADOR CQ42', 'VENTILADORCQ42', ' ', '18.0006', '28.0', '23.04', '0', NULL, NULL, ' ', NULL, NULL, NULL, 485, 487, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(483, 'VENTILADOR DOLASO G50', 'VENTDOLASO', ' ', '12.15', '28.0', '15.55', '0', NULL, NULL, ' ', NULL, NULL, NULL, 486, 488, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(484, 'VENTILADOR DOLASO LX-888', 'LX-888', ' ', '6.72', '28.0', '8.6', '0', NULL, NULL, ' ', NULL, NULL, NULL, 487, 489, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(485, 'VENTILADOR HP  CQ62 G62 Q72', 'VENHP', ' ', '22.4', '30.0', '29.12', '0', NULL, NULL, ' ', NULL, NULL, NULL, 488, 490, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(486, 'VENTILADOR PARA FUENTE DE PODER DE 4 PINES', 'VENTF', ' ', '1.68', '30.0', '2.18', '0', NULL, NULL, ' ', NULL, NULL, NULL, 489, 491, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(487, 'VENTILADOR PARA NOTBOOK DELTA', 'VENTILADORDELTA', ' ', '6.0', '28.33', '7.7', '0', NULL, NULL, ' ', NULL, NULL, NULL, 490, 492, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(488, 'VISAGRA SONY VAIO SVE', 'VISSONY', ' ', '15.0', '28.0', '19.2', '0', NULL, NULL, ' ', NULL, NULL, NULL, 491, 493, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(489, 'WEBCAM SPPEDMAIN 300K', 'WEBCAM-SPEDM', ' ', '7.28', '28.0', '9.32', '0', NULL, NULL, ' ', NULL, NULL, NULL, 492, 494, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(490, 'WINDOWS SERVER 2016OEM ESP ESSENTIAL 64 BITS/25USARIOS/INCLUYE CALS', 'WINSER2016', ' ', '514.08', '28.0', '658.02', '0', NULL, NULL, ' ', NULL, NULL, NULL, 493, 495, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(491, 'XXXXXXXXXX', '1.1111111111E10', ' ', '200.0', '20.0', '240.0', '0', NULL, NULL, ' ', NULL, NULL, NULL, 494, 496, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(492, 'Y HDMI A 2 HDMI', 'YHDMI2', ' ', '4.48', '28.0', '5.73', '0', NULL, NULL, ' ', NULL, NULL, NULL, 495, 497, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(493, 'Y VGA 1 A 2 VGA', 'YVGA', ' ', '2.8956', '80.0', '5.21', '0', NULL, NULL, ' ', NULL, NULL, NULL, 496, 498, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(494, 'AUDIFONO STEREO OMEGA GAMING ', 'AUDIOMEGA', ' ', '16.24', '28.0', '20.79', '0', NULL, NULL, ' ', NULL, NULL, NULL, 497, 499, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(495, 'MEMORIA DDR4 KINGTONG DE 4GB', 'MEMDDR4K', ' ', '39.444', '28.0', '50.49', '0', NULL, NULL, ' ', NULL, NULL, NULL, 498, 500, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(496, 'MEMORIA DIMM 8GB PC-2400 DDR4', 'MEMADA', ' ', '68.4', '28.0', '87.55', '0', NULL, NULL, ' ', NULL, NULL, NULL, 499, 501, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(497, 'SWTICH TPLINK 16 PUERTOS 10/100', 'SWTPLINH16P', ' ', '45.0072', '-7.84', '41.48', '0', NULL, NULL, ' ', NULL, NULL, NULL, 500, 502, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(498, 'TECLADO GENIUS SLIMSTAR 130', '130.0', ' ', '7.22', '28.0', '9.24', '0', NULL, NULL, ' ', NULL, NULL, NULL, 501, 503, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(509, 'PRUEBA1', 'USB1502', ' ', '5.4992', '35.0', '7.42', '0', NULL, NULL, ' ', NULL, NULL, NULL, 512, 514, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL),
(510, 'PRUEBA2', 'TP08WN821N3', ' ', '22.6632', '28.0', '29.01', '0', NULL, NULL, ' ', NULL, NULL, NULL, 513, 515, '0', '-100', '10', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proformas`
--

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
(29, '2017-10-16', '2017-10-16 05:17:23', '12.0', '38.10', '317.50', '0.00', '355.60', '35.6', 'PROFORMA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000118', 1, '2017-10-16 00:17:12'),
(30, '2017-10-18', '2017-10-18 13:45:33', '12.0', '28.74', '239.49', '0.00', '268.23', '58.67500000000001', 'PROFORMA', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000121', 1, '2017-10-18 08:45:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seriesfacturas`
--

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
(112, '001', '001', '0000120', 3),
(113, '001', '001', '0000121', 3),
(114, '001', '001', '0000122', 3),
(115, '001', '001', '0000123', 3),
(116, '001', '001', '0000124', 3),
(117, '001', '001', '0000125', 3),
(118, '001', '001', '0000126', 3),
(119, '001', '001', '0000127', 3),
(120, '001', '001', '0000128', 3),
(121, '001', '001', '0000129', 3),
(122, '001', '001', '0000130', 3),
(123, '001', '001', '0000131', 3),
(124, '001', '001', '0000132', 3),
(125, '001', '001', '0000133', 3),
(126, '001', '001', '0000134', 3),
(127, '001', '001', '0000135', 3),
(128, '001', '001', '0000136', 3),
(129, '001', '001', '0000137', 3),
(130, '001', '001', '0000138', 3),
(131, '001', '001', '0000139', 3),
(132, '001', '001', '0000138', 3),
(133, '001', '001', '0000140', 3),
(134, '001', '001', '0000141', 3),
(135, '001', '001', '0000142', 3),
(136, '001', '001', '0000143', 3),
(137, '001', '001', '0000144', 3),
(138, '001', '001', '0000145', 3),
(139, '001', '001', '0000146', 3),
(140, '001', '001', '0000147', 3),
(141, '001', '001', '0000148', 3),
(142, '001', '001', '0000149', 3),
(143, '001', '001', '0000150', 3),
(144, '001', '001', '0000151', 3),
(145, '001', '001', '0000151', 3),
(146, '001', '001', '0000151', 3),
(147, '001', '001', '0000152', 3),
(148, '001', '001', '0000153', 3),
(149, '001', '001', '0000154', 3),
(150, '001', '001', '0000155', 3),
(151, '001', '001', '0000156', 3),
(152, '001', '001', '0000157', 3),
(153, '001', '001', '0000158', 3),
(154, '001', '001', '0000159', 3),
(155, '001', '001', '0000160', 3),
(156, '001', '001', '0000161', 3),
(157, '001', '001', '0000162', 3),
(158, '001', '001', '0000163', 3),
(159, '001', '001', '0000164', 3),
(160, '001', '001', '0000165', 3),
(161, '001', '001', '0000166', 3),
(162, '001', '001', '0000167', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

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
(30, '2017-10-16', '2017-10-16 13:52:51', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000121', 1, '2017-10-16 08:52:37'),
(31, '2017-10-23', '2017-10-24 03:58:17', '12.0', '11.73', '97.77', '0.00', '109.50', '28.39', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000163', 1, '2017-10-23 22:57:16'),
(32, '2017-10-23', '2017-10-24 04:04:19', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000163', 1, '2017-10-23 23:04:01'),
(33, '2017-10-23', '2017-10-24 04:05:06', '12.0', '11.73', '97.77', '0.00', '109.50', '28.39', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000163', 1, '2017-10-23 23:04:01'),
(34, '2017-10-23', '2017-10-24 04:06:13', '12.0', '13.71', '114.29', '0.00', '128.00', '28.0', 'TICKET', '0.00', 2, 2, 'DESKTOP-OQEODUI', '0000163', 1, '2017-10-23 23:06:02');

--
-- Disparadores `tickets`
--
DELIMITER $$
CREATE TRIGGER `EliminarDetalleTicketAntesDeEliminarElTicket` BEFORE DELETE ON `tickets` FOR EACH ROW DELETE from detalleticket WHERE detalleticket.Ticket_Codigo = old.codigo
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuarios`
--

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
-- Indices de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  ADD PRIMARY KEY (`codigo`);

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
-- Indices de la tabla `cxc`
--
ALTER TABLE `cxc`
  ADD PRIMARY KEY (`codigo`);

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
-- Indices de la tabla `formaspagov`
--
ALTER TABLE `formaspagov`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_KARDEX_productos1_idx` (`productos_Codigo`);

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
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `fk_Pagos_facturas1_idx` (`facturas_codigo`),
  ADD KEY `fk_Pagos_formasPagoV1_idx` (`formasPagoV_codigo`);

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
  ADD UNIQUE KEY `producto` (`producto`),
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
-- AUTO_INCREMENT de la tabla `bodegas`
--
ALTER TABLE `bodegas`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `config_usuarios`
--
ALTER TABLE `config_usuarios`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cxc`
--
ALTER TABLE `cxc`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `datosempresa`
--
ALTER TABLE `datosempresa`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;
--
-- AUTO_INCREMENT de la tabla `detalleproforma`
--
ALTER TABLE `detalleproforma`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `detalleticket`
--
ALTER TABLE `detalleticket`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;
--
-- AUTO_INCREMENT de la tabla `formaspagov`
--
ALTER TABLE `formaspagov`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=516;
--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=514;
--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `codigo` int(200) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;
--
-- AUTO_INCREMENT de la tabla `proformas`
--
ALTER TABLE `proformas`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `seriesfacturas`
--
ALTER TABLE `seriesfacturas`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;
--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
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
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `fk_KARDEX_productos1` FOREIGN KEY (`productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `fk_Modelos_Marcas1` FOREIGN KEY (`Marcas_Codigo`) REFERENCES `marcas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_Pagos_facturas1` FOREIGN KEY (`facturas_codigo`) REFERENCES `facturas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pagos_formasPagoV1` FOREIGN KEY (`formasPagoV_codigo`) REFERENCES `formaspagov` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
