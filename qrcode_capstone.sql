-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 06:19 AM
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
-- Database: `qrcode_capstone`
--

-- --------------------------------------------------------

--
-- Table structure for table `object`
--

CREATE TABLE `object` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `scanned` int(11) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `object`
--

INSERT INTO `object` (`id`, `user_id`, `nama`, `scanned`, `date_time`) VALUES
(1, 2, 'patung caturmuka', 8, '2024-11-23 03:21:50');

-- --------------------------------------------------------

--
-- Table structure for table `object_image`
--

CREATE TABLE `object_image` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `src` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `object_image`
--

INSERT INTO `object_image` (`id`, `object_id`, `src`) VALUES
(1, 1, 'https://www.denpasarkota.go.id/public/uploads/berita/berita_202311021137_PatungCaturMuka,FilosofiKepemimpinanRepresentasiDewaBrahma.jpeg'),
(2, 1, 'https://cdn.idntimes.com/content-images/community/2023/09/caturmuka1-c7c8a956c08d5240d23a9803c984bd4e-988a02c24588103695718a4b8625a848.jpg'),
(3, 1, 'http://asdasdasd'),
(4, 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `object_properties`
--

CREATE TABLE `object_properties` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `object_properties`
--

INSERT INTO `object_properties` (`id`, `object_id`, `judul`, `isi`) VALUES
(1, 1, 'Sejarah', 'Patung Catur Muka didirikan 1973 oleh I Gusti Nyoman Lempad, seniman asal Ubud. Patung granit setinggi sembilan meter ini menghadap empat penjuru mata angin, yaitu barat, timur, utara, dan selatan. Patung ini dilengkapi dengan air mancur menari dan warna-'),
(3, 1, 'referensi', 'https://denpasartourism.com/destination/catur-muka'),
(4, 1, 'video', 'https://www.youtube.com/embed/kdaXGola9sI?si=CXKDt-2N6OkB50WJ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `telp` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `telp`, `email`, `password`, `date_time`) VALUES
(1, 'superadmin', '0', 'superadmin@capstone.com', '8310ebb991e32ba9e25d90c185d506a1', '2024-11-23 03:20:58'),
(2, 'admin1', '0828282', 'admin1@capstone.com', '80c1dc9c9d4ed8b086c0c9bb7a9ca46c', '2024-11-23 03:21:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `object_image`
--
ALTER TABLE `object_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`);

--
-- Indexes for table `object_properties`
--
ALTER TABLE `object_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `object`
--
ALTER TABLE `object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `object_image`
--
ALTER TABLE `object_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `object_properties`
--
ALTER TABLE `object_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `object`
--
ALTER TABLE `object`
  ADD CONSTRAINT `object_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `object_image`
--
ALTER TABLE `object_image`
  ADD CONSTRAINT `object_image_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`);

--
-- Constraints for table `object_properties`
--
ALTER TABLE `object_properties`
  ADD CONSTRAINT `object_properties_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
