-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 06 jan. 2023 à 14:32
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
  `marque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `modele`, `couleur`, `taille`, `prix`, `photo1`, `photo2`, `photo3`, `memoire`, `description`, `marque_id`) VALUES
(12, 'honor 10', 'noir', 5.8, 338, 'honor-1063b81c1518eae.jpeg', 'honor-1063b81c1519345.jpeg', 'honor-1063b81c15195cd.jpeg', 64, '\"Équipé d\'un processeur Kirin 970, de 4 Go de RAM et de 64 ou 128 Go de stockage interne, le Honor 10 est au smartphone aux caractéristiques haut de gamme, mais à tarif abordable.\r\nCommercialisé 399 euros, ce cousin du Huawei P20 dispose d\'un double module caméra, dont le second capteur est dédié à la prise de photos monochromes. \"', 1),
(13, '10 lite', 'bleu', 6.21, 300, '10-lite63b81c51f24ed.jpeg', '10-lite63b81c51f2910.jpeg', '10-lite63b81c51f2bb0.jpeg', 64, '\"Le Honor 10 Lite est un smartphone équipé d’un écran de 6,21 pouces.\r\nIl fonctionne avec Android 9, embarque un processeur Kirin 710, 3 Go de mémoire vive et 64 Go de stockage extensible.\r\nIl dispose d’un double module caméra de 13 et 2 Mpix et d’un capteur d’empreintes digitales.\"', 1),
(14, 'x8', 'argent', 6.7, 350, 'x863b81caba5847.jpeg', 'x863b81caba5c11.jpeg', 'x863b81caba5e53.jpeg', 64, '\"Le Honor X8 est un smartphone doté d\'un écran de 6,7 pouces.\r\nIl fonctionne avec Android 11 et Magic UI 4.2, embarque le processeur Qualcomm Snapdragon 680, dispose de 6 Go de mémoire vive et 128 Go de stockage.\r\nIl intègre une batterie de 4000 mAh et est compatible avec la charge rapide, grâce à son chargeur 22 W.\"', 1),
(15, 'iphone 11', 'blanc', 601, 589, 'iphone-1163b81d1918bd9.avif', 'iphone-1163b81d1918fe5.avif', 'iphone-1163b81d1919287.avif', 64, '\"Successeur de l\'iPhone XR, l\'iPhone 11 se distingue de son prédécesseur par l\'utilisation d\'un double module caméra.\r\nOn trouve à son dos un ultra grand angle en complément de l\'objectif principal, chacun d\'eux étant associé à un capteur de 12 Mpix.\r\nL\'iPhone 11 est également équipé du nouveau processeur Apple A13 Bionic et utilise un capteur Face ID amélioré.\r\nIl est proposé en plusieurs couleurs originales. \"', 2),
(16, 'iphone 12', 'rouge', 6.1, 889, 'iphone-1263b81db749258.avif', 'iphone-1263b81db749670.avif', 'iphone-1263b81db7499da.avif', 128, '\"Compatible 5G, l\'iPhone 12 d\'Apple est équipé d\'un écran OLED de 6,1 pouces.\r\nCe smartphone dispose de la nouvelle puce A14 Bionic gravée en 5 nm et, en photo, embarque d\'un double module caméra avec capteur grand-angle et capteur ultra grand-angle (12 Mpix + 12 Mpix).\r\nIl est proposé en 5 couleurs avec trois capacités de stockage (64, 128 ou 256 Go).\r\nÀ son dos, on trouve des aimants pour accrocher des accessoires MagSafe. \"', 2),
(17, 'iphone 13', 'argent', 6.1, 1289, 'iphone-1363b81e296449b.avif', 'iphone-1363b81e29648ab.avif', 'iphone-1363b81e2966c61.avif', 512, '\"L\'iPhone 13 est un smartphone haut de gamme signé Apple et compatible 5G.\r\nDécliné en cinq couleurs, il embarque le processeur A15 Bionic, 128 Go de stockage au minimum et un double module caméra avec grand-angle et ultra grand-angle.\r\nSon écran OLED mesure 6,1 pouces et est compatible HDR Dolby Vision. \"', 2),
(18, 'p20', 'noir', 5.8, 749, 'p2063b81e91322d6.png', 'p2063b81e9132692.png', 'p2063b81e91328fa.png', 128, '\"Le Huawei P20 est un smartphone équipé d\'un écran LCD de 5,8 pouces au format 19:9.\r\nIl embarque un processeur Kirin 970 (2,36 GHz), 4 Go de mémoire vive et 128 Go de stockage non extensible.\r\nLe P20 profite par ailleurs d\'un double module caméra à l\'arrière, avec un capteur RGB de 12 Mpix et un capteur monochrome de 20 Mpix.\"', 3),
(19, 'p30', 'bleu', 6.1, 399, 'p3063b81ece4fbc7.png', 'p3063b81ece4ffbe.png', 'p3063b81ece5022a.png', 64, '\"Le Huawei P30 est un smartphone doté d’un écran OLED FHD+ de 6,1 pouces.\r\nIl embarque le processeur Kirin 980 avec 6 Go de mémoire vive et 128 Go de stockage extensible et se distingue par un triple module caméra principal (40, 16, 8 Mégapixels).\r\nIl intègre aussi une batterie haute capacité de 3650 mAh.\"', 3),
(20, 'p40', 'or', 6.1, 810, 'p4063b81f13251d5.avif', 'p4063b81f13255a9.avif', 'p4063b81f1327932.avif', 128, '\"Lancé en même temps que le P40 Pro, le Huawei P40 se distingue par sa plus petite taille et son écran OLED de 6,1 pouces.\r\nBien plus compact que la plupart des smartphones haut de gamme du moment, cet appareil est pourtant très bien équipé (processeur Kirin 990, compatibilité 5G, Wi-Fi 6).\r\nÀ son dos, on trouve un triple module caméra parmi les meilleurs du marché.\r\nSeul bémol, ce smartphone est privé des services Google et repose sur l\'écosystème AppGallery. \"', 3),
(21, 's20', 'gris', 6.2, 909, 's2063b81f5fa75df.avif', 's2063b81f5fa79e6.avif', 's2063b81f5fa7c82.avif', 128, '\"Le Samsung Galaxy S20 est le nouveau smartphone haut de gamme de la marque.\r\nCette nouvelle itération apporte plusieurs nouveautés comme un écran de 6,2 pouces au taux de rafraîchissement de 120 Hz et le support de la vidéo 8K.\r\nLe Galaxy S20 intègre aussi le nouveau processeur Exynos 990 et il est proposé en deux versions 4G (à partir de 909 euros) et 5G (à partir de 1009 euros). \"', 4),
(22, 's21', 'blanc', 6.2, 932, 's2163b81f9bdce77.avif', 's2163b81f9bdd25b.avif', 's2163b81f9bdd4e8.avif', 256, '\"Le Samsung Galaxy S21 est un smartphone haut de gamme doté d\'un écran de 6,2 pouces au taux de rafraîchissement de 120 Hz.\r\nCet appareil se destine aux personnes qui cherchent un design élégant même si l\'on peut déplorer que son dos soit recouvert de plastique plutôt que de verre.\r\nIl embarque le processeur Exynos 2100 et arbore un triple module caméra identique à celui de son prédécesseur. \"', 4),
(25, '11t', 'gris', 6.67, 699, '11t63b820444f7a7.avif', '11t63b820444fc0a.avif', '11t63b820444fe6d.avif', 128, '\"Le Xiaomi 11T est un smartphone milieu de gamme doté d\'un écran AMOLED de 6,67 pouces.\r\nSous Android 11, il embarque le processeur Mediatek Dimensity 1200, dispose de 8 Go de mémoire vive, de 128 Go ou 256 Go de stockage et intègre une batterie de 5000 mAh.\r\nCompatible avec la recharge ultra-rapide 67W, il se recharge en moins de 40 minutes selon Xiaomi. \"', 5),
(26, '12X', 'gris', 6.67, 990, '12X63b8208499d72.avif', '12X63b820849a194.avif', '12X63b820849a43d.avif', 256, '\"Le smartphone Xiaomi 12 est la version plus accessible du très haut de gamme Xiaomi 12 Pro.\r\nIl fonctionne avec Android 12 et MIUI 13, embarque le processeur Qualcomm Snapdragon 8 Gen 1, dispose de 8Go ou 12 Go de mémoire vive et 128 Go ou 256 Go de stockage.\r\nIl intègre une batterie de 4500 mAh.\"', 5),
(27, 's22', 'gris', 6.1, 859, 's2263b820e52d8fc.avif', 's2263b820e52dd04.avif', 's2263b820e5301c7.avif', 256, '\"Le Samsung Galaxy S22 est un smartphone doté d\'un écran de 6,1 pouces.\r\nIl fonctionne avec Android 12 et One UI 4.1, embarque le processeur Samsung Exynos 2200, dispose de 8 Go de mémoire vive et 128 Go ou 256 Go de stockage.\r\nIl intègre une batterie de 3590mAh.\"', 4),
(28, '10t', 'argent', 6.67, 499, '10t63b8212d517ac.avif', '10t63b8212d51c58.avif', '10t63b8212d54230.avif', 128, '\"Le Mi 10T Lite de Xiaomi est un des smartphones 5G les moins coûteux de 2020.\r\nCommercialisé à partir 299 euros, il dispose d\'un écran de 6,67 pouces au taux de rafraîchissement de 120 Hz, du processeur Qualcomm Snapdragon 750G et de 6 Go de mémoire vive et de 128 Go de stockage extensible.  \"', 5);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A5EC274827B9B2` (`marque_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `FK_29A5EC274827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
