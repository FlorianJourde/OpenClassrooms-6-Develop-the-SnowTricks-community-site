-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 08 jan. 2023 à 19:59
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
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CB281BE2E` (`trick_id`),
  KEY `IDX_9474526CA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `content`, `status`, `creation_date`, `trick_id`, `user_id`) VALUES
(1, 'Hello !', 1, '2022-12-31 00:30:27', 93, 39),
(2, 'Hello !', 1, '2022-12-31 00:31:29', 93, 40),
(3, 'Pardon ?', 1, '2022-12-31 00:31:52', 93, 39),
(5, '???', 1, '2023-01-03 21:26:40', 92, 39),
(8, '!', 1, '2023-01-07 00:59:28', 93, 40),
(10, '!!!', 1, '2023-01-07 02:50:47', 92, 40),
(11, 'Test', 1, '2023-01-07 02:52:24', 92, 40),
(14, '!!!!!', 1, '2023-01-07 02:56:36', 92, 41),
(15, '!!!!', 1, '2023-01-07 12:47:02', 92, 39),
(17, '?!', 1, '2023-01-07 13:23:17', 92, 41),
(18, 'Add comment to trick 15', 1, '2023-01-07 13:38:53', 108, 41),
(19, '???', 1, '2023-01-07 18:00:34', 106, 41),
(20, 'ddd', 1, '2023-01-08 17:02:32', 92, 41),
(21, 'sdcds', 1, '2023-01-08 18:19:39', 102, 39),
(22, 'Sympaaa !', 1, '2023-01-08 18:20:54', 98, 39),
(23, 'Ok...', 1, '2023-01-08 18:26:20', 98, 39);

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
('DoctrineMigrations\\Version20230106142406', '2023-01-06 14:24:34', 93),
('DoctrineMigrations\\Version20230107133407', '2023-01-07 13:34:20', 104),
('DoctrineMigrations\\Version20230107180054', '2023-01-07 18:01:03', 31),
('DoctrineMigrations\\Version20230107180920', '2023-01-07 18:09:24', 49),
('DoctrineMigrations\\Version20230107181755', '2023-01-07 18:18:02', 35),
('DoctrineMigrations\\Version20230107194513', '2023-01-07 19:45:29', 79),
('DoctrineMigrations\\Version20230107195139', '2023-01-07 19:51:57', 58),
('DoctrineMigrations\\Version20230108180906', '2023-01-08 18:09:11', 120),
('DoctrineMigrations\\Version20230108181302', '2023-01-08 18:13:08', 103),
('DoctrineMigrations\\Version20230108190704', '2023-01-08 19:07:10', 86),
('DoctrineMigrations\\Version20230108194334', '2023-01-08 19:43:41', 40);

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `trick_id`, `name`) VALUES
(2, 99, '63b8602e87c73.jpg'),
(3, 99, '63b8602e88ec9.jpg'),
(14, 98, '63b86fdf8fbcd.jpg'),
(15, 98, '63b86fecaa88b.jpg'),
(19, 100, '63b8bc0666326.jpg'),
(20, 100, '63b8c4c015d81.jpg'),
(23, 102, '63b960af9ea34.jpg'),
(29, 106, '63b9663fe71a4.jpg'),
(32, 107, '63b968916a081.jpg'),
(33, 107, '63b968aa69913.jpg'),
(34, 107, '63b968aa6aefa.jpg'),
(35, 107, '63b968aa6b242.jpg'),
(36, 108, '63b975daf26b8.jpg'),
(37, 92, '63bb1a43e8246.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:30:\\\"reset_password/email.html.twig\\\";i:1;N;i:2;a:1:{s:10:\\\"resetToken\\\";O:58:\\\"SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\\":4:{s:65:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0token\\\";s:40:\\\"j1urbCrarGJx240Hx3eA9jJejcQtRMmXScGPgULB\\\";s:69:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0expiresAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2023-01-08 20:52:29.030902\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:71:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0generatedAt\\\";i:1673207549;s:73:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0transInterval\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"jourdeflorian@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:8:\\\"Mail Bot\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"jourdeflorian@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:27:\\\"Your password reset request\\\";s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-01-08 19:52:29', '2023-01-08 19:52:29', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `specificity`
--

DROP TABLE IF EXISTS `specificity`;
CREATE TABLE IF NOT EXISTS `specificity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specificity`
--

INSERT INTO `specificity` (`id`, `name`, `description`, `icon`) VALUES
(1, 'Niveau 1', 'Facile', '63bb10402c951.png'),
(2, 'Niveau 2', 'Facile', '63bb104aaec63.png'),
(3, 'Niveau 3', 'Moyen', '63bb1052680bf.png'),
(4, 'Niveau 4', 'Moyen', '63bb10107b08a.png'),
(5, 'Niveau 5', 'dvdfvfd', '63bb10584e238.png'),
(8, 'Niveau 7', 'dfbdfb', '63b9bdb2e9da1.jpg'),
(11, 'Niveau 8', 'sdvdvdf', '63b9ce2f15e09.jpg'),
(12, 'Niveau 9', 'Difficile', '63baf73e8f7aa.jpg'),
(13, 'Niveau 9', 'Description', '63bb0c8b425d1.png');

-- --------------------------------------------------------

--
-- Structure de la table `specificity_trick`
--

DROP TABLE IF EXISTS `specificity_trick`;
CREATE TABLE IF NOT EXISTS `specificity_trick` (
  `specificity_id` int(11) NOT NULL,
  `trick_id` int(11) NOT NULL,
  PRIMARY KEY (`specificity_id`,`trick_id`),
  KEY `IDX_BDC251155F69A929` (`specificity_id`),
  KEY `IDX_BDC25115B281BE2E` (`trick_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specificity_trick`
--

INSERT INTO `specificity_trick` (`specificity_id`, `trick_id`) VALUES
(1, 93),
(1, 96),
(1, 98),
(2, 93),
(3, 93),
(3, 98),
(5, 108),
(11, 92),
(11, 93),
(12, 92),
(12, 108),
(13, 92);

-- --------------------------------------------------------

--
-- Structure de la table `trick`
--

DROP TABLE IF EXISTS `trick`;
CREATE TABLE IF NOT EXISTS `trick` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trick`
--

INSERT INTO `trick` (`id`, `name`, `creation_date`, `description`, `video`) VALUES
(92, 'Trick 1', '2023-01-08 19:37:15', 'This is my description dscsdcdcsddscsdcdsblkdfkvjbdfkvjbdkjvbdskvjbkj', 'JCjmmlvVnc8'),
(93, 'Trick 2', '2023-01-08 19:31:31', NULL, '8KotvBY28Mo'),
(96, 'Trick 5', '2023-01-04 22:56:29', NULL, NULL),
(97, 'Trick 6', '2023-01-04 22:57:11', NULL, NULL),
(98, 'Trick 7', '2023-01-06 19:01:00', NULL, NULL),
(99, 'Trick 8', '2023-01-06 17:53:50', NULL, NULL),
(100, 'Trick 10', '2023-01-07 01:02:56', NULL, NULL),
(102, 'Trick 12', '2023-01-07 12:08:15', NULL, NULL),
(106, 'Trick 13', '2023-01-07 12:31:59', NULL, NULL),
(107, 'Trick 14', '2023-01-07 12:42:18', NULL, NULL),
(108, 'Trick 15', '2023-01-07 13:38:34', 'Add description to trick 15', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_9474526CB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045FB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `specificity_trick`
--
ALTER TABLE `specificity_trick`
  ADD CONSTRAINT `FK_BDC251155F69A929` FOREIGN KEY (`specificity_id`) REFERENCES `specificity` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BDC25115B281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
