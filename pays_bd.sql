-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 10 Janvier 2023 à 12:14
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `pays_bd`
--

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

CREATE TABLE IF NOT EXISTS `commune` (
  `code_commune` int(11) NOT NULL,
  `nom_commune` varchar(30) NOT NULL,
  `population_VF` int(11) DEFAULT NULL,
  `surface` float NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  `num_departement` int(11) NOT NULL,
  `maire` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`code_commune`),
  KEY `num_departement` (`num_departement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commune`
--

INSERT INTO `commune` (`code_commune`, `nom_commune`, `population_VF`, `surface`, `longitude`, `latitude`, `num_departement`, `maire`) VALUES
(29232, 'Quimper', 5000, 20000, 2222220, 333333000, 29, NULL),
(94000, 'créteil', 24000, 2000000, 666666, 88888900, 94, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE IF NOT EXISTS `departements` (
  `num_departement` int(11) NOT NULL,
  `nom_departement` varchar(30) NOT NULL,
  `code_region` varchar(20) NOT NULL,
  PRIMARY KEY (`num_departement`),
  KEY `code_region` (`code_region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `departements`
--

INSERT INTO `departements` (`num_departement`, `nom_departement`, `code_region`) VALUES
(29, 'Finistère', 'Bretagne'),
(94, 'val de marne2', 'idf');

-- --------------------------------------------------------

--
-- Structure de la table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `code_region` varchar(20) NOT NULL,
  `nom_region` varchar(30) NOT NULL,
  PRIMARY KEY (`code_region`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `regions`
--

INSERT INTO `regions` (`code_region`, `nom_region`) VALUES
('Bretagne', 'Bretagne '),
('idf', 'ile de france');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commune`
--
ALTER TABLE `commune`
  ADD CONSTRAINT `commune_ibfk_1` FOREIGN KEY (`num_departement`) REFERENCES `departements` (`num_departement`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `departements`
--
ALTER TABLE `departements`
  ADD CONSTRAINT `departements_ibfk_1` FOREIGN KEY (`code_region`) REFERENCES `regions` (`code_region`) ON DELETE CASCADE ON UPDATE CASCADE;
