-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: proedudb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE SCHEMA IF NOT EXISTS proedudb;

USE proedudb;

--
-- Table structure for table `absen_kelas`
--

DROP TABLE IF EXISTS `absen_kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `absen_kelas` (
  `id` int(11) NOT NULL,
  `keterangan` enum('hadir','izin','tidak hadir') DEFAULT NULL,
  `mk_kp_id` int(11) NOT NULL,
  `mahasiswa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_absen_kelas_mahasiswa_mk1_idx` (`mk_kp_id`,`mahasiswa_id`),
  CONSTRAINT `fk_absen_kelas_mahasiswa_mk1` FOREIGN KEY (`mk_kp_id`, `mahasiswa_id`) REFERENCES `mahasiswa_mk` (`semester_mk_kp_id`, `mahasiswa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absen_kelas`
--

LOCK TABLES `absen_kelas` WRITE;
/*!40000 ALTER TABLE `absen_kelas` DISABLE KEYS */;
/*!40000 ALTER TABLE `absen_kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `npk` varchar(7) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nomor_telepon` varchar(20) NOT NULL,
  `jenis_admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `NIK_UNIQUE` (`nik`),
  KEY `fk_admins_jenis_admins1_idx` (`jenis_admin_id`),
  CONSTRAINT `fk_admins_jenis_admins1` FOREIGN KEY (`jenis_admin_id`) REFERENCES `jenis_admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_pembayarans`
--

DROP TABLE IF EXISTS `detail_pembayarans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_pembayarans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_pembayaran` varchar(45) DEFAULT NULL,
  `keterangan_pembayaran` int(11) NOT NULL,
  `bukti_pembayaran` varchar(255) DEFAULT NULL,
  `pembayaran_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `jatuh_tempo` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_keterangan_pembayarans_pembayaran1_idx` (`pembayaran_id`),
  KEY `fk_detail_pembayarans_admins1_idx` (`admin_id`),
  CONSTRAINT `fk_detail_pembayarans_admins1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_keterangan_pembayarans_pembayaran1` FOREIGN KEY (`pembayaran_id`) REFERENCES `pembayarans` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_pembayarans`
--

LOCK TABLES `detail_pembayarans` WRITE;
/*!40000 ALTER TABLE `detail_pembayarans` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_pembayarans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dosens`
--

DROP TABLE IF EXISTS `dosens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dosens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nik` varchar(50) NOT NULL,
  `npk` varchar(7) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nomor_telepon` varchar(20) NOT NULL,
  `status_pengajar` enum('Honorer','Tetap') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `npk_UNIQUE` (`npk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosens`
--

LOCK TABLES `dosens` WRITE;
/*!40000 ALTER TABLE `dosens` DISABLE KEYS */;
/*!40000 ALTER TABLE `dosens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ips`
--

DROP TABLE IF EXISTS `ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ips` (
  `semester_id` int(11) NOT NULL,
  `mahasiswa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`semester_id`,`mahasiswa_id`),
  KEY `fk_semesters_has_mahasiswas_mahasiswas1_idx` (`mahasiswa_id`),
  KEY `fk_semesters_has_mahasiswas_semesters1_idx` (`semester_id`),
  CONSTRAINT `fk_semesters_has_mahasiswas_mahasiswas1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semesters_has_mahasiswas_semesters1` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_admins`
--

DROP TABLE IF EXISTS `jenis_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` enum('Jurusan','Keuangan') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_admins`
--

