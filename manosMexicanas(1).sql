-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ManosMexicanas
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `idCarrito` int NOT NULL AUTO_INCREMENT,
  `idProducto` int DEFAULT NULL,
  `idUsuario` int NOT NULL,
  `idColor` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idCarrito`),
  KEY `fk_carrito_producto_idx` (`idProducto`),
  KEY `fk_carrito_usuario_idx` (`idUsuario`),
  KEY `carrito_colo__fk` (`idColor`),
  CONSTRAINT `carrito_colo__fk` FOREIGN KEY (`idColor`) REFERENCES `color` (`id`),
  CONSTRAINT `fk_carrito_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`),
  CONSTRAINT `fk_carrito_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`) VALUES (1,'Animado','Son peluches que tienen que ver con series animadas'),(2,'Comida','Son peluches que tienen que ver con comida'),(3,'Artistas','Son peluches que tienen que ver con artistas famosos'),(4,'Ropa','Esta es ropa de todo tipo');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` (`id`, `nombre`) VALUES (8,'Amarillo'),(7,'Azul'),(20,'Beige'),(14,'Blanco'),(21,'Celeste'),(18,'Cian'),(23,'Coral'),(15,'Gris'),(24,'Lavanda'),(22,'Lima'),(19,'Magenta'),(12,'Marrón'),(10,'Morado'),(9,'Naranja'),(13,'Negro'),(5,'Rojo'),(11,'Rosa'),(16,'Turquesa'),(6,'Verde'),(17,'Violeta');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;

--
-- Temporary view structure for view `countProducts`
--

