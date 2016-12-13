-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 13. dec 2016 ob 22.25
-- Različica strežnika: 10.1.10-MariaDB
-- Različica PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `jdemolay`
--

-- --------------------------------------------------------

--
-- Struktura tabele `citizen`
--

CREATE TABLE `citizen` (
  `CITIZEN_ID` int(11) NOT NULL,
  `CITIZEN_NAME` varchar(50) COLLATE utf8_slovenian_ci NOT NULL,
  `STR` int(11) NOT NULL DEFAULT '0',
  `DEX` int(11) NOT NULL DEFAULT '0',
  `INTL` int(11) NOT NULL DEFAULT '0',
  `CON` int(11) NOT NULL DEFAULT '0',
  `CHR` int(11) NOT NULL DEFAULT '0',
  `BALANCE` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci COMMENT='belezi citizene in statse';

-- --------------------------------------------------------

--
-- Struktura tabele `donacija`
--

CREATE TABLE `donacija` (
  `ID_DONACIJE` int(11) NOT NULL,
  `VNESEL_USER` int(11) NOT NULL,
  `DATUM_VNOSA` datetime NOT NULL,
  `KOLICINA` int(11) NOT NULL,
  `RESURS` int(11) DEFAULT NULL,
  `CITIZEN` int(11) DEFAULT NULL,
  `TIP` char(1) COLLATE utf8_slovenian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci COMMENT='belezi vsako donacijo';

-- --------------------------------------------------------

--
-- Struktura tabele `sif_res`
--

CREATE TABLE `sif_res` (
  `RES_ID` int(11) NOT NULL,
  `NAZIV` varchar(50) COLLATE utf8_slovenian_ci NOT NULL,
  `MON_VAL` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci COMMENT='sifrant resursov';

--
-- Odloži podatke za tabelo `sif_res`
--

INSERT INTO `sif_res` (`RES_ID`, `NAZIV`, `MON_VAL`) VALUES
(256, '﻿Piece of wood', 1.1),
(257, 'Iron piece', 2.5),
(258, 'Stone piece', 1),
(259, 'Mulberry leaf', 0.5),
(260, 'Hay', 0.95),
(261, 'Clay piece', 1.2),
(262, 'Bread', 0.7),
(263, 'Jar of milk', 0.78),
(264, 'Wheat bag', 0.85),
(265, 'Paper piece', 0.6),
(266, 'Mulberry', 1.4),
(267, 'Herbs and Honey infusion', 7.4),
(268, 'Bricks', 2),
(269, 'Salt heap', 1.44),
(270, 'Meat', 2.85),
(271, 'Wheat seed', 0.15),
(272, 'Coal piece', 2.5),
(273, 'Manure', 1.5),
(274, 'Fertilizer', 2.2),
(275, 'Leather piece', 2.8),
(276, 'Pottery', 2.3),
(277, 'Cheese', 8),
(278, 'Mulberry seed', 0.15),
(279, 'Linen seed', 0.15),
(280, 'Medical herbs', 1.3),
(281, 'Sand heap', 2),
(282, 'Linen yarn', 1.9),
(283, 'Meat soup', 11),
(284, 'Cotton yarn', 2.2),
(285, 'Wax piece', 1.1),
(286, 'Glass bottle', 1.1),
(287, 'Flowers', 1.2),
(288, 'Wool yarn', 3),
(289, 'Cotton seed', 0.15),
(290, 'Honey', 3.4),
(291, 'Medical herb seed', 0.15),
(292, 'Medicinal mushrooms', 1.8),
(293, 'Fish', 3.6),
(294, 'Fish soup', 111),
(295, 'Wax seal', 2),
(296, 'Silk yarn', 8),
(297, 'Water bottle', 1),
(298, 'Flower seed', 0.15),
(299, 'Hops', 0.3),
(300, 'Grapes', 1.7),
(301, 'Mead bottle', 6),
(302, 'Wooden token', 1),
(303, 'Rag shirt', 5),
(304, 'Rag trousers', 5),
(305, 'Grape seed', 0.15),
(306, 'Mulberry cake', 6.5),
(307, 'Glass bulb', 5),
(308, 'Hand axe', 30),
(309, 'Hammer', 12),
(310, 'Male shoes', 20),
(311, 'Mulberry brandy', 12),
(312, 'Longsword', 95),
(313, 'Male short sleeve shirt', 35),
(314, 'Gold piece', 10),
(315, 'War axe', 39.8),
(316, 'Wine bottle', 5.5),
(317, 'Boots', 25),
(318, 'Hoe', 32),
(319, 'Chainmail', 90.5),
(320, 'Pickaxe', 36),
(321, 'Male hose', 32),
(322, 'Beer', 5.5),
(323, 'Hop seeds', 0.15),
(324, 'Wooden dummy', 14.1),
(325, 'Malt', 0.5),
(326, 'Iron helmet mod 2', 60),
(327, 'Shovel', 18),
(328, 'Light leather armor', 41),
(329, 'Leather trousers', 30),
(330, 'Plate armor', 147),
(331, 'Knife', 25),
(332, 'Mandragora', 1.5),
(333, 'Violet potion', 50),
(334, 'Iron sabatons', 31),
(335, 'Iron leg armor', 97.5),
(336, 'Iron bucket', 30.1),
(337, 'Short sword', 25.7),
(338, 'Female shoes', 24.2),
(339, 'Iron helmet mod 1', 14.7),
(340, 'Robe', 65),
(341, 'Strong leather trousers', 36),
(342, 'Iron norman shield', 103),
(343, 'Rag robe', 6),
(344, 'Wooden norman shield', 39.3),
(345, 'Warhammer', 66.4),
(346, 'Hoe blade', 14.1),
(347, 'Iron shield', 44.6),
(348, 'Scimitar', 46.8),
(349, 'Pickaxe hardhead', 25.9),
(350, 'Fishing net', 49.8),
(351, 'Halberd', 94),
(352, 'Medium sized cart', 300),
(353, 'Hatchet blade', 15.4),
(354, 'Bellow', 22.05),
(355, 'Stripped male hose', 42),
(356, 'Noblewoman\'s gown', 130),
(357, 'Mace', 52),
(358, 'Knife blade', 18),
(359, 'Sapphire ring', 52),
(360, 'Wooden shield', 20),
(361, 'Jar tar', 2000),
(362, 'Male short sleeve shirt', 35),
(363, 'Wooden barrel', 35),
(364, 'Emerald ring', 52),
(365, 'Bracelet', 93),
(366, 'Press for grapes', 16),
(367, 'Distiller', 27),
(368, 'Morning star', 78),
(369, 'Male hat', 35),
(370, 'Ruby ring', 52),
(371, 'Fauchard', 26),
(372, 'Female hose', 322),
(373, 'Female short sleeve shirt', 35),
(374, 'Golden basin', 200),
(375, 'Hood', 41),
(376, 'Female hat', 35),
(377, 'Veil', 180),
(378, 'Small cart', 200),
(379, 'Diamond ring', 2000),
(380, 'Large jar', 160),
(381, 'Crown', 2000),
(382, 'Female stripped hose', 42),
(383, 'Female long sleeve shirt', 160),
(384, 'Sturdy table', 700),
(385, 'Scissors', 13),
(386, 'Saw', 14),
(387, 'Potter tools', 11),
(388, 'Sickle', 21),
(389, 'Ink bulb', 65),
(390, 'Mandragora brew', 3.5),
(391, 'Surgical kit', 5.84),
(392, 'Surgical instruments', 4.4),
(393, 'Health care kit', 14),
(394, 'Holy book', 150),
(395, 'Religious scepter', 102),
(396, 'Mortar and pestle', 18),
(397, 'Cooking pot', 20),
(398, 'Male long sleeve shirt', 160),
(399, 'Religious headpiece', 420),
(400, 'Religious tunic lvl4', 223),
(401, 'Religious tunic lvl3', 234),
(402, 'Religious tunic lvl2', 234),
(403, 'Religious tunic lvl1', 250),
(404, 'Working hour', 3);

-- --------------------------------------------------------

--
-- Struktura tabele `user`
--

CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL,
  `USERNAME` varchar(100) COLLATE utf8_slovenian_ci NOT NULL,
  `PASSWORD` varchar(200) COLLATE utf8_slovenian_ci NOT NULL,
  `TIP` char(1) COLLATE utf8_slovenian_ci NOT NULL DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci COMMENT='belezi uporabnike ki imajo dostop';

--
-- Odloži podatke za tabelo `user`
--

INSERT INTO `user` (`USER_ID`, `USERNAME`, `PASSWORD`, `TIP`) VALUES
(1, 'miha', '2501637ef529ba28ba048ac8349cfe6b089bc45a5d77a253e7b31364b82118dd', 'A');

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `citizen`
--
ALTER TABLE `citizen`
  ADD PRIMARY KEY (`CITIZEN_ID`);

--
-- Indeksi tabele `donacija`
--
ALTER TABLE `donacija`
  ADD PRIMARY KEY (`ID_DONACIJE`),
  ADD KEY `FK_user-don` (`VNESEL_USER`),
  ADD KEY `FK_res-don` (`RESURS`),
  ADD KEY `fk_cit_don` (`CITIZEN`);

--
-- Indeksi tabele `sif_res`
--
ALTER TABLE `sif_res`
  ADD PRIMARY KEY (`RES_ID`);

--
-- Indeksi tabele `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `citizen`
--
ALTER TABLE `citizen`
  MODIFY `CITIZEN_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT tabele `donacija`
--
ALTER TABLE `donacija`
  MODIFY `ID_DONACIJE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT tabele `sif_res`
--
ALTER TABLE `sif_res`
  MODIFY `RES_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;
--
-- AUTO_INCREMENT tabele `user`
--
ALTER TABLE `user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `donacija`
--
ALTER TABLE `donacija`
  ADD CONSTRAINT `fk_cit_don` FOREIGN KEY (`CITIZEN`) REFERENCES `citizen` (`CITIZEN_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_res_don` FOREIGN KEY (`RESURS`) REFERENCES `sif_res` (`RES_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usr_don` FOREIGN KEY (`VNESEL_USER`) REFERENCES `user` (`USER_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
