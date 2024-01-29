/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - dbdigital_masjid
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbdigital_masjid` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dbdigital_masjid`;

/*Table structure for table `agenda` */

DROP TABLE IF EXISTS `agenda`;

CREATE TABLE `agenda` (
  `idagenda` char(7) NOT NULL,
  `namakegiatan` varchar(50) DEFAULT NULL,
  `tgl` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `jeniskegiatan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idagenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `agenda` */

insert  into `agenda`(`idagenda`,`namakegiatan`,`tgl`,`jam`,`jeniskegiatan`) values 
('A001','wirid','2023-11-27','14:18:00','anak yatim');

/*Table structure for table `donatur` */

DROP TABLE IF EXISTS `donatur`;

CREATE TABLE `donatur` (
  `iddonatur` char(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddonatur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `donatur` */

insert  into `donatur`(`iddonatur`,`nama`,`alamat`,`nohp`) values 
('D001','indri','Jalan Cemara','083181910106');

/*Table structure for table `kasmasjid` */

DROP TABLE IF EXISTS `kasmasjid`;

CREATE TABLE `kasmasjid` (
  `idkasmasjid` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `kasmasuk` double DEFAULT NULL,
  `kaskeluar` double DEFAULT NULL,
  `jeniskas` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `iddonaturmasjid` char(11) DEFAULT NULL,
  `idkegiatan` char(7) DEFAULT NULL,
  PRIMARY KEY (`idkasmasjid`),
  KEY `iddonaturmasjid` (`iddonaturmasjid`),
  KEY `idkegiatan` (`idkegiatan`),
  CONSTRAINT `kasmasjid_ibfk_1` FOREIGN KEY (`iddonaturmasjid`) REFERENCES `donatur` (`iddonatur`) ON UPDATE CASCADE,
  CONSTRAINT `kasmasjid_ibfk_2` FOREIGN KEY (`idkegiatan`) REFERENCES `agenda` (`idagenda`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `kasmasjid` */

insert  into `kasmasjid`(`idkasmasjid`,`tanggal`,`ket`,`kasmasuk`,`kaskeluar`,`jeniskas`,`status`,`iddonaturmasjid`,`idkegiatan`) values 
(1,'2023-12-29','Sumbangan untuk anak yatim',200000,0,'Mesjid','Masuk',NULL,NULL),
(13,'2024-01-08','Infak',100000,0,'Anak Yatim','Masuk',NULL,NULL),
(14,'2024-01-03','membayar khatib jumat',0,100000,'Mesjid','Keluar',NULL,NULL),
(15,'2024-01-06','Pembayaran Gaji Garin',0,250000,'Mesjid','Keluar',NULL,NULL),
(16,'2024-01-07','gaji guru ngaji',0,50000,'TPQ','Keluar',NULL,NULL),
(17,'2024-01-10','Sumbangan anak yatim',500000,0,'Anak Yatim','Masuk','D001',NULL);

/*Table structure for table `pengurus` */

DROP TABLE IF EXISTS `pengurus`;

CREATE TABLE `pengurus` (
  `idpengurus` char(11) NOT NULL,
  `namapengurus` varchar(35) DEFAULT NULL,
  `jabatan` varchar(30) NOT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idpengurus`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pengurus` */

insert  into `pengurus`(`idpengurus`,`namapengurus`,`jabatan`,`alamat`,`nohp`) values 
('P001','Sifa','Seksi Dakwa','Jl. Pasar Baru','083181910106'),
('P002','Aulya','Bendahara','Jl. Belimbing','085234125667'),
('P003','ayu','bendahara','Jl. Pasar Raya','081273288291');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `namauser` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

insert  into `user`(`iduser`,`namauser`,`email`,`password`,`level`) values 
(5,'putri','putri@gmail.com','$2y$10$LiUaaJGQ/ivaM601Amt5X.mUMtJpudG2sA2ufYeqxNDhvMmTt1MWW',1),
(6,'sifa','sifa@gmail.com','$2y$10$ca3m0lemyu64mNp87RoTGexTUyrrBhC5MsX.FXEzATJH7S/k4NQne',2),
(7,'aulya','aulya@gmail.com','$2y$10$EU14xHICwmPhty/o7QMNo.nWZlPQvNcXrhbPIIBCkZgt174Rp9cyC',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
