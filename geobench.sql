-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 11 juil. 2021 à 13:07
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `geobench`
--

-- --------------------------------------------------------

--
-- Structure de la table `bancs`
--

CREATE TABLE `bancs` (
  `id` int(11) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `lieu` text COLLATE latin1_general_ci NOT NULL,
  `note` float NOT NULL,
  `environnement` text COLLATE latin1_general_ci NOT NULL,
  `user` text COLLATE latin1_general_ci NOT NULL,
  `commetaire` text CHARACTER SET utf8 NOT NULL,
  `nom_photo` text COLLATE latin1_general_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `bancs`
--

INSERT INTO `bancs` (`id`, `longitude`, `latitude`, `lieu`, `note`, `environnement`, `user`, `commetaire`, `nom_photo`, `date`) VALUES
(1, 2.4339336131868965, 48.85989127059839, '1', 3.5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"Premier banc de Geobench\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(2, 2.435194550861147, 48.85757714090711, '0', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(16, 2.4387049547086104, 48.85978643134819, '1', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(4, 2.327032282035004, 48.84135972591622, '1', 5, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(5, 2.324576753121479, 48.84119263477859, '1', 0, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(6, 2.323959781630102, 48.84067456597407, '2', 4, '1', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(7, 2.323812364832837, 48.84141429704845, '1', 4, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(8, 2.3235044956599613, 48.841505421721116, '1', 3, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(9, 2.32778180727103, 48.84031454235637, '1', 3, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(10, 2.3276846407051885, 48.84024809547702, '1', 2, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(11, 2.327479214877693, 48.84031652135712, '1', 3, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(12, 2.32724121067227, 48.84041916333689, '1', 2, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(13, 2.32724121067227, 48.84041916333689, '1', 3, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(14, 2.327332075295485, 48.84022043764382, '1', 2, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(15, 2.3266669108129916, 48.84039644743481, '1', 3, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(17, 2.4387552361603015, 48.8595937491018, '1', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(18, 2.4366620235370675, 48.85963338714557, '1', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(19, 2.436605274775274, 48.859519205667056, '1', 3.5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(20, 2.4366150364769523, 48.859495213073124, '1', 3, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(21, 2.436710035192372, 48.86094790289589, '0', 3, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(22, 2.4366917481027426, 48.86071213417843, '0', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(23, 2.436353601186503, 48.861189813556386, '0', 2, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(24, 2.4377134465714008, 48.8565042069493, '1', 2.5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(25, 2.438983593208944, 48.84568677353902, '0', 5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(26, 2.438075282783039, 48.84440959257364, '0', 3.5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(27, 2.4353356891202194, 48.84479372875608, '1', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(28, 2.4447898849982663, 48.85720297564154, '1', 2, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(36, 2.3803964835371256, 48.883919491627594, '1', 3, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(30, 2.439602962181002, 48.845613785860856, '0', 5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(31, 2.4394670763795645, 48.84487942917681, '0', 5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(32, 2.4388331501341, 48.844927509182384, '0', 5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(33, 2.434332949654221, 48.847390502206004, '0', 2, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(34, 2.4343377485339945, 48.84719013741185, '0', 1, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(35, 2.4346776312227494, 48.84982708585709, '1', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(37, 2.382300771081183, 48.88227540780599, '1', 3, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(38, 2.381927318746545, 48.88195645823783, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(39, 2.3815709034842385, 48.88178444162127, '2', 3, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(40, 2.381386580061747, 48.881693500786994, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(41, 2.381399408046914, 48.88163159368648, '2', 3, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(42, 2.3811243670701967, 48.881197126223825, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(43, 2.3811246069694074, 48.88049804410656, '2', 4, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(44, 2.3810179803940748, 48.88039038148254, '2', 4, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(45, 2.3805180458132336, 48.88037063689236, '2', 3.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(46, 2.380137951502087, 48.880384645691166, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(47, 2.3796274375729727, 48.880074632612676, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(48, 2.379353021867529, 48.87986838878761, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(49, 2.379193917062558, 48.879562291355676, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(50, 2.37914755319362, 48.87942034704581, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(51, 2.379025208385113, 48.87911380167499, '2', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(52, 2.3789642134520546, 48.87909481403171, '2', 3, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(53, 2.378752479860562, 48.87903727533592, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(54, 2.378785209479265, 48.87862753694379, '2', 5, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(55, 2.379137376726339, 48.87838823428347, '2', 5, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(56, 2.3794602760838846, 48.87828716416967, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(57, 2.3796500330667256, 48.87825627162268, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(58, 2.380382261352814, 48.87810661633713, '2', 2.5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(59, 2.3806984380916365, 48.87798857709374, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(60, 2.3809907492933746, 48.878099118793514, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(61, 2.38101087627747, 48.8782453312534, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(62, 2.3811419538931142, 48.87837206774726, '2', 3, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(63, 2.3823934129996682, 48.879291588762385, '2', 4, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(64, 2.383090912465672, 48.88106514185709, '2', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(65, 2.3830438308603714, 48.88099447504375, '2', 4, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(66, 2.383283935876403, 48.881716196488256, '2', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(67, 2.3839925911642235, 48.880368348866234, '2', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(68, 2.383989679064205, 48.8803686108977, '2', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(69, 2.3811223513897013, 48.87748610755172, '1', 3, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(70, 2.3811223460813222, 48.87748624780585, '1', 3, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(71, 2.381104996931814, 48.877116968210686, '1', 3, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(72, 2.387235402261719, 48.887040850111326, '1', 2, '3', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(73, 2.358550461066431, 48.868409503865784, '1', 1, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(74, 2.358384918288695, 48.8685088546308, '1', 1, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(75, 2.3566752565378324, 48.86870836652233, '1', 2, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(76, 2.3449786191250137, 48.87115008698148, '1', 3, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(77, 2.3375139784426935, 48.87160116428505, '1', 2, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(78, 2.3367213880654925, 48.87134682785389, '1', 3, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(79, 2.3246892339177645, 48.86483561737245, '2', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(80, 2.324743621005013, 48.86469792920003, '2', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(81, 2.2928569539505514, 48.84700165230759, '1', 3, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(82, 2.2927480476525055, 48.84699904866354, '1', 1, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(83, 2.2927597774703767, 48.847043903790464, '1', 3, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(84, 2.6360765108902253, 48.31291565431787, '0', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(85, 4.345761748357545, 44.30602809184926, '1', 5, '3', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(86, 4.346593842408357, 44.30694736833027, '0', 2, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(87, 4.346595176857063, 44.3069162804242, '0', 3, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(88, 2.4436353251374445, 48.82666474002779, '3', 3, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(89, 2.443367937565128, 48.82542246313533, '3', 3, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(90, 2.4433604918130047, 48.82542374984365, '3', 3, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(91, 2.4410918528355707, 48.826012176019674, '3', 2, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(92, 2.441984536587802, 48.82175254310643, '3', 3, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(93, 2.4419838905637365, 48.82175273661663, '3', 3, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(94, 5.6899171032422275, 43.17791499424462, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(95, 5.690617005515951, 43.177358269641026, '0', 4.5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(96, 5.690677688564541, 43.17725788343395, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(97, 5.690680066499832, 43.177255980548686, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(98, 5.690778812816021, 43.17717562635718, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(99, 5.690929180101612, 43.17702188580653, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(100, 5.691399944158994, 43.176579242157, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(101, 5.691746521925396, 43.17622584326067, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(102, 5.6918151996880795, 43.17615703014421, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(103, 5.691954568243332, 43.17598112147367, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(104, 5.692223218083508, 43.17572241133365, '0', 4.5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(105, 5.692532586304903, 43.17541641445187, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(106, 5.754039393606926, 43.196943788674794, '1', 4, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(107, 5.754040888661138, 43.19694257094904, '1', 4, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(108, 4.469772569030522, 44.21542688455892, '1', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(109, 4.4699231074562755, 44.2152440774509, '1', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(110, 5.756795889329061, 43.19730927773487, '1', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(111, 5.755905851686157, 43.196885314574445, '0', 5, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(112, 5.755616903833877, 43.19692692683881, '0', 5, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(113, 5.755623701324125, 43.19688515128329, '0', 4, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(114, 5.755543863999512, 43.196844454652016, '0', 5, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(115, 5.755167993106801, 43.19710788403641, '0', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(116, 5.755934914579053, 43.19647767645773, '0', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(117, 5.7565152102803925, 43.19634599947996, '1', 4, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(118, 5.756545147183326, 43.19633991345368, '0', 4, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(119, 5.7595347535630665, 43.19641491268753, '0', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(382, 1.58047574525207, 50.26282014524762, '2', 3.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Parc du Marquenterre\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(121, 5.747369176573202, 43.19679924821424, '1', 5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(208, 2.459333274401747, 48.836022137725344, '3', 4, '1', 'Gusther', '{\"utilisateur\":\"petit banc sculpter dans un tronc d arbre !\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(200, 1.7937575349398316, 45.53921561252142, '1', 2.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"En face d\'une magnifique riviere\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(137, 4.469314586556168, 44.21568000552378, '1', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(138, 4.469179831459132, 44.21565858646596, '1', 4.5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(139, 4.469204127126854, 44.21590094514226, '1', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(148, 1.926862084684148, 45.599006324594406, '1', 1.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(146, 1.9272984584521757, 45.59886652141474, '4', 4, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(147, 1.9273553294118217, 45.59880113298087, '4', 4, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(478, 2.7193327708051283, 47.50728977793151, '1', 3, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Petite table de pique-nique ðŸ¥ª\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/GJXlIvIzAZwyRnqjs5kF.png', '2021-06-27 15:51:52'),
(380, 2.3887080585250398, 48.88728487508241, '1', 5, '1', 'Chripmus45', '{\"utilisateur\":\"pour faire une petite pause parmi les fleurs\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(419, 2.3957623703426236, 48.84868774208661, '4', 5, '3', 'nadke', '{\"utilisateur\":\"place de la nation\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/WL2ANMuzunj6d0dO8tr4.jpg', '2021-06-27 15:51:52'),
(250, 2.4421469192036036, 48.86221848180019, '4', 3, '2', 'Hysteria', '{\"utilisateur\":\"Place de la Mairie de Montreuil, beaucoup de banc\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(156, 1.924979956556697, 45.604188933769365, '2', 3.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(157, 1.9248567309391562, 45.6039584850771, '2', 4, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(198, 1.7938542467146605, 45.53813295231659, '1', 4, '1', 'nadke', '{\"utilisateur\":\"vieux pont de Treignac\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(199, 1.7938542467146605, 45.53813295231659, '1', 4, '1', 'nadke', '{\"utilisateur\":\"vieux pont de Treignac\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(153, 1.9246211427781632, 45.600750593042726, '0', 2, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Vieux banc en metal dans une vieille gare\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(246, 2.362470331999115, 48.944827369979585, '0', 4.5, '2', 'Hysteria', '{\"utilisateur\":\"universite Paris 8, ombre, petit toboggan a cote\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(429, 5.7389669488546735, 43.134642883034324, '6', 4.5, '1', 'Gusther', '{\"utilisateur\":\"tres ensoleille en ete\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(172, 1.7459657240719162, 45.73848793884156, '2', 5, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/FhDytpqRSOkHatIGD0Ix.jpg', '2021-06-27 15:51:52'),
(174, 1.7457788254188344, 45.738488546975944, '2', 4, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/Wf1VjeOYcryrcmODefml.jpg', '2021-06-27 15:51:52'),
(256, 2.388575114864852, 48.8943308479588, '2', 5, '2', 'Hysteria', '{\"utilisateur\":\"geode du parc de la Villette\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/57Qg3ShLwhzUWwdq5f4z.jpg', '2021-06-27 15:51:52'),
(176, 1.7464331065421173, 45.738197300725005, '2', 5, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/efJogwIxmxstuMrwFxY0.jpg', '2021-06-27 15:51:52'),
(244, 2.3475530521702312, 48.85866316544778, '0', 5, '3', 'Hysteria', '{\"utilisateur\":\"Fauteuils du bar concert le Klub\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(495, 2.4363524, 48.8584488, '1', 2.92158, '3', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', 'https://i.ibb.co/hfL8NL5/281513bd89f6.jpg', '2021-07-09 12:50:41'),
(183, 1.237462344577885, 44.46854229200216, '0', 5, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(190, 1.2364075246783022, 44.468362859933244, '4', 3, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(406, 2.4128868303511024, 48.846627020971724, '1', 2.5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"Confort assez moyen mais plutot propre\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(167, 1.7412230318556627, 45.739917393413165, '0', 3, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Train dans la gare\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/fgTcHSovsxWTxtUMyleO.jpg', '2021-06-27 15:51:52'),
(417, 2.3249734116958867, 48.88746317987028, '0', 4, '1', 'Chripmus45', '{\"utilisateur\":\"se trouve dans un petit square\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(242, 2.362748056683885, 48.94441686620087, '0', 5, '2', 'Hysteria', '{\"utilisateur\":\"Se trouve dans l\'universite Paris 8\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(196, 1.7927562698715869, 45.538067538170154, '2', 5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Pres d\'un parc pour enfant\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/Sj76kW9teyyucfETqhG6.jpg', '2021-06-27 15:51:52'),
(163, 1.9264361960756085, 45.602864569402456, '2', 4, '1', 'nadke', '{\"utilisateur\":\"Pres d\'un etang\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/6xtazAwG2wKwXtk1pqAQ.jpg', '2021-06-27 15:51:52'),
(201, 1.7935833463784454, 45.53669514326353, '7', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/JKC2bmiUm1FS1L6ewgMk.jpg', '2021-06-27 15:51:52'),
(202, 1.3774649857912804, 46.15887030471237, '5', 4.5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/OALAFETJz0DsT4RmHZON.jpg', '2021-06-27 15:51:52'),
(203, 1.3774439277924317, 46.158892534913875, '5', 5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/IKWs1b7SrOWcLTUS68k3.jpg', '2021-06-27 15:51:52'),
(204, 1.377639437552513, 46.1586788458874, '5', 4.5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/1aUGCC4tzUN3csA8WJ5l.jpg', '2021-06-27 15:51:52'),
(205, 1.377641401870739, 46.15850256747453, '5', 5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/hz8SqXcCGbeN8jLY2M1A.jpg', '2021-06-27 15:51:52'),
(206, 2.4362499143941676, 48.83916516741375, '3', 3, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(207, 2.3787506070696414, 48.89902547487973, '1', 5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/BsuQV1gQ97ZS9Z1b8L9w.jpg', '2021-06-27 15:51:52'),
(209, 2.3811763404369644, 48.88536240644131, '4', 2, '2', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/Pld239fVCTAJc72SaKlm.jpg', '2021-06-27 15:51:52'),
(211, -1.5719044111904446, 48.75912672025239, '6', 5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(131, 4.3479352232651935, 44.307386656125324, '7', 4.5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"Petit banc en bois sous un abris bus au soleil\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(130, 4.348222868313991, 44.30775607015004, '4', 3.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Petit banc en pierre\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(219, -0.8655841669404499, 48.95214445156862, '3', 3.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(220, -0.8625863349727737, 48.950215085063064, '3', 5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(221, -0.8624423773355698, 48.950265705746006, '3', 5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(222, 2.4308724974568716, 48.860326924266296, '1', 4, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(193, 2.0273592458416227, 45.605763905370246, '0', 1, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Pres de ruines Galo-Romaines\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/QCi1gZWgqPbGZPNXWo8F.jpg', '2021-06-27 15:51:52'),
(225, 2.459377755488653, 48.86090305866544, '1', 2, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(226, 2.436535633797539, 48.86248608047064, '1', 3, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/4HfbqSbPxE0VUjfnXN1j.jpg', '2021-06-27 15:51:52'),
(227, 2.4366076638367713, 48.86241414310883, '1', 2.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(228, 2.3235692929345606, 48.84119725367271, '2', 3.5, '1', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/WobNkKEZXjze5XIat2On.jpg', '2021-06-27 15:51:52'),
(229, 2.4436342822677473, 48.86102931709175, '1', 4.5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(230, 2.450137311666789, 48.86363115156233, '4', 3, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/fFDjntbqu7ng3KejTLDl.jpg', '2021-06-27 15:51:52'),
(231, 2.4501074126499174, 48.863566641682034, '4', 3, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/8hVkmh6lsfUqfbGkuEzQ.jpg', '2021-06-27 15:51:52'),
(422, 5.73812330741464, 43.135697656655665, '6', 3.5, '2', 'Gusther', '{\"utilisateur\":\"jolie vue sur la mer\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(240, 2.4354135139633306, 48.853796248511856, '1', 1, '3', 'TurtleTvHere', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(253, 2.389558534189437, 48.892685971009705, '2', 5, '2', 'Hysteria', '{\"utilisateur\":\"chaises qui tournent\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/pkgb9WcQLJtdwS42aIHs.jpg', '2021-06-27 15:51:52'),
(177, 1.7461456811077556, 45.73837740704804, '2', 4.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"En face d\'une riviere\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(247, 2.4449024549597556, 48.863555521851154, '2', 3, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/g30HSF7st8GKQOyeqrxl.jpg', '2021-06-27 15:51:52'),
(197, 1.793328109031851, 45.53814824490796, '1', 4, '1', 'nadke', '{\"utilisateur\":\"pres de l\'eglise\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(266, 2.4854937782770024, 47.34557396164605, '4', 5, '1', 'nadke', '{\"utilisateur\":\"pres de l\'eglise\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/Bz31vsmR3yyS0s0M0lsc.jpg', '2021-06-27 15:51:52'),
(255, 2.3885827145150724, 48.89249257145262, '2', 2.5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"Pres d un manege pour enfant\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/2gKrtGr7m2u622KpdNY7.jpg', '2021-06-27 15:51:52'),
(251, 2.703030033220134, 47.46368547194864, '1', 5, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/KcCTX2vgOKjDoMUztFD9.jpg', '2021-06-27 15:51:52'),
(252, 2.4507706365692434, 48.849898149558854, '4', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/rchCG1EcnEYdhlUk4HnH.jpg', '2021-06-27 15:51:52'),
(254, 2.3887003963080193, 48.892517330423054, '2', 4, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(218, -0.8649404431829282, 48.9520168640165, '3', 3.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Dans une base saut\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(178, 1.746200850607601, 45.738271011924034, '2', 4, '1', 'MisterGoodDeal', '{\"utilisateur\":\"En face d\'une riviere\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/ye8O8W7tBGM7WyZ4ZeZd.jpg', '2021-06-27 15:51:52'),
(257, 2.3874932308241323, 48.88335693429239, '1', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(258, 2.3854101615243652, 48.881818056061455, '2', 5, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(259, 2.38535875476253, 48.88132887674505, '2', 4, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(260, 2.3853061518173932, 48.88111875111606, '2', 5, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(261, 2.3853002563417895, 48.88074552846767, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(262, 2.3854601503833828, 48.880594431271604, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(263, 2.4430726707900425, 48.85676924109564, '1', 3, '0', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(267, 2.539437584363588, 47.529170404425464, '2', 5, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/z5P8JgxU2bcDmCyWl277.jpg', '2021-06-27 15:51:52'),
(268, 2.539437584363588, 47.529170404425464, '2', 5, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/mxojuorRc9nw6bUshSyG.jpg', '2021-06-27 15:51:52'),
(269, 2.3336181748964386, 48.84661057229506, '2', 5, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(270, 2.334222606384668, 48.84645673464668, '2', 5, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(271, 2.3353146510924714, 48.84667861005787, '2', 5, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(272, 2.335449790195891, 48.847021719641845, '2', 5, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(273, 2.3355366047575896, 48.84724464982953, '2', 5, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(274, 2.336367009869003, 48.84751718945778, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/E0pQvHllWG7NpqhdnwKA.jpg', '2021-06-27 15:51:52'),
(275, 2.470868016245463, 48.882239658163826, '7', 4, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/1rlBubnFlVhGUFDOC1WD.jpg', '2021-06-27 15:51:52'),
(276, 2.35071953198609, 48.857389446921424, '1', 3, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(277, 2.3575459055011265, 48.860713882671384, '1', 2.5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(278, 2.357647638987624, 48.860781789724264, '1', 3, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(279, 2.3577202687801315, 48.86088694754306, '1', 3, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(280, 2.3580892179157615, 48.86112242988779, '1', 3, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(281, 2.3591758792411763, 48.86199638768996, '1', 3, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(243, 2.3475530521702312, 48.85866316544778, '0', 5, '3', 'Hysteria', '{\"utilisateur\":\"Fauteuils du bar concert le Klub\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(377, 2.4272765022257445, 48.859811631386975, '0', 4, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(378, 2.4272946889689866, 48.85929157280148, '0', 5, '2', 'Hysteria', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(480, 2.7167080668590367, 47.507485063086726, '4', 5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"Petits siÃ¨ges sur la place du monument\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/VChZCTzaDdYjYQG5F6HJ.png', '2021-06-27 15:51:52'),
(384, 1.554125521086619, 50.32252563037475, '1', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(385, 1.5459321754164275, 50.323475160843316, '6', 4.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(224, 2.4599401651184607, 48.86063241356232, '1', 4.5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"Dans une zone de rencontre\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(418, -0.12073220396817007, 51.526437282293784, '2', 3.5, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(403, 2.411494405617236, 48.84685482307957, '1', 2, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(477, 2.719284513220706, 47.50728771856347, '1', 2, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Petit banc prÃ¨s d\'une route\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/juQDJoGOcPENBIr7iu9t.png', '2021-06-27 15:51:52'),
(129, 4.348418020111256, 44.30764391544594, '7', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"Petit banc ombrage en metal sous un petit arbre\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(476, 2.720064897596517, 47.50581199548962, '2', 3, '1', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/9MIppoSth7vWimWjCwRb.png', '2021-06-27 15:51:52'),
(475, 2.7166941931347455, 47.50604908301246, '1', 3, '1', 'nadke', '{\"utilisateur\":\"face Ã  l\'etang\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/M0fgMQcLwNxO5Hx7ud1N.png', '2021-06-27 15:51:52'),
(249, 2.4168185941864806, 48.92677964874507, '0', 5, '2', 'Hysteria', '{\"utilisateur\":\"en forme de pince a linge, supermarche\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(415, -1.5690011185949975, 48.77605125879789, '6', 4.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(420, -2.0553022473229956, 48.63585521499904, '6', 5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(421, -2.0472738852288037, 48.636792810901106, '6', 5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(171, 1.746341181587734, 45.7391387572289, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"Groupe de deux bancs situes pres d\'une aire de jeu pour enfant\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/09aOfjM4Z0cS8C8DPfeQ.jpg', '2021-06-27 15:51:52'),
(424, 5.737908175500932, 43.13601325489072, '1', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(425, 5.737850756637511, 43.13604172798587, '1', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(426, 5.737863422765836, 43.13608830488466, '1', 4, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(427, 5.737748003855867, 43.136176092225504, '1', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(428, 5.737744786858116, 43.136186965473755, '1', 4, '2', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(430, 5.738938876482262, 43.13481573291165, '2', 3.5, '1', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(431, 3.2053522229973805, 42.054486372323424, '1', 5, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(179, 1.9273286482934, 45.598340144563515, '7', 4.5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"En face d\'un super marche\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(376, 2.2317366811791524, 48.88839193373522, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"En face du palais de la jeunesse\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(479, 2.7193676596966, 47.50728702493173, '1', 4, '1', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/48Dkfd8zR93b2MYaZpX8.png', '2021-06-27 15:51:52'),
(175, 1.7461815438411932, 45.73858645466553, '2', 3.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Deux bancs accompagnes d\'une table de pic-nic\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/j9qJc9dzyeqXuK9fMPBh.jpg', '2021-06-27 15:51:52'),
(481, 2.7165235805088557, 47.507426446336, '4', 4.5, '1', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/2PR8ha3TVeOtTWb7rliI.png', '2021-06-27 15:51:52'),
(416, -1.5691949172930126, 48.743917558829985, '6', 3, '1', 'Chripmus45', '{\"utilisateur\":\"cabane VAUBAN (Manche)\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(170, 1.745799982926533, 45.73889524059038, '2', 5, '1', 'nadke', '{\"utilisateur\":\"bord de la Vienne\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/DZhTv4JSLPBQxH6EuNgD.jpg', '2021-06-27 15:51:52'),
(405, 2.412689147247478, 48.84671860168346, '1', 1, '3', 'Gusther', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(423, 5.737977921773321, 43.13597636111955, '1', 4, '2', 'Gusther', '{\"utilisateur\":\"belle vue sur la mer\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(245, 2.4086540697277483, 48.863599628969645, '1', 5, '3', 'nadke', '{\"utilisateur\":\"bd Davout, face tramway a porte de Bagnolet\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/RnlOfPTMXJ5eDkIYRyo2.jpg', '2021-06-27 15:51:52'),
(120, 4.470469306090977, 44.216547745839314, '1', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"Banc se trouvant a l\'entree d\'un ville dans un virage. Endroit plutot calme hors periode estivale\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(216, -0.8630164819126578, 48.95035429750388, '3', 5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Banc pres d\'une base de saut\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(217, -0.863066476861896, 48.95036741913614, '3', 5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Banc pres d\'une base de saut\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(169, 1.7461906266583982, 45.739130152908466, '2', 4.5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"Banc pres d\'un parc pour enfant\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/ZnOoZhgoiZS3jc53zHvD.jpg', '2021-06-27 15:51:52'),
(404, 2.4120145196056697, 48.84677568066394, '1', 4, '3', 'MisterGoodDeal', '{\"utilisateur\":\"Banc pres de Porte de Vincennes\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(128, 4.34783122397049, 44.30741406424186, '7', 0, '2', 'nadke', '{\"utilisateur\":\"Banc en pierre\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(149, 1.9266888880235284, 45.59912203391169, '1', 3, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Banc en pierre\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(381, 2.343523961121831, 48.86882112803589, '1', 3.5, '3', 'Chripmus45', '{\"utilisateur\":\"banc en pierre\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(151, 1.9249735878452097, 45.60074619714542, '7', 0, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Banc en metal sous un abris bus\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(195, 1.7927236460009532, 45.53816182567266, '2', 5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Banc en metal pres d\'un parc d\'enfant\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/NIlHiRuolyCtPQISyqmO.jpg', '2021-06-27 15:51:52'),
(152, 1.9247228281975104, 45.600616913445776, '0', 4, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Banc en metal dans une vieille gare\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(154, 1.9251074894649793, 45.603008991569844, '2', 3.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Banc en face d\'un etang\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(155, 1.9246846213697941, 45.60356841759578, '2', 4, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Banc en face d\'un etang\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(166, 1.7415751057742275, 45.739519551202484, '7', 5, '2', 'MisterGoodDeal', '{\"utilisateur\":\"Banc en face de la gare\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/9VCHZSZr7ZfPGm4ppPzP.jpg', '2021-06-27 15:51:52'),
(150, 1.9265387921151957, 45.59921615678644, '1', 1.5, '1', 'MisterGoodDeal', '{\"utilisateur\":\"Banc en bois tres vieux\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(248, 2.417335608568606, 48.92730155464387, '0', 5, '2', 'Hysteria', '{\"utilisateur\":\"banc du supermarche O Frais\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(173, 1.7463430247652052, 45.739216450228966, '2', 4, '2', 'MisterGoodDeal', '{\"utilisateur\":\"Banc dans une aire de jeu pour enfants\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/feBL6kef8s521XBTOJfH.jpg', '2021-06-27 15:51:52'),
(223, 2.3956328614731164, 48.88904972814514, '1', 4, '3', 'Hysteria', '{\"utilisateur\":\"Arret de tram\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(194, 1.7931137679628844, 45.53796756450251, '1', 3, '1', 'nadke', '{\"utilisateur\":\"6 bancs en pierre\",\"communaute\":[]}', '', '2021-06-27 15:51:52'),
(168, 1.7443154789046802, 45.74065341754195, '1', 4, '1', 'nadke', '{\"utilisateur\":\"2 bancs en face du pont et la riviere la Vienne\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/9rcOGSDQTlsXaTmfHLls.jpg', '2021-06-27 15:51:52'),
(164, 1.926909508204881, 45.60305969896412, '2', 5, '1', 'nadke', '{\"utilisateur\":\"2 bancs avec une table au bord d\'un etang\",\"communaute\":[]}', 'http://geobench.turtletv.fr/images/uploads/k6fPrS0oysbHWBpCaOHL.jpg', '2021-06-27 15:51:52'),
(490, 2.761064494193048, 47.595776396191184, '5', 3, '1', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/WaxyWQjCqNxlT5Cv6b9P.png', '2021-06-27 15:51:52'),
(491, 2.324864366624107, 48.887523830655375, '2', 4, '1', 'Chripmus45', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/uZeiHJtfhDspWAFTZ4gt.png', '2021-06-27 15:51:52'),
(482, 2.7201053083436473, 47.505770978549165, '2', 4, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/h3b9ZvS4uJbCrWpUBMel.png', '2021-06-27 15:51:52'),
(483, 2.718125386269288, 47.50589631876986, '2', 4, '1', 'nadke', '{\"utilisateur\":\"Ceci est un commentaire\",\"communaute\":[{\"user\":\"MisterGoodDeal\",\"comment\":\"Très joli banc à côté d\'un étang \"},{\"user\":\"MisterGoodDeal\",\"comment\":\"Commentaire test \"}]}', 'http://geobench.turtletv.fr/v3/images/Hk2RXX8SMDsRSibQMzHC.png', '2021-06-27 22:38:54'),
(484, 2.757406115324348, 47.5975224915626, '0', 2, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/ugIJbDSPn7j21oNkiJeg.png', '2021-06-27 15:51:52'),
(485, 2.7573112942658087, 47.59767703536071, '0', 2, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/A4lMFfT2U8A9hJC3gqAw.png', '2021-06-27 15:51:52'),
(486, 2.7572664552907833, 47.59777934736849, '0', 2, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/AP6YCYLI7DOASblyMlDa.png', '2021-06-27 15:51:52'),
(487, 2.7572129010714113, 47.59780729832827, '0', 2, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/S3DbxDPZmdl9lfh2qYwI.png', '2021-06-27 15:51:52'),
(488, 2.7602317805220036, 47.59625350129657, '1', 4, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/47zCKNSvr8owvuuk76Rk.png', '2021-06-27 15:51:52'),
(489, 2.7602317805220036, 47.59625350129657, '1', 4, '1', 'nadke', '{\"utilisateur\":\"\",\"communaute\":[]}', 'http://geobench.turtletv.fr/v3/images/N2ibC2CgGSp7z20UWYw6.png', '2021-06-27 15:51:52'),
(492, 2.3427043013222004, 48.870426174950914, '1', 4.57854, '3', 'MisterGoodDeal', '{\"utilisateur\":\"\",\"communaute\":[]}', '', '2021-07-05 15:57:07');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id` int(11) NOT NULL,
  `nom` text COLLATE latin1_general_ci NOT NULL,
  `contenu` text COLLATE latin1_general_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `nom`, `contenu`, `date`) VALUES
(1, 'Aucun evenement', 'Aucun evenement n_a ete saisi pour le moment, revenez plus tard !', '2018-08-19 22:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `code` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `server_log`
--

CREATE TABLE `server_log` (
  `id` int(11) NOT NULL,
  `log` text NOT NULL,
  `user` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `server_log`
--

INSERT INTO `server_log` (`id`, `log`, `user`, `timestamp`) VALUES
(1, '{\"accepted\":[\"tomlarboni@gmail.com\"],\"rejected\":[],\"envelopeTime\":54,\"messageTime\":36,\"messageSize\":20994,\"response\":\"250 Requested mail action okay, completed: id=1MGQax-1lzJu01s1l-00GrzV\",\"envelope\":{\"from\":\"geobench@turtletv.fr\",\"to\":[\"tomlarboni@gmail.com\"]},\"messageId\":\"<8e467a0f-5a5c-4040-916e-0fb5970e0b1d@turtletv.fr>\"}', -1, '2021-07-04 21:11:20'),
(2, '{\"accepted\":[\"chripmus45@gmail.com\"],\"rejected\":[],\"envelopeTime\":69,\"messageTime\":39,\"messageSize\":20994,\"response\":\"250 Requested mail action okay, completed: id=1MvazO-1lANkn1obG-00sbVC\",\"envelope\":{\"from\":\"geobench@turtletv.fr\",\"to\":[\"chripmus45@gmail.com\"]},\"messageId\":\"<9279ff61-82b9-e61a-077b-24e85ee526d8@turtletv.fr>\"}', -1, '2021-07-05 15:40:38'),
(3, '{\"accepted\":[\"mcamus@condorcet93.fr\"],\"rejected\":[],\"envelopeTime\":107,\"messageTime\":43,\"messageSize\":20809,\"response\":\"250 Requested mail action okay, completed: id=1MS1G7-1lbRBX3Tjf-00TQIc\",\"envelope\":{\"from\":\"geobench@turtletv.fr\",\"to\":[\"mcamus@condorcet93.fr\"]},\"messageId\":\"<6fc6218e-ad10-cfe8-a832-f45b621651f9@turtletv.fr>\"}', -1, '2021-07-05 16:13:39'),
(4, '{\"accepted\":[\"nadke22@gmail.com\"],\"rejected\":[],\"envelopeTime\":43,\"messageTime\":35,\"messageSize\":20991,\"response\":\"250 Requested mail action okay, completed: id=1N2Ujn-1l3VF42jPz-013vEU\",\"envelope\":{\"from\":\"geobench@turtletv.fr\",\"to\":[\"nadke22@gmail.com\"]},\"messageId\":\"<81b44146-ff48-80d7-5322-801161b3a7c1@turtletv.fr>\"}', -1, '2021-07-05 16:28:36'),
(5, '{\"accepted\":[\"Mcamus@condorcet93.fr\"],\"rejected\":[],\"envelopeTime\":74,\"messageTime\":36,\"messageSize\":20995,\"response\":\"250 Requested mail action okay, completed: id=1M4aEC-1m0atJ1aZ4-001kxI\",\"envelope\":{\"from\":\"geobench@turtletv.fr\",\"to\":[\"Mcamus@condorcet93.fr\"]},\"messageId\":\"<8d1fc9ea-70e2-8bc5-0f5c-327623430bb6@turtletv.fr>\"}', -1, '2021-07-07 15:22:58'),
(6, 'Erreur interne PUT/banc/commentaire => Cannot set headers after they are sent to the client', 1, '2021-07-08 11:31:28'),
(7, '{\"accepted\":[\"Gustave.lg@gmail.com\"],\"rejected\":[],\"envelopeTime\":61,\"messageTime\":43,\"messageSize\":20994,\"response\":\"250 Requested mail action okay, completed: id=1MspyA-1lDAGR2H6W-00tAWM\",\"envelope\":{\"from\":\"geobench@turtletv.fr\",\"to\":[\"Gustave.lg@gmail.com\"]},\"messageId\":\"<58d2762a-d78c-c436-b609-16cbf7d72884@turtletv.fr>\"}', -1, '2021-07-08 17:34:58'),
(8, '{\"accepted\":[\"Gustave.lg@gmail.com\"],\"rejected\":[],\"envelopeTime\":117,\"messageTime\":32,\"messageSize\":20994,\"response\":\"250 Requested mail action okay, completed: id=1Mw9Lu-1l9qqX3Fhs-00s5CV\",\"envelope\":{\"from\":\"geobench@turtletv.fr\",\"to\":[\"Gustave.lg@gmail.com\"]},\"messageId\":\"<bdd5fd78-6fcf-de94-9799-3f228409cfd8@turtletv.fr>\"}', -1, '2021-07-08 17:37:25'),
(9, '{\"fieldCount\":0,\"affectedRows\":1,\"insertId\":24,\"info\":\"\",\"serverStatus\":2,\"warningStatus\":1}', -1, '2021-07-08 19:18:11'),
(10, '{\"fieldCount\":0,\"affectedRows\":1,\"insertId\":25,\"info\":\"\",\"serverStatus\":2,\"warningStatus\":1}', -1, '2021-07-08 19:30:15'),
(11, '{\"fieldCount\":0,\"affectedRows\":1,\"insertId\":26,\"info\":\"\",\"serverStatus\":2,\"warningStatus\":1}', -1, '2021-07-09 09:20:00'),
(12, 'Erreur interne GET/bancs => Cannot set headers after they are sent to the client', 26, '2021-07-09 09:48:42'),
(13, 'Erreur interne GET/bancs => Cannot set headers after they are sent to the client', 26, '2021-07-09 09:48:45'),
(14, 'Erreur interne GET/bancs => Cannot set headers after they are sent to the client', 26, '2021-07-09 09:50:06'),
(15, '{\"accepted\":[\"mcamus@condorcet93.fr\"],\"rejected\":[],\"envelopeTime\":95,\"messageTime\":35,\"messageSize\":20995,\"response\":\"250 Requested mail action okay, completed: id=1MA7X0-1lrOZO0Bvm-00BebD\",\"envelope\":{\"from\":\"geobench@turtletv.fr\",\"to\":[\"mcamus@condorcet93.fr\"]},\"messageId\":\"<b5e007d8-1271-0ee7-adee-a2a483fd6c87@turtletv.fr>\"}', -1, '2021-07-09 15:11:43');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `is_ads` int(11) NOT NULL DEFAULT 1,
  `is_banned` int(11) NOT NULL DEFAULT 0,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `prenom` text COLLATE latin1_general_ci NOT NULL,
  `nom` text COLLATE latin1_general_ci NOT NULL,
  `mail` text COLLATE latin1_general_ci NOT NULL,
  `pseudo` text COLLATE latin1_general_ci NOT NULL,
  `mdp` text COLLATE latin1_general_ci NOT NULL,
  `favoris` text COLLATE latin1_general_ci NOT NULL,
  `reset_key` varchar(30) COLLATE latin1_general_ci NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `is_ads`, `is_banned`, `is_deleted`, `prenom`, `nom`, `mail`, `pseudo`, `mdp`, `favoris`, `reset_key`) VALUES
(1, 1, 0, 0, 'Milan', 'Camus', 'mcamus@condorcet93.fr', 'MisterGoodDeal', '$2b$10$DnctkVzOwX7IoqbuuSPda.JGbu0D.e4db2AHSQenz2V6NruscGzWy', '[172,168,163]', '0'),
(24, 1, 0, 0, 'Arthur', 'Vadrot', 'krafteck666@gmail.com', 'Æsahættr', '$2b$10$RuHeTv143ew/cTY0fZh6zORLcd2SnCEzlukIaAHS6lvErbIKHWX0O', '[493]', ' IM9wkvWcmT00tKrstcHSCVKBQBRYv'),
(2, 1, 0, 0, 'Gustave', 'Legrand', 'gustave.lg@gmail.com', 'Gusther', '$2b$10$.ZTAwpKc8czq903iaXkDv.fDcvJFujZac1SkklEd1rSJtpifWCkHK', '[]', '0'),
(3, 1, 0, 0, 'Laurent', 'Camus', 'chripmus45@gmail.com', 'Chripmus45', '$2b$10$a7r3.mfM0tb.XIo17MhLJ.4YFEy2aYY8d/RkKHNfrhas6PqtJlRGW', '[]', '0'),
(4, 1, 0, 0, 'Nadia', 'CHRIPKO', 'nadke22@gmail.com ', 'nadke', '$2b$10$0UwnNE/jcRjd7DFNcSBgGeXzjBOF3dupdeFnbNcRkqSm63Pba4MJC', '[]', '0'),
(5, 1, 0, 0, 'Lucas', 'Henry', 'lucashlegeek@gmail.com', 'Hysteria', '$2b$10$n0mJux6C0MIB091AQ3WGL.AimcpyX2lfb79d8IIEdOlhz6pbod2B.', '[]', '0'),
(16, 1, 0, 0, 'Aurelien', 'Pelé', 'aurelien1702@yahoo.fr', 'aurel', '', '[]', '0'),
(12, 1, 0, 0, 'Tom', 'Larboni', 'tomlarboni@gmail.com', 'tomu', '$2b$10$ECI8R5GDD4FtcJB1XJJVLeilpVrhzKYJXvZE4ilT/DsigNMYygK.u', '[]', '0'),
(13, 1, 0, 0, 'Julie', 'chripko', 'juliechripko@gmail.com', 'ju', '', '[]', '0'),
(14, 1, 0, 0, 'Anaëlle', 'Surier', 'anaelle2705@gmail.com', 'Ananas', '', '[]', '0'),
(15, 1, 0, 0, 'Stef', 'Fichot', 'steffichot@gmail.com', 'Enzo8306', '', '[]', '0'),
(17, 1, 0, 0, 'Max', 'Thuijns', 'maxthuijns@gmail.com', 'OniKa', '', '[]', '0'),
(18, 1, 0, 0, 'Fatima', 'Bahfir', 'fatima.bahfir@gmail.com', 'cataleya', '', '[]', '0');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bancs`
--
ALTER TABLE `bancs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `server_log`
--
ALTER TABLE `server_log`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bancs`
--
ALTER TABLE `bancs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=496;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `server_log`
--
ALTER TABLE `server_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
