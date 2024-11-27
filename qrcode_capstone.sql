-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2024 at 01:42 PM
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
(1, 1, 'https://cdn.idntimes.com/content-images/community/2023/09/caturmuka1-c7c8a956c08d5240d23a9803c984bd4e-988a02c24588103695718a4b8625a848.jpg'),
(2, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-LgKNMmiWWfmoXSyWGmzTu7aTYnpDrp_ztA&s\n'),
(3, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIMcMalQF8YWlgCzCL2wvUGjuCJtd36-bUHQ&s\n');

-- --------------------------------------------------------

--
-- Table structure for table `object_properties`
--

CREATE TABLE `object_properties` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `object_properties`
--

INSERT INTO `object_properties` (`id`, `object_id`, `judul`, `isi`) VALUES
(1, 1, 'Sejarah', 'Patung catur muka dibuat pada tahun 1973 oleh seorang seniman bernama\r\n          <b> I Gusti Nyoman Lempad (Dhana, 2002).</b> <br />\r\n          Patung ini berbahan dasar batu granit dengan tinggi sembilan (9) meter\r\n          dan terletak di tengah perempatan yang menghubungkan jalan Gajah Mada,\r\n          jalan Surapati, jalan Veteran dan jalan Udayana.'),
(3, 1, 'Makna kepala empat pada Patung Catur Muka', ' Patung Catur Muka mengambil sosok Dewa Brahma. Dewa Brahma dipercaya\r\n          sebagai simbol asal mula dari kehidupan dan kenyataan yang tidak\r\n          terbatas. Pada bagian bawah (alas) terdapat bunga lotus atau padma\r\n          sebagai lambang kesucian dan alam semesta.\r\n          <br />\r\n          <br />\r\n          Catur Muka berasal dari kata catur yang berarti empat, dan muka\r\n          berarti kepala atau wajah. Jadi Catur Muka berarti sosok yang memiliki\r\n          empat kepala. Pada Patung Catur Muka terdapat empat kepala sebagai\r\n          simbol Dewa Brahma dengan empat sifat berbeda. Masing-masing kepala\r\n          pada Patung Catur Muka menghadap ke empat arah penjuru mata angin.\r\n          <br />\r\n          <br />\r\n          <b>Berikut makna dari empat kepala pada Patung Catur Muka:</b>\r\n          <ol className=\"list-disc\">\r\n            <li className=\"ml-4 text-justify lg:text-sm mt-1\">\r\n              Kepala yang menghadap ke barat atau ke Jalan Gajah Mada sebagai\r\n              simbol Dewa Mahadewa yang memiliki sifat kasih sayang{\" \"}\r\n            </li>\r\n            <li className=\"ml-4 text-justify lg:text-sm mt-1\">\r\n              Kepala menghadap ke timur atau ke Jalan Surapati sebagai simbol\r\n              Dewa Iswara yang memiliki sifat bijaksana{\" \"}\r\n            </li>\r\n            <li className=\"ml-4 text-justify lg:text-sm mt-1\">\r\n              Kepala menghadap ke selatan atau ke Jalan Udayana sebagai simbol\r\n              Dewa Brahma yang memiliki sifat menjaga ketentraman\r\n            </li>\r\n            <li className=\"ml-4 text-justify lg:text-sm mt-1\">\r\n              Kepala yang menghadap ke utara atau ke Jalan Veteran sebagai\r\n              simbol Dewa Wisnu sebagai simbol sifat kuat dan menyucikan jiwa\r\n              manusia.\r\n            </li>\r\n          </ol>'),
(4, 1, 'Keistimewaan Patung Catur Muka', ' Patung Catur muka memiliki peran penting dalam mempertahankan\r\n          kebudayaan kerajaan. Patung Catur Muka berfungsi sebagai batas\r\n          wilayah, dan batas puri-puri sebagai transformasi kerajaan di Bali.\r\n          Selain wilayah puri-puri, juga sebagai pembagi wilayah Kota Denpasar.\r\n          <br />\r\n          <br />\r\n          Patung Catur Muka juga berperan penting dalam budaya dan tradisi.\r\n          Pemilihan lokasi di titik nol Kota Denpasar ini sekaligus menjadi\r\n          sebuah Catus Patha Agung (simpang empat utama) Kota Denpasar. Sebagai\r\n          Catus Patha Agung, Patung Catur Muka sebagai tempat pelaksanaan Tawur\r\n          Agung Kesanga Kota Denpasar, upacara pencaruan (upacara korban suci)\r\n          lainnya, dan upacara yang dilakukan pihak puri seperti Mepurwa\r\n          Daksina, dan lainnya.\r\n          <br />\r\n          <br />\r\n          Sebagai ikon Kota Denpasar, Patung Catur Muka sering dijadikan lokasi\r\n          acara yang diadakan oleh Pemkot Denpasar atau pihak lainnya. Patung\r\n          Catur Muka memiliki kekuatan taksu tersendiri bagi banjar-banjar di\r\n          seputaran Kota Denpasar saat pelaksanaan tradisi ogoh-ogoh. Hampir\r\n          setiap banjar yang membuat ogoh-ogoh selalu beratraksi di area Patung\r\n          Catur Muka.\r\n          <br />\r\n          <br />\r\n          Sebagai ikon Kota Denpasar, Patung Catur Muka selalu berbenah. Patung\r\n          Catur Muka kini memiliki air mancur yang dapat bergerak secara dinamis\r\n          dengan hiasan lampu-lampu warna-warni. Tak jarang, wisatawan yang\r\n          sedang berkunjung ke Kota Denpasar menyempatkan diri untuk\r\n          mengabadikan Patung Catur Muka.'),
(6, 1, 'Video', '0XGhDxfroPA?si=J7oqyVbxkcYhUVRl'),
(7, 1, 'Referensi', ' Ari Budiadnyana (18 September 2023)\r\n            <br />\r\n            <a\r\n              target=\"_blank\"\r\n              rel=\"noopener noreferrer\"\r\n              href=\"https://bali.idntimes.com/science/discovery/ari-budiadnyana/sejarah-patung-catur-muka-denpasar-c1c2\"\r\n              className=\"hover:underline hover:cursor-pointer text-blue-500\"\r\n            >\r\n              Sejarah Patung Catur Muka, Ikonnya Kota Denpasar\r\n            </a>');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
