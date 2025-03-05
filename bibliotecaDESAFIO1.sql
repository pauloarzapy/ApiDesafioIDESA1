CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authors_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` (`id`, `name`, `birthdate`, `nationality`, `created_at`, `updated_at`) VALUES (1,'Libero cupiditate sunt voluptatem non.','1988-11-02','Modi doloribus id ut.','2025-03-04 16:15:44','2025-03-04 16:15:44'),(2,'Et sed nemo eaque quis.','2008-02-08','Ut et ipsum alias est officiis.','2025-03-04 16:15:44','2025-03-04 16:15:44'),(3,'Iste sed nihil autem illo illo provident impedit.','1982-07-02','Mollitia explicabo consequatur dignissimos qui perferendis repellat eos.','2025-03-04 16:15:44','2025-03-04 16:15:44'),(4,'Cumque atque est ut quia quos quidem optio et.','1985-01-21','Voluptates illum sed enim eveniet voluptas ea.','2025-03-04 16:15:44','2025-03-04 16:15:44'),(5,'Ipsa odio delectus in eius.','1972-08-30','Vitae vitae aut perspiciatis sint voluptatibus id quidem vitae.','2025-03-04 16:15:44','2025-03-04 16:15:44'),(6,'Nam beatae assumenda sed cum architecto distinctio.','1979-04-26','Hic ea a labore assumenda rerum consequatur voluptas eius.','2025-03-04 16:15:44','2025-03-04 16:15:44'),(7,'Dolorum et saepe facilis.','1993-03-22','Maiores atque alias accusantium in dolor sint.','2025-03-04 16:15:44','2025-03-04 16:15:44'),(8,'Rerum neque ipsum occaecati asperiores.','1994-04-25','Sint eligendi ab quaerat ea ad voluptate.','2025-03-04 16:15:44','2025-03-04 16:15:44'),(9,'Error animi consequatur hic numquam voluptatem nihil.','2011-08-16','Quia eos vitae accusamus dignissimos qui.','2025-03-04 16:15:44','2025-03-04 16:15:44'),(10,'Numquam officia fugit qui qui.','2001-07-28','Enim est consequatur dolorem consequuntur rem hic.','2025-03-04 16:15:44','2025-03-04 16:15:44');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `published_date` date NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_isbn_unique` (`isbn`),
  KEY `books_author_id_index` (`author_id`),
  CONSTRAINT `books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `title`, `isbn`, `published_date`, `author_id`, `created_at`, `updated_at`) VALUES (1,'Sapiente nisi sit minus eligendi repellat aliquid ad.','Rem fugit aut ut corporis odio esse.','1994-03-02',1,'2025-03-04 16:15:44','2025-03-04 16:15:44'),(2,'Atque rem a atque.','Sint et non eum qui omnis sequi.','2018-08-04',2,'2025-03-04 16:15:44','2025-03-04 16:15:44'),(3,'Est distinctio vero eos laboriosam.','Consectetur quas autem est minus et.','2003-10-19',3,'2025-03-04 16:15:44','2025-03-04 16:15:44'),(4,'Assumenda aspernatur doloremque sit odio at animi voluptatem.','Aperiam omnis aliquid ut aut.','1991-03-13',4,'2025-03-04 16:15:44','2025-03-04 16:15:44'),(5,'Veniam omnis laudantium et inventore fugit nam.','Accusantium doloribus earum suscipit enim maiores.','2000-05-29',5,'2025-03-04 16:15:44','2025-03-04 16:15:44'),(6,'Eum ipsum vel aut et.','Asperiores perspiciatis porro vitae sit illo aspernatur.','1993-09-27',6,'2025-03-04 16:15:44','2025-03-04 16:15:44'),(7,'Accusamus non fuga sit saepe voluptatem.','Optio saepe cupiditate ea est ad sed expedita.','2018-04-26',7,'2025-03-04 16:15:44','2025-03-04 16:15:44'),(8,'Debitis omnis officiis temporibus quam est non.','Provident ipsam neque voluptatem minima.','1989-08-30',8,'2025-03-04 16:15:44','2025-03-04 16:15:44'),(9,'Accusantium dolor aut eum deserunt qui dolores.','Quos qui eius illo at consequuntur.','2022-12-12',9,'2025-03-04 16:15:44','2025-03-04 16:15:44'),(10,'Consequatur architecto quibusdam accusamus explicabo molestiae.','Explicabo quia non aut deleniti aspernatur.','1980-10-14',10,'2025-03-04 16:15:44','2025-03-04 16:15:44');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_03_03_213738_create_authors_table',2),(6,'2025_03_03_220022_create_authors_table',3),(7,'2025_03_04_052816_create_personal_access_tokens_table',4),(8,'2025_03_04_120728_create_authors_table',5),(9,'2025_03_04_131456_create_authors_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES (1,'App\\Models\\User',1,'NuevoToken','ce4648f8df6a43350d66a9f966c24dedf9fd9bbf0ae0bbb737cb76a4cbb52a27','[\"*\"]',NULL,NULL,'2025-03-04 12:20:12','2025-03-04 12:20:12'),(2,'App\\Models\\User',1,'NuevoToken','0b618c6e6258b80abb8373b1397c521db28f8a79b3aa7577af04ddd7bf5c4366','[\"*\"]',NULL,NULL,'2025-03-04 12:20:36','2025-03-04 12:20:36'),(3,'App\\Models\\User',1,'NuevoToken','f2e2e7e478f5ad2e0894e6e673f2f79020ac4bdfbd0c9eb04b791abe95a8aa58','[\"*\"]',NULL,NULL,'2025-03-04 12:20:49','2025-03-04 12:20:49'),(4,'App\\Models\\User',1,'NuevoToken','23a0a45035d7d5da450cedcb3cded15fad369bc478dc4d3e5aa203184b1be454','[\"*\"]','2025-03-04 18:22:57',NULL,'2025-03-04 12:53:43','2025-03-04 18:22:57'),(5,'App\\Models\\User',1,'NuevoToken','860e04e3da38725b53fa4f32e40e7926c0118c5f48776c13b7db498696e6ad65','[\"*\"]','2025-03-05 06:34:58',NULL,'2025-03-04 15:15:56','2025-03-05 06:34:58'),(6,'App\\Models\\User',1,'NuevoToken','f4df22591af9ed000508efb42afc28fea7dd48d8736336ead8ca1a3865a39647','[\"*\"]',NULL,NULL,'2025-03-04 17:30:07','2025-03-04 17:30:07'),(7,'App\\Models\\User',1,'NuevoToken','111f3175c120dea7cd730354c0e26bdf72f3a85bf58ea43af21e0dd7a23c2892','[\"*\"]',NULL,NULL,'2025-03-04 17:31:12','2025-03-04 17:31:12'),(8,'App\\Models\\User',1,'NuevoToken','b977e126fdef79899b6fa5f6af2782eb9a6a440435a6d4465e3048fd9f67bef5','[\"*\"]',NULL,NULL,'2025-03-04 17:39:16','2025-03-04 17:39:16'),(9,'App\\Models\\User',1,'NuevoToken','906150668d0de7a680c1ee082f075d1015a7821223b0e7a9aadeb878fd50a5bd','[\"*\"]',NULL,NULL,'2025-03-04 17:39:58','2025-03-04 17:39:58'),(10,'App\\Models\\User',1,'NuevoToken','dc45b7d1f728d734ed588430af03bd37993c7ed57b72240a86812f97d5d2066f','[\"*\"]',NULL,NULL,'2025-03-04 17:40:40','2025-03-04 17:40:40'),(11,'App\\Models\\User',1,'NuevoToken','8c707b354715962d2f70d2f2506c90b040f5a8b7f12f507c89aa4ddcf9116eff','[\"*\"]',NULL,NULL,'2025-03-04 17:42:08','2025-03-04 17:42:08'),(12,'App\\Models\\User',1,'NuevoToken','853e1edc8b5649f1bebbd29064f49d2713cde4eb7e46c5fd3316e68d0fa6ae8d','[\"*\"]',NULL,NULL,'2025-03-04 17:42:24','2025-03-04 17:42:24'),(13,'App\\Models\\User',1,'NuevoToken','26f6051ddc25c3d358217fe1cb06a4035ce0b93435afc6e6a50dac28215fd8ca','[\"*\"]',NULL,NULL,'2025-03-04 17:42:56','2025-03-04 17:42:56'),(14,'App\\Models\\User',1,'NuevoToken','5a57b807ca731fc20f3a0bd9284434b0f8cd7912af30600f4243abc0abefc682','[\"*\"]',NULL,NULL,'2025-03-04 17:45:48','2025-03-04 17:45:48'),(15,'App\\Models\\User',1,'NuevoToken','f74123b056baee948886201170c9eec68cb5053401b9010a561b94f5b527aa51','[\"*\"]',NULL,NULL,'2025-03-04 18:10:11','2025-03-04 18:10:11'),(16,'App\\Models\\User',1,'NuevoToken','7ea23446fb2742fad52460903ec41d0fd24007dfbd8d5c43b8bc7e18b976a045','[\"*\"]',NULL,NULL,'2025-03-04 19:33:12','2025-03-04 19:33:12'),(17,'App\\Models\\User',1,'NuevoToken','ff8e483fd5cc2401c298faab5290849c2c1e0bdff0c459e0a1c3ffd6e2e080a2','[\"*\"]',NULL,NULL,'2025-03-05 01:29:10','2025-03-05 01:29:10'),(18,'App\\Models\\User',1,'NuevoToken','2f873768db16249d5e66e4bf95d817f7fc149e7bffb54c4574a1159669343229','[\"*\"]',NULL,NULL,'2025-03-05 01:29:59','2025-03-05 01:29:59'),(19,'App\\Models\\User',1,'NuevoToken','4864e6123c594000123a8306d1a36d9896c9f245ec0a1574e3e76559b9c8cb0c','[\"*\"]',NULL,NULL,'2025-03-05 01:30:47','2025-03-05 01:30:47'),(20,'App\\Models\\User',1,'NuevoToken','5f73fed7253e52c6cb07f5201d569eb97e9dc30cb53aafd78966238ad65c5633','[\"*\"]',NULL,NULL,'2025-03-05 01:31:22','2025-03-05 01:31:22'),(21,'App\\Models\\User',1,'NuevoToken','3901cc89b3bec4aa4d2a7c0e77f65dd6bf70c27c36efccf96cc11311b3d4cd27','[\"*\"]',NULL,NULL,'2025-03-05 01:31:55','2025-03-05 01:31:55'),(22,'App\\Models\\User',1,'NuevoToken','82a6a84baf0e77d8bbcc4642b7efa927d3fa6c5635a665f08ebe12f42956d716','[\"*\"]',NULL,NULL,'2025-03-05 01:32:32','2025-03-05 01:32:32'),(23,'App\\Models\\User',1,'NuevoToken','602601ea45fc59577319293734f92b30b3a7500b10e105c0b32f4cb00c6dd60d','[\"*\"]',NULL,NULL,'2025-03-05 02:06:33','2025-03-05 02:06:33'),(24,'App\\Models\\User',1,'NuevoToken','da98d8d2b21418ae0c8b494bc603c3511d844689bc157085f87679397a1864bb','[\"*\"]',NULL,NULL,'2025-03-05 02:07:33','2025-03-05 02:07:33'),(25,'App\\Models\\User',1,'NuevoToken','b892cacba2aa20a509a00d9d74f17aeb3f688013a1c15222a793e71984ac2196','[\"*\"]',NULL,NULL,'2025-03-05 02:08:12','2025-03-05 02:08:12'),(26,'App\\Models\\User',1,'NuevoToken','81fab1fab209fcb9ba4f7210b3cd564c195dc3b0b445660048901c73d7128cb5','[\"*\"]',NULL,NULL,'2025-03-05 02:08:53','2025-03-05 02:08:53'),(27,'App\\Models\\User',1,'NuevoToken','0837e15918b3668f0382711286e9575aac93c3f55da184962362be75a14cfd99','[\"*\"]',NULL,NULL,'2025-03-05 02:09:38','2025-03-05 02:09:38'),(28,'App\\Models\\User',1,'NuevoToken','10b183d1d6ec6c0efc1bdd51bea22f54b985faf238ecc32619c7af632abe1a99','[\"*\"]',NULL,NULL,'2025-03-05 02:11:06','2025-03-05 02:11:06'),(29,'App\\Models\\User',1,'NuevoToken','c437927d8a6722b05eb4bb4fa8c333c9cffa4c4ee7a5be47acf14e0478bc42f7','[\"*\"]',NULL,NULL,'2025-03-05 02:12:00','2025-03-05 02:12:00'),(30,'App\\Models\\User',1,'NuevoToken','d9ec224938f54c13c7c51dc9bfdb914335c03091bb5389ab8f05c7609668b67f','[\"*\"]',NULL,NULL,'2025-03-05 02:13:05','2025-03-05 02:13:05'),(31,'App\\Models\\User',1,'NuevoToken','f49a44f80246c6fc380d1c3bec50e0232dc687e4f2aa27f6aecbdcb83fb7f709','[\"*\"]',NULL,NULL,'2025-03-05 02:34:34','2025-03-05 02:34:34'),(32,'App\\Models\\User',1,'NuevoToken','4b66c41970be560c9abf96ce665bc2b4f825293a5e0d2e155e73f8d4d45c9816','[\"*\"]',NULL,NULL,'2025-03-05 03:02:50','2025-03-05 03:02:50'),(33,'App\\Models\\User',1,'NuevoToken','b480faffcbdf360e45a8baec40adcc41b6a85963701130192ed4773aec66dfc7','[\"*\"]',NULL,NULL,'2025-03-05 03:04:00','2025-03-05 03:04:00'),(34,'App\\Models\\User',1,'NuevoToken','f22fef6cbfd25823337f0cfbf2139838484e5ad4028a186718da2ac9c94421d6','[\"*\"]',NULL,NULL,'2025-03-05 03:07:23','2025-03-05 03:07:23'),(35,'App\\Models\\User',1,'NuevoToken','c1bb30619a61f19ecdb5daf649761a1bd06df0d04efbb0bb616dc09b1d7b226a','[\"*\"]',NULL,NULL,'2025-03-05 03:08:46','2025-03-05 03:08:46'),(36,'App\\Models\\User',1,'NuevoToken','64eda5384028f8bc168f90ab2e825335424df4e428160f80ede921297924e7f3','[\"*\"]',NULL,NULL,'2025-03-05 03:09:36','2025-03-05 03:09:36'),(37,'App\\Models\\User',1,'NuevoToken','3fc3f1e933e696d49afb3c60dc1607ef229334c2ff093dcffc8a9fe2cbd32418','[\"*\"]',NULL,NULL,'2025-03-05 03:10:20','2025-03-05 03:10:20'),(38,'App\\Models\\User',1,'NuevoToken','a772268b8b63b8c3e796130db1efe1ac7f350cae0ca9bd640a659a8c748c9d90','[\"*\"]',NULL,NULL,'2025-03-05 03:10:45','2025-03-05 03:10:45'),(39,'App\\Models\\User',1,'NuevoToken','66e76fb49dc1ba53ef164262cc5d72c49a6e7d9de4d230d6dc9a5408495c2f29','[\"*\"]',NULL,NULL,'2025-03-05 03:11:09','2025-03-05 03:11:09'),(40,'App\\Models\\User',1,'NuevoToken','9ae78903375ced3b8645231f3091a36debe11787a9d1508b694312c04264a256','[\"*\"]',NULL,NULL,'2025-03-05 03:12:42','2025-03-05 03:12:42'),(41,'App\\Models\\User',1,'NuevoToken','0316ac248e30c3e50345838e7d5c885f155fe5f241e9975613201b0da2506c9a','[\"*\"]',NULL,NULL,'2025-03-05 03:13:07','2025-03-05 03:13:07'),(42,'App\\Models\\User',1,'NuevoToken','5ea230881de30e205208221a33345a0bec9617b2c50ece41125e48bc0cd7e8bb','[\"*\"]',NULL,NULL,'2025-03-05 03:36:59','2025-03-05 03:36:59'),(43,'App\\Models\\User',1,'NuevoToken','68ccbba8b0fde1c47254a7ad4f85afd0697d883e8ef3b615e0d58179394a117c','[\"*\"]',NULL,NULL,'2025-03-05 03:42:07','2025-03-05 03:42:07'),(44,'App\\Models\\User',1,'NuevoToken','ef920cbfc86bdfa191f82fe0e2c98eea8e1e7195b2679932fa9a2502e744a317','[\"*\"]',NULL,NULL,'2025-03-05 03:42:41','2025-03-05 03:42:41'),(45,'App\\Models\\User',1,'NuevoToken','829a0682468e117a9369bbb88c57f9dea87f8e07ce2047ca6707cc57377f5064','[\"*\"]',NULL,NULL,'2025-03-05 03:43:53','2025-03-05 03:43:53'),(46,'App\\Models\\User',1,'NuevoToken','c171580655a24e9891eed7a361c7f05bdfe2f0e2b03aad0202a3be3c9049778e','[\"*\"]',NULL,NULL,'2025-03-05 03:48:54','2025-03-05 03:48:54'),(47,'App\\Models\\User',1,'NuevoToken','fcf0e36776b5992d753972cd462a26e65e2b21f5b5d6d48aaa09e797a5a7189b','[\"*\"]',NULL,NULL,'2025-03-05 03:56:54','2025-03-05 03:56:54'),(48,'App\\Models\\User',1,'NuevoToken','3facbb97455490adebcb26915e2ec7a1c78f2cac65c1108a85eca4681e1d8977','[\"*\"]',NULL,NULL,'2025-03-05 03:58:55','2025-03-05 03:58:55'),(49,'App\\Models\\User',1,'NuevoToken','58f7c837316c57b442a28a05d0775ce48ea8edcd6b450c6af0915cfe3d70d2bc','[\"*\"]',NULL,NULL,'2025-03-05 04:19:11','2025-03-05 04:19:11'),(50,'App\\Models\\User',1,'NuevoToken','a8f2b808d2c91bd51f7b713812ec5c95755d346bf544001ffedf69efbd874e5f','[\"*\"]',NULL,NULL,'2025-03-05 05:25:18','2025-03-05 05:25:18');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('FUubOs6Tg9jFWRs1GaUKZkNYfVlAchTZd7XDCe3o',NULL,'127.0.0.1','PostmanRuntime/7.43.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoieEJXWlFEWWJKRHdoTUZhUEduSk5FeU9hSXJ1UjBmNWJFd1hGa2RNUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741044696),('shs0i6IROwSLZ2NshTgowDixIVOjfT73z2nSpds4',NULL,'127.0.0.1','PostmanRuntime/7.43.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHNKeWNpaVJsamJFckJrMlhXZE50VWM2cmtDNHF4UUU3SUZ5SWZNdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741071478);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES (1,'Andrea Amarilla','andrea@desafiox.com',NULL,'$2y$12$DMSxOraCeOCWQ999pNlpPupGrmomFfOYzTh6koedCAlifYQLQoMKa',NULL,'2025-03-04 12:18:39','2025-03-04 12:18:39'),(2,'Pedro Perez','predroi@unemail.com',NULL,'$2y$04$aJJ.ZAgWEVPUwfS4LDm.VOgyXKddA13ZI0wt15J6PgZziJpwU95fG',NULL,'2025-03-05 04:49:04','2025-03-05 04:49:04'),(3,'Carlos Cardozo','carlos@desafiox.com',NULL,'$2y$12$DUaOWcwCRD.4EwFlJnCy7.BVSXJP8ot6V9nQy7q4v.U5k2HHUmHvW',NULL,'2025-03-05 05:29:02','2025-03-05 05:29:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'biblioteca'
--

--
-- Dumping routines for database 'biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-05  0:55:25
