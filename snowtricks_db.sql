-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 13 jan. 2023 à 09:25
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(23, 'Ok...', 1, '2023-01-08 18:26:20', 98, 39),
(24, 'vdfff', 1, '2023-01-12 01:35:05', 92, 39),
(25, 'vdfff', 1, '2023-01-12 01:35:06', 92, 39),
(26, '?????????????', 1, '2023-01-12 01:35:15', 92, 39),
(27, '?', 1, '2023-01-12 12:54:03', 110, 39),
(28, '!!!', 1, '2023-01-12 15:37:55', 110, 39);

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(38, 99, '63bf540a0490c.webp'),
(39, 109, '63bff57309309.jpg'),
(40, 109, '63bff5730a77f.jpg'),
(41, 109, '63bff5730ab09.jpg'),
(47, 109, '63bff5dac34b3.jpg'),
(48, 109, '63bff5dac494b.jpg'),
(52, 110, '63c029858ebf0.jpg'),
(53, 110, '63c029858ee5b.jpg'),
(54, 110, '63c029858f0f6.jpg'),
(55, 111, '63c02aa79cb18.jpg'),
(56, 111, '63c02aa79df84.jpg'),
(57, 111, '63c02aa79e353.jpg'),
(58, 92, '63c035ea298c4.jpg'),
(59, 92, '63c035ea2ad40.jpg'),
(60, 92, '63c035ea2b0fd.jpg');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Niveau 1', 'Facile', '63c01c5974f43.png'),
(2, 'Niveau 2', 'Facile', '63bb104aaec63.png'),
(3, 'Niveau 3', 'Moyen', '63bb1052680bf.png'),
(4, 'Niveau 4', 'Moyen', '63bb10107b08a.png'),
(5, 'Niveau 5', 'dvdfvfd', '63bb10584e238.png'),
(8, 'Niveau 7', 'dfbdfb', '63c01cd6f0f50.png'),
(11, 'Niveau 8', 'sdvdvdf', '63c01ce377520.png'),
(12, 'Niveau 9', 'Difficile', '63c01ceec9625.png'),
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
(1, 92),
(1, 93),
(1, 96),
(1, 98),
(1, 116),
(2, 93),
(2, 107),
(2, 117),
(3, 93),
(3, 98),
(3, 116),
(3, 118),
(4, 92),
(4, 110),
(5, 107),
(5, 108),
(5, 118),
(8, 96),
(8, 107),
(8, 110),
(11, 92),
(11, 93),
(12, 92),
(12, 107),
(12, 108),
(13, 92),
(13, 96),
(13, 118);

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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trick`
--

INSERT INTO `trick` (`id`, `name`, `creation_date`, `description`, `video`) VALUES
(92, 'Trick 1', '2023-01-12 16:31:38', 'This is my description dscsdcdcsddscsdcdsblkdfkvjbdfkvjbdkjvbdskvjbkj <br><br><br> Test', 'oq6h7AI57_0'),
(93, 'Trick 2', '2023-01-08 19:31:31', NULL, '8KotvBY28Mo'),
(96, 'Trick 5', '2023-01-04 22:56:29', NULL, NULL),
(97, 'Trick 6', '2023-01-04 22:57:11', NULL, NULL),
(98, 'Trick 7', '2023-01-06 19:01:00', NULL, NULL),
(99, 'Trick 8', '2023-01-12 15:42:34', NULL, 'sdvsdv'),
(100, 'Trick 10', '2023-01-07 01:02:56', NULL, NULL),
(102, 'Trick 12', '2023-01-07 12:08:15', NULL, NULL),
(106, 'Trick 13', '2023-01-07 12:31:59', NULL, NULL),
(107, 'Trick 14', '2023-01-07 12:42:18', NULL, NULL),
(108, 'Trick 15', '2023-01-07 13:38:34', 'Add description to trick 15', NULL),
(109, 'Trick 16', '2023-01-12 11:58:38', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Qui deleniti voluptatem amet sapiente ullam voluptas delectus, quia ipsa consequatur aliquam expedita explicabo, praesentium deserunt! Porro amet animi voluptatum perspiciatis. Veritatis!\r\n\r\nLorem ipsum dolor sit amet consectetur adipisicing elit. Quae corrupti, officiis veniam quasi, minima recusandae pariatur qui accusamus adipisci, facere maiores culpa labore animi hic consectetur. Distinctio animi accusantium perferendis.</p>\r\n			<br>\r\n			<p>Quod odio praesentium similique numquam fugit, blanditiis mollitia exercitationem dolorem cum officia voluptatum magnam reiciendis perferendis quibusdam repellendus adipisci eum maiores sint doloribus officiis molestias nemo distinctio. Cum, non natus.</p>', ''),
(110, 'Trick 17', '2023-01-12 15:38:45', 'dsvsdsdvsvddvv', ''),
(111, 'Trick 18', '2023-01-12 15:43:35', 'Test', 'https://youtu.be/oq6h7AI57_0'),
(112, 'Trick 19', '2023-01-12 15:46:28', 'dscsdc', 'https://youtu.be/oq6h7AI57_0'),
(113, 'Trick 19', '2023-01-12 15:46:49', 'dscsdc', 'https://youtu.be/oq6h7AI57_0'),
(114, 'Trick 19', '2023-01-12 15:46:51', 'dscsdc', 'https://youtu.be/oq6h7AI57_0'),
(115, 'Trick 19', '2023-01-12 15:46:58', 'dscsdc', 'https://youtu.be/oq6h7AI57_0'),
(116, 'Trick 19', '2023-01-12 16:11:28', NULL, 'aPhYdeitDtA'),
(117, 'Trick 20', '2023-01-12 16:15:42', 'Bla bla bla...', '_OMar04NRZw'),
(118, 'Trick 21', '2023-01-12 17:05:47', NULL, 'fbqHK8i-HdA');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(39, 'admin@admin.com', '{\"1\": \"ROLE_USER\", \"2\": \"ROLE_EDITOR\", \"3\": \"ROLE_ADMIN\"}', '$2y$13$c1uI0SoKnul3MgEkuVMp9uCsntTPgjrJsgBeidHBoMHc5SpMDCiLK'),
(40, 'user@user.com', '{\"3\": \"ROLE_USER\"}', '$2y$13$Cyf4Q3HAoVLxN4sL8I6K5OQKgGg2LETdwKrb7luCTn.DkVPX8JNYu'),
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