LOCK TABLES `jenis_admins` WRITE;
/*!40000 ALTER TABLE `jenis_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `jenis_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurusans`
--

DROP TABLE IF EXISTS `jurusans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurusans` (
  `id` int(11) NOT NULL,
  `kode` char(2) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `kajur_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jurusans_dosens1_idx` (`kajur_id`),
  CONSTRAINT `fk_jurusans_dosens1` FOREIGN KEY (`kajur_id`) REFERENCES `dosens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurusans`
--

LOCK TABLES `jurusans` WRITE;
/*!40000 ALTER TABLE `jurusans` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurusans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas_paralels`
--

DROP TABLE IF EXISTS `kelas_paralels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kelas_paralels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas_paralels`
--

LOCK TABLES `kelas_paralels` WRITE;
/*!40000 ALTER TABLE `kelas_paralels` DISABLE KEYS */;
/*!40000 ALTER TABLE `kelas_paralels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `krs`
--

DROP TABLE IF EXISTS `krs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `krs` (
  `semester_mk_kp_id` int(11) NOT NULL,
  `mahasiswa_id` int(10) unsigned NOT NULL,
  `status` enum('diterima','ditolak','diproses') NOT NULL,
  `keterangan` int(11) NOT NULL,
  PRIMARY KEY (`semester_mk_kp_id`,`mahasiswa_id`),
  KEY `fk_semester_mk_kp_has_mahasiswas_mahasiswas2_idx` (`mahasiswa_id`),
  KEY `fk_semester_mk_kp_has_mahasiswas_semester_mk_kp2_idx` (`semester_mk_kp_id`),
  CONSTRAINT `fk_semester_mk_kp_has_mahasiswas_mahasiswas2` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semester_mk_kp_has_mahasiswas_semester_mk_kp2` FOREIGN KEY (`semester_mk_kp_id`) REFERENCES `semester_mk_kp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `krs`
--

LOCK TABLES `krs` WRITE;
/*!40000 ALTER TABLE `krs` DISABLE KEYS */;
/*!40000 ALTER TABLE `krs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa_mk`
--

DROP TABLE IF EXISTS `mahasiswa_mk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa_mk` (
  `semester_mk_kp_id` int(11) NOT NULL,
  `mahasiswa_id` int(10) unsigned NOT NULL,
  `nts` double DEFAULT NULL,
  `nas` double DEFAULT NULL,
  `na` double DEFAULT NULL,
  `nisbi` char(2) DEFAULT NULL,
  PRIMARY KEY (`semester_mk_kp_id`,`mahasiswa_id`),
  KEY `fk_semester_mk_kp_has_mahasiswas_mahasiswas1_idx` (`mahasiswa_id`),
  KEY `fk_semester_mk_kp_has_mahasiswas_semester_mk_kp1_idx` (`semester_mk_kp_id`),
  CONSTRAINT `fk_semester_mk_kp_has_mahasiswas_mahasiswas1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semester_mk_kp_has_mahasiswas_semester_mk_kp1` FOREIGN KEY (`semester_mk_kp_id`) REFERENCES `semester_mk_kp` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa_mk`
--

LOCK TABLES `mahasiswa_mk` WRITE;
/*!40000 ALTER TABLE `mahasiswa_mk` DISABLE KEYS */;
/*!40000 ALTER TABLE `mahasiswa_mk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswas`
--

DROP TABLE IF EXISTS `mahasiswas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nrp` varchar(7) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_mahasiswa` varchar(255) NOT NULL,
  `nomor_telepon` varchar(20) NOT NULL,
  `asal_sekolah` varchar(150) NOT NULL,
  `kota_lahir` varchar(50) NOT NULL,
  `telepon_orang_tua` varchar(20) NOT NULL,
  `strata_pendidikan` enum('Sarjana','Magister','Doktor') NOT NULL,
  `tanggal_pendaftaran` datetime NOT NULL,
  `ipk` double DEFAULT NULL,
  `status_kunci_krs` enum('buka','kunci') NOT NULL,
  `asisten` enum('ya','tidak') NOT NULL,
  `status_tilang` enum('buka','kunci') NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `nama_ayah` varchar(45) DEFAULT NULL,
  `nama_ibu` varchar(45) DEFAULT NULL,
  `password_orang_tua` varchar(45) NOT NULL,
  `jalur_penerimaan` enum('prestasi','test') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NIK_UNIQUE` (`nik`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `NRP_UNIQUE` (`nrp`),
  KEY `fk_mahasiswas_jurusans1_idx` (`jurusan_id`),
  CONSTRAINT `fk_mahasiswas_jurusans1` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusans` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswas`
--

LOCK TABLES `mahasiswas` WRITE;
/*!40000 ALTER TABLE `mahasiswas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mahasiswas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mata_kuliahs`
--

DROP TABLE IF EXISTS `mata_kuliahs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mata_kuliahs` (
  `id` int(11) NOT NULL,
  `kode` varchar(45) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `jumlah_sks` int(11) NOT NULL,
  `deskripsi` varchar(512) NOT NULL,
  `mata_kuliah_prasyarat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `kode_UNIQUE` (`kode`),
  KEY `fk_mata_kuliahs_mata_kuliahs1_idx` (`mata_kuliah_prasyarat_id`),
  CONSTRAINT `fk_mata_kuliahs_mata_kuliahs1` FOREIGN KEY (`mata_kuliah_prasyarat_id`) REFERENCES `mata_kuliahs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mata_kuliahs`
--

LOCK TABLES `mata_kuliahs` WRITE;
/*!40000 ALTER TABLE `mata_kuliahs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mata_kuliahs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayarans`
--

DROP TABLE IF EXISTS `pembayarans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembayarans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_lunas` enum('Lunas','Belum Lunas') NOT NULL,
  `cara_pembayaran` enum('Langsung','Cicil') NOT NULL,
  `semester` int(11) NOT NULL,
  `tipe` varchar(45) NOT NULL,
  `mahasiswa_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_keuangan_mahasiswa_mahasiswas1_idx` (`mahasiswa_id`),
  CONSTRAINT `fk_keuangan_mahasiswa_mahasiswas1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayarans`
--

LOCK TABLES `pembayarans` WRITE;
/*!40000 ALTER TABLE `pembayarans` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayarans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presensi_ujians`
--

DROP TABLE IF EXISTS `presensi_ujians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presensi_ujians` (
  `mahasiswa_id` int(10) unsigned NOT NULL,
  `ujian_id` int(11) NOT NULL,
  PRIMARY KEY (`mahasiswa_id`,`ujian_id`),
  KEY `fk_mahasiswas_has_ujians_ujians1_idx` (`ujian_id`),
  KEY `fk_mahasiswas_has_ujians_mahasiswas1_idx` (`mahasiswa_id`),
  CONSTRAINT `fk_mahasiswas_has_ujians_mahasiswas1` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mahasiswas_has_ujians_ujians1` FOREIGN KEY (`ujian_id`) REFERENCES `ujians` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presensi_ujians`
--

LOCK TABLES `presensi_ujians` WRITE;
/*!40000 ALTER TABLE `presensi_ujians` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensi_ujians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruangans`
--

DROP TABLE IF EXISTS `ruangans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruangans` (
  `id` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruangans`
--

LOCK TABLES `ruangans` WRITE;
/*!40000 ALTER TABLE `ruangans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ruangans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester_mk_kp`
--

DROP TABLE IF EXISTS `semester_mk_kp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester_mk_kp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruangan_id` int(11) NOT NULL,
  `slot_waktu_id` int(11) NOT NULL,
  `dosen_id` int(10) unsigned NOT NULL,
  `semester_id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  `kelas_paralel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_semesters_has_mata_kuliahs_has_kelas_paralels_ruangans1_idx` (`ruangan_id`),
  KEY `fk_semesters_has_mata_kuliahs_has_kelas_paralels_slot_waktu_idx` (`slot_waktu_id`),
  KEY `fk_semesters_has_mata_kuliahs_has_kelas_paralels_dosens1_idx` (`dosen_id`),
  KEY `fk_semester_mk_kp_semesters_has_mata_kuliahs1_idx` (`semester_id`,`mata_kuliah_id`),
  KEY `fk_semester_mk_kp_kelas_paralels1_idx` (`kelas_paralel_id`),
  CONSTRAINT `fk_semester_mk_kp_kelas_paralels1` FOREIGN KEY (`kelas_paralel_id`) REFERENCES `kelas_paralels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semester_mk_kp_semesters_has_mata_kuliahs1` FOREIGN KEY (`semester_id`, `mata_kuliah_id`) REFERENCES `semesters_has_mata_kuliahs` (`semester_id`, `mata_kuliah_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semesters_has_mata_kuliahs_has_kelas_paralels_dosens1` FOREIGN KEY (`dosen_id`) REFERENCES `dosens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semesters_has_mata_kuliahs_has_kelas_paralels_ruangans1` FOREIGN KEY (`ruangan_id`) REFERENCES `ruangans` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semesters_has_mata_kuliahs_has_kelas_paralels_slot_waktus1` FOREIGN KEY (`slot_waktu_id`) REFERENCES `slot_waktus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester_mk_kp`
--

LOCK TABLES `semester_mk_kp` WRITE;
/*!40000 ALTER TABLE `semester_mk_kp` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester_mk_kp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters` (
  `id` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL,
  `tahun` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters_has_mata_kuliahs`
--

DROP TABLE IF EXISTS `semesters_has_mata_kuliahs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters_has_mata_kuliahs` (
  `semester_id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  `pjmk_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`semester_id`,`mata_kuliah_id`),
  KEY `fk_semesters_has_mata_kuliahs_mata_kuliahs1_idx` (`mata_kuliah_id`),
  KEY `fk_semesters_has_mata_kuliahs_semesters1_idx` (`semester_id`),
  KEY `fk_semesters_has_mata_kuliahs_dosens1_idx` (`pjmk_id`),
  CONSTRAINT `fk_semesters_has_mata_kuliahs_dosens1` FOREIGN KEY (`pjmk_id`) REFERENCES `dosens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semesters_has_mata_kuliahs_mata_kuliahs1` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliahs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_semesters_has_mata_kuliahs_semesters1` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters_has_mata_kuliahs`
--

LOCK TABLES `semesters_has_mata_kuliahs` WRITE;
/*!40000 ALTER TABLE `semesters_has_mata_kuliahs` DISABLE KEYS */;
/*!40000 ALTER TABLE `semesters_has_mata_kuliahs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slot_waktus`
--

DROP TABLE IF EXISTS `slot_waktus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slot_waktus` (
  `id` int(11) NOT NULL,
  `slot_waktu` varchar(45) NOT NULL,
  `status` enum('kuliah','ujian') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slot_waktus`
--

LOCK TABLES `slot_waktus` WRITE;
/*!40000 ALTER TABLE `slot_waktus` DISABLE KEYS */;
/*!40000 ALTER TABLE `slot_waktus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ujians`
--

DROP TABLE IF EXISTS `ujians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ujians` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `semester_id` int(11) NOT NULL,
  `mata_kuliah_id` int(11) NOT NULL,
  `slot_waktu_id` int(11) NOT NULL,
  `dosen_pengawas1_id` int(10) unsigned NOT NULL,
  `dosen_pengawas2_id` int(10) unsigned NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ujians_semesters_has_mata_kuliahs1_idx` (`semester_id`,`mata_kuliah_id`),
  KEY `fk_ujians_slot_waktus1_idx` (`slot_waktu_id`),
  KEY `fk_ujians_dosens1_idx` (`dosen_pengawas1_id`),
  KEY `fk_ujians_dosens2_idx` (`dosen_pengawas2_id`),
  CONSTRAINT `fk_ujians_dosens1` FOREIGN KEY (`dosen_pengawas1_id`) REFERENCES `dosens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ujians_dosens2` FOREIGN KEY (`dosen_pengawas2_id`) REFERENCES `dosens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ujians_semesters_has_mata_kuliahs1` FOREIGN KEY (`semester_id`, `mata_kuliah_id`) REFERENCES `semesters_has_mata_kuliahs` (`semester_id`, `mata_kuliah_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ujians_slot_waktus1` FOREIGN KEY (`slot_waktu_id`) REFERENCES `slot_waktus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ujians`
--

LOCK TABLES `ujians` WRITE;
/*!40000 ALTER TABLE `ujians` DISABLE KEYS */;
/*!40000 ALTER TABLE `ujians` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-13 11:09:24
