-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 08, 2024 at 01:19 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eduportail`
--

-- --------------------------------------------------------

--
-- Table structure for table `alertes`
--

DROP TABLE IF EXISTS `alertes`;
CREATE TABLE IF NOT EXISTS `alertes` (
  `idAlerte` int NOT NULL AUTO_INCREMENT,
  `nomAlerte` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`idAlerte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `alertes`
--

INSERT INTO `alertes` (`idAlerte`, `nomAlerte`) VALUES
(1, 'Application'),
(2, 'Courriel');

-- --------------------------------------------------------

--
-- Table structure for table `alertes_etudiants`
--

DROP TABLE IF EXISTS `alertes_etudiants`;
CREATE TABLE IF NOT EXISTS `alertes_etudiants` (
  `Alertes_idAlerte` int NOT NULL AUTO_INCREMENT,
  `Etudiants_matricule` int NOT NULL,
  `alertesAppliActif` tinyint DEFAULT NULL,
  `alertesCourrielActif` tinyint DEFAULT NULL,
  PRIMARY KEY (`Alertes_idAlerte`,`Etudiants_matricule`),
  UNIQUE KEY `Alertes_idAlerte_UNIQUE` (`Alertes_idAlerte`),
  UNIQUE KEY `Etudiants_matricule_UNIQUE` (`Etudiants_matricule`),
  KEY `fk_Etudiants_has_Alertes_Alertes1_idx` (`Alertes_idAlerte`),
  KEY `fk_Etudiants_has_Alertes_Etudiants1_idx` (`Etudiants_matricule`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `alertes_etudiants`
--

INSERT INTO `alertes_etudiants` (`Alertes_idAlerte`, `Etudiants_matricule`, `alertesAppliActif`, `alertesCourrielActif`) VALUES
(1, 2051798, 1, 1),
(2, 2064823, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `idCampus` int NOT NULL AUTO_INCREMENT,
  `villeCampus` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `codeVilleCampus` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`idCampus`),
  UNIQUE KEY `idCampus_UNIQUE` (`idCampus`),
  UNIQUE KEY `codeVille_UNIQUE` (`codeVilleCampus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `campus`
--

INSERT INTO `campus` (`idCampus`, `villeCampus`, `codeVilleCampus`) VALUES
(1, 'Bathurst', 'BA'),
(2, 'Campbellton', 'CA'),
(3, 'Dieppe', 'DI'),
(4, 'Edmundston', 'ED'),
(5, 'Péninsule Acadienne', 'PA');

-- --------------------------------------------------------

--
-- Table structure for table `campus_programmes`
--

DROP TABLE IF EXISTS `campus_programmes`;
CREATE TABLE IF NOT EXISTS `campus_programmes` (
  `Campus_idCampus` int NOT NULL,
  `Programmes_idProgramme` int NOT NULL,
  PRIMARY KEY (`Campus_idCampus`,`Programmes_idProgramme`),
  KEY `fk_Campus_has_Programmes_Programmes1_idx` (`Programmes_idProgramme`),
  KEY `fk_Campus_has_Programmes_Campus1_idx` (`Campus_idCampus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `campus_programmes`
--

INSERT INTO `campus_programmes` (`Campus_idCampus`, `Programmes_idProgramme`) VALUES
(1, 1),
(3, 2),
(5, 3),
(3, 4),
(4, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 8),
(5, 9),
(3, 10),
(5, 11),
(4, 12),
(5, 12),
(2, 13),
(3, 13),
(3, 14),
(3, 15),
(4, 15),
(5, 15),
(1, 16),
(3, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(3, 21),
(4, 21),
(4, 22),
(2, 23),
(3, 24),
(4, 24),
(5, 24),
(1, 25),
(3, 25),
(3, 26),
(1, 27),
(2, 27),
(3, 27),
(4, 27),
(5, 27),
(1, 28),
(2, 28),
(3, 28),
(4, 28),
(5, 28),
(3, 29),
(4, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(4, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(4, 44),
(5, 44),
(1, 45),
(1, 46),
(2, 47),
(3, 47),
(5, 47),
(2, 48),
(3, 49),
(1, 50),
(3, 51),
(1, 52),
(5, 53),
(1, 54),
(1, 55),
(2, 56),
(3, 56),
(3, 57),
(4, 57),
(3, 58),
(2, 59),
(2, 60),
(4, 61),
(3, 62),
(1, 63),
(1, 64),
(2, 64),
(3, 64),
(4, 64),
(5, 64),
(2, 65),
(1, 66),
(2, 66),
(3, 66),
(4, 66),
(5, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(3, 71);

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `sigle` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `titreCours` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `descriptionCours` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sigle`),
  UNIQUE KEY `sigle_UNIQUE` (`sigle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`sigle`, `titreCours`, `descriptionCours`) VALUES
('BMGE 1011', 'Principes de gestion', NULL),
('BMGE 1072', 'Introduction aux affaires', NULL),
('COMM 1251', 'Rédaction professionnelle I', NULL),
('COMM 1252', 'Rédaction professionnelle II', NULL),
('COMM 1254', 'Rédaction professionnelle III', NULL),
('DATA 1023', 'Conception de bases de données relationnelles', 'Ce cours permettra à l\'étudiant de planifier et d\'évaluer la conception et le fonctionnement d\'une base de\r\ndonnées relationnelle.'),
('DATA 1052', 'Programmation SQL', NULL),
('DATA 1053', 'Prog procédurale bd', NULL),
('DATA 1054', 'Système de gestion de base de données', 'Ce cours permettra à l\'étudiant d’acquérir les compétences essentielles pour créer et manipuler une\r\nbase de données relationnelle avec le système de gestion de base de données Microsoft Access.'),
('ECCE 1022', 'Commerce électronique', NULL),
('ECON 1013', 'Économie globale', NULL),
('ETHI 1039', 'Étique des affaires', NULL),
('FINA 1038', 'Finance I', NULL),
('FINA 1041', 'Impôt des particuliers', NULL),
('FINA 1042', 'Finance II', NULL),
('GACG 1081', 'Comptabilité financière II', NULL),
('GACG 1087', 'Comptabilité de gestion I', NULL),
('GACG 1089', 'Comptabilité de gestion II', NULL),
('GACG 1110', 'Comptabilité financière des sociétés ', NULL),
('LEGL 1014', 'Introduction au droit des affaires', NULL),
('MATH 1164', 'Mathématiques financières', NULL),
('MATH 1277', 'Mathématiques appliquées à l\'informatique', 'Ce cours permettra à l’étudiant de se servir des\r\nmathématiques appliquées pour la résolution des\r\nproblèmes liés au domaine de l’informatique.'),
('MKTG 1013', 'Introduction au marketing', NULL),
('NCRC 1170', 'Concepts de réseautique', 'Ce cours permettra à l’étudiant de découvrir les systèmes d’exploitation Windows dans un\r\nenvironnement réseau.'),
('ORGA 1038', 'Comportement organisationnel', NULL),
('PROG 1206', 'Programmation orientée objet', NULL),
('PROG 1232', 'Programmation structurée I', 'Ce cours permettra à l\'étudiant d\'acquérir les notions de base de la programmation structurée.'),
('PROG 1233', 'Programmation structurée II', 'Ce cours permettra à l\'étudiant d\'approfondir des notions liées à la programmation structurée.'),
('PROG 1234', 'Structures de données et algorithmes ', 'Ce cours permettra à l\'étudiant d’approfondir ses compétences dans l’utilisation et le codage des\r\nstructures de données.'),
('PROG 1235', 'Programmation Windows Forms avancée sous .NET', 'Ce cours permettra à l\'étudiant de créer des applications client de niveaux intermédiaires pour la\r\nplateforme de formulaires Windows sous .Net en approfondissant la programmation orientée objet et la'),
('PROG 1236', 'Prog applications multicouches', NULL),
('PROG 1239', 'Programmation Windows Forms sous .NET', 'Ce cours permettra à l’étudiant de créer des applications clientes pour la plate-forme de formulaires\r\nWindows avec le .Net Framework et de se familiariser à la programmation orientée objet.'),
('PROG 1294', 'Programmation Java et développement d\'applications mobiles s', NULL),
('PROG 1296', 'Développement d\'applications mobiles sous iOS d\'Apple', NULL),
('PROG 1297', 'Programmation Web PHP et Ajax', 'Ce cours permettra à l\'étudiant d\'acquérir des connaissances relatives au langage PHP ainsi qu\'aux\ntechnologies associées à Ajax.'),
('PROG 1300', 'Programmation Web côté serveur avec logiciels libres', NULL),
('PROG 1301', 'Projet de développement d\'applications informatiques', NULL),
('PROG 1338', 'Outils complémentaires à la programmation', 'Ce cours permettra à l\'étudiant de développer l\'expertise nécessaire pour utiliser divers outils\r\ncomplémentaires à la programmation.'),
('PROG 1339', 'Développement Web avec HTML et CSS', 'Ce cours permettra à l\'étudiant d\'appliquer les éléments essentiels du développement efficace de sites\r\nWeb à l\'aide du HTML et du CSS.'),
('PROG 1340', 'Dév Web avancée JavaScript HTML5', NULL),
('PROG 1341', 'Prog ADO.Net et ASP.Net', NULL),
('PROG 1342', 'Développement d\'applications mobiles multiplateformes ', 'Ce cours permettra à l\'étudiant de développer des applications mobiles multiplateformes.'),
('PROJ 1035', 'Introduction à la gestion de projets', NULL),
('SAAL 1540', 'Comptabilité informatisée I', NULL),
('SAAL 1593', 'Chiffrier électronique II', NULL),
('SAVT 1003', 'Introduction à la vente', NULL),
('SECU 1348', 'Travail Sécuritaire', NULL),
('STAT 1023', 'Statistiques descriptives', NULL),
('SYST 1036', 'Analyse système information I', NULL),
('SYST 1037', 'Analyse de système d\'information II', 'Ce cours permettra à l\'étudiant de réaliser diverses activités du cycle de vie du développement d\'un\r\nsystème par l\'approche orientée objet.');

-- --------------------------------------------------------

--
-- Table structure for table `cours_livres`
--

DROP TABLE IF EXISTS `cours_livres`;
CREATE TABLE IF NOT EXISTS `cours_livres` (
  `idCours_Livre` int NOT NULL AUTO_INCREMENT,
  `Sessions_sessionID` int NOT NULL,
  `Enseignants_idEnseignant` int NOT NULL,
  `Cours_sigle` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`idCours_Livre`),
  UNIQUE KEY `idCours_Livre_UNIQUE` (`idCours_Livre`),
  KEY `fk_Cours_has_Session_Session1_idx` (`Sessions_sessionID`),
  KEY `fk_Cours_has_Session_Enseignant1_idx` (`Enseignants_idEnseignant`),
  KEY `fk_Cours_Livres_Cours1_idx` (`Cours_sigle`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `cours_livres`
--

INSERT INTO `cours_livres` (`idCours_Livre`, `Sessions_sessionID`, `Enseignants_idEnseignant`, `Cours_sigle`) VALUES
(1, 1, 4642218, 'NCRC 1170'),
(2, 4, 1757433, 'COMM 1252'),
(3, 4, 7649643, 'ETHI 1039'),
(4, 6, 3584391, 'PROG 1297'),
(5, 1, 5683365, 'PROG 1297'),
(6, 6, 5683365, 'PROG 1301'),
(7, 6, 3864412, 'PROG 1342');

-- --------------------------------------------------------

--
-- Table structure for table `enseignants`
--

DROP TABLE IF EXISTS `enseignants`;
CREATE TABLE IF NOT EXISTS `enseignants` (
  `idEnseignant` int NOT NULL,
  `prenom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `courriel` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `telephone` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`idEnseignant`),
  UNIQUE KEY `idEnseignant_UNIQUE` (`idEnseignant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `enseignants`
--

INSERT INTO `enseignants` (`idEnseignant`, `prenom`, `nom`, `courriel`, `telephone`) VALUES
(1757433, 'Katleen', 'Leclair-Doucet', 'katleen.leclair-doucet@ccnb.ca', '506-385-3345'),
(2648165, 'Michel', 'Tremblay', 'michel.tremblay@ccnb.ca', '506-647-2798'),
(3567881, 'Serge', 'Vienneau', 'serge.vienneau@ccnb.ca', '506-392-1345'),
(3584391, 'Joel', 'Boudreau', 'joel.boudreau@ccnb.ca', '506-956-7865'),
(3864412, 'Paul', 'Wouatcha', 'paul.wouatcha@ccnb.ca', '506-874-9624'),
(4552155, 'Michelle ', 'Comeau', 'michelle.comeau@ccnb.ca', '506-391-9844'),
(4553337, 'Ghislain', 'Duguay', 'ghislain.duguay@ccnb.ca', '506-395-8555'),
(4642218, 'Michel', 'Robichaud', 'michel.robichaud@ccnb.ca', '506-353-3422'),
(4957274, 'Aline ', 'Morrison', 'aline.morrison@ccnb.ca', '506-385-4859'),
(5683365, 'David', 'Roy', 'david.roy@ccnb.ca', '506-428-5984'),
(6282471, 'Donald ', 'Aubé', 'donald.aube@ccnb.ca', '506-381-4851'),
(7649643, 'Yvette', 'Bérubé', 'yvette.berube@ccnb.ca', '506-482-3852');

-- --------------------------------------------------------

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE IF NOT EXISTS `etudiants` (
  `matricule` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nomUtilisateur` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `courrielEtudiant` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `motDePasse` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dateInscriptionProgramme` date NOT NULL,
  `photoProfil` blob,
  `Campus_Programmes_Campus_idCampus` int NOT NULL,
  `Campus_Programmes_Programmes_idProgramme` int NOT NULL,
  PRIMARY KEY (`matricule`),
  UNIQUE KEY `matricule_UNIQUE` (`matricule`),
  UNIQUE KEY `nomUtilisateur_UNIQUE` (`nomUtilisateur`),
  UNIQUE KEY `courrielEtudiant_UNIQUE` (`courrielEtudiant`),
  KEY `fk_Etudiants_Campus_Programmes1_idx` (`Campus_Programmes_Campus_idCampus`,`Campus_Programmes_Programmes_idProgramme`)
) ENGINE=InnoDB AUTO_INCREMENT=2064824 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `etudiants`
--

INSERT INTO `etudiants` (`matricule`, `prenom`, `nom`, `nomUtilisateur`, `courrielEtudiant`, `motDePasse`, `dateInscriptionProgramme`, `photoProfil`, `Campus_Programmes_Campus_idCampus`, `Campus_Programmes_Programmes_idProgramme`) VALUES
(2051798, 'Alexandre', 'Roy', 'earoy06', 'earoy06@monccnb.ca', 'Pass!Wsej78$', '2022-05-18', 0xffd8ffe000104a46494600010101004800480000ffdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc000110801fd01fd03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fd08a43f7452d21fba2b23a05a28a2800c7b5141c51fc3d2800a285ed83cd14008ddbb7b51fc3d71cd2d14009cd2d369de9f4a00291a9690fd6800e692979a0f514007348dd28a1beef5a00169295686feb400a3ee9a637dd34f1f74d35ba50034038a7520e839a5a00649f332f19a23fca87c64738a48fbf7a00753077e94ef5e2a218e7f759a4c07b76a0f6eb4de33c26d34ff00c6920124fbbf8d310707814e6e9d29ab8da78348078e828a4fe1fc297f84735403b9a43d2946691bb714c05fe2a31c0e28141c5002d1fc3f8d145001de9077a5a2800a07fac3cf6a28fe23400a7a5267de83da8a0053da8cd0df7685fba7e940083fa5140e838a3d6801add697f8a90f5f4a77af340094639e942fdda45c734000348df7853b9a69ef40098e7a52b7de149e9437514008dd6979a46eb4bcd0311bb52b51cd0dd28188dd3bd357bd2d20ef4091728a28a041483bd2d1400bcd21fad14500283918349b48e474a39c1a17a500145145001437f4a519079e9484d00149814b45002628db4b49c7340073475e285e28dd40073498cf34bcd0dd28013d6936eea2971c66801bc05a0b62aa5e6a505b3307624e3eea29627b76ae72fbc630db31fb4ce966d82fe548712edc7de23b0a9ba4528b6754653b8719039c9acbbaf12d9e9e1da59b90db7646a5dbf002be69f883fb5668f6377245a7b598b355756d56f8b1467c7dd862dc0ccdefd2be53f1a7ed65e2abe867b4b2d626b582566df2ed0aeea7b632703d8564ea6ba1b2a7d647e8fea9f16348d3c3bcb3c36b0c6e51dee241b86067851cfe75850fed05e1692d8ca356b7d809dde632c38f7c33722bf2d756f893aef8d5c4d79ac6a33ccabe503e66222be9c60fe8735911efb5632dd3db42dd9b00926a79d94a313f5a749fda23c01ab5d25bc7e2dd29e76e020b94033dc57636fe36d02ed50c3abe9f26efb863b98c83f4e6bf18df5bb0f2cfda2ee76e79f254293f9e78a21f1959e9f70af669751489f764f37e6a7cf2ec1c90ee7ed45beb167792b470dd472b1e422b03fcaae6eda98ef9c57e36693fb40f88743b8867b1bcb9b778df7a169030cfd08af4ef0cfededf107459a36b9bd4d42dd5f73c5345c1f6c8a7ccfaa23923d19fa8ff00c38a322be35f873ff0514d0754682dfc51a54fa5b4876bdc5b9f3215f4257a8afa6bc23f163c27e3e8924d0fc49a7ea04af31c4f8907d54d69cc8cdc19d8f4a396a6c6a14f27713fc79a70c6eab2005389a633859304f18a78e94006ecd19f968db47f0f5a0014fcc78a5a28a00290fdefc2968e38e28014fdd148bf7a9d4def400adda928eb4a45003734abfd28cd23602d0001370ce68f5a5539a4fba2801168cf14bcb2d22f4c5000b48c39a5385a4a00466db4adf741a5fe1a31d680199dd4ad4291449f35050da56ce285f9569776e5a042119514ddb4e1da8a07a96a9dcd35874a282408e697f8a834940051834ee69b400514a7b507b50023514b9349de800a3bf4a28a004c83467b52d14001c50a290f240a5e6800a4fe1a3752f6a003ae293f88d1d45237ddcfa5002799b7802b1f5cd7edf458ff007d3247249ca8909c01dc9eff009558d63588f49b3f31bf78e7e548d4fccec47dd1ea7f9579e6b1a83f87ec5bc4dafc62e7557245969d1b02117fd9ddd5c8e589e00e9512958d231b94fc59e3d8742d265d4ef6ea2d2ad1559a36be3b269980ea509c81e9d2be1bf897fb485d78822f32cdfcc82e0879a1bc8b1b8ab1da66c83b87758c1da3bd37f688f1f6a1f113c53b05c3cda2d9cd28b7dcc07992f05e4723828a7205781b5a4fe32d7059594a4daa9324f79370aa01f99893fa0ae6e6e6675f2f221da86bdaefc42f114d7193737b2ffad94280a8bd80038500761d29b73a5e97a0ae6597fb42eff8b8f941f4ad98fcbbe3fd8da1c86d74a5ff005b70dc35c30fe263fd29cda7e9dba2b5b5633cac36f998cba8ee47602aee65b9c8df6a179709bd6316b12f03d7158b348dbbe6937fb9ef5d96b7a7d8dbb4824919114e22b788ef965ff69dba015cd5ddec6926d8625541c0455dcdff00023571b74319dfab3259cf555247427a530b3f4018d5c669a693002c20f526a65d3f76585ec600e7943f95686566508e29fef08646ff00809352c76d73265952507be2338fa56b5a69f2dbc994d516ddba86427f0fa56f5b69f797dff1f3e231b18ee7de76fcdeb9cf352e563450b9cddae8f79710e220e64ed194c7fe3c7f956a787bc5777e1bbc11cd14a9b5b0c1188dbee0fa8aef347d0fca5b68a2f135bc8266cab4d2ac6898f72d9aabe26b49b4b8ae2cd2e2c352498e1dada4136ef43b979acf9b9b468db939354cfa03e15fed3fe21f0be8f0ae9fabb6b7a72722cb53c190faaa38feb5eb10fedf5630a103c1fa9dcc863dd8b760ff00363907d81afcf55b83a3b0f3e29208dbaf0cb9f439ad3b4f1949243279f26cb94e04b1e43303fc5b8743fcea6d25b334e684b75a9fa2de0dfdb83c0dabc3136b3a87fc23f7f2360c77f1b6d8fd0657fad7b77857e2c785bc58b03e9be23d36f44aa591a0b95395fa1e47d2bf226d7c53f6c68e3d40c7abdaf40d704f9a83a6036455cd5bc1fa2343fda1e1fd4bec13af2f6ae8db837fb2e29a9b5b90e0a5b1fb3315dc3360a4a8dfeeb54abf37bd7e3af83be3ef8f7e1e5f5aedf106a2614381894edd99c630d956fcb35f747eceff00b64699f11a64d1fc41731db6b2b182b2ca5545c91d718eb5aa9f4664e1d8fa8d46dcd1d85456f3472ed68dfcc461956f51d8d4adcf35a1905148aded4ef5a003a8a1b03a0e685ef40ce680179c52673c51ba8c9f4a004e94adf32d1fc34991400d0b8ef4bda9691b1d475140029e28c0a170573464500230cf148dda94f5148dda800a56fbb8a1475a4fbdc500200283cf146d14605002d20ef413c522e6800c1a438a5c72695bb50059a5cd273814741cd0014b9349f7a8a005cd252eda4a0053d68fc714945001fad18a297140083ef0fa5283ebd2928a005ef4deb4b42f34005145266800e681d6968e076a004c532e3ee024e141cb7d29fcd657882729a7dc10db422e49f7a4c68c4bcba825924d4eee4586c62dc11dcf091afde6c7a9e07e35f187ed0df146efc79e289b4f5dd682de278f6efc7d92272303da47039cf41c57ae7ed2df175bc2f7fa6f84b463e76a5f65699e28c12d1827e563ed904ffc06be1ff13f896e34dd2b52b8f3fed77575712c867c60b74546e79e5c9ae3a92bfba8efa71e55ccce67e2278a26d5bcbd334e1e55b656d8aa0c6e51f7547b71cfbd4daac29e13f86367022a8bed5cb485875f2870bf813cd616830799637b3cbf34d67132c60f72c0e4d55f885a9198dadbc6fba286010a37b05008fd29c63b44894b7998d6faa4f3b416160ac6799b6ee1d4fa018f6aed74ed36cf419becf77234f738647319ce5c0240ff00beb1f2d60f8074f3a5e8fa8f89e540cf6ec2decd5c70656232df856a7826e20fed8fb55e959bec29f6c70dc1639cff00df593c7bb1ad27e4654ba37d49b58f0ecf7112b25b345248ff0025bffcb56f527d16b99d4b4696cb2b23282bc9553851fe35d96ade3a5874fbad427914ea17cc4470e381183d01ede9f85727a15c5cf8a75c3bfe6eb2ccecb955403a9f403b5285f72aa72dec8c6b7d2afb5295c5ac123955ddf2a9271ebec2ab49a55dc6c439da41c10589c57a75b6b89b66b4b499b4cd2d434773751f0663823181c926ae2eafa5ae9e9bb4f488b8096f6c504934bce3249ce0d573f911ec93ea7930b7fb360bbff3ad7d3759b0b5dbf6a88ccbf4aecb52f04de461e4bc36f6773fc50b1123a0c74623807dab075af02dec11999206914f3b8291c7af1c629a9a7b93ecdc7625baf15685756e618f4ed9fed003f5aa16faac5672c52e9cb6f0cdb81cf97d4fad605c69f35b315922c0ce339c5316e0db860afb4742036453b22799dcd8f10788b55d4a522fae3fb4553d47c887afca0564dbc31de3346b0bc121e8b1e5949fc7fa54b6f75129daabb8b0e369ae96db529ad2348c2a05c65884231f56a2f65a028f33bb668f85fe1d0bc9229ef5700b7faa5049fcb3cfa5759e2f84e93a6c5a7699a11b359180ff00478249e661efb7217f1aceb0f18fd966b696591cb6146e8e705801c636ff0008fad7a0786bc756b676a0442e2de5998654019707a0231ce3ae40fc6b99b96ed1db18c2d64cf2e8f468e6b755bd8555483b95a2903c7f8918cfae2b0b56d3174cba59f49d416ed2260ca6073e6c6ddcf6e2bd1bc7d67adebaced6f6bfd9fa7ede55930653d7e6ff00f5d71ba4f866f2d74e12de249696d2b36cb85601d7b161cf4edef57197566728eb647d49fb287edc43c236f69e16f88134971a76f096bac8e5e00780920eebe86bf422cef2db52b38aead678ee2d6650f1cd11cab2919047b115f8892ff6769b711c31405e365ca5c67eff003cf1ebe95f577ec93fb484ff0008decfc3be23bb92efc0f7f26db5be906e3a748c76a06ffa64e78f635ac668c9c1b5747e89601a438c6295241222c8a432b0dc181c820fbd1eb5b180e5f97f2a4cfcb4671437ad0007b52f347f00a4a007734dead4528e79a001aa3e771a91a9a3bd0019c5270c4d2b511f39a004e16909a57e0e290e781400b9f97a53714b8e69db6801b4dfe2a7fad25001c526706949a6f7a003f8a9589e281de92802d8fbb49477cd140051452e4d0019f6a3346da38a004a297f0a30680128a53d29280133ed4b40e28a005c0a4a28a00391451476eb40013451d334d66dd400878ddc7239ae4fe21eae9a4f84750b864667f2c954c6e2c7049fc2ba6ba6f2e12ca0922b9bf145a1bed3e1c9df856cc6a79fba474f5a895cb8eeae7e7efc42ba6d7eff0057f1a35e35d4b7f77716f12ba9ca22bf949b5b3f2ae11b03d5ebe78fb449ad5c25a39c9cb9c1edb70d8fd2bddfe2178822f0af8735ef044cf02c4d70d736b26df9d559d64543fdd60ca41f7af9d749befb2f8b2dae07103b92db463b106b912dda3b652d8d3f0c82b06af6aa14932296cf5002935ce78aae06a135db8f9595cbc6a7fba7a8fd6bd0b54d0cf87fc48ff30363a8224b04e87e46db8201fcff00f1eae27c5da69d37545b980abc1f2ed6c741db3570926c8a916a363a5982c7e017d391d645b19a19085183d72e7dfad73571a83e96dac592b285b968e372173f2af38f6aedbec5f68d2ed352b651258dec220bb8978db281c7cc78f9c1e3b03c1e6b8fd73479a383ed250b188e2427ab2838e7dc528bd6c3945d93393f115c192f38f96348c2a8f418049ad2d12f65d2f47748ce1ee89dfea7038fd2b3355b769087077201847f61d2a5b09c7d9c13f7d011f9d74fd938f5e6216d42496789377ee62e98e84fad695beb914523193714e8cf1e3cc7ff006431fba9f4ac1f25b73051d38a746a4850c318e3eb4ec885267a268de31769202b676b61656c772f931fef246edb98e58f3577c69e25bd6b80dab6afbf5099483656f9c20241c10bdeb8cf0e422deead9da2deca85dbd8f6acd92ec7dbde577691d9b04a8e42f600d65cab98e87525cba935d0da4ee91a02a30164ea73dab2a4cac9d33f5aedfc336969a948e675211496091e360ff789e4d3f5cf059657b9b4b36d8a33b548007bd5f324ec65c9292b9cde9f6d6cd2446e51a00dc876240fd01ada487cc654b1bd5b84638d81c6e1f991818f6cd7333584b1c9966c374cb723e9533690f70b198f6c73e39e720ff851f3126d743b98d6da39e10d6b796b1ede6486491413ed941f964fd6b6acedf4f8ae16e61d46fae6e14e446e8427b7cf5e56d71a9592f93f689c2af3e52b363eb8ef4d9bc4da8cb0885ae64110fe1e99fc2a5c1b348d551dd1ed53f88adf54531eb3afda3346df259c11e40ff78a8249ac9d5ae2e3c46a2dd2f6cadec22f9b74b88f381d79f98fe55e40d7f23370ec0d5dd3d66bd95409181242f039fc3fc697b3b6a57b7e6d2c6ebd9c6d73218ee0dc411b64fca5467db35d968ba94571a1cfa6dfc0f6e970db239382ac1b82a4775c8cf1df9a3c17e0b1ad42cf3986d6da2fbd73336d8e15ee3d598d5af13f847edca973a63f9b6f0a9685436ddc7a038fa564da93b1b46328ab9f7b7ec47f1b26f1af85ef3c17ad5cb4faff0087311c570cd93716a4e226cf72a0004d7d3fd38afc68f85ff1135af85de30d3b5fd3ff00d135bd35f063b8fb975093f34647704722bf58be10fc56d23e31f826d3c43a3c98571e5dc5bb3664b7940f9a36fa1cf3deb78be8ce79c7aa3b5c0e28da69b9191818f614a72056a641487ee8a3753a80129738a28ebc50021cd0b4a4521233400b47dda00c8cd371f3500359b7353b14301482800a5e686c0a519c0a004e2933834bc9a46ef4008beb4a07cdc75a50bc0a4a004c9f4a36d03bd235005bfbc0d1fc34945000c0503b5079e7d281cd003b2693d69297b1a00326979a6d1400ee69b463147e34005145140051498146d1400a71480f14bda8a004db4d6ee33818a5765da4938af9bff690fda72d3e1b2cfe1ff0f7957be29947cd249831da29eedefe82a252e55a9518f33b23d23e297c6ef0d7c2ed2de4d5b528a09d8158e251bddcfb2f5cf6f415f0efc66fdaf35ef124660d30c9a658392e934927efc8ec06cc6063d6bc8fc65e21d7bc59ab4b7baade49a8de382d24d3e488b9ce31d8fb76ac393c1baaea5009ee23f22d557fe3e2e48476c720aad73b9ddeacec50e55a21da96356877ca649e4b8db3c1331dde667ef29efbab89b8b59b48d623f311d63241ce3e57523ef0cf7aea6df588743b3fecfbada561264864625f6927a7b03d6a3bcd4daf82a266e84d86f2a7c143ee3fc6a57bbe8371e6b2ea743e1cd4adefb429348bd8fcd97aac7292a4af3f70ff000b2f504718a6b784935885ed124297716e50d20081867eebaf4cfd2ba8f0df802eef34f80cba7155603cb915cb98cffb38e0fb8af4ff000a7c209afda5964b85cae4b8b788c6e07baeee6bce9e2145e87ab4f0aea4753c674386f7c3da1dd693a858bc71b0cc32467720e724e3d3dfa5739fe95b5a25114fb86c69a4527e53c00cbdcfa1afb22d3f67bb4f1142f0c7b1e155c2bc80c641ef8c8353e89fb28e976f319e40c9b4f1f3023f11deb35887bd8d65855b5cf88f54f02c90c314b0c3ba19be62a01251bbf3e958a3c17716b711aca8d08237648e08afd14b5f815a2d9cf21b98e19a3738510e515b1d091d987a8ebdeb4a6f84be1fbc86ded6fad23bdb78c965620091727d455ac6496843cbe2f53f38edfe1cdfdc286f2f09264a4807a76f6ae8fc3ff05f55d52658869f3197ac6c572addebef95f83fe196ba2cb67e50ce0b29e48f73dcd6edb784b47d06cd20b289962881032d9c5296326d5d170cbe17d4fcfaf147c23d4fc32b2dd48bcbc3bda355e5083823f0af20bcd26581a47f2d82a11ce2bf41fe23595bdc4cc972a0c2c7215877c75af9e7c4bf0e6c3ed4f35b4998a47c3c4c7bfb54d0c7eb69862b2cb24e078859ead278774d89c4437ccc59663c9c0e70074fcebb1f0ffc425bad264b06d3a51196cbddb306e4fa8007f3a67883e1c8b192365e4336cc7a376ac14d3f5bd16e95a0b992275e5771e081ec6bd48d4a7515ee78d2a3568bdb42b6b56b25bdc34a22431750cbf2823ebfd2a7d1efb4db86559bfd1dba10c48fc41e9f8576ba678badbc5763f61d76d1a4bd1c35cc0a32481c12a2b83f1068296b70d25a3c82307099cafe956a4a5a333945c7de8ea75afe1b4ba5592297ce57e518c60af4e995ef5c8ea9e173265dad5ed24df8076601fa8feb5916b797f61ca5d5c469fde8a52a47e5572e3c4daf490aeed6350b8850614fda98edfccd6918c9753294a12dd043e1031c6659c9f2d4ed329056353f53c9fc2aeff68693a5c8046af791606e8a3cc6bbb1c127b8ae7a7bdb8b86df35c34ec4fde98ee3f9d46bf7b3e69ddfec8ce6b4b5f731524b647591f8ab56d71a1b6333416ca30b6f6ea117e873d6bd63c15e30bdf0bd9a1bd8e186d1f03f790238da396763b4f38af0386470e182b16fad6b69bac3412207856e5b382b2b65473d2b3945743685477d59e83f103c5da46b17cd2e9168b3c8c36b479652c739cede83f0aee3f669f8dda8fc1cf18c3a88766d26e008b54d3c3732a671bc7ab28c1fa5713a7dfe9ba9432cf791c7039c2c7a7e9aa22c8c6312cc7a0cff0008eb587a87876eb4fdba93c8b1b3b2f910c2bb464ff714f247b9e6b3ba46dab3f68746d62db5fd2ed751b2944d697310962907f1291907f235707de38e95f13fec41f1f238658fe1fead3e3cd0d35848fc2abeef9e107d00e40afb5ff0c57445f3239651e57617f8a9734bc900d15640abc734d52371a7645371f35002ab734d24e4d38fcb8a24f9a8005e299b79e7a538f6141e4d0028ef4ca5f6a369a003068348dc7140ed400bc8c5237decd2b74a46ce2800a09e940e691b140063da929d49b6802d1ed46681de9326801739ebd2979a434a0d00264d27d3ad145002e4d25388a402800c7cb49c5141cd000719a28145001452734374a004a752735c17c6bf8a563f08fc0b7dacdd489f69da63b58dbf8e42381f8526edab2a29c9d91e79fb527ed10bf09743974dd25965f10dd0daa76ee16e1b8048eec47415f13f853c3d77e20bc9754d6a4779ee1da46fb4a966573d5bdd8fe95492e351f8a1e2e9fc4dadcf2cad2c864479093b9fbb8ff654703daba5d47c55a7e9fa3c973757c34fd261cc76eebff1f37a4751129e80f76af3ea4db7647a74a9a8abb2deadaa7877c37f30b449aed5091681048e1bd093dfd6bc63e207c42bdf115d1b3b7876393858635c11ebf4c554d6fc6177e24d49a1d2e0fecb8d970230dcac6392647fe78edc5357459341d27ed1e62c515e2e44ae3634a83bf39214feb4a31b6b209d4e7d21b1c35e594b0856b99b7ca7a469d2bb3f87ba4a48c2596369909f9625c1f9b3d7935c9cd1bdf5f0dc5b2cc3031ce3fa7d2be9afd9f7c0f15c5ec33cd6d9700791118f72e7bb1269626a72c0784a3cf50f62f847f0aee8e970dcceed6d248015853686e47538e95ef5a17822d345b45cae6e7681f68503278f5ef52784f43fb2da073b77a85f9523dabf9fad7473c33dc4c5f1841f7545793187da67bd2a96f723d0cb6b35b5881dceec39c924d67de4ee581ddedf8574935a6e4fde74ac7b9b30cc70a001d0d4d48bb591746516eece7ae54b2828466b16ea19e2937c6727a919ae8f504f2d4808012719acf8e3dac7e6c76da7f9d70b8ea7a717a5cce8efe665058796de9d8d4573712491b146038f980e957eea155258f3c63e5ac9908560df363247cdc5652bad19bc6cf5479ff8b23fb646548607d4f4af2bd7345786466c863d8e302be86d4b4b5bb643b5589eb5c8eb1e15494cabc0c1a84eccb9c5491f31ea96d34b26deeadc8359d22ec545b88ccb08ce41e76e7bd7b6eabe065964650b18390c5bb9f4ae6358f87ed0b17037c6e32d804edaef8554793530eef73c3758b110dc6e857316731396e0fb06fe16f63f853ece6b7bed3a6b69a569ef243bd1d1c31e3aab86e438ea38fc6ba7f147836e2067299657f4e8df515e5daa68b716d213b195a3390474af6a8d4535b9e06229ba6ef615ac45ddc30b539933b7667073dc54377a735afdf8d91d782587e991fd6abb5e35f5e44d2f976f7006c1201b4363a16c7535d959f881f53d26dbcf8614beb7257cc800c4c3a83ef81d6bb1c9c753cd8c63276382bab2130dd1a963d4ae727f4ed59ad1856c0ce457a135e787ef2474d5348bab572d8379a6907e6ff691b1c7d2acc7f0f6cbc416c0e91ad417f2ae17ecf7398261c7401979fceb48d5ee632a0efeebb9e731fceac37b061ef53dba96fba598e6ba1d4bc0fa868324a975a75c4607ca582e47e0463359b696f6fbf3f6865c75511f23dbad5f3a6b433e49276674de10b32d731334124cca7713b7e54f7c9aed3c44d169764b246caf7390c6eae012ec08c054c745073cf7ae73c3b7567a76d95dae2e5319c00c07f2ae8eeac478921f2ac644b5761cc924724ef8fee80a8d8fd2b9a4f5d4ee8ab46c723a7ebffd99a9437963732da4d6f209629233864909cee1fed03cfd0d7e94fecb5fb56587c5cb183c39aecd15af8d2da1072bc47a84600fdec7e8dfde1db35f9c77fe135d3665b4bdd46e256200e6d4838cf182d8fcc8a6e89ab5e784fc49a7cda7493586a36328b8b3bd0c72ac0e54e7fbac383f5ad232b3d0c6516f73f6a776791d285eb5c07c0bf8ad67f183e1de99afc1246976c822bfb75ff9617000f314fb03935df7e18ae9472b5663987148b4adc8eb4a3e5a62139a5a46fbd4b8c9cd0037f8b8eb4ea6e0714bc6ea004db96cd233734e63ef4d3c50014b9a41cd3b22801b4bd54d25140060526dc9a5a41cd002f6e7af6a3b9cd2337a75a456f5a00b7dfad2714bf8527140051453b9a004cd2f349c7346da005e68e693a51ef4009dcf1452f3498e2800a28a4c8a0051de939a39a4a0049a658237791f6c683731e83bff004afcd5fda73e2b1f8b9f112fd66ba923f05e82c10f9632266ce001fed31181ed5f607ed5df143fe15ffc399ad2d6551ab6adfe896f19386f9b866fc057e7e5ae9ba7dbd9cbacdf4e24f0b68f33790a0e5f53bfe32dee13a571d59eb647750a7a7332c5eddc1e19f0ff00db75788a6a378a1adb4d8d8822323e58ce3803a127db15e4926b47c41aa4f7ba9cc6f1d0805973e544be9eca3b0aafe26f156a3e32d62f24b9dc7cf61fba8dcf20744cfa0f6ae93c2bf0fddb6cda8b086de3024f27a281d7a1effed1a98c5415e5b8e52751f2c3634b491a7eb16d32c701b3f0ec1f25c4e547da75194292a87fba99f4fc6a0f88daced9d26b94c5ded5096ce7e48171c1207b56fda6ada7ea178c2d6d59348d3d3e48e3fbd2c9ea7f99af2ad66f2fbc67af5c306f39539765e1700f5a88fbd2bb3597b90b21de1bb79b58d6a2589962f9bef8e31cf2715fa09fb3e784ac749d3ed117ccb8bf970ccc5780b8ed5f127c3fd2a693544b3b4d8b393b51bbee3debf44fe03f83eeb49d2e396ee4f327daa9bb87e00cfb62b9311efcd23bf09fbba6e4cf60b581218d513a741561a30bbb6fde1d6ac4301c0e7356e3b753c363d6b58c0c65535325addb612ea71fceb3ae2d0b2e5148c93c015d2cd855215723fbde959ec81c37cd9233cd67382d8da9d47b9c85f5bbedcf92d9e739ac611b3487f76b8f7ea2ba9d4e368db8fbc7ae39158971862c99519af2aa46ccf76949b899774be59ce3359b791f98aaca768ee2b6a68fcc3c61bb1fc2a9496e246e9b464b62b99ab9db0958cb9ad8c917cabc62b36e34b66418cb37a56ecf2ed8cb2b7038aacaa54973c827ad65ca9b3652671f7da3f98acec9b5fa1c55197c3a922c6a132d83cff8d77171b767cbebcd42c4ee23a1cf000aae5279ae8f30d7be1f477abf2c79c8c376ae0353f837f68661f67048ff000afa696de1bbb75c47f3a9f9b1c1a5b5d06369f7c718214fccb8eb8e6ba60a4b6671545095ee8f80fc51f05eeec77dc25b90472b81c570973e1db8d3dae09578b71122e3908fdff0afd3ad43c0163a9472c92a076973d5405fad791fc44fd9f926b3692ced4b08d583fa115e842b5482b4b63c7a986a551fbbb9f13d8c9677b7291dcc62069f21240098ddb1c82bd41f7a9758f025e43223d95d4d2dbc806413bc210790dd4900fad773f137e11dd69966ef0a308a31e6e07f030fa76ae0347f125d4d6ed63721a7651b41076ba81cf0de9ecd5df4ea73ae689e5d6a4a9cb92664bf8afc53a0c0f6b0decd0c3d3104ac606c1ecad95c7e02a093c74f765ffb4b49b2bb99ff00e5e563104d9f5de98cfe55bade255b39a78afec05d2a8da1b94957df3d0d416f75e1bb862af34d012d9c4f10233f515d8add51e7bba7a48cc87c41f3a4a9692a227fcf3c9017dcd75fa7f8e6492cbcf82dad679230095bc7259867f839aa963a569b7934856f606883615a32f13ae47f7d41fc8d6678b34192dae619edae26b96db8690a8c1c74e401ce3d695a2dd8a4e4b53653c5b05fcc263650c17098fddc48406f5ea4e7d78ae9b54b08b5af0cc72c6de737fadb79a35c3c7b8f2bee3d476af3285a7b468e59216489b952c7bd6e693e229f41b8fb4221bbb193efc2dfc0ddd85438f6348cefb9f59ffc13c3e23be9be3cd6fc2577f23ea908bb44cf0664e33f5c57e809c6781c57e55fecbd78f1fed3de16bad38ed8eee4971b79f94c6c706bf5515b2a08f4ae883d0e6a9b8a7e6fc29cab9c1a282c2b432139a5c605378a76ecd002734372b91d6917ef1a563ef40083ee525396939dd4001ed494ac7e6a7500341c521e686e28a0051f76917b51f769075a00539cd22f7a5a2802ced346eed40ce28c1a005e69b477a56a003af14bcd1cd3680171eb49c8623b5145001cd1451c500145145002121791d7d3dea92ea11490b31cf9884ab007a11ea6a7b898c6876c6d2374014ff335e3bfb42f8867f00f81350f12c3ab7f625fc29b1556312c5745be5586453d796e08e951276d4a8c799d8f94ff006a2f19dc78e3e2b4d1a48ab1db31d2ad23570c234fbd34b9ed81c57846ac89f1035a8b4cb476b2f0fe963c8b629fc40756e38f9ba93ef4ef18eb136a9753dd5d2b5bdcba9494a1c83b8ee6c1f724d63e9fe2658ac56cad62db82022dbc65e46fd3afb9ae0ddf31ea689729d6c9e1fd32c5a386d6ca13a8c40918188e251c991c8fbe4f5c7415caeadaa4f750ae8da44aad6cafe6dddf301fbe909edec3b0a76a0d7d791b9ba9bec16527fad134e4cb291fdeefff00011c568783f4b8f56d4e18347b765914877ba972a8aa4f5c7619cd17e55ccc2dcced136756b5d3341f08c76104eba78922ff004fbd75cc8a87f847ab9fd2bca2ef583aa4a74cf0f5bb59696adf3c8c7e6931fc723718fa56efc5cd4bfb475892d21b8f3acac9bca6b82302771c1da3d076ae5f43b54d42e85bc2b21897aae4e1b1d38f5aaa715cbccc8ab26e5c913e89fd997c17a7c9abf98d279f360032021873db0339e6bf417c17642cec97cc924965e01040551c7615f367eccfe0fb6d33c3f1493dab5b4be62e23c10719e0ed18ebef5f59e9f0ac30a6531ede9e82b8a179d47267a53fddd25145e5ea39edde92661851f8d0cd9f4dd8ef546f272aa7736de2baa52b238a11726493dd2468493dab12f35a11679e319a82f2fbe5c06dc73eb5c6ea734d248db7a57995ab35b1ede170aa4ef234af3c4c3beddb9e4938359179ab248c640707af5ae76f2f1d18a48a50a9fbdb73fad73d25dcf6b8904cceac4f1906bcb95472dcf7e142315a1dd43ad2aa9667006722a79b5413a82a15ff00bdcd79b7f6d4ac59d598b67804569586a07a9cb1ebf4a9e67b07b357b9d26a17db15088d77e3d6b32eb5058e13b8796fd01523ad579af8c9b4b29607daabc928b91b00de071b4f18acddee6aa292191eb522e41dc5d78cd363f1118f702083c640acbd42d5ade462bcaf402b2e427270e048bda9ab8dc51dfe9bad2389896dacca02efec6ba3d3aeb21836d2ea06181e08af2cd3ae648972c4bb67247ad771e1bbc6bec6d0e854f39c74ae9a727b1c3569e973bdd3e648d25122a93f797f118fd2b5a3845e460950c4839f7ac3b6899546d2db738e6b7ecc796caa1c671cae2bd7a6db5a9f3f592bdd1e5df11be1bd96ada55e3ac08aac989074dc4f1f9d7e72fc42d064f097884b346d1a4727cb229c6369c60e3dabf5a358b75921b888ab01246d938c8afce6fda43c272daea1a84d04867686e4b1541cae7af1e9551b53a897731ab7ad49bea8f2bbed3ed6f5844dfbe461ba39548c15232006ea38f5ac1bed0e186e4811bcd1ff007f7ed910fe9b856c68f6ff0068d36da7019a0121b59590e5a253ca9fc1b8fa541ab349a4de446f545eda31da668c60ff00bae07f3af422da763c99c535768e7144fa7ca0238b88ba8627057ea077ad8b4d5a2ba8c4370f97c63730181f98aafa869d731466f34f9de7d3a419f2e5e76af70d8e78aa16b7b66fcb88d09ea198327e44822b7f88e6f84ea0e931dc69e45bb8b86539555e187be3d2a92dd7f665bbda4d0105b9249008f6a5d16e21b2b8fb4a5c43e5f4f2e3bb6047d383f9577164da06a16692df5e4a658d8b18d620e807624ec06b26f959bc529167f671f117fc22bf183c2baaec9e4486fd544483e63e60298fa658d7ebf420f971e7aed1fcabf22fe0feb1a75e7c6cf08c36cde737f69c25a658c2c6aa187e66bf5d97054103231e95ad332a892b2428eb4bd39a296b6300a4e4d213cd38e0d000b48c28076b6050dfd680114f341eb4ab498c73400351de86a5a001a9b8c5237dea70fbb400d3f3102976eda6a8e69feb400dce5a9db4d317e94ac4d0059fc68ee29dcd36800a5ebc503a75a4a000e297aad2638a77340098141e3143507ee8a004a5ebc51ba93a3134007afd690e334b450026eaf17fda0bc250789aebc3b26a6914da5d94b7172f0cf928ccb6f26cf97f88ee2b5ed03ef1ae77c75e1987c57a0dc594ccc8cc8db244fbc8c41008feb5135789a53769267e34dc78a2e6cf5abbb88a6222691f314c014720900807a50bf13ae56328891c4d9e258502b0aea3e227c319fc37e31d7343b989a3b9b09e47463c2bc4c4e08f5af34934175b81146fbb9fcb1d6b9a2a325a9d137522f4d8eb343dfe28d4ad51eea50f3c9b4bc8c496ee5b3d87d2be8db5b8d03c1bf0b7534d1e34bcd5668d2de1670495dcc42b0cfa904d7cc9639d077dd2056509b0316e7278af5ff02dabebbe119e2132cb2aed817fd990aee919bfd944c0fad73d7d8edc33d5df73c3bc4492ea9accb6d6c19a18549df27cbb40e198f6fa5759f0ff004db2bab9b68420b7b559429bbe7cf9c9c6001fc20f5c0e7d6b9ff1b2c7a5ea1269b6c413b816dbfc4c7a06f702bd23f661d0a0f13fc4bb281f75dc1684492c8dc26f271c7af35551da95d114a37ad667e877c1df06a68fe1bb5790991b603bdba74af4c7906dc32d52d26d7ecf6b122a844550b8fa0a5bcd43ece0fa0e95cf1b46173b27cd527624b8b958212c7818ce5bb5635cdf3dd36c424a9ef54b52d5031f366de13a28da71f9f4a6a6ad6b0c7b9dfcb63c2aee5e7dfad73b939bd363ae14d53577b933588c90704d67de69a3e62bc00392a3f4a8750f1b691630837baada5b331da32e383f8563eadf18b43d2f6219adee37a9092c32a91d338209041a5ece363a235269e88afa8694b32b67aff4ac4bed0c792f88c107a569697e3dd23c45248f1dc28e30630b861ee077a964d6b4eb957db346470493c7ca7a5714a9a3d78567a5cf3fbad1c6df906dc9ebef4f834f9b682d2648fd457417cd035c048195518eee9c1cd4915aed6f2f201c6430e86b93975b1dbcc9ea66db5bb0ea3e952c9632375e0135d141a3b3470ae141cf5515666b311479994120e4fae3b1ab54dbdc875229e8717a8e9ee557e6c62b26e34f56cef0493c66bafd42ea38a4608464f1f37ad739ab6b9676cc564bb86363c7de1ebd29282e857b456d4a967a4b672b9c74aecbc33a7bc186e9b4ff00177ae6acfc43a7acd096b88d5589ddb58723f1aeaf4bf1269ff68f29ae235017715246578f6ae9a5475bb382b56d2c8eeacd2375552b82a39cf06b5e158d1f62ee56ae734cb88ef172afba324156c56979f359c89cef889c138ef5e9c7dd573c09c799ee6b5c426455c6495e73f857c9bfb4b68e34d5d52f4a65ddd668d248c32938c1539fe13d08f615f574174b70791b401dfbd78a7ed39a1fdbbc277f3a286610ee1b867a7a5675b65245504eee0fb1f0b7856de2d3743f113490b359ddbadb2a93f32360b6e3ec42c99e47dca8f53863fb2dd4132795657491cf9db9f2650a0ab8f6c16047a554dd0bdac3137991b25e3094af4646c6d1f9bb54935e1b7b5fece966f33cc1b57cc3cae38c1aec8bea79b28d9599e7d25cdf7867507cae50b61971900fafd2b5ede3f0ef8921cdd21b0b96603ed50a9755faa8e0ff003a66ac3cc84c123aa5c46c42c83907fd8358b651c3ba48ee164475382636c1fae2bb97bcae799ac5f7474d27826dad6602cef6df5143d1e326238fa374a747a4df69f3310649143b068861fcce3db3c555b34bafb3ef5d4924880ff553a1c81da94dcea2c931b71e78419675ca95fa54ea5ae55ad8f4ff00d9af46793e3568170f642289e7daaaebc641cd7eb7ab0d8b8e41afc96fd95ee1758f8d1e198eea791984cd246371c8600f27d6bf5a171e5ae06462ae1733a96b2b12714aa0629ad4e5390056c62071499e686ef42f3cd0019c36697ef3526e14b40037cb9a6e7776a386a6e05000dc914a293761b14bb4d00147ddfc68349cd003b6d21e38a14d1f7b3400d5eb4bf8519a75004f4bf8520028a005cd25145003bf869bd06697349400b9a0d252f140077a31d6938140f98d001da9322969322800e9cd47264afbf6a939a36d007c75fb68782e2b5f11681e235411c4ff00e8b348a3e62dcb00dedc57c03abccb36ad398d954364654f6cd7ea67ed950ac3f07354bdfb28b93001ff006cf247cf5f9417533fd85ee7e5270b0b103a907ad72f2da4cebe6bc121754bc318540ec50b6093debdbbe18ead07847c1569713be2e356f3a6587701fe8b1372e73c8dd22aafd1057cf1279d75751c71032cac42c69fdf63c01fa8fcabd67c417d65a7f8e752d3e49b7d868d611e976fb475f29006fa65f7d4d58fbb62a84da9dcf37d612e2fb56bc9a5e25489ae5d874e4ff5cd7d49ff0004fef0ff00db3c4fa9ddba0ff450bf9d3741f80ba17c33f83707c40f1d69a3c47a96ad726cadb4f4b9716f1c6bcaac838c9f9467ad749e03f8a9a33782fc5b168da3c3e16b9d3ec1eea48346b7489644dad8dac46776467e6ae6aee5c9c96ec7761543da73b96bae87dafa9f8934cd061f3350d46d6ce21c7ef655403eb935e47e38fda27c2ba4d9ccf61abdaeab76a7688a094b46871d4950735f3efc25d49fe18ea1f10acbc416771e20d16f92da3b2bdd427f30eff28336d079cee622b1ee1ae751bd9a6f0f68d05b4ea4eddb1fcca33d4e06735cf52367cad9db465ccb9a284d6be3f78835ad49ee64b69ae5771c35b4324ca07fb08d851f5c135ca6a7f17fc4f6bb85b0bd4560306eb4f91828cf41b41c5691d0fc63e24b836b757f34e431ff00474ba31cb8f752474aebf42fd9a352d4ae84b7fac6b96f04800f2e1b8ddb78e79ea0525eca3b8e5ede5b1e1937c50f13ac918b5bab1492372ff74a3b1e872b228c67d073589a978ff5af291355b5921c392648d36a38fee1c7047a739afaa64fd9b34b9a39239f56bdba40c4a2de6d9863d3e619fc6b91bcfd9e6ced5ee069dab9b3e302de4883c2d8ec57b0f7147d62847425e17132d6e7947813e2a4b67792797a94d68afb6408f21cee539db9f5ec0fa57b5783be274fe24be8e30c15a61cc40e4498639c8ec4f5ae22f3e0bd95bcc21bed2c45bb209b53f23ffb51b7a8feeb76ad7d2be07ebfe1bb75d7bc2578bad59aae18a02b223746565ec41ea3b56152a529ad0eac3c6bd3694b53ea6f09dac57561189d4aec5180c3a60f033deb66488b5c465c79591dfa1af22f863f15e38ede1d3f5bb77b2be56c3efc807ffaf5ecff00da1677d6824dcbb9b953bb35c7eef43d8bc93d76239350f2a1ca6142f5ac1f1078b628ece47599570064f75ae3fc5de3eb4d16fe64925561f771cfe06bcaf5df89169750b5bcc7cc472cadb1f6f046067ffaf59f3b7a236718c15dee53f889f16af34d5b76b470cd1dc19088f93c0f97e839cd78d6bbf10f5059da5f31e1f318b06527e6cf19ae835ebeb458cc372c922a9dcaca70768e99ae0752d3df5a985c5b412344388c3e76e3fcfa57a54231de48f9ec556a97f758baa7c4ed4a087625d4ef130cf98095de7d726a7d37e356b112298cdd34ab91b8a8271e9f7715872f8575093019d9bcbfb88a00dbf89c9ad4b3f01ea4e3cc5b369581ce5ae1ce3f00476af43f7296a790a5896f4b9e9fe17fda775fd29914fda5e305542cd00c804e4e315f48fc35fda7ad3c417e96576185c48bfb9f33f74b37aa93c8571dba6457c44be1c9ed64292787e2771d177cc1ce7bf04e2ba6d32d2dec618fedda36ada431f985d595d95207b7983047e39a86a1f659d109d4fb68fd2bb0d4a3beb78eeaddf7c6e01daa41c565fc44d2575ff0bddc58568da27e076caf23f3af8ebe17f89bc5365a818fc2fe33b8999cee161a92a0f3b3fc2aed942c7d37027b576dad7ed91a97c35d42c348f19684971777591726d97c86b61bb68dc0b119cf5ae7941c9591d90ab18be667c81f106da4d1752ba8ca9d9b87e18ca9fe7542f7518f54d06356016ea17de92027257bd7bcfc63f83fa878cf50b9d474bfb2daadcb99a282e2e0292ac73c63d73e95e11aff0082f5df01c52da6bba5c96066fde5b5c7de8dcafde5561d723d6ba30f252824f747062e1284dc92d19cc35ec9679915f787ebb7fad5c8af96f23591c9dcbf2a918257fae2a93346c9961f29e0ff008d6968b63048bfbe816e15790dbb691ef5e95b4b9e36b7b17ad59e0886556ee04c65b050afb1cf5aabaf6a10f9cc91465163e701b3c1fe95b33e99f68f9ecdc340cbf32ab9664c7233587a869b7b78c6496291e38fe559caf017b026a2295ee54af6b23d93f62584ea5f1fbc35193829e7bee1dff746bf5c532aaa0f618afca1fd832ce76fda334596d363456b6b3cb3afa215dbfcebf57f1b783d6b4890f643ba8a45ef4aa451cd5922d1484714b40067da9077a1ba518f9462801698c08a5e17eb485b9a00297f868c0eb4376a004a3b5141c9a0029011cd05685a003029d814d6ce29b40cb745145020a2973464d0018e9cd1dc8a5e6936d000380066929dcd213400946053b9a6d002fe1494514008a051f53c52d23672280383f8e7e1d5f157c24f1669a413e769f2ed20770a4ff4afc61b8569e09a3070d9f3589f5c735fba979682fad64b77c84910a1f6dc319afc98d27f65ff0016f8c7c7de2cb5d3a25b2d3f49be9eda5bdbc0764851c801475395c1f4ae7a9254fde91d34a12a9ee451e3fe0ff22df5c82faee422d2cdd65770339c1e07e755adf524d4b58b9b8bc04fda2579a519c1704ee618f7c8fcaaf6b9a12f842eaf2caf258e59627659150e572091807d2a8f81edc6a9ae5c4f2af95b6370b95c88f2a7e6c7b2e79f7a39a325cc1cb28cb96da9ee1f0fff0069cbff00185b47e07f173c96561abde79763e22b56ff0048d3a691b626e460559198ed246081debb0f0af8835b9fc4717c34d4b40beb1d7b50bffecdb89ee8ac90ec5ff58c4ff10d8ac41f7af9ec6871ea1e2ed1f4bb38ca48b2c1191dd6476e14fd057e907fc202927ed19a46ad2bf99e4e9b7570108e7798a152dff912b8ab72b7147a787e78c65aec5e7f86504c2dadbc845d3edd0430c4c9d10719383ed5aedf0eedf4fb7923b489520230506d2bf86e5c8af448e0b7c6766027e75ce78ebc51268ba3dcfd92dbed376576c71e7b91c1cfa0eb5c3539629ca4cf528ca73928411e11e22bbd13c1ba87fa42235c337c90b62491b9e81719fca9b7ff001624d3ecfcc9b4f8f4c840cc67529d6df23d7672d8fc057867c54f1cf8a347bbbd1e1ed3e4d43506ff009086b423de039fe046fee83903dabc3fc4de1b7d57c3969ae6b5e2a6bbd5a5bd482ef4c995c4b6f131c1901e8c075e2a30f455657722f1988741da31bd8f79f1c7ed4c90dc32db5e69b20f9806825794641c1c80a383d8d7985ffed2da94972192dad9d4f52b23afe5915e79f1bbc33e16f0af8da2b2f06eaa756d14e9b6d31b866f9d6e086f35181e84100d67f84f47b7bcd52ce29991d660c258cf1b001c1cd7a5f51a315792b9e22ccb113768e87bd7837f68a82eaebecdaa5ab5baca42ee90864fcebdf3c2da849a5cc9e24f0d4f1b82634d46c09dd1cf1b7dd7c7d7f5af9057c3ba1dbead35ab5ca8818655b767cb3e99f4afaa7f653f0c4a23b863771de69d27ee1e127931bae323f115e6d4a708cad0d8f728d5a95217a9ab47bac3f0c745f8c9a53dc416834bba1d269be6727af18af14f8ccbad7c0fb66b5b7bb4bf55fe2909079af70f03f8aacfc35697d6935cf91690c52ceee0ed6ca803683d7249ed5f37f8bb4af11fc69d52ff005790bda787e12444262d21703d739e6b9a4a8a8ad35ea7553fac394b5f77a1f3feb9f11eff005c919eed5816271b0e6b8cd4bc586ce561ba4dd8e9e9cf4fad7ae58f85740bbd4ae74bb887cbbc5c8496372bcfe1c7e15e55aa780dadfe2c2e8970e97f6a8c97338c607922313146f7da31f857a7858d2a9a2478f8e9d7a29393dce9b4cd2adad745b4d4fc41308ee6f879b69a3824bac1da69fd779fb89dc726af37c46d1ed656b6b3b49af36f01a301893f871f957927897c5177e2ef105eeaf7f36e7bc94c8f8fbaabfc2a07f7557007d2b77e1fdbdd78c3c49a7e85637b63e1d4b89423ead7c3f776cb8fbedd30a0fea6bb6786533cca78ce4d0ef4eb77129577d22e11643c7dd193d0f19aea340f1d6991c2cb711cf01c6187939fc78ae73e237c1fbbf09dbc81fe2147abf88a1d31b586b6b39d4c7240431021f9c12c3636f1ce3e5e2bc462f166af1b1035098e4f3b9ab0781bad19b4732517aa3ecef08f89b43be91becb796ad2640656201c76f97ad75f71e1287c4164d899864650c381cfae483f957c79e1bf8b97fa18b31ad699a7f8834f62711dcaa9970382372fccb8ed5e99a4fc64fec7862d4bc2b733cb6883373a1ea12191e11dda290f247b374ae29e16a537a33d3a78da5556a769ac7c2dbef0eeb1e6da4d24913025a5541961d70c30338aaff00123c2fa7fc46f0a9b2bfb8fb4f8a74f8bced3ee84452620005ad5ce7e78d87dd2092a49c0c57a3f813e27e91f176cd16245fb4188f98addb3c55cff857b31d5a2104419636dc8d19c1c771c8fd2b28d695391d32c3c2ac74478ffc7cf86b7de28b7d375eb2d7a2d3ac2cec444d08566f3be6dc1d7903ee9038f4aa36ba7d9f85fe086a9a278fb5f8f556d7ae2dae7467ba691a5d3caa3e700ee281c607ca71eb5d3f893e0968d37c44bc37d7d7b75235e878747491bcb0d2624f5c2a82dd315f387c7ad0eeb47f88fa949728d9b9e8ef9276818c03d80f4af430f52f3f677fc0f2b17494693adcbf89c94da65cdb5c1b7963c33282a3230c3d411c1fc2b5fc3f672dbdd792aff656fbd245700f96c31c638c561596a57970b15bc9baf12307ca5727e5f607b0f615def83f5e4b94824b84492141b241e507645f519238af4e5eea3c285a4c7e9d7cf1811cc896a063e6098ce4e0608aa1e20d62edbccb79a7ff008973632a1d5b7fbe7ad5cf15c5a6bdb48d672bc73fde653f2f1ebb73835c1dcc712cc047379f11192c148da4f6a98eba9a4af1d0fb3bfe09c1e1f4bdf8a9e2ad4fcadd0db69a96f1b6efbbbdf39afd1eddb9abe22ff8262f85459f847c59ad1705aeaea3b503ba844ddffb357db8b5aa3263c9f945281de900141aa2414fcc686e5b14aa31cd14009b69723b75a13963450030e7767f0a76d18a41d686e4d00149fc38f7a2861d31d68000bda90b52e7d3ad37196cd003b068ddd45237434da062f238a4a72e291cf3408b5452f5a1a80128a5c9a5e68013228cd0d499a003bd388a4db46da00320d143525002f3d29297a9a194714008168a28a004cedfa75af9fbe297c52b5f86f15d26976115eebdaa5db6c81b2aaa4e06e6c7526be82fe13f43fcabe49f8f16f69a678ebc3d7d3a0646950b311d3e6af17339ca108f2f567d4641469d7af28d4ed73e4ef18f826db52fda6b47b6f13f976da6de8fed4d452524aa205766047605978acdb5b9d1a7f1778a2f2ce2896ddcb0458e3d914714632113dd8ece7bd7dafe3af81ba56b7f116c7c6f2d8b3e996fa64f6d7621c234bd1836ece48c6e5c57c369a8e931df6ad2e9c05b25e5dcf2c16fb70628c4b88571d8f73514db9593e8878951836e3a733363e01f87ff00b53e36783ac668566ba794ea778cc390586e518ed85515fa2d710083e20e83745405b8b3b8b2dde848ddfc912be2cfd8d3c3b26a5f1bbc41acc8164fecfb4f294f6567c2a8fc00afb735457fb3c7791f32d8cc97518f50bc30fc54b7e54a52f7c8847f76746b6e42f0db8639ac0d73415d5195268b7c40e4a81f787bfad7451dca5c4292467746e0303ea0f3557506758cf96c578eb8a2ac22e3aec146a4e32d373cf7c43e13d12f112d5eda3b48f39daa800af37f117c04d13c41e62bcb6b70ec098fcd4dbe5fa9e3afe34ef8c1e24d4ede591629fcce738e9d2bca63f8bf73e6986ee63010bb77735e446b6af951f40e83705cd2396f1a7ecbf65a5dc5d3b08673c0899b0c71ee477af36b9f83eda4c933e2181547de5c0af77fed68fc51f347ac1462c06011e9d2a89f87106a170c926a123c870cdd3a56eb115366cc3eab47751d4f074f07d92c83cf94c8a3aed1fa57d4dfb2df8363d3ef25d4618a58140527792164c1c2e077ab1e11f843a419b2f606e5b7ee5798921bdebd7ecee2c7c0371a63cd3c769146c1f18f955738e9f8e2ae32f69249b267154e0f911c7e97e11d435af110d2ee747b7c4c5ee6eeee6b611badbb70aa84724b138c9aeef5ab1b3d274b165670ac104516c48d0718e98af4d7bb4d577ea3e57952dd2831ab70c2303099f7e738f7af2ff17b7efa4e7193f75aab131504daea46066ea349f43e6ff88df095754bc3a9e903ecbaa4677064e15ffd961ef5e11abde26a9f15bcdf25ac2f2ff4f9aca7b53cf973adab4647d085e0d7da5a1d8cda8eab1c10b67f7a015ee6b93f8a5e1cf0e7c33f8c9a5f887c47a7db1d275cb36b19afde3cfd8ee9637314bc76656646fa574605b5b99e6d18b4adb9f9ccd0ed924127cac38c7a54ba5ea779a3dc3cd63752daca6368d9e26c12adf7973e8476af44f1d7c3f3f697d534f8da5b2b99086c2fdc6c6483ec6bce2eac66b598ae33ce335ee466a6b467c84e9ca9cb545dd4351bcd79605b97123c64ed915406ff00f554fa77826e35074d8b311fec8159704935bcaadb0e56bb9f0df8daeac5931012cbdf6d65565382f70d68d3a5525ef9d7f82be096b3247342165b6b6ba51be46c317c738ce322bd26cff63592f617b9b2be5d32e546e50f26e038e98f426b07c37f1335a9d51112454623004678af5af0bf8c353b89a38a59e4b753f794a15af06ae2ab27a9f4f470741ad11e3fe17f0b788be15f8c8c975a64f0c8876bc96c0f932f3f7b1fad7d79f0db54935c8a39678dd77637798b8cd37478edb5ab758ee544dce79ebf5aebec562f0fe9f34c70b0c6991c739c573293ad352676f22c3c1c51c843a55a6a3f1592436ea658de49ddb1fc31c6b18ffc7996be73fdbebc276f6b2683ab41088b79785d87d2bea1f87f6af77aa6afaf4c3e59dbecd0eeee158b48df8b36dff8057927edc5a5b5e7c35b6b9dbba4b6bc525bdabaa12e5a8a5e6715687350943c8f843450b63ac89248cc8916e62bdca95edf9d43a5ea4da26b53a9266b6663f74fbf51fe15a9a927977569796a1b6c91e1c363f842e715d2fc2cf085d6b1e3cb8b7b0292c90c46e554a2c81a23c3650f50bbb048e95ef4aa28c5c8f96a749cea2822e36bd712e9d1c50da596a56a55b6a4d6e92100f5ce7a63a70735af1fc0fd57c69e06b9f1568967a4dac96aaed268f6658ccc887e67d84b007db8cf5adcf167c29d5bc176efaad85b47aa68370dbd822131231ec07a8f5af42fd9a7e382691733e85a8a46ab7207952141965e9835e74f129439e1b1ed50cbfda54f6735a9eeff00f04d5b5ff8b03717de505fb6ead72dbc2e376d223fe95f58b0c62bcefe01f85f4cf08fc3b86cb4a1b2ce5bdbabbd8a73b5a599a4603d065abd16bd68494a2a4781560e9d4707ba17aad27a528e68ad0c837606293b734bd28fe1a004dd460b73428a1a801b4ee693a73406ce6800fe2a18f4a4ce68db9a002902e33498dadcf4a5e7b74a004ef47534a7a527453400bd8d371ba972692802dd1452ff00150026452e28e0518a004a500e292972680128a5e6979a004c1a4e0f141a552471ed40098a369a294734006d02929702979a006fd3ad7c89fb5148b76f616c5712b3c68ac3d4b8afaedb18e457ce5f1ffc22355d6741b80a58a6a28a7e9bc30af0f368de8a6bb9f55c3b5230c53e6ecceafc45ab4da77816e1104c4476ac3e553b8e17b7b1afcbdd3e29b4fd5b5699edde27b45642a3aab3c84a8fd2bf5cefbc3eb7fa1a0946d40838fa6327f4afcb7f897227f6978c2e4afd98ea7ae66242b9c22b1039fc6a69c654e5697542c44a15a1cd15b3d4fa23f611d14da68fe28bbb83fe9d3de286cf5c004f3ef5f5c69d09b96657fb8e36e7d38ef5f34fec68d1dc785b555cfef99e3767f53820d7d4762331f4c60f03f0a9a6b9e4d8ea3f674d246168723683a8cda75d3e2c9df7439e91b1ea3fdd3dbdeb63568c7d9ced4fbd4fd5b418f55b3452de5dcafdd7e78f63eab5cf36ab75a08fb2ea11ed4e91c84fca7e8dfd0d5c9382e596c4d3b55929437ea8f1cf8a9a7bab49284dcab90403c0af10d53c3767a8292c36c9eab5f4c78e7498b5a86630cd1b6413b7bd784eb56171a7cc0490b9ec093d85788e3cb23eba0d4e9a381b1f099b0bc2619248c039dc3bd7ae78174b8f7c4d3c8cedd0338c91585a54914d2282a80b7f7fd6ba7b7f13e9de1b8d259248e7b953cc36ec49fa1c51ab7764da291e98fac69fe19d366beba710dbc2996dfebd80f735e7be01d4a7f8c9f10a396581d74fb76fb44ab27fcb38c1c22fd58d705afea9affc56d796cec60fdcf9a152dd4e510e7ef31f502bea3f847f0eed3e1df8756d213e6de49fbcbbb82306593d7e83b574d28de48f3f10fd9c5beacee2fe6f26df20f00715e49e3cb90d23b336413c135de788f5216aacbbb60f4af0ef146acda8dc491efc057ce2ab15513d0acba838ae76757f0be167d4649df90a7820022b37f6b6d053c6bf0bf558c22b4d6a9e7a3631829cd62f837c54fa6ccb082a558e4973d31e95df5d5d2f89b48bab195018ae6368dbdf208cfe75b51a8a34f94c71541babed1ec7c4ff000cfc41a579cfa26a47f7b2dbaba45274660383f4a93c55e0bf0fdee9cce523b6915fa46413ff00eaae67c45e198f4e9752b1980835cf0edcf9504ea70d2c0c781cfa641acdb8d7ae265fb25faf917319c056e0303dd6ba249c9f341ea79c9a8c7d9d4575d0c2d67c196f1a9fb2379c17f8bb8a9fc37e1f97ed2add38c1e3f5a82dee869bad7da5242adcfcbd410477af4bf0dfd92775650ab267829d0f14559ce31b361468539cae91d1f85f498edc6e38df8c67fad7a8786f4b119dee7ce0c2b8ff000ee9fe632bb379641fbbc726bd034d5712844401b192c715e3c93933e8a946314761a0c262caac6700640abfe22bab9be974fd1acf2f7575285555fe0e3966ff0065473f535cc1f11b2c9159d8a3de6a321dab1c3c93ed8f4f5f4af58f87fe097f0e472ea7a8badceb372a0394fbb1267fd52fb7a9ef5d74293679d8aab1897974bb7d0749b4b08388600101c609e3963ee6bc6ff6a6d386abf07f5f429fbc82359947d0e2bdb356924dc55be60c385c62bcbfe33f9337c35f14a49f77ec3273d790a715a54d256473d35cd4ddcfce3bab38dade080b8332a1fddf3c131211ff00a15743e1dd663f0cf88bc2be20b30619209cdade46bc9224f949fa735c99be10df4bb837dade3460c78dadb874ff0080ad5db3b197c51637d6d04e81d99648e166c0242b739e80703af5af65d9c2cfa9f309b8d5bc7a1fa8fe11f0d41e22f8577fa75d4380006572a323a1feb5f9c5e26d08f83fe306ada7ae14dade909b4ff0b10c2bee9fd91fe29deeb1e059fc2bafd9c965e29d217ec7716d3021e640abb645ec46d23a715f26fc69d149fda635d8587cacf14bff0090c0af26a454236f267d9e5b3f6988e6f34cfd03fd99356fed6f859665befa3106bd6179cd799fecf9a3c7a1fc3e8123184623f4500feb5e9807af5af6b09754237ec7c7e68e2f1955c76b8ee69bde9723341e95d67960d49d68c5039a000818a4dd4a693b74a001a9b4abd6865ef400734b4de948cdbb18eb40048c7b5283f2f3d6865efde9a7b50019a1b14a07cb49d89a06807200a369a45f5a1b39a07a96fe6a5c1a4f5a282453494bc50319a004a5e0d047a525001de8a28a0028a5e051f850026714bbb34bc51c500369dcd2628c9a005e6bcf7c7d0add6b1a7da32643dd472a9f715e839ae37c68be4eb9a55c91f24619d8fd39ae1c62e6a2cf4b2f938d756f32f78ab538f4dd27c8279643bbd318afcd1fdafb488adb55d25f4e804692cb2c9215fefe73fcabeb3f8b1f11def1dd622e5d8ec445e6bc97c7ff0009e5f89de0db79216c6a56afb847fc477631c7d78af9f962bda62935f0ad0faf865ce8e024a5f14b53a6fd946e2dc5d3c36b26fb69ac21993f1762c3f035f57d92aedc2118c66be23fd8f64d461d76ead3528bc8b8b58e5b46888c14f2dc0dbf862bed7b161d0e726bd0c3e92923c5c55e508b45d6fbaa734d9214bc8cc522ac91b7055d7703c52caa4ae7ae4f07d2acc4ff002f3d4f5af41252d19e55dc75383d7fe18e9b7aa7ecef2d8bff00d3bc840fc15b22bccbc4df056eee372c7ae4801e4799688dfa822be86bb8d4c7c019c66b8fd72f85ba824e78fcabcec45182d763dac162ab49f2dee7ce8bf006776dd75aedc488cdf763448d7f2c56858fc23d2ac311c8ef267b13cb7d6b5bc7df12a2d0a2b93bfd8aad62fc1ed5aebc5da84b7f7618db86ca6338ebc578f295dda27d5462e31e691eabe18f0ce95e0ed31248eda3b72dc8da39ad8d2fc582fe69618a261e8f569f4ffed3556238c602d4da4e830e9f217183babb610927a6c79156a53945b9eacc5d7616b88e5f90b31e6bc99b4365d46788021df713b8679afa3e6d02daf6c19f201db922bcf26d36d3ed930db96553919c54d7a12bdfb9ae0f191945c6db1e356b6ef05f18218b79424676e3a9e6bd0f4b91ed608d6405085ce07a572f73e6697e268256846c0d908dd319eb5ebda849a4eab6b69e5490c7314c1556071c74a9c3c39e2f5d51ae2eafb39455b467e7e7ed2da3de5c7c42b8d42cd1d21b8c07751d5874cd78b5e78b269d4daea51ef9221b15dba8fa57e8e78b3e151d5ae2e0b5b2dd5ac9d063bfa8af83bf69af87efe01f1842707cabb52e8fb719da71835e8e1e5cd2e49a3c7c653e483ad4ddd7538a8f5077c6c9d6451d1665ce3db35db783756d4966510db24c57d1f8af25b799b7af5ce7b57a97c3c9e4925442bcff007ba5746223cb1d4e0c1cb9ea591ed5e1f3e25bc8f30d9db42781e6336eaf44f0ef80b57d4ae211abeb2c22cf315aae0fd326b37c0b247f65ddb479d81926bd93c2b6f1cfe4b02125c8e9c8e95e245f33b23ea5c546176cec3c03f0f34bf0ec09f658984f20f9a663994fd49fe95dcdc62d61450c5993afa554d0e4f2ed832b156886d31b0feb55754d4d65665ced75e457afeed381f36dceb54b333754bbdd3b0230e324578c7ed01a81b3f861e22908c968362ffc08edaf51bab93e63b2fce18f56f4f6af17fda59dae3e1ededac3d5da32467fdaaf2652e69a3d98c7929bb763f3f3528e5935c98670c8c15067b0157fc33bdee802cc014e36f1c820835e87f0ff00e10def8bb4ff0012f882489a38ad239de1674dcac63505b3ea30d81ee2b17c4ba058f843c456ba7da48ce3fb3ed6e2624f49648959c0f6c935ed4aac5c5c16e7cf50c349d55525d4fbcff65bf11695a95d7dba7b7f2f5cbeb68adef262c4f981061587bd78dfc64f08bdc7ed45731c60b8b8b7b62bfed7de1ffb2d71bf003e261f0cf89ad81cb47e62fe0335f4af8db438bc41fb4b786f50895bc9bed3239863a7de3fe35e25e528f23deff99f594a31c3d6f6b1dacfef47d31e0bd29347f0ae99689fc31296fab726b6e942885422fdd51814abdebeb611e58a89f9c549ba93737d44e9cd1f7a969a3356662b74a6b3714a73430231400d1f3714e6e9460d37f88d000b48df350a3e634acc2801bb452a8f9a936f3cf4a771cd0023636d201b80f6a770298cc4f4a402eec8a6f4e29cab8193d69abcb1ed4c680fcaa29cac4d35bef53b705a422d7e149498f7a5a60140ce28ea4514000a28a5c1a004a28e3b75a28017d2928a280173d68fbcb499e0e3ad1400a3e5a3f8a933450015c67c44bb8ec66d264b803ecacec92b1eca45769fe15cdf8f3465d63450a465a390480fe15cb898ca54a4a3b9db8294635e2e7b1c6e97f08741875c3aa16374b2467603ca8cf715674ef825a1e9fe284d6d1e6df1b6e11ab615bea2b4fc276674ad35630fe64633807b7b574304d2b498278c579d470f45c5370b33d6c463311cd28aa975b7c8f32f1278174cd17e252ebba7dbada5c5fc04dd7969f23b83c37d4d777a7386db8391ea7ad52f1a328934e666da373827d4e3a54fa3b6e57c8c1f4a1251aad213939d08b668c8c78da7273cd4d04a1b7e07b50abb7af4c531b6ab06c77aed479fbab0dd49cc76ec776d18af1ef1d789e1b686e5b7ee3b0839e2bd47c497a9158c992492b90a315f297c5cd7ae350bff00b1da9633371bbdbd0d78d8ea9ef28a3e9329a4ace6cf23f166bd75e2bd79ac61e50c983b7f5afaabe09f851347d2608cae1360c7d71cd795fc25f85ab0eb1f6ebb5066dbca119c13debe87b3d4adb4bb70623b1410a0ae3e638e2b928c549a7d0f571151f2b8add9a7ab4577610c9369f1fda9c02441b82927d89e2bce6dfe2378a5af2e16f7c293d9c1190370b946739f6157f5af1d24324ed3c860b681893333ec5f4c73d4fd2b8fd53e25ea767a948b6f0472c512ab3396c2e18f1b891f9015d33b5ee8e4a51b2b4d26cf56b3f1348d66ee229e07db931cc84578c78dbe2947e1fd7d15d88794edc75ef5cfea9fb4deb1a1bdd4777a32cd68afe5c6b8c6f1ebf8d790788be2cf87fe206b905f8b092caed1c3089a6263f7ca8c639a894653b59e85d39d3a37ba576769f14be2f3cfb059c6b1bae099d8e368c735e5b6bfb445969b75fe91a889990f06366604fe1557e24dbdb6b97064d4afa278d42816d6c36c6a0fa9eff5af22b7d3f4d8756c4d6cbf674604aff7be95d1470f069df7383138ca919251b58fb0fc07fb4b8d623f2ad6e4ccb8c37cc4e2bc3bf6c2f1d5af8cb52d12d20613dcd9ab493c83a02d8c2fd6acf83f53f0bd9b0fb068d6d05c32e3cff30f99bbd00ae07e2c5abdc5d196de2091b13bb674cd6b469f2d5bdf423135f9f0cd595d9c4f833455d53508a391800cc057d35e1bf850fa7e9b0dcc7b24563c6062be5ed0eee5b0bb5643861cf5ef9afadbe05fc52d3fc430a787f53956d7506e2077e04bec3de8c77b4dd6c6795ca96cf73a0d1ed5f4fb80bd163e33d304f5af5bf07de6d58250ead1aff0e3a9ae6754f0d1b7679c0e07407ad49a2c925bdbb3336248cee519e727dabc6a73b4b53e96a4572d8f628fc51b2320ee8e4c6d1cf2a7b63dab3e5d4e7b88f950083f29f6ae0a4be6b890bacdf29507927201ed8ad7d37547b9540ffc276fd6baa759c8e28518c7548e8e66cb66bcc3e2843fdae56c65888b79982b4dfddf7af44f3cee1c119ae1350b792fbe2169ade67fa3ee0b2c648c0241008f7e6b993bc8a96c7a4784be13e9b6bf0f7fb02de24b5fb6584d1197a1cc8a326be19f8edf01effc2fe34b98bc3cb26b714112fda1ad8f9863c0ef8e95f7cea922dfda5e68b34925b59dd5a9b6f3216c347c60329fc2bc7f4df8589f0b7c556022bc975017ce4231f9b07fda3df35d73adc89382d8e6a1479dbf68f7d8f8bbc0f6b7b3eb107951c8b223a80a060e73debf43fc0b64f7de3df00b5d026ea1d2d849bba8e6b27c496fe06f01b5d6af7da55a43725f71651b7cc7ef81dc935bdfb3e5c5ef8dbc63a878a2f21f22dd60115ac24604699c283ee46eaaa5fbcac8d3113e4c349bd923e8763b9a8a0e38a0f7afaa3f3d0e94521fba28fc68013f8a959b6d250334008cc691a978a5edd280199e28dd9a2933400ee452646e3451400d6ed4bc05a56c7148c72303a50026ecd253b1f2d267b5003573b8d3a9b91ba86a0a2e5149cd18a09141e68a173498a005a28a3340051451c05a0029718e6928a0028a52292800a5fe2a4a53f745002e7e6a8e4459236461956047e74fdb4bcd2dd079a398b9b09b4853e5c0f341d73172c3f0154ee3c4b72abe5dae9b7b3cbd956065c9fa9e315d90eb4b9cf15cd2a2dfc32b1d90c42fb51b9e2badaf8a6df5cd22f753b387fb26eae3ca7811b32db311f239c5777a39531e074538ad8f1569ff00da1a3caa38923c3a371c11cf7ac4d1d99b24aed7079ae3f62a8cd59dee77ac43af06dab5bb1b2aadbfdbb5326f9548c54c9d29acdf2b641cf6ae8e8722dce2bc68d21b091626319dbc915f3dea91dbd8dd5cde395c6195598658ff0079bdfd2be80f1e37d9f47ba90b052cb80719e4f15e27a86ab6769a2dc0758aea1949428a98c855cb124f02be77111e6ada9f5b859f261f439e5f115ee9d64b1dbc73192e17ce765872d1a6f3f2919e338c0fa5697f68cfacc30bdda49e59f99eeb7e136963852482370c6718e3d6b81f0ff8eecaf35c823d3e6431e4af9014047563c01f4c57adf86b43d4afe49d25658ed1a63843862a09c8cf4a7651d121c66e7d4ce7f070d474fb7d26379add7264fb434bf380791cf7fc6a9c6b7525dae91691b1b68c949e6970549fef11dc1f5af598744b485a0864be8e2308008c6e18cf4ad65b3f0d59c2caeef23b0fe08f8ae88c2524294947a367c8de2ad3ef2f2eb52b48acdc3daaf40bc381fcebc46f3c3274ff0018dbdecf034409f9c48000c31dabef1d5db408cdc3c68158e43798b8270322bc97c57e19f0d5c477172c9fbc5ff966876e79e959f34a9b3abea6abc6e7ce9278724d63529dcdb797247cf0380b8e306b8ed4f45f2ae1ccd148ac8028073c57d2dff09178574311c064ddc80c24e73f9d729ad6b9e07d5276792668e646fbcabc1fa55c2a4efb1cd5b0292df53c46ced1f4fd48ca85b2a80846c8527820715adac5acd757d7371a839db2204465caaae074e7ad7af47e15f08f882c5a7b5d52de295006093b00cdcf4158de26f8772dc68eb2da328e780087f954f7f4ae85575bb3cd9619c5591f376b16a2deec940c003e9d2a7b1be9b878e4659108911d382a41e0d5bf186e87509908c6c277376233c547e13d2e7bcdd2058ca8393bbd33ce2bd2d250bb3c45cd0ab647d95fb3d7c547f8b5e119b46d49d478934b03ce76eb730938593ea31b4fbd77c2d7fb3ee15aea30d0c8c55b919071c115f1cfc03d52e7c35f1d3446b19184375ba17523ef230e41fa1afb83c5962d1313f22fceac6361cfb802be6f154d52a9cd1d99f6582aceb52b4ba1871db7972c8aa0946dcdd3eeff00f5aafe82bba490b3ac857fbbec78ab1a4c91ccb0c8acaf8dc0023071eb59fa724635fb831e555973907a735cd23a76d0ea24b972ce1942b28c564e956f02f8b85d98fe6853739ea0e7dbd6b42eae0ac6a76e588fc6bcbfe2b78d47c3ff0087bae6b91063aa5c30b2b61d9a46242b1f65193f5aba517295a26556a469c79a5b1ecfa1f886cfc4b1cfb651cb633fca9b631cb6bab6eb8732a2f0abd7e8735f37fecede0ff8ade2af87ede29f0edb5bea1a74933446da7b8f2e694a1c33479e0e0fbd7b7787f47f8997f288ee3c237b64c3e526e1e35419ef90e6bade1eac749459cf0c55092ba9a4887c75f0fedbc51e238352d424696dedf1e4dbe720393fcebe88f86be115f09f876384a7977131f3245f4cf45fc3a566782be1c4b61e4df6b6e93dea1deb6f19ca237ae7b9aefbf1cd7b183c2fb3fde4f767cfe638ef6c951a6f441d79eb41e68a0e6bd53c00a4fc294631d691bb5000dc0a61ec734e6f9a931da800639e68fe1a4dbf375a36fbd002514bc51da8012959b8a4a46a004fbd4bb6851c71470bd7ad030ebc52376a69cee0734e39a5a8f51a582d27dfe697a9eb4e5039a560d4b3814b4507354485008a419a5fbb40051451400519a28a0028a2939c5002d14bd71cd0d4009451450014ad49b6940a003fc2979a077a077a006ca9e644ea475183838ed5c5da62d6f1954fc9922bb6c76ec6b8cd5b16bab48a5708c4107deb9311b27d8edc2bf79c7b9b51fcd8c8fa542d2a6c72dd474078a8e3b8daaadcb763ed50df4c7691905588c3562e5a1bc63ef59981e28b53756791e5b971928dfc440cf15f36fc5a9ed6c7c27ab36efb3c4ccb0c51f42c7838e4f5afa7efa36b858118aab31c2e7a9e2bc63e2f7c3f8aeb49b9b6ba81a796f4bba9cfca9b4679af22b47dee73ddc3cfdcf66cfce9b6f126bda6df4d6f68cf9b795a44e32c187b8aebacff006baf1fb5e69ba547711c10b4b15bbb32e5c866c123e95d25e784ee7c3fab349686dcbdc3a2f92aa5be51d49183f9d751f113f6574bed1ad7c51a2232cdb56696dd3aa9ebbab755a8ded3899430f88b3f672b33eaaf87ff0005e4d6b52be8efbc5da95c95b78ae2231aa2ae5c679e3915d3689f05efed619e5bcd6af274b7761fbb09b88c704715f36fecd7f1ebc43e07f18c365e2bb8fb4e82d67f66fb4303e6c0eac0ae7db15f66780fe2a786fc70fa85ae91aadadedc5ab032c5138dca08e0e2b7a71a53b6ba8ab56c6d0bf32bad0f30d67e0bea7e368247b2d485b46bc335c272c41e3a57857c51f84de30d16e5e1b89a074978478c9e71c0afba349960874c748d95bf78e5b03a1cf35c9f8cb4fb0d6754d0d2e88c477824c7f7c053b94fb554f0f1e54d3d474335ad1a8d497ba7e74bfecbff001175a5322db808cc18316c1249fe1cf5e2b1bc03fb3af8a3c7de34bcd12c9da18ec65f2af24b83b7cb7190549c1e4915fa85a94d6ea4e76aa819e6b84f00e9fa469775e22d56c9a2537faa4d2c8e9ff3d06d0d9fc7347238b4ae612c5ba89cb94fccbbdf857e248bc55e23d2e29c5aff0063f9a5b7fcdf7327667bd79aafc46d7edd488f529557a05afa7fe2b7c4bd1f4ff127c4cbbb49d269af2f2782209c92d8d87f957c9563e1bd4750648e3b690b12000cbcd6f42d2bb99c5889555654dbbb342d3c417be22d420b4ba55b99ae6458c360eece7a9fcebe89f0bfc371a3f86ad67bd8e3b6b6fb4346d36371913032719e9babc7745f0cff00c21ba8db35d6d8efdc6429209407bfb1af7bf0deae3c55e1eb6d1ed2e669ae2d63626d923c67e6fe23dc1ae5c554d94363a70949c53755de455f857e139356f8a9a76a5e498560463e6c6b80536801f9ef5f4af8af52f941794c92a80437723d4fbd65784601e0ad03ed7a843144d2db3b288c61a3e7a0fa572f3ebe7507257cc689b04c929c03ce40fcabc5acdd4763e830f6a513b2d2ee0c30a483e642bb893fc349a6e2e3504936643e4861d87a56059df06d12e3c91812647cbd3938e2b574383ecf1c5f217db93b738c0f5ac19d29dce9659a28f7c8ec76c6a7703c1f7e2bcafc75f0def7e3f7c40f0e7802cae9ad6d2da1fb76a970a302284b6589f573f281e9cd7a45c49fe8972c146ccaa397e801241cfe06b8cfd8f7c61aaf88bf696f194515b3cba4a5ab2fdad9b11a15651b00f5e56bd6cbe9f34f98f1733abcb4f94fb43c21e12d2bc09e1ad3f41d1ad52cb4cb1896082251c0500739ee6b67eb49c6e18ce3b67ad0df7abe94f8f06a438c51ce47141c669807a5250c0d00ed1400734631cd1bb348dd2801bf41413c74a5a4c7cd4009d39a5ce3b52939c8cd37f1a0046ef451450027f1519f6a3f8a8fbbf9d002d2336da19a9a573c9a003de9777f2a131cf34d61ea78a5a9422b64d389a6a819cd296a350d4b949cd2734a7a53245ed42d26696800a28a2800a3228c8a3af340051452645002d04f4a3068a0028a3f1a2800cd296cd1d68da680131d2976d251400fae5fc610cb14b6b70a37479d8cbe99ef5d30e39aa9ac58aea560f130e4f2bce0e4567523cd168d694b92699cb59de2190c458391d73fcaaf496e8aaac3e45ed1f6ac38e39239183b3a49137ddee6b6619879637b10e7e5c73debcc8f667b335d6253beb159a64665f9d410b8f5238ae0fe235d34f6b358450b1bc997624ec4858401d78cf4ebcd7a3cd0a6e56136d0831b335cd788516ead50c6a2494b62459318c7a60e7358558e8ec6d467ef2b9f3f786fe1396b88e0bc955a48818cb44c764a4f3b8918e6bd63c3360f6fa79b278c204e36b9dc71efc52d9dbcf61757bf67923fb29972631b51c90390d802b5f4fd42d6f6e98c71e1e36d8f9079fa1ef5e528fbda9eef3b70b2479af8cfe08c5a85cbea1698595b264882803158fa3fc319a59ad7ec425b3bd50c1a45765727eb915ef8b0c72282abb73fc27d6a8dfded9e9d334b31485d7962a7078aee8d38deec238e9f2f25aecf9e356d73c6df0dfcdb18754bcb487734c727cc0c58e59b273c935c5df7c6af18dd6b3a6bcdab4a65b59f721f2d7193f2fcdc7fb55eefe39861f1243b2dee90bca9b06f233f5f7af0bd53e164f6972a52ee1f301e3270739e6a6528a76be87a74e34aa414a515cde84fe22f89fe2c666173acced93f32ae14608ed8ae73c09a85eeb735e68d06b377636d7ef23ba47705034840cb75eff2e7d73595aa7853517bb9124bb5f99befefe3e956740f0ea69378ab2ccdbd58a9f2fdfde9c651bdc9a91a6a368a48d6f0cfc0df0fccab776168b74cee5658987c898ea093d79e6bb287e15e8be12b496736e2e2fb83f68eb8c8e82ac687e238edec4c3641954a65d09e49e99f7ae5fe23f8fa5fec9f26c114dd37cbf3123b7208a73a8e5a23cc7cb15a1e15ab787575cf19de5c3a30855c80c48c8f5ae8fc39af68fe1cd581d3ee1edee266303ae79c1e31d2b979350bdd1ece4b9091a4b21fe2e0fd315ce692da878af5e51e49937ccaedb3ea08ad230725793d11e354a8a12b47767d4fae6ab24da10b3338b88d61010b755561d33eb5c8697e70f252667d9321e19bae3b0fc6aee9d7f7971e17b5b0bdb7c3960ccd8c10a36e00f526ae5adc2c771141b3115be5f7380a402390735c124a27a516e4932e594f771b448143ed551b33c75c9aee74599aea32e4953838561d09ae5b43bd824999e3b3c8392ad9e3935d6cb72ef6aa90aac4d1ed7d9fdfe7b62b99c5c99d91928a29f8defaf74bf0c5d28553308d99cab7518dca3af538c5765fb0f7c017f877e1d9bc61abc6f0788f5b8dbce83cd668e342db8647f7b9ae36c7e1fea3f19ed12ced6e6e340b7bfbd8c8bc8ce25852339664ff0068b2a81ed5f62f867418bc31a1db69f14925c0887fad998977627258fb9eb5f4b81a7cb0b9f2998d4e69d8d5349b683f4a4e6bd43c613228a55eb450025147191437d6800fbd48d85a5148dd6801291ba52d21ea79a0045caf228c6ee49a4e49a5ef4009bb34528c0269adf7a80171ebd283439a683c50306f956852769a461c528fbb4084e68eb467e5140ef4b5286d2ad2bf4028fbbc51a8cb67b5079a41d68269901cd2351cd2e2800e68e68028e9400014b48beb4a73d6800a45a5a4e6801693a519e98eb4374a0007cd4bc74a41de8e6801d9a393412314940052f5a4a51de80178a334d1da9c4f3401c9f89ad9ecef92ea33b5663b4fbb5416f79c85c85257e5635d1ebd6eb369ecadcf20e4f51cf15c6cd6f3e9ff007ca96518de464915e6d68f2cb43d6c3cb9e166685f4d1b32bb940bdcb2e3f01589af5b5cde4128b511f93e5e6485a431b31ebc375f7f4346adfbfb511c0d3091464f92000003cd664daf472dd49006674750c8d71360337700f51fcab95cba33b631b2d0c4f0ee9eb3ea8c8c4c825193247f2bafb718ddf5a92ca48adee2e219237b5b78a4e2699768c83dcf6a96e8dd1ba91ae61668e7188a2b77774e064820606efe75564d692257b178143051f32a156da7fbcb8200f7c9ae2a915b9e8529bfbcede3917cb0c9cab81c8ae57c65612dd69b2c502012e7ef77c77a9b44b85b48d2de19da568d806dc738fa1ef57753d592d641e6ed7887cc140cb75ef473de26d1838ccf98fe205adee8f2433da116e2362c64918e55410011e95c1eaba96bda899159dde58d701b69c124e71f857d01f1035bd26cd64bc68b6a952923050cc47a63d335e1be39f1f5b5c59cf3e9f34714a06d16ec366e18ea171c1038cf435109743ae5149735ec79b5f6b9adde5ba33b34b1ab7441f7bdf3576d66bbd4b52b5b792e9e06752f2077c6e0071cfbf5ae6a3d4e6b78e3db031897e668954e33d8fd2bb3f0c598d43f7f15a49137465cfc817d00e6b7968ae704539bb5cefb489bfb1638a482ebce65182c8431e9d0fbd707e28d53fb6efee2590c91f96fb8c4b1924b0e87db35dbe9ba6936ab16489836538c1e79ae57c4fe569972224426edc90e1640ae463d2b9a2db91d156d08591e59e21bbbe92e3cab44587ce4036c8833faf35b7e0bf0cdd5adc79eba85b24dc23216c05ce391ef54a48e5b6b57b8789a30f3a8ddb4b156539f95829e40e481f8d7a3786561b8b5479e18619dbe533c2a5db9195909030b81fcebd193b42c8f0e2b9aa5d9dd685a6bc1a6437972d0ceaa18c32484963c6339cf23dbb5578d9afb5497cc8bcd5180a557057eb5a5acc2d0e9290da86b56080c85b0139fbdf29e833e95cd4dab4c2d56cac19ae2ee4655210ec2011d48eb8fad794e2e4cf66325147556b749a6c96c88592296430bc2a319c293919ea2b4f41bc37fab26dcdc967609b7fd5a0c74fad731a69bdbe950dd3452fddd8d92e1f9c12a6bd8fe1cf8560d8b711c1b608189890f3f31ea455a8a44f3391ec9f083414d3f4f924d982b8403d09e48af46cee6f6ae6fc036e61d11c91869256cff002ae8dba9e2be9b0f1e5a48f92c54b9ab484cf6a369a4fba68ae939053436077a30692800e68eb49eb4b40098c2d056968fad00357e5cd376d3b8149cf5a004fbb487bd0df350176819e94008b4a7b52f4ef4d66dd8c0c7bd000c73c5228a2979a00475c8cd03b505a80c41a006b2fcd4fedf8531896614ad528a199c9c50df350a3e634a7b53d465bc9a5ce0518eb4b4c81bfc34ad47345001fc347f0d07348680170297b53471c528ea68016939a3f1a375002d20ef46ef6a3af27a5003b8ef49f4a6eecb1a55a005a28a0e36d001fc3f8d2f4a6ff153b039a00075a5a6f5a72fa50056d4977594b81dab0ae6dd2ead9772fcc7a1ef9ae86e1775bca3b104d625ab2c91003a572d54ae76516d2ba380beba1a66bcd6b72e504e985dc85d5fdfb648f41d3bd635fc76cb7f2431e49ffa62aa8d1b1e32c471b5b39c7519af44d7f4587508dfcc45638daad8e41f6cff004af1cf1a47a943756d6e42c1342ca0dc4ff224d164fdc232770f438af2a71707a9ed5392a8bcce90e9286d23ff004ebb12db4d8167322054e3a92dd49f51d6a86a13dc6b1a1c8f3db886dd5b1e64c837939fe10d9cfd47158fa3eb6fa8c314126af15cbdabb445a68d6095b27855ebcfae0367af15bfafde2e92b630497925e2296768d1c197918c75c903e952d2922e2dc59c4d8ebd716f2343e77fac38419cb8c761815a91ea8752b76d8e2278ff0076ed7430377b8c75aad7be0d45be9afdd895dacf0ac71b12ab8cf40725fb64e3a574971a2c50e9b0de099674f2c2b3171ce7ae73dbdab91527b9ebc6b474b9e75e30d360d52c5c4a9991be50f196c71fe35e45a8f82ed9af1e35873330e449cf4e31cfa57a4f8ac5cdac3262450f3962777f0e0e3a7a7a1af36bef1048d746170b2ca488fcc4fe107d6b3d6fa1e8be571d4ce87c2f069b88e40cca182aa9c6493ef5ddf87218747814c115bc926dc65c0639e783fe358daa470dad8aa22249b57919c106b98b5f109f3044b6a1d621b9b27dbb7e35ac6ece3a9cb03b7b89aeb5bb813dadb1b5663b2368dc7cdf9550b5f0cc56ba881abca92dfccc4ee76663180323903ad62697e3c30dc116af37f6c489b638e3285173d475e2b574abc86cb5884df43f6ad4244326e9183664ea14e3a720d68a36679d3a9cc70379a3c971793fd85a775fb41764600a93fc2e1782dbba67ad74975ae41a22e9f6d671e6ce162b34522e36484e0819edbb39cf6ad9d6b5f834eb7bd9f51096c64f9215872bf363e5da7d88c57975f6b62fa6864b4ba17ae252247b8cee4909cae187de0473f4515beb289c2da8c8dfd63c40fe23b88eca18512c3cff009d3690f8f7f5c574367a4c51c30ad9c71a4bb7324aa76864ee09f53e95cfc378cd706de38a337b36d1248a19b73118c9ce723f2af40f0cf83e25582399e4dacc19caf209cf3fad724e4a28eca717519b7e0af0cdceb17f0623f26d23c158c0c84c761ed5efda4c42d2cd4246228d576aa7b815cc784ece2b1b7890a3038fbdc7e55d54920f2178ebd2b28be6d59d328f2e88f52f06c7e5f86ecf9cee0cdff8f56d566f86571e1fd3ff00eb8a9fceb4781c57d6535ee247c4d57fbc97a81c734da7738a6fdead0c819a8a00a56fe9400948a294e0a8a41f2f4340094b9cf19a4a181da2801390d416a41d693277f3d2800c9c514a3149cd00232e39a451834ad8c523745a005f534d56ef4e63480fcd8a43e82376a1bee8a491b0d8a7760698c4e15334c66269dd4d0070696a311385a7ae298a7b51ebcd242b16f268c9a4c7278a5aa24419cd3c3718a68e01a4a007668dd46ea3b1cd001ba8e693a2d0cdcf5a0052303347342f5a3140098341a5c0a439ed400bcd1fc429375383714009b697b0a4c8a5a00290518a7645001c669547cb4dc8068a0019772b0f623f4ae72cdbcb038fba76d749d71f5ae7b3e5dccc39e58ff3ae6aab6675507ba2768c4b19ae63c43a3c5a85ac90cc81829de80f1c8e738aeae1fba33c8e9556fad0365b1865ae79c5491d74e7cb23c0f5b8effc39a95c35c1b58e265011665250371c96ec702a6d2758b0d4a317d6ff00658cb43e64b3c246c651c01bba903fad7aaeb9a4c1a958cd0cb024cb3218e457e411eb5e07aa6837bf0cb509ef6c206d534e27125aa44c76609384727e5603d08dd5e7b8f29e9c65cfa9bf0eb7369fb545af9165e77cb18915d864fdee7a000f3dfe7ae5b56f175ddd78a0ff00663eed29d1d7ca6e0642919c1e71f2e703aedcd625c7c43d3fc6d67737ba3493596a8c7315a5dac71c96a1540da50648cf2c77773d6b23c4170ba7dbe98d62ab33db8065319daf2bb6e65257ae181ea6b3936b43a29b57b90f8cfc55f6ebd482311abc6e6008dcf3d411e8bbb15c6e8b66747d584f790c7736f348aa6294ed2cbd4907b8cf14e76975cb5967b98d2c996e305611caf1ce31d413589e29f10dd6a57da65981e6c56ea5195493920601e3af15925a9e87b656377c6fab595e6e5882fda306411ab754ea318e9c578e6b1afcf09922b7964007279cb74e41cfa5749ab482ca1950db959edb6e58b6180dbe87eb5e65ac6b0b6f22b20592663b9bd33debae8d3573cac5621d8ea34fd4a1d324592076fb44d1926698fc8383cf1eb5dc68b716b35d4322ea42dd641e53856cac808c1cfb13c0af19d3e699a48aeee6090a26421e8981c803daa5b8f143cce160db0459f9db71054f7e7d2ba9d1e6774798b11cab53d2be2078eadaf214b0b745952dcaf9183b8b3018c01cf07359de1fb8b9be56d3ace26fb4c9b4cd34676c6b819c100751dab88f0fc777af5e2456c854f2a66da589c37041f5c77af7af03f83a2f0dda1766f32e245dd86e89d7f335cb5e71a51e53ab0f095697374367c23e114d0ecf74b72d733b36f32b741c741ed5ea1e1a876b1429bd5083cf7fcab928ee84db7952ca402b8c64d771e17d3cc32accf1e24c6e45c60015e1ce4e52b9f494e0a0ac8f46d2a33b97e600633b4f19ad69630f6fc22c7ce46de6b23494136d601430ea3a56bb452c71e0f001aeaa7b1cb537b9ec3a2a98f46b243d7c85cfe42ae6ef7aafa69ce9b699ff009e49fc85586afae87c28f869fc4c693cd1bb3401455902529e692939a005e36f4a6934336303346769a00291a9cd266999340064d276e94edc76e29bb450006900a5ddc114c5e38cd0038b7b51e948dd690f34142b8e9cd20e29a09dd8a71e9f854dc351ad8dd4ac7a7347f0d0dd3914f5181fba31460e69076a563b568d404a370f4a36fcbba9bba9202e8f4a29283cd51014ee69369a3140052f3471499a005e2902f268a3268017eef146da39a5a004ebc5252f340eb4007346ea370a3f8a800ee294f3c8a4ce78a3b50018cd2d03a0a326800a3f8bf0a28a0051cd604c447793927187ae839ae7a650da95d2fbfd7b573d6d91d347765d857e418e54d127cb91da9f0fcaaa08e08a9766e273d295ae8ae6b331ae205c96238359fa978760d46dcc7b7e56c86031ce6b7ee902b0e39ed4cb5c36477ae794137667546a34ae8f977e2a7ecdaf7d37dbb4178f4db988ef3245f29979c957eb904feb5e317b7dab78235658bc47a5df3c12e04973912c448e7710a3280fa76082bf41751b159a16cafb579b6bbf0fe1d46e999f942c4eddd8ebd735c15a12a7f0aba3d2a13855ddd99f136b1e32d2b56be3a85add5bda230091c5f3107e5da59b3d2b0e0ba5d3f5513d9b41732a46c633bbe5202e724fb0ed5f5878aff675f0a6ad186bcd3a0764391247c91f88af32d53f650f0daf9c61fed0f25d36ac0b210b9f5e6b97da462fde4d1d9eca72578b4cf96b5ef1547a95cb6e9cdccd21255027ca7ffd7d6bcfefaf84970eb1e18b6406f439fbb5f596a5fb2ae99a5dc4b3cb69712be3f70d34ff007702b84b9f84cdfdac7cbb40f329218c299e3ae491d7f1aea8632947448e0a982af3d64cf126b7d6f5431d8db24c6d90b048f7e000c30703dc015e81e13f84d73aa6dbad4e4967793974c6173f857b2784be11fd8dbcf9c2c63f857f888af445f0f5b6951890a956c61573f31fad63571d292b47437a397462f9a7a9e53a6f8561f0fc6123896144efb71f81adbb7d4a609e444a2553c96e817e9eb5635e81eeae3cac954dd964ad2d234b86da08d4000af25b3d7f0af3652eacf5610b68b624d0ec44d77e619198b01b999793f857b16850f996e3cc4002a0fafb5701a45bf99322dbc2cccdd4edda2bd0f41d3bc9dcb2b30ddced53511d59b3d11d669966bf29030c3ad6a4d1feed942e4f4a874c855d155304018c7b0abd2305501074af4a31491e64e4ee7a8695f3697667fe992ffe822ac1e6b33c2f782f343b623ac6bb0fd4715a840afa6a76714d1f215138cda633148dde9cdd29ac3a55998678a6d291498340075a52a1474a6b66919b18068003d28230697bd34fd6800fbcc7da9a69578c9238a4a0045186a77dda693cfe141f9b14b51ee0df7b3467737d286c6de86917a51a8f5171f31349cb51cd27148614673c514d1f78d2014b1dc295cd23678e686e940001b8529c2f18a4dd8c523316a00b99efe9451475ab205dd49cd028fc6800a3766972692800a70e3b527e34b9a0039a4cf068cf4a3db340083b52e4d1cd250028c50786cd264d1b7da8017b1a56fba28c7a50dd2801314ea6ad3a800a33451400abd6b9fb91ff001389bf0ae83a751589758fed294ff7b02b1abb23a28eecb70bf4ab19f979aaf1f205580bf2d4c76096e56b8c30c5436e30d818c54d329ddb978e304557b34ccddeb37f11bc7e1341a3cc3c7a5625f5906dc18f5e6b79a31b79e0d665e46cd9f988a2ac5343a32717a1cb5ce93133afcbca77cf5151be970794088c01deafdf4326787159f3248dc071b9472a78fc6bcb9249dac7b3194a493b9cdebfa6d9f96247851ca8e37735e4be2abb816e36a44aaab90362f3f4af4cf11ca91c644b21700e4ed3b47d335e731b5ba6a2cd043193d06e21c0fc4f7af1ea59cb43daa49a86ac76836bf6e0152dde3893f8d8f34cf145b4105ab381f328392fc9ad9b5b916f14b8399d864aa739fafa564eaba5dc6adb24b9904310c1f297b9a9d917ab679a0b192fef9c451b2fcdc3370bd7d2babd37c3c51f94dce17a9aeaac3c3c8cc31177ce456ac3a68b704e1723f3a9d58d5918765a7ed644197e32703a5767a5a0f94803691c2ff5acfb7b091d9dd5b6aa6082dd456d59c326e4728c0fa56f4e2ef731ab2d0dfb18446720f00f18abad18dc4b2e7d2aad8ee6d84fcbbab464da233fc5919cd7a915a1e44a4f984f0a7883fb1f5a58266c5a5d9dbcff00038e87f1af4ce7be2bc33585371bdb1f2f518fe1c7ff005ebd27c03e2a1afe9e6de66c6a16c0093d597b30ae9c1d7d5d297c8e3c7e15f2aad15ea74cdf7a90fdea737dee463e94d38c9af60f046b75cd0cc5a8c8a466e2800a46a3716cf3483de90007db914dcd2330ddb7f1a376ea45214f34c2bcfd29d474ed48621f9b1cd2d23360629a33d0f4a603d4faf4a8dd867029f90a299b7760d201dfc348a79a188dd4bbbe5a000b72290d0b433500237634e0dc63d69a79a419140037d68c9a3ad215a00be693a76a302839e2ac81776693ad0dde8c018a000f4a55c6da4e8b403400647eb4bd79a4e28eb40051464520eb400e3da8e314945002818e68a427a5001eb400fa6d0785a453400f03dfb514da506801c0f349cd213cd2af5fc6801f587365efa7f6615b4c6b15bfe3e266ff00688fd6b1abd0e8a3bb2d27cbdbb54e8d95e2ab7215455856dbc5444722bdcb1c9c0e6a1b66dac5bdb1535c67e6ed5145f2e2a1fc46abe1b1a4ad98f3542660ccc380dec6af43f34754e6b726627853d9b1573bb4453d1ea645d593cd2672c00191ef589ae49159c07cd60ad8fe335d64f0886ddde4ed5e43f1035886291b018ed391b8f15e56265eca37ee7b7838bad2f4396f176ad0b5c2a47890b1e8b935c8c6b777174db17ecd17d6aedd6b502dc2bcbb5015c953ce7deb2ffb7374ccca8a173952323f4af0fe2d4fa0bdb43b0d2635487cbf96591700b77c66ae9d31a66c2e140e958fa4caad1092353b9b9cd751a6ee599779de428249c55c57368c972e5d5135ad9a43852725875a924b75873205c9ce7d7f1abbba38e369498ce38c55493505972c8b950769edfe457472a8ab1cdcd2930893ccdadfc39c9cd68dadc2daab724f70335423593e457dad9ff9671f6fad68471a4730dc55ff00d95e95ac0c67e66ada42eca3a81eb5a1e4a792428fba393eb55adf2550fdc38fbbed56e393cc5039518aed8e88f3e576ee62de43f7b6afcb8c9ac6b3d4aeb41d41750b66db728704740cbe86ba0bd898b0c29c5675e590792242a4e79f61c570544d4b9a3d0f4a9b8ca3cb2d99cdf897f6d5f0b7c37f1441a3f8ef48d4fc2d05d7fc796b2b17da2c2e3d46f4c9423b8238f5af58f07fc5af06fc44b68a7f0cf8a349d6e29002a6ceed1dbf2ce47d2bc83c79f0f740f88be0fbdd23c4f6715e6932e73e67ca518670e8dd981e847e35f97be26f0dc7f0afe246a36565a89ba8ed25616d7f19d929407e56dc0e5580c723a9af770b89f6cb965f11f378dc2fb097347e13f731bd7a53326be07fd9cff6f53a2d9dae85f10a49eff4f53b20d754799344bd02ce3a903fbc793d6bed9f0978ebc3fe3cb0fb6f87b59b3d62dfbc96732bedf623a83ec6bbf53cdb1bedda9bd41a52bb45357a9a81ea1b697eed26ecb5216f9b07a50317750c70b81d69334bc75a006282df853da99bb34dfbd9a00933c0a6e79a17eed318e188a007f1dbad2e4ede949b738a186d3400941e477a18d09c500236568ea334adf3628ed40099e99e94a4d36866a00bf91499342f5a3755902af4a39a4e68fc6801451477a28011a968a2800a4e4d2725a9c3bd00147149cd1eb40099c714efbbde91686a005a291a8fbb400b4b83480e39a33400fe829b934ddd4c9ae23b585e57655441b9d98f038ce493ed400eb89e2b681e59dd52241966638c0acab265990b8c10c73c74af927e297c70d43e3d7c6ed07e167806e8bf876caea3bef106a3192ab2430c8acd1eefeee463df15f4eeadae49e1f8ecca5a3cd1cafb1c2f5418ea6b96bcd42ce476e1e9ba978c773a28d42bd594f98540adbb6b673919a9e3eb4e244b4dc82eb31f23902a3c7a55ab81ba36efef54e3de8402322a65b971d625bb77daa0669240c25cd425b6f20ed39a26bc11afccd9ef4efa6a4f2bbe865f8cb501a7e8b2c848ced3dfbd7ca3e30f145cdf5f3ed91631c80457af7c6ef1cc56f63f65460ccdd857cb179e254fb54a5b0eed9c275c735f3b8b9fb5ab68ec8faac1d3f6146ef76741e696fdecaecf18eaf9ad4b1713636371d093d33e86b9ed3d2f35e459228c5bc7d3cc7e3f102bb3f07f8625bcb93123f9d2e77bbb7dccd73f2f43a399bd4e83c3978b6303f9c43ccd807be3e95d469d15f6a0c4a46208d49cbbaf2467a8ad2d0fc1f6b6ea812012c99e643dbe95d0ff00668182a5502f1b57a9ada1465bb339d68ec8c97b186de27498b5c6e5e453a6d925ba0585636e83d6a7ba8719081bd76fbd57c33310400d8efd33e9f5ad2d6d0c93bea46d0cb1320dc01eea3bd5b8d4c2c4aa80cddaab1c0242800aff007aaf5ac41b01d571dce69c77d024f4d4bd6af2b36e201dd8c9ad5563818248159f0c623fbfc1c715a36f3208b040dc0641f6aeb869b9c137d88a50770dc38ef9eb546f5e1d3ede7b998ec5da77367a0ff1a9aeb548e3b79266610c0a0992790e0015f1afed4dfb5e69d616f71e1cf0b4e6fb5062566b807f7710e8715128b93b415d9a29469ae6a8ec8a9fb50fed470e97632e83e1d93fd2e4c867079503a935f0edd5e4f75712cd3c8d2cb21cb33517d7d36a57935ddd48d34d2b6e791b9aafd1457ad86c32c3c6ef73e7f198c962a5a6915b22ddb6a12dbe36b715d37867e216abe13d420d4348d4af34abf8c83f68b19cc6e79e9c76f620d721ba8186aeeb9c09b5b1fa53fb34ff00c141349f12c765e1df8912369daa1fdd45afb002dae3b01301feadcff7ba135f62e8fe22d2bc451b49a5ea3697f1800b35b4cb2039e41e2bf082cdb6c64336231ce3a66b7b49f146a3e1d533e8fa95de9771bc156b3b8681bf352334b951aa9f73f748677734c6ceec57e41f857f6c9f8bbe1058dad3c6d757ab181b6cf58852e633f89c3fea4fbd7b2783ff00e0a6de33b0913fe125f07693ac5bedf9e4d36e1eda5f72a8f91f864d4f2b1f323f461576fe549d4d7ceff073f6ecf86ff17352b7d26696ebc21aece76c565ae6d4595bb04954956fa715f44e06dc8208f6e9536290d1e94abde9297f1a431179a1880d8c51bbde9a47cc0d003beed12367146e39cd20eb40037ddeb4bfc34bc014cdd9ef400bbbad355a8ce28cfcd400e6f5c5264520248a6d006851bbe6a293755903f9a29946393400ec9e68dd4631cd1b85001cd2763cd1471eb4008bd2968a173400b8ee7a523f4a466db814605002ad0c6947dda4a00013b69437ad2560f8abc79e1ef03db0b8d7759b3d2a3c1f9ae250a5bd803c9a350d7a1be4d3249e38177caea89dcb1c002be4df891ff0503f0d787fed36be15d3e6d76e632556ea4fdd4008e3383c9af937e297ed65e37f8accd6da96a2da669c7fe5cec4f971b7a024727f1abe5655adb9fa01f14bf6b2f017c319a5b49750fed6d551598d9d80f336e3a6f6fe1e6be38f8c3fb5c78cbc7ba55d5999868ba5dc29ff0044b5c8668cf2373f7e3d2be7bb733dc30fb4642a1cbe3ab7a669faa49e75b34666670508dac791e956a22f43ed6ff827bf83adf4ef86dff094c91e350f136ab3a1661f3082df72220f6243b7e35f67476e1a11b80233debe46fd86fc5b6fe26fd9e6cb49b52835ef0adeca5adf77ccea59994e3d191987e15f5d6977906a56305d5bbf99148bb948efec6b8e71bcf536a6ed0d097cb55e0703b508dcd4b32e0600aac0fcf53b0d6a3e4f9ba038a48e3ddc53f96a55e2985ecac364b50d9c0e6b1356b79955fcaf95b181f95740cdf28aa578a854b375e959d48f3236a536a5767cd1f113c03a9ebb7524b25d363a6c8d7e615c2e9ff0944375b2f3ca4c8de148e463bd7d45aed8f9ea0c4bcaf53deb919b418dae37b46a927f799b27e95e04e838cb43e9a9e214e2ae70fa5f82ed23b7877397da70ac3a1aedb45f0e88643e4422285402491d7deb42cb488d86482c4f3b89c639ae8edec91554b333f755cf15b53a3d59855c469645786cc471e4371ed51dc46abc8c3377e6af4fb23dca36aa8acc9e658c3babf7e4d74cac8e48de455f2c7cdbbe62df7145569e22e029ce579e0d5b5de1449b36b1f98e7a9a8a2b76790b32828c72147f5ac1c6e744656d4a922b5baa9451bb19c9ab30c333a2c842effcb14e96df1202403b4fddf4ae67c75f14bc39f0d74b7bed77538ada255c884b0dcc7d00a518eba95296973b7f289b78d8be4aff000ad729f10be2e7847e15e90d79af6ab0da8552446c7748c7d0015f187c5efdbfb56d59a6d3bc1368ba7db9183a84df3487dd57b7e35f26788fc55ab78bb529350d6351b8d46edfe632cee49fc07415e8c30f296af43c8ab8b84345ab3dff00f682fdb2359f89d7171a6f871a5d23c3ec769da76cb28f53e80d7cdacdbd8b336e63c962739f7cd2515df4e9c69af74f26b569d67798514bdc51b7e6ad4c04a54c7eb4ee371cf4ef41fbc00e845004bb88c0ce6a659369dbf7463273deabf5f971526d2fb7e5f948c551448b28fbc4f4e8074ab6b789332a88f03f8bbd67b7cad8db93eb4f53804e71da819a8b7436b6638e78bee9594641fcfa73e95f57feceff00b71eb9f0eee2db48f1344dac784dd962d8ae4dc58af4dd1939dca3baf6ed5f2240a56df7754cd59b6b836f2861871d793fa51b9516d1fb85e09f1ce83f11b418759f0e6a96faae9f3676cb037461d5597aab0ee0f4addc7cc457e3a7c1bf8e5e21f839e20fed4d02ebecab3b0fb45a392d04ebe8e9d3f1eb5fa41f033f6aef097c63b58ad5ee1347f11ec1e669f3b80ae7b989fa30cf63cd4389aee8f6a65e6908a521bcc39c7e1d28fbaa6b300fe1e94887148ad9a3ee9340c4932d4dda69ed81ce38c734c56cf4e9400ea38e69bfc54e6c62800561b6937522a86a5e0714017d7bf14debd7a51b828a41daac81f4dddf3629776062819a003ea78a4e2979a41de800dd4bc75cd20eb46280056cd39b348bc557bdd52d34d89a5bbba86da251b8bcd22a051dfad01af42c05a5db8af13f1d7ed83f0d7c0ccf01d71756bdc1db069c865c9ec0b0e057cd3f117fe0a3bac4de6db78734983470a768b8bafdf3b7bede00355cacae5ee7dedaaeb563a1d9b5d5fddc3656cbcb4d7120451f9d785fc48fdb5be1e7811e6b7b5bd935ebd8f90b61830e7d0c95f9c5f11be3c7887e20491cfad6b379a8c9e66556673b07a610702bce352f145e5db1128e01e838155ca96e26e313ebbf885ff050ff0019789fed369a14769a0d91242345969f1db2fd01c57ccfe25f885acf8b3507bfd66fa6d42e48ff005d732339fc0d71525eb4c436013edd29ef78cf80e78c0c6de40a64f397e4bf980936cdbc31f953754ba2c6f36a1bee07fab1e690467a74aca6fdcb33ef0cc467f77dbeb5b9a45d2c9e782e126641b370396c75a6895b9d2dbdeab4618ab6f7197663c60fb552d5268d9b6c614c4ad9fad65e9d7c5b1193bd3b053d3eb45d5c4626ddb83af753dfe954697d0edfe16fc5ad5fe0cf8cad7c4ba148125c08eeec5ffd5dd43d4ab0f5f435fa39f0aff691f0df8ab434d7f4c94a69f210754d3c9fdf69d213cc98ee9b8924fa9afc9db8b967656424463ae7ad6c7863e206a5e0dd52df50d2266b5ba8890648f38914f5571fc4b8eb58548f32d371c26a32f7b63f712d753b6d4215920952446019594e4107a11ed4d973bc1eddebf303e0dfedb7a8f81b367a92799a633931f920edb704fdd55eca3a01e82bed8f843fb4b7853e2746b15bea76ff006adbcc7bc039f4c5703a924f966ac7a0a945ae6a72bafc4f6b422a406a08668e78f28caca791b69dcee2315b5ce6689246e9556ea41e59c0e3be6a5391c541346187ad44b545c346616a0dbd4ec52bdb3591f64c0ced0cff00deae9a6b753c95cd42b6e376401f80ae5942e76c6a72ec6458e9f234a4b8c16f5e7f1ad45b671c87c003ef5685a5b08f712001deb97f1c7c4af0b7816ce4975cf1069da422ae7fd2ae550f1ec4e6a9439512ea73486ea3208436d5cb9e2b39079922efce7a9f415e09e31fdba3e17e93248b69aa4dadcb8ce6c606743f463c578ef8b3fe0a2d71249345e1df0b6579093ea32e31e84a2f5ac9529ca57b1b3af4e11b731f71f9710cb120b763fe15c17c45f8ede0af8536b24bafebd6d0dd81f2d9467ccb87f6082bf3a7c71fb567c4df1d2b4573e227d32ce40736ba5a7d9d483db77deaf229aea4ba9a69a47926ba91b734b2397673ea58f27ea6bae386fe638a78d5f651f5cfc5afdbf354d7964b2f0569eda5db0eba85ef3291d3e541d3f1af953c45e26d53c5da94f7facea535fddc9cf9970e5f07d0761591bb2deb9f4a565dbc62bae14e30d96a7054af52ae8de83594f527269b522a12a48c629a02f6ce6b439c6f7e94fc007ad0cc7a521e940872ab11bb185e99a7799b2128067e60775463eef5a43c601e9400e3d57764f3c814e6c73b4e173c66a3c77cf4a72956c923f3eb4012c719619dc02b71c52b301851c60f5a81b3f311f769cb2118e9b698ee39a4e8588f6a7062dc14523af151aed0b9ebe868c90c086e4503d49c6308039ebf32ff0076ad43bee1c438181f7723d39aa3fc7b99b6fa1f5a559bef6460d30d8d8b5f36491bca50ff002eec2d6ce97ac496b3c3730ca6de65606360c7319ce720f635ca437a23da0e571d1b766acc7a9a9b8ccbc8fef7427d7f5aab94a47d8bf09ff6e9f15f81e4167aebb78b74b52177dd109346071f249fc5f435f56f817f6cef869e3968616d51f41b99401e5ea89e52ee3db7f43cd7e4faead15b5b47336373b30214f3815a1a5f8ba166413ec8e257c31c6473dea6c997cc99fb7d6b3c3796e9716b347710bfdc92070ca7e8476a7b75cf4afc8cf037ed09ac7c33924ff847bc4f7d616b923c9830f049ee51b23f21f8d7d35f0f7fe0a2115c4d05bf8a74d8a78f600d79a7e5581eecc878350e1d8aba3ed666e6855f96b92f87ff0016bc29f142c05cf87b5882f4e0168721258f3d993fc2bb06c0185a8b58a23e56924ed4bc63de907348072b1191494739e948cbcd005ee09e4527dd1c74a3eed1b6ac80ceea70e94948cc15496385ee49c63d6801d8a6b1dab9242e3939e2bc47e307ed7df0ff00e11c37304ba88d635a8c6069ba7e1d81edbdbf8457c29f19bf6fcf1f7c48b59ec348957c29a5c8363456277cee3fda93b67d05351ee3db73f463e227ed01e01f85b0b1d7fc476b6f71dad22612cc7fe00bcd7cd5e3cff829a681a5cd2c3e16f0ddc6aa7a2dcdf4be4a1f7da324fe3cd7e70dc6a5737924b2dc4b24d348773cd2be589f73dcd54dddbafbd5e888e74b63eadf19ff00c142fe23f8a6248b4fb9b7f0e312c1dacd060af6019b9cd7857893e2cf8a7c5f3493eafaf5fdfb96cffa45cb37e18edf4ae2141e4052475a036de578a7cc2f69265e93546f98b160c3b9351cf70fb54ef07f1aab23093040e68693e555618c72295c8b9279c598e769cf7a6331c803269a00c039f6e68e9df3489248a43197e71ed49bf82431dd9fbb4c1946c80050c4bf3dc9cd03b926e0e010595b3d2addadd3dadd42e7a8ebf43540318ce41c62a5fb6191407e7d298ee749792232ab449b4b28cede3273c67d78ac99aede404e70738a4b3d5846a91ca374684ed6ea5735666d3ccd0f9b12930e38917a1a657a15967da25208127618aaf946c166c7a525c4324270e9bbbd576901c0db8eff00fd6a44961e421b20020f7ab16ba94b0dc24b14ad0caa3e5922628c0f6c104567b485fda9371534813b6c7acf85bf69ff008a1e0b754d37c67a94712f486e584e83dbe715eb9e1fff0082907c4cd15546a36ba46b630bf7a16809f5cb0279fa01f4af92b7d1e61008acf96269eda7dcfbe34dff0082a75d2c23fb47c031efeff65d4491faa0ad68ff00e0a9da1329f37c03ab799dbcaba84afebcd7e78eeddf850a7e94bd9c4af6d23efcd4bfe0a851c96f23e9be0098cb8f94dedf851f885535e71e25ff0082937c4ad5a055d274ed13c3c08c16585ae5ff0002c40fd2be4b0ceec6307de939efd68f6715d01d69f73d5fc61fb547c57f1c45347a8f8df544b59000d6f6522db21ffbf601c7e27eb5e5f7d753ea174d71773c97770dcf9d71234b237fc0db9aaff4eb4bc8eb9abb25b1939b7d49770c61bf0a5560bfd298bbfcbddb3e4ddf7b14dfbb8fa5316a4a5c37de391dc1fd7f5a3cb3e5b31ce17ad44d27cb8a4673c0ce78a043d582b1c74a4625792368fe751ab1191464d002ee34e8e66824596338753b8700f351e7e6a5a0419fc697236f07269b4500007cd4514b8a005fba7f0a4a4a28014918a553b79efd0537bd1d38a005edd693b0a36f1450014eddf2aafbe69bcd140052ee39c838a4a5faf4a000b1249eb49bb268a3ad003b7559b5bb92dcab86c6d3c11daaa714bd0d319d7787fc61a8f87f5086ef4fbeb9b4b88f949ede428e0fb11fd7ad7db3f00ff6f9934f8ecb47f1fbbea56ec7035789712c7ed22f703d6bf3f6198a7031c9ad3b2bcf29b6f7eb4f47b9a464cfdccf0df89749f1ae8d06ada25fc3a9e9d70331dc404153ea3d8fb5696df7afc78f83ff001e3c51f093568af743d4e448430696c643ba098770e87f422bf43fe04fed81e13f8cca9a7debc5e1bf10f03ec373300931efe539e4f3d8d66e26a99eeea39a6ba6e6a95902d2735032c8e695ba560f8dbc75a1fc39f0f5ceb9e22d422d374d83969a5e84e38503a935f16fc5eff8293c1147259781349259b2a353d43e5c7baa1e6b44ae47a9f6678ebe22787be1be8efa8f88353b7d3e05195f324019ce3eeaaf735f9e3fb477edf5acf8e16f344f0634da168b2068dae3005c4e3a1191d14d7cd5e3ef8a9e26f891ac4bab788b55b9d5ae18feee498909183fdd5fe1ae24b7cc4d5dac4b9db444df686b9977f2e4e4b739c9f527bd4454ef258607a52099b208e38c530e1a31c65bbd2311cdb78dbd29bc1a6af14b4807ef75e031c527d7ad37d334a48ed400b475c9a28538e3247ad0014f55dc0f404739cd12155930bc8a66ed849fc29a024688330eaa0d355001cd0d21e01e452f5f941c01d69ea50c65a31c74a5f71437ccc36fa735248dee31d6acdadc4b6ad9476527f854f07ea2a0ee282d9381d698d1acbaa4330c5d41865fe28db8fc8d43f67b6b857685c29e31b8e0f5e98ace56a1b939a771934d6863385e78ce0d41b597a823e952c771243801be5ea158641a95af164cb792aaa483f29c74f6a34114fad1c55c492ddbe66dc33d8a7f85452795b8e08c763eb4808297f1ed532f97953b81cff8d08631c374fa668b0588573d734bb49e475a9199379c74ed4be785e8aa4f6cf269086ac2ccac49e94ed88b907190298cdbb93d4d3073cf6a0097ed0fe4b45b8f945b7eddd85dc3daa23f352e7d4f1498c500251f8d18a2800ce08a5efc9e2928e94005145140076a28a5c8a0008a4cf6a93ce7f24c40e232c1b18151d0014514b4009452d250019a32281c52f7a004a3343678a0f5e9400514b483bd00140c8346052f4a0056d8ca0e4eec1dc36e286c630073d734949400e0dc5491b9da17f1a869e0aede94c0bf6f36d7e1b0d5b1a7ea0eac41900da436fce08239ce47439ae6e3f5ab31dc052a18ed07ef7b8aa293b1f6e7eceffb716afe14369a278bbced77c3c81635bd660f756cbd3e623ef28fcebef9f0ef8a746f1868b6babe937f6fa869f74bbe29a060463d083c83ec6bf0d21f104b6a7f764051c74ea2b6b4cf8a9e20d15644d3751bcb28dce592dae0c43db807de93499af323e88fdb93f6905f8ade22b4d0f47f33fe11ed2e4664937e05cc9d3ccfa0ed5f265d485a439183dc56a78aafcdf6ad2b6495070be8076158dc06e99a5b11290f2c4e304e2a37c353998b2f4c5479a0cc76da46e9d69075a72e29009934ad838c0edcd29ef48a7e5a0045fa7cb4f6dbe869ab81f78714bf79a8011721b8e94a79eb4bb8afca0f14de7193f77b5001cf4a5078e70683ea3ad2153d6980ec2ee349475ed9a33b4fa520176eeefd052673cd2b1e7d1bfa52f3b4f18a006fdde68fa74a54518c9a5fbdd3a500331bbf0a538a0f1c37e1484714002f5a3eef5e868c13e9c73467e6cd002f4a69ed4a7a51914009814ee3b520eb48c4eea00149c1a3b0e28da68c722800a4a56ebc7341340094529ed4940001ef4633c514500147e34bd690fd6800c52f7a4a2801706929690ff5a005ec4d251c519140052ff0d20ceea28016929477a4a003b514631cd1da800a28a3de80159769e7b8a4a28a0028a293fc68016978a4a28017a5058d20ef4e0e578a0039a4c924e6933c5292280129cb22afad368cb76c50069ea8cbf699083f79bbf5aa1b37727ad49e6334ae0fad1b7e53ed56558637c8b8c934de02d3d87cab4809c1ee295843554b60e29179a76fa46625a8b085c639c629b9dcdf853bf86998a901c31b4714bc83498c11df3474e9c550098cb63f1a5ede94f5e94dcf069580371c60518e4e4d09cb75a6ff0011a403db66debda9a79e3b53969b8da38a0629fba2901e69ccc720939e291681080f5a70f99067af6a6951b8fd693f1a063b69e98f7a46edcd35695a81075e2936d2a9a5ce7e5ec39a0046002d1d7e839a561f2d356801ccc3a8e949ef437defc293750029e94da534500276a28ad7f0c6930eb5ac47693b48b148921263203021723a83fca80328e3191d7a5369b1b1923563d58034ea000814ac850292aca186791d6929ed33c8ab13b332af0bb8e76f7e2801946451450014bd4d2514005145267da80168a3d0d140051467f9522d002d1452eec0a0043da8a3b51400514a3bd25001d07a53d58f385de07e94da334009f7b8a314514007dda28a2800a5c5252f4a004a09a28a0028a2863401ffd9, 1, 50);
INSERT INTO `etudiants` (`matricule`, `prenom`, `nom`, `nomUtilisateur`, `courrielEtudiant`, `motDePasse`, `dateInscriptionProgramme`, `photoProfil`, `Campus_Programmes_Campus_idCampus`, `Campus_Programmes_Programmes_idProgramme`) VALUES
(2064823, 'Josée', 'Boudreau', 'ejboudre02', 'ejboudre02@monccnb.ca', 'ran*fbu4E', '2023-06-14', 0xffd8ffe000104a46494600010101004800480000ffdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc00011080175017503012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fcdd504735613e6a6b0ef4f515e0b395c8785c1a9163dddaa58620cb565230315224c6c36bbc1fa66a3f2bad682958a3663dc62a9eeeb490db12dbe56ad2462e38ac8de7753d6e8af7aab9068c8c23049358b704b4871df9a966b82fc556590eeeb520261aac460e2a3f33353c2995cd06b11eabba9932ed1569129970a36f3d2b5e86e9998cecad90288250cdf30c53a451ce28b541e672719359e8432fc732a722acc52ef39a8d6df91c7156e3b6e9815a2ec225f9163c9acfbab8130c0ab174042bb475a816d832d6338ab88ce9b774c55468726b76e2d42a8ef54fecfed52a5ca2d0a50060a454fce2ac2dbed3934e68431a57bb1a336418a8f19abf710edacf91771c56c8d3a0bb40ead8151bca3a29c8a89c1148bd2b44886cd4b1baecdd2b5a3995d71d2b9e8b3918abf0dc95c0c5652f2034db03807354e4e58d3fcc2c322980fad677008d6b42d60dcbd3b55509b96b4ec46368a666c824b51e9546e15d01c1c57412c436902b1ef23db938a0119f148e5802722b5ad58ede95950ffacc0ad6b5ce2b6a6cde25ce719aa177fc55a2abf2d67deae335d068f630eeb8eb59cdc935a57bf30acc68fe6ac7a9cf22278cd2c7013ce3353ac5f2d588e3014537231e5d4abf65cf7fc2a06b7da6b51a214c7838e6a54d97caac5781709454990bc514b51f2a266fbb81491a9520527268e452b9162fdbc856a7f3b8e8335951ce57834efb466a6cc9341a5dcd934be6065aa91b6e5ab0950c5a0c9880b5013d0d4b3376a8d177534cd15817e6c530a8672475a95bd0546aa56a896c7a255e870abcd5552bc0ef56e35dcb814752a23bcc1daa39be653527d9d8ae698c3e5f7aabe874145e3c8e6a48edc6c0453997754f03aaae338358bb9024370f177c8f4ab83507c7a555936f5c66ab4d388b8cd526f624b724de6be777356e3db1ae4915cdb5cee6cd5b827dca2aec43355a605b20d31db3d2abee2d43afcbc75ac59249f2f3cf34e541c1aaecc323d6a44f9aa2cca8b1b70bbfa7355458bc87e55c9ad28a032488a3a938ae8934b5b55f2c0c37526ab99a37b9c4cda5cca3ee5557b4743cae2bbd7d358f22a19b411321c8a9555a61a1c4a232f6a9d47b735b12e8c558803be299fd92d1f6ad79aeae2647080d10e39a77d9fbd22c4d0caa47041ab85bcc04b2fcdeb4e31b99b641b3ee806af44b851eb559106471564b7962a9c491d23baa9e78acabf91a41c9ab535d7ca4138acb9e60f919cd63a884b7ce6b6ecd7728ac8b35ed5b768bc0ae8a67444b6abf2d50bb5dc0d6905f96a8dc0c66ba4dba1ce5d2edc9aa8554f51cd695e28c9fad6749d6b096e60d8d51db152afcab9a8875a9375419928994039e298d38c751d2ab3b0e734c193f4a761dc5660cc4d14f11e68a6172d88fbd2328ab3e49c50d6e76e6b9ee65733a453daa2c366b43cbe7148d0e0e715a2905c8a1cae062ac190e3a52a41df1532c40f159392114646248a7e48c55878406cd496fa6cb74d855a7cc80aebf3f14c7186ae8e2f0b4db0163cfa553bcd1e4b704fa538b2f959911fdf03d6ba1d17499af9c285e3d6b01622d20c8c735eb5e03b553029fceb2af374e3cc09f295ed7c0c5a1cb2f26b1b58f08c96618ed6c76afa1b43f0e8d4a34f2d320ff00152f8abe1befb3d8a09761d00af169e3db9d99b2773e4a962681995b39a8e35eb5dd78f7c173e9b7524f1c6c02f0c315c3aeddc43028476af7a338cd5d10c36826aa5c5b96638e6b48608c2820fad3d6d4b64d5dfb13730d61dbdb9a95548e957a5b3c9e953dae9723e0e3e53c51ac986e548d9f8cf356a28cb29623af02b4bfb2523e4b2e71dea555452aa4609e335b4684e41c8ccf834d2e8cd8c00327351bda956046315b46355b3b8c755c1fc2b1a4b811f3b063dc56ab0ccb54d92dbb18e58d8f453cd762fb660928fbacb5c4ade16c1d981ee78abd61afbdbfca595909c6d6e958d4c34ba14e2d6c755088e46503ae6ad8b74dd93823bd6143ab5b7de3b97d97a55b9b583751ed8d7627ea6b81d3945ea66dd8248526949c7cb9e28b8b1560085a7dadd055c6de3be6ac35d26d381c5689b5a0b98e66f2d02b1e2aa1655001e1ab6ee99646381cd655e5be79c56f190af72156456c920d3266dcd9ed4cd85463de9c41db572772199f72bb81acd6cab56bcddf1599329e4d64868b562df356fd9b657a573da6fa574968b9518ae881bc4b5fc354ae80e6b4769dbcd51bc5e2b636e873f7ca1b3596e02d6b5e77acc65dcd5cd2dcc2441f33734e0cdd0d2f3922a78a138cd2b993447e46793522c036d4f343b5bf0a231eb50a571dcac62c5156fc866e68aa15d97907ad36402b40c1f2e315566b53c915cc665458d7a9a8e4009f6ab1e5b74a8e48ce0d2b8c23231d334fdc3a62ab336de29e1b8a5602cdbdbfda2655ed9aef7c37a3ab280a9d2b8dd114cd74147526bd73c230431ed591b69e94fe189ad3dcb36de1659a32c139accd6bc2a3ecf21d9d057ad59c7a75ad9b48cdb9f18c2d733ac7fa52b2469b52b955669ea74ca51b58f9ff0052d20db4dbb6f00e2b73c3bae3692c195f6e3daba2d7b4952ac71c0ae327b1daae4715db78d68d99c8e299f55fc2df165b5c5ac31b22b48ca19580e0d7adda682dac6df94167e82be3bf843e385d26fa3b1bc42c377eee4fcb8afb9be19eb96d3db5bc9f67f31ba0627815f358ea51c3b5ca66a7ca72de30f82b65756a4f900c9e5e59b6d7cdbf103e03885a46861c3609185c57e82deda19a32ee14ab73951d2bc9be2569f6fa6dabea138f2a150db437f1f06b970d8b942a791a39ab5cfcd6b8b1fb0de4b0484878db69153c3186ed81eb5d3fc40d3a26f115c5cc41556562db7f1ae54c8158a8c37b57dd61e9bad053e8cb841cf564cc228db3b32c3d6abcda8b4876a9cffb2bcd48d00dbbee0e07641de9a6e1ca8f2d3ca4ec2bd58538c4e9514b41b14324ad930bafb9355752bc36713ec56475f51c1abe269bee9939c7f0f4aa5711e5833b3019f4ad9f62ac8b96bab24b6314439924f99b8a5ba855955a3f989ea2b674dd02d6fac45c4518d91924b639c71fd715526b668dc32f52768047352558c9363b864803e950496b147c1da0f5c77ad69e070df31233d707f4aa3359c6aa1be7cfa8a81d8a71aac120e5893deb421b86450c8c1c0aa0ead83890b0f718a7c57272aac7691dab09c54b74438a7a335e3be66c12319a9bed4cbd2a8c2ddfae6a5ddf374af3aa537138aa53e52d79fbbad24ca1f18c553926ec6aedafcd0d63cb63245192dcd30a6d520d6932e73542e4761548b33ee1476acc9c706b52452d9aa3711920d218dd1fe6c93eb5d4d8c6302b99d306d6aea2c586daea8ec6b02fb47fbbacabcfe215b1bbe5ac5d40f2d5a1b98978b8526b349c355dbb7f948acd7f9ab9a5b98487ae37e7deaec1119327a0acd59b67bd6c5acde65aa10306aa31b9992c96f1ed500e5b155e484a823b54fbcf7a82e24ddc5128a5a92c8f76d028a9adadf72668a5611d41b3665e955ee2dcc60022ba4f2c32f4a8e6b0578c93f7ab988391923db9e2aaccbed8ada9a0f2fb64d66dc2fcdf5ed53ca066327cd52ac05978e4d4be41eb8abb0c5919aa512917fc33698932c39af46d33cc45056b81d2e61132f6e6bafb3d4d123e4e6892d2c52958ee6d6fd20b56791f0c05679d5fcec8caec3eb5c7ea3af1b8f950e02d508efe5e4eee2b86a52b98ca4ee747acdd45202a05725770891f6e386abcd7c641c9c557b58fed9aadbc20e41704fd2b5a4b9114a5a1d6f853c0e6fa35754afa77e1ada6a3a4e996e892332803ef0e9583f0bfc396b35942afb533d19abdbb4ed060d3ed5732291d46daf2b158ba75bdd7d07eeb5a95a5f1fc9656bb65668e65e3e56201af9bbe3ffc5f7be9d2013337968c0867c9ae8fe3a78ba0d150b4531df9202afafbd7c8fafea53f882fa47672e246e4b77ffeb55e5b95c2bc9579fc3d8ba54b9df33d8a1a96a936b174ee1f3cf5edf4a8a244b3601479929e79e82924658764311c6d24337a7d2a2dc8bbb07d8b7ad7dd46cb447a36b0e9a6666258ef6f6a63b32a37987693d05377edf981c91fcaa03b2462d16379fe235aa621565119e464ff003ab5134770b962223e86a9859a5700b9571dd6afd86edc5660e4e71d3ad2931a476de139238ec66b78d19cb007e6e86b37585fb24d2485412c7099fe95bbe11b19c5acc626531b26d28e791d2b5b5cf05cd750971f3baa29538c8208e2a652d0d6316cf2af2da576df21cfd6a616be58409361b6e796e2ae7883c3b7fa736d11fcab83d3a572eed32c8a1e46008c371d403d2b352b8dc6c6f79226fbc411d8a0c66abde6990c8b8688bfa3038c567a5c4b27dd9011fddce315a105e4f190aebb971ea07e94324cc48a4b3c857de8dd55fef569dbce24ce7e833d454ceb6f7ff24d1946fe1f5acbbaf3b4791988f361eb91d4563257d189c54b434a484c9c8ab16385e0f1546cefa390868dcc90bfdd6f7ab8ec636e3a5714e0e279d529b83b971c29cf3542eb60e01e69ed2993ee9c9a85e12dc9accccaaaa7a0e6a19a1ea31cd5f8e0a59203b4e28031e05d8c7eb5b36321e2b3cc7e5e7d6ad597de5ade1b1d11369642cb8acbbf1c366b72dedf720aa3a95a9c355737436b9c7de62b319b0e456c5f5bfcc6b2a4870d58bdce7910b26eeb5a5a7c9e5c5b1baf6aaf14218d684367b90719a69d8cc732bede79f4a84a98db0c793d2ac4d0491800311506ddacae7391de872b899d0e97a737d980efde8ab56ffbcb585a23c11cd15aa5a1275eb69b5770e6aaddec8e32a0e58f6a84ea0d1c6cbe6638aa914864e59b9f5ae19bb12aed8c6b2f3072bcf5acfb8b1f98802ba28b6c8bc9cd47340b8e0563ce51cd496cb1a81dfdea18e3f9b0718ad2d462dad9c62b2a26c4d5d117a126adadb12c0835bb6b6ac540cd6659e4e2ba6d3f0b1726b193d40cd934ddd9355a487cbe3d2b76475c9c5655f30f4ef496a0655c4871c75ab7e0f907f6f2173838e2ab4c45670ba7b1bc59d3395eb8ab70e68b488e87d93f0f75ab7934f58a4c09001cd7797de3eb5d1745b93349f710e2be3cf0efc4c5b5454f39e1916a7f1a78fee6fb4df25652518738272d5f1b0c92b56c55dbf7429d395476323e2978dee7c65af4855b316481cf415c3cd2796a218b961f79c0e156accec6c613249ccf37007a5673feed5948c0eaedfd2bf4ca74e3460a9c3647b318a8ab22b4a549c65840bdfbb542dcb636e0a8c88fd3eb524d75b00054194708bfddcd576678c6148018f2e072d5771d856667f9a5238e9ce00a48e549243f29f634f8ec6473bd9777a190f35d47867c037baecd190a0a93c6da399477348c1cb632ac63798850858f41f2d767a2782f57d4a6530db310781b81c57bafc2dfd9e62668e5bc89647ebc1e7a8afa63c2ff000b6d34b8d156359117b3a0c8fc6b9a55bb1dd0c3bea7ca1e01f831abb4c1e5b6119ea77eeaf5b87e16dd5bc64989795e53920f1d8f6fa57d2963e1db2b650a20553e98ad15d26da56d821518f6ac25599d71a08f8f6ffe0ec37d6d79fe8fbd9a32173fc2473fd2bc13c59f00aee3be963453e66cf3846a39e49afd2cd53c1b0cd968238c311cae3835cb6a1f0f6def6649c5b08e75051b8e0834bdb682961d3d8fcb1bef87fade993381692ec5ee075ac3b8b8974f9bc9b9b678caf5dc2bf57d7e1069d346e93dac658803257d2bcabe28fecc3a66b16b3c90da22bb0382aa2b178a9458960d491f01dade432283b4b28e7e53935a388678f0183464720f5adbf899f07b54f015e3b476ccd0824e30477ed5c8d8de1976bb90a41c1c8191ec6bb21515457470d4a2e9bb333f50b77d1662f180d6ae7e615a16d75f68871d71d33d47b569cd6cb75118648f7799cab0ae75e37d2e631e0fca7f4ab694958e39c2eac747a6d99689cf7cd5c161bba8a97c37729328c720f515d1359ab03b715e749f2bb33cc92e57639afb1a6d20f06a9c96a141c1ae86f618e1520b02de9594d16e53eb59f319f3187241f39a75bc7b5bf1abcf6fed48b6f5d54d9bc246f695b5e1c1a8f50b51b5bd2abe9d218cedce2ac5dcdf29069496a54a56392d42dd5589ac4b8886ec0ae8f5150cc4d667d9c3726adad0c39ae67470ed615ad6f85c55590056e3ad48b36d5acde84935cccbfddcd64cf38dc73f77d2ac4f7839ac6bbb805bae6a55e4c6f446b597881ac63d8a7cc5ce47b515ceee2dc8a2b7b332e63d3164370dc70be95a16f6e76e6a3b7b131e01047d6b4e3876a0af3a73bb3605610a827e94d92e0ec3814acbb7031de9241bb8c542ee677322fa37b82315561b328fcd6cedc53ededc17c9e6b4e615d15ed6d48c115a6b70ea980326a78adb6e4e38a9e0b00ce0d170e633c5cba825cd50b8bb3231c56ede5a0546e2b067848cb0ad629328ad2396c66b3ae97cc6201c1ab324df391dea5b787ce6cd6a86b5d08f41d347da32f903393f4ad1ba65d52ff6fddb7b7e5cd4c00b4b572396c600358fe20ba6d374d4b447c5d5d1f9b1d85775156d4f4e947962539a63ab5e4b70016443b233e8077aaf752796aa91fcee4f03dfd69c585bdaa42871c6493deb3ae2e1776149959872de82b6b9b09b429247ef246396623a9f415a1a669ef2481d879b33f03b051515bc678006463935e81e01d0cea9a8428880e31f35652a9caae6d4e9f33b1afe01f85371e20ba8de742e33d7a0fc057d45f0ff00e15d8d8f92bb7902a7f877e0a16ba7c448099c65bd7dabd7fc3fa0c76b810a641eac2bcea951c99ee52a518a347c3be1a8ad618c04e8057650db6d8f0878aafa7db85418cf1c56ac4bb08351b9b7290a5b95001eb53471853c37356f68939a7c68c4f4c8a2c3d88e2872c39cd3cd82aee7c73571631b7a0069ce84e133c1a096cc37b266dcc067b550d46cf75b90c9fa575a6dc2a019e6b3ae2df7391d6b0944b8c8f04f8a5f0c6cfc51a6cd1c916e7c70d8e41afcf6f8b5f0e6e7c03af4cca8de4331ddf4afd67d4b4b4915d71d6be67fda2be1741af68d72cb07ef110906953a8e9cbc82ad18d685ba9f04585c6d0b1bb7ee641856feeb76a9754b55beb5331e25418240e73d2a8cd6efa4de5c69971c05729cf6e783f9e2acd85d16696095bf7ca3693d891dff001af622f9b547ce4e3caec67e8d7f269d7aa636dcb9dadcf15dec7ab07556db9045705756cf6f75b94a9593e619ad6d2f510632bfc42b2ad4f9bde3ccc453bae646d5e5d091aa979df37150493ef6e7834d5930dd735caa079a5ec8eb49b771aaeb2f4ab10b8cf26b44ac6b1761de598d811f4a5999b152330c71cd59b7d3e5bb01634dc4f6aa94ac5ca5739bba8cb67354d97e422bacbcd0278c1dc8462b9db8b2963908db4b9b98c8c2b96c1355649303ad6dcba5976c91ef546eac0b36318ac99a2312694f3cd66ccc598e6b66e2d4ae73552df4d7bab8545ef5bd3921495caabf74515d7c3a4436c813cbde7b9a2aaec3d9b3d26f36451a1f622aaadd2bae38aafa8ea4b22b0072a38150dabe1727bd79f3858cdb2e1f98e6a0b894a8e0d124db56b3e69b736294637641389998e7357a3982aa923f1accb74e7f5ab0d1bb1ad1ad40d78ef164c0cd6adbdc204c0e4d726923c6c074abb05e3c7cd4b8db603726fde2b7ad733ab4c228dd55b27b9abd71ab3ec202fe358b761ee32588c7a55c5f2ea5a3191db71e2b7bc3e8669198f402b2cdbe0d745a743f61d3598f06400fe15bc1dd9d5463ccc49b64974b1b1fdd463731f61dab8bbabcfed6f114d2370aa3e55f415bfab5dfd874f79738794fcb5cf451ae9d6324f28dd34877123f4af423a23d41baa5d33cbe4440330ff5873fa557b5859817959709d001c2fbd53ba9a695bca53f3c9cb6d3c2fae7dfa55bb1862bad96a8e7c88ce6561dcd4390d2d4d6d36337732b60f960fca7d6be84f831e1af327b790459624726bc5fc29691de6a0aab84453cbb7a57d4df0efcbb7b5822b44289c00cc3e690fa9ae3aaee7a5878ab9eff00e1bb582d218d3867c60d773a7407cbe063a5719e17b368e04322ee90f3cd7a0597dd5ce335c3cc7ab62f5ba18c0e78ad3809f96a9c119fc2af5bc786e79ad223b9760079f97352b71ec692161d4f02a4640dd39ee2b4337b8e8f95f5ab1b738e0556552b8c0a9b3d3352434248bb5b239aa370e19c122b42450cb9154a642d9005432e2675d639c75ae13c69631dfd8cf1c91e772e2bbbba3b78c573bab5a7da23638ae4a876533f30bf694f01b787fc452de2478898e09fae6bc8a3bcc7d9e52dba4036161fc58e99afbc7f69cf03a6aba15e622fde2a1c1af800a18e37b73c344e50fd457a185aae51b763c5c6d2e59732ea7552017d01914607deda3a83deaa69ea1647c0e41a7f872e0dd5b4b1e32f1e0e3d852f91e4df120e2390eefa57a5d0f1e51ba2cc8ae493b3f1a62e7b8c576d1f8745d58c77299742bf7bdeb9bd52c4dac9860735c5ccaf63c49c6cec67349b6a48672ce157926abc9e82b57c2b66b717cbeace13f3ad3432bd8eb7c2be0f9f50b492f248c95ced41fd6bd5bc0be0554d0e79cc45a7762a84fa0ae8be19785575c8adb4b817ee921d80e98ef5ee7a17822dacedbec6a870a7e56c6377ad726b29171d5a67cdda97819a2560e99c8e6bce3c41e06fb3dd021792780057da5aa7c3f558da695323b035e75ac7846dae3514062185e29b972a2e47cad79e1475ce54e71cf1d2b9ad4b4630b1cad7d1de26f0ec76ad2220dbc9af28f1459a46afc6081d6b9e351b7a99f333cb25d2812588e28d26cd52e5ce3be056f3461a3607ad67347e449b856b16ee5a913b5aaef6dc28a9e3d4632837a64d15d1cc5731910dc492302c79ad9b46dca335423d3dad98061835a11c5b577573d477218ebc62bc66b3771de39ef53df4a0b8f5aac396aa86c666c582e719e6b4847b874aa3a62ee51815b31c67674c56336ee0674f0ed19aa534fe58ad3d424545f535cd5edd04627a55c1dd6a5161af4e714f4995873c9ae6ee350dac4e78a7daea0ccc083c56dca9ec3d4ea2dedfce9178ef5ab7ac58ac6070383597a2dc3c8dbc8c2a8273ef577cd3f348c3803007a9ad69c2c7a7878f5398d7499af5216fe13b8afb5616b17827c280428258e3dba5696a1308deeee37861f747b9effcab8eba99eeae21b7dc4198f98ec3b2fa5776fa1d9d49fed92790a22ff5d70d84c7503d6b72c6316d66b1e36aaf5f73dcd61e9456eaf5ef64f9625ca42bd801c66ba1d36cdef27562a7d021e82b29596e5c6ef44771e02b3375a827194cf3ef5f627c26f0db4c525dad9017e63d0f1dabc97e02fc267d45a2b9bb8c2a9208de32315f5d787745874d8d234190a000474af2eb54e67647b587a7caaecd7d374ff2caede78009aea6de3c46077ac8b30b1f43d4d6d5b02cb9ed5118b91d6e45db6cae2b5601f30cfa56643711c6c39e6b46dee2366fbd5d0a2d18b922fc71f1c54e11430f5aa8b305c9c81cf5a9964561c9cd53d037262067839a6c63f786a38e65f38863939e953f988ad91d6b2bdc43da367e7b542e9b7ad3dae075c62a092e00e4f4a1b4357285f42181ac6ba876c6c2b62eafadd1b0d2460ffb46b0b50d42d555cfda106780d9e2b9a6ae6ea563c9be2b787ffb4b4db8c8c8319afcbdf891a48f0ff8fb52b3031e61dc3eb5facbe24d42d2e2ddeda4963dce0e39eb5f997fb56e90343f8996f3a0c24a3fad698456a96ee73e32d2a699c3f85ef3cbd46ddb3b77128d5d34366af7a20720ef0c173edcd702a4dade2153c6ec8fa1ff00ebe2bbaf3bfd16dee003f2e1cff5af616aac780d687ae7c31b78f55f09b4647cd03ed23bf20ff85707e388d60b995718da715d1fc27d4059ea1a9db31262b98449181fde041fe59ae6fe295d299c6cc6ece1b15e5ca1255bc8f16bc5a99c44932d5cd17585d3ef1189c618383ee0d6034ac09a8bce393dfd2bb363271ba3f453f663863beb9b8ba4c3b496c9cf6c92335f4ce9fe1f8e4b795f601b785af8a3f648f107f684765f63940ba3361d07b2e307dabef3d26fa08edd6223e60a371ec4d631db5228bd1a388d7b4774d2e40c73b4e40af1ff001447142c587ca7a7e35ee9e36df242d2424794a33c9ef5f347c4cf135c598758d5594756c579f5aaa8cacc727d0e1fc69a9c7231500ee0083835e17e32bd3b9957839f5ae8bc45e209a4b89482773126b93beb669977b0259866941db522271935d3c2dc9aad25e0939cd6a6a56279e2b9db8cc6d8c57753699a97e160ca4e68aaf6f21f2e8adb940f43bcd315a160571c6ecd62cb88639140e82bbbb98536b056edfa5719afa4615bcb3d7ab573c5a6f5136728cccf293da9f160b601ef55a42ca4ed39abba7dab49838c9ae9b2485736f4dce0115b9b9bcb18aa9a758b2a8c822afc88638cd714ed720c5d48feec9ae535025b9cd749a94bf7ab9cba52e6ae112e273d701b71e734fb4664c93e956a6b7e7a53238c6d618c1ffebd7446c6c8ec7486234d881fe3e2ac6a97423d3a50bd1ce052dbdb88e0b58c76504d657892eb6471ae7ef135d48f569ab2393f10dd8b1d3c2e7800923d7fc9c571df6b79241c90cc8771efcb1c8af48f0df82d7c717d2adcc852ce170ad86c64fa56a78f7e0cc1e0d8ecafe19cc96529cb447e6c704f5fc2b48d585f97a9dbf57a9c9ed7a1c658b25a5a4724bf293c4718eb8ed9af57f831e156f157892dfce04441ba5792d9ccb7d74d36c2a33b635ef8f5afa6bf673b431eb16600e770c9c5725795a2cac3c57323ec7f05f87adf48d1638618d51540ed5d6408550103daabe996fb6dc0d9c915a5690bcf90171b7819af2a31ee7b4e5629ea1e22b7d0e20643f363b9e95cb5e7c589e78fcbd32de59ce706455f947e35d2df786ecda57b8bc0d72c4f463903e955eeb57d3f4581e4731db4283ab8e00ab75b93448b8d372d4f3ed53e21788ac6366b7d3af2771c96653b7f002b8dd43e3d78e2dd8e74f9ada31c65a1273f857a0eb5f19f4db353b76184e40926611a37d33d6b8c7f8bba4eaed004d6b4bb5798b058d892140ea49c81edf8d69196224aea3a0a51a57b396a635b7c78f1b5d30325c4eb10ed1c04103f1ed5ee1f087e2cea3ac5fa69faa3f9a59372c92260f4e95e7531d4edede2befb359ea562543c86d410eaa7a360f515d568ba85ac30c1796db4af50460fff00aab9aa56ab17ef2b1a46945aba67d0f15c2cac2407ad4ad2973d71e95c678575f4bf8e3f9c31efcd7756b6a93460e7f3ada9be757224b95ea54b8ba312e4f5ae3fc71e3a8bc31a1cf7647992a29d91a9e49adcf195f45a35a4b2b32a88d735f2ef8dfe215cdf4d24912878c67e794e1147a9ae5a939f3da28d63053576701e2af891f103c59ac48d6915e4299c46a871815a1a0e8ff1435240935d1489bab5c5c631f90358b17c48837c8126d4f5664cb31d32d46c5c76cb75ad0d07e365adc4124c64d674cb78db6f9da859ef8c1f425795fe5c576fb2c4b8dd451c7ed30ea56723bdb7f863e24974c227d714377eae07e35f1d7ed91e19d4341bed2e5bcb85b9f9f689573efc7e95f575afc6817056dd9a3b88dd77457567286471ee3a835f347ed95ac36b5a3584add56e030cf5e41acf0b29ac446332f1518fb16e2cf04840f2e291befae3f2c575de1dbb171672dab9fba4e3f1ae3216df6bc75dbb7fad6be937c22d4010787453f957b29ea7cf1daf86f563637d0a96c18dbcb3fee9a8bc657897d7c5233bd17b8e99ac89a6586ed6753fbb948cfd735e896be096b8b359dbfe5a0c8fcab1ab2e5d4f3714b54cf2b92df23a74aa12427710066bd1b54f0cb5a2956403d0d64a787cc6a495e4d473a38549753bdfd967c5537847c68f3bb95898631e848eb5fa09e1bf89f6ba8411c725c2894fca3dfa57e62e9524da15e79d182aa0f2457aff0086fe35a5ac70fda1f98d861b382315b45c671b197c2db5d4fbbfc5be24860b39221206555c91f5af9a7e205f25c4736ce77d741a7f8f878c349b6b827ca52010a4f2def5cb78d76476b2cac5540048c9ea6bcbad49b9ddad0abe973c22fdf7ea12210015a9a08966505b9078fa550be9596f1ddb8763935621ba1b41079ae6927620ccd76c53e6da0605701aa5bed90e2bd0f5a999a338ee2b84d41712722bab0e5a66646a42d1522e39a2bd2353d4aeaf0aa904f6c5723e22bc55f97a9c574b244d3678c67bd63dd785ee25ba2645de0f423d2bca53499924739636a6ea51c706bb3d2740c6dc0e7ad6be83e0943182b956eb5dc69be162aaa1bb5554ac9234e5394874b655036d676ad6e63cf1dabd1354d28c580a303d6b91d6adf6ee5ef5c51a9ccc8679d5f2e588ac99a1e6b7f568f6337b56249f31af560b4251997081739aa23e7ba8947f787f3ad5ba8830a86c2d7fd3a127a03935d0a26f1dceaa27324939ff009e6805727e2298b4a8a7aa8cd74f24644391c191f1f862b8df1231fb7a2f5e2b43d989dafc27b369f45d4e50bc093d339af4d87c3adaecd1e97769e6471e9e645dc784662369fcb3f9d735f047487d4b458ede120b5c5c0423f1afa0fc37e1ab48fe2178821b889a482dec2de1da879eacc7f9d79f53f772723ea28479a945743e4f6f84f7ba2de4aab1798a87e5f61cd7d0dfb38787da3d5a09180ca9fc07b57563c32b7b34de45a6c5c908243cedaea7e18f85ce83ad3ab8e841dbf5ac3eb0ea2b112c32a72ba3dcad7e4b78cf1d2b421611867038c555b18f7463233c74adfb7b5021518c6e154d368956bea70baf6a52471bb2234ac07cb18cf26be7ff00893a6f8cbc457892472242a3948882c13df1d33ee6beb5b8f0fc72024a66b93d6bc22199b6a9524601db9ace31e57cccee8c94958f8d3c4ff0af171617f733dcdee108b979cb4ac241ec3851d78f6aea7e10f85edbc41ad68fa547a7d9ea5e5ce26bababcb541e4c409e33c7b57b649e0c4b29249125f2a5e808c823f035434ff0cdd88e2125e4b2365cb95503764f00e076af6618f828d9ad4f16ae5729cf9a33b2377c6df0f7c3fe1abe5bbf0aead6fa4cec374b6225cdb4c7dd33c7d6b9cd3f491a9477525b7fa35dc58f36385b746c7d54f7aea748d27fb3e358d21e40cfce2aecc669b6c71c6309d481fa579952d59dcf6a947d85351dca9e03ba96ce5db21c9070457ba699aa86b78ce32715e35a769ff652d2636b31aef344b8710fcc6ae8d35122a2f69a99df14217d5560b56244723fcc01c71d6bc3358d16cdafe55beb576b131b243198c9dac78de78e6bdf3c61189ede1939cab75fceb83d5749bdba1861bd31c3561cbeceadcd636e47168f9817c17ab68fa8c1341677ad3dbbb79325ace628883fc4e323240e7f0af56f871359f867c2baa2f88a61a86b5a93165b7e18a2850aa09e9db35d35d7856e9a460d6df69c8c75ed53d8f8264f21234d3880a72a588c8af42798be4e5e53c98e554b9d49b3e7f8fe11c9ff000905cea16a3ec51cafb9560caa9f5047ad703fb51f82ee4780e4b8119df6ae8ec58f607935f7358f824b4199632ad8ee460579dfc7cf02a6a1e00d5a0684366d9fe603af06bcca75a7ed14a5d0f42ad28b838a3f30ec1c49e5aff03ede7f3ff1a2190dbea0833db03f0355ad55a391adcfcad1fcb8f707ff00ad524ac535181f1c37ca4fbd7b9f68f996ada1d2b5d6e8ca37dd6f996bea2f07c116abe14d3ee40c8962571f963fa57c95e76e28b9c706be88f847e2e897c1b6b6f2caabf67668be6f6ae4c45dc558f3318bdd4cdaf106950ac64ec048ae75b4d89210d800e2aef8a3c5d1b48638882a7f88560aeb22683696e6b9e3172478fa995ab5b8c9381f85721732ac375b5beee707f3ae8756be691880d5c95db79974371e33cd77d3a7646bd0fa3bc3ba83c5696d2248523daa001f4ab7ad5c5cde2e46e70b5c7fc35d50cd09f3c168576a2e7a1cf6af5d6b48a687cb820c0518c9e82b2ab64eec952ba3c0b58666bd70eacbce39aa91ccd0a328af41f15f8670cd91c9e6b855b265b80847ddae476920294f1cd3a12a76d72fab5b490b12e724735ea434b5fb18247245727aee8cdc90b9159d3aab9ac35b9c0b4809c8a29d7da6bc7310a7028af4d5ac6b73def4cf0ebdd32becc0f4aec2cfc1eb24637a0c51a05bb34c91af35ea9a5e868f6eb9f94d7c9d494ae4459c369be17486452170075ad9b5d1b6a37c980a7835d749a2c71ae381cf5aa53dac918d83057ad439f765f31e6fadc7b8b606369c115e7fae328df9eabc8af53f145aedb79a70df778dbeb5e27ab5e335ccc5fd4802bb30f06c8b9caea9fbc76f4358440dc7dab4752ba2189ecd58a64f9b35ee43444d891f6b52dbc7b59e41d7ee8aafe77cdf8d5eb25f382a8eacc056b72e17b9ad75b42c2bfc3b379fa9ae07c4d2799ab003ee6c3fcabbfd4022ab15e00017f2ae075b8449ab4841e0a63f95691f78f729ee7b7fec8ba8add78f4e9928c470dbfda533eb939afabfc17656da86bde31b845059ae238037fbb18ffe2abe0af833e229fc21f1334dbb8d8a89c8b6651fc4a473fcabef0f85b63fda5a6eafa9da5c796d25fbb185baf000fe9596229aea7d3e066a74edd51de68fe0d815edadd80df8329f7c5452e9034bd51587f131cfe75a56fac3d8dfdacf73fb82ab8627a115a3af5aac8e92a731380e8ded5cf5a9c6097296dc9bf78d2d36e3fd5f35d35ac83a77ae174f9cc6ca2babb5b85d81b3f5ae7e632e5d4e9a060530699750a639079f4aa96f70582943c355a81e4da55d722b7ba66ca2645e58c2d91e58638ac8934d61200908aec7ecf1bb8fdd804f7a964d376ae5480b47b3ea69cc71d0f871e67dd264467a8153dc6956f691048d00ae9e3b711c2029dfeb54ae2c137799336d03a53d222723965b254cbb2018ed573495fdf6de81b9a96e9a0912411907b53f4784ee46c01ef5bc422c7f88a046b1e01f971cd50b38d5a108ebbd3a73dbdeba9d52cb7d9302b9dcbd6b98d3d916416f29dae0e07bd7156f759ac5dd04ba0f564c11d45323b79a35000ae812d658c1c1f969d247c8c8dc48ac77451931c6d8dafd4d72bf11ad12ebc39751b74d854d779b46c61dc5705f122e0dbf8675499f8115bbbe7e8a4d66f7b09ec7e336ab27d9fc51a922fdd4ba9547e0e697512375bc8bc297047e46a8dddcfdbb54baba0789ae1e41ff0002627fa54f74c1618999be6562715f4ae3668f957a9a2d2348ab203d4e2bbdf055f345a2ca8bd7cc35e7b1bffa0973ce2bb0f04cc7ec33066cfcf903ea2b8eac7dd38710bf76d9d27db1f6b164dc2a9dc6a520e221b7f1ab124c369accb8940c9a29f63c5488ae6fe665da5f1598cd96e7e63535c481aabab65b15d459eb9f09f504bbb36b276c5c47289149eebdebe96d1bcad4acc7d97e7181bb1db8af8afc31ac3e93a9433c6fb590f06be9cf87fe27916ce05057e61b9dfb9c9ce2bccc57739dde2ec74be28f0c816a25906370c8c75af19d574d4b2d4b78c81cd7b9f893545bcdc5988c8e076e95e2de2cb85f31c01d0f15c304f6022d3645b9411b9e57a549ac696be460b0e95cde9fab23c837ae1b3d456e5c6a4b3438ce47a8eb584a2e32d0679feb1a6225d6157228ad3d5665fb47ca463de8af4a3525635bb3de7c23a2cab2f9acc5b71c0e6bd6b4cb231c68371cfa573b06907458d55b8ae8745bc8da44473d4d79135ccc226d369f14b6ebb972f9a8efb4748e30eaa47cbcd693cf11ba8e0575023193f535aaccbf6394e039c571ca9f34ac2b753c2bc63659d3ee31c16e8b5f3678b6e0472318ce1db21abea2f1e6c820bbb967fddb0c293d54d7cb5e2f8cfdae47e817bfafa9af6b0b0715ef096e7157d2ed039c9ef59725eed352ead702291949e7b560493963d6bd234b1acd7c0e2b5347b80f32203ce735c97980f7e6b4f4abc30dc4647ad3348ad4ec6ea4df0b13d7cc22b9fd4acffd30be32d85c56c58ca2e848c7a2907f3350df5bef59641c6081fceba68ad4f56052f046a161a3fc44d2aef578ccd630cc59d14f3d0853f8122bee6fd9dfc4169ac68af651dd21bf59d9e400f505be53f4c57c0332ff00a5a39196f300ad5d07c6dad782bc70758d06f5ad2fe318eb94900c70c3d2ba2b53f691b23d1c2623eaf3e6e8cfd71bed36c6ff004f106a169bd47ca5c552d6161b3d3ede28815b78c044cf5c57cbdf05bf6d3bdf1ce99a8c3ae69a96d3e9916e9d6dce4cc38e547af5e2b47c77fb5869fe2ed06c26f0cdbdcdb417775f668e4be88c6770049001ff0074d78b5e1522ac7b74eb52a9d4f7f87e59f83db8ae8f4f9b72853d3bd701e13d73fb7b45b1bcc61d906fff007bbd76da6485a327deb8b7d49bd9d8eaec596385547415ac4e6104715cdd9dd6368adc82f070322b78ccd1234ad42c6c8d9cb63152c9763cc20919acb66dae1c1c550bcd53cb4209cfa5692adca8d553e6356eb5386db3f300d5c76a9a9cbaddeb5bc4d855c64d5e8b4f97502659ce17b28ac4d634fbcd2a792e2c0a966182ad582a927efb5a1a4631bd96e5bb6d2a4b79177b12b9fd6baad2ecccebb57ae6bc56f35bf1cd9cc5a29aca54ce443340413edb83715d47863e205d346a2e504172bfeb2163cfd54fa57453c541bd558b961e7d19ebaf63248a62dbd075ae27c49a60b4bc864076b03c55c4f8811b42d2197040fbb9e6b9bbcb9bff00136a2923b9860ebc7de22a2b57a6d68670a538bd7637ecf56f9b63eeca9e49e95a22446932392466b3db4b5fb3aed3f301c1eff8d568ee8c6db646395ae1551c7735f75a359a66f358797f2e057897ed65e245f0cfc12f185e82164fb0bc498ee5c6d1fcebd62eb54558cb07c62be2ff00f828778e3c9f86761a2c6fb4eab7d1a11feca7cd9fcc0ae8a2d55a918a39710f929ca47e7c58aeeb7553d438feb9a9752ff5c00fe16fe55259c263553cf0fcfe7ffd7a75f5bb46e4ff007ce7f9d7d1732e73e67c87e9b2f99673678e4d755e0bb867b19909fba6b93d2c130c91e39cd74be098d960bbc766ace6936d1c95d7eed9d035e346a430e2b36fb500a33f30ab57937001e2b13509be5c54463ca7909586fda8b9ce4e29df6bda2b285c0ddcd35ee4c7df8ad6e59bb15e6ec1ce2bd73c17e3268f4bb65f3312c7c1e715e0f0dd348c028cd76be19f3615566e3d01ac2ada4accc6696e7d0d0f8c92e231e7b72075cd727acdeaea52308833127ef67a572bf6b3246319cd761e1f545b505c032e335e6d597b38371473dec677f642436e3e62a474f7acd96ea485bcb5396e95d7dcc3f6a560073e82a2f0ef855f52d59cba81b0640ae0553ac8d1356d4e66cfc0badf8915a7b584b229c668afacbc0fe19b4d27498d2641f346847d79cff3a2ae35656d0dd4558bfe2eb84b60de6b08b2c7ad700de32874fd414a49b82fa1af5bf1ff0083ff00b52f65966c14c90a3b0af9a3c75a6dd787f58f2b69921562ca7dabccc3e2a9e26ab82dd1c69bb9eb7e1cf1643713497124c43c8db8f15da43e35b64b598ab7c8a8727f0af9a6d7c48d62b1ba12430c953da935bf898459b440499c7dd4af4541b96a6f1969637fc63e293aa5b5ca962b007c286ea4e7aff3af22f145fadd2dc9fe1e8b516a3e26b9bee0a79511e406ea7dcd737aaea1e72145c11eb5ecc69a49246b189c96bd20fb6607a5666ecd5ad6988bd0a7b28aad1ae687a31a42797b587bd4d0b1138e7a022a558fe5a92ce35dc78c9276d547de635b9d568195b49157aed0ff00e7f3ab9729bb4af33f8b7556d3e3090caca78c08f15a575163460a3fbd5d54be23d5a7b1c3cd19568811925f77eb594adff1339189e59c8c56e6a1f2ea16e0ff00780ac399425fcfdf64c4d7775361da6f88351f07eb93ea1a6c812e22192aebb91c7b8ef4ef147c67f1078cfc49a35f6a7243143a63a7936f6b1f971280793b7d7934ebeb656bc0d8c2cb1943f8d7197367e4de08bb80568e54f5626e5d19faabf08b564baf0ed9c8ad986e230ebf90ff001af66d15bcc8bae41af94ff64ff1036bdf0bb4ef98349687c96ff80d7d45e1cb8f3235c743d2be66b53e49389efc27ce948de68de16e2addade1da7342c2265620124d49671c67e575f9b35c524d6c7641dcad7fac35ac6492dd78c77a658c524ede74e36e4e42d6c6a1a42c96f0cc8b931b6efd0d71de22bed56c63966b5b7f3b6f2230db49fc6b249def23a2f75689dbdbbee5e0e3153496a9708010377ad78ee9df1ab4fb3ba5b2d6166d1ef0f012f14aab7d1ba1fe75dde9fe3ad3ef630f0dec0c3be2415e946514accc654e7b9b13786e39338ebf4ae72fbc11ba46923cb3e4f418aea2dbc496726d22e6039f571579753824ff0096d1eeee158567384645c1d489c8e91e08fb302f2282e4e4d6e5be9e96b8381f4ab775af59d9c2ed25cc4847b8ae2f56f8a5a2d8a9325f460af23079ac1538c0d1fb69ec8ea679b69c072a33dab1b518a686fa118df0cad8dc3ad7396be20d43c4ed149636ad15a3f2679be52df415dd68b62c20596e4e56119c9f5ac2769bb2217353dce6f50b176674de704e057e79fedffac7db7e25786b4546cc7656a6675ff69dbffac6bf46afa45cc921e8b927f1ff00eb66bf273e3ff8997c79f1d3c47a806f32286e1ada23e823e08fccd7a59752fde7376479d8ea9ee25dce02decc2b2ab0f937126aa5cc7f29723237fcbf4ae9a4b3ff0047248c0c91fa5632dbb49bb773f39c7e15ebce2d33c233ece10b2c84f5506b5bc2f27d9d6463f2ab37355ede358fce38c102add9c661b1327627352b730acfdc65bbaba4662b9c8fe16ac1bcb8f98e4fb525f34ac0306c13c1aa12b79c324fcc2b47a9e5124519998b5595b33261696c23dcaa2b76dacf6bae4564efd086ec4363a488141c739aeb6c2d72138f6aa9042bc035ab6ec23201e95c326ee66e5734acedc17c01c0ae923bcfb33294ac0b1ccdf2af4ad5fb2b451fef092b5cee4a4f9646277be1ab55d6a1dca36f3cb57a0783bc376961a807cef973ce7d2b8bf03cc91d9c6a9f77ad7a158de25bcc92290b8af92c4e2270c4f22d8c5c9d8f64d174482dec53cc00ab72a3d0515cec3e2e13dac18c1dab83457bf051e5474464ec7a3f89ed23dc4f50467f1af9dfe25689f6b99a40bb829af51d73e20433314f3958e71c570bac5d2ea396519c1cd7cfe5d85953a8ea336a54eeee78b6ade1b32301b7a76ac393c2eccfb4293f5af5dd42cd2494c80609350d8e970cb71bba9c57d3ba8d6c5c928b3ca2f7c1ecb6c4f97918cd715af7867f74cc89b64ed5f4c5d68b1496acbb42b763ebed5cb6a1e0bdd0348f10676e807f3ae98623955d97a58f93358d26e639937c4c5b18cd544d367552de59afa79fe173ea4a58c4164ce060f355edfe0cb4f70a595618f386dc3ef62b29632127a18b95b43e698e37604056ce7d335a3a5c1b598b2fdde7a57d1be21f8430e976e26b38f0b8cb102b81d53c2e8ab20740b2f5040e78aeba75aeae0a4729a6c7b6c8f6dcdcfe35a3aa4263d3d9471b5854b670e1046064e726aceb5185b1987a60e2bb68caf23d6a2ef1479f6b0eff006a85fa85653cd656b10797aace147137cc2b52f5de4bc9548e8995fad52d4f6dd5b5a5cf62a55bea2bd296e74f41ad035d58a119de9d315ce6b568ed3c732a8cf43f5ae974bba0d943939e01a82fadc7984b0dc8f80455a25ed73e8dfd84fc49b5f59d2246e048250becdc57db3e1fb936774607e9fc3f4afcddfd96f5993c37f16a3b690feeaee3da1bd4f15fa1f1c9e65ac33a9f9d7a7b8f4af23191b3b9eae11b946cfa1e9fa7ce180e78157becf8937a1eb5c6e83ad099532d8038c7a57676772248f83935e46923d45746ae9f36632addf8acfbab389b72b20604f422ad5b918f7a74d1eee6a14751a96a707e28f06d8eb513c5756eb3c6d91f32f22bcdef7e16258b66da1dc83df6b0f6e2bdf24b52c9f374aa371a5ab76add371d8eba3889537e4787daf84a06015ee2eed8ff00d743fd6adc7e0d92199645d6ae8229c8dc73c57a8dce8e1b8db559b415970bdbb8082a7dac7ac4f6238a83d5a3cbf53d053731fb7dc5c9618dbbbad4de1df872b717d0cb3c000c03b48e7eb5e9d0f8762b760c912e7b6715b1a6693e5b062307ad64e6a4fdd4635f18b92d044ba469296f0c602855030055bd525105bf928719e4d5a93fd1e318e2b0750ba457662474ef59cac8f153723ce3e38f8e2dfe1f7c36d7758965d82d6d5d97ddc8c28fccd7e4a785da5d4af24bcb83ba49e4695dbd598926bea5ff0082867c664be7b1f02584c1d8b0babed9db93b13fafe15f33786adcdadb2ffb247f5ff1afa2cbe9f253e77d4f0b1b539ea722e87556f6665d3662a32564047e46b216dd60999361f9013f9f35d368f21161312321981fd6a84d0f9d24d2f1f78835db516b738a2725772059a4c71b8015a2b018f4f507a1154e4b7336b0d163a30c5745a85b7976eaa47626b81bf78e4af2b2b1c7c91967d98e0f4fad4096203631cf7ad4b850ac2a2dc376694a479d7d0974f8561c60735bf146ac14e39ac5b39066b62190edf6a46121f248d1c9c54b1df3746e95526909a48d8f7e949ab9275fe1dbc53711a9aea8b0bbcefe9dabceaca536f22489fc2735db5aea515c42ac3827a8ae3953b327a9bfa2eb5fd925973f20e6b77fe13e44c100b1f435c3bdd237c83bd33e76fa0af36b6169d4973344f29dddb7c42bc60c63fdd2e7eed15c4c33868d413d38a2b78d3495ac163d3ec7c5135c4ff3e4ca4e4574763a9c8d1485989cf06a8f86ec4c9322884481b3f3639ae9a4d05fcb181cfa571d4a9186c74c67633bfd6427059491c8a2cd0c2cbb18a1fef56b2e90f0c1f32fcd8acef30acc131f3e715cf1adcc44a5cccd8b1b49b526fbc235dd86635d27fc23a27572bb5d00e0e3ad4be1cd1e378f695cb3119f6aee2d7498ec632146463ee9aa94949590d4b991c159e808b3f96ca304e6ad5e697079bb4202178abfe20ff4170f0b6c46396f515461d4a2f20f1c773eb5cf1a4d4cc1ee676b9650269ef850703a5783fc42b5b7b59a69d63558d4119f53e95ebfe28d7becb005b5fdf4ac7e58c0fd6bcd352f06dfeae04b76ad236e2fb73c2e6bd18cadeea293bbb23c8ec6c1ade459392243b867b51aa32cd0cd1f4278aed358d116c6e9a043b02a64f15c2ea0c1649493c28c0e3a9af7e8de295cf7e946d1479eea09b2ef2a39cb1fcaabdadbadde9b7908e76b79c83d8f515afaac7b6677c704119f7ae7f42bcfb3ccb9fbab21047aa9e0ff004af55f7375a332eca57b5be96df96046e46f4c76adc90adf59820677afeb5475db13657d2bc7f7958153fde1d455bd3260ccd10e927cebf5ee2a930f2343c097cda6f8c348bd0db6482601fe95fa5fe0cbc8f57d16d26c6e0ea0d7e60c84e9f790dec4320b8de3e9debefbfd9b7c5d16bde158543e5940056b8b151ba4ceec2bb368f55be825d3a4fb45b03e5e72cbfd6ba2f0ff008896ea35c3107b8a1acc49093db15c86a9a7cda55d79d6a4804e4af6af9da91707747b3169e8cf5fb3be0f1e55b26b463b8de9cf35e53a178c030557f91c704576963aea4f8cb8a984d30944eb6021b0b8cf7a79b71b892b81599a7deabf46ad3595a50571c74aed8d9911b9527d3d5c8c3b02734d8349755f9999862b6628feee476ab476a2e00e6af922747b56958c0934f12425033293c67152a8481510b0f4e9d6afdc203d85656ad722d76edc7beee98ac64a31d88727333754d47633af6e82bc13f68ef8e5a77c21f05ddea3732abdf48a63b4b7ddf34b21071f80c13f8568fc73f8e9a1fc2bd06eb55d52e426dcac10a37ef277ecabf97e95f959f18be30eb3f19bc5536b1aab9589495b6b553f24087b0f7f5a786c2cb133bbf851c988c4c70f1e58fc4cc4bed6afbc6fe30b9d5b5394cf7b79319a576ee49e9f8576b60855111471b89ae37c2f6aab2176e0804d76da7c615a20324051fe35f4eadb2d91e024faee75162a7fb1481d5b71fcaa7b3b6592ddd8f04bb71f80a50ad67a2c6db70634cfe18ffebd3a14921b52e5874381f85296c3ea72fa4d986d7e7900dcaad8adfd6ad54ab30182169be1f823f3a476c1323015775adde5b061c938af367b9c188d8f3ebc8ceee2a998dab7a4b7f3262314e8f4b0791eb59c8f3efa19d6b0b2ede2b6edadda40011c54b1e9df280456c59e9e5e36e3a54395918b95cc19a211b95a6c69f356a5e69a55b35456328c4139a716864f1af96b566cb50f25f69e56aa6e1b6ab37face3ad276158eaa1d41376e07f0abd0cc5a324f7e6b97b394aae0f15a90dc602fcd8acdc6e83a9ab1dd6c04ff7a8ac6975311b91d68acbd9b19f5cf856110c2b1a2f207ccddebb5b7b7416ec5d7ef715c7f87efbcb91e3d801ddd6baab390dd48559b03d335f3b59f36c56e8c5d5af92d3cc41dbb7ad7257dab416f76972870e780bef5abe28921fb55c2c87cb39e093c62bc8fc4da8cd65a943287f32cd4e233dfea6b9a8c14a56323e92f026a113449e6360e062bbd9b51862b59a4421d914b62be6bf0cf8f12d6d63527a0c86cd6f6a3f16563b192053feb06de4f26b17ed213e50d6c6bdeebe350bdb8677ddd47d39a96198b40983902bc621f171975178fccdaa1feed7ab784e4bad6a1510446623ef1c61457bb25cb042d96a5c9ad1205f3b6e1e66f938e83d6925bd16f1bb4c998e35c938ad2bcd16f3cd57b9c854185e38033d05705e35d4a4b7125b6ec493b6073d855e15a948df0f1e691c378aee16486e6fba1762cb9f4af1ef13df3c364256c0dcd807eb5eb1e3cbc8a6b386c231c4680bb7bd783f8c350135d79487e48791f515efd3d59ee449de237ba7eeeaeb9fcab8f6536f96e9f360d75fe1e93ccb565fef706b02e2d7f7d7b6efc1de48af4ba1a936a4a6fb4db6b8fbdc79327b7a56569f23432ba38f9a239fc3d6b53c3a7ed96d75a739f9a40761f461c8fd7f9d50f28854988c4a80ac83d074c7e753b32ad7d4d298a8f9cf30cc9f367b7bd7b77ecc3e327f0d78a534e797f737240463d33d87e59af0cb642d65341de13b947fb24735a5e17d526d37508268e4db2c2cac8debe94aa479e0d1ad3972c933f59b4871756b1b939ca8e29353d2d6684f1dab88f80be3b87c67e13b4959b75c2a857fc057ab4d6c59318e0d78b28292b1eb7358f30bed043b6e518917a5528ae2fb4b902b648ed5e8971a68dc723355db458ee4619320579b3c3b5aa3a2353a332747f1b1859526c035dbe93e2d864c7ef01f6ae466f0624bca8fc3150af82674e63778ff00dd3582a9521a33a6d067a7c7e2185d480c0f7a1f5e42a4f98318af3a83c2ba88fbb7f227fc0734b3786eea353e66a72b30e4aae0569f58976172c4ed6f3c510c6bcca1703a9af23f89df19e2d36ca75b3c4f36d38c9e33ef585e3669a106359e4c739c9eb5e61e2cb7f2f49949fe25f5a95294dea395a2b43e13fda03c73acf8e3e205edc6af7725c79476c51b1cac4be82b80d3ed7ed132afe26ba9f8b56e23f1a5d9fefb66b3f43b50b1339fbc4e057d8c24a14558f917172aadb34f4b8446ea074240aee2c6d43b17f7039ae434f8f75d2af60335dae9f701218074c92dfd29527a152347c4175ba18ad9090f2328fa006ac79a174fd8586ee87f1ac8beba371ac0446dd144a33f5f4ab573305bc48d465b1cfb56b27a10b7346ced560955140e3a1fa52eaf22b6e43ced1c1aaf61787cc1927bd1a8b8b8b7639f9b35e74b730ad130fe4693f1a9d64099c75cd67ee30498239f5a7a333e1bb543573c592b334d2e8719ed5d3694cad66adea6b88933b78ae874cd58436e88dd8565523a12a3a9a5a846bc9eb5cdcf18690802b62eb528d94f358725d069b22a69a7d4b912f919c2f6a9fecab1ae1569b07ccc09ab8d8ea294892a2c67078a64d31857156a4936a9ac8bb9836eab893d4635c966268aa266c515659f75416c2cdd9a3fbe4f22adfdba596221729ea47f2a86f97fe2773dbaf2bbb04d6aa58ffa3956f940ea2be57d939688ab58e17c58c754292f28c836b0f5c5717ac69d0cda4c89282339db5ea1aae928d048e8a6451c95cd7977892e9d97cb50caa0e36fb55d3c3b8cae4456b6383d53509b478408e43802b983e369a463b3731e86bafd63497d422811be4dee6b0a0f87a4336099403dabd5f674deacbea56d1358964bc432ab2966ef5f547c33d5fccd2e282ddb1dcf15f3843e0d9d632b02b06af5cf84fa835837933318da3386a53e592f744e3ccd23deb54d4468fa4c924db090848e7a9af0dd62c1eea792fee5b1f2ef0076f4af40b9ba7f156a08bbf16283afae2b03c711ac30ac63e658c5725fd93e54f567628ba6add59e07e2bbb6b75b86ddcbd785f892f99656653f36715ea5e3bd4b6c928e854b13fe15e39ad4e3cb6c9cb39cfeb5f45416899e9c7e1475de11b92cd3af551823f21526a36fbb580dd77a1c8acbf04cc64b5971ceee09ae8226174f69291c07287f0af4e2518112bd9dfc73c6d865715b9ab69fbee96e615cc3791ee3fec9e41fd69b369fe74d363aff0081adad361fb45acd037fac8db7a37e1d2b266d15a1c8c64dbc50ca0729fbb63f4a789459dd04eabd413df3daaf5cd9ed8ef140e461f155e4b769ade093fbbdea90ac7d47fb2378e3fb3f5b4d2e47d9e69017d0d7ddd67234b127208f5afcb7f84b35c69fad69d7109c11285cfd6bf4bfe1c6b49af68704cd959000197d18706bcaa9eed4691eb475a7766a5d5bed90934cb1512330f7ad7beb3665cf5154a1844791d0d6125a8d3d0b696cbc5584b506abdbb9dc0135a70e17a74ae79411b1524b70b589a859c71c724a5144920f98f7ae9e69001e95c9789ae043031ef8ae7940d6323c7fc66bf69bc28bd8d7987c42616fa6ba7fb26bd53544f32577232739af24f894775bc833dba56708fbc6929687c21f152dc49e2ecf627fad675bc3f678f04fae2ba7f8b762cbaec4ea3397c1ac1236a85fc0d7d1b97b9147cec95a4d93e9436ef94f563815d0d95c166dc7a20cd60dbb08f6af6ab42f1a28d947de90e07d2b5a72464cd9d3651248f31e9f7cb7bf2055d865125c7da00e1e42abf97359b0b79367e58e0b726b574fdb358ac407cd1739fad55497432bf2ea4a230970ccbd3b55b957310c9e08a8e1843c6d9c348bcfe869da7626b723a95ea3dab0913576b99b7766248c11f7875ab567a419002455c8e111cbb5c71fc35afa7aa2f1db35cee4787884ed7312e347dabf76b2ae2368178e0d7a0dc431342c475ae4b5ab51ce076a84dbdce4a7339a9ef9d7e5cd16970d238c8cd4735b1de2aee9b6a59b35adac6ed97e1dc3d855fb0b2b8be6257841d58d22c3c01dbbd75ba3d9b496fe5c51e42d7256a8e0b4dcc9cac73f75a488e33b4ee3dcd72f7f198e42315e8ba959c90a9dc31c5709aba1f308a546527b95130da339a2a66631f14574d8dcfb72cf50fb45eb4ce7966cd75371a82dc448b5e5567aa958d0ab7cddc56cff00c247e4c2a4f272057811bc5ea23b5b85586dd8b7dd6e2bcdf58d352e2ea667528b9e302b61fc55e7a81293919c0aa135f79e495fff0055395471d112d9c8b69c2f2fb00f2bf2a8c74f6aded2f41fb2e649305f3d0fa5496b0c57370240555c360e3a1ade8668218712b631dc77a52ab27626e72daae8b143780a031b020d5667173791a281956fde63f8bd8fb55ef15ea891445f21b71caad7296ba9f9370ae5b0cc72d83d2b6a69b5ccceaa5eefbecf72f0a98ed2cf73b176619f615c878fb570566087f7cc702abe93afff00a3a9473c03deb9dd4af6e7549e65b1b67b828a4b4a470a69d1a329cee91d6bdfd4f9ff00e244ff0067d4ae232d8e79af26d5ae0c97449cec520fe55e91f11a463a84e652bbf2785f5af2e2cd76c621df217fad7d3d28b8dae77ad8ec7e1f8611ee3cee5793f0ed5b9a3c9ba0d8df7b7127f3ae6bc2331b3b19262df2cce20855bae1412d5bda3b6df3cb67689703e9d6bac947576b6a5a3053e6de0f3572c5561956403195c13f4a8b439c4f0b8eb81c7ea69d68c197ef6393fad6323a62579f4cf3b5468c9c068d87d78cd50165f65b0900e446e0fe75d7470c6d3248c325226071eb8c5669b1379693055c82ea063a54735b5348ae8751f0c6c4dc4726d1f2c44483f020d7deff0008a66fec9474fb8f861f90af89fe06da79d77776fdfc8907e95f697c1090cde11b463d4003fa7f4af2abbbd53d4a7a533d8a36f3a3018678aa735a618ed3c7a558b59088e89242181c556e8cd6e470da8da3d6a6d8ca07a5491481fad4f0c6923124d672896a4ca2f03b72738ebcd71de2e03c9600f35e8179b238c8073c5701e2a0191b1d6b09c6c8d232bb3cf2fa258ec99cd78778da437b752a8edcd7b97899c43a6b2e70715e23a85b99ee2763c8ac23b9a9f2b7c56d2cb6a4840f983e6bceda3c48cdd3924d7b87c56b110dd7998e8d5e1baa6e8e4723ef31c71dbad7af1d628f1ea47de635a5e4b03cf41576d233b972324567dac6cf827a76ad8656b75185dadb724fb56d147232e65a3857279278ad0d1ee0acc475e769aa974db6de15032c40dcdf5151594de4c8c437ddad1c6e8996aac752a76cd91c293b4d54d36636f7d3c2e73cf1f4a4873736ce14fcc30d53dc6d92382e4ae1941526b2e84ce3cd0b16eea70117b734b69a808642ac78eb54ee19a483737d0d568d99146e24fa1ac5c4f1ea46feeb3a9fed00cbd78acdbcc4c1b71e7b536dcb4d1034488475f5acee79b6b331e4b22d2636e49ad1d3f4b78cfddc0ad5d36d576963f7ab563b4f9781439581cac655be9e649557a735d8d8cf1d8422341c639359105a94909e9c54d732854e7ef62b1ba968c98be6641af6a48aac5064d79e5fdc7993127ef66b635ed41232cbbb3ed5ca4b28924c835d118a8ad0de287c89b9b3453377bd148d8f7d5d5fca6dfbbe614fb9d79ae19143703ad717a95f90a595b048a6e9fa879b8c374eb5cbc916ae45cf44835411c6bb9ce3bd35b5f6b70d083926b966bc326c42a703926abc924d34995e54f7ce38ae4749362d5bd0eeedf5f8e3548fcc0cd9c9c54adac6e42dbbe41cd7056f2349308ad55eea6ff9e7082e4fe55bd3693ae4365e74da5ce900e1940cbffdf03935d10c0ce6ef637852d6f22beada835d337cc76678c573b757bf666324b2844ecbdcd76b1e8acd0a4f77a0ebd1596ccb7916a4337e7d05765e03d3f5dd46c5ff00e104f00f87ef3504e0b6b9a803760f6f908e3b57b1472fdb9dd8de515d11c7fc398350d7b524f33c3dacdfd9a8cac76b018c49f566c0c52fc44d4bc65a4c6f0da78365d1f4cce48cee6dbee41aea7c4fe28fda6bc0f1b5cddf85a3b7b64e1c69f0248aa3f0e715e67af7ed49e25d56ce4b1d7b4e8d5c298e43e5989c67d54d7a9ec69d08da28de97bccf10f185f4d7574ef2a1049e8c0e45705748d6b30901c48c703dabd63c41aed86b76f36e502709cee15e6d730b35d2c8bb5957a28ae7492773b89b54ba4b3d434c801db1c285cafbb5759a5cc6597ca03e5741229fa579f6b4b34fa93337326d0b8f4aebb41b82d1c473b5bcbd83e9deb4263e677be07984ba9181bee797b87e752cd208279a31de65c562780ee19fc4a519724a3007db1c5694f33cba9005785ba20fe02b096aec6f17a1d22dd296be03042c458fd462b4fc2faf58680d9d42332472b9c0039c0e6b061914cd76aa0624531fe78ad0b5f0e5b6b364b2c972d04b000d1c6bfc59623fa54492b599b45b5a9e95f0252dff00b6b546b670e9bcc89cf3b0e7afe75f597c10998f83ed8af4dcc3f5af9afe0ffc28d6bc33e2c912dc2de473592dd4801c322fff00aabe84f80acd1f83e2562411348369ebf7ce2bcaad1b4ee7a3465cd1b1ee7a7ca64519ed56de356ce6b234e63d8d6da36ec0272692d86d6a42b1ed5c0a74736de0d4acb88ce2a89dfbb23a54499712cdd4c1938e6b8cf104664278c5758c49e3bd636a5686763594b5296e79278d3f776ae00c9db5e5335ab2ac8cc304d7b378bad77314c74af3cd534f31dbc981ce2a22b53496c7cddf13f4d1711cbbba66be75f115898f519973b62cf35f4dfc4eb69773aad7cfbace99e74576265759a35f363dc3fd60391c57a949687975b7394b460aa645e2253b6ba89adfed16f139ebb3158569a695b465c7cdb726ba4d1a549b4e8e12394f96b789c7a95acc8915d5ba0fe9562dec239ae972d84c81c7d69f6d6e16e4479c6722991ee6570bc3a3601ae84ae4b3dab4af84364be191a936b10dbb3020c52b8c9e338af3d92d7ecb3496d9f3539da57a1ae8be1efc19f14fc5868459dfa5b400eddf339217f0af54f177ecc377f0faced3ed37925f34b133195576aab7d3d2a1c1ad4953d7959f3ec79906c1c0e856adc5688d85e31d2beaef82de13f84fa7782d6f7c57f618ef4bb2cc6e0e5b70f415ccfc4ef197ecfb36fb7d3c4a265042cb6dc006abeafceae99e7d58c64ed2563c0ac6dd6db7229dc3d69d3423766aaeadaae8515ec9fd95a8b4d6dd479879aaa9ab4377fea6e013e95c92a3286e62f0d4e5aa91b367308e4038ae92cf63a8c1e6b845be956403e53ef5d0e93ac43b9558ec6fd2b8aa45f438eb616495d6a755f600ea48f4ae6b5c0620e2ba8b3bf5c60e0d737e269576be2b863753d4e1846ccf31d75dbce3cd65dbb1cf5abbacb33cc4557b4b7f9726bd65b1e82d8b0b16e5a2a7561b68a2c33af494dcb75ed5a3a7c496f96040f73daa8782745d5bc73e20b2d1345b56b9d46edb64512f1cfa93d87bd7d296bff04e1f881af582dc5e78ab49d2ae19722d44124c13d890c327e9461f035310dd9d918a5ad8e5fc0bf05752f1769b0ead737967e1fd0e4e7edfa8ca115bfdc1debd7b45f853e00d16144b2d1f5cf883a975dd6f6ae2d89f63c2e3ea6b8ed0fe19fc7efd952defcdb784b4ff00891a7c88ab6d2c33198da1cf5546f9947b671cd6edbf89bf6d1f11dbf9f61e13b2d1edd8656268218d80fa349d7f0afa3a182a5452bc6ecbdba9d8c7f0efe276a6d8f0cfc37d17c336c385fed4bd4461efb6256fc8b5463f671fda22191ae2cfc4be10d319fe62b0d93311ff00023fe15e6faa6b9fb6be96c5e6d26f6555e48b582d5c7e5beb98bbfdae3f69af879303e20d3ef6d917961a8684fe5fe2ebc7eb5d72bff29a46dbb91ddf8c3e0bfed69a199678757d3f5e8319ff0041740df82b28fe75e09e3bf1c7c5af0d8f2fc67e1892c2e22ff9883e9fe5c8bee254e2bddbc03ff0548f10437110f127856cb51b6dd8966d2e5dac3df6357d23e12fdaff00e0cfc628d2ca7d462d2ef6618fb1eb1104c9f4dc78ef5cf2927a347545496a9dcf83be1ffed9de3af0ec11d9c9a9aeafa71ff965a8012951fef75a87c79f11bc25f146edee35ad1e2b499c733d90ef8e38fad7da1f133f62cf859f147ccd46c6c534db99391aa681288f27d5907caffcebe64f1f7ec0be28f0dac92687ad5a7882c87dd5993ecf70bfef0eff00fd7ac25076f719d14ea6b6923e55f1069ba7dbcb23595d990b0c2861cfe35c34b6a3cef2d1d415f99beb5eafe2cf837e2cf0cc930d434bb806319f3170c05797cd6f269d7dbe48fe7cf490706b8e5b9d6b5322e99fed1300c464027f0ad2d0e690d9ec763b998919f4a6dd66ea60ed0ac459b0c1471f5a4909b7bdb79106561f9181e383deaee23b4f015c1b7f1245b8e4a71f9d74b1b635968df19598b0fc4d727a3c91c7ac4322900a801b9e8056fda5c6ef1049286ca6c241fa8a97f11ac7634a1ba6fed4b64033e74f83f401a9350f104fa3eaa5e060043b7a8c8e3154b489c36b56a09cede9ec6bd47e1778534dbaf8a9a141af5bc57b6378cfb926195351a39a45bba8b689fc07fb5378a3c2be223ad3c36b7ccb02daf94c00cc7e83dfa57d5ffb3e78aacfc59e0efb55a6124f399a6873fead89ce2b89f197c2bf00e8be3ad3e39b47b1834c9a3995a2083693b3e5fc6be89f861fb3e7873c33e03b5d6bc350c96b797766b35c224a5a29c8cf217d40a8af479d3e5e83a35bd9c95d6e743a4b7cd93c9ae957185c8ae57453f321cf18c62bae8b061523a57968f5191cd8a84286c8a9da3566eb934a96db81c5676d4a8e84021f90e6ab4f6c0c671d6afbc47804f7a7491058589f4a7ca2b9e55e22d3d24ba60a3bf35c66b7a41547f978c57aa6a163f689ddf1c5606b1a50921618ed4a313567cadf127410d1cd295ff1af31f89f0f87b5df0ef875ac6e2393c4115a88e5b687a850390dfa57befc60d34c761205e19810b8ee7a57957c14fd98fc41f113c4171e2cb7bd82db4eb19997c823324eca0e57e86bd5c3c399729e6629f26a7cd7258fd9679576ec1d57e950dac325b4c510f3f785751e2cb98ef3c5dadd93d8ff00675cdbdd3a7d9ffbb838acc78d6171807ccdb8aab38bb1cb75257445261544dd0139c5674178bf68b85dc4104118fad5eb82f269eb274652735c9c3747fb6263b86244fd4715badb524f69f86bfb426a1f0a2dae16d2d23b86790b2f99d07d7f2ae8f57fda17e217c68b858a5b39dece14c116501f2c2fb9ae1be0cf8774cf106b88da95badca4055cc6fd1b91c1fcebf462dfc6ff000c3c0fe0211dedd69ba409ad8a9b78b686071c703dea5252ba673cb9a325247c5363f0375af1cdf436370dfd9be62877697a853c6e03f1afacfe14ff00c139fe1ce93a7da5e6b7f68f125c950e7ed4e4479ff76be7cd7bf6acd2f4ed4a0bad16c9ae25b3468fce7fbae01e3f4aa5aa7ed8ff00137c43a6fd8740ba36e8ebf22d9c5b987b56b464a0ac8ceb4154d59f7fff00c2a3f84fe03d3b64da4687a74283a491a2f15e55e38d43f6729564b7be9744593eee620b91f957c73a2fece3f1fbe3bdc47777df6eb7b598e4dc6af72d12e0f7083ad7b9f823fe09536ad1c7378b7c5b717529fbd158a0893e993cd7a0b9a5b9e6be5da31b9c87893e04fc2cf196a40f82fc610dbb48dc41bc6dcfd2bc53e277c20f107c2fbac5fc62e2c1b98ef2200a915f7ae91ff04e3f851a1aabadbdf1997a4df6e70df5e2a97ed0df071bc23f01f5ab2d2a76d612de3dd10bc937bc6a33c024d72d5c3539474d18e2ea277b58fcf2d17c44e83cb77df8e8d9ed526b3a909b3cf6ae36de47dc19415c120afa1cf357e698baf279af02545266352294ae8a57986635556411f152dd484566cd3609ab02d89873cd159a971d68ad6e07b47c06f8e11fc07d7a7d7e2d061d7352317936c26976ac3c824fe3815f4b787bfe0a9ed0ba0d6bc0a76f466b1bd04fbf0d5f4b7fc31bfc1a9f4d4b57f016952aaa0513188894f1f7b70e84f35e5fe31ff8265fc34d79649742bed63c333b72be4dcfda235ff80bff004afa4a54153828a6691bc56a8ec7e1bffc140be12f8e2e21b5b9d46e7c377721c6cd56229183e9bfa5727f14bfe0a41a67c2ff001eea7e181e0fbad592c59425fdadec462b84650c197bf7af9ffc6fff0004cbf889e1b8a6b8f0e6aba5f8b208c645bb836b7257d003f2135e99fb1bfec8fe05f1e78375dd3be27f816e6dfc61a5df18a5fb6992197cb65054a904061c751c55b8b5bb34e6bbf7773a0d23fe0ab1e149e655d43c15ac5921eb2472c7263f015eb7e0dfdbcbe0b7c425482e35b5d2e4938306b1018c13e993c5646aff00f04cbf82ba9736b65abe9afd9adf539703fe02c48af30f1aff00c127f4b9a3964f0a78eafad65fe08357b649a3fa655437a724e2a2d7da455dfda47d0de26fd9efe08fc78b53792e81a1ea4f22fcba8696ca928f70e9fd6be74f891ff04b3b491659bc07e33b8b26ea963ac442e13e8241f30edd78af03d7bf648fda0be01de3dfe856d7b77042770bcf0bde31cf7c98b3cf4f7ed5a5e0aff82857c5ef86b7cba7789a28f582870d6dad5ab5b5d601e792054be6eba8ad0fb2ecc8750f813fb487ecf2de6e9569aa5cd946773dc68373e7c247a9889f6aa70fedd7f117439974ef1469d05cdd0f947dbad9acee7f23d6bea9f87fff00053ef00ebca90f89f49d43c39704e1a554f3e1cfaee1c8fc78af6eb5f177c16f8f9a718d2efc37e258e51feae758da43ed83ce79aced0f4345ceb6773f3575afda99bc5594974af2c9043296dd953d79af0bd7efac754d42711c1b22909650dfc35fa95e3eff008277fc27d7a3b8bbd12c6e3c357cc32afa5ce44473ff004ccfcbf9735f2b7c69fd82f5cf01d94b7ba5dfa6b9668bb8ee4f2e50befeb5cd52935aad4eda755cb492b33e61d13c0e3c5562d15b88e3b984e199a4e581ef5c978abc3f79e17d59ad6ed0f03bf71eb5d0dc69ba9f86afa5489a6b5991b1953fceb27c45ad6a9afdc4235193ed1246bb55f6e0fe26b08ec6cf429697318d8cb92004da48adcd22e1a6283abaf048eb5cba486190237cbbfe53e95b7a0b35bf98cdd6a2e544dbd36eb17d7930ce236083f122a4b9d5f53fed29ca5c5ce20976c4ea5814c81f77159d61782de18cb1c1967cfe15f5ff008825f06ea1f02609d750d3a0d62183ccf243a890b2fcdd3f0a296adb654dbb1f344d0f8a76c736aa9aba7987113de2ca37641fba5bafe15e9fe18f8b1f1b7e18c62e34cb8f13db58c607971dd594d25b15c74f9971835eb7f163e297843c67e0ff00029835cb392fa39606ba863604c58501b757ddbe0af8d7f0cf50d1ec6d2dfc5ba1cc56154f2dae501fba06083f4aec8f2f33b9c5539b9558f13f801f1397e2b781acb5a93626a0498ef6145dbe5ca0f231db35edf6adfe8fd335675ef0df86aeace5d67c3f1e9e2e9b0d34b6257f78beadb7a9f7acfb3990c7ef8fd2bc5c45354e6d23dcc3d4f6b4d37ba2cdbb0ba8b7630738ab48be52d456b3aa82b56a3cc8a7d2b18a3a190edf339c536e8010371daae15d91f354ae18b29f4ab71216ace4af995588fc6b0b52b8561b474ae8754846e723ad727a85abe49c7158a566764753ca3e22d87f684db142b7b62bca97f68cbefd9b341d4ad74fd206a33ea137991195b091b6d18cfe22bddee74b17d35ccc4739dbf9579f7fc29ff0ef8ffe20e91a7f89ed8dd698f21636fbb0b230e8adea3af15e850972c96a71e2a1cd4e56dce76ebe13f853e367eceb7bf15349b287fe136995ee6f6e23727f7aa4ef41edfe15f20cb7715f2ee3f29c723f9feb5fa03fb637c36b8f0efc2fd2742f85f14960c973e5cba0e8836b4f1b8393b073c60126bf3675a8352f09eb577a66b16d2e9f7f6b218e6b69d76ba1f423e9cd7a35a0b9ae7cf61e6d7b92dcb1a8dc1b559503655ba57182ebcbbe9dcfde51b456c6b5a82b44b283c7ad71f77366f54a1e71939ef595aeec755cef7c3ba9dec78fb14b22cb270446704fb57b47c30fd967c75f1ab522934e34ab58c8679af98b3ed3d36a579a7c0dbeb3d3fc4104fa83c71c0abb99debeb9d3ff006bcf0cfc39bb46d1a06d5a6fb3857dbf2a861d326b3a6d4657667523ccad73abd43f60cd27c03e0b5d4567baf125f5a0f3258672155f9c9c28fa57d2bf0f74bf85b1f80ec2ea0b2d2b49b696dd778da91ba328c1e7ae41cd7e76fc41fdb8be277c4295f4cd2655d36de7caada5844649997d062a8781fe02fc6bf8916622b7f0d6ad0dac87709b5091a08f9ebc1e6baed35ac51c2e505a49ea8fbcbc53fb667c3ef850d269e9a9ff006ec31f082d0e597d89ef5e09f113fe0a85a9cd14b1f853438ed62e8b3de373f9549e05ff0082606bdaaac173e2df10c16099fde5be989b9be9b8fe35f517c35fd833e137c3758674d01356bd43bbed5a99f39f3ebcf02b68c5fda643937a411f9ecffb437ed09f17ae98e8adacdd46c78feccb42231ff033c77ad6ff008573fb536b5a3ddc13d96b12d9dd465248eee74e41ebc035faa775a9f83fc036589ee74dd26041c2e5500f6e2bcf355fdb07e1268f706097c57605c1c615c1e6ab9a11d8cdc67f6a563e5df8a9fb24e91e0bfd962c66b2b2f2b5db0885cdecf201e63c8c32c09f6af84e4cecebcd7d99fb677ed99178ea13e06f0248b7ba75e3224d7319e65663808bf5247e55f2af8f7e1feb7f0e7528b4fd76dfecd7724425d9e9900e2bcac5c6f2f68b6329c545a470d7d9ac999599b02b72e22dc2a9b42370ae0424508edb0bcd15a0b18e68ad394677da1fed05f14fc03a8241078cf5fd36e10f36ba84ae5bf14979c57d07f0e7fe0a5de3df0eb470f8a349b0f1340a7066841b79b1ebe84fb57e8a78abe16f83fe2158b5bebfe1dd2f59b790608b9b54933f435f367c49ff0082667c3df1279b71e14bebef075e372218985c5a93ef1b741ec39afa8e58f466d792dd1d77c2afdbf3e167c409a1b6bebe9bc2ba8c842f93ab2ed8f27b79954bf6fcf116b9e1df82da778d3c0daf5d69f71a7ea31096f349943799049b94824020aee64fc857c4df157f617f8abf0a7ceba5d297c57a4c7f31bed172ec17d5e12378ff0080e6b4ff00631f8cbabf837e33681e1bbed4e71e19bebafb2df69576731ab10769f2dfee9c803b753c5434e1abd515752568e8cc1f0efedebf197c3ede5278d975129c7977f04721e38e7807b57ac785bfe0a8ff001174a68d75bd0347d66307e678b7c0c7f98afd14d7be11f807c5b114d5bc27a1ea61b86f36ce36fad79278c3fe09f3f047c5cae63f0b7f60ccdd24d1a792db1f551c1fc78a9b41eccabcd6e8e07e1d7fc14dbe1e7889e3b7f1369f7de15b87383238f3e01f575e83eb5eea57e11fed11a36d61e1df18d9483eeb049587f51d6be4ef1d7fc1285764937837c73221c9296baddb07fc03c7c8edc9af9bbc65fb1afc72f839786fa0f0fde5d246770d43c337264c0f5dabf30e9428c97c2c4e516ad247da9f103fe0989f0bfc4fe6cfe1dbad53c257321dc059cde6c03fed9bf007d39af9b7c6dff04c9f89fe0db97bcf0beada6f896246dcbe5b359dc81edfc39e95e79e13fdb4fe35fc23b88ed2f35dbc91436dfb0f89ad9f78c76f9d777eb8afa1bc03ff00055a906c87c63e0df67b9d2a61f9ec3f8d0e4f692128afb0ec7cf7ff0009d7ed15fb3bdd795a93f8a34ab48faaea3135d5b81fef8c8c7e35e8ba37fc1477c49069f158f8a7c3363ae5a3a60ddd9bf96e57be41fc6becaf04fedb1f06be294296e35eb6b29a6f97ec9ad47e5367d39e0f5aabf11bf661f837f14adc5fdde83a7dc2cc3fe3eb4993ca6c9ee1939fcf8a9f75bd1d8b5cf1df53f35be2d78f3c13e3b91f57f0e5bdee8d7ce764d61711864653d0823bd53f876ba0eaf6173a6ea96b6b2ce5b7453b8f988c608fcf1f957d37e29ff8262dbf9771a9f847c59736c8cc7cab2d4d44e9b7d0b8f9bae3ad7cb1f14be07f89be185c48ba9dba808db04f6ec4a927a7d2b8ea53707ceb63b69d4535cacf2ef186931697aeddd948366d90ec63d3d8551d3ef3cc2ea78755d8fefe868d52daea49a61745dc3f2af2677647afaf4a658aa32452b0c330f9bddab966f437458bccfda2d153844c93f957ab7847f673f881f10ace2d6742d196e2c9d4b248f32a82062bc7a3bd55ba919bfd5ae41afb43f674fdafbc27f0d3e1dd9e8facd9dfbdc461817b68f208ed5587694acc9aa9b5a1e29a17ecff00e33924b53f66b6437d7cfa7448d7186132939ddc74e0d7ad8ff827bfc68b78dda0d1f49bc7032043a80efcf74eb58b67fb4569137c616f10416b787c3cba89bf82db80e8e570c48fcebed2f0affc148fe14476b1477cbabd94a06199accb8cfd4577424aed58e5a917ca9dcf8ced7e0d7ed05f03758b6d597c35e23b2b5b7955a76d3a61710b47b86ecaa372319eddabf44bc1fa91d73c3b677b93ba58964c1183c8ee0f43d78a7687fb767c15f1015897c5f05ac927f05e46d18fa1cd6a6a1aff0087fc4d70bab786354b3d4ec9fef4965206406b8b1b18b4a4b73af2f9ca12706ee4d1c8720f7ef5a30dce147ad50b76122e41dc0f35317db80057951563db96bb175e638355db3d33f7a92162d915256b7335a142e34ef9598f19ae6f56b5586291b1b8e30057617320f2ce0e0f6ae575899e699638f6855e5c919a8ea6ca4d2397b8d3d61b10157692324578bfc4ebebbd1616bab095a0bc8b2d14c9d55b07915ef97abfb9638e31c578b7c4cb35b8b69d5ba11fd0d5a04efb9f3e7eca769f1635bfda1b4bf191b7d5b56d22d6ea58aff51ba90884c454e42eefbc72074f435c47ede9e26f0778dfe315eeb7e14bbfb423c420be2a9b764c9c115f5ff847f6a4f097c17f84b6275bcbddda4cd1269d6a3f793019fc873d6be4bf895f0b7c35f163e0efc41f8bbe1b8f50d2aeedb573e669b3906108d8242fbf23f5af6e56a94d5ba1f2ae2e8d6f7ba9f2543ab3468d0b9ddfc3cd55650f3031a9c554933e61e3bd6de8716e187edd3358cad1573a62f99f2d8e87c33a5dccca3cb46600e33e86beb4f823fb1b43e33d2c6b7ac6aec2dca6f36b6800e32382ddabe5ed1753368e30c635200dbeb5ee9e09fdaabc49f0fbc2b73a5e8f0c2fbfa4d2f2578c71ef5cd4e5adcb9c7991fa6ff097e0afc37f85da1433695a269ba60d819ee6555f318e0124b1ebd29fe32fdac3e15fc3d668affc4b66d327fcb2b621cfe95f952be31f8c3f1e2e069d6326b5ae0fbbe4d96e5893d8b0e075af60f00ffc1343e27f8b162baf10ea561e1c8dfe628cc6e66c1f5c700d7a91e79ab9e54a50a6ed13e84f1b7fc1517c21a5c72c1e1fd16f354908c24acbb6335f36fc46ff008285fc4ef1a6eb5d2ee60d0e0909558ad57329cf61ff00d6afa53c13ff0004b5f04e96627f106bdaa6bb203965f304319fc17fad7d13e03fd987e18fc338d5f47f0ae9d6f2274b89630f27e2c69f22beac5cd396c8fca3d0fe11fc6ff8f779e6c7a5eb9a9239e6eb5391a1847fdf5cf7af67f0dffc12c7c75a85a89b5af11e9ba648dc986088cb8fc7a1afd11f147c56f03fc39b777d535bd3b4d441feafcc50703d857cf5e3aff8298fc36f0ec9241a54779adc8bd1add3e527eb55cd18fc285ece4fe29181fb3eff00c13c345f857ae7fc247e28d43fe120d4ece5f32c9766c86138fbdb7d7afe66bc33fe0a0be25f0feb7f112c2d74a9e2b9bcb38765cb45d10ff76b6fe2d7fc14bb50f15f8767d23c1fa2cd617578be4f9d273202dc6140eac6bc435afd9bfc61e19f8552fc40f16892caeeee7deb6939265da4e773fa13d87bd71e214aa41bec449422acb73c7a561b4f15464c6ece2a7ba66d831c71599713371935e23b8463a13ace17345634d7077d155765729ed1f0ebf69ff8a1f0e7cbfec4f18ea02da3e7ecb7d27da623ed86afb6ff0065dfdbd3c49f153548b46f10f876c64b8e86f2ce66873c81f730477f5a28afa37a6c7444fb81640638895ff58a1b1e99fe75e5df173f657f875f18a179b5bd0e38357dbb62d5f4e26deee338241122e09e474fa7a5145694e4ee4d48a3f1fa7f1e78c7c21e24d52c2c7c67e2051617f71671cbfda536e658a42809f9ba9007e55e97e0ff00db8fe327c3e58997c5726b76c1b1f67d523130c7a67af6a28a8a914b61c1b6b53edcfd9c7f6e8d5be2e2c16dab785ad6dee1860cf6976caa79033b0a91debebeb597ed56a2723008cecff3fe14515826ee6b64cc6d7bc0fe1df185bb41ace87a7ea70c830c9756c9267f315e0fe36ff827afc12f19333c5e173e1fb8763893459dad941f5d80e0d14576424ce694636bd8f8fbf690fd80f4af83f63737fa3f8c6faeed94645aea1669211c138de194f6af933c1bf123c4de17d416df49d7751d35525dbb2dae9d633cff00773fd68a2aaa4572ec61094b992b9f447867fe0a09f13bc0f7074cd45ec7c496d1e029ba8b63e3d370eb5ddf89fe28c1f1afc1da95dea1a1c5653dd5b32b149cb81c6e0402bea28a2b81b76b1ea25b33e29f1648d1b5ac4496e7058f7e3ffad58b24616293da8a2b825b9d6591a5c2bf662b91e72e187f5af63fd9f7f677b3f8c1f6fb79f5bb8d2d6cdced30c2afb863a7268a2ae8fc689a9f0b367c33fb3ddaddfc5c87c1bfdb73c704b139fb5adbaef182074ce3bd7b9eb5ff0004e1b3b0b3df6df102f19bcbf30fda74c47fc3e5914feb4515eb5049ca573cbc4b7ca8f97be2b7c3797e12ea06d9b545d582b6ddc2dbc8fd37b57b37fc13f7c437f1fc58bed3609bcad3aeec37cf6e790cc194023a01c13dbbd145658a8af64f42709526ebc353f442ce4315cb44395c7afd2b4a45c0041e68a2be7227d831b11279cd487f3a28aa64a2ade3feedb8ed5cc8512c92ca7866a28a4333b5262b0b62bca7c60be7473163da8a2ae2687c75f1cb418efe6b4447114b25cac4242bbb6ee38ce32335d9fc7cd1b50fd9b7e03e8be02d33587d5f4af1640fa85ebdcc0a8c9264708013814515eb43f82cf9ec5ffbca3e1299bccb83bb9238fcab7f468c79887da8a2b1abf09ad3dd9d0c31aec5279db9c5767f0f34eb67bc8a5b8896e53cc04c527dd3f5a28ae7db635b268fd50fd942eac9f45b88ad74ab5b18b28db205c0c91c9fd2bd4be257c5793e1e69ad345a68bd20630d394ec4f653e94515df094b9373cea9151d8f8d3e2b7fc146bc67a1ac91e95a169f6641da19a4693b1f615f35f8d3f6d0f8b1e3e8ff00d27c4b358c0fc186c87963f3a28aba7ef3d4c2478edf6b5a8f88b53517d7b35dcd23e0cb71234879ef8cd7d6ff00003f612d1be2969906a3ad78aaf92273cdb59db2460f4e371634515e972a4ae91e74e72e7e5be87d6df0bff61bf865f0935f5d62cac26d5353b73fb9b8d46432f9648ea01e01f7f7ae1ffe0a25e266d27e13c5a5c76eacb7528cc9bb1b473c018f6a28af2f1127caced8c52833f31e462cb826b36f1a8a2bc664c4c963f31a28a2ad6c6963ffd9, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `evaluations`
--

DROP TABLE IF EXISTS `evaluations`;
CREATE TABLE IF NOT EXISTS `evaluations` (
  `idEvaluation` int NOT NULL AUTO_INCREMENT,
  `nomEvaluation` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `dateEvaluation` date DEFAULT NULL,
  `heureEvaluation` time DEFAULT NULL,
  `ponderation` int NOT NULL,
  `pointage` int NOT NULL,
  `notePassage` decimal(4,2) NOT NULL,
  `Types_Evaluations_idType_Evaluation` int NOT NULL,
  `Cours_Livres_idCours_Livre` int NOT NULL,
  PRIMARY KEY (`idEvaluation`),
  UNIQUE KEY `idEvaluation_UNIQUE` (`idEvaluation`),
  KEY `fk_Evaluation_Type_Evaluation1_idx` (`Types_Evaluations_idType_Evaluation`),
  KEY `fk_Evaluation_Cours_Livre1_idx` (`Cours_Livres_idCours_Livre`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `evaluations`
--

INSERT INTO `evaluations` (`idEvaluation`, `nomEvaluation`, `dateEvaluation`, `heureEvaluation`, `ponderation`, `pointage`, `notePassage`, `Types_Evaluations_idType_Evaluation`, `Cours_Livres_idCours_Livre`) VALUES
(1, 'Quiz 1 ', '2024-04-03', '12:45:00', 5, 5, 60.00, 6, 3584391),
(2, 'Devoir 1 - JSON', '2024-04-09', '16:30:00', 10, 20, 60.00, 1, 3584391),
(3, 'Devoir 2 - AJAX', '2024-04-25', '16:30:00', 10, 15, 60.00, 1, 3584391),
(4, 'Test 1', '2024-05-02', '12:45:00', 35, 40, 60.00, 2, 3584391),
(5, 'Examen - PHP et AJAX ', '2024-05-13', '09:35:00', 35, 40, 60.00, 7, 3584391),
(6, 'Projet 1 - MAUI', '2024-04-24', '08:30:00', 30, 40, 60.00, 3, 3864412),
(7, 'Projet 2 - MAUI', '2024-05-13', '08:30:00', 30, 40, 60.00, 3, 3864412),
(8, 'Test 1 - MAUI', '2024-04-15', '08:30:00', 10, 40, 60.00, 2, 3864412),
(9, 'Test 2 - MAUI', '2024-05-13', '08:30:00', 10, 40, 60.00, 2, 3864412),
(10, 'Devoir MAUI (Pratique)', '2024-04-09', '16:30:00', 20, 10, 60.00, 1, 3864412),
(11, 'Présentation - Recherche', '2024-04-29', '02:45:00', 50, 30, 60.00, 4, 5683365),
(15, 'Devoir Projet final', '2024-05-02', '10:45:00', 25, 30, 60.00, 1, 5683365),
(16, 'Quiz', '2024-04-05', '08:30:00', 15, 5, 60.00, 6, 5683365),
(17, 'Test 1 ', '2024-05-09', '08:30:00', 10, 10, 60.00, 2, 5683365);

-- --------------------------------------------------------

--
-- Table structure for table `evaluations_etudiants`
--

DROP TABLE IF EXISTS `evaluations_etudiants`;
CREATE TABLE IF NOT EXISTS `evaluations_etudiants` (
  `idEvaluation_Etudiant` int NOT NULL AUTO_INCREMENT,
  `Inscriptions_idInscription` int NOT NULL,
  `Evaluations_idEvaluation` int NOT NULL,
  `datePublication` date NOT NULL,
  `publier` tinyint NOT NULL,
  `notePointage` int NOT NULL,
  `notePourcentage` decimal(5,2) NOT NULL,
  `Statut_Evaluation_idStatut` int NOT NULL,
  `retroaction` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`idEvaluation_Etudiant`),
  KEY `fk_Inscriptions_has_Evaluation_Evaluation1_idx` (`Evaluations_idEvaluation`),
  KEY `fk_Inscriptions_has_Evaluation_Inscriptions1_idx` (`Inscriptions_idInscription`),
  KEY `fk_Evaluation_Etudiant_Statut_Evaluation1_idx` (`Statut_Evaluation_idStatut`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `evaluations_etudiants`
--

INSERT INTO `evaluations_etudiants` (`idEvaluation_Etudiant`, `Inscriptions_idInscription`, `Evaluations_idEvaluation`, `datePublication`, `publier`, `notePointage`, `notePourcentage`, `Statut_Evaluation_idStatut`, `retroaction`) VALUES
(1, 1, 1, '2024-04-09', 1, 4, 80.00, 1, NULL),
(2, 1, 2, '2024-04-17', 1, 18, 90.00, 1, 'Excellent! Assures-toi de réviser la syntaxe.'),
(3, 1, 3, '2024-05-02', 1, 14, 93.33, 1, 'Excellent!'),
(4, 1, 4, '2024-05-10', 0, 37, 91.25, 1, NULL),
(5, 1, 5, '2024-05-17', 0, 34, 83.75, 1, NULL),
(6, 2, 11, '2024-05-08', 1, 30, 100.00, 1, 'Très belle présentation. Belle élocution et très bonne recherche du sujet: DevOp'),
(7, 2, 15, '2024-05-10', 1, 23, 75.00, 1, NULL),
(8, 2, 16, '2024-04-11', 1, 4, 80.00, 1, NULL),
(9, 2, 17, '2024-05-17', 0, 9, 87.50, 1, NULL),
(10, 3, 6, '2024-04-19', 1, 31, 76.25, 1, 'Ne pas oublier d\'inclure le fichier ressources.'),
(11, 3, 7, '2024-05-18', 0, 24, 58.75, 2, 'Point à réviser: les options de stockage'),
(12, 3, 8, '2024-04-24', 1, 35, 86.88, 1, 'Bravo!'),
(13, 3, 9, '2024-05-13', 0, 27, 67.50, 1, NULL),
(14, 3, 10, '2024-04-17', 1, 10, 95.00, 1, NULL),
(15, 3, 8, '2024-05-18', 0, 0, 0.00, 2, 'Ne pas oublier d\'ajouter tous les options de navigation.');

-- --------------------------------------------------------

--
-- Table structure for table `inscriptions`
--

DROP TABLE IF EXISTS `inscriptions`;
CREATE TABLE IF NOT EXISTS `inscriptions` (
  `idInscription` int NOT NULL AUTO_INCREMENT,
  `Etudiant_matricule` int NOT NULL,
  `Cours_Livres_idCours_Livre` int NOT NULL,
  `noteFinale` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idInscription`,`Etudiant_matricule`,`Cours_Livres_idCours_Livre`),
  KEY `fk_Etudiant_has_Cours_Livre_Cours_Livre1_idx` (`Cours_Livres_idCours_Livre`),
  KEY `fk_Etudiant_has_Cours_Livre_Etudiant1_idx` (`Etudiant_matricule`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `inscriptions`
--

INSERT INTO `inscriptions` (`idInscription`, `Etudiant_matricule`, `Cours_Livres_idCours_Livre`, `noteFinale`) VALUES
(1, 2051798, 4, NULL),
(2, 2051798, 6, NULL),
(3, 2051798, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inscriptions_sessions`
--

DROP TABLE IF EXISTS `inscriptions_sessions`;
CREATE TABLE IF NOT EXISTS `inscriptions_sessions` (
  `Etudiants_matricule` int NOT NULL,
  `Sessions_sessionID` int NOT NULL,
  `moyenneSouhaitee` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Etudiants_matricule`,`Sessions_sessionID`),
  KEY `fk_Inscription_Session_Etudiant1_idx` (`Etudiants_matricule`),
  KEY `fk_Inscription_Session_Session1_idx` (`Sessions_sessionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `inscriptions_sessions`
--

INSERT INTO `inscriptions_sessions` (`Etudiants_matricule`, `Sessions_sessionID`, `moyenneSouhaitee`) VALUES
(2051798, 1, 75.00),
(2051798, 2, 80.00),
(2051798, 3, 75.00),
(2051798, 4, 75.00),
(2051798, 5, 85.00),
(2051798, 6, 80.00),
(2064823, 1, 85.00),
(2064823, 2, 90.00),
(2064823, 3, 90.00),
(2064823, 4, 80.00),
(2064823, 5, 70.00),
(2064823, 6, 75.00);

-- --------------------------------------------------------

--
-- Table structure for table `programmes`
--

DROP TABLE IF EXISTS `programmes`;
CREATE TABLE IF NOT EXISTS `programmes` (
  `idProgramme` int NOT NULL AUTO_INCREMENT,
  `titreProgramme` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dureeAnnee` int NOT NULL DEFAULT '2',
  PRIMARY KEY (`idProgramme`),
  UNIQUE KEY `titreProgramme_UNIQUE` (`titreProgramme`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `programmes`
--

INSERT INTO `programmes` (`idProgramme`, `titreProgramme`, `dureeAnnee`) VALUES
(1, 'Administration des affaires', 2),
(2, 'Assurances de dommages', 2),
(3, 'Gestion d\'événements', 2),
(4, 'Gestion de la chaîne d\'approvisionnement', 2),
(5, 'Marketing', 2),
(6, 'Planification financière personnelle', 2),
(7, 'Ressources humaines', 2),
(8, 'Art culinaire', 2),
(9, 'Communication médiatique', 2),
(10, 'Conception graphique', 2),
(11, 'Créativité et innovation', 1),
(12, 'Cuisine professionnelle', 1),
(13, 'Secrétariat médical', 2),
(14, 'Briquetage-maçonnerie', 1),
(15, 'Charpenterie', 1),
(16, 'Plomberie', 1),
(17, 'Tuyauterie', 1),
(18, 'Analyse de données', 2),
(19, 'Internet des objets', 2),
(20, 'Technologie du génie électronique', 2),
(21, 'Électricité', 1),
(22, 'Technique de climatisation et de réfrigération', 1),
(23, 'Commis comptable et paie', 1),
(24, 'Gestion de la petite et moyenne entreprise', 1),
(25, 'Techniques de comptabilité', 2),
(26, 'Vente', 1),
(27, 'Compétences essentielles au secondaire pour adultes', 2),
(28, 'Études secondaires pour adultes', 2),
(29, 'Design d\'intérieur', 2),
(30, 'Dessin technique et industriel', 2),
(31, 'Technologie du génie du bâtiment', 2),
(32, 'Technologie du génie du soudage', 2),
(33, 'Technologie du génie mécanique', 2),
(34, 'Électromécanique de systèmes automatisés', 2),
(35, 'Mécanique de machines fixes (Power Engineering)', 2),
(36, 'Mécanique industrielle (Millwright)', 1),
(37, 'Technologie de l\'instrumentation et de l\'automatisation', 2),
(38, 'Débosselage et peinture de carrosserie', 1),
(39, 'Mécanique d\'équipement lourd', 1),
(40, 'Mécanique de camions et remorques', 1),
(41, 'Mécanique de l\'automobile', 1),
(42, 'Mécanique de véhicules récréatifs', 1),
(43, 'Fabrication métallique et soudage', 1),
(44, 'Soudage', 1),
(45, 'Usinage à commande numérique (CNC Machinist)', 2),
(46, 'Usinage de matériaux (Machinist)', 1),
(47, 'Éducation à l\'enfance', 1),
(48, 'Leadership et gestion des services de garde', 2),
(49, 'Cybersécurité', 2),
(50, 'Programmation et applications mobiles', 2),
(51, 'Programmation et développement de jeux', 2),
(52, 'Réseautique et sécurité informatique', 2),
(53, 'Contrôle qualité - transformation alimentaire', 1),
(54, 'Technologie de l\'environnement', 2),
(55, 'Technologie minière - exploitation', 2),
(56, 'Technique en service social et communautaire', 2),
(57, 'Techniques correctionnelles', 2),
(58, 'Techniques d\'intervention en délinquance', 2),
(59, 'Techniques d\'intervention en éducation spécialisée et autisme', 2),
(60, 'Techniques d\'intervention en santé mentale et vieillissement', 2),
(61, 'Techniques parajudiciaires', 2),
(62, 'Techniques policières', 2),
(63, 'Mission soins infirmiers - Soins infirmiers auxiliaires', 2),
(64, 'Préposé aux soins aigus avec intégration au milieu de travail canadien', 1),
(65, 'Préposé aux soins avec intégration au milieu de travail canadien', 1),
(66, 'Soins infirmiers auxiliaires', 2),
(67, 'Assistance dentaire - niveau II', 1),
(68, 'Soins paramédicaux primaires', 2),
(69, 'Techniques de réadaptation', 2),
(70, 'Assistance de laboratoire médical', 1),
(71, 'Technologie d\'électrophysiologie médicale - cardiologie', 2);

-- --------------------------------------------------------

--
-- Table structure for table `saisons`
--

DROP TABLE IF EXISTS `saisons`;
CREATE TABLE IF NOT EXISTS `saisons` (
  `idSaison` int NOT NULL AUTO_INCREMENT,
  `nomSaison` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `codeSaison` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`idSaison`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `saisons`
--

INSERT INTO `saisons` (`idSaison`, `nomSaison`, `codeSaison`) VALUES
(1, 'Automne', 'A'),
(2, 'Hiver', 'H'),
(3, 'Printemps', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `sessionID` int NOT NULL AUTO_INCREMENT,
  `dateDebutSession` date NOT NULL,
  `dateFinSession` date NOT NULL,
  `Saisons_idSaison` int NOT NULL,
  `nomSession` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`sessionID`),
  UNIQUE KEY `sectionID_UNIQUE` (`sessionID`),
  KEY `fk_Sessions_Saisons1_idx` (`Saisons_idSaison`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sessionID`, `dateDebutSession`, `dateFinSession`, `Saisons_idSaison`, `nomSession`) VALUES
(1, '2022-09-07', '2022-12-23', 1, 'Automne 2022'),
(2, '2023-01-09', '2023-04-19', 2, 'Hiver 2023'),
(3, '2023-04-24', '2023-06-09', 3, 'Printemps 2023'),
(4, '2023-09-06', '2023-12-22', 1, 'Automne 2023'),
(5, '2024-01-08', '2024-04-17', 2, 'Hiver 2024'),
(6, '2024-04-22', '2024-06-07', 3, 'Printemps 2024');

--
-- Triggers `sessions`
--
DROP TRIGGER IF EXISTS `before_insert_session`;
DELIMITER $$
CREATE TRIGGER `before_insert_session` BEFORE INSERT ON `sessions` FOR EACH ROW BEGIN
    DECLARE saison_name VARCHAR(9);

    -- Get the year from dateDebutSession
    DECLARE year_start_session YEAR;
    SET year_start_session = YEAR(NEW.dateDebutSession);

    -- Retrieve nomSaison from Saisons table
    SELECT nomSaison INTO saison_name
    FROM Saisons
    WHERE codeSaison = 
        CASE
            WHEN MONTH(NEW.dateDebutSession) BETWEEN 3 AND 5 THEN 'P' -- Printemps
            WHEN MONTH(NEW.dateDebutSession) BETWEEN 9 AND 11 THEN 'A' -- Automne
            ELSE 'H' -- Hiver
        END;

    -- Set nomSession
    SET NEW.nomSession = CONCAT(saison_name, ' ', year_start_session);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `statuts_evaluations`
--

DROP TABLE IF EXISTS `statuts_evaluations`;
CREATE TABLE IF NOT EXISTS `statuts_evaluations` (
  `idStatut` int NOT NULL AUTO_INCREMENT,
  `descriptionStatutEval` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`idStatut`),
  UNIQUE KEY `idStatut_UNIQUE` (`idStatut`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `statuts_evaluations`
--

INSERT INTO `statuts_evaluations` (`idStatut`, `descriptionStatutEval`) VALUES
(1, 'Succès'),
(2, 'Insuccès'),
(3, 'Incomplet');

-- --------------------------------------------------------

--
-- Table structure for table `types_evaluations`
--

DROP TABLE IF EXISTS `types_evaluations`;
CREATE TABLE IF NOT EXISTS `types_evaluations` (
  `idType_Evaluation` int NOT NULL AUTO_INCREMENT,
  `typeEvaluation` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`idType_Evaluation`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `types_evaluations`
--

INSERT INTO `types_evaluations` (`idType_Evaluation`, `typeEvaluation`) VALUES
(1, 'Devoir'),
(2, 'Test'),
(3, 'Projet'),
(4, 'Présentation'),
(5, 'Exercice'),
(6, 'Quiz'),
(7, 'Examen'),
(8, 'Autre');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alertes_etudiants`
--
ALTER TABLE `alertes_etudiants`
  ADD CONSTRAINT `fk_Etudiants_has_Alertes_Alertes1` FOREIGN KEY (`Alertes_idAlerte`) REFERENCES `alertes` (`idAlerte`),
  ADD CONSTRAINT `fk_Etudiants_has_Alertes_Etudiants1` FOREIGN KEY (`Etudiants_matricule`) REFERENCES `etudiants` (`matricule`);

--
-- Constraints for table `campus_programmes`
--
ALTER TABLE `campus_programmes`
  ADD CONSTRAINT `fk_Campus_has_Programmes_Campus1` FOREIGN KEY (`Campus_idCampus`) REFERENCES `campus` (`idCampus`),
  ADD CONSTRAINT `fk_Campus_has_Programmes_Programmes1` FOREIGN KEY (`Programmes_idProgramme`) REFERENCES `programmes` (`idProgramme`);

--
-- Constraints for table `cours_livres`
--
ALTER TABLE `cours_livres`
  ADD CONSTRAINT `fk_Cours_has_Session_Enseignant1` FOREIGN KEY (`Enseignants_idEnseignant`) REFERENCES `enseignants` (`idEnseignant`),
  ADD CONSTRAINT `fk_Cours_has_Session_Session1` FOREIGN KEY (`Sessions_sessionID`) REFERENCES `sessions` (`sessionID`),
  ADD CONSTRAINT `fk_Cours_Livres_Cours1` FOREIGN KEY (`Cours_sigle`) REFERENCES `cours` (`sigle`);

--
-- Constraints for table `etudiants`
--
ALTER TABLE `etudiants`
  ADD CONSTRAINT `fk_Etudiants_Campus_Programmes1` FOREIGN KEY (`Campus_Programmes_Campus_idCampus`,`Campus_Programmes_Programmes_idProgramme`) REFERENCES `campus_programmes` (`Campus_idCampus`, `Programmes_idProgramme`);

--
-- Constraints for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD CONSTRAINT `fk_Evaluation_Cours_Livre1` FOREIGN KEY (`Cours_Livres_idCours_Livre`) REFERENCES `cours_livres` (`Enseignants_idEnseignant`),
  ADD CONSTRAINT `fk_Evaluation_Type_Evaluation1` FOREIGN KEY (`Types_Evaluations_idType_Evaluation`) REFERENCES `types_evaluations` (`idType_Evaluation`);

--
-- Constraints for table `evaluations_etudiants`
--
ALTER TABLE `evaluations_etudiants`
  ADD CONSTRAINT `fk_Evaluation_Etudiant_Statut_Evaluation1` FOREIGN KEY (`Statut_Evaluation_idStatut`) REFERENCES `statuts_evaluations` (`idStatut`),
  ADD CONSTRAINT `fk_Inscriptions_has_Evaluation_Evaluation1` FOREIGN KEY (`Evaluations_idEvaluation`) REFERENCES `evaluations` (`idEvaluation`),
  ADD CONSTRAINT `fk_Inscriptions_has_Evaluation_Inscriptions1` FOREIGN KEY (`Inscriptions_idInscription`) REFERENCES `inscriptions` (`idInscription`);

--
-- Constraints for table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD CONSTRAINT `fk_Etudiant_has_Cours_Livre_Cours_Livre1` FOREIGN KEY (`Cours_Livres_idCours_Livre`) REFERENCES `cours_livres` (`idCours_Livre`),
  ADD CONSTRAINT `fk_Etudiant_has_Cours_Livre_Etudiant1` FOREIGN KEY (`Etudiant_matricule`) REFERENCES `etudiants` (`matricule`);

--
-- Constraints for table `inscriptions_sessions`
--
ALTER TABLE `inscriptions_sessions`
  ADD CONSTRAINT `fk_Inscription_Session_Etudiant1` FOREIGN KEY (`Etudiants_matricule`) REFERENCES `etudiants` (`matricule`),
  ADD CONSTRAINT `fk_Inscription_Session_Session1` FOREIGN KEY (`Sessions_sessionID`) REFERENCES `sessions` (`sessionID`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_Sessions_Saisons1` FOREIGN KEY (`Saisons_idSaison`) REFERENCES `saisons` (`idSaison`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
