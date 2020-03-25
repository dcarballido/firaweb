-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2020 at 05:27 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cronosproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assist_classe`
--

CREATE TABLE `tbl_assist_classe` (
  `id_assist_classe` int(11) NOT NULL,
  `hora_assist_classe` time NOT NULL,
  `present` tinyint(1) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_aula`
--

CREATE TABLE `tbl_aula` (
  `id_aula` int(11) NOT NULL,
  `nom_aula` varchar(255) NOT NULL,
  `capacitat` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_aula`
--

INSERT INTO `tbl_aula` (`id_aula`, `nom_aula`, `capacitat`) VALUES
(1, '301', 30),
(2, '306', 32);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cicle`
--

CREATE TABLE `tbl_cicle` (
  `id_cicle` int(11) NOT NULL,
  `codi_cicle` varchar(255) NOT NULL,
  `nom_cicle` varchar(255) NOT NULL,
  `aka_cicle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_cicle`
--

INSERT INTO `tbl_cicle` (`id_cicle`, `codi_cicle`, `nom_cicle`, `aka_cicle`) VALUES
(1, 'ICA0', 'Administración de Sistemes Informàtics i Xarxes', 'ASIX'),
(2, 'ICC0', 'Desenvolupament d\'Aplicacions Web', 'DAW'),
(3, 'AEA0', 'Ensenyament i Animació Socioesportiva', 'EAS'),
(4, 'AGB0', 'Administración i Finances', 'AF'),
(5, 'SCB0', 'Educació Infantil', 'EDIN');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_classe_uf`
--

CREATE TABLE `tbl_classe_uf` (
  `id_classe` int(11) NOT NULL,
  `dia_classe` date NOT NULL,
  `hora_ini_classe` time NOT NULL,
  `hora_fi_classe` time NOT NULL,
  `id_ed_uf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_classe_uf`
--

INSERT INTO `tbl_classe_uf` (`id_classe`, `dia_classe`, `hora_ini_classe`, `hora_fi_classe`, `id_ed_uf`) VALUES
(1, '2020-03-23', '14:00:00', '17:00:00', 1),
(2, '2020-03-23', '19:20:00', '22:00:00', 1),
(3, '2020-03-23', '19:50:00', '23:00:00', 2),
(4, '2020-03-23', '20:00:00', '21:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departament`
--

CREATE TABLE `tbl_departament` (
  `id_departament` int(11) NOT NULL,
  `nom_departament` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_departament`
--

INSERT INTO `tbl_departament` (`id_departament`, `nom_departament`) VALUES
(1, 'Informática i telecomunicacions'),
(2, 'Administrció i finances'),
(3, 'Ensenyaments esportius'),
(4, 'Educació infantil');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_edicio_uf`
--

CREATE TABLE `tbl_edicio_uf` (
  `id_ed_uf` int(11) NOT NULL,
  `data_ini_uf` date NOT NULL,
  `data_fi_uf` date NOT NULL,
  `hores_totals_uf` int(4) NOT NULL,
  `id_usuari` int(11) NOT NULL,
  `id_aula` int(11) NOT NULL,
  `id_uf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_edicio_uf`
--

INSERT INTO `tbl_edicio_uf` (`id_ed_uf`, `data_ini_uf`, `data_fi_uf`, `hores_totals_uf`, `id_usuari`, `id_aula`, `id_uf`) VALUES
(1, '2020-03-22', '2020-04-16', 40, 2, 1, 4),
(2, '2020-04-18', '2020-05-09', 50, 5, 1, 4),
(3, '2020-03-22', '2020-03-26', 40, 5, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modul`
--

CREATE TABLE `tbl_modul` (
  `id_modul` int(11) NOT NULL,
  `codi_modul` varchar(255) NOT NULL,
  `nom_modul` varchar(255) NOT NULL,
  `id_cicle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_modul`
--

INSERT INTO `tbl_modul` (`id_modul`, `codi_modul`, `nom_modul`, `id_cicle`) VALUES
(1, 'MP01', 'Sistemes Informàtics', 2),
(2, 'MP02', 'Bases de Dades', 2),
(3, 'MP03', 'Programació', 2),
(4, 'MP04', 'Llenguatge de Marques i Sistemes de Gestió de la Informació', 2),
(5, 'MP05', 'Entorns de desenvolupament', 2),
(6, 'MP06', 'Desenvolupament Web en Entorn Client', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_professor_departament`
--

CREATE TABLE `tbl_professor_departament` (
  `id_usuari` int(11) NOT NULL,
  `id_departament` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_professor_departament`
--

INSERT INTO `tbl_professor_departament` (`id_usuari`, `id_departament`) VALUES
(2, 1),
(5, 1),
(6, 1),
(12, 1),
(13, 2),
(14, 2),
(16, 3),
(17, 3),
(15, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_professor_ed_uf`
--

CREATE TABLE `tbl_professor_ed_uf` (
  `id_usuari` int(11) NOT NULL,
  `id_ed_uf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_professor_ed_uf`
--

INSERT INTO `tbl_professor_ed_uf` (`id_usuari`, `id_ed_uf`) VALUES
(2, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipus_usuari`
--

CREATE TABLE `tbl_tipus_usuari` (
  `id_tipus_usuari` int(11) NOT NULL,
  `tipus_usuari` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_tipus_usuari`
--

INSERT INTO `tbl_tipus_usuari` (`id_tipus_usuari`, `tipus_usuari`) VALUES
(1, 'professor'),
(2, 'alumne');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_uf`
--

CREATE TABLE `tbl_uf` (
  `id_uf` int(11) NOT NULL,
  `codi_uf` varchar(255) NOT NULL,
  `nom_uf` varchar(255) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `id_cicle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_uf`
--

INSERT INTO `tbl_uf` (`id_uf`, `codi_uf`, `nom_uf`, `id_modul`, `id_cicle`) VALUES
(4, 'UF1', 'Instal•nació, configuració i explotación del sistema informàtic', 1, 0),
(5, 'UF2', 'Gestió de la Informació i de Recursos en Xarxa', 1, 0),
(6, 'UF1', 'Introducció a les Bases de Dades', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuari`
--

CREATE TABLE `tbl_usuari` (
  `id_usuari` int(11) NOT NULL,
  `codi_usuari` varchar(255) NOT NULL,
  `password_usuari` varchar(255) NOT NULL,
  `nom_usuari` varchar(255) NOT NULL,
  `cognom1_usuari` varchar(255) NOT NULL,
  `cognom2_usuari` varchar(255) DEFAULT NULL,
  `email_usuari` varchar(255) NOT NULL,
  `status_usuari` enum('actiu','bloquejat','eliminat') NOT NULL,
  `id_tipus_usuari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_usuari`
--

INSERT INTO `tbl_usuari` (`id_usuari`, `codi_usuari`, `password_usuari`, `nom_usuari`, `cognom1_usuari`, `cognom2_usuari`, `email_usuari`, `status_usuari`, `id_tipus_usuari`) VALUES
(1, '100006710', '81dc9bdb52d04dc20036dbd8313ed055', 'Diego', 'Carballido', 'Valle', '100006710.joan23@fje.edu', 'actiu', 2),
(2, 'aplans', '81dc9bdb52d04dc20036dbd8313ed055', 'Agnès', 'Plans', 'Berenguer', 'agnes.plans@fje.edu', 'actiu', 1),
(3, '100005754', '81dc9bdb52d04dc20036dbd8313ed055', 'Aarón', 'Otero', 'Tarrazón', '100005754.joan23@fje.edu', 'actiu', 2),
(4, '100005820', '81dc9bdb52d04dc20036dbd8313ed055', 'Joel', 'Fandos', 'Sánchez', '100005820.joan23@fje.edu', 'actiu', 2),
(5, 'sjimenez', '81dc9bdb52d04dc20036dbd8313ed055', 'Sergio', 'Jímenez', 'García', 'sergio.jimenez@fje.edu', 'actiu', 1),
(6, 'tfernandez', '81dc9bdb52d04dc20036dbd8313ed055', 'Toni', 'Fernandez', 'Ríos', 'toni.fernandez@fje.edu', 'actiu', 1),
(7, '10000657', '81dc9bdb52d04dc20036dbd8313ed055', 'Jesús', 'Mellado', 'García', '10000657.joan23@fje.edu', 'actiu', 2),
(8, '100005821', '81dc9bdb52d04dc20036dbd8313ed055', 'Edgar', 'Godoy', 'Morote', '100005821.joan23@fje.edu', 'actiu', 2),
(9, '93430', '81dc9bdb52d04dc20036dbd8313ed055', 'Raúl', 'Vázquez', 'Pedrera', '93430.joan23@fje.edu', 'actiu', 2),
(10, '6277', '81dc9bdb52d04dc20036dbd8313ed055', 'Elio', 'Rojas', 'Gómez', '6277.joan23@fje.edu', 'actiu', 2),
(11, '6236', '81dc9bdb52d04dc20036dbd8313ed055', 'Marc', 'Camós', 'Gómez', '6236.joan23@fje.edu', 'actiu', 2),
(12, 'dlarrea', '81dc9bdb52d04dc20036dbd8313ed055', 'Danny', 'Jonathan', 'Larrea', 'danny.larrea@fje.edu', 'actiu', 1),
(13, 'mdelgado', '81dc9bdb52d04dc20036dbd8313ed055', 'Miguel', 'Delgado', 'Caballero', 'miguel.delgado@fje.edu', 'actiu', 1),
(14, 'gibanez', '81dc9bdb52d04dc20036dbd8313ed055', 'Gemma', 'Ibañez', 'Campán', 'gemma.ibanez@fje.edu', 'actiu', 1),
(15, 'gsegui', '81dc9bdb52d04dc20036dbd8313ed055', 'Guadalupe', 'Seguí', NULL, 'guadalupe.segui@fje.edu', 'actiu', 1),
(16, 'smoreno', '81dc9bdb52d04dc20036dbd8313ed055', 'Sonia', 'Moreno', 'López', 'sonia.moreno@fje.edu', 'actiu', 1),
(17, 'jdorado', '81dc9bdb52d04dc20036dbd8313ed055', 'Jorge', 'Dorado', NULL, 'Jorge.dorado@fje.edu', 'actiu', 1),
(18, '100007207', '81dc9bdb52d04dc20036dbd8313ed055', 'Silvia', 'Toro', 'Vega', '100007207.joan23@fje.edu', 'actiu', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_assist_classe`
--
ALTER TABLE `tbl_assist_classe`
  ADD PRIMARY KEY (`id_assist_classe`),
  ADD KEY `fk_id_classe` (`id_classe`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- Indexes for table `tbl_aula`
--
ALTER TABLE `tbl_aula`
  ADD PRIMARY KEY (`id_aula`);

--
-- Indexes for table `tbl_cicle`
--
ALTER TABLE `tbl_cicle`
  ADD PRIMARY KEY (`id_cicle`);

--
-- Indexes for table `tbl_classe_uf`
--
ALTER TABLE `tbl_classe_uf`
  ADD PRIMARY KEY (`id_classe`),
  ADD KEY `fk_id_ed_uf` (`id_ed_uf`);

--
-- Indexes for table `tbl_departament`
--
ALTER TABLE `tbl_departament`
  ADD PRIMARY KEY (`id_departament`);

--
-- Indexes for table `tbl_edicio_uf`
--
ALTER TABLE `tbl_edicio_uf`
  ADD PRIMARY KEY (`id_ed_uf`),
  ADD KEY `fk_id_uf` (`id_uf`),
  ADD KEY `fk_id_aula` (`id_aula`);

--
-- Indexes for table `tbl_modul`
--
ALTER TABLE `tbl_modul`
  ADD PRIMARY KEY (`id_modul`),
  ADD KEY `fk_id_cicle` (`id_cicle`);

--
-- Indexes for table `tbl_professor_departament`
--
ALTER TABLE `tbl_professor_departament`
  ADD PRIMARY KEY (`id_usuari`),
  ADD KEY `id_departament` (`id_departament`);

--
-- Indexes for table `tbl_professor_ed_uf`
--
ALTER TABLE `tbl_professor_ed_uf`
  ADD PRIMARY KEY (`id_usuari`),
  ADD KEY `id_ed_uf` (`id_ed_uf`);

--
-- Indexes for table `tbl_tipus_usuari`
--
ALTER TABLE `tbl_tipus_usuari`
  ADD PRIMARY KEY (`id_tipus_usuari`);

--
-- Indexes for table `tbl_uf`
--
ALTER TABLE `tbl_uf`
  ADD PRIMARY KEY (`id_uf`),
  ADD KEY `fk_id_modul` (`id_modul`);

--
-- Indexes for table `tbl_usuari`
--
ALTER TABLE `tbl_usuari`
  ADD PRIMARY KEY (`id_usuari`),
  ADD KEY `fk_id_tipus_usuari` (`id_tipus_usuari`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_assist_classe`
--
ALTER TABLE `tbl_assist_classe`
  MODIFY `id_assist_classe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_aula`
--
ALTER TABLE `tbl_aula`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_cicle`
--
ALTER TABLE `tbl_cicle`
  MODIFY `id_cicle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_classe_uf`
--
ALTER TABLE `tbl_classe_uf`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_departament`
--
ALTER TABLE `tbl_departament`
  MODIFY `id_departament` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_edicio_uf`
--
ALTER TABLE `tbl_edicio_uf`
  MODIFY `id_ed_uf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_modul`
--
ALTER TABLE `tbl_modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_professor_departament`
--
ALTER TABLE `tbl_professor_departament`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_professor_ed_uf`
--
ALTER TABLE `tbl_professor_ed_uf`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_tipus_usuari`
--
ALTER TABLE `tbl_tipus_usuari`
  MODIFY `id_tipus_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_uf`
--
ALTER TABLE `tbl_uf`
  MODIFY `id_uf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_usuari`
--
ALTER TABLE `tbl_usuari`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_assist_classe`
--
ALTER TABLE `tbl_assist_classe`
  ADD CONSTRAINT `fk_id_classe` FOREIGN KEY (`id_classe`) REFERENCES `tbl_classe_uf` (`id_classe`),
  ADD CONSTRAINT `tbl_assist_classe_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `tbl_usuari` (`id_usuari`);

--
-- Constraints for table `tbl_classe_uf`
--
ALTER TABLE `tbl_classe_uf`
  ADD CONSTRAINT `fk_id_ed_uf` FOREIGN KEY (`id_ed_uf`) REFERENCES `tbl_edicio_uf` (`id_ed_uf`);

--
-- Constraints for table `tbl_edicio_uf`
--
ALTER TABLE `tbl_edicio_uf`
  ADD CONSTRAINT `fk_id_aula` FOREIGN KEY (`id_aula`) REFERENCES `tbl_aula` (`id_aula`),
  ADD CONSTRAINT `fk_id_uf` FOREIGN KEY (`id_uf`) REFERENCES `tbl_uf` (`id_uf`);

--
-- Constraints for table `tbl_modul`
--
ALTER TABLE `tbl_modul`
  ADD CONSTRAINT `fk_id_cicle` FOREIGN KEY (`id_cicle`) REFERENCES `tbl_cicle` (`id_cicle`);

--
-- Constraints for table `tbl_professor_departament`
--
ALTER TABLE `tbl_professor_departament`
  ADD CONSTRAINT `fk_id_usuari` FOREIGN KEY (`id_usuari`) REFERENCES `tbl_usuari` (`id_usuari`),
  ADD CONSTRAINT `tbl_professor_departament_ibfk_1` FOREIGN KEY (`id_departament`) REFERENCES `tbl_departament` (`id_departament`);

--
-- Constraints for table `tbl_professor_ed_uf`
--
ALTER TABLE `tbl_professor_ed_uf`
  ADD CONSTRAINT `tbl_professor_ed_uf_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `tbl_usuari` (`id_usuari`),
  ADD CONSTRAINT `tbl_professor_ed_uf_ibfk_2` FOREIGN KEY (`id_ed_uf`) REFERENCES `tbl_edicio_uf` (`id_ed_uf`);

--
-- Constraints for table `tbl_uf`
--
ALTER TABLE `tbl_uf`
  ADD CONSTRAINT `fk_id_modul` FOREIGN KEY (`id_modul`) REFERENCES `tbl_modul` (`id_modul`);

--
-- Constraints for table `tbl_usuari`
--
ALTER TABLE `tbl_usuari`
  ADD CONSTRAINT `fk_id_tipus_usuari` FOREIGN KEY (`id_tipus_usuari`) REFERENCES `tbl_tipus_usuari` (`id_tipus_usuari`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
