-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2017 a las 19:17:08
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
(1, '1722239967', 'JIMMY CARRION', '09992669329', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(2, '9999999999', 'CONSUMIDOR FINAL', '99999999', '999999999', '', '', '', '', 'ACTIVO', 0, 0, 0, 'ee'),
(3, '1717148371', 'SHEICY QUINTANA', '', '0991781881', '', '', '', '', 'ACTIVO', 0, 0, 0, 'ee');

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
(2, 'UTILIDAD', '28', NULL, NULL, NULL, NULL, NULL),
(3, 'MONEDA', 'DOLAR', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallefactura`
--

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
(9, '30', 'ALMOADAS KL', '30.85714285714289', '25', '12.80', '288.00', 19, 1, NULL);

--
-- Disparadores `detallefactura`
--
DELIMITER $$
CREATE TRIGGER `UpdateInventario` AFTER INSERT ON `detallefactura` FOR EACH ROW UPDATE productos
     SET productos.cantidad = productos.cantidad - NEW.cantidad
   WHERE productos.codigo = NEW.Productos_Codigo
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateInventarioonDelte` AFTER DELETE ON `detallefactura` FOR EACH ROW UPDATE productos
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
  `Nombre` varchar(45) DEFAULT NULL,
  `Ubicacion` varchar(45) DEFAULT NULL,
  `Descipcion` varchar(245) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `responsable` varchar(145) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `Codigo` int(100) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `iva` varchar(10) DEFAULT NULL,
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
  `anulada` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`Codigo`, `fecha`, `hora`, `iva`, `subtotaI_con_iva`, `subtotal_sin_iva`, `total`, `utilidad`, `tipo_documento`, `descuento`, `Clientes_codigo`, `Usuarios_Codigo`, `Equipo`, `secuencia`, `anulada`) VALUES
(2, '2017-09-12', '2017-09-24 17:00:42', '12', '100', NULL, '112', '20', 'factura', '0', 1, 2, 'pc', NULL, 0),
(3, '2017-09-25', '2017-09-25 20:12:34', '12.0', '114.29', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 0),
(4, '2017-09-25', '2017-09-25 20:28:44', '12.0', '2228.57', '', '2496.00', '546.0', 'FACTURA', '', 3, 2, 'PC', '005-001-00000200', 0),
(5, '2017-09-25', '2017-09-25 20:30:13', '12.0', '251.43', '', '281.60', '61.6', 'FACTURA', '', 3, 2, 'PC', '005-001-00000200', 0),
(6, '2017-09-26', '2017-09-26 06:53:15', '12.0', '114.29', '', '128.00', '28.0', 'FACTURA', '', 1, 2, 'PC', '005-001-00000200', 1),
(7, '2017-09-26', '2017-09-27 03:44:58', '12.0', '114.29', '', '128.00', '28.0', 'FACTURA', '', 1, 2, 'PC', '005-001-00000200', 1),
(8, '2017-09-26', '2017-09-27 03:48:02', '12.0', '114.29', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(9, '2017-09-26', '2017-09-27 03:49:24', '12.0', '114.29', '', '128.00', '28.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(10, '2017-09-26', '2017-09-27 03:51:43', '12.0', '1474.29', '', '1651.20', '361.20000000000033', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(11, '2017-09-26', '2017-09-27 04:00:26', '12.0', '4245.71', '', '4755.20', '935.1999999999999', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(12, '2017-09-26', '2017-09-27 04:04:01', '12.0', '251.43', '', '281.60', '61.599999999999994', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(13, '2017-09-26', '2017-09-27 04:05:47', '12.0', '2078.86', '', '2328.32', '488.32', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(14, '2017-09-27', '2017-09-27 11:45:43', '12.0', '571.43', '', '640.00', '140.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(15, '2017-09-27', '2017-09-27 11:47:34', '12.0', '11.43', '', '12.80', '2.8000000000000007', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(16, '2017-09-27', '2017-09-27 11:50:51', '12.0', '1142.86', '', '1280.00', '280.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(17, '2017-09-27', '2017-09-27 11:51:57', '12.0', '1142.86', '', '1280.00', '280.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1),
(19, '2017-09-27', '2017-09-27 16:55:19', '12.0', '1742.86', '', '1952.00', '352.0', 'FACTURA', '', 2, 2, 'PC', '005-001-00000200', 1);

--
-- Disparadores `facturas`
--
DELIMITER $$
CREATE TRIGGER `EliminarFactura` BEFORE DELETE ON `facturas` FOR EACH ROW DELETE from detallefactura WHERE detallefactura.Factura_Codigo = old.codigo
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
(4, 'lenovoss', NULL);

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
(4, 'MP210', NULL, 2);

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
  `Modelos_Marcas_Codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Codigo`, `producto`, `codigoAlterno`, `codigoBarras`, `costo`, `utilidad`, `pvp`, `cantidad`, `unidades`, `ubicacion`, `observacion`, `minimo`, `maximo`, `garantia`, `Modelos_Codigo`, `Modelos_Marcas_Codigo`) VALUES
(1, 'ALMOADAS KL', '', '', '10', '28', '12.80', '50', 'UNIDADES', ' ,  ,  ,  ,  ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- -- AÑO -- -- MESES -- -- SEMANAS -- -- AÑO -- -- MESES -- -- SEMANAS -- ', 4, 2),
(2, 'DISCO DURO HGS', '', '', '100', '28', '128.00', '89', 'UNIDADES', ' ,  ,  ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- -- AÑO -- -- MESES -- -- SEMANAS -- ', 4, 2);

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
(2, '1722239967', 'JIMMY CARRION', '9999', '0992669329', '', 'SANTO DOMINGO', 'ADMIN', 'ADMIN', 'ACTIVO', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD PRIMARY KEY (`codigo`,`Factura_Codigo`),
  ADD KEY `fk_DetalleFactura_Factura1_idx` (`Factura_Codigo`),
  ADD KEY `fk_DetalleFactura_Productos1_idx` (`Productos_Codigo`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`Codigo`);

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
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `config`
--
ALTER TABLE `config`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
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
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallefactura`
--
ALTER TABLE `detallefactura`
  ADD CONSTRAINT `fk_DetalleFactura_Factura1` FOREIGN KEY (`Factura_Codigo`) REFERENCES `facturas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DetalleFactura_Productos1` FOREIGN KEY (`Productos_Codigo`) REFERENCES `productos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_Tipo_Usuario1` FOREIGN KEY (`Tipo_Usuario_codigo`) REFERENCES `tipos_usuarios` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
