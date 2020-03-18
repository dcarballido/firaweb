-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-03-2020 a las 18:38:55
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectocronos`
--
CREATE DATABASE IF NOT EXISTS `proyectocronos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `proyectocronos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_alumne`
--

CREATE TABLE `tbl_alumne` (
  `id_alu` int(11) NOT NULL,
  `login_alu` varchar(50) NOT NULL,
  `pwd_alu` varchar(50) NOT NULL,
  `nom_alu` varchar(50) NOT NULL,
  `cognom_alu` varchar(50) NOT NULL,
  `email_alu` varchar(100) NOT NULL,
  `email_contacte1` varchar(100) NOT NULL,
  `email_contacte2` varchar(100) NOT NULL,
  `telefon_alu` char(9) NOT NULL,
  `telefon_contacte1` char(9) NOT NULL,
  `telefon_contacte2` char(9) NOT NULL,
  `id_tipus_usu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_assist_ed_uf`
--

CREATE TABLE `tbl_assist_ed_uf` (
  `id_assist_ed_uf` int(11) NOT NULL,
  `id_alu` int(11) NOT NULL,
  `id_prof_ed_uf` int(11) NOT NULL,
  `present` enum('si','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_aula`
--

CREATE TABLE `tbl_aula` (
  `id_aula` int(11) NOT NULL,
  `nom_aula` varchar(50) NOT NULL,
  `num_alumnes` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_branca`
--

CREATE TABLE `tbl_branca` (
  `id_branca` int(11) NOT NULL,
  `codi_branca` int(10) NOT NULL,
  `nom_branca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_cicle`
--

CREATE TABLE `tbl_cicle` (
  `id_cicle` int(11) NOT NULL,
  `codi_cicle` int(10) NOT NULL,
  `nom_cicle` varchar(100) NOT NULL,
  `id_branca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departament`
--

CREATE TABLE `tbl_departament` (
  `id_dep` int(11) NOT NULL,
  `nom_dep` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_edicio_uf`
--

CREATE TABLE `tbl_edicio_uf` (
  `id_ed_uf` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `id_uf` int(11) NOT NULL,
  `data_ini` date NOT NULL,
  `data_fi` date NOT NULL,
  `hores_totals_uf` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modul`
--

CREATE TABLE `tbl_modul` (
  `id_modul` int(11) NOT NULL,
  `codi_modul` int(10) NOT NULL,
  `nom_modul` varchar(100) NOT NULL,
  `id_cicle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_professor`
--

CREATE TABLE `tbl_professor` (
  `id_prof` int(11) NOT NULL,
  `login_prof` varchar(50) NOT NULL,
  `pwd_prof` varchar(50) NOT NULL,
  `nom_prof` varchar(50) NOT NULL,
  `cognom_prof` varchar(50) NOT NULL,
  `email_prof` varchar(100) NOT NULL,
  `estat_prof` varchar(20) NOT NULL,
  `id_dep` int(11) NOT NULL,
  `id_tipus_usu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_prof_ed_uf`
--

CREATE TABLE `tbl_prof_ed_uf` (
  `id_prod_ed_uf` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_ed_uf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipus_usu`
--

CREATE TABLE `tbl_tipus_usu` (
  `id_tipus_usu` int(11) NOT NULL,
  `nom_tipus` varchar(50) NOT NULL,
  `nivell_usu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_uf`
--

CREATE TABLE `tbl_uf` (
  `id_uf` int(11) NOT NULL,
  `codi_uf` int(10) NOT NULL,
  `nom_uf` varchar(100) NOT NULL,
  `id_modul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_alumne`
--
ALTER TABLE `tbl_alumne`
  ADD PRIMARY KEY (`id_alu`),
  ADD KEY `id_tipus_usu` (`id_tipus_usu`);

--
-- Indices de la tabla `tbl_assist_ed_uf`
--
ALTER TABLE `tbl_assist_ed_uf`
  ADD PRIMARY KEY (`id_assist_ed_uf`),
  ADD KEY `id_alu` (`id_alu`,`id_prof_ed_uf`),
  ADD KEY `id_prof_ed_uf` (`id_prof_ed_uf`);

--
-- Indices de la tabla `tbl_aula`
--
ALTER TABLE `tbl_aula`
  ADD PRIMARY KEY (`id_aula`);

--
-- Indices de la tabla `tbl_branca`
--
ALTER TABLE `tbl_branca`
  ADD PRIMARY KEY (`id_branca`);

--
-- Indices de la tabla `tbl_cicle`
--
ALTER TABLE `tbl_cicle`
  ADD PRIMARY KEY (`id_cicle`),
  ADD KEY `id_branca` (`id_branca`);

--
-- Indices de la tabla `tbl_departament`
--
ALTER TABLE `tbl_departament`
  ADD PRIMARY KEY (`id_dep`);

--
-- Indices de la tabla `tbl_edicio_uf`
--
ALTER TABLE `tbl_edicio_uf`
  ADD PRIMARY KEY (`id_ed_uf`),
  ADD KEY `id_aula` (`id_aula`,`id_uf`),
  ADD KEY `id_uf` (`id_uf`);

--
-- Indices de la tabla `tbl_modul`
--
ALTER TABLE `tbl_modul`
  ADD PRIMARY KEY (`id_modul`),
  ADD KEY `id_cicle` (`id_cicle`);

--
-- Indices de la tabla `tbl_professor`
--
ALTER TABLE `tbl_professor`
  ADD PRIMARY KEY (`id_prof`),
  ADD KEY `id_dep` (`id_dep`,`id_tipus_usu`),
  ADD KEY `id_tipus_usu` (`id_tipus_usu`);

--
-- Indices de la tabla `tbl_prof_ed_uf`
--
ALTER TABLE `tbl_prof_ed_uf`
  ADD PRIMARY KEY (`id_prod_ed_uf`),
  ADD KEY `id_prof` (`id_prof`,`id_ed_uf`),
  ADD KEY `id_ed_uf` (`id_ed_uf`);

--
-- Indices de la tabla `tbl_tipus_usu`
--
ALTER TABLE `tbl_tipus_usu`
  ADD PRIMARY KEY (`id_tipus_usu`);

--
-- Indices de la tabla `tbl_uf`
--
ALTER TABLE `tbl_uf`
  ADD PRIMARY KEY (`id_uf`),
  ADD KEY `id_modul` (`id_modul`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_alumne`
--
ALTER TABLE `tbl_alumne`
  MODIFY `id_alu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_assist_ed_uf`
--
ALTER TABLE `tbl_assist_ed_uf`
  MODIFY `id_assist_ed_uf` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_aula`
--
ALTER TABLE `tbl_aula`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_branca`
--
ALTER TABLE `tbl_branca`
  MODIFY `id_branca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_cicle`
--
ALTER TABLE `tbl_cicle`
  MODIFY `id_cicle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_departament`
--
ALTER TABLE `tbl_departament`
  MODIFY `id_dep` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_edicio_uf`
--
ALTER TABLE `tbl_edicio_uf`
  MODIFY `id_ed_uf` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_modul`
--
ALTER TABLE `tbl_modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_professor`
--
ALTER TABLE `tbl_professor`
  MODIFY `id_prof` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_prof_ed_uf`
--
ALTER TABLE `tbl_prof_ed_uf`
  MODIFY `id_prod_ed_uf` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_tipus_usu`
--
ALTER TABLE `tbl_tipus_usu`
  MODIFY `id_tipus_usu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_uf`
--
ALTER TABLE `tbl_uf`
  MODIFY `id_uf` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_alumne`
--
ALTER TABLE `tbl_alumne`
  ADD CONSTRAINT `tbl_alumne_ibfk_1` FOREIGN KEY (`id_tipus_usu`) REFERENCES `tbl_tipus_usu` (`id_tipus_usu`);

--
-- Filtros para la tabla `tbl_assist_ed_uf`
--
ALTER TABLE `tbl_assist_ed_uf`
  ADD CONSTRAINT `tbl_assist_ed_uf_ibfk_1` FOREIGN KEY (`id_prof_ed_uf`) REFERENCES `tbl_prof_ed_uf` (`id_prod_ed_uf`),
  ADD CONSTRAINT `tbl_assist_ed_uf_ibfk_2` FOREIGN KEY (`id_alu`) REFERENCES `tbl_alumne` (`id_alu`);

--
-- Filtros para la tabla `tbl_cicle`
--
ALTER TABLE `tbl_cicle`
  ADD CONSTRAINT `tbl_cicle_ibfk_1` FOREIGN KEY (`id_branca`) REFERENCES `tbl_branca` (`id_branca`);

--
-- Filtros para la tabla `tbl_edicio_uf`
--
ALTER TABLE `tbl_edicio_uf`
  ADD CONSTRAINT `tbl_edicio_uf_ibfk_1` FOREIGN KEY (`id_aula`) REFERENCES `tbl_aula` (`id_aula`),
  ADD CONSTRAINT `tbl_edicio_uf_ibfk_2` FOREIGN KEY (`id_uf`) REFERENCES `tbl_uf` (`id_uf`);

--
-- Filtros para la tabla `tbl_modul`
--
ALTER TABLE `tbl_modul`
  ADD CONSTRAINT `tbl_modul_ibfk_1` FOREIGN KEY (`id_cicle`) REFERENCES `tbl_cicle` (`id_cicle`);

--
-- Filtros para la tabla `tbl_professor`
--
ALTER TABLE `tbl_professor`
  ADD CONSTRAINT `tbl_professor_ibfk_1` FOREIGN KEY (`id_tipus_usu`) REFERENCES `tbl_tipus_usu` (`id_tipus_usu`),
  ADD CONSTRAINT `tbl_professor_ibfk_2` FOREIGN KEY (`id_dep`) REFERENCES `tbl_departament` (`id_dep`);

--
-- Filtros para la tabla `tbl_prof_ed_uf`
--
ALTER TABLE `tbl_prof_ed_uf`
  ADD CONSTRAINT `tbl_prof_ed_uf_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `tbl_professor` (`id_prof`),
  ADD CONSTRAINT `tbl_prof_ed_uf_ibfk_2` FOREIGN KEY (`id_ed_uf`) REFERENCES `tbl_edicio_uf` (`id_ed_uf`);

--
-- Filtros para la tabla `tbl_uf`
--
ALTER TABLE `tbl_uf`
  ADD CONSTRAINT `tbl_uf_ibfk_1` FOREIGN KEY (`id_modul`) REFERENCES `tbl_modul` (`id_modul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