DROP TABLE IF EXISTS `countProducts`;
/*!50001 DROP VIEW IF EXISTS `countProducts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `countProducts` AS SELECT 
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detallePedido`
--

DROP TABLE IF EXISTS `detallePedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallePedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idPedido` int NOT NULL,
  `idProducto` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT (now()),
  `precioTotal` double NOT NULL,
  `cantidad` int DEFAULT '1',
  `idColor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detallePedido_pedido_idx` (`idPedido`),
  KEY `fk_detallePedido_producto_idx` (`idProducto`),
  KEY `detallePedido_color__fk` (`idColor`),
  CONSTRAINT `detallePedido_color__fk` FOREIGN KEY (`idColor`) REFERENCES `color` (`id`),
  CONSTRAINT `fk_detallePedido_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `fk_detallePedido_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallePedido`
--

/*!40000 ALTER TABLE `detallePedido` DISABLE KEYS */;
INSERT INTO `detallePedido` (`id`, `idPedido`, `idProducto`, `fecha`, `precioTotal`, `cantidad`, `idColor`) VALUES (1,2,2,'2024-08-18 21:35:31',2050,1,7),(2,2,1,'2024-08-18 21:35:31',1050,1,5),(3,2,5,'2024-08-18 21:35:31',250,1,6),(4,2,3,'2024-08-18 21:35:31',500,1,6),(5,3,4,'2024-08-18 22:24:56',150,1,7),(6,3,2,'2024-08-18 22:24:56',2050,1,7),(7,4,6,'2024-08-19 01:10:09',100,1,8),(8,4,2,'2024-08-19 01:10:09',2050,1,7),(9,5,3,'2024-08-19 01:13:01',500,1,5);
/*!40000 ALTER TABLE `detallePedido` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS deleteCarrito */;
DELIMITER ;;
/*!50003 CREATE*/  /*!50003 TRIGGER `deleteCarrito` AFTER INSERT ON `detallePedido` FOR EACH ROW BEGIN
    DELETE FROM carrito
    WHERE carrito.idUsuario = (
        SELECT pedido.idUsuario
        FROM pedido
        WHERE pedido.id= NEW.idPedido
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(45) DEFAULT NULL,
  `idCliente` int NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `numeroExterior` varchar(10) DEFAULT NULL,
  `numeroInterior` varchar(10) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domicilio_usuario__fk` (`idCliente`),
  CONSTRAINT `domicilio_usuario__fk` FOREIGN KEY (`idCliente`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
INSERT INTO `domicilio` (`id`, `calle`, `idCliente`, `estado`, `ciudad`, `numeroExterior`, `numeroInterior`, `cp`) VALUES (1,'Mallard',2,'Puebla','San Martin','758','8','56199'),(2,'Drewry',2,'Mexico','El Tejocote','90376','8','50625'),(3,'Arrowood',29,'Chiapas','San Sebastian','69100','63','51950');
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProducto` int NOT NULL,
  `idColor` int NOT NULL,
  `url` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_color__fk` (`idColor`),
  KEY `image_producto__fk` (`idProducto`),
  CONSTRAINT `image_color__fk` FOREIGN KEY (`idColor`) REFERENCES `color` (`id`),
  CONSTRAINT `image_producto__fk` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` (`id`, `idProducto`, `idColor`, `url`) VALUES (7,1,7,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723576281/product11201.jpg'),(8,1,5,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723576314/product442.jpg'),(9,1,17,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723576399/product22702.jpg'),(10,1,6,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723576412/product28084.jpg'),(11,2,8,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723641889/product872.jpg'),(12,2,7,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723641897/product22268.jpg'),(13,2,11,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723641909/product9832.jpg'),(14,2,6,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723641925/product26806.jpg'),(15,3,6,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723642009/product22670.jpg'),(16,3,5,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723642019/product21048.jpg'),(17,3,12,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723642029/product831.jpg'),(18,3,7,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723642037/product10322.jpg'),(23,4,8,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723694920/product25792.jpg'),(24,4,11,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723694978/product17651.jpg'),(25,4,7,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723694992/product446.jpg'),(26,4,10,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723694999/product11343.jpg'),(27,5,7,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723696133/product20149.jpg'),(28,5,10,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723696147/product1389.jpg'),(29,5,6,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723696157/product8042.jpg'),(30,6,8,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723773755/product17208.jpg'),(31,6,5,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723773764/product29857.jpg'),(32,6,6,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723773774/product911.jpg'),(33,6,10,'http://res.cloudinary.com/dt9d7lbhg/image/upload/v1723773782/product14289.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int DEFAULT NULL,
  `cantidad` int DEFAULT '1',
  `fecha` datetime NOT NULL DEFAULT (now()),
  `total` double NOT NULL,
  `idDomicilio` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_usuario_idx` (`idUsuario`),
  KEY `fk_pedido_domicilio_idx` (`idDomicilio`),
  CONSTRAINT `fk_pedido_domicilio` FOREIGN KEY (`idDomicilio`) REFERENCES `domicilio` (`id`),
  CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`id`, `idUsuario`, `cantidad`, `fecha`, `total`, `idDomicilio`) VALUES (1,2,1,'2024-08-18 21:31:52',3850,1),(2,2,1,'2024-08-18 21:35:31',3850,1),(3,2,1,'2024-08-18 22:24:56',2200,1),(4,29,1,'2024-08-19 01:10:09',2150,3),(5,29,1,'2024-08-19 01:13:01',500,3);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

--
-- Temporary view structure for view `productAll`
--

DROP TABLE IF EXISTS `productAll`;
/*!50001 DROP VIEW IF EXISTS `productAll`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productAll` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `precio`,
 1 AS `stock`,
 1 AS `descripcion`,
 1 AS `tamano`,
 1 AS `color`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `precio` double NOT NULL,
  `tamano` double NOT NULL,
  `categoria` int DEFAULT NULL,
  `descripcion` longtext NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_categoria__fk` (`categoria`),
  CONSTRAINT `producto_categoria__fk` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id`, `nombre`, `precio`, `tamano`, `categoria`, `descripcion`, `stock`) VALUES (1,'Tommy Pickles',1050,100,1,'Es pequeño pero muy audaz, es inteligente y se las ingenia siempre par',100),(2,'Sombrero',2050,200,4,'Este encantador sombrero de crochet, hecho a mano con amor, combina es',50),(3,'Aguacate',500,50,2,'Este adorable aguacate de crochet, tejido a mano con atención al detal',200),(4,'Bolsa',150,50,4,'Sumérgete en el encanto de lo hecho a mano con nuestra exclusiva Bolsa de Crochet,\ndiseñada para quienes aprecian la combinación perfecta entre estilo y sostenibilidad. Tejida con delicadeza y\natención al detalle, esta bolsa captura la esencia del arte tradicional del crochet.',50),(5,'Checho Perez',250,100,3,'Conoce a Checho Pérez, un adorable peluche de crochet hecho a mano. Con su diseño suave y colorido, este encantador compañero está tejido con cariño y atención al detalle, convirtiéndolo en el regalo perfecto para cualquier ocasión. Su tamaño compacto y textura acogedora lo hacen ideal para abrazar y decorar.',20),(6,'Skrump',100,50,1,'Este adorable peluche de crochet de Skrump, el encantador personaje de Lilo y Stitch, está hecho a mano con gran atención al detalle. Su diseño único y colorido captura la esencia del querido muñeco que Lilo lleva consigo a todas partes. Ideal para fanáticos de la película y amantes de los juguetes artesanales, este peluche es perfecto para decorar, coleccionar, o como un compañero especial para cualquier niño o adulto.',10);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

--
-- Temporary view structure for view `randomProduct`
--

DROP TABLE IF EXISTS `randomProduct`;
/*!50001 DROP VIEW IF EXISTS `randomProduct`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `randomProduct` AS SELECT 
 1 AS `nombre`,
 1 AS `url`,
 1 AS `descripcion`,
 1 AS `precio`,
 1 AS `tamano`,
 1 AS `idColor`,
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `nombre`) VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `contraseña` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `apellido` varchar(25) NOT NULL,
  `role` int DEFAULT '2',
  `telefono` varchar(14) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `token` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `fk_usuario_role_idx` (`role`),
  CONSTRAINT `fk_usuario_role` FOREIGN KEY (`role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nombre`, `correo`, `contraseña`, `create_time`, `apellido`, `role`, `telefono`, `status`, `token`) VALUES (2,'Enrique','gonherenrique@gmail.com','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225','2024-06-21 14:40:12','Gonzalez',2,'7774670428',1,' '),(3,'Pablo','pedro@gmai.com','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','2024-06-25 04:37:53','Franco',2,'777980',1,NULL),(4,'Frank','frankCuesta@gmail.com','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225','2024-06-25 21:19:50','Cuesta',2,'7774670429',1,NULL),(5,'Mauro','mautro@gmail.com','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225','2024-06-28 20:24:34','Bahena',2,'777980',1,NULL),(6,'Erick','manosmexicanasutez@gmail.com','91d1281a89ba8c602afd105eef40902732691e1143af64ab530afb7cce2cd5ea','2024-07-05 00:55:31','Mireles',1,' ',1,NULL),(7,'Golda','gdreossi0@cnbc.com','7b1ccb3d820cd9539f55324f6bf803ec55cf8006a7695af3bb6ba6e00a6ca44b','2024-07-11 19:20:07','Dreossi',2,'752-150-7492',1,NULL),(8,'Ines','ishakespear1@prweb.com','3788dc10827e718cdeb7503448477804bc8e620fb38653a7d5aa7ae21df85ff2','2024-07-11 19:20:39','Shakespear',2,'995-470-2018',1,NULL),(9,'Herbert','hdyka2@sohu.com','88c09100ae0e0eb08b11832e314c5e3972588a055f95fced2a8efd76a5de2e78','2024-07-11 19:30:12','Dyka',2,'490-874-6475',1,NULL),(10,'Mychal','mribey3@blogspot.com','8101779b585dfa23bca3fa00b11f9d6219b04799045ee5a5caf7dfdc4e3f0083','2024-07-11 19:30:12','Ribey',2,'363-798-7705',1,NULL),(11,'Bale','bquinell4@microsoft.com','ad39e47eab53d7b1b33f7ed359a4e6c8917f5dda2dbbbfe5ad03e13310aa82f1','2024-07-11 19:30:12','Quinell',2,'965-635-5059',1,NULL),(12,'Arlie','aedlestone5@ihg.com','ca98315356b0c0731dd98a33b2e49655ed28e8bb3afa0e642f328fd368719cab','2024-07-11 19:30:12','Edlestone',2,'964-248-6926',1,NULL),(13,'Antons','amainson6@jigsy.com','656f29c601ee0142d612b82d9392588762247594bae4ea75723b27862f5f126e','2024-07-11 19:30:13','Mainson',2,'839-249-3415',1,NULL),(14,'Barthel','bmcellen7@netscape.com','7f0250e91bffd8c7130ff4d83c962c975f083f80e1d2e51144e05b9968368d29','2024-07-11 19:30:13','McEllen',2,'869-139-8310',1,NULL),(15,'Iver','irayson8@accuweather.com','a268f622d6b121e163c152ba0645e1114a301bac65b523b131fcf8ab572490fc','2024-07-11 19:30:13','Rayson',2,'816-174-0982',1,NULL),(16,'Quintin','qsesons9@purevolume.com','26a14f8dff1286df692a268f1abbda949963f3d8ca59387a451c4fcdb61b0745','2024-07-11 19:30:13','Sesons',2,'745-639-1586',1,NULL),(17,'Lynnea','ltarbetta@facebook.com','2afbfb592546767b2c7bcaf30493f4a06116962bba2c0dad9069776f39419f13','2024-07-11 19:30:13','Tarbett',2,'456-703-8431',1,NULL),(18,'Wilma','wharmourb@drupal.org','6464cf6cba314b7fa50f7b59bd9bfe3ead6562b78153e786f24f8b52bfb883f3','2024-07-11 19:30:13','Harmour',2,'577-150-2351',1,NULL),(19,'Winnie','wgronowec@mit.edu','c642966f7dc99c2ea8d273530ce0b5a3f13c1b685f98b7e4a16fd330d1be366f','2024-07-11 19:30:13','Gronowe',2,'583-128-5137',1,NULL),(20,'Dolly','ddelucad@yandex.ru','c57da8f8c08c70daacc62744d142f279e444a39d7564edf122639bb2de074276','2024-07-11 19:30:13','Deluca',2,'333-400-6853',1,NULL),(21,'Gael','gsalternee@indiatimes.com','b022ced7ad749c21356bc4e691a809ccc4578c161e8a97a9f63e963fbd662f9c','2024-07-11 19:30:13','Salterne',2,'379-697-9935',1,NULL),(22,'Fitzgerald','fchadburnf@weebly.com','1447ac944f0f77a2eabdfb5888937b46f144671e4ee96bc4d0a9577fae2903fb','2024-07-11 19:30:13','Chadburn',2,'217-214-1173',1,NULL),(23,'Alexandro','alowfillg@bandcamp.com','432473a5c257f87a02652b0598500fcf12994604e211baf305b49495cc4388ce','2024-07-11 19:30:13','Lowfill',2,'397-916-7332',1,NULL),(24,'Kinna','kaplinh@vk.com','26833301a6eb0775e33ead4609120ac35c8875cd0d84bcca6d48e328d5adfd25','2024-07-11 19:30:13','Aplin',2,'185-314-7023',1,NULL),(25,'Bili','bsaldleri@w3.org','8f59670f1c97ebbaf637671a9958fec2a54fee09337043aa40a5ea8c4a7db86e','2024-07-11 19:30:13','Saldler',2,'111-173-7663',1,NULL),(26,'Tonye','trandellj@yellowpages.com','26a31d0f4ea2864d726e89910708ffb16040bb022c0dabf80bb06b15dcca1d31','2024-07-11 19:30:13','Randell',2,'946-686-4894',1,NULL),(27,'Motse','montsePichardo@gmail.com','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','2024-07-20 02:21:36','montsePichardo@gmail.com',2,'7772148395',1,NULL),(28,'Yoselin','yoselin@hotmail.com','ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f','2024-08-07 05:26:16','Gomez',2,'777540124',1,NULL),(29,'Carlos','carloscoronel@gmail.com','15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225','2024-08-19 07:07:42','Coronel',2,'983-475-2064',1,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

--
-- Dumping routines for database 'ManosMexicanas'
--
/*!50003 DROP PROCEDURE IF EXISTS `countCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `countCarrito`(IN idUser int)
BEGIN
    SELECT COUNT(*) AS 'total' FROM carrito WHERE idUsuario = idUser;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `deleteProduct`(IN productoId int)
BEGIN
    DELETE FROM image WHERE idProducto = productoId;
    DELETE FROM producto WHERE id = productoId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `getCarrito`(IN idUser int)
BEGIN
   SELECT
    ca.idCarrito,
    p.nombre AS 'producto',
    p.precio,
    i.url,
    p.id AS 'idProducto',
    c.id AS 'idColor',
    ca.cantidad
FROM
    carrito ca
INNER JOIN
    producto p ON ca.idProducto = p.id
LEFT JOIN
    color c ON ca.idColor = c.id
LEFT JOIN
    image i ON p.id = i.idProducto AND (c.id IS NULL OR i.idColor = c.id)
WHERE
    ca.idUsuario = idUser;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDomicilio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `getDomicilio`(IN idUser int)
BEGIN
    SELECT d.numeroExterior, d.estado,d.ciudad, d.calle,
           d.id
           FROM domicilio d
    WHERE d.idCliente = idUser;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getImagesUrl` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `getImagesUrl`(IN productId int)
BEGIN
    SELECT i.url, c.nombre, i.idColor as 'color' FROM image i
        INNER JOIN color c
    ON i.idColor = c.id
    WHERE i.idProducto = productId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `getMail`(IN mail varchar(60))
BEGIN
    SELECT * FROM usuario WHERE correo = mail;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOne` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `getOne`(IN idProducto int)
begin
    SELECT p.id,p.nombre, p.precio,p.tamano,p.stock,p.descripcion,
       c.nombre as 'nombreCa', c.id AS 'categoria' FROM categoria c
    INNER JOIN producto p
    ON c.id = p.categoria
    WHERE p.id = idProducto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOneProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `getOneProduct`(IN productId int)
BEGIN
    SELECT p.id as 'idProducto', i.idColor, i.url, p.nombre,
           p.descripcion, c.nombre as 'color' , p.precio,
           p.tamano
    FROM image i
    INNER JOIN producto p
    on i.idProducto = p.id 
    INNER  JOIN color c
    on i.idColor = c.id
    WHERE p.id = productId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPedidos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `getPedidos`(IN idClient int)
BEGIN
    SELECT p.fecha, p.total, p.id
FROM detallePedido dp
INNER JOIN producto pr ON dp.idProducto = pr.id
INNER JOIN pedido p ON dp.idPedido = p.id
WHERE p.idUsuario = idClient
GROUP BY p.fecha, p.total, p.id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUseById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `getUseById`(IN idUser int)
BEGIN
    SELECT u.nombre, u.apellido, u.correo
    FROM  usuario u
    WHERE u.id = idUser;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `getUser`(IN mailUser VARCHAR(60), IN passUser VARCHAR(60))
BEGIN
    SELECT * FROM usuario WHERE usuario.correo = mailUser AND usuario.contraseña = sha2(passUser,256);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertCarrito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `insertCarrito`(IN color INT, IN producto INT, IN cliente INT)
BEGIN
    INSERT INTO carrito (idProducto, idUsuario, idColor, cantidad)  VALUES (producto,cliente,color,1);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertDetallePedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `insertDetallePedido`(IN Pedido int, IN Producto int, IN precio double, IN color INT)
BEGIN
INSERT INTO detallePedido (idPedido, idProducto, precioTotal,idColor) values (Pedido,Producto, precio, color);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertDireccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `insertDireccion`(IN idUser int, IN cpD varchar(5), IN calleD varchar(45),
                                                    IN ciudadD varchar(45), IN estadoD varchar(45),
                                                    IN exterior varchar(10), IN interior varchar(10))
BEGIN
INSERT INTO domicilio (idCliente,calle, estado, ciudad, numeroExterior, numeroInterior, cp) VALUES
                                                                                      (idUser,calleD,estadoD, ciudadD, exterior, interior,
                                                                                        cpD);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertImage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `insertImage`(IN productId int, IN colorId int, IN urlProduct longtext)
BEGIN
    INSERT INTO image (idProducto, idColor, url) VALUES (productId,colorId,urlProduct);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `insertPedido`(IN idUser INT, IN totalP DOUBLE, IN domicilio int)
BEGIN
    INSERT INTO pedido(idUsuario, total, idDomicilio) VALUES (idUser, totalP, domicilio);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `insertProduct`(IN productId int, IN nombreProduct varchar(60),
                                                  IN precioProduct double, IN tamanoProduct double, IN categoriaP int,
                                                  IN descripcionP longtext, IN stockP int)
BEGIN
    INSERT INTO producto (id,nombre,precio,tamano,categoria, descripcion, stock) VALUES
    (productId,nombreProduct,precioProduct,tamanoProduct,categoriaP,descripcionP,stockP);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lastPedidoUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `lastPedidoUser`(IN idUser int)
BEGIN
SELECT pedido.id
FROM pedido
WHERE pedido.idUsuario = idUser
ORDER BY fecha DESC
LIMIT 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `login`(IN correo varchar(60), IN password varchar(64))
BEGIN
   SELECT * FROM usuario WHERE usuario.correo = correo and usuario.contraseña = sha2(password,256);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `loginAdmin`(IN correo varchar(60), IN password varchar(64))
BEGIN
    DECLARE roleUser INT DEFAULT 2;
SELECT u.role INTO roleUser
FROM usuario u
WHERE u.correo = correo AND u.contraseña = sha2(password, 256);

IF roleUser = 1 THEN
    SELECT * FROM usuario u
    WHERE u.correo = correo AND u.contraseña = sha2(password, 256);
END IF;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `offsetPagination` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `offsetPagination`(IN offSet int)
BEGIN
    select `p`.`nombre`       AS `nombre`,
       min(`i`.`url`)     AS `url`,
       `p`.`descripcion`  AS `descripcion`,
       `p`.`precio`       AS `precio`,
       `p`.`tamano`       AS `tamano`,
       min(`i`.`idColor`) AS `idColor`,
       `p`.`id`           AS `id`
    from (`ManosMexicanas`.`image` `i` join `ManosMexicanas`.`producto` `p` on ((`i`.`idProducto` = `p`.`id`)))
    group by `p`.`id`
    LIMIT 6
    OFFSET offSet;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registerUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `registerUser`(IN nombre VARCHAR(25),IN apellido VARCHAR(25),
                              IN correo VARCHAR(60),IN telefono VARCHAR(14), contrasena VARCHAR(64))
BEGIN
    INSERT INTO usuario (usuario.nombre, usuario.correo, usuario.contraseña, usuario.apellido, usuario.telefono)
    VALUES (nombre,correo, sha2(contrasena,256), apellido,telefono);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `searchToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `searchToken`(IN tokenUser VARCHAR(60))
BEGIN
    SELECT * FROM usuario WHERE usuario.token = tokenUser;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setTokenUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `setTokenUser`(IN tokenIn varchar(60), in idUser int)
BEGIN
   UPDATE usuario SET token = tokenIn WHERE id = idUser;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updatePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `updatePassword`(IN newPass varchar(60), IN idUser INT)
BEGIN
    UPDATE usuario SET usuario.contraseña = sha2(newPass,256), usuario.token =  ' ' WHERE usuario.id = idUser;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `countProducts`
--

/*!50001 DROP VIEW IF EXISTS `countProducts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `countProducts` AS select count(0) AS `total` from `producto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productAll`
--

/*!50001 DROP VIEW IF EXISTS `productAll`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `productAll` AS select `p`.`id` AS `id`,`p`.`nombre` AS `nombre`,`p`.`precio` AS `precio`,`p`.`stock` AS `stock`,`p`.`descripcion` AS `descripcion`,`p`.`tamano` AS `tamano`,`c`.`nombre` AS `color` from ((`image` `i` join `producto` `p` on((`i`.`idProducto` = `p`.`id`))) join `color` `c` on((`i`.`idColor` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `randomProduct`
--

/*!50001 DROP VIEW IF EXISTS `randomProduct`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `randomProduct` AS select `p`.`nombre` AS `nombre`,min(`i`.`url`) AS `url`,`p`.`descripcion` AS `descripcion`,`p`.`precio` AS `precio`,`p`.`tamano` AS `tamano`,min(`i`.`idColor`) AS `idColor`,`p`.`id` AS `id` from (`image` `i` join `producto` `p` on((`i`.`idProducto` = `p`.`id`))) group by `p`.`id` order by rand() limit 4 */;
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

-- Dump completed on 2024-08-19  1:16:14
