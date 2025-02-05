-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: facul
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `nome_aluno` varchar(255) NOT NULL,
  `data_nasc_aluno` date DEFAULT NULL,
  `endereco_aluno` varchar(255) NOT NULL,
  `matricula_aluno` varchar(10) NOT NULL,
  PRIMARY KEY (`matricula_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES ('Getulio Domingos','2003-12-09','Avenida Pinheiros, 364','PD00001'),('Amanda dos Santos','2007-08-10','Santos Dumont, 572','PD00005'),('Leandro Caetano','2001-05-19','Rua das Borboletas, 123','PD00026'),('Marilia Pereira','2009-01-26','Rua 7, 95','PD00031');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aluno_disciplina`
--

DROP TABLE IF EXISTS `aluno_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno_disciplina` (
  `matricula_aluno` varchar(10) NOT NULL,
  `nome_disc` varchar(100) NOT NULL,
  PRIMARY KEY (`matricula_aluno`,`nome_disc`),
  KEY `nome_disc` (`nome_disc`),
  CONSTRAINT `aluno_disciplina_ibfk_1` FOREIGN KEY (`matricula_aluno`) REFERENCES `aluno` (`matricula_aluno`),
  CONSTRAINT `aluno_disciplina_ibfk_2` FOREIGN KEY (`nome_disc`) REFERENCES `disciplina` (`nome_disc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno_disciplina`
--

LOCK TABLES `aluno_disciplina` WRITE;
/*!40000 ALTER TABLE `aluno_disciplina` DISABLE KEYS */;
INSERT INTO `aluno_disciplina` VALUES ('PD00001','Algebra'),('PD00005','Algebra'),('PD00026','Algebra'),('PD00031','Algebra'),('PD00001','Educação Fisica'),('PD00005','Educação Fisica'),('PD00026','Educação Fisica'),('PD00031','Educação Fisica'),('PD00001','Geografia'),('PD00005','Geografia'),('PD00026','Geografia'),('PD00031','Geografia'),('PD00001','Matematica'),('PD00005','Matematica'),('PD00026','Matematica'),('PD00031','Matematica'),('PD00001','Portugues'),('PD00005','Portugues'),('PD00026','Portugues'),('PD00031','Portugues');
/*!40000 ALTER TABLE `aluno_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `data_hora_avaliacao` datetime NOT NULL,
  `cpf_prof` varchar(11) NOT NULL,
  `comentario_avaliacao` varchar(500) DEFAULT NULL,
  `nota_avaliacao` float NOT NULL,
  PRIMARY KEY (`data_hora_avaliacao`,`cpf_prof`),
  KEY `cpf_prof` (`cpf_prof`),
  CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`cpf_prof`) REFERENCES `professor` (`cpf_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES ('2020-05-26 10:06:00','51641436080','Otima didatica',10),('2022-09-15 11:30:08','71361109040','Pouco dominio do assunto',5),('2023-11-02 21:15:01','91080070071','Muito prestativo',7);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_depart` int NOT NULL AUTO_INCREMENT,
  `nome_depart` varchar(255) NOT NULL,
  `local_depart` varchar(255) NOT NULL,
  `chefe_cpf_prof` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_depart`),
  KEY `chefe_cpf_prof` (`chefe_cpf_prof`),
  CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`chefe_cpf_prof`) REFERENCES `professor` (`cpf_prof`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Secretariado','Bom Despacho','61099330096'),(2,'Docentes','Bom Despacho','51641436080'),(3,'Regentes','Belo Horizonte','91080070071');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `nome_disc` varchar(100) NOT NULL,
  `carga_horaria_disc` int NOT NULL DEFAULT '30',
  `ementa_disc` text,
  `pre_requisito_disc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nome_disc`),
  KEY `pre_requisito_disc` (`pre_requisito_disc`),
  CONSTRAINT `disciplina_ibfk_1` FOREIGN KEY (`pre_requisito_disc`) REFERENCES `disciplina` (`nome_disc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES ('Algebra',10,'Algebra básica','Matematica'),('Ciencias',25,'Anfiobios',NULL),('Educação Fisica',15,'Jogos e brincadeiras',NULL),('Geografia',25,'Mapeamento',NULL),('Historia',25,'Primordios',NULL),('Matematica',50,'Somas, subtração',NULL),('Portugues',50,'Linguagens',NULL);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `nome_prof` varchar(255) NOT NULL,
  `inicio_contrato_prof` date DEFAULT NULL,
  `cpf_prof` varchar(11) NOT NULL,
  `id_depart` int DEFAULT NULL,
  PRIMARY KEY (`cpf_prof`),
  KEY `id_depart` (`id_depart`),
  CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`id_depart`) REFERENCES `departamento` (`id_depart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('Andre Vicente','2000-02-01','1660267005',NULL),('Tiago Peres','2006-07-01','51641436080',NULL),('Elida Martins','1998-01-30','61099330096',NULL),('Matheus Vitor','2002-02-01','71361109040',NULL),('Carolina Freitas','2004-07-01','91080070071',NULL);
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_contato`
--

DROP TABLE IF EXISTS `professor_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_contato` (
  `cpf_prof` varchar(11) NOT NULL,
  `contato_prof` varchar(14) NOT NULL,
  PRIMARY KEY (`cpf_prof`,`contato_prof`),
  CONSTRAINT `professor_contato_ibfk_1` FOREIGN KEY (`cpf_prof`) REFERENCES `professor` (`cpf_prof`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_contato`
--

LOCK TABLES `professor_contato` WRITE;
/*!40000 ALTER TABLE `professor_contato` DISABLE KEYS */;
INSERT INTO `professor_contato` VALUES ('1660267005','31972165984'),('51641436080','37998763145'),('61099330096','37991458673'),('71361109040','31971584017'),('91080070071','35975423684');
/*!40000 ALTER TABLE `professor_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_disciplina`
--

DROP TABLE IF EXISTS `professor_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor_disciplina` (
  `cpf_prof` varchar(11) NOT NULL,
  `nome_disc` varchar(100) NOT NULL,
  PRIMARY KEY (`cpf_prof`,`nome_disc`),
  KEY `nome_disc` (`nome_disc`),
  CONSTRAINT `professor_disciplina_ibfk_1` FOREIGN KEY (`cpf_prof`) REFERENCES `professor` (`cpf_prof`),
  CONSTRAINT `professor_disciplina_ibfk_2` FOREIGN KEY (`nome_disc`) REFERENCES `disciplina` (`nome_disc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_disciplina`
--

LOCK TABLES `professor_disciplina` WRITE;
/*!40000 ALTER TABLE `professor_disciplina` DISABLE KEYS */;
INSERT INTO `professor_disciplina` VALUES ('1660267005','Algebra'),('91080070071','Educação Fisica'),('51641436080','Geografia'),('71361109040','Matematica'),('61099330096','Portugues');
/*!40000 ALTER TABLE `professor_disciplina` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05 11:14:01
