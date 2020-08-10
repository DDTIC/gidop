-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 10 août 2020 à 14:49
-- Version du serveur :  5.7.26
-- Version de PHP :  5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gidop`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

DROP TABLE IF EXISTS `action`;
CREATE TABLE IF NOT EXISTS `action` (
  `idAction` int(11) NOT NULL AUTO_INCREMENT,
  `idProgBudgetaire` int(11) NOT NULL,
  `libelleAction` varchar(50) DEFAULT NULL,
  `ObjectifOperationnel` text,
  `Cout` float DEFAULT NULL,
  `niveauPhysiqueT1` float DEFAULT NULL,
  `niveauPhysiqueT2` float DEFAULT NULL,
  `niveauPhysiqueT3` float DEFAULT NULL,
  `niveauPhysiqueT4` float DEFAULT NULL,
  `niveauFinancierT1` int(11) DEFAULT NULL,
  `niveauFinancierT2` int(11) DEFAULT NULL,
  `niveauFinancierT3` int(11) DEFAULT NULL,
  `niveauFinancierT4` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAction`),
  UNIQUE KEY `ACTION_PK` (`idAction`),
  KEY `ASSOCIATION_29_FK` (`idProgBudgetaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

DROP TABLE IF EXISTS `activite`;
CREATE TABLE IF NOT EXISTS `activite` (
  `idActivite` int(11) NOT NULL AUTO_INCREMENT,
  `idAction` int(11) NOT NULL,
  `libActivite` varchar(25) DEFAULT NULL,
  `indicateurActivite` varchar(25) DEFAULT NULL,
  `valeurRef` varchar(25) DEFAULT NULL,
  `valeurCible` varchar(25) DEFAULT NULL,
  `coutActivite` int(11) DEFAULT NULL,
  `niveauPhysiqueT1` float DEFAULT NULL,
  `niveauPhysiqueT2` float DEFAULT NULL,
  `niveauPhysiqueT3` float DEFAULT NULL,
  `niveauPhysiqueT4` float DEFAULT NULL,
  `niveauFinancierT1` int(11) DEFAULT NULL,
  `niveauFinancierT2` int(11) DEFAULT NULL,
  `niveauFinancierT3` int(11) DEFAULT NULL,
  `niveauFinancierT4` int(11) DEFAULT NULL,
  `ResutatAtteint` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idActivite`),
  UNIQUE KEY `ACTIVITE_PK` (`idActivite`),
  KEY `fk_action_activite_idAction` (`idAction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `idAgent` int(11) NOT NULL AUTO_INCREMENT,
  `idDepartement` int(11) NOT NULL,
  `idfonction` int(11) NOT NULL,
  `matriculeAgent` varchar(25) DEFAULT NULL,
  `nomAgent` varchar(25) DEFAULT NULL,
  `prenomAgent` varchar(54) DEFAULT NULL,
  `telAgent` varchar(30) DEFAULT NULL,
  `emailAgent` varchar(25) DEFAULT NULL,
  `sexe` char(10) DEFAULT NULL,
  PRIMARY KEY (`idAgent`),
  UNIQUE KEY `AGENT_PK` (`idAgent`),
  KEY `ASSOCIATION_11_FK` (`idDepartement`),
  KEY `ASSOCIATION_22_FK` (`idfonction`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`idAgent`, `idDepartement`, `idfonction`, `matriculeAgent`, `nomAgent`, `prenomAgent`, `telAgent`, `emailAgent`, `sexe`) VALUES
(1, 11, 9, '91421 H', 'BADIEL ', 'Bazoin ', '', ' ', 'M'),
(2, 11, 9, '257 291 L', 'DIALLO/TOURE ', 'Aïssata ', ' 70294662 ', ' ', 'F'),
(3, 11, 9, '112408', 'DIONI ', 'Ibrahima ', ' 76411111 ', ' ', 'M'),
(4, 11, 9, '49 052 H', 'KABORE ', 'Idrissa ', ' 70233124 ', ' ', 'M'),
(5, 11, 9, '229533 X', 'MAIGA ', 'Harouna ', ' 70590337 ', ' ', 'M'),
(6, 11, 9, '239657', 'NIKIEMA ', 'Amadou ', ' 78398636 ', ' ', 'M'),
(7, 11, 9, '106121 R', 'OUEDRAOGO ', 'Fayshal ', '', ' ', 'M'),
(8, 11, 9, '19702 X', 'SAWADOGO ', 'Lucien ', '', ' ', ''),
(9, 11, 9, '104 303 H', 'TANKOANO/LOMPO ', 'Jokebed ', ' 70228992 ', ' ', 'F'),
(10, 11, 9, '51157 J', 'ZONGO ', 'R. Lucien ', ' 70240481 ', ' ', 'M'),
(11, 14, 9, '235359 S', 'BAKI ', 'Nestor ', ' 76426289 ', ' ', 'M'),
(12, 14, 9, '215148J', 'DABILGOU ', 'W. Antoine ', '', ' ', 'M'),
(13, 14, 9, '88784 L', 'DIPAMA ', 'Jean-Baptiste ', ' 70181874 ', ' ', 'M'),
(14, 14, 9, '52097 T', 'OUEDRAOGO ', 'Jean-Baptiste ', ' 53002127 ', ' ', 'M'),
(15, 14, 9, '220 320', 'SOME ', 'K Christian ', '', ' ', ''),
(16, 14, 9, '98 281 Y', 'SOME ', 'A Galip ', ' 70752505 ', ' ', 'M'),
(17, 14, 9, '25509 H', 'SOME ', 'Alexis ', '', ' ', 'M'),
(18, 14, 9, '212 475 Y', 'SOURGOU ', 'Adama ', ' 75265144 ', ' ', 'M'),
(19, 14, 9, '102949 L', 'SYLLA ', 'Moustapha ', '', ' ', ''),
(20, 5, 9, '212 400 X', 'KOUSSOUBE ', 'Fabrice ', '', ' ', ''),
(21, 5, 9, '257 290 D', 'SAWADOGO ', 'N.Sandrine Magloire ', ' 76310206 ', ' ', 'F'),
(22, 5, 9, '229838 U', 'SORGHO ', 'Sunogo Ephraim ', ' 76527031 ', ' ', 'M'),
(23, 5, 9, '75003 M', 'YAMEOGO ', 'Benjamin ', ' 70713485 ', ' ', 'M'),
(24, 5, 9, '212420 U', 'YIOUGO ', 'Sibiri ', ' 76527031 ', ' ', 'M'),
(25, 5, 9, '97 357', 'ZONGO ', 'Camille ', ' 70066120 ', ' ', 'M'),
(26, 4, 9, '212197 C', 'BANGRE ', 'Yacouba ', ' 70442303 ', ' ', 'M'),
(27, 4, 9, '238574 V', 'DABONE ', 'Jean-Baptiste ', ' 71223355 ', ' ', 'M'),
(28, 4, 9, '56693 J', 'DIALLO/DIALLO ', 'Aissata ', ' 70127690 ', ' ', 'F'),
(29, 4, 9, '212 201 M', 'KABORE ', 'P Cyrille ', ' 70433257 ', ' ', 'M'),
(30, 4, 9, '354 133 Z', 'KABORE ', 'Nathalie ', '', ' ', ''),
(31, 4, 9, '220673 J', 'MEDA ', 'Férona ', ' 70372677 ', ' ', 'M'),
(32, 4, 9, '117258 K', 'OUATTARA/BONKOUNGOU ', 'Sougrinoma Euphrasie ', '', ' ', 'F'),
(33, 4, 9, '91270 M', 'OUEDRAOGO / PARE ', 'Ida ', '', ' ', ''),
(34, 4, 9, '256 602 F', 'OUEDRAOGO/TRAORE ', 'Aminata ', ' 70578321 ', ' ', 'F'),
(35, 4, 9, '111 224 C', 'ROUAMBA ', 'W. Jean De Dieu ', ' 70173336 ', ' ', 'M'),
(36, 4, 9, '251 386 U', 'SANOU ', 'Askadar Housmane ', '', ' ', ''),
(37, 4, 9, '237980 N', 'SAWADOGO ', 'François D\'assise ', '', ' ', 'M'),
(38, 4, 9, '329957 B', 'YAGO/NANA ', 'Djamilatou ', ' 70270737 ', ' ', 'F'),
(39, 4, 9, '112457 U', 'ZIDA ', 'P Thierry Roland ', ' 70042325 ', ' ', 'M'),
(40, 7, 9, '91 956', 'BIKIENGA ', 'Amado ', ' 70353063 ', ' ', 'M'),
(41, 7, 9, '75 666 P', 'CONSIGUI ', 'Amado ', '', ' ', 'M'),
(42, 7, 9, '238 208 K', 'ILBOUDO ', 'B. Martine ', '', ' ', ''),
(43, 7, 9, '251384', 'OUATTARA ', 'Hakim Tidiane ', ' 70181522 ', ' ', 'M'),
(44, 7, 9, '28133 F', 'OUEDRAOGO ', 'Paténema Salif ', ' 70766412 ', ' ', 'M'),
(45, 7, 9, '262 709 T', 'PARE ', 'Elisabeth ', ' 70777378 ', ' ', 'F'),
(46, 7, 9, '326883 X', 'SAWADOGO/KARAMBIRI ', 'Djénéba ', ' 72767600 ', ' ', 'F'),
(47, 7, 9, '216748 K', 'TOU / NANA ', 'Aguiratou ', '', ' ', 'F'),
(48, 7, 9, '77749 M', 'VIGNIGBE/OUEDRAOGO ', 'Adama ', ' 63935725 ', ' ', 'F'),
(49, 3, 9, '117261 F', 'BADO ', 'Patrick ', ' 72042778 ', ' ', 'M'),
(50, 3, 9, '324986 X', 'BATIENE/BONKOUNGOU ', 'Haoua ', ' 70102873 ', ' ', 'F'),
(51, 3, 9, '47757', 'DIANE ', 'Aboubacar ', '', ' ', 'M'),
(52, 3, 9, '54 555 G', 'KABORE ', 'W, Patrice ', ' 70266746 ', ' ', ''),
(53, 3, 9, '54488 D', 'KABORE ', 'Félix ', ' 70498735 ', ' ', 'M'),
(54, 3, 9, '27996 M', 'KERE ', 'Sanré Serges ', ' 70119690 ', ' ', 'M'),
(55, 3, 9, '211 787 V', 'ROUAMBA ', 'M Isaac ', ' 60582154 ', ' ', 'M'),
(56, 3, 9, '118935 A', 'SAWADOGO ', 'Assiata ', '', ' ', 'F'),
(57, 3, 9, '26300 R', 'SAWADOGO ', 'Larba ', ' 70294744 ', ' ', 'M'),
(58, 3, 9, '238625 H', 'ZADINI ', 'Goh Germain Zontowa ', '', ' ', 'M'),
(59, 3, 9, '218359 K', 'ZONGO W Samuel ', ' ', ' 71081216 ', ' ', 'M'),
(60, 15, 9, '343140 D', 'BA ', 'Nouhoun ', ' 70937141 ', ' ', 'M'),
(61, 15, 9, '119308 M', 'BAZIE/YAMEOGO ', 'Laure Andréa ', ' 70756458 ', ' ', 'F'),
(62, 15, 9, '229548', 'KONATE ', 'Ibrahim ', ' 40084685 ', ' ', 'M'),
(63, 15, 9, '75411 P', 'OUEDRAOGO ', 'Amado ', ' 60161600 ', ' ', 'M'),
(64, 15, 9, '34833 K', 'SAWADOGO ', 'y. Lanssané ', '', ' ', 'M'),
(65, 15, 9, '326800 H', 'TRAORE ', 'Aîssa ', ' 71592159 ', ' ', 'F'),
(66, 10, 9, '91537 D', 'COMPAORE ', 'Souleymane ', '', ' ', 'M'),
(67, 10, 9, '217032 X', 'ILLY ', 'Ramata ', ' 70276012 ', ' ', 'F'),
(68, 10, 9, '226409 F', 'MAIGA ', 'Daouda S, Elmoctar ', ' 71223794 ', ' ', 'M'),
(69, 10, 9, '59777 Z', 'NACAMBO ', 'S. Tahirou ', ' 78001285 ', ' ', 'M'),
(70, 10, 9, '79176 C', 'OUATTARA/BAMBA ', 'Halimata ', ' 70011277 ', ' ', 'F'),
(71, 10, 9, '117004 U', 'SAWADOGO ', 'Emmanuel ', ' 70402532/79622382 ', ' ', 'M'),
(72, 10, 9, '345549 D', 'TONDE ', 'P. Samuel ', ' 76464109 ', ' ', 'M'),
(73, 2, 9, '40585 E', 'KABORE ', 'Amado ', ' 70203087 ', ' ', 'M'),
(74, 2, 9, '33316 E', 'OUATTARA ', 'Bamory ', ' 70210471 ', ' ', 'M'),
(75, 2, 9, '53615 Y', 'OUEDRAOGO ', 'Désiré ', ' 70256945 ', ' ', 'M'),
(76, 2, 9, '26337 G', 'OUEDRAOGO ', 'Mahamadou ', ' 70225707 ', ' ', 'M'),
(77, 2, 9, '257 283 T', 'OUEDRAOGO ', 'T Mathilde ', ' 72707796 ', ' ', ''),
(78, 2, 9, '59695 D', 'ROUAMBA/GUIGMA ', 'Yvonne ', ' 70149252 ', ' ', 'F'),
(79, 2, 9, '228685 J', 'TRAORE ', 'Matenin ', ' 78079609 ', ' ', 'F'),
(80, 6, 9, '74820 D', 'BAMBARA ', 'Clement ', ' 78010123 ', ' ', 'M'),
(81, 6, 9, '501542 Z', 'GUIRE ', 'Alassane ', '', ' ', ''),
(82, 6, 9, '203 303', 'OUATTARA ', 'Baba ', ' 70381435 ', ' ', 'M'),
(83, 6, 9, '91 894 C', 'SAVADOGO ', 'Hamadé ', ' 78305260 ', ' ', ''),
(84, 6, 9, '103677', 'SOME/COMPAORE ', 'Diane Pauline ', ' 70027653 ', ' ', 'F'),
(85, 6, 9, '91 350 Z', 'TRAORE ', 'Dieudonné ', ' 70228154 ', ' ', 'M'),
(86, 8, 9, '44131 U', 'OUEDRAOGO ', 'Elise ', ' 70732056 ', ' ', 'F'),
(87, 8, 9, '118935', 'SAWADOGO ', 'Assiata ', '', ' ', ''),
(88, 8, 9, '23366 V', 'YONLI ', 'Y Ousmane ', '', ' ', ''),
(89, 12, 9, '216103 G', 'DA ', 'Sansan Biwété Nilce ', ' 70141793 ', ' ', 'M'),
(90, 12, 9, '85078 Z', 'LANKOANDE ', 'Mahaman Salifou ', ' 71167550 ', ' ', 'M'),
(91, 12, 9, '214802 U', 'OUEDRAOGO / KANYALA ', 'Héléna C. B. Lucie ', '', ' ', ''),
(92, 12, 9, '256059 H', 'RAPADEMNABA ', 'G. Aimé ', ' 76566282 ', ' ', 'M'),
(93, 12, 9, '255957 Z', 'TRAORE ', 'P. Hervé Stéphane ', ' 70076516 ', ' ', 'M'),
(94, 1, 9, '110790 G', 'BAKOUAN ', 'Didier Bienvenu ', '', ' ', 'M'),
(95, 1, 9, '49739 G', 'KIRAKOYE ', 'Moubasséra ', '', ' ', 'M'),
(96, 1, 9, '41245 J', 'KORA/ZEBA ', 'Alizèta ', '', ' ', 'F'),
(97, 1, 9, '326801 R', 'KOUTOU ', 'R Natacha ', ' 71263367 ', ' ', 'M'),
(98, 1, 9, '97613', 'NARE ', 'Alphonse ', '', ' ', ''),
(99, 1, 9, '257292 T', 'OUEDRAOGO ', 'P. Gisèle ', ' 71401271 ', ' ', 'F'),
(100, 1, 9, '117257 W', 'ZIBA/ROAMBA ', 'Windkouni Jeanne ', '', ' ', 'F'),
(101, 13, 9, '247444', 'BONKOUNGOU ', 'Kisito ', ' 78960862 ', ' ', 'M'),
(102, 13, 9, '247445 C', 'ILBOUDO ', 'Antoine ', ' 70415860 ', ' ', 'M'),
(103, 13, 9, '345546 R', 'LAMIEN ', 'Siéssan ', ' 78987050 ', ' ', 'M'),
(104, 13, 9, '41249H', 'LAMIZANA ', 'C. PLACIDE ', ' 72767899 ', ' ', 'F'),
(105, 13, 9, '43859 U', 'NEBIE ', 'Lamoussa Marcel ', ' 70000001 ', ' ', 'M');

-- --------------------------------------------------------

--
-- Structure de la table `agentimpliquedcc`
--

DROP TABLE IF EXISTS `agentimpliquedcc`;
CREATE TABLE IF NOT EXISTS `agentimpliquedcc` (
  `idDossierCC` int(11) NOT NULL,
  `idAgent` int(11) NOT NULL,
  `RoleAgent` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idDossierCC`,`idAgent`),
  KEY `ASSOCIATION_4_FK` (`idDossierCC`),
  KEY `ASSOCIATION_4_FK2` (`idAgent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `agentimpliquedo`
--

DROP TABLE IF EXISTS `agentimpliquedo`;
CREATE TABLE IF NOT EXISTS `agentimpliquedo` (
  `idDossierO` int(11) NOT NULL,
  `idAgent` int(11) NOT NULL,
  `RoleAgent` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idDossierO`,`idAgent`),
  KEY `ASSOCIATION_6_FK` (`idDossierO`),
  KEY `ASSOCIATION_6_FK2` (`idAgent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `agentimpliquedo`
--

INSERT INTO `agentimpliquedo` (`idDossierO`, `idAgent`, `RoleAgent`) VALUES
(4, 49, 'Responsable'),
(4, 60, 'Responsable');

-- --------------------------------------------------------

--
-- Structure de la table `annee`
--

DROP TABLE IF EXISTS `annee`;
CREATE TABLE IF NOT EXISTS `annee` (
  `idAnnee` int(11) NOT NULL AUTO_INCREMENT,
  `annee` int(11) DEFAULT NULL,
  `anneeActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAnnee`),
  UNIQUE KEY `AK_PK_ANNEE_ANNEE` (`idAnnee`),
  UNIQUE KEY `ANNEE_PK` (`idAnnee`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `annee`
--

INSERT INTO `annee` (`idAnnee`, `annee`, `anneeActive`) VALUES
(1, 2019, 0),
(2, 2020, 1),
(3, 2021, 0),
(4, 2022, 0),
(5, 2023, 0),
(6, 2024, 0),
(7, 2025, 0),
(8, 2026, 0),
(9, 2027, 0),
(10, 2028, 0),
(11, 2029, 0),
(12, 2030, 0),
(13, 2031, 0),
(14, 2032, 0),
(15, 2033, 0),
(16, 2034, 0),
(17, 2035, 0),
(18, 2036, 0),
(19, 2037, 0),
(20, 2038, 0),
(21, 2039, 0),
(22, 2040, 0),
(23, 2041, 0),
(24, 2042, 0),
(25, 2043, 0),
(26, 2044, 0),
(27, 2045, 0),
(28, 2046, 0);

-- --------------------------------------------------------

--
-- Structure de la table `avispm`
--

DROP TABLE IF EXISTS `avispm`;
CREATE TABLE IF NOT EXISTS `avispm` (
  `idAvisPM` int(11) NOT NULL AUTO_INCREMENT,
  `idDossierO` int(11) NOT NULL,
  `avisPM` text,
  `dateAvisPM` date DEFAULT NULL,
  `refCorrespondance` varchar(25) DEFAULT NULL,
  `dateCorrespondance` date DEFAULT NULL,
  PRIMARY KEY (`idAvisPM`),
  UNIQUE KEY `AVISPM_PK` (`idAvisPM`),
  KEY `ASSOCIATION_27_FK` (`idDossierO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `avispm`
--

INSERT INTO `avispm` (`idAvisPM`, `idDossierO`, `avisPM`, `dateAvisPM`, `refCorrespondance`, `dateCorrespondance`) VALUES
(1, 4, '  bon ok', '2020-08-03', 'pm/012', '2020-08-07');

-- --------------------------------------------------------

--
-- Structure de la table `compterenduinstance`
--

DROP TABLE IF EXISTS `compterenduinstance`;
CREATE TABLE IF NOT EXISTS `compterenduinstance` (
  `idCR` int(11) NOT NULL AUTO_INCREMENT,
  `idInstance` int(11) NOT NULL,
  `objetCR` text,
  `difficulte` text,
  `decision` text,
  `perspective` text,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  PRIMARY KEY (`idCR`),
  UNIQUE KEY `COMPTERENDUINSTANCE_PK` (`idCR`),
  KEY `fk_instance_cr_idInstance` (`idInstance`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compterenduinstance`
--

INSERT INTO `compterenduinstance` (`idCR`, `idInstance`, `objetCR`, `difficulte`, `decision`, `perspective`, `dateDebut`, `dateFin`) VALUES
(2, 2, 'activite', 'ras', 'rapport a fournir', 'bon', '2020-08-03', '2020-08-07');

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `idDepartement` int(11) NOT NULL AUTO_INCREMENT,
  `nomDepartement` varchar(100) DEFAULT NULL,
  `sigleDepartement` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idDepartement`),
  UNIQUE KEY `DEPARTEMENT_PK` (`idDepartement`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`idDepartement`, `nomDepartement`, `sigleDepartement`) VALUES
(1, '	CABINET	 ', '	CABINET	 '),
(2, '	SECRETARIAT GENERAL	 ', '	SG	 '),
(3, '	DEPARTEMENT DE LA GOUVERNANCE SOCIALE 	 ', '	DGS	 '),
(4, '	DEPARTEMENT DE LA GOUVERNANCE ECONOMIQUE ET FINANCIERE	 ', '	DGEF	 '),
(5, '	DEPARTEMENT DE LA GOUVERNANCE ADMINISTRATIVE ET LOCALE	 ', '	DGAL	 '),
(6, '	DEPARTEMENT DE LA GOUVERNANCE DU DEVELOPPENT RURAL	 ', '	DGDR	 '),
(7, '	DEPARTEMENT DE LA GOUVERNANCE POLITIQUE ET JURIDIQUE 	 ', '	DGPJ	 '),
(8, '	DEPARTEMENT DE LA GOUVERNANCE DES INFRASTRUCTURES ECONMIQUES 	 ', '	DGIE	 '),
(9, '	DIRECTION DE SUIVI ET DE L\'EVALUATION	 ', '	DSE	 '),
(10, '	DIRECTION DES RESSOURCES HUMAINES 	 ', '	DRH	 '),
(11, '	DIRECTION DE L\'ADMINISTRATION DES FINANCES 	 ', '	DAF	 '),
(12, '	DIRECTION DES SERVICES INFORMATIQUES	 ', '	DSI	 '),
(13, '	DIRECTION DES ARCHIVES ET DE LA DOCUMENTATION	 ', '	DAD	 '),
(14, '	DIRECTION DE LA COMMUNICATION ET DES RELATIONS PUBLIQUES	 ', '	DCRP	 '),
(15, 'Direction des Marchés Publics', 'DMP');

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

DROP TABLE IF EXISTS `domaine`;
CREATE TABLE IF NOT EXISTS `domaine` (
  `idDomaine` int(11) NOT NULL AUTO_INCREMENT,
  `idProgBudgetaire` int(11) DEFAULT NULL,
  `libelleDomaine` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idDomaine`),
  UNIQUE KEY `DOMAINE_PK` (`idDomaine`),
  KEY `ASSOCIATION_16_FK` (`idProgBudgetaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dossiercc`
--

DROP TABLE IF EXISTS `dossiercc`;
CREATE TABLE IF NOT EXISTS `dossiercc` (
  `idDossierCC` int(11) NOT NULL AUTO_INCREMENT,
  `idType` int(11) NOT NULL,
  `objetDossierCC` varchar(25) DEFAULT NULL,
  `refLettreConvocation` varchar(25) DEFAULT NULL,
  `refRapport` varchar(25) DEFAULT NULL,
  `dateCC` date DEFAULT NULL,
  `syntheseDossierCC` text,
  `orientationCC` text,
  `echeanceMiseOeuvre` varchar(25) DEFAULT NULL,
  `observationCC` text,
  PRIMARY KEY (`idDossierCC`),
  UNIQUE KEY `DOSSIERCC_PK` (`idDossierCC`),
  KEY `ASSOCIATION_1_FK` (`idType`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dossiercc`
--

INSERT INTO `dossiercc` (`idDossierCC`, `idType`, `objetDossierCC`, `refLettreConvocation`, `refRapport`, `dateCC`, `syntheseDossierCC`, `orientationCC`, `echeanceMiseOeuvre`, `observationCC`) VALUES
(1, 2, 'objet 2', 'PM/21/', 'pm/', '2020-08-06', 'good good', 'a faire avec attention', '3 mois', 'un peu mal');

-- --------------------------------------------------------

--
-- Structure de la table `dossierccstructure`
--

DROP TABLE IF EXISTS `dossierccstructure`;
CREATE TABLE IF NOT EXISTS `dossierccstructure` (
  `idDossierCC` int(11) NOT NULL,
  `idStructure` int(11) NOT NULL,
  `role` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dossiercm`
--

DROP TABLE IF EXISTS `dossiercm`;
CREATE TABLE IF NOT EXISTS `dossiercm` (
  `idDossierCM` int(11) NOT NULL AUTO_INCREMENT,
  `idType` int(11) NOT NULL,
  `idStructure` int(11) NOT NULL,
  `idAgent` int(11) NOT NULL,
  `numeroSGGCM` varchar(25) DEFAULT NULL,
  `objetDossierCM` varchar(25) DEFAULT NULL,
  `dateCM` date DEFAULT NULL,
  `refDossierCM` varchar(25) DEFAULT NULL,
  `dateSignature` date DEFAULT NULL,
  `syntheseDossierCM` text,
  `decisionCM` text,
  `observationCM` text,
  `refTexteAdopte` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idDossierCM`),
  UNIQUE KEY `DOSSIERCM_PK` (`idDossierCM`),
  KEY `ASSOCIATION_2_FK` (`idType`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dossiercm`
--

INSERT INTO `dossiercm` (`idDossierCM`, `idType`, `idStructure`, `idAgent`, `numeroSGGCM`, `objetDossierCM`, `dateCM`, `refDossierCM`, `dateSignature`, `syntheseDossierCM`, `decisionCM`, `observationCM`, `refTexteAdopte`) VALUES
(4, 3, 4, 92, '65', 'ljhgcgÃ©ee', '2020-08-03', '5948', '2020-08-08', 'jhgfgss', 'loibhgcss', 'mkjjbgss', '258');

-- --------------------------------------------------------

--
-- Structure de la table `dossierordinaire`
--

DROP TABLE IF EXISTS `dossierordinaire`;
CREATE TABLE IF NOT EXISTS `dossierordinaire` (
  `idDossierO` int(11) NOT NULL AUTO_INCREMENT,
  `idStructure` int(11) NOT NULL,
  `idStatut` int(11) NOT NULL,
  `objetDossierO` varchar(25) DEFAULT NULL,
  `refCorrespondance` varchar(25) DEFAULT NULL,
  `dateCorrespondance` date DEFAULT NULL,
  `syntheseDossierO` text,
  `observationDossierO` text,
  PRIMARY KEY (`idDossierO`),
  UNIQUE KEY `DOSSIERORDINAIRE_PK` (`idDossierO`),
  KEY `ASSOCIATION_14_FK` (`idStructure`),
  KEY `ASSOCIATION_26_FK` (`idStatut`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dossierordinaire`
--

INSERT INTO `dossierordinaire` (`idDossierO`, `idStructure`, `idStatut`, `objetDossierO`, `refCorrespondance`, `dateCorrespondance`, `syntheseDossierO`, `observationDossierO`) VALUES
(4, 3, 1, 'dossier', 'ref001', '2020-08-03', ' okok', ' okok');

-- --------------------------------------------------------

--
-- Structure de la table `dossierrapportactivite`
--

DROP TABLE IF EXISTS `dossierrapportactivite`;
CREATE TABLE IF NOT EXISTS `dossierrapportactivite` (
  `idDossierRA` int(11) NOT NULL AUTO_INCREMENT,
  `idAgent` int(11) NOT NULL,
  `idPTA` int(11) NOT NULL,
  `idStructure` int(11) NOT NULL,
  `objetDossierRA` varchar(25) DEFAULT NULL,
  `refCorrespondance` varchar(25) DEFAULT NULL,
  `dateCorrespondance` date DEFAULT NULL,
  `Trimestre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idDossierRA`),
  UNIQUE KEY `DOSSIERRAPPORTACTIVITE_PK` (`idDossierRA`),
  KEY `ASSOCIATION_23_FK` (`idPTA`),
  KEY `ASSOCIATION_24_FK` (`idAgent`),
  KEY `ASSOCIATION_25_FK` (`idStructure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fonction`
--

DROP TABLE IF EXISTS `fonction`;
CREATE TABLE IF NOT EXISTS `fonction` (
  `idfonction` int(11) NOT NULL AUTO_INCREMENT,
  `Fonction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idfonction`),
  UNIQUE KEY `FONCTION_PK` (`idfonction`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fonction`
--

INSERT INTO `fonction` (`idfonction`, `Fonction`) VALUES
(1, '	Premier Ministre	'),
(2, '	Directeur ((rice)) de cabinet	'),
(3, '	Conseiller ((ère)) spécial(e )	'),
(4, '	Secretaire général(e)'),
(5, '	Chef(fe) de département 	'),
(6, '	Directeur((rice))	'),
(7, '	Chargé((e))de mission	'),
(8, '	Attaché((e))de mission	'),
(9, '	Agent	');

-- --------------------------------------------------------

--
-- Structure de la table `indicateur`
--

DROP TABLE IF EXISTS `indicateur`;
CREATE TABLE IF NOT EXISTS `indicateur` (
  `IdIndicateur` int(11) NOT NULL AUTO_INCREMENT,
  `idProgBudgetaire` int(11) NOT NULL,
  `idAction` int(11) NOT NULL,
  `LibIndicateur` varchar(25) DEFAULT NULL,
  `ValeurRef` float DEFAULT NULL,
  `Cible` float DEFAULT NULL,
  `ValeurReel` float DEFAULT NULL,
  PRIMARY KEY (`IdIndicateur`),
  UNIQUE KEY `AK_PK_IDINDICATEUR_INDICATE` (`IdIndicateur`),
  UNIQUE KEY `INDICATEUR_PK` (`IdIndicateur`),
  KEY `ASSOCIATION_30_FK` (`idProgBudgetaire`),
  KEY `ACTIONINDICATEUR_FK` (`idAction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `instancerepresentation`
--

DROP TABLE IF EXISTS `instancerepresentation`;
CREATE TABLE IF NOT EXISTS `instancerepresentation` (
  `idInstance` int(11) NOT NULL AUTO_INCREMENT,
  `idStructure` int(11) NOT NULL,
  `libInstance` varchar(54) DEFAULT NULL,
  PRIMARY KEY (`idInstance`),
  UNIQUE KEY `INSTANCEREPRESENTATION_PK` (`idInstance`),
  KEY `ASSOCIATION_39_FK` (`idStructure`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `instancerepresentation`
--

INSERT INTO `instancerepresentation` (`idInstance`, `idStructure`, `libInstance`) VALUES
(1, 49, 'conseil d\'administration'),
(2, 55, 'Conseil d\'administration');

-- --------------------------------------------------------

--
-- Structure de la table `instruction`
--

DROP TABLE IF EXISTS `instruction`;
CREATE TABLE IF NOT EXISTS `instruction` (
  `idInstruction` int(11) NOT NULL AUTO_INCREMENT,
  `idDossierO` int(11) NOT NULL,
  `instruction` text,
  `dateInstruction` date DEFAULT NULL,
  `delaiReaction` date DEFAULT NULL,
  `refCorrespondance` varchar(25) DEFAULT NULL,
  `dateCorrespondance` date DEFAULT NULL,
  PRIMARY KEY (`idInstruction`),
  UNIQUE KEY `INSTRUCTION_PK` (`idInstruction`),
  KEY `ASSOCIATION_12_FK` (`idDossierO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `instruction`
--

INSERT INTO `instruction` (`idInstruction`, `idDossierO`, `instruction`, `dateInstruction`, `delaiReaction`, `refCorrespondance`, `dateCorrespondance`) VALUES
(3, 4, '  a suivre avec attention', '2020-08-03', '2020-08-15', 'refff', '2020-08-09'),
(4, 4, ' alright', '2020-08-03', '2020-08-10', 'freeee', '2020-08-09');

-- --------------------------------------------------------

--
-- Structure de la table `intanceagent`
--

DROP TABLE IF EXISTS `intanceagent`;
CREATE TABLE IF NOT EXISTS `intanceagent` (
  `idInstance` int(11) NOT NULL,
  `idAgent` int(11) NOT NULL,
  PRIMARY KEY (`idInstance`,`idAgent`),
  KEY `INTANCEAGENT_FK` (`idInstance`),
  KEY `INTANCEAGENT_FK2` (`idAgent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `lettremission`
--

DROP TABLE IF EXISTS `lettremission`;
CREATE TABLE IF NOT EXISTS `lettremission` (
  `idLM` int(11) NOT NULL AUTO_INCREMENT,
  `idAnnee` int(11) NOT NULL,
  `idResponsable` int(11) NOT NULL,
  `referenceLM` varchar(25) DEFAULT NULL,
  `dateLM` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idLM`),
  UNIQUE KEY `AK_IDLM_LETTREMI` (`idLM`),
  UNIQUE KEY `LETTREMISSION_PK` (`idLM`),
  KEY `ASSOCIATION_20_FK` (`idResponsable`),
  KEY `ASSOCIATION_21_FK` (`idAnnee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `performanceppd`
--

DROP TABLE IF EXISTS `performanceppd`;
CREATE TABLE IF NOT EXISTS `performanceppd` (
  `IdPerformancePPD` int(11) NOT NULL AUTO_INCREMENT,
  `idStructure` int(11) NOT NULL,
  `idAnnee` int(11) NOT NULL,
  `Efficacite` float DEFAULT NULL,
  `Gouvernance` float DEFAULT NULL,
  `Performance` float DEFAULT NULL,
  `Appreciation` text,
  PRIMARY KEY (`IdPerformancePPD`),
  UNIQUE KEY `PERFORMANCEPPD_PK` (`IdPerformancePPD`),
  KEY `ASSOCIATION_35_FK` (`idAnnee`),
  KEY `ASSOCIATION_36_FK` (`idStructure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `performancestructure`
--

DROP TABLE IF EXISTS `performancestructure`;
CREATE TABLE IF NOT EXISTS `performancestructure` (
  `idRapport` int(11) NOT NULL AUTO_INCREMENT,
  `idAnnee` int(11) NOT NULL,
  `libRapport` varchar(25) DEFAULT NULL,
  `refCorrespondance` varchar(25) DEFAULT NULL,
  `dateCorrespondance` timestamp NULL DEFAULT NULL,
  `tauxExecPhysique` decimal(10,0) DEFAULT NULL,
  `tauxExecFinanciaire` decimal(10,0) DEFAULT NULL,
  `efficacite` decimal(10,0) DEFAULT NULL,
  `efficience` decimal(10,0) DEFAULT NULL,
  `gouvernance` decimal(10,0) DEFAULT NULL,
  `performance` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idRapport`),
  UNIQUE KEY `PERFORMANCESTRUCTURE_PK` (`idRapport`),
  KEY `ASSOCIATION_34_FK` (`idAnnee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `prioritelm`
--

DROP TABLE IF EXISTS `prioritelm`;
CREATE TABLE IF NOT EXISTS `prioritelm` (
  `idPriorite` int(11) NOT NULL AUTO_INCREMENT,
  `idLM` int(11) NOT NULL,
  `libellePriorite` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idPriorite`),
  UNIQUE KEY `AK_IDPRIORITE_PRIORITE` (`idPriorite`),
  UNIQUE KEY `PRIORITELM_PK` (`idPriorite`),
  KEY `ASSOCIATION_19_FK` (`idLM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `idProfile` int(11) NOT NULL AUTO_INCREMENT,
  `libelleProfile` varchar(20) NOT NULL,
  PRIMARY KEY (`idProfile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `profilerole`
--

DROP TABLE IF EXISTS `profilerole`;
CREATE TABLE IF NOT EXISTS `profilerole` (
  `idProfile` int(11) NOT NULL,
  `idRole` int(11) NOT NULL,
  PRIMARY KEY (`idProfile`,`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `programmebudgetaire`
--

DROP TABLE IF EXISTS `programmebudgetaire`;
CREATE TABLE IF NOT EXISTS `programmebudgetaire` (
  `idProgBudgetaire` int(11) NOT NULL AUTO_INCREMENT,
  `idPTA` int(11) NOT NULL,
  `libProgBudgetaire` varchar(25) DEFAULT NULL,
  `ObjectifStrategique` text,
  `Cout` float DEFAULT NULL,
  PRIMARY KEY (`idProgBudgetaire`),
  UNIQUE KEY `AK_IDPROGBUDGETAIRE_PROGRAMM` (`idProgBudgetaire`),
  UNIQUE KEY `PROGRAMMEBUDGETAIRE_PK` (`idProgBudgetaire`),
  KEY `ASSOCIATION_28_FK` (`idPTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pta`
--

DROP TABLE IF EXISTS `pta`;
CREATE TABLE IF NOT EXISTS `pta` (
  `idPTA` int(11) NOT NULL AUTO_INCREMENT,
  `idAnnee` int(11) NOT NULL,
  `libPTA` varchar(25) DEFAULT NULL,
  `dateTransmission` timestamp NULL DEFAULT NULL,
  `refCorrespondance` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idPTA`),
  UNIQUE KEY `PTA_PK` (`idPTA`),
  KEY `fk_pta_annee` (`idAnnee`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pta`
--

INSERT INTO `pta` (`idPTA`, `idAnnee`, `libPTA`, `dateTransmission`, `refCorrespondance`) VALUES
(1, 2, 'PTA_Jeunesse_2020', '2020-07-27 00:00:00', 'ref5862');

-- --------------------------------------------------------

--
-- Structure de la table `reaction`
--

DROP TABLE IF EXISTS `reaction`;
CREATE TABLE IF NOT EXISTS `reaction` (
  `idReaction` int(11) NOT NULL AUTO_INCREMENT,
  `idInstruction` int(11) NOT NULL,
  `suiteDonnee` text,
  `observation` text,
  `refCorrespondance` varchar(25) DEFAULT NULL,
  `dateCorrespondance` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idReaction`),
  UNIQUE KEY `REACTION_PK` (`idReaction`),
  KEY `ASSOCIATION_15_FK` (`idInstruction`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reaction`
--

INSERT INTO `reaction` (`idReaction`, `idInstruction`, `suiteDonnee`, `observation`, `refCorrespondance`, `dateCorrespondance`) VALUES
(2, 3, ' ok', ' ok', 'refff01', '2020-08-03 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `responsablestre`
--

DROP TABLE IF EXISTS `responsablestre`;
CREATE TABLE IF NOT EXISTS `responsablestre` (
  `idResponsable` int(11) NOT NULL AUTO_INCREMENT,
  `idStructure` int(11) DEFAULT NULL,
  `nomResponable` varchar(25) DEFAULT NULL,
  `prenomResponsable` varchar(54) DEFAULT NULL,
  `actif` int(10) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`idResponsable`),
  UNIQUE KEY `RESPONSABLESTRE_PK` (`idResponsable`),
  KEY `ASSOCIATION_18_FK` (`idStructure`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `responsablestre`
--

INSERT INTO `responsablestre` (`idResponsable`, `idStructure`, `nomResponable`, `prenomResponsable`, `actif`) VALUES
(1, 1, '	Sy	 ', '	Moumina Chériff	 ', 1),
(2, 2, '	Sawadogo	 ', '	Siméon	 ', 1),
(3, 3, '	Azoupiou	 ', '	Daouda	 ', 1),
(4, 4, '	Sango	 ', '	Abdoul Karim	 ', 1),
(5, 5, '	Bassière	 ', '	 Batio	 ', 1),
(6, 6, '	Ouattara/Ouattara	 ', '	 Maminata	 ', 1),
(7, 7, '	Bonanet	 ', '	  Maurice Dieudonné	 ', 1),
(8, 8, '	Tiemtoré	 ', '	 Salifo	 ', 1),
(9, 9, '	Koutou	 ', '	 Sommanogo	 ', 1),
(10, 10, '	Kaboré	 ', '	 Harouna	 ', 1),
(11, 11, '	Ilboudo/Marchal	 ', '	Helène Marie Laurence 	 ', 1),
(12, 12, '	Dabilgou	 ', '	Timbindi Vincent	 ', 1),
(13, 13, '	Idani	 ', '	Oumarou	 ', 1),
(14, 14, '	Ouedraogo	 ', '	Bachir Ismaël 	 ', 1),
(15, 15, '	Bougouma	 ', '	Wendenmanegha Eric	 ', 1),
(16, 16, '	Ouédraogo	 ', '	Niouga Ambroise	 ', 1),
(17, 17, '	Ouédraogo	 ', '	Salif	 ', 1),
(18, 18, '	Dandjinou	 ', '	 Remis Fulgance	 ', 1),
(19, 19, '	Ouattara/Sanon	 ', '	Hadja  Fatimata	 ', 1),
(20, 20, '	Ouédraogo	 ', '	Séni Mahamoudou	 ', 1),
(21, 21, '	Maïga	 ', '	Alkassoum	 ', 1),
(22, 22, '	Kaboré	 ', '	 Lassané	 ', 1),
(23, 23, '	Lougue/Sorgho	 ', '	 Léonie Claudine 	 ', 1),
(24, 24, '	Ouaro	 ', '	 Stanislas	 ', 1),
(25, 25, '	Tiendrebéogo	 ', '	 Paul  Robert	 ', 1),
(26, 26, '	Bagoro	 ', '	Bessolé Réné	 ', 1),
(27, 27, '	Compaoré	 ', '	 Ousséni	 ', 1),
(28, 28, '	Barry	 ', '	 Alpha	 ', 1);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `idRole` int(11) NOT NULL AUTO_INCREMENT,
  `libelleRole` varchar(50) NOT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statutdossier`
--

DROP TABLE IF EXISTS `statutdossier`;
CREATE TABLE IF NOT EXISTS `statutdossier` (
  `idStatut` int(11) NOT NULL AUTO_INCREMENT,
  `libStatut` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idStatut`),
  UNIQUE KEY `STATUTDOSSIER_PK` (`idStatut`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statutdossier`
--

INSERT INTO `statutdossier` (`idStatut`, `libStatut`) VALUES
(1, 'En instance'),
(2, 'Pour suivi'),
(3, 'clos');

-- --------------------------------------------------------

--
-- Structure de la table `structure`
--

DROP TABLE IF EXISTS `structure`;
CREATE TABLE IF NOT EXISTS `structure` (
  `idStructure` int(11) NOT NULL AUTO_INCREMENT,
  `Str_idStructure` int(11) DEFAULT NULL,
  `idTypeStr` int(11) NOT NULL,
  `nomStructure` varchar(100) DEFAULT NULL,
  `sigleStructure` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idStructure`),
  UNIQUE KEY `STRUCTURE_PK` (`idStructure`),
  KEY `ASSOCIATION_17_FK` (`idTypeStr`),
  KEY `ASSOCIATION_38_FK` (`Str_idStructure`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `structure`
--

INSERT INTO `structure` (`idStructure`, `Str_idStructure`, `idTypeStr`, `nomStructure`, `sigleStructure`) VALUES
(1, 1, 1, '	Ministère de la Défense Nationale et des Anciens Combattants 	 ', '	MDNAC	 '),
(2, 2, 1, '	Ministère de l\'Administration Territoriale, de la Décentralisation et de la Cohésion sociale	 ', '	MATDC	 '),
(3, 3, 1, '	Ministère des Sports et des Loisirs	 ', '	MSL	 '),
(4, 4, 1, '	Ministère de la Culture, des Arts et du Tourisme	 ', '	MCAT	 '),
(5, 5, 1, '	Ministère de l’Environnement, de l’Économie verte et du Changement Climatique 	 ', '	MEEVCC	 '),
(6, 6, 1, '	Ministère des Droits Humains et de la Promotion Civique 	 ', '	MDHPC	 '),
(7, 7, 1, '	Ministère de l’Urbanisme et de l’Habitat 	 ', '	MUH	 '),
(8, 8, 1, '	Ministère de la Jeunesse et de la Promotion de l’Entrepreunariat des Jeunes 	 ', '	MJPEJ	 '),
(9, 9, 1, '	Ministère des Ressources Animales et Halieutiques 	 ', '	MRAH	 '),
(10, 10, 1, '	Ministère du Commerce, de l’Industrie et de l’Artisanat 	 ', '	MCIA	 '),
(11, 11, 1, '	Ministère de la Femme, de la Solidarité Nationale, de la Famille et de l’Action Humanitaire 	 ', '	MFSNFAH	 '),
(12, 12, 1, '	Ministère des Transports, de la Mobilité Urbaine et de la Sécurité Routière 	 ', '	MTMUSR	 '),
(13, 13, 1, '	Ministère des Mines et des Carrières 	 ', '	MMC	 '),
(14, 14, 1, '	Ministère de l’Énergie 	 ', '	ME	 '),
(15, 15, 1, '	Ministère des Infrastructures 	 ', '	MI	 '),
(16, 16, 1, '	Ministère de l’Eau et de l’Assainissement 	 ', '	MEA	 '),
(17, 17, 1, '	Ministère de l’Agriculture et des Aménagements Hydro-agricoles 	 ', '	MAAH	 '),
(18, 18, 1, '	Ministère de la Communication et des Relations avec le Parlement 	 ', '	MCRP	 '),
(19, 19, 1, '	Ministère du Développement de l’Economie Numérique et des Postes 	 ', '	MDENP	 '),
(20, 20, 1, '	Ministère de la Fonction Publique, du Travail et de la Protection Sociale 	 ', '	MFPTPS	 '),
(21, 21, 1, '	Ministère de l’Enseignement Supérieur, de la Recherce Scientifique et de l’Innovation 	 ', '	MESRSI	 '),
(22, 22, 1, '	Ministère de l’Économie, des Finances et du Développement 	 ', '	MINEFID	 '),
(23, 23, 1, '	Ministère de la Santé 	 ', '	MS	 '),
(24, 24, 1, '	Ministère de l’Éducation Nationale, de l’Alphabétisation et de la Promotion des Langues Nationales ', '	MENA-PLN	 '),
(25, 25, 1, '	Ministère de l’Intégration Africaine et des Burkinabè de l’Extérieur 	 ', '	MIABE	 '),
(26, 26, 1, '	Ministère de la Justice, Garde des Sceaux 	 ', '	MJ	 '),
(27, 27, 1, '	Ministère de la Sécurité 	 ', '	MSECU	 '),
(28, 28, 1, '	Ministère des Affaires Etrangères et de la Coopération 	 ', '	MAEC	 '),
(29, 29, 2, '	PRESIDENCE DU FASO	 ', '	PF	 '),
(30, 30, 2, '	PRIMATURE	 ', '	PRIMATURE	 '),
(31, 31, 1, '	SECRETARIAT GENERAL DU GOUVERNEMENT ET DU CONSEIL DES MINISTRES	 ', '	SGG-CM	 '),
(32, 32, 2, '	ASSEMBLEE NATIONALE	 ', '	AN	 '),
(33, 33, 2, '	AUTORITE SUPERIEURE DU CONTROLE D’ETAT-LUTTE CONTRE LA CORRUPTION	 ', '	ASCE-LC	 '),
(34, 34, 2, '	COMMISSION NATIONALE ELECTORALE INDEPENDANTE 	 ', '	CENI	 '),
(35, 35, 2, '	CONSEIL ECONOMIQUE ET SOCIAL 	 ', '	CES	 '),
(36, 36, 2, '	COUR DES COMPTES	 ', '	CC	 '),
(37, 37, 2, '	CONSEIL D\'ETAT	 ', '	CE	 '),
(38, 38, 2, '	CONSEIL CONSTITUTIONNEL	 ', '	CC	 '),
(39, 39, 2, '	COUR DE CASSATION	 ', '	CCASS	 '),
(40, 40, 2, '	COMMISSION DE L\'INFORMATIQUE ET DES LIBERTES	 ', '	CIL	 '),
(41, 41, 2, '	GRANDE CHANCELLERIE	 ', '	GCOB	 '),
(42, 42, 2, '	CONSEIL SUPERIEURE DE LA COMMUNICATION	 ', '	CSC	 '),
(43, 43, 2, '	HAUTE COURS DE JUSTICE	 ', '	HCJ	 '),
(44, 44, 2, '	MEDIATEUR DU FASO	 ', '	MF	 '),
(45, 45, 2, '	HAUT CONSEIL DU DIALOGUE SOCIAL	 ', '	HCDS	 '),
(46, 46, 2, '	HAUT CONSEIL POUR LA RECONCILIATION ET L\'UNITE NATIONALE 	 ', '	HCRUN	 '),
(47, 47, 3, '	SERVICE D\'INFORMATION DU GOUVERNEMENT	 ', '	SIG	 '),
(48, 48, 3, '	AUTORITE DE REGULATION DES COMMUNICATIONS ELECTRONIQUES ET DES POSTES	 ', '	ARCEP	 '),
(49, 49, 3, '	AUTORITE DE REGULATION DE LA COMMANDE PUBLIQUE	 ', '	ARCOP	 '),
(50, 50, 3, '	AUTORITE DE REGULATION DU SECTEUR DE L\'ENERGIE	 ', '	ARSE	 '),
(51, 51, 3, '	HAUTE AUTORITE DE CONTROLE DES IMPORTATIONS D\'ARMES ET DE LEUR UTILISATION	 ', '	HACIAU	 '),
(52, 52, 3, '	COMMISSION NATIONALE DE LUTTE CONTRE LA PROLIFERATION DES ARMES LEGERES 	 ', '	CNLPAL	 '),
(53, 53, 3, '	SERVICE NATIONAL POUR LE DEVELOPPEMENT	 ', '	SND	 '),
(54, 54, 3, '	SECRETATIAT PERMANENT DU CONSEIL NATIONAL DE PROTECTION SOCIAL	 ', '	SP/CNPS	 '),
(55, 55, 3, '	AGENCE NATIONALE DE SECURITE DES SYSTEMES D\'INFORMATION 	 ', '	ANSSI	 '),
(56, 56, 4, '	SECRETARIAT PERMANENT DUPLAN NATIONAL DE DEVELOPPEMENT ECONOMIQUE ET SOCIAL	 ', '	SP/PNDES	 '),
(57, 57, 4, '	MAITRISE D\'OUVRAGE DE L\'AEROPORT DE DONSIN	 ', '	MOAD	 '),
(58, 58, 4, '	SOCIETE DE DEVELOPPEMENT INTEGRE DU POLE DE BAGRE 	 ', '	BAGRE POLE	 '),
(59, 59, 4, '	CENTRE NATIONAL POUR LA COORDINATION DU MECANISME D\'ALERTE PRECOCE ET DE REPONSE 	 ', '	CN-CMAPR	 '),
(60, 60, 4, '	SECRETARIAT DU FONDS VERT POUR LE CLIMAT 	 ', '	SE-FVC	 '),
(61, 61, 4, '	FONDS NATIONAL DE LA FINANCE INCLUSIVE 	 ', '	FONAFI	 '),
(62, 62, 4, '	UNITE DE COORDINATION DE LA FORMULATION DU SECOND COMPACT DU BURKINA FASO	 ', '	UCF-BURKINA	 '),
(63, 63, 4, '	PROGRAMME D\'AUTONOMISATION ECONOMIQUE DES JEUNES ET DES FEMMES	 ', '	PAE/JF	 ');

-- --------------------------------------------------------

--
-- Structure de la table `typedossierconseil`
--

DROP TABLE IF EXISTS `typedossierconseil`;
CREATE TABLE IF NOT EXISTS `typedossierconseil` (
  `idType` int(11) NOT NULL AUTO_INCREMENT,
  `libType` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idType`),
  UNIQUE KEY `NATUREDOSSIERCONSEIL_PK` (`idType`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typedossierconseil`
--

INSERT INTO `typedossierconseil` (`idType`, `libType`) VALUES
(1, '	Communication  orale 	 '),
(2, '	Projet Décret	 '),
(3, '	Projet de loi	 '),
(4, '	Marché	 '),
(5, '	Rapport	 ');

-- --------------------------------------------------------

--
-- Structure de la table `typestructure`
--

DROP TABLE IF EXISTS `typestructure`;
CREATE TABLE IF NOT EXISTS `typestructure` (
  `idTypeStr` int(11) NOT NULL AUTO_INCREMENT,
  `libelleTypeStr` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTypeStr`),
  UNIQUE KEY `TYPESTRUCTURE_PK` (`idTypeStr`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typestructure`
--

INSERT INTO `typestructure` (`idTypeStr`, `libelleTypeStr`) VALUES
(1, '	Ministère	 '),
(2, '	Institution	 '),
(3, '	Structure rattachée	 '),
(4, '	Structure de mission	 ');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `idAgent` int(11) NOT NULL,
  `login` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`),
  UNIQUE KEY `UTILISATEUR_PK` (`idUtilisateur`),
  KEY `fk_user_agent` (`idAgent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `idAgent`, `login`, `password`) VALUES
(1, 93, 'steph', 'lenapor');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_agent`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_agent`;
CREATE TABLE IF NOT EXISTS `v_agent` (
`idAgent` int(11)
,`idDepartement` int(11)
,`Idfonction` int(11)
,`matriculeAgent` varchar(25)
,`nomAgent` varchar(25)
,`prenomAgent` varchar(54)
,`telAgent` varchar(30)
,`emailAgent` varchar(25)
,`Sexe` char(10)
,`nomDepartement` varchar(100)
,`sigleDepartement` varchar(25)
,`Fonction` varchar(100)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_agentimpliquedo`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_agentimpliquedo`;
CREATE TABLE IF NOT EXISTS `v_agentimpliquedo` (
`idAgent` int(11)
,`idDepartement` int(11)
,`Idfonction` int(11)
,`matriculeAgent` varchar(25)
,`nomAgent` varchar(25)
,`prenomAgent` varchar(54)
,`telAgent` varchar(30)
,`emailAgent` varchar(25)
,`Sexe` char(10)
,`nomDepartement` varchar(100)
,`sigleDepartement` varchar(25)
,`Fonction` varchar(100)
,`idDossierO` int(11)
,`idStructure` int(11)
,`idStatut` int(11)
,`objetDossierO` varchar(25)
,`refCorrespondance` varchar(25)
,`dateCorrespondance` date
,`syntheseDossierO` text
,`observationDossierO` text
,`sigleStructure` varchar(25)
,`nomStructure` varchar(100)
,`libStatut` varchar(25)
,`RoleAgent` varchar(25)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_avis`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_avis`;
CREATE TABLE IF NOT EXISTS `v_avis` (
`idDossierO` int(11)
,`idStructure` int(11)
,`idStatut` int(11)
,`objetDossierO` varchar(25)
,`refCorrespondance` varchar(25)
,`dateCorrespondance` date
,`syntheseDossierO` text
,`observationDossierO` text
,`sigleStructure` varchar(25)
,`nomStructure` varchar(100)
,`libStatut` varchar(25)
,`idAvisPM` int(11)
,`avisPM` text
,`dateAvisPM` date
,`refCorrespAvis` varchar(25)
,`dateCorrespAvis` date
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_dossiercc`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_dossiercc`;
CREATE TABLE IF NOT EXISTS `v_dossiercc` (
`idDossierCC` int(11)
,`objetDossierCC` varchar(25)
,`refLettreConvocation` varchar(25)
,`refRapport` varchar(25)
,`dateCC` date
,`syntheseDossierCC` text
,`orientationCC` text
,`echeanceMiseOeuvre` varchar(25)
,`observationCC` text
,`idType` int(11)
,`libType` varchar(25)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_dossiercm`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_dossiercm`;
CREATE TABLE IF NOT EXISTS `v_dossiercm` (
`idDossierCM` int(11)
,`numeroSGGCM` varchar(25)
,`objetDossierCM` varchar(25)
,`dateCM` date
,`refDossierCM` varchar(25)
,`dateSignature` date
,`syntheseDossierCM` text
,`decisionCM` text
,`observationCM` text
,`refTexteAdopte` varchar(25)
,`idType` int(11)
,`libType` varchar(25)
,`idStructure` int(11)
,`Str_idStructure` int(11)
,`idTypeStr` int(11)
,`nomStructure` varchar(100)
,`sigleStructure` varchar(25)
,`idAgent` int(11)
,`idDepartement` int(11)
,`idfonction` int(11)
,`matriculeAgent` varchar(25)
,`nomAgent` varchar(25)
,`prenomAgent` varchar(54)
,`telAgent` varchar(30)
,`emailAgent` varchar(25)
,`sexe` char(10)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_dossierordinaire`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_dossierordinaire`;
CREATE TABLE IF NOT EXISTS `v_dossierordinaire` (
`idDossierO` int(11)
,`idStructure` int(11)
,`idStatut` int(11)
,`objetDossierO` varchar(25)
,`refCorrespondance` varchar(25)
,`dateCorrespondance` date
,`syntheseDossierO` text
,`observationDossierO` text
,`sigleStructure` varchar(25)
,`nomStructure` varchar(100)
,`libStatut` varchar(25)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_instance_cr_structure`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_instance_cr_structure`;
CREATE TABLE IF NOT EXISTS `v_instance_cr_structure` (
`idCR` int(11)
,`idInstance` int(11)
,`objetCR` text
,`difficulte` text
,`decision` text
,`perspective` text
,`dateDebut` date
,`dateFin` date
,`idStructure` int(11)
,`libInstance` varchar(54)
,`Str_idStructure` int(11)
,`idTypeStr` int(11)
,`nomStructure` varchar(100)
,`sigleStructure` varchar(25)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_instance_structure`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_instance_structure`;
CREATE TABLE IF NOT EXISTS `v_instance_structure` (
`idInstance` int(11)
,`idStructure` int(11)
,`libInstance` varchar(54)
,`Str_idStructure` int(11)
,`idTypeStr` int(11)
,`nomStructure` varchar(100)
,`sigleStructure` varchar(25)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_instruction`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_instruction`;
CREATE TABLE IF NOT EXISTS `v_instruction` (
`idDossierO` int(11)
,`idStructure` int(11)
,`idStatut` int(11)
,`objetDossierO` varchar(25)
,`refCorrespondance` varchar(25)
,`dateCorrespondance` date
,`syntheseDossierO` text
,`observationDossierO` text
,`sigleStructure` varchar(25)
,`nomStructure` varchar(100)
,`libStatut` varchar(25)
,`idInstruction` int(11)
,`instruction` text
,`dateInstruction` date
,`delaiReaction` date
,`refInstruction` varchar(25)
,`dateCorespInstruction` date
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_pta`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_pta`;
CREATE TABLE IF NOT EXISTS `v_pta` (
`idPTA` int(11)
,`libPTA` varchar(25)
,`dateTransmission` timestamp
,`refCorrespondance` varchar(25)
,`idAnnee` int(11)
,`annee` int(11)
,`anneeActive` int(11)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_reaction`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_reaction`;
CREATE TABLE IF NOT EXISTS `v_reaction` (
`idDossierO` int(11)
,`idStructure` int(11)
,`idStatut` int(11)
,`objetDossierO` varchar(25)
,`refCorrespondance` varchar(25)
,`dateCorrespondance` date
,`syntheseDossierO` text
,`observationDossierO` text
,`sigleStructure` varchar(25)
,`nomStructure` varchar(100)
,`libStatut` varchar(25)
,`idInstruction` int(11)
,`instruction` text
,`dateInstruction` date
,`delaiReaction` date
,`refInstruction` varchar(25)
,`dateCorespInstruction` date
,`idReaction` int(11)
,`suiteDonnee` text
,`observation` text
,`refCorrepReaction` varchar(25)
,`dateCorrespReaction` timestamp
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_structure`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `v_structure`;
CREATE TABLE IF NOT EXISTS `v_structure` (
`idStructure` int(11)
,`Str_idStructure` int(11)
,`idTypeStr` int(11)
,`nomStructure` varchar(100)
,`sigleStructure` varchar(25)
,`libelleTypeStr` varchar(25)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_agent`
--
DROP TABLE IF EXISTS `v_agent`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_agent`  AS  select `ag`.`idAgent` AS `idAgent`,`ag`.`idDepartement` AS `idDepartement`,`ag`.`idfonction` AS `Idfonction`,`ag`.`matriculeAgent` AS `matriculeAgent`,`ag`.`nomAgent` AS `nomAgent`,`ag`.`prenomAgent` AS `prenomAgent`,`ag`.`telAgent` AS `telAgent`,`ag`.`emailAgent` AS `emailAgent`,`ag`.`sexe` AS `Sexe`,`dep`.`nomDepartement` AS `nomDepartement`,`dep`.`sigleDepartement` AS `sigleDepartement`,`fonc`.`Fonction` AS `Fonction` from ((`agent` `ag` left join `departement` `dep` on((`dep`.`idDepartement` = `ag`.`idDepartement`))) left join `fonction` `fonc` on((`fonc`.`idfonction` = `ag`.`idfonction`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_agentimpliquedo`
--
DROP TABLE IF EXISTS `v_agentimpliquedo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_agentimpliquedo`  AS  select `ag`.`idAgent` AS `idAgent`,`ag`.`idDepartement` AS `idDepartement`,`ag`.`Idfonction` AS `Idfonction`,`ag`.`matriculeAgent` AS `matriculeAgent`,`ag`.`nomAgent` AS `nomAgent`,`ag`.`prenomAgent` AS `prenomAgent`,`ag`.`telAgent` AS `telAgent`,`ag`.`emailAgent` AS `emailAgent`,`ag`.`Sexe` AS `Sexe`,`ag`.`nomDepartement` AS `nomDepartement`,`ag`.`sigleDepartement` AS `sigleDepartement`,`ag`.`Fonction` AS `Fonction`,`dos`.`idDossierO` AS `idDossierO`,`dos`.`idStructure` AS `idStructure`,`dos`.`idStatut` AS `idStatut`,`dos`.`objetDossierO` AS `objetDossierO`,`dos`.`refCorrespondance` AS `refCorrespondance`,`dos`.`dateCorrespondance` AS `dateCorrespondance`,`dos`.`syntheseDossierO` AS `syntheseDossierO`,`dos`.`observationDossierO` AS `observationDossierO`,`dos`.`sigleStructure` AS `sigleStructure`,`dos`.`nomStructure` AS `nomStructure`,`dos`.`libStatut` AS `libStatut`,`ai`.`RoleAgent` AS `RoleAgent` from ((`agentimpliquedo` `ai` left join `v_agent` `ag` on((`ag`.`idAgent` = `ai`.`idAgent`))) left join `v_dossierordinaire` `dos` on((`dos`.`idDossierO` = `ai`.`idDossierO`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_avis`
--
DROP TABLE IF EXISTS `v_avis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_avis`  AS  select `dos`.`idDossierO` AS `idDossierO`,`dos`.`idStructure` AS `idStructure`,`dos`.`idStatut` AS `idStatut`,`dos`.`objetDossierO` AS `objetDossierO`,`dos`.`refCorrespondance` AS `refCorrespondance`,`dos`.`dateCorrespondance` AS `dateCorrespondance`,`dos`.`syntheseDossierO` AS `syntheseDossierO`,`dos`.`observationDossierO` AS `observationDossierO`,`dos`.`sigleStructure` AS `sigleStructure`,`dos`.`nomStructure` AS `nomStructure`,`dos`.`libStatut` AS `libStatut`,`av`.`idAvisPM` AS `idAvisPM`,`av`.`avisPM` AS `avisPM`,`av`.`dateAvisPM` AS `dateAvisPM`,`av`.`refCorrespondance` AS `refCorrespAvis`,`av`.`dateCorrespondance` AS `dateCorrespAvis` from (`avispm` `av` left join `v_dossierordinaire` `dos` on((`dos`.`idDossierO` = `av`.`idDossierO`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_dossiercc`
--
DROP TABLE IF EXISTS `v_dossiercc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dossiercc`  AS  select `dcc`.`idDossierCC` AS `idDossierCC`,`dcc`.`objetDossierCC` AS `objetDossierCC`,`dcc`.`refLettreConvocation` AS `refLettreConvocation`,`dcc`.`refRapport` AS `refRapport`,`dcc`.`dateCC` AS `dateCC`,`dcc`.`syntheseDossierCC` AS `syntheseDossierCC`,`dcc`.`orientationCC` AS `orientationCC`,`dcc`.`echeanceMiseOeuvre` AS `echeanceMiseOeuvre`,`dcc`.`observationCC` AS `observationCC`,`tdc`.`idType` AS `idType`,`tdc`.`libType` AS `libType` from (`dossiercc` `dcc` left join `typedossierconseil` `tdc` on((`dcc`.`idType` = `tdc`.`idType`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_dossiercm`
--
DROP TABLE IF EXISTS `v_dossiercm`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dossiercm`  AS  select `dcm`.`idDossierCM` AS `idDossierCM`,`dcm`.`numeroSGGCM` AS `numeroSGGCM`,`dcm`.`objetDossierCM` AS `objetDossierCM`,`dcm`.`dateCM` AS `dateCM`,`dcm`.`refDossierCM` AS `refDossierCM`,`dcm`.`dateSignature` AS `dateSignature`,`dcm`.`syntheseDossierCM` AS `syntheseDossierCM`,`dcm`.`decisionCM` AS `decisionCM`,`dcm`.`observationCM` AS `observationCM`,`dcm`.`refTexteAdopte` AS `refTexteAdopte`,`tdc`.`idType` AS `idType`,`tdc`.`libType` AS `libType`,`str`.`idStructure` AS `idStructure`,`str`.`Str_idStructure` AS `Str_idStructure`,`str`.`idTypeStr` AS `idTypeStr`,`str`.`nomStructure` AS `nomStructure`,`str`.`sigleStructure` AS `sigleStructure`,`ag`.`idAgent` AS `idAgent`,`ag`.`idDepartement` AS `idDepartement`,`ag`.`idfonction` AS `idfonction`,`ag`.`matriculeAgent` AS `matriculeAgent`,`ag`.`nomAgent` AS `nomAgent`,`ag`.`prenomAgent` AS `prenomAgent`,`ag`.`telAgent` AS `telAgent`,`ag`.`emailAgent` AS `emailAgent`,`ag`.`sexe` AS `sexe` from (((`dossiercm` `dcm` left join `typedossierconseil` `tdc` on((`dcm`.`idType` = `tdc`.`idType`))) left join `structure` `str` on((`dcm`.`idStructure` = `str`.`idStructure`))) left join `agent` `ag` on((`dcm`.`idAgent` = `ag`.`idAgent`))) order by `dcm`.`idDossierCM` desc ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_dossierordinaire`
--
DROP TABLE IF EXISTS `v_dossierordinaire`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dossierordinaire`  AS  select `do`.`idDossierO` AS `idDossierO`,`do`.`idStructure` AS `idStructure`,`do`.`idStatut` AS `idStatut`,`do`.`objetDossierO` AS `objetDossierO`,`do`.`refCorrespondance` AS `refCorrespondance`,`do`.`dateCorrespondance` AS `dateCorrespondance`,`do`.`syntheseDossierO` AS `syntheseDossierO`,`do`.`observationDossierO` AS `observationDossierO`,`str`.`sigleStructure` AS `sigleStructure`,`str`.`nomStructure` AS `nomStructure`,`st`.`libStatut` AS `libStatut` from ((`dossierordinaire` `do` left join `v_structure` `str` on((`do`.`idStructure` = `str`.`idStructure`))) left join `statutdossier` `st` on((`do`.`idStatut` = `st`.`idStatut`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_instance_cr_structure`
--
DROP TABLE IF EXISTS `v_instance_cr_structure`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_instance_cr_structure`  AS  select `cr`.`idCR` AS `idCR`,`cr`.`idInstance` AS `idInstance`,`cr`.`objetCR` AS `objetCR`,`cr`.`difficulte` AS `difficulte`,`cr`.`decision` AS `decision`,`cr`.`perspective` AS `perspective`,`cr`.`dateDebut` AS `dateDebut`,`cr`.`dateFin` AS `dateFin`,`inst`.`idStructure` AS `idStructure`,`inst`.`libInstance` AS `libInstance`,`str`.`Str_idStructure` AS `Str_idStructure`,`str`.`idTypeStr` AS `idTypeStr`,`str`.`nomStructure` AS `nomStructure`,`str`.`sigleStructure` AS `sigleStructure` from ((`instancerepresentation` `inst` join `compterenduinstance` `cr` on((`inst`.`idInstance` = `cr`.`idInstance`))) join `structure` `str` on((`inst`.`idStructure` = `str`.`idStructure`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_instance_structure`
--
DROP TABLE IF EXISTS `v_instance_structure`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_instance_structure`  AS  select `inst`.`idInstance` AS `idInstance`,`inst`.`idStructure` AS `idStructure`,`inst`.`libInstance` AS `libInstance`,`str`.`Str_idStructure` AS `Str_idStructure`,`str`.`idTypeStr` AS `idTypeStr`,`str`.`nomStructure` AS `nomStructure`,`str`.`sigleStructure` AS `sigleStructure` from (`instancerepresentation` `inst` join `structure` `str` on((`inst`.`idStructure` = `str`.`idStructure`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_instruction`
--
DROP TABLE IF EXISTS `v_instruction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_instruction`  AS  select `do`.`idDossierO` AS `idDossierO`,`do`.`idStructure` AS `idStructure`,`do`.`idStatut` AS `idStatut`,`do`.`objetDossierO` AS `objetDossierO`,`do`.`refCorrespondance` AS `refCorrespondance`,`do`.`dateCorrespondance` AS `dateCorrespondance`,`do`.`syntheseDossierO` AS `syntheseDossierO`,`do`.`observationDossierO` AS `observationDossierO`,`do`.`sigleStructure` AS `sigleStructure`,`do`.`nomStructure` AS `nomStructure`,`do`.`libStatut` AS `libStatut`,`ins`.`idInstruction` AS `idInstruction`,`ins`.`instruction` AS `instruction`,`ins`.`dateInstruction` AS `dateInstruction`,`ins`.`delaiReaction` AS `delaiReaction`,`ins`.`refCorrespondance` AS `refInstruction`,`ins`.`dateCorrespondance` AS `dateCorespInstruction` from (`v_dossierordinaire` `do` left join `instruction` `ins` on((`do`.`idDossierO` = `ins`.`idDossierO`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_pta`
--
DROP TABLE IF EXISTS `v_pta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pta`  AS  select `pta`.`idPTA` AS `idPTA`,`pta`.`libPTA` AS `libPTA`,`pta`.`dateTransmission` AS `dateTransmission`,`pta`.`refCorrespondance` AS `refCorrespondance`,`an`.`idAnnee` AS `idAnnee`,`an`.`annee` AS `annee`,`an`.`anneeActive` AS `anneeActive` from (`pta` left join `annee` `an` on((`pta`.`idAnnee` = `an`.`idAnnee`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_reaction`
--
DROP TABLE IF EXISTS `v_reaction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_reaction`  AS  select `ins`.`idDossierO` AS `idDossierO`,`ins`.`idStructure` AS `idStructure`,`ins`.`idStatut` AS `idStatut`,`ins`.`objetDossierO` AS `objetDossierO`,`ins`.`refCorrespondance` AS `refCorrespondance`,`ins`.`dateCorrespondance` AS `dateCorrespondance`,`ins`.`syntheseDossierO` AS `syntheseDossierO`,`ins`.`observationDossierO` AS `observationDossierO`,`ins`.`sigleStructure` AS `sigleStructure`,`ins`.`nomStructure` AS `nomStructure`,`ins`.`libStatut` AS `libStatut`,`ins`.`idInstruction` AS `idInstruction`,`ins`.`instruction` AS `instruction`,`ins`.`dateInstruction` AS `dateInstruction`,`ins`.`delaiReaction` AS `delaiReaction`,`ins`.`refInstruction` AS `refInstruction`,`ins`.`dateCorespInstruction` AS `dateCorespInstruction`,`re`.`idReaction` AS `idReaction`,`re`.`suiteDonnee` AS `suiteDonnee`,`re`.`observation` AS `observation`,`re`.`refCorrespondance` AS `refCorrepReaction`,`re`.`dateCorrespondance` AS `dateCorrespReaction` from (`reaction` `re` join `v_instruction` `ins` on((`ins`.`idInstruction` = `re`.`idInstruction`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_structure`
--
DROP TABLE IF EXISTS `v_structure`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_structure`  AS  select `str`.`idStructure` AS `idStructure`,`str`.`Str_idStructure` AS `Str_idStructure`,`str`.`idTypeStr` AS `idTypeStr`,`str`.`nomStructure` AS `nomStructure`,`str`.`sigleStructure` AS `sigleStructure`,`tstr`.`libelleTypeStr` AS `libelleTypeStr` from (`structure` `str` join `typestructure` `tstr` on((`str`.`idTypeStr` = `tstr`.`idTypeStr`))) ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `action`
--
ALTER TABLE `action`
  ADD CONSTRAINT `FK_ACTION_ASSOCIATI_PROGRAMM` FOREIGN KEY (`idProgBudgetaire`) REFERENCES `programmebudgetaire` (`idProgBudgetaire`);

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `fk_action_activite_idAction` FOREIGN KEY (`idAction`) REFERENCES `action` (`idAction`);

--
-- Contraintes pour la table `agent`
--
ALTER TABLE `agent`
  ADD CONSTRAINT `FK_AGENT_ASSOCIATI_DEPARTEM` FOREIGN KEY (`idDepartement`) REFERENCES `departement` (`idDepartement`),
  ADD CONSTRAINT `FK_AGENT_ASSOCIATI_FONCTION` FOREIGN KEY (`idfonction`) REFERENCES `fonction` (`idfonction`);

--
-- Contraintes pour la table `agentimpliquedcc`
--
ALTER TABLE `agentimpliquedcc`
  ADD CONSTRAINT `FK_AGENTIMP_ASSOCIATI_AGENTDCC` FOREIGN KEY (`idAgent`) REFERENCES `agent` (`idAgent`),
  ADD CONSTRAINT `FK_AGENTIMP_ASSOCIATI_DOSSIERC` FOREIGN KEY (`idDossierCC`) REFERENCES `dossiercc` (`idDossierCC`);

--
-- Contraintes pour la table `agentimpliquedo`
--
ALTER TABLE `agentimpliquedo`
  ADD CONSTRAINT `FK_AGENTIMP_ASSOCIATI_AGENTDO` FOREIGN KEY (`idAgent`) REFERENCES `agent` (`idAgent`),
  ADD CONSTRAINT `FK_AGENTIMP_ASSOCIATI_DOSSIERO` FOREIGN KEY (`idDossierO`) REFERENCES `dossierordinaire` (`idDossierO`);

--
-- Contraintes pour la table `avispm`
--
ALTER TABLE `avispm`
  ADD CONSTRAINT `FK_AVISPM_ASSOCIATI_DOSSIERO` FOREIGN KEY (`idDossierO`) REFERENCES `dossierordinaire` (`idDossierO`);

--
-- Contraintes pour la table `compterenduinstance`
--
ALTER TABLE `compterenduinstance`
  ADD CONSTRAINT `fk_instance_cr_idInstance` FOREIGN KEY (`idInstance`) REFERENCES `instancerepresentation` (`idInstance`);

--
-- Contraintes pour la table `domaine`
--
ALTER TABLE `domaine`
  ADD CONSTRAINT `FK_DOMAINE_ASSOCIATI_PROGRAMM` FOREIGN KEY (`idProgBudgetaire`) REFERENCES `programmebudgetaire` (`idProgBudgetaire`);

--
-- Contraintes pour la table `dossiercc`
--
ALTER TABLE `dossiercc`
  ADD CONSTRAINT `FK_DOSSIERC_ASSOCIATI_NATUREDOCC` FOREIGN KEY (`idType`) REFERENCES `typedossierconseil` (`idType`);

--
-- Contraintes pour la table `dossiercm`
--
ALTER TABLE `dossiercm`
  ADD CONSTRAINT `FK_DOSSIERC_ASSOCIATI_NATUREDOCM` FOREIGN KEY (`idType`) REFERENCES `typedossierconseil` (`idType`);

--
-- Contraintes pour la table `dossierordinaire`
--
ALTER TABLE `dossierordinaire`
  ADD CONSTRAINT `FK_DOSSIERO_ASSOCIATI_STATUTDO` FOREIGN KEY (`idStatut`) REFERENCES `statutdossier` (`idStatut`),
  ADD CONSTRAINT `FK_DOSSIERO_ASSOCIATI_STRUCTUR` FOREIGN KEY (`idStructure`) REFERENCES `structure` (`idStructure`);

--
-- Contraintes pour la table `dossierrapportactivite`
--
ALTER TABLE `dossierrapportactivite`
  ADD CONSTRAINT `FK_DOSSIERR_ASSOCIATI_AGENT` FOREIGN KEY (`idAgent`) REFERENCES `agent` (`idAgent`),
  ADD CONSTRAINT `FK_DOSSIERR_ASSOCIATI_PTA` FOREIGN KEY (`idPTA`) REFERENCES `pta` (`idPTA`),
  ADD CONSTRAINT `FK_DOSSIERR_ASSOCIATI_STRUCTUR` FOREIGN KEY (`idStructure`) REFERENCES `structure` (`idStructure`);

--
-- Contraintes pour la table `indicateur`
--
ALTER TABLE `indicateur`
  ADD CONSTRAINT `FK_INDICATE_ACTIONIND_ACTION` FOREIGN KEY (`idAction`) REFERENCES `action` (`idAction`),
  ADD CONSTRAINT `FK_INDICATE_ASSOCIATI_PROGRAMM` FOREIGN KEY (`idProgBudgetaire`) REFERENCES `programmebudgetaire` (`idProgBudgetaire`);

--
-- Contraintes pour la table `instancerepresentation`
--
ALTER TABLE `instancerepresentation`
  ADD CONSTRAINT `FK_INSTANCE_ASSOCIATI_STRUCTUR` FOREIGN KEY (`idStructure`) REFERENCES `structure` (`idStructure`);

--
-- Contraintes pour la table `instruction`
--
ALTER TABLE `instruction`
  ADD CONSTRAINT `FK_INSTRUCT_ASSOCIATI_DOSSIERO` FOREIGN KEY (`idDossierO`) REFERENCES `dossierordinaire` (`idDossierO`);

--
-- Contraintes pour la table `intanceagent`
--
ALTER TABLE `intanceagent`
  ADD CONSTRAINT `FK_INTANCEA_INTANCEAG_AGENT` FOREIGN KEY (`idAgent`) REFERENCES `agent` (`idAgent`),
  ADD CONSTRAINT `fk_instance_agent_idInstance` FOREIGN KEY (`idInstance`) REFERENCES `instancerepresentation` (`idInstance`);

--
-- Contraintes pour la table `lettremission`
--
ALTER TABLE `lettremission`
  ADD CONSTRAINT `FK_LETTREMI_ASSOCIATI_ANNEE` FOREIGN KEY (`idAnnee`) REFERENCES `annee` (`idAnnee`),
  ADD CONSTRAINT `FK_LETTREMI_ASSOCIATI_RESPONSA` FOREIGN KEY (`idResponsable`) REFERENCES `responsablestre` (`idResponsable`);

--
-- Contraintes pour la table `performanceppd`
--
ALTER TABLE `performanceppd`
  ADD CONSTRAINT `FK_PERFORMA_ASSOCIATI_ANNEEPPD` FOREIGN KEY (`idAnnee`) REFERENCES `annee` (`idAnnee`),
  ADD CONSTRAINT `FK_PERFORMA_ASSOCIATI_STRUCTUR` FOREIGN KEY (`idStructure`) REFERENCES `structure` (`idStructure`);

--
-- Contraintes pour la table `performancestructure`
--
ALTER TABLE `performancestructure`
  ADD CONSTRAINT `FK_PERFORMA_ASSOCIATI_ANNEEPERF` FOREIGN KEY (`idAnnee`) REFERENCES `annee` (`idAnnee`);

--
-- Contraintes pour la table `prioritelm`
--
ALTER TABLE `prioritelm`
  ADD CONSTRAINT `FK_PRIORITE_ASSOCIATI_LETTREMI` FOREIGN KEY (`idLM`) REFERENCES `lettremission` (`idLM`);

--
-- Contraintes pour la table `programmebudgetaire`
--
ALTER TABLE `programmebudgetaire`
  ADD CONSTRAINT `FK_PROGRAMM_ASSOCIATI_PTA` FOREIGN KEY (`idPTA`) REFERENCES `pta` (`idPTA`);

--
-- Contraintes pour la table `pta`
--
ALTER TABLE `pta`
  ADD CONSTRAINT `fk_pta_annee` FOREIGN KEY (`idAnnee`) REFERENCES `annee` (`idAnnee`);

--
-- Contraintes pour la table `reaction`
--
ALTER TABLE `reaction`
  ADD CONSTRAINT `FK_REACTION_ASSOCIATI_INSTRUCT` FOREIGN KEY (`idInstruction`) REFERENCES `instruction` (`idInstruction`);

--
-- Contraintes pour la table `responsablestre`
--
ALTER TABLE `responsablestre`
  ADD CONSTRAINT `FK_RESPONSA_ASSOCIATI_STRUCTUR` FOREIGN KEY (`idStructure`) REFERENCES `structure` (`idStructure`);

--
-- Contraintes pour la table `structure`
--
ALTER TABLE `structure`
  ADD CONSTRAINT `FK_STRUCTUR_ASSOCIATI_STRUCTUR` FOREIGN KEY (`Str_idStructure`) REFERENCES `structure` (`idStructure`),
  ADD CONSTRAINT `FK_STRUCTUR_ASSOCIATI_TYPESTRU` FOREIGN KEY (`idTypeStr`) REFERENCES `typestructure` (`idTypeStr`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_user_agent` FOREIGN KEY (`idAgent`) REFERENCES `agent` (`idAgent`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
