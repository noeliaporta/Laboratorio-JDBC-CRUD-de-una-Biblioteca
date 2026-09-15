-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2026 a las 09:46:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `ISBN` varchar(20) NOT NULL,
  `nro_ejemplar` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejemplar`
--

INSERT INTO `ejemplar` (`ISBN`, `nro_ejemplar`, `estado`) VALUES
('9789500728002', 1, 'Disponible'),
('9789500728002', 2, 'Disponible'),
('9789500728002', 3, 'Disponible'),
('9789500728019', 1, 'Disponible'),
('9789500728019', 2, 'Prestado'),
('9789500728026', 1, 'Disponible'),
('9789500728026', 2, 'Prestado'),
('9789500728026', 3, 'Disponible'),
('9789500728033', 1, 'Disponible'),
('9789500728040', 1, 'Prestado'),
('9789500728040', 2, 'Disponible'),
('9789500728057', 1, 'Prestado'),
('9789500728064', 1, 'Disponible'),
('9789500728064', 2, 'Disponible'),
('9789500728071', 1, 'Prestado'),
('9789500728071', 2, 'Prestado'),
('9789500728071', 3, 'Disponible'),
('9789500728088', 1, 'Disponible'),
('9789500728095', 1, 'Disponible'),
('9789500728095', 2, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `ISBN` varchar(20) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `anio_publicacion` int(11) DEFAULT NULL,
  `stock_total` int(11) NOT NULL DEFAULT 0,
  `cantidad_paginas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`ISBN`, `titulo`, `autor`, `editorial`, `anio_publicacion`, `stock_total`, `cantidad_paginas`) VALUES
