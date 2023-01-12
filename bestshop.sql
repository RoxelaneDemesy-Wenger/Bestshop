-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 12 jan. 2023 à 16:20
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bestshop`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prix` double NOT NULL,
  `date_commande` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `user_id`, `prix`, `date_commande`) VALUES
(5, 1, 990, '2023-01-12 10:11:34'),
(6, 1, 2248, '2023-01-12 10:14:15'),
(7, 1, 499, '2023-01-12 10:31:54');

-- --------------------------------------------------------

--
-- Structure de la table `detail_commande`
--

CREATE TABLE `detail_commande` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `commande_id` int(11) DEFAULT NULL,
  `prix` double NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `detail_commande`
--

INSERT INTO `detail_commande` (`id`, `produit_id`, `commande_id`, `prix`, `quantity`) VALUES
(1, 26, 5, 990, 1),
(2, 27, 6, 759, 1),
(3, 26, 6, 990, 1),
(4, 28, 6, 499, 1),
(5, 28, 7, 499, 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230103110505', '2023-01-03 12:05:25', 674),
('DoctrineMigrations\\Version20230103140740', '2023-01-03 15:10:12', 685),
('DoctrineMigrations\\Version20230103143251', '2023-01-03 15:32:57', 188),
('DoctrineMigrations\\Version20230104090037', '2023-01-04 10:00:46', 659),
('DoctrineMigrations\\Version20230105142413', '2023-01-05 15:49:30', 63),
('DoctrineMigrations\\Version20230105155640', '2023-01-05 16:56:45', 92),
('DoctrineMigrations\\Version20230105155810', '2023-01-05 16:58:14', 83),
('DoctrineMigrations\\Version20230109091241', '2023-01-09 14:51:18', 720),
('DoctrineMigrations\\Version20230109105008', '2023-01-09 14:51:19', 35),
('DoctrineMigrations\\Version20230110105907', '2023-01-10 12:32:25', 771),
('DoctrineMigrations\\Version20230111100225', '2023-01-11 11:02:32', 926),
('DoctrineMigrations\\Version20230111100753', '2023-01-11 11:07:58', 193),
('DoctrineMigrations\\Version20230112083948', '2023-01-12 09:39:52', 136);

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id`, `nom`) VALUES
(1, 'Honor'),
(2, 'Apple'),
(3, 'Huawei'),
(4, 'Samsung'),
(5, 'Xiaomi');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `modele` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `couleur` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taille` double DEFAULT NULL,
  `prix` double NOT NULL,
  `photo1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `memoire` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marque_id` int(11) NOT NULL,
  `remise` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `modele`, `couleur`, `taille`, `prix`, `photo1`, `photo2`, `photo3`, `memoire`, `description`, `marque_id`, `remise`) VALUES
