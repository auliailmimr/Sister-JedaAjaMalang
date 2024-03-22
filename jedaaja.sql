-- --------------------------------------------------------
-- Host:                         192.168.56.48
-- Server version:               10.1.38-MariaDB - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table jedaaja.pemesanan
CREATE TABLE IF NOT EXISTS `pemesanan` (
  `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_wisata` int(11) NOT NULL,
  `tanggal` varchar(250) NOT NULL,
  `jumlah_tiket` int(11) NOT NULL,
  PRIMARY KEY (`id_pemesanan`),
  KEY `FK__user` (`id_user`),
  KEY `FK__wisata` (`id_wisata`),
  CONSTRAINT `FK__user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__wisata` FOREIGN KEY (`id_wisata`) REFERENCES `wisata` (`id_wisata`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table jedaaja.pemesanan: ~0 rows (approximately)
DELETE FROM `pemesanan`;

-- Dumping structure for table jedaaja.tiket
CREATE TABLE IF NOT EXISTS `tiket` (
  `id_tiket` int(11) NOT NULL AUTO_INCREMENT,
  `nama_tiket` varchar(250) NOT NULL DEFAULT '',
  `harga` int(11) NOT NULL DEFAULT '0',
  `deskripsi_tiket` varchar(250) NOT NULL DEFAULT '',
  `id_wisata` int(11) NOT NULL,
  PRIMARY KEY (`id_tiket`),
  KEY `FK_tiket_wisata` (`id_wisata`),
  CONSTRAINT `FK_tiket_wisata` FOREIGN KEY (`id_wisata`) REFERENCES `wisata` (`id_wisata`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table jedaaja.tiket: ~1 rows (approximately)
DELETE FROM `tiket`;
INSERT INTO `tiket` (`id_tiket`, `nama_tiket`, `harga`, `deskripsi_tiket`, `id_wisata`) VALUES
	(1, 'Tiket Bedengan', 10000, 'Berlaku Untuk Hari Ini', 1);

-- Dumping structure for table jedaaja.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `password` varchar(250) NOT NULL DEFAULT '',
  `akses` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table jedaaja.user: ~2 rows (approximately)
DELETE FROM `user`;
INSERT INTO `user` (`id_user`, `nama`, `email`, `password`, `akses`) VALUES
	(1, 'admin', 'admin@admin.com', 'admin', 1),
	(2, 'Jemmy', 'jemjem@jem.com', 'jemmy', 0);

-- Dumping structure for table jedaaja.wisata
CREATE TABLE IF NOT EXISTS `wisata` (
  `id_wisata` int(11) NOT NULL AUTO_INCREMENT,
  `nama_wisata` varchar(250) NOT NULL DEFAULT '',
  `lokasi` varchar(250) NOT NULL DEFAULT '',
  `harga_tiket` int(11) NOT NULL DEFAULT '0',
  `deskripsi` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_wisata`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table jedaaja.wisata: ~1 rows (approximately)
DELETE FROM `wisata`;
INSERT INTO `wisata` (`id_wisata`, `nama_wisata`, `lokasi`, `harga_tiket`, `deskripsi`) VALUES
	(1, 'Bedengan', 'Malang', 10000, 'test123');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
