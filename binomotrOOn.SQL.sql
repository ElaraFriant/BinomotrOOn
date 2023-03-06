-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 03, 2023 at 08:23 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `binomotron2`
--

-- --------------------------------------------------------

--
-- Table structure for table `groupes`
--

CREATE TABLE `groupes` (
  `id_groupe` int(11) NOT NULL,
  `nom_groupe` varchar(50) NOT NULL,
  `date_debut_projet` date NOT NULL,
  `date_fin_projet` date NOT NULL,
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupes`
--

INSERT INTO `groupes` (`id_groupe`, `nom_groupe`, `date_debut_projet`, `date_fin_projet`, `id_projet`) VALUES
(1, 'AndyTyphaineBino', '2023-02-03', '2022-02-08', 1),
(2, 'SolenneElaraResi', '2023-01-10', '2023-01-16', 2),
(3, 'RanBillBino', '2022-02-03', '2022-02-08', 1),
(4, 'HenryAllenResi', '2022-08-15', '2022-08-23', 2),
(6, 'groupe de Tom Sing Vien', '2023-03-03', '2023-03-08', 2),
(7, 'groupe de Friant', '2023-03-03', '2023-03-08', 2);

-- --------------------------------------------------------

--
-- Table structure for table `projets`
--

CREATE TABLE `projets` (
  `id_projet` int(11) NOT NULL,
  `nom_projet` varchar(50) NOT NULL,
  `nom_createur` varchar(50) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projets`
--

INSERT INTO `projets` (`id_projet`, `nom_projet`, `nom_createur`, `id_utilisateur`) VALUES
(1, 'Binomotron', 'Alexandre', 28),
(2, 'Resistron', 'Stephane', 36);

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id_promotion` int(11) NOT NULL,
  `nom_promotion` varchar(50) NOT NULL,
  `date_entree_promotion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id_promotion`, `nom_promotion`, `date_entree_promotion`) VALUES
(1, 'Accenture2023', '2023-01-01'),
(2, 'Promo Microsoft', '2022-02-01');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `nom_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_role`, `nom_role`) VALUES
(1, 'Admin'),
(2, 'Professeur'),
(3, 'Apprenant');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL,
  `nom_utilisateur` varchar(50) NOT NULL,
  `prenom_utilisateur` varchar(50) NOT NULL,
  `mail_utilisateur` varchar(50) NOT NULL,
  `mdp_utilisateur` varchar(50) NOT NULL,
  `id_promotion` int(11) DEFAULT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_utilisateur`, `nom_utilisateur`, `prenom_utilisateur`, `mail_utilisateur`, `mdp_utilisateur`, `id_promotion`, `id_role`) VALUES
(25, 'Tom Sing Vien', 'Andy', 'andy.tomsingvien@isen-ouest.yncrea.fr', 'dyna', 1, 3),
(26, 'Claudepierre', 'Typhaine', 'Typhaine.Claudepierre@isen-ouest.yncrea.fr', '', 1, 3),
(27, 'Cap', 'Solenne', 'Solenne.Cap@isen-ouest.yncrea.fr', '', 1, 3),
(28, 'Dermont', 'Alexandre', 'Alexandre.Dermont@isen-ouest.yncrea.fr', 'montder', NULL, 2),
(29, 'Tanplan', 'Ran', 'Ran.Tanplan@isen-ouest.yncrea.fr', '', 2, 3),
(30, 'Friant', 'Elera', 'Elera.Friant@isen-ouest.yncrea.fr', '', 1, 3),
(31, 'Gates', 'Bill', 'Bill.Gates@isen-ouest.yncrea.fr', '', 2, 3),
(32, 'Henry', 'Thierry', 'Thierry.Henry@isen-ouest.yncrea.fr', '', 2, 3),
(33, 'Allen', 'Paul', 'Paul.Allen@isen-ouest.yncrea.fr', '', 2, 3),
(36, 'Jamin', 'Stephane', 'Stephane.Jarmin@isen-ouest.yncrea.fr', '', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateurs_groupes`
--

CREATE TABLE `utilisateurs_groupes` (
  `id_utilisateur` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateurs_groupes`
--

INSERT INTO `utilisateurs_groupes` (`id_utilisateur`, `id_groupe`) VALUES
(25, 1),
(26, 1),
(33, 4),
(32, 4),
(27, 2),
(30, 2),
(31, 3),
(29, 3),
(25, 6),
(26, 6),
(27, 6),
(30, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`id_groupe`),
  ADD KEY `id_projet` (`id_projet`);

--
-- Indexes for table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`id_projet`),
  ADD KEY `id_utilisateurs` (`id_utilisateur`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id_promotion`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_promotion` (`id_promotion`);

--
-- Indexes for table `utilisateurs_groupes`
--
ALTER TABLE `utilisateurs_groupes`
  ADD KEY `id_groupe` (`id_groupe`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `id_groupe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `projets`
--
ALTER TABLE `projets`
  MODIFY `id_projet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id_promotion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `groupes`
--
ALTER TABLE `groupes`
  ADD CONSTRAINT `groupes_ibfk_1` FOREIGN KEY (`id_projet`) REFERENCES `projets` (`id_projet`);

--
-- Constraints for table `projets`
--
ALTER TABLE `projets`
  ADD CONSTRAINT `projets_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`);

--
-- Constraints for table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`),
  ADD CONSTRAINT `utilisateurs_ibfk_2` FOREIGN KEY (`id_promotion`) REFERENCES `promotions` (`id_promotion`);

--
-- Constraints for table `utilisateurs_groupes`
--
ALTER TABLE `utilisateurs_groupes`
  ADD CONSTRAINT `utilisateurs_groupes_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id_groupe`),
  ADD CONSTRAINT `utilisateurs_groupes_ibfk_2` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
