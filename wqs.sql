-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2021 at 04:09 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wqs`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `id_data` int(11) NOT NULL,
  `ph` varchar(20) NOT NULL,
  `standar_ph` varchar(20) NOT NULL,
  `suhu` varchar(20) NOT NULL,
  `standar_suhu` varchar(20) NOT NULL,
  `kekeruhan` varchar(20) NOT NULL,
  `standar_kekeruhan` varchar(20) NOT NULL,
  `salinitas` varchar(20) NOT NULL,
  `standar_salinitas` varchar(20) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id_data`, `ph`, `standar_ph`, `suhu`, `standar_suhu`, `kekeruhan`, `standar_kekeruhan`, `salinitas`, `standar_salinitas`, `datetime`) VALUES
(671, '8.17', '', '30.44', '', '7.90', '', '8.25', '', '2021-03-14 14:40:36'),
(672, '8.40', '', '30.44', '', '7.90', '', '8.46', '', '2021-03-14 14:40:42'),
(673, '8.40', '8.00', '30.44', '28.50', '7.91', '3.75', '8.49', '24.00', '2021-03-14 14:59:45'),
(739, '6.53', '8.00', '30.50', '28.50', '7.79', '3.75', '6.95', '24.00', '2021-03-14 15:06:47'),
(740, '6.24', '8.00', '30.50', '28.50', '7.81', '3.75', '6.96', '24.00', '2021-03-14 15:06:54'),
(741, '6.55', '8.00', '30.50', '28.50', '7.81', '3.75', '7.32', '24.00', '2021-03-14 15:07:00'),
(742, '6.72', '8.00', '30.50', '28.50', '7.79', '3.75', '7.17', '24.00', '2021-03-14 15:07:07');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1613580824),
('m210217_165258_init_user', 1613580830);

-- --------------------------------------------------------

--
-- Table structure for table `ph`
--

CREATE TABLE `ph` (
  `id_ph` int(11) NOT NULL,
  `ph` varchar(100) NOT NULL,
  `standar` varchar(100) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ph`
--

INSERT INTO `ph` (`id_ph`, `ph`, `standar`, `waktu`) VALUES
(1, '7', '8.0', '2021-02-28 12:48:42'),
(2, '5', '8.0', '2021-02-28 12:49:01'),
(3, '4', '8.0', '2021-02-28 12:49:11'),
(4, '7', '8.0', '2021-02-28 13:51:08'),
(5, '4', '8.0', '2021-02-28 13:51:39'),
(6, '7', '8.0', '2021-02-28 13:52:01'),
(7, '6', '8.0', '0000-00-00 00:00:00'),
(8, '8', '8.0', '0000-00-00 00:00:00'),
(9, '8', '8.0', '0000-00-00 00:00:00'),
(10, '8', '8.0', '0000-00-00 00:00:00'),
(11, '8', '8.0', '2021-02-28 13:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `salinitas`
--

CREATE TABLE `salinitas` (
  `id_salinitas` int(11) NOT NULL,
  `salinitas` varchar(100) NOT NULL,
  `standar` varchar(100) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suhu`
--

CREATE TABLE `suhu` (
  `id_suhu` int(11) NOT NULL,
  `suhu` decimal(10,2) NOT NULL,
  `standar` varchar(100) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suhu`
--

INSERT INTO `suhu` (`id_suhu`, `suhu`, `standar`, `waktu`) VALUES
(1, '7.00', '8.0', '2021-02-28 14:15:25'),
(2, '6.00', '8.0', '2021-02-28 13:45:48'),
(3, '6.00', '8.0', '2021-02-28 14:01:14');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `first_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `no_hp` varchar(13) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `first_name`, `last_name`, `no_hp`) VALUES
(1, 'admin', '39w0ImI5iGVo-quZ-HR1Cmpss1RBDNMV', '$2y$13$B/2cZJpqnOcMGq4F6ySuPO7In2jdZGsLC13ZGrDNYmD4TujTWxo9W', NULL, 'admin@admin.com', 10, 2021, 2021, '', '', ''),
(2, 'romi', 'ChyzDlpONCLhj0Py_rgDWuH0OIb1Z2N_', '$2y$13$IXuvJL1SjwrMW0ePBjGxAeMAkU.dtdUuZXUTLHq.hIxyrmQ1B5UC.', NULL, 'muchromiahmad@gmail.com', 10, 1613905108, 1613905108, 'muchromi', 'ahmad', '0895342402083');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id_data`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `ph`
--
ALTER TABLE `ph`
  ADD PRIMARY KEY (`id_ph`);

--
-- Indexes for table `salinitas`
--
ALTER TABLE `salinitas`
  ADD PRIMARY KEY (`id_salinitas`);

--
-- Indexes for table `suhu`
--
ALTER TABLE `suhu`
  ADD PRIMARY KEY (`id_suhu`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data`
--
ALTER TABLE `data`
  MODIFY `id_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=743;

--
-- AUTO_INCREMENT for table `ph`
--
ALTER TABLE `ph`
  MODIFY `id_ph` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `salinitas`
--
ALTER TABLE `salinitas`
  MODIFY `id_salinitas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suhu`
--
ALTER TABLE `suhu`
  MODIFY `id_suhu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
