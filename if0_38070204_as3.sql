-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql303.infinityfree.com
-- Generation Time: Jan 12, 2025 at 09:15 PM
-- Server version: 10.6.19-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_38070204_as3`
--

-- --------------------------------------------------------

--
-- Table structure for table `interaction_logs`
--

CREATE TABLE `interaction_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `api_accessed` varchar(255) DEFAULT NULL,
  `function_used` varchar(255) DEFAULT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interaction_logs`
--

INSERT INTO `interaction_logs` (`id`, `user_id`, `api_accessed`, `function_used`, `date_time`) VALUES
(1, 1, 'Calorie API', 'Calculate Calories', '2025-01-05 11:35:07'),
(2, 1, 'Calorie API', 'Calculate Calories', '2025-01-05 11:35:13'),
(3, 1, 'Weather API', 'Fetch Weather', '2025-01-05 11:41:05'),
(4, 1, 'News API', 'Fetch News', '2025-01-05 11:54:22'),
(5, 1, 'News API', 'Search News', '2025-01-05 11:54:24'),
(6, 1, 'News API', 'Fetch News', '2025-01-05 11:54:26'),
(7, 1, 'Weather API', 'Fetch Weather', '2025-01-05 11:54:32'),
(8, 1, 'Calorie API', 'Calculate Calorie Burn', '2025-01-05 11:54:48'),
(9, 1, 'News API', 'Fetch News', '2025-01-05 12:55:36'),
(10, 1, 'News API', 'Search News', '2025-01-05 12:55:44'),
(11, 1, 'News API', 'Fetch News', '2025-01-05 12:55:44'),
(12, 1, 'News API', 'Search News', '2025-01-05 12:55:48'),
(13, 1, 'News API', 'Fetch News', '2025-01-05 12:55:48'),
(14, 1, 'Weather API', 'Fetch Weather', '2025-01-05 12:56:09'),
(15, 1, 'Calorie API', 'Calculate Calorie Burn', '2025-01-05 12:56:33'),
(16, 1, 'News API', 'Fetch News', '2025-01-05 12:56:53'),
(17, 1, 'News API', 'Fetch News', '2025-01-05 12:57:05'),
(18, 1, 'Weather API', 'Fetch Weather', '2025-01-05 13:02:13'),
(19, 1, 'News API', 'Fetch News', '2025-01-05 13:55:55'),
(20, 1, 'Weather API', 'Fetch Weather', '2025-01-05 14:00:59'),
(21, 1, 'Weather API', 'Fetch Weather', '2025-01-05 14:08:45'),
(22, 1, 'Weather API', 'Fetch Weather', '2025-01-05 14:09:17'),
(23, 1, 'News API', 'Fetch News', '2025-01-05 14:09:27'),
(24, 1, 'News API', 'Fetch News', '2025-01-05 14:09:45'),
(25, 1, 'News API', 'Fetch News', '2025-01-05 14:17:01'),
(26, 1, 'News API', 'Search News', '2025-01-05 14:17:15'),
(27, 1, 'News API', 'Fetch News', '2025-01-05 14:17:16'),
(28, 1, 'News API', 'Search News', '2025-01-05 14:17:23'),
(29, 1, 'News API', 'Fetch News', '2025-01-05 14:17:23'),
(30, 1, 'News API', 'Fetch News', '2025-01-05 14:18:53'),
(31, 1, 'News API', 'Fetch News', '2025-01-05 14:19:03'),
(32, 1, 'News API', 'Fetch News', '2025-01-05 14:19:06'),
(33, 1, 'News API', 'Fetch News', '2025-01-05 14:19:20'),
(34, 1, 'News API', 'Fetch News', '2025-01-05 14:19:54'),
(35, 1, 'Calorie API', 'Calculate Calorie Burn', '2025-01-05 14:22:06'),
(36, 1, 'News API', 'Fetch News', '2025-01-05 14:23:39'),
(37, 1, 'News API', 'Fetch News', '2025-01-05 14:23:44'),
(38, 1, 'News API', 'Fetch News', '2025-01-05 14:27:53'),
(39, 1, 'Calorie API', 'Calculate Calorie Burn', '2025-01-05 14:44:53'),
(40, 1, 'News API', 'Fetch News', '2025-01-05 14:48:27'),
(41, 1, 'News API', 'Fetch News', '2025-01-05 14:48:35'),
(42, 1, 'News API', 'Fetch News', '2025-01-05 14:48:46'),
(43, 1, 'News API', 'Fetch News', '2025-01-05 14:48:58'),
(44, 1, 'News API', 'Fetch News', '2025-01-05 14:49:22'),
(45, 1, 'News API', 'Fetch News', '2025-01-05 15:02:05'),
(46, 1, 'News API', 'Search News', '2025-01-05 15:02:12'),
(47, 1, 'News API', 'Fetch News', '2025-01-05 15:02:13'),
(48, 1, 'News API', 'Search News', '2025-01-05 15:02:17'),
(49, 1, 'News API', 'Fetch News', '2025-01-05 15:02:18'),
(50, 1, 'Weather API', 'Fetch Weather', '2025-01-05 15:02:30'),
(51, 1, 'Calorie API', 'Calculate Calorie Burn', '2025-01-05 15:03:01'),
(52, 4, 'News API', 'Fetch News', '2025-01-06 02:57:29'),
(53, 4, 'News API', 'Search News', '2025-01-06 02:58:27'),
(54, 4, 'News API', 'Fetch News', '2025-01-06 02:58:28'),
(55, 4, 'News API', 'Search News', '2025-01-06 02:58:34'),
(56, 4, 'News API', 'Fetch News', '2025-01-06 02:58:34'),
(57, 4, 'News API', 'Search News', '2025-01-06 02:58:35'),
(58, 4, 'News API', 'Fetch News', '2025-01-06 02:58:36'),
(59, 4, 'News API', 'Fetch News', '2025-01-06 02:58:41'),
(60, 4, 'Weather API', 'Fetch Weather', '2025-01-06 02:58:55'),
(61, 4, 'Calorie API', 'Calculate Calorie Burn', '2025-01-06 02:59:17'),
(62, 4, 'Calorie API', 'Calculate Calorie Burn', '2025-01-06 02:59:18'),
(63, 4, 'News API', 'Fetch News', '2025-01-06 10:36:17'),
(64, 4, 'Weather API', 'Fetch Weather', '2025-01-06 10:36:36'),
(65, 4, 'News API', 'Fetch News', '2025-01-06 10:36:49'),
(66, 4, 'News API', 'Fetch News', '2025-01-06 12:18:47'),
(67, 4, 'News API', 'Fetch News', '2025-01-06 12:18:49'),
(68, 4, 'News API', 'Fetch News', '2025-01-06 12:18:52'),
(69, 4, 'News API', 'Fetch News', '2025-01-06 12:19:13'),
(70, 4, 'News API', 'Fetch News', '2025-01-06 12:22:59'),
(71, 4, 'Weather API', 'Fetch Weather', '2025-01-06 12:23:30'),
(72, 4, 'Weather API', 'Fetch Weather', '2025-01-06 12:23:35'),
(73, 4, 'Calorie API', 'Calculate Calorie Burn', '2025-01-06 12:24:14'),
(74, 4, 'News API', 'Fetch News', '2025-01-06 12:26:39'),
(75, 4, 'News API', 'Fetch News', '2025-01-06 12:26:45'),
(76, 4, 'News API', 'Fetch News', '2025-01-08 03:56:11'),
(77, 4, 'Weather API', 'Fetch Weather', '2025-01-08 03:56:28'),
(78, 4, 'Weather API', 'Fetch Weather', '2025-01-08 03:56:39'),
(79, 4, 'Weather API', 'Fetch Weather', '2025-01-08 03:56:49'),
(80, 4, 'News API', 'Fetch News', '2025-01-09 03:52:02'),
(81, 4, 'Calorie API', 'Calculate Calorie Burn', '2025-01-09 03:52:18'),
(82, 4, 'Calorie API', 'Calculate Calorie Burn', '2025-01-09 03:52:19'),
(83, 4, 'Weather API', 'Fetch Weather', '2025-01-09 03:52:30'),
(95, 4, 'News API', 'Fetch News for home', '2025-01-09 08:39:08'),
(96, 4, 'News API', 'Search News for science', '2025-01-09 08:39:27'),
(97, 4, 'News API', 'Fetch News for science', '2025-01-09 08:39:28'),
(98, 4, 'News API', 'Search News for science', '2025-01-09 08:39:38'),
(99, 4, 'News API', 'Fetch News for science', '2025-01-09 08:39:38'),
(100, 4, 'News API', 'Search News for science', '2025-01-09 08:39:42'),
(101, 4, 'News API', 'Fetch News for science', '2025-01-09 08:39:42'),
(102, 4, 'News API', 'Search News for home', '2025-01-09 08:39:52'),
(103, 4, 'News API', 'Fetch News for home', '2025-01-09 08:39:52'),
(104, 4, 'News API', 'Search News for world', '2025-01-09 08:40:05'),
(105, 4, 'News API', 'Search News for world', '2025-01-09 08:40:06'),
(106, 4, 'News API', 'Fetch News for world', '2025-01-09 08:40:06'),
(107, 4, 'News API', 'Fetch News for world', '2025-01-09 08:40:06'),
(108, 4, 'Weather API', 'Fetch Weather', '2025-01-09 08:42:30'),
(115, 4, 'News API', 'Fetch News for home', '2025-01-09 09:57:17'),
(116, 4, 'News API', 'Fetch News for home', '2025-01-09 09:57:24'),
(117, 4, 'News API', 'Search News for technology', '2025-01-09 09:57:28'),
(118, 4, 'News API', 'Fetch News for technology', '2025-01-09 09:57:29'),
(124, 1, 'News API', 'Fetch News for home', '2025-01-09 10:14:21'),
(125, 1, 'News API', 'Search News for home', '2025-01-09 10:14:59'),
(126, 1, 'News API', 'Fetch News for home', '2025-01-09 10:14:59'),
(127, 1, 'News API', 'Search News for world', '2025-01-09 10:15:13'),
(128, 1, 'News API', 'Fetch News for world', '2025-01-09 10:15:14'),
(129, 1, 'Weather API', 'Fetch Weather', '2025-01-09 10:15:34'),
(130, 1, 'Calorie API', 'Calculate Calorie Burn', '2025-01-09 10:15:51'),
(131, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:00'),
(132, 1, 'News API', 'Search News for home', '2025-01-09 10:16:23'),
(133, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:23'),
(134, 1, 'News API', 'Search News for home', '2025-01-09 10:16:49'),
(135, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:50'),
(136, 1, 'News API', 'Search News for home', '2025-01-09 10:16:53'),
(137, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:53'),
(138, 1, 'News API', 'Search News for home', '2025-01-09 10:16:53'),
(139, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:54'),
(140, 1, 'News API', 'Search News for home', '2025-01-09 10:16:54'),
(141, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:55'),
(142, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:55'),
(143, 1, 'News API', 'Search News for home', '2025-01-09 10:16:55'),
(144, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:55'),
(145, 1, 'News API', 'Search News for home', '2025-01-09 10:16:55'),
(146, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:55'),
(147, 1, 'News API', 'Search News for home', '2025-01-09 10:16:55'),
(148, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:56'),
(149, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:56'),
(150, 1, 'News API', 'Search News for home', '2025-01-09 10:16:56'),
(151, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:56'),
(152, 1, 'News API', 'Search News for home', '2025-01-09 10:16:56'),
(153, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:56'),
(154, 1, 'News API', 'Search News for home', '2025-01-09 10:16:56'),
(155, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:56'),
(156, 1, 'News API', 'Search News for home', '2025-01-09 10:16:56'),
(157, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:56'),
(158, 1, 'News API', 'Search News for home', '2025-01-09 10:16:56'),
(159, 1, 'News API', 'Search News for home', '2025-01-09 10:16:56'),
(160, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:56'),
(161, 1, 'News API', 'Search News for home', '2025-01-09 10:16:57'),
(162, 1, 'News API', 'Search News for home', '2025-01-09 10:16:57'),
(163, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:57'),
(164, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:57'),
(165, 1, 'News API', 'Search News for home', '2025-01-09 10:16:57'),
(166, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:57'),
(167, 1, 'News API', 'Search News for home', '2025-01-09 10:16:57'),
(168, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:57'),
(169, 1, 'News API', 'Search News for home', '2025-01-09 10:16:57'),
(170, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:57'),
(171, 1, 'News API', 'Search News for home', '2025-01-09 10:16:57'),
(172, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:57'),
(173, 1, 'News API', 'Search News for home', '2025-01-09 10:16:57'),
(174, 1, 'News API', 'Search News for home', '2025-01-09 10:16:57'),
(175, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:57'),
(176, 1, 'News API', 'Search News for home', '2025-01-09 10:16:58'),
(177, 1, 'News API', 'Fetch News for home', '2025-01-09 10:16:58'),
(178, 1, 'News API', 'Search News for home', '2025-01-09 10:17:00'),
(179, 1, 'News API', 'Fetch News for home', '2025-01-09 10:17:00'),
(180, 1, 'News API', 'Search News for home', '2025-01-09 10:17:00'),
(181, 1, 'News API', 'Fetch News for home', '2025-01-09 10:17:00'),
(182, 1, 'News API', 'Search News for home', '2025-01-09 10:17:00'),
(183, 1, 'News API', 'Fetch News for home', '2025-01-09 10:17:00'),
(184, 1, 'News API', 'Search News for science', '2025-01-09 10:17:02'),
(185, 1, 'News API', 'Fetch News for science', '2025-01-09 10:17:03'),
(186, 1, 'News API', 'Search News for science', '2025-01-09 10:17:28'),
(187, 1, 'News API', 'Fetch News for science', '2025-01-09 10:17:28'),
(188, 1, 'News API', 'Search News for science', '2025-01-09 10:17:28'),
(189, 1, 'News API', 'Fetch News for science', '2025-01-09 10:17:28'),
(190, 1, 'News API', 'Search News for science', '2025-01-09 10:17:28'),
(191, 1, 'News API', 'Fetch News for science', '2025-01-09 10:17:28'),
(192, 1, 'News API', 'Search News for science', '2025-01-09 10:17:28'),
(193, 1, 'News API', 'Fetch News for science', '2025-01-09 10:17:28'),
(194, 4, 'News API', 'Fetch News for home', '2025-01-09 10:19:33'),
(195, 4, 'News API', 'Search News for home', '2025-01-09 10:20:14'),
(196, 4, 'News API', 'Fetch News for home', '2025-01-09 10:20:14'),
(197, 4, 'News API', 'Search News for health', '2025-01-09 10:20:20'),
(198, 4, 'News API', 'Fetch News for health', '2025-01-09 10:20:21'),
(199, 4, 'News API', 'Fetch News for home', '2025-01-09 10:51:40'),
(200, 4, 'Weather API', 'Fetch Weather', '2025-01-09 10:52:04'),
(201, 4, 'Weather API', 'Fetch Weather', '2025-01-09 10:52:15'),
(202, 4, 'Calorie API', 'Calculate Calorie Burn', '2025-01-09 10:52:34'),
(203, 1, 'News API', 'Fetch News for home', '2025-01-09 11:20:16'),
(204, 1, 'News API', 'Fetch News for home', '2025-01-09 11:21:04'),
(205, 1, 'News API', 'Search News for home', '2025-01-09 11:21:04'),
(206, 1, 'News API', 'Search News for technology', '2025-01-09 11:21:13'),
(207, 1, 'News API', 'Fetch News for technology', '2025-01-09 11:21:14'),
(208, 1, 'Weather API', 'Fetch Weather', '2025-01-09 11:21:44'),
(209, 1, 'Weather API', 'Fetch Weather', '2025-01-09 11:21:50'),
(210, 1, 'Calorie API', 'Calculate Calorie Burn', '2025-01-09 11:22:28'),
(211, 1, 'News API', 'Fetch News for home', '2025-01-09 11:26:09'),
(212, 1, 'News API', 'Search News for home', '2025-01-09 11:26:16'),
(213, 1, 'News API', 'Fetch News for home', '2025-01-09 11:26:16'),
(214, 1, 'News API', 'Fetch News for technology', '2025-01-09 11:26:23'),
(215, 1, 'News API', 'Search News for technology', '2025-01-09 11:26:23'),
(216, 1, 'News API', 'Fetch News for home', '2025-01-09 11:29:55'),
(217, 1, 'News API', 'Search News for technology', '2025-01-09 11:30:01'),
(218, 1, 'News API', 'Fetch News for technology', '2025-01-09 11:30:02'),
(219, 1, 'News API', 'Search News for sports', '2025-01-09 11:30:09'),
(220, 1, 'News API', 'Fetch News for sports', '2025-01-09 11:30:10'),
(221, 1, 'Weather API', 'Fetch Weather', '2025-01-09 11:30:37'),
(222, 1, 'Calorie API', 'Calculate Calorie Burn', '2025-01-09 11:30:54'),
(223, 1, 'News API', 'Fetch News for home', '2025-01-09 11:35:22'),
(224, 1, 'News API', 'Search News for home', '2025-01-09 11:35:33'),
(225, 1, 'News API', 'Fetch News for home', '2025-01-09 11:35:33'),
(226, 1, 'News API', 'Search News for sports', '2025-01-09 11:35:38'),
(227, 1, 'News API', 'Fetch News for sports', '2025-01-09 11:35:39'),
(228, 1, 'Weather API', 'Fetch Weather', '2025-01-09 11:35:46'),
(229, 1, 'Weather API', 'Fetch Weather', '2025-01-09 11:35:50'),
(230, 1, 'Calorie API', 'Calculate Calorie Burn', '2025-01-09 11:36:10'),
(231, 4, 'News API', 'Fetch News for home', '2025-01-09 12:56:24'),
(232, 4, 'News API', 'Search News for home', '2025-01-09 12:57:51'),
(233, 4, 'News API', 'Fetch News for home', '2025-01-09 12:57:51'),
(234, 4, 'News API', 'Search News for home', '2025-01-09 12:57:52'),
(235, 4, 'News API', 'Fetch News for home', '2025-01-09 12:57:52'),
(236, 4, 'News API', 'Fetch News for home', '2025-01-09 13:04:47'),
(237, 4, 'News API', 'Search News for home with query \"squid games\"', '2025-01-09 13:04:56'),
(238, 4, 'News API', 'Fetch News for home with query \"squid games\"', '2025-01-09 13:04:56'),
(239, 4, 'News API', 'Search News for world with query \"squid games\"', '2025-01-09 13:05:06'),
(240, 4, 'News API', 'Fetch News for world with query \"squid games\"', '2025-01-09 13:05:07'),
(241, 4, 'News API', 'Search News for world with query \"squid games\"', '2025-01-09 13:05:07'),
(242, 4, 'News API', 'Fetch News for world with query \"squid games\"', '2025-01-09 13:05:07'),
(243, 4, 'News API', 'Search News for world with query \"squid games\"', '2025-01-09 13:05:10'),
(244, 4, 'News API', 'Fetch News for world with query \"squid games\"', '2025-01-09 13:05:10'),
(245, 4, 'News API', 'Fetch News for world with query \"squid games\"', '2025-01-09 13:05:14'),
(246, 4, 'News API', 'Search News for world with query \"squid games\"', '2025-01-09 13:05:14'),
(247, 4, 'News API', 'Search News for technology with query \"\"', '2025-01-09 13:05:22'),
(248, 4, 'News API', 'Fetch News for technology', '2025-01-09 13:05:23'),
(249, 4, 'News API', 'Search News for technology with query \"\"', '2025-01-09 13:05:23'),
(250, 4, 'News API', 'Fetch News for technology', '2025-01-09 13:05:23'),
(251, 4, 'News API', 'Search News for technology with query \"TikTok\"', '2025-01-09 13:05:35'),
(252, 4, 'News API', 'Fetch News for technology with query \"TikTok\"', '2025-01-09 13:05:35'),
(253, 4, 'News API', 'Fetch News for home', '2025-01-09 13:07:51'),
(254, 1, 'News API', 'Fetch News for home', '2025-01-09 13:09:02'),
(255, 1, 'News API', 'Search News for technology with query \"\"', '2025-01-09 13:09:21'),
(256, 1, 'News API', 'Fetch News for technology', '2025-01-09 13:09:21'),
(257, 1, 'News API', 'Search News for technology with query \"Tiktok\"', '2025-01-09 13:09:28'),
(258, 1, 'News API', 'Fetch News for technology with query \"Tiktok\"', '2025-01-09 13:09:28'),
(259, 1, 'News API', 'Search News for technology with query \"Instagram\"', '2025-01-09 13:10:15'),
(260, 1, 'News API', 'Fetch News for technology with query \"Instagram\"', '2025-01-09 13:10:16'),
(261, 1, 'News API', 'Search News for technology with query \"news\"', '2025-01-09 13:10:29'),
(262, 1, 'News API', 'Fetch News for technology with query \"news\"', '2025-01-09 13:10:30'),
(263, 1, 'News API', 'Search News for technology with query \"\"', '2025-01-09 13:10:36'),
(264, 1, 'News API', 'Fetch News for technology', '2025-01-09 13:10:36'),
(265, 1, 'News API', 'Search News for technology with query \"IT\"', '2025-01-09 13:11:05'),
(266, 1, 'News API', 'Fetch News for technology with query \"IT\"', '2025-01-09 13:11:06'),
(267, 1, 'News API', 'Search News for world with query \"squid game\"', '2025-01-09 13:11:22'),
(268, 1, 'News API', 'Search News for world with query \"squid game\"', '2025-01-09 13:11:22'),
(269, 1, 'News API', 'Fetch News for world with query \"squid game\"', '2025-01-09 13:11:23'),
(270, 1, 'News API', 'Fetch News for world with query \"squid game\"', '2025-01-09 13:11:23'),
(271, 4, 'News API', 'Fetch News for home', '2025-01-09 13:15:23'),
(272, 4, 'News API', 'Fetch News for home', '2025-01-09 13:15:29'),
(273, 1, 'News API', 'Fetch News for home', '2025-01-09 13:22:15'),
(274, 1, 'Weather API', 'Fetch Weather', '2025-01-09 13:23:14'),
(275, 1, 'News API', 'Fetch News for home', '2025-01-09 13:23:16'),
(276, 4, 'News API', 'Fetch News for home', '2025-01-09 13:23:46'),
(277, 1, 'News API', 'Fetch News for home', '2025-01-09 13:23:52'),
(278, 1, 'News API', 'Search News for technology with query \"\"', '2025-01-09 13:24:14'),
(279, 1, 'News API', 'Fetch News for technology', '2025-01-09 13:24:15'),
(280, 4, 'News API', 'Fetch News for home', '2025-01-09 13:24:31'),
(281, 4, 'Calorie API', 'Calculate Calorie Burn', '2025-01-09 13:25:18'),
(282, 1, 'News API', 'Search News for technology with query \"IT\"', '2025-01-09 13:25:32'),
(283, 1, 'News API', 'Fetch News for technology with query \"IT\"', '2025-01-09 13:25:32'),
(284, 1, 'News API', 'Search News for technology with query \"Internet\"', '2025-01-09 13:26:17'),
(285, 1, 'News API', 'Fetch News for technology with query \"Internet\"', '2025-01-09 13:26:17'),
(286, 1, 'News API', 'Fetch News for home', '2025-01-09 13:26:32'),
(287, 1, 'News API', 'Fetch News for home', '2025-01-09 13:26:49'),
(288, 4, 'News API', 'Fetch News for home', '2025-01-09 13:30:25'),
(289, 4, 'News API', 'Fetch News for home', '2025-01-09 13:30:33'),
(290, 4, 'News API', 'Fetch News for home', '2025-01-09 13:30:42'),
(291, 1, 'News API', 'Fetch News for home', '2025-01-09 13:30:57'),
(292, 4, 'News API', 'Fetch News for home', '2025-01-09 13:30:58'),
(293, 4, 'News API', 'Fetch News for home', '2025-01-09 13:31:03'),
(294, 4, 'News API', 'Fetch News for home', '2025-01-09 13:31:16'),
(295, 1, 'News API', 'Search News for science with query \"\"', '2025-01-09 13:31:18'),
(296, 1, 'News API', 'Fetch News for science', '2025-01-09 13:31:20'),
(297, 1, 'News API', 'Fetch News for home', '2025-01-09 15:35:31'),
(298, 4, 'News API', 'Fetch News for home', '2025-01-09 15:49:44'),
(299, 4, 'News API', 'Fetch News for home', '2025-01-09 15:52:43'),
(300, 4, 'News API', 'Fetch News for home', '2025-01-09 15:52:55'),
(301, 4, 'News API', 'Search News for world with query \"Squid game\"', '2025-01-09 15:53:38'),
(302, 4, 'News API', 'Fetch News for world with query \"Squid game\"', '2025-01-09 15:53:38'),
(303, 4, 'News API', 'Search News for world with query \"Bts\"', '2025-01-09 15:53:45'),
(304, 4, 'News API', 'Fetch News for world with query \"Bts\"', '2025-01-09 15:53:46'),
(305, 4, 'News API', 'Search News for world with query \"Bts\"', '2025-01-09 15:53:50'),
(306, 4, 'News API', 'Fetch News for world with query \"Bts\"', '2025-01-09 15:53:50'),
(307, 4, 'News API', 'Search News for sports with query \"Badminton\"', '2025-01-09 15:54:03'),
(308, 4, 'News API', 'Fetch News for sports with query \"Badminton\"', '2025-01-09 15:54:04'),
(309, 4, 'News API', 'Search News for sports with query \"\"', '2025-01-09 15:54:10'),
(310, 4, 'News API', 'Fetch News for sports', '2025-01-09 15:54:10'),
(311, 4, 'News API', 'Search News for sports with query \"Baseball \"', '2025-01-09 15:55:29'),
(312, 4, 'News API', 'Fetch News for sports with query \"Baseball \"', '2025-01-09 15:55:29'),
(313, 4, 'News API', 'Fetch News for home', '2025-01-09 16:09:03'),
(314, 4, 'News API', 'Fetch News for home', '2025-01-09 16:27:45'),
(315, 4, 'News API', 'Fetch News for home', '2025-01-10 00:10:50'),
(316, 4, 'News API', 'Fetch News for home', '2025-01-10 00:15:11'),
(317, 4, 'News API', 'Fetch News for home', '2025-01-10 00:15:54'),
(318, 4, 'News API', 'Search News for home with query \"New York \"', '2025-01-10 00:16:44'),
(319, 4, 'News API', 'Search News for home with query \"New York \"', '2025-01-10 00:16:45'),
(320, 4, 'News API', 'Fetch News for home with query \"New York \"', '2025-01-10 00:16:46'),
(321, 4, 'News API', 'Fetch News for home with query \"New York \"', '2025-01-10 00:16:46'),
(322, 4, 'News API', 'Search News for world with query \"New York \"', '2025-01-10 00:16:54'),
(323, 4, 'News API', 'Fetch News for world with query \"New York \"', '2025-01-10 00:16:55'),
(324, 4, 'News API', 'Search News for world with query \"\"', '2025-01-10 00:16:59'),
(325, 4, 'News API', 'Fetch News for world', '2025-01-10 00:16:59'),
(326, 4, 'News API', 'Search News for world with query \"L\"', '2025-01-10 00:17:12'),
(327, 4, 'News API', 'Fetch News for world with query \"L\"', '2025-01-10 00:17:12'),
(328, 4, 'News API', 'Search News for world with query \"Sc\"', '2025-01-10 00:17:23'),
(329, 4, 'News API', 'Fetch News for world with query \"Sc\"', '2025-01-10 00:17:23'),
(330, 4, 'News API', 'Fetch News for home', '2025-01-10 00:17:45'),
(331, 4, 'News API', 'Search News for science with query \"\"', '2025-01-10 00:18:04'),
(332, 4, 'News API', 'Fetch News for science', '2025-01-10 00:18:05'),
(333, 4, 'News API', 'Fetch News for home', '2025-01-10 01:23:21'),
(334, 4, 'News API', 'Fetch News for home', '2025-01-10 01:24:52'),
(335, 4, 'News API', 'Search News for technology with query \"\"', '2025-01-10 01:24:56'),
(336, 4, 'News API', 'Fetch News for technology', '2025-01-10 01:24:57'),
(337, 4, 'News API', 'Search News for technology with query \"TikTok\"', '2025-01-10 01:25:41'),
(338, 4, 'News API', 'Fetch News for technology with query \"TikTok\"', '2025-01-10 01:25:41'),
(339, 1, 'News API', 'Fetch News for home', '2025-01-10 03:34:40'),
(340, 1, 'News API', 'Fetch News for home', '2025-01-10 05:19:02'),
(341, 1, 'News API', 'Fetch News for home', '2025-01-10 16:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `date_created`) VALUES
(1, 'aziela', '$2y$10$365lwsmjfX2KVivPmSuoPumnCWJXJikON9zOJFQXdurIpvK1DXYse', 'azielaazieatul@gmail.com', '2025-01-04 18:31:31'),
(2, 'rai', '$2y$10$lPw1x3nVrbhZ33eBgUHSO.y02sZtvCPxIAsu9.dxCiBzQfp3YoEBW', 'aziela@gmail.com', '2025-01-04 21:51:39'),
(4, 'harisyah', '$2y$10$OCiQO50q5Vs9rZ.nyh9UM.6u5TJz0WCSktf3jdzLEISzzMssAG1TC', 'harisyahadzami@gmail.com', '2025-01-06 10:57:04'),
(7, 'FakhrulHakimy', '$2y$10$SjJD/j4sphqEZxOuj0NuZuJK719DRIuQP0/TDDEML9g//Ukp1XX/u', 'fakhrulhakimy93@gmail.com', '2025-01-09 07:34:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `interaction_logs`
--
ALTER TABLE `interaction_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `interaction_logs`
--
ALTER TABLE `interaction_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `interaction_logs`
--
ALTER TABLE `interaction_logs`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `interaction_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
