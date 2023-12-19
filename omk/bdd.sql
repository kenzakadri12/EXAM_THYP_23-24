-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 19 déc. 2023 à 20:52
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omeka`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE IF NOT EXISTS `api_key` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C912ED9D7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('F33gNzCHOp6rJoXBJbVvvwMTbOZTwYcF', 1, 'newkey', '$2y$10$Q8Lo3hLLlphTxF0ez18/2uIXTpOFWPnuDkZZTXcNX7SI6OL.U9EVi', 0x00000000000000000000000000000001, '2023-11-26 13:24:30', '2023-11-26 13:09:02'),
('Nmuk191lHC4t9HdRyvBqKz46HHhHJjDl', 1, 'test', '$2y$10$00cQ3r3OvoFWkn6mqEENwOgF/iC4tYjb9DEeLP1ZlrkqSqfe8ctZi', NULL, NULL, '2023-11-13 10:01:26'),
('Y2Awg7kZWyv8VSBonnTP6wkzPRPM46yQ', 1, 'omeka', '$2y$10$iP4CcdUd7A6uyuQ/mt2pMuR7CAy8ZMO0GMq9BNp6cRifTSCyykD.y', 0x00000000000000000000000000000001, '2023-11-20 10:58:31', '2023-11-20 10:51:42'),
('ya55LWrUwR6KMDYzEGTPCfz9gOydKyXG', 1, 'new', '$2y$10$dN/makUdhTXVQprlt8ovMebgwofwMRd/jk1wtCbv62WuZob5uP/ny', 0x00000000000000000000000000000001, '2023-11-30 20:45:01', '2023-11-30 20:42:07');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `asset`
--

INSERT INTO `asset` (`id`, `owner_id`, `name`, `media_type`, `storage_id`, `extension`, `alt_text`) VALUES
(1, 1, 'Image1 (1).png', 'image/png', 'cc8527ee178c41457cd473148440d4c13ec42c78', 'png', ''),
(2, 1, 'image.jpg', 'image/jpeg', 'd54ed506669d13dfd9f8f79c04555f522b704b9b', 'jpg', ''),
(3, 1, 'prisonnier-dazkaban-jim-kay.png', 'image/png', 'b4b825a945ae6f2afae70b71850bb3787bfa5415', 'png', ''),
(4, 1, 'Minalima-banner-CoS.webp', 'image/webp', '299bf64a221e8633042200e34d5ea9af821d760f', 'webp', ''),
(5, 1, 'harry-potter-et-la-coupe-de-feu-junior-1.jpg', 'image/png', 'b835bfc257fbf3cf697865ab4c987b00d3332e50', 'jpg', ''),
(6, 1, 'Usain_Bolt_Rio_100m_final_2016i-cr.jpg', 'image/jpeg', '945ae327fd89322dda8cb4d592d5bd951947e328', 'jpg', ''),
(7, 1, 'téléchargement.jpeg', 'image/jpeg', '4b6fc515a4be7babf5593f011ae25a64690fa2c8', 'jpeg', ''),
(8, 1, 'xcfcbyrae73qgl9pgqay.jpeg', 'image/jpeg', 'c676f349d6793bb6cbd97133c2b19a13fcb4a01c', 'jpeg', '');

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE IF NOT EXISTS `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `text` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`resource`),
  KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(2, 'site_pages', 1, 1, 'harry potter movies', 'Harry Potter et la Chambre des secrets\nHarry Potter à l\'école des sorciers'),
