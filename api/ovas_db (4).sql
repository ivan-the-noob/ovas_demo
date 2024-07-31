-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2024 at 12:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ovas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment_list`
--

CREATE TABLE `appointment_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `schedule` date NOT NULL,
  `owner_name` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `breed` text NOT NULL,
  `age` varchar(50) NOT NULL,
  `service_ids` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `total_payment` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_list`
--

INSERT INTO `appointment_list` (`id`, `code`, `schedule`, `owner_name`, `contact`, `email`, `address`, `category_id`, `breed`, `age`, `service_ids`, `status`, `date_created`, `date_updated`, `total_payment`) VALUES
(1, 'OVAS-2022010001', '2022-01-04', 'John D Smith', '0912345789', 'jsmith@sample.com', 'Here City', 1, 'German Shepherd', '5 mos. old', '3,1', 0, '2022-01-04 15:55:21', NULL, 0.00),
(2, 'OVAS-2022010002', '2022-01-05', 'Claire Blake', '09123456897', 'cblake@sample.com', 'There City', 1, 'Pug', '6 mos. old', '3,1', 0, '2022-01-04 15:56:55', NULL, 0.00),
(3, 'OVAS-2022010003', '2022-01-05', 'Mark Cooper', '094567894152', 'mcooper@gmail.com', 'Here', 2, 'Persian Cat', '1 yr. old', '5,3', 0, '2022-01-04 15:58:23', NULL, 0.00),
(4, 'OVAS-2022010004', '2022-01-05', 'Samantha Miller', '0995564887', 'smiller@sample.com', 'Sample Address', 2, 'Maine Coon', '7 mos.', '5,1', 0, '2022-01-04 15:59:51', NULL, 0.00),
(6, 'OVAS-2022010006', '2022-01-06', 'Jane Park', '09888754466', 'jpark@gmail.com', 'Sample address', 2, 'Ragdoll', '8 mos', '5,1', 1, '2022-01-04 16:27:54', '2022-01-04 17:17:55', 0.00),
(8, 'OVAS-2024060001', '2024-06-25', 'anne', '111', 'margarettemarcial@gmail.com', 'amaya 2, tanza, cavite', 1, 'Siberian Husky', '2 y/o', '3,1', 1, '2024-06-25 22:02:29', '2024-06-25 22:04:59', 0.00),
(9, 'OVAS-2024060002', '2024-06-29', 'anne', '111', 'margarettemarcial@gmail.com', 'amaya', 2, 'Siberian Husky', '2 y/o', '5,3', 0, '2024-06-25 22:28:23', NULL, 0.00),
(10, 'OVAS-2024060003', '2024-06-25', 'anne', '111', 'anne@gmail.com', 'amaya', 2, 'Siberian Husky', '2 y/o', '5,3', 0, '2024-06-25 23:10:42', NULL, 750.00),
(11, 'OVAS-2024060004', '2024-07-03', 'racel mae', '09222', 'cel@gmail.com', 'Paradahan', 2, 'Persian', '5', '3,1', 0, '2024-06-25 23:39:16', NULL, 2000.00),
(13, 'OVAS-2024060005', '2024-06-27', 'kim', '52487', 'kim@gmail.com', 'asda', 2, 'Persian', '', '3', 1, '2024-06-26 00:56:42', '2024-06-26 01:57:57', 0.00),
(15, 'OVAS-2024060006', '2024-06-27', 'kim', '6666', 'kim@gmail.com', 'dgd', 2, 'Persian', '1 yr. old', '4,8', 1, '2024-06-26 03:54:21', '2024-06-26 03:54:59', 1300.00),
(16, 'OVAS-2024060007', '2024-07-02', 'Frances Louise Medrano', '09615475621', 'frances@gmail.com', 'Maliksi, General Trias, Cavite', 1, 'Poodle', '3 yrs old', '8,10,1,12', 0, '2024-06-26 03:58:50', NULL, 3450.00),
(17, 'OVAS-2024060008', '2024-06-27', 'Frances Louise Medrano', '09615475621', 'frances@gmail.com', 'a', 3, 'n/a', '1 yr. old', '8', 0, '2024-06-26 09:11:32', NULL, 1000.00),
(18, 'OVAS-2024060009', '2024-07-03', 'Frances Louise Medrano', '09615475621', 'frances@gmail.com', 'uogh', 1, 'n/a', '1 yr. old', '8,3,9', 0, '2024-06-26 09:16:07', NULL, 2150.00),
(19, 'OVAS-2024060010', '2024-07-02', 'Frances Louise Medrano', '09615475621', 'frances@gmail.com', 'fsas', 3, 'n/a', '1 yr. old', '8,3', 0, '2024-06-26 13:40:22', NULL, 1500.00);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Active, 1 = Delete',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dogs', 0, '2022-01-04 10:31:11', NULL),
(2, 'Cats', 0, '2022-01-04 10:31:38', NULL),
(3, 'Hamsters', 0, '2022-01-04 10:32:02', NULL),
(4, 'Rabbits', 0, '2022-01-04 10:32:13', NULL),
(5, 'Birds', 0, '2022-01-04 10:32:47', NULL),
(6, 'test', 1, '2022-01-04 10:33:02', NULL),
(7, 'uranggutan', 1, '2024-06-26 01:53:42', NULL),
(8, 'Monkey', 1, '2024-06-26 03:55:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_table`
--

