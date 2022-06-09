-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2022 a las 21:54:18
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acompañantes`
--

CREATE TABLE `acompañantes` (
  `idAcompañante` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividadjuridica`
--

CREATE TABLE `actividadjuridica` (
  `idactividad` int(11) NOT NULL,
  `actividad` varchar(100) NOT NULL COMMENT 'actividad dedicada al entorno juridico',
  `descripcion` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Categorizador de las actividades de las entidades juridicas';

--
-- Volcado de datos para la tabla `actividadjuridica`
--

INSERT INTO `actividadjuridica` (`idactividad`, `actividad`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Construcción', 'Todas las empresas que se dediquen al ambito de la construccion y actividades a fines de esta', '2022-04-13 14:56:35', '2022-04-13 14:56:35'),
(2, 'Enseñanza', 'instituciones de estudios ', '2022-04-13 14:56:35', '2022-04-13 14:56:35'),
(3, 'Mercantil', 'Tiendas o negocios manofactureros en general', '2022-04-14 00:16:12', '2022-04-14 00:16:12'),
(4, 'ninguna', 'nada', '2022-04-19 03:33:24', '2022-04-19 03:33:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriahabitacion`
--

CREATE TABLE `categoriahabitacion` (
  `idcategoriaHab` int(11) NOT NULL,
  `img` varchar(300) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `capacidad` varchar(100) NOT NULL,
  `descricion` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoriahabitacion`
--

INSERT INTO `categoriahabitacion` (`idcategoriaHab`, `img`, `titulo`, `capacidad`, `descricion`, `created_at`, `updated_at`) VALUES
(1, 'https://cdn-icons-png.flaticon.com/512/2306/2306341.png', 'Habitaciones de lujo', 'Capacidad de 6 a 9 personas', 'Habitaciones de alta calidad y atención privilegiada, el usuario de esta habitación sera atendido con mucho amor ;)', '2022-04-16 01:45:45', '2022-04-16 01:45:45'),
(2, 'http://www.hotelarboldorado.com/images/it_service/si0.png', 'Habitaciones regulares', 'Capacidad de 3 a 6 personas', 'Habitaciones muy comodas y placenteras con tematicas deacuerdo a sus necesidades, los usuarios seran tratados con mucho cariño :)', '2022-04-16 01:45:45', '2022-04-16 01:45:45'),
(3, 'https://cdn-icons-png.flaticon.com/512/1691/1691604.png', 'Habitaciones normales', 'Capacidad de 1 a 3 personas', 'habitaciones deacuerdo a las necesidades de nuestros clientes, les daremos una calurosa bienvenda.. ps no hay aire acondicionado:(', '2022-04-16 01:45:45', '2022-04-16 01:45:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL COMMENT 'nombre de las ciudades registradas y asociadas con paises',
  `idPais` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='categorización de cuidades asociadas con paises';

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`idCiudad`, `nombre`, `idPais`, `created_at`, `updated_at`) VALUES
(1, 'Managua', 1, '2022-04-13 14:19:55', '2022-04-13 14:19:55'),
(2, 'San Jose', 2, '2022-04-13 14:19:55', '2022-04-13 14:19:55'),
(3, 'San Pedro Sula', 3, '2022-04-14 00:00:53', '2022-04-14 00:00:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidad`
--

CREATE TABLE `entidad` (
  `idEntidad` int(11) NOT NULL,
  `primerNombre` varchar(20) DEFAULT NULL,
  `segundoNombre` varchar(20) DEFAULT NULL,
  `primerApellido` varchar(20) DEFAULT NULL,
  `segundoApellido` varchar(20) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `celular` varchar(15) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `direccion` text NOT NULL,
  `identificacion` varchar(35) DEFAULT NULL,
  `tipoIdentificacion` varchar(50) DEFAULT NULL,
  `razonSocial` varchar(60) DEFAULT NULL,
  `siglas` varchar(10) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `codigoPostal` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `idPais` int(11) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `idActividad` int(11) DEFAULT NULL,
  `idTipoPersona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Personas registradas';

--
-- Volcado de datos para la tabla `entidad`
--

INSERT INTO `entidad` (`idEntidad`, `primerNombre`, `segundoNombre`, `primerApellido`, `segundoApellido`, `fechaNacimiento`, `genero`, `telefono`, `celular`, `correo`, `direccion`, `identificacion`, `tipoIdentificacion`, `razonSocial`, `siglas`, `ruc`, `codigoPostal`, `created_at`, `updated_at`, `idPais`, `idCiudad`, `idActividad`, `idTipoPersona`) VALUES
(1, 'Juan', 'Diego', 'Rodriguez', 'Diaz', '2022-04-08', 'M', '3434545454', '', 'juan@gmail.com', 'racachaca', '344546566767hhh', 'Cedula', NULL, NULL, NULL, NULL, '2022-04-13 14:59:14', '2022-04-13 14:59:14', 1, 1, NULL, 1),
(2, NULL, NULL, NULL, NULL, NULL, NULL, '45465656', '3434343444', 'ferreteria@gmail.com', 'recachaca55', NULL, NULL, 'ferreterosSA', 'ferc', '3322', '10011', '2022-04-13 14:59:14', '2022-05-02 19:04:17', 2, 2, 1, 2),
(3, 'Mattwe', 'Comelon', 'Rodriguez', 'Martinez', '2000-04-08', 'M', '3434545454', '', 'mattwe@gmail.com', 'racachaca3', '344546566767uuu', 'Cedula', NULL, NULL, NULL, NULL, '2022-04-14 14:56:44', '2022-04-14 14:57:34', 1, 1, NULL, 1),
(4, 'NULL', 'NULL', 'NULL', 'NULL', '0000-00-00', 'N', '232323', '34343434', 'domingo@gmail.com', 'Racachaca34', 'NULL', 'NULL', 'DomingoSA', 'dom', '23232', '1222', '2022-04-19 00:08:07', '2022-04-19 00:08:07', 1, 1, 1, 2),
(5, 'NULL', 'NULL', 'NULL', 'NULL', '0000-00-00', 'N', '34343434', '222323223', 'sinsa@gmail.com', 'racachaca1212', 'NULL', 'NULL', 'SINSA', 'sinsa', '22222', '11100', '2022-04-19 00:22:17', '2022-04-19 00:22:17', 1, 1, 1, 2),
(6, 'Bruno', 'Aramis', 'Ramirez', 'Melendez', '2020-02-11', 'M', '3242345588', '43534543543', 'bruno@gmail.com', 'racachaca', '3423432234B', 'Cedula', NULL, NULL, NULL, '11001', '2022-04-19 01:48:05', '2022-05-02 19:02:29', 1, 1, NULL, 1),
(7, NULL, NULL, NULL, NULL, NULL, NULL, '332423432', '54532323', 'martinez@gmail.com', 'racachaca1', NULL, NULL, 'martinezSa', 'mart', '232323', '23232', '2022-04-19 01:49:41', '2022-04-19 01:49:41', 1, 1, 1, 2),
(8, NULL, NULL, NULL, NULL, NULL, NULL, '2432332432', '34343434', 'comth@gmail.com', 'racachacac', NULL, NULL, 'comtech', 'ccom', '23232', '11111', '2022-04-19 03:22:52', '2022-04-19 03:22:52', 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamiento`
--

CREATE TABLE `equipamiento` (
  `idequipamiento` int(11) NOT NULL,
  `mesas` int(11) NOT NULL,
  `camas` int(11) NOT NULL,
  `televisores` int(11) NOT NULL,
  `sofas` int(11) NOT NULL,
  `neveras` double NOT NULL,
  `baños` int(11) NOT NULL,
  `aireacondicionado` double NOT NULL,
  `internet` double NOT NULL,
  `ropero` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipamiento`
--

INSERT INTO `equipamiento` (`idequipamiento`, `mesas`, `camas`, `televisores`, `sofas`, `neveras`, `baños`, `aireacondicionado`, `internet`, `ropero`, `created_at`, `updated_at`) VALUES
(1, 4, 9, 4, 3, 1, 6, 1, 1, 6, '2022-04-16 08:55:14', '2022-04-16 08:41:48'),
(2, 5, 4, 2, 3, 1, 4, 1, 1, 2, '2022-04-16 08:55:14', '2022-04-16 08:55:14'),
(3, 3, 2, 1, 2, 1, 2, 1, 1, 2, '2022-04-16 08:57:21', '2022-04-16 08:57:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idmetodopago` int(11) NOT NULL,
  `idreserva` int(11) DEFAULT NULL,
  `idservicio` int(11) DEFAULT NULL,
  `iva` float NOT NULL,
  `pago` float NOT NULL,
  `descuento` float NOT NULL,
  `totalpago` float NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `idusuario`, `idmetodopago`, `idreserva`, `idservicio`, `iva`, `pago`, `descuento`, `totalpago`, `created_at`, `updated_at`) VALUES
(1, 6, 2, 1, NULL, 0.15, 500, 0, 575, '2022-04-25 04:38:51', '2022-04-25 04:38:51'),
(2, 6, 2, NULL, 1, 0.15, 300, 0, 575, '2022-04-25 16:17:44', '2022-04-25 16:17:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones`
--

CREATE TABLE `habitaciones` (
  `idhabitacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `img` varchar(300) NOT NULL,
  `precio` int(11) NOT NULL,
  `idequipamiento` int(11) NOT NULL,
  `idcategoriaHab` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `habitaciones`
--

INSERT INTO `habitaciones` (`idhabitacion`, `nombre`, `estado`, `descripcion`, `img`, `precio`, `idequipamiento`, `idcategoriaHab`, `created_at`, `updated_at`) VALUES
(2, 'Marbella', 'Desocupado', 'linda habitacion de lujo con mira hacia el restaurante', 'https://cdn.shopify.com/s/files/1/2098/0315/files/estilos-decoracion-habitaciones-principales.jpg?v=1620156325', 500, 1, 1, '2022-04-16 10:15:42', '2022-04-16 10:15:42'),
(3, 'Guarda pastora', 'Desocupado', 'linda habitacion con vista hacia la salida del hotel', 'https://cdn.shopify.com/s/files/1/2098/0315/files/Estilo-contemporaneo.jpg?v=1620156417', 300, 2, 2, '2022-04-16 10:15:43', '2022-04-16 10:15:43'),
(4, 'Guarda mais', 'Desocupado', 'linda habitacion con vista hacia la carretera', 'https://cdn.shopify.com/s/files/1/2098/0315/files/Estilo-industrial.jpg?v=1620156472', 150, 3, 3, '2022-04-16 08:59:43', '2022-04-16 08:59:43'),
(5, 'Guarda mais2', 'Ocupado', 'linda habitacion con vista hacia la carretera', 'https://cdn.shopify.com/s/files/1/2098/0315/files/Estilo-industrial.jpg?v=1620156472', 500, 1, 1, '2022-04-16 09:00:48', '2022-04-16 09:00:48'),
(6, 'Guarda mais3', 'Desocupado', 'linda habitacion con vista hacia la carretera', 'https://cdn.shopify.com/s/files/1/2098/0315/files/Estilo-industrial.jpg?v=1620156472', 300, 2, 2, '2022-04-16 09:01:02', '2022-04-16 09:01:02'),
(7, 'Guarda mais4', 'Desocupado', 'linda habitacion con vista hacia la carretera', 'https://cdn.shopify.com/s/files/1/2098/0315/files/Estilo-industrial.jpg?v=1620156472', 150, 3, 3, '2022-04-16 09:01:16', '2022-04-16 09:01:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `idmetodo` int(11) NOT NULL,
  `nombreTarjeta` varchar(200) NOT NULL,
  `numeroTarjeta` varchar(16) NOT NULL,
  `fechaVence` date NOT NULL,
  `cvc` int(11) NOT NULL,
  `tipoTarjeta` varchar(80) NOT NULL,
  `idusuarios` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `metodopago`
--

INSERT INTO `metodopago` (`idmetodo`, `nombreTarjeta`, `numeroTarjeta`, `fechaVence`, `cvc`, `tipoTarjeta`, `idusuarios`, `created_at`, `updated_at`) VALUES
(2, 'Bruno Ramirez', '1234567890123456', '2024-04-05', 666, 'Visa', 6, '2022-04-25 03:58:49', '2022-04-25 03:58:49'),
(3, 'Carlos Martinez', '1234567890123499', '2026-08-09', 393, 'Visa', 2, '2022-04-25 02:07:33', '2022-04-25 02:07:33'),
(4, 'Andua Lezama', '41111111111111', '2025-03-23', 202, 'Visa', 2, '2022-05-01 03:27:42', '2022-05-01 03:27:42'),
(5, 'Mattwe gay', '41111111111', '2025-02-23', 292, 'Visa', 2, '2022-05-01 03:46:51', '2022-05-01 03:46:51'),
(6, 'Fernando COchon', '411111111111', '2026-05-03', 222, 'Visa', 6, '2022-05-10 19:51:41', '2022-05-10 19:51:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idPais` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL COMMENT 'Nombre de los paises registrados',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idPais`, `Nombre`, `created_at`, `updated_at`) VALUES
(1, 'Nicaragua', '2022-04-13 14:14:40', '2022-04-13 14:14:40'),
(2, 'Costa Rica', '2022-04-13 14:14:40', '2022-04-13 14:14:40'),
(3, 'Honduras', '2022-04-13 21:51:52', '2022-04-13 21:51:52'),
(4, 'Inglaterra', '2022-04-13 22:01:14', '2022-04-13 22:18:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `fechaEntrada` date NOT NULL,
  `fechaSalida` date NOT NULL,
  `estado` double NOT NULL,
  `cantPersonas` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `idservicio` int(11) DEFAULT NULL,
  `idhabitacion` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idcategoriaHab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`idreserva`, `fechaEntrada`, `fechaSalida`, `estado`, `cantPersonas`, `created_at`, `updated_at`, `idservicio`, `idhabitacion`, `idusuario`, `idcategoriaHab`) VALUES
(1, '2022-04-06', '2022-04-08', 1, 2, '2022-04-25 02:37:40', '2022-04-25 02:37:40', 1, 2, 6, 1),
(2, '2022-04-06', '2022-04-14', 1, 3, '2022-05-01 03:27:48', '2022-05-01 03:27:48', 2, 3, 2, 2),
(3, '2022-04-06', '2022-04-14', 1, 2, '2022-05-01 03:46:53', '2022-05-01 03:46:53', 1, 3, 2, 2),
(4, '2022-05-10', '2022-05-12', 1, 3, '2022-05-10 19:51:46', '2022-05-10 19:51:46', 1, 2, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrRol` int(11) NOT NULL,
  `nombreRol` varchar(20) NOT NULL,
  `estado` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='listado de todos los roles de la pagina';

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrRol`, `nombreRol`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'admin', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'diseñador', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Recepcion', 0, '2022-04-14 01:01:47', '2022-04-14 01:06:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `idservicio` int(11) NOT NULL,
  `servicio` varchar(70) NOT NULL,
  `precio` int(11) NOT NULL,
  `img` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`idservicio`, `servicio`, `precio`, `img`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Piscina', 30, 'https://www.palafoxhoteles.com/sites/default/files/styles/big/public/piscina_hotel_palafox_0.jpg?itok=tC26oSJG', 'Pisina recreativa para adultos y niños', '2022-04-16 16:27:01', '2022-04-16 16:27:01'),
(2, 'Servicio de habitación', 30, 'https://www.expreso.info/files/2020-05/Vincci_Roomstaurant.jpg', 'Servicios de limpieza, y mantenimiento', '2022-04-16 16:27:53', '2022-04-16 16:27:53'),
(3, 'Servicio de gimnasio', 30, 'https://monchitime.com/www/wp-content/uploads/2015/02/Hilton-Caribe-hotel-Fitness-Center-OK.jpg', 'Gimnacio para amates del deporte', '2022-04-16 16:28:32', '2022-04-16 16:28:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopersona`
--

CREATE TABLE `tipopersona` (
  `idTipoPersona` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL COMMENT 'Nombre de tipo de entidad',
  `descripcion` text NOT NULL COMMENT 'breve descripcion de la entidad',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Categoriza la entidad registrada';

--
-- Volcado de datos para la tabla `tipopersona`
--

INSERT INTO `tipopersona` (`idTipoPersona`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Natural', 'Personas exisitentes', '2022-04-13 15:09:16', '2022-04-13 15:09:16'),
(2, 'Juridico', 'Entidades como empresas o negocios o instituciones', '2022-04-13 15:09:16', '2022-04-13 15:09:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(250) NOT NULL,
  `estado` double NOT NULL,
  `trabajador` tinyint(1) DEFAULT NULL,
  `idEntidad` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombre`, `email`, `password`, `estado`, `trabajador`, `idEntidad`, `created_at`, `updated_at`) VALUES
(1, 'juancito', 'juan@gmail.com', '$2b$10$C5HnELJFL1/oJoVkjUJsmu9AK7Fir5ykyhdnldEFzHW5hwGqqJpsW', 1, 0, 1, '0000-00-00 00:00:00', '2022-04-16 04:59:35'),
(2, 'ferreteros', 'ferreteria@gmail.com', '$2b$10$epflI3GLexnfKNxPHwkd9efflhSTHKildo2qMhOJfVKWMQ/8Rw.um', 1, 1, 1, '2022-04-14 01:35:52', '2022-05-02 19:04:31'),
(3, 'juanchoXD', 'juan23@gmail.com', '$2b$10$DTMNTMkDc9ont63W31JJ1.GYsJ1aETq5QeCFVZpuKNIqfHnqnu/K.', 1, 0, 1, '2022-04-14 04:58:41', '2022-04-14 05:19:38'),
(4, 'DomingoSA', 'domingo@gmail.com', '$2b$10$AY5KJunSxXv2i.n44icANe1LAPNQBtu9Dk.FY6OfL1odTkB3aRy1m', 1, 0, 4, '2022-04-19 00:08:07', '2022-04-19 00:08:07'),
(5, 'SINSA', 'sinsa@gmail.com', '$2b$10$1WzDs964JMzyHzEqpWL/XeUkL0T327.KnBhkQmSd9fcD2waLOPNHS', 1, 0, 5, '2022-04-19 00:22:18', '2022-04-19 00:22:18'),
(6, 'Bruno Ramirez', 'bruno@gmail.com', '$2b$10$oieRCWUq6RizcRnXwFXYwermZS6YttP8kkyKBQ5kTGKRRjrkturhy', 1, 1, 6, '2022-04-19 01:48:05', '2022-05-02 19:02:19'),
(7, 'martinezSa', 'martinez@gmail.com', '$2b$10$Nl8nL.gcmHVxRXzJoR9dHe3acPnPoFX3hDF1cYMXDNhFY9TwpEbb.', 1, 0, 7, '2022-04-19 01:49:41', '2022-04-19 01:49:41'),
(8, 'comtech', 'comtech@gmail.com', '$2b$10$QYbUnoZ41bf5wN1YFXzJU.apdU2nsdPlpZ1yMWP/c//DuXF3aXmF6', 1, 0, 8, '2022-04-19 03:22:52', '2022-04-19 03:22:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariorol`
--

CREATE TABLE `usuariorol` (
  `idUsuarioRol` int(11) NOT NULL,
  `estado` double NOT NULL,
  `trabajador` double NOT NULL,
  `cliente` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `idRol` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuariorol`
--

INSERT INTO `usuariorol` (`idUsuarioRol`, `estado`, `trabajador`, `cliente`, `created_at`, `updated_at`, `idRol`, `idUsuario`) VALUES
(1, 1, 1, 1, '2022-04-13 21:04:37', '2022-04-14 02:04:04', 2, 1),
(2, 1, 1, 1, '2022-04-14 02:05:59', '2022-04-14 02:05:59', 1, 6);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acompañantes`
--
ALTER TABLE `acompañantes`
  ADD PRIMARY KEY (`idAcompañante`);

--
-- Indices de la tabla `actividadjuridica`
--
ALTER TABLE `actividadjuridica`
  ADD PRIMARY KEY (`idactividad`);

--
-- Indices de la tabla `categoriahabitacion`
--
ALTER TABLE `categoriahabitacion`
  ADD PRIMARY KEY (`idcategoriaHab`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idCiudad`),
  ADD KEY `idPais` (`idPais`),
  ADD KEY `idPais_2` (`idPais`);

--
-- Indices de la tabla `entidad`
--
ALTER TABLE `entidad`
  ADD PRIMARY KEY (`idEntidad`),
  ADD KEY `idPais` (`idPais`),
  ADD KEY `idCiudad` (`idCiudad`),
  ADD KEY `idActividad` (`idActividad`),
  ADD KEY `idTipoPersona` (`idTipoPersona`);

--
-- Indices de la tabla `equipamiento`
--
ALTER TABLE `equipamiento`
  ADD PRIMARY KEY (`idequipamiento`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idusuario` (`idusuario`,`idmetodopago`,`idreserva`,`idservicio`),
  ADD KEY `idservicio` (`idservicio`),
  ADD KEY `idmetodopago` (`idmetodopago`),
  ADD KEY `idreserva` (`idreserva`);

--
-- Indices de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD PRIMARY KEY (`idhabitacion`),
  ADD KEY `idequipamiento` (`idequipamiento`,`idcategoriaHab`),
  ADD KEY `idcategoriaHab` (`idcategoriaHab`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`idmetodo`),
  ADD KEY `idusuario` (`idusuarios`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idPais`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idreserva`),
  ADD KEY `idservicio` (`idservicio`,`idhabitacion`,`idusuario`),
  ADD KEY `idhabitacion` (`idhabitacion`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrRol`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`idservicio`);

--
-- Indices de la tabla `tipopersona`
--
ALTER TABLE `tipopersona`
  ADD PRIMARY KEY (`idTipoPersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idEntidad` (`idEntidad`);

--
-- Indices de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD PRIMARY KEY (`idUsuarioRol`),
  ADD KEY `idRol` (`idRol`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acompañantes`
--
ALTER TABLE `acompañantes`
  MODIFY `idAcompañante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `actividadjuridica`
--
ALTER TABLE `actividadjuridica`
  MODIFY `idactividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categoriahabitacion`
--
ALTER TABLE `categoriahabitacion`
  MODIFY `idcategoriaHab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idCiudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `entidad`
--
ALTER TABLE `entidad`
  MODIFY `idEntidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `equipamiento`
--
ALTER TABLE `equipamiento`
  MODIFY `idequipamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  MODIFY `idhabitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `idmetodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `idPais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idreserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `idservicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipopersona`
--
ALTER TABLE `tipopersona`
  MODIFY `idTipoPersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  MODIFY `idUsuarioRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `entidad`
--
ALTER TABLE `entidad`
  ADD CONSTRAINT `entidad_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `pais` (`idPais`) ON UPDATE CASCADE,
  ADD CONSTRAINT `entidad_ibfk_2` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idCiudad`) ON UPDATE CASCADE,
  ADD CONSTRAINT `entidad_ibfk_3` FOREIGN KEY (`idActividad`) REFERENCES `actividadjuridica` (`idactividad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entidad_ibfk_4` FOREIGN KEY (`idTipoPersona`) REFERENCES `tipopersona` (`idTipoPersona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`idservicio`) REFERENCES `servicios` (`idservicio`) ON DELETE CASCADE,
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`idmetodopago`) REFERENCES `metodopago` (`idmetodo`) ON DELETE CASCADE,
  ADD CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`idreserva`) REFERENCES `reserva` (`idreserva`) ON DELETE CASCADE;

--
-- Filtros para la tabla `habitaciones`
--
ALTER TABLE `habitaciones`
  ADD CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`idcategoriaHab`) REFERENCES `categoriahabitacion` (`idcategoriaHab`) ON UPDATE CASCADE,
  ADD CONSTRAINT `habitaciones_ibfk_2` FOREIGN KEY (`idequipamiento`) REFERENCES `equipamiento` (`idequipamiento`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD CONSTRAINT `metodopago_ibfk_1` FOREIGN KEY (`idusuarios`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idservicio`) REFERENCES `servicios` (`idservicio`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`idhabitacion`) REFERENCES `habitaciones` (`idhabitacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idEntidad`) REFERENCES `entidad` (`idEntidad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD CONSTRAINT `usuariorol_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idrRol`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuariorol_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