('9789500728002', 'Cien Años de Soledad', 'Gabriel García Márquez', 'Sudamericana', 1967, 0, NULL),
('9789500728019', 'Rayuela', 'Julio Cortázar', 'Alfaguara', 1963, 0, NULL),
('9789500728026', 'El Aleph', 'Jorge Luis Borges', 'Emecé', 1949, 0, NULL),
('9789500728033', 'Ficciones', 'Jorge Luis Borges', 'Emecé', 1944, 0, NULL),
('9789500728040', 'La Casa de los Espíritus', 'Isabel Allende', 'Sudamericana', 1982, 0, NULL),
('9789500728057', 'Pedro Páramo', 'Juan Rulfo', 'Cátedra', 1955, 0, NULL),
('9789500728064', 'Martín Fierro', 'José Hernández', 'Losada', 1872, 0, NULL),
('9789500728071', 'La Tregua', 'Mario Benedetti', 'Sudamericana', 1960, 0, NULL),
('9789500728088', 'Los Ríos Profundos', 'José María Arguedas', 'Losada', 1958, 0, NULL),
('9789500728095', 'Boquitas Pintadas', 'Manuel Puig', 'Sudamericana', 1969, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multa`
--

CREATE TABLE `multa` (
  `id_multa` int(11) NOT NULL,
  `id_prestamo` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_multa` date NOT NULL,
  `pagada` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `multa`
--

INSERT INTO `multa` (`id_multa`, `id_prestamo`, `monto`, `fecha_multa`, `pagada`) VALUES
(1, 2, 150.00, '2026-05-20', 1),
(2, 3, 750.00, '2026-05-19', 0),
(3, 6, 650.00, '2026-05-26', 0),
(4, 9, 550.00, '2026-06-03', 0),
(5, 11, 100.00, '2026-06-10', 1),
(6, 12, 450.00, '2026-06-15', 0),
(7, 14, 350.00, '2026-06-19', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `nro_ejemplar` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion_prevista` date NOT NULL,
  `fecha_devolucion_real` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `id_socio`, `ISBN`, `nro_ejemplar`, `fecha_prestamo`, `fecha_devolucion_prevista`, `fecha_devolucion_real`) VALUES
(1, 1, '9789500728002', 1, '2026-05-01', '2026-05-15', '2026-05-14'),
(2, 2, '9789500728019', 1, '2026-05-03', '2026-05-17', '2026-05-20'),
(3, 3, '9789500728026', 2, '2026-05-05', '2026-05-19', NULL),
(4, 4, '9789500728002', 2, '2026-05-06', '2026-05-20', '2026-05-18'),
(5, 5, '9789500728033', 1, '2026-05-10', '2026-05-24', '2026-05-23'),
(6, 6, '9789500728040', 1, '2026-05-12', '2026-05-26', NULL),
(7, 7, '9789500728057', 1, '2026-05-15', '2026-05-29', '2026-05-28'),
(8, 8, '9789500728064', 1, '2026-05-18', '2026-06-01', '2026-06-01'),
(9, 9, '9789500728071', 1, '2026-05-20', '2026-06-03', NULL),
(10, 10, '9789500728088', 1, '2026-05-22', '2026-06-05', '2026-06-04'),
(11, 11, '9789500728095', 1, '2026-05-25', '2026-06-08', '2026-06-10'),
(12, 12, '9789500728019', 2, '2026-06-01', '2026-06-15', NULL),
(13, 1, '9789500728026', 1, '2026-06-02', '2026-06-16', '2026-06-15'),
(14, 13, '9789500728071', 2, '2026-06-05', '2026-06-19', NULL),
(15, 14, '9789500728095', 2, '2026-06-10', '2026-06-24', '2026-06-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `id_socio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `DNI` varchar(15) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `fecha_alta` date NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`id_socio`, `nombre`, `DNI`, `telefono`, `fecha_alta`, `email`) VALUES
(1, 'Ana García', '30111222', '11-4455-1001', '2024-03-05', NULL),
(2, 'Martín Pérez', '29876543', '11-4455-1002', '2024-03-10', NULL),
(3, 'Lucía Fernández', '31234567', '11-4455-1003', '2024-04-02', NULL),
(4, 'Juan Rodríguez', '28765432', '11-4455-1004', '2024-04-15', NULL),
(5, 'Sofía Gómez', '33456789', '11-4455-1005', '2024-05-01', NULL),
(6, 'Diego Martínez', '27654321', '11-4455-1006', '2024-05-20', NULL),
(7, 'Camila López', '32345678', '11-4455-1007', '2024-06-03', NULL),
(8, 'Nicolás Sánchez', '30456789', '11-4455-1008', '2024-06-18', NULL),
(9, 'Valentina Díaz', '34567890', '11-4455-1009', '2024-07-02', NULL),
(10, 'Federico Torres', '29123456', '11-4455-1010', '2024-07-25', NULL),
(11, 'Julieta Romero', '31987654', '11-4455-1011', '2024-08-10', NULL),
(12, 'Tomás Álvarez', '28234567', '11-4455-1012', '2024-08-30', NULL),
(13, 'Agustina Ruiz', '33654321', '11-4455-1013', '2024-09-14', NULL),
(14, 'Matías Flores', '27890123', '11-4455-1014', '2024-10-01', NULL),
(15, 'Florencia Acosta', '32109876', '11-4455-1015', '2024-10-20', NULL),
(16, 'Santiago Benítez', '30765432', '11-4455-1016', '2024-11-05', NULL),
(17, 'Milagros Suárez', '34210987', '11-4455-1017', '2024-11-22', NULL),
(18, 'Franco Medina', '29345678', '11-4455-1018', '2024-12-10', NULL),
(19, 'Rocío Castro', '31456789', '11-4455-1019', '2025-01-08', NULL),
(20, 'Ignacio Herrera', '28567890', '11-4455-1020', '2025-01-25', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`ISBN`,`nro_ejemplar`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indices de la tabla `multa`
--
ALTER TABLE `multa`
  ADD PRIMARY KEY (`id_multa`),
  ADD KEY `fk_multa_prestamo` (`id_prestamo`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `fk_prestamo_socio` (`id_socio`),
  ADD KEY `fk_prestamo_ejemplar` (`ISBN`,`nro_ejemplar`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`id_socio`),
  ADD UNIQUE KEY `DNI` (`DNI`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `multa`
--
ALTER TABLE `multa`
  MODIFY `id_multa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `id_socio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `fk_ejemplar_libro` FOREIGN KEY (`ISBN`) REFERENCES `libro` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `multa`
--
ALTER TABLE `multa`
  ADD CONSTRAINT `fk_multa_prestamo` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_prestamo_ejemplar` FOREIGN KEY (`ISBN`,`nro_ejemplar`) REFERENCES `ejemplar` (`ISBN`, `nro_ejemplar`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestamo_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
