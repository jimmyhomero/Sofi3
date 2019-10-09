-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2017 a las 04:37:49
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
(1, '172239967', 'WEREW', '9999', '1111', '', 'JJJJJJJJJ', 'WER', 'SANTO DOMINGO', 'ACTIVO', 1, 1, 1, 'obsercvaciones');

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
(3, 'MONEDA', '$', 'Dolar', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `Codigo` int(100) NOT NULL,
  `Marca` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`Codigo`, `Marca`, `Descripcion`) VALUES
(5, 'hp', ''),
(6, 'DELL', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `Codigo` int(100) NOT NULL,
  `Modelo` varchar(75) DEFAULT NULL,
  `Descripcion` varchar(105) DEFAULT NULL,
  `Marcas_Codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`Codigo`, `Modelo`, `Descripcion`, `Marcas_Codigo`) VALUES
(1, 'all in one', NULL, 5),
(2, 'surface hp', NULL, 5),
(3, 'vostro', NULL, 6),
(4, 'alienware', NULL, 6);

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
  `costo` varchar(20) DEFAULT NULL,
  `utilidad` varchar(45) DEFAULT NULL,
  `pvp` varchar(45) DEFAULT NULL,
  `cantidad` int(100) DEFAULT NULL,
  `unidades` varchar(45) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `observacion` varchar(245) DEFAULT NULL,
  `minimo` varchar(45) DEFAULT NULL,
  `maximo` varchar(45) DEFAULT NULL,
  `garantia` varchar(45) DEFAULT NULL,
  `Modelos_Codigo` int(100) NOT NULL,
  `Modelos_Marcas_Codigo` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`Codigo`, `producto`, `codigoAlterno`, `codigoBarras`, `costo`, `utilidad`, `pvp`, `cantidad`, `unidades`, `ubicacion`, `observacion`, `minimo`, `maximo`, `garantia`, `Modelos_Codigo`, `Modelos_Marcas_Codigo`) VALUES
(2, 'IMPRESORA CANON', '', '', '189', '27.99999999999999', '241.92', 0, 'UNIDADES', ' ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- ', 3, 6),
(5, 'CARTUCHO 210 CANNON', '', '', '52', '28', '66,56', 0, 'UNIDADES', ' ,  , ', '', '', '', '-- AÑO -- 3-- MESES -- -- SEMANAS -- ', 4, 6),
(6, 'IMPRESORA TMU220', '', '', '150', '33', '192,00', 0, 'UNIDADES', ' ,  , ', '', '', '', '-- AÑO -- -- MESES -- -- SEMANAS -- ', 3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuarios`
--

CREATE TABLE `tipos_usuarios` (
  `codigo` int(100) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `Descripcion` varchar(95) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_usuarios`
--

INSERT INTO `tipos_usuarios` (`codigo`, `tipo`, `Descripcion`) VALUES
(1, 'ADMINISTRADOR', 'ADMINISTRADOR DE PLANTA'),
(2, 'VENTAS', 'VENDEOR D EPLANTA'),
(3, 'JEFE DE PLANTA', ''),
(4, 'JEFE DE SISTEMAS', 'JEFATURA DE SISTEMAS	'),
(8, 'MESERO', 'ATIENDE PLANTA A'),
(13, 'EXTERNOS', 'VENDEDORES EXTERNOS');

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
(1, '123', '213', '', '', '', '', '123123', '123', 'ACTIVO', 3),
(3, '1722239967', 'JIMMY CARRION', '3700917', '0992669329', 'homer_loading@hotmail.com', 'SANTO DOMINGO', 'ADMIN', 'ADMINN123', 'ACTIVO', 2),
(4, '123123132', 'QWEQE', '', '', '', '', 'RRWER', 'ERW', 'ACTIVO', 1);

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
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `config`
--
ALTER TABLE `config`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  MODIFY `Codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `codigo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

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
