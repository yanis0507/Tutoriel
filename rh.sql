-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 13 Décembre 2022 à 15:30
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `rh`
--

-- --------------------------------------------------------

--
-- Structure de la table `employes`
--

CREATE TABLE IF NOT EXISTS `employes` (
  `no_emp` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `sexe` varchar(20) NOT NULL,
  `salaire` int(11) NOT NULL,
  `type_contrat` varchar(20) NOT NULL,
  `fonction` varchar(20) NOT NULL,
  `site` varchar(20) NOT NULL,
  `date_embauche` date NOT NULL,
  `date_naissance` date NOT NULL,
  `nom_service` int(11) NOT NULL,
  PRIMARY KEY (`no_emp`),
  KEY `nom_service` (`nom_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `employes`
--


-- --------------------------------------------------------

--
-- Structure de la table `intervenir`
--

CREATE TABLE IF NOT EXISTS `intervenir` (
  `numinterv` int(11) NOT NULL,
  `noprojet` int(11) NOT NULL,
  `no_employer` int(11) NOT NULL,
  `nbheures` int(11) NOT NULL,
  PRIMARY KEY (`numinterv`),
  KEY `no_employer` (`no_employer`),
  KEY `noprojet` (`noprojet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `intervenir`
--


-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `nom_projet` int(11) NOT NULL,
  `libelleprojet` varchar(20) NOT NULL,
  `nom_service` int(11) NOT NULL,
  PRIMARY KEY (`nom_projet`),
  KEY `nom_service_2` (`nom_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `projet`
--


-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `numero_service` int(11) NOT NULL,
  `nom_service` varchar(20) NOT NULL,
  PRIMARY KEY (`numero_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`numero_service`, `nom_service`) VALUES
(35, 'etage1'),
(45, 'etage2');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `employes`
--
ALTER TABLE `employes`
  ADD CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`nom_service`) REFERENCES `service` (`numero_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervenir`
--
ALTER TABLE `intervenir`
  ADD CONSTRAINT `intervenir_ibfk_2` FOREIGN KEY (`noprojet`) REFERENCES `projet` (`nom_projet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `intervenir_ibfk_1` FOREIGN KEY (`no_employer`) REFERENCES `employes` (`no_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`nom_service`) REFERENCES `service` (`numero_service`) ON DELETE CASCADE ON UPDATE CASCADE;
