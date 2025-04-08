-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 08, 2025 kell 01:43 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `postnikovalogitpv23`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `autod`
--

CREATE TABLE `autod` (
  `autoID` int(11) NOT NULL,
  `autoNr` varchar(50) DEFAULT NULL,
  `mudell` char(12) DEFAULT NULL,
  `mark` varchar(50) DEFAULT NULL,
  `v_aasta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `autod`
--

INSERT INTO `autod` (`autoID`, `autoNr`, `mudell`, `mark`, `v_aasta`) VALUES
(1, 'ghf245', 'R8', 'Audi', 2000),
(2, '479hfn', 'S4', 'Honda', 2024);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `elukoht`
--

CREATE TABLE `elukoht` (
  `elukohtID` int(11) NOT NULL,
  `elukoht` varchar(50) DEFAULT NULL,
  `maakond` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `elukoht`
--

INSERT INTO `elukoht` (`elukohtID`, `elukoht`, `maakond`) VALUES
(1, 'Tallinn', 'Harjumaa'),
(2, 'Tartu', 'Tartumaa'),
(3, 'Pärnu', 'Pärnumaa');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `inimene`
--

CREATE TABLE `inimene` (
  `inimeneID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `synniaeg` date DEFAULT NULL,
  `telefon` char(12) DEFAULT NULL,
  `pikkus` decimal(5,2) DEFAULT NULL,
  `opilaskodu` bit(1) DEFAULT NULL,
  `elukohtID` int(11) DEFAULT NULL,
  `autoID` int(11) DEFAULT NULL,
  `loomID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `inimene`
--

INSERT INTO `inimene` (`inimeneID`, `nimi`, `synniaeg`, `telefon`, `pikkus`, `opilaskodu`, `elukohtID`, `autoID`, `loomID`) VALUES
(1, 'Peeter Uus', '2021-12-30', '2568952', 90.50, b'0', 1, 1, NULL),
(2, 'Kaarel Oja', '2000-12-30', '2568952', 90.50, b'0', 3, 2, NULL),
(3, 'Kask Mati', '1983-12-30', '33333', 140.50, b'0', 2, 1, NULL),
(4, 'Milana Surnina', '2007-01-22', '64363', 160.50, b'1', 2, 1, NULL),
(5, 'Karina Linter', '2007-03-22', '222222', 170.10, b'1', 3, 2, NULL),
(6, 'Julia Post', '2021-12-30', '2568952', 90.50, b'0', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `loom`
--

CREATE TABLE `loom` (
  `loomID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `kaal` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `loom`
--

INSERT INTO `loom` (`loomID`, `nimi`, `kaal`) VALUES
(1, 'koer', 7.60),
(2, 'kass', 5.40);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `autod`
--
ALTER TABLE `autod`
  ADD PRIMARY KEY (`autoID`),
  ADD UNIQUE KEY `autoNr` (`autoNr`);

--
-- Indeksid tabelile `elukoht`
--
ALTER TABLE `elukoht`
  ADD PRIMARY KEY (`elukohtID`),
  ADD UNIQUE KEY `elukoht` (`elukoht`);

--
-- Indeksid tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD PRIMARY KEY (`inimeneID`),
  ADD UNIQUE KEY `nimi` (`nimi`),
  ADD KEY `fk_elukoht` (`elukohtID`),
  ADD KEY `fk_autod` (`autoID`),
  ADD KEY `fk_loom` (`loomID`);

--
-- Indeksid tabelile `loom`
--
ALTER TABLE `loom`
  ADD PRIMARY KEY (`loomID`),
  ADD UNIQUE KEY `nimi` (`nimi`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `autod`
--
ALTER TABLE `autod`
  MODIFY `autoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `elukoht`
--
ALTER TABLE `elukoht`
  MODIFY `elukohtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT tabelile `inimene`
--
ALTER TABLE `inimene`
  MODIFY `inimeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `loom`
--
ALTER TABLE `loom`
  MODIFY `loomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD CONSTRAINT `fk_autod` FOREIGN KEY (`autoID`) REFERENCES `autod` (`autoID`),
  ADD CONSTRAINT `fk_elukoht` FOREIGN KEY (`elukohtID`) REFERENCES `elukoht` (`elukohtID`),
  ADD CONSTRAINT `fk_loom` FOREIGN KEY (`loomID`) REFERENCES `loom` (`loomID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
