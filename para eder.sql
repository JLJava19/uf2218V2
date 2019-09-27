-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: v2019
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (2,'bromas'),(20,'Ingeniería'),(1,'musica'),(3,'sustos');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `likes` (
  `usuario_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuario_id`,`video_id`),
  KEY `fk_usuario_has_video_video1_idx` (`video_id`),
  KEY `fk_usuario_has_video_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_usuario_likes_video` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_video_likes_usuario` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (2,20,'2019-09-18 11:54:48'),(3,23,'2019-09-20 10:18:38'),(3,24,'2019-09-20 10:18:36'),(4,25,'2019-09-20 13:45:34'),(4,27,'2019-09-20 13:45:38'),(4,28,'2019-09-20 13:45:30'),(4,29,'2019-09-20 13:45:41'),(5,23,'2019-09-18 13:15:45');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `resumen_usuarios`
--

DROP TABLE IF EXISTS `resumen_usuarios`;
/*!50001 DROP VIEW IF EXISTS `resumen_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `resumen_usuarios` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `rol`,
 1 AS `fecha_creacion`,
 1 AS `fecha_eliminacion`,
 1 AS `videos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='1: Administrador	\n2: usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'administrador'),(6,'Eder'),(7,'lugkjhgfdsa'),(2,'usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `contrasenya` varchar(45) NOT NULL,
  `id_rol` int(11) NOT NULL DEFAULT '2' COMMENT 'por defecto es ''usuario'' y NO ''administrador''',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_eliminacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `FK_usuario_rol_idx` (`id_rol`),
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (2,'pepe','pepe',2,'2019-09-12 08:40:05',NULL),(3,'soso','',2,'2019-09-12 08:40:05',NULL),(4,'admin','admin',1,'2019-09-12 08:56:26',NULL),(5,'eliminado','123',2,'2019-09-11 08:56:53','2019-09-20 08:58:15'),(7,'jose','jose',2,'2019-09-19 11:59:34',NULL),(8,'aritz','lutxana1',2,'2019-09-23 12:08:48','2019-09-23 13:22:05'),(9,'eder','eder',2,'2019-09-23 13:07:58',NULL),(10,'ander','ander',2,'2019-09-27 09:12:40',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_categorias_likes`
--

