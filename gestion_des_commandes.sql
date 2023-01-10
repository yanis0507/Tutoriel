-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 10 Janvier 2023 à 14:49
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gestion_des_commandes`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `num_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(20) NOT NULL,
  `cat_reference` varchar(20) NOT NULL,
  `cat_remise` varchar(20) NOT NULL,
  `produit_ref` varchar(20) NOT NULL,
  PRIMARY KEY (`num_categorie`),
  KEY `produit_ref` (`produit_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`num_categorie`, `nom_categorie`, `cat_reference`, `cat_remise`, `produit_ref`) VALUES
(1, 'multimedia', '1234', '25', 'AB123'),
(2, 'electromenager', '5678', '30', 'CD456'),
(3, 'librairie', '879', '35', 'EF7890');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `client_id` int(11) NOT NULL,
  `client_civilite` varchar(20) NOT NULL,
  `client_nom` varchar(20) NOT NULL,
  `client_prenom` varchar(20) NOT NULL,
  `client_dep` int(11) NOT NULL,
  `client_ville` varchar(20) NOT NULL,
  `num_telephone` int(11) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`client_id`, `client_civilite`, `client_nom`, `client_prenom`, `client_dep`, `client_ville`, `num_telephone`) VALUES
(12345, 'homme', 'igoudjil ', 'yanis', 95100, 'Argenteuil', 620002269),
(20489, 'homme', 'libolo', 'karim', 92300, 'colombes', 932328125),
(67890, 'femme', 'blanchard', 'alicia', 94000, 'creteil', 618865702);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `com_num` int(11) NOT NULL,
  `com_client` int(11) NOT NULL,
  `com_date` date NOT NULL,
  `com_montant` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `produit_ref` varchar(20) NOT NULL,
  PRIMARY KEY (`com_num`),
  KEY `client_id` (`client_id`),
  KEY `produit_ref` (`produit_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`com_num`, `com_client`, `com_date`, `com_montant`, `client_id`, `produit_ref`) VALUES
(145, 11, '2023-01-09', 100, 12345, 'AB123'),
(456, 21, '2022-01-20', 20, 20489, 'EF7890'),
(679, 22, '2023-01-09', 200, 67890, 'CD456');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE IF NOT EXISTS `produits` (
  `produit_ref` varchar(20) NOT NULL,
  `produit_nom` varchar(20) NOT NULL,
  `produit_prix` int(11) NOT NULL,
  `produit_poids` int(11) NOT NULL,
  `produit_vues` int(11) NOT NULL,
  `produit_stock` int(11) NOT NULL,
  `produit_code` int(11) NOT NULL,
  `num_categorie` int(11) NOT NULL,
  PRIMARY KEY (`produit_ref`),
  KEY `num_categorie` (`num_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`produit_ref`, `produit_nom`, `produit_prix`, `produit_poids`, `produit_vues`, `produit_stock`, `produit_code`, `num_categorie`) VALUES
('AB123', 'ordinateur', 9000, 2, 10000, 4000, 101, 1),
('CD456', 'friteuse', 200, 5, 500, 7000, 1111, 2),
('EF7890', 'comment danser pour ', 20, 1, 100, 90, 0, 3);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`produit_ref`) REFERENCES `produits` (`produit_ref`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`num_categorie`) REFERENCES `categorie` (`num_categorie`) ON DELETE CASCADE ON UPDATE CASCADE;
