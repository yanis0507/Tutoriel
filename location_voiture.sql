-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 13 Décembre 2022 à 11:13
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `location_voiture`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `code_client` varchar(20) NOT NULL,
  `nom_prenom` varchar(20) NOT NULL,
  `adresse` text NOT NULL,
  `date_naissance` date NOT NULL,
  `num_tel` varchar(20) NOT NULL,
  `ville` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`code_client`, `nom_prenom`, `adresse`, `date_naissance`, `num_tel`, `ville`, `email`) VALUES
('12A', 'Rémy P', 'Argenteuil 05 jean jaurès', '2022-12-28', '0620003423', 'Argenteuil', 'apou95@gmail.com'),
('13A', 'Yasko', '12 Allée du chomeur', '2022-12-30', '04893942332', 'Bezons', 'zoubir@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `code_location` varchar(7) NOT NULL,
  `date_location` date NOT NULL,
  `prix_jour` int(11) NOT NULL,
  `duree` int(11) NOT NULL,
  `caution` int(11) NOT NULL,
  `code_client` varchar(20) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  PRIMARY KEY (`code_location`),
  KEY `code_client` (`code_client`,`immatriculation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `locations`
--

INSERT INTO `locations` (`code_location`, `date_location`, `prix_jour`, `duree`, `caution`, `code_client`, `immatriculation`) VALUES
('12', '2022-12-11', 230, 3, 1000, '12A', '12 TU 2000'),
('13', '2022-12-03', 60, 7, 600, '13A', '16 RU 400'),
('14', '2022-11-15', 60, 4, 600, '13A', '16 RU 400');

-- --------------------------------------------------------

--
-- Structure de la table `reparations`
--

CREATE TABLE IF NOT EXISTS `reparations` (
  `num_reparation` int(11) NOT NULL,
  `date_rep` date NOT NULL,
  `duree_rep` int(11) NOT NULL,
  `cout_rep` int(11) NOT NULL,
  `responsable_rep` varchar(20) NOT NULL,
  `immatriculation` varchar(20) NOT NULL,
  PRIMARY KEY (`num_reparation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reparations`
--


-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE IF NOT EXISTS `voitures` (
  `immatriculation` varchar(20) NOT NULL,
  `modele` varchar(20) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `carburant` varchar(20) NOT NULL,
  `etat` varchar(20) NOT NULL,
  `nbre_place` int(11) NOT NULL,
  `nbre_porte` int(11) NOT NULL,
  `couleur` varchar(10) NOT NULL,
  `annee_cirulation` date NOT NULL,
  `marque` int(20) NOT NULL,
  PRIMARY KEY (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voitures`
--

INSERT INTO `voitures` (`immatriculation`, `modele`, `kilometrage`, `carburant`, `etat`, `nbre_place`, `nbre_porte`, `couleur`, `annee_cirulation`, `marque`) VALUES
('12 TU 2000', 'Golf 7r', 20000, 'disesel', 'bon', 5, 5, 'gris', '2019-11-21', 0),
('16 RU 400', 'clio V', 9000, 'essence', 'très bon', 5, 5, 'bleu', '2021-12-01', 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`code_client`) REFERENCES `clients` (`code_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD CONSTRAINT `reparations_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
