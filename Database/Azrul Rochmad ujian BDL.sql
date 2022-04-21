/*
 Navicat Premium Data Transfer

 Source Server         : Db_Lanjut
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         :  ujian

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 21/04/2022 12:43:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for data_jenis_vcd
-- ----------------------------
DROP TABLE IF EXISTS `data_jenis_vcd`;
CREATE TABLE `data_jenis_vcd`  (
  `ID_Jenis` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Jenis` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tarif` int NOT NULL,
  PRIMARY KEY (`ID_Jenis`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_jenis_vcd
-- ----------------------------
INSERT INTO `data_jenis_vcd` VALUES ('NOR-DVD', 'DVD Copy', 7000);
INSERT INTO `data_jenis_vcd` VALUES ('NOR-VCD', 'VCD Copy', 5000);
INSERT INTO `data_jenis_vcd` VALUES ('OR-DVD', 'Original DVD', 10000);
INSERT INTO `data_jenis_vcd` VALUES ('OR-VCD', 'Original VCD', 8000);

-- ----------------------------
-- Table structure for data_kategori_vcd
-- ----------------------------
DROP TABLE IF EXISTS `data_kategori_vcd`;
CREATE TABLE `data_kategori_vcd`  (
  `id_kategori` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kategori` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_kategori`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_kategori_vcd
-- ----------------------------
INSERT INTO `data_kategori_vcd` VALUES ('K-01', 'Lagu Dewasa');
INSERT INTO `data_kategori_vcd` VALUES ('K-02', 'Lagu anak-anak');
INSERT INTO `data_kategori_vcd` VALUES ('K-03', 'Film');
INSERT INTO `data_kategori_vcd` VALUES ('K-04', 'Film Kartun');

-- ----------------------------
-- Table structure for data_sewa
-- ----------------------------
DROP TABLE IF EXISTS `data_sewa`;
CREATE TABLE `data_sewa`  (
  `No_tran` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tggl_tran` date NOT NULL,
  `No_identitas` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Nama_penyewa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_vcd` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `QTY` int NOT NULL,
  `tggl_kembali` date NOT NULL,
  PRIMARY KEY (`No_tran`) USING BTREE,
  INDEX `kode_vcd`(`kode_vcd`) USING BTREE,
  CONSTRAINT `kode_vcd` FOREIGN KEY (`kode_vcd`) REFERENCES `data_stok` (`kd_vcd`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_sewa
-- ----------------------------
INSERT INTO `data_sewa` VALUES ('001', '2012-06-11', '090800001', 'Intan', 'Vcd-003', 3, '2012-06-13');
INSERT INTO `data_sewa` VALUES ('002', '2012-06-11', '081020001', 'Andi M', 'Vcd-003', 2, '2012-06-13');
INSERT INTO `data_sewa` VALUES ('003', '2012-06-13', '090800001', 'Intan', 'Vcd-005', 1, '2012-06-16');
INSERT INTO `data_sewa` VALUES ('004', '2012-06-13', '090800002', 'Kanul Yulianti', 'Vcd-006', 4, '2012-06-16');
INSERT INTO `data_sewa` VALUES ('005', '2022-04-20', '090800003', 'Azrul', 'Vcd-002', 1, '2022-04-23');

-- ----------------------------
-- Table structure for data_stok
-- ----------------------------
DROP TABLE IF EXISTS `data_stok`;
CREATE TABLE `data_stok`  (
  `kd_vcd` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Id_kategori` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Judul` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Id_jenis` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`kd_vcd`) USING BTREE,
  INDEX `id_kategori`(`Id_kategori`) USING BTREE,
  INDEX `id_jenis`(`Id_jenis`) USING BTREE,
  CONSTRAINT `id_jenis` FOREIGN KEY (`Id_jenis`) REFERENCES `data_jenis_vcd` (`ID_Jenis`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `id_kategori` FOREIGN KEY (`Id_kategori`) REFERENCES `data_kategori_vcd` (`id_kategori`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_stok
-- ----------------------------
INSERT INTO `data_stok` VALUES ('Vcd-001', 'K-01', 'Album Kenangan', 'OR-VCD');
INSERT INTO `data_stok` VALUES ('Vcd-002', 'K-04', 'Tom & Jerry', 'NOR-VCD');
INSERT INTO `data_stok` VALUES ('Vcd-003', 'K-04', 'Upin & Ipin', 'NOR-VCD');
INSERT INTO `data_stok` VALUES ('Vcd-004', 'K-02', 'Kumpulan Lagu Anak Masa Kini', 'OR-DVD');
INSERT INTO `data_stok` VALUES ('Vcd-005', 'K-03', 'Hacker', 'NOR-DVD');
INSERT INTO `data_stok` VALUES ('Vcd-006', 'K-03', 'Deahard 4', 'NOR-VCD');

-- ----------------------------
-- View structure for penggabungan
-- ----------------------------
DROP VIEW IF EXISTS `penggabungan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `penggabungan` AS select `data_sewa`.`No_tran` AS `No_tran`,`data_sewa`.`tggl_tran` AS `tggl_tran`,`data_sewa`.`No_identitas` AS `No_identitas`,`data_sewa`.`Nama_penyewa` AS `Nama_penyewa`,`data_stok`.`Judul` AS `Judul`,`data_sewa`.`QTY` AS `QTY`,`data_jenis_vcd`.`tarif` AS `tarif`,count(`data_sewa`.`Nama_penyewa`) AS `penyewa`,`data_sewa`.`QTY` * `data_jenis_vcd`.`tarif` AS `Bayar` from ((`data_sewa` join `data_stok` on(`data_sewa`.`kode_vcd` = `data_stok`.`kd_vcd`)) join `data_jenis_vcd` on(`data_stok`.`Id_jenis` = `data_jenis_vcd`.`ID_Jenis`)) group by `data_sewa`.`Nama_penyewa`;

-- ----------------------------
-- View structure for rekapstok
-- ----------------------------
DROP VIEW IF EXISTS `rekapstok`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `rekapstok` AS select `data_stok`.`Judul` AS `Judul`,`data_kategori_vcd`.`kategori` AS `kategori`,`data_jenis_vcd`.`Jenis` AS `Jenis`,`data_jenis_vcd`.`tarif` AS `tarif` from ((`data_stok` join `data_kategori_vcd` on(`data_stok`.`Id_kategori` = `data_kategori_vcd`.`id_kategori`)) join `data_jenis_vcd` on(`data_stok`.`Id_jenis` = `data_jenis_vcd`.`ID_Jenis`));

-- ----------------------------
-- Triggers structure for table data_sewa
-- ----------------------------
DROP TRIGGER IF EXISTS `stok`;
delimiter ;;
CREATE TRIGGER `stok` BEFORE INSERT ON `data_sewa` FOR EACH ROW BEGIN
UPDATE data_stok
SET stok=stok+new.QTY
WHERE kd_vcd=new.kode_vcd;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table data_stok
-- ----------------------------
DROP TRIGGER IF EXISTS `cocokin_data`;
delimiter ;;
CREATE TRIGGER `cocokin_data` AFTER DELETE ON `data_stok` FOR EACH ROW BEGIN INSERT INTO data_sewa SET data_stok.kd_vcd=data_sewa.kode_vcd; END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
