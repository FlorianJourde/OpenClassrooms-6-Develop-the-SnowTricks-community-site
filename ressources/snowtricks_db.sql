-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 15 jan. 2023 à 01:25
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `content`, `status`, `creation_date`, `trick_id`, `user_id`) VALUES
(29, 'Impressionnant ! J\'espère le réussir un jour !', 1, '2023-01-13 12:41:49', 119, 40),
(30, 'Ça fait mal en compétition...', 1, '2023-01-13 12:44:04', 129, 40),
(31, 'Celui-ci, je le rentre !', 1, '2023-01-13 12:44:31', 128, 40),
(32, 'Ça a l\'air chaud !', 1, '2023-01-13 12:45:22', 123, 40),
(33, 'Un classique !', 1, '2023-01-13 12:45:45', 120, 40),
(34, 'Il n\'y a pas d\'image ?', 1, '2023-01-13 12:46:01', 125, 40),
(35, 'Peut-on vraiment appeler ceci une figure ? Je me pose la question..', 1, '2023-01-13 12:46:47', 121, 40),
(36, 'Je n\'en ai jamais vu un en vrai, il faut être solide sur les appuis !', 1, '2023-01-13 12:47:14', 127, 40),
(38, 'Non mais bon, ça fait partie du champ lexical du snow !', 1, '2023-01-13 12:50:01', 121, 41),
(40, 'Et moi dont !', 1, '2023-01-13 13:15:25', 119, 41);

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `trick_id`, `name`) VALUES
(61, 119, '63c12c3152f7d.jpg'),
(62, 119, '63c12d9e9601b.png'),
(63, 119, '63c12db03632c.jpg'),
(65, 119, '63c12db037ec1.jpg'),
(68, 120, '63c136aa8e1b3.webp'),
(69, 120, '63c136c3aab72.jpg'),
(70, 120, '63c136c3abcca.webp'),
(71, 121, '63c13ac61075f.jpg'),
(72, 121, '63c13ae5db8e2.jpg'),
(73, 122, '63c13bdba59fd.jpg'),
(74, 122, '63c13be8be30f.jpg'),
(75, 122, '63c13be8bf5f9.jpg'),
(76, 122, '63c13be8bf93a.jpg'),
(77, 123, '63c13cc7d98ad.jpg'),
(79, 123, '63c13ce9c5615.jpg'),
(80, 123, '63c13ce9c59d2.webp'),
(81, 123, '63c13d7f3e7e9.jpg'),
(82, 124, '63c13f3c06369.jpg'),
(83, 124, '63c13f6dd14ce.jpg'),
(84, 126, '63c14071924c1.webp'),
(85, 126, '63c14084a7fff.bin'),
(86, 126, '63c1409005312.jpg'),
(87, 126, '63c140a718dfb.bin'),
(88, 127, '63c1410eceeb8.jpg'),
(89, 129, '63c142064da91.jpg'),
(90, 129, '63c14213d254b.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:30:\\\"reset_password/email.html.twig\\\";i:1;N;i:2;a:1:{s:10:\\\"resetToken\\\";O:58:\\\"SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\\":4:{s:65:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0token\\\";s:40:\\\"j1urbCrarGJx240Hx3eA9jJejcQtRMmXScGPgULB\\\";s:69:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0expiresAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2023-01-08 20:52:29.030902\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:71:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0generatedAt\\\";i:1673207549;s:73:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0transInterval\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"jourdeflorian@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:8:\\\"Mail Bot\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"jourdeflorian@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:27:\\\"Your password reset request\\\";s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-01-08 19:52:29', '2023-01-08 19:52:29', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:30:\\\"reset_password/email.html.twig\\\";i:1;N;i:2;a:1:{s:10:\\\"resetToken\\\";O:58:\\\"SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\\":4:{s:65:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0token\\\";s:40:\\\"R8MlmVvNDHKfSKsET2JKq6or40zpNeO3C59aqzuK\\\";s:69:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0expiresAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2023-01-13 17:09:21.185036\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:71:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0generatedAt\\\";i:1673626161;s:73:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0transInterval\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"jourdeflorian@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:8:\\\"Mail Bot\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:15:\\\"admin@admin.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:27:\\\"Your password reset request\\\";s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-01-13 16:09:21', '2023-01-13 16:09:21', NULL);

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

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(1, 39, 'R8MlmVvNDHKfSKsET2JK', 'D4U2UycVyx028s0ClVNloeTyC5AzkOT2oQB+EXpmQ2Y=', '2023-01-13 16:09:21', '2023-01-13 17:09:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `specificity`
--

INSERT INTO `specificity` (`id`, `name`, `description`, `icon`) VALUES
(19, 'Difficulté', 'Facile', '63c133291cf67.svg'),
(20, 'Difficulté', 'Moyen', '63c13338a86ee.svg'),
(21, 'Difficulté', 'Difficile', '63c1341589b22.svg'),
(22, 'Temps d\'apprentissage', '1 semaine', '63c134ea5e01f.svg'),
(23, 'Temps d\'apprentissage', '1 mois', '63c1358f888f3.svg'),
(24, 'Temps d\'apprentissage', '1 jour', '63c1359cb9113.svg'),
(25, 'Temps d\'apprentissage', '6 mois', '63c135b42119a.svg'),
(26, 'Compétition', 'Perte de points', '63c1433ad4fdc.svg'),
(27, 'Compétition', 'Apprécié', '63c1436c7233f.svg'),
(28, 'Compétition', 'Très apprécié', '63c1437d2a3c2.svg');

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
(19, 120),
(19, 121),
(19, 128),
(20, 119),
(20, 123),
(20, 126),
(21, 122),
(21, 127),
(22, 128),
(23, 124),
(23, 126),
(24, 120),
(24, 121),
(25, 119),
(25, 122),
(25, 124),
(25, 127),
(26, 129),
(27, 119),
(27, 120),
(28, 122);

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
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trick`
--

INSERT INTO `trick` (`id`, `name`, `creation_date`, `description`, `video`) VALUES
(119, 'Backside Air', '2023-01-13 16:00:12', 'Le grab star du snowboard qui peut être fait d\'autant de façon différentes qu\'il y a de styles de riders. Il consiste à attraper la carre arrière entre les pieds, ou légèrement devant, et à pousser avec sa jambe arrière pour ramener la planche devant. <br><br> C\'est une figure phare en pipe ou sur un hip en backside. C\'est généralement avec ce trick que les riders vont le plus haut.', 'RJc5cYp7HNA'),
(120, 'Rotation frontside et backside', '2023-01-13 10:52:51', 'Un snowboarder peut faire des rotations déclenchées du côté de ses pointes de pied, en frontside ou de ses talons, en backside. On parle aussi de frontside et backside pour les murs de halfpipe et les hips. <br><br> Les rotations vont du demi-tour en 180 degrés jusqu\'à des 1800 degrés, soit cinq tours !', '0eWY6-O4O7w'),
(121, 'Switch', '2023-01-13 11:05:09', 'Lorsque l\'on ride de son mauvais côté, tous les noms de figures sont précédées de la dénomination switch. Un regular fera donc ses tricks en switch, comme un goofie, et inversement.', NULL),
(122, 'McTwist', '2023-01-13 11:10:22', 'Un grand classique des rotations tête en bas qui se fait en backside, sur un mur backside de pipe. Le Mc Twist est généralement fait en japan, un grab très tweaké (action d\'accentuer un grab en se contorsionnant).', NULL),
(123, 'Crippler', '2023-01-13 11:16:15', 'Une autre rotation tête en bas classique qui s\'apparente à un backflip sur un mur frontside de pipe ou un quarter.', 'tkyU8bodbDk'),
(124, 'Backside rodeo', '2023-01-13 11:24:29', 'Une rotation tête en bas backside tournant dans le sens d\'un backflip qui peut se faire aussi bien sur un kicker, un pipe ou un hip.', 'QX6yvs6uTVg'),
(125, 'Air to fakie', '2023-01-13 11:25:50', 'En pipe, sur un quarter ou un hip, ce terme désigne un saut sans rotation où le rider retombe dans le sens inverse.', NULL),
(126, 'Handplant', '2023-01-13 11:30:02', 'Un trick inspiré du skate qui consiste à tenir en équilibre sur une ou deux mains au sommet d\'une courbe. Existe avec de nombreuses variantes dans les grabs et les rotations.', 'us8tZcQ1GrY'),
(127, 'Cork', '2023-01-13 11:43:17', 'Le diminutif de corkscrew qui signifie littéralement tire-bouchon et désignait les premières simples rotations têtes en bas en frontside. <br><br> Désormais, on utilise le mot cork à toute les sauces pour qualifier les figures où le rider passe la tête en bas, peu importe le sens de rotation. Et dorénavant en compétition, on parle souvent de double cork, triple cork et certains riders vont jusqu\'au quadruple cork !', 'FMHiSF0rHF8'),
(128, '270', '2023-01-13 11:32:55', 'Désigne le degré de rotation, soit 3/4 de tour, fait en entrée ou en sortie sur un jib. Certains riders font également des rotations en 450 degrés avant ou après les jibs.', 'orD3GNRTJAc'),
(129, 'Revert', '2023-01-13 11:35:47', 'Un revert n\'est pas une figure à part entière mais c\'est le fait de continuer à tourner sur la neige après une rotation aérienne. Cela montre ainsi que la rotation n\'est pas contrôlée et ça fait perdre des points en compétition.', 'gQ0x8oUKbrE');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
