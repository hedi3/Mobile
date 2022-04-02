-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : Dim 16 mai 2021 à 20:40
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `databasepi`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C35F0816A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`id`, `user_id`, `name`, `firstname`, `lastname`, `adress`, `postal`, `ville`, `phone`) VALUES
(1, 1, 'tunis', 'ayadi', 'malek', 'jkhkj', '020', 'tunis', '5555555556'),
(2, 1, 'tunis', 'ayadi', 'malek', 'jkhkj', '020', 'tunis', '5555555556');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, '1:Restaurant'),
(2, '2:Caffee'),
(13, '3:Evenements'),
(14, 'm');

-- --------------------------------------------------------

--
-- Structure de la table `centres`
--

DROP TABLE IF EXISTS `centres`;
CREATE TABLE IF NOT EXISTS `centres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` blob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `centres`
--

INSERT INTO `centres` (`id`, `nom`, `lieu`, `description`, `image`) VALUES
(7, 'moie', 'kjnciu', 'oecuz', NULL),
(2, 'loi', 'lnkj', 'ttt', NULL),
(3, 'loi', 'lnkj', 'ttt', NULL),
(5, 'malek', 'test1', 'test1', NULL),
(6, 'fdyj', 'td', 'fdj', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `total` double NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `idUser`, `description`, `total`, `status`) VALUES
(1, 9, '', 2860, 'delivered'),
(2, 9, 'azertyui', 1430, 'delivered');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `forum_id`, `author`, `content`, `created_at`) VALUES
(3, 4, NULL, 'this is a testttttttttttttttt', '2021-03-31 14:47:53'),
(4, 4, NULL, 'sdfgsfysudsfhdyufyud', '2021-04-01 09:47:27'),
(5, 4, NULL, 'waaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2021-04-19 21:07:45'),
(6, 5, NULL, 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', '2021-04-19 23:08:12');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210307094256', '2021-03-07 09:43:02', 574);

-- --------------------------------------------------------

--
-- Structure de la table `forum`
--

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `forum`
--

INSERT INTO `forum` (`id`, `name`, `email`, `description`, `image`) VALUES
(5, 'klfv', 'male@esl.com', 'lkefsnbv', 'c6c7140c1550807387579a31994384f8.jpg'),
(4, 'forum1', 'melek.ayadi420@gmail.com', 'testtesttesttesttest', 'dd50c6109255d92d68d7c4e12eb62c45.png'),
(6, 'malek', '1234', '1224', 'IMG_0514.JPG'),
(7, '78', '87', '887', 'IMG_0514.JPG'),
(8, 'feres', 'feres', 'feres', 'IMG_0514.JPG'),
(9, '123', '123', '456', 'IMG_0514.JPG');

-- --------------------------------------------------------

