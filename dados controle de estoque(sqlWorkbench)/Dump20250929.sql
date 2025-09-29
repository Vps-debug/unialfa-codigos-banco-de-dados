-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sistemaestoque
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `codcategoria` int NOT NULL,
  `categoria` varchar(80) NOT NULL,
  PRIMARY KEY (`codcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Alimentos'),(2,'Bebidas'),(3,'Limpeza');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `codcidade` int NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  PRIMARY KEY (`codcidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Goiânia','GO'),(2,'Anápolis','GO'),(3,'São Paulo','SP'),(4,'Rio de Janeiro','RJ');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada` (
  `codentrada` int NOT NULL,
  `codtransportadora` int NOT NULL,
  `datapedi` date DEFAULT NULL,
  `dataent` date DEFAULT NULL,
  `total` double DEFAULT NULL,
  `frete` double DEFAULT NULL,
  `numnf` int DEFAULT NULL,
  `imposto` double DEFAULT NULL,
  PRIMARY KEY (`codentrada`),
  KEY `FK_Entrada_Transportadora` (`codtransportadora`),
  CONSTRAINT `FK_Entrada_Transportadora` FOREIGN KEY (`codtransportadora`) REFERENCES `transportadora` (`codtransportadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,1,'2025-09-01','2025-09-03',1500,100,1234,200),(2,2,'2025-09-05','2025-09-06',800,50,1235,120);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `codfornecedor` int NOT NULL,
  `codcidade` int NOT NULL,
  `fornecedor` varchar(100) NOT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `num` int DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `contato` varchar(80) DEFAULT NULL,
  `cnpj` char(18) DEFAULT NULL,
  `insc` varchar(20) DEFAULT NULL,
  `tel` char(14) DEFAULT NULL,
  PRIMARY KEY (`codfornecedor`),
  KEY `FK_Fornecedor_Cidade` (`codcidade`),
  CONSTRAINT `FK_Fornecedor_Cidade` FOREIGN KEY (`codcidade`) REFERENCES `cidade` (`codcidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,1,'Fornecedor Goiás LTDA','Rua A',100,'Centro','74000-000','Carlos Silva','12.345.678/0001-90','123456','(62)3333-4444'),(2,3,'Fornecedor Paulista SA','Av. Paulista',2000,'Bela Vista','01310-100','Ana Souza','98.765.432/0001-10','654321','(11)2222-3333');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itementrada`
--

DROP TABLE IF EXISTS `itementrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itementrada` (
  `coditementrada` int NOT NULL,
  `codproduto` int NOT NULL,
  `codentrada` int NOT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `qtde` int DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`coditementrada`),
  KEY `FK_ItemEntrada_Produto` (`codproduto`),
  KEY `FK_ItemEntrada_Entrada` (`codentrada`),
  CONSTRAINT `FK_ItemEntrada_Entrada` FOREIGN KEY (`codentrada`) REFERENCES `entrada` (`codentrada`),
  CONSTRAINT `FK_ItemEntrada_Produto` FOREIGN KEY (`codproduto`) REFERENCES `produto` (`codproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itementrada`
--

LOCK TABLES `itementrada` WRITE;
/*!40000 ALTER TABLE `itementrada` DISABLE KEYS */;
INSERT INTO `itementrada` VALUES (1,1,1,'L001',50,30),(2,2,1,'L002',100,10),(3,3,2,'L003',80,8);
/*!40000 ALTER TABLE `itementrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemsaida`
--

DROP TABLE IF EXISTS `itemsaida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemsaida` (
  `coditemsaida` int NOT NULL,
  `codsaida` int NOT NULL,
  `codproduto` int NOT NULL,
  `lote` varchar(50) DEFAULT NULL,
  `qtde` int DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`coditemsaida`),
  KEY `FK_ItemSaida_Produto` (`codproduto`),
  KEY `FK_ItemSaida_Saida` (`codsaida`),
  CONSTRAINT `FK_ItemSaida_Produto` FOREIGN KEY (`codproduto`) REFERENCES `produto` (`codproduto`),
  CONSTRAINT `FK_ItemSaida_Saida` FOREIGN KEY (`codsaida`) REFERENCES `saida` (`codsaida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsaida`
--

LOCK TABLES `itemsaida` WRITE;
/*!40000 ALTER TABLE `itemsaida` DISABLE KEYS */;
INSERT INTO `itemsaida` VALUES (1,1,1,'L001',20,35),(2,1,2,'L002',50,12),(3,2,3,'L003',30,9);
/*!40000 ALTER TABLE `itemsaida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loja`
--

DROP TABLE IF EXISTS `loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loja` (
  `codloja` int NOT NULL,
  `codcidade` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `num` int DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `insc` varchar(20) DEFAULT NULL,
  `cnpj` char(18) DEFAULT NULL,
  `tel` char(14) DEFAULT NULL,
  PRIMARY KEY (`codloja`),
  KEY `FK_Loja_Cidade` (`codcidade`),
  CONSTRAINT `FK_Loja_Cidade` FOREIGN KEY (`codcidade`) REFERENCES `cidade` (`codcidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loja`
--

LOCK TABLES `loja` WRITE;
/*!40000 ALTER TABLE `loja` DISABLE KEYS */;
INSERT INTO `loja` VALUES (1,2,'Supermercado Anápolis','Rua das Flores',300,'Centro','75000-000','L1234','33.444.555/0001-66','(62)4444-5555'),(2,4,'Mercado Carioca','Av. Atlântica',1500,'Copacabana','22000-000','L4321','44.555.666/0001-77','(21)3333-2222');
/*!40000 ALTER TABLE `loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `codproduto` int NOT NULL,
  `codcategoria` int NOT NULL,
  `codfornecedor` int NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `peso` double DEFAULT NULL,
  `controlado` tinyint(1) DEFAULT NULL,
  `qtdem` int DEFAULT NULL,
  PRIMARY KEY (`codproduto`),
  KEY `FK_Produto_Categoria` (`codcategoria`),
  KEY `FK_Produto_Fornecedor` (`codfornecedor`),
  CONSTRAINT `FK_Produto_Categoria` FOREIGN KEY (`codcategoria`) REFERENCES `categoria` (`codcategoria`),
  CONSTRAINT `FK_Produto_Fornecedor` FOREIGN KEY (`codfornecedor`) REFERENCES `fornecedor` (`codfornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,1,1,'Arroz Tipo 1 - 5kg',5,0,100),(2,2,2,'Refrigerante Cola - 2L',2,0,200),(3,3,1,'Sabão em Pó - 1kg',1,0,150);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saida`
--

DROP TABLE IF EXISTS `saida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saida` (
  `codsaida` int NOT NULL,
  `codloja` int NOT NULL,
  `codtransportadora` int NOT NULL,
  `total` double DEFAULT NULL,
  `frete` double DEFAULT NULL,
  `imposto` double DEFAULT NULL,
  PRIMARY KEY (`codsaida`),
  KEY `FK_Saida_Loja` (`codloja`),
  KEY `FK_Saida_Transportadora` (`codtransportadora`),
  CONSTRAINT `FK_Saida_Loja` FOREIGN KEY (`codloja`) REFERENCES `loja` (`codloja`),
  CONSTRAINT `FK_Saida_Transportadora` FOREIGN KEY (`codtransportadora`) REFERENCES `transportadora` (`codtransportadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saida`
--

LOCK TABLES `saida` WRITE;
/*!40000 ALTER TABLE `saida` DISABLE KEYS */;
INSERT INTO `saida` VALUES (1,1,1,500,50,80),(2,2,2,300,30,50);
/*!40000 ALTER TABLE `saida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportadora`
--

DROP TABLE IF EXISTS `transportadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportadora` (
  `codtransportadora` int NOT NULL,
  `codcidade` int NOT NULL,
  `transportadora` varchar(100) NOT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `num` int DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `cnpj` char(18) DEFAULT NULL,
  `insc` varchar(20) DEFAULT NULL,
  `contato` varchar(80) DEFAULT NULL,
  `tel` char(14) DEFAULT NULL,
  PRIMARY KEY (`codtransportadora`),
  KEY `FK_Transportadora_Cidade` (`codcidade`),
  CONSTRAINT `FK_Transportadora_Cidade` FOREIGN KEY (`codcidade`) REFERENCES `cidade` (`codcidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportadora`
--

LOCK TABLES `transportadora` WRITE;
/*!40000 ALTER TABLE `transportadora` DISABLE KEYS */;
INSERT INTO `transportadora` VALUES (1,1,'Transporte Goiás LTDA','Rua B',50,'Setor Oeste','74010-010','11.222.333/0001-44','T12345','Marcos Lima','(62)9999-8888'),(2,3,'SP Transportes SA','Rua Augusta',500,'Centro','01305-100','22.333.444/0001-55','T54321','Fernanda Alves','(11)98888-7777');
/*!40000 ALTER TABLE `transportadora` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-29 19:34:16
