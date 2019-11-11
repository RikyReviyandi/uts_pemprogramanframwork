-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2019 at 06:22 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas`
--

-- --------------------------------------------------------

--
-- Table structure for table `datamahasiswa`
--

CREATE TABLE `datamahasiswa` (
  `id` int(10) NOT NULL,
  `nim` varchar(25) NOT NULL,
  `nmmahasiswa` varchar(125) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `nohp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `datamahasiswa`
--

INSERT INTO `datamahasiswa` (`id`, `nim`, `nmmahasiswa`, `jk`, `alamat`, `nohp`) VALUES
(1, '161240000565', 'riky reviyandi', 'Laki-laki', 'jepara', '08122563000'),
(2, '161240000565', 'mouren', 'perempuan', 'lombok', '085367676001'),
(3, '1612400005123', 'dedek billa', 'perempuan', 'jakarta', '08567866308'),
(4, '161240000570', 'nak iinul', 'Laki-laki', 'cino', '08572797808'),
(5, '161240000522', 'publick ngentyau', 'Perempuan', 'hayo', '08978675605');

--
-- Triggers `datamahasiswa`
--
DELIMITER $$
CREATE TRIGGER `BEFORE_UPDATE` BEFORE UPDATE ON `datamahasiswa` FOR EACH ROW BEGIN
	INSERT INTO log
    SET id = OLD.id,
    nim = OLD.nim,
    nohp_lama = OLD.nohp,
    nohp_baru = new.nohp,
    tgl_diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(15) NOT NULL,
  `nim` varchar(25) NOT NULL,
  `nohp_lama` varchar(25) NOT NULL,
  `nohp_baru` varchar(25) NOT NULL,
  `tgl_diubah` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `nim`, `nohp_lama`, `nohp_baru`, `tgl_diubah`) VALUES
(1, '161240000520', '08122563211', '08122563000', '2019-11-11'),
(2, '161240000565', '085367676000', '085367676001', '2019-11-11'),
(3, '161240000511', '08567866388', '08567866308', '2019-11-11'),
(4, '161240000560', '08572797866', '08572797808', '2019-11-11'),
(5, '161240000522', '08978675668', '08978675605', '2019-11-11');

-- --------------------------------------------------------

--
-- Stand-in structure for view `tblmhs`
-- (See below for the actual view)
--
CREATE TABLE `tblmhs` (
`id` int(10)
,`nim` varchar(25)
,`nmmahasiswa` varchar(125)
,`jk` varchar(10)
,`alamat` varchar(100)
,`nohp` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `tblmhs`
--
DROP TABLE IF EXISTS `tblmhs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tblmhs`  AS  (select `datamahasiswa`.`id` AS `id`,`datamahasiswa`.`nim` AS `nim`,`datamahasiswa`.`nmmahasiswa` AS `nmmahasiswa`,`datamahasiswa`.`jk` AS `jk`,`datamahasiswa`.`alamat` AS `alamat`,`datamahasiswa`.`nohp` AS `nohp` from `datamahasiswa`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `datamahasiswa`
--
ALTER TABLE `datamahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `datamahasiswa`
--
ALTER TABLE `datamahasiswa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
