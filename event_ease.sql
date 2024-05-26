-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 11:57 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_ease`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id_admin`, `admin_name`, `email`, `password`) VALUES
(1, 'Rahmat Admin', 'admin@example.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `akses_token`
--

CREATE TABLE `akses_token` (
  `id` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_organization` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akses_token`
--

INSERT INTO `akses_token` (`id`, `id_admin`, `id_organization`, `id_user`, `ip_address`, `token`) VALUES
(1, NULL, 1, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9vcmdhbml6YXRpb24iOjF9XSwiaWF0IjoxNzE2MTE2NTQ4LCJleHAiOjE4MTYxMTY1NDd9.cI0izoquIxAq13kKuJ_cgj3Zm1xzGGgd2RirvEdDs9I'),
(2, NULL, 1, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9vcmdhbml6YXRpb24iOjF9XSwiaWF0IjoxNzE2MjAwMDAxLCJleHAiOjE4MTYyMDAwMDB9.vo6bSTUu6p_xGpcIH1RD6ru64lSExWWgjjmxjg1lRdc'),
(3, NULL, 1, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9vcmdhbml6YXRpb24iOjF9XSwiaWF0IjoxNzE2MjE5MTY2LCJleHAiOjE4MTYyMTkxNjV9.aFMphVxXUiSdIpMk1XiKtZIw4dUUwwkqL3ZXwShmAto'),
(4, NULL, 1, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9vcmdhbml6YXRpb24iOjF9XSwiaWF0IjoxNzE2MjE5NTY3LCJleHAiOjE4MTYyMTk1NjZ9.WkHwnJLmzQWb1ZRdGvqCAf3g3hm9UHzWlgfWyt2G33g'),
(5, NULL, 1, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9vcmdhbml6YXRpb24iOjF9XSwiaWF0IjoxNzE2MjE5NTc0LCJleHAiOjE4MTYyMTk1NzN9.MpoF0BHudYvwNf3J-vBrngZyr8qoMLmrBccqm0AHNII'),
(6, NULL, 1, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9vcmdhbml6YXRpb24iOjF9XSwiaWF0IjoxNzE2MjE5NjIwLCJleHAiOjE4MTYyMTk2MTl9.XsjsiUzU8oZ4jTsP8TwepLtAilSPYQz3cBfBaDZcWKA'),
(7, NULL, 1, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9vcmdhbml6YXRpb24iOjF9XSwiaWF0IjoxNzE2MjIxMjE2LCJleHAiOjE4MTYyMjEyMTV9.y2koeh_hqIZ-HErVvn__c2hVEyxIPTbo_G2ZHyuYcFg'),
(8, NULL, 1, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9vcmdhbml6YXRpb24iOjF9XSwiaWF0IjoxNzE2MzE1MzcxLCJleHAiOjE4MTYzMTUzNzB9.pQ_0dxPzX0MtmCx6VsoLhcoALldjKGxVAL7KUCfkE4A'),
(9, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NjQ0MDAsImV4cCI6MTcxNjU2NTg0MH0.0BvufrkIqLmUP8fvnm5fr3sYfmlZpIYt_H7JWeS9sd0'),
(10, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NjU4NjQsImV4cCI6MTcxNjU2NzMwNH0.UD3uDOTPimJRL0rOkm-04Z0WBZ62ke9as8i5HdV6cp0'),
(11, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NjYyMjYsImV4cCI6MTcxNjU2NzY2Nn0.wXOjJzlggZShfcuFyr2j4DOEY1rF83cI_gb-65w4uJ8'),
(12, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NjczMjcsImV4cCI6MTcxNjU2ODc2N30.c6f1ax3-o8Hf1lBkzdQHyhhBHNKkBTYFHDOAbP5RYXs'),
(13, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1Njg5NTMsImV4cCI6MTcxNjU3MDM5M30.fgMeP53GZH3PQkORrlp0gtB3Gbb6wsP1BYHXKO6naVw'),
(14, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NzA1MDIsImV4cCI6MTcxNjU3MTk0Mn0.mehY7TUNGAByJHTnuG86CLsCurpzI-UsLhHzYmXb0Mg'),
(15, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NzA1MDIsImV4cCI6MTcxNjU3MTk0Mn0.mehY7TUNGAByJHTnuG86CLsCurpzI-UsLhHzYmXb0Mg'),
(16, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NzA5ODEsImV4cCI6MTcxNjU3MjQyMX0.67-rw5gR5Vnzzj3EhRG_0lTqpxKPEaVogXUAKGOmuN0'),
(17, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NzIwMTUsImV4cCI6MTcxNjU3MzQ1NX0._lBw1d9Y49SYCPJfDAjAxsFOsb2SEd5HSYDzIZPgeKg'),
(18, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NzI1OTMsImV4cCI6MTcxNjU3NDAzM30.rHT4bgr7IouAYe3ibDp1-Ox4gLem5alQoTecbaf-eqI'),
(19, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NzM0ODgsImV4cCI6MTcxNjU3NDkyOH0.vWLCoybK7vWDYf7Mc14sCLvvqIuDbCpGRDgeFnPG62Y'),
(20, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NzQzNzcsImV4cCI6MTcxNjU3NTgxN30.eKug6OK0qwqzbWb5T9SqTQSu_Ko59gE-rMKW3SHcC5s'),
(21, 1, NULL, NULL, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb3dzIjpbeyJpZF9hZG1pbiI6MX1dLCJpYXQiOjE3MTY1NzU4NjMsImV4cCI6MTcxNjU3NzMwM30.kS_XqRiC0e8cTqaY7o3wzS4pYV7tqYCj9JrMc2YoK7A'),
(22, NULL, NULL, 5, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjo1LCJpYXQiOjE3MTY2NTM2NzYsImV4cCI6MTcxNjY1OTQzNn0.eACpAe4wuc_wiLI0979m2uZzkkZHhAqEgEm-Hy0qmpo'),
(23, NULL, NULL, 4, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjo0LCJpYXQiOjE3MTY2NTM2ODIsImV4cCI6MTcxNjY1OTQ0Mn0.0hNoPcMk2zqNYJ6d0cMkpiy6K1ZBocvWpzgsXlruGxw'),
(24, NULL, NULL, 4, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjo0LCJpYXQiOjE3MTY2NTM4NTMsImV4cCI6MTcxNjY1OTYxM30.mfyPjnyOkWfYsvLzWL6_vDtip43wkU0XWg_0X6Fulp8'),
(25, NULL, NULL, 4, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjo0LCJpYXQiOjE3MTY2NTQ0NjYsImV4cCI6MTcxNjY2MDIyNn0.ShAkOhhHNkrV3UhFGtini8AJxEWOYVI1CVmEMV4i3pg'),
(26, NULL, NULL, 4, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjo0LCJpYXQiOjE3MTY2NTk2NTUsImV4cCI6MTcxNjY2NTQxNX0.09Afhyvz44uHJgab290kip78xiH3rBYCZpap_tjfmYg'),
(27, NULL, NULL, 4, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjo0LCJpYXQiOjE3MTY2Njc1MDEsImV4cCI6MTcxNjY3MzI2MX0.pMeuxXVcFTkRjbAnIw0v_ath8M50DgQnE9TQxD5YhcU'),
(28, NULL, NULL, 1, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjoxLCJpYXQiOjE3MTY2NzAwNzAsImV4cCI6MTcxNjY3NTgzMH0.AuuS_hyTeQrjpJbKf-h5hBqCbIzmIaU-aqH3NaBaH3A'),
(29, NULL, NULL, 1, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjoxLCJpYXQiOjE3MTY3MDc3MzcsImV4cCI6MTcxNjcxMzQ5N30.g_T5oRghmvS0_dMaV7Qy79i7mmC39UldjTfSXNprJDo'),
(30, NULL, NULL, 1, '192.168.56.1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c2VyIjoxLCJpYXQiOjE3MTY3MTM2MjIsImV4cCI6MTcxNjcxOTM4Mn0.OLsQlJCWh65E2y-KRi2SSzV-lPoZi6U2_OIasxGGGXY');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id_event` int(11) NOT NULL,
  `id_organization` int(11) DEFAULT NULL,
  `event_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `event_image` varchar(255) DEFAULT NULL,
  `site_plan_image` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_information` text NOT NULL,
  `event_start` date DEFAULT NULL,
  `event_end` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id_event`, `id_organization`, `event_name`, `description`, `location`, `event_image`, `site_plan_image`, `type`, `status`, `payment_information`, `event_start`, `event_end`, `created_at`) VALUES
(1, 1, 'Event Lalu 1', 'Deskripsi event lalu 1', 'Lokasi event lalu 1', 'wpjay_9f6a3e.jpg', NULL, 'Offline', 1, '', '2024-04-01', '2024-04-04', '0000-00-00 00:00:00'),
(2, 1, 'Event Berjalan 1', 'Deskripsi event berjalan 1', 'Lokasi event berjalan 1', 'wpjay_9f6a3e.jpg', NULL, 'Offline', 1, '', '2024-05-10', '2024-05-30', NULL),
(3, 1, 'Event Mendatang 1', 'Deskripsi event mendatang 1', 'Lokasi event mendatang 1', '4 U_d5bae3.jpeg', 'wpjay_5995d6.jpg', 'Offline', 0, 'Mandiri 3418047140', '2024-06-16', '2024-09-17', NULL),
(5, 1, 'Event Berjalan 2', 'Deskripsi event berjalan 2', 'Lokasi event berjalan 2', 'wpjay_9f6a3e.jpg', NULL, 'Offline', 2, '', '2024-05-10', '2024-05-30', NULL),
(6, 1, 'Event Mendatang 2', 'Deskripsi event mendatang 2', 'Lokasi event mendatang 2', '4 U_d5bae3.jpeg', NULL, 'Offline', 1, '', '2024-06-22', '2024-06-23', NULL),
(7, 1, 'Event Lalu 3', 'Deskripsi event lalu 3', 'Lokasi event lalu 3', 'wpjay_9f6a3e.jpg', NULL, 'Offline', 2, '', '2024-04-13', '2024-04-14', NULL),
(8, 1, 'Event Berjalan 3', 'Deskripsi event berjalan 3', 'Lokasi event berjalan 3', 'wpjay_9f6a3e.jpg', NULL, 'Offline', 1, '', '2024-05-10', '2024-05-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id_history` int(11) NOT NULL,
  `id_organization` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `type_ticket` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `unique_code` varchar(255) DEFAULT NULL,
  `paid` int(11) NOT NULL DEFAULT 0,
  `used` int(11) NOT NULL DEFAULT 0,
  `datetime` datetime DEFAULT NULL,
  `id_ticket` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id_history`, `id_organization`, `id_user`, `event_name`, `type_ticket`, `price`, `amount`, `total`, `unique_code`, `paid`, `used`, `datetime`, `id_ticket`) VALUES
(1, 1, 1, 'Event Lalu 1', 'Pre Sale 1', '100000.00', 2, '200381.00', '1/1/1/1/2/2024-05-01', 2, 0, '2024-04-30 12:00:00', 0),
(2, 1, 1, 'Event Lalu 1', 'Pre Sale 2', '150000.00', 3, '450381.00', '2/ 1/1/2/3/2024-05-01', 2, 0, '2024-04-30 12:00:00', 0),
(3, 1, 1, 'Event Berjalan 1', 'Festival', '200000.00', 2, '400381.00', '3/ 1/2/3/2/2024-05-10', 2, 0, '2024-05-09 12:00:00', 0),
(4, 1, 1, 'Event Berjalan 1', 'VIP', '120000.00', 3, '360381.00', '4/ 1/2/4/3/2024-05-10', 4, 0, '2024-05-09 12:00:00', 0),
(5, 1, 1, 'Event Mendatang 1', 'Reguler', '180000.00', 2, '360381.00', '5/ 1/3/5/2/2024-05-18', 2, 0, '2024-05-17 12:00:00', 0),
(6, 1, 1, 'Event Mendatang 1', 'VVIP', '250000.00', 3, '750381.00', '6/ 1/3/6/3/2024-05-18', 4, 1, '2024-05-17 12:00:00', 0),
(7, 2, 2, 'Event Lalu 2', 'Pre Sale 1', '120000.00', 2, '240381.00', '7/2/4/1/2/2024-04-23', 3, 0, '2024-04-22 12:00:00', 0),
(8, 2, 2, 'Event Lalu 2', 'Pre Sale 2', '180000.00', 3, '540381.00', '8/2/4/2/3/2024-04-23', 3, 0, '2024-04-22 12:00:00', 0),
(9, 2, 2, 'Event Berjalan 2', 'Festival', '250000.00', 2, '500381.00', '9/2/5/3/2/2024-05-08', 3, 0, '2024-05-07 12:00:00', 0),
(10, 2, 2, 'Event Berjalan 2', 'VIP', '150000.00', 3, '450381.00', '10/2/5/4/3/2024-05-08', 3, 0, '2024-05-07 12:00:00', 0),
(11, 2, 2, 'Event Mendatang 2', 'Reguler', '200000.00', 2, '400381.00', '11/2/6/5/2/2024-05-16', 3, 0, '2024-05-15 12:00:00', 0),
(12, 2, 2, 'Event Mendatang 2', 'VVIP', '280000.00', 3, '840381.00', '12/2/6/6/3/2024-05-16', 3, 1, '2024-05-15 12:00:00', 0),
(13, 3, 3, 'Event Lalu 3', 'Pre Sale 1', '100000.00', 2, '200381.00', '13/3/7/7/2/2024-04-13', 3, 0, '2024-04-12 12:00:00', 0),
(14, 3, 3, 'Event Lalu 3', 'Pre Sale 2', '150000.00', 3, '450381.00', '14/3/7/8/3/2024-04-13', 3, 0, '2024-04-12 12:00:00', 0),
(15, 3, 3, 'Event Berjalan 3', 'Festival', '200000.00', 2, '400381.00', '15/3/8/9/2/2024-05-06', 3, 0, '2024-05-05 12:00:00', 0),
(16, 3, 3, 'Event Berjalan 3', 'VIP', '120000.00', 3, '360381.00', '16/3/8/10/3/2024-05-06', 3, 0, '2024-05-05 12:00:00', 0),
(17, 3, 3, 'Event Mendatang 3', 'Reguler', '180000.00', 2, '360381.00', '17/3/9/11/2/2024-05-14', 3, 0, '2024-05-13 12:00:00', 0),
(18, 1, 3, 'Event Mendatang 3', 'VVIP', '250000.00', 3, '750381.00', '18/3/1/9/12/3/2024-05-14', 3, 1, '2024-05-13 12:00:00', 0),
(19, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 8, '1368286.00', '19/1/5/1/8/2024-05-26', 1, 0, '2024-05-26 14:17:23', 1),
(20, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 8, '1368233.00', '20/1/undefined/1/8/undefined', 3, 0, '2024-05-26 14:18:22', 1),
(21, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 8, '1368316.00', '21/1/5/1/8/2024-05-26', 3, 0, '2024-05-26 15:04:37', 1),
(22, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 8, '1368277.00', NULL, 0, 0, '2024-05-26 14:05:27', 1),
(23, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 8, '1368229.00', '23/1/5/1/8/2024-05-26', 3, 0, '2024-05-26 15:41:31', 1),
(24, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 40, '6841157.00', '24/1/5/1/40/2024-05-26', 3, 0, '2024-05-26 15:42:57', 1),
(25, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 20, '3420613.00', NULL, 0, 0, '2024-05-26 15:43:29', 1),
(26, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 1, '171036.00', NULL, 0, 0, '2024-05-26 15:49:26', 1),
(27, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 1, '171104.00', NULL, 0, 0, '2024-05-26 15:49:28', 1),
(28, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 1, '171049.00', NULL, 0, 0, '2024-05-26 15:49:29', 1),
(29, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 1, '171089.00', NULL, 0, 0, '2024-05-26 15:53:54', 1),
(30, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 1, '171107.00', NULL, 1, 0, '2024-05-26 16:08:20', 1),
(31, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 1, '171034.00', '31/1/5/1/1/2024-05-26', 3, 0, '2024-05-26 16:09:22', 1),
(32, 1, 1, 'Event Berjalan 2', 'Offline', '171028.00', 18, '3078553.00', '32/1/5/1/18/2024-05-26', 3, 0, '2024-05-26 16:10:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id_organization` int(11) NOT NULL,
  `organization_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `ktp` varchar(255) DEFAULT NULL,
  `legality_letter` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id_organization`, `organization_name`, `email`, `phone`, `password`, `logo`, `ktp`, `legality_letter`, `status`) VALUES
(1, 'Cakra Wala Org1241242', 'eventorg1@example.com', '+6282222222222', '202cb962ac59075b964b07152d234b70', 'basic-symbols-table_cd316e.jpg', NULL, NULL, 1),
(2, 'Event Organizer 2', 'eventorg2@example.com', '+6282222222222', '6cb75f652a9b52798eb6cf2201057c73', NULL, NULL, NULL, 1),
(3, 'Event Organizer 3', 'eventorg3@example.com', '+6283333333333', '819b0643d6b89dc9b579fdfc9094f28e', NULL, NULL, NULL, 2),
(4, 'Universitas Teknologi Yogyakarta', 'alan.040219.gam@gmail.com', '085156031385', '202cb962ac59075b964b07152d234b70', 'uty_7471c1.jpg', 'uty_209bb1.jpg', 'uty_a2b698.jpg', 2),
(5, 'Universitas Teknologi Yogyakarta', 'alan.040219.gam@gmail.com2', '085156031385', '202cb962ac59075b964b07152d234b70', 'uty_4f4a76.jpg', 'uty_f22ded.jpg', 'uty_967c65.jpg', 1),
(6, 'Universitas Teknologi Yogyakarta', 'alan.040219.gam@gmail.com4', '085156031385', '202cb962ac59075b964b07152d234b70', 'uty_b29eff.jpg', 'uty_0dc7ee.jpg', 'uty_2d0399.jpg', 0),
(7, 'Universitas Teknologi Yogyakarta', 'alan.040219.gam@gmail.com5', '085156031385', '202cb962ac59075b964b07152d234b70', 'uty_2a7b5c.jpg', 'uty_008dab.jpg', 'uty_c458e1.jpg', 0),
(8, 'Universitas Teknologi Yogyakarta', 'alan.040219.gam@gmail.com6', '085156031385', '202cb962ac59075b964b07152d234b70', 'uty_d5a4f7.jpg', 'uty_8224a0.jpg', 'uty_74ad51.jpg', 0),
(9, 'Universitas Teknologi Yogyakarta', 'alan.040219.gam@gmail.com123', '085156031385', '202cb962ac59075b964b07152d234b70', 'wpjay_9cec3f.jpg', 'wpjay_e2a234.jpg', 'wpjay_78dff5.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` int(11) NOT NULL,
  `id_event` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `sold` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id_ticket`, `id_event`, `type`, `amount`, `sold`, `price`, `date_start`, `date_end`) VALUES
(1, 5, 'Pre Sale 1', 100, 100, '171028.00', '2024-04-13 00:00:00', '2024-04-19 00:00:00'),
(2, 3, 'Pre Sale 2', 150, 49, '108523.00', '2024-04-19 00:00:00', '2024-04-24 00:00:00'),
(3, 5, 'Festival', 200, 52, '169531.00', '2024-05-05 00:00:00', '2024-05-18 00:00:00'),
(4, 5, 'VIP', 100, 10, '222086.00', '2024-05-03 00:00:00', '2024-05-18 00:00:00'),
(5, 3, 'Reguler', 100, 95, '81837.00', '2024-05-11 00:00:00', '2024-05-16 00:00:00'),
(6, 3, 'VVIP11', 50, 35, '2222.00', '2024-07-08 22:00:00', '2024-07-13 22:00:00'),
(9, 5, 'Festival', 200, 71, '156735.00', '2024-05-05 00:00:00', '2024-05-18 00:00:00'),
(10, 5, 'VIP', 100, 31, '133219.00', '2024-05-03 00:00:00', '2024-05-18 00:00:00'),
(11, 6, 'Reguler', 150, 41, '115891.00', '2024-05-15 00:00:00', '2024-05-20 00:00:00'),
(12, 6, 'VVIP', 50, 12, '99798.00', '2024-05-17 00:00:00', '2024-05-22 00:00:00'),
(13, 7, 'Pre Sale 1', 100, 38, '291316.00', '2024-03-24 00:00:00', '2024-03-30 00:00:00'),
(14, 7, 'Pre Sale 2', 150, 50, '197187.00', '2024-03-30 00:00:00', '2024-04-04 00:00:00'),
(15, 8, 'Festival', 200, 39, '251985.00', '2024-05-05 00:00:00', '2024-05-18 00:00:00'),
(16, 8, 'VIP', 100, 42, '148364.00', '2024-05-03 00:00:00', '2024-05-18 00:00:00'),
(21, 3, 'Deluxe', 0, 0, '22441214.00', '2024-07-20 16:13:00', '2024-08-20 16:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `fullname`, `email`, `phone`, `password`) VALUES
(1, 'John Doe', 'test', '+6281234567890', '098f6bcd4621d373cade4e832627b4f6'),
(2, 'Jane Doe', 'jane.doe@example.com', '+6289876543210', '6cb75f652a9b52798eb6cf2201057c73'),
(3, 'Alice Smith', 'alice.smith@example.com', '+6285555555555', '819b0643d6b89dc9b579fdfc9094f28e'),
(4, 'Lans The Prodigy', 'lanstheprodigy@gmail.com', '085156031385', '202cb962ac59075b964b07152d234b70'),
(5, 'Lans The Prodigy', 'lanstheprodigy@gmail.com2', '0851560313852', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `akses_token`
--
ALTER TABLE `akses_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `id_organization` (`id_organization`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `id_organization` (`id_organization`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id_organization`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_event` (`id_event`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `akses_token`
--
ALTER TABLE `akses_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id_organization` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`id_organization`) REFERENCES `organizations` (`id_organization`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `histories`
--
ALTER TABLE `histories`
  ADD CONSTRAINT `histories_ibfk_1` FOREIGN KEY (`id_organization`) REFERENCES `organizations` (`id_organization`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `histories_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
