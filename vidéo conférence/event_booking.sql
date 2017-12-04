-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2017 at 05:07 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `event` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` text,
  `eventDate` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `nbSlotsPerDay` int(11) DEFAULT NULL,
  `nbSpeakerMaxByModule` int(11) DEFAULT NULL,
  `bookingOpen` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `halls`
--

CREATE TABLE `halls` (
  `id` int(11) NOT NULL,
  `hall` varchar(30) DEFAULT NULL,
  `building` varchar(60) DEFAULT NULL,
  `picture` text,
  `capacity` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `halls`
--

INSERT INTO `halls` (`id`, `hall`, `building`, `picture`, `capacity`) VALUES
(1, 'Main', 'A1-001', 'img/halls/main.jpg', 500),
(2, 'Hall1', 'A2-001', 'img/halls/hall1.jpg', 100),
(3, 'Hall2', 'A2-001', 'img/halls/hall2.jpg', 50),
(4, 'Hall3', 'A2-002', 'img/halls/hall3.jpg', 50),
(5, 'Hall4', 'A3-001', 'img/halls/hall4.jpg', 50),
(6, 'Hall5', 'A3-002', 'img/halls/hall5.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `module` varchar(100) DEFAULT NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module`, `description`) VALUES
(1, 'Keynote', 'Presentation des nouveautées d\'Apple');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'contributeur'),
(3, 'membre');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `idModule` int(11) DEFAULT NULL,
  `idHall` int(11) DEFAULT NULL,
  `idSlot` int(11) DEFAULT NULL,
  `mainSession` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `idModule`, `idHall`, `idSlot`, `mainSession`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 1, 2, 0),
(3, 4, 2, 2, 0),
(4, 3, 3, 2, 0),
(5, 4, 4, 3, 0),
(6, 2, 1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions_auditors`
--

CREATE TABLE `sessions_auditors` (
  `idSession` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions_auditors`
--

INSERT INTO `sessions_auditors` (`idSession`, `idUser`) VALUES
(1, 1),
(2, 3),
(3, 2),
(4, 1),
(5, 1),
(5, 3),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions_speakers`
--

CREATE TABLE `sessions_speakers` (
  `idSession` int(11) NOT NULL,
  `idUser` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions_speakers`
--

INSERT INTO `sessions_speakers` (`idSession`, `idUser`) VALUES
(1, 2),
(1, 6),
(2, 2),
(2, 14),
(3, 11);

-- --------------------------------------------------------

--
-- Table structure for table `slots`
--

CREATE TABLE `slots` (
  `id` int(11) NOT NULL,
  `idEvent` int(11) DEFAULT NULL,
  `slot` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slots`
--

INSERT INTO `slots` (`id`, `idEvent`, `slot`) VALUES
(1, 2, '2017-09-09 10:00:00'),
(2, 2, '2017-09-09 14:00:00'),
(3, 2, '2017-09-09 16:00:00'),
(4, 2, '2017-09-10 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `surname` varchar(30) DEFAULT NULL,
  `idRole` int(11) DEFAULT NULL,
  `themeChoice` varchar(30) DEFAULT 'main1.css',
  `lastActiveConnection` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `surname`, `idRole`, `themeChoice`, `lastActiveConnection`) VALUES
(1, 'adm', 'adm@conference.fr', '$2y$10$AHhvaGCuVR0evH6kQb7Fku.kznlFP2PKo2s4xuEKpY4T.Owh/9sHK', ' ', 'Administrateur', 1, 'main1.css', '2017-10-21 13:20:35'),
(2, 'spk', 'spk@conference.fr', '$2y$10$P.LM.eSrrZLJoEJXwbDhROQf3wmWa26PEDgOb9yxE75TIFywnJ4TO', ' ', 'Speaker', 2, 'main1.css', NULL),
(3, 'usr', 'usr@conference.fr', '$2y$10$NnxHSgWMSLdLyhGIvsI30uqcxnqcBgRNTs8UrJmaV5uvQRqpaB7mu', ' ', 'User', 3, 'main1.css', '2017-05-31 15:15:13'),
(26, 'blongl', 'blongl@comcast.net', NULL, 'Long', 'Benjamin', 2, 'main1.css', NULL),
(27, 'jporterm', 'jporterm@psu.edu', NULL, 'Porter', 'Jeffrey', 3, 'main1.css', NULL),
(28, 'lgrayn', 'lgrayn@google.com.au', NULL, 'Gray', 'Linda', 2, 'main1.css', NULL),
(29, 'pbakero', 'pbakero@wikispaces.com', NULL, 'Baker', 'Philip', 2, 'main1.css', NULL),
(30, 'issam', 'issam@live.fr', '$2y$10$uEQCAqZkcwK5zXLRsO2GiOd6gnj4qd4enwnlzs1CrKDatsPNoCy3C', NULL, NULL, 1, 'main1.css', '2017-11-26 16:56:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_uindex` (`role`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_slot_id_fk` (`idSlot`),
  ADD KEY `session_module_id_fk` (`idModule`),
  ADD KEY `session_hall_id_fk` (`idHall`);

--
-- Indexes for table `sessions_auditors`
--
ALTER TABLE `sessions_auditors`
  ADD PRIMARY KEY (`idSession`,`idUser`),
  ADD KEY `sessions_auditors_users_id_fk` (`idUser`);

--
-- Indexes for table `sessions_speakers`
--
ALTER TABLE `sessions_speakers`
  ADD PRIMARY KEY (`idSession`,`idUser`),
  ADD KEY `sessions_speaker_users_id_fk` (`idUser`);

--
-- Indexes for table `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_event_id_fk` (`idEvent`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `membres_role_id_fk` (`idRole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `halls`
--
ALTER TABLE `halls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `slots`
--
ALTER TABLE `slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
