-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: v8bet_api_dev
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.23.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` binary(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hash_password` varchar(255) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bet_statuses`
--

DROP TABLE IF EXISTS `bet_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bet_statuses` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bets`
--

DROP TABLE IF EXISTS `bets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bets` (
  `id` binary(16) NOT NULL,
  `user_id` binary(16) DEFAULT NULL,
  `match_id` binary(16) DEFAULT NULL,
  `odd_id` binary(16) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `est_expires_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `bet_status_id` binary(16) DEFAULT NULL,
  `added_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bets_user_id_index` (`user_id`),
  KEY `bets_match_id_index` (`match_id`),
  KEY `bets_odd_id_index` (`odd_id`),
  KEY `bets_bet_status_id_index` (`bet_status_id`),
  KEY `bets_added_by_index` (`added_by`),
  KEY `bets_updated_by_index` (`updated_by`),
  CONSTRAINT `bets_added_by_fkey` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`),
  CONSTRAINT `bets_bet_status_id_fkey` FOREIGN KEY (`bet_status_id`) REFERENCES `bet_statuses` (`id`),
  CONSTRAINT `bets_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `bets_odd_id_fkey` FOREIGN KEY (`odd_id`) REFERENCES `odds` (`id`),
  CONSTRAINT `bets_updated_by_fkey` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `bets_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `id` binary(16) NOT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `game_id` binary(16) DEFAULT NULL,
  `home_team_id` binary(16) DEFAULT NULL,
  `away_team_id` binary(16) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matches_game_id_index` (`game_id`),
  KEY `matches_home_team_id_index` (`home_team_id`),
  KEY `matches_away_team_id_index` (`away_team_id`),
  CONSTRAINT `matches_away_team_id_fkey` FOREIGN KEY (`away_team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matches_game_id_fkey` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matches_home_team_id_fkey` FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `odd_types`
--

DROP TABLE IF EXISTS `odd_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odd_types` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `odds`
--

DROP TABLE IF EXISTS `odds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odds` (
  `id` binary(16) NOT NULL,
  `value` double DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `match_id` binary(16) DEFAULT NULL,
  `odd_type_id` binary(16) DEFAULT NULL,
  `added_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `odds_match_id_index` (`match_id`),
  KEY `odds_odd_type_id_index` (`odd_type_id`),
  KEY `odds_added_by_index` (`added_by`),
  KEY `odds_updated_by_index` (`updated_by`),
  CONSTRAINT `odds_added_by_fkey` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`),
  CONSTRAINT `odds_match_id_fkey` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`),
  CONSTRAINT `odds_odd_type_id_fkey` FOREIGN KEY (`odd_type_id`) REFERENCES `odd_types` (`id`),
  CONSTRAINT `odds_updated_by_fkey` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` bigint NOT NULL,
  `inserted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `biography` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `game_id` binary(16) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_game_id_index` (`game_id`),
  CONSTRAINT `teams_game_id_fkey` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_types`
--

DROP TABLE IF EXISTS `transaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_types` (
  `id` binary(16) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` binary(16) NOT NULL,
  `amount` double DEFAULT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` binary(16) DEFAULT NULL,
  `transaction_type_id` binary(16) DEFAULT NULL,
  `added_by` binary(16) DEFAULT NULL,
  `updated_by` binary(16) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_index` (`user_id`),
  KEY `transactions_transaction_type_id_index` (`transaction_type_id`),
  KEY `transactions_added_by_index` (`added_by`),
  KEY `transactions_updated_by_index` (`updated_by`),
  CONSTRAINT `transactions_added_by_fkey` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`),
  CONSTRAINT `transactions_transaction_type_id_fkey` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_types` (`id`),
  CONSTRAINT `transactions_updated_by_fkey` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `transactions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` binary(16) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `msisdn` int DEFAULT NULL,
  `account_id` binary(16) DEFAULT NULL,
  `inserted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_account_id_index` (`account_id`),
  CONSTRAINT `users_account_id_fkey` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'v8bet_api_dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-19  6:25:54
INSERT INTO `schema_migrations` (version) VALUES (20240416080605);
INSERT INTO `schema_migrations` (version) VALUES (20240416083500);
INSERT INTO `schema_migrations` (version) VALUES (20240417111354);
INSERT INTO `schema_migrations` (version) VALUES (20240418110650);
INSERT INTO `schema_migrations` (version) VALUES (20240418112226);
INSERT INTO `schema_migrations` (version) VALUES (20240418234130);
INSERT INTO `schema_migrations` (version) VALUES (20240419002716);
INSERT INTO `schema_migrations` (version) VALUES (20240419003951);
INSERT INTO `schema_migrations` (version) VALUES (20240419012310);
INSERT INTO `schema_migrations` (version) VALUES (20240419014251);
INSERT INTO `schema_migrations` (version) VALUES (20240419023655);
INSERT INTO `schema_migrations` (version) VALUES (20240419024817);
