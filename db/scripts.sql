--
-- Current Database: `medication_app`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `medication_app` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `medication_app`;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `id` varchar(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medication`
--
DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication` (
  `id` varchar(36) NOT NULL,
  `patient_id` varchar(36) NOT NULL,
  `medicine_name` varchar(150) DEFAULT NULL,
  `medicine_quantity` varchar(255) DEFAULT NULL,
  `medicine_manufacturer` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Insert data for patients table
--
INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc581", "Patient A", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");

INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc582", "Patient B", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");

INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc583", "Patient C", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");

INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc584", "Patient D", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");


INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc585", "Patient E", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");

INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc586", "Patient F", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");


INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc587", "Patient G", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");

INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc588", "Patient H", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");


INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc589", "Patient I", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");

INSERT INTO `patients` (id, name, age, gender, date_created, date_modified) VALUES("c9bcebf8-b671-11e8-8c74-00155ddcc590", "Patient J", 45, "male", "2019-08-31 08:46:27", "2019-08-31 08:46:27");

--
-- Insert data for medication table
--
INSERT INTO `medication` (id, patient_id, medicine_name, medicine_quantity, medicine_manufacturer, date_created, date_modified) VALUES ("10d0384c-c156-3659-ff6a-55e6ed9a2578", "c9bcebf8-b671-11e8-8c74-00155ddcc581", "Medicine A", "1.5 mg", "Maunufacturer A", "2019-08-31 08:46:27", "2019-08-31 08:46:27");

INSERT INTO `medication` (id, patient_id, medicine_name, medicine_quantity, medicine_manufacturer, date_created, date_modified) VALUES ("10d0384c-c156-3659-ff6a-55e6ed9a2579", "c9bcebf8-b671-11e8-8c74-00155ddcc581", "Medicine B", "1.5 mg", "Maunufacturer B", "2019-08-31 08:46:27", "2019-08-31 08:46:27")
;
INSERT INTO `medication` (id, patient_id, medicine_name, medicine_quantity, medicine_manufacturer, date_created, date_modified) VALUES ("10d0384c-c156-3659-ff6a-55e6ed9a2580", "c9bcebf8-b671-11e8-8c74-00155ddcc582", "Medicine C", "1.5 mg", "Maunufacturer C", "2019-08-31 08:46:27", "2019-08-31 08:46:27")
;
INSERT INTO `medication` (id, patient_id, medicine_name, medicine_quantity, medicine_manufacturer, date_created, date_modified) VALUES ("10d0384c-c156-3659-ff6a-55e6ed9a2581", "c9bcebf8-b671-11e8-8c74-00155ddcc582", "Medicine D", "1.5 mg", "Maunufacturer D", "2019-08-31 08:46:27", "2019-08-31 08:46:27")
;
INSERT INTO `medication` (id, patient_id, medicine_name, medicine_quantity, medicine_manufacturer, date_created, date_modified) VALUES ("10d0384c-c156-3659-ff6a-55e6ed9a2582", "c9bcebf8-b671-11e8-8c74-00155ddcc583", "Medicine E", "1.5 mg", "Maunufacturer E", "2019-08-31 08:46:27", "2019-08-31 08:46:27");