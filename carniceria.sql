-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 25-11-2025 a las 22:39:05
-- Versión del servidor: 8.0.40
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carniceria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int NOT NULL,
  `tipo_documento` varchar(50) NOT NULL,
  `numero_documento` varchar(50) DEFAULT NULL,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `tipo_documento`, `numero_documento`, `primer_nombre`, `segundo_nombre`, `primer_apellido`, `segundo_apellido`, `fecha_nacimiento`) VALUES
(1, 'CC', '3456765', 'Mauricio', 'Jose', 'Rivero', 'Padilla', '1984-01-02'),
(2, 'TI', '87656', 'Abel', '', 'Rivero', 'Herrera', '2018-06-24'),
(3, 'TI', '8752673', 'Ada', 'Alicia', 'Rivero', 'Herrera', '2024-03-19'),
(4, 'CC', '12345678', 'Mariana', '', 'Cano', 'Lopez', '2004-11-06'),
(5, 'CC', '9876543', 'Jose', 'Manuel', 'Castillo', 'Castro', '1976-03-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_social`
--

CREATE TABLE `perfil_social` (
  `usuario_id` int NOT NULL,
  `red_social_id` int NOT NULL,
  `url_perfil` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil_social`
--

INSERT INTO `perfil_social` (`usuario_id`, `red_social_id`, `url_perfil`) VALUES
(1, 1, 'www.facebook.com/mauriciorivero'),
(1, 2, 'www.twitter.com/mauriciorivero'),
(1, 3, 'www.linkedin.com/mauriciorivero'),
(2, 2, 'www.twiiter.com/abel'),
(3, 1, 'www.facebook.com/ada'),
(3, 5, 'www.youtube.com/ada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redes_sociales`
--

CREATE TABLE `redes_sociales` (
  `id` int NOT NULL,
  `nombre_red_social` varchar(50) NOT NULL,
  `url_red_social` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `redes_sociales`
--

INSERT INTO `redes_sociales` (`id`, `nombre_red_social`, `url_red_social`) VALUES
(1, 'facebook', 'www.facebook.com'),
(2, 'twitter', 'www.twitter.com'),
(3, 'linkedin', 'www.linkedin.com'),
(4, 'tiktok', 'www.tiktok.com'),
(5, 'youtube', 'www.youtube.com'),
(6, 'instagram', 'www.instagram.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `id` int NOT NULL,
  `tipo_telefono` varchar(20) NOT NULL,
  `numero_telefono` varchar(20) NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`id`, `tipo_telefono`, `numero_telefono`, `id_usuario`) VALUES
(1, 'Fijo', '645645', 1),
(2, 'Movil', '3005673245', 1),
(3, 'Fax', '8765434', 1),
(4, 'fijo', '876567', 2),
(5, 'Movil', '87654786', 3),
(6, 'Movil', '2345676543', 4),
(7, 'Movil', '8765434787', 2),
(8, 'Fax', '4598761098', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfil_social`
--
ALTER TABLE `perfil_social`
  ADD PRIMARY KEY (`usuario_id`,`red_social_id`),
  ADD KEY `red_social_id` (`red_social_id`);

--
-- Indices de la tabla `redes_sociales`
--
ALTER TABLE `redes_sociales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_red_social` (`nombre_red_social`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `redes_sociales`
--
ALTER TABLE `redes_sociales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `telefono`
--
ALTER TABLE `telefono`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfil_social`
--
ALTER TABLE `perfil_social`
  ADD CONSTRAINT `perfil_social_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfil_social_ibfk_2` FOREIGN KEY (`red_social_id`) REFERENCES `redes_sociales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