(10, 'items', 1, 1, 'sportif3', 'sportif3\n Michael\nMichael Phelps\n 30 juin 1985\n Natation\nOr\n8 médailles d\'or en natation\nPékin, Chine'),
(11, 'items', 1, 1, 'sportif2', 'sportif2\nUsain\nUsain Bolt\n21 août 1986\nAthlétisme\nOr\n9,58 secondes (100 mètres)\n Pékin, Chine'),
(12, 'items', 1, 1, 'sportif1', 'sportif1\nHicham \nEl Guerrouj\n14 septembre 1974 \ncourses de fond \nOR');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(10, NULL),
(11, NULL),
(12, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE IF NOT EXISTS `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`item_set_id`),
  KEY `IDX_6D0C9625126F525E` (`item_id`),
  KEY `IDX_6D0C9625960278D7` (`item_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE IF NOT EXISTS `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE IF NOT EXISTS `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`,`site_id`),
  KEY `IDX_A1734D1F126F525E` (`item_id`),
  KEY `IDX_A1734D1FF6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(10, 1),
(11, 1),
(12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  KEY `IDX_6A2CA10C126F525E` (`item_id`),
  KEY `item_position` (`item_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230601060113'),
('20230713101012');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE IF NOT EXISTS `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('DrZOmPH56x1cqkwI66kRVyDtRK9fSSFY', 2, '2023-11-27 13:05:18', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(198, 1, 6, 'idPers', 'User ID', NULL),
(199, 1, 6, 'idMail', 'First Name', NULL),
(200, 1, 6, 'name', 'Last Name', NULL),
(201, 1, 6, 'dateNaissance', 'Email', NULL),
(202, 1, 6, 'mailAdress', 'Birthdate', NULL),
(203, 1, 6, 'passWord', 'Is Admin', NULL),
(204, 1, 6, 'sujet', 'Profile Image', NULL),
(205, 1, 6, 'content', 'Session ID', NULL),
(206, 1, 6, 'type', 'Session Name', NULL),
(207, 1, 6, 'createdAt', 'Record ID', NULL),
(208, 1, 6, 'sender', 'Mood', NULL),
(209, 1, 6, 'reciever', 'Time', NULL),
(210, 1, 7, 'nom', 'nom', NULL),
(211, 1, 7, 'prenom', 'prénom', NULL),
(212, 1, 7, 'dateNaissance', 'date de naissance', NULL),
(213, 1, 7, 'sportPratique', 'sport pratiqué', NULL),
(214, 1, 7, 'medaille', 'médaille', NULL),
(215, 1, 7, 'annee', 'année', NULL),
(216, 1, 7, 'lieu', 'lieu', NULL),
(217, 1, 7, 'record', 'record', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  KEY `title` (`title`(190))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(10, 1, 112, 2, 8, 'sportif3', 1, '2023-12-19 18:04:51', '2023-12-19 20:36:08', 'Omeka\\Entity\\Item'),
(11, 1, 112, 2, 6, 'sportif2', 1, '2023-12-19 18:06:59', '2023-12-19 20:26:45', 'Omeka\\Entity\\Item'),
(12, 1, 112, 2, 7, 'sportif1', 1, '2023-12-19 18:27:14', '2023-12-19 20:33:22', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE IF NOT EXISTS `resource_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(109, 1, 6, 'mail', 'User', NULL),
(110, 1, 6, 'person', 'Session', NULL),
(111, 1, 6, 'account', 'Attendance Record', NULL),
(112, 1, 7, 'Sportif', 'Sportif', NULL),
(113, 1, 7, 'JeuxOlympiques', 'Jeux Olympiques', NULL),
(114, 1, 7, 'Epreuve', 'Épreuve', NULL),
(115, 1, 7, 'Resultat', 'Résultat', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE IF NOT EXISTS `resource_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 112, NULL, NULL, 'Sportif');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
CREATE TABLE IF NOT EXISTS `resource_template_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  KEY `IDX_4689E2F1549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(21, 2, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(22, 2, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(23, 2, 211, NULL, NULL, 3, NULL, 0, 0, NULL),
(24, 2, 210, NULL, NULL, 4, NULL, 0, 0, NULL),
(25, 2, 212, NULL, NULL, 5, NULL, 0, 0, NULL),
(26, 2, 213, NULL, NULL, 6, NULL, 0, 0, NULL),
(27, 2, 214, NULL, NULL, 7, NULL, 0, 0, NULL),
(28, 2, 17, NULL, NULL, 8, NULL, 0, 0, NULL),
(29, 2, 207, NULL, NULL, 9, NULL, 0, 0, NULL),
(30, 2, 217, NULL, NULL, 10, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('0l3a2dt19ldi9ouqor8pdkabff', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313030343535392e3232343838383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22306c336132647431396c6469396f75716f723870646b61626666223b7d7d72656469726563745f75726c7c733a33363a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e2f7573657273223b, 1701004559),
('5sip2gk2c4n4p68prhthh49stq', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303835363438352e3430303233373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223769633033327538386b6f6573376967756a34346e756a6b7372223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303835353630383b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303836303035323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303835383731393b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223339306632313664313434343931643065353332616339653538633630323366223b733a33323a223939616331376263663436366366396339623938323634383364336336373364223b7d733a343a2268617368223b733a36353a2239396163313762636634363663663963396239383236343833643363363733642d3339306632313664313434343931643065353332616339653538633630323366223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32343a7b733a33323a223866333732366533313533353036303764343539633630633333663962653432223b733a33323a223064656266663463353739306162623130303131653237613135636232613132223b733a33323a223632386466666532663932346261336231313863386331333566356363316637223b733a33323a223339396535356466323430323266393135346636356235393334326132663737223b733a33323a223834363737306361396263663839356466333030366365303738393035353631223b733a33323a223235333631393833306631353733623832306565663163656239643863303630223b733a33323a223464313033373038613832373234376263303966373232666231623365613462223b733a33323a226635343837393832613536613930656436326639306139333261303537636338223b733a33323a223030333538363736643235383438366162613364633437633637653139366334223b733a33323a226566636138666138343030343635353131633066636664666333343161613233223b733a33323a226263613935373339666236626663356361333432353833373566373761626131223b733a33323a223036393032636631313637333134386133383436383862613639326230653437223b733a33323a223533393863306536616362396464653231316432653864633661613961326134223b733a33323a223036346465646464353039623830623936643566303163346265633864376263223b733a33323a223766306533316334613630343636306537303034333632656161623665346439223b733a33323a223961396265376530323332393965643337323861353666663065306662313330223b733a33323a223365613362343739373634363761396465656464353132643461373936323235223b733a33323a223462656339376236396634333939656665396230616264653436353238353161223b733a33323a226339353238323039666332373362626165373461363165386366356461353737223b733a33323a226437333663643164366130633361373834373061333764656432313237623066223b733a33323a223063323534666366333466353365303664633834656563613962306338303564223b733a33323a223166613666643030626564666630643965303233353839663539363066666438223b733a33323a223962623537303462643537323731326232363465333933653237656561633838223b733a33323a226537643637303634306433356463663533313739383736636438623062363264223b733a33323a223333653633303430376563313666633466613261656433663364616463653762223b733a33323a223961326436623131336138626139653463653166336335643835306535313864223b733a33323a223961663234656264323566636165633464323339373537633337656634383038223b733a33323a223466333365613033393564653435316630313063616239326132653633333132223b733a33323a223434386234323263376330346538316564666435353036323836383138333461223b733a33323a226236336133356663376536623535643031346635353831376437353136386136223b733a33323a223431386261393035623537386436326239333638633638303564666664643965223b733a33323a223835636433633063666562353331353766343531353133396463333837633238223b733a33323a223437373665616435323766323933363561393532396163303464613366666434223b733a33323a226136373536643032323863303364636535653934643230366334353866656430223b733a33323a223565303536383335323131346562346231623064646135656631373036613765223b733a33323a226539333234323661323464303838303331373537333834383939653439633564223b733a33323a223233613837663565613463653732653165303338323864356462336332323663223b733a33323a226138333032303663316634613731373466393630353632376234323536356339223b733a33323a223438383338353432346132343034376563643030613439303334393164396462223b733a33323a223732336233636439366562323862613864333662656466376135333430623162223b733a33323a226461623332323634323230656365643265376635383531643632346566366431223b733a33323a223535626438306235626130316237346334336464636461386633306236663231223b733a33323a223032353632653564343830636464326531383930653964633732653034336666223b733a33323a223861323166376263343039303665343461353135313934376337663465613132223b733a33323a226632373833643363666532343663643466666133666437643835656633363566223b733a33323a223365333730313538633834366635326538636634386130656665306361306130223b733a33323a226562326438613235343565613338333432316438373239363864396365666635223b733a33323a226230613565623533386437653238333830353566313635656466376465383532223b7d733a343a2268617368223b733a36353a2262306135656235333864376532383338303535663136356564663764653835322d6562326438613235343565613338333432316438373239363864396365666635223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223235343931356164316163363834386438626434323861383166373563643633223b733a33323a226431326361633136336537353064333036333230633332373063613861326237223b733a33323a226338626537636565663039366666356138643234663837363335346435386634223b733a33323a223738393961643139636634643739633136306231356332386362656538373636223b7d733a343a2268617368223b733a36353a2237383939616431396366346437396331363062313563323863626565383736362d6338626537636565663039366666356138643234663837363335346435386634223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1700856485),
('ed1ut0dvhk01bl29jcislj848r', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313039303735362e3938333037393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656d663668383536653361766636677369646236366a37366264223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313030373639373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039333935313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313039333937383b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223261316564623864653561343434326331366439366139303738326232656432223b733a33323a223862383066636563396435383865376538336639326331646434326264333663223b7d733a343a2268617368223b733a36353a2238623830666365633964353838653765383366393263316464343262643336632d3261316564623864653561343434326331366439366139303738326232656432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226239643536636331313262636663363737623762303761363064336139396635223b733a33323a223339613933653162323063306166636165633934656135373932353639616439223b733a33323a226433316336666664613832366362623933643236636632396438616533383863223b733a33323a223633373632386338333232303561616335376532343463396630383261316139223b733a33323a223136316331306639643062386131663263326637613264366133383363343136223b733a33323a223730623034326663356534336461633564363561373661393261356661313938223b733a33323a223162613833646636316664636230653831336232343139613766333136643435223b733a33323a223735633565373465396139386263643835306634643361363562633639386331223b733a33323a223766333462353532613364366635356537356432646532383037626265306431223b733a33323a223930313362613564613139343731373038323933306362333033626531653334223b733a33323a226563383663656661333836623338373365383937343133663364636330356563223b733a33323a223766623837313333646636616638343331366566383033643238646535663230223b7d733a343a2268617368223b733a36353a2237666238373133336466366166383433313665663830336432386465356632302d6563383663656661333836623338373365383937343133663364636330356563223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226665363366373833346432623236343666376139633265363334663437333964223b733a33323a226331653738393563346137613333623763333435653166643231666337343933223b733a33323a226663346438346634353838643064386634666138353139616266343834656438223b733a33323a226461353939376132643339373962383163306139366665643131646335366635223b733a33323a223333663966626330633766343730306566343130386134393863626638363635223b733a33323a223962333266393161623332303738336532366136373939353239643564316162223b733a33323a223666383736303932303537386435346165363430373836623164346332623735223b733a33323a226162336538343262356430396136646230313965333438303862663232343862223b733a33323a223933383761343738633232326266356632636166613464336565366539346465223b733a33323a226234393463393932396666393131666166626635663238343534333938336165223b733a33323a223734613931656331353563336630633665323963613965383033366435383166223b733a33323a226162356133396630623339306161373337363963656564306564306261396331223b7d733a343a2268617368223b733a36353a2261623561333966306233393061613733373639636565643065643062613963312d3734613931656331353563336630633665323963613965383033366435383166223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701090756),
('giq33ule9mvvn6q90074ldmq87', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730333031383231322e3136323136323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2272676e7135356c30723862613835706268346c396e6e76633136223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730333030313635343b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730333030393037393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730333031313338343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730333032313831323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730333032313634393b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226631366461633061376532303530373535336262666439336330303035623462223b733a33323a223865616536396331613232386363633337613863363761393533346431323034223b7d733a343a2268617368223b733a36353a2238656165363963316132323863636333376138633637613935333464313230342d6631366461633061376532303530373535336262666439336330303035623462223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223830373138393433666238626438396538643633386232393930623837366566223b733a33323a223934393937373361376531643130653037343166636264653339393434333032223b733a33323a223432393964363764313164346661373736303234663534326237646232306465223b733a33323a223334623331646561646163663763616338346333323664356434363030633164223b733a33323a223132353565333739643665306134616364623466303163616431306634316332223b733a33323a226162373162626336326462623031336264333162653834663632336237653334223b733a33323a223633393734373339386334626130323964336136396635316663333461336239223b733a33323a223932623331356563373361393436333665653662663739346639313563303133223b733a33323a223438323531366564366161346132356463613034376361366137356534663033223b733a33323a226264373165343934303763363465333665346435613562333634623134356461223b7d733a343a2268617368223b733a36353a2262643731653439343037633634653336653464356135623336346231343564612d3438323531366564366161346132356463613034376361366137356534663033223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223666323033323863313932323436373632653237653330303834316137393764223b733a33323a223130653330316430626461356232373465393536373337363137613436333137223b733a33323a226330383761303037666339333966333163666631343831343061376563306364223b733a33323a223131663939636538633732663464626464326665306366646132326635383132223b733a33323a226236383737386637623164363138373265363035376236663330626239373939223b733a33323a223533313736303464383661383434343466373934333066303235383462633234223b733a33323a223863353663316335313034663265376166343834303830616635333832343462223b733a33323a223337626238623366616434393962343439353162303162383937343032393633223b733a33323a226662313535616436363133343931353266373835333139653761666233623033223b733a33323a223937316461383165633762643130353232376264373338346435386333663332223b733a33323a223561663638323763663933346465313461303235303131613131646532653437223b733a33323a223031323936616231646335626164626131653532643832656531663862633937223b7d733a343a2268617368223b733a36353a2230313239366162316463356261646261316535326438326565316638626339372d3561663638323763663933346465313461303235303131613131646532653437223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3132383a7b733a33323a226665346363656634663733343733363563393436356563663639306163633936223b733a33323a223437386632643035646231616234643161313431333631383265346532636436223b733a33323a223637326462333732663930366237343532636230333666396233353262636665223b733a33323a223236663736663533613635383863623633353566396332393934396535316637223b733a33323a223133376562643965373437613939313036393133326430326438303962623065223b733a33323a223464393537303566656566303039316464363862616232373032363538346539223b733a33323a223666383264643665636237313662663332616439653366393264343266376437223b733a33323a223639663730613263303964333366373637633264363936393737313138393133223b733a33323a226431326130313338333433653265663430336531356634396565353562643531223b733a33323a226234663934313636373535616161396264626135393532613837353636363939223b733a33323a223835386164626461383062626465633435353435613636383636356137623563223b733a33323a226566373336306563646666663064316431393736306233383832663766353563223b733a33323a226534316437376136653235393466333964313162623962643665353165396339223b733a33323a226165363632383136663363623339626537356533656666383565316333616161223b733a33323a226663333035613733383963393238633463613430643730663431316265633937223b733a33323a223135393036316533316164353165316431373231363932366430383633303237223b733a33323a223637356534633936393932383962613362663535316263646464353637623339223b733a33323a223533626631666235376336633861383734646638646437313236343534646430223b733a33323a226335653965613232396265343433306533363433316263316438363365333039223b733a33323a223862356435303130376664663338323139663938393762353762363832376630223b733a33323a226566396437636230663062373730306132356535383961636137626137313366223b733a33323a226632663738646635666265346338383563373932323161393562636361303133223b733a33323a223035303262333734636431393834376639393463633362333831346661616666223b733a33323a226537343534616436616635393539663563353064373462353066666636613164223b733a33323a223739326262626433343838393934616531646636656331326133303639623761223b733a33323a223438306333643035353739313238363535636632636464326439346563343533223b733a33323a223864386366653564613863363234346131353237636430363366373464313863223b733a33323a223131363763306662623831643435313465353031396230333164346531646435223b733a33323a223535336439646537363538313439366535323537376664356464343232373331223b733a33323a223939663237393335383063373137663664343230356134336637626231343232223b733a33323a223034306565333838376463373961323664646562323736636466653730303236223b733a33323a226132656336346538346531346166313931633738656464653365396162323636223b733a33323a226565333965623831363632633939393137653662393966313463663966346437223b733a33323a223531343535393766373965616430393532353366396665353734383061386166223b733a33323a223636643239616438393933326134616263653139616439353537373330373934223b733a33323a226363363265346566306364366337353432333964313636366162376339623466223b733a33323a223666373938336635373463333164633163353061353566386530626137626330223b733a33323a226564373930353262663034646533333361613361313833346635663161643461223b733a33323a223066626166313237313936396534376366393738373964616566336536643266223b733a33323a223266626430366561373962363366303362376634646537633761386362313133223b733a33323a223766376163313037663930363333356638666431653764303564353433306237223b733a33323a223234643030646663343732633831343939616434383434323832646566616335223b733a33323a226266613633313635623064393737373165376335633333356130346561393165223b733a33323a223863663161633566626239373237303232353039313339373431366231643763223b733a33323a223130333836613234366433653438303131326536366338623064316562656534223b733a33323a223334393838313761366665343635353464613439386338323964316231633234223b733a33323a223434656630333830316266313835386563616365316666636163643733373339223b733a33323a223234333232396263336637623066353637663131636539356539613465663864223b733a33323a226532363237643464373465353039666266353862326565363931343134643437223b733a33323a226363363163383665346231333664353637663566346537363661316265623339223b733a33323a226133333664333266646334613233333637666534663434653061646338646532223b733a33323a226361313961306362666663646465383139646536366635623562363539383233223b733a33323a223662666431333632333664336134323563346566616534383862343163316564223b733a33323a223036653639316563373665623733376631326533393638653762383638613262223b733a33323a223137633937636238633535323632643032353333386537636262616166353730223b733a33323a223762343761336638653237656636646534663130393430373235616138626139223b733a33323a223833616232663766663230313038393065336532333932306530616433336466223b733a33323a223932663533656235313035333433613339636534646365396238333732383032223b733a33323a223065336532636561333333303139643664323330633465633033626538653939223b733a33323a226232396539663464643834383432393936313161636563396536313934313561223b733a33323a223638666336643762333736633335346234303962636437636238633765656365223b733a33323a223938636436623263396638613834336638366530303036366463353237653363223b733a33323a226562336561396262643864363634626537666364616666613436313037393365223b733a33323a223332666334313535616261323766303330616538323235636637633465313635223b733a33323a223961383562646531356634383335383632336334616365383833383230356435223b733a33323a223939616437663931383365393535653735643034653038376662373432316562223b733a33323a223763663662623038613737306230626231386263623366303231393564366163223b733a33323a223265316636326436336563653339326637316261346663623430386464333431223b733a33323a226531303133303632323262333130353637343562316362383437393532373262223b733a33323a223861616531343466393636653339653865376237323131656131623738643562223b733a33323a226166343035346232633533333334646133623032613366613263653164633231223b733a33323a223532393734333234393830366332643639633438353462393764376165396561223b733a33323a223533643464646436303761663935313766326134333032346139383062303739223b733a33323a223464363962383136383235346131383964313135336237313338646661393562223b733a33323a223466353335366266323361383734393835633332386637346431633961336561223b733a33323a223731353136373034363439323463623663643334383230616636623566396339223b733a33323a223037396136646437303164666563646564323435316339306339623466663836223b733a33323a223464613838376363646638356238363765373834626336363930646432303531223b733a33323a223831313664363139616433613333666661613866383639333066396530653931223b733a33323a226434613263623535643036663561303462326265333361373833623862363761223b733a33323a223665353636613261353037626238636134356536613363666537656565373364223b733a33323a226166373637306437383038313736343863373964326631393666343232666339223b733a33323a226161383739383262376434383662323132376465613935303232323334343336223b733a33323a223038333663383631383264393966373363393933303035633862303234346136223b733a33323a223364346335653536633165663161666135356133393837353763643961393331223b733a33323a226164323763313239306533643562646162353765306265383834346432386462223b733a33323a223735643239626136636637623734393334616566646331333566396638343931223b733a33323a226636326338626434373537383765303562613733636530386663366539666162223b733a33323a226265623661303333343736656530376630353138636230623434323937336432223b733a33323a226334313435643962653766396130356532666432333064383034623834373831223b733a33323a226264383064643864396366323033333461303333653935656331623231316237223b733a33323a223931323834646432666634336566396130323237343865653334383534643739223b733a33323a223634323662663733386536356663643865356563353062623630666631646563223b733a33323a226237393261636333363634626361613566633633303737333134366664343030223b733a33323a223966393335386564383831636433363436626236303265653035363331373163223b733a33323a223635333536373831326465616235326633613535633437333234653061633061223b733a33323a223537333139326230383136616363653966373135613439333739613762323830223b733a33323a223335323162373165373762336465393836353937623837353565303233343165223b733a33323a223737303137343734383466376263626163613962636464393665653661666565223b733a33323a223932346334353030613362653363343561393931623739316338323662643732223b733a33323a226238343336363534633436363461613537346430303665646262353433353962223b733a33323a223832616365636530666639346532616432356261626230393137366232313231223b733a33323a223034366636356630376235666330363439373263633261396535613133646637223b733a33323a226337373838656339373065353462313738353735616138653563316235626665223b733a33323a223966633532356438363732313936333331363038633235623663663565663533223b733a33323a226233336463336438373163383032663033376432643830633130346436616138223b733a33323a226262653861313130343837376364396139323162346433316530323339323838223b733a33323a226563666436306261636531643961353061656535363931303438613936333733223b733a33323a226161343233313137323266613166666161636364333638346438626238323662223b733a33323a223430666465393832343938333835373861626636616639346161623237393636223b733a33323a223962323738333234326232643430633866646264333865646237363834353866223b733a33323a223039323562376465626366376464316437613766383931626563326234656633223b733a33323a226537643335656165353332626564333537643631346133383730386263646438223b733a33323a223036383830653337333432316263366361613564313733316339656663643266223b733a33323a223763386434643638633362656363353237613834373863616630396665373463223b733a33323a226438633632666633646231643361383437313164616336663932373738316533223b733a33323a226533386266663062643537353065303433313966636365386262356133313834223b733a33323a223538646437306433326161643666333564363162613264323032356364313631223b733a33323a226631646336313533343663393831363933663763383632663166646535313337223b733a33323a226131636131353337393135353032363535383239373735663231363765656361223b733a33323a226639663564376337333030303237396636626565376166613265353036616237223b733a33323a223866353133323865333532643932303937626233333832616538363435356238223b733a33323a223936383132373166313837333965333834326664343563323731363339373563223b733a33323a223236323236613962386639376262663866333165633431646637643534383537223b733a33323a226432303534343631373161393030643434646663333262353338666132303038223b733a33323a223465316138333834303038613430353037343263633463636234333563643332223b733a33323a223766393661356366616161383536666438633461333839333531363136646334223b733a33323a223961376631656539366262376338653461326161343966303939313130643533223b733a33323a223062613738633337303035376137383538306134333661333031653837366463223b733a33323a223063323731613832363261653138653735616433376230393564323465653465223b733a33323a226636316639383739623135326362656134393631336638313266346163333439223b733a33323a223264313538656636653666343233363139306530613065306163343164396135223b733a33323a223461396361646137326635336461616239646266636533333163376466363537223b733a33323a223266333330376336636235363137613065333437343230356338613262316338223b733a33323a223830326134306461626166386166636661646137306161653165356432626333223b733a33323a223462323636316639653864656135653733616235386431316431643062353263223b733a33323a223033626261303434386565363262353639636663353938313831613733323664223b733a33323a226637616339383364623633666161313633386435613261306630343236353363223b733a33323a223834383037666366363335333631313965373665393963393266343334396365223b733a33323a226533343832316230663834303065323264313538393664646163396363616561223b733a33323a223366616639653831306437623033313265643135663636643134343133383833223b733a33323a223236333830313736626530653436383535636134346436623232353965393162223b733a33323a226261623865613237306437333366313730353565383039656666653834663338223b733a33323a223731306232623564393534373533356231616265366435663730656139613766223b733a33323a226461313966653039383462346565663838383764373733373535366363616637223b733a33323a226334376334343633303939383132656662643664316665356335613137393161223b733a33323a223034616230333763626466633566616231396430366130623130623235363162223b733a33323a223936643363633733346561653431613033613030336634386235643834313162223b733a33323a226364666238323561623461396432306263313530373234333231356632636632223b733a33323a223962636131633464333435613431313937623963633231653662333133373165223b733a33323a223462353833303339663031613434376365313466353161323562626631373166223b733a33323a223538323036616437666230396134636439336633633232333364366235633034223b733a33323a226466336539323834666462353837306530613737303236326337633639663434223b733a33323a226434333162323835393939306664633735623835623230356331646330323935223b733a33323a223036333632383036613335643035306165626237653463666361303935386663223b733a33323a226236303832643266363830633930343733363735366563663631626433663266223b733a33323a223065363737646666626362656362353133613033663065366333356134626335223b733a33323a223030363337343632346639383930303161366364356332333938636265376265223b733a33323a223331626433333637373036653139656265326137326233623732393230373333223b733a33323a223132646634306635306462643066616636316365333234353533633366663664223b733a33323a226431373430353164356439383939333930666663656634366533323666343634223b733a33323a223537353666666339343135363031396638653534623961616131343464613036223b733a33323a223363396537326662313733373236393261343161383338303933383730653734223b733a33323a223336633035323331653464643265623033346335633362636464346438613965223b733a33323a223531303632313738386131326265323330613934363161313830303530633631223b733a33323a223165626661636636326263663664336464356164626464663137333535313335223b733a33323a223761653963323432316261306230656163306563353561373831643435393365223b733a33323a223162646261336139383638663832386134373533623266346363616132373833223b733a33323a226666343330626665373331323335353130333563313932383237643132633939223b733a33323a226163313335343565333431643337303936323466346532613838643464353332223b733a33323a223831326534623333633766323435353363303332373536646233663237663835223b733a33323a223836303965303338313134633732386231376438343430663865363236353832223b733a33323a223335663736393534363034646432623637333638666665666264383737376336223b733a33323a226434353632663066303330386661336264653565613236366233313861373431223b733a33323a223162653732343639366633386434323635323939633263336635326136313466223b733a33323a226461636566396639333361626433343035303437396338653661336131366661223b733a33323a223565303538323537623265383530333239306465396234366464336232336432223b733a33323a226234303730336537376333356363626636343738323836356433636431656464223b733a33323a223838316631663435316265313835616164383163653062343266346561613637223b733a33323a226530323362636139353965366636333534613535646165313837396235643861223b733a33323a226363326266623536656635613834636265303164613337653935346436303335223b733a33323a226238626539663461663134333761383739356438646232313938636638666339223b733a33323a223865336139383432623030636433646130383130373838386336333337373261223b733a33323a223731316533356466306338636363633138663561643633643230323561363463223b733a33323a226336376362613439666134663937653338373761313137653838323531313330223b733a33323a226633643236373263383132653039316162633735323564663234346333373362223b733a33323a223266663738653131363531633835616136396466646562643662343162363961223b733a33323a223035363239393338353732393935396232376532653932376164623261373836223b733a33323a223336366532313566376564356530653534336233333736336237643639643161223b733a33323a223433376361353131656433343739323135613365633137396462343639383465223b733a33323a223933306365366665366432636333613933616262306563303963616332646330223b733a33323a223663336634306535393566323830613661613464373133373430376130333239223b733a33323a226337316663323263343866646335636135393239633339626333343430303031223b733a33323a226335623938643936623235313035643838393232366566353439333232383234223b733a33323a223338643264386133653530636132653135343665356666336537316535333965223b733a33323a223230646137343262326139376232643066373261663736383164383636353863223b733a33323a223162636566613539633063663964356339366465313366356530626166303763223b733a33323a226262646166656235393137663532336661343861313062396232356564363666223b733a33323a223265323332366230356131316362653134313932313838343230393334646437223b733a33323a223766303935336432386539363730623838366365343862626161633132323638223b733a33323a223136616634633336633963663736353666333163373638333436623737323961223b733a33323a226330643831323862623231616264393133653865613832333438666162396565223b733a33323a226231653833363739636230633638363331316139623730303163613864643037223b733a33323a226432633163363533346639393963333638663332303366633738646139646465223b733a33323a226337663431663730616339373838396536636239366331343539633736343435223b733a33323a223735643261636438613932306436616533333161623261396139306664303833223b733a33323a223638663761656131653037613539646536316332333665653130376436643265223b733a33323a223136386162643039326432373164373464336139383963653732396230666466223b733a33323a226435346261343463353061613233346234393537313738343031396466643266223b733a33323a226266633338373233666662336335653437663632633637633430353739643339223b733a33323a223237333832323931386136633766623631303666653464613237396666303164223b733a33323a223064633862353134356531613561363130623935366134383735643166323731223b733a33323a223165303232393661636431326638326235303361366637613162646335653936223b733a33323a223230376338623339633836386564356438663062623262373839613266633164223b733a33323a223332643534666532333862316261326666346230663837376230393536666135223b733a33323a223261333564623137656466646361623335346436313666666463633566343161223b733a33323a226663363063306336373736313766376665623135616530386336373830663331223b733a33323a223638613062623530333231386430653037396434663536346664303732653934223b733a33323a223464623232373434646535666166383132366635396234633337643830643638223b733a33323a226566303161383932356337306235626461316632313935623037366430613862223b733a33323a223437343937323133383962323562633635323537353131623630336665613761223b733a33323a223966383564393263396535616663636465643531633530646337643162646532223b733a33323a226532623433383830623232353933363832343732643662626434356333616534223b733a33323a226538383536316532666362643333653531643962643932663335643338663634223b733a33323a226665626639346362656538613064303436636234383936663733666535626134223b733a33323a223830306165376431353866396235343864363861633637373838646165393261223b733a33323a223835366263303030616132346665343561366564653765663230356261356561223b733a33323a226239373366333032386433333963646235326566623264383537346634616637223b733a33323a226366643433636562646138616137346164363733386130646537313233616433223b733a33323a223433353531636638386665626336396130663739616533356438653163353435223b733a33323a223232366639663664303634653463633065643165373734646164643432643164223b733a33323a223636306562633664316365363930386363356139623830303934363931306630223b733a33323a223136656132316266373432313934303233646333323638333938646435356565223b733a33323a226366343861326561663436633663393333616634316431323937303365313663223b733a33323a223034306636613737393366393263363034633063376533363036373364353165223b733a33323a223532643864346130383264303261613231353931636334633262326237383537223b733a33323a223932373238633331313732366133656535376630303138633137646334633263223b733a33323a223738616638393763313036326536316464373661653830626266623464653465223b733a33323a223435386130336166646466313638623134326637666633646231373236376439223b733a33323a223636633763353864616662326264323161373836666562656532316539666361223b733a33323a223333353466346533653532316264383939626265343434383535643463646539223b733a33323a223034306563353963343739656361646264333535643139343632343262663165223b733a33323a223837356262616638643863633062666561636433636231623131353932643336223b733a33323a223437353566393630363937303039633462633331383961333466646430663863223b733a33323a223133373430303139373961633133653736313739363961636534356166333138223b733a33323a226536616137306237333330353634653863663866313638363836616438353534223b733a33323a223632663264613165346236303965353362663130393939636365633739643463223b733a33323a223339336462633566623338306532643236656538366262653039313064633039223b733a33323a226563336337653531383962663761303233643566343562666631623832313564223b733a33323a226337386333613264663364626633373533643164623032336662653733663232223b733a33323a226331366339663534383765653465396532666239623831383561373434633131223b733a33323a223063616265613533326132393765373664646466333133386562653162356239223b733a33323a226665333334353133616662343937383764363639386164306337313365313566223b733a33323a226161303338363035313439333035313536356333303137666663386563643035223b733a33323a226464363561633739373236636561333030646235303131313466623136326537223b733a33323a223663306236353762643566316130653739393431373635653064303030353136223b7d733a343a2268617368223b733a36353a2236633062363537626435663161306537393934313736356530643030303531362d6464363561633739373236636561333030646235303131313466623136326537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31383a7b733a33323a223238666134653438626231626430396263666436373862613635383230313762223b733a33323a223735376363316138306230663435666533363332336561346164353365376534223b733a33323a223732313838353636386530333433383366333436653936633563646235316639223b733a33323a223030313432613861343866326532383639376331376335356438313663303838223b733a33323a223534373432373437353762363130393937383137313538616330356461393936223b733a33323a223033663034626363626137393564376635636239646465336233363961323434223b733a33323a223337393437613635343865653661316439386136313433313238636437653830223b733a33323a226635373431653130366331333731333835346336363438663061316537376631223b733a33323a223137363363666434666539333061326165663965353039323561323031373464223b733a33323a226532636661393064356134336439643137636634336462306134373539323432223b733a33323a223239356131646361376634623032353831643561313564343335366433396434223b733a33323a226637653664663833663231663966386130326135316331336566386534646432223b733a33323a226235353133303866316631353331303332666161613035613235663563303865223b733a33323a226131343564336230323862636163376532653537653336353835643465386265223b733a33323a223439646632663661616436636539353533656664316538363861633766646336223b733a33323a226336633065326337386339376438646236656366383262313034656164366530223b733a33323a226635653137653231666437303634353066363431356533653966656565346264223b733a33323a226239356237613961373232323933346636383561316638333138396563663635223b733a33323a226137643066663361363733616439643838303334636362666638333132653466223b733a33323a226236386135613036613937656364653761323930303965323634623466396230223b733a33323a223232643032306633613138393763353436333937623935376365656335383137223b733a33323a226165383434343466303238663230636131353135653165386331343263386462223b733a33323a226236316461653939383832313237316438373766336163393033613430623636223b733a33323a226266316463656432343463663261393565306261646564363737393036383333223b733a33323a223361656365383438353064363766373836333961633237666332396166616230223b733a33323a223862373136386437656633616262313463393937356639366232396634373163223b733a33323a223162383432363737343739303433373662343965373932316632353335623662223b733a33323a223839353734326562363731616161643630666463626534623132393237363831223b733a33323a226431303764376564633365303430346139306161383230306664623265663536223b733a33323a226434356530666634616266666335623035306532653761646632383132313934223b733a33323a223561303265633730623164633131663731323934313633633463653663396338223b733a33323a223632353338613531343432343432356664303264326130613436366232383434223b733a33323a226164326437333736646533613733343462333931373138313234393130393833223b733a33323a223135636235623766323231396532363530333535396339643131333637366362223b733a33323a223733653233316562303564363466333062623437346539313637656465613564223b733a33323a223930643837333937396631613166353830396136633065636462306463353232223b7d733a343a2268617368223b733a36353a2239306438373339373966316131663538303961366330656364623064633532322d3733653233316562303564363466333062623437346539313637656465613564223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1703018212),
('o4d85hms87qmpgv13llhkfmf83', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313039313036322e3839303533323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22316366747573673065396672636c627267636b6f3762706a6f6b223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039343539393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223430383436316263316639383837333730343862303531366131653833326339223b733a33323a223930396436623338643862663965636462346534313939346638313031623234223b7d733a343a2268617368223b733a36353a2239303964366233386438626639656364623465343139393466383130316232342d3430383436316263316639383837333730343862303531366131653833326339223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1701091062);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('q1lkmvpfn9si9ahpgk11k5gvrj', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303437373634372e3939313637393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f7133693172763939716932307276686a743271393830686261223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303437363438393b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303438303037353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303438313038363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730303438313234373b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223037643932313437653462643362313062646234616637666336626239653333223b733a33323a223963383963313166663532393961613336663762366334663862656339383437223b7d733a343a2268617368223b733a36353a2239633839633131666635323939616133366637623663346638626563393834372d3037643932313437653462643362313062646234616637666336626239653333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33333a7b733a33323a223261356636653337613230346262613737636638323038363365626339633763223b733a33323a223430373337383432336262663461386366356231643432646232326432656237223b733a33323a226164343366303133363561623534323734306364663933333166376139663163223b733a33323a226436333733613836656664353636333162373066386264386366353361386335223b733a33323a223736643436623063643835386166666339386262666266643862383136633466223b733a33323a226232653537623862636662633463616634356635646330393565326266376337223b733a33323a226365616661313038623839656632316533303431356138663333663630393863223b733a33323a223735333835626533366231613234636236363862636431336266646161613637223b733a33323a223436646535633033356330393332346461663062613262383261636530386561223b733a33323a223635326561646565333739363833346265366465346363633930303566346364223b733a33323a226333346332386662303335663134386664613765613466376461343365383961223b733a33323a226639336536366635336233396331396338646161653164626161323236306261223b733a33323a223330656630623263666636626137613835386136656531323661303563646261223b733a33323a223634613566356239326362633236366133623738356634386238376338303735223b733a33323a226661343135616531383332323032386437346438623831323364643230666137223b733a33323a223933313534373935323666633166356165626266636166323163393465643037223b733a33323a226664333361613465393566623039666631343535613336633564353530666638223b733a33323a223362643232343634353264633264643661613636626135333133366261353230223b733a33323a226331386630376463346263643933643935333538376231613963616338656131223b733a33323a223230613635383565313634396464396334383764323336393163303738336335223b733a33323a223239376434643132386232326431303864636663313030343434653165313639223b733a33323a226433323533643064383961623638333835373733363535366537616536613836223b733a33323a223466383539396437343433623830303631343063636231666362306434313234223b733a33323a223733386566373864363436623038663465653937643331633963343464613737223b733a33323a226538646534633930333932656163653863336563323030666230356435356136223b733a33323a223031383836343039366137363938326632636535393962396239663530616635223b733a33323a223462643161656362383366346230353531303036653065643231323735386461223b733a33323a226131376432336332656533366230366663633961366563393033383135333338223b733a33323a223834326465333335646634666464656263396238386139386134383964343637223b733a33323a223933346236353532396434663035656236366434643232376564623161366332223b733a33323a226232393839326633376133373933306337653735306132356263613834623936223b733a33323a226562666235613266353633616337393963363962313263656638636465326433223b733a33323a226265353063393930313038373137636631323466326530623261666533336563223b733a33323a226261646363653464383836393565326330653863613639396365373535613034223b733a33323a223930616566333565336439326639306434666464343464313137316161616362223b733a33323a226266396132343134303633333336646233623133353130383234633739303333223b733a33323a223564626137356136363539666632653832633838336262346362613230623564223b733a33323a223762333131666238376637326533663439616262663933623263363932366664223b733a33323a226539656461306432663836613062373562613734636136306563353430666630223b733a33323a223835663662383265376236316564363239363732386664333863356135306334223b733a33323a223535353961613062306236353463353832626635356162336364613239366439223b733a33323a223031346535383731333436616263656262333335363964333733636530646337223b733a33323a226564373761343139313232616332303439323866643939333431343437366265223b733a33323a226434636162333563646563393138383735626531333339653764653530323239223b733a33323a223835366639393634393362383566613364313837633537613132303130366563223b733a33323a226634326539366663653664653939316238646534303532613464653464306335223b733a33323a226337393436366164346666313738663935613031666636393837313363616539223b733a33323a226234306336346463633966633734643439623037646333326366633863656334223b733a33323a223832346236373763633366373065326532646463306537383863623464663066223b733a33323a226363373932633662343038633537623739343738666561353437646130393062223b733a33323a223432363738663531323837653739323262336237346339396562343339356435223b733a33323a223033396466396165386230303132363531343830666334373134653861643736223b733a33323a226265333933386664343534346537633336613264393335323361323164313763223b733a33323a223337306231636662653535303734313835356331396531626339366665623335223b733a33323a226138613965393136373566666366663134393833643936666538653166666233223b733a33323a223663663263363265363234373635616566623365333937383063353862636233223b733a33323a226230613566623434376166613161633932393466303238336234313763626164223b733a33323a223735353361363662333566613231666663336230643065306538336463383934223b733a33323a226331633137636538313236303531393562306162303265666336316465353730223b733a33323a223661353030323865326664356331366661623265333163353765646366383163223b733a33323a223865653762363036653266326133313036626437373737343536353366353764223b733a33323a226332313532636437323166333835326438373332656331366531623837376332223b733a33323a226335653936393234613666303264633839623562373066383365356362616165223b733a33323a223535636263353933383566353731356637386162656166656665393564333239223b733a33323a226434626334643365303439623132316161366539663861666261363234376533223b733a33323a226238336230336665343562616335393561393764316664363031376234373137223b7d733a343a2268617368223b733a36353a2262383362303366653435626163353935613937643166643630313762343731372d6434626334643365303439623132316161366539663861666261363234376533223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223332653530376363306362303665303736373232653734326632343162616362223b733a33323a223562653632383539323862363161393436623134613061363561656239666165223b733a33323a223561643033343737613339663261616237313961623733303864363262323335223b733a33323a226530316333346362373336303864303162383539383937623535656439346231223b733a33323a223962313765613931663733313965623039306438363965396165373034646561223b733a33323a223662373037313336383964653332326432643266363539623239333663313634223b733a33323a223733386138396639396362383535366165366433303635613739336561386537223b733a33323a223933313136643232623436396635626661646262323933316539393438613165223b733a33323a223039356134613138326130373765323761656138353236656531333666363561223b733a33323a223037623932383436646563323166393964653432633563646535313436656332223b733a33323a226339316336363236366234366162326133373839663231313961303065633434223b733a33323a223964393466343730333237653566303739383836346438646332633936323137223b733a33323a223339303135333437653665323038383431376234356563396231663662653730223b733a33323a223966303632613337313337646138653633626637373064343663353532346132223b733a33323a223632346465386266373938666437383965333565303538313761666433366633223b733a33323a223234633435626537656537363333333331333435386365326339646332636239223b733a33323a226365333435336534666435356137343261376539633961613866343530333530223b733a33323a223535313561653165316533663461323535333463383039383437313062653134223b7d733a343a2268617368223b733a36353a2235353135616531653165336634613235353334633830393834373130626531342d6365333435336534666435356137343261376539633961613866343530333530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223966613138373863666235323931653831363637343531663734333832643039223b733a33323a226661356366303832353132313835663865326633663464363133646638393161223b733a33323a223530636532663561663339643662333766663963303033386532623762396530223b733a33323a223236326664363663323764613934393634656564633865346132643734656366223b733a33323a223531333136353564633138336462333766333363366666346364303833306139223b733a33323a226533643731336434393337303931616164363633643630303961366231636662223b733a33323a223538633936323366386534386463326335326561636438616532643562613832223b733a33323a226262633635616562386237633134303738383466643132313635366133643239223b7d733a343a2268617368223b733a36353a2262626336356165623862376331343037383834666431323136353661336432392d3538633936323366386534386463326335326561636438616532643562613832223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1700477648),
('r6gemblaehe3b5apolbfrv2729', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313039313331332e3436373531333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226f307067376d6966616b72626f6d61686c3730736b3074643676223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039343636333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039343838303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313039343930383b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223430303365636230316536303932613737386531663564353838313163626631223b733a33323a223665633336363966663932303330323366303663373364323734383330386166223b7d733a343a2268617368223b733a36353a2236656333363639666639323033303233663036633733643237343833303861662d3430303365636230316536303932613737386531663564353838313163626631223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226631653039366665613730613339653834373232383638613966313337646266223b733a33323a223935633031346330663730393937363664383830666161633734616136326237223b733a33323a223964316335633665303431653965303234336266366266326232613438323538223b733a33323a223966656137333561366532623066313937653964313563633034386661306630223b7d733a343a2268617368223b733a36353a2239666561373335613665326230663139376539643135636330343866613066302d3964316335633665303431653965303234336266366266326232613438323538223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223436636638316439336531613030666339313235303365613936663133323664223b733a33323a223530386364363762373931356465656161343836323164626462353062656534223b733a33323a223930666136393034393864653432643932333534303135616661346638356565223b733a33323a223236663762393664626566363733306231623264333662646261356433356132223b7d733a343a2268617368223b733a36353a2232366637623936646265663637333062316232643336626462613564333561322d3930666136393034393864653432643932333534303135616661346638356565223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701091313),
('rsfd8ajofg0ism5ccubnntjasu', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313039303939392e3034323734313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267326b733537376432356a726739696a6862666f6e7369716738223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039343430353b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223261313933373562653936313734366132363030353238653139353730396634223b733a33323a226635353361633633386233316632343866653636363063393439356466396334223b733a33323a223031646638653139316430366662353766666661613265656265373162336239223b733a33323a223061653862326335373331383637313536393062643561303366643763666230223b733a33323a223632336665303330333662356139636133623133346239613731366365633663223b733a33323a226662653664343735393533613663613234333833623635373066616161393534223b733a33323a226136663039326534323562303732636161363833383135333633643337643463223b733a33323a226430393633666262323830306339653930626535363536656564666330306536223b7d733a343a2268617368223b733a36353a2264303936336662623238303063396539306265353635366565646663303065362d6136663039326534323562303732636161363833383135333633643337643463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1701090999),
('vm0v9tg30qkbk44rehhou5i5e7', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313337363932382e3337303935383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238646676676f67356b66616a343836666d37396d316537333976223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313337393537363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313338303530363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313338303532373b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226233323730633465653061643764623662653435343037333064323935653732223b733a33323a223536356336613864653365343233623436376535343434376238626166646662223b7d733a343a2268617368223b733a36353a2235363563366138646533653432336234363765353434343762386261666466622d6233323730633465653061643764623662653435343037333064323935653732223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226633346336306430326161316661613332616664343833383136303234633931223b733a33323a226537336137373538363739626433346632303238646261633630623665656338223b733a33323a223739396533353163633532636161373232396465663732353938633332303636223b733a33323a223166616261613333316166383030333365666137303461323166656332383464223b733a33323a226635633365356664356130653438303965323834323531353337376330343431223b733a33323a223665396237396134613532663036336133373039636466643231636431613066223b733a33323a223131636338623038363362313831356339613431383939313166346263633333223b733a33323a223163393530313966643634303466663536613938323965353637373636653730223b733a33323a226562303633613638336462666662353165366530323138633238396330373635223b733a33323a223838383738613635396639633532643030313636326366343039636665353437223b733a33323a226462653362353965666439643661323938613839343462316462643038653337223b733a33323a223964663838313664356338313236383430643864623861386265383762306637223b7d733a343a2268617368223b733a36353a2239646638383136643563383132363834306438646238613862653837623066372d6462653362353965666439643661323938613839343462316462643038653337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223634306334323966393966333535316361323231653931343339613638376430223b733a33323a223639313939356165323537366664393632323865336431663034393038323263223b733a33323a223161646163663633636235373261336566326261316334636163386565653033223b733a33323a226564383461613836353466626538666633623763336337636163333831336430223b733a33323a223261333438643134636439666462636263336365623663613631373234306361223b733a33323a223231643839383336386636653062323439343432656633303032346137666265223b7d733a343a2268617368223b733a36353a2232316438393833363866366530623234393434326566333030323461376662652d3261333438643134636439666462636263336365623663613631373234306361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701376928),
('vm698i6411av31fr3te5eul041', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313039313332362e3139313832373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a396b626b3463346a3066313763693630743332676471667631223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039343931333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223433633735633738613137383966323064383534623934343565626232383238223b733a33323a226135633864396235316630636662386139656365316664616164646663613831223b7d733a343a2268617368223b733a36353a2261356338643962353166306366623861396563653166646161646466636138312d3433633735633738613137383966323064383534623934343565626232383238223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1701091326);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"kinknzakadiri001@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"THYP\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.0.4\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci,
  `navigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  KEY `IDX_694309E47E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `thumbnail_id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(1, NULL, NULL, 1, 'harry-potter', 'default', 'harry potter', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"items\",\"query\":\"\"},\"links\":[]}]', '[]', '2023-10-30 08:03:39', '2023-10-30 08:35:43', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
CREATE TABLE IF NOT EXISTS `site_block_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_236473FEE9ED820C` (`block_id`),
  KEY `IDX_236473FE126F525E` (`item_id`),
  KEY `IDX_236473FEEA9FDD75` (`media_id`),
  KEY `block_position` (`block_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_block_attachment`
--

INSERT INTO `site_block_attachment` (`id`, `block_id`, `item_id`, `media_id`, `caption`, `position`) VALUES
(1, 5, NULL, NULL, '', 1),
(2, 5, NULL, NULL, '', 2),
(3, 5, NULL, NULL, '', 3);

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE IF NOT EXISTS `site_item_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  KEY `IDX_D4CE134F6BD1646` (`site_id`),
  KEY `IDX_D4CE134960278D7` (`item_set_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

DROP TABLE IF EXISTS `site_page`;
CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  KEY `IDX_2F900BD9F6BD1646` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(1, 1, 'welcome', 'Welcome', 1, '2023-10-30 08:03:39', '2023-10-30 08:03:39'),
(2, 1, 'harry-potter-movies', 'harry potter movies', 1, '2023-10-30 08:04:05', '2023-10-30 08:08:55');

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE IF NOT EXISTS `site_page_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C593E731C4663E4` (`page_id`),
  KEY `page_position` (`page_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(1, 1, 'html', '{\"html\":\"    <p>Welcome to your new site. This is an example page.<\\/p>\\r\\n    <ul>\\r\\n        <li>This is a bullet list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ul>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <ol>\\r\\n        <li>This is an ordered list.<\\/li>\\r\\n        <li>Second entry.<\\/li>\\r\\n    <\\/ol>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <blockquote>This is a blockquote.<\\/blockquote>\\r\\n    <p>Back to normal again.<\\/p>\\r\\n    <div><a href=\\\"#\\\">This text is a link, which currently points to nothing.<\\/a><\\/div>\\r\\n    <p><strong>This text is bold, in a &lt;strong&gt; tag.<\\/strong><\\/p>\\r\\n    <p><em>This text is italicized, in an &lt;em&gt; tag.<\\/em><\\/p>\\r\\n    <p><u>This text is underlined, in a &lt;u&gt; tag.<\\/u><\\/p>\\r\\n    <p><s>This text has a strikethrough, in a &lt;s&gt; tag.<\\/s><\\/p>\\r\\n    <p>This text is <sub>subscript<\\/sub> and <sup>superscript<\\/sup> using &lt;sub&gt; and &lt;sup&gt;, which can be used for adding notes and citations.<\\/p>\\r\\n    <hr \\/>\\r\\n    <h1>This is an H1 title. It is bigger than the Page Title, which is rendered in H2.<\\/h1>\\r\\n    <h2>This is an H2 header, the same size as the Page Title.<\\/h2>\\r\\n    <h3>This is an H3 subheader.<\\/h3>\\r\\n    <h4>This is an H4 subheader.<\\/h4>\\r\\n    <h5>This is an H5 subheader.<\\/h5>\\r\\n    <h6>This is an H6 subheader.<\\/h6>\"}', 1),
(2, 1, 'lineBreak', '{\"break_type\":\"opaque\"}', 2),
(3, 1, 'html', '{\"html\":\"    <h2 style=\\\"font-style:italic;\\\">This is the \\\"Italic Title\\\" block style.<\\/h2>\\r\\n    <h3 style=\\\"color:#aaaaaa;font-style:italic;\\\">This is the \\\"Subtitle\\\" block style.<\\/h3>\\r\\n    <div style=\\\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\\\">This is the \\\"Special Container\\\" block style.<\\/div>\\r\\n    <p><span class=\\\"marker\\\">This is the \\\"Marker\\\" inline style. <\\/span><\\/p>\\r\\n    <p><big>This is the \\\"Big\\\" inline style.<\\/big> This is normal text.<\\/p>\\r\\n    <p><small>This text is inside a \\\"small\\\" inline style.<\\/small> This is normal text.<\\/p>\\r\\n    <p><code>This is the \\\"Computer Code\\\" inline style.<\\/code><\\/p>\\r\\n    <p><span dir=\\\"rtl\\\">\\u0644\\u0643\\u0646 \\u0644\\u0627 \\u0628\\u062f \\u0623\\u0646 \\u0623\\u0648\\u0636\\u062d \\u0644\\u0643 \\u0623\\u0646 \\u0643\\u0644 \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0623\\u0641\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0645\\u063a\\u0644\\u0648\\u0637\\u0629 \\u062d\\u0648\\u0644 \\u0627\\u0633\\u062a\\u0646\\u0643\\u0627\\u0631 \\u0627\\u0644\\u0646\\u0634\\u0648\\u0629 \\u0648\\u062a\\u0645\\u062c\\u064a\\u062f \\u0627\\u0644\\u0623\\u0644\\u0645 \\u064a\\u0639\\u0631\\u0636 \\u0647\\u0630\\u0627 \\u0627\\u0644\\u0646\\u0635 \\u0645\\u0646 \\u0627\\u0644\\u064a\\u0645\\u064a\\u0646 \\u0625\\u0644\\u0649 \\u0627\\u0644\\u064a\\u0633\\u0627\\u0631.<\\/span><\\/p>\"}', 3),
(4, 2, 'pageTitle', '[]', 1),
(5, 2, 'itemShowCase', '{\"thumbnail_type\":\"large\",\"show_title_option\":\"item_title\"}', 2);

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE IF NOT EXISTS `site_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  KEY `IDX_C0401D6FA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(1, 1, 1, 'admin');

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE IF NOT EXISTS `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `IDX_64D05A53F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'kinknzakadiri001@gmail.com', 'kenza', '2023-10-16 14:37:28', '2023-10-16 14:37:28', '$2y$10$nzVhQJgweofj1DJSLLI.2Oq.mG090Yf94P8tjk7csgLhFt0X1FXRm', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'samuel', '2023-11-27 13:05:18', '2023-11-27 13:21:47', '$2y$10$qCSIWvdy47D0zzYTKNpovO461vlJsYUyA8hKnxEXAb5i5rQf429yC', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`user_id`),
  KEY `IDX_C779A692A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

DROP TABLE IF EXISTS `value`;
CREATE TABLE IF NOT EXISTS `value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `uri` longtext COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  KEY `IDX_1D77583489329D25` (`resource_id`),
  KEY `IDX_1D775834549213EC` (`property_id`),
  KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  KEY `value` (`value`(190)),
  KEY `uri` (`uri`(190))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(19, 10, 1, NULL, NULL, 'literal', '', 'sportif3', NULL, 1),
(20, 10, 211, NULL, NULL, 'literal', '', ' Michael', NULL, 1),
(21, 10, 210, NULL, NULL, 'literal', '', 'Michael Phelps', NULL, 1),
(22, 10, 212, NULL, NULL, 'literal', '', ' 30 juin 1985', NULL, 1),
(23, 10, 213, NULL, NULL, 'literal', '', ' Natation', NULL, 1),
(24, 10, 214, NULL, NULL, 'literal', '', 'Or', NULL, 1),
(25, 10, 217, NULL, NULL, 'literal', '', '8 médailles d\'or en natation', NULL, 1),
(26, 11, 1, NULL, NULL, 'literal', '', 'sportif2', NULL, 1),
(27, 11, 211, NULL, NULL, 'literal', '', 'Usain', NULL, 1),
(28, 11, 210, NULL, NULL, 'literal', '', 'Usain Bolt', NULL, 1),
(29, 11, 212, NULL, NULL, 'literal', '', '21 août 1986', NULL, 1),
(30, 11, 213, NULL, NULL, 'literal', '', 'Athlétisme', NULL, 1),
(31, 11, 214, NULL, NULL, 'literal', '', 'Or', NULL, 1),
(32, 11, 217, NULL, NULL, 'literal', '', '9,58 secondes (100 mètres)', NULL, 1),
(33, 12, 1, NULL, NULL, 'literal', '', 'sportif1', NULL, 1),
(34, 12, 210, NULL, NULL, 'literal', '', 'Hicham ', NULL, 1),
(35, 12, 212, NULL, NULL, 'literal', '', 'El Guerrouj', NULL, 1),
(36, 12, 213, NULL, NULL, 'literal', '', '14 septembre 1974 ', NULL, 1),
(37, 12, 214, NULL, NULL, 'literal', '', 'courses de fond ', NULL, 1),
(38, 12, 217, NULL, NULL, 'literal', '', 'OR', NULL, 1),
(41, 11, 216, NULL, NULL, 'literal', '', ' Pékin, Chine', NULL, 1),
(42, 10, 216, NULL, NULL, 'literal', '', 'Pékin, Chine', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

DROP TABLE IF EXISTS `value_annotation`;
CREATE TABLE IF NOT EXISTS `value_annotation` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE IF NOT EXISTS `vocabulary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  KEY `IDX_9099C97B7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(6, 1, 'https://faceDetection.univ-paris8.fr/onto/Fd', 'Fd', 'FaceDetections', ''),
(7, 1, 'https://olympic.univ-paris8.fr/onto/olympics', 'JO', 'Jeux Olympiques', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
