-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=`NO_AUTO_VALUE_ON_ZERO` */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for easymovedb
CREATE DATABASE IF NOT EXISTS `easymovedb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `easymovedb`;

-- Dumping structure for table easymovedb.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` varchar(50) NOT NULL,
  `admin_password` varchar(200) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymovedb.admin: ~1 rows (approximately)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO admin (ADMIN_ID, ADMIN_PASSWORD) 
	VALUES ('admin123', 'admin123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- Dumping structure for table easymovedb.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` varchar(50) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `customer_icno` varchar(50) DEFAULT NULL,
  `customer_address` varchar(200) DEFAULT NULL,
  `customer_phone` varchar(50) DEFAULT NULL,
  `customer_password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymovedb.customer: ~5 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO customer (CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ICNO, CUSTOMER_ADDRESS, CUSTOMER_PHONE, CUSTOMER_PASSWORD) 
	VALUES ('ahmadhensem', 'Ahmad bin Abu', '000210102213', 'No. 3, Jalan Purnama, Klang', '0135592221', '12345');
INSERT INTO customer (CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ICNO, CUSTOMER_ADDRESS, CUSTOMER_PHONE, CUSTOMER_PASSWORD) 
	VALUES ('aimantakkesah', 'Aiman Bin Ramli', '00102111191', 'No. 92, Jalan Cakera, Rantau Panjang', '0182293194', '12345');
INSERT INTO customer (CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ICNO, CUSTOMER_ADDRESS, CUSTOMER_PHONE, CUSTOMER_PASSWORD) 
	VALUES ('amirulhebat', 'Amirul Bin Hakim', '020125042287', 'Lot 344, Jalan Bahagia, Ampang', '0138829102', '12345');
INSERT INTO customer (CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ICNO, CUSTOMER_ADDRESS, CUSTOMER_PHONE, CUSTOMER_PASSWORD) 
	VALUES ('amirbaik', 'Muhammad Amir Bin Rahmad', '990130021843', 'No. 38, Jalan Cempaka, Bukit Tinggi', '0179928113', '12345');
INSERT INTO customer (CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ICNO, CUSTOMER_ADDRESS, CUSTOMER_PHONE, CUSTOMER_PASSWORD) 
	VALUES ('jamalkuat', 'Jamaludin Bin Bakar', '011212110121', 'Lot 102, Jalan Tinggi, Bukit Raja', '01144920211', '12345');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table easymovedb.reservation
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` varchar(50) NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `dropoff_date` date DEFAULT NULL,
  `rent_days_period` int(11) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) NOT NULL,
  `transport_id` varchar(50) NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `FK_reservation_customer` (`customer_id`),
  KEY `FK_reservation_transport` (`transport_id`),
  CONSTRAINT `FK_reservation_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FK_reservation_transport` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymovedb.reservation: ~5 rows (approximately)
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO reservation (RESERVATION_ID, PICKUP_DATE, DROPOFF_DATE, RENT_DAYS_PERIOD, PAYMENT_METHOD, CUSTOMER_ID, TRANSPORT_ID) 
	VALUES ('BHE1831_41702202', '2022-07-14', '2022-07-19', 5, 'Cash', 'ahmadhensem', '1381EHB');
INSERT INTO reservation (RESERVATION_ID, PICKUP_DATE, DROPOFF_DATE, RENT_DAYS_PERIOD, PAYMENT_METHOD, CUSTOMER_ID, TRANSPORT_ID) 
	VALUES ('BVB2001_60802202', '2022-08-06', '2022-08-09', 3, 'Cash', 'amirulhebat', '1002BVB');
INSERT INTO reservation (RESERVATION_ID, PICKUP_DATE, DROPOFF_DATE, RENT_DAYS_PERIOD, PAYMENT_METHOD, CUSTOMER_ID, TRANSPORT_ID) 
	VALUES ('VES1792_10702202', '2022-07-01', '2022-07-02', 1, 'Cash', 'aimantakkesah', '2971SEV');
INSERT INTO reservation (RESERVATION_ID, PICKUP_DATE, DROPOFF_DATE, RENT_DAYS_PERIOD, PAYMENT_METHOD, CUSTOMER_ID, TRANSPORT_ID) 
	VALUES ('VJK4013_42802202', '2022-08-24', '2022-08-27', 3, 'Cash', 'aimantakkesah', '3104KJV');
INSERT INTO reservation (RESERVATION_ID, PICKUP_DATE, DROPOFF_DATE, RENT_DAYS_PERIOD, PAYMENT_METHOD, CUSTOMER_ID, TRANSPORT_ID) 
	VALUES ('MKU1233_61702202', '2022-07-16', '2022-07-23', 7, 'Cash', 'jamalkuat', '3321UKM');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;

-- Dumping structure for table easymovedb.transport
CREATE TABLE IF NOT EXISTS `transport` (
  `transport_id` varchar(50) NOT NULL,
  `transport_brand` varchar(50) DEFAULT NULL,
  `transport_type` varchar(50) DEFAULT NULL,
  `transport_plateno` varchar(50) DEFAULT NULL,
  `transport_transmission` varchar(50) DEFAULT NULL,
  `transport_dayrate` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table easymovedb.transport: ~11 rows (approximately)
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('1381EHB', 'Proton Saga', 'Small', 'BHE1835', 'Auto', 105.0);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('9192UJW', 'Perodua Myvi', 'Small', 'WJU2910', 'Auto', 98.0);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('2005MNB', 'Perodua Myvi', 'Small', 'BNM5002', 'Manual', 95.5);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('2542AWW', 'Honda Civic', 'Medium', 'WWA2452', 'Auto', 126.0);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('2114NOB', 'Ford Ranger', 'SUV', 'BON4112', 'Auto', 203.0);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('2011ETB', 'Proton Persona', 'Medium', 'BTE1102', 'Auto', 131.0);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('3321UKM', 'Perodua Viva', 'Small', 'MKU1233', 'Auto', 98.0);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('2971SEV', 'Nissan Almera', 'Small', 'VES1792', 'Auto', 102.0);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('3201MMB', 'Honda Civic', 'Medium', 'BMM1023', 'Auto', 163.0);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('1002BVB', 'Honda Accord', 'Medium', 'BVB2001', 'Auto', 175.0);
INSERT INTO transport (TRANSPORT_ID, TRANSPORT_BRAND, TRANSPORT_TYPE, TRANSPORT_PLATENO, TRANSPORT_TRANSMISSION, TRANSPORT_DAYRATE) 
	VALUES ('3104KJV', 'Nissan X-Trail', 'SUV', 'VJK4013', 'Auto', 239.0);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