CREATE TABLE `login_table` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message_list`
--

INSERT INTO `message_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `date_created`) VALUES
(1, 'test', '09123456897', 'jsmith@sample.com', 'test', 1, '2022-01-04 17:26:19'),
(2, 'testing', '09618757048', 'testing@gmail.com', 'Hi', 1, '2024-06-26 01:32:22'),
(3, 'Frances Medrano', '09618757048', 'ces@gmail.com', '123', 1, '2024-06-26 03:59:09');

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `fee` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `category_ids`, `name`, `description`, `fee`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '2,1', 'Immunization', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Protect your pet\'s health with our Immunization feature. Schedule and manage vaccinations online, ensuring your pet stays up to date with essential immunizations. Access vaccination records, receive reminders for upcoming shots, and track your pet\'s immunization history conveniently. Keep your pet safe from preventable diseases and maintain their overall well-being with ease through our online booking platform.<br></p>', 1500, 0, '2022-01-04 10:59:49', '2024-06-26 01:07:01'),
(2, '2,1', 'Vaccination', '<p><font color=\"#000000\">Ensure your pet\'s health and safety with our Vaccines feature. When booking services online, you\'ll have access to up-to-date vaccination records for each pet. Our system allows you to upload, view, and manage these records easily, ensuring that all pets meet the necessary health requirements. This helps maintain a safe environment for all pets and provides peace of mind for both pet owners and service providers.</font><br></p>', 1000, 0, '2022-01-04 11:14:24', '2024-06-26 01:14:08'),
(3, '5,2,1,3,4', 'Check-up', '<p>Keep your pet in top health with our Check-Up feature. Book routine veterinary check-ups online to monitor and maintain your pet\'s well-being. Easily schedule appointments, access medical records, and receive reminders for upcoming visits. Ensure your pet receives regular care and attention for a happy, healthy life.<br></p>', 500, 0, '2022-01-04 11:15:09', '2024-06-26 01:06:20'),
(4, '2,1', 'Anti-Rabies', '<p>Keep your online pet booking experience safe and secure with Anti-Rubbies. Our advanced system ensures all transactions and interactions are genuine by using multi-factor authentication, secure payments, and AI-powered fraud detection. Enjoy peace of mind with verified reviews, encrypted messaging, and real-time alerts for suspicious activities. Book with confidence knowing that Anti-Rubbies has got you covered.<br></p>', 300, 0, '2022-01-04 11:16:24', '2024-06-26 01:54:56'),
(5, '2', 'Anti-Rabies', '<p>Keep your online pet booking experience safe and secure with Anti-Rubbies. Our advanced system ensures all transactions and interactions are genuine by using multi-factor authentication, secure payments, and AI-powered fraud detection. Enjoy peace of mind with verified reviews, encrypted messaging, and real-time alerts for suspicious activities. Book with confidence knowing that Anti-Rubbies has got you covered.<br></p>', 250, 1, '2022-01-04 11:16:38', '2024-06-26 01:21:38'),
(6, '4', 'deleted', '<p>test</p>', 123, 1, '2022-01-04 11:17:34', '2022-01-04 11:17:46'),
(7, '1', 'nnjn', '<p>hjbjh</p>', 660, 1, '2024-06-26 01:02:57', '2024-06-26 01:03:02'),
(8, '2,1,3,4', 'Blood Tests', '<p>Maintain your pet\'s well being with our Blood Test feature. This service allows you to book blood tests for your pet easily through our online platform. Access detailed test results, track health metrics, and share vital health information with your vet or service provider. Ensuring your pet\'s health has never been more convenient, giving you peace of mind and helping to keep your furry friend in the best possible shape.<br></p>', 1000, 0, '2024-06-26 01:08:54', '2024-06-26 03:49:03'),
(9, '2,1,3,4', 'Deworming', '<p>Protect your pet from parasites with our Deworming feature. Conveniently book deworming treatments online and keep track of your pet\'s deworming schedule. Access detailed records, receive reminders for follow-up treatments, and ensure your pet stays healthy and parasite-free. Enjoy peace of mind knowing your pet\'s health is well-managed and protected.<br></p>', 650, 0, '2024-06-26 01:09:34', '2024-06-26 01:10:22'),
(10, '2,1', 'Grooming', '<p>Pamper your pet with our Grooming feature. Easily book grooming services online, including baths, haircuts, nail trims, and more. Customize your pet’s grooming schedule, view service details, and access grooming records. Ensure your pet looks and feels their best with professional care tailored to their needs. Enjoy the convenience of maintaining your pet’s hygiene and appearance with just a few clicks.<br></p>', 550, 0, '2024-06-26 01:10:56', '2024-06-26 01:11:19'),
(11, '5,2,1', 'Canine and Feline Disease Testing', '<p>Ensure your pet\'s health with our comprehensive disease testing feature. Book tests for common canine and feline diseases conveniently online. Access detailed test results, track health trends, and share critical information with your veterinarian. Stay proactive about your pet\'s health and well-being with our easy-to-use online booking system, providing peace of mind for pet owners.<br></p>', 1000, 0, '2024-06-26 01:12:54', NULL),
(13, '2,1', 'Ultrasound', '<p>Experience advanced veterinary care with our Ultrasound feature. Book ultrasound services online to monitor your pet\'s health and diagnose medical conditions. Access detailed imaging reports, collaborate with your veterinarian, and track your pet\'s progress conveniently. Ensure comprehensive care for your pet with state-of-the-art ultrasound technology available through our online booking platform.<br></p>', 650, 0, '2024-06-26 01:14:41', '2024-06-26 01:14:56'),
(14, '2', 'dgdsgddg', '<p>dg</p>', 30, 1, '2024-06-26 03:55:37', '2024-06-26 03:55:55');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Petrio Grooming and Veterninary Services'),
(6, 'short_name', 'Petrio'),
(11, 'logo', 'uploads/logo-1641262650.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/bg.jpg'),
(15, 'content', 'Array'),
(16, 'email', 'petrio@gmail.com'),
(17, 'contact', '09854698789 / 78945632'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'L6B3 JP Building, Westwood Mansion, Filinvest West Avenue, Paradahan 1 4108'),
(23, 'max_appointment', '30'),
(24, 'clinic_schedule', '9:00 AM - 5:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(7, 'racel', 'racel@gmail.com', '$2y$10$jHOUv.rUVvkk4tO5Iu57G.JNGKjPKRQwmyi8Clf/4j18UFthihIQe', '2024-06-26 19:27:36'),
(8, 'anne', 'anne@gmail.com', '$2y$10$VjOBVaeqIa4Q7.HiVKX/pOwoA90psG9RavYTg4rTBNzCiYbHuoZjq', '2024-06-26 20:02:39'),
(9, 'racel', 'racelmaeloquellano@gmail.com', '$2y$10$1WRK9h6DPVFblf6AscXLseBzjs8kBMQKcAWddOGXpN3Ncv6gPA2bq', '2024-06-26 20:33:47'),
(10, 'kim', 'kim@gmail.com', '$2y$10$xUS7G5Etjdx3dyHRc6kz1uts02yLVxXRJjHbppw.r/xQoVK771NkC', '2024-06-26 20:34:47'),
(11, 'cel', 'cel@gmail.com', '$2y$10$FnFgq5jyFXG0ymlSP1YY3.wRqZ39k8SotXbILteu6SvKq0jH2emcC', '2024-06-26 21:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2021-12-14 15:47:08'),
(3, 'Claire', NULL, 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-3.png?v=1639467985', NULL, 2, 1, '2021-12-14 15:46:25', '2021-12-14 15:46:25'),
(4, 'Kim', NULL, 'Lungcay', 'kimburat', '57e97cecfcc6955f8425561a3cf896bd', NULL, NULL, 1, 1, '2024-06-26 01:55:56', NULL),
(5, 'Celeste', NULL, 'Loquellano', 'cel', '42bc352460e9ad5c8badc00730a73bec', NULL, NULL, 2, 1, '2024-06-26 01:56:45', NULL),
(7, 'Racel', NULL, 'Loquellano', 'eee', 'd2f2297d6e829cd3493aa7de4416a18f', NULL, NULL, 2, 1, '2024-06-26 11:43:31', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment_list`
--
ALTER TABLE `appointment_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `total_payment_amount` (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_table`
--
ALTER TABLE `login_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment_list`
--
ALTER TABLE `appointment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login_table`
--
ALTER TABLE `login_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment_list`
--
ALTER TABLE `appointment_list`
  ADD CONSTRAINT `appointment_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