--
-- Structure de la table `guest`
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE IF NOT EXISTS `guest` (
  `room_ID` int(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `Nationality` varchar(50) NOT NULL,
  `passport_Number` varchar(50) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `Card_Number` varchar(50) NOT NULL,
  `card_Pass` varchar(50) NOT NULL,
  `number_Of_Days` int(10) NOT NULL,
  `fees` double NOT NULL,
  PRIMARY KEY (`passport_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `guest`
--

INSERT INTO `guest` (`room_ID`, `Name`, `Email`, `Address`, `city`, `Nationality`, `passport_Number`, `phoneNo`, `Card_Number`, `card_Pass`, `number_Of_Days`, `fees`) VALUES
(1, 'aziz', 'mohamedaziz.bensmida@esprit.tn', 'cite khadhra', 'tunis', 'tunisian', '111-222-333', '50158932', '123', '456', 1, 200);

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomhotel` varchar(255) NOT NULL,
  `site_web` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`id`, `nomhotel`, `site_web`, `email`, `telephone`, `adresse`, `description`) VALUES
(1, 'test', 'http://jhv', 'jj@hh.ll', '44444444', 'vbn,;', 'hjbkn'),
(2, 'test', 'http://test', 'test@gmail.com', '78979787', 'kf vk', 'kefbvk');

-- --------------------------------------------------------

--
-- Structure de la table `materiels`
--

DROP TABLE IF EXISTS `materiels`;
CREATE TABLE IF NOT EXISTS `materiels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `prix_jour` float NOT NULL,
  `disponibilite` tinyint(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `materiels`
--

INSERT INTO `materiels` (`id`, `type`, `description`, `prix_jour`, `disponibilite`, `image`, `date_debut`, `date_fin`) VALUES
(2, 'mer', 'baguette de peche', 78.2, 0, 'canapeche.jpg', '2021-03-29 00:00:00', '2021-03-31 00:00:00'),
(3, 'montagne', 'tente', 80, 1, 'tente.jpg', '2021-03-01 00:00:00', '2021-03-19 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_price` double DEFAULT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci,
  `is_paid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `idUser` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `is_paid`, `total`, `status`, `idUser`, `description`) VALUES
(27, 1, '2021-03-10 21:03:03', NULL, NULL, NULL, 'delivered', 0, 'delivered', 0, NULL),
(34, 3, '2021-03-10 22:07:35', NULL, NULL, NULL, 'delivered', 0, 'delivered', 0, NULL),
(38, 1, '2021-03-11 08:13:17', NULL, NULL, NULL, 'delivered', 0, 'delivered', 0, NULL),
(39, 4, '2021-03-12 09:43:58', NULL, NULL, NULL, 'delivered', 0, 'delivered', 0, NULL),
(40, 1, '2021-03-18 12:24:14', NULL, NULL, NULL, 'En cours', 0, 'pending', 0, NULL),
(41, 5, '2021-03-28 11:34:12', NULL, NULL, NULL, 'delivered', 0, 'delivered', 0, NULL),
(42, 5, '2021-03-29 14:20:18', NULL, NULL, NULL, 'delivered', 0, 'delivered', 0, NULL),
(43, 7, '2021-04-01 05:41:11', NULL, NULL, NULL, 'delivered', 0, 'delivered', 0, NULL),
(44, 7, '2021-04-13 21:50:44', NULL, NULL, NULL, 'delivered', 0, 'delivered', 0, NULL),
(45, 5, '2021-04-13 21:51:39', NULL, NULL, NULL, 'delivered', 0, 'delivered', 0, NULL),
(51, 7, '2021-04-24 20:45:56', NULL, NULL, NULL, 'delivered', NULL, 'delivered', NULL, NULL),
(56, 5, '2021-04-28 11:37:07', NULL, NULL, NULL, 'delivered', NULL, 'delivered', NULL, NULL),
(57, 5, '2021-04-29 08:46:53', NULL, NULL, NULL, 'delivered', NULL, 'delivered', NULL, NULL),
(58, 5, '2021-05-02 21:46:52', NULL, NULL, NULL, 'En cours', NULL, 'pending', NULL, NULL),
(59, 5, '2021-05-11 22:21:48', NULL, NULL, NULL, 'En cours', NULL, 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `my_order_id` int(11) DEFAULT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` double DEFAULT NULL,
  `total` double NOT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `idOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845CA2C1BFCDF877` (`my_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`, `idProduct`, `idOrder`) VALUES
(36, 27, '716', 2, 20, 40, 0, 0),
(43, 34, 'CupWay Coffee', 4, 10, 40, 0, 0),
(48, 38, 'Pasta Cosi', 2, 100, 200, 0, 0),
(49, 38, '716', 1, 20, 20, 0, 0),
(50, 39, 'Go Sushi', 3, 7, 21, 0, 0),
(51, 40, 'Go Sushi', 2, 7, 14, 0, 0),
(52, 41, 'Go Sushi', 2, 50, 100, 0, 0),
(53, 41, 'Pasta Cosi', 1, 50, 50, 0, 0),
(54, 42, 'Go Sushi', 2, 50, 100, 0, 0),
(55, 43, 'Go Sushi', 2, 50, 100, 0, 0),
(56, 44, 'Go Sushi', 2, 50, 100, 0, 0),
(57, 45, 'Go Sushi', 1, 50, 50, 0, 0),
(90, 51, '716', 3, 40, 120, NULL, NULL),
(103, 56, '716', 3, 40, 120, NULL, NULL),
(104, 57, '716', 7, 40, 280, NULL, NULL),
(105, 58, '716', 8, 40, 320, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lon` decimal(10,8) DEFAULT NULL,
  `idCategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `image`, `subtitle`, `prix`, `description`, `lat`, `lon`, `idCategory`) VALUES
(54, NULL, 'testupdatejson22', 'c://abc', 'malek', 123, 'abv', '1.00000000', '1.00000000', NULL),
(63, NULL, 'new', 'new', 'new', 15, 'ib', '14.02500000', '80.00000000', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vol_id` int(11) NOT NULL,
  `cin` int(11) NOT NULL,
  `date_v` date NOT NULL,
  `num_p` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id`, `vol_id`, `cin`, `date_v`, `num_p`, `email`) VALUES
(2, 3, 12345678, '2021-03-31', 12345678, 'melek.ayadi420@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `roomID` int(10) NOT NULL AUTO_INCREMENT,
  `room_Type` varchar(15) NOT NULL,
  `room_capacity` varchar(15) NOT NULL,
  `Check_In_Date` date NOT NULL,
  `Check_Out_Date` date NOT NULL,
  `isEmpty` tinyint(1) NOT NULL,
  PRIMARY KEY (`roomID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `room`
--

INSERT INTO `room` (`roomID`, `room_Type`, `room_capacity`, `Check_In_Date`, `Check_Out_Date`, `isEmpty`) VALUES
(1, 'VIP', 'Triple', '2021-04-18', '2021-04-19', 1),
(5, 'Economy', 'Single', '2021-04-18', '2021-04-25', 1),
(10, 'Normal', 'Double', '2021-04-25', '2021-04-25', 1),
(11, 'Vip', 'Triple', '2021-04-18', '2021-04-25', 1),
(12, 'Economy', 'Double', '2021-04-25', '2021-04-25', 1),
(14, 'Economy', 'Triple', '2021-04-20', '2021-04-25', 1),
(15, 'Normal', 'Single', '2021-04-20', '2021-04-25', 1),
(16, 'Normal', 'Double', '2021-04-18', '2021-04-19', 1),
(20, 'Economy', 'Single', '2021-04-25', '2021-04-25', 1),
(21, 'Economy', 'Double', '2021-04-29', '2021-05-06', 1),
(23, 'Economy', 'Triple', '2021-04-29', '2021-04-08', 1),
(24, 'Normal', 'Single', '2021-04-29', '2021-05-06', 1),
(25, 'Normal', 'Double', '2021-04-29', '2021-05-06', 1),
(26, 'Normal', 'Triple', '2021-04-25', '2021-04-25', 1),
(27, 'VIP', 'Normal', '2021-04-29', '2021-05-06', 1),
(28, 'VIP', 'Double', '2021-04-29', '2021-05-06', 1),
(29, 'VIP', 'Triple', '2021-04-29', '2021-05-06', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `code`, `role`, `image`) VALUES
(1, 'malek.ayadi@esprit.tn', '[]', '$argon2id$v=19$m=65536,t=4,p=1$SjY3WDlMQ1psMzFFZXRMZQ$VEu0TtM6Zy9OskiFdHRxqlN7EI3mjAM0cw8BKEiQ6cA', 'malek', 'ayadi', NULL, '', NULL),
(2, 'jabobos321@nobitcoin.net', '[]', '$argon2id$v=19$m=65536,t=4,p=1$TjRwRWRwbzI0eTFacy9IQw$SKn2PdZ0XutC0lFebX//QAWAsOExfUjx9gQBtL8s0CM', 'test1', 'test2', NULL, '', NULL),
(3, 'mohamedaziz.bensmida@esprit.tn', '[]', '$argon2id$v=19$m=65536,t=4,p=1$MTg2Z1VYRS5aQkl4RXFqUg$7k5US1lVcPNlybhgg65nighMmplxxYZSR/diPjU61Ws', 'mohamedaziz', 'bensmida', NULL, '', NULL),
(4, 'sami.ammar@esprit.tn', '[]', '$argon2id$v=19$m=65536,t=4,p=1$ZEZ2R3MxVFJjOXFJSFFBMQ$GeCnAfdyqIuh48TUTuzmHkNWDX1ujmO2zd724Z+xq7Y', 'sami', 'ammar', NULL, '', NULL),
(5, 'melek.ayadi420@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$YURZajZIYjFiUWgwSENFSw$bazwJBDAO101FrxjsBAuXSorV/5kvzKYdSE++SBkGmg', 'melek', 'ayadi', NULL, 'admin', NULL),
(6, 'mm@esprit.tn', '[]', '$argon2id$v=19$m=65536,t=4,p=1$cXY3WkFSaU1paDl4YTdzYw$P7ZsZTtISBe4X4uBo/++JTNeAHbzxloqlGrsvBJk/ME', 'abc', 'def', NULL, '', NULL),
(7, 'ABB@ESPRIT.TN', '[]', '$argon2id$v=19$m=65536,t=4,p=1$QlNwLldzbWtpb29QOG9rRQ$7Pe3wv1wYLJUZSXi+WvAg9ULTze5/0dHJhCT1W5ME2g', 'ABBBB', 'ABBBB', NULL, 'client', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

DROP TABLE IF EXISTS `voiture`;
CREATE TABLE IF NOT EXISTS `voiture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marque` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `couleur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diponibilite` tinyint(1) NOT NULL,
  `serie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prix` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `voiture`
--

INSERT INTO `voiture` (`id`, `marque`, `model`, `couleur`, `diponibilite`, `serie`, `prix`, `image`, `updated_at`) VALUES
(34, 'seat', 'ibiza', 'rouge', 0, '221tun1113', 80, 'logo_690x405_turbo_seat_ibiza.png', NULL),
(35, 'volkswagen', 'golf 7', 'jaune', 1, '221tun1114', 120, 'inline-22941.jpg', NULL),
(36, 'mercedes', 'classe c', 'blanc', 1, '221tun1115', 600, 'Mercedes-Benz_C-Class_W205_63_AMG_S_01_China_2016-04-14.jpg', '2021-03-27 11:18:42'),
(37, 'mercedes', 'classe e', 'gris', 1, '142tun1116', 500, 'mercedes.jfif', NULL),
(38, 'Bmw', '320i (G20)', 'gris', 1, '221tun1117', 500, '46240.webp', NULL),
(39, 'Bmw', 'x3', 'bleu', 1, '221tun1118', 600, '46363.webp', NULL),
(40, 'audi', 'a4 avant', 'nardo grey', 1, '221tun1119', 500, 'maxresdefault.jpg', NULL),
(41, 'peugeot', '208', 'bleu', 1, '222tun1000', 80, 'téléchargé (1).jfif', '2021-03-30 15:31:50'),
(42, 'volkswagen', 'polo vi', 'gris limestone', 1, '221tun2222', 80, 'CARDIFF_PREMIUMAUTOSTORE_e8f0fghhs_1.jpg', '2021-03-30 15:28:38'),
(43, 'seat', 'leon', 'rouge', 1, '223tun0001', 150, '1200px-SEAT_Leon_Mk4_IMG_3445.jpg', '2021-03-30 15:32:54'),
(44, 'cherry', 'tiggo 2', 'orange', 1, '220tun1211', 80, 'téléchargé.jfif', '2021-03-30 15:34:07'),
(46, 'abcd', 'vvvv', 'jksbck', 1, '4069tun152', 450, '716.jfif', '2021-03-31 13:19:16'),
(47, 'volkswagenn', 'golff', 'rouge', 0, '4069tun152', 5, '716 image.jpg', '2021-03-31 13:22:58'),
(48, 'kia', 'Rio', '0xffffffff', 1, '152tun4069', 100, '94x94.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `voiture_louee`
--

DROP TABLE IF EXISTS `voiture_louee`;
CREATE TABLE IF NOT EXISTS `voiture_louee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datedebut` date NOT NULL,
  `datefin` date NOT NULL,
  `serie` varchar(255) NOT NULL,
  `clientid` int(11) NOT NULL,
  `voiture_id` int(11) NOT NULL,
  `prix` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `voiture_louee`
--

INSERT INTO `voiture_louee` (`id`, `datedebut`, `datefin`, `serie`, `clientid`, `voiture_id`, `prix`) VALUES
(3, '2021-03-31', '2016-01-01', '4069tun152', 1, 47, NULL),
(2, '2021-03-31', '2026-01-01', '4069tun152', 1, 1, NULL),
(4, '2021-04-01', '2016-01-01', '221tun1113', 1, 34, NULL),
(5, '2021-04-11', '2016-01-01', '221tun1113', 1, 34, NULL),
(6, '2021-04-28', '2021-04-29', '4069tun152', 1, 47, 5);

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

DROP TABLE IF EXISTS `vol`;
CREATE TABLE IF NOT EXISTS `vol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_v` int(11) NOT NULL,
  `aero_d` varchar(255) NOT NULL,
  `aero_a` varchar(255) NOT NULL,
  `date_d` date NOT NULL,
  `date_a` date NOT NULL,
  `prix` double NOT NULL,
  `brochure_filename` varchar(255) NOT NULL,
  `place_d` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`id`, `id_v`, `aero_d`, `aero_a`, `date_d`, `date_a`, `prix`, `brochure_filename`, `place_d`) VALUES
(3, 2, '2', '2', '2021-03-31', '2021-03-31', 2, '716image-60647e79b88c9.jpg', 1),
(4, 9, 'tunis carthage', 'lkdsnv', '2021-03-26', '2021-03-31', 1200, '716manu-606482374e7bc.jpg', 150),
(5, 6, 'italy', 'tunis', '2021-04-01', '2021-04-01', 1000, '716-6065960c05a6f.jpg', 600);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `FK_C35F0816A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
