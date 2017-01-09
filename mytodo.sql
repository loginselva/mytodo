-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2017 at 05:39 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mytodo`
--

-- --------------------------------------------------------

--
-- Table structure for table `my_users`
--

CREATE TABLE IF NOT EXISTS `my_users` (
`id` int(11) NOT NULL,
  `username` varchar(250) DEFAULT NULL,
  `profile_id` varchar(250) DEFAULT NULL,
  `email_id` varchar(250) DEFAULT NULL,
  `token_id` longtext,
  `status` enum('A','I') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `my_users`
--

INSERT INTO `my_users` (`id`, `username`, `profile_id`, `email_id`, `token_id`, `status`) VALUES
(1, 'selva kumar', '114482921324621091439', 'loginselva@gmail.com', 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjAxMjg1OGI1YTZiNDQ3YmY4MDdjNTJkOGJjZGQyOGMwODJmZjc4MjYifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWF0IjoxNDgzODQ4NDg5LCJleHAiOjE0ODM4NTIwODksImF0X2hhc2giOiJDTUZTNV9neGdjUzVDanpfNmR3eGp3IiwiYXVkIjoiNzg0MzU0MjI3MjUwLWxnOHE1ZGlkcWMxb2syMTE1c2RhMjZhbWw3MnI0dXR1LmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTE0NDgyOTIxMzI0NjIxMDkxNDM5IiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF6cCI6Ijc4NDM1NDIyNzI1MC1sZzhxNWRpZHFjMW9rMjExNXNkYTI2YW1sNzJyNHV0dS5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImVtYWlsIjoibG9naW5zZWx2YUBnbWFpbC5jb20iLCJuYW1lIjoic2VsdmEga3VtYXIiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDYuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1SbnZia0pGVndkSS9BQUFBQUFBQUFBSS9BQUFBQUFBQUFJWS95ODNtZzhrcFVzVS9zOTYtYy9waG90by5qcGciLCJnaXZlbl9uYW1lIjoic2VsdmEiLCJmYW1pbHlfbmFtZSI6Imt1bWFyIiwibG9jYWxlIjoiZW4ifQ.a6MEPl0YgUvN7vuxojhk4Xs9cx8P4SwI2aMmtcEq0QXdJxWrem6COWu5y2lwkax2ms23rD_uELMkV8NNf88ZBvlLfqI7lTwT8ZUNgyY5NYzc_FpJW4xFqFK-i7A18oZhmfSkg5hRYXE4ZWbnlTgRKH2z5VDMmxJnBGimuqbvQjDabAMD1-rRAPTaX4zQNk5YfiaBpAhnjDIB1Sr3bJjIzNS0GLZa0gFf_1eGCtLtEuPD-vQG_FgJpa2Uj9JTLJdB6zm4Zmr9e6J6aj_20uvV3KRWxiSlf6LjM9p3K1rIQ7n2CePDrjBid5FDHU2Dr3JfhgpPPTMpGdfXFrvXblg78Q', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `my_users_todo`
--

CREATE TABLE IF NOT EXISTS `my_users_todo` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `list_name` varchar(250) NOT NULL,
  `action` enum('A','I') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `my_users_todo`
--

INSERT INTO `my_users_todo` (`id`, `user_id`, `list_name`, `action`) VALUES
(50, 1, 'Scrum meeting', 'I'),
(51, 1, 'Have a call with Glen', 'I');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `my_users`
--
ALTER TABLE `my_users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_users_todo`
--
ALTER TABLE `my_users_todo`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `list_name` (`list_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `my_users`
--
ALTER TABLE `my_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `my_users_todo`
--
ALTER TABLE `my_users_todo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
