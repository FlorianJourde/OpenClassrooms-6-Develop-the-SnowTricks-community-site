-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 07 jan. 2023 à 13:24
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `snowtricks_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creation_date` datetime NOT NULL,
  `trick_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CB281BE2E` (`trick_id`),
  KEY `IDX_9474526C727ACA70` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `content`, `status`, `creation_date`, `trick_id`, `parent_id`) VALUES
(1, 'Hello !', 1, '2022-12-31 00:30:27', 93, NULL),
(2, 'Hello !', 1, '2022-12-31 00:31:29', 93, NULL),
(3, 'Pardon ?', 1, '2022-12-31 00:31:52', 93, NULL),
(5, '???', 1, '2023-01-03 21:26:40', 92, NULL),
(8, '!', 1, '2023-01-07 00:59:28', 93, NULL),
(10, '!!!', 1, '2023-01-07 02:50:47', 92, NULL),
(11, 'Test', 1, '2023-01-07 02:52:24', 92, NULL),
(14, '!!!!!', 1, '2023-01-07 02:56:36', 92, NULL),
(15, '!!!!', 1, '2023-01-07 12:47:02', 92, NULL),
(17, '?!', 1, '2023-01-07 13:23:17', 92, NULL);

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
('DoctrineMigrations\\Version20221216162719', '2022-12-16 16:27:41', 38),
('DoctrineMigrations\\Version20221216162953', '2022-12-16 16:30:08', 35),
('DoctrineMigrations\\Version20221220221335', '2022-12-20 22:13:49', 53),
('DoctrineMigrations\\Version20221220221733', '2022-12-20 22:18:20', 40),
('DoctrineMigrations\\Version20221220222135', '2022-12-20 22:21:41', 39),
('DoctrineMigrations\\Version20221220224214', '2022-12-20 22:42:24', 39),
('DoctrineMigrations\\Version20221223213659', '2022-12-23 21:37:08', 37),
('DoctrineMigrations\\Version20221223215032', '2022-12-23 21:50:48', 33),
('DoctrineMigrations\\Version20221223215149', '2022-12-23 21:59:59', 37),
('DoctrineMigrations\\Version20221230235837', '2022-12-30 23:58:48', 106),
('DoctrineMigrations\\Version20230106142406', '2023-01-06 14:24:34', 93);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trick_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C53D045FB281BE2E` (`trick_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `trick_id`, `name`) VALUES
(2, 99, '63b8602e87c73.jpg'),
(3, 99, '63b8602e88ec9.jpg'),
(14, 98, '63b86fdf8fbcd.jpg'),
(15, 98, '63b86fecaa88b.jpg'),
(16, 98, '63b86fecabef4.jpg'),
(19, 100, '63b8bc0666326.jpg'),
(20, 100, '63b8c4c015d81.jpg'),
(23, 102, '63b960af9ea34.jpg'),
(29, 106, '63b9663fe71a4.jpg'),
(30, 92, '63b9687a0ed8c.jpg'),
(32, 107, '63b968916a081.jpg'),
(33, 107, '63b968aa69913.jpg'),
(34, 107, '63b968aa6aefa.jpg'),
(35, 107, '63b968aa6b242.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trick`
--

DROP TABLE IF EXISTS `trick`;
CREATE TABLE IF NOT EXISTS `trick` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trick`
--

INSERT INTO `trick` (`id`, `name`, `creation_date`) VALUES
(92, 'Trick 1', '2023-01-07 12:41:30'),
(93, 'Trick 2', '2022-12-24 01:12:33'),
(96, 'Trick 5', '2023-01-04 22:56:29'),
(97, 'Trick 6', '2023-01-04 22:57:11'),
(98, 'Trick 7', '2023-01-06 19:01:00'),
(99, 'Trick 8', '2023-01-06 17:53:50'),
(100, 'Trick 10', '2023-01-07 01:02:56'),
(102, 'Trick 12', '2023-01-07 12:08:15'),
(106, 'Trick 13', '2023-01-07 12:31:59'),
(107, 'Trick 14', '2023-01-07 12:42:18');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(39, 'admin@admin.com', '{\"1\": \"ROLE_USER\", \"2\": \"ROLE_EDITOR\", \"3\": \"ROLE_ADMIN\"}', '$2y$13$c1uI0SoKnul3MgEkuVMp9uCsntTPgjrJsgBeidHBoMHc5SpMDCiLK'),
(40, 'user@user.com', '{\"1\": \"ROLE_USER\"}', '$2y$13$Cyf4Q3HAoVLxN4sL8I6K5OQKgGg2LETdwKrb7luCTn.DkVPX8JNYu'),
(41, 'editor@editor.com', '{\"0\": \"ROLE_USER\", \"2\": \"ROLE_EDITOR\"}', '$2y$13$kF815nzfGAr4KQ5.ZR/Z9enNUKofm4bEZJSQSUrhyEjPP0mBQYWGG');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `comment` (`id`),
  ADD CONSTRAINT `FK_9474526CB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045FB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