DROP TABLE IF EXISTS `v_categorias_likes`;
/*!50001 DROP VIEW IF EXISTS `v_categorias_likes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_categorias_likes` AS SELECT 
 1 AS `codigo_video`,
 1 AS `nombre`,
 1 AS `total_videos`,
 1 AS `total_likes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_categorias_likes_jose`
--

DROP TABLE IF EXISTS `v_categorias_likes_jose`;
/*!50001 DROP VIEW IF EXISTS `v_categorias_likes_jose`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_categorias_likes_jose` AS SELECT 
 1 AS `id_de_categoria`,
 1 AS `nombre`,
 1 AS `videos_de_categoria`,
 1 AS `likes_de_categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_estadisticas`
--

DROP TABLE IF EXISTS `v_estadisticas`;
/*!50001 DROP VIEW IF EXISTS `v_estadisticas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_estadisticas` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_total_videos`
--

DROP TABLE IF EXISTS `v_total_videos`;
/*!50001 DROP VIEW IF EXISTS `v_total_videos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_total_videos` AS SELECT 
 1 AS `total_videos`,
 1 AS `visibles`,
 1 AS `ocultos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_totales_video`
--

DROP TABLE IF EXISTS `v_totales_video`;
/*!50001 DROP VIEW IF EXISTS `v_totales_video`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_totales_video` AS SELECT 
 1 AS `total_videos`,
 1 AS `total_visibles`,
 1 AS `total_invisibles`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ver_likes`
--

DROP TABLE IF EXISTS `ver_likes`;
/*!50001 DROP VIEW IF EXISTS `ver_likes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `ver_likes` AS SELECT 
 1 AS `video_id`,
 1 AS `video_nombre`,
 1 AS `codigo`,
 1 AS `usuario_id`,
 1 AS `usuario_nombre`,
 1 AS `categoria_id`,
 1 AS `categoria_nombre`,
 1 AS `likes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `codigo` varchar(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `fk_video_usuario_idx` (`usuario_id`),
  KEY `fk_video_categoria1_idx` (`categoria_id`),
  CONSTRAINT `fk_video_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_video_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (11,'Glaukoma \"kalima\" Gure Kaiola','Rq7QiETb37k',3,1),(20,'Marea - La luna me sabe a poco','NMfnLpdwuKA',3,1),(23,'VIDEO SIN LIKES','Yfezo_OoR_0',3,1),(24,'10 Most Insane Engines Of All Time','gXeBQrio4Uo',7,20),(25,'Fastest CNC Lathe Machine Make Perfect Products You Must See','J7_0kKwpjw8',7,20),(26,'Amazing CNC Machine Lathe Working Complete Crankshaft And Technology Making An Aerospace Component','TRjm3FsApOg',7,20),(27,'Mercedes Benz AMG 63 V8 Engine Production','ri_LFckaT7g',7,20),(28,'BMW 3.9 Litre V8-DI Turbodiesel Engine Production','TUW_1CUlsfs',7,20),(29,'Bentley Continental - W12 Engine FACTORY | HOW IT\'S MADE','_GVemj0ebMw',7,20);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `videos_por_categorias`
--

DROP TABLE IF EXISTS `videos_por_categorias`;
/*!50001 DROP VIEW IF EXISTS `videos_por_categorias`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `videos_por_categorias` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'v2019'
--

--
-- Dumping routines for database 'v2019'
--
/*!50003 DROP FUNCTION IF EXISTS `DEVOLVER_MES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `DEVOLVER_MES`(entrada datetime) RETURNS varchar(15) CHARSET utf8mb4
BEGIN
DECLARE mes VARCHAR(20);
set mes = month(entrada);
CASE mes
      WHEN 1 THEN set mes = 'ENERO';
      WHEN 2 THEN set mes = 'FEBRERO';
      WHEN 3 THEN set mes = 'MARZO';
      WHEN 4 THEN set mes = 'ABRIL';
      WHEN 5 THEN set mes = 'MAYO';
      WHEN 6 THEN set mes = 'JUNIO';
      WHEN 7 THEN set mes = 'JULIO';
      WHEN 8 THEN set mes = 'AGOSTO';
      WHEN 9 THEN set mes = 'SEPTIEMBRE';
      WHEN 10 THEN set mes = 'OCTUBRE';
      WHEN 11 THEN set mes = 'NOVIEMBRE';
      WHEN 12 THEN set mes = 'DICIEMBRE';
      ELSE
        BEGIN
        set mes = 'ERROR de fecha';
        END;
    END CASE;

RETURN mes;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `HOLA_MUNDO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `HOLA_MUNDO`() RETURNS varchar(30) CHARSET utf8mb4
BEGIN

 DECLARE salida VARCHAR(30) DEFAULT 'Hola mundo';

  SET salida = 'Hola mundo con variables';
  RETURN salida;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoria_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`desarrollo`@`%` PROCEDURE `categoria_create`(IN pnombre VARCHAR(255), OUT pcodigo INT)
BEGIN
	INSERT INTO categoria(nombre)
VALUES (pnombre);
	SET pcodigo = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoria_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`desarrollo`@`%` PROCEDURE `categoria_delete`(IN pint INT)
BEGIN
	DELETE FROM categoria WHERE id = pint;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoria_get_All` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`desarrollo`@`%` PROCEDURE `categoria_get_All`()
BEGIN
	SELECT id,nombre FROM categoria ORDER BY id DESC LIMIT 500;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoria_get_by_Id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`desarrollo`@`%` PROCEDURE `categoria_get_by_Id`(IN pid INT)
BEGIN
	SELECT id, nombre FROM categoria WHERE id = pid ORDER BY nombre DESC LIMIT 500;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoria_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`desarrollo`@`%` PROCEDURE `categoria_update`(IN pid INT, IN pnombre VARCHAR(255))
BEGIN
	UPDATE categoria SET nombre = pnombre WHERE id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `crear`(IN nombreUsuario VARCHAR(45), IN contrasenyaUsuario VARCHAR(45))
BEGIN
	INSERT INTO usuario ( nombre, contrasenya) VALUES ( nombreUsuario , contrasenyaUsuario);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `deleteId`(IN idUsuario INT(11))
BEGIN
	UPDATE usuario SET fecha_eliminacion = CURRENT_TIMESTAMP() WHERE id = idUsuario;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAll`()
BEGIN
	SELECT u.id, u.nombre, r.id as 'id_rol', r.nombre as 'nombre_rol', contrasenya, fecha_creacion, fecha_eliminacion, 
    (SELECT COUNT(usuario_id) FROM video GROUP BY usuario_id HAVING usuario_id =u.id)'total_videos' 
    FROM usuario as u, rol as r WHERE u.id_rol = r.id ORDER BY id DESC LIMIT 500;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAllById`(IN idUsuario INT(11))
BEGIN
	SELECT u.id, u.nombre, r.id as 'id_rol', r.nombre as 'nombre_rol',contrasenya, fecha_creacion, u.fecha_eliminacion,
    IFNULL((SELECT COUNT(usuario_id) FROM video GROUP BY usuario_id HAVING usuario_id =u.id),0) 'total_videos', 
    IFNULL((SELECT COUNT(usuario_id) FROM usuario u2 LEFT JOIN likes l ON u2.id = l.usuario_id 
                WHERE usuario_id = u.id GROUP BY u2.id ),0) 'total_likes' 
	FROM usuario as u, rol as r WHERE u.id_rol = r.id AND u.id = idUsuario;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllByNombre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAllByNombre`(IN nombre VARCHAR(45))
BEGIN
	SELECT u.id, u.nombre, r.id as 'id_rol', r.nombre as 'nombre_rol',
    contrasenya, fecha_creacion, u.fecha_eliminacion, 
    IFNULL((SELECT COUNT(usuario_id) FROM video GROUP BY usuario_id HAVING usuario_id =u.id),0) 'total_videos',
    IFNULL((SELECT COUNT(usuario_id) FROM usuario u2 LEFT JOIN likes l ON u2.id = l.usuario_id 
           WHERE usuario_id = u.id GROUP BY u2.id ),0) 'total_likes' 
    FROM usuario as u, rol as r
    WHERE u.id_rol = r.id AND u.nombre LIKE nombre ORDER BY u.nombre ASC LIMIT 500;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getResumen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getResumen`()
BEGIN
	SELECT id, nombre, rol, fecha_creacion, fecha_eliminacion, videos FROM v2019.resumen_usuarios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `modificar`(IN idUsuario INT(11), IN nombreUsuario VARCHAR(45), IN contrasenyaUsuario VARCHAR(45))
BEGIN
	UPDATE usuario SET nombre= nombreUsuario, contrasenya= contrasenyaUsuario WHERE id = idUsuario;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rolDelete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`desarrollo`@`%` PROCEDURE `rolDelete`(pid INT(11))
BEGIN
	DELETE FROM rol
		WHERE id = pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rolGetAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`desarrollo`@`%` PROCEDURE `rolGetAll`()
BEGIN
	SELECT id, nombre
		FROM rol
        ORDER BY id DESC LIMIT 500;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rolInsert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`desarrollo`@`%` PROCEDURE `rolInsert`(IN pNombre VARCHAR(15), OUT pId INT(11))
BEGIN
	INSERT INTO rol (nombre)
		VALUES(pNombre);
	SET pId = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rolUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`desarrollo`@`%` PROCEDURE `rolUpdate`(pNombre VARCHAR(15), pId INT(11))
BEGIN
	UPDATE rol
		SET nombre = pNombre
		WHERE id = pId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuarioExiste` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `usuarioExiste`(IN `usuario` VARCHAR(45), IN `contrasenya` VARCHAR(45)  )
BEGIN
	SELECT u.id, u.nombre, r.id as 'id_rol', r.nombre as 'nombre_rol', contrasenya, fecha_creacion, fecha_eliminacion, 
    (SELECT COUNT(usuario_id) FROM video GROUP BY usuario_id HAVING usuario_id =u.id)'total_videos'  
    FROM usuario as u, rol as r WHERE u.id_rol = r.id AND u.nombre = usuario AND contrasenya = contrasenya;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `resumen_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `resumen_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`desarrollo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `resumen_usuarios` AS select `u`.`id` AS `id`,`u`.`nombre` AS `nombre`,`r`.`nombre` AS `rol`,`u`.`fecha_creacion` AS `fecha_creacion`,`u`.`fecha_eliminacion` AS `fecha_eliminacion`,(select count(`video`.`usuario_id`) from `video` group by `video`.`usuario_id` having (`video`.`usuario_id` = `u`.`id`)) AS `videos` from (`usuario` `u` join `rol` `r`) where (`u`.`id_rol` = `r`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_categorias_likes`
--

/*!50001 DROP VIEW IF EXISTS `v_categorias_likes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`desarrollo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_categorias_likes` AS select `c`.`id` AS `codigo_video`,`c`.`nombre` AS `nombre`,count(`v`.`id`) AS `total_videos`,(select count(`ca`.`id`) from ((`categoria` `ca` left join `video` `vi` on((`ca`.`id` = `vi`.`categoria_id`))) join `likes` `l` on((`vi`.`id` = `l`.`video_id`))) where (`ca`.`id` = `c`.`id`)) AS `total_likes` from (`categoria` `c` left join `video` `v` on((`c`.`id` = `v`.`categoria_id`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_categorias_likes_jose`
--

/*!50001 DROP VIEW IF EXISTS `v_categorias_likes_jose`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`desarrollo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_categorias_likes_jose` AS select `c`.`id` AS `id_de_categoria`,`c`.`nombre` AS `nombre`,count(`v`.`id`) AS `videos_de_categoria`,(select count(`cat`.`id`) from ((`video` `v` left join `categoria` `cat` on((`cat`.`id` = `v`.`categoria_id`))) join `likes` `l` on((`v`.`id` = `l`.`video_id`))) where (`cat`.`id` = `c`.`id`)) AS `likes_de_categoria` from (`categoria` `c` left join `video` `v` on((`v`.`categoria_id` = `c`.`id`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_estadisticas`
--

/*!50001 DROP VIEW IF EXISTS `v_estadisticas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`desarrollo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_estadisticas` AS select `c`.`id` AS `id`,`c`.`nombre` AS `nombre`,count(0) AS `total` from (`video` `v` join `categoria` `c`) where (`c`.`id` = `v`.`categoria_id`) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_total_videos`
--

/*!50001 DROP VIEW IF EXISTS `v_total_videos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`desarrollo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_total_videos` AS select count(0) AS `total_videos`,(select count(0) from (`video` `v` join `usuario` `u`) where ((`v`.`usuario_id` = `u`.`id`) and isnull(`u`.`fecha_eliminacion`))) AS `visibles`,(select count(0) from (`video` `v` join `usuario` `u`) where ((`v`.`usuario_id` = `u`.`id`) and (`u`.`fecha_eliminacion` is not null))) AS `ocultos` from `video` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_totales_video`
--

/*!50001 DROP VIEW IF EXISTS `v_totales_video`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`desarrollo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_totales_video` AS select count(0) AS `total_videos`,(select count(0) from (`video` `v` join `usuario` `u`) where ((`v`.`usuario_id` = `u`.`id`) and isnull(`u`.`fecha_eliminacion`))) AS `total_visibles`,(select count(0) from (`video` `v` join `usuario` `u`) where ((`v`.`usuario_id` = `u`.`id`) and (`u`.`fecha_eliminacion` is not null))) AS `total_invisibles` from `video` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ver_likes`
--

/*!50001 DROP VIEW IF EXISTS `ver_likes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`desarrollo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ver_likes` AS select `v`.`id` AS `video_id`,`v`.`nombre` AS `video_nombre`,`v`.`codigo` AS `codigo`,`u`.`id` AS `usuario_id`,`u`.`nombre` AS `usuario_nombre`,`c`.`id` AS `categoria_id`,`c`.`nombre` AS `categoria_nombre`,ifnull((select count(0) AS `likes_videos` from `likes` group by `likes`.`video_id` having (`likes`.`video_id` = `v`.`id`)),0) AS `likes` from ((`video` `v` join `usuario` `u`) join `categoria` `c`) where ((`v`.`usuario_id` = `u`.`id`) and (`v`.`categoria_id` = `c`.`id`)) order by `likes` desc limit 500 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `videos_por_categorias`
--

/*!50001 DROP VIEW IF EXISTS `videos_por_categorias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`desarrollo`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `videos_por_categorias` AS select `c`.`id` AS `id`,`c`.`nombre` AS `nombre`,count(`v`.`id`) AS `total` from (`categoria` `c` left join `video` `v` on((`c`.`id` = `v`.`categoria_id`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-27 11:38:02