(12, 'honor 10', 'noir', 5.8, 338, 'honor-1063b81c1518eae.jpeg', 'honor-1063b81c1519345.jpeg', 'honor-1063b81c15195cd.jpeg', 64, '\"Équipé d\'un processeur Kirin 970, de 4 Go de RAM et de 64 ou 128 Go de stockage interne, le Honor 10 est au smartphone aux caractéristiques haut de gamme, mais à tarif abordable.\r\nCommercialisé 399 euros, ce cousin du Huawei P20 dispose d\'un double module caméra, dont le second capteur est dédié à la prise de photos monochromes. \"', 1, NULL),
(13, '10 lite', 'bleu', 6.21, 300, '10-lite63b81c51f24ed.jpeg', '10-lite63b81c51f2910.jpeg', '10-lite63b81c51f2bb0.jpeg', 64, '\"Le Honor 10 Lite est un smartphone équipé d’un écran de 6,21 pouces.\r\nIl fonctionne avec Android 9, embarque un processeur Kirin 710, 3 Go de mémoire vive et 64 Go de stockage extensible.\r\nIl dispose d’un double module caméra de 13 et 2 Mpix et d’un capteur d’empreintes digitales.\"', 1, NULL),
(14, 'x8', 'argent', 6.7, 350, 'x863b81caba5847.jpeg', 'x863b81caba5c11.jpeg', 'x863b81caba5e53.jpeg', 64, '\"Le Honor X8 est un smartphone doté d\'un écran de 6,7 pouces.\r\nIl fonctionne avec Android 11 et Magic UI 4.2, embarque le processeur Qualcomm Snapdragon 680, dispose de 6 Go de mémoire vive et 128 Go de stockage.\r\nIl intègre une batterie de 4000 mAh et est compatible avec la charge rapide, grâce à son chargeur 22 W.\"', 1, NULL),
(15, 'iphone 11', 'blanc', 601, 589, 'iphone-1163b81d1918bd9.avif', 'iphone-1163b81d1918fe5.avif', 'iphone-1163b81d1919287.avif', 64, '\"Successeur de l\'iPhone XR, l\'iPhone 11 se distingue de son prédécesseur par l\'utilisation d\'un double module caméra.\r\nOn trouve à son dos un ultra grand angle en complément de l\'objectif principal, chacun d\'eux étant associé à un capteur de 12 Mpix.\r\nL\'iPhone 11 est également équipé du nouveau processeur Apple A13 Bionic et utilise un capteur Face ID amélioré.\r\nIl est proposé en plusieurs couleurs originales. \"', 2, NULL),
(16, 'iphone 12', 'rouge', 6.1, 889, 'iphone-1263b81db749258.avif', 'iphone-1263b81db749670.avif', 'iphone-1263b81db7499da.avif', 128, '\"Compatible 5G, l\'iPhone 12 d\'Apple est équipé d\'un écran OLED de 6,1 pouces.\r\nCe smartphone dispose de la nouvelle puce A14 Bionic gravée en 5 nm et, en photo, embarque d\'un double module caméra avec capteur grand-angle et capteur ultra grand-angle (12 Mpix + 12 Mpix).\r\nIl est proposé en 5 couleurs avec trois capacités de stockage (64, 128 ou 256 Go).\r\nÀ son dos, on trouve des aimants pour accrocher des accessoires MagSafe. \"', 2, NULL),
(17, 'iphone 13', 'argent', 6.1, 1289, 'iphone-1363b81e29648ab.avif', 'iphone-1363b81e296449b.avif', 'iphone-1363b81e2966c61.avif', 512, '\"L\'iPhone 13 est un smartphone haut de gamme signé Apple et compatible 5G.\r\nDécliné en cinq couleurs, il embarque le processeur A15 Bionic, 128 Go de stockage au minimum et un double module caméra avec grand-angle et ultra grand-angle.\r\nSon écran OLED mesure 6,1 pouces et est compatible HDR Dolby Vision. \"', 2, NULL),
(18, 'p20', 'noir', 5.8, 749, 'p2063b81e91322d6.png', 'p2063b81e9132692.png', 'p2063b81e91328fa.png', 128, '\"Le Huawei P20 est un smartphone équipé d\'un écran LCD de 5,8 pouces au format 19:9.\r\nIl embarque un processeur Kirin 970 (2,36 GHz), 4 Go de mémoire vive et 128 Go de stockage non extensible.\r\nLe P20 profite par ailleurs d\'un double module caméra à l\'arrière, avec un capteur RGB de 12 Mpix et un capteur monochrome de 20 Mpix.\"', 3, NULL),
(19, 'p30', 'bleu', 6.1, 399, 'p3063b81ece4fbc7.png', 'p3063b81ece4ffbe.png', 'p3063b81ece5022a.png', 64, '\"Le Huawei P30 est un smartphone doté d’un écran OLED FHD+ de 6,1 pouces.\r\nIl embarque le processeur Kirin 980 avec 6 Go de mémoire vive et 128 Go de stockage extensible et se distingue par un triple module caméra principal (40, 16, 8 Mégapixels).\r\nIl intègre aussi une batterie haute capacité de 3650 mAh.\"', 3, NULL),
(20, 'p40', 'or', 6.1, 810, 'p4063b81f13251d5.avif', 'p4063b81f13255a9.avif', 'p4063b81f1327932.avif', 128, '\"Lancé en même temps que le P40 Pro, le Huawei P40 se distingue par sa plus petite taille et son écran OLED de 6,1 pouces.\r\nBien plus compact que la plupart des smartphones haut de gamme du moment, cet appareil est pourtant très bien équipé (processeur Kirin 990, compatibilité 5G, Wi-Fi 6).\r\nÀ son dos, on trouve un triple module caméra parmi les meilleurs du marché.\r\nSeul bémol, ce smartphone est privé des services Google et repose sur l\'écosystème AppGallery. \"', 3, NULL),
(21, 's20', 'gris', 6.2, 909, 's2063b81f5fa75df.avif', 's2063b81f5fa79e6.avif', 's2063b81f5fa7c82.avif', 128, '\"Le Samsung Galaxy S20 est le nouveau smartphone haut de gamme de la marque.\r\nCette nouvelle itération apporte plusieurs nouveautés comme un écran de 6,2 pouces au taux de rafraîchissement de 120 Hz et le support de la vidéo 8K.\r\nLe Galaxy S20 intègre aussi le nouveau processeur Exynos 990 et il est proposé en deux versions 4G (à partir de 909 euros) et 5G (à partir de 1009 euros). \"', 4, NULL),
(22, 's21', 'blanc', 6.2, 932, 's2163b81f9bdce77.avif', 's2163b81f9bdd25b.avif', 's2163b81f9bdd4e8.avif', 256, '\"Le Samsung Galaxy S21 est un smartphone haut de gamme doté d\'un écran de 6,2 pouces au taux de rafraîchissement de 120 Hz.\r\nCet appareil se destine aux personnes qui cherchent un design élégant même si l\'on peut déplorer que son dos soit recouvert de plastique plutôt que de verre.\r\nIl embarque le processeur Exynos 2100 et arbore un triple module caméra identique à celui de son prédécesseur. \"', 4, NULL),
(25, '11t', 'gris', 6.67, 699, '11t63b820444f7a7.avif', '11t63b820444fc0a.avif', '11t63b820444fe6d.avif', 128, '\"Le Xiaomi 11T est un smartphone milieu de gamme doté d\'un écran AMOLED de 6,67 pouces.\r\nSous Android 11, il embarque le processeur Mediatek Dimensity 1200, dispose de 8 Go de mémoire vive, de 128 Go ou 256 Go de stockage et intègre une batterie de 5000 mAh.\r\nCompatible avec la recharge ultra-rapide 67W, il se recharge en moins de 40 minutes selon Xiaomi. \"', 5, NULL),
(26, '12X', 'gris', 6.67, 990, '12X63b8208499d72.avif', '12X63b820849a194.avif', '12X63b820849a43d.avif', 256, '\"Le smartphone Xiaomi 12 est la version plus accessible du très haut de gamme Xiaomi 12 Pro.\r\nIl fonctionne avec Android 12 et MIUI 13, embarque le processeur Qualcomm Snapdragon 8 Gen 1, dispose de 8Go ou 12 Go de mémoire vive et 128 Go ou 256 Go de stockage.\r\nIl intègre une batterie de 4500 mAh.\"', 5, NULL),
(27, 's22', 'gris', 6.1, 859, 's2263b820e52dd04.avif', 's2263b820e52d8fc.avif', 's2263b820e5301c7.avif', 256, '\"Le Samsung Galaxy S22 est un smartphone doté d\'un écran de 6,1 pouces.\r\nIl fonctionne avec Android 12 et One UI 4.1, embarque le processeur Samsung Exynos 2200, dispose de 8 Go de mémoire vive et 128 Go ou 256 Go de stockage.\r\nIl intègre une batterie de 3590mAh.\"', 4, 759),
(28, '10t', 'argent', 6.67, 499, '10t63b8212d517ac.avif', '10t63b8212d51c58.avif', '10t63b8212d54230.avif', 128, '\"Le Mi 10T Lite de Xiaomi est un des smartphones 5G les moins coûteux de 2020.\r\nCommercialisé à partir 299 euros, il dispose d\'un écran de 6,67 pouces au taux de rafraîchissement de 120 Hz, du processeur Qualcomm Snapdragon 750G et de 6 Go de mémoire vive et de 128 Go de stockage extensible.  \"', 5, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nom`, `prenom`, `is_valid`, `token`) VALUES
(1, 'admin@admin.fr', '[\"ROLE_ADMIN\"]', '$2y$13$TcgCpNCulWNWA/9PRMoQfur.TOZCS9nCqbAsi4IGE.rm5EfXGqBmC', 'bg', 'bilel', 1, NULL),
(2, 'user@user.fr', '[\"ROLE_USER\"]', '$2y$13$yE8QImz1mwEYPyy4IWhGBuSD7VQZiskD8TY63VLOCXNfz/.5ugMPC', 'user', 'bilel', 1, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6EEAA67DA76ED395` (`user_id`);

--
-- Index pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_98344FA6F347EFB` (`produit_id`),
  ADD KEY `IDX_98344FA682EA2E54` (`commande_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC274827B9B2` (`marque_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_6EEAA67DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `detail_commande`
--
ALTER TABLE `detail_commande`
  ADD CONSTRAINT `FK_98344FA682EA2E54` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`),
  ADD CONSTRAINT `FK_98344FA6F347EFB` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC274827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
