-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 18, 2016 at 06:33 PM
-- Server version: 5.5.50-0ubuntu0.14.04.1
-- PHP Version: 5.5.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `suitecrm_hrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_audit`
--

CREATE TABLE IF NOT EXISTS `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_bugs`
--

CREATE TABLE IF NOT EXISTS `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cases`
--

CREATE TABLE IF NOT EXISTS `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_contacts`
--

CREATE TABLE IF NOT EXISTS `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_cstm`
--

CREATE TABLE IF NOT EXISTS `accounts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_opportunities`
--

CREATE TABLE IF NOT EXISTS `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_actions`
--

CREATE TABLE IF NOT EXISTS `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_actions`
--

INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('1052e0c0-d70b-21bb-ba19-5804966682ba', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'import', 'RT_Increment_History', 'module', 90, 0),
('110fc074-4712-4182-4918-58047f216f7c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'jjwg_Markers', 'module', 90, 0),
('124dfefd-ee7c-4c33-0982-58047f89d96b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'FP_events', 'module', 90, 0),
('12c59acd-23ec-f6aa-b208-58047f40788c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOS_Invoices', 'module', 89, 0),
('12e7db97-529e-1045-6f6b-58047fbd40fc', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'jjwg_Markers', 'module', 90, 0),
('134a1b00-8808-8f49-fe06-580496cb7dd1', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'export', 'RT_Increment_History', 'module', 90, 0),
('1355097a-5781-3698-4023-58047f84b722', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Tasks', 'module', 90, 0),
('143d0a41-6b72-0c46-00a0-58047ffb9f94', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'FP_events', 'module', 90, 0),
('14b48c66-8c59-061b-859a-58047fe2facd', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOS_Invoices', 'module', 90, 0),
('157a97f8-9257-9366-c608-58047fb68b75', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'jjwg_Markers', 'module', 90, 0),
('15d50662-d026-93b1-896d-58047f39a617', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'EmailMarketing', 'module', 89, 0),
('160c85c1-2aa1-fdf8-a648-5804962d171d', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'massupdate', 'RT_Increment_History', 'module', 90, 0),
('162b740e-4071-4a1c-e774-58047f4742f3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'FP_events', 'module', 90, 0),
('165f0e2c-1d7c-08d4-36a2-58047fe46e33', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOS_Invoices', 'module', 90, 0),
('1778a3c4-a011-2877-19d6-58047ff9bb32', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'jjwg_Markers', 'module', 90, 0),
('186aa731-3106-395b-91d5-58047f7a7e64', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'FP_events', 'module', 90, 0),
('188bb45e-1f51-391f-030b-58047f6bc8af', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOS_Invoices', 'module', 90, 0),
('195c468e-82db-c3d6-5a69-58047fcd45fb', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'jjwg_Markers', 'module', 90, 0),
('1a20306b-7070-0c80-511f-58047fb04f84', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'FP_events', 'module', 90, 0),
('1a2ddecc-38e0-2b46-c3f5-58047fe400d0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOS_Invoices', 'module', 90, 0),
('1ae7972b-ddb1-ad4b-9bf4-58047f8c831e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Leads', 'module', 89, 0),
('1bb3a96d-69fa-8204-f485-58047fca491e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'jjwg_Markers', 'module', 90, 0),
('1be81188-d6a0-8e7d-4c86-58047f37f99f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOS_Invoices', 'module', 90, 0),
('1c3d058b-fdc1-c7ec-e925-58047f3c997c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'FP_events', 'module', 90, 0),
('1cc9def1-871b-283d-b23e-58047fb739bb', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Alerts', 'module', 89, 0),
('1cdf84ad-ee81-2bdd-16e5-5809b4ea3da1', '2016-10-21 06:23:31', '2016-10-21 06:23:31', '1', '1', 'access', 'RT_Performance_Reviews', 'module', 89, 0),
('1d98568a-d751-5c7b-2b67-58047f96e42f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'jjwg_Markers', 'module', 90, 0),
('1d9c86e1-1d8b-61f3-3c6f-58047f01ea3b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOS_Invoices', 'module', 90, 0),
('1e03d5df-c495-6fe5-c8bd-58047fc7f8fa', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'FP_events', 'module', 90, 0),
('1e15fc1a-2c03-de95-a4d5-58047fc66483', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Alerts', 'module', 90, 0),
('1eae7f6f-3f30-cc56-5433-58049630655e', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'access', 'RT_Payroll', 'module', 89, 0),
('1f6d3c3c-4780-e55c-02db-58047fc63c5f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOS_Invoices', 'module', 90, 0),
('1fd1e3c9-c3d2-ac5a-15be-58047f15fedc', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Alerts', 'module', 90, 0),
('21540d9e-8499-3614-8c0b-58047fa034a8', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Leads', 'module', 90, 0),
('2180ef54-885a-bd99-80f2-58047f9d1d68', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Alerts', 'module', 90, 0),
('229ee51f-935f-e964-3675-58047f4b53b6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Leads', 'module', 90, 0),
('23107fd6-bc88-72d6-188c-580496a7a824', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'view', 'RT_Payroll', 'module', 90, 0),
('23439c85-0433-1e61-4233-58047f59a2c6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Alerts', 'module', 90, 0),
('23d55d84-a441-e626-f756-58047f9c56ba', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Leads', 'module', 90, 0),
('24dfa56b-57dd-8ea5-7bee-58047f40f358', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Alerts', 'module', 90, 0),
('2556f04d-5cbf-b427-b176-58047f4bcc36', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Leads', 'module', 90, 0),
('26510b43-4721-df88-6dd2-58047f3ea740', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Alerts', 'module', 90, 0),
('26ce1d99-b30e-8f43-2fe4-58047fa66a8e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Leads', 'module', 90, 0),
('27518d0d-db16-c851-eb7b-580496d4e81e', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'list', 'RT_Payroll', 'module', 90, 0),
('27739a7b-e865-c408-ceec-58047f4c32d3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'jjwg_Areas', 'module', 89, 0),
('27f970f2-3d58-1acc-ead8-58047f496dd3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Alerts', 'module', 90, 0),
('281194d2-87fb-a474-8219-58047f7c91ce', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Leads', 'module', 90, 0),
('286e3320-eeb0-92c8-6c1a-58047fa7dead', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'FP_Event_Locations', 'module', 89, 0),
('294a1397-e883-cf4f-3ff8-58047fc11df6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Leads', 'module', 90, 0),
('297da5c9-841c-aa56-de03-58047fd141ed', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'jjwg_Areas', 'module', 90, 0),
('2a6f91e1-1f74-96df-ce11-58047f4e6bed', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'FP_Event_Locations', 'module', 90, 0),
('2b574a4a-1e94-3e9e-9fcc-580496cfac51', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'edit', 'RT_Payroll', 'module', 90, 0),
('2b6f9a14-4caf-5ae1-9e5e-58047fe77cbe', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOS_PDF_Templates', 'module', 89, 0),
('2ba47295-b557-2744-af00-58047f4fccc1', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'jjwg_Areas', 'module', 90, 0),
('2c690fc7-5a8c-0b3b-2182-58047f666983', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOS_Contracts', 'module', 90, 0),
('2ca031f7-6bd8-a25d-2a78-58047f89e410', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Contacts', 'module', 89, 0),
('2cd06955-e5c2-4ce9-c86e-58047f2c3c09', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'FP_Event_Locations', 'module', 90, 0),
('2da28b87-8f6c-930f-7324-58047fdfb810', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOS_PDF_Templates', 'module', 90, 0),
('2dd03754-232f-aa7f-8bc2-58047fbc90ac', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'jjwg_Areas', 'module', 90, 0),
('2dda0791-bf78-b19a-fc81-58047ffc4a85', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'EmailMarketing', 'module', 90, 0),
('2e4c4046-d354-aa80-2817-58047f206af1', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Contacts', 'module', 90, 0),
('2ea917bf-3e9b-d806-b815-58047f5ab4f3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'FP_Event_Locations', 'module', 90, 0),
('2f00ae79-74db-77bf-3b8c-58049625fe97', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'delete', 'RT_Payroll', 'module', 90, 0),
('2fb73d2c-ac9c-6832-e61e-58047f630eba', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOS_PDF_Templates', 'module', 90, 0),
('30039245-064a-389e-125e-58047f252a85', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'jjwg_Areas', 'module', 90, 0),
('303a627f-0804-602c-5a69-58047fd04076', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Contacts', 'module', 90, 0),
('309b0121-7c45-3b7f-c8f7-58047fe47d1e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Tasks', 'module', 90, 0),
('310a039c-311c-4355-760a-58047f78c0ba', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'FP_Event_Locations', 'module', 90, 0),
('3193b6bc-3b1a-9820-1681-58047f2dfbe6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOS_PDF_Templates', 'module', 90, 0),
('32184bb8-2ba8-e561-c3eb-58047f310897', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Contacts', 'module', 90, 0),
('32698a9f-a79e-a58c-6841-58047fbb63dc', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Documents', 'module', 89, 0),
('32bf5561-36a3-3993-b7d2-58047fcf3418', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'jjwg_Areas', 'module', 90, 0),
('32c80935-3c79-65c1-1496-580496ac6074', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'import', 'RT_Payroll', 'module', 90, 0),
('32f1732d-c5a9-d148-7bdd-58047f01c355', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'FP_Event_Locations', 'module', 90, 0),
('3377f82e-114e-8551-fb07-58047f92379c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOS_PDF_Templates', 'module', 90, 0),
('33d1d22e-08b1-1e23-f8b1-58047fc80ed2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Contacts', 'module', 90, 0),
('34475641-b4f2-4120-6302-58047f9fa927', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Documents', 'module', 90, 0),
('3553ac19-f88f-2dd6-2792-58047f581cfa', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'FP_Event_Locations', 'module', 90, 0),
('3556411c-2040-4ccb-e633-58047f0dab11', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Contacts', 'module', 90, 0),
('358c6e64-f5b8-2896-16a1-58047f9f771e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOS_PDF_Templates', 'module', 90, 0),
('35ce9cb7-b6ef-3ef2-96eb-58047f9bb4da', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Documents', 'module', 90, 0),
('35ef7d70-86c5-2259-9d18-58049652ae5a', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'export', 'RT_Payroll', 'module', 90, 0),
('36d7e6b2-2f64-d2cd-3fae-5809b4b2e82b', '2016-10-21 06:23:31', '2016-10-21 06:23:31', '1', '1', 'view', 'RT_Performance_Reviews', 'module', 90, 0),
('371dc56e-24a6-2f4e-0585-58047f324ed4', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'FP_Event_Locations', 'module', 90, 0),
('3721e84d-c739-c960-c097-58047ffce7e1', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Contacts', 'module', 90, 0),
('3744f02b-764f-b85f-29fb-58047f0f7af9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Documents', 'module', 90, 0),
('37ac628b-c027-c14d-5b4c-58047f2f5861', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOS_PDF_Templates', 'module', 90, 0),
('386e8d25-9560-a85b-3aab-58047fb12af3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'jjwg_Areas', 'module', 90, 0),
('38e1daee-cf9b-3908-90c4-58047ff646ab', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Contacts', 'module', 90, 0),
('38f225a5-3f5c-ba60-253c-58047f07600e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Documents', 'module', 90, 0),
('391cf3e4-eb19-aed7-000f-5804969687a2', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'massupdate', 'RT_Payroll', 'module', 90, 0),
('39548b1c-2913-80fe-66ea-58047f2699ef', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOS_PDF_Templates', 'module', 90, 0),
('3a5e873e-5174-df21-8037-58047f69fab6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Documents', 'module', 90, 0),
('3a85c1f9-eeb2-2e78-5c08-58047f6e4260', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Cases', 'module', 89, 0),
('3ad9d975-1138-fea0-734c-5809b421eca7', '2016-10-21 06:23:31', '2016-10-21 06:23:31', '1', '1', 'list', 'RT_Performance_Reviews', 'module', 90, 0),
('3ae43ae7-1b29-be4d-5cec-58047f0f2430', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'jjwg_Areas', 'module', 90, 0),
('3c338c4a-1cbc-6578-d7a1-58047f851792', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Documents', 'module', 90, 0),
('3c598802-6283-d928-5419-58047f907288', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Cases', 'module', 90, 0),
('3da4ae2e-1606-ee87-a944-58047fd62a77', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Documents', 'module', 90, 0),
('3dd9ee9d-c070-058b-cea5-58047f2b8a22', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Cases', 'module', 90, 0),
('3f35b588-e1d5-31e9-eddd-5809b4a4ebde', '2016-10-21 06:23:31', '2016-10-21 06:23:31', '1', '1', 'edit', 'RT_Performance_Reviews', 'module', 90, 0),
('3f591247-9a3f-f537-5dda-58047f0bfff0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Cases', 'module', 90, 0),
('409b9560-d116-5262-fb5f-58047f4b1304', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Cases', 'module', 90, 0),
('41da2556-b9f2-4152-cd3d-58047fbd3b02', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Cases', 'module', 90, 0),
('41e6cef0-8b21-797f-a1e2-58047f128b58', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOD_IndexEvent', 'module', 89, 0),
('437f60d0-3384-3e71-3cda-58047f093732', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Cases', 'module', 90, 0),
('4383b379-4db5-82d1-d22c-5809b479bfb2', '2016-10-21 06:23:31', '2016-10-21 06:23:31', '1', '1', 'delete', 'RT_Performance_Reviews', 'module', 90, 0),
('43ce5109-85cc-b001-237b-58047fe5f8a9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOD_IndexEvent', 'module', 90, 0),
('43ddee14-06c5-f6bf-262c-58047fa55e64', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOS_Product_Categories', 'module', 89, 0),
('445d5cd9-a7c4-0489-c802-580496de05a1', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'access', 'RT_Employees', 'module', 89, 0),
('45218d49-ac9f-48bc-2f43-58047f938e70', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'jjwg_Address_Cache', 'module', 89, 0),
('45384394-bc5a-68df-6168-58047fab07d6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Cases', 'module', 90, 0),
('45e86f1b-c253-8bf9-e142-58047f56556f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOD_IndexEvent', 'module', 90, 0),
('461504d4-98cf-533c-e5cd-58047ff8074e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOS_Product_Categories', 'module', 90, 0),
('473687bf-4f8d-5717-76ec-58049679be77', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'view', 'RT_Employees', 'module', 90, 0),
('475108d6-bd5a-083e-4b71-5809b480af42', '2016-10-21 06:23:31', '2016-10-21 06:23:31', '1', '1', 'import', 'RT_Performance_Reviews', 'module', 90, 0),
('47abab6d-d2ee-f30c-84c2-58047f72610e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOD_IndexEvent', 'module', 90, 0),
('47affb56-15b8-6e41-78aa-58047fe03abf', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'jjwg_Address_Cache', 'module', 90, 0),
('48994253-d2cf-c7aa-f2e9-58047f07b89a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOS_Product_Categories', 'module', 90, 0),
('49c348e0-a9ac-77dc-bc69-58047f1d70e5', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOD_IndexEvent', 'module', 90, 0),
('4a020a08-5dde-f504-37e5-58047f9684ed', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Tasks', 'module', 90, 0),
('4a240bb0-4a9a-ec38-a7ff-58047f42806c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'jjwg_Address_Cache', 'module', 90, 0),
('4a7fb8d3-0961-89be-de9b-58047f78659c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOS_Product_Categories', 'module', 90, 0),
('4aa81f4d-54a1-ede0-6bf8-580496df702a', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'list', 'RT_Employees', 'module', 90, 0),
('4b7de128-25c0-397b-7e22-5809b46e03f1', '2016-10-21 06:23:31', '2016-10-21 06:23:31', '1', '1', 'export', 'RT_Performance_Reviews', 'module', 90, 0),
('4b896ae4-fbde-e2ef-8bb3-58047fda2569', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOD_IndexEvent', 'module', 90, 0),
('4c202c04-acd6-0396-6aba-58047f9feb12', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Accounts', 'module', 89, 0),
('4c4c1ae2-97cd-2f97-2bd1-58047fb39499', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'jjwg_Address_Cache', 'module', 90, 0),
('4cf32f9d-5f0b-4a0d-7f08-58047ffea520', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOS_Product_Categories', 'module', 90, 0),
('4df1eb0e-5781-e234-401f-5804969d047d', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'edit', 'RT_Employees', 'module', 90, 0),
('4e2052dc-06db-1cba-61be-58047f87ec60', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Accounts', 'module', 90, 0),
('4e730e64-6369-9453-553b-58047fb37e23', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'EmailMarketing', 'module', 90, 0),
('4e7ea013-4996-6ed3-a462-58047f0ab187', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOD_IndexEvent', 'module', 90, 0),
('4f19ad23-e5c0-cb7d-465d-5809b4204b78', '2016-10-21 06:23:31', '2016-10-21 06:23:31', '1', '1', 'massupdate', 'RT_Performance_Reviews', 'module', 90, 0),
('4f1d8015-73c2-50a1-d09d-58047f738468', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'jjwg_Address_Cache', 'module', 90, 0),
('4f3ec586-ec7f-634d-a025-58047f720387', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOS_Product_Categories', 'module', 90, 0),
('500a0be2-263c-25b1-fe96-5804967efed5', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'view', 'RT_Increment_History', 'module', 90, 0),
('5049d8be-b76b-da25-83ea-58047f4d53dc', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Accounts', 'module', 90, 0),
('511c371c-2fc5-0331-a3bc-5804965389b3', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'delete', 'RT_Employees', 'module', 90, 0),
('516a5dbf-a196-e502-c651-58047ff892a2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOD_IndexEvent', 'module', 90, 0),
('519f6a5a-cdb1-8101-51ff-58047f446e72', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOS_Product_Categories', 'module', 90, 0),
('519f77af-700c-6d6c-8a6e-58047f16603a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'jjwg_Address_Cache', 'module', 90, 0),
('51d18e21-5e25-6ebd-b5a2-58047fbc8a71', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Accounts', 'module', 90, 0),
('5340643f-d2f0-1ad0-4741-58047fc0c7b1', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Accounts', 'module', 90, 0),
('53bce321-f3c3-b2a7-3d53-58047f19df21', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOS_Product_Categories', 'module', 90, 0),
('53c9de8b-f67f-3d8a-bf8a-58047fa5679a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'jjwg_Address_Cache', 'module', 90, 0),
('5413b93c-c2a3-e0b1-d2de-5804962b7c94', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'import', 'RT_Employees', 'module', 90, 0),
('5512d3d8-fd26-3457-8975-58047fa71e76', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Accounts', 'module', 90, 0),
('55de0749-945a-63a1-3366-58047fa73f2a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Bugs', 'module', 89, 0),
('56440fb2-d745-741b-684a-58047f881ee9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'jjwg_Address_Cache', 'module', 90, 0),
('56922e06-8496-80cf-a684-58047f545a6d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Accounts', 'module', 90, 0),
('56fc38b8-d90e-5ca8-2302-580496aa0df9', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'export', 'RT_Employees', 'module', 90, 0),
('573b43b7-0628-c33b-a741-58047fd0e0c3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Bugs', 'module', 90, 0),
('57f42837-bee0-d602-c477-58047ff97fc4', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Accounts', 'module', 90, 0),
('587df1d5-01c7-466f-6f41-58047ff70ea8', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Bugs', 'module', 90, 0),
('5a0e4dc1-6888-a37c-0dc8-58047f764cff', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Bugs', 'module', 90, 0),
('5a436866-c576-22e1-890f-580496ac0b65', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'massupdate', 'RT_Employees', 'module', 90, 0),
('5a507114-6fbb-8063-a7c7-58047f7c09b1', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Spots', 'module', 89, 0),
('5b698612-fa78-915c-947c-58047fd58823', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Bugs', 'module', 90, 0),
('5bbfd80c-8a50-0f32-0992-58047f3a192b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Spots', 'module', 90, 0),
('5bcc5477-31ed-fc0d-30e9-58047f85df52', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOD_Index', 'module', 89, 0),
('5cafd924-0ad5-52f8-0fcf-58047fa93e64', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Bugs', 'module', 90, 0),
('5d7dab69-ecb6-3fbc-312d-58047f94d1f3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Spots', 'module', 90, 0),
('5ddbcca7-ae59-8b4b-2dce-58047fc134a9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOD_Index', 'module', 90, 0),
('5e043161-d21a-a3f3-1619-58047fdb38da', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Bugs', 'module', 90, 0),
('5e6c5bfa-3ccb-99d4-0fae-58047fa29b77', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOS_Products', 'module', 89, 0),
('5ef5f13c-9616-3832-d0b8-58047f0b5b50', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Spots', 'module', 90, 0),
('5f430546-f697-b0a6-76ee-58047f0b6264', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Bugs', 'module', 90, 0),
('5f990311-c2e9-a421-638e-58047fd9e5e9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOD_Index', 'module', 90, 0),
('6048080f-50f5-25e5-860b-58047f3a7417', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOS_Products', 'module', 90, 0),
('60d033f1-62d4-ac9a-885b-58047fff5dbd', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Spots', 'module', 90, 0),
('614f5aad-04ed-ec41-23e5-58047fcb73e0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Calls_Reschedule', 'module', 89, 0),
('61d3825b-ac7f-3ed9-412f-58047fa2e925', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOD_Index', 'module', 90, 0),
('625d1089-fc61-0a69-067a-58047f46fea8', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOS_Products', 'module', 90, 0),
('630b0aa6-7d91-4eaf-fe1b-58047f5ead26', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Spots', 'module', 90, 0),
('631c05c4-fd7d-a890-90f2-58047f8dc9fc', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Tasks', 'module', 90, 0),
('637759a2-68a2-b13d-f5bb-580496e31c8e', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'access', 'RT_Bonus', 'module', 89, 0),
('63811fea-19c0-9db9-0e75-58047fbeec86', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOD_Index', 'module', 90, 0),
('63e03032-333a-5663-d7c0-58047fcf0063', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Calls_Reschedule', 'module', 90, 0),
('645269f2-b75f-6553-02f6-58047fb4048c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOS_Products', 'module', 90, 0),
('64d58a50-1cda-7f83-24ec-58047fb082f7', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Spots', 'module', 90, 0),
('65e68472-6e4e-de05-1eb0-58047f232951', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOD_Index', 'module', 90, 0),
('662aec17-3daf-daea-a38f-58047f6222b9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOS_Products', 'module', 90, 0),
('6664e8da-fe35-9bb7-427a-58047f5d308b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Calls_Reschedule', 'module', 90, 0),
('6684b60c-8c32-b6aa-4c7c-58047f404882', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Spots', 'module', 90, 0),
('66b7d4d3-8171-4d09-fa42-5804968cd84d', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'view', 'RT_Bonus', 'module', 90, 0),
('67deabe4-f713-6ba8-5bca-58047f95c9df', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOD_Index', 'module', 90, 0),
('67fd2e91-f4b5-da16-3d65-58047f71abe6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOS_Products', 'module', 90, 0),
('6885b847-7333-b426-55d5-58047f69cec7', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Calls_Reschedule', 'module', 90, 0),
('68d0a3ac-0d1b-64d5-3df7-58047fb05e98', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Opportunities', 'module', 89, 0),
('69b5e352-3348-fcaf-3058-580496bfb109', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'list', 'RT_Bonus', 'module', 90, 0),
('6a0c4ae0-a76a-9007-06d5-58047f5980fa', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOD_Index', 'module', 90, 0),
('6a185c8e-d5a4-a4af-9a5a-58047f3dea3c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOS_Products', 'module', 90, 0),
('6a89abcc-64f2-8de2-db1b-58047f1d5108', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Calls_Reschedule', 'module', 90, 0),
('6a9a91f1-3f21-0175-5d37-58047fe04a8b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Opportunities', 'module', 90, 0),
('6c1d2d87-5feb-875a-aa0f-58047f14946e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOS_Products', 'module', 90, 0),
('6c25e4cb-5ec2-4245-abdc-58047f7b5319', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Opportunities', 'module', 90, 0),
('6cbdb646-938d-c5a0-5a1f-5804969bc5be', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'edit', 'RT_Bonus', 'module', 90, 0),
('6cca4594-8186-5680-318b-58047f0647c8', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Calls_Reschedule', 'module', 90, 0),
('6cdb66c2-5676-d5b7-32b4-58047ffc9b9f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Users', 'module', 89, 0),
('6dc4314a-2c14-e4e9-7d7e-58047f6f4ed1', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Opportunities', 'module', 90, 0),
('6dff68d5-a380-6573-a848-58047ffecf96', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Users', 'module', 90, 0),
('6f247b54-0c4a-eea8-73a4-58047f725ed9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Opportunities', 'module', 90, 0),
('6f7c9ea1-2753-3475-138e-58047f474fe6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Users', 'module', 90, 0),
('6f9f6217-2e70-648a-1de1-580496f6136b', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'delete', 'RT_Bonus', 'module', 90, 0),
('70542220-7cd9-2ba8-8605-58047fe3c98a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Calls_Reschedule', 'module', 90, 0),
('70dc74ad-28fd-1468-27c3-58047fb1cb49', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Opportunities', 'module', 90, 0),
('711aab4c-d777-69d9-7b69-58047fdfe847', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Users', 'module', 90, 0),
('717f037c-046e-3a09-78af-58047fb3e3e0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'EmailMarketing', 'module', 90, 0),
('72866286-f7b4-9835-bfee-58047f61fd5c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Users', 'module', 90, 0),
('72954a24-d535-0c54-ddae-58047fa68f6b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Opportunities', 'module', 90, 0),
('72bca9db-1546-92b1-d6ea-58047f9cbfe9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Calls_Reschedule', 'module', 90, 0),
('7324e732-40c6-9a5b-fd2e-5804964133a6', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'import', 'RT_Bonus', 'module', 90, 0),
('73e47356-7c62-3f79-4c73-58047f9dcc9b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Users', 'module', 90, 0),
('73e9711d-5982-996a-23d5-58246e24a97a', '2016-11-10 12:55:01', '2016-11-10 12:55:01', '1', '1', 'access', 'RT_Departments', 'module', 89, 0),
('746f97de-2ade-445f-102d-58047f1286dc', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Opportunities', 'module', 90, 0),
('74985a06-4826-58b4-c992-58047f739251', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOP_Case_Events', 'module', 89, 0),
('754c1f31-bd7c-0d72-a814-58047f0ceeed', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Users', 'module', 90, 0),
('761687b9-5629-03f0-48da-580496a1ff98', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'export', 'RT_Bonus', 'module', 90, 0),
('766d623d-81ed-0b8c-6abd-58047ff3a420', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOP_Case_Events', 'module', 90, 0),
('76e3cb05-d3be-3cb5-d9d7-58047f256dda', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Users', 'module', 90, 0),
('78516540-40f5-4a5e-6c23-58047f1146b0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOP_Case_Events', 'module', 90, 0),
('79185196-49dd-007a-8406-58047f63c22b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'EAPM', 'module', 89, 0),
('798e5b9c-be55-838b-8bc6-58049649fa36', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'massupdate', 'RT_Bonus', 'module', 90, 0),
('79ea0a0e-1441-4248-f14f-58047f2e4d4b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'SecurityGroups', 'module', 89, 0),
('79eb8fc6-4445-7300-f95f-58047f5bb8e5', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOP_Case_Events', 'module', 90, 0),
('7ae40a5e-ae35-e277-7bda-58047f5ce1d4', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'EAPM', 'module', 90, 0),
('7ba320b8-b561-7d46-9e12-58047ff87e9e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOP_Case_Events', 'module', 90, 0),
('7ca46fc2-d027-c48d-d883-58047fb09cb1', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'EAPM', 'module', 90, 0),
('7cb49cf1-2b51-f455-e426-58047ff1f558', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'SecurityGroups', 'module', 90, 0),
('7d8953cc-bd36-fdfd-4483-58047f05a6b6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOP_Case_Events', 'module', 90, 0),
('7e6441f7-b7aa-4e2c-bb6e-58047f1f1b21', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'EAPM', 'module', 90, 0),
('7eb80009-7a89-2fa1-f4f8-5804963db5e5', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'list', 'RT_Increment_History', 'module', 90, 0),
('7eb9584e-9404-1101-c1a4-58047f0ceb06', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'SecurityGroups', 'module', 90, 0),
('7fec427c-c95b-ca8d-3c45-58047f10fa85', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'EAPM', 'module', 90, 0),
('80a9162f-7964-9299-b7db-58047fd44e31', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'SecurityGroups', 'module', 90, 0),
('81012a38-7932-6051-2181-58047f93927b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOP_Case_Events', 'module', 90, 0),
('81c2716c-8efc-daf1-3fb2-58047f30b41c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'EAPM', 'module', 90, 0),
('81fccbaa-d99d-8600-8e68-580496f40d06', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'access', 'RT_Leaves', 'module', 89, 0),
('82e7fc88-c387-ff22-a735-58047fbee33c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'SecurityGroups', 'module', 90, 0),
('83066849-d264-ba8f-42b3-58047f9247b7', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'EmailTemplates', 'module', 89, 0),
('83485f66-7875-d59c-6cff-58047f46377d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'EAPM', 'module', 90, 0),
('83b84972-876c-af4b-52da-58047f08f30e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOP_Case_Events', 'module', 90, 0),
('847c73e1-0401-fc1f-7a0e-58047f3d6f88', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'EmailTemplates', 'module', 90, 0),
('8514084b-abf0-1dd2-0b33-58047f562236', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'EAPM', 'module', 90, 0),
('85ac4c7b-084e-6f06-2747-5804960af2b2', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'view', 'RT_Leaves', 'module', 90, 0),
('85fdb0ef-e25b-bf91-ddfa-58047fd0aef2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'SecurityGroups', 'module', 90, 0),
('861b633a-9370-34e8-2c8f-58047f02be2a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Project', 'module', 89, 0),
('8640934e-8896-6f37-8e3f-58047fdae23c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'EmailTemplates', 'module', 90, 0),
('884b5516-f6b1-f4a1-20c5-58047f5bbc65', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'EmailTemplates', 'module', 90, 0),
('885a0787-e154-cb0f-921d-58047f8ecafa', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Project', 'module', 90, 0),
('88840ad4-9aba-904e-9c53-58047ff3783b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'SecurityGroups', 'module', 90, 0),
('896de20f-4a76-5e71-a066-5804964f6feb', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'list', 'RT_Leaves', 'module', 90, 0),
('89db732e-ecc6-f7b4-9b8e-58047f509f20', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Project', 'module', 90, 0),
('8a10ab77-b88b-2038-2681-58047f0ea406', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'EmailTemplates', 'module', 90, 0),
('8ab7be96-b704-1d38-37c8-58047f4ff7e7', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'SecurityGroups', 'module', 90, 0),
('8b29922e-296b-1950-2345-58089899baa6', '2016-10-20 10:11:52', '2016-10-20 10:11:52', '1', '1', 'access', 'RT_Candidates', 'module', 89, 0),
('8b47bf02-42aa-b6e1-e6a3-58047fd90b46', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Project', 'module', 90, 0),
('8b7f214e-3089-5304-f1da-58047fe214ec', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'EmailTemplates', 'module', 90, 0),
('8bda0828-456b-78e0-6678-58047f097887', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'EmailMarketing', 'module', 90, 0),
('8cb45bbf-e0df-9d05-66f0-58047f5fa50c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Project', 'module', 90, 0),
('8ce2c9c3-108e-0b95-396d-58047f2a3f49', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'EmailTemplates', 'module', 90, 0),
('8d1fa683-bda6-c0dd-98ad-58246e20f7d7', '2016-11-10 12:55:01', '2016-11-10 12:55:01', '1', '1', 'view', 'RT_Departments', 'module', 90, 0),
('8da9607b-24ab-e977-5619-58047fd1b764', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOS_Quotes', 'module', 89, 0),
('8e6c3e74-971c-0e4e-eab0-58047f8e3201', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOP_Case_Updates', 'module', 89, 0),
('8e6d00a7-9aa0-b67a-253b-58047f3cc1f3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'EmailTemplates', 'module', 90, 0),
('8e726570-f79c-1997-5e55-58047fd35b94', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Project', 'module', 90, 0),
('8f421790-b598-c7ca-75bc-580496b10173', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'edit', 'RT_Leaves', 'module', 90, 0),
('8ff30550-38ce-7768-1407-58047febfc57', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOS_Quotes', 'module', 90, 0),
('901f4f1c-0f87-1f22-bce6-58047fd3732d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Project', 'module', 90, 0),
('9062b5f5-bdc8-f629-d432-58047f8a6e70', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOP_Case_Updates', 'module', 90, 0),
('90774a1f-50d7-a10c-93ea-58246e860cb6', '2016-11-10 12:55:01', '2016-11-10 12:55:01', '1', '1', 'list', 'RT_Departments', 'module', 90, 0),
('91b3f696-5dc0-8dbe-4085-58047f737807', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Project', 'module', 90, 0),
('91e2cabc-ac51-943c-3e6c-58047fbd1dcb', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOS_Quotes', 'module', 90, 0),
('9217121e-f37a-5f66-8caa-58047fcee3da', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOP_Case_Updates', 'module', 90, 0),
('935f2d32-4fb7-9ffd-8315-58047f602e3c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'OutboundEmailAccounts', 'module', 89, 0),
('93b00e7e-08c7-cda0-6ad9-58047f2505a9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOS_Quotes', 'module', 90, 0),
('93e638c1-9798-ba14-db57-58047fc30cfc', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOP_Case_Updates', 'module', 90, 0),
('949da066-423e-ba32-b1e0-58246ec1b5da', '2016-11-10 12:55:01', '2016-11-10 12:55:01', '1', '1', 'edit', 'RT_Departments', 'module', 90, 0),
('94c02941-8e8f-4803-650e-5804967f967b', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'delete', 'RT_Leaves', 'module', 90, 0),
('94d3406f-665e-e2cf-feee-58047fb62190', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Notes', 'module', 89, 0),
('957642cc-6f0c-d3e9-5327-58047f4d072a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOS_Quotes', 'module', 90, 0),
('9586f5ae-7d8f-5923-6b67-58047fe92011', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AM_ProjectTemplates', 'module', 89, 0),
('95b8a711-6c4f-7e09-829e-58047fdadb61', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'OutboundEmailAccounts', 'module', 90, 0),
('95fc9db1-a7b9-4abe-d6aa-58047fd3f2f2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOP_Case_Updates', 'module', 90, 0),
('96723835-9993-d1d3-f903-58047f4b8048', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Notes', 'module', 90, 0),
('974c00ee-d189-4a3e-babf-58047f098803', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AM_ProjectTemplates', 'module', 90, 0),
('97978978-34eb-f3c5-be46-58246ec54cdd', '2016-11-10 12:55:01', '2016-11-10 12:55:01', '1', '1', 'delete', 'RT_Departments', 'module', 90, 0),
('97a68b06-89ef-8e64-0bb2-58047f380063', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'OutboundEmailAccounts', 'module', 90, 0),
('97ba577c-22f0-718f-222c-58047ff0b80e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOS_Quotes', 'module', 90, 0),
('97c28fe5-dc0d-b6c7-9e81-58047f268c9c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOP_Case_Updates', 'module', 90, 0),
('9877fad4-2686-1dda-0a47-58047f0948c2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Notes', 'module', 90, 0),
('98949675-0b5c-6c99-7721-5804962e0b4e', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'import', 'RT_Leaves', 'module', 90, 0),
('98dce06e-a746-5349-bfb1-58047fbe2021', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AM_ProjectTemplates', 'module', 90, 0),
('999c2ffb-6858-122b-deab-58047f62d207', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOS_Quotes', 'module', 90, 0),
('99a0ee47-3fc1-f705-858e-58047feca1e7', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOP_Case_Updates', 'module', 90, 0),
('99ccdd46-2b1c-f5d9-5d80-58047ff53ac0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'OutboundEmailAccounts', 'module', 90, 0),
('9a563d28-8912-f4f5-71ad-58047f4ad3d4', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Notes', 'module', 90, 0),
('9aaec8f8-9754-9741-a2cb-58047f5991da', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AM_ProjectTemplates', 'module', 90, 0),
('9abc4073-ca67-00eb-b428-58246ef27766', '2016-11-10 12:55:01', '2016-11-10 12:55:01', '1', '1', 'import', 'RT_Departments', 'module', 90, 0),
('9b64a65b-6851-3621-7b70-58047fed6fb2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOS_Quotes', 'module', 90, 0),
('9b8d6942-908e-e509-1ad5-58047f9f1e60', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOP_Case_Updates', 'module', 90, 0),
('9bc7cb4c-559f-2dc1-eb88-58047fe7406b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'OutboundEmailAccounts', 'module', 90, 0),
('9bdb5a83-4a96-1251-6f63-58047f75c352', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Notes', 'module', 90, 0),
('9be1ed83-b2bf-97bb-0e4e-58233369419c', '2016-11-09 14:33:33', '2016-11-09 14:33:33', '1', '1', 'access', 'RT_Increment_Histroy', 'module', 89, 0),
('9c48c03e-b1d5-b310-d0a5-58047f1c9b68', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AM_ProjectTemplates', 'module', 90, 0),
('9d79c92f-cc35-1e75-eddc-58047f4e5093', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Notes', 'module', 90, 0),
('9dabd66f-fca8-629c-bf69-58047f418103', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'ProjectTask', 'module', 89, 0),
('9dae76bd-4f39-9b9d-f1d4-58047f103eeb', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'OutboundEmailAccounts', 'module', 90, 0),
('9ddf4638-e7d6-fc6e-e7a3-58246e62d9ab', '2016-11-10 12:55:01', '2016-11-10 12:55:01', '1', '1', 'export', 'RT_Departments', 'module', 90, 0),
('9e2741e4-9d67-151e-7952-58047ffdda48', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AM_ProjectTemplates', 'module', 90, 0),
('9e7538c4-2ed3-7bb1-0e10-580496c3b992', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'export', 'RT_Leaves', 'module', 90, 0),
('9f227a6f-5a41-71fe-dfa5-58047f42e145', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Notes', 'module', 90, 0),
('9f61e7e8-c84f-9408-fe84-58047fb1f5fd', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'ProjectTask', 'module', 90, 0),
('9f81adcd-63f4-c1a7-3cb5-58047f31a2e4', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'OutboundEmailAccounts', 'module', 90, 0),
('9faeedc1-9686-dfa2-41c1-58047f950ac2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AM_ProjectTemplates', 'module', 90, 0),
('a0adfa67-bdad-6780-7dfe-58047fb5f96e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Notes', 'module', 90, 0),
('a0b6d3f6-6284-e29d-f8cb-580898c57b31', '2016-10-20 10:11:52', '2016-10-20 10:11:52', '1', '1', 'view', 'RT_Candidates', 'module', 90, 0),
('a0b9b48d-7f06-6423-f63e-58047f7503cb', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'ProjectTask', 'module', 90, 0),
('a0fc3138-393e-6519-a914-58246eba233d', '2016-11-10 12:55:01', '2016-11-10 12:55:01', '1', '1', 'massupdate', 'RT_Departments', 'module', 90, 0),
('a147d547-6c77-4842-bca2-58047f600cf2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AM_ProjectTemplates', 'module', 90, 0),
('a1a48958-237c-49de-c34f-58047fabf26d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'OutboundEmailAccounts', 'module', 90, 0),
('a221a5da-2f8c-8203-8ffa-58047f6be24e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'ProjectTask', 'module', 90, 0),
('a2b9b6b5-a27c-7df2-3fd0-5804961e0b3e', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'massupdate', 'RT_Leaves', 'module', 90, 0),
('a370f2d1-db4b-2ca2-fad6-58047f58646a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'ProjectTask', 'module', 90, 0),
('a42f4dd5-0a4d-921b-84e9-580898875c55', '2016-10-20 10:11:52', '2016-10-20 10:11:52', '1', '1', 'list', 'RT_Candidates', 'module', 90, 0),
('a4f287dd-d559-713b-ad0e-5829d1bdc86a', '2016-11-14 15:01:51', '2016-11-14 15:01:51', '1', '1', 'access', 'RT_SalarySetting', 'module', 89, 0),
('a5418f32-99ae-7d87-4501-58047f33c209', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'ProjectTask', 'module', 90, 0),
('a6bb0f62-1bf0-c478-ae9a-58047f1c4676', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'EmailMarketing', 'module', 90, 0),
('a6fd6418-b779-b7ca-5f14-58047f016cf6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'ProjectTask', 'module', 90, 0),
('a7536505-b022-b8aa-32cf-58047f0f7acf', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOR_Reports', 'module', 89, 0),
('a7bb5f27-83ee-1767-df59-580898677c34', '2016-10-20 10:11:52', '2016-10-20 10:11:52', '1', '1', 'edit', 'RT_Candidates', 'module', 90, 0),
('a8ab1d5e-71ab-a22a-66a5-58047fb3dd96', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOW_WorkFlow', 'module', 89, 0),
('a8d8d873-f30b-1fd2-22aa-58047f6f25a0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'ProjectTask', 'module', 90, 0),
('a92f1951-9347-d56e-7bc9-58047fd73d17', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOR_Reports', 'module', 90, 0),
('a93bc8c1-3ac5-92f2-9df5-58047f681819', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'TemplateSectionLine', 'module', 89, 0),
('aa167c9d-5169-3834-2230-58047f6fdcf7', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Calls', 'module', 89, 0),
('aa705b97-2f04-98d1-a2d6-58047f9b36d3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AM_TaskTemplates', 'module', 89, 0),
('aa8e9173-4465-a536-7dd0-58047f432a07', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOW_WorkFlow', 'module', 90, 0),
('ab418e5c-4789-166d-582f-58047f62b0cd', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'TemplateSectionLine', 'module', 90, 0),
('ab545710-f6b6-94ae-8ca5-58047f96ee49', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOR_Reports', 'module', 90, 0),
('ab6c5f0a-7152-c2f3-027d-58259a7c4dfd', '2016-11-11 10:17:12', '2016-11-11 10:17:12', '1', '1', 'access', 'RT_Pay_Tracker', 'module', 89, 0),
('ab9005c5-69b2-9b32-1374-5804967fb022', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'edit', 'RT_Increment_History', 'module', 90, 0),
('ab9c7b0f-b42e-7305-c1c1-580898c28b79', '2016-10-20 10:11:52', '2016-10-20 10:11:52', '1', '1', 'delete', 'RT_Candidates', 'module', 90, 0),
('aba2fe05-8104-54ca-724c-58047f96d6dd', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Calls', 'module', 90, 0),
('ac262438-eaf7-d376-6c48-580895037236', '2016-10-20 10:00:02', '2016-10-20 10:00:02', '1', '1', 'access', 'RT_Qualifications', 'module', 89, 0),
('ac3363e4-5ee1-010a-ea81-58047ff0f340', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AM_TaskTemplates', 'module', 90, 0),
('ac36f759-c6b5-5132-cdde-580496d99df1', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'access', 'RT_Deductables', 'module', 89, 0),
('ac4434c4-06db-5f29-cdb7-58047f0f8fb7', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOW_WorkFlow', 'module', 90, 0),
('acf4adf3-d2d2-b15f-04c7-58047ffd7d32', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOR_Reports', 'module', 90, 0),
('ad000105-56de-ff04-0b09-58047f6d8af7', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Calls', 'module', 90, 0),
('ad1adfec-6e87-7839-c2ac-58047f65438f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'TemplateSectionLine', 'module', 90, 0),
('ae200ca7-14af-13fe-4df1-58047fbf48a9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOS_Contracts', 'module', 90, 0),
('ae2ca3f6-64ca-6328-255f-58047f234326', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AM_TaskTemplates', 'module', 90, 0),
('ae370e7e-422a-f951-0afe-58047f4b0397', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOW_WorkFlow', 'module', 90, 0),
('aec8a1e8-597b-2e65-c07f-58047f1e067b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Calls', 'module', 90, 0),
('aedcf180-4dd6-0930-d077-58047f9803b8', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOR_Reports', 'module', 90, 0),
('aeff9588-46f9-fa1b-3294-5808988ad3d4', '2016-10-20 10:11:52', '2016-10-20 10:11:52', '1', '1', 'import', 'RT_Candidates', 'module', 90, 0),
('af25fca1-b879-a734-21c5-58047fd37361', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'TemplateSectionLine', 'module', 90, 0),
('afdedf4c-b5e1-b388-25b4-58047f86c30f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AM_TaskTemplates', 'module', 90, 0),
('b02cce81-7ce1-bf06-b0cd-58047f4f8727', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Calls', 'module', 90, 0),
('b04f9183-6418-cab0-4f90-58047f8c7862', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOW_WorkFlow', 'module', 90, 0);
INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('b0ad42e8-4311-225c-6aad-58047fad9f46', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOR_Reports', 'module', 90, 0),
('b0bf3397-6c5b-028d-c5db-580496dbaec6', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'view', 'RT_Deductables', 'module', 90, 0),
('b0f3b9b1-2c71-22b9-e094-582333e3cd29', '2016-11-09 14:33:33', '2016-11-09 14:33:33', '1', '1', 'view', 'RT_Increment_Histroy', 'module', 90, 0),
('b1303ac4-d5d5-f1b0-af06-58047f8848ad', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'TemplateSectionLine', 'module', 90, 0),
('b16b6c9c-3a49-8edf-2a18-58047f3f659c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AM_TaskTemplates', 'module', 90, 0),
('b1c9728c-043a-65c2-8310-58047f8cf76b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Calls', 'module', 90, 0),
('b22322dd-a8ba-4233-82dd-58047f970520', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOW_WorkFlow', 'module', 90, 0),
('b233d3c8-9f87-2905-9093-580898e32a07', '2016-10-20 10:11:52', '2016-10-20 10:11:52', '1', '1', 'export', 'RT_Candidates', 'module', 90, 0),
('b2c4e4e4-70d1-5f37-32a4-58047f9058ae', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOR_Reports', 'module', 90, 0),
('b32d17c1-6234-e171-e2f9-58047f057d1f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AM_TaskTemplates', 'module', 90, 0),
('b349b5e6-a3e6-8346-68af-58047f23f8ae', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'TemplateSectionLine', 'module', 90, 0),
('b3622271-dcea-3ac3-d0a8-58047fb7a6b0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Calls', 'module', 90, 0),
('b413e134-8c06-502d-0330-58047f43c23e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOW_WorkFlow', 'module', 90, 0),
('b424c51e-a1e0-58dc-34a0-582333b3e959', '2016-11-09 14:33:33', '2016-11-09 14:33:33', '1', '1', 'list', 'RT_Increment_Histroy', 'module', 90, 0),
('b4879304-ab3f-f823-3485-580496296dde', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'list', 'RT_Deductables', 'module', 90, 0),
('b49d5b88-9f33-1303-8a9c-58047fa631cb', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOR_Reports', 'module', 90, 0),
('b4b931a6-7ca2-2eff-07c4-58047fe0736d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AM_TaskTemplates', 'module', 90, 0),
('b4c38a0a-97b6-c58f-5156-58047f74047a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Calls', 'module', 90, 0),
('b548375d-6f25-705c-7a9b-58047f9a5a9c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'TemplateSectionLine', 'module', 90, 0),
('b5834c25-fc00-5c9a-2d4b-580898dc59cd', '2016-10-20 10:11:52', '2016-10-20 10:11:52', '1', '1', 'massupdate', 'RT_Candidates', 'module', 90, 0),
('b611bc76-e624-8813-fba7-58047fdc7847', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Campaigns', 'module', 89, 0),
('b67be469-2398-054d-c69e-58047f36843d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AM_TaskTemplates', 'module', 90, 0),
('b72ef39a-ed16-5a95-0a36-58047fd196a0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Campaigns', 'module', 90, 0),
('b739ea1f-d4d3-8d8b-5642-582333aaea46', '2016-11-09 14:33:33', '2016-11-09 14:33:33', '1', '1', 'edit', 'RT_Increment_Histroy', 'module', 90, 0),
('b73dc0f8-4fd6-6cfa-777d-58047f281a4b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOW_WorkFlow', 'module', 90, 0),
('b774b024-b4d3-0cf2-1e06-58047f12f577', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'TemplateSectionLine', 'module', 90, 0),
('b837e3c1-864c-cc28-1d54-5804966b1cb3', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'edit', 'RT_Deductables', 'module', 90, 0),
('b86c6246-8c1d-458e-034a-58047f089f83', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Campaigns', 'module', 90, 0),
('b9b4b4a1-06cc-1a21-056b-58047f3b70ca', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Campaigns', 'module', 90, 0),
('bba16cc0-acff-a281-292f-58047f18a06c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Campaigns', 'module', 90, 0),
('bc305202-3d1f-48fd-533b-580496de0df2', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'delete', 'RT_Deductables', 'module', 90, 0),
('bcdc5070-3d6d-2062-178e-58047f2aaaed', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Campaigns', 'module', 90, 0),
('bd1aed0d-3fd1-bce1-90f1-582333c1f598', '2016-11-09 14:33:33', '2016-11-09 14:33:33', '1', '1', 'delete', 'RT_Increment_Histroy', 'module', 90, 0),
('bd3b1e34-66a7-268b-289f-580895463c2c', '2016-10-20 10:00:02', '2016-10-20 10:00:02', '1', '1', 'view', 'RT_Qualifications', 'module', 90, 0),
('be102c22-afbf-3398-6bbe-58047ff70c88', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Campaigns', 'module', 90, 0),
('bf4994eb-dc2d-18b3-0f50-58047f1e738c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Emails', 'module', 89, 0),
('bf4b3ae7-5f73-8188-05db-58047fa10ca3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Campaigns', 'module', 90, 0),
('bf853132-a30b-fbbf-51a7-580496c85a6b', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'import', 'RT_Deductables', 'module', 90, 0),
('c022df24-6de0-90f4-564a-5829d1963c48', '2016-11-14 15:01:51', '2016-11-14 15:01:51', '1', '1', 'view', 'RT_SalarySetting', 'module', 90, 0),
('c0b35d30-3917-9c88-73d7-5808950214f9', '2016-10-20 10:00:02', '2016-10-20 10:00:02', '1', '1', 'list', 'RT_Qualifications', 'module', 90, 0),
('c1016f31-bf7d-a101-b0f2-58047f7b361f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Emails', 'module', 90, 0),
('c20705d3-6812-d905-1b4b-58233335ba9e', '2016-11-09 14:33:33', '2016-11-09 14:33:33', '1', '1', 'import', 'RT_Increment_Histroy', 'module', 90, 0),
('c2170e30-c4fe-3b2c-9f08-58047fadf300', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'EmailMarketing', 'module', 90, 0),
('c2e8a419-28df-e278-13a9-580496feb60a', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'export', 'RT_Deductables', 'module', 90, 0),
('c2ffeaee-3e50-5d53-2410-58047fb609e2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Emails', 'module', 90, 0),
('c3c34fdb-e442-ec3f-3891-5808958b11a6', '2016-10-20 10:00:02', '2016-10-20 10:00:02', '1', '1', 'edit', 'RT_Qualifications', 'module', 90, 0),
('c3fa2f44-91c6-fdca-33dc-58047f2c43b3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOK_Knowledge_Base_Categories', 'module', 89, 0),
('c47dc8fc-9cfa-68ce-5bd0-58047f7aa877', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Emails', 'module', 90, 0),
('c502f512-7ef7-0d04-a308-5829d1202ba2', '2016-11-14 15:01:51', '2016-11-14 15:01:51', '1', '1', 'list', 'RT_SalarySetting', 'module', 90, 0),
('c53d9066-d463-10ec-0dd0-58047fb5aa86', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOW_Processed', 'module', 89, 0),
('c63d6b9a-4a5b-50d7-8b86-5804963bbb29', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'massupdate', 'RT_Deductables', 'module', 90, 0),
('c64ef205-dc0c-5f71-d4b3-58047f6d26c2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Emails', 'module', 90, 0),
('c6783d2d-75bf-09b4-12d2-5823334e006f', '2016-11-09 14:33:33', '2016-11-09 14:33:33', '1', '1', 'export', 'RT_Increment_Histroy', 'module', 90, 0),
('c72c50d4-23f9-5053-516f-5808954fd48d', '2016-10-20 10:00:02', '2016-10-20 10:00:02', '1', '1', 'delete', 'RT_Qualifications', 'module', 90, 0),
('c7383568-b24b-469c-2711-58047fa7422c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('c7de12c8-7a4a-fab8-b030-58047f50b59f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Emails', 'module', 90, 0),
('c8dae0bb-e698-3df5-ad18-58047f907c6b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOW_Processed', 'module', 90, 0),
('c94f600d-a64f-0c4a-2eb1-58047fc52eb2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Emails', 'module', 90, 0),
('c96e90bb-8b5a-088a-c2c7-58047f98794c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('ca6d64c8-d491-b8b6-4b04-5829d1a1a873', '2016-11-14 15:01:51', '2016-11-14 15:01:51', '1', '1', 'edit', 'RT_SalarySetting', 'module', 90, 0),
('ca8c9742-1914-687d-a6b5-5823330a6c48', '2016-11-09 14:33:33', '2016-11-09 14:33:33', '1', '1', 'massupdate', 'RT_Increment_Histroy', 'module', 90, 0),
('cabfb6ca-7a65-e0a1-5a54-580895c228e4', '2016-10-20 10:00:02', '2016-10-20 10:00:02', '1', '1', 'import', 'RT_Qualifications', 'module', 90, 0),
('cb3856b5-1d4c-38ad-3a34-58047f5db8e4', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Emails', 'module', 90, 0),
('cb8edbda-1520-ad53-8aa5-58259af6aa74', '2016-11-11 10:17:12', '2016-11-11 10:17:12', '1', '1', 'view', 'RT_Pay_Tracker', 'module', 90, 0),
('cbcb8cd5-6b2c-85b6-e1c3-58047f972da8', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('cbf62bff-1e8a-0fc5-b318-58047fc1ce02', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'ProspectLists', 'module', 89, 0),
('cc032f8b-1b08-ef1c-1999-58047f83de28', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOW_Processed', 'module', 90, 0),
('cd9faa3b-7df2-a039-8788-58047fc36559', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'ProspectLists', 'module', 90, 0),
('cddd9f61-0985-7bf0-d6f2-580895ceec2a', '2016-10-20 10:00:02', '2016-10-20 10:00:02', '1', '1', 'export', 'RT_Qualifications', 'module', 90, 0),
('ce21d027-7b36-7c58-9dde-58047f498530', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('ce4d1262-e6ee-248a-ecdb-5804964fa114', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'access', 'RT_Appraisals', 'module', 89, 0),
('cecfa054-e33b-b533-dd45-58047f7b7634', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOW_Processed', 'module', 90, 0),
('cf1558c4-4373-3da6-b937-58047faab44e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'ProspectLists', 'module', 90, 0),
('cf3915c1-f774-ad1f-78e5-58259ab9d1d1', '2016-11-11 10:17:12', '2016-11-11 10:17:12', '1', '1', 'list', 'RT_Pay_Tracker', 'module', 90, 0),
('cfdfe3bd-0161-fa6d-7176-58047f9c6aae', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOR_Scheduled_Reports', 'module', 89, 0),
('d0805fd9-660d-6c41-064c-58047f26e269', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'ProspectLists', 'module', 90, 0),
('d1052e59-a80b-832c-49c5-5808955d5cd2', '2016-10-20 10:00:02', '2016-10-20 10:00:02', '1', '1', 'massupdate', 'RT_Qualifications', 'module', 90, 0),
('d11a30e1-2728-312d-b47b-58047fc76947', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOW_Processed', 'module', 90, 0),
('d1a40040-9717-15c4-66c6-58047f1bb761', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('d1b7ee95-1530-de44-9abc-580496cad08e', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'view', 'RT_Appraisals', 'module', 90, 0),
('d251f9d8-a096-d7e0-5b74-58047f98c06e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'ProspectLists', 'module', 90, 0),
('d2aa7575-4a12-8828-1527-58047f24443d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOR_Scheduled_Reports', 'module', 90, 0),
('d2d59edf-0023-e188-7121-58259afd711e', '2016-11-11 10:17:12', '2016-11-11 10:17:12', '1', '1', 'edit', 'RT_Pay_Tracker', 'module', 90, 0),
('d316c852-7ac9-f521-9bb6-5829d13ffc3b', '2016-11-14 15:01:51', '2016-11-14 15:01:51', '1', '1', 'delete', 'RT_SalarySetting', 'module', 90, 0),
('d3ce3be4-4841-c793-8b38-58047f13e2d0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'ProspectLists', 'module', 90, 0),
('d3d4310b-c309-a4eb-4cc9-58047f942599', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('d442d0f6-9057-6afb-41e6-58047f0d404b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOW_Processed', 'module', 90, 0),
('d4b2ac07-f033-8a7d-6efa-58047f15f8fd', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOR_Scheduled_Reports', 'module', 90, 0),
('d5252370-aca3-e795-ff82-58047fdf0549', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'ProspectLists', 'module', 90, 0),
('d565920d-00ca-4f55-c95e-580496d075fb', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'list', 'RT_Appraisals', 'module', 90, 0),
('d6355abf-f33e-7e76-4d64-58259a4c0795', '2016-11-11 10:17:12', '2016-11-11 10:17:12', '1', '1', 'delete', 'RT_Pay_Tracker', 'module', 90, 0),
('d648388a-574a-3459-ade5-58047f274926', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOW_Processed', 'module', 90, 0),
('d6899784-2b0e-1b16-306b-58047f8b7f43', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'ProspectLists', 'module', 90, 0),
('d69b5187-629a-1ca6-6bd4-58047fe50ce5', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOR_Scheduled_Reports', 'module', 90, 0),
('d6bdb21d-9f00-b385-0666-58047fa6f106', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOK_Knowledge_Base_Categories', 'module', 90, 0),
('d8437336-9777-809e-4d58-58047fdee551', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOW_Processed', 'module', 90, 0),
('d87d0128-5985-1594-c2d3-580496d08cd5', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'delete', 'RT_Increment_History', 'module', 90, 0),
('d8878de6-1516-9cff-9391-58047f1b277a', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOR_Scheduled_Reports', 'module', 90, 0),
('d89f77d8-a12b-17a7-2845-580496395534', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'edit', 'RT_Appraisals', 'module', 90, 0),
('d94f0ece-2aa2-cbeb-b806-58047f145a76', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'EmailMarketing', 'module', 90, 0),
('d957a1a3-6bed-e27f-10c3-58259a14bfee', '2016-11-11 10:17:12', '2016-11-11 10:17:12', '1', '1', 'import', 'RT_Pay_Tracker', 'module', 90, 0),
('d9b822f2-0cd0-f470-1dce-5829d1f91589', '2016-11-14 15:01:51', '2016-11-14 15:01:51', '1', '1', 'import', 'RT_SalarySetting', 'module', 90, 0),
('da885a2b-14aa-7d4c-aa33-58047faa8af6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Meetings', 'module', 89, 0),
('daa7d00a-2aba-5202-e092-58047fcd70a5', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOR_Scheduled_Reports', 'module', 90, 0),
('dc39a34a-9d25-4b99-b0d3-580496119ea5', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'delete', 'RT_Appraisals', 'module', 90, 0),
('dc51c1e7-1849-cfcd-7043-58047ffbc114', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Meetings', 'module', 90, 0),
('dc6662b6-87e6-504f-a3aa-58047fde7ef8', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOR_Scheduled_Reports', 'module', 90, 0),
('dc7f89ae-2e3a-dd2d-d2ab-58259ad96bb0', '2016-11-11 10:17:12', '2016-11-11 10:17:12', '1', '1', 'export', 'RT_Pay_Tracker', 'module', 90, 0),
('ddb1b1ec-96ac-b9a1-8b12-58047f96b59d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Meetings', 'module', 90, 0),
('de73dc43-2c05-614b-7767-58047f924eba', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOR_Scheduled_Reports', 'module', 90, 0),
('df65f520-e750-1433-3fb6-58047feb2a54', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Meetings', 'module', 90, 0),
('df73dd56-913f-cd31-4729-58047f88b7b7', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOK_KnowledgeBase', 'module', 89, 0),
('dfa2064a-35e2-e827-c92a-5829d102c68c', '2016-11-14 15:01:51', '2016-11-14 15:01:51', '1', '1', 'export', 'RT_SalarySetting', 'module', 90, 0),
('dfb10053-1d7e-2395-b0da-5804966d8579', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'import', 'RT_Appraisals', 'module', 90, 0),
('e0b0db7e-437f-d5c3-22eb-58047f0aee50', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Prospects', 'module', 89, 0),
('e0e240ed-c2d8-7d31-290f-58047f99d3c6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Meetings', 'module', 90, 0),
('e1017dbf-024b-ec51-e5ad-58259a1ecf04', '2016-11-11 10:17:12', '2016-11-11 10:17:12', '1', '1', 'massupdate', 'RT_Pay_Tracker', 'module', 90, 0),
('e11bdb79-5fea-4539-e339-58047fae28a4', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOK_KnowledgeBase', 'module', 90, 0),
('e237e5f7-5d71-461b-4304-58047f05bf1b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Prospects', 'module', 90, 0),
('e268a73c-dbdd-b634-518f-58047f48e0b3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Meetings', 'module', 90, 0),
('e2e72ec2-8899-0d47-8424-5804964480f3', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'export', 'RT_Appraisals', 'module', 90, 0),
('e327df6a-f945-bfdd-2e70-58047fc77386', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOK_KnowledgeBase', 'module', 90, 0),
('e3cd4679-4987-dcaf-9e69-58047f966df3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Prospects', 'module', 90, 0),
('e3df74b9-a999-23ba-da4c-58047fbfb92d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Meetings', 'module', 90, 0),
('e502a18b-719a-2193-4418-58047ff0c307', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOK_KnowledgeBase', 'module', 90, 0),
('e53320d3-3efa-20d6-a946-58047f107306', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Prospects', 'module', 90, 0),
('e54e43bc-16c1-bab6-a051-58047fed09f9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Meetings', 'module', 90, 0),
('e55f3655-fd63-239f-9098-5829d1e3f8d5', '2016-11-14 15:01:51', '2016-11-14 15:01:51', '1', '1', 'massupdate', 'RT_SalarySetting', 'module', 90, 0),
('e5888c29-99da-bbf3-08f2-58047f9d4bfe', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'jjwg_Maps', 'module', 89, 0),
('e604e08d-8c62-205a-bec8-5804962ffdfa', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'massupdate', 'RT_Appraisals', 'module', 90, 0),
('e6ad8a91-293d-2795-83cb-58047fe9c0d6', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'Prospects', 'module', 90, 0),
('e71809a1-d43a-980b-3bf3-58047ff26d15', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOK_KnowledgeBase', 'module', 90, 0),
('e7610706-054d-68c3-e19c-58047f74a837', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'jjwg_Maps', 'module', 90, 0),
('e7c9745e-7c68-7ee2-0010-58047f8b8982', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'AOS_Contracts', 'module', 89, 0),
('e85cd423-026e-c060-2917-58047f5c5f30', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'Prospects', 'module', 90, 0),
('e87e19ff-a45a-8f54-f7a3-580496c57f9b', '2016-10-17 09:14:49', '2016-10-17 09:14:49', '1', '1', 'access', 'RT_Increment_History', 'module', 89, 0),
('e8c314fe-c4e0-ae5d-6465-58047f8a28ab', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOK_KnowledgeBase', 'module', 90, 0),
('e9d397cb-6b98-1d87-ac28-58047fb6a71d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'Prospects', 'module', 90, 0),
('e9e2fb02-3b1d-ee02-84c6-58047f20062d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'jjwg_Maps', 'module', 90, 0),
('ea1843ba-cd9e-47e9-afa6-58047f467345', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'AOS_Contracts', 'module', 90, 0),
('ea5e435c-63b9-58de-f7ae-58047f724ee9', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'AOK_KnowledgeBase', 'module', 90, 0),
('eb447adf-6257-7b8f-af2f-58047f76e788', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'Prospects', 'module', 90, 0),
('ebecbf79-c24f-026b-5bcc-58047f664488', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'jjwg_Maps', 'module', 90, 0),
('ec41043d-b4a7-ea53-ddf7-58047fd1c704', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'AOK_KnowledgeBase', 'module', 90, 0),
('ec4eeb66-5e46-8a3d-ed0b-58047f225a1d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'AOS_Contracts', 'module', 90, 0),
('ededcde8-ef6b-af94-5268-58047fa99a82', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'jjwg_Maps', 'module', 90, 0),
('ee92d07e-314a-7f92-1a7f-58047fc27a31', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'Tasks', 'module', 89, 0),
('ee93d213-1c71-455c-281b-58047fdaf01c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'AOS_Contracts', 'module', 90, 0),
('efd743c8-3780-344a-2642-58047fbae4f2', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'jjwg_Maps', 'module', 90, 0),
('f05a7adc-ea2f-2ca7-b909-58047f57d087', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'view', 'Tasks', 'module', 90, 0),
('f0bc54a0-f493-08c0-bceb-58047f56f81f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'delete', 'AOS_Contracts', 'module', 90, 0),
('f1300a11-c087-b436-d1fd-58047f6ca6e0', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'jjwg_Markers', 'module', 89, 0),
('f1c6c430-e7eb-b12e-e5c5-58047f81edde', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'list', 'Tasks', 'module', 90, 0),
('f2160490-278b-b0e9-4f0e-58047f37866c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'export', 'jjwg_Maps', 'module', 90, 0),
('f2b6d810-9b94-e7fd-bdfa-58047f18b98e', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'import', 'AOS_Contracts', 'module', 90, 0),
('f3b6fe2b-ae8f-7668-4342-58047fd8360f', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'edit', 'Tasks', 'module', 90, 0),
('f3e9d561-0b2b-9e2a-69ff-58047fabe969', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'massupdate', 'jjwg_Maps', 'module', 90, 0),
('f7540c7e-358d-486b-a8c3-58047fcfe933', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'access', 'FP_events', 'module', 89, 0);

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles`
--

CREATE TABLE IF NOT EXISTS `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_actions`
--

CREATE TABLE IF NOT EXISTS `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `acl_roles_users`
--

CREATE TABLE IF NOT EXISTS `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE IF NOT EXISTS `alerts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `target_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url_redirect` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `priority` varchar(100) DEFAULT 'High',
  `override_business_hours` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_audit`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_am_projecttemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_contacts_1_c`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_contacts_1_alt` (`am_projecttemplates_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_project_1_c`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_project_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_projecttemplates_users_1_c`
--

CREATE TABLE IF NOT EXISTS `am_projecttemplates_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_users_1_alt` (`am_projecttemplates_ida`,`users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates`
--

CREATE TABLE IF NOT EXISTS `am_tasktemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `priority` varchar(100) DEFAULT 'High',
  `percent_complete` int(255) DEFAULT '0',
  `predecessors` int(255) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT '0',
  `relationship_type` varchar(100) DEFAULT 'FS',
  `task_number` int(255) DEFAULT NULL,
  `order_number` int(255) DEFAULT NULL,
  `estimated_effort` int(255) DEFAULT NULL,
  `utilization` varchar(100) DEFAULT '0',
  `duration` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates_am_projecttemplates_c`
--

CREATE TABLE IF NOT EXISTS `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `am_tasktemplates_audit`
--

CREATE TABLE IF NOT EXISTS `am_tasktemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_am_tasktemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aobh_businesshours`
--

CREATE TABLE IF NOT EXISTS `aobh_businesshours` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `opening_hours` varchar(100) DEFAULT '1',
  `closing_hours` varchar(100) DEFAULT '1',
  `open` tinyint(1) DEFAULT NULL,
  `day` varchar(100) DEFAULT 'monday',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_index`
--

CREATE TABLE IF NOT EXISTS `aod_index` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `last_optimised` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aod_index`
--

INSERT INTO `aod_index` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `last_optimised`, `location`) VALUES
('1', 'Index', '2016-10-17 07:43:29', '2016-10-17 07:43:29', '1', '1', NULL, 0, NULL, NULL, 'modules/AOD_Index/Index/Index');

-- --------------------------------------------------------

--
-- Table structure for table `aod_indexevent`
--

CREATE TABLE IF NOT EXISTS `aod_indexevent` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `success` tinyint(1) DEFAULT '0',
  `record_id` char(36) DEFAULT NULL,
  `record_module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_record_module` (`record_module`),
  KEY `idx_record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aod_indexevent`
--

INSERT INTO `aod_indexevent` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `error`, `success`, `record_id`, `record_module`) VALUES
('107ac154-53dd-3ceb-17af-5812ff03c986', 'Review From of husnain zaheer', '2016-10-28 07:35:57', '2016-10-28 07:35:57', NULL, NULL, NULL, 0, NULL, NULL, 1, 'cea89873-6849-7e32-e413-5812fff291bb', 'RT_Performance_Reviews'),
('10d3745c-82cf-fd14-4054-58245e188037', 'tes  now''s Increment', '2016-11-10 11:47:38', '2016-11-10 11:47:38', '1', '1', NULL, 0, NULL, NULL, 1, 'db763340-8a50-8558-398a-58245e0d8119', 'RT_Increment_History'),
('12631983-736f-cbf3-b8a7-58121a9d72ba', 'Review From of sdf asd', '2016-10-27 15:17:16', '2016-10-27 15:17:16', NULL, NULL, NULL, 0, NULL, NULL, 1, 'd54651de-923d-dbcb-208d-58121af4501a', 'RT_Performance_Reviews'),
('12c00092-fa8c-722a-d1c2-5821da9a7caf', '', '2016-11-08 14:00:43', '2016-11-08 14:00:43', '1', '1', NULL, 0, NULL, NULL, 1, '56ff0270-ff07-a4f5-0346-5821dae273c6', 'RT_Leaves'),
('139c3008-3ffa-ebb8-a11f-581c96c8588d', '', '2016-11-04 14:10:29', '2016-11-04 14:10:29', '1', '1', NULL, 0, NULL, NULL, 1, 'b0c03988-6e8f-1e12-5eca-581c962e8a83', 'RT_Leaves'),
('1490021c-67b6-3eb1-32e9-58299934ae09', 'Payroll 2 2000', '2016-11-14 11:01:35', '2016-11-14 11:01:35', '1', '1', NULL, 0, NULL, NULL, 1, '9c381038-e0cb-4c1b-619b-58299912826b', 'RT_Payroll'),
('151d0d2d-12a6-fc17-06ba-581c78479ef8', '', '2016-11-04 11:59:11', '2016-11-04 11:59:11', '1', '1', NULL, 0, NULL, NULL, 1, '43c5fee2-497a-6f2b-325a-581c787ae406', 'RT_Leaves'),
('15cab472-095d-ecde-98c7-5821b9b8bb5c', '', '2016-11-08 11:40:20', '2016-11-08 11:40:20', '1', '1', NULL, 0, NULL, NULL, 1, 'bf6ce812-8db5-b171-bfaa-5821b9ff5296', 'RT_Leaves'),
('15d3682c-e49b-78e0-6fe7-58299c723a89', 'Mr. test  salary 14', '2016-11-14 11:14:26', '2016-11-14 11:14:26', '1', '1', NULL, 0, NULL, NULL, 1, 'c176d323-e9eb-0c9a-1c44-58299c7c1ff2', 'RT_Employees'),
('174b0185-a9de-666e-b9ce-58245be7be5a', 'june employee''s Increment', '2016-11-10 11:36:17', '2016-11-10 11:46:52', '1', '1', NULL, 0, '', NULL, 1, 'dbaf404f-6e8b-1942-325f-58245b35e8c2', 'RT_Increment_History'),
('17b79ee3-f650-e2b3-5102-582479aeefcc', 'husy department', '2016-11-10 13:43:03', '2016-11-10 13:43:03', '1', '1', NULL, 0, NULL, NULL, 1, 'e1de8860-9d36-6110-c20c-582479f8667d', 'RT_Departments'),
('1a273758-b747-6e3e-eed8-5829a392ad8d', 'Payroll oftest  husy  2 2000', '2016-11-14 11:45:20', '2016-11-14 11:45:20', '1', '1', NULL, 0, NULL, NULL, 1, 'adc85af6-d5f8-4c46-a966-5829a35c09bf', 'RT_Payroll'),
('1a4e25ab-7bc2-cbff-7adf-5812fbc8cbc0', 'Review From of husnain zaheer', '2016-10-28 07:19:10', '2016-10-28 07:19:10', NULL, NULL, NULL, 0, NULL, NULL, 1, 'd9060c84-8405-aed3-502e-5812fb2d2aab', 'RT_Performance_Reviews'),
('1bfb5079-234d-c603-7f28-5829708ad5e1', 'Payroll oftest  14 nov  5 2000', '2016-11-14 08:07:14', '2016-11-14 08:07:14', '1', '1', NULL, 0, NULL, NULL, 1, 'c634e050-bc34-d0d8-169a-582970238432', 'RT_Payroll'),
('1c6b018d-f56b-f1ba-5aed-5811ddd37251', 'Mr. test supervisor', '2016-10-27 10:55:50', '2016-11-04 09:44:01', '1', '1', NULL, 0, '', NULL, 1, 'e1a3888d-1197-e4cd-148f-5811ddcc5adf', 'RT_Employees'),
('1c6e1e4f-7824-8cf9-ae4c-582462a217be', 'Mr. sum salary emp', '2016-11-10 12:06:28', '2016-11-10 12:06:28', '1', '1', NULL, 0, NULL, NULL, 1, 'da52008c-e23e-9467-29d3-582462632a21', 'RT_Employees'),
('1cc013bd-dfba-2cbc-f513-58231c675681', 'Leave of today employee', '2016-11-09 12:54:10', '2016-11-09 12:54:10', '1', '1', NULL, 0, NULL, NULL, 1, 'b68ae79f-1b32-fa1d-9575-58231cf760a3', 'RT_Leaves'),
('1d576f4c-a43c-a7bf-22b0-581b1e3de472', '', '2016-11-03 11:24:16', '2016-11-03 11:24:16', '1', '1', NULL, 0, NULL, NULL, 1, 'efb84701-650f-2170-e642-581b1e3334e3', 'RT_Leaves'),
('1d906967-44db-8235-c936-5821b750e098', '', '2016-11-08 11:32:13', '2016-11-08 11:32:13', '1', '1', NULL, 0, NULL, NULL, 1, 'aa434d92-d6c3-7287-d00b-5821b75a3363', 'RT_Leaves'),
('1f5dfce5-f3c3-ca4a-309a-5829c15dbb7e', 'Payroll oftest  husy  3 2016', '2016-11-14 13:52:11', '2016-11-14 13:52:11', '1', '1', NULL, 0, NULL, NULL, 1, 'ca97ad9f-a256-6599-1e34-5829c1e7bcf9', 'RT_Payroll'),
('21005d51-55f4-0107-4f8e-58170e83467e', 'Review From of husnain zaheer', '2016-10-31 09:29:30', '2016-10-31 09:29:30', NULL, NULL, NULL, 0, NULL, NULL, 1, 'b402ba7a-4465-7d11-666b-58170ec2131b', 'RT_Performance_Reviews'),
('215b0dd1-9cd9-dd26-c926-5811f0c5d96d', 'Mr. test email', '2016-10-27 12:18:53', '2016-10-27 12:18:53', '1', '1', NULL, 0, NULL, NULL, 1, 'c73e60f0-82fc-f33b-0205-5811f0e32a0c', 'RT_Employees'),
('21afd565-4393-85d6-3110-58245658dc40', 'june employee''s Increment', '2016-11-10 11:15:42', '2016-11-10 11:15:42', '1', '1', NULL, 0, NULL, NULL, 1, 'e229a1c8-fb55-3099-0495-5824567df806', 'RT_Increment_History'),
('2267f474-0805-2fba-b6ae-58247dbda498', 'Mr. husy test today 9 nov', '2016-11-10 14:00:42', '2016-11-10 14:02:59', '1', '1', NULL, 0, '', NULL, 1, 'dbf8b56f-74fe-4d70-1b5b-58247d1eb23a', 'RT_Employees'),
('23b0b111-cc73-5f5b-6a0c-581c941fea15', '', '2016-11-04 14:01:41', '2016-11-04 14:01:41', '1', '1', NULL, 0, NULL, NULL, 1, 'cd1b47f1-63c8-378d-e088-581c94411b3e', 'RT_Leaves'),
('266b0099-c0af-7420-fbfb-581a00a17320', 'Review From of husnain zaheer', '2016-11-02 15:04:53', '2016-11-02 15:04:53', NULL, NULL, NULL, 0, NULL, NULL, 1, 'c0c97261-6114-91c5-0b6f-581a00a1727e', 'RT_Performance_Reviews'),
('278fc4b0-b34b-7779-b573-582316cb0a78', 'Leave of emp 9 nov', '2016-11-09 12:30:22', '2016-11-09 12:30:22', '1', '1', NULL, 0, NULL, NULL, 1, 'd62ce932-f521-19b1-b0d8-582316c17a44', 'RT_Leaves'),
('27b665fb-47bc-1088-35b9-581218c51408', 'Review From of test supervisor', '2016-10-27 15:08:42', '2016-10-27 15:08:42', NULL, NULL, NULL, 0, NULL, NULL, 1, 'eacdc772-7534-4474-abf5-5812181a58dd', 'RT_Performance_Reviews'),
('280ba8a6-706f-1d54-50e8-5824642e0dc8', 'Ms. sss salary', '2016-11-10 12:14:03', '2016-11-10 12:14:03', '1', '1', NULL, 0, NULL, NULL, 1, 'e93d3db3-c59b-51a3-2af8-582464bacdfc', 'RT_Employees'),
('281e3441-c920-b0d9-87eb-581842fea1d2', 'Review From of husnain zaheer', '2016-11-01 07:22:40', '2016-11-01 07:22:40', NULL, NULL, NULL, 0, NULL, NULL, 1, 'b0d39a28-c9e6-ffa3-522c-581842ebcd40', 'RT_Performance_Reviews'),
('28f31f8a-dccf-cb5d-d0a0-58230c731af2', 'Mr. emp 9 nov', '2016-11-09 11:44:28', '2016-11-09 13:16:27', '1', '1', NULL, 0, '', NULL, 1, 'ef401f68-32e0-46bf-e3bb-58230c65631a', 'RT_Employees'),
('2917f7e4-1133-7357-202e-581c862b9f6f', '', '2016-11-04 13:01:22', '2016-11-04 13:01:22', '1', '1', NULL, 0, NULL, NULL, 1, 'ebb9f082-8377-e66c-ab67-581c86e2a807', 'RT_Leaves'),
('2942ab32-b962-0d5d-3f24-58296aea40e8', 'Payroll oftest  14 nov  7 2016', '2016-11-14 07:41:18', '2016-11-14 07:41:18', '1', '1', NULL, 0, NULL, NULL, 1, '8cf1549e-c76b-23d1-a4a1-58296a739d49', 'RT_Payroll'),
('29e5ebd4-5744-e725-fdac-5829ac7b15ac', 'Payroll oftest  husy  2 2000', '2016-11-14 12:21:52', '2016-11-14 12:21:52', '1', '1', NULL, 0, NULL, NULL, 1, 'da57dbcf-1058-3026-5fd1-5829acae963f', 'RT_Payroll'),
('2a48a88d-304d-d607-04e4-5808b2a7f598', '', '2016-10-20 12:03:41', '2016-10-20 12:03:41', '1', '1', NULL, 0, NULL, NULL, 1, '29660fce-d9f9-e5bd-6a84-5808b2beb429', 'RT_Qualifications'),
('2ade4446-d9c5-8213-09ee-582998c86635', 'Payroll 4 2000', '2016-11-14 10:55:03', '2016-11-14 10:55:03', '1', '1', NULL, 0, NULL, NULL, 1, 'c127fdb0-359e-7d1e-fa6a-58299824ca90', 'RT_Payroll'),
('2b4bd0fc-5176-a9f4-4e8b-581219456664', 'Review From of husnain zaheer', '2016-10-27 15:13:07', '2016-10-27 15:13:07', NULL, NULL, NULL, 0, NULL, NULL, 1, 'ed257de0-f875-ccbc-027a-58121912e09d', 'RT_Performance_Reviews'),
('2c38c8ed-b3cb-c3f5-c0e0-5825df3fd986', 'Payroll 6 0', '2016-11-11 15:11:36', '2016-11-11 15:11:36', '1', '1', NULL, 0, NULL, NULL, 1, '741d1449-4724-b1de-2e08-5825dfcb8b8f', 'RT_Payroll'),
('2c65a560-4f6b-5a05-df68-5821de6c2d35', 'Leave of tttt zzzz', '2016-11-08 14:18:00', '2016-11-08 14:18:53', '1', '1', NULL, 0, '', NULL, 1, '26570d90-2856-1167-fb4a-5821dec4e5d0', 'RT_Leaves'),
('2c9ee4f5-5570-7f09-7eb7-581306a55d75', 'Review From of husnain zaheer', '2016-10-28 08:03:20', '2016-10-28 08:03:20', NULL, NULL, NULL, 0, NULL, NULL, 1, 'e498e946-2ae1-4c35-6b56-581306eb2890', 'RT_Performance_Reviews'),
('2cf34cae-575b-0630-a4c5-5824649efd2c', 'sss salary''s Increment', '2016-11-10 12:15:42', '2016-11-10 12:15:42', '1', '1', NULL, 0, NULL, NULL, 1, 'f3e6499d-8156-51cc-5f93-582464802c0c', 'RT_Increment_History'),
('2de59ef3-0512-b053-08db-58232057ca59', 'Leave of emp 9 nov', '2016-11-09 13:11:18', '2016-11-09 13:11:18', '1', '1', NULL, 0, NULL, NULL, 1, 'd9037273-5c86-76e2-935d-5823202de7f3', 'RT_Leaves'),
('2ebcdf44-db58-0798-505d-5821706a6bda', 'Mr. last year employee', '2016-11-08 06:27:26', '2016-11-09 11:37:52', '1', '1', NULL, 0, '', NULL, 1, 'eae18998-cf3d-17eb-9a12-58217076a5d0', 'RT_Employees'),
('3132b3e1-e8f9-2341-d5a4-581c92cef92e', '', '2016-11-04 13:50:02', '2016-11-04 13:50:02', '1', '1', NULL, 0, NULL, NULL, 1, 'e56c3a5f-9aed-791c-cc86-581c928402d2', 'RT_Leaves'),
('31d6a606-86fc-083c-9b9f-58171639b2f7', 'Review From of husnain zaheer', '2016-10-31 10:02:32', '2016-10-31 10:02:32', NULL, NULL, NULL, 0, NULL, NULL, 1, 'e4d9fc12-52af-75a2-9863-581716dbb6af', 'RT_Performance_Reviews'),
('332b4663-c764-c00a-24d1-58247b72ac96', 'tes depaaa', '2016-11-10 13:52:59', '2016-11-10 13:52:59', '1', '1', NULL, 0, NULL, NULL, 1, '9874050f-8728-b05b-5857-58247bf6006e', 'RT_Departments'),
('344a086b-7afa-d3a5-96f9-581c783013f3', '', '2016-11-04 11:59:28', '2016-11-04 11:59:28', '1', '1', NULL, 0, NULL, NULL, 1, '27277984-4a35-0e80-8033-581c78e872dd', 'RT_Leaves'),
('3486fecb-d366-e9aa-8e92-58130055c1c7', 'Review From of husnain zaheer', '2016-10-28 07:40:44', '2016-10-28 07:40:44', NULL, NULL, NULL, 0, NULL, NULL, 1, 'f0d4a741-e098-dec6-4158-581300956fcf', 'RT_Performance_Reviews'),
('36724259-ef12-258a-a7a2-58133e8d1aa9', 'Review From of no  supervisor', '2016-10-28 12:02:13', '2016-10-28 12:02:13', NULL, NULL, NULL, 0, NULL, NULL, 1, 'e75513f0-fe76-acb1-52b5-58133e4da41f', 'RT_Performance_Reviews'),
('3869a465-fb8f-a526-6ff4-581ada6955c5', 'Review From of husnain zaheer 2016-11-03 11:32:51', '2016-11-03 06:32:52', '2016-11-03 06:32:52', NULL, NULL, NULL, 0, NULL, NULL, 1, 'daa92b7e-edca-cd49-3cdf-581ada902533', 'RT_Performance_Reviews'),
('393435e4-1d3d-f98a-8542-5822d101363a', 'Leave of today employee', '2016-11-09 07:35:03', '2016-11-09 07:35:03', '1', '1', NULL, 0, NULL, NULL, 1, 'c1c60d36-b0d8-cc78-3af0-5822d16830d1', 'RT_Leaves'),
('394a0bbf-7bc5-dc1f-754f-5821d30b1827', '', '2016-11-08 13:28:49', '2016-11-08 13:28:49', '1', '1', NULL, 0, NULL, NULL, 1, '8970882e-dbfd-9afd-199f-5821d3777014', 'RT_Leaves'),
('39606d33-564e-adfd-815e-581b380c837f', '', '2016-11-03 13:14:30', '2016-11-03 13:14:30', '1', '1', NULL, 0, NULL, NULL, 1, 'ed9f8a13-972a-ae04-fc2a-581b384da442', 'RT_Leaves'),
('397e155b-027d-0fe0-131b-5829bd51220d', 'Payroll oftest  husy  9 2015', '2016-11-14 13:34:17', '2016-11-14 13:34:17', '1', '1', NULL, 0, NULL, NULL, 1, 'dcc1b228-ec5b-30df-a5a7-5829bd3e25dc', 'RT_Payroll'),
('39b49146-8d8e-551f-3efb-5808b9065abc', '', '2016-10-20 12:32:18', '2016-10-20 12:32:18', '1', '1', NULL, 0, NULL, NULL, 1, 'e8b20c9c-9211-3cf7-8961-5808b9392835', 'RT_Leaves'),
('3a21092b-7fa8-d737-014d-58133c4fb91a', 'Mr. no  supervisor', '2016-10-28 11:56:10', '2016-10-28 11:56:10', '1', '1', NULL, 0, NULL, NULL, 1, 'edd472fe-febf-e96a-a2e7-58133c6c50f6', 'RT_Employees'),
('3b4ceb3d-0b4f-149a-3f3e-5821d161ca07', '', '2016-11-08 13:21:21', '2016-11-08 13:21:21', '1', '1', NULL, 0, NULL, NULL, 1, 'bcecdb5c-3f21-26bf-5771-5821d194d220', 'RT_Leaves'),
('3bd0ea73-4fd7-b6d1-c645-581c77048d12', '', '2016-11-04 11:57:41', '2016-11-04 11:57:41', '1', '1', NULL, 0, NULL, NULL, 1, '7ee60486-6ddc-bcb1-b167-581c776a7a86', 'RT_Leaves'),
('3c3ea57b-e450-7785-0304-5825c67ad23c', '', '2016-11-11 13:24:30', '2016-11-11 13:24:30', '1', '1', NULL, 0, NULL, NULL, 1, 'b3ad8b06-a8df-3432-a36d-5825c6e42bd0', 'RT_Payroll'),
('3d9cf0c4-65b2-972d-ec88-5829c6a01da4', 'Payroll 6 2016', '2016-11-14 14:14:33', '2016-11-14 14:14:33', '1', '1', NULL, 0, NULL, NULL, 1, 'c75e6078-b2ae-07ee-d633-5829c657d3ad', 'RT_Payroll'),
('3e81236a-e0bc-6a2c-008e-5821d96ed8e2', '', '2016-11-08 13:55:25', '2016-11-08 13:55:25', '1', '1', NULL, 0, NULL, NULL, 1, '64a02151-ba61-5b47-5441-5821d9fbb9e6', 'RT_Leaves'),
('3e8632cc-5a6e-0b7e-640c-582315e575f4', 'Leave of june employee', '2016-11-09 12:23:31', '2016-11-09 12:23:31', '1', '1', NULL, 0, NULL, NULL, 1, '5257457d-2d47-3dc7-ca34-58231555cd91', 'RT_Leaves'),
('3f7979ae-4492-34a4-81d2-582421b4c2d2', '', '2016-11-10 07:28:33', '2016-11-10 07:28:33', '1', '1', NULL, 0, NULL, NULL, 1, '19b4233f-96bf-df5c-f3db-582421dedb3a', 'RT_Increment_History'),
('3fad40f6-1122-75b5-a9c4-582169eb89f1', '', '2016-11-08 05:59:15', '2016-11-08 05:59:15', '1', '1', NULL, 0, NULL, NULL, 1, 'bccb3aad-c525-8c09-43c0-5821699c6fa5', 'RT_Leaves'),
('40654c2a-c4c4-a360-8bdc-582458e75d97', 'last year employee''s Increment', '2016-11-10 11:22:42', '2016-11-10 11:22:42', '1', '1', NULL, 0, NULL, NULL, 1, '18c3a4f1-0720-b292-a104-5824589e82c7', 'RT_Increment_History'),
('447672b2-50f5-2ddd-6bfe-58296c4bce77', 'Payroll oftest  14 nov  2 2000', '2016-11-14 07:50:44', '2016-11-14 07:50:44', '1', '1', NULL, 0, NULL, NULL, 1, 'a3433746-cae1-c999-7642-58296c23e25e', 'RT_Payroll'),
('46e6d603-68a7-90bf-2c26-582322528dd4', 'Leave of tes  now', '2016-11-09 13:19:38', '2016-11-09 13:19:38', '1', '1', NULL, 0, NULL, NULL, 1, '8f800f70-21b0-74df-ff9c-582322a8954e', 'RT_Leaves'),
('47a26ab5-7ede-5a76-6084-5824592caf7f', 'june employee''s Increment', '2016-11-10 11:26:59', '2016-11-10 11:26:59', '1', '1', NULL, 0, NULL, NULL, 1, '201266c0-1c8a-9f3b-16fa-58245952e77e', 'RT_Increment_History'),
('47fc70c1-84bd-d90d-4abb-5821d7d26802', '', '2016-11-08 13:46:28', '2016-11-08 13:46:28', '1', '1', NULL, 0, NULL, NULL, 1, '999fa007-5642-8f41-815c-5821d7cc3b4d', 'RT_Leaves'),
('48683702-21ce-93e7-b194-581c694a1e2f', 'Leave of atif zulfiqar', '2016-11-04 10:56:14', '2016-11-04 10:56:14', '1', '1', NULL, 0, NULL, NULL, 1, 'c165ba16-f1cb-1096-beb8-581c69a805ef', 'RT_Leaves'),
('4869acc5-cfc0-fe7f-0814-582dc6d57e7c', '', '2016-11-17 15:00:56', '2016-11-17 15:00:56', '1', '1', NULL, 0, NULL, NULL, 1, 'd3c9c3a4-5d70-8118-4ce4-582dc6c25895', 'RT_SalarySetting'),
('49798905-a683-a46d-22af-581301e5cdd7', 'Review From of husnain zaheer', '2016-10-28 07:43:08', '2016-10-28 07:43:08', NULL, NULL, NULL, 0, NULL, NULL, 1, 'e6a90e87-3f90-cef0-e3fb-581301f9c6e0', 'RT_Performance_Reviews'),
('497daccc-44d4-9dd8-7336-58185d57445d', 'Review From of husnain zaheer', '2016-11-01 09:18:42', '2016-11-01 09:18:42', NULL, NULL, NULL, 0, NULL, NULL, 1, 'd11b22e2-3750-b53a-3853-58185d868d92', 'RT_Performance_Reviews'),
('49c4f272-4d20-5bfe-d5e5-5825e1c913d1', 'Ms. test 11 next', '2016-11-11 15:17:58', '2016-11-11 15:17:58', '1', '1', NULL, 0, NULL, NULL, 1, 'c0f14360-05b2-747b-fc95-5825e1c3419f', 'RT_Employees'),
('4a4d2d5a-3853-ca87-775c-5818649a5cb3', 'Review From of husnain zaheer', '2016-11-01 09:48:11', '2016-11-01 09:48:11', NULL, NULL, NULL, 0, NULL, NULL, 1, '547eca63-0f58-4b49-ae40-581864f6dd36', 'RT_Performance_Reviews'),
('4ad99702-abe6-a387-7701-582dc5a3e8b8', '', '2016-11-17 14:59:45', '2016-11-17 14:59:45', '1', '1', NULL, 0, NULL, NULL, 1, 'dbbf3a30-d308-e824-e20b-582dc53eeb43', 'RT_SalarySetting'),
('4b5f09aa-e980-5ce9-4f8f-5829abd40769', 'Payroll oftest  husy  2 2016', '2016-11-14 12:16:20', '2016-11-14 12:16:20', '1', '1', NULL, 0, NULL, NULL, 1, 'c5b50948-b665-102f-7373-5829ab8f3320', 'RT_Payroll'),
('4bd36b2d-42e3-207c-4e30-582321246bf2', 'Leave of emp 9 nov', '2016-11-09 13:16:27', '2016-11-09 13:16:27', '1', '1', NULL, 0, NULL, NULL, 1, '110d60f3-3cb5-e515-04e7-582321b0d68e', 'RT_Leaves'),
('4ce289cf-a7e3-26fe-7b4f-5808b5469755', '', '2016-10-20 12:15:27', '2016-10-20 12:15:27', '1', '1', NULL, 0, NULL, NULL, 1, '270b4d59-e47b-9b53-3863-5808b51c4b3e', 'RT_Qualifications'),
('4d5c8c35-ea38-7dce-0d25-5821ceeb973f', 'husy leave', '2016-11-08 13:09:43', '2016-11-08 13:11:48', '1', '1', NULL, 0, '', NULL, 1, 'e59cc988-f52a-2eff-6158-5821cebc69e9', 'RT_Leaves'),
('4dbc9ab5-923f-30ec-44f0-582ad0235326', 'Payroll 10 2015', '2016-11-15 09:09:27', '2016-11-15 09:09:27', '1', '1', NULL, 0, NULL, NULL, 1, 'd379c9bb-fc74-b4fb-6692-582ad0d35f0d', 'RT_Payroll'),
('4e3b1b94-2cf2-1356-da79-58231fa42bb9', 'Leave of emp 9 nov', '2016-11-09 13:08:14', '2016-11-09 13:08:14', '1', '1', NULL, 0, NULL, NULL, 1, '130ad3d2-3415-8ff3-4c2b-58231f95d2fa', 'RT_Leaves'),
('4e7f11c6-5874-714b-1623-582458ae8f51', 'june employee''s Increment', '2016-11-10 11:20:48', '2016-11-10 11:20:48', '1', '1', NULL, 0, NULL, NULL, 1, '233a100a-6040-96a9-09cf-582458ac7ea6', 'RT_Increment_History'),
('4f5a24d8-c8c2-cc9d-55b1-5812eecdee97', 'Review From of husnain zaheer', '2016-10-28 06:22:13', '2016-10-28 06:22:13', NULL, NULL, NULL, 0, NULL, NULL, 1, '4bbe0f9c-b2d6-ec4a-371c-5812ee4e8574', 'RT_Performance_Reviews'),
('4f782462-e7a6-af36-f14e-5821d6a66e69', '', '2016-11-08 13:43:56', '2016-11-08 13:43:56', '1', '1', NULL, 0, NULL, NULL, 1, 'be3275df-7993-b6ff-2557-5821d67efdd2', 'RT_Leaves'),
('50676902-933b-3ccb-35d9-58296c8d7ece', 'Payroll oftest  14 nov  4 2000', '2016-11-14 07:49:03', '2016-11-14 07:49:03', '1', '1', NULL, 0, NULL, NULL, 1, 'b8ba4b77-b006-02d5-eb58-58296c7ac324', 'RT_Payroll'),
('50b4c223-a847-3300-c114-5821da7e9113', 'test', '2016-11-08 14:02:25', '2016-11-08 14:09:44', '1', '1', NULL, 0, '', NULL, 1, '3746b4ef-d6ff-6299-5a7f-5821dae6a1be', 'RT_Leaves'),
('50fd8380-8bbc-3906-e30a-5821d61f9181', '', '2016-11-08 13:44:48', '2016-11-08 13:44:48', '1', '1', NULL, 0, NULL, NULL, 1, 'ae7b02d9-2123-61d9-3689-5821d6a85d4e', 'RT_Leaves'),
('513178bd-d4fe-42de-112d-581c68ae7975', 'Leave of atif zulfiqar', '2016-11-04 10:54:39', '2016-11-04 10:54:39', '1', '1', NULL, 0, NULL, NULL, 1, '1d8f60c6-0ce1-921e-12e7-581c68321275', 'RT_Leaves'),
('51c9015b-b6a2-07cb-315c-5829ad866e97', 'Payroll oftest  husy  9 2014', '2016-11-14 12:25:47', '2016-11-14 12:25:47', '1', '1', NULL, 0, NULL, NULL, 1, 'c768027d-9cf3-c8a8-3c12-5829adc0d341', 'RT_Payroll'),
('5313d72b-4b05-0487-3f19-582dc409e7cd', '', '2016-11-17 14:54:46', '2016-11-17 14:54:46', '1', '1', NULL, 0, NULL, NULL, 1, 'e4427d7d-b0b2-bee6-d59d-582dc4a18359', 'RT_SalarySetting'),
('533222e0-1c2b-f71b-3684-5812fcdba576', 'Review From of husnain zaheer', '2016-10-28 07:20:43', '2016-10-28 07:20:43', NULL, NULL, NULL, 0, NULL, NULL, 1, '199f2c4f-0e00-350c-8c6f-5812fc834559', 'RT_Performance_Reviews'),
('53821fc4-1ca2-7579-eeed-580dbc47309b', 'Mr. asd asdc ascf', '2016-10-24 07:49:14', '2016-10-24 07:49:14', '1', '1', NULL, 0, NULL, NULL, 1, '2958faeb-705b-1431-9709-580dbcd5ef56', 'RT_Employees'),
('541907f2-bf07-87af-701b-581c90aebffe', '', '2016-11-04 13:44:37', '2016-11-04 13:44:37', '1', '1', NULL, 0, NULL, NULL, 1, 'b7bc10e5-1c96-1d49-4d4d-581c90d6b68a', 'RT_Leaves'),
('542bf36b-6a84-e620-4c04-5821a0fb7ee2', '', '2016-11-08 09:52:03', '2016-11-08 09:52:03', '1', '1', NULL, 0, NULL, NULL, 1, 'f1bc0111-b9e2-72fe-101b-5821a03dc87d', 'RT_Leaves'),
('543a9006-73da-efb5-70de-58231047fe8b', 'Leave of emp 9 nov', '2016-11-09 12:04:49', '2016-11-09 12:04:49', '1', '1', NULL, 0, NULL, NULL, 1, 'bc2e1806-098e-38b4-363c-582310a430a2', 'RT_Leaves'),
('54e2dbf6-b976-5c4e-912f-5821bf369acc', '', '2016-11-08 12:05:43', '2016-11-08 12:05:43', '1', '1', NULL, 0, NULL, NULL, 1, 'f0a9651c-e294-9008-2d90-5821bfd35155', 'RT_Leaves'),
('550b3a12-c63f-ae2b-950c-58299a11cb9c', 'Payroll oftest  14 nov  3 2000', '2016-11-14 11:04:39', '2016-11-14 11:04:39', '1', '1', NULL, 0, NULL, NULL, 1, '2d0807e7-8831-59b4-c9b6-58299a36c792', 'RT_Payroll'),
('5519113c-11a1-c564-62f2-581305954629', 'Review From of husnain zaheer', '2016-10-28 08:01:41', '2016-10-28 08:01:41', NULL, NULL, NULL, 0, NULL, NULL, 1, '1846ec72-9db2-d982-fccc-581305281336', 'RT_Performance_Reviews'),
('5523a599-804a-a752-a2ca-58171c4f2f76', 'Review From of husnain zaheer', '2016-10-31 10:25:51', '2016-10-31 10:25:51', NULL, NULL, NULL, 0, NULL, NULL, 1, 'cae605be-2728-03f3-a219-58171c55296b', 'RT_Performance_Reviews'),
('55573d40-717a-64c0-2e54-5822c283b3d7', 'Leave of june employee', '2016-11-09 06:29:17', '2016-11-09 06:29:17', '1', '1', NULL, 0, NULL, NULL, 1, '186fc5da-9438-9824-d39a-5822c2ba7e88', 'RT_Leaves'),
('5576f5dd-1915-d4fa-ab4c-58247cdf95bc', 'test fianl department', '2016-11-10 13:54:26', '2016-11-10 13:54:26', '1', '1', NULL, 0, NULL, NULL, 1, '2242f248-4c15-a46b-ba1c-58247cb61f11', 'RT_Departments'),
('5671c10a-ef11-2353-e611-580497ea4a2e', 'Mr. test person', '2016-10-17 09:17:25', '2016-10-27 12:12:54', '1', '1', NULL, 0, '', NULL, 1, '380d7c06-497a-f0e2-e02a-580497b91089', 'RT_Employees'),
('567b749d-7202-b94a-67ca-5808b4d45a40', '', '2016-10-20 12:12:44', '2016-10-20 12:12:44', '1', '1', NULL, 0, NULL, NULL, 1, '34cfac72-ce5b-6104-020f-5808b407a60e', 'RT_Qualifications'),
('567cd75f-975d-8b0f-7c99-58230c92d05d', 'Leave of emp 9 nov', '2016-11-09 11:44:53', '2016-11-09 11:44:53', '1', '1', NULL, 0, NULL, NULL, 1, 'ce6fcb51-85aa-23c8-aeb2-58230c1a5522', 'RT_Leaves'),
('5685dc8d-8fa0-d2af-69c6-5817161a01c7', 'Review From of husnain zaheer', '2016-10-31 09:59:48', '2016-10-31 09:59:48', NULL, NULL, NULL, 0, NULL, NULL, 1, 'caeb0410-1ec1-b2e0-5e34-581716157211', 'RT_Performance_Reviews'),
('56c8de63-8ea5-2120-b937-58232034e756', 'Leave of emp 9 nov', '2016-11-09 13:12:31', '2016-11-09 13:12:31', '1', '1', NULL, 0, NULL, NULL, 1, 'e4542d45-2fd1-8601-f0e0-5823209aa9a1', 'RT_Leaves'),
('57f168b0-103c-a65d-6900-58231a3f6b18', 'Leave of june employee', '2016-11-09 12:47:54', '2016-11-09 12:47:54', '1', '1', NULL, 0, NULL, NULL, 1, '13566e85-4259-0395-76ef-58231afe513b', 'RT_Leaves'),
('5829470b-a7c9-9f2a-74f6-5829a30bebb2', 'Payroll oftest  salary 14  3 2000', '2016-11-14 11:44:22', '2016-11-14 11:44:22', '1', '1', NULL, 0, NULL, NULL, 1, 'f113c288-2adc-531f-8698-5829a340e767', 'RT_Payroll'),
('5991ddb2-2f44-28e6-c4fb-58230a2a123d', 'Leave of last year employee', '2016-11-09 11:37:52', '2016-11-09 11:37:52', '1', '1', NULL, 0, NULL, NULL, 1, 'f1517d18-d9cb-61ce-ea23-58230a788f55', 'RT_Leaves'),
('5a57f6ca-68d6-e138-ca32-5825e1b6cead', 'Payroll 6 0', '2016-11-11 15:18:32', '2016-11-11 15:18:32', '1', '1', NULL, 0, NULL, NULL, 1, 'bdcdab20-d490-b846-1216-5825e1f70850', 'RT_Payroll'),
('5b07900d-9455-2073-ccad-581c781dd473', '', '2016-11-04 11:59:42', '2016-11-04 11:59:42', '1', '1', NULL, 0, NULL, NULL, 1, '7a80439b-dba9-a6c7-ffc7-581c78d73abd', 'RT_Leaves'),
('5ba3b7b6-a3d0-d67c-ce81-581c583d43a0', 'Leave of test supervisor', '2016-11-04 09:44:01', '2016-11-04 09:44:01', '1', '1', NULL, 0, NULL, NULL, 1, 'eee149f8-8422-780d-f414-581c582ee6e3', 'RT_Leaves'),
('5d65da85-a198-df8e-a567-5821702493d7', '', '2016-11-08 06:30:09', '2016-11-08 06:30:09', '1', '1', NULL, 0, NULL, NULL, 1, 'a2ac8efa-5ebb-1b5b-746c-5821706062bc', 'RT_Leaves'),
('5e5fb63e-1158-f102-0302-5829c6893420', 'Mr. etst mmm', '2016-11-14 14:14:11', '2016-11-14 14:14:11', '1', '1', NULL, 0, NULL, NULL, 1, '1e300425-7cf1-5562-e81b-5829c66cfed9', 'RT_Employees'),
('5f220f38-ab88-31e9-557b-58297ebc1fb3', 'Payroll oftest  14 nov  6 2000', '2016-11-14 09:04:38', '2016-11-14 09:04:38', '1', '1', NULL, 0, NULL, NULL, 1, '18a7f190-327c-8fcc-8ccb-58297e3b4b18', 'RT_Payroll'),
('6056ebfa-6a58-3f3d-47c9-5822f3c7d327', 'Leave of last year employee', '2016-11-09 09:59:11', '2016-11-09 09:59:11', '1', '1', NULL, 0, NULL, NULL, 1, 'bab70d05-9f70-d843-0c8c-5822f3d541e0', 'RT_Leaves'),
('60a8119e-9d48-64f2-e1a7-581c66ceaf6c', 'Leave of atif zulfiqar', '2016-11-04 10:44:14', '2016-11-04 10:44:14', '1', '1', NULL, 0, NULL, NULL, 1, 'ec726d46-4dfc-a9c6-ea81-581c66b75a7c', 'RT_Leaves'),
('612bef61-ef5f-dd47-9af9-581c76a3306f', '', '2016-11-04 11:54:18', '2016-11-04 11:54:18', '1', '1', NULL, 0, NULL, NULL, 1, '9d7c579f-7f8e-94b2-7668-581c7633a323', 'RT_Leaves'),
('61db51f2-cf63-01a4-5f25-5829a112280a', 'Payroll oftest  husy  6 2000', '2016-11-14 11:37:09', '2016-11-14 11:37:09', '1', '1', NULL, 0, NULL, NULL, 1, '89b50677-28ca-ae69-fd0b-5829a12ab465', 'RT_Payroll'),
('6288ce1b-adcc-1d9f-7c71-58233043773c', 'tes  now 2016-11-10', '2016-11-09 14:18:29', '2016-11-09 14:18:29', '1', '1', NULL, 0, NULL, NULL, 1, '3bfdab33-1d05-41af-0847-582330adad94', 'RT_Bonus'),
('634464ca-011e-7d44-d295-5821b7863637', '', '2016-11-08 11:30:54', '2016-11-08 11:30:54', '1', '1', NULL, 0, NULL, NULL, 1, '203f1542-c7c4-fb27-b5e8-5821b76d4bc7', 'RT_Leaves'),
('6365a482-d2ce-f504-d1c8-582dc689e209', '', '2016-11-17 15:02:41', '2016-11-17 15:02:41', '1', '1', NULL, 0, NULL, NULL, 1, 'f081a4ca-da99-b543-2a33-582dc6f89eaa', 'RT_SalarySetting'),
('636ff238-15aa-7853-5f22-58171ce49188', 'Review From of husnain zaheer', '2016-10-31 10:29:09', '2016-10-31 10:29:09', NULL, NULL, NULL, 0, NULL, NULL, 1, '20ab7420-a440-9d50-d2b3-58171c81b9e5', 'RT_Performance_Reviews'),
('63c44f5f-6b2a-3272-bb74-58296f9de0cd', 'Payroll oftest  14 nov  2 2000', '2016-11-14 08:00:10', '2016-11-14 08:00:10', '1', '1', NULL, 0, NULL, NULL, 1, '67d66ae3-b194-1df1-91fe-58296fa619c3', 'RT_Payroll'),
('649d33c8-ab88-6a13-35b3-5821d6ed5e7c', '', '2016-11-08 13:45:15', '2016-11-08 13:45:15', '1', '1', NULL, 0, NULL, NULL, 1, 'bf041c66-3105-2bc4-1383-5821d661fcf2', 'RT_Leaves'),
('64ef7152-3efb-0943-83bc-5813079263c1', 'Review From of husnain zaheer', '2016-10-28 08:07:50', '2016-10-28 08:07:50', NULL, NULL, NULL, 0, NULL, NULL, 1, '25f81fd5-9efc-3f9e-70a2-5813070828a1', 'RT_Performance_Reviews'),
('66f854fe-0bdc-d44f-3a86-581c9682c88d', '', '2016-11-04 14:10:47', '2016-11-04 14:10:47', '1', '1', NULL, 0, NULL, NULL, 1, 'bc36053e-1664-6246-5c5d-581c9646fb50', 'RT_Leaves'),
('67e4a287-764d-84e9-f822-581c914e4f01', '', '2016-11-04 13:45:47', '2016-11-04 13:45:47', '1', '1', NULL, 0, NULL, NULL, 1, '25235af3-0fd4-b6a0-942c-581c919e4180', 'RT_Leaves'),
('690b14ce-d67a-95e9-d271-5822fca1599f', 'Leave of june employee', '2016-11-09 10:37:36', '2016-11-09 10:37:36', '1', '1', NULL, 0, NULL, NULL, 1, '191f60d6-b378-c5ec-87a1-5822fc073645', 'RT_Leaves'),
('6954a033-8759-ddc9-afb7-581c2fc68924', '', '2016-11-04 06:49:14', '2016-11-04 06:57:33', '1', '1', NULL, 0, '', NULL, 1, '324b5fc4-750f-a3bf-edc4-581c2f335ad2', 'RT_Leaves'),
('695a0dce-4a53-4cca-5e3c-582ada4eeb07', 'Payroll oftest  husy today 15  3 2000', '2016-11-15 09:49:47', '2016-11-15 09:49:47', '1', '1', NULL, 0, NULL, NULL, 1, '8dc712d4-a9ba-6ff1-ef31-582adaaac7b9', 'RT_Payroll'),
('69662164-b96b-f07e-81a0-5829987319f7', 'Payroll 4 2000', '2016-11-14 10:58:40', '2016-11-14 10:58:40', '1', '1', NULL, 0, NULL, NULL, 1, 'eec60aef-c7f9-527b-3762-58299801bf42', 'RT_Payroll'),
('69c662b2-6343-2efe-3b5a-5821d9f14902', '', '2016-11-08 13:55:46', '2016-11-08 13:55:46', '1', '1', NULL, 0, NULL, NULL, 1, '7c5b8d39-9d4b-db3f-e651-5821d9ea2557', 'RT_Leaves'),
('6a087941-a493-214d-44a9-582dc405e11b', '', '2016-11-17 14:52:48', '2016-11-17 14:52:48', '1', '1', NULL, 0, NULL, NULL, 1, 'e4647f4a-6890-df55-c801-582dc45a6413', 'RT_SalarySetting'),
('6a2c2fc6-622a-859f-6160-5825c4694349', '', '2016-11-11 13:16:18', '2016-11-11 13:16:18', '1', '1', NULL, 0, NULL, NULL, 1, '158129a4-8463-01af-427c-5825c4a66ea9', 'RT_Payroll'),
('6c2d9ad2-542e-5949-82c4-58247b1582be', 'asds', '2016-11-10 13:53:21', '2016-11-10 13:53:21', '1', '1', NULL, 0, NULL, NULL, 1, '429fb895-ede6-3aee-e146-58247b907038', 'RT_Departments'),
('6e6958cc-75be-3cc8-acd2-5804cf83a104', 'Mr. test salary', '2016-10-17 13:17:23', '2016-10-17 13:17:23', '1', '1', NULL, 0, NULL, NULL, 1, '4fd9c21c-0f4d-1fb4-8bb0-5804cff4be78', 'RT_Employees'),
('6e7d02ae-3159-6432-59e1-582169bf27e4', '', '2016-11-08 06:00:05', '2016-11-08 06:00:05', '1', '1', NULL, 0, NULL, NULL, 1, '77f03c5a-8f61-266d-c78a-582169bad777', 'RT_Leaves'),
('6e940ef0-8ab6-df3a-284c-58171d3cbcb2', 'Review From of husnain zaheer', '2016-10-31 10:33:21', '2016-10-31 10:33:21', NULL, NULL, NULL, 0, NULL, NULL, 1, 'b7171cd0-1ad5-76a2-9251-58171d91f3f7', 'RT_Performance_Reviews'),
('6fc8818a-f387-d0e6-7e0a-5822f3d2c727', 'Leave of last year employee', '2016-11-09 09:58:04', '2016-11-09 09:58:04', '1', '1', NULL, 0, NULL, NULL, 1, '297365e8-febf-bd43-0c6d-5822f36ae57a', 'RT_Leaves'),
('6fe7d78e-718a-fc4d-576f-58171316bd10', 'Review From of husnain zaheer', '2016-10-31 09:48:16', '2016-10-31 09:48:16', NULL, NULL, NULL, 0, NULL, NULL, 1, '30b71c84-ae2c-1f40-d38a-581713ffc0e0', 'RT_Performance_Reviews'),
('708ef7d2-76c2-e163-3008-581c9593930f', '', '2016-11-04 14:06:34', '2016-11-04 14:06:34', '1', '1', NULL, 0, NULL, NULL, 1, '129c0d28-3e16-a457-3a9c-581c95c7b666', 'RT_Leaves'),
('70a131e6-fadc-2ced-fbc6-582ab9bdee11', 'Payroll 3 2000', '2016-11-15 07:31:33', '2016-11-15 07:31:33', '1', '1', NULL, 0, NULL, NULL, 1, 'f33c820d-c8d4-bdda-2c55-582ab9fe89a9', 'RT_Payroll'),
('7229380c-32e6-b360-2879-582169d602b7', '', '2016-11-08 05:59:47', '2016-11-08 05:59:47', '1', '1', NULL, 0, NULL, NULL, 1, 'e72ad9df-80a5-6c0b-e309-582169ee980f', 'RT_Leaves'),
('722d2f7e-6281-4276-d847-581302cbe1ea', 'Review From of husnain zaheer', '2016-10-28 07:45:53', '2016-10-28 07:45:53', NULL, NULL, NULL, 0, NULL, NULL, 1, '3b6d8e79-2f3e-d4ee-ce7b-581302c4ea04', 'RT_Performance_Reviews'),
('724a1bd5-9349-847d-0ee0-582ab6f25922', 'Payroll 4 2018', '2016-11-15 07:16:48', '2016-11-15 07:16:48', '1', '1', NULL, 0, NULL, NULL, 1, '14616535-7047-ff6f-8f89-582ab650e378', 'RT_Payroll'),
('7279ff82-3b8b-cae7-61ad-582ac107109c', 'Payroll oftoday 15  5 2013', '2016-11-15 08:03:10', '2016-11-15 08:03:10', '1', '1', NULL, 0, NULL, NULL, 1, '156b25b4-e4f3-71f0-caff-582ac11a73e9', 'RT_Payroll'),
('73b619f8-c324-3c55-fa4a-58231d7d24b1', 'Leave of today employee', '2016-11-09 12:56:33', '2016-11-09 12:56:33', '1', '1', NULL, 0, NULL, NULL, 1, 'e3436c27-87a9-9f61-9673-58231d657438', 'RT_Leaves'),
('74522632-9eb3-118a-a36c-581303134e2d', 'Review From of husnain zaheer', '2016-10-28 07:51:15', '2016-10-28 07:51:15', NULL, NULL, NULL, 0, NULL, NULL, 1, '3384af5e-6585-51aa-26dc-581303cfc83d', 'RT_Performance_Reviews'),
('75afdd53-2c46-8029-2ff7-581c6af8ce69', 'Mr. ab  tech', '2016-11-04 11:02:04', '2016-11-04 12:12:36', '1', '1', NULL, 0, '', NULL, 1, '3a374cdb-63d1-c038-542d-581c6a0b23a3', 'RT_Employees'),
('766a6489-6f58-5c8a-efc2-58231ca5cdbb', 'Leave of today employee', '2016-11-09 12:54:21', '2016-11-09 12:54:21', '1', '1', NULL, 0, NULL, NULL, 1, '166d31d1-7c62-5548-ae4b-58231cb6a659', 'RT_Leaves'),
('7789bbee-d77c-5bfe-aa2f-5821d670f596', '', '2016-11-08 13:43:19', '2016-11-08 13:43:19', '1', '1', NULL, 0, NULL, NULL, 1, 'f178b6da-e992-70e2-4660-5821d6c3ae44', 'RT_Leaves'),
('77bac4a1-74bc-1bd8-1494-5829a435e9e4', 'Payroll oftest  husy  4 2011', '2016-11-14 11:48:35', '2016-11-14 11:48:35', '1', '1', NULL, 0, NULL, NULL, 1, '1b689704-08b1-6274-44b0-5829a4dd07cd', 'RT_Payroll'),
('78c80c07-b398-1031-36ee-58296a0516bc', 'Mr. test  14 nov', '2016-11-14 07:40:47', '2016-11-14 07:40:47', '1', '1', NULL, 0, NULL, NULL, 1, 'df24096f-6644-4db0-1208-58296a7a7fba', 'RT_Employees'),
('7972ea57-a49e-6c25-ead2-582960b36c26', 'Payroll ofatif zulfiqar  2 2016', '2016-11-14 07:00:00', '2016-11-14 07:00:00', '1', '1', NULL, 0, NULL, NULL, 1, 'dfbc0933-dfa5-8311-c68d-582960ac18ef', 'RT_Payroll'),
('7a651b14-b1c7-9ea9-b0ce-581c665c2ff6', 'Mr. atif zulfiqar', '2016-11-04 10:42:17', '2016-11-08 12:05:43', '1', '1', NULL, 0, '', NULL, 1, '4cee38fc-0bec-02fa-5019-581c665b1ca8', 'RT_Employees'),
('7a6b8a04-57eb-b9a8-87cc-581c7a6436b1', '', '2016-11-04 12:08:08', '2016-11-04 12:08:08', '1', '1', NULL, 0, NULL, NULL, 1, '8a9f12d8-d2de-db36-237e-581c7ab00c79', 'RT_Leaves'),
('7ac5a9f4-980f-2c3a-6635-5829a3d55da9', 'Payroll oftest  husy  4 2039', '2016-11-14 11:44:07', '2016-11-14 11:44:07', '1', '1', NULL, 0, NULL, NULL, 1, '2059efcb-f22b-9037-d4af-5829a3203e0a', 'RT_Payroll'),
('7b0800ed-7858-bce5-2d61-5823167836f4', 'Leave of emp 9 nov', '2016-11-09 12:28:04', '2016-11-09 12:28:04', '1', '1', NULL, 0, NULL, NULL, 1, 'c075dcfc-9153-fefd-72fc-582316bb1c47', 'RT_Leaves'),
('7b8f0e73-a321-a938-c426-581c74996a6d', '', '2016-11-04 11:44:56', '2016-11-04 11:44:56', '1', '1', NULL, 0, NULL, NULL, 1, '4c01e199-f86f-848b-6ac9-581c748e4c35', 'RT_Leaves'),
('7c5f4ea2-b620-b121-9c97-58231b9a8ed3', 'Leave of emp 9 nov', '2016-11-09 12:51:08', '2016-11-09 12:51:08', '1', '1', NULL, 0, NULL, NULL, 1, '3085909b-b6cb-ff1d-7071-58231bca89c3', 'RT_Leaves'),
('7c9f48b9-513f-d0f3-1e1b-5821d7a1967c', '', '2016-11-08 13:46:40', '2016-11-08 13:46:40', '1', '1', NULL, 0, NULL, NULL, 1, 'c07b1019-4c8c-7cde-8e21-5821d7022658', 'RT_Leaves'),
('7cf82db6-ce2f-bd19-653b-581c62af4c8e', 'Leave of employee for leave', '2016-11-04 10:26:33', '2016-11-04 10:26:33', '1', '1', NULL, 0, NULL, NULL, 1, '19265a90-5689-f00f-8b05-581c62bbd81d', 'RT_Leaves'),
('7db2ab9a-427f-aaa5-157e-5829646c9339', 'Payroll oftest salary  2 2018', '2016-11-14 07:14:27', '2016-11-14 07:14:27', '1', '1', NULL, 0, NULL, NULL, 1, 'e46e7403-ba32-91b2-ffeb-582964e22612', 'RT_Payroll'),
('7dea4241-9721-cac7-4bc8-5829a1b1ceb5', 'Payroll oftest  husy  12 2000', '2016-11-14 11:37:31', '2016-11-14 11:37:31', '1', '1', NULL, 0, NULL, NULL, 1, '1b03ecc7-5ca0-e9e8-b11e-5829a1e5f5d6', 'RT_Payroll'),
('7ed6a968-0ed3-d0c1-7b73-581c5621150a', '', '2016-11-04 09:35:21', '2016-11-04 09:35:21', '1', '1', NULL, 0, NULL, NULL, 1, 'eaab9c3e-de01-df4d-b1ca-581c566fc192', 'RT_Leaves'),
('7f7237a7-191d-d17c-5ca4-58247d1dc146', 'Leave of husy test today 9 nov', '2016-11-10 14:01:16', '2016-11-10 14:01:16', '1', '1', NULL, 0, NULL, NULL, 1, 'dd0f48ef-fb2c-0d12-e9d2-58247d88a1aa', 'RT_Leaves'),
('81d71fab-1ba2-ffc7-5d7a-581c69d0dd8e', 'Leave of atif zulfiqar', '2016-11-04 10:57:11', '2016-11-04 10:57:11', '1', '1', NULL, 0, NULL, NULL, 1, 'e9368a32-4066-ec82-a325-581c69ad38f3', 'RT_Leaves'),
('81e74ffa-498a-120e-ad56-5829660e0368', 'Payroll ofsalary tt  6 2016', '2016-11-14 07:24:52', '2016-11-14 07:24:52', '1', '1', NULL, 0, NULL, NULL, 1, 'e78c4efb-2851-17ac-9d45-58296696102c', 'RT_Payroll'),
('846ba2b9-cbb6-ea78-d90a-58299d5323d5', 'Mr. test  husy', '2016-11-14 11:20:13', '2016-11-14 11:20:13', '1', '1', NULL, 0, NULL, NULL, 1, '4293caf3-8658-7509-b509-58299d9743d6', 'RT_Employees'),
('847f1bbe-505a-3dfc-e4c3-5821b949e7dc', '', '2016-11-08 11:41:17', '2016-11-08 11:41:17', '1', '1', NULL, 0, NULL, NULL, 1, '41718e72-0e01-c6d9-daa1-5821b9d79e5a', 'RT_Leaves'),
('84e205f5-2d6c-f27d-913d-5821d903d01f', '', '2016-11-08 13:55:03', '2016-11-08 13:55:03', '1', '1', NULL, 0, NULL, NULL, 1, 'a7947dc8-307d-eecb-e62e-5821d9ff128a', 'RT_Leaves'),
('855c752b-6d15-3021-fc8d-582ad8ef1b67', 'Payroll oftoday 15  2 2000', '2016-11-15 09:43:29', '2016-11-15 09:43:29', '1', '1', NULL, 0, NULL, NULL, 1, '1d59088b-e5b4-1511-093b-582ad8cfe726', 'RT_Payroll'),
('86006e4e-20ff-2536-2c7b-5819c64a6433', 'Review From of husnain zaheer', '2016-11-02 10:56:36', '2016-11-02 10:56:36', NULL, NULL, NULL, 0, NULL, NULL, 1, '44155671-ec64-9c0e-de07-5819c650fc73', 'RT_Performance_Reviews'),
('861b0dc5-48ec-1d0b-599b-582add761fd3', 'Payroll 4 2000', '2016-11-15 10:03:28', '2016-11-15 10:03:28', '1', '1', NULL, 0, NULL, NULL, 1, '78399783-e3dd-c4e2-3ddc-582addb37d7f', 'RT_Payroll'),
('87909b5c-a356-af06-84cf-58219f3b5cad', 'Mr. june employee', '2016-11-08 09:50:11', '2016-11-09 13:09:06', '1', '1', NULL, 0, '', NULL, 1, '5b8d9fce-7389-baa6-071e-58219f695d0d', 'RT_Employees'),
('88d50de9-1dc6-ea96-30de-582176d03aeb', '', '2016-11-08 06:52:09', '2016-11-08 06:52:09', '1', '1', NULL, 0, NULL, NULL, 1, 'c1e80568-78c2-8167-ec76-5821764cba73', 'RT_Leaves'),
('895537dc-10c4-1e71-6053-58243c184ac8', '', '2016-11-10 09:24:46', '2016-11-10 09:24:46', '1', '1', NULL, 0, NULL, NULL, 1, '62fd92c9-23ac-4c2c-b850-58243c409f39', 'RT_Increment_History'),
('89646d09-d88e-ed77-481d-5825c77d541d', '', '2016-11-11 13:30:06', '2016-11-11 13:30:06', '1', '1', NULL, 0, NULL, NULL, 1, 'ffcd0c9e-5635-ffe7-63c0-5825c79c6317', 'RT_Payroll'),
('898c02a5-9d48-4ab7-1ba5-582176f1ee29', '', '2016-11-08 06:54:54', '2016-11-08 06:54:54', '1', '1', NULL, 0, NULL, NULL, 1, '41223377-d844-da08-c26a-58217613efd5', 'RT_Leaves'),
('8b718b14-d876-6d43-a1b8-58247eccb8b0', 'Leave of husy test today 9 nov', '2016-11-10 14:03:00', '2016-11-10 14:03:00', '1', '1', NULL, 0, NULL, NULL, 1, 'd0a81696-1830-283a-bba5-58247e715a9b', 'RT_Leaves'),
('8c507446-2241-ec69-de0a-582459f28efc', 'atif zulfiqar''s Increment', '2016-11-10 11:25:03', '2016-11-10 11:25:03', '1', '1', NULL, 0, NULL, NULL, 1, '5d66c897-c74c-b496-e85b-5824594da37c', 'RT_Increment_History'),
('8ce8e56d-1c69-415b-5c0c-582d93846c16', '', '2016-11-17 11:23:28', '2016-11-17 11:23:28', '1', '1', NULL, 0, NULL, NULL, 1, '1db6d2be-baab-732d-722e-582d93b42832', 'RT_SalarySetting'),
('8e047019-72ea-d741-c5f1-5829906ebeb0', 'Payroll ofatif zulfiqar  3 2000', '2016-11-14 10:24:38', '2016-11-14 10:24:38', '1', '1', NULL, 0, NULL, NULL, 1, '42c5b9b2-3d33-1c9f-e652-5829905a23af', 'RT_Payroll'),
('8f33ad0b-6ad6-31b8-dc14-580726655b94', '', '2016-10-19 07:51:55', '2016-10-19 07:51:55', '1', '1', NULL, 0, NULL, NULL, 1, '694544af-02e6-df1c-660b-580726cdc011', 'RT_Leaves'),
('8f8c0f29-473c-6e5b-c1e6-58247d21fe82', 'Leave of husy test today 9 nov', '2016-11-10 14:01:35', '2016-11-10 14:01:35', '1', '1', NULL, 0, NULL, NULL, 1, '659567aa-6fb5-084c-f5e1-58247d2f74b8', 'RT_Leaves'),
('90a96967-e0ec-6ca7-b58f-581c739b0496', '', '2016-11-04 11:37:36', '2016-11-04 11:37:36', '1', '1', NULL, 0, NULL, NULL, 1, 'e37d4cc2-073e-b47d-6ce2-581c724e7a26', 'RT_Leaves'),
('90c3d739-17f3-5dd6-c350-5829abc6e61c', 'Payroll oftest  husy  2 2014', '2016-11-14 12:16:00', '2016-11-14 12:16:00', '1', '1', NULL, 0, NULL, NULL, 1, '72fecb72-ebc7-faa4-e6f0-5829abfc67dd', 'RT_Payroll'),
('92bf4c74-d7b6-257c-d0f6-58299e2ef307', 'Payroll oftest  husy  3 2000', '2016-11-14 11:21:06', '2016-11-14 11:21:06', '1', '1', NULL, 0, NULL, NULL, 1, '3d804963-2a2d-42b5-5c51-58299e62da38', 'RT_Payroll'),
('94739ad1-b797-c7b4-354f-58232fc8a1a4', '', '2016-11-09 14:13:29', '2016-11-09 14:13:29', '1', '1', NULL, 0, NULL, NULL, 1, '734bf743-e260-fb91-2dae-58232f7f8ef5', 'RT_Bonus'),
('9476fea6-9b9a-44d0-d116-58171e6d9be0', 'Review From of husnain zaheer', '2016-10-31 10:34:00', '2016-10-31 10:34:00', NULL, NULL, NULL, 0, NULL, NULL, 1, '50ac8508-08e8-dcb0-6c00-58171ead37a2', 'RT_Performance_Reviews'),
('9702d03b-5eb7-2ba2-89a7-5821d524fb22', '', '2016-11-08 13:41:18', '2016-11-08 13:41:18', '1', '1', NULL, 0, NULL, NULL, 1, 'f187850e-5eb1-6816-1e33-5821d5e0b007', 'RT_Leaves'),
('98001f2c-abb2-54fe-a955-58296d264f5c', 'Payroll oftest  14 nov  4 2000', '2016-11-14 07:53:18', '2016-11-14 07:53:18', '1', '1', NULL, 0, NULL, NULL, 1, 'f132fc43-4e0a-169b-22d9-58296dd665c3', 'RT_Payroll'),
('99311c81-eb5e-ca3a-f02e-5808915b3b0b', '', '2016-10-20 09:44:04', '2016-10-20 09:44:04', '1', '1', NULL, 0, NULL, NULL, 1, '7058ff62-783f-6f91-a8a8-58089136bb30', 'RT_Leaves'),
('997b6e40-4fec-ac5d-31c4-581c6aaf3b5a', '', '2016-11-04 11:03:08', '2016-11-04 11:03:08', '1', '1', NULL, 0, NULL, NULL, 1, 'c85603f4-3a42-b365-c44d-581c6a3bf950', 'RT_Leaves'),
('9af26e63-1df4-37fb-4370-58170f400f7b', 'Review From of husnain zaheer', '2016-10-31 09:30:43', '2016-10-31 09:30:43', NULL, NULL, NULL, 0, NULL, NULL, 1, '3add0b84-d56b-d9d8-ac38-58170ff09679', 'RT_Performance_Reviews'),
('9c675d1b-ec1d-27cb-d205-5821d81c5a99', '', '2016-11-08 13:53:13', '2016-11-08 13:53:13', '1', '1', NULL, 0, NULL, NULL, 1, 'dc15356c-6776-8ed7-2acf-5821d8c262ac', 'RT_Leaves'),
('9c701227-1ec6-90b6-2872-58230f4a292d', 'Leave of emp 9 nov', '2016-11-09 11:57:40', '2016-11-09 11:57:40', '1', '1', NULL, 0, NULL, NULL, 1, '11ff3e86-2627-0d0e-4dc0-58230fa6d227', 'RT_Leaves'),
('9eb557cd-54ae-7b4b-821e-5808b95ee356', '', '2016-10-20 12:32:46', '2016-10-20 12:32:46', '1', '1', NULL, 0, NULL, NULL, 1, '7c4e0a55-b473-664d-420f-5808b9f51bee', 'RT_Leaves'),
('a060ee7e-3dad-eb86-78db-581c626b0c2f', 'Mr. employee for leave', '2016-11-04 10:25:20', '2016-11-04 10:26:33', '1', '1', NULL, 0, '', NULL, 1, '737b29ff-85b2-7f4f-d66c-581c6273b780', 'RT_Employees'),
('a179cb5e-62d9-6c66-fba0-58231f637f59', 'Leave of june employee', '2016-11-09 13:09:06', '2016-11-09 13:09:06', '1', '1', NULL, 0, NULL, NULL, 1, '4966853f-41b5-2032-0219-58231f2ae509', 'RT_Leaves'),
('a486aec9-abb6-1170-f164-581c8391468c', 'Mr. aoa test', '2016-11-04 12:48:49', '2016-11-04 13:01:22', '1', '1', NULL, 0, '', NULL, 1, '62c78e6c-5337-4b88-ac6c-581c83e61401', 'RT_Employees'),
('a5942e5b-e070-ac5d-b2e8-582ad98755ac', 'Payroll oftoday 15  3 2000', '2016-11-15 09:45:58', '2016-11-15 09:45:58', '1', '1', NULL, 0, NULL, NULL, 1, '3ca9a804-a7b2-9142-01ad-582ad9827124', 'RT_Payroll'),
('a5b346ed-8787-3c94-92ab-582171da89a8', '', '2016-11-08 06:31:32', '2016-11-08 06:31:32', '1', '1', NULL, 0, NULL, NULL, 1, '622f15d5-633f-c997-4c9f-582171e30b10', 'RT_Leaves'),
('a64880a5-b423-52fd-c0be-582463fe6690', 'Mrs. salary tt', '2016-11-10 12:09:54', '2016-11-10 12:09:54', '1', '1', NULL, 0, NULL, NULL, 1, '77eb48eb-2ff9-6767-cf58-582463a18d3e', 'RT_Employees'),
('a67dc8bb-c5d0-51a2-a961-582457467d13', 'tttt zzzz''s Increment', '2016-11-10 11:19:34', '2016-11-10 11:19:34', '1', '1', NULL, 0, NULL, NULL, 1, '7f877ffd-ee3a-86d4-6100-582457c6c75b', 'RT_Increment_History'),
('a6f807e4-8997-ca5c-df7a-5818459ce0d6', 'Review From of husnain zaheer', '2016-11-01 07:36:08', '2016-11-01 07:36:08', NULL, NULL, NULL, 0, NULL, NULL, 1, '904e660c-aabd-f146-f604-5818456e24f5', 'RT_Performance_Reviews'),
('a7bff16c-1041-fcc3-be69-5821719a5fe1', '', '2016-11-08 06:30:53', '2016-11-08 06:30:53', '1', '1', NULL, 0, NULL, NULL, 1, '6c208010-20a1-5a91-655c-5821715a1605', 'RT_Leaves'),
('a83b2c6d-5f0d-086f-bd98-581c841a7880', '', '2016-11-04 12:50:20', '2016-11-04 12:50:20', '1', '1', NULL, 0, NULL, NULL, 1, 'a08b92d4-cc8d-e8f9-a5c8-581c84d5153d', 'RT_Leaves'),
('a8cf0ee4-18bc-338c-5835-5825c9dcbe08', '', '2016-11-11 13:35:17', '2016-11-11 13:35:17', '1', '1', NULL, 0, NULL, NULL, 1, 'eb610699-b999-6e3b-1070-5825c9738138', 'RT_Payroll'),
('a8f20218-2b85-6de2-b660-58230b1a5633', 'Leave of today employee', '2016-11-09 11:42:20', '2016-11-09 11:42:20', '1', '1', NULL, 0, NULL, NULL, 1, '95d66fd6-1dd0-f716-96b1-58230bbd8c1c', 'RT_Leaves'),
('aa748ccd-16fc-f9f6-a351-581302549d1c', 'Review From of husnain zaheer', '2016-10-28 07:45:04', '2016-10-28 07:45:04', NULL, NULL, NULL, 0, NULL, NULL, 1, '51f5c0ba-2e0b-fdb8-3770-5813023fa39c', 'RT_Performance_Reviews'),
('ad1cf582-f548-2efc-3ce4-58133438df65', 'Review From of husnain zaheer', '2016-10-28 11:19:19', '2016-10-28 11:19:19', NULL, NULL, NULL, 0, NULL, NULL, 1, '6a1dc9e9-c5e7-b784-fe11-581334302afd', 'RT_Performance_Reviews'),
('ade2c7d8-ff6d-b08a-c73b-58132fd94683', 'Review From of husnain zaheer', '2016-10-28 10:58:26', '2016-10-28 10:58:26', NULL, NULL, NULL, 0, NULL, NULL, 1, '62fc4a13-0a88-86f5-c80d-58132f45ad4e', 'RT_Performance_Reviews'),
('b02eb032-8d25-60a4-9132-58297058f97a', 'Payroll oftest  14 nov  2 2000', '2016-11-14 08:06:18', '2016-11-14 08:06:18', '1', '1', NULL, 0, NULL, NULL, 1, '6bac980a-8758-640b-911a-582970b96cf4', 'RT_Payroll'),
('b113d0ce-be52-21e7-2c73-58133329b6c9', 'Review From of husnain zaheer', '2016-10-28 11:15:23', '2016-10-28 11:15:23', NULL, NULL, NULL, 0, NULL, NULL, 1, '6b0aab72-8374-671d-adac-581333300f3a', 'RT_Performance_Reviews'),
('b311b7a1-1e12-2f03-fe92-582af0192717', 'asdas', '2016-11-15 11:25:35', '2016-11-15 11:25:35', '1', '1', NULL, 0, NULL, NULL, 1, '21680eb7-82a6-c46d-7002-582af0005131', 'Leads'),
('b44f2e66-323e-2e80-2283-581c98708486', '', '2016-11-04 14:19:15', '2016-11-04 14:19:15', '1', '1', NULL, 0, NULL, NULL, 1, '500e3875-e6ee-08f6-8430-581c98cc51e1', 'RT_Leaves'),
('b5d6ac51-2f81-1e08-cebb-581c79ddfa93', '', '2016-11-04 12:03:28', '2016-11-04 12:03:28', '1', '1', NULL, 0, NULL, NULL, 1, 'bd025d01-8668-fe8c-e51f-581c79e7913b', 'RT_Leaves'),
('b7560117-a9ba-ef46-7c09-5829c6f5914a', 'Mr. test  1412', '2016-11-14 14:13:16', '2016-11-14 14:13:16', '1', '1', NULL, 0, NULL, NULL, 1, 'c61b0bc1-4fd4-51ad-076c-5829c678e76e', 'RT_Employees'),
('b7a804d7-08c9-7f4c-9333-581c69f6659c', 'Leave of atif zulfiqar', '2016-11-04 10:55:33', '2016-11-04 10:55:33', '1', '1', NULL, 0, NULL, NULL, 1, '3eec9fff-4290-8187-aaab-581c69e626a5', 'RT_Leaves'),
('b89da9d1-079d-37c1-a757-58230f7e2546', 'Leave of emp 9 nov', '2016-11-09 11:58:52', '2016-11-09 11:58:52', '1', '1', NULL, 0, NULL, NULL, 1, '37f3d52e-4bd9-4354-07da-58230f7c59af', 'RT_Leaves'),
('ba136dae-f80f-f83a-9346-581c86924447', '', '2016-11-04 12:59:35', '2016-11-04 12:59:35', '1', '1', NULL, 0, NULL, NULL, 1, '8bf9a14b-2da0-091c-ec20-581c86b4c65f', 'RT_Leaves'),
('bb1c1a87-b57a-5bf3-112b-58245d04cd29', 'today employee''s Increment', '2016-11-10 11:43:03', '2016-11-10 11:43:03', '1', '1', NULL, 0, NULL, NULL, 1, '8fe8db60-3809-14ba-2bf5-58245d264aef', 'RT_Increment_History'),
('bc8c78e1-060a-9297-296e-5821d7e71494', '', '2016-11-08 13:45:46', '2016-11-08 13:45:46', '1', '1', NULL, 0, NULL, NULL, 1, '2534a194-117f-2e38-f651-5821d7325592', 'RT_Leaves'),
('bcae39ff-d368-01a1-e755-582998218bec', 'Payroll oftest  14 nov  2 2000', '2016-11-14 10:57:52', '2016-11-14 10:57:52', '1', '1', NULL, 0, NULL, NULL, 1, '7138d115-4d78-1efc-9894-58299872d26d', 'RT_Payroll'),
('be791df8-5611-f24a-5de9-5812ffc82a1e', 'Review From of husnain zaheer', '2016-10-28 07:36:27', '2016-10-28 07:36:27', NULL, NULL, NULL, 0, NULL, NULL, 1, '80e4157e-3880-d045-e1c1-5812ffdf3365', 'RT_Performance_Reviews'),
('c0c00acf-42d9-9c47-855d-5825e1e39c49', 'Payroll 6 0', '2016-11-11 15:19:18', '2016-11-11 15:19:18', '1', '1', NULL, 0, NULL, NULL, 1, '62e8ad8f-0bed-caff-5263-5825e1e92e2b', 'RT_Payroll'),
('c14926c3-dc7e-9417-6e4b-5825e05f8e4f', 'Mr. test 11', '2016-11-11 15:16:42', '2016-11-11 15:16:42', '1', '1', NULL, 0, NULL, NULL, 1, '4c74fae9-610d-e9a8-3ca1-5825e0f7fb39', 'RT_Employees'),
('c1576c14-c83d-28c6-fc48-582ab6fe1e46', 'Mr. today 15', '2016-11-15 07:16:23', '2016-11-15 07:43:13', '1', '1', NULL, 0, '', NULL, 1, '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', 'RT_Employees'),
('c21d3ca7-7dc6-388e-1624-5821b740f2b2', '', '2016-11-08 11:29:39', '2016-11-08 11:29:39', '1', '1', NULL, 0, NULL, NULL, 1, '7f9a566e-44be-52c0-8c33-5821b7228c17', 'RT_Leaves'),
('c279923d-30ad-fc4a-b7a9-582983bbba9f', 'Payroll oftest  14 nov  5 2000', '2016-11-14 09:25:56', '2016-11-14 09:25:56', '1', '1', NULL, 0, NULL, NULL, 1, '7406bfc2-6344-bb15-400b-582983ce398c', 'RT_Payroll'),
('c27c1f41-f8ce-be76-368d-582457ba84e1', 'tes  now''s Increment', '2016-11-10 11:18:19', '2016-11-10 11:18:19', '1', '1', NULL, 0, NULL, NULL, 1, '9c58be18-11ab-5c5f-7eef-58245770104d', 'RT_Increment_History'),
('c29186ac-0e07-1e5e-a8dd-581c7842fc36', '', '2016-11-04 11:58:59', '2016-11-04 11:58:59', '1', '1', NULL, 0, NULL, NULL, 1, '4fd3008c-dfc3-eca5-0970-581c78055f0c', 'RT_Leaves'),
('c34fb0c3-c9ed-e25d-12d1-582adabc9030', 'Payroll oftoday 15  2 2018', '2016-11-15 09:49:10', '2016-11-15 09:49:10', '1', '1', NULL, 0, NULL, NULL, 1, '60f2fb80-153d-d006-96a7-582adae1974c', 'RT_Payroll'),
('c3b26b79-de0c-d04a-5e7b-582426e01e86', '', '2016-11-10 07:49:47', '2016-11-10 07:49:47', '1', '1', NULL, 0, NULL, NULL, 1, '96883eab-a3ec-c063-5320-582426b0405e', 'RT_Increment_History'),
('c4dfa664-fd46-f734-378d-582ad056d73e', 'Payroll oftest  salary 14  3 2000', '2016-11-15 09:08:39', '2016-11-15 09:08:39', '1', '1', NULL, 0, NULL, NULL, 1, '5e21152b-a3f0-3963-06fe-582ad0384e13', 'RT_Payroll'),
('c63b9f97-c6e0-a5ca-2f0b-581217e67dea', 'Review From of test', '2016-10-27 15:05:23', '2016-10-27 15:05:23', NULL, NULL, NULL, 0, NULL, NULL, 1, '7077a3d8-d003-bcc3-c0f2-5812177e9e5d', 'RT_Performance_Reviews'),
('c6637356-2bdf-6dcb-10bd-5808b35d3fb1', '', '2016-10-20 12:07:49', '2016-10-20 12:07:49', '1', '1', NULL, 0, NULL, NULL, 1, 'a6c41491-3017-82a6-6f7b-5808b3105e88', 'RT_Qualifications'),
('c71074eb-487e-6fef-4d17-58171d20317d', 'Review From of husnain zaheer', '2016-10-31 10:31:41', '2016-10-31 10:31:41', NULL, NULL, NULL, 0, NULL, NULL, 1, '7ed10500-20e7-05e8-f6ae-58171dbb9e2b', 'RT_Performance_Reviews'),
('c783e353-79f2-d4c1-8b74-58230cf91b16', 'Leave of emp 9 nov', '2016-11-09 11:47:40', '2016-11-09 11:47:40', '1', '1', NULL, 0, NULL, NULL, 1, '564039c5-227b-f96d-4479-58230cd61214', 'RT_Leaves'),
('c7b99d4d-1ca5-b8d4-ea2b-58230c0a640f', 'Leave of emp 9 nov', '2016-11-09 11:47:56', '2016-11-09 11:47:56', '1', '1', NULL, 0, NULL, NULL, 1, '4884d4bc-8b2c-9927-6618-58230ceeb88c', 'RT_Leaves'),
('c82798f6-25aa-bdb5-8c55-5823217b75de', 'Mr. tes  now', '2016-11-09 13:17:25', '2016-11-09 13:19:38', '1', '1', NULL, 0, '', NULL, 1, '896268fc-c9d6-93cc-9fa8-582321bb0982', 'RT_Employees'),
('c8813938-b3b8-92c4-071f-581c6a0bd1a8', '', '2016-11-04 11:00:53', '2016-11-04 11:00:53', '1', '1', NULL, 0, NULL, NULL, 1, '30481dba-4507-4bb1-fdec-581c6a9ea798', 'RT_Leaves'),
('c940bdf3-cda8-f5e6-d18a-5825c53c6bc6', '', '2016-11-11 13:21:26', '2016-11-11 13:21:26', '1', '1', NULL, 0, NULL, NULL, 1, '8c40d965-eeca-bac4-4f87-5825c5eab376', 'RT_Payroll'),
('ca2f9e8d-e128-8d2d-f89a-58247874124c', 'ddd department', '2016-11-10 13:40:27', '2016-11-10 13:40:27', '1', '1', NULL, 0, NULL, NULL, 1, '9a07271f-2a55-a043-ce74-58247837cef2', 'RT_Departments'),
('caf40a20-a7a9-09af-118a-581216821771', '', '2016-10-27 15:00:03', '2016-10-27 15:00:03', NULL, NULL, NULL, 0, NULL, NULL, 1, 'b8648a61-c020-145e-1e36-58121616a03d', 'RT_Performance_Reviews'),
('cb885d29-528f-c79e-66b4-5825c4141a66', '', '2016-11-11 13:14:36', '2016-11-11 13:14:36', '1', '1', NULL, 0, NULL, NULL, 1, '7cf8d445-6a20-b0e2-611f-5825c4a05a03', 'RT_Payroll'),
('cb99cc35-a092-c774-edea-5812fc1c5d4b', 'Review From of husnain zaheer', '2016-10-28 07:22:03', '2016-10-28 07:22:03', NULL, NULL, NULL, 0, NULL, NULL, 1, '94f25950-b293-a47a-480e-5812fcfe3e55', 'RT_Performance_Reviews'),
('cbb11c62-5ec9-6b43-cb61-5821b83955ce', '', '2016-11-08 11:34:03', '2016-11-08 11:34:03', '1', '1', NULL, 0, NULL, NULL, 1, '65979b63-04ed-c281-e122-5821b84f1308', 'RT_Leaves'),
('cc0a0fb4-5fcf-b5a8-5d3e-58231c8f3085', 'Leave of emp 9 nov', '2016-11-09 12:53:34', '2016-11-09 12:53:34', '1', '1', NULL, 0, NULL, NULL, 1, '6dac0ea7-ae88-63ba-3828-58231c247757', 'RT_Leaves'),
('ccd78e24-158e-70b7-eb37-5821699ef136', 'Mr. today employee', '2016-11-08 05:57:50', '2016-11-09 12:56:33', '1', '1', NULL, 0, '', NULL, 1, '99155b84-6e60-e5ae-16fe-5821691782d2', 'RT_Employees');
INSERT INTO `aod_indexevent` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `error`, `success`, `record_id`, `record_module`) VALUES
('cf07650c-5ac1-1d03-bead-58242a9f03f7', '', '2016-11-10 08:06:53', '2016-11-10 08:06:53', '1', '1', NULL, 0, NULL, NULL, 1, 'a6e5427b-c6ce-9aee-7610-58242aee5454', 'RT_Increment_History'),
('d1e64680-7387-eaaa-ed31-581719ed2e89', 'Review From of husnain zaheer', '2016-10-31 10:13:28', '2016-10-31 10:13:28', NULL, NULL, NULL, 0, NULL, NULL, 1, '8e545015-dcae-5d1c-59e4-581719f6c3f7', 'RT_Performance_Reviews'),
('d1f8b3d1-f0f1-1096-9345-58298f3e8ccf', '', '2016-11-14 10:18:53', '2016-11-14 10:18:53', '1', '1', NULL, 0, NULL, NULL, 1, '8e84d12a-3f5a-b073-f61a-58298f1fd840', 'RT_Payroll'),
('d28605f1-b956-5031-af39-5821b826768d', '', '2016-11-08 11:35:49', '2016-11-08 11:35:49', '1', '1', NULL, 0, NULL, NULL, 1, '4c34c0b9-1005-059e-a17e-5821b858e340', 'RT_Leaves'),
('d2f317e7-c869-ecfb-0082-5829b6712113', 'Payroll oftest  husy  10 2019', '2016-11-14 13:03:17', '2016-11-14 13:03:17', '1', '1', NULL, 0, NULL, NULL, 1, '8c871776-2483-3da0-ad9b-5829b62acc3a', 'RT_Payroll'),
('d32dbcb5-70c3-844b-39b4-5823228ac8cb', 'Leave of tes  now', '2016-11-09 13:19:23', '2016-11-09 13:19:23', '1', '1', NULL, 0, NULL, NULL, 1, '9a701a8e-d47d-5a0d-7a9d-582322df6ce6', 'RT_Leaves'),
('d3657cc8-dce1-7ee5-bfeb-5822c17a0eb3', 'Leave of tttt zzzz', '2016-11-09 06:27:21', '2016-11-09 06:27:21', '1', '1', NULL, 0, NULL, NULL, 1, 'a41d1a4a-a1bd-32d1-66b1-5822c19cc74a', 'RT_Leaves'),
('d3708762-2ac5-16ca-6dba-5825b5d598b0', '', '2016-11-11 12:13:48', '2016-11-11 12:13:48', '1', '1', NULL, 0, NULL, NULL, 1, '9281d884-c67e-3b1e-56f9-5825b5f189cd', 'RT_Payroll'),
('d3d1c082-9e02-bd04-2acf-581714564fcd', 'Review From of husnain zaheer', '2016-10-31 09:53:31', '2016-10-31 09:53:31', NULL, NULL, NULL, 0, NULL, NULL, 1, '9491132d-e68a-fcc9-40f7-581714c715a5', 'RT_Performance_Reviews'),
('d458e5d7-892b-a775-a570-5811cbabfd4f', 'test performance for employee', '2016-10-27 09:38:54', '2016-10-27 09:38:54', '1', '1', NULL, 0, NULL, NULL, 1, 'a94e3eab-d01c-2585-6bf0-5811cbc1b574', 'RT_Performance_Reviews'),
('d46c9fbb-fb7b-d01a-871d-5813055d6e9d', 'Review From of husnain zaheer', '2016-10-28 08:00:11', '2016-10-28 08:00:11', NULL, NULL, NULL, 0, NULL, NULL, 1, '7e3d5522-0505-b3c2-b9d7-5813052b2a77', 'RT_Performance_Reviews'),
('d4a2693d-a335-9d7e-a821-582abc8359c5', 'Payroll oftoday 15  5 2000', '2016-11-15 07:43:23', '2016-11-15 07:43:23', '1', '1', NULL, 0, NULL, NULL, 1, '720d7f71-a2e5-d69f-4d9a-582abcedfbaf', 'RT_Payroll'),
('d4aff8fb-6ade-ce4d-29fc-5811f9aca7c5', 'Mr. test sent mail', '2016-10-27 12:57:32', '2016-10-27 12:57:32', '1', '1', NULL, 0, NULL, NULL, 1, 'a2e6184f-8d21-2ec4-8641-5811f94d96b7', 'RT_Employees'),
('d50ad8b3-36e2-188d-78a6-58230b89197d', 'Leave of today employee', '2016-11-09 11:40:45', '2016-11-09 11:40:45', '1', '1', NULL, 0, NULL, NULL, 1, '71faec55-d518-cebd-93e2-58230b102fa8', 'RT_Leaves'),
('d5a679c1-1b78-170e-3121-581b227c8724', '', '2016-11-03 11:40:12', '2016-11-03 11:40:12', '1', '1', NULL, 0, NULL, NULL, 1, 'ae47905b-5d04-1e9d-d20c-581b22b2d79d', 'RT_Leaves'),
('d648aaa6-e8ef-91ff-3c03-581c6ce0c04f', '', '2016-11-04 11:08:24', '2016-11-04 11:08:24', '1', '1', NULL, 0, NULL, NULL, 1, '3f5ec5f7-dec1-1e04-773e-581c6c81dbd4', 'RT_Leaves'),
('d70ba99c-53da-08de-00ce-58232273e9cc', 'Leave of tes  now', '2016-11-09 13:19:04', '2016-11-09 13:19:04', '1', '1', NULL, 0, NULL, NULL, 1, '637d6d0d-f08c-95e2-e09f-5823221aef5c', 'RT_Leaves'),
('d7e997f2-684d-0ab1-200b-5822f3a03d6d', 'Leave of last year employee', '2016-11-09 09:57:47', '2016-11-09 09:57:47', '1', '1', NULL, 0, NULL, NULL, 1, '90809499-5deb-dab0-6e7d-5822f33c05d8', 'RT_Leaves'),
('d82b9c5c-8ccc-e6c8-06ea-5822c1254eee', 'Leave of june employee', '2016-11-09 06:27:44', '2016-11-09 06:27:44', '1', '1', NULL, 0, NULL, NULL, 1, '23850b8d-971e-b019-3405-5822c1f17ef0', 'RT_Leaves'),
('d92005b6-3781-1d01-89f5-5821a2483f78', '', '2016-11-08 10:03:34', '2016-11-08 10:03:34', '1', '1', NULL, 0, NULL, NULL, 1, '6922b4ba-ca6a-6b17-5ca4-5821a27a418f', 'RT_Leaves'),
('d994c4ac-a423-c3b7-06c0-582ab92f0cb2', 'Payroll oftoday 15  8 2000', '2016-11-15 07:31:06', '2016-11-15 07:31:06', '1', '1', NULL, 0, NULL, NULL, 1, '830dda78-8101-a286-f063-582ab926964e', 'RT_Payroll'),
('dbe4479b-77a7-f23e-edf6-582dc41d47e1', '', '2016-11-17 14:53:31', '2016-11-17 14:53:31', '1', '1', NULL, 0, NULL, NULL, 1, '76c27d1b-761a-160b-2cc4-582dc4a42c32', 'RT_SalarySetting'),
('dc620392-6091-8aaf-210b-5812fbfc8630', 'Review From of husnain zaheer', '2016-10-28 07:18:38', '2016-10-28 07:18:38', NULL, NULL, NULL, 0, NULL, NULL, 1, 'c5a964a5-00fb-e257-6550-5812fb49e762', 'RT_Performance_Reviews'),
('dc87a8ed-9737-cfd4-a6b9-5821cc76d128', 'Mr. tttt zzzz', '2016-11-08 13:02:01', '2016-11-09 06:27:20', '1', '1', NULL, 0, '', NULL, 1, 'b49f614d-15c9-16f0-6756-5821ccd22e67', 'RT_Employees'),
('ddebcf9d-4e4f-433e-9440-58243d0bd9c5', 'today employee''s Increment', '2016-11-10 09:28:57', '2016-11-10 09:28:57', '1', '1', NULL, 0, NULL, NULL, 1, 'b42c2a3d-1df2-ff0a-8244-58243dc40703', 'RT_Increment_History'),
('de6f65f5-2868-6da5-8eab-58171532cafb', 'Review From of husnain zaheer', '2016-10-31 09:58:20', '2016-10-31 09:58:20', NULL, NULL, NULL, 0, NULL, NULL, 1, '97e865ac-22a5-1ff2-df90-581715d4f49b', 'RT_Performance_Reviews'),
('de99bd09-fd63-4e65-7d2b-5821daf8c176', '', '2016-11-08 13:58:48', '2016-11-08 13:58:48', '1', '1', NULL, 0, NULL, NULL, 1, '1476019d-17d2-50be-9958-5821dad98327', 'RT_Leaves'),
('e0fe04e5-cc38-57df-1e7f-5821bfcb5136', '', '2016-11-08 12:04:31', '2016-11-08 12:04:31', '1', '1', NULL, 0, NULL, NULL, 1, '985eb2a2-ec99-7a5e-de7f-5821bfe3dd6c', 'RT_Leaves'),
('e274c464-3262-81a4-1f93-58217698c980', ' ', '2016-11-08 06:52:09', '2016-11-08 06:52:09', '1', '1', NULL, 0, NULL, NULL, 1, 'c424908c-04c8-afea-f9bf-582176bc927b', 'RT_Employees'),
('e4d51dfe-074c-aa51-5842-58295e73c9ca', 'Payroll 6 0', '2016-11-14 06:48:21', '2016-11-14 06:48:21', '1', '1', NULL, 0, NULL, NULL, 1, '42ffbeac-7200-ddac-022d-58295ea1c62c', 'RT_Payroll'),
('e97791ba-64f8-a048-d764-5825dfd098ad', 'Payroll 6 0', '2016-11-11 15:10:31', '2016-11-11 15:10:31', '1', '1', NULL, 0, NULL, NULL, 1, '37c2bca6-9f8a-3e5d-f923-5825df350d1d', 'RT_Payroll'),
('e9f3ba12-2468-ac85-5756-5821d8414a76', '', '2016-11-08 13:52:04', '2016-11-08 13:52:04', '1', '1', NULL, 0, NULL, NULL, 1, '39403597-f44d-c538-f1bd-5821d8eef470', 'RT_Leaves'),
('ea49f36e-f972-8a93-5c82-582adda0e3d6', 'Payroll oftoday 15  4 2000', '2016-11-15 10:02:07', '2016-11-15 10:02:07', '1', '1', NULL, 0, NULL, NULL, 1, '86e7607f-c180-e30a-b4fb-582addbc9340', 'RT_Payroll'),
('eb2bd19c-5b5b-5cdd-dc86-580716c37dfb', 'Mr. sdf asd', '2016-10-19 06:43:31', '2016-10-19 06:43:31', '1', '1', NULL, 0, NULL, NULL, 1, 'cbc44f6d-7fde-b86e-4840-5807169cff66', 'RT_Employees'),
('ec09edad-53b4-f4c1-54ac-5804b92bee53', 'Mr. husnain zaheer', '2016-10-17 11:43:59', '2016-11-04 06:57:33', '1', '1', NULL, 0, '', NULL, 1, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0', 'RT_Employees'),
('ec6b601a-3d9f-cc76-e7e6-581c904f072e', 'Mr. final employee', '2016-11-04 13:42:40', '2016-11-04 14:19:15', '1', '1', NULL, 0, '', NULL, 1, 'f11e5fcb-8d57-5814-e16a-581c90c81020', 'RT_Employees'),
('ef6792d1-23d1-4334-72a7-5821d89a2273', '', '2016-11-08 13:53:40', '2016-11-08 13:53:40', '1', '1', NULL, 0, NULL, NULL, 1, '22499e10-79d6-60b9-59af-5821d8fd01f4', 'RT_Leaves'),
('efe8c191-f5fa-10c4-9c81-58247a859b56', 'abc depe', '2016-11-10 13:46:43', '2016-11-10 13:46:43', '1', '1', NULL, 0, NULL, NULL, 1, 'c5ca876e-d20b-f66a-2615-58247ae5294e', 'RT_Departments'),
('f0806951-102f-10a8-676a-581b1705c51d', '', '2016-11-03 10:55:07', '2016-11-03 10:55:07', '1', '1', NULL, 0, NULL, NULL, 1, '96cf4478-e63f-8c1f-8b9d-581b17c6b282', 'RT_Leaves'),
('f141177f-221b-aebe-6d12-5812fc684cad', 'Review From of husnain zaheer', '2016-10-28 07:21:33', '2016-10-28 07:21:33', NULL, NULL, NULL, 0, NULL, NULL, 1, 'b5bf6daf-72e8-115c-7998-5812fcd722be', 'RT_Performance_Reviews'),
('f28d9b73-3c29-f1d2-b220-5823140e91a4', 'Leave of today employee', '2016-11-09 12:21:35', '2016-11-09 12:21:35', '1', '1', NULL, 0, NULL, NULL, 1, '617c81cf-bebf-e0e9-2cd4-582314c928df', 'RT_Leaves'),
('f296dac2-2436-bf09-5b60-582475e7518f', 'test department aaaa', '2016-11-10 13:28:31', '2016-11-10 13:28:31', '1', '1', NULL, 0, NULL, NULL, 1, 'c09d990f-111e-9ec0-38da-582475159060', 'RT_Departments'),
('f2f150c1-3d64-9998-aedb-581c93c649b9', '', '2016-11-04 13:58:09', '2016-11-04 13:58:09', '1', '1', NULL, 0, NULL, NULL, 1, 'a0a6137f-140a-04bb-f488-581c93c270cc', 'RT_Leaves'),
('f3e290b1-3ba9-b655-634a-581c7bcfe938', '', '2016-11-04 12:12:36', '2016-11-04 12:12:36', '1', '1', NULL, 0, NULL, NULL, 1, 'e5e6f07c-4366-f093-7d27-581c7b00a90a', 'RT_Leaves'),
('f95c0a0b-72a2-133c-16d9-581c86c0d780', '', '2016-11-04 13:00:56', '2016-11-04 13:00:56', '1', '1', NULL, 0, NULL, NULL, 1, 'cc53e6dc-2b70-41f6-27d2-581c868cc431', 'RT_Leaves');

-- --------------------------------------------------------

--
-- Table structure for table `aod_indexevent_audit`
--

CREATE TABLE IF NOT EXISTS `aod_indexevent_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aod_indexevent_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aod_index_audit`
--

CREATE TABLE IF NOT EXISTS `aod_index_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aod_index_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledgebase`
--

CREATE TABLE IF NOT EXISTS `aok_knowledgebase` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `revision` varchar(255) DEFAULT NULL,
  `additional_info` text,
  `user_id_c` char(36) DEFAULT NULL,
  `user_id1_c` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledgebase_audit`
--

CREATE TABLE IF NOT EXISTS `aok_knowledgebase_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledgebase_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledgebase_categories`
--

CREATE TABLE IF NOT EXISTS `aok_knowledgebase_categories` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aok_knowledgebase_id` varchar(36) DEFAULT NULL,
  `aok_knowledge_base_categories_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aok_knowledgebase_categories_alt` (`aok_knowledgebase_id`,`aok_knowledge_base_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledge_base_categories`
--

CREATE TABLE IF NOT EXISTS `aok_knowledge_base_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aok_knowledge_base_categories_audit`
--

CREATE TABLE IF NOT EXISTS `aok_knowledge_base_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledge_base_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_events`
--

CREATE TABLE IF NOT EXISTS `aop_case_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_events_audit`
--

CREATE TABLE IF NOT EXISTS `aop_case_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_updates`
--

CREATE TABLE IF NOT EXISTS `aop_case_updates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aop_case_updates_audit`
--

CREATE TABLE IF NOT EXISTS `aop_case_updates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_updates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_charts`
--

CREATE TABLE IF NOT EXISTS `aor_charts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `x_field` int(11) DEFAULT NULL,
  `y_field` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_conditions`
--

CREATE TABLE IF NOT EXISTS `aor_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `logic_op` varchar(255) DEFAULT NULL,
  `parenthesis` varchar(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `parameter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_conditions_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_fields`
--

CREATE TABLE IF NOT EXISTS `aor_fields` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `field_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `link` tinyint(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `field_function` varchar(100) DEFAULT NULL,
  `sort_by` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `group_by` tinyint(1) DEFAULT NULL,
  `group_order` varchar(100) DEFAULT NULL,
  `group_display` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_fields_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_reports`
--

CREATE TABLE IF NOT EXISTS `aor_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `report_module` varchar(100) DEFAULT NULL,
  `graphs_per_row` int(11) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_reports_audit`
--

CREATE TABLE IF NOT EXISTS `aor_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aor_reports_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aor_scheduled_reports`
--

CREATE TABLE IF NOT EXISTS `aor_scheduled_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `schedule` varchar(100) DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `email_recipients` longtext,
  `aor_report_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts`
--

CREATE TABLE IF NOT EXISTS `aos_contracts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_contract_value` decimal(26,6) DEFAULT NULL,
  `total_contract_value_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `customer_signed_date` date DEFAULT NULL,
  `company_signed_date` date DEFAULT NULL,
  `renewal_reminder_date` datetime DEFAULT NULL,
  `contract_type` varchar(100) DEFAULT 'Type',
  `contract_account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts_audit`
--

CREATE TABLE IF NOT EXISTS `aos_contracts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_contracts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_contracts_documents`
--

CREATE TABLE IF NOT EXISTS `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_invoices`
--

CREATE TABLE IF NOT EXISTS `aos_invoices` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `quote_number` int(11) DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `template_ddown_c` text,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_invoices_audit`
--

CREATE TABLE IF NOT EXISTS `aos_invoices_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_invoices_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_line_item_groups`
--

CREATE TABLE IF NOT EXISTS `aos_line_item_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_line_item_groups_audit`
--

CREATE TABLE IF NOT EXISTS `aos_line_item_groups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_line_item_groups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_pdf_templates`
--

CREATE TABLE IF NOT EXISTS `aos_pdf_templates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `type` varchar(100) DEFAULT NULL,
  `pdfheader` text,
  `pdffooter` text,
  `margin_left` int(255) DEFAULT '15',
  `margin_right` int(255) DEFAULT '15',
  `margin_top` int(255) DEFAULT '16',
  `margin_bottom` int(255) DEFAULT '16',
  `margin_header` int(255) DEFAULT '9',
  `margin_footer` int(255) DEFAULT '9',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aos_pdf_templates`
--

INSERT INTO `aos_pdf_templates` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `active`, `type`, `pdfheader`, `pdffooter`, `margin_left`, `margin_right`, `margin_top`, `margin_bottom`, `margin_header`, `margin_footer`) VALUES
('1689f62b-fb36-3071-89d4-582ee080f758', 'aaaa', '2016-11-18 11:06:39', '2016-11-18 11:06:39', '1', '1', '<table style="width: 100%;" border="0" cellspacing="2" cellpadding="2">\r\n<tbody style="text-align: left;">\r\n<tr>\r\n<td valign="top">\r\n<p><img style="float: left;" src="themes/default/images/company_logo.png" alt="" /> </p>\r\n</td>\r\n<td style="font-weight: bold; text-align: right;">\r\n<div>SuiteCRM Ltd<br />Any Street<br />Any Town<br />Any Where</div>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div> </div>\r\n<div>$contacts_name</div>\r\n<div>$accounts_name<br /> $contacts_primary_address_street<br /> $contacts_primary_address_city<br /> $contacts_primary_address_state<br /> $contacts_primary_address_postalcode</div>\r\n<div> </div>\r\n<div>{DATE m/d/Y}</div>\r\n<div> </div>\r\n<p>Dear $contacts_first_name</p>\r\n<p>OpenSales was originally designed and conceived by Rustin Phares. In 2009, when Rustin could no longer devote time to the project, which is an important one for the Community Edition of SugarCRM, SalesAgility approached him to seek permission to pick up where he had left off.</p>\r\n<p>In early 2010 we released the first iteration of what was now to be called "Advanced OpenSales". Since then there have been regular releases to bring Advanced OpenSales into line with the latest releases of SugarCRM and to advance the functionality.</p>\r\n<p>2011 saw a complete rewrite of Advanced OpenSales to bring it into line with the 5.x and 6.x architectures and the introduction of an Invoice module. In March 2011, an Invoicing module for SugarCRM Professional Edition was also released.</p>\r\n<p>Advanced OpenSales is released under the Affero General Purpose License meaning it''s Open Source and freely available. That does not mean that there is no cost involved in making it. Thousands of man hours have gone in to developing and maintaining these modules. Any contributions that assist us in keeping the project on an even keel are gratefully received.</p>\r\n<p>SalesAgility are SugarCRM experts. With offices in Manchester and Central Scotland, we''re ideally placed to serve your SugarCRM requirements. As consultants, we design and implement tailored Sugar CRM instances. As software developers, we design and deliver customised instances of Sugar CRM that meet the more specialist needs of our clients. As a support organisation we deliver training, hosting and help-desk services to ensure that our clients continue to get best value from their Sugar investment.</p>\r\n<p>Yours sincerely</p>\r\n<p> </p>\r\n<p> </p>\r\n<p>Someone</p>', 0, '1', 1, 'Contacts', '', '', 15, 15, 16, 16, 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `aos_pdf_templates_audit`
--

CREATE TABLE IF NOT EXISTS `aos_pdf_templates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_pdf_templates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products`
--

CREATE TABLE IF NOT EXISTS `aos_products` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `maincode` varchar(100) DEFAULT 'XXXX',
  `part_number` varchar(25) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'Good',
  `cost` decimal(26,6) DEFAULT NULL,
  `cost_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `price` decimal(26,6) DEFAULT NULL,
  `price_usdollar` decimal(26,6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `aos_product_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_audit`
--

CREATE TABLE IF NOT EXISTS `aos_products_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_quotes`
--

CREATE TABLE IF NOT EXISTS `aos_products_quotes` (
  `id` char(36) NOT NULL,
  `name` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `item_description` text,
  `number` int(11) DEFAULT NULL,
  `product_qty` int(18) DEFAULT NULL,
  `product_cost_price` decimal(26,6) DEFAULT NULL,
  `product_cost_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_list_price` decimal(26,6) DEFAULT NULL,
  `product_list_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount` decimal(26,6) DEFAULT NULL,
  `product_discount_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount_amount` decimal(26,6) DEFAULT NULL,
  `product_discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount` varchar(255) DEFAULT 'Percentage',
  `product_unit_price` decimal(26,6) DEFAULT NULL,
  `product_unit_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat_amt` decimal(26,6) DEFAULT NULL,
  `vat_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `product_total_price` decimal(26,6) DEFAULT NULL,
  `product_total_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat` varchar(100) DEFAULT '5.0',
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_products_quotes_audit`
--

CREATE TABLE IF NOT EXISTS `aos_products_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_product_categories`
--

CREATE TABLE IF NOT EXISTS `aos_product_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '0',
  `parent_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_product_categories_audit`
--

CREATE TABLE IF NOT EXISTS `aos_product_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_product_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes`
--

CREATE TABLE IF NOT EXISTS `aos_quotes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `approval_issue` text,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `number` int(11) NOT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `template_ddown_c` text,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `stage` varchar(100) DEFAULT 'Draft',
  `term` varchar(100) DEFAULT NULL,
  `terms_c` text,
  `approval_status` varchar(100) DEFAULT NULL,
  `invoice_status` varchar(100) DEFAULT 'Not Invoiced',
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_aos_invoices_c`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_audit`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_os_contracts_c`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aos_quotes_project_c`
--

CREATE TABLE IF NOT EXISTS `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_actions`
--

CREATE TABLE IF NOT EXISTS `aow_actions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `action_order` int(255) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `parameters` longtext,
  PRIMARY KEY (`id`),
  KEY `aow_action_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_conditions`
--

CREATE TABLE IF NOT EXISTS `aow_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_processed`
--

CREATE TABLE IF NOT EXISTS `aow_processed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `aow_processed_index_workflow` (`aow_workflow_id`,`status`,`parent_id`,`deleted`),
  KEY `aow_processed_index_status` (`status`),
  KEY `aow_processed_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_processed_aow_actions`
--

CREATE TABLE IF NOT EXISTS `aow_processed_aow_actions` (
  `id` varchar(36) NOT NULL,
  `aow_processed_id` varchar(36) DEFAULT NULL,
  `aow_action_id` varchar(36) DEFAULT NULL,
  `status` varchar(36) DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_workflow`
--

CREATE TABLE IF NOT EXISTS `aow_workflow` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `flow_module` varchar(100) DEFAULT NULL,
  `flow_run_on` varchar(100) DEFAULT '0',
  `status` varchar(100) DEFAULT 'Active',
  `run_when` varchar(100) DEFAULT 'Always',
  `multiple_runs` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aow_workflow_index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aow_workflow_audit`
--

CREATE TABLE IF NOT EXISTS `aow_workflow_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aow_workflow_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE IF NOT EXISTS `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_audit`
--

CREATE TABLE IF NOT EXISTS `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE IF NOT EXISTS `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_contacts`
--

CREATE TABLE IF NOT EXISTS `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_leads`
--

CREATE TABLE IF NOT EXISTS `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_reschedule`
--

CREATE TABLE IF NOT EXISTS `calls_reschedule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_reschedule_audit`
--

CREATE TABLE IF NOT EXISTS `calls_reschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_calls_reschedule_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calls_users`
--

CREATE TABLE IF NOT EXISTS `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE IF NOT EXISTS `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_audit`
--

CREATE TABLE IF NOT EXISTS `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_log`
--

CREATE TABLE IF NOT EXISTS `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_trkrs`
--

CREATE TABLE IF NOT EXISTS `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE IF NOT EXISTS `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  `state` varchar(100) DEFAULT 'Open',
  `contact_created_by_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cases_audit`
--

CREATE TABLE IF NOT EXISTS `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_bugs`
--

CREATE TABLE IF NOT EXISTS `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cases_cstm`
--

CREATE TABLE IF NOT EXISTS `cases_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`category`, `name`, `value`) VALUES
('notify', 'fromaddress', 'do_not_reply@example.com'),
('notify', 'fromname', 'SuiteCRM'),
('notify', 'send_by_default', '1'),
('notify', 'on', '1'),
('notify', 'send_from_assigning_user', '0'),
('info', 'sugar_version', '6.5.24'),
('MySettings', 'tab', 'YTo0NDp7czo0OiJIb21lIjtzOjQ6IkhvbWUiO3M6ODoiQWNjb3VudHMiO3M6ODoiQWNjb3VudHMiO3M6ODoiQ29udGFjdHMiO3M6ODoiQ29udGFjdHMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6NToiTGVhZHMiO3M6NToiTGVhZHMiO3M6MTA6IkFPU19RdW90ZXMiO3M6MTA6IkFPU19RdW90ZXMiO3M6ODoiQ2FsZW5kYXIiO3M6ODoiQ2FsZW5kYXIiO3M6OToiRG9jdW1lbnRzIjtzOjk6IkRvY3VtZW50cyI7czo2OiJFbWFpbHMiO3M6NjoiRW1haWxzIjtzOjU6IlNwb3RzIjtzOjU6IlNwb3RzIjtzOjk6IkNhbXBhaWducyI7czo5OiJDYW1wYWlnbnMiO3M6NToiQ2FsbHMiO3M6NToiQ2FsbHMiO3M6ODoiTWVldGluZ3MiO3M6ODoiTWVldGluZ3MiO3M6NToiVGFza3MiO3M6NToiVGFza3MiO3M6NToiTm90ZXMiO3M6NToiTm90ZXMiO3M6MTI6IkFPU19JbnZvaWNlcyI7czoxMjoiQU9TX0ludm9pY2VzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjU6IkNhc2VzIjtzOjU6IkNhc2VzIjtzOjk6IlByb3NwZWN0cyI7czo5OiJQcm9zcGVjdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6NzoiUHJvamVjdCI7czo3OiJQcm9qZWN0IjtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtzOjE5OiJBTV9Qcm9qZWN0VGVtcGxhdGVzIjtzOjk6IkZQX2V2ZW50cyI7czo5OiJGUF9ldmVudHMiO3M6MTg6IkZQX0V2ZW50X0xvY2F0aW9ucyI7czoxODoiRlBfRXZlbnRfTG9jYXRpb25zIjtzOjEyOiJBT1NfUHJvZHVjdHMiO3M6MTI6IkFPU19Qcm9kdWN0cyI7czoyMjoiQU9TX1Byb2R1Y3RfQ2F0ZWdvcmllcyI7czoyMjoiQU9TX1Byb2R1Y3RfQ2F0ZWdvcmllcyI7czoxNzoiQU9TX1BERl9UZW1wbGF0ZXMiO3M6MTc6IkFPU19QREZfVGVtcGxhdGVzIjtzOjk6Impqd2dfTWFwcyI7czo5OiJqandnX01hcHMiO3M6MTI6Impqd2dfTWFya2VycyI7czoxMjoiamp3Z19NYXJrZXJzIjtzOjEwOiJqandnX0FyZWFzIjtzOjEwOiJqandnX0FyZWFzIjtzOjE4OiJqandnX0FkZHJlc3NfQ2FjaGUiO3M6MTg6Impqd2dfQWRkcmVzc19DYWNoZSI7czoxMToiQU9SX1JlcG9ydHMiO3M6MTE6IkFPUl9SZXBvcnRzIjtzOjEyOiJBT1dfV29ya0Zsb3ciO3M6MTI6IkFPV19Xb3JrRmxvdyI7czoxNzoiQU9LX0tub3dsZWRnZUJhc2UiO3M6MTc6IkFPS19Lbm93bGVkZ2VCYXNlIjtzOjI5OiJBT0tfS25vd2xlZGdlX0Jhc2VfQ2F0ZWdvcmllcyI7czoyOToiQU9LX0tub3dsZWRnZV9CYXNlX0NhdGVnb3JpZXMiO3M6MjA6IlJUX0luY3JlbWVudF9IaXN0b3J5IjtzOjIwOiJSVF9JbmNyZW1lbnRfSGlzdG9yeSI7czoxMDoiUlRfUGF5cm9sbCI7czoxMDoiUlRfUGF5cm9sbCI7czoxMjoiUlRfRW1wbG95ZWVzIjtzOjEyOiJSVF9FbXBsb3llZXMiO3M6ODoiUlRfQm9udXMiO3M6ODoiUlRfQm9udXMiO3M6OToiUlRfTGVhdmVzIjtzOjk6IlJUX0xlYXZlcyI7czoxNDoiUlRfRGVkdWN0YWJsZXMiO3M6MTQ6IlJUX0RlZHVjdGFibGVzIjtzOjEzOiJSVF9BcHByYWlzYWxzIjtzOjEzOiJSVF9BcHByYWlzYWxzIjtzOjE0OiJSVF9EZXBhcnRtZW50cyI7czoxNDoiUlRfRGVwYXJ0bWVudHMiO3M6MTQ6IlJUX1BheV9UcmFja2VyIjtzOjE0OiJSVF9QYXlfVHJhY2tlciI7fQ=='),
('portal', 'on', '0'),
('tracker', 'Tracker', '1'),
('system', 'skypeout_on', '1'),
('sugarfeed', 'enabled', '1'),
('sugarfeed', 'module_UserFeed', '1'),
('sugarfeed', 'module_Opportunities', '1'),
('sugarfeed', 'module_Leads', '1'),
('sugarfeed', 'module_Contacts', '1'),
('sugarfeed', 'module_Cases', '1'),
('Update', 'CheckUpdates', 'manual'),
('system', 'name', 'SuiteCRM'),
('system', 'adminwizard', '1'),
('notify', 'allow_default_outbound', '0'),
('system', 'increment_interval', 'annual');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `joomla_account_id` varchar(255) DEFAULT NULL,
  `portal_account_disabled` tinyint(1) DEFAULT NULL,
  `portal_user_type` varchar(100) DEFAULT 'Single',
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_audit`
--

CREATE TABLE IF NOT EXISTS `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_bugs`
--

CREATE TABLE IF NOT EXISTS `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cases`
--

CREATE TABLE IF NOT EXISTS `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_cstm`
--

CREATE TABLE IF NOT EXISTS `contacts_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  `contact_type_c` varchar(100) DEFAULT 'Emergency',
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts_users`
--

CREATE TABLE IF NOT EXISTS `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cron_remove_documents`
--

CREATE TABLE IF NOT EXISTS `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cron_remove_documents`
--

INSERT INTO `cron_remove_documents` (`id`, `bean_id`, `module`, `date_modified`) VALUES
('1b28f9ea-9258-e62c-be98-58295ee0d0ee', '644bc65d-8dc5-6e64-5562-5825dff3db00', 'RT_Payroll', '2016-11-14 11:47:32'),
('1ddb0b5a-4a52-30d1-a5a3-58295eb0505a', 'c502933c-ff1f-b856-f75e-5825e152962c', 'RT_Payroll', '2016-11-14 11:47:46'),
('1de21678-09e2-fcfc-b0e0-58295e76c3e7', '51a77e8d-642e-921f-1815-5825dfcbcaa0', 'RT_Payroll', '2016-11-14 11:47:30'),
('2a6f6867-91a4-af71-cb1d-58295e02163a', '98b61e72-9695-3a56-d2c3-5825df02a7ed', 'RT_Payroll', '2016-11-14 11:47:41'),
('300027ef-c440-1bd4-dbc4-58295eb6e2ad', '44b11cbc-2dd6-06a8-fa97-5825dfca0786', 'RT_Payroll', '2016-11-14 11:47:29'),
('394820fc-f0ac-f50c-8fa5-58295e131753', 'eb610699-b999-6e3b-1070-5825c9738138', 'RT_Payroll', '2016-11-14 11:47:47'),
('3f150ddb-9f3f-7ca6-07ac-58295d065bbc', '2695b965-0bcd-9de3-f224-5825b3c8e35c', 'RT_Payroll', '2016-11-14 11:47:26'),
('48e59505-7fca-83fa-eb65-582969444d26', '5d5cad16-af55-cc9a-0231-58295e7b7f7c', 'RT_Payroll', '2016-11-14 12:35:28'),
('4d173063-d6de-722d-44a6-58295e31773e', '80d30d6d-c7de-ef74-3b31-5825ace7771c', 'RT_Payroll', '2016-11-14 11:47:38'),
('4e76b412-8b81-ee83-a7a4-58295edde807', 'cccca5b2-96e6-c0bd-8c64-5825e1095267', 'RT_Payroll', '2016-11-14 11:47:46'),
('5c4373cf-8f93-b72c-e4b4-58295e0fe8c0', 'c3fe9f75-d4a4-a5b9-89f3-5825b4fc95de', 'RT_Payroll', '2016-11-14 11:47:45'),
('6db1be39-d08c-cea7-e724-58296937bc1b', '42ffbeac-7200-ddac-022d-58295ea1c62c', 'RT_Payroll', '2016-11-14 12:35:27'),
('6ed4d263-79bf-ba9f-db13-58295e12a504', '62e8ad8f-0bed-caff-5263-5825e1e92e2b', 'RT_Payroll', '2016-11-14 11:47:31'),
('733a5d91-9682-efe2-345b-58295ea1d204', '7cf8d445-6a20-b0e2-611f-5825c4a05a03', 'RT_Payroll', '2016-11-14 11:47:36'),
('76504d3e-a18c-6345-e947-58295da9db73', '158129a4-8463-01af-427c-5825c4a66ea9', 'RT_Payroll', '2016-11-14 11:47:25'),
('787f4261-8b09-d946-5987-58295e63813f', '805291b4-4fb7-ae3b-aae1-5825df616e5b', 'RT_Payroll', '2016-11-14 11:47:37'),
('7a9adb56-bf59-9d66-070f-58295e6e7518', '74426d4f-8f4b-cf7b-9d1a-5825e1bc7e62', 'RT_Payroll', '2016-11-14 11:47:35'),
('7dc3094a-de5b-e9d8-ffa6-58295eaa78f7', '4c07cf11-444c-5820-3c66-5825b0ec9482', 'RT_Payroll', '2016-11-14 11:47:29'),
('9455f39e-a689-6ed4-a127-58296930c130', '65720a04-c4d5-0458-a196-58295e84d20c', 'RT_Payroll', '2016-11-14 12:35:28'),
('9526de64-b0eb-92a8-1b0f-58295eef85ac', '6a4c99c3-d0fc-5e9d-6496-5825e147b082', 'RT_Payroll', '2016-11-14 11:47:32'),
('9986b997-02c7-df2f-e07e-582969c6269b', '4cd4a1e8-267a-ca19-bfef-58295e64ec0c', 'RT_Payroll', '2016-11-14 12:35:27'),
('9b135bc4-b4c7-2608-9292-58295ef9d019', 'db465d50-9e9b-a15c-e6d3-5825b23e5932', 'RT_Payroll', '2016-11-14 11:47:46'),
('a767ff97-ce0a-c809-115d-58295e407c75', '8bc478a3-1e85-bd66-9028-5825df023a62', 'RT_Payroll', '2016-11-14 11:47:38'),
('ad4294cd-7c03-285a-cb0b-582969e5bb46', 'e46e7403-ba32-91b2-ffeb-582964e22612', 'RT_Payroll', '2016-11-14 12:35:29'),
('b4c58c34-9997-17d4-b13b-582969d7fa9b', 'e78c4efb-2851-17ac-9d45-58296696102c', 'RT_Payroll', '2016-11-14 12:35:30'),
('c712c042-fb72-3f2e-88da-58295dc8b655', '37c2bca6-9f8a-3e5d-f923-5825df350d1d', 'RT_Payroll', '2016-11-14 11:47:28'),
('c8d8f967-9cdd-4a3a-3133-58295e6fb8be', '4c44a516-4755-ce5f-6428-5825b8168f91', 'RT_Payroll', '2016-11-14 11:47:29'),
('db70cd37-8274-653e-c533-58295e840001', 'ffcd0c9e-5635-ffe7-63c0-5825c79c6317', 'RT_Payroll', '2016-11-14 11:47:47'),
('e14780a5-5fe3-e505-d358-58295ee3c1ac', 'bdcdab20-d490-b846-1216-5825e1f70850', 'RT_Payroll', '2016-11-14 11:47:44'),
('e3ddff0b-b8d2-fdb4-ce6b-58295e44e1a9', 'df0ee84d-e577-754a-2e45-5825b1e5f01b', 'RT_Payroll', '2016-11-14 11:47:46'),
('e41331ba-0558-6a51-5df7-582969505170', '55696fca-ad6a-918c-421a-58295e48b06b', 'RT_Payroll', '2016-11-14 12:35:27'),
('e7acee5c-283d-36ca-79d0-582969546fdd', 'dfbc0933-dfa5-8311-c68d-582960ac18ef', 'RT_Payroll', '2016-11-14 12:35:28'),
('e8d230e0-6dc2-8163-3d91-58295ef8f157', 'b3ad8b06-a8df-3432-a36d-5825c6e42bd0', 'RT_Payroll', '2016-11-14 11:47:41'),
('ea8ad0f6-3798-65f0-06a5-58295e395a38', '9281d884-c67e-3b1e-56f9-5825b5f189cd', 'RT_Payroll', '2016-11-14 11:47:39'),
('efb29251-5219-1020-24aa-58295efcb6fa', '76836a15-80fb-25e2-4ac3-5825ae265e00', 'RT_Payroll', '2016-11-14 11:47:35'),
('effc9aff-f8a9-bb93-2da4-58295ef917f0', '741d1449-4724-b1de-2e08-5825dfcb8b8f', 'RT_Payroll', '2016-11-14 11:47:34'),
('f0a563c2-5037-f080-d90c-58295e84679f', '8c40d965-eeca-bac4-4f87-5825c5eab376', 'RT_Payroll', '2016-11-14 11:47:38');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE IF NOT EXISTS `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_accounts`
--

CREATE TABLE IF NOT EXISTS `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_bugs`
--

CREATE TABLE IF NOT EXISTS `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_cases`
--

CREATE TABLE IF NOT EXISTS `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_contacts`
--

CREATE TABLE IF NOT EXISTS `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents_opportunities`
--

CREATE TABLE IF NOT EXISTS `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document_revisions`
--

CREATE TABLE IF NOT EXISTS `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `eapm`
--

CREATE TABLE IF NOT EXISTS `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emailman`
--

CREATE TABLE IF NOT EXISTS `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `date_entered`, `date_modified`, `assigned_user_id`, `modified_user_id`, `created_by`, `deleted`, `date_sent`, `message_id`, `name`, `type`, `status`, `flagged`, `reply_to_status`, `intent`, `mailbox_id`, `parent_type`, `parent_id`) VALUES
('d9ced53a-143f-9fae-9c57-581336719b37', '2016-10-28 11:28:17', '2016-10-28 11:28:17', NULL, '1', '1', 0, '2016-10-28 11:28:17', NULL, 'New account information', 'archived', 'sent', NULL, NULL, 'pick', NULL, 'User', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `emails_beans`
--

CREATE TABLE IF NOT EXISTS `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emails_email_addr_rel`
--

CREATE TABLE IF NOT EXISTS `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emails_email_addr_rel`
--

INSERT INTO `emails_email_addr_rel` (`id`, `email_id`, `address_type`, `email_address_id`, `deleted`) VALUES
('f3b4d8f3-4c59-0aa8-748b-581336efa3a8', 'd9ced53a-143f-9fae-9c57-581336719b37', 'from', 'dc751983-3838-7dd3-1333-5811f92d603d', 0);

-- --------------------------------------------------------

--
-- Table structure for table `emails_text`
--

CREATE TABLE IF NOT EXISTS `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emails_text`
--

INSERT INTO `emails_text` (`email_id`, `from_addr`, `reply_to_addr`, `to_addrs`, `cc_addrs`, `bcc_addrs`, `description`, `description_html`, `raw_source`, `deleted`) VALUES
('d9ced53a-143f-9fae-9c57-581336719b37', '', '', '', '', '', '<div><table width="550"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : CTO </p><p>Password : RNZ7vt </p><br /><p>http://localhost/SuiteCRM_HRM</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_addresses`
--

CREATE TABLE IF NOT EXISTS `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addresses`
--

INSERT INTO `email_addresses` (`id`, `email_address`, `email_address_caps`, `invalid_email`, `opt_out`, `date_created`, `date_modified`, `deleted`) VALUES
('119ce6a1-a93b-4f20-fc10-580480e2ca92', 'husnain.zaheer@rolustech.net', 'HUSNAIN.ZAHEER@ROLUSTECH.NET', 0, 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', 0),
('aca30008-dab7-5a07-e827-5811f0b82eaa', 'abc@gmail.com', 'ABC@GMAIL.COM', 0, 0, '2016-10-27 12:18:53', '2016-10-27 12:18:53', 0),
('dc751983-3838-7dd3-1333-5811f92d603d', 'husnain.zaheer840@gmail.com', 'HUSNAIN.ZAHEER840@GMAIL.COM', 0, 0, '2016-10-27 12:57:32', '2016-10-27 12:57:32', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_addr_bean_rel`
--

CREATE TABLE IF NOT EXISTS `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_addr_bean_rel`
--

INSERT INTO `email_addr_bean_rel` (`id`, `email_address_id`, `bean_id`, `bean_module`, `primary_address`, `reply_to_address`, `date_created`, `date_modified`, `deleted`) VALUES
('116c19d9-a889-8fee-38d7-5804803d5683', '119ce6a1-a93b-4f20-fc10-580480e2ca92', '1', 'Users', 1, 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', 0),
('a3ab9403-06d0-e1e4-3a5b-58133627301c', 'dc751983-3838-7dd3-1333-5811f92d603d', '8df757f7-32ff-50be-7825-5813363b2b3b', 'Users', 1, 0, '2016-10-28 11:28:17', '2016-10-28 11:28:17', 0),
('a728e6ab-b0dd-0e38-5a7b-5811f9c1f694', 'dc751983-3838-7dd3-1333-5811f92d603d', 'd0e3ea77-656a-ef74-e175-5804b99ed1a0', 'RT_Employees', 1, 0, '2016-10-27 12:58:08', '2016-10-27 12:58:08', 0),
('aaf803a2-e2b4-49b9-367d-5811f077ff94', 'aca30008-dab7-5a07-e827-5811f0b82eaa', 'c73e60f0-82fc-f33b-0205-5811f0e32a0c', 'RT_Employees', 1, 0, '2016-10-27 12:18:53', '2016-10-27 12:18:53', 0),
('c2f0021d-e0b4-b525-8b57-5811ef799d1c', '119ce6a1-a93b-4f20-fc10-580480e2ca92', '380d7c06-497a-f0e2-e02a-580497b91089', 'RT_Employees', 1, 0, '2016-10-27 12:12:54', '2016-10-27 12:12:54', 0),
('dc52c94a-3245-9c21-0e78-5811f9a6bc40', 'dc751983-3838-7dd3-1333-5811f92d603d', 'a2e6184f-8d21-2ec4-8641-5811f94d96b7', 'RT_Employees', 1, 0, '2016-10-27 12:57:32', '2016-10-27 12:57:32', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_cache`
--

CREATE TABLE IF NOT EXISTS `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing`
--

CREATE TABLE IF NOT EXISTS `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `outbound_email_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_marketing_prospect_lists`
--

CREATE TABLE IF NOT EXISTS `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `published`, `name`, `description`, `subject`, `body`, `body_html`, `deleted`, `assigned_user_id`, `text_only`, `type`) VALUES
('1c78e1e9-861b-80b3-4809-581adc0f373a', '2016-11-03 06:41:36', '2016-11-03 06:41:36', '1', '1', 'off', 'test template', '', '', 'Performance Review Form\r\nEmployee: {emp_name}\r\nReview Form: {link}', '', 0, '1', 1, 'email'),
('9f0e39c9-d462-7d2b-eb51-581a01493c86', '2016-11-02 15:09:05', '2016-11-03 06:28:11', '1', '1', 'off', 'Rolustech Email Template', NULL, NULL, 'Performance Review FormEmployee: {emp_name}Review Form: {link}', '<div class="mozaik-inner" style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px 30px;margin:0px;"><h2 style="font-family:Arial, Helvetica, sans-serif;font-size:18px;line-height:28.8px;color:#444444;padding:0px;margin:0px;"> <br style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;" /></h2><div class="mozaik-clear" style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px;margin:0px;height:0px;"> <br style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px;margin:0px;" /></div></div><div class="mozaik-inner" style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px 30px;margin:0px;"><h2 style="font-family:Arial, Helvetica, sans-serif;font-size:18px;line-height:28.8px;color:#444444;padding:0px;margin:0px;">Performance Review Form<br style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;" /></h2><p style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;"><strong style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;">Employee:</strong> {emp_name}</p><p style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;"><strong style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:#444444;padding:0px;margin:0px;">Review Form:</strong> {link}</p><div class="mozaik-clear" style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px;margin:0px;height:0px;"> <br style="font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:22.4px;color:rgb(68,68,68);padding:0px;margin:0px;" /></div></div>', 0, '1', 1, 'email'),
('bf7696b2-4ef1-98bc-babb-58047f1ccdac', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'off', 'System-generated password email', 'This template is used when the System Administrator sends a new password to a user.', 'New account information', '\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.', '<div><table width="550"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL),
('c417449c-33d5-b47b-acf6-580480f3d0a3', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'off', 'Case Closure', 'Template for informing a contact that their case has been closed.', '$acase_name [CASE:$acase_case_number] closed', 'Hi $contact_first_name $contact_last_name,\n\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\n					   Status:				$acase_status\n					   Reference:			$acase_case_number\n					   Resolution:			$acase_resolution', '<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\n					    <table border="0"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Resolution</td><td>$acase_resolution</td></tr></tbody></table>', 0, NULL, NULL, NULL),
('c645aad2-335e-ceba-b475-58047f408836', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'off', 'Forgot Password email', 'This template is used to send a user a link to click to reset the user''s account password.', 'Reset your account password', '\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid', '<div><table width="550"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>', 0, NULL, 0, NULL),
('c8ed7d95-edbe-852d-3f51-580480de382b', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'off', 'Joomla Account Creation', 'Template used when informing a contact that they''ve been given an account on the joomla portal.', 'Support Portal Account Created', 'Hi $contact_name,\n					   An account has been created for you at $portal_address.\n					   You may login using this email address and the password $joomla_pass', '<p>Hi $contact_name,</p>\n					    <p>An account has been created for you at <a href="$portal_address">$portal_address</a>.</p>\n					    <p>You may login using this email address and the password $joomla_pass</p>', 0, NULL, NULL, NULL),
('ce775015-8211-7bde-ec2a-58048010e461', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'off', 'Case Creation', 'Template to send to a contact when a case is received from them.', '$acase_name [CASE:$acase_case_number]', 'Hi $contact_first_name $contact_last_name,\n\n					   We''ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\n					   Status:		$acase_status\n					   Reference:	$acase_case_number\n					   Description:	$acase_description', '<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>We''ve received your case $acase_name (# $acase_case_number) on $acase_date_entered</p>\n					    <table border="0"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Description</td><td>$acase_description</td></tr></tbody></table>', 0, NULL, NULL, NULL),
('d59083d4-50cd-17e4-1a9b-580480fdec3c', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'off', 'Contact Case Update', 'Template to send to a contact when their case is updated.', '$acase_name update [CASE:$acase_case_number]', 'Hi $user_first_name $user_last_name,\n\n					   You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description', '<p>Hi $contact_first_name $contact_last_name,</p>\n					    <p> </p>\n					    <p>You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\n					    <p style="padding-left:30px;">$aop_case_updates_description</p>', 0, NULL, NULL, NULL),
('dade4e2b-c410-73e5-9eb0-58048062a17d', '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'off', 'User Case Update', 'Email template to send to a Sugar user when their case is updated.', '$acase_name (# $acase_case_number) update', 'Hi $user_first_name $user_last_name,\n\n					   You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description\n                        You may review this Case at:\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;', '<p>Hi $user_first_name $user_last_name,</p>\n					   <p> </p>\n					   <p>You''ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					   <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\n					   <p style="padding-left:30px;">$aop_case_updates_description</p>\n					   <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>\n					   ', 0, NULL, NULL, NULL),
('e369918a-0a2d-f3f8-6b0b-5804806a0272', '2013-05-24 14:31:45', '2016-10-17 07:38:32', '1', '1', 'off', 'Event Invite Template', 'Default event invite template.', 'You have been invited to $fp_events_name', 'Dear $contact_name,\r\nYou have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end\r\n$fp_events_description\r\nYours Sincerely,\r\n', '\n<p>Dear $contact_name,</p>\n<p>You have been invited to $fp_events_name on $fp_events_date_start to $fp_events_date_end</p>\n<p>$fp_events_description</p>\n<p>If you would like to accept this invititation please click accept.</p>\n<p> $fp_events_link or $fp_events_link_declined</p>\n<p>Yours Sincerely,</p>\n', 0, NULL, NULL, 'email');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE IF NOT EXISTS `favorites` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fields_meta_data`
--

CREATE TABLE IF NOT EXISTS `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields_meta_data`
--

INSERT INTO `fields_meta_data` (`id`, `name`, `vname`, `comments`, `help`, `custom_module`, `type`, `len`, `required`, `default_value`, `date_modified`, `deleted`, `audited`, `massupdate`, `duplicate_merge`, `reportable`, `importable`, `ext1`, `ext2`, `ext3`, `ext4`) VALUES
('Accountsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Accounts', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Accountsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Accounts', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Accountsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Accounts', 'float', 10, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Accountsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Accounts', 'float', 11, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Casesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Cases', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Casesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Cases', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Casesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Cases', 'float', 10, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Casesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Cases', 'float', 11, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Contactscontact_type_c', 'contact_type_c', 'LBL_CONTACT_TYPE', NULL, NULL, 'Contacts', 'enum', 100, 0, 'Emergency', '2012-01-19 10:03:02', 0, 0, 0, 0, 1, 'true', 'contacttype_list', NULL, NULL, NULL),
('Contactsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Contacts', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Contactsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Contacts', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Contactsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Contacts', 'float', 10, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Contactsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Contacts', 'float', 11, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Leadsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Leads', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Leadsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Leads', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Leadsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Leads', 'float', 10, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Leadsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Leads', 'float', 11, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Meetingsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Meetings', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Meetingsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Meetings', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Meetingsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Meetings', 'float', 10, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Meetingsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Meetings', 'float', 11, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Opportunitiesjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Opportunities', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Opportunitiesjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Opportunities', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Opportunitiesjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Opportunities', 'float', 10, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Opportunitiesjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Opportunities', 'float', 11, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Projectjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Project', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Projectjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Project', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Projectjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Project', 'float', 10, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Projectjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Project', 'float', 11, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Prospectsjjwg_maps_address_c', 'jjwg_maps_address_c', 'LBL_JJWG_MAPS_ADDRESS', 'Address', 'Address', 'Prospects', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Prospectsjjwg_maps_geocode_status_c', 'jjwg_maps_geocode_status_c', 'LBL_JJWG_MAPS_GEOCODE_STATUS', 'Geocode Status', 'Geocode Status', 'Prospects', 'varchar', 255, 0, NULL, '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', NULL, '', '', ''),
('Prospectsjjwg_maps_lat_c', 'jjwg_maps_lat_c', 'LBL_JJWG_MAPS_LAT', '', 'Latitude', 'Prospects', 'float', 10, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('Prospectsjjwg_maps_lng_c', 'jjwg_maps_lng_c', 'LBL_JJWG_MAPS_LNG', '', 'Longitude', 'Prospects', 'float', 11, 0, '0.00000000', '2016-10-17 07:38:32', 0, 0, 0, 0, 1, 'true', '8', '', '', ''),
('RT_Candidatesapplication_date_c', 'application_date_c', 'LBL_APPLICATION_DATE', NULL, NULL, 'RT_Candidates', 'date', NULL, 1, 'now', '2012-01-13 06:45:09', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Candidatesaverage_score_c', 'average_score_c', 'LBL_AVERAGE_SCORE', NULL, NULL, 'RT_Candidates', 'float', 18, 0, NULL, '2012-02-02 06:26:21', 0, 0, 0, 0, 1, 'true', '8', NULL, NULL, NULL),
('RT_Candidate_Contactscity_c', 'city_c', 'LBL_CITY', NULL, NULL, 'RT_Candidate_Contacts', 'varchar', 255, 0, NULL, '2012-01-20 05:04:54', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Candidate_Contactscontact_type_c', 'contact_type_c', 'LBL_CONTACT_TYPE', NULL, NULL, 'RT_Candidate_Contacts', 'enum', 100, 0, 'Emergency', '2012-01-20 07:25:44', 0, 0, 0, 0, 1, 'true', 'contacttype_list', NULL, NULL, NULL),
('RT_Candidate_Contactscountry_c', 'country_c', 'LBL_COUNTRY', NULL, NULL, 'RT_Candidate_Contacts', 'enum', 100, 0, NULL, '2012-01-20 05:10:35', 0, 0, 0, 0, 1, 'true', 'countries_dom', NULL, NULL, NULL),
('RT_Candidate_Contactshome_phone_c', 'home_phone_c', 'LBL_HOME_PHONE', NULL, NULL, 'RT_Candidate_Contacts', 'varchar', 255, 0, NULL, '2012-01-20 05:02:10', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Candidate_Contactsmobile_phone_c', 'mobile_phone_c', 'LBL_MOBILE_PHONE', NULL, NULL, 'RT_Candidate_Contacts', 'varchar', 255, 0, NULL, '2012-01-20 05:00:43', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Candidate_Contactsoffice_phone_c', 'office_phone_c', 'LBL_OFFICE_PHONE', NULL, NULL, 'RT_Candidate_Contacts', 'varchar', 255, 0, NULL, '2012-01-20 05:01:29', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Candidate_Contactspostal_code_c', 'postal_code_c', 'LBL_POSTAL_CODE', NULL, NULL, 'RT_Candidate_Contacts', 'varchar', 255, 0, NULL, '2012-01-20 05:05:48', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Candidate_Contactsprimary_address_c', 'primary_address_c', 'LBL_PRIMARY_ADDRESS', NULL, NULL, 'RT_Candidate_Contacts', 'varchar', 255, 0, NULL, '2012-01-20 05:04:20', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Candidate_Contactsstate_c', 'state_c', 'LBL_STATE', NULL, NULL, 'RT_Candidate_Contacts', 'varchar', 255, 0, NULL, '2012-01-20 05:05:24', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Departmentshead_c', 'head_c', 'LBL_HEAD', NULL, NULL, 'RT_Departments', 'varchar', 255, 1, NULL, '2012-01-25 11:11:21', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Departmentshead_id_c', 'head_id_c', 'LBL_HEAD_ID', NULL, NULL, 'RT_Departments', 'varchar', 255, 0, NULL, '2012-02-06 06:25:10', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesaccount_name_c', 'account_name_c', 'LBL_ACCOUNT_NAME', NULL, NULL, 'RT_Employees', 'varchar', 255, 0, NULL, '2012-02-21 09:18:45', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesbalance_update_date_c', 'balance_update_date_c', 'LBL_BALANCE_UPDATE_DATE', NULL, NULL, 'RT_Employees', 'date', NULL, 0, NULL, '2012-02-01 12:31:38', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesbank_account_c', 'bank_account_c', 'LBL_BANK_ACCOUNT', NULL, NULL, 'RT_Employees', 'varchar', 255, 0, NULL, '2012-01-31 13:36:38', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesbank_name_c', 'bank_name_c', 'LBL_BANK_NAME', NULL, NULL, 'RT_Employees', 'enum', 100, 0, 'Allied_Bank', '2012-02-21 09:18:28', 0, 0, 0, 0, 1, 'true', 'bank_list', NULL, NULL, NULL),
('RT_Employeesdate_of_birth_c', 'date_of_birth_c', 'LBL_DATE_OF_BIRTH', NULL, NULL, 'RT_Employees', 'date', NULL, 0, 'now', '2012-01-13 10:24:23', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesemployment_type_c', 'employment_type_c', 'LBL_EMPLOYMENT_TYPE', NULL, NULL, 'RT_Employees', 'enum', 100, 0, 'Full_Time', '2012-02-02 12:20:49', 0, 0, 0, 0, 1, 'true', 'employmenttype_list', NULL, NULL, NULL),
('RT_Employeesentitled_annual_leaves_c', 'entitled_annual_leaves_c', 'LBL_ENTITLED_ANNUAL_LEAVES', NULL, NULL, 'RT_Employees', 'int', 255, 0, NULL, '2012-01-31 07:18:05', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesentitled_casual_leaves_c', 'entitled_casual_leaves_c', 'LBL_ENTITLED_CASUAL_LEAVES', NULL, NULL, 'RT_Employees', 'int', 255, 0, NULL, '2012-01-31 07:18:43', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesgender_c', 'gender_c', 'LBL_GENDER', NULL, NULL, 'RT_Employees', 'enum', 100, 0, 'male', '2012-01-13 10:17:10', 0, 0, 0, 0, 1, 'true', 'gender_list', NULL, NULL, NULL),
('RT_Employeesjoining_date_c', 'joining_date_c', 'LBL_JOINING_DATE', NULL, NULL, 'RT_Employees', 'date', NULL, 1, 'now', '2012-01-13 12:35:05', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesmarital_status_c', 'marital_status_c', 'LBL_MARITAL_STATUS', NULL, NULL, 'RT_Employees', 'enum', 100, 0, NULL, '2012-01-16 11:23:19', 0, 0, 0, 0, 1, 'true', 'marital_list', NULL, NULL, NULL),
('RT_Employeesnic_number_c', 'nic_number_c', 'LBL_NIC_NUMBER', NULL, NULL, 'RT_Employees', 'varchar', 255, 0, NULL, '2012-01-13 12:26:43', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesntn_number_c', 'ntn_number_c', 'LBL_NTN_NUMBER', NULL, NULL, 'RT_Employees', 'varchar', 255, 0, NULL, '2012-02-23 11:17:48', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeessalary_c', 'salary_c', 'LBL_SALARY', NULL, NULL, 'RT_Employees', 'int', 255, 0, NULL, '2012-01-13 12:35:59', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Employeesyears_c', 'years_c', 'LBL_YEARS', NULL, NULL, 'RT_Employees', 'int', 255, 0, '0', '2012-01-17 09:52:42', 0, 0, 0, 0, 1, 'true', '0', NULL, NULL, NULL),
('RT_Increment_Historyincrement_c', 'increment_c', 'LBL_INCREMENT', NULL, NULL, 'RT_Increment_History', 'int', 255, 1, NULL, '2012-01-31 06:15:43', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Increment_Historyincrement_date_c', 'increment_date_c', 'LBL_INCREMENT_DATE', NULL, NULL, 'RT_Increment_History', 'date', NULL, 0, 'now&10:00am', '2012-01-31 06:17:01', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Increment_Historylast_increment_c', 'last_increment_c', 'LBL_LAST_INCREMENT', NULL, NULL, 'RT_Increment_History', 'datetimecombo', NULL, 0, NULL, '2012-01-31 07:05:19', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Increment_Historynext_increment_c', 'next_increment_c', 'LBL_NEXT_INCREMENT', NULL, NULL, 'RT_Increment_History', 'varchar', 255, 0, NULL, '2012-01-31 13:01:08', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Increment_Historystatus_c', 'status_c', 'LBL_STATUS', NULL, NULL, 'RT_Increment_History', 'varchar', 255, 0, NULL, '2012-01-31 14:14:04', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Interviewscomments_c', 'comments_c', 'LBL_COMMENTS', NULL, NULL, 'RT_Interviews', 'text', NULL, 0, NULL, '2012-01-20 09:55:17', 0, 0, 0, 0, 1, 'true', NULL, '4', '20', NULL),
('RT_Interviewsdate_of_interview_c', 'date_of_interview_c', 'LBL_DATE_OF_INTERVIEW', NULL, NULL, 'RT_Interviews', 'date', NULL, 0, 'now', '2012-01-20 09:54:01', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Interviewsinterviewer_c', 'interviewer_c', 'LBL_INTERVIEWER', NULL, NULL, 'RT_Interviews', 'varchar', 255, 1, NULL, '2012-01-25 12:02:38', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Interviewsinterviewer_id_c', 'interviewer_id_c', 'LBL_INTERVIEWER_ID', NULL, NULL, 'RT_Interviews', 'varchar', 255, 0, NULL, '2012-02-06 07:25:40', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Interviewsjob_c', 'job_c', 'LBL_JOB', NULL, NULL, 'RT_Interviews', 'varchar', 255, 1, NULL, '2012-01-26 04:56:56', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Interviewsscore_c', 'score_c', 'LBL_SCORE', NULL, NULL, 'RT_Interviews', 'int', 255, 0, NULL, '2012-02-02 05:57:40', 0, 0, 0, 0, 1, 'true', '0', NULL, NULL, NULL),
('RT_Interviewsstatus_c', 'status_c', 'LBL_STATUS', NULL, NULL, 'RT_Interviews', 'enum', 100, 0, 'Approved', '2012-02-02 05:28:02', 0, 1, 0, 0, 1, 'true', 'interview_list', NULL, NULL, NULL),
('RT_Interviewsvacancy_c', 'vacancy_c', 'LBL_VACANCY', NULL, NULL, 'RT_Interviews', 'enum', 100, 1, NULL, '2012-01-26 04:41:57', 0, 0, 0, 0, 1, 'true', 'vacancy_list', NULL, NULL, NULL),
('RT_Interviewsvacancy_name_c', 'vacancy_name_c', 'LBL_VACANCY_NAME', NULL, NULL, 'RT_Interviews', 'varchar', 255, 0, NULL, '2012-02-02 07:39:53', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Jobsemployment_status_c', 'employment_status_c', 'LBL_EMPLOYMENT_STATUS', NULL, NULL, 'RT_Jobs', 'varchar', 255, 0, NULL, '2012-01-13 13:53:10', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Jobsend_date_c', 'end_date_c', 'LBL_END_DATE', NULL, NULL, 'RT_Jobs', 'date', NULL, 0, 'now', '2012-01-13 13:48:59', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Jobsentitled_annual_leaves_c', 'entitled_annual_leaves_c', 'LBL_ENTITLED_ANNUAL_LEAVES', NULL, NULL, 'RT_Jobs', 'int', 255, 1, NULL, '2012-01-16 11:58:42', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Jobsentitled_casual_leaves_c', 'entitled_casual_leaves_c', 'LBL_ENTITLED_CASUAL_LEAVES', NULL, NULL, 'RT_Jobs', 'int', 255, 1, NULL, '2012-01-16 11:59:00', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Jobsjob_title_c', 'job_title_c', 'LBL_JOB_TITLE', NULL, NULL, 'RT_Jobs', 'varchar', 255, 1, NULL, '2012-01-13 13:45:15', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Jobsjob_type_c', 'job_type_c', 'LBL_JOB_TYPE', NULL, NULL, 'RT_Jobs', 'enum', 100, 0, 'Technical', '2012-02-01 10:28:18', 0, 0, 0, 0, 1, 'true', 'jobtype_list', NULL, NULL, NULL),
('RT_Jobsstartdate_c', 'startdate_c', 'LBL_STARTDATE', NULL, NULL, 'RT_Jobs', 'date', NULL, 0, 'now', '2012-01-13 13:48:03', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Jobsstart_date_c', 'start_date_c', 'LBL_START_DATE', NULL, NULL, 'RT_Jobs', 'varchar', 255, 0, NULL, '2012-01-13 13:46:34', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Jobsterminate_employment_c', 'terminate_employment_c', 'LBL_TERMINATE_EMPLOYMENT', NULL, NULL, 'RT_Jobs', 'bool', 255, 0, '0', '2012-01-13 13:51:51', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Leavesaction_c', 'action_c', 'LBL_ACTION', NULL, NULL, 'RT_Leaves', 'enum', 100, 0, NULL, '2012-01-16 09:49:37', 0, 0, 0, 0, 1, 'true', 'leaveaction_list', NULL, NULL, NULL),
('RT_Leavesannual_balance_c', 'annual_balance_c', 'LBL_ANNUAL_BALANCE', NULL, NULL, 'RT_Leaves', 'int', 255, 0, NULL, '2012-02-01 04:47:04', 0, 0, 0, 0, 1, 'true', '0', NULL, NULL, NULL),
('RT_Leavescasual_balance_c', 'casual_balance_c', 'LBL_CASUAL_BALANCE', NULL, NULL, 'RT_Leaves', 'int', 255, 0, NULL, '2012-02-01 04:46:24', 0, 0, 0, 0, 1, 'true', '0', NULL, NULL, NULL),
('RT_Leavescomments_c', 'comments_c', 'LBL_COMMENTS', NULL, NULL, 'RT_Leaves', 'text', NULL, 0, NULL, '2012-01-16 09:35:52', 0, 0, 0, 0, 1, 'true', NULL, '4', '20', NULL),
('RT_Leavescount_days_c', 'count_days_c', 'LBL_COUNT_DAYS', '', '', 'RT_Leaves', 'varchar', 255, 0, '', '2016-10-20 12:48:34', 0, 0, 0, 0, 1, 'true', '', '', '', ''),
('RT_Leavesfrom_date_c', 'from_date_c', 'LBL_FROM_DATE', NULL, NULL, 'RT_Leaves', 'date', NULL, 1, 'now', '2012-01-16 09:38:53', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Leavesleave_type_c', 'leave_type_c', 'LBL_LEAVE_TYPE', NULL, NULL, 'RT_Leaves', 'enum', 100, 1, 'Annual', '2012-01-16 09:22:55', 0, 0, 0, 0, 1, 'true', 'leavetype_list', NULL, NULL, NULL),
('RT_Leavesnumber_of_days_c', 'number_of_days_c', 'LBL_NUMBER_OF_DAYS', NULL, NULL, 'RT_Leaves', 'int', 255, 0, NULL, '2012-01-16 09:34:51', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Leavesstatus_c', 'status_c', 'LBL_STATUS', NULL, NULL, 'RT_Leaves', 'enum', 100, 0, NULL, '2012-01-16 12:08:19', 0, 0, 0, 0, 1, 'true', 'leavestatus_list', NULL, NULL, NULL),
('RT_Leavesto_date_c', 'to_date_c', 'LBL_TO_DATE', NULL, NULL, 'RT_Leaves', 'date', NULL, 1, '+1 day', '2012-01-16 09:39:34', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Offered_Jobsemployee_c', 'employee_c', 'LBL_EMPLOYEE', NULL, NULL, 'RT_Offered_Jobs', 'varchar', 255, 0, NULL, '2012-02-01 07:50:27', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Offered_Jobsjob_c', 'job_c', 'LBL_JOB', NULL, NULL, 'RT_Offered_Jobs', 'varchar', 255, 0, NULL, '2012-01-25 10:09:17', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Offered_Jobsjob_id_c', 'job_id_c', 'LBL_JOB_ID', NULL, NULL, 'RT_Offered_Jobs', 'varchar', 255, 0, NULL, '2012-01-26 10:34:23', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Offered_Jobsjoining_date_c', 'joining_date_c', 'LBL_JOINING_DATE', NULL, NULL, 'RT_Offered_Jobs', 'date', NULL, 0, '+1 day', '2012-02-01 12:18:43', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Offered_Jobssalary_c', 'salary_c', 'LBL_SALARY', NULL, NULL, 'RT_Offered_Jobs', 'int', 255, 0, NULL, '2012-02-06 09:31:07', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Offered_Jobsstatus_c', 'status_c', 'LBL_STATUS', NULL, NULL, 'RT_Offered_Jobs', 'enum', 100, 0, 'Pending', '2012-01-23 05:04:27', 0, 0, 0, 0, 1, 'true', 'offeredjobstatus_list', NULL, NULL, NULL),
('RT_Offered_Jobsvacancy_c', 'vacancy_c', 'LBL_VACANCY', NULL, NULL, 'RT_Offered_Jobs', 'enum', 100, 1, NULL, '2012-01-26 09:14:27', 0, 0, 0, 0, 1, 'true', 'vacancy_list', NULL, NULL, NULL),
('RT_Offered_Jobsvacancy_name_c', 'vacancy_name_c', 'LBL_VACANCY_NAME', NULL, NULL, 'RT_Offered_Jobs', 'varchar', 255, 0, NULL, '2012-02-02 12:12:49', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Payrollabc_c', 'abc_c', 'LBL_ABC', NULL, NULL, 'RT_Payroll', 'multienum', 100, 1, '^^', '2012-02-21 05:27:58', 0, 0, 0, 0, 1, 'true', 'a_payroll_category_dom', NULL, NULL, '^^'),
('RT_Payrollbutton_c', 'button_c', 'LBL_BUTTON', NULL, NULL, 'RT_Payroll', 'varchar', 255, 0, NULL, '2012-02-21 05:50:40', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationscomments_c', 'comments_c', 'LBL_COMMENTS', NULL, NULL, 'RT_Qualifications', 'text', NULL, 0, NULL, '2012-01-16 05:44:36', 0, 0, 0, 0, 1, 'true', NULL, '4', '20', NULL),
('RT_Qualificationscompany_c', 'company_c', 'LBL_COMPANY', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-01-18 05:13:12', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsends_c', 'ends_c', 'LBL_ENDS', NULL, NULL, 'RT_Qualifications', 'date', NULL, 0, NULL, '2012-01-16 05:58:58', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsend_date_c', 'end_date_c', 'LBL_END_DATE', NULL, NULL, 'RT_Qualifications', 'date', NULL, 0, 'now', '2012-01-16 05:43:39', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsfrom_skill_c', 'from_skill_c', 'LBL_FROM_SKILL', NULL, NULL, 'RT_Qualifications', 'date', NULL, 0, 'now', '2012-02-02 05:33:47', 0, 1, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsgpa_score_c', 'gpa_score_c', 'LBL_GPA_SCORE', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-01-16 05:50:57', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsinstitute_c', 'institute_c', 'LBL_INSTITUTE', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-01-16 05:48:40', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsjob_title_c', 'job_title_c', 'LBL_JOB_TITLE', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-01-18 05:13:35', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationslevel_c', 'level_c', 'LBL_LEVEL', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-01-18 05:14:11', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsqualification_type_c', 'qualification_type_c', 'LBL_QUALIFICATION_TYPE', NULL, NULL, 'RT_Qualifications', 'enum', 100, 0, 'Work_Experience', '2012-01-17 14:31:17', 0, 0, 0, 0, 1, 'true', 'qualification_list', NULL, NULL, NULL),
('RT_Qualificationsskill_c', 'skill_c', 'LBL_SKILL', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-01-16 05:54:30', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsskill_comment_c', 'skill_comment_c', 'LBL_SKILL_COMMENT', NULL, NULL, 'RT_Qualifications', 'text', NULL, 0, NULL, '2012-02-02 05:38:48', 0, 0, 0, 0, 1, 'true', NULL, '4', '20', NULL),
('RT_Qualificationsskill_institute_c', 'skill_institute_c', 'LBL_SKILL_INSTITUTE', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-02-02 05:32:34', 0, 1, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsspecialization_c', 'specialization_c', 'LBL_SPECIALIZATION', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-01-16 05:49:07', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsstart_c', 'start_c', 'LBL_START', NULL, NULL, 'RT_Qualifications', 'date', NULL, 0, NULL, '2012-01-16 05:58:03', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsstart_date_c', 'start_date_c', 'LBL_START_DATE', NULL, NULL, 'RT_Qualifications', 'date', NULL, 0, 'now', '2012-01-16 05:43:06', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsto_skill_c', 'to_skill_c', 'LBL_TO_SKILL', NULL, NULL, 'RT_Qualifications', 'date', NULL, 0, '+1 day', '2012-02-02 05:34:22', 0, 1, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsyears_of_experience_c', 'years_of_experience_c', 'LBL_YEARS_OF_EXPERIENCE', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-01-16 05:55:14', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Qualificationsyear_c', 'year_c', 'LBL_YEAR', NULL, NULL, 'RT_Qualifications', 'varchar', 255, 0, NULL, '2012-01-16 05:49:26', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Salarybank_account_number_c', 'bank_account_number_c', 'LBL_BANK_ACCOUNT_NUMBER', NULL, NULL, 'RT_Salary', 'varchar', 255, 0, NULL, '2012-01-31 05:57:23', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Salarycurrent_salary_c', 'current_salary_c', 'LBL_CURRENT_SALARY', NULL, NULL, 'RT_Salary', 'int', 255, 1, NULL, '2012-01-31 05:59:10', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Salaryprovident_fund_c', 'provident_fund_c', 'LBL_PROVIDENT_FUND', NULL, NULL, 'RT_Salary', 'int', 255, 0, NULL, '2012-01-31 05:53:36', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Vacanciesdepartment_c', 'department_c', 'LBL_DEPARTMENT', NULL, NULL, 'RT_Vacancies', 'varchar', 255, 0, NULL, '2012-02-01 07:26:18', 0, 0, 0, 0, 1, 'true', NULL, NULL, NULL, NULL),
('RT_Vacanciespositions_c', 'positions_c', 'LBL_POSITIONS', NULL, NULL, 'RT_Vacancies', 'int', 255, 1, NULL, '2012-01-19 13:08:49', 0, 0, 0, 0, 1, 'true', '0', NULL, NULL, NULL),
('RT_Vacanciesstatus_c', 'status_c', 'LBL_STATUS', NULL, NULL, 'RT_Vacancies', 'enum', 100, 0, 'Active', '2012-01-19 13:11:22', 0, 0, 0, 0, 1, 'true', 'vacancystatus_list', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE IF NOT EXISTS `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `folder_type`, `parent_folder`, `has_child`, `is_group`, `is_dynamic`, `dynamic_query`, `assign_to_id`, `created_by`, `modified_by`, `deleted`) VALUES
('6177e256-6565-dea4-97ce-5818643b406d', 'My Email', 'inbound', '', 1, 0, 1, 'SELECT emails.id polymorphic_id, ''Emails'' polymorphic_module FROM emails\n								   JOIN emails_text on emails.id = emails_text.email_id\n                                   WHERE (type = ''inbound'' OR status = ''inbound'') AND assigned_user_id = ''1'' AND emails.deleted = ''0'' AND status NOT IN (''sent'', ''archived'', ''draft'') AND type NOT IN (''out'', ''archived'', ''draft'')', '', '1', '1', 0),
('63f52e9f-3f4b-a3f5-53c4-581864b37c15', 'My Drafts', 'draft', '6177e256-6565-dea4-97ce-5818643b406d', 0, 0, 1, 'SELECT emails.id polymorphic_id, ''Emails'' polymorphic_module FROM emails\n								   JOIN emails_text on emails.id = emails_text.email_id\n                                   WHERE (type = ''draft'' OR status = ''draft'') AND assigned_user_id = ''1'' AND emails.deleted = ''0'' AND status NOT IN (''archived'') AND type NOT IN (''archived'')', '', '1', '1', 0),
('64f2e11a-12c8-f3d9-9afd-581864f459ed', 'Sent Emails', 'sent', '6177e256-6565-dea4-97ce-5818643b406d', 0, 0, 1, 'SELECT emails.id polymorphic_id, ''Emails'' polymorphic_module FROM emails\n								   JOIN emails_text on emails.id = emails_text.email_id\n                                   WHERE (type = ''out'' OR status = ''sent'') AND assigned_user_id = ''1'' AND emails.deleted = ''0'' AND status NOT IN (''archived'') AND type NOT IN (''archived'')', '', '1', '1', 0),
('65c6b70b-94cb-bb78-ca0e-581864e389df', 'My Archived Emails', 'archived', '6177e256-6565-dea4-97ce-5818643b406d', 0, 0, 1, '', '', '1', '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `folders_rel`
--

CREATE TABLE IF NOT EXISTS `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `folders_subscriptions`
--

CREATE TABLE IF NOT EXISTS `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `folders_subscriptions`
--

INSERT INTO `folders_subscriptions` (`id`, `folder_id`, `assigned_user_id`) VALUES
('617e2732-c3b0-7e13-3830-581864c9ff01', '6177e256-6565-dea4-97ce-5818643b406d', '1'),
('63fbc7ac-cff8-856f-c746-581864c0a128', '63f52e9f-3f4b-a3f5-53c4-581864b37c15', '1'),
('64f8e7bf-3dfa-79a6-ce1a-581864ee9d00', '64f2e11a-12c8-f3d9-9afd-581864f459ed', '1'),
('65cbef34-5fd0-da84-8aa7-581864adef15', '65c6b70b-94cb-bb78-ca0e-581864e389df', '1');

-- --------------------------------------------------------

--
-- Table structure for table `fp_events`
--

CREATE TABLE IF NOT EXISTS `fp_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `budget` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `invite_templates` varchar(100) DEFAULT NULL,
  `accept_redirect` varchar(255) DEFAULT NULL,
  `decline_redirect` varchar(255) DEFAULT NULL,
  `activity_status_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_audit`
--

CREATE TABLE IF NOT EXISTS `fp_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_contacts_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_contactsfp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_fp_event_delegates_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_fp_event_locations_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_leads_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_leads_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_events_prospects_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_events_prospects_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_prospects_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations`
--

CREATE TABLE IF NOT EXISTS `fp_event_locations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations_audit`
--

CREATE TABLE IF NOT EXISTS `fp_event_locations_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_event_locations_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fp_event_locations_fp_events_1_c`
--

CREATE TABLE IF NOT EXISTS `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `import_maps`
--

CREATE TABLE IF NOT EXISTS `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email`
--

CREATE TABLE IF NOT EXISTS `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_autoreply`
--

CREATE TABLE IF NOT EXISTS `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbound_email_cache_ts`
--

CREATE TABLE IF NOT EXISTS `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_address_cache`
--

CREATE TABLE IF NOT EXISTS `jjwg_address_cache` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `lat` float(10,8) DEFAULT NULL,
  `lng` float(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_address_cache_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_address_cache_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_address_cache_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_areas`
--

CREATE TABLE IF NOT EXISTS `jjwg_areas` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `coordinates` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_areas_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_areas_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_areas_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `distance` float(9,4) DEFAULT NULL,
  `unit_type` varchar(100) DEFAULT 'mi',
  `module_type` varchar(100) DEFAULT 'Accounts',
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_maps_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_jjwg_areas_c`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_maps_jjwg_markers_c`
--

CREATE TABLE IF NOT EXISTS `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_markers`
--

CREATE TABLE IF NOT EXISTS `jjwg_markers` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `jjwg_maps_lat` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_lng` float(11,8) DEFAULT '0.00000000',
  `marker_image` varchar(100) DEFAULT 'company',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jjwg_markers_audit`
--

CREATE TABLE IF NOT EXISTS `jjwg_markers_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_markers_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_queue`
--

CREATE TABLE IF NOT EXISTS `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_queue`
--

INSERT INTO `job_queue` (`assigned_user_id`, `id`, `name`, `deleted`, `date_entered`, `date_modified`, `scheduler_id`, `execute_time`, `status`, `resolution`, `message`, `target`, `data`, `requeue`, `retry_count`, `failure_count`, `job_delay`, `client`, `percent_complete`) VALUES
('1', '2430ede1-9290-142e-b713-58217552a897', 'Leaves balance update', 0, '2016-11-08 06:48:27', '2016-11-08 06:48:27', '18fce0c7-5449-1364-f239-5821728066c6', '2016-11-08 06:48:00', 'done', 'success', NULL, 'function::balance_update_job', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29537', NULL),
('1', '2ead52f2-ce3e-98c4-a765-5821754d2ee0', 'Process Workflow Tasks', 0, '2016-11-08 06:48:27', '2016-11-08 06:48:27', '8d47c0bd-951c-583d-64e0-58047f1ae17e', '2016-11-08 06:48:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/AOW_WorkFlow/AOW_WorkFlow.php on line 124\n', 'function::processAOW_Workflow', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29537', NULL),
('1', '33673f01-6140-90a5-c68e-5821754f1571', 'Run Report Generation Scheduled Tasks', 0, '2016-11-08 06:48:27', '2016-11-08 06:48:27', '8fcec88a-1af6-ac6e-7a20-58047fafea1a', '2016-11-08 06:48:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/Schedulers/_AddJobsHere.php on line 727\n', 'function::aorRunScheduledReports', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29537', NULL),
('1', '384a666f-607e-ed15-2f73-582175c646c4', 'Check Inbound Mailboxes', 0, '2016-11-08 06:48:27', '2016-11-08 06:48:27', '947bf415-afed-06b1-dcfe-58047fd331e1', '2016-11-08 06:48:00', 'done', 'success', NULL, 'function::pollMonitoredInboxesAOP', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29537', NULL),
('1', '3cdfebf6-74f0-50fd-51c1-582175a7f470', 'Run Email Reminder Notifications', 0, '2016-11-08 06:48:27', '2016-11-08 06:48:27', 'a1e2eac4-36e3-073e-8dfb-58047f99e8a7', '2016-11-08 06:48:00', 'done', 'success', NULL, 'function::sendEmailReminders', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29537', NULL),
('1', '438b7b40-9bbb-5459-047e-582175c746cb', 'Process Workflow Tasks', 0, '2016-11-08 06:49:56', '2016-11-08 06:49:56', '8d47c0bd-951c-583d-64e0-58047f1ae17e', '2016-11-08 06:49:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/AOW_WorkFlow/AOW_WorkFlow.php on line 124\n', 'function::processAOW_Workflow', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29586', NULL),
('1', '4e5c98bf-f682-9c1d-84d9-582175642fe5', 'Run Report Generation Scheduled Tasks', 0, '2016-11-08 06:49:56', '2016-11-08 06:49:56', '8fcec88a-1af6-ac6e-7a20-58047fafea1a', '2016-11-08 06:49:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/Schedulers/_AddJobsHere.php on line 727\n', 'function::aorRunScheduledReports', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29586', NULL),
('1', '5332384c-d4ee-1e75-f9c4-5821756f785b', 'Check Inbound Mailboxes', 0, '2016-11-08 06:49:56', '2016-11-08 06:49:56', '947bf415-afed-06b1-dcfe-58047fd331e1', '2016-11-08 06:49:00', 'done', 'success', NULL, 'function::pollMonitoredInboxesAOP', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29586', NULL),
('1', '55dbb59d-c91c-48a4-8ee8-5821740ee132', 'Process Workflow Tasks', 0, '2016-11-08 06:47:09', '2016-11-08 06:47:09', '8d47c0bd-951c-583d-64e0-58047f1ae17e', '2016-11-08 06:47:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/AOW_WorkFlow/AOW_WorkFlow.php on line 124\n', 'function::processAOW_Workflow', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29509', NULL),
('1', '5830d221-29cc-6690-52da-582175762816', 'Run Email Reminder Notifications', 0, '2016-11-08 06:49:56', '2016-11-08 06:49:56', 'a1e2eac4-36e3-073e-8dfb-58047f99e8a7', '2016-11-08 06:49:00', 'done', 'success', NULL, 'function::sendEmailReminders', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29586', NULL),
('1', '596c1085-bca9-eb87-5691-582173a1fa04', 'Leaves balance update', 0, '2016-11-08 06:43:01', '2016-11-08 06:43:01', '18fce0c7-5449-1364-f239-5821728066c6', '2016-11-08 06:43:00', 'done', 'success', NULL, 'function::balance_update_job', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29448', NULL),
('1', '5e6bdde7-7c3b-e460-4217-582175e3865a', 'Leaves balance update', 0, '2016-11-08 06:51:30', '2016-11-08 06:51:30', '18fce0c7-5449-1364-f239-5821728066c6', '2016-11-08 06:51:00', 'done', 'success', NULL, 'function::balance_update_job', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29636', NULL),
('1', '671a95fc-5db2-98b3-2989-582174271d6f', 'Run Report Generation Scheduled Tasks', 0, '2016-11-08 06:47:09', '2016-11-08 06:47:09', '8fcec88a-1af6-ac6e-7a20-58047fafea1a', '2016-11-08 06:47:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/Schedulers/_AddJobsHere.php on line 727\n', 'function::aorRunScheduledReports', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29509', NULL),
('1', '697042e8-7d8f-6289-2338-582175986d46', 'Process Workflow Tasks', 0, '2016-11-08 06:51:30', '2016-11-08 06:51:30', '8d47c0bd-951c-583d-64e0-58047f1ae17e', '2016-11-08 06:51:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/AOW_WorkFlow/AOW_WorkFlow.php on line 124\n', 'function::processAOW_Workflow', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29636', NULL),
('1', '6ba31170-fd91-acca-d4eb-582173f76995', 'Process Workflow Tasks', 0, '2016-11-08 06:43:01', '2016-11-08 06:43:01', '8d47c0bd-951c-583d-64e0-58047f1ae17e', '2016-11-08 06:43:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/AOW_WorkFlow/AOW_WorkFlow.php on line 124\n', 'function::processAOW_Workflow', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29448', NULL),
('1', '6d0f76de-ab36-16a9-8b56-5821742a4cc9', 'Check Inbound Mailboxes', 0, '2016-11-08 06:47:09', '2016-11-08 06:47:09', '947bf415-afed-06b1-dcfe-58047fd331e1', '2016-11-08 06:47:00', 'done', 'success', NULL, 'function::pollMonitoredInboxesAOP', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29509', NULL),
('1', '6e157cdb-f3ce-5548-85a4-58217585e07c', 'Run Report Generation Scheduled Tasks', 0, '2016-11-08 06:51:30', '2016-11-08 06:51:30', '8fcec88a-1af6-ac6e-7a20-58047fafea1a', '2016-11-08 06:51:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/Schedulers/_AddJobsHere.php on line 727\n', 'function::aorRunScheduledReports', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29636', NULL),
('1', '72d1d36f-ae76-1285-65b6-582175a12788', 'Check Inbound Mailboxes', 0, '2016-11-08 06:51:30', '2016-11-08 06:51:30', '947bf415-afed-06b1-dcfe-58047fd331e1', '2016-11-08 06:51:00', 'done', 'success', NULL, 'function::pollMonitoredInboxesAOP', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29636', NULL),
('1', '72efe5ed-dbff-02db-795d-582174765675', 'Run Email Reminder Notifications', 0, '2016-11-08 06:47:09', '2016-11-08 06:47:09', 'a1e2eac4-36e3-073e-8dfb-58047f99e8a7', '2016-11-08 06:47:00', 'done', 'success', NULL, 'function::sendEmailReminders', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29509', NULL),
('1', '75e1111c-2a92-f79a-1d9f-58217361dbd3', 'Run Report Generation Scheduled Tasks', 0, '2016-11-08 06:43:01', '2016-11-08 06:43:01', '8fcec88a-1af6-ac6e-7a20-58047fafea1a', '2016-11-08 06:43:00', 'done', 'success', 'Warning [2]: Invalid argument supplied for foreach() in /var/www/html/SuiteCRM_HRM/modules/Schedulers/_AddJobsHere.php on line 727\n', 'function::aorRunScheduledReports', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29448', NULL),
('1', '77b9b875-33bd-f75b-540b-5821753b8057', 'Run Email Reminder Notifications', 0, '2016-11-08 06:51:30', '2016-11-08 06:51:30', 'a1e2eac4-36e3-073e-8dfb-58047f99e8a7', '2016-11-08 06:51:00', 'done', 'success', NULL, 'function::sendEmailReminders', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29636', NULL),
('1', '7f28360c-c20d-2aeb-f266-5821730a5507', 'Check Inbound Mailboxes', 0, '2016-11-08 06:43:01', '2016-11-08 06:43:01', '947bf415-afed-06b1-dcfe-58047fd331e1', '2016-11-08 06:43:00', 'done', 'success', NULL, 'function::pollMonitoredInboxesAOP', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29448', NULL),
('1', '8178c73d-661e-56e8-00c1-582173d08de6', 'Run Nightly Process Bounced Campaign Emails', 0, '2016-11-08 06:43:01', '2016-11-08 06:43:01', '96e06a4d-1819-8761-94ad-58047f7d9548', '2016-11-08 06:43:00', 'done', 'success', NULL, 'function::pollMonitoredInboxesForBouncedCampaignEmails', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29448', NULL),
('1', '83bcf95a-0484-0913-cb88-582173fc9906', 'Run Nightly Mass Email Campaigns', 0, '2016-11-08 06:43:01', '2016-11-08 06:43:01', '98ecb86b-aaed-b902-640a-58047f3b0f3a', '2016-11-08 06:43:00', 'done', 'success', NULL, 'function::runMassEmailCampaign', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29448', NULL),
('1', '8b21927b-81e8-bef4-de93-582173958f94', 'Run Email Reminder Notifications', 0, '2016-11-08 06:43:01', '2016-11-08 06:43:01', 'a1e2eac4-36e3-073e-8dfb-58047f99e8a7', '2016-11-08 06:43:00', 'done', 'success', NULL, 'function::sendEmailReminders', NULL, 0, NULL, NULL, 0, 'CRON5412a0fec1d3370667ef8d24f4db4071:29448', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE IF NOT EXISTS `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `salutation`, `first_name`, `last_name`, `title`, `photo`, `department`, `do_not_call`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `primary_address_street`, `primary_address_city`, `primary_address_state`, `primary_address_postalcode`, `primary_address_country`, `alt_address_street`, `alt_address_city`, `alt_address_state`, `alt_address_postalcode`, `alt_address_country`, `assistant`, `assistant_phone`, `converted`, `refered_by`, `lead_source`, `lead_source_description`, `status`, `status_description`, `reports_to_id`, `account_name`, `account_description`, `contact_id`, `account_id`, `opportunity_id`, `opportunity_name`, `opportunity_amount`, `campaign_id`, `birthdate`, `portal_name`, `portal_app`, `website`) VALUES
('21680eb7-82a6-c46d-7002-582af0005131', '2016-11-15 11:25:35', '2016-11-15 11:25:35', '1', '1', '', 0, '1', '', '', 'asdas', '', NULL, '', 0, NULL, '', '', NULL, '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, 0, '', '', '', 'New', '', NULL, '', NULL, '', '', '', NULL, '', '', NULL, NULL, NULL, 'http://');

-- --------------------------------------------------------

--
-- Table structure for table `leads_audit`
--

CREATE TABLE IF NOT EXISTS `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leads_cstm`
--

CREATE TABLE IF NOT EXISTS `leads_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leads_cstm`
--

INSERT INTO `leads_cstm` (`id_c`, `jjwg_maps_lng_c`, `jjwg_maps_lat_c`, `jjwg_maps_geocode_status_c`, `jjwg_maps_address_c`) VALUES
('21680eb7-82a6-c46d-7002-582af0005131', 0.00000000, 0.00000000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `linked_documents`
--

CREATE TABLE IF NOT EXISTS `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE IF NOT EXISTS `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_contacts`
--

CREATE TABLE IF NOT EXISTS `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_cstm`
--

CREATE TABLE IF NOT EXISTS `meetings_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_leads`
--

CREATE TABLE IF NOT EXISTS `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `meetings_users`
--

CREATE TABLE IF NOT EXISTS `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

CREATE TABLE IF NOT EXISTS `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

CREATE TABLE IF NOT EXISTS `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities`
--

CREATE TABLE IF NOT EXISTS `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_audit`
--

CREATE TABLE IF NOT EXISTS `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_contacts`
--

CREATE TABLE IF NOT EXISTS `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `opportunities_cstm`
--

CREATE TABLE IF NOT EXISTS `opportunities_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `outbound_email`
--

CREATE TABLE IF NOT EXISTS `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `outbound_email`
--

INSERT INTO `outbound_email` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `deleted`, `assigned_user_id`, `type`, `user_id`, `mail_sendtype`, `mail_smtptype`, `mail_smtpserver`, `mail_smtpport`, `mail_smtpuser`, `mail_smtppass`, `mail_smtpauth_req`, `mail_smtpssl`) VALUES
('27168f95-407d-4e2b-337a-580480a88a66', 'system', NULL, NULL, NULL, NULL, 0, NULL, 'system', '1', 'SMTP', 'other', 'smtp.gmail.com', 587, 'husnain.zaheer840@gmail.com', 'JoDAek0GMPvfWn/CFGNpjA==', 1, '2'),
('b1b6fb3c-5a47-a5a2-3998-581336f6bb14', 'system', NULL, NULL, NULL, NULL, 0, NULL, 'system-override', '8df757f7-32ff-50be-7825-5813363b2b3b', 'SMTP', 'other', 'smtp.gmail.com', 587, 'husnain.zaheer840@gmail.com', 'JoDAek0GMPvfWn/CFGNpjA==', 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `outbound_email_audit`
--

CREATE TABLE IF NOT EXISTS `outbound_email_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_outbound_email_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `override_business_hours` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_accounts`
--

CREATE TABLE IF NOT EXISTS `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_bugs`
--

CREATE TABLE IF NOT EXISTS `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_cases`
--

CREATE TABLE IF NOT EXISTS `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_contacts`
--

CREATE TABLE IF NOT EXISTS `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_opportunities`
--

CREATE TABLE IF NOT EXISTS `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects_products`
--

CREATE TABLE IF NOT EXISTS `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_contacts_1_c`
--

CREATE TABLE IF NOT EXISTS `project_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_contacts_1project_ida` varchar(36) DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_cstm`
--

CREATE TABLE IF NOT EXISTS `project_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task`
--

CREATE TABLE IF NOT EXISTS `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `relationship_type` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_task_audit`
--

CREATE TABLE IF NOT EXISTS `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_users_1_c`
--

CREATE TABLE IF NOT EXISTS `project_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `project_users_1project_ida` varchar(36) DEFAULT NULL,
  `project_users_1users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospects`
--

CREATE TABLE IF NOT EXISTS `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prospects_cstm`
--

CREATE TABLE IF NOT EXISTS `prospects_cstm` (
  `id_c` char(36) NOT NULL,
  `jjwg_maps_lng_c` float(11,8) DEFAULT '0.00000000',
  `jjwg_maps_lat_c` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_geocode_status_c` varchar(255) DEFAULT NULL,
  `jjwg_maps_address_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists`
--

CREATE TABLE IF NOT EXISTS `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_lists_prospects`
--

CREATE TABLE IF NOT EXISTS `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prospect_list_campaigns`
--

CREATE TABLE IF NOT EXISTS `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

CREATE TABLE IF NOT EXISTS `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `relationships`
--

INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('118ec772-89df-3fbc-1317-582f0107311f', 'outbound_email_modified_user', 'Users', 'users', 'id', 'OutboundEmailAccounts', 'outbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('11e001ae-1b61-f7a5-07d5-582f010d4f9a', 'rt_employees_rt_appraisals', 'RT_Employees', 'rt_employees', 'id', 'RT_Appraisals', 'rt_appraisals', 'id', 'rt_employees_rt_appraisals_c', 'rt_employees_rt_appraisalsrt_employees_ida', 'rt_employees_rt_appraisalsrt_appraisals_idb', 'many-to-many', NULL, NULL, 0, 0),
('11f117fb-2e8d-a9f1-f7af-582f012c15d9', 'aod_indexevent_modified_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1249b9bc-0b7b-8ff0-13f3-582f01f10802', 'outbound_email_created_by', 'Users', 'users', 'id', 'OutboundEmailAccounts', 'outbound_email', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('12b6d4ae-2a1d-1c54-9fc8-582f01dd2c28', 'aod_indexevent_created_by', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1301b2a7-6930-7a70-25ee-582f0141a0e3', 'outbound_email_assigned_user', 'Users', 'users', 'id', 'OutboundEmailAccounts', 'outbound_email', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1354bc3f-1e72-9ad5-e78b-582f016d4806', 'aod_indexevent_assigned_user', 'Users', 'users', 'id', 'AOD_IndexEvent', 'aod_indexevent', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1686e10a-2da9-f4b2-eec1-582f01582800', 'templatesectionline_modified_user', 'Users', 'users', 'id', 'TemplateSectionLine', 'templatesectionline', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('173529b4-6f85-715c-dcad-582f019f44dc', 'templatesectionline_created_by', 'Users', 'users', 'id', 'TemplateSectionLine', 'templatesectionline', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1a12bfb8-2cc2-d710-76bf-582f019938f0', 'contacts_modified_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1abd33a6-7810-2461-5ce4-582f01c66d01', 'contacts_created_by', 'Users', 'users', 'id', 'Contacts', 'contacts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1b2a404b-b0e6-680a-e42a-582f0143378e', 'contacts_assigned_user', 'Users', 'users', 'id', 'Contacts', 'contacts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1bc3e987-382e-1403-28d0-582f0123bdd9', 'securitygroups_contacts', 'SecurityGroups', 'securitygroups', 'id', 'Contacts', 'contacts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Contacts', 0, 0),
('1c77133e-ac42-95b2-8d40-582f0141c48f', 'contacts_email_addresses', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('1d0d02a9-b57b-91a9-4bd4-582f01a37d07', 'contacts_email_addresses_primary', 'Contacts', 'contacts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('1dae5c80-9b01-549d-30da-582f0180f0cf', 'contact_direct_reports', 'Contacts', 'contacts', 'id', 'Contacts', 'contacts', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1dbfdbb2-99c6-04f9-efb5-582f01c9e712', 'rt_candidates_modified_user', 'Users', 'users', 'id', 'RT_Candidates', 'rt_candidates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1e100810-b070-0965-2f6d-582f0167cf9e', 'contact_leads', 'Contacts', 'contacts', 'id', 'Leads', 'leads', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1e4c8a47-fb81-1eac-1b85-582f0149168c', 'rt_candidates_created_by', 'Users', 'users', 'id', 'RT_Candidates', 'rt_candidates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1e8eea17-d534-c4db-a5b4-582f01f52b5d', 'contact_notes', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1ed606e9-e901-72c1-2a0d-582f016bc1f3', 'rt_departments_rt_employees', 'RT_Departments', 'rt_departments', 'id', 'RT_Employees', 'rt_employees', 'id', 'rt_departments_rt_employees_c', 'rt_departments_rt_employeesrt_departments_ida', 'rt_departments_rt_employeesrt_employees_idb', 'many-to-many', NULL, NULL, 0, 0),
('1eda4109-6d42-9065-fffb-582f01c6ad3f', 'rt_candidates_assigned_user', 'Users', 'users', 'id', 'RT_Candidates', 'rt_candidates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('1f7f5f37-4b8d-d929-c50e-582f0128215c', 'securitygroups_rt_candidates', 'SecurityGroups', 'securitygroups', 'id', 'RT_Candidates', 'rt_candidates', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Candidates', 0, 0),
('1ff893db-81eb-2c9f-ba0f-582f015b9037', 'rt_candidates_email_addresses', 'RT_Candidates', 'rt_candidates', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'RT_Candidates', 0, 0),
('20630b9c-3a6d-622b-2de5-582f01b974b1', 'jjwg_address_cache_modified_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2098d297-be4c-1646-d4c0-582f0129a6ef', 'rt_candidates_email_addresses_primary', 'RT_Candidates', 'rt_candidates', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('216dafee-b050-d049-d9f3-582f01fa2a27', 'contact_tasks', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('21825ee0-f4ba-d8f7-fb2c-582f017a6030', 'aod_index_modified_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2205c891-fa93-d53d-b7c6-582f019dd0a0', 'contact_tasks_parent', 'Contacts', 'contacts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('221fd2e7-8491-4555-e8db-582f01771ee1', 'aod_index_created_by', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('22918e3b-a8f1-0b38-5a3b-582f01ee47bd', 'contact_notes_parent', 'Contacts', 'contacts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('22a64591-d27a-b759-7b07-582f01421aef', 'aod_index_assigned_user', 'Users', 'users', 'id', 'AOD_Index', 'aod_index', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('22fa6f7b-c4eb-bdb2-01e9-582f0182e554', 'contact_campaign_log', 'Contacts', 'contacts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Contacts', 0, 0),
('239fc481-f418-05e9-52cc-582f01104138', 'contact_aos_quotes', 'Contacts', 'contacts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('245a6d51-f648-7e50-9681-582f01e1a8c4', 'rt_salarysetting_modified_user', 'Users', 'users', 'id', 'RT_SalarySetting', 'rt_salarysetting', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('245bb292-1d70-d4cf-243c-582f01331037', 'contact_aos_invoices', 'Contacts', 'contacts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('24f5f750-17ca-2576-448e-582f01e56397', 'contact_aos_contracts', 'Contacts', 'contacts', 'id', 'AOS_Contracts', 'aos_contracts', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2503e112-9f3c-8ef8-774e-582f016cb282', 'rt_salarysetting_created_by', 'Users', 'users', 'id', 'RT_SalarySetting', 'rt_salarysetting', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('258dd4e4-a582-2039-1e8d-582f01cb6763', 'aop_case_events_modified_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('259b50dc-e46d-7f99-a81e-582f01dae4b4', 'rt_salarysetting_assigned_user', 'Users', 'users', 'id', 'RT_SalarySetting', 'rt_salarysetting', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('25aa95d1-4cad-24ae-51e5-582f0119180e', 'contacts_aop_case_updates', 'Contacts', 'contacts', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'contact_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('262152c1-aa24-3bf3-50e7-582f0101bc21', 'securitygroups_rt_salarysetting', 'SecurityGroups', 'securitygroups', 'id', 'RT_SalarySetting', 'rt_salarysetting', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_SalarySetting', 0, 0),
('2630e8eb-71b4-71f2-f0c8-582f01051d80', 'aop_case_events_created_by', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('26a5597e-d699-04a5-9703-582f010eaee8', 'aop_case_events_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Events', 'aop_case_events', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2745db98-9d25-c4ed-a6cc-582f0111d164', 'cases_aop_case_events', 'Cases', 'cases', 'id', 'AOP_Case_Events', 'aop_case_events', 'case_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2abe0bd2-bc8d-a8cf-c49c-582f01739159', 'jjwg_address_cache_created_by', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2ac73fc9-bac0-e5fe-c167-582f01fac583', 'aop_case_updates_modified_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2b776ee9-4aaa-f947-d58a-582f01b5135d', 'aop_case_updates_created_by', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2c482370-1354-3817-ffa6-582f0119ef06', 'aop_case_updates_assigned_user', 'Users', 'users', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2cd47c32-be3b-4d67-a6ea-582f014b6e80', 'rt_qualifications_modified_user', 'Users', 'users', 'id', 'RT_Qualifications', 'rt_qualifications', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2d1063ba-ef25-777c-87da-582f01ee959d', 'cases_aop_case_updates', 'Cases', 'cases', 'id', 'AOP_Case_Updates', 'aop_case_updates', 'case_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2d6df259-84e0-26b8-2640-582f0174bd66', 'rt_qualifications_created_by', 'Users', 'users', 'id', 'RT_Qualifications', 'rt_qualifications', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2de8b41f-24be-2906-f4ed-582f0161fefd', 'aop_case_updates_notes', 'AOP_Case_Updates', 'aop_case_updates', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOP_Case_Updates', 0, 0),
('2e103490-1a5b-e63e-a42f-582f016a2262', 'rt_qualifications_assigned_user', 'Users', 'users', 'id', 'RT_Qualifications', 'rt_qualifications', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('2e89b539-a289-16a7-bca2-582f018beebd', 'securitygroups_rt_qualifications', 'SecurityGroups', 'securitygroups', 'id', 'RT_Qualifications', 'rt_qualifications', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Qualifications', 0, 0),
('2f5a7f9b-0c8c-7301-ece5-582f016e5b58', 'rt_qualifications_rt_employees', 'RT_Qualifications', 'rt_qualifications', 'parent_id', 'RT_Employees', 'rt_employees', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'RT_Employees', 0, 0),
('2f600d02-5206-4f4a-d1f8-582f01a7ee29', 'email_template_email_marketings', 'EmailTemplates', 'email_templates', 'id', 'EmailMarketing', 'email_marketing', 'template_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('301000ce-73e6-ea26-561d-582f0199c498', 'rt_qualifications_rt_candidates', 'RT_Qualifications', 'rt_qualifications', 'parent_id', 'RT_Candidates', 'rt_candidates', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'RT_Candidates', 0, 0),
('31120a29-370a-b229-52f9-582f016da2e1', 'rt_employees_documents', 'RT_Employees', 'rt_employees', 'id', 'Documents', 'documents', 'id', 'rt_employees_documents_c', 'rt_employees_documentsrt_employees_ida', 'rt_employees_documentsdocuments_idb', 'many-to-many', NULL, NULL, 0, 0),
('31e11d1f-2b16-f23c-037f-582f01149e8c', 'accounts_modified_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('329c3781-aa8c-5c91-78f3-582f015484b9', 'accounts_created_by', 'Users', 'users', 'id', 'Accounts', 'accounts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('338bc7ac-ebd8-857d-e5a0-582f01f3b6bf', 'accounts_assigned_user', 'Users', 'users', 'id', 'Accounts', 'accounts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('345da8a3-3d81-1f85-4e45-582f0173727d', 'securitygroups_accounts', 'SecurityGroups', 'securitygroups', 'id', 'Accounts', 'accounts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Accounts', 0, 0),
('34631da4-84b4-5159-ecb1-582f0165f6e8', 'rt_increment_history_modified_user', 'Users', 'users', 'id', 'RT_Increment_History', 'rt_increment_history', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('34d003ab-fedf-8b9e-cc98-582f017255e6', 'jjwg_address_cache_assigned_user', 'Users', 'users', 'id', 'jjwg_Address_Cache', 'jjwg_address_cache', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('35174f8a-d34b-9078-9dc1-582f01780c08', 'rt_increment_history_created_by', 'Users', 'users', 'id', 'RT_Increment_History', 'rt_increment_history', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('355112c3-b28f-99d9-1e77-582f016b453d', 'accounts_email_addresses', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('3578138f-8bc2-5fc9-51e8-582f01c0d18c', 'rt_increment_history_assigned_user', 'Users', 'users', 'id', 'RT_Increment_History', 'rt_increment_history', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('35aae9ee-4d37-8e48-faa0-582f01c4da3e', 'aor_reports_modified_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3602a2f4-44c4-61b2-866c-582f01d1f096', 'securitygroups_rt_increment_history', 'SecurityGroups', 'securitygroups', 'id', 'RT_Increment_History', 'rt_increment_history', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Increment_History', 0, 0),
('362ee215-2897-a3aa-a77e-582f01a1ebbf', 'accounts_email_addresses_primary', 'Accounts', 'accounts', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('365f5324-8405-d510-80ed-582f01801d15', 'aor_reports_created_by', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('36ed79dd-d8c5-2586-9f7e-582f01a6b9c6', 'member_accounts', 'Accounts', 'accounts', 'id', 'Accounts', 'accounts', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3713f6de-9362-9d66-fbc3-582f013cae74', 'aor_reports_assigned_user', 'Users', 'users', 'id', 'AOR_Reports', 'aor_reports', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('376598cd-f4e0-9e85-e4d3-582f017d69cd', 'account_cases', 'Accounts', 'accounts', 'id', 'Cases', 'cases', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('37907f1f-0545-1fc7-471f-582f0182402f', 'securitygroups_aor_reports', 'SecurityGroups', 'securitygroups', 'id', 'AOR_Reports', 'aor_reports', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOR_Reports', 0, 0),
('3804ad54-25ac-a6f9-19d8-582f0103c4c7', 'account_tasks', 'Accounts', 'accounts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('3843dd0d-3a99-b2a0-dd5b-582f0122d115', 'aor_reports_aor_fields', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Fields', 'aor_fields', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('387748f1-30fb-ec0c-3d67-582f0178dee5', 'account_notes', 'Accounts', 'accounts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('38e422d4-7adb-0dc0-bb21-582f0136fb86', 'aor_reports_aor_conditions', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Conditions', 'aor_conditions', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('391bac3f-5444-dd69-81a6-582f013a1de9', 'account_meetings', 'Accounts', 'accounts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('3953de3c-4f6d-e7d0-f961-582f011156ec', 'aor_scheduled_reports_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('39b370ad-fc6b-0d3a-c2d2-582f017a275c', 'account_calls', 'Accounts', 'accounts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('3a4999ae-5017-d48c-8904-582f01abe836', 'account_emails', 'Accounts', 'accounts', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('3ac14109-c3c6-ff91-5447-582f018d3b76', 'rt_payroll_modified_user', 'Users', 'users', 'id', 'RT_Payroll', 'rt_payroll', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3b101963-ed8b-c3f1-b451-582f0183e1c4', 'account_leads', 'Accounts', 'accounts', 'id', 'Leads', 'leads', 'account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3b55630d-df6a-387f-7de7-582f019d906b', 'rt_payroll_created_by', 'Users', 'users', 'id', 'RT_Payroll', 'rt_payroll', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3bd68fc3-dca5-b32a-c27c-582f010bb67a', 'rt_payroll_assigned_user', 'Users', 'users', 'id', 'RT_Payroll', 'rt_payroll', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3bec1249-f824-ace0-40b6-582f014e857b', 'account_campaign_log', 'Accounts', 'accounts', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Accounts', 0, 0),
('3c4f864f-4956-2f76-820f-582f0115503a', 'securitygroups_rt_payroll', 'SecurityGroups', 'securitygroups', 'id', 'RT_Payroll', 'rt_payroll', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Payroll', 0, 0),
('3c762c1d-396f-9dce-2075-582f01996a21', 'account_aos_quotes', 'Accounts', 'accounts', 'id', 'AOS_Quotes', 'aos_quotes', 'billing_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3d0d2d29-716a-e868-4982-582f017cc736', 'account_aos_invoices', 'Accounts', 'accounts', 'id', 'AOS_Invoices', 'aos_invoices', 'billing_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3d69c05f-0d55-9ca8-d452-582f0157b8f7', 'aor_fields_modified_user', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3d98b2ba-6949-b87e-8676-582f014f93ac', 'account_aos_contracts', 'Accounts', 'accounts', 'id', 'AOS_Contracts', 'aos_contracts', 'contract_account_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('3e1a1dcc-3dc5-cabf-df22-582f0129b9e8', 'aor_fields_created_by', 'Users', 'users', 'id', 'AOR_Fields', 'aor_fields', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('41a4c84e-130b-0841-8c05-582f019c1f20', 'aor_charts_modified_user', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('424a0183-91c9-cd1e-6902-582f0181c214', 'aor_charts_created_by', 'Users', 'users', 'id', 'AOR_Charts', 'aor_charts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('42fe1744-39c7-40e5-05ef-582f01094df8', 'aor_charts_aor_reports', 'AOR_Reports', 'aor_reports', 'id', 'AOR_Charts', 'aor_charts', 'aor_report_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4304096a-92bd-be2c-ff6e-582f01971105', 'rt_employees_rt_employees', 'RT_Employees', 'rt_employees', 'id', 'RT_Employees', 'rt_employees', 'id', 'rt_employees_rt_employees_c', 'rt_employees_rt_employeesrt_employees_ida', 'rt_employees_rt_employeesrt_employees_idb', 'many-to-many', NULL, NULL, 0, 0),
('452968a5-c195-9a91-b94f-582f01761a34', 'opportunities_modified_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('45a8b4ea-15c6-3ff1-779a-582f01c2c8ab', 'rt_employees_modified_user', 'Users', 'users', 'id', 'RT_Employees', 'rt_employees', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('45ccf2a8-7756-2aca-76de-582f01e1e367', 'opportunities_created_by', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4661a8b0-27db-d828-b219-582f01c25ee8', 'opportunities_assigned_user', 'Users', 'users', 'id', 'Opportunities', 'opportunities', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('46760fe2-f451-bf0a-4398-582f01c5a824', 'rt_employees_created_by', 'Users', 'users', 'id', 'RT_Employees', 'rt_employees', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('46d1554e-b6b9-0a4e-e604-582f01233f6a', 'securitygroups_opportunities', 'SecurityGroups', 'securitygroups', 'id', 'Opportunities', 'opportunities', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Opportunities', 0, 0),
('47239ad4-fc0f-da36-1644-582f010200c2', 'rt_employees_assigned_user', 'Users', 'users', 'id', 'RT_Employees', 'rt_employees', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('47299b43-4b0e-6ffc-fb1f-582f016bc731', 'aor_conditions_modified_user', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('47935782-ef19-1feb-6bc3-582f01c66b56', 'opportunity_calls', 'Opportunities', 'opportunities', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('47db5a5a-94fa-854a-ae83-582f01e473d8', 'securitygroups_rt_employees', 'SecurityGroups', 'securitygroups', 'id', 'RT_Employees', 'rt_employees', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Employees', 0, 0),
('47e2c21d-cfde-24fb-21e2-582f018fd81e', 'aor_conditions_created_by', 'Users', 'users', 'id', 'AOR_Conditions', 'aor_conditions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('481830d3-4183-b8a4-8053-582f01ca716d', 'opportunity_meetings', 'Opportunities', 'opportunities', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('48a3f09d-8b06-e70f-d714-582f01cdc527', 'rt_employees_email_addresses', 'RT_Employees', 'rt_employees', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'RT_Employees', 0, 0),
('48e76811-c0f3-f95f-961d-582f0122e5db', 'opportunity_tasks', 'Opportunities', 'opportunities', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('4954c049-82c0-d1a5-dbb7-582f01d8c15e', 'rt_employees_email_addresses_primary', 'RT_Employees', 'rt_employees', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('4978017f-6321-4dc0-6b4f-582f0199ea82', 'campaign_campaigntrakers', 'Campaigns', 'campaigns', 'id', 'CampaignTrackers', 'campaign_trkrs', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('49a44b16-6caa-e904-b4dc-582f01cc07c2', 'opportunity_notes', 'Opportunities', 'opportunities', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('4a6458f0-42a8-5b3f-f5d9-582f018b59cf', 'opportunity_emails', 'Opportunities', 'opportunities', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('4ae7ae4a-bf1f-35e7-09a2-582f01a685d5', 'opportunity_leads', 'Opportunities', 'opportunities', 'id', 'Leads', 'leads', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4bc27b30-9399-3839-a126-582f01d2666f', 'opportunity_currencies', 'Opportunities', 'opportunities', 'currency_id', 'Currencies', 'currencies', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4c0cf5a8-638e-b833-c9b7-582f01a93cb5', 'aor_scheduled_reports_modified_user', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4c888e93-29e9-d959-1445-582f01f7a48c', 'opportunities_campaign', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4cc800c6-9523-4b8c-1c1d-582f01b80f21', 'aor_scheduled_reports_created_by', 'Users', 'users', 'id', 'AOR_Scheduled_Reports', 'aor_scheduled_reports', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4d050678-e874-87b3-4b0e-582f01f31562', 'opportunity_aos_quotes', 'Opportunities', 'opportunities', 'id', 'AOS_Quotes', 'aos_quotes', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4d14f0db-db05-991c-069a-582f018019b9', 'rt_bonus_modified_user', 'Users', 'users', 'id', 'RT_Bonus', 'rt_bonus', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('4da8aa21-3fae-dc97-fb5e-582f01cec632', 'opportunity_aos_contracts', 'Opportunities', 'opportunities', 'id', 'AOS_Contracts', 'aos_contracts', 'opportunity_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('50082408-e038-3350-62e5-582f01614c81', 'rt_bonus_created_by', 'Users', 'users', 'id', 'RT_Bonus', 'rt_bonus', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('50a02802-6251-effc-7a76-582f01d74f36', 'rt_bonus_assigned_user', 'Users', 'users', 'id', 'RT_Bonus', 'rt_bonus', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('514bcded-c63f-e7c4-f821-582f018a3bf3', 'securitygroups_rt_bonus', 'SecurityGroups', 'securitygroups', 'id', 'RT_Bonus', 'rt_bonus', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Bonus', 0, 0),
('522fb260-89a1-4aff-72dc-582f0100684b', 'securitygroups_emailtemplates', 'SecurityGroups', 'securitygroups', 'id', 'EmailTemplates', 'email_templates', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'EmailTemplates', 0, 0),
('52300613-6b51-3300-5c9b-582f017878aa', 'prospect_emails', 'Prospects', 'prospects', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('53149904-5335-66de-51de-582f01f9dc7e', 'emailtemplates_assigned_user', 'Users', 'users', 'id', 'EmailTemplates', 'email_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('54920595-8178-b96e-cf4b-582f019e475f', 'fp_events_modified_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('562f3742-b902-ab57-5201-582f01c95848', 'aos_contracts_modified_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('56a89baf-7021-eb8e-dd5e-582f015cb51d', 'rt_leaves_modified_user', 'Users', 'users', 'id', 'RT_Leaves', 'rt_leaves', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('574b3e73-256a-5949-bd97-582f01a687a5', 'rt_leaves_created_by', 'Users', 'users', 'id', 'RT_Leaves', 'rt_leaves', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('580b5fae-550f-b42b-56ed-582f01c0652f', 'rt_leaves_assigned_user', 'Users', 'users', 'id', 'RT_Leaves', 'rt_leaves', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('588f10ae-f944-99dc-d433-582f010a32c1', 'securitygroups_rt_leaves', 'SecurityGroups', 'securitygroups', 'id', 'RT_Leaves', 'rt_leaves', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Leaves', 0, 0),
('58f9b35a-71da-1965-d014-582f01f336d5', 'notes_assigned_user', 'Users', 'users', 'id', 'Notes', 'notes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('59be88f2-d4fc-234f-39de-582f01551aac', 'securitygroups_notes', 'SecurityGroups', 'securitygroups', 'id', 'Notes', 'notes', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Notes', 0, 0),
('5a8a8f93-5be9-7b2a-9fe3-582f01272bb9', 'notes_modified_user', 'Users', 'users', 'id', 'Notes', 'notes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5b8c862f-59c3-531c-c4e5-582f010fc77b', 'notes_created_by', 'Users', 'users', 'id', 'Notes', 'notes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5cd96b66-2729-11bd-576b-582f0191d2d4', 'rt_deductables_modified_user', 'Users', 'users', 'id', 'RT_Deductables', 'rt_deductables', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5d06e7a7-124e-ad22-5a23-582f011bc1f9', 'aos_contracts_created_by', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5d941768-c852-f348-2590-582f01b05655', 'rt_deductables_created_by', 'Users', 'users', 'id', 'RT_Deductables', 'rt_deductables', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5dcd7cdd-dbb5-b12d-3b0a-582f010a7b75', 'aos_contracts_assigned_user', 'Users', 'users', 'id', 'AOS_Contracts', 'aos_contracts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5e586fdd-7b62-160b-7d47-582f01e7ae13', 'rt_deductables_assigned_user', 'Users', 'users', 'id', 'RT_Deductables', 'rt_deductables', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('5e793158-3297-2cc8-e776-582f0117d0a8', 'securitygroups_aos_contracts', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Contracts', 0, 0),
('5f0885e6-8312-4ba5-1281-582f012f6947', 'securitygroups_rt_deductables', 'SecurityGroups', 'securitygroups', 'id', 'RT_Deductables', 'rt_deductables', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Deductables', 0, 0),
('5f257d6b-2e83-3804-e3cd-582f013f519c', 'aos_contracts_tasks', 'AOS_Contracts', 'aos_contracts', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('5fbf6a22-7dbd-0a2f-4ee0-582f018690fa', 'aos_contracts_notes', 'AOS_Contracts', 'aos_contracts', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('600c0791-e9a6-efeb-e2a9-582f01f8886c', 'fp_events_created_by', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('601ef417-42d1-dd80-a010-582f01621770', 'aos_contracts_meetings', 'AOS_Contracts', 'aos_contracts', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('60b4a372-73d5-5f5d-91e6-582f0195535d', 'aos_contracts_calls', 'AOS_Contracts', 'aos_contracts', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'AOS_Contracts', 0, 0),
('6151e902-87e5-33ce-0937-582f01c4793e', 'aos_contracts_aos_products_quotes', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('61ea7775-6ee4-199b-c994-582f01244a4f', 'aos_contracts_aos_line_item_groups', 'AOS_Contracts', 'aos_contracts', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6230cb40-6106-1bd7-1988-582f01e610f8', 'rt_appraisals_modified_user', 'Users', 'users', 'id', 'RT_Appraisals', 'rt_appraisals', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('62d1596b-a7d1-2f8d-b0de-582f014351c4', 'rt_appraisals_created_by', 'Users', 'users', 'id', 'RT_Appraisals', 'rt_appraisals', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6337e022-ece1-90e8-7043-582f011ca657', 'rt_appraisals_assigned_user', 'Users', 'users', 'id', 'RT_Appraisals', 'rt_appraisals', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('63ce557b-5826-b625-8bfc-582f01f6b08c', 'calls_modified_user', 'Users', 'users', 'id', 'Calls', 'calls', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('63d105b3-7775-0f57-35f4-582f011301c4', 'securitygroups_rt_appraisals', 'SecurityGroups', 'securitygroups', 'id', 'RT_Appraisals', 'rt_appraisals', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Appraisals', 0, 0),
('6507a19e-d536-a24c-0f10-582f01d00ad8', 'calls_created_by', 'Users', 'users', 'id', 'Calls', 'calls', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('65c2b008-ba53-9ad0-364a-582f01c90b64', 'calls_assigned_user', 'Users', 'users', 'id', 'Calls', 'calls', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('662fd067-2a08-9330-32d4-582f01cee83e', 'securitygroups_calls', 'SecurityGroups', 'securitygroups', 'id', 'Calls', 'calls', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Calls', 0, 0),
('66c2d43e-9811-7f64-9fc9-582f0199fe2b', 'calls_notes', 'Calls', 'calls', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Calls', 0, 0),
('671c8bb2-9ea2-f66a-9a04-582f01c3e143', 'calls_reschedule', 'Calls', 'calls', 'id', 'Calls_Reschedule', 'calls_reschedule', 'call_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('672304b6-3a66-ef75-025a-582f011c2e2b', 'rt_pay_tracker_modified_user', 'Users', 'users', 'id', 'RT_Pay_Tracker', 'rt_pay_tracker', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('67420e49-570e-55f4-f5d2-582f01cdc211', 'fp_events_assigned_user', 'Users', 'users', 'id', 'FP_events', 'fp_events', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6819aa15-84e4-2916-af64-582f014d278b', 'rt_pay_tracker_created_by', 'Users', 'users', 'id', 'RT_Pay_Tracker', 'rt_pay_tracker', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('68b783ed-4e23-1234-24cc-582f017707a4', 'aos_invoices_modified_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('68b78f07-bb97-0e61-ed03-582f01cd4046', 'rt_pay_tracker_assigned_user', 'Users', 'users', 'id', 'RT_Pay_Tracker', 'rt_pay_tracker', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('69235e92-dc69-e936-4390-582f01abc50c', 'securitygroups_rt_pay_tracker', 'SecurityGroups', 'securitygroups', 'id', 'RT_Pay_Tracker', 'rt_pay_tracker', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Pay_Tracker', 0, 0),
('696f3bf1-556e-0662-2c6d-582f016dfc1f', 'aos_invoices_created_by', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6a1af944-aaef-a11d-a422-582f01b17d64', 'aos_invoices_assigned_user', 'Users', 'users', 'id', 'AOS_Invoices', 'aos_invoices', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6a926d2c-07ff-e995-7a7a-582f0178635f', 'securitygroups_emails', 'SecurityGroups', 'securitygroups', 'id', 'Emails', 'emails', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Emails', 0, 0),
('6ad1d390-d498-9b43-4a10-582f01269003', 'securitygroups_aos_invoices', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Invoices', 'aos_invoices', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Invoices', 0, 0),
('6b4e8b82-e08d-6602-81ac-582f01d4bf4e', 'emails_assigned_user', 'Users', 'users', 'id', 'Emails', 'emails', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6be02976-7c08-9cf1-78f3-582f01f0a221', 'aos_invoices_aos_product_quotes', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6c098169-225d-5def-c817-582f012785ad', 'emails_modified_user', 'Users', 'users', 'id', 'Emails', 'emails', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6cb904a6-29a8-4a80-15d3-582f014777a4', 'aos_invoices_aos_line_item_groups', 'AOS_Invoices', 'aos_invoices', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6cde960e-c0f6-19e6-0d56-582f014ffbdc', 'emails_created_by', 'Users', 'users', 'id', 'Emails', 'emails', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6d223a4d-8e53-6ef2-f553-582f015a902c', 'rt_departments_modified_user', 'Users', 'users', 'id', 'RT_Departments', 'rt_departments', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6d7ef4e9-3c8c-7b99-2555-582f0157032c', 'emails_notes_rel', 'Emails', 'emails', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6dd4c83b-d986-c854-286b-582f0136809d', 'rt_departments_created_by', 'Users', 'users', 'id', 'RT_Departments', 'rt_departments', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6de4de5a-7bf9-fb41-477e-582f01fea15a', 'emails_contacts_rel', 'Emails', 'emails', 'id', 'Contacts', 'contacts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Contacts', 0, 0),
('6e6a2c54-2a57-dba0-ff90-582f0172bb0c', 'emails_accounts_rel', 'Emails', 'emails', 'id', 'Accounts', 'accounts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Accounts', 0, 0),
('6e7b2330-2b80-fbb5-7532-582f013fdd82', 'rt_departments_assigned_user', 'Users', 'users', 'id', 'RT_Departments', 'rt_departments', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('6ed08644-15cf-e0bc-6285-582f010ad8ae', 'emails_leads_rel', 'Emails', 'emails', 'id', 'Leads', 'leads', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('6eea79bd-c61d-c120-6514-582f01a8a31b', 'securitygroups_rt_departments', 'SecurityGroups', 'securitygroups', 'id', 'RT_Departments', 'rt_departments', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Departments', 0, 0),
('6f695ba8-c6af-046e-8e14-582f01846c1c', 'emails_aos_contracts_rel', 'Emails', 'emails', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'AOS_Contracts', 0, 0),
('6ffd05af-fb71-2a70-5ea2-582f01b0fd63', 'emails_meetings_rel', 'Emails', 'emails', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('71d708f1-cb9a-5459-b08b-582f0103574a', 'securitygroups_fp_events', 'SecurityGroups', 'securitygroups', 'id', 'FP_events', 'fp_events', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'FP_events', 0, 0),
('72390a75-d074-b88a-13fe-582f013d9289', 'aos_pdf_templates_modified_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7252cda1-85b4-cc1b-aa3c-582f01de590e', 'rt_performance_reviews_modified_user', 'Users', 'users', 'id', 'RT_Performance_Reviews', 'rt_performance_reviews', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('72600f57-0217-5a97-6a7d-582f0133db61', 'reminders_invitees_assigned_user', 'Users', 'users', 'id', 'Reminders_Invitees', 'reminders_invitees', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('73020d6f-2afd-fbc0-48ee-582f01d85a68', 'rt_performance_reviews_created_by', 'Users', 'users', 'id', 'RT_Performance_Reviews', 'rt_performance_reviews', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('732e1904-18ae-75fb-873e-582f01b83ff3', 'aos_pdf_templates_created_by', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('738dbe94-dcb3-0227-bf07-582f01ec90f4', 'rt_performance_reviews_assigned_user', 'Users', 'users', 'id', 'RT_Performance_Reviews', 'rt_performance_reviews', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('73d8a399-a718-93b9-8be5-582f0116f30e', 'aos_pdf_templates_assigned_user', 'Users', 'users', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7401998c-23ed-5a4a-cb78-582f01de85da', 'securitygroups_rt_performance_reviews', 'SecurityGroups', 'securitygroups', 'id', 'RT_Performance_Reviews', 'rt_performance_reviews', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'RT_Performance_Reviews', 0, 0),
('74799e44-e904-43a1-23d3-582f0141bd93', 'securitygroups_aos_pdf_templates', 'SecurityGroups', 'securitygroups', 'id', 'AOS_PDF_Templates', 'aos_pdf_templates', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_PDF_Templates', 0, 0),
('74e23002-4dd8-75ad-c645-582f0131cc5a', 'rt_performance_reviews_rt_employees', 'RT_Performance_Reviews', 'rt_performance_reviews', 'rt_emp_id', 'RT_Employees', 'rt_employees', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('758f034d-ac04-04ee-82ed-582f01e24e0c', 'calls_reschedule_modified_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('78f73c55-302c-63bc-0aad-582f012d89ba', 'meetings_modified_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('793a8c9a-8804-4a7a-65e6-582f0197dc36', 'aos_product_categories_modified_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('79900171-1f5f-32e4-91a5-582f011dcfce', 'rt_employees_rt_deductables', 'RT_Employees', 'rt_employees', 'id', 'RT_Deductables', 'rt_deductables', 'id', 'rt_employees_rt_deductables_c', 'rt_employees_rt_deductablesrt_employees_ida', 'rt_employees_rt_deductablesrt_deductables_idb', 'many-to-many', NULL, NULL, 0, 0),
('79b544e9-9256-1c95-809e-582f012e25e7', 'meetings_created_by', 'Users', 'users', 'id', 'Meetings', 'meetings', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('79ef7d6a-f3f8-5ce5-6f7a-582f01f4cd3e', 'aos_product_categories_created_by', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7a4a4fb9-1ecb-85e7-ec7d-582f01c8bd30', 'meetings_assigned_user', 'Users', 'users', 'id', 'Meetings', 'meetings', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7a80a97c-111c-b428-3cd4-582f0139e350', 'aos_product_categories_assigned_user', 'Users', 'users', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7abc7ec9-35e8-83ff-2e99-582f018b73ba', 'securitygroups_meetings', 'SecurityGroups', 'securitygroups', 'id', 'Meetings', 'meetings', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Meetings', 0, 0),
('7b57e9fe-a0a6-3964-0771-582f01034104', 'meetings_notes', 'Meetings', 'meetings', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('7b64c649-d7c1-c734-ca1e-582f01f725bf', 'securitygroups_aos_product_categories', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Product_Categories', 0, 0),
('7bc2f934-b1ac-2975-9543-582f01cb5a69', 'sub_product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Product_Categories', 'aos_product_categories', 'parent_category_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('7ff705a4-4223-050f-5a41-582f01945674', 'calls_reschedule_created_by', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('806b3787-d8ed-b890-0ebb-582f015c1c57', 'tasks_modified_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8127569b-e073-cd27-8d99-582f01e661da', 'tasks_created_by', 'Users', 'users', 'id', 'Tasks', 'tasks', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8139cb63-939e-6e41-8453-582f015f58e1', 'aos_products_modified_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('818cd955-e0ca-1b1c-4d33-582f01c9b834', 'tasks_assigned_user', 'Users', 'users', 'id', 'Tasks', 'tasks', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('81d3fa90-fdff-c158-d2df-582f010c4ff4', 'aos_products_created_by', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('822de2a7-15c0-e4a7-6a9e-582f01f09da6', 'securitygroups_tasks', 'SecurityGroups', 'securitygroups', 'id', 'Tasks', 'tasks', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Tasks', 0, 0),
('825c7012-a370-a585-5e8c-582f016d8b7c', 'aos_products_assigned_user', 'Users', 'users', 'id', 'AOS_Products', 'aos_products', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('82a00d2f-f17d-eb95-d97b-582f01f0f7e8', 'tasks_notes', 'Tasks', 'tasks', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('834b6355-2ae2-91f9-5905-582f0133f3a8', 'securitygroups_aos_products', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Products', 'aos_products', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Products', 0, 0),
('83f75319-6c87-f0b5-6fde-582f01525924', 'product_categories', 'AOS_Product_Categories', 'aos_product_categories', 'id', 'AOS_Products', 'aos_products', 'aos_product_category_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('859606a3-3458-0a70-8d17-582f016ab418', 'calls_reschedule_assigned_user', 'Users', 'users', 'id', 'Calls_Reschedule', 'calls_reschedule', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('89ac76b3-c990-9779-2f23-582f01f97a4e', 'aos_products_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8a4f247e-192b-189f-e8d8-582f01740803', 'aos_products_quotes_created_by', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8b1638fa-b6f5-6cd1-67b8-582f0198434b', 'aos_products_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('8bcb40ba-1b13-0aa5-e674-582f015a7d05', 'aos_product_quotes_aos_products', 'AOS_Products', 'aos_products', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'product_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('90c15053-d240-4990-9726-582f01189adb', 'aos_line_item_groups_modified_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('91782d9b-33d0-1096-81a2-582f0184a349', 'aos_line_item_groups_created_by', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9219068e-078a-fb19-ef27-582f017317d1', 'aos_line_item_groups_assigned_user', 'Users', 'users', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('92b5b35e-6ad4-c62c-7235-582f019c6cf0', 'groups_aos_product_quotes', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'group_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('93dab7a4-62b6-80dc-61e5-582f0114e46e', 'alerts_modified_user', 'Users', 'users', 'id', 'Alerts', 'alerts', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('948c96f4-1ba8-60f9-4e58-582f01a7f2cf', 'leads_modified_user', 'Users', 'users', 'id', 'Leads', 'leads', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('94a5339f-ede1-b1c3-1acd-582f0151f2f3', 'alerts_created_by', 'Users', 'users', 'id', 'Alerts', 'alerts', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('953e4741-3a3b-1a1c-88d3-582f0106ea47', 'leads_created_by', 'Users', 'users', 'id', 'Leads', 'leads', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0);
INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('9586caf8-24dd-cbcd-f836-582f019b1eb4', 'alerts_assigned_user', 'Users', 'users', 'id', 'Alerts', 'alerts', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('95cccc27-2ae9-b0e3-69c8-582f0103f628', 'leads_assigned_user', 'Users', 'users', 'id', 'Leads', 'leads', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('967077c4-1db5-4d2e-512e-582f01b75213', 'securitygroups_leads', 'SecurityGroups', 'securitygroups', 'id', 'Leads', 'leads', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Leads', 0, 0),
('96da7b87-4c7c-254b-397f-582f019e4f0f', 'leads_email_addresses', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Leads', 0, 0),
('975e9ac0-7116-0e2b-6126-582f0137883a', 'leads_email_addresses_primary', 'Leads', 'leads', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('97c7808d-cc87-e7a7-415f-582f016129fd', 'lead_direct_reports', 'Leads', 'leads', 'id', 'Leads', 'leads', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('989beb63-05ec-ad48-12bb-582f01b1d2fc', 'lead_tasks', 'Leads', 'leads', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('990be797-fc4a-780c-0d0e-582f015893aa', 'lead_notes', 'Leads', 'leads', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('99bec0b0-653a-14f1-2d5a-582f01e3e0cc', 'aos_quotes_modified_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('99cd6320-a671-0cbc-d2da-582f01eb2ab1', 'lead_meetings', 'Leads', 'leads', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('9a6666d9-5168-832a-04c7-582f01db25a0', 'lead_calls', 'Leads', 'leads', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('9a689a05-1263-0578-b4fe-582f01b43846', 'aos_quotes_created_by', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9aca3dc4-e1a0-0b4b-954e-582f01527360', 'lead_emails', 'Leads', 'leads', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('9adc8f29-a845-1aa0-262c-582f01ed0428', 'aos_quotes_assigned_user', 'Users', 'users', 'id', 'AOS_Quotes', 'aos_quotes', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9b5367fb-c878-99c7-a813-582f010bbab8', 'lead_campaign_log', 'Leads', 'leads', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Leads', 0, 0),
('9b712664-f5cb-475c-7ac5-582f01f20556', 'securitygroups_aos_quotes', 'SecurityGroups', 'securitygroups', 'id', 'AOS_Quotes', 'aos_quotes', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOS_Quotes', 0, 0),
('9bd539f9-1c5a-8cf5-7e91-582f01ac2537', 'aos_quotes_aos_product_quotes', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Products_Quotes', 'aos_products_quotes', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9c68f702-ce52-ab9a-0042-582f0184ef0f', 'aos_quotes_aos_line_item_groups', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Line_Item_Groups', 'aos_line_item_groups', 'parent_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9d50fd2d-2946-763b-5945-582f01bdc9ca', 'documents_modified_user', 'Users', 'users', 'id', 'Documents', 'documents', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9dee185f-2262-5dd5-5aa5-582f014144ff', 'documents_created_by', 'Users', 'users', 'id', 'Documents', 'documents', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9e7795da-1188-716a-b2a6-582f010dd849', 'documents_assigned_user', 'Users', 'users', 'id', 'Documents', 'documents', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9eda844a-2ca7-3c13-81cb-582f01eec2c5', 'securitygroups_documents', 'SecurityGroups', 'securitygroups', 'id', 'Documents', 'documents', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Documents', 0, 0),
('9f6d6c47-ca48-5e6e-bd41-582f01172e89', 'document_revisions', 'Documents', 'documents', 'id', 'DocumentRevisions', 'document_revisions', 'document_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('9fa8c7f5-b853-440f-6f66-582f013e2be5', 'aow_actions_modified_user', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a04e399b-5115-06db-ed81-582f015d8ea8', 'aow_actions_created_by', 'Users', 'users', 'id', 'AOW_Actions', 'aow_actions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a13dabdc-d224-6739-6e5f-582f01e7663f', 'cases_modified_user', 'Users', 'users', 'id', 'Cases', 'cases', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a1462605-e3ca-1d13-ee4e-582f01c87b28', 'revisions_created_by', 'Users', 'users', 'id', 'DocumentRevisions', 'document_revisions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a206ae55-6075-624e-a7c6-582f0182bdcd', 'cases_created_by', 'Users', 'users', 'id', 'Cases', 'cases', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a2fc3195-0771-d171-4866-582f01f5cc4b', 'cases_assigned_user', 'Users', 'users', 'id', 'Cases', 'cases', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a3b94077-524c-775e-b573-582f01964a58', 'securitygroups_cases', 'SecurityGroups', 'securitygroups', 'id', 'Cases', 'cases', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Cases', 0, 0),
('a473ca4b-9391-b391-4e6b-582f01a26f5f', 'case_calls', 'Cases', 'cases', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('a4ebefb6-d812-ee65-7e86-582f015a003a', 'aow_workflow_modified_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a50827c2-4611-beb5-681d-582f01618cd1', 'case_tasks', 'Cases', 'cases', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('a5a8a8d5-46f5-9786-ff38-582f01eb27e9', 'aow_workflow_created_by', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a5d82e63-2feb-7df7-2ee7-582f01db2f47', 'case_notes', 'Cases', 'cases', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('a6617c88-8078-4db1-7e90-582f01152d08', 'aow_workflow_assigned_user', 'Users', 'users', 'id', 'AOW_WorkFlow', 'aow_workflow', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a6a4e9df-13e6-cacd-9ff3-582f0184b811', 'case_meetings', 'Cases', 'cases', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('a6f3b9a1-9e86-b292-36d8-582f01bfc465', 'securitygroups_aow_workflow', 'SecurityGroups', 'securitygroups', 'id', 'AOW_WorkFlow', 'aow_workflow', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOW_WorkFlow', 0, 0),
('a78d5bab-b685-19be-3ccb-582f01725e44', 'case_emails', 'Cases', 'cases', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('a7cbe71f-9634-34ba-953f-582f01dfd7e2', 'aow_workflow_aow_conditions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Conditions', 'aow_conditions', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a83f39ee-c47e-e799-1076-582f01e4f6af', 'cases_created_contact', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'contact_created_by_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a87a2874-9ce6-f9b0-27dd-582f0189685d', 'aow_workflow_aow_actions', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Actions', 'aow_actions', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('a90ec167-b3df-a43d-8624-582f012af08c', 'aow_workflow_aow_processed', 'AOW_WorkFlow', 'aow_workflow', 'id', 'AOW_Processed', 'aow_processed', 'aow_workflow_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ac20f3dd-e338-9094-8069-582f01dd3278', 'inbound_email_created_by', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('ac7f6604-0111-1dd8-16de-582f01b4ac18', 'aow_processed_modified_user', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('accac151-378c-758e-2e43-582f016aaa2d', 'inbound_email_modified_user_id', 'Users', 'users', 'id', 'InboundEmail', 'inbound_email', 'modified_user_id', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('ad38675c-2a50-a312-8432-582f01beb924', 'aow_processed_created_by', 'Users', 'users', 'id', 'AOW_Processed', 'aow_processed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('add24bbe-d3e6-d0c2-a5e0-582f0157d385', 'bugs_modified_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ae792d8c-8b5c-b99c-5f9d-582f01b8d35b', 'bugs_created_by', 'Users', 'users', 'id', 'Bugs', 'bugs', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('af1b8772-ce17-c6cd-9263-582f01297f26', 'bugs_assigned_user', 'Users', 'users', 'id', 'Bugs', 'bugs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('af999afa-ea2d-b7b0-0c42-582f0143f25f', 'securitygroups_bugs', 'SecurityGroups', 'securitygroups', 'id', 'Bugs', 'bugs', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Bugs', 0, 0),
('afc65d35-90e3-ad5c-f6cf-582f01a3174b', 'saved_search_assigned_user', 'Users', 'users', 'id', 'SavedSearch', 'saved_search', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b0233d12-a79c-4a83-34f7-582f011a8218', 'aow_conditions_modified_user', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b03ab795-09bd-7290-a1c1-582f013956bb', 'bug_tasks', 'Bugs', 'bugs', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('b0c8b07d-0a21-68a7-104e-582f01da958b', 'aow_conditions_created_by', 'Users', 'users', 'id', 'AOW_Conditions', 'aow_conditions', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b0e564a9-fe76-4990-c4ca-582f01eabf03', 'bug_meetings', 'Bugs', 'bugs', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('b1902bc2-cf8d-0dab-8b1d-582f0122f4b7', 'bug_calls', 'Bugs', 'bugs', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('b1b70369-03df-69f7-3a31-582f011475ac', 'fp_event_locations_modified_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b27447d2-f319-43a3-d330-582f0112bdd0', 'bug_emails', 'Bugs', 'bugs', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('b348a283-4eb9-926c-d4ed-582f011ffa36', 'bug_notes', 'Bugs', 'bugs', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Bugs', 0, 0),
('b428b484-e694-ced4-cce1-582f0152439a', 'bugs_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'found_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b4e4dd34-46a9-91be-258d-582f01caab43', 'bugs_fixed_in_release', 'Releases', 'releases', 'id', 'Bugs', 'bugs', 'fixed_in_release', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b646fcf2-7429-cd38-5ca3-582f016ee97e', 'spots_modified_user', 'Users', 'users', 'id', 'Spots', 'spots', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b6ef090b-36b9-6b18-4687-582f01028ad2', 'user_direct_reports', 'Users', 'users', 'id', 'Users', 'users', 'reports_to_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b6f6e0fa-7695-a798-1659-582f01563e7f', 'spots_created_by', 'Users', 'users', 'id', 'Spots', 'spots', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b7632d69-7e0b-80b1-6305-582f013cae60', 'spots_assigned_user', 'Users', 'users', 'id', 'Spots', 'spots', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('b7a0f117-c2cb-c21a-9cc7-582f01f89ca4', 'users_email_addresses', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('b7fb382b-9458-723b-6b85-582f0157d89b', 'securitygroups_spots', 'SecurityGroups', 'securitygroups', 'id', 'Spots', 'spots', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Spots', 0, 0),
('b854c9c5-52f2-e7bb-0a52-582f010f15eb', 'users_email_addresses_primary', 'Users', 'users', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('bae171de-0371-2bda-a0ef-582f01f3c1e5', 'campaignlog_contact', 'CampaignLog', 'campaign_log', 'related_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bb8a710d-7541-df36-1f9d-582f01b69cba', 'aobh_businesshours_modified_user', 'Users', 'users', 'id', 'AOBH_BusinessHours', 'aobh_businesshours', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bb94ee83-d522-f165-81e9-582f01db403b', 'campaignlog_lead', 'CampaignLog', 'campaign_log', 'related_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bc2b1eae-494a-340d-027f-582f0107ef7e', 'aobh_businesshours_created_by', 'Users', 'users', 'id', 'AOBH_BusinessHours', 'aobh_businesshours', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bc3255d6-8f94-98c4-17ae-582f01c3fbfe', 'campaignlog_created_opportunities', 'CampaignLog', 'campaign_log', 'related_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bc4ebd05-f2e5-9112-9de1-582f014089d3', 'accounts_bugs', 'Accounts', 'accounts', 'id', 'Bugs', 'bugs', 'id', 'accounts_bugs', 'account_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('bc540fe5-8c05-f420-2bcf-582f01120ae7', 'fp_event_locations_created_by', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bcc711a5-fa5b-26e2-24f1-582f01a1f76f', 'campaignlog_targeted_users', 'CampaignLog', 'campaign_log', 'target_id', 'Users', 'users', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bd4adaee-9ed9-4a73-b123-582f0168de83', 'campaignlog_sent_emails', 'CampaignLog', 'campaign_log', 'related_id', 'Emails', 'emails', 'id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('bdb7e1a5-1205-2120-b359-582f01c26d6f', 'accounts_contacts', 'Accounts', 'accounts', 'id', 'Contacts', 'contacts', 'id', 'accounts_contacts', 'account_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('bfdeca66-63f8-fa87-0ee8-582f0185c4c8', 'sugarfeed_modified_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c036b196-fa39-c50a-1f69-582f01390c08', 'accounts_opportunities', 'Accounts', 'accounts', 'id', 'Opportunities', 'opportunities', 'id', 'accounts_opportunities', 'account_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('c0aa4f0a-df6a-2cac-504e-582f01ba1157', 'sugarfeed_created_by', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c1281bd9-5ad6-cc52-7537-582f010cb2f8', 'sugarfeed_assigned_user', 'Users', 'users', 'id', 'SugarFeed', 'sugarfeed', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c143fcf0-f78f-5f70-35fd-582f012157c9', 'calls_contacts', 'Calls', 'calls', 'id', 'Contacts', 'contacts', 'id', 'calls_contacts', 'call_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('c1efdb66-1e6c-fe1e-f09b-582f012811c8', 'calls_users', 'Calls', 'calls', 'id', 'Users', 'users', 'id', 'calls_users', 'call_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('c4f50f7e-dfef-a890-d06d-582f01e650ef', 'securitygroups_project', 'SecurityGroups', 'securitygroups', 'id', 'Project', 'project', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Project', 0, 0),
('c5cb8d51-d1ef-214f-1c83-582f01a6127f', 'projects_notes', 'Project', 'project', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('c5cd1373-764c-95a3-5143-582f012ce428', 'calls_leads', 'Calls', 'calls', 'id', 'Leads', 'leads', 'id', 'calls_leads', 'call_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('c6054220-25b0-104c-3114-582f019fb429', 'jjwg_maps_modified_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c66e36cc-dcd0-8bd4-80bb-582f01c6e476', 'projects_tasks', 'Project', 'project', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('c6940ae1-4344-f4fc-88e6-582f014cae31', 'fp_event_locations_assigned_user', 'Users', 'users', 'id', 'FP_Event_Locations', 'fp_event_locations', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c6b3988e-2530-791a-5793-582f0100d981', 'jjwg_maps_created_by', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c6efbc89-8d24-6ba5-3f90-582f01f48fa4', 'projects_meetings', 'Project', 'project', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('c74e0db7-fb00-5c10-285b-582f01a9fcdb', 'jjwg_maps_assigned_user', 'Users', 'users', 'id', 'jjwg_Maps', 'jjwg_maps', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c78f5a6e-72df-8670-ccc1-582f01c68ef1', 'projects_calls', 'Project', 'project', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('c7c2fa67-7aa9-604f-2b9c-582f01d89b25', 'securitygroups_jjwg_maps', 'SecurityGroups', 'securitygroups', 'id', 'jjwg_Maps', 'jjwg_maps', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'jjwg_Maps', 0, 0),
('c7f3ef17-4edc-c920-4fca-582f01a53186', 'cases_bugs', 'Cases', 'cases', 'id', 'Bugs', 'bugs', 'id', 'cases_bugs', 'case_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('c80dc651-3c67-f136-b568-582f01620893', 'projects_emails', 'Project', 'project', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('c8520ac6-6cfa-53e7-9af1-582f010a0bcd', 'jjwg_Maps_accounts', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Accounts', 'accounts', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Accounts', 0, 0),
('c8984043-04a5-89e9-26f9-582f01b6413c', 'contacts_bugs', 'Contacts', 'contacts', 'id', 'Bugs', 'bugs', 'id', 'contacts_bugs', 'contact_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('c8b0de69-4707-379d-22d2-582f01307748', 'projects_project_tasks', 'Project', 'project', 'id', 'ProjectTask', 'project_task', 'project_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c8b91801-ca62-cd7f-f34c-582f015e4eee', 'jjwg_Maps_contacts', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Contacts', 'contacts', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Contacts', 0, 0),
('c91f73ae-6185-bcc7-bb1a-582f01006734', 'contacts_cases', 'Contacts', 'contacts', 'id', 'Cases', 'cases', 'id', 'contacts_cases', 'contact_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('c94f8121-e002-c82b-360f-582f015c3762', 'jjwg_Maps_leads', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Leads', 'leads', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Leads', 0, 0),
('c959ae77-ab79-aefc-0720-582f01fe89e4', 'projects_assigned_user', 'Users', 'users', 'id', 'Project', 'project', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('c9ba0e42-ba99-dca1-8058-582f01a8d1de', 'jjwg_Maps_opportunities', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Opportunities', 'opportunities', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Opportunities', 0, 0),
('c9f43b0b-3529-a6a2-b381-582f01fcec44', 'projects_modified_user', 'Users', 'users', 'id', 'Project', 'project', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ca0f7834-2a88-f32e-2916-582f01a7d24e', 'eapm_modified_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ca1f0294-bd4d-169a-79b9-582f013c8253', 'contacts_users', 'Contacts', 'contacts', 'id', 'Users', 'users', 'id', 'contacts_users', 'contact_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('ca578785-7ba2-850d-3ea3-582f01851ac4', 'jjwg_Maps_cases', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Cases', 'cases', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Cases', 0, 0),
('ca968280-6f15-469d-2052-582f012d1993', 'projects_created_by', 'Users', 'users', 'id', 'Project', 'project', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cacfec9c-1318-c84e-3ad7-582f010891aa', 'eapm_created_by', 'Users', 'users', 'id', 'EAPM', 'eapm', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cad77d21-0c91-2895-e54d-582f016697fe', 'jjwg_Maps_projects', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Project', 'project', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Project', 0, 0),
('cadfaf36-76fa-ab82-0f8d-582f017960ef', 'emails_bugs_rel', 'Emails', 'emails', 'id', 'Bugs', 'bugs', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Bugs', 0, 0),
('cb675109-c60d-9d03-8a00-582f015ede65', 'emails_cases_rel', 'Emails', 'emails', 'id', 'Cases', 'cases', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Cases', 0, 0),
('cb80626a-4551-7b34-9298-582f01206816', 'eapm_assigned_user', 'Users', 'users', 'id', 'EAPM', 'eapm', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cb92536d-9bd9-4471-fde7-582f01a28458', 'jjwg_Maps_meetings', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Meetings', 'meetings', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Meetings', 0, 0),
('cbfc2c2c-cf0d-c7a6-ed4e-582f012e69be', 'emails_opportunities_rel', 'Emails', 'emails', 'id', 'Opportunities', 'opportunities', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Opportunities', 0, 0),
('cc46063c-efa4-b32c-0d2c-582f01b1e7d3', 'schedulers_created_by_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'created_by', NULL, NULL, NULL, 'one-to-one', NULL, NULL, 0, 0),
('cc5ae281-f22a-65d7-67d3-582f014e5ac9', 'jjwg_Maps_prospects', 'jjwg_Maps', 'jjwg_Maps', 'parent_id', 'Prospects', 'prospects', 'id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('cca979af-bc46-eb58-32a4-582f01838eab', 'emails_tasks_rel', 'Emails', 'emails', 'id', 'Tasks', 'tasks', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Tasks', 0, 0),
('cd1d0875-d9a6-9a1e-b87b-582f01376198', 'securitygroups_modified_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cd547161-0144-5f08-b8fd-582f010ba012', 'emails_users_rel', 'Emails', 'emails', 'id', 'Users', 'users', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Users', 0, 0),
('ce079465-47e2-4125-f3f1-582f01d0dcc4', 'emails_project_task_rel', 'Emails', 'emails', 'id', 'ProjectTask', 'project_task', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'ProjectTask', 0, 0),
('ceab8985-fc58-7e9c-fbb3-582f016bd959', 'emails_projects_rel', 'Emails', 'emails', 'id', 'Project', 'project', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Project', 0, 0),
('ceb1d21d-3566-c6b9-d1c6-582f017c3ac3', 'oauthkeys_modified_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cf1fb042-c02e-14de-6473-582f01c7709a', 'securitygroups_projecttask', 'SecurityGroups', 'securitygroups', 'id', 'ProjectTask', 'project_task', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProjectTask', 0, 0),
('cf441559-99a9-5bdd-efbb-582f015e26d7', 'emails_prospects_rel', 'Emails', 'emails', 'id', 'Prospects', 'prospects', 'id', 'emails_beans', 'email_id', 'bean_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('cf68048a-3208-c6d3-68b7-582f0117fdd6', 'oauthkeys_created_by', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('cf890e70-7a04-3743-dceb-582f0165da07', 'securitygroups_fp_event_locations', 'SecurityGroups', 'securitygroups', 'id', 'FP_Event_Locations', 'fp_event_locations', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'FP_Event_Locations', 0, 0),
('cfb85315-3fea-a533-764f-582f01cf4593', 'meetings_contacts', 'Meetings', 'meetings', 'id', 'Contacts', 'contacts', 'id', 'meetings_contacts', 'meeting_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('cfcbcdbd-28c6-029a-2d4e-582f01fafba6', 'project_tasks_notes', 'ProjectTask', 'project_task', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('cfe10154-7926-ab40-87c9-582f0174c221', 'oauthkeys_assigned_user', 'Users', 'users', 'id', 'OAuthKeys', 'oauthkeys', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d050828d-e545-7b03-8500-582f01df3220', 'meetings_users', 'Meetings', 'meetings', 'id', 'Users', 'users', 'id', 'meetings_users', 'meeting_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('d05b0deb-72d1-84c1-e136-582f01680915', 'project_tasks_tasks', 'ProjectTask', 'project_task', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('d0c1d02d-df51-fb8b-a550-582f018d0975', 'meetings_leads', 'Meetings', 'meetings', 'id', 'Leads', 'leads', 'id', 'meetings_leads', 'meeting_id', 'lead_id', 'many-to-many', NULL, NULL, 0, 0),
('d10b8732-9e76-99ba-b8ef-582f01db7a18', 'project_tasks_meetings', 'ProjectTask', 'project_task', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('d165eec6-e525-6f60-635a-582f019f3185', 'opportunities_contacts', 'Opportunities', 'opportunities', 'id', 'Contacts', 'contacts', 'id', 'opportunities_contacts', 'opportunity_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('d18367d3-87d2-4659-08f3-582f012fd510', 'project_tasks_calls', 'ProjectTask', 'project_task', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('d1e39a68-c795-90f0-c29a-582f0158178d', 'prospect_list_campaigns', 'ProspectLists', 'prospect_lists', 'id', 'Campaigns', 'campaigns', 'id', 'prospect_list_campaigns', 'prospect_list_id', 'campaign_id', 'many-to-many', NULL, NULL, 0, 0),
('d21012b6-0ad8-b903-bfa5-582f01f92f72', 'consumer_tokens', 'OAuthKeys', 'oauth_consumer', 'id', 'OAuthTokens', 'oauth_tokens', 'consumer', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d211c310-71bf-191d-23d7-582f0145ac1e', 'project_tasks_emails', 'ProjectTask', 'project_task', 'id', 'Emails', 'emails', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'ProjectTask', 0, 0),
('d28192d7-5dd5-fb78-8ab9-582f013bf7bb', 'prospect_list_contacts', 'ProspectLists', 'prospect_lists', 'id', 'Contacts', 'contacts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Contacts', 0, 0),
('d28fd1fc-8daa-54d7-2019-582f0116e271', 'project_tasks_assigned_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d2b5f536-067e-aaba-e436-582f012d403e', 'oauthtokens_assigned_user', 'Users', 'users', 'id', 'OAuthTokens', 'oauth_tokens', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d30de0dd-078a-38a5-5944-582f01d9dc93', 'prospect_list_prospects', 'ProspectLists', 'prospect_lists', 'id', 'Prospects', 'prospects', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Prospects', 0, 0),
('d3366b12-3739-1dc2-f9d3-582f016046b7', 'project_tasks_modified_user', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d36c94a7-3a5f-797f-e5b2-582f01956a5a', 'prospect_list_leads', 'ProspectLists', 'prospect_lists', 'id', 'Leads', 'leads', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Leads', 0, 0),
('d39edec6-61cb-0b39-8a67-582f01fd7549', 'project_tasks_created_by', 'Users', 'users', 'id', 'ProjectTask', 'project_task', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d441bdea-f7a3-6023-a527-582f01a81401', 'prospect_list_users', 'ProspectLists', 'prospect_lists', 'id', 'Users', 'users', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Users', 0, 0),
('d4c96a31-b55d-6099-ef1a-582f0181a838', 'prospect_list_accounts', 'ProspectLists', 'prospect_lists', 'id', 'Accounts', 'accounts', 'id', 'prospect_lists_prospects', 'prospect_list_id', 'related_id', 'many-to-many', 'related_type', 'Accounts', 0, 0),
('d5bce219-8a74-4b76-3de4-582f01fa7081', 'roles_users', 'Roles', 'roles', 'id', 'Users', 'users', 'id', 'roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('d5d200e6-d6b0-c924-c161-582f01da1f23', 'optimistic_locking', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
('d673e529-f381-569f-80ee-582f0142181f', 'projects_bugs', 'Project', 'project', 'id', 'Bugs', 'bugs', 'id', 'projects_bugs', 'project_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('d6e7e309-5b5d-babf-a5c4-582f01bc1beb', 'am_projecttemplates_modified_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d740b01b-6fe7-9cc3-1e86-582f01af2b96', 'projects_cases', 'Project', 'project', 'id', 'Cases', 'cases', 'id', 'projects_cases', 'project_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('d7960a37-07a5-f61b-778b-582f01297625', 'am_projecttemplates_created_by', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d7d9061f-87de-8111-dfaa-582f01bb434f', 'securitygroups_created_by', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d8060c6d-ef6a-6f8a-c79a-582f01822b3f', 'projects_accounts', 'Project', 'project', 'id', 'Accounts', 'accounts', 'id', 'projects_accounts', 'project_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('d850f791-743b-f322-750f-582f01234f96', 'am_projecttemplates_assigned_user', 'Users', 'users', 'id', 'AM_ProjectTemplates', 'am_projecttemplates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d87c9194-1bee-0472-e85a-582f010677c6', 'projects_contacts', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'projects_contacts', 'project_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('d9270f5a-a1b5-43ba-d2cb-582f01bd84cc', 'projects_opportunities', 'Project', 'project', 'id', 'Opportunities', 'opportunities', 'id', 'projects_opportunities', 'project_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('d9aa0090-d099-3c8b-02f8-582f01c1d1f3', 'jjwg_markers_modified_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d9ca0b57-642e-db37-a78d-582f01d20587', 'schedulers_modified_user_id_rel', 'Users', 'users', 'id', 'Schedulers', 'schedulers', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('d9f15029-c600-f003-c413-582f01f5f783', 'acl_roles_actions', 'ACLRoles', 'acl_roles', 'id', 'ACLActions', 'acl_actions', 'id', 'acl_roles_actions', 'role_id', 'action_id', 'many-to-many', NULL, NULL, 0, 0),
('da7575c4-93bf-5d73-08cd-582f0122f98c', 'jjwg_markers_created_by', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dab014eb-5a4f-97c7-e09d-582f013cac74', 'acl_roles_users', 'ACLRoles', 'acl_roles', 'id', 'Users', 'users', 'id', 'acl_roles_users', 'role_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('dad84dc3-5ca5-8dc4-027a-582f01ec6b99', 'campaigns_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('db112bc6-b118-f7c2-b30f-582f015162e1', 'jjwg_markers_assigned_user', 'Users', 'users', 'id', 'jjwg_Markers', 'jjwg_markers', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('db727d99-71e8-42d6-ca73-582f01dd3f8a', 'securitygroups_jjwg_markers', 'SecurityGroups', 'securitygroups', 'id', 'jjwg_Markers', 'jjwg_markers', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'jjwg_Markers', 0, 0),
('db799cda-a381-fe12-cc2a-582f01c261ce', 'email_marketing_prospect_lists', 'EmailMarketing', 'email_marketing', 'id', 'ProspectLists', 'prospect_lists', 'id', 'email_marketing_prospect_lists', 'email_marketing_id', 'prospect_list_id', 'many-to-many', NULL, NULL, 0, 0),
('db94aa7b-4068-0923-e9ba-582f01bb7d99', 'campaigns_created_by', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dc29f67e-045c-b087-5be4-582f013c277d', 'leads_documents', 'Leads', 'leads', 'id', 'Documents', 'documents', 'id', 'linked_documents', 'parent_id', 'document_id', 'many-to-many', 'parent_type', 'Leads', 0, 0),
('dc4af822-0524-7800-6efa-582f01f113fd', 'campaigns_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dcd39d69-cbc0-3799-83dc-582f0172031f', 'documents_accounts', 'Documents', 'documents', 'id', 'Accounts', 'accounts', 'id', 'documents_accounts', 'document_id', 'account_id', 'many-to-many', NULL, NULL, 0, 0),
('dcd73d1a-bda6-c630-6615-582f01563b7b', 'am_tasktemplates_modified_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dcf39132-710a-36fd-27b1-582f015d4f54', 'securitygroups_campaigns', 'SecurityGroups', 'securitygroups', 'id', 'Campaigns', 'campaigns', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Campaigns', 0, 0),
('dd459aef-79ad-c618-19e4-582f01b38ca1', 'documents_contacts', 'Documents', 'documents', 'id', 'Contacts', 'contacts', 'id', 'documents_contacts', 'document_id', 'contact_id', 'many-to-many', NULL, NULL, 0, 0),
('dd6eeb3a-ca52-8ec4-80a0-582f01c13108', 'campaign_accounts', 'Campaigns', 'campaigns', 'id', 'Accounts', 'accounts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dd95e664-7764-accc-3eca-582f01f03820', 'am_tasktemplates_created_by', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('de290873-cc4a-e682-408f-582f01601cc7', 'am_tasktemplates_assigned_user', 'Users', 'users', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('de3c3b25-eb2e-5158-1aee-582f01ef7a2e', 'campaign_contacts', 'Campaigns', 'campaigns', 'id', 'Contacts', 'contacts', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('de45e3e3-9f03-965e-0c82-582f01d1177a', 'documents_opportunities', 'Documents', 'documents', 'id', 'Opportunities', 'opportunities', 'id', 'documents_opportunities', 'document_id', 'opportunity_id', 'many-to-many', NULL, NULL, 0, 0),
('dee57e6b-6090-785c-1959-582f01cf6e0f', 'campaign_leads', 'Campaigns', 'campaigns', 'id', 'Leads', 'leads', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dee6d210-3e76-7e7d-db9c-582f01f6453b', 'documents_cases', 'Documents', 'documents', 'id', 'Cases', 'cases', 'id', 'documents_cases', 'document_id', 'case_id', 'many-to-many', NULL, NULL, 0, 0),
('deed0a9a-f3cf-2cc4-8e8d-582f01325e10', 'unified_search', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
('df4e1eac-9c51-65f1-e0c4-582f01aca472', 'campaign_prospects', 'Campaigns', 'campaigns', 'id', 'Prospects', 'prospects', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('df5da428-e7a9-9bcb-97b3-582f013feb14', 'documents_bugs', 'Documents', 'documents', 'id', 'Bugs', 'bugs', 'id', 'documents_bugs', 'document_id', 'bug_id', 'many-to-many', NULL, NULL, 0, 0),
('dfd5688b-8126-73ac-327e-582f01c3237d', 'campaign_opportunities', 'Campaigns', 'campaigns', 'id', 'Opportunities', 'opportunities', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('dff496f7-6cd6-fde3-e46a-582f01a70bca', 'aok_knowledgebase_categories', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'id', 'aok_knowledgebase_categories', 'aok_knowledgebase_id', 'aok_knowledge_base_categories_id', 'many-to-many', NULL, NULL, 0, 0),
('dffb0ab3-7bcb-3c05-d328-582f01f7fc16', 'favorites_modified_user', 'Users', 'users', 'id', 'Favorites', 'favorites', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e045b3d2-1b96-fb69-2108-582f0154dd1b', 'campaign_email_marketing', 'Campaigns', 'campaigns', 'id', 'EmailMarketing', 'email_marketing', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e06087de-d22a-10a5-4bc6-582f017b18d5', 'am_projecttemplates_project_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Project', 'project', 'id', 'am_projecttemplates_project_1_c', 'am_projecttemplates_project_1am_projecttemplates_ida', 'am_projecttemplates_project_1project_idb', 'many-to-many', NULL, NULL, 0, 0),
('e0c54893-26ba-f231-da45-582f01f90b44', 'favorites_created_by', 'Users', 'users', 'id', 'Favorites', 'favorites', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e0d643c3-571c-0476-1d61-582f01641208', 'campaign_emailman', 'Campaigns', 'campaigns', 'id', 'EmailMan', 'emailman', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e0da0388-9b55-eecc-a9fe-582f01478182', 'securitygroups_assigned_user', 'Users', 'users', 'id', 'SecurityGroups', 'securitygroups', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e1041471-9220-f317-1cfe-582f01a47cab', 'am_projecttemplates_contacts_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Contacts', 'contacts', 'id', 'am_projecttemplates_contacts_1_c', 'am_projecttemplates_ida', 'contacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('e12f337d-e92b-b266-c82e-582f01be083a', 'favorites_assigned_user', 'Users', 'users', 'id', 'Favorites', 'favorites', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e14a7d5e-0391-a33e-b733-582f01206801', 'campaign_campaignlog', 'Campaigns', 'campaigns', 'id', 'CampaignLog', 'campaign_log', 'campaign_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e179a4b1-f783-74ce-c45c-582f015712b5', 'am_projecttemplates_users_1', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'Users', 'users', 'id', 'am_projecttemplates_users_1_c', 'am_projecttemplates_ida', 'users_idb', 'many-to-many', NULL, NULL, 0, 0),
('e1e5b8ca-2ccf-0f72-f9fc-582f013e14f7', 'campaign_assigned_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e22cabf3-bb09-f910-19dd-582f017b8da3', 'am_tasktemplates_am_projecttemplates', 'AM_ProjectTemplates', 'am_projecttemplates', 'id', 'AM_TaskTemplates', 'am_tasktemplates', 'id', 'am_tasktemplates_am_projecttemplates_c', 'am_tasktemplates_am_projecttemplatesam_projecttemplates_ida', 'am_tasktemplates_am_projecttemplatesam_tasktemplates_idb', 'many-to-many', NULL, NULL, 0, 0),
('e24f9b08-0fca-9549-0eae-582f01c18594', 'campaign_modified_user', 'Users', 'users', 'id', 'Campaigns', 'campaigns', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e2d86789-5937-cb8f-40f8-582f01d5fcea', 'aos_contracts_documents', 'AOS_Contracts', 'aos_contracts', 'id', 'Documents', 'documents', 'id', 'aos_contracts_documents', 'aos_contracts_id', 'documents_id', 'many-to-many', NULL, NULL, 0, 0),
('e370dcbf-72b3-d1b4-7fab-582f013e5933', 'aos_quotes_aos_contracts', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Contracts', 'aos_contracts', 'id', 'aos_quotes_os_contracts_c', 'aos_quotese81e_quotes_ida', 'aos_quotes4dc0ntracts_idb', 'many-to-many', NULL, NULL, 0, 0),
('e4075eb1-f00b-faf6-ad02-582f014cb78c', 'aok_knowledge_base_categories_modified_user', 'Users', 'users', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e45a3399-8054-4390-c676-582f01582360', 'aos_quotes_aos_invoices', 'AOS_Quotes', 'aos_quotes', 'id', 'AOS_Invoices', 'aos_invoices', 'id', 'aos_quotes_aos_invoices_c', 'aos_quotes77d9_quotes_ida', 'aos_quotes6b83nvoices_idb', 'many-to-many', NULL, NULL, 0, 0),
('e4c1c131-e63b-8ef3-f970-582f0129f237', 'aok_knowledge_base_categories_created_by', 'Users', 'users', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e4d7025b-5a5b-39d4-6c43-582f0101629b', 'schedulers_jobs_rel', 'Schedulers', 'schedulers', 'id', 'SchedulersJobs', 'job_queue', 'scheduler_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e51cd014-ba48-3537-2f5c-582f01bb85ea', 'aos_quotes_project', 'AOS_Quotes', 'aos_quotes', 'id', 'Project', 'project', 'id', 'aos_quotes_project_c', 'aos_quotes1112_quotes_ida', 'aos_quotes7207project_idb', 'many-to-many', NULL, NULL, 0, 0),
('e5273b98-17cd-7b18-117d-582f017c488a', 'aok_knowledge_base_categories_assigned_user', 'Users', 'users', 'id', 'AOK_Knowledge_Base_Categories', 'aok_knowledge_base_categories', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e5b9374c-3bcc-eeb0-f1dd-582f01d5df7f', 'aow_processed_aow_actions', 'AOW_Processed', 'aow_processed', 'id', 'AOW_Actions', 'aow_actions', 'id', 'aow_processed_aow_actions', 'aow_processed_id', 'aow_action_id', 'many-to-many', NULL, NULL, 0, 0),
('e5d13aa8-424a-538b-fe14-582f0145b8c2', 'prospectlists_assigned_user', 'Users', 'users', 'id', 'prospectlists', 'prospect_lists', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e62a7a88-6583-ef67-3f7f-582f0183cab0', 'fp_event_locations_fp_events_1', 'FP_Event_Locations', 'fp_event_locations', 'id', 'FP_events', 'fp_events', 'id', 'fp_event_locations_fp_events_1_c', 'fp_event_locations_fp_events_1fp_event_locations_ida', 'fp_event_locations_fp_events_1fp_events_idb', 'many-to-many', NULL, NULL, 0, 0),
('e6771dc0-45ee-4466-a86d-582f0104840f', 'securitygroups_prospectlists', 'SecurityGroups', 'securitygroups', 'id', 'ProspectLists', 'prospect_lists', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProspectLists', 0, 0),
('e6c705e1-05b7-ff0a-efe2-582f01fad098', 'fp_events_contacts', 'FP_events', 'fp_events', 'id', 'Contacts', 'contacts', 'id', 'fp_events_contacts_c', 'fp_events_contactsfp_events_ida', 'fp_events_contactscontacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('e73753c5-3c5c-dca0-aca4-582f0182a0c4', 'fp_events_fp_event_locations_1', 'FP_events', 'fp_events', 'id', 'FP_Event_Locations', 'fp_event_locations', 'id', 'fp_events_fp_event_locations_1_c', 'fp_events_fp_event_locations_1fp_events_ida', 'fp_events_fp_event_locations_1fp_event_locations_idb', 'many-to-many', NULL, NULL, 0, 0),
('e7cbe71b-829f-3fd1-0c76-582f01bd948b', 'fp_events_leads_1', 'FP_events', 'fp_events', 'id', 'Leads', 'leads', 'id', 'fp_events_leads_1_c', 'fp_events_leads_1fp_events_ida', 'fp_events_leads_1leads_idb', 'many-to-many', NULL, NULL, 0, 0),
('e8180873-fdaf-499c-d9e1-582f01e47f12', 'jjwg_areas_modified_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e838ebc2-fd91-bfbf-8899-582f012871e6', 'fp_events_prospects_1', 'FP_events', 'fp_events', 'id', 'Prospects', 'prospects', 'id', 'fp_events_prospects_1_c', 'fp_events_prospects_1fp_events_ida', 'fp_events_prospects_1prospects_idb', 'many-to-many', NULL, NULL, 0, 0),
('e8c02974-3cb8-95d5-ab00-582f01e4a22e', 'jjwg_areas_created_by', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e8e3bc82-4488-65bf-fb7d-582f01ba9b08', 'jjwg_maps_jjwg_areas', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Areas', 'jjwg_areas', 'id', 'jjwg_maps_jjwg_areas_c', 'jjwg_maps_5304wg_maps_ida', 'jjwg_maps_41f2g_areas_idb', 'many-to-many', NULL, NULL, 0, 0),
('e93789b5-9a54-85a3-c007-582f0105ff70', 'jjwg_areas_assigned_user', 'Users', 'users', 'id', 'jjwg_Areas', 'jjwg_areas', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e95c3ceb-fef8-5559-624a-582f01ee49ef', 'aok_knowledgebase_modified_user', 'Users', 'users', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('e98d4aa7-d216-171b-629c-582f015d5767', 'jjwg_maps_jjwg_markers', 'jjwg_Maps', 'jjwg_maps', 'id', 'jjwg_Markers', 'jjwg_markers', 'id', 'jjwg_maps_jjwg_markers_c', 'jjwg_maps_b229wg_maps_ida', 'jjwg_maps_2e31markers_idb', 'many-to-many', NULL, NULL, 0, 0),
('e9e736e0-f1f5-5849-1e47-582f01024580', 'securitygroups_jjwg_areas', 'SecurityGroups', 'securitygroups', 'id', 'jjwg_Areas', 'jjwg_areas', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'jjwg_Areas', 0, 0),
('ea093427-b2a7-3b28-04ba-582f01013c07', 'project_contacts_1', 'Project', 'project', 'id', 'Contacts', 'contacts', 'id', 'project_contacts_1_c', 'project_contacts_1project_ida', 'project_contacts_1contacts_idb', 'many-to-many', NULL, NULL, 0, 0),
('ea094b26-5ac6-c971-e81b-582f0196d131', 'aok_knowledgebase_created_by', 'Users', 'users', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eaa09b90-fa53-e36d-e68b-582f01b4f34a', 'aok_knowledgebase_assigned_user', 'Users', 'users', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('eb0413fd-a2ca-5d22-6530-582f01dec54a', 'securitygroups_aok_knowledgebase', 'SecurityGroups', 'securitygroups', 'id', 'AOK_KnowledgeBase', 'aok_knowledgebase', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'AOK_KnowledgeBase', 0, 0),
('eb1e8467-efa6-e4b2-7f2b-582f016ccaff', 'project_users_1', 'Project', 'project', 'id', 'Users', 'users', 'id', 'project_users_1_c', 'project_users_1project_ida', 'project_users_1users_idb', 'many-to-many', NULL, NULL, 0, 0),
('ec1a5de6-4e3d-618a-1523-582f01167421', 'securitygroups_acl_roles', 'SecurityGroups', 'securitygroups', 'id', 'ACLRoles', 'acl_roles', 'id', 'securitygroups_acl_roles', 'securitygroup_id', 'role_id', 'many-to-many', NULL, NULL, 0, 0),
('ee215cda-f2b8-3be3-adaa-582f0155c0bc', 'prospects_modified_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ee8376b5-3aa1-5941-41a8-582f01955715', 'securitygroups_project_task', 'SecurityGroups', 'securitygroups', 'id', 'ProjectTask', 'project_task', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProjectTask', 0, 0),
('ef031e05-23db-b1af-ab5a-582f0179ca1b', 'prospects_created_by', 'Users', 'users', 'id', 'Prospects', 'prospects', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ef0f6275-c45b-b28f-f733-582f012893f1', 'reminders_modified_user', 'Users', 'users', 'id', 'Reminders', 'reminders', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('ef57503b-1e49-1c82-35fd-582f014e3ed8', 'securitygroups_prospect_lists', 'SecurityGroups', 'securitygroups', 'id', 'ProspectLists', 'prospect_lists', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'ProspectLists', 0, 0),
('efbb6409-b277-c897-b1ef-582f01eb1a95', 'prospects_assigned_user', 'Users', 'users', 'id', 'Prospects', 'prospects', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('efd26e5c-4bea-0622-348b-582f01ff43d8', 'reminders_created_by', 'Users', 'users', 'id', 'Reminders', 'reminders', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f06324b8-2b59-25a1-7a4b-582f01f68b84', 'securitygroups_prospects', 'SecurityGroups', 'securitygroups', 'id', 'Prospects', 'prospects', 'id', 'securitygroups_records', 'securitygroup_id', 'record_id', 'many-to-many', 'module', 'Prospects', 0, 0),
('f06c3f67-d23e-1b0f-17e3-582f01737aa5', 'securitygroups_users', 'SecurityGroups', 'securitygroups', 'id', 'Users', 'users', 'id', 'securitygroups_users', 'securitygroup_id', 'user_id', 'many-to-many', NULL, NULL, 0, 0),
('f06f86fc-17f2-001e-bcab-582f01873074', 'reminders_assigned_user', 'Users', 'users', 'id', 'Reminders', 'reminders', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0);
INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('f0ebd3bf-3f15-18be-8d69-582f01f7baf6', 'prospects_email_addresses', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'bean_module', 'Prospects', 0, 0),
('f15358c4-de6c-94ce-7868-582f010cc2f0', 'rt_bonus_rt_employees', 'RT_Employees', 'rt_employees', 'id', 'RT_Bonus', 'rt_bonus', 'id', 'rt_bonus_rt_employees_c', 'rt_bonus_rt_employeesrt_employees_ida', 'rt_bonus_rt_employeesrt_bonus_idb', 'many-to-many', NULL, NULL, 0, 0),
('f1a04e67-2fac-099c-ac81-582f016a17c7', 'prospects_email_addresses_primary', 'Prospects', 'prospects', 'id', 'EmailAddresses', 'email_addresses', 'id', 'email_addr_bean_rel', 'bean_id', 'email_address_id', 'many-to-many', 'primary_address', '1', 0, 0),
('f21e6fd4-5ec1-881a-f1ea-582f0191a580', 'rt_employees_rt_leaves', 'RT_Employees', 'rt_employees', 'id', 'RT_Leaves', 'rt_leaves', 'id', 'rt_employees_rt_leaves_c', 'rt_employees_rt_leavesrt_employees_ida', 'rt_employees_rt_leavesrt_leaves_idb', 'many-to-many', NULL, NULL, 0, 0),
('f255ec68-f34a-e701-f839-582f01125d24', 'prospect_tasks', 'Prospects', 'prospects', 'id', 'Tasks', 'tasks', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('f2ca5cc2-c0ee-6c0f-0c1a-582f01fad507', 'prospect_notes', 'Prospects', 'prospects', 'id', 'Notes', 'notes', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('f2dbd604-a7da-4893-1dd4-582f0180c9a5', 'rt_employees_rt_bonus', 'RT_Employees', 'rt_employees', 'id', 'RT_Bonus', 'rt_bonus', 'id', 'rt_employees_rt_bonus_c', 'rt_employees_rt_bonusrt_employees_ida', 'rt_employees_rt_bonusrt_bonus_idb', 'many-to-many', NULL, NULL, 0, 0),
('f3481e22-ff2a-5d18-626c-582f01b8b320', 'reminders_invitees_modified_user', 'Users', 'users', 'id', 'Reminders_Invitees', 'reminders_invitees', 'modified_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f34dc487-5634-a996-0836-582f0156bef0', 'prospect_meetings', 'Prospects', 'prospects', 'id', 'Meetings', 'meetings', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('f36a328e-ea7e-2228-8d76-582f014a5c7f', 'rt_increment_history_rt_employees', 'RT_Employees', 'rt_employees', 'id', 'RT_Increment_History', 'rt_increment_history', 'id', 'rt_increment_history_rt_employees_c', 'rt_increment_history_rt_employeesrt_employees_ida', 'rt_increment_history_rt_employeesrt_increment_history_idb', 'many-to-many', NULL, NULL, 0, 0),
('f3c357dc-ec7b-c01a-c4b9-582f01b359cb', 'prospect_calls', 'Prospects', 'prospects', 'id', 'Calls', 'calls', 'parent_id', NULL, NULL, NULL, 'one-to-many', 'parent_type', 'Prospects', 0, 0),
('f3e15b8f-28e2-8f43-1f01-582f01b040ef', 'rt_employees_rt_payroll', 'RT_Employees', 'rt_employees', 'id', 'RT_Payroll', 'rt_payroll', 'id', 'rt_employees_rt_payroll_c', 'rt_employees_rt_payrollrt_employees_ida', 'rt_employees_rt_payrollrt_payroll_idb', 'many-to-many', NULL, NULL, 0, 0),
('f3f0662c-38f0-f5f4-14a0-582f01bf43f6', 'reminders_invitees_created_by', 'Users', 'users', 'id', 'Reminders_Invitees', 'reminders_invitees', 'created_by', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0),
('f7700712-0412-9b8c-eb9e-582f01a7c166', 'prospect_campaign_log', 'Prospects', 'prospects', 'id', 'CampaignLog', 'campaign_log', 'target_id', NULL, NULL, NULL, 'one-to-many', 'target_type', 'Prospects', 0, 0),
('f9bc09d3-15b9-124d-25da-582f01178b90', 'schedulersjobs_assigned_user', 'Users', 'users', 'id', 'SchedulersJobs', 'schedulersjobs', 'assigned_user_id', NULL, NULL, NULL, 'one-to-many', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `releases`
--

CREATE TABLE IF NOT EXISTS `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE IF NOT EXISTS `reminders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `popup` tinyint(1) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timer_popup` varchar(32) DEFAULT NULL,
  `timer_email` varchar(32) DEFAULT NULL,
  `related_event_module` varchar(32) DEFAULT NULL,
  `related_event_module_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_name` (`name`),
  KEY `idx_reminder_deleted` (`deleted`),
  KEY `idx_reminder_related_event_module` (`related_event_module`),
  KEY `idx_reminder_related_event_module_id` (`related_event_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reminders_invitees`
--

CREATE TABLE IF NOT EXISTS `reminders_invitees` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reminder_id` char(36) NOT NULL,
  `related_invitee_module` varchar(32) DEFAULT NULL,
  `related_invitee_module_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_invitee_name` (`name`),
  KEY `idx_reminder_invitee_assigned_user_id` (`assigned_user_id`),
  KEY `idx_reminder_invitee_reminder_id` (`reminder_id`),
  KEY `idx_reminder_invitee_related_invitee_module` (`related_invitee_module`),
  KEY `idx_reminder_invitee_related_invitee_module_id` (`related_invitee_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_modules`
--

CREATE TABLE IF NOT EXISTS `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_appraisals`
--

CREATE TABLE IF NOT EXISTS `rt_appraisals` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_appraisals_audit`
--

CREATE TABLE IF NOT EXISTS `rt_appraisals_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_appraisals_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_bonus`
--

CREATE TABLE IF NOT EXISTS `rt_bonus` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `bonus_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_bonus`
--

INSERT INTO `rt_bonus` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `amount`, `bonus_date`) VALUES
('3bfdab33-1d05-41af-0847-582330adad94', 'tes  now 2016-11-10', '2016-11-09 14:18:29', '2016-11-09 14:18:29', '1', '1', 'sdf sibdifbas dfgawdfsg', 0, NULL, 5400, '2016-11-10'),
('734bf743-e260-fb91-2dae-58232f7f8ef5', '', '2016-11-09 14:13:29', '2016-11-09 14:13:29', '1', '1', 'asdasdfasf  sdfwefsafw', 0, NULL, 13213, '2016-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `rt_bonus_audit`
--

CREATE TABLE IF NOT EXISTS `rt_bonus_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_bonus_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_bonus_rt_employees_c`
--

CREATE TABLE IF NOT EXISTS `rt_bonus_rt_employees_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_bonus_rt_employeesrt_employees_ida` varchar(36) DEFAULT NULL,
  `rt_bonus_rt_employeesrt_bonus_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_bonus_rt_employees_ida1` (`rt_bonus_rt_employeesrt_employees_ida`),
  KEY `rt_bonus_rt_employees_alt` (`rt_bonus_rt_employeesrt_bonus_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_candidates`
--

CREATE TABLE IF NOT EXISTS `rt_candidates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_candidates_audit`
--

CREATE TABLE IF NOT EXISTS `rt_candidates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_candidates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_candidates_cstm`
--

CREATE TABLE IF NOT EXISTS `rt_candidates_cstm` (
  `id_c` char(36) NOT NULL,
  `application_date_c` date DEFAULT NULL,
  `average_score_c` float(18,8) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_deductables`
--

CREATE TABLE IF NOT EXISTS `rt_deductables` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_deductables_audit`
--

CREATE TABLE IF NOT EXISTS `rt_deductables_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_deductables_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_departments`
--

CREATE TABLE IF NOT EXISTS `rt_departments` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `heads` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_departments`
--

INSERT INTO `rt_departments` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `heads`) VALUES
('2242f248-4c15-a46b-ba1c-58247cb61f11', 'test fianl department', '2016-11-10 13:54:26', '2016-11-10 13:54:26', '1', '1', '', 0, NULL, '380d7c06-497a-f0e2-e02a-580497b91089,4cee38fc-0bec-02fa-5019-581c665b1ca8,4fd9c21c-0f4d-1fb4-8bb0-5804cff4be78,5b8d9fce-7389-baa6-071e-58219f695d0d,99155b84-6e60-e5ae-16fe-5821691782d2'),
('429fb895-ede6-3aee-e146-58247b907038', 'asds', '2016-11-10 13:53:21', '2016-11-10 13:53:21', '1', '1', '', 0, NULL, ''),
('9874050f-8728-b05b-5857-58247bf6006e', 'tes depaaa', '2016-11-10 13:52:58', '2016-11-10 13:52:58', '1', '1', '', 0, NULL, ''),
('9a07271f-2a55-a043-ce74-58247837cef2', 'ddd department', '2016-11-10 13:40:27', '2016-11-10 13:40:27', '1', '1', '', 0, NULL, ''),
('c09d990f-111e-9ec0-38da-582475159060', 'test department aaaa', '2016-11-10 13:28:31', '2016-11-10 13:28:31', '1', '1', '', 0, NULL, NULL),
('c5ca876e-d20b-f66a-2615-58247ae5294e', 'abc depe', '2016-11-10 13:46:43', '2016-11-10 13:46:43', '1', '1', '', 0, NULL, ''),
('e1de8860-9d36-6110-c20c-582479f8667d', 'husy department', '2016-11-10 13:43:03', '2016-11-10 13:43:03', '1', '1', '', 0, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `rt_departments_audit`
--

CREATE TABLE IF NOT EXISTS `rt_departments_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_departments_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_departments_cstm`
--

CREATE TABLE IF NOT EXISTS `rt_departments_cstm` (
  `id_c` char(36) NOT NULL,
  `head_c` varchar(255) DEFAULT NULL,
  `head_id_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_departments_rt_employees_c`
--

CREATE TABLE IF NOT EXISTS `rt_departments_rt_employees_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_departments_rt_employeesrt_departments_ida` varchar(36) DEFAULT NULL,
  `rt_departments_rt_employeesrt_employees_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_departments_rt_employees_ida1` (`rt_departments_rt_employeesrt_departments_ida`),
  KEY `rt_departments_rt_employees_alt` (`rt_departments_rt_employeesrt_employees_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_departments_rt_employees_c`
--

INSERT INTO `rt_departments_rt_employees_c` (`id`, `date_modified`, `deleted`, `rt_departments_rt_employeesrt_departments_ida`, `rt_departments_rt_employeesrt_employees_idb`) VALUES
('e52d5ebf-7207-b01f-b2d8-58296a0a0fc2', '2016-11-14 07:40:46', 0, '2242f248-4c15-a46b-ba1c-58247cb61f11', 'df24096f-6644-4db0-1208-58296a7a7fba');

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees`
--

CREATE TABLE IF NOT EXISTS `rt_employees` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `employment_status` varchar(100) DEFAULT 'Active',
  `deduct_provident` tinyint(1) DEFAULT '0',
  `phone_extension` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `provident_fund` varchar(255) DEFAULT NULL,
  `casual_leave_balance` varchar(150) DEFAULT NULL,
  `annual_leave_balance` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_employees`
--

INSERT INTO `rt_employees` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `salutation`, `first_name`, `last_name`, `title`, `photo`, `department`, `do_not_call`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `primary_address_street`, `primary_address_city`, `primary_address_state`, `primary_address_postalcode`, `primary_address_country`, `alt_address_street`, `alt_address_city`, `alt_address_state`, `alt_address_postalcode`, `alt_address_country`, `assistant`, `assistant_phone`, `employment_status`, `deduct_provident`, `phone_extension`, `salary`, `tax`, `provident_fund`, `casual_leave_balance`, `annual_leave_balance`) VALUES
('1e300425-7cf1-5562-e81b-5829c66cfed9', '2016-11-14 14:14:11', '2016-11-14 14:14:11', '1', '1', '', 0, NULL, 'Mr.', 'etst', 'mmm', NULL, '', NULL, 0, '', '34534', '', NULL, NULL, 'gfsd', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 0, '', 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"45000";s:7:"taxable";N;}s:4:"rent";a:2:{s:6:"amount";s:4:"1500";s:7:"taxable";N;}}', '', '', '8', '12'),
('4293caf3-8658-7509-b509-58299d9743d6', '2016-11-14 11:20:13', '2016-11-14 11:20:13', '1', '1', '', 0, NULL, 'Mr.', 'test ', 'husy', NULL, '', NULL, 0, '', '4564553', '', NULL, NULL, '345dfgdfg', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 0, '', 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"10000";s:7:"taxable";N;}s:4:"rent";a:2:{s:6:"amount";s:4:"5000";s:7:"taxable";N;}}', '', '', '6', '10'),
('74ded684-06c4-ac4d-33d5-582ab6d3b7fd', '2016-11-15 07:16:23', '2016-11-15 07:43:13', '1', '1', NULL, 0, '', 'Mr.', 'today', '15', NULL, NULL, NULL, 0, NULL, '34563465435', NULL, NULL, NULL, 'dfgdf43634', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 1, NULL, 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"15000";s:7:"taxable";s:1:"1";}s:4:"rent";a:2:{s:6:"amount";s:4:"5000";s:7:"taxable";N;}}', '200.00', '10', '6', '10'),
('c176d323-e9eb-0c9a-1c44-58299c7c1ff2', '2016-11-14 11:14:26', '2016-11-14 11:14:26', '1', '1', '', 0, NULL, 'Mr.', 'test ', 'salary 14', NULL, '', NULL, 0, '', '234234', '', NULL, NULL, '43252345fdgfdg', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 0, '', NULL, '', '', '6', '10'),
('c61b0bc1-4fd4-51ad-076c-5829c678e76e', '2016-11-14 14:13:16', '2016-11-14 14:13:16', '1', '1', '', 0, NULL, 'Mr.', 'test ', '1412', NULL, '', NULL, 0, '', '345345', '', NULL, NULL, '34fdgdfg', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', 0, '', 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"35000";s:7:"taxable";N;}s:6:"health";a:2:{s:6:"amount";s:4:"2500";s:7:"taxable";N;}}', '', '', '6', '10');

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees_audit`
--

CREATE TABLE IF NOT EXISTS `rt_employees_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_employees_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees_cstm`
--

CREATE TABLE IF NOT EXISTS `rt_employees_cstm` (
  `id_c` char(36) NOT NULL,
  `account_name_c` varchar(255) DEFAULT NULL,
  `balance_update_date_c` date DEFAULT NULL,
  `bank_account_c` varchar(255) DEFAULT NULL,
  `bank_name_c` varchar(100) DEFAULT 'Allied_Bank',
  `date_of_birth_c` date DEFAULT NULL,
  `employment_type_c` varchar(100) DEFAULT 'Full_Time',
  `entitled_annual_leaves_c` int(255) DEFAULT NULL,
  `entitled_casual_leaves_c` int(255) DEFAULT NULL,
  `gender_c` varchar(100) DEFAULT 'male',
  `joining_date_c` date DEFAULT NULL,
  `marital_status_c` varchar(100) DEFAULT NULL,
  `nic_number_c` varchar(255) DEFAULT NULL,
  `ntn_number_c` varchar(255) DEFAULT NULL,
  `salary_c` int(255) DEFAULT NULL,
  `years_c` int(255) DEFAULT '0',
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_employees_cstm`
--

INSERT INTO `rt_employees_cstm` (`id_c`, `account_name_c`, `balance_update_date_c`, `bank_account_c`, `bank_name_c`, `date_of_birth_c`, `employment_type_c`, `entitled_annual_leaves_c`, `entitled_casual_leaves_c`, `gender_c`, `joining_date_c`, `marital_status_c`, `nic_number_c`, `ntn_number_c`, `salary_c`, `years_c`) VALUES
('1e300425-7cf1-5562-e81b-5829c66cfed9', '', NULL, '', 'Allied_Bank', '2016-11-14', 'Full_Time', 12, 8, 'male', '2010-11-14', '', '354534', '', 46500, 0),
('4293caf3-8658-7509-b509-58299d9743d6', '', NULL, '', 'Allied_Bank', '2016-11-14', 'Full_Time', 10, 6, 'male', '2010-11-14', '', '4564564', '', 15000, 0),
('74ded684-06c4-ac4d-33d5-582ab6d3b7fd', '', NULL, '', 'Allied_Bank', '2016-11-15', 'Full_Time', 10, 6, 'male', '2012-11-15', '', '3454365', '', 20000, 0),
('c176d323-e9eb-0c9a-1c44-58299c7c1ff2', '', NULL, '', 'Allied_Bank', '1995-08-28', 'Full_Time', 10, 6, 'male', '2009-06-23', 'Single', '34563465', '', 40000, 0),
('c61b0bc1-4fd4-51ad-076c-5829c678e76e', '', NULL, '', 'Allied_Bank', '1995-11-14', 'Full_Time', 10, 6, 'male', '2012-11-14', '', '3456345', '', 37500, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees_documents_c`
--

CREATE TABLE IF NOT EXISTS `rt_employees_documents_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_employees_documentsrt_employees_ida` varchar(36) DEFAULT NULL,
  `rt_employees_documentsdocuments_idb` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_employees_documents_ida1` (`rt_employees_documentsrt_employees_ida`),
  KEY `rt_employees_documents_alt` (`rt_employees_documentsdocuments_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees_rt_appraisals_c`
--

CREATE TABLE IF NOT EXISTS `rt_employees_rt_appraisals_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_employees_rt_appraisalsrt_employees_ida` varchar(36) DEFAULT NULL,
  `rt_employees_rt_appraisalsrt_appraisals_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_employees_rt_appraisals_ida1` (`rt_employees_rt_appraisalsrt_employees_ida`),
  KEY `rt_employees_rt_appraisals_alt` (`rt_employees_rt_appraisalsrt_appraisals_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees_rt_bonus_c`
--

CREATE TABLE IF NOT EXISTS `rt_employees_rt_bonus_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_employees_rt_bonusrt_employees_ida` varchar(36) DEFAULT NULL,
  `rt_employees_rt_bonusrt_bonus_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_employees_rt_bonus_ida1` (`rt_employees_rt_bonusrt_employees_ida`),
  KEY `rt_employees_rt_bonus_alt` (`rt_employees_rt_bonusrt_bonus_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_employees_rt_bonus_c`
--

INSERT INTO `rt_employees_rt_bonus_c` (`id`, `date_modified`, `deleted`, `rt_employees_rt_bonusrt_employees_ida`, `rt_employees_rt_bonusrt_bonus_idb`) VALUES
('3f462b18-3648-60f2-8df0-582330c3e6a3', '2016-11-09 14:18:29', 0, '896268fc-c9d6-93cc-9fa8-582321bb0982', '3bfdab33-1d05-41af-0847-582330adad94'),
('7647c754-b6fa-7101-ed28-58232f569216', '2016-11-09 14:13:29', 0, '896268fc-c9d6-93cc-9fa8-582321bb0982', '734bf743-e260-fb91-2dae-58232f7f8ef5');

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees_rt_deductables_c`
--

CREATE TABLE IF NOT EXISTS `rt_employees_rt_deductables_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_employees_rt_deductablesrt_employees_ida` varchar(36) DEFAULT NULL,
  `rt_employees_rt_deductablesrt_deductables_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_employees_rt_deductables_ida1` (`rt_employees_rt_deductablesrt_employees_ida`),
  KEY `rt_employees_rt_deductables_alt` (`rt_employees_rt_deductablesrt_deductables_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees_rt_employees_c`
--

CREATE TABLE IF NOT EXISTS `rt_employees_rt_employees_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_employees_rt_employeesrt_employees_ida` varchar(36) DEFAULT NULL,
  `rt_employees_rt_employeesrt_employees_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_employees_rt_employees_ida1` (`rt_employees_rt_employeesrt_employees_ida`),
  KEY `rt_employees_rt_employees_alt` (`rt_employees_rt_employeesrt_employees_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_employees_rt_employees_c`
--

INSERT INTO `rt_employees_rt_employees_c` (`id`, `date_modified`, `deleted`, `rt_employees_rt_employeesrt_employees_ida`, `rt_employees_rt_employeesrt_employees_idb`) VALUES
('3faea396-6853-c527-73f5-581c6a4499e4', '2016-11-04 11:02:04', 0, '3a374cdb-63d1-c038-542d-581c6a0b23a3', 'e1a3888d-1197-e4cd-148f-5811ddcc5adf'),
('521dd71e-8e25-95d7-b632-581c6689fcda', '2016-11-04 10:42:17', 0, '4cee38fc-0bec-02fa-5019-581c665b1ca8', 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('790e1bd5-2f16-dac7-dab2-581c623bb97f', '2016-11-04 10:25:20', 0, '737b29ff-85b2-7f4f-d66c-581c6273b780', 'e1a3888d-1197-e4cd-148f-5811ddcc5adf'),
('cc39596d-c0fe-d9a8-733a-5811e03c1bda', '2016-10-27 11:10:59', 0, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0', '380d7c06-497a-f0e2-e02a-580497b91089'),
('e493bf1e-67ea-21c3-a8b9-5811dd389236', '2016-10-27 10:55:49', 0, 'e1a3888d-1197-e4cd-148f-5811ddcc5adf', 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('e5764d83-ab9e-8d6f-f140-58247df17bcb', '2016-11-10 14:00:41', 0, 'dbf8b56f-74fe-4d70-1b5b-58247d1eb23a', 'e1a3888d-1197-e4cd-148f-5811ddcc5adf');

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees_rt_leaves_c`
--

CREATE TABLE IF NOT EXISTS `rt_employees_rt_leaves_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_employees_rt_leavesrt_employees_ida` varchar(36) DEFAULT NULL,
  `rt_employees_rt_leavesrt_leaves_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_employees_rt_leaves_ida1` (`rt_employees_rt_leavesrt_employees_ida`),
  KEY `rt_employees_rt_leaves_alt` (`rt_employees_rt_leavesrt_leaves_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_employees_rt_leaves_c`
--

INSERT INTO `rt_employees_rt_leaves_c` (`id`, `date_modified`, `deleted`, `rt_employees_rt_leavesrt_employees_ida`, `rt_employees_rt_leavesrt_leaves_idb`) VALUES
('13ca3f44-29de-687d-de2c-582321a49cc2', '2016-11-09 13:16:26', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', '110d60f3-3cb5-e515-04e7-582321b0d68e'),
('15465f37-8f76-6498-30e2-58230f8f3b4a', '2016-11-09 11:57:39', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', '11ff3e86-2627-0d0e-4dc0-58230fa6d227'),
('16218e6a-9f80-8472-d2c6-58231fe77ce9', '2016-11-09 13:08:13', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', '130ad3d2-3415-8ff3-4c2b-58231f95d2fa'),
('16254aa6-d748-2967-854f-58231a2b10f6', '2016-11-09 12:47:53', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', '13566e85-4259-0395-76ef-58231afe513b'),
('1996b7a5-ebf7-c029-6e3f-58231cbbbc67', '2016-11-09 12:54:20', 0, '99155b84-6e60-e5ae-16fe-5821691782d2', '166d31d1-7c62-5548-ae4b-58231cb6a659'),
('1b64a169-4660-4fd5-3f9f-5822c2c0ccae', '2016-11-09 06:29:16', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', '186fc5da-9438-9824-d39a-5822c2ba7e88'),
('1c742ea0-e556-7acb-7447-5822fc7ae57f', '2016-11-09 10:37:35', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', '191f60d6-b378-c5ec-87a1-5822fc073645'),
('21600d30-decb-b2f3-d1ea-58230a9926e3', '2016-11-09 11:37:51', 0, 'eae18998-cf3d-17eb-9a12-58217076a5d0', 'f1517d18-d9cb-61ce-ea23-58230a788f55'),
('270780f3-3f64-7607-d0a2-5822c17bd8f5', '2016-11-09 06:27:44', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', '23850b8d-971e-b019-3405-5822c1f17ef0'),
('2c1ad9c8-b061-375d-4b64-5822f381576f', '2016-11-09 09:58:04', 0, 'eae18998-cf3d-17eb-9a12-58217076a5d0', '297365e8-febf-bd43-0c6d-5822f36ae57a'),
('334323a1-48b9-eaa8-d4df-58231b8e800b', '2016-11-09 12:51:08', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', '3085909b-b6cb-ff1d-7071-58231bca89c3'),
('3afad89a-4f68-39ca-128a-58230fddb48a', '2016-11-09 11:58:52', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', '37f3d52e-4bd9-4354-07da-58230f7c59af'),
('3b0d4f83-c9eb-d841-2faa-5821da382dce', '2016-11-08 14:02:25', 0, 'b49f614d-15c9-16f0-6756-5821ccd22e67', '3746b4ef-d6ff-6299-5a7f-5821dae6a1be'),
('4c042547-5241-0120-efc3-58230c48d0bc', '2016-11-09 11:47:56', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', '4884d4bc-8b2c-9927-6618-58230ceeb88c'),
('4cd97459-1d76-18bc-4d84-58231f6464ca', '2016-11-09 13:09:06', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', '4966853f-41b5-2032-0219-58231f2ae509'),
('55288f17-b8c8-16b8-6676-582315843add', '2016-11-09 12:23:31', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', '5257457d-2d47-3dc7-ca34-58231555cd91'),
('589508bd-d41c-a0ff-8c89-5821ded6132e', '2016-11-08 14:19:21', 1, 'b49f614d-15c9-16f0-6756-5821ccd22e67', '26570d90-2856-1167-fb4a-5821dec4e5d0'),
('59289cd7-9cad-3ff6-44e6-58230ce8ed9b', '2016-11-09 11:47:40', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', '564039c5-227b-f96d-4479-58230cd61214'),
('643d89fd-825c-35a6-a2e0-582314404833', '2016-11-09 12:21:35', 0, '99155b84-6e60-e5ae-16fe-5821691782d2', '617c81cf-bebf-e0e9-2cd4-582314c928df'),
('6666145d-91eb-22a1-d5e7-5823229a852a', '2016-11-09 13:19:04', 0, '896268fc-c9d6-93cc-9fa8-582321bb0982', '637d6d0d-f08c-95e2-e09f-5823221aef5c'),
('6bac94ad-d3c3-0218-c776-58247dc9ff3f', '2016-11-10 14:01:35', 0, 'dbf8b56f-74fe-4d70-1b5b-58247d1eb23a', '659567aa-6fb5-084c-f5e1-58247d2f74b8'),
('704dd2c9-170f-15fc-92e5-58231cf6306f', '2016-11-09 12:53:34', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', '6dac0ea7-ae88-63ba-3828-58231c247757'),
('74fc0e83-c8d2-07fa-7783-58230bfba989', '2016-11-09 11:40:45', 0, '99155b84-6e60-e5ae-16fe-5821691782d2', '71faec55-d518-cebd-93e2-58230b102fa8'),
('8b290dab-8645-17fe-d67c-5821da9dec3b', '2016-11-08 14:00:42', 0, 'b49f614d-15c9-16f0-6756-5821ccd22e67', '56ff0270-ff07-a4f5-0346-5821dae273c6'),
('935c5146-5f53-7d02-2d35-5822f3f0bf57', '2016-11-09 09:57:47', 0, 'eae18998-cf3d-17eb-9a12-58217076a5d0', '90809499-5deb-dab0-6e7d-5822f33c05d8'),
('98fd346c-29f6-6050-a47f-58230b6c59be', '2016-11-09 11:42:20', 0, '99155b84-6e60-e5ae-16fe-5821691782d2', '95d66fd6-1dd0-f716-96b1-58230bbd8c1c'),
('9d713194-02c0-e1c2-aee7-5823225f979d', '2016-11-09 13:19:23', 0, '896268fc-c9d6-93cc-9fa8-582321bb0982', '9a701a8e-d47d-5a0d-7a9d-582322df6ce6'),
('a797b32e-e48b-15d0-4356-5822c15ecd3a', '2016-11-09 06:27:20', 0, 'b49f614d-15c9-16f0-6756-5821ccd22e67', 'a41d1a4a-a1bd-32d1-66b1-5822c19cc74a'),
('b98e743b-898d-f484-389e-58231c0416ff', '2016-11-09 12:54:09', 0, '99155b84-6e60-e5ae-16fe-5821691782d2', 'b68ae79f-1b32-fa1d-9575-58231cf760a3'),
('bb060a03-95d2-e719-cdf5-582322ebde15', '2016-11-09 13:19:37', 0, '896268fc-c9d6-93cc-9fa8-582321bb0982', '8f800f70-21b0-74df-ff9c-582322a8954e'),
('bf0a33ab-f6a8-f0c1-98c6-582310d50c58', '2016-11-09 12:04:48', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', 'bc2e1806-098e-38b4-363c-582310a430a2'),
('c394f383-0ffc-23fc-2387-58231617a607', '2016-11-09 12:28:04', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', 'c075dcfc-9153-fefd-72fc-582316bb1c47'),
('c670e072-7dfc-467a-d29b-5822d1fc643f', '2016-11-09 07:35:02', 0, '99155b84-6e60-e5ae-16fe-5821691782d2', 'c1c60d36-b0d8-cc78-3af0-5822d16830d1'),
('d1481cec-58c4-e231-1d0f-58230cc8defa', '2016-11-09 11:44:52', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', 'ce6fcb51-85aa-23c8-aeb2-58230c1a5522'),
('d61165b1-8968-bb04-780a-58247ec78c86', '2016-11-10 14:02:59', 0, 'dbf8b56f-74fe-4d70-1b5b-58247d1eb23a', 'd0a81696-1830-283a-bba5-58247e715a9b'),
('d9364e08-4960-71ad-9d62-582316e42201', '2016-11-09 12:30:21', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', 'd62ce932-f521-19b1-b0d8-582316c17a44'),
('dbc6b43b-aa35-cd0f-c4a3-582320d80c47', '2016-11-09 13:11:17', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', 'd9037273-5c86-76e2-935d-5823202de7f3'),
('e3c96ff9-234f-d2e1-2134-58247d2af477', '2016-11-10 14:01:15', 0, 'dbf8b56f-74fe-4d70-1b5b-58247d1eb23a', 'dd0f48ef-fb2c-0d12-e9d2-58247d88a1aa'),
('e5a80e3c-5e62-c2b0-d495-5822f373e496', '2016-11-09 09:59:10', 0, 'eae18998-cf3d-17eb-9a12-58217076a5d0', 'bab70d05-9f70-d843-0c8c-5822f3d541e0'),
('e62eb31b-7dea-1ebe-5587-58231d5739ac', '2016-11-09 12:56:32', 0, '99155b84-6e60-e5ae-16fe-5821691782d2', 'e3436c27-87a9-9f61-9673-58231d657438'),
('e6df28fd-1722-101f-9410-58232064d0f3', '2016-11-09 13:12:30', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', 'e4542d45-2fd1-8601-f0e0-5823209aa9a1');

-- --------------------------------------------------------

--
-- Table structure for table `rt_employees_rt_payroll_c`
--

CREATE TABLE IF NOT EXISTS `rt_employees_rt_payroll_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_employees_rt_payrollrt_employees_ida` varchar(36) DEFAULT NULL,
  `rt_employees_rt_payrollrt_payroll_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_employees_rt_payroll_ida1` (`rt_employees_rt_payrollrt_employees_ida`),
  KEY `rt_employees_rt_payroll_alt` (`rt_employees_rt_payrollrt_payroll_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_employees_rt_payroll_c`
--

INSERT INTO `rt_employees_rt_payroll_c` (`id`, `date_modified`, `deleted`, `rt_employees_rt_payrollrt_employees_ida`, `rt_employees_rt_payrollrt_payroll_idb`) VALUES
('1121ad21-5c8d-7c3a-5bc2-582ee7b3062c', '0000-00-00 00:00:00', 0, '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', '1111e629-420d-cdbb-4c7a-582ee77868fd'),
('127431bd-1a63-0855-7351-582af25247e1', '0000-00-00 00:00:00', 0, '4293caf3-8658-7509-b509-58299d9743d6', '126b9920-727b-6d3d-81a7-582af23bfd4e'),
('1be37b30-10a6-6b83-55a6-582af289a4e3', '0000-00-00 00:00:00', 0, '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', '1bd14428-0219-5834-c306-582af270f61e'),
('217fe542-8800-8d42-8a61-582af20b3f65', '0000-00-00 00:00:00', 0, 'c176d323-e9eb-0c9a-1c44-58299c7c1ff2', '21748c82-51d2-6e81-7fbc-582af26748a8'),
('99429c88-bcd2-fd39-7de2-582ee974f96e', '0000-00-00 00:00:00', 0, '4293caf3-8658-7509-b509-58299d9743d6', '9939abb9-824b-3da2-1b2a-582ee98b9a69'),
('a1b18830-25ba-eb07-b4fe-582ee948ea8e', '0000-00-00 00:00:00', 0, '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', 'a1a0ece8-d07a-8767-96d5-582ee9984f78'),
('a64461bb-471e-1963-5819-582ee9d48283', '0000-00-00 00:00:00', 0, 'c176d323-e9eb-0c9a-1c44-58299c7c1ff2', 'a63be910-bbe7-649c-453a-582ee95585d6'),
('dc8e09ec-6e16-82b7-60d6-582af30db982', '0000-00-00 00:00:00', 0, '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', 'dc84e3c0-4193-dfb2-9b5b-582af3acd184');

-- --------------------------------------------------------

--
-- Table structure for table `rt_increment_history`
--

CREATE TABLE IF NOT EXISTS `rt_increment_history` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_increment_history`
--

INSERT INTO `rt_increment_history` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`) VALUES
('18c3a4f1-0720-b292-a104-5824589e82c7', 'last year employee''s Increment', '2016-11-10 11:22:41', '2016-11-10 11:22:41', '1', '1', '', 0, NULL),
('19b4233f-96bf-df5c-f3db-582421dedb3a', '', '2016-11-10 07:28:32', '2016-11-10 07:28:32', '1', '1', '', 0, NULL),
('201266c0-1c8a-9f3b-16fa-58245952e77e', 'june employee''s Increment', '2016-11-10 11:26:59', '2016-11-10 11:26:59', '1', '1', '', 0, NULL),
('233a100a-6040-96a9-09cf-582458ac7ea6', 'june employee''s Increment', '2016-11-10 11:20:48', '2016-11-10 11:20:48', '1', '1', '', 0, NULL),
('5d66c897-c74c-b496-e85b-5824594da37c', 'atif zulfiqar''s Increment', '2016-11-10 11:25:03', '2016-11-10 11:25:03', '1', '1', '', 0, NULL),
('62fd92c9-23ac-4c2c-b850-58243c409f39', '', '2016-11-10 09:24:46', '2016-11-10 09:24:46', '1', '1', '', 0, NULL),
('7f877ffd-ee3a-86d4-6100-582457c6c75b', 'tttt zzzz''s Increment', '2016-11-10 11:19:34', '2016-11-10 11:19:34', '1', '1', '', 0, NULL),
('8fe8db60-3809-14ba-2bf5-58245d264aef', 'today employee''s Increment', '2016-11-10 11:43:03', '2016-11-10 11:43:03', '1', '1', '', 0, NULL),
('96883eab-a3ec-c063-5320-582426b0405e', '', '2016-11-10 07:49:47', '2016-11-10 07:49:47', '1', '1', '', 0, NULL),
('9c58be18-11ab-5c5f-7eef-58245770104d', 'tes  now''s Increment', '2016-11-10 11:18:19', '2016-11-10 11:18:19', '1', '1', '', 0, NULL),
('a6e5427b-c6ce-9aee-7610-58242aee5454', '', '2016-11-10 08:06:53', '2016-11-10 08:06:53', '1', '1', '', 0, NULL),
('b42c2a3d-1df2-ff0a-8244-58243dc40703', 'today employee''s Increment', '2016-11-10 09:28:57', '2016-11-10 09:28:57', '1', '1', '', 0, NULL),
('db763340-8a50-8558-398a-58245e0d8119', 'tes  now''s Increment', '2016-11-10 11:47:38', '2016-11-10 11:47:38', '1', '1', '', 0, NULL),
('dbaf404f-6e8b-1942-325f-58245b35e8c2', 'june employee''s Increment', '2016-11-10 11:36:16', '2016-11-10 11:46:52', '1', '1', NULL, 0, ''),
('e229a1c8-fb55-3099-0495-5824567df806', 'june employee''s Increment', '2016-11-10 11:15:41', '2016-11-10 11:15:41', '1', '1', '', 0, NULL),
('f3e6499d-8156-51cc-5f93-582464802c0c', 'sss salary''s Increment', '2016-11-10 12:15:41', '2016-11-10 12:15:41', '1', '1', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_increment_history_audit`
--

CREATE TABLE IF NOT EXISTS `rt_increment_history_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_increment_history_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_increment_history_cstm`
--

CREATE TABLE IF NOT EXISTS `rt_increment_history_cstm` (
  `id_c` char(36) NOT NULL,
  `increment_c` int(255) DEFAULT NULL,
  `increment_date_c` datetime DEFAULT NULL,
  `last_increment_c` datetime DEFAULT NULL,
  `next_increment_c` varchar(255) DEFAULT NULL,
  `status_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_increment_history_cstm`
--

INSERT INTO `rt_increment_history_cstm` (`id_c`, `increment_c`, `increment_date_c`, `last_increment_c`, `next_increment_c`, `status_c`) VALUES
('18c3a4f1-0720-b292-a104-5824589e82c7', 545, '2017-06-28 05:00:00', NULL, '10-05-2017', 'Applied'),
('19b4233f-96bf-df5c-f3db-582421dedb3a', 12000, '2016-11-10 05:00:00', NULL, NULL, NULL),
('201266c0-1c8a-9f3b-16fa-58245952e77e', 8787, '2017-07-13 05:00:00', NULL, '10-05-2017', 'Applied'),
('233a100a-6040-96a9-09cf-582458ac7ea6', 545, '2016-11-10 05:00:00', NULL, '10-05-2017', 'Applied'),
('5d66c897-c74c-b496-e85b-5824594da37c', 54545, '2016-11-10 05:00:00', NULL, NULL, 'Scheduled'),
('62fd92c9-23ac-4c2c-b850-58243c409f39', 25000, '2016-11-10 05:00:00', NULL, NULL, NULL),
('7f877ffd-ee3a-86d4-6100-582457c6c75b', 85000, '2016-11-10 05:00:00', NULL, '10-11-2017', 'Applied'),
('8fe8db60-3809-14ba-2bf5-58245d264aef', 5000, '2018-03-28 00:00:00', NULL, '2019-03-28', 'Applied'),
('96883eab-a3ec-c063-5320-582426b0405e', 454, '2016-11-10 05:00:00', NULL, NULL, NULL),
('9c58be18-11ab-5c5f-7eef-58245770104d', 7400, '2016-11-10 05:00:00', NULL, '10-05-2017', 'Applied'),
('a6e5427b-c6ce-9aee-7610-58242aee5454', 1564, '2016-11-10 05:00:00', NULL, '10-05-2017', 'Applied'),
('b42c2a3d-1df2-ff0a-8244-58243dc40703', 25000, '2016-11-10 05:00:00', NULL, '10-05-2017', 'Applied'),
('db763340-8a50-8558-398a-58245e0d8119', 4545, '2014-03-25 00:00:00', NULL, '2014-09-25', 'Applied'),
('dbaf404f-6e8b-1942-325f-58245b35e8c2', 4545, '2017-03-16 00:00:00', NULL, '2017-09-16', 'Applied'),
('e229a1c8-fb55-3099-0495-5824567df806', 4500, '2016-11-10 05:00:00', NULL, '10-05-2017', 'Applied'),
('f3e6499d-8156-51cc-5f93-582464802c0c', 5000, '2016-11-10 00:00:00', NULL, '2017-05-10', 'Applied');

-- --------------------------------------------------------

--
-- Table structure for table `rt_increment_history_rt_employees_c`
--

CREATE TABLE IF NOT EXISTS `rt_increment_history_rt_employees_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `rt_increment_history_rt_employeesrt_employees_ida` varchar(36) DEFAULT NULL,
  `rt_increment_history_rt_employeesrt_increment_history_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rt_increment_history_rt_employees_ida1` (`rt_increment_history_rt_employeesrt_employees_ida`),
  KEY `rt_increment_history_rt_employees_alt` (`rt_increment_history_rt_employeesrt_increment_history_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_increment_history_rt_employees_c`
--

INSERT INTO `rt_increment_history_rt_employees_c` (`id`, `date_modified`, `deleted`, `rt_increment_history_rt_employeesrt_employees_ida`, `rt_increment_history_rt_employeesrt_increment_history_idb`) VALUES
('1ba0d954-4c25-1c66-6be8-582458f332d7', '2016-11-10 11:22:41', 0, 'eae18998-cf3d-17eb-9a12-58217076a5d0', '18c3a4f1-0720-b292-a104-5824589e82c7'),
('1cd0b540-7580-d698-aeb5-582421a9c163', '2016-11-10 07:28:32', 0, 'eae18998-cf3d-17eb-9a12-58217076a5d0', '19b4233f-96bf-df5c-f3db-582421dedb3a'),
('23d1cbf7-e4f6-04cf-f347-5824598f7e80', '2016-11-10 11:26:59', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', '201266c0-1c8a-9f3b-16fa-58245952e77e'),
('2614b597-7624-61d2-2219-58245898916e', '2016-11-10 11:20:48', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', '233a100a-6040-96a9-09cf-582458ac7ea6'),
('27ea01fd-02ba-e8e8-d40f-582464bf7ecf', '2016-11-10 12:15:41', 0, 'e93d3db3-c59b-51a3-2af8-582464bacdfc', 'f3e6499d-8156-51cc-5f93-582464802c0c'),
('64702cfd-0581-23a9-896c-5824595c698e', '2016-11-10 11:25:03', 0, '4cee38fc-0bec-02fa-5019-581c665b1ca8', '5d66c897-c74c-b496-e85b-5824594da37c'),
('65f3daa8-b118-b48f-d341-58243ce85a8f', '2016-11-10 09:24:46', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', '62fd92c9-23ac-4c2c-b850-58243c409f39'),
('82a98393-68a6-0c0e-7727-5824570ec8f6', '2016-11-10 11:19:34', 0, 'b49f614d-15c9-16f0-6756-5821ccd22e67', '7f877ffd-ee3a-86d4-6100-582457c6c75b'),
('935685c2-8124-da7f-f705-58245d907399', '2016-11-10 11:43:03', 0, '99155b84-6e60-e5ae-16fe-5821691782d2', '8fe8db60-3809-14ba-2bf5-58245d264aef'),
('996fa7af-4e56-fce2-64d8-582426dce0cd', '2016-11-10 07:49:47', 0, 'ef401f68-32e0-46bf-e3bb-58230c65631a', '96883eab-a3ec-c063-5320-582426b0405e'),
('9f79bf1f-b449-2e67-1d17-58245703e3e0', '2016-11-10 11:18:19', 0, '896268fc-c9d6-93cc-9fa8-582321bb0982', '9c58be18-11ab-5c5f-7eef-58245770104d'),
('aae61f7f-c601-929c-5201-58242add3ff6', '2016-11-10 08:06:53', 0, '896268fc-c9d6-93cc-9fa8-582321bb0982', 'a6e5427b-c6ce-9aee-7610-58242aee5454'),
('b76598c7-a29a-dd70-80e0-58243d8413ff', '2016-11-10 09:28:57', 0, '99155b84-6e60-e5ae-16fe-5821691782d2', 'b42c2a3d-1df2-ff0a-8244-58243dc40703'),
('de56adc5-93f5-d3f9-ac06-58245e5259b8', '2016-11-10 11:47:38', 0, '896268fc-c9d6-93cc-9fa8-582321bb0982', 'db763340-8a50-8558-398a-58245e0d8119'),
('def72b8a-ee63-cbf1-9c2e-58245b866791', '2016-11-10 11:36:16', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', 'dbaf404f-6e8b-1942-325f-58245b35e8c2'),
('e549ca17-81e8-74ca-6617-582456f10926', '2016-11-10 11:15:41', 0, '5b8d9fce-7389-baa6-071e-58219f695d0d', 'e229a1c8-fb55-3099-0495-5824567df806');

-- --------------------------------------------------------

--
-- Table structure for table `rt_leaves`
--

CREATE TABLE IF NOT EXISTS `rt_leaves` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_leaves`
--

INSERT INTO `rt_leaves` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`) VALUES
('110d60f3-3cb5-e515-04e7-582321b0d68e', 'Leave of emp 9 nov', '2016-11-09 13:16:26', '2016-11-09 13:16:26', '1', '1', NULL, 0, NULL),
('11ff3e86-2627-0d0e-4dc0-58230fa6d227', 'Leave of emp 9 nov', '2016-11-09 11:57:39', '2016-11-09 11:57:39', '1', '1', NULL, 0, NULL),
('130ad3d2-3415-8ff3-4c2b-58231f95d2fa', 'Leave of emp 9 nov', '2016-11-09 13:08:13', '2016-11-09 13:08:13', '1', '1', NULL, 0, NULL),
('13566e85-4259-0395-76ef-58231afe513b', 'Leave of june employee', '2016-11-09 12:47:53', '2016-11-09 12:47:53', '1', '1', NULL, 0, NULL),
('166d31d1-7c62-5548-ae4b-58231cb6a659', 'Leave of today employee', '2016-11-09 12:54:20', '2016-11-09 12:54:20', '1', '1', NULL, 0, NULL),
('186fc5da-9438-9824-d39a-5822c2ba7e88', 'Leave of june employee', '2016-11-09 06:29:16', '2016-11-09 06:29:16', '1', '1', NULL, 0, NULL),
('191f60d6-b378-c5ec-87a1-5822fc073645', 'Leave of june employee', '2016-11-09 10:37:35', '2016-11-09 10:37:35', '1', '1', NULL, 0, NULL),
('23850b8d-971e-b019-3405-5822c1f17ef0', 'Leave of june employee', '2016-11-09 06:27:44', '2016-11-09 06:27:44', '1', '1', NULL, 0, NULL),
('26570d90-2856-1167-fb4a-5821dec4e5d0', 'Leave of tttt zzzz', '2016-11-08 14:17:59', '2016-11-08 14:19:21', '1', '1', NULL, 1, ''),
('297365e8-febf-bd43-0c6d-5822f36ae57a', 'Leave of last year employee', '2016-11-09 09:58:04', '2016-11-09 09:58:04', '1', '1', NULL, 0, NULL),
('3085909b-b6cb-ff1d-7071-58231bca89c3', 'Leave of emp 9 nov', '2016-11-09 12:51:08', '2016-11-09 12:51:08', '1', '1', NULL, 0, NULL),
('3746b4ef-d6ff-6299-5a7f-5821dae6a1be', 'test', '2016-11-08 14:02:25', '2016-11-08 14:09:43', '1', '1', NULL, 0, ''),
('37f3d52e-4bd9-4354-07da-58230f7c59af', 'Leave of emp 9 nov', '2016-11-09 11:58:52', '2016-11-09 11:58:52', '1', '1', NULL, 0, NULL),
('4884d4bc-8b2c-9927-6618-58230ceeb88c', 'Leave of emp 9 nov', '2016-11-09 11:47:56', '2016-11-09 11:47:56', '1', '1', NULL, 0, NULL),
('4966853f-41b5-2032-0219-58231f2ae509', 'Leave of june employee', '2016-11-09 13:09:06', '2016-11-09 13:09:06', '1', '1', NULL, 0, NULL),
('5257457d-2d47-3dc7-ca34-58231555cd91', 'Leave of june employee', '2016-11-09 12:23:31', '2016-11-09 12:23:31', '1', '1', NULL, 0, NULL),
('564039c5-227b-f96d-4479-58230cd61214', 'Leave of emp 9 nov', '2016-11-09 11:47:40', '2016-11-09 11:47:40', '1', '1', NULL, 0, NULL),
('56ff0270-ff07-a4f5-0346-5821dae273c6', '', '2016-11-08 14:00:42', '2016-11-08 14:00:42', '1', '1', NULL, 0, NULL),
('617c81cf-bebf-e0e9-2cd4-582314c928df', 'Leave of today employee', '2016-11-09 12:21:35', '2016-11-09 12:21:35', '1', '1', NULL, 0, NULL),
('637d6d0d-f08c-95e2-e09f-5823221aef5c', 'Leave of tes  now', '2016-11-09 13:19:04', '2016-11-09 13:19:04', '1', '1', NULL, 0, NULL),
('659567aa-6fb5-084c-f5e1-58247d2f74b8', 'Leave of husy test today 9 nov', '2016-11-10 14:01:35', '2016-11-10 14:01:35', '1', '1', NULL, 0, NULL),
('6dac0ea7-ae88-63ba-3828-58231c247757', 'Leave of emp 9 nov', '2016-11-09 12:53:34', '2016-11-09 12:53:34', '1', '1', NULL, 0, NULL),
('71faec55-d518-cebd-93e2-58230b102fa8', 'Leave of today employee', '2016-11-09 11:40:45', '2016-11-09 11:40:45', '1', '1', NULL, 0, NULL),
('8f800f70-21b0-74df-ff9c-582322a8954e', 'Leave of tes  now', '2016-11-09 13:19:37', '2016-11-09 13:19:37', '1', '1', NULL, 0, NULL),
('90809499-5deb-dab0-6e7d-5822f33c05d8', 'Leave of last year employee', '2016-11-09 09:57:47', '2016-11-09 09:57:47', '1', '1', NULL, 0, NULL),
('95d66fd6-1dd0-f716-96b1-58230bbd8c1c', 'Leave of today employee', '2016-11-09 11:42:20', '2016-11-09 11:42:20', '1', '1', NULL, 0, NULL),
('9a701a8e-d47d-5a0d-7a9d-582322df6ce6', 'Leave of tes  now', '2016-11-09 13:19:23', '2016-11-09 13:19:23', '1', '1', NULL, 0, NULL),
('a41d1a4a-a1bd-32d1-66b1-5822c19cc74a', 'Leave of tttt zzzz', '2016-11-09 06:27:20', '2016-11-09 06:27:20', '1', '1', NULL, 0, NULL),
('b68ae79f-1b32-fa1d-9575-58231cf760a3', 'Leave of today employee', '2016-11-09 12:54:09', '2016-11-09 12:54:09', '1', '1', NULL, 0, NULL),
('bab70d05-9f70-d843-0c8c-5822f3d541e0', 'Leave of last year employee', '2016-11-09 09:59:10', '2016-11-09 09:59:10', '1', '1', NULL, 0, NULL),
('bc2e1806-098e-38b4-363c-582310a430a2', 'Leave of emp 9 nov', '2016-11-09 12:04:48', '2016-11-09 12:04:48', '1', '1', NULL, 0, NULL),
('c075dcfc-9153-fefd-72fc-582316bb1c47', 'Leave of emp 9 nov', '2016-11-09 12:28:04', '2016-11-09 12:28:04', '1', '1', NULL, 0, NULL),
('c1c60d36-b0d8-cc78-3af0-5822d16830d1', 'Leave of today employee', '2016-11-09 07:35:02', '2016-11-09 07:35:02', '1', '1', NULL, 0, NULL),
('ce6fcb51-85aa-23c8-aeb2-58230c1a5522', 'Leave of emp 9 nov', '2016-11-09 11:44:52', '2016-11-09 11:44:52', '1', '1', NULL, 0, NULL),
('d0a81696-1830-283a-bba5-58247e715a9b', 'Leave of husy test today 9 nov', '2016-11-10 14:02:59', '2016-11-10 14:02:59', '1', '1', NULL, 0, NULL),
('d62ce932-f521-19b1-b0d8-582316c17a44', 'Leave of emp 9 nov', '2016-11-09 12:30:21', '2016-11-09 12:30:21', '1', '1', NULL, 0, NULL),
('d9037273-5c86-76e2-935d-5823202de7f3', 'Leave of emp 9 nov', '2016-11-09 13:11:17', '2016-11-09 13:11:17', '1', '1', NULL, 0, NULL),
('dd0f48ef-fb2c-0d12-e9d2-58247d88a1aa', 'Leave of husy test today 9 nov', '2016-11-10 14:01:15', '2016-11-10 14:01:15', '1', '1', NULL, 0, NULL),
('e3436c27-87a9-9f61-9673-58231d657438', 'Leave of today employee', '2016-11-09 12:56:32', '2016-11-09 12:56:32', '1', '1', NULL, 0, NULL),
('e4542d45-2fd1-8601-f0e0-5823209aa9a1', 'Leave of emp 9 nov', '2016-11-09 13:12:30', '2016-11-09 13:12:30', '1', '1', NULL, 0, NULL),
('f1517d18-d9cb-61ce-ea23-58230a788f55', 'Leave of last year employee', '2016-11-09 11:37:51', '2016-11-09 11:37:51', '1', '1', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_leaves_audit`
--

CREATE TABLE IF NOT EXISTS `rt_leaves_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_leaves_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_leaves_cstm`
--

CREATE TABLE IF NOT EXISTS `rt_leaves_cstm` (
  `id_c` char(36) NOT NULL,
  `action_c` varchar(100) DEFAULT NULL,
  `annual_balance_c` int(255) DEFAULT NULL,
  `casual_balance_c` int(255) DEFAULT NULL,
  `comments_c` text,
  `from_date_c` date DEFAULT NULL,
  `leave_type_c` varchar(100) DEFAULT 'Annual',
  `number_of_days_c` int(255) DEFAULT NULL,
  `status_c` varchar(100) DEFAULT NULL,
  `to_date_c` date DEFAULT NULL,
  `count_days_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_leaves_cstm`
--

INSERT INTO `rt_leaves_cstm` (`id_c`, `action_c`, `annual_balance_c`, `casual_balance_c`, `comments_c`, `from_date_c`, `leave_type_c`, `number_of_days_c`, `status_c`, `to_date_c`, `count_days_c`) VALUES
('110d60f3-3cb5-e515-04e7-582321b0d68e', NULL, NULL, NULL, '', '2016-06-24', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('11ff3e86-2627-0d0e-4dc0-58230fa6d227', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('130ad3d2-3415-8ff3-4c2b-58231f95d2fa', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('13566e85-4259-0395-76ef-58231afe513b', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('166d31d1-7c62-5548-ae4b-58231cb6a659', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('186fc5da-9438-9824-d39a-5822c2ba7e88', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('191f60d6-b378-c5ec-87a1-5822fc073645', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('23850b8d-971e-b019-3405-5822c1f17ef0', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('26570d90-2856-1167-fb4a-5821dec4e5d0', '', NULL, NULL, '', '2016-11-08', 'Annual', NULL, 'Cancelled', '2016-11-10', '3'),
('297365e8-febf-bd43-0c6d-5822f36ae57a', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('3085909b-b6cb-ff1d-7071-58231bca89c3', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('3746b4ef-d6ff-6299-5a7f-5821dae6a1be', '', NULL, NULL, '', '2016-11-08', 'Annual', NULL, 'Cancelled', '2016-11-10', '3'),
('37f3d52e-4bd9-4354-07da-58230f7c59af', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-09', '1'),
('4884d4bc-8b2c-9927-6618-58230ceeb88c', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('4966853f-41b5-2032-0219-58231f2ae509', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('5257457d-2d47-3dc7-ca34-58231555cd91', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('564039c5-227b-f96d-4479-58230cd61214', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('56ff0270-ff07-a4f5-0346-5821dae273c6', NULL, NULL, NULL, '', '2016-11-08', 'Annual', NULL, 'Cancelled', '2016-11-09', '2'),
('617c81cf-bebf-e0e9-2cd4-582314c928df', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('637d6d0d-f08c-95e2-e09f-5823221aef5c', NULL, NULL, NULL, '', '2016-07-12', 'Annual', NULL, 'Cancelled', '2016-07-13', '2'),
('659567aa-6fb5-084c-f5e1-58247d2f74b8', NULL, NULL, NULL, '', '2016-11-10', 'Casual', NULL, 'Cancelled', '2016-11-11', '2'),
('6dac0ea7-ae88-63ba-3828-58231c247757', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('71faec55-d518-cebd-93e2-58230b102fa8', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('8f800f70-21b0-74df-ff9c-582322a8954e', NULL, NULL, NULL, '', '2016-11-09', 'Casual', NULL, 'Cancelled', '2016-11-10', '2'),
('90809499-5deb-dab0-6e7d-5822f33c05d8', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('95d66fd6-1dd0-f716-96b1-58230bbd8c1c', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('9a701a8e-d47d-5a0d-7a9d-582322df6ce6', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-09', '1'),
('a41d1a4a-a1bd-32d1-66b1-5822c19cc74a', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('b68ae79f-1b32-fa1d-9575-58231cf760a3', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('bab70d05-9f70-d843-0c8c-5822f3d541e0', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('bc2e1806-098e-38b4-363c-582310a430a2', NULL, NULL, NULL, '', '2016-11-09', 'Casual', NULL, 'Cancelled', '2016-11-09', '1'),
('c075dcfc-9153-fefd-72fc-582316bb1c47', NULL, NULL, NULL, '', '2016-11-09', 'Casual', NULL, 'Cancelled', '2016-11-09', '1'),
('c1c60d36-b0d8-cc78-3af0-5822d16830d1', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '999'),
('ce6fcb51-85aa-23c8-aeb2-58230c1a5522', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('d0a81696-1830-283a-bba5-58247e715a9b', NULL, NULL, NULL, '', '2016-06-08', 'Annual', NULL, 'Cancelled', '2016-06-10', '3'),
('d62ce932-f521-19b1-b0d8-582316c17a44', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('d9037273-5c86-76e2-935d-5823202de7f3', NULL, NULL, NULL, '', '2016-11-09', 'Casual', NULL, 'Cancelled', '2016-11-10', '2'),
('dd0f48ef-fb2c-0d12-e9d2-58247d88a1aa', NULL, NULL, NULL, '', '2016-11-10', 'Annual', NULL, 'Cancelled', '2016-11-11', '2'),
('e3436c27-87a9-9f61-9673-58231d657438', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2'),
('e4542d45-2fd1-8601-f0e0-5823209aa9a1', NULL, NULL, NULL, '', '2015-10-06', 'Annual', NULL, 'Cancelled', '2015-10-07', '2'),
('f1517d18-d9cb-61ce-ea23-58230a788f55', NULL, NULL, NULL, '', '2016-11-09', 'Annual', NULL, 'Cancelled', '2016-11-10', '2');

-- --------------------------------------------------------

--
-- Table structure for table `rt_payroll`
--

CREATE TABLE IF NOT EXISTS `rt_payroll` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_payroll`
--

INSERT INTO `rt_payroll` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `document_name`, `filename`, `file_ext`, `file_mime_type`, `active_date`, `exp_date`, `category_id`, `subcategory_id`, `status_id`, `month`, `year`) VALUES
('1111e629-420d-cdbb-4c7a-582ee77868fd', NULL, NULL, '1', '1', NULL, 0, NULL, 'Payroll of today 15  2 2000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2000'),
('126b9920-727b-6d3d-81a7-582af23bfd4e', NULL, NULL, '1', '1', NULL, 0, NULL, 'Payroll of test  husy  3 2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2017'),
('1bd14428-0219-5834-c306-582af270f61e', NULL, NULL, '1', '1', NULL, 0, NULL, 'Payroll of today 15  3 2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2017'),
('21748c82-51d2-6e81-7fbc-582af26748a8', NULL, NULL, '1', '1', NULL, 0, NULL, 'Payroll of test  salary 14  3 2017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '3', '2017'),
('9939abb9-824b-3da2-1b2a-582ee98b9a69', NULL, NULL, '1', '1', NULL, 0, NULL, 'Payroll of test  husy  6 2040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '2040'),
('a1a0ece8-d07a-8767-96d5-582ee9984f78', NULL, NULL, '1', '1', NULL, 0, NULL, 'Payroll of today 15  6 2040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '2040'),
('a63be910-bbe7-649c-453a-582ee95585d6', NULL, NULL, '1', '1', NULL, 0, NULL, 'Payroll of test  salary 14  6 2040', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '2040'),
('dc84e3c0-4193-dfb2-9b5b-582af3acd184', NULL, NULL, '1', '1', NULL, 0, NULL, 'Payroll of today 15  1 2005', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2005');

-- --------------------------------------------------------

--
-- Table structure for table `rt_payroll_audit`
--

CREATE TABLE IF NOT EXISTS `rt_payroll_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_payroll_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_payroll_cstm`
--

CREATE TABLE IF NOT EXISTS `rt_payroll_cstm` (
  `id_c` char(36) NOT NULL,
  `abc_c` text,
  `button_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_payroll_cstm`
--

INSERT INTO `rt_payroll_cstm` (`id_c`, `abc_c`, `button_c`) VALUES
('1111e629-420d-cdbb-4c7a-582ee77868fd', '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', NULL),
('126b9920-727b-6d3d-81a7-582af23bfd4e', '4293caf3-8658-7509-b509-58299d9743d6', NULL),
('1bd14428-0219-5834-c306-582af270f61e', '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', NULL),
('21748c82-51d2-6e81-7fbc-582af26748a8', 'c176d323-e9eb-0c9a-1c44-58299c7c1ff2', NULL),
('9939abb9-824b-3da2-1b2a-582ee98b9a69', '4293caf3-8658-7509-b509-58299d9743d6', NULL),
('a1a0ece8-d07a-8767-96d5-582ee9984f78', '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', NULL),
('a63be910-bbe7-649c-453a-582ee95585d6', 'c176d323-e9eb-0c9a-1c44-58299c7c1ff2', NULL),
('dc84e3c0-4193-dfb2-9b5b-582af3acd184', '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_pay_track`
--

CREATE TABLE IF NOT EXISTS `rt_pay_track` (
  `id` varchar(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `employee_id` varchar(36) DEFAULT NULL,
  `payroll_id` varchar(36) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `salary` varchar(9000) DEFAULT NULL,
  `bonus` int(100) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `provident` double DEFAULT NULL,
  `casual_leaves` int(100) DEFAULT NULL,
  `annual_leaves` int(100) DEFAULT NULL,
  `casual_balance` int(100) DEFAULT NULL,
  `annual_balance` int(100) DEFAULT NULL,
  `salary_paid` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_pay_track`
--

INSERT INTO `rt_pay_track` (`id`, `date_entered`, `employee_id`, `payroll_id`, `month`, `year`, `salary`, `bonus`, `tax`, `provident`, `casual_leaves`, `annual_leaves`, `casual_balance`, `annual_balance`, `salary_paid`) VALUES
('19e9bfc9-e950-07e5-562b-582af224bd1d', '2016-11-15 16:32:06', '4293caf3-8658-7509-b509-58299d9743d6', '126b9920-727b-6d3d-81a7-582af23bfd4e', '3', '2017', 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"10000";s:7:"taxable";N;}s:4:"rent";a:2:{s:6:"amount";s:4:"5000";s:7:"taxable";N;}}', 0, 0, 0, 6, 10, 6, 10, 15000),
('1aeac2dd-ffc0-8083-a641-582ee7e06fac', '2016-11-18 16:37:11', '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', '1111e629-420d-cdbb-4c7a-582ee77868fd', '2', '2000', 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"15000";s:7:"taxable";s:1:"1";}s:4:"rent";a:2:{s:6:"amount";s:4:"5000";s:7:"taxable";N;}}', 0, 200, 2000, 6, 10, 6, 10, 17800),
('1fd7589d-90b7-9a36-f0ee-582af2199a17', '2016-11-15 16:32:06', '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', '1bd14428-0219-5834-c306-582af270f61e', '3', '2017', 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"15000";s:7:"taxable";s:1:"1";}s:4:"rent";a:2:{s:6:"amount";s:4:"5000";s:7:"taxable";N;}}', 0, 200, 2000, 6, 10, 6, 10, 17800),
('25416060-3482-0580-ad6d-582af2e68ebc', '2016-11-15 16:32:06', 'c176d323-e9eb-0c9a-1c44-58299c7c1ff2', '21748c82-51d2-6e81-7fbc-582af26748a8', '3', '2017', 'b:0;', 0, 0, 2000, 6, 10, 6, 10, -2000),
('a04ef0b8-2327-77bf-d145-582ee903aef6', '2016-11-18 16:42:33', '4293caf3-8658-7509-b509-58299d9743d6', '9939abb9-824b-3da2-1b2a-582ee98b9a69', '6', '2040', 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"10000";s:7:"taxable";N;}s:4:"rent";a:2:{s:6:"amount";s:4:"5000";s:7:"taxable";N;}}', 0, 0, 0, 6, 10, 6, 10, 15000),
('a4cfa67d-898b-1548-9014-582ee98bb8d3', '2016-11-18 16:42:33', '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', 'a1a0ece8-d07a-8767-96d5-582ee9984f78', '6', '2040', 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"15000";s:7:"taxable";s:1:"1";}s:4:"rent";a:2:{s:6:"amount";s:4:"5000";s:7:"taxable";N;}}', 0, 200, 2000, 6, 10, 6, 10, 17800),
('a9437da6-4d0d-420b-d331-582ee97995f9', '2016-11-18 16:42:33', 'c176d323-e9eb-0c9a-1c44-58299c7c1ff2', 'a63be910-bbe7-649c-453a-582ee95585d6', '6', '2040', 'b:0;', 0, 0, 2000, 6, 10, 6, 10, -2000),
('e3c1b875-4aa3-d3e1-22dd-582af3727960', '2016-11-15 16:35:33', '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', 'dc84e3c0-4193-dfb2-9b5b-582af3acd184', '1', '2005', 'a:2:{s:5:"basic";a:2:{s:6:"amount";s:5:"15000";s:7:"taxable";s:1:"1";}s:4:"rent";a:2:{s:6:"amount";s:4:"5000";s:7:"taxable";N;}}', 0, 200, 2000, 6, 10, 6, 10, 17800);

-- --------------------------------------------------------

--
-- Table structure for table `rt_pay_tracker`
--

CREATE TABLE IF NOT EXISTS `rt_pay_tracker` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `payroll_id` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `salary` varchar(255) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `tax` float DEFAULT NULL,
  `provident` float DEFAULT NULL,
  `casual_leaves` int(11) DEFAULT NULL,
  `annual_leaves` int(11) DEFAULT NULL,
  `casual_balance` int(11) DEFAULT NULL,
  `annual_balance` int(11) DEFAULT NULL,
  `salary_paid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_pay_tracker`
--

INSERT INTO `rt_pay_tracker` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `employee_id`, `payroll_id`, `month`, `year`, `salary`, `bonus`, `tax`, `provident`, `casual_leaves`, `annual_leaves`, `casual_balance`, `annual_balance`, `salary_paid`) VALUES
('', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'test', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_pay_tracker_audit`
--

CREATE TABLE IF NOT EXISTS `rt_pay_tracker_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_pay_tracker_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_performance_reviews`
--

CREATE TABLE IF NOT EXISTS `rt_performance_reviews` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `form_meta` varchar(255) DEFAULT NULL,
  `rt_emp_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_performance_reviews`
--

INSERT INTO `rt_performance_reviews` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `form_meta`, `rt_emp_id`) VALUES
('20ab7420-a440-9d50-d2b3-58171c81b9e5', 'Review From of husnain zaheer', '2016-10-31 10:29:09', '2016-10-31 10:29:09', NULL, NULL, 'Question: test txt 1\nAnswer: tx ans 1\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('30b71c84-ae2c-1f40-d38a-581713ffc0e0', 'Review From of husnain zaheer', '2016-10-31 09:48:16', '2016-10-31 09:48:16', NULL, NULL, 'Question: q 1 text\nAnswer: text ans 1\nQuestion: q 2 txt\nAnswer: tesxt ans 2\nQuestion: muti 1\nAnswer: txt ans 3\nQuestion: txt 3\nAnswer: \nQuestion: muti two\nAnswer: two\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('3add0b84-d56b-d9d8-ac38-58170ff09679', 'Review From of husnain zaheer', '2016-10-31 09:30:43', '2016-10-31 09:30:43', NULL, NULL, 'Question: asd\nAnswer: asd\nQuestion: ass\nAnswer: asd\nQuestion: asd\nAnswer: \nQuestion: sdsd\nAnswer: ff\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('44155671-ec64-9c0e-de07-5819c650fc73', 'Review From of husnain zaheer', '2016-11-02 10:56:36', '2016-11-02 10:56:36', NULL, NULL, 'Question: safter 500\nAnswer: sdasdasdassadsadasdsadsadsadasd\r\nsdsa\r\ndsa\r\nds\r\nad\r\nasd\r\nsa\r\ndsa\r\nd\r\nasd\nQuestion: m123dsf\nAnswer: f\nQuestion: mm\nAnswer: 1\nQuestion: asd\nAnswer: sdfsdf\nQuestion: qq\nAnswer: sdfdsf\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('50ac8508-08e8-dcb0-6c00-58171ead37a2', 'Review From of husnain zaheer', '2016-10-31 10:34:00', '2016-10-31 10:34:00', NULL, NULL, 'Question: test txt 1\nAnswer: tx ans 1\nQuestion: test text 2\nAnswer: txt ans 2\nQuestion: etst muti 1\nAnswer: 1\nQuestion: test text 3\nAnswer: txt ans 3\nQuestion: test mutli 2\nAnswer: two\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('547eca63-0f58-4b49-ae40-581864f6dd36', 'Review From of husnain zaheer', '2016-11-01 09:48:11', '2016-11-01 09:48:11', NULL, NULL, 'Question: hoe flexible the employee is ?\nAnswer: ksad asdasdasd\nQuestion: how much he technically sound ?\nAnswer: 3\nQuestion: what are your genral comments\nAnswer: sdasdffg sdfsdgbv\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('6a1dc9e9-c5e7-b784-fe11-581334302afd', 'Review From of husnain zaheer', '2016-10-28 11:19:19', '2016-10-28 11:19:19', NULL, NULL, 'Question: asdsa\nAnswer: asdasd\nQuestion: asd\nAnswer: asddd\nQuestion: asd\nAnswer: ss\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('7ed10500-20e7-05e8-f6ae-58171dbb9e2b', 'Review From of husnain zaheer', '2016-10-31 10:31:41', '2016-10-31 10:31:41', NULL, NULL, 'Question: test txt 1\nAnswer: tx ans 1\nQuestion: test text 2\nAnswer: txt ans 2\nQuestion: etst muti 1\nAnswer: 1\nQuestion: test text 3\nAnswer: txt ans 3\nQuestion: test mutli 2\nAnswer: two\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('8e545015-dcae-5d1c-59e4-581719f6c3f7', 'Review From of husnain zaheer', '2016-10-31 10:13:28', '2016-10-31 10:13:28', NULL, NULL, '', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('904e660c-aabd-f146-f604-5818456e24f5', 'Review From of husnain zaheer', '2016-11-01 07:36:08', '2016-11-01 07:36:08', NULL, NULL, 'Question: mutli 1\nAnswer: 1\nQuestion: text 1\nAnswer: ans text 1\nQuestion: test text\nAnswer: tes ansd\nQuestion: my mutli\nAnswer: m3\nQuestion: test final\nAnswer: final ans\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('9491132d-e68a-fcc9-40f7-581714c715a5', 'Review From of husnain zaheer', '2016-10-31 09:53:31', '2016-10-31 09:53:31', NULL, NULL, 'Question: q 1 text\nAnswer: ans 1\nQuestion: q 2 txt\nAnswer: txt ans 2\nQuestion: muti 1\nAnswer: txt ans 3\nQuestion: txt 3\nAnswer: \nQuestion: muti two\nAnswer: two\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('97e865ac-22a5-1ff2-df90-581715d4f49b', 'Review From of husnain zaheer', '2016-10-31 09:58:20', '2016-10-31 09:58:20', NULL, NULL, 'Question: test txt 1\nAnswer: text ans 1\nQuestion: test text 2\nAnswer: tesxt ans 2\nQuestion: etst muti 1\nAnswer: text ans 3\nQuestion: test text 3\nAnswer: two\nQuestion: test mutli 2\nAnswer: \n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('b0d39a28-c9e6-ffa3-522c-581842ebcd40', 'Review From of husnain zaheer', '2016-11-01 07:22:40', '2016-11-01 07:22:40', NULL, NULL, 'Question: text 1\nAnswer: ans 1\nQuestion: multi 1\nAnswer: 1\nQuestion: text 2\nAnswer: ans 2\nQuestion: muti ab\nAnswer: b\nQuestion: agaim muti \nAnswer: ff\nQuestion: text final\nAnswer: final ans\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('b402ba7a-4465-7d11-666b-58170ec2131b', 'Review From of husnain zaheer', '2016-10-31 09:29:30', '2016-10-31 09:29:30', NULL, NULL, 'Question: asd\nAnswer: asssssss\nQuestion: ass\nAnswer: aaaaaaaaa\nQuestion: asd\nAnswer: \nQuestion: sdsd\nAnswer: asad\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('b7171cd0-1ad5-76a2-9251-58171d91f3f7', 'Review From of husnain zaheer', '2016-10-31 10:33:21', '2016-10-31 10:33:21', NULL, NULL, 'Question: test txt 1\nAnswer: tx ans 1\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('c0c97261-6114-91c5-0b6f-581a00a1727e', 'Review From of husnain zaheer', '2016-11-02 15:04:53', '2016-11-02 15:04:53', NULL, NULL, 'Question: asd\nAnswer: aaa\nQuestion: asdd\nAnswer: bbb\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('cae605be-2728-03f3-a219-58171c55296b', 'Review From of husnain zaheer', '2016-10-31 10:25:50', '2016-10-31 10:25:50', NULL, NULL, 'Question: test txt 1\nAnswer: txt ans 1\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('caeb0410-1ec1-b2e0-5e34-581716157211', 'Review From of husnain zaheer', '2016-10-31 09:59:47', '2016-10-31 09:59:47', NULL, NULL, 'Question: test txt 1\nAnswer: text ans 1\nQuestion: test text 2\nAnswer: tesxt ans 2\nQuestion: etst muti 1\nAnswer: text ans 3\nQuestion: test text 3\nAnswer: two\nQuestion: test mutli 2\nAnswer: \n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('d11b22e2-3750-b53a-3853-58185d868d92', 'Review From of husnain zaheer', '2016-11-01 09:18:41', '2016-11-01 09:18:41', NULL, NULL, 'Question: text 1\nAnswer: text ans 1\nQuestion: mmm1\nAnswer: 1\nQuestion: test 2\nAnswer: txt ands 2\nQuestion: multi 2\nAnswer: 22\nQuestion: multi abc\nAnswer: c\nQuestion: text 3\nAnswer: ans 3 final\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('daa92b7e-edca-cd49-3cdf-581ada902533', 'Review From of husnain zaheer 2016-11-03 11:32:51', '2016-11-03 06:32:51', '2016-11-03 06:32:51', NULL, NULL, 'Question: hoe flexible the employee is ?\nAnswer: asdsaddd\nQuestion: how much he technically sound ?\nAnswer: 3\nQuestion: what are your genral comments\nAnswer: aaaaaaaaaaaaaaaaaaaaaaaaaaaa\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('e4d9fc12-52af-75a2-9863-581716dbb6af', 'Review From of husnain zaheer', '2016-10-31 10:02:31', '2016-10-31 10:02:31', NULL, NULL, 'Question: test txt 1\nAnswer: txt ans 1\nQuestion: test text 2\nAnswer: txt ans 2\nQuestion: etst muti 1\nAnswer: txt ans 3\nQuestion: test text 3\nAnswer: \nQuestion: test mutli 2\nAnswer: two\n', 0, NULL, NULL, 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('e75513f0-fe76-acb1-52b5-58133e4da41f', 'Review From of no  supervisor', '2016-10-28 12:02:12', '2016-10-28 12:02:12', NULL, NULL, 'Question: asdsa\nAnswer: aaaa\nQuestion: asd\nAnswer: asdd\nQuestion: asd\nAnswer: as\n', 0, NULL, NULL, 'edd472fe-febf-e96a-a2e7-58133c6c50f6');

-- --------------------------------------------------------

--
-- Table structure for table `rt_performance_reviews_audit`
--

CREATE TABLE IF NOT EXISTS `rt_performance_reviews_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_performance_reviews_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_qualifications`
--

CREATE TABLE IF NOT EXISTS `rt_qualifications` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_qualifications`
--

INSERT INTO `rt_qualifications` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `parent_type`, `parent_id`) VALUES
('270b4d59-e47b-9b53-3863-5808b51c4b3e', '', '2016-10-20 12:15:27', '2016-10-20 12:15:27', '1', '1', NULL, 0, NULL, 'RT_Employees', '380d7c06-497a-f0e2-e02a-580497b91089'),
('29660fce-d9f9-e5bd-6a84-5808b2beb429', '', '2016-10-20 12:03:40', '2016-10-20 12:03:40', '1', '1', NULL, 0, NULL, 'RT_Employees', 'd0e3ea77-656a-ef74-e175-5804b99ed1a0'),
('34cfac72-ce5b-6104-020f-5808b407a60e', '', '2016-10-20 12:12:44', '2016-10-20 12:12:44', '1', '1', NULL, 0, NULL, 'RT_Employees', 'cbc44f6d-7fde-b86e-4840-5807169cff66'),
('a6c41491-3017-82a6-6f7b-5808b3105e88', '', '2016-10-20 12:07:49', '2016-10-20 12:07:49', '1', '1', NULL, 0, NULL, 'RT_Employees', 'd0e3ea77-656a-ef74-e175-5804b99ed1a0');

-- --------------------------------------------------------

--
-- Table structure for table `rt_qualifications_audit`
--

CREATE TABLE IF NOT EXISTS `rt_qualifications_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_qualifications_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_qualifications_cstm`
--

CREATE TABLE IF NOT EXISTS `rt_qualifications_cstm` (
  `id_c` char(36) NOT NULL,
  `comments_c` text,
  `company_c` varchar(255) DEFAULT NULL,
  `ends_c` date DEFAULT NULL,
  `end_date_c` date DEFAULT NULL,
  `from_skill_c` date DEFAULT NULL,
  `gpa_score_c` varchar(255) DEFAULT NULL,
  `institute_c` varchar(255) DEFAULT NULL,
  `job_title_c` varchar(255) DEFAULT NULL,
  `level_c` varchar(255) DEFAULT NULL,
  `qualification_type_c` varchar(100) DEFAULT 'Work_Experience',
  `skill_c` varchar(255) DEFAULT NULL,
  `skill_comment_c` text,
  `skill_institute_c` varchar(255) DEFAULT NULL,
  `specialization_c` varchar(255) DEFAULT NULL,
  `start_c` date DEFAULT NULL,
  `start_date_c` date DEFAULT NULL,
  `to_skill_c` date DEFAULT NULL,
  `years_of_experience_c` varchar(255) DEFAULT NULL,
  `year_c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_c`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_qualifications_cstm`
--

INSERT INTO `rt_qualifications_cstm` (`id_c`, `comments_c`, `company_c`, `ends_c`, `end_date_c`, `from_skill_c`, `gpa_score_c`, `institute_c`, `job_title_c`, `level_c`, `qualification_type_c`, `skill_c`, `skill_comment_c`, `skill_institute_c`, `specialization_c`, `start_c`, `start_date_c`, `to_skill_c`, `years_of_experience_c`, `year_c`) VALUES
('270b4d59-e47b-9b53-3863-5808b51c4b3e', '', '', NULL, '2016-10-20', '2016-10-20', '', '', '', '', 'Skills', 'safdas', 'asfsaf', 'ascfsafd', '', NULL, '2016-10-20', '2016-11-15', 'sadas', NULL),
('29660fce-d9f9-e5bd-6a84-5808b2beb429', '', '', NULL, '2016-10-20', '2016-10-20', '', '', '', '', 'Skills', 'IT php', 'asdfa comment ', 'Uni', '', NULL, '2016-10-20', '2016-10-27', '2', NULL),
('34cfac72-ce5b-6104-020f-5808b407a60e', 'asd ascasdfc', 'asda', NULL, '2016-10-29', '2016-10-20', '', '', 'asdsad', '', 'Work_Experience', '', '', '', '', NULL, '2016-10-20', '2016-10-21', '', NULL),
('a6c41491-3017-82a6-6f7b-5808b3105e88', '', '', '2016-11-24', '2016-10-20', '2016-10-20', '3.5', 'UNI', '', '16 years', 'Education', '', '', '', 'IT php', '2016-10-09', '2016-10-20', '2016-10-21', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rt_review_forms`
--

CREATE TABLE IF NOT EXISTS `rt_review_forms` (
  `id` varchar(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `form_meta` varchar(10000) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_idindex` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_review_forms`
--

INSERT INTO `rt_review_forms` (`id`, `date_entered`, `user_id`, `form_meta`, `name`) VALUES
('1c7d83bd-6311-e7a1-5643-5819d89148fe', '2016-11-02 17:12:34', '1', '[]', 'test edit'),
('1e5bb82f-7bdf-81ec-4cbc-58132d3d4fa8', '2016-10-28 15:48:53', NULL, '[{"question":"asdsa","type":"text_area"},{"question":"asd","type":"text_area"},{"question":"asd","type":"mutliple_choice","options":["as","ss"]}]', 'hello form'),
('26aec49e-d6c3-63c3-aaa0-581712f9727a', '2016-10-31 14:42:31', '1', '[{"question":"q 1 text","type":"text_area"},{"question":"q 2 txt","type":"text_area"},{"question":"muti 1","type":"mutliple_choice","options":["2","1"]},{"question":"txt 3","type":"text_area"},{"question":"muti two","type":"mutliple_choice","options":["two","oine"]}]', 'test husy'),
('2a3400ae-cb23-6e8d-3657-5818614054f2', '2016-11-01 14:35:31', '1', '{"0":{"question":"q 1","type":"text_area"},"2":{"question":"sadddd","type":"mutliple_choice","options":["aa","dd","sad"]}}', 'test 1122'),
('2b6927b7-9d53-c629-0ac0-5819f9c9e5b4', '2016-11-02 20:00:14', '1', '[{"question":"asd","type":"text_area"},{"question":"asddd","type":"text_area"}]', 'qaqa'),
('2d37eb91-bf66-aed3-b146-5819da1433fa', '2016-11-02 17:21:07', '1', '[]', 'test edit'),
('2ea04fe5-a542-706b-952c-5819ff0d45a0', '2016-11-02 20:03:50', '1', '[{"question":"asd","type":"text_area"},{"question":"asdd","type":"text_area"}]', 'ttya'),
('32cc0432-82f1-1d7e-698e-5818450c6e48', '2016-11-01 12:34:34', '1', '{"0":{"question":"mutli 1","type":"mutliple_choice","options":["2","1"]},"2":{"question":"text 1","type":"text_area"},"4":{"question":"test text","type":"text_area"},"5":{"question":"my mutli","type":"mutliple_choice","options":["m3","m2","m1"]},"6":{"question":"test final","type":"text_area"}}', 'test tricky '),
('34866ab0-a271-cc5c-09ed-5818629235d8', '2016-11-01 14:39:44', '1', '[{"question":"hoe flexible the employee is ?","type":"text_area"},{"question":"how much he technically sound ?","type":"mutliple_choice","options":["4","3","2","1"]},{"question":"what are your genral comments","type":"text_area"}]', 'software engineer performance review form'),
('35eb10d2-7815-b2b4-b86c-581840229d77', '2016-11-01 12:14:47', '1', '[{"question":"test mutli 111","type":"mutliple_choice","options":["11"]},{"question":"text 111","type":"text_area"},{"question":"mutli ab","type":"mutliple_choice","options":["bb","aa"]},{"question":"text lats","type":"text_area"}]', 'test submit'),
('381294f6-8c70-19f7-9bfd-58183edc6916', '2016-11-01 12:06:03', '1', '{"0":{"question":"asfdsa","type":"text_area"},"1":{"question":"mmm choice","type":"mutliple_choice"},"3":{"question":"text 22","type":"text_area"},"4":{"question":"mutlii 22","type":"mutliple_choice","options":["22","11"]}}', 'test after'),
('3c152bd4-81de-ba75-3c08-5819baa70d96', '2016-11-02 15:04:06', '1', '[{"question":"afetr edd","type":"text_area"}]', 'test edit'),
('3cef458f-759b-ec35-354c-5819de154b1f', '2016-11-02 17:40:03', '1', '[]', 'test edit'),
('3eb6d4f6-740c-a7ee-5f5c-5819e0437f06', '2016-11-02 17:47:20', '1', '[]', 'qqq'),
('403370d9-b113-02a1-f9cc-5819d9c54c5c', '2016-11-02 17:19:36', '1', '[]', 'test edit'),
('46007034-3009-83b8-4999-5819b98f6e42', '2016-11-02 15:01:01', '1', '[{"question":"qq","type":"text_area"},{"question":"asd","type":"text_area"},{"question":"mm","type":"mutliple_choice","options":["2","1"]},{"question":"m123dsf","type":"mutliple_choice","options":["s","f","a"]}]', 'test edit'),
('491d49b2-ee36-1fd2-971c-5819faab0ad2', '2016-11-02 19:37:48', '1', '[{"question":"sad","type":"text_area"},{"question":"sd","type":"text_area"},{"question":"saddss","type":"text_area"},{"question":"sss","type":"text_area"}]', 'qaaq'),
('4acdb454-cbdf-46ec-e78c-5819ddd860b7', '2016-11-02 17:37:19', '1', '[]', 'pp'),
('4b15d691-8748-87c6-d06c-5819e122d0e3', '2016-11-02 17:51:25', '1', '[]', 'vv'),
('4e10d12a-a9cd-e8a3-1b7b-58183d1b173a', '2016-11-01 11:59:03', '1', '[{"question":"","type":"text_area"},{"question":"","type":"text_area"}]', 'dsfs'),
('4fc1b989-b744-1986-d3ec-5819cd0e6549', '2016-11-02 16:26:08', '1', '[]', 'test edit'),
('52c51a48-1cdc-9b12-8ddf-5813291ff3f0', '2016-10-28 15:34:08', NULL, '[{"question":"asdas","type":"text_area"},{"question":"asdsad","type":"text_area"},{"question":"asd","type":"mutliple_choice","options":["asdd","asd","sad"]},{"question":"asddd","type":"mutliple_choice","options":["fdfsfsa","addd"]}]', 'test form table'),
('53887dd4-d834-8c7d-263a-5819d836b2f1', '2016-11-02 17:12:01', '1', '[]', 'test edit'),
('57d2225f-90db-cae7-abda-5819d7a002c5', '2016-11-02 17:08:09', '1', '[]', 'test edit'),
('5b6dbc62-0d9d-1250-43fc-5819de98d4d5', '2016-11-02 17:39:22', '1', '[]', 'hh'),
('5c883b3d-4737-8df9-2af3-5816ec4dc75b', '2016-10-31 12:01:50', '1', '{"0":{"question":"asd","type":"text_area"},"1":{"question":"asddd","type":"text_area"},"3":{"question":"add","type":"mutliple_choice","options":["qqq","dd","saddd"]},"5":{"question":"mmmm","type":"mutliple_choice","options":["mmm222","mmm111"]}}', 'final test'),
('5e2d1a3e-a615-3a87-71bd-5819c54cb042', '2016-11-02 15:53:46', '1', '{"0":{"question":"safter 500","type":"text_area"},"497":{"question":"m123dsf","type":"mutliple_choice","options":["s","f","a"]},"498":{"question":"mm","type":"mutliple_choice","options":["2","1"]},"499":{"question":"asd","type":"text_area"},"500":{"question":"qq","type":"text_area"}}', 'test edit'),
('60c293a8-fd19-658f-6c60-5819ddcb2186', '2016-11-02 17:34:21', '1', '[]', 'tatata'),
('61365045-1709-d994-b4c1-5819e0994f14', '2016-11-02 17:47:57', '1', '[]', 'sad'),
('615d617a-a556-372a-cc7b-5819df58ae2f', '2016-11-02 17:44:19', '1', '[]', 'qwerty'),
('63fcbd5d-967a-4713-bdbe-5819d70fbe7c', '2016-11-02 17:09:43', '1', '[]', 'test edit'),
('6bf49da5-3ed6-beb6-61d1-5819deb5dafb', '2016-11-02 17:38:38', '1', '[]', 'hh'),
('6f04853f-3641-2e54-44dd-5819ce92681c', '2016-11-02 16:29:34', '1', '[]', 'test edit'),
('72134cb9-430b-0072-9653-5819dd6118c4', '2016-11-02 17:34:51', '1', '[]', 'qw'),
('7378f1fd-6871-0881-b38e-5818421b0a95', '2016-11-01 12:20:39', '1', '{"0":{"question":"text 1","type":"text_area"},"1":{"question":"multi 1","type":"mutliple_choice","options":["3","2","1"]},"2":{"question":"text 2","type":"text_area"},"4":{"question":"muti ab","type":"mutliple_choice","options":["c","b","a"]},"5":{"question":"agaim muti ","type":"mutliple_choice","options":["ff","dd","asd"]},"6":{"question":"text final","type":"text_area"}}', 'test complete 111'),
('74bf0dde-35e0-bcff-407f-5819e54322b1', '2016-11-02 18:08:18', '1', '[]', 'test edit'),
('7530b4b3-70eb-df8f-341c-5819def54988', '2016-11-02 17:40:32', '1', '[]', 'hh'),
('80381a12-fc53-323a-9487-5819dea9e44d', '2016-11-02 17:38:53', '1', '[]', 'hh'),
('84fdecf8-a5dd-a8b3-46b7-5819fa8dc797', '2016-11-02 19:38:55', '1', '[{"question":"dsaf","type":"text_area"},{"question":"asd","type":"text_area"},{"question":"asddd","type":"text_area"}]', 'test edit'),
('862f0466-6302-5d61-0359-5819d9581ab4', '2016-11-02 17:16:10', '1', '[]', 'test edit'),
('8b3b029b-5c15-e4bc-0fef-58185db84381', '2016-11-01 14:17:12', '1', '[{"question":"text 1","type":"text_area"},{"question":"mmm1","type":"mutliple_choice","options":["3","2","1"]},{"question":"test 2","type":"text_area"},{"question":"multi 2","type":"mutliple_choice","options":["122","22"]},{"question":"multi abc","type":"mutliple_choice","options":["v","c","a"]},{"question":"text 3","type":"text_area"}]', 'test 1122'),
('8f9aa72f-891f-6c52-dc91-581343844746', '2016-10-28 17:23:01', '1', '[{"question":"asdsad","type":"text_area"},{"question":"asdfsaf","type":"text_area"}]', 'test form aaa'),
('902dc51e-16ad-a3f6-fa6e-5817150b19db', '2016-10-31 14:57:15', '1', '[{"question":"test txt 1","type":"text_area"},{"question":"test text 2","type":"text_area"},{"question":"etst muti 1","type":"mutliple_choice","options":["2","1"]},{"question":"test text 3","type":"text_area"},{"question":"test mutli 2","type":"mutliple_choice","options":["two","one "]}]', 'wwww'),
('97057ae8-24d5-f4ea-6515-5819da3d0386', '2016-11-02 17:21:37', '1', '[]', 'test edit'),
('9a725466-7bf2-0978-1088-5813586f7c2c', '2016-10-28 18:54:50', '1', '[{"question":"rfghhdf","type":"text_area"},{"question":"sdf","type":"mutliple_choice"}]', 'test bla bla'),
('9c3000a3-9c75-516c-246a-5819e57fb8a9', '2016-11-02 18:08:03', '1', '[]', 'mgm'),
('9c759d9a-59f9-09b5-d40e-5819cf0c06ea', '2016-11-02 16:35:21', '1', '[]', 'test edit'),
('9c86cf5b-59ca-901a-592d-5819d72e778a', '2016-11-02 17:10:33', '1', '[]', 'test edit'),
('a59c3b0c-41ea-3efc-24cb-5819ddb78ece', '2016-11-02 17:33:04', '1', '[]', 'test edit'),
('a6326df9-c72d-0604-0b41-5819e2dde76d', '2016-11-02 17:57:13', '1', '[]', 'mgm'),
('ab9b77bd-c5f3-018a-90da-5819d31fa69f', '2016-11-02 16:53:07', '1', '[]', 'test edit'),
('ad4efcea-d79e-46fe-1236-5819e21f045d', '2016-11-02 17:57:02', '1', '[]', 'mgm'),
('afcb7a7c-4310-d1c2-1606-5819d893bbcf', '2016-11-02 17:13:38', '1', '[]', 'test edit'),
('b5990b04-40f0-0cec-d8e3-5819e630a9d8', '2016-11-02 18:15:00', '1', '[]', 'test edit'),
('b88a7a53-cb4f-7d1e-6e97-5819e16bbf89', '2016-11-02 17:51:35', '1', '[]', 'vv'),
('bf5878cf-5138-d718-1b9e-5819d778e46c', '2016-11-02 17:11:13', '1', '[]', 'test edit'),
('c36305a4-8201-8165-863d-58170e253131', '2016-10-31 14:28:37', '1', '[{"question":"asd","type":"text_area"},{"question":"ass","type":"mutliple_choice","options":["ff","ass"]},{"question":"asd","type":"text_area"},{"question":"sdsd","type":"mutliple_choice","options":["sdf","ff","asad"]}]', 'hello abc'),
('c438c91c-39f6-427c-c038-5819ddf337e7', '2016-11-02 17:34:11', '1', '[]', 'tatata'),
('c5eea11a-f7c9-cc76-3ac3-5819dd073a2e', '2016-11-02 17:33:34', '1', '[]', 'test edit'),
('cc83c6e3-6c86-3182-447c-58132c6b1ce2', '2016-10-28 15:44:31', NULL, '[{"question":"sadfa","type":"text_area"},{"question":"safasf","type":"text_area"},{"question":"asfa","type":"text_area"}]', 'test again'),
('cdeb8289-c209-a11c-6dd3-581acecb83f5', '2016-11-03 10:41:29', '1', '[{"question":"asd","type":"text_area"},{"question":"aaa","type":"text_area"},{"question":"ccc","type":"text_area"},{"question":"asdsd","type":"mutliple_choice","options":["asd","ddd","as"]}]', 'test template'),
('d289dedc-9b65-5755-909f-5819ddf20190', '2016-11-02 17:33:46', '1', '[]', 'test edit'),
('d4a31d74-0dd1-8e00-6ba7-5819ce0d0a76', '2016-11-02 16:30:12', '1', '[]', 'aaaaaa'),
('d87b469e-aba6-ff5a-db50-5819d8ea2983', '2016-11-02 17:14:14', '1', '[]', 'test edit'),
('dab3ceb0-0857-7c8f-f408-581332b0bad2', '2016-11-10 19:13:19', '1', '[{"question":"asd","type":"text_area"}]', 'asd'),
('e0a70dd6-39cf-de2f-97a8-5819d90edb38', '2016-11-02 17:19:06', '1', '[]', 'test edit'),
('e2790fc6-af74-8ead-5ae7-5819e1c9d8a1', '2016-11-02 17:51:11', '1', '[]', 'wqwqw'),
('e44e0869-f249-8309-63af-5819d4b7c795', '2016-11-02 16:56:26', '1', '[]', 'test edit'),
('e5c6963a-ded8-2533-9bb5-5819d88c0a21', '2016-11-02 17:15:04', '1', '[]', 'test edit'),
('e6bffca1-a4de-480b-4643-5819dd5f3243', '2016-11-02 17:37:09', '1', '[]', 'pp'),
('e81c4d65-31dd-218c-ebb2-5816e98abb84', '2016-10-31 11:47:58', '1', '[]', 'sdf'),
('e8b156ff-9537-1e3f-566e-5819cf83d683', '2016-11-02 16:33:52', '1', '[]', 'test edit'),
('ea287e83-4cf5-3d77-91ac-5819def7994d', '2016-11-02 17:38:45', '1', '[]', 'hh'),
('eaac16cd-4836-657a-b2ab-5819d7efdfcf', '2016-11-02 17:07:50', '1', '[]', 'test edit'),
('edab2d3c-a897-4bdb-8243-5819de1f843b', '2016-11-02 17:41:02', '1', '[]', 'zaza');

-- --------------------------------------------------------

--
-- Table structure for table `rt_salarysetting`
--

CREATE TABLE IF NOT EXISTS `rt_salarysetting` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tax_rate` float DEFAULT NULL,
  `provident_fund` int(11) DEFAULT NULL,
  `sal_from` int(11) DEFAULT NULL,
  `sal_to` int(11) DEFAULT NULL,
  `fix_amount` int(11) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rt_salarysetting`
--

INSERT INTO `rt_salarysetting` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `tax_rate`, `provident_fund`, `sal_from`, `sal_to`, `fix_amount`, `country`) VALUES
('125a0605-8f0a-76bc-cbc3-582f02d7c932', NULL, '2016-11-18 18:29:23', '2016-11-18 18:29:23', NULL, NULL, NULL, 0, NULL, 8, 15, 50000, 80000, 0, 'CANADA'),
('28d37cbd-03a6-beb6-3797-582f02f0ece0', NULL, '2016-11-18 18:30:17', '2016-11-18 18:30:17', NULL, NULL, NULL, 0, NULL, 4, 12, 2000, 20000, 0, 'UNITED KINGDOM'),
('b400041a-43c1-11c9-053b-582f02d0e1d0', NULL, '2016-11-18 18:29:23', '2016-11-18 18:29:23', NULL, NULL, NULL, 0, NULL, 5, 15, 1500, 54444, 0, 'CANADA'),
('eeaba470-22f9-377a-2383-582f029bc502', NULL, '2016-11-18 18:31:39', '2016-11-18 18:31:39', NULL, NULL, NULL, 0, NULL, 0, 4, 2000, 20000, 0, 'USA'),
('ef1455ad-f9ae-9be5-b623-582f02f15c43', NULL, '2016-11-18 18:31:39', '2016-11-18 18:31:39', NULL, NULL, NULL, 0, NULL, 0, 4, 20001, 50000, 0, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `rt_salarysetting_audit`
--

CREATE TABLE IF NOT EXISTS `rt_salarysetting_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_rt_salarysetting_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE IF NOT EXISTS `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `schedulers`
--

CREATE TABLE IF NOT EXISTS `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedulers`
--

INSERT INTO `schedulers` (`id`, `deleted`, `date_entered`, `date_modified`, `created_by`, `modified_user_id`, `name`, `job`, `date_time_start`, `date_time_end`, `job_interval`, `time_from`, `time_to`, `last_run`, `status`, `catch_up`) VALUES
('18fce0c7-5449-1364-f239-5821728066c6', 0, '2016-11-08 06:38:26', '2016-11-08 06:48:21', '1', '1', 'Leaves balance update', 'function::balance_update_job', '2005-01-01 06:45:00', NULL, '*/5::*::*::*::*', NULL, NULL, '2016-11-08 06:51:30', 'Active', 1),
('8d47c0bd-951c-583d-64e0-58047f1ae17e', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Process Workflow Tasks', 'function::processAOW_Workflow', '2015-01-01 12:45:01', NULL, '*::*::*::*::*', NULL, NULL, '2016-11-08 06:51:30', 'Active', 1),
('8fcec88a-1af6-ac6e-7a20-58047fafea1a', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Run Report Generation Scheduled Tasks', 'function::aorRunScheduledReports', '2015-01-01 07:00:01', NULL, '*::*::*::*::*', NULL, NULL, '2016-11-08 06:51:30', 'Active', 1),
('92364c78-f2e0-d21a-051b-58047f52b6bc', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Prune Tracker Tables', 'function::trimTracker', '2015-01-01 07:00:01', NULL, '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1),
('947bf415-afed-06b1-dcfe-58047fd331e1', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Check Inbound Mailboxes', 'function::pollMonitoredInboxesAOP', '2015-01-01 14:15:01', NULL, '*::*::*::*::*', NULL, NULL, '2016-11-08 06:51:30', 'Active', 0),
('96e06a4d-1819-8761-94ad-58047f7d9548', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Run Nightly Process Bounced Campaign Emails', 'function::pollMonitoredInboxesForBouncedCampaignEmails', '2015-01-01 17:30:01', NULL, '0::2-6::*::*::*', NULL, NULL, '2016-11-08 06:43:01', 'Active', 1),
('98ecb86b-aaed-b902-640a-58047f3b0f3a', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Run Nightly Mass Email Campaigns', 'function::runMassEmailCampaign', '2015-01-01 10:15:01', NULL, '0::2-6::*::*::*', NULL, NULL, '2016-11-08 06:43:01', 'Active', 1),
('9b2094a5-8740-a195-871e-58047fbf599a', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Prune Database on 1st of Month', 'function::pruneDatabase', '2015-01-01 07:45:01', NULL, '0::4::1::*::*', NULL, NULL, NULL, 'Inactive', 0),
('9d9dcea8-bfdd-8153-7a6c-58047f5f7a0f', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Perform Lucene Index', 'function::aodIndexUnindexed', '2015-01-01 11:30:01', NULL, '0::0::*::*::*', NULL, NULL, NULL, 'Active', 0),
('9fcaa358-4e9e-b577-98ab-58047fd3a671', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Optimise AOD Index', 'function::aodOptimiseIndex', '2015-01-01 11:45:01', NULL, '0::*/3::*::*::*', NULL, NULL, NULL, 'Active', 0),
('a1e2eac4-36e3-073e-8dfb-58047f99e8a7', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Run Email Reminder Notifications', 'function::sendEmailReminders', '2015-01-01 11:15:01', NULL, '*::*::*::*::*', NULL, NULL, '2016-11-08 06:51:30', 'Active', 0),
('a42bfef5-4fb7-e7eb-3a5e-58047fe73f33', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Clean Jobs Queue', 'function::cleanJobQueue', '2015-01-01 10:15:01', NULL, '0::5::*::*::*', NULL, NULL, NULL, 'Active', 0),
('a64c1a58-a738-f96e-0a8e-58047fc45464', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Removal of documents from filesystem', 'function::removeDocumentsFromFS', '2015-01-01 13:30:01', NULL, '0::3::1::*::*', NULL, NULL, NULL, 'Active', 0),
('a85d64b3-0e34-1fac-dfc5-58047fdbf806', 0, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '1', 'Prune SuiteCRM Feed Tables', 'function::trimSugarFeeds', '2015-01-01 19:45:01', NULL, '0::2::1::*::*', NULL, NULL, NULL, 'Active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups`
--

CREATE TABLE IF NOT EXISTS `securitygroups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_acl_roles`
--

CREATE TABLE IF NOT EXISTS `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_audit`
--

CREATE TABLE IF NOT EXISTS `securitygroups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_default`
--

CREATE TABLE IF NOT EXISTS `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_records`
--

CREATE TABLE IF NOT EXISTS `securitygroups_records` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `record_id` char(36) DEFAULT NULL,
  `module` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `securitygroups_users`
--

CREATE TABLE IF NOT EXISTS `securitygroups_users` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `securitygroup_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `securitygroups_users_idxa` (`securitygroup_id`),
  KEY `securitygroups_users_idxb` (`user_id`),
  KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `spots`
--

CREATE TABLE IF NOT EXISTS `spots` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `config` longtext,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sugarfeed`
--

CREATE TABLE IF NOT EXISTS `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sugarfeed`
--

INSERT INTO `sugarfeed` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `assigned_user_id`, `related_module`, `related_id`, `link_url`, `link_type`) VALUES
('3696d412-f1b5-87c6-d954-582af0405404', '<b>{this.CREATED_BY}</b> {SugarFeed.CREATED_LEAD} [Leads:21680eb7-82a6-c46d-7002-582af0005131:asdas]', '2016-11-15 11:25:35', '2016-11-15 11:25:35', '1', '1', NULL, 0, '1', 'Leads', '21680eb7-82a6-c46d-7002-582af0005131', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `templatesectionline`
--

CREATE TABLE IF NOT EXISTS `templatesectionline` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `thumbnail` varchar(255) DEFAULT NULL,
  `grp` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `templatesectionline`
--

INSERT INTO `templatesectionline` (`id`, `name`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `description`, `deleted`, `thumbnail`, `grp`, `ord`) VALUES
('b48517e1-476d-232e-b679-581864e14846', 'Headline', '2016-11-01 09:46:32', '2016-11-01 09:46:32', '1', '1', '<p></p><h1>Add your headline here..</h1>', 0, 'include/javascript/mozaik/tpls/default/thumbs/headline.png', NULL, 1),
('be80c6ef-0533-e230-e78d-581864060241', 'Content', '2016-11-01 09:46:32', '2016-11-01 09:46:32', '1', '1', '<h2>Title</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</p>', 0, 'include/javascript/mozaik/tpls/default/thumbs/content1.png', NULL, 2),
('c5bada57-9356-b81c-ed2c-581864fbfa9f', 'Content with two columns', '2016-11-01 09:46:32', '2016-11-01 09:46:32', '1', '1', '<table style="width:100%;"><tbody><tr><td><h2>Title</h2></td><td><h2>Title</h2></td></tr><tr><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>', 0, 'include/javascript/mozaik/tpls/default/thumbs/content2.png', NULL, 3),
('cbc20de4-6c87-dbd4-0c38-581864c6024c', 'Content with three columns', '2016-11-01 09:46:32', '2016-11-01 09:46:32', '1', '1', '<table style="width:100%;"><tbody><tr><td><h2>Title</h2></td><td><h2>Title</h2></td><td><h2>Title</h2></td></tr><tr><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>', 0, 'include/javascript/mozaik/tpls/default/thumbs/content3.png', NULL, 4),
('d1750cfe-43ea-d116-6c5d-581864b1a9c8', 'Content with left image', '2016-11-01 09:46:32', '2016-11-01 09:46:32', '1', '1', '<table style="width:100%;"><tbody><tr><td><img src="http://localhost/SuiteCRM_HRM/include/javascript/mozaik/tpls/default/images/sample.jpg" width="130" alt="sample.jpg" /></td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>', 0, 'include/javascript/mozaik/tpls/default/thumbs/image1left.png', NULL, 5),
('d6ea2a6c-233a-13b6-e37e-581864363828', 'Content with right image', '2016-11-01 09:46:32', '2016-11-01 09:46:32', '1', '1', '<table style="width:100%;"><tbody><tr><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td><img src="http://localhost/SuiteCRM_HRM/include/javascript/mozaik/tpls/default/images/sample.jpg" width="130" alt="sample.jpg" /></td></tr></tbody></table>', 0, 'include/javascript/mozaik/tpls/default/thumbs/image1right.png', NULL, 6),
('dd985a7b-3942-3767-5642-581864f18280', 'Content with two image', '2016-11-01 09:46:32', '2016-11-01 09:46:32', '1', '1', '<table style="width:100%;"><tbody><tr><td><img src="http://localhost/SuiteCRM_HRM/include/javascript/mozaik/tpls/default/images/sample.jpg" width="130" alt="sample.jpg" /></td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td><img src="http://localhost/SuiteCRM_HRM/include/javascript/mozaik/tpls/default/images/sample.jpg" width="130" alt="sample.jpg" /></td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>', 0, 'include/javascript/mozaik/tpls/default/thumbs/image2.png', NULL, 7),
('e447b520-d1e2-ff51-8f24-58186499fa18', 'Content with three image', '2016-11-01 09:46:32', '2016-11-01 09:46:32', '1', '1', '<table style="width:100%;"><tbody><tr><td><img src="http://localhost/SuiteCRM_HRM/include/javascript/mozaik/tpls/default/images/sample.jpg" alt="sample.jpg" /></td><td><img src="http://localhost/SuiteCRM_HRM/include/javascript/mozaik/tpls/default/images/sample.jpg" alt="sample.jpg" /></td><td><img src="http://localhost/SuiteCRM_HRM/include/javascript/mozaik/tpls/default/images/sample.jpg" alt="sample.jpg" /></td></tr><tr><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td><td><h2>Title</h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tempus odio ante, in feugiat ex pretium eu. In pharetra tincidunt urna et malesuada. Etiam aliquet auctor justo eu placerat. In nec sollicitudin enim. Nulla facilisi. In viverra velit turpis, et lobortis nunc eleifend id. Curabitur semper tincidunt vulputate. Nullam fermentum pellentesque ullamcorper.</td></tr></tbody></table>', 0, 'include/javascript/mozaik/tpls/default/thumbs/image3.png', NULL, 8),
('e9ace099-42c1-2793-d5e4-5818649f95d8', 'Footer', '2016-11-01 09:46:32', '2016-11-01 09:46:32', '1', '1', '<p class="footer">Take your footer contents and information here..</p>', 0, 'include/javascript/mozaik/tpls/default/thumbs/footer.png', NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tracker`
--

CREATE TABLE IF NOT EXISTS `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=605 ;

--
-- Dumping data for table `tracker`
--

INSERT INTO `tracker` (`id`, `monitor_id`, `user_id`, `module_name`, `item_id`, `item_summary`, `date_modified`, `action`, `session_id`, `visible`, `deleted`) VALUES
(10, '51be162a-c7c8-8922-6209-580716444dda', '1', 'RT_Employees', 'cbc44f6d-7fde-b86e-4840-5807169cff66', 'Mr. sdf asd', '2016-10-19 06:46:03', 'editview', 'a0gmsp5cg082gj6rpkc2c9u0u6', 1, 0),
(12, 'c98ad42d-a223-531e-ee5e-58073891fcaa', '1', 'RT_Leaves', '694544af-02e6-df1c-660b-580726cdc011', NULL, '2016-10-19 09:11:15', 'editview', 'a0gmsp5cg082gj6rpkc2c9u0u6', 0, 0),
(16, '18412821-1157-85de-70bd-5808911857d8', '1', 'RT_Leaves', '7058ff62-783f-6f91-a8a8-58089136bb30', NULL, '2016-10-20 09:44:04', 'detailview', 'a0gmsp5cg082gj6rpkc2c9u0u6', 0, 0),
(18, 'd469c799-af85-1fc4-80e0-5808b3a06c21', '1', 'RT_Qualifications', '29660fce-d9f9-e5bd-6a84-5808b2beb429', NULL, '2016-10-20 12:06:55', 'detailview', 'a0gmsp5cg082gj6rpkc2c9u0u6', 1, 0),
(20, '801a98f2-8e2c-8a0b-8d4b-5808b41c07d6', '1', 'RT_Qualifications', 'a6c41491-3017-82a6-6f7b-5808b3105e88', NULL, '2016-10-20 12:11:27', 'detailview', 'a0gmsp5cg082gj6rpkc2c9u0u6', 1, 0),
(22, 'cb4fbeb9-88a1-092f-c488-5808b5c1b523', '1', 'RT_Qualifications', '34cfac72-ce5b-6104-020f-5808b407a60e', NULL, '2016-10-20 12:14:56', 'detailview', 'a0gmsp5cg082gj6rpkc2c9u0u6', 1, 0),
(23, 'b4eb6e45-b25a-de77-989e-5808b537393e', '1', 'RT_Qualifications', '270b4d59-e47b-9b53-3863-5808b51c4b3e', NULL, '2016-10-20 12:15:27', 'detailview', 'a0gmsp5cg082gj6rpkc2c9u0u6', 1, 0),
(24, 'b41cb23e-889b-8d09-dc42-5808b9c92ae0', '1', 'RT_Leaves', 'e8b20c9c-9211-3cf7-8961-5808b9392835', NULL, '2016-10-20 12:32:18', 'detailview', 'a0gmsp5cg082gj6rpkc2c9u0u6', 0, 0),
(25, '1595b3b7-bdbc-4bf8-8e35-5808b99355e2', '1', 'RT_Leaves', '7c4e0a55-b473-664d-420f-5808b9f51bee', NULL, '2016-10-20 12:32:46', 'detailview', 'a0gmsp5cg082gj6rpkc2c9u0u6', 0, 0),
(27, 'c3ffa9ed-0b17-6325-7fa5-580dbccb0860', '1', 'RT_Employees', '2958faeb-705b-1431-9709-580dbcd5ef56', 'Mr. asd asdc ascf', '2016-10-24 07:49:14', 'detailview', 'l78kv9gv8sj5cnjmki1h20j0c2', 1, 0),
(28, '47f63aa5-d5c3-7059-c92d-5811cb0caa80', '1', 'RT_Performance_Reviews', 'a94e3eab-d01c-2585-6bf0-5811cbc1b574', 'test performance for employee', '2016-10-27 09:38:55', 'detailview', 'qfr2ijdrcm4jf3m0vgragh1g85', 1, 0),
(33, '8407d917-af1d-351b-8c4e-5811d1aae744', '1', 'RT_Employees', '4fd9c21c-0f4d-1fb4-8bb0-5804cff4be78', 'Mr. test salary', '2016-10-27 10:04:27', 'detailview', 'qfr2ijdrcm4jf3m0vgragh1g85', 1, 0),
(42, '9dfa9637-dc84-1676-9d82-5811f9b46492', '1', 'RT_Employees', 'c73e60f0-82fc-f33b-0205-5811f0e32a0c', 'Mr. test email', '2016-10-27 12:56:50', 'detailview', 'qfr2ijdrcm4jf3m0vgragh1g85', 1, 0),
(47, '820f066e-6bd7-d7fa-2cec-5812162b5699', '1', 'RT_Performance_Reviews', 'b8648a61-c020-145e-1e36-58121616a03d', NULL, '2016-10-27 15:00:43', 'editview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(51, '8a7b0eec-3762-a5df-0027-5812182f6558', '1', 'RT_Performance_Reviews', '7077a3d8-d003-bcc3-c0f2-5812177e9e5d', 'Review From of test', '2016-10-27 15:07:17', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(52, '24b0b6b9-3258-eaf7-cbaf-581218a618a8', '1', 'RT_Performance_Reviews', 'eacdc772-7534-4474-abf5-5812181a58dd', 'Review From of test supervisor', '2016-10-27 15:08:58', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(55, '97f4b5ad-a9ee-dc4a-8d02-58121a2a3916', '1', 'RT_Performance_Reviews', 'd54651de-923d-dbcb-208d-58121af4501a', 'Review From of sdf asd', '2016-10-27 15:17:40', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(58, 'abdb8bb5-f160-2ebb-a4be-5812f35dfcca', '1', 'RT_Employees', 'a2e6184f-8d21-2ec4-8641-5811f94d96b7', 'Mr. test sent mail', '2016-10-28 06:43:21', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(61, '41d6d89c-bc89-403a-db74-5812f84d85aa', '1', 'RT_Employees', '380d7c06-497a-f0e2-e02a-580497b91089', 'Mr. test person', '2016-10-28 07:03:40', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(63, '5284b8fc-a0a0-69ed-6372-581305f6b278', '1', 'RT_Performance_Reviews', '1846ec72-9db2-d982-fccc-581305281336', 'Review From of husnain zaheer', '2016-10-28 08:02:07', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(64, '3801617f-2978-9fbf-3876-5813065e0ed8', '1', 'RT_Performance_Reviews', '7e3d5522-0505-b3c2-b9d7-5813052b2a77', 'Review From of husnain zaheer', '2016-10-28 08:02:15', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(65, '23001972-d430-599f-1818-5813064e1a64', '1', 'RT_Performance_Reviews', 'cea89873-6849-7e32-e413-5812fff291bb', 'Review From of husnain zaheer', '2016-10-28 08:02:20', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(66, '2257ef51-21f6-788e-36f0-581306cb3553', '1', 'RT_Performance_Reviews', 'ed257de0-f875-ccbc-027a-58121912e09d', 'Review From of husnain zaheer', '2016-10-28 08:02:27', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(67, '5fe64491-1ef2-ebcc-878f-5813060436a2', '1', 'RT_Performance_Reviews', 'e498e946-2ae1-4c35-6b56-581306eb2890', 'Review From of husnain zaheer', '2016-10-28 08:03:35', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(70, 'b35622bc-2ce1-5f66-35e7-58131aeb9375', '1', 'RT_Performance_Reviews', '25f81fd5-9efc-3f9e-70a2-5813070828a1', 'Review From of husnain zaheer', '2016-10-28 09:29:40', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(72, 'a3ae427e-2e1f-df9f-2c44-5813306da158', '1', 'RT_Performance_Reviews', '62fc4a13-0a88-86f5-c80d-58132f45ad4e', 'Review From of husnain zaheer', '2016-10-28 11:04:40', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(73, '51a8a73c-6e0b-18ee-650c-58133379f141', '1', 'RT_Performance_Reviews', '6b0aab72-8374-671d-adac-581333300f3a', 'Review From of husnain zaheer', '2016-10-28 11:15:32', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(75, 'b868e9ad-64a4-2457-05be-5813366bd166', '1', 'Users', '8df757f7-32ff-50be-7825-5813363b2b3b', 'Shahrukh Riaz', '2016-10-28 11:28:31', 'detailview', 'mdks39skjjdamkn8o8m699qae0', 1, 0),
(77, '758c06a3-1f44-6c69-2484-58133ed22fd0', '1', 'RT_Performance_Reviews', 'e75513f0-fe76-acb1-52b5-58133e4da41f', 'Review From of no  supervisor', '2016-10-28 12:02:28', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(78, 'e8e1fa08-01bc-dd03-274e-58170b3451a9', '1', 'RT_Performance_Reviews', '6a1dc9e9-c5e7-b784-fe11-581334302afd', 'Review From of husnain zaheer', '2016-10-31 09:12:39', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(79, '783282ea-7441-bb3e-cbc0-58170f87c708', '1', 'RT_Performance_Reviews', 'b402ba7a-4465-7d11-666b-58170ec2131b', 'Review From of husnain zaheer', '2016-10-31 09:29:46', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(80, 'a6832d80-91ea-084c-123d-5817130aa9ff', '1', 'RT_Performance_Reviews', '30b71c84-ae2c-1f40-d38a-581713ffc0e0', 'Review From of husnain zaheer', '2016-10-31 09:49:37', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(82, '2bccaf83-69dc-7240-e8ac-581715a6614b', '1', 'RT_Performance_Reviews', '9491132d-e68a-fcc9-40f7-581714c715a5', 'Review From of husnain zaheer', '2016-10-31 09:58:30', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(83, '532362b8-032e-e11f-f7f6-5817154d41da', '1', 'RT_Performance_Reviews', '97e865ac-22a5-1ff2-df90-581715d4f49b', 'Review From of husnain zaheer', '2016-10-31 09:58:38', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(86, '5f72ded8-78d8-bbef-75e2-58171c3a8180', '1', 'RT_Performance_Reviews', 'cae605be-2728-03f3-a219-58171c55296b', 'Review From of husnain zaheer', '2016-10-31 10:28:13', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(87, '2860c4cc-45a8-a2f8-ffe0-58171eb7b67b', '1', 'RT_Performance_Reviews', '50ac8508-08e8-dcb0-6c00-58171ead37a2', 'Review From of husnain zaheer', '2016-10-31 10:34:20', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(88, '1a6b9a8c-ef4f-c1e8-7f81-5818429990aa', '1', 'RT_Performance_Reviews', 'b0d39a28-c9e6-ffa3-522c-581842ebcd40', 'Review From of husnain zaheer', '2016-11-01 07:22:54', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(89, 'bf2beae4-8e8d-68f1-c870-5818457cc077', '1', 'RT_Performance_Reviews', '904e660c-aabd-f146-f604-5818456e24f5', 'Review From of husnain zaheer', '2016-11-01 07:36:18', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(91, '5d4f852b-a470-0f36-d707-58185ffda451', '1', 'RT_Performance_Reviews', 'd11b22e2-3750-b53a-3853-58185d868d92', 'Review From of husnain zaheer', '2016-11-01 09:23:53', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(92, 'dd03f972-986d-5109-a1bb-581864294bf6', '1', 'TemplateSectionLine', 'e9ace099-42c1-2793-d5e4-5818649f95d8', 'Footer', '2016-11-01 09:46:32', 'save', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(93, 'a720e9f5-ea69-e3e6-c981-5818649b0a0a', '1', 'RT_Performance_Reviews', '547eca63-0f58-4b49-ae40-581864f6dd36', 'Review From of husnain zaheer', '2016-11-01 09:48:36', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(96, 'c87e3f11-12c5-df71-ed28-5819c6470c0c', '1', 'RT_Performance_Reviews', '44155671-ec64-9c0e-de07-5819c650fc73', 'Review From of husnain zaheer', '2016-11-02 10:56:49', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(97, 'af2ce456-fb76-e965-b501-581a00bb888c', '1', 'RT_Performance_Reviews', 'c0c97261-6114-91c5-0b6f-581a00a1727e', 'Review From of husnain zaheer', '2016-11-02 15:05:09', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(118, 'c50d15d9-9487-6a4d-c987-581adabf5f7a', '1', 'RT_Performance_Reviews', 'daa92b7e-edca-cd49-3cdf-581ada902533', 'Review From of husnain zaheer 2016-11-03 11:32:51', '2016-11-03 06:33:50', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(119, '95a26d32-0ded-472c-db1d-581adca3d2b4', '1', 'EmailTemplates', '1c78e1e9-861b-80b3-4809-581adc0f373a', 'test template', '2016-11-03 06:41:37', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(122, 'eaa4521f-8448-7186-b250-581ae0c4d557', '1', 'EmailTemplates', '9f0e39c9-d462-7d2b-eb51-581a01493c86', 'Rolustech Email Template', '2016-11-03 07:02:03', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(123, '8618ab3e-3c4d-c025-b7b8-581b0d54f3c2', '1', 'RT_Employees', 'edd472fe-febf-e96a-a2e7-58133c6c50f6', 'Mr. no  supervisor', '2016-11-03 10:11:31', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(125, '7647f55c-7f2d-b937-b214-581b1754e3df', '1', 'RT_Leaves', '96cf4478-e63f-8c1f-8b9d-581b17c6b282', NULL, '2016-11-03 10:55:08', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 0, 0),
(128, '5576d6ea-f4db-9484-1acd-581b223134fd', '1', 'RT_Leaves', 'ae47905b-5d04-1e9d-d20c-581b22b2d79d', NULL, '2016-11-03 11:40:13', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(129, 'b0ce67bf-edac-713b-8b57-581b385687e1', '1', 'RT_Leaves', 'ed9f8a13-972a-ae04-fc2a-581b384da442', NULL, '2016-11-03 13:14:30', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(143, '54188800-dbf7-e2a5-1617-581c3128db61', '1', 'RT_Leaves', '324b5fc4-750f-a3bf-edc4-581c2f335ad2', NULL, '2016-11-04 06:57:34', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(167, 'ed800287-88d3-3ec3-6779-581c55e88a6b', '1', 'RT_Employees', 'd0e3ea77-656a-ef74-e175-5804b99ed1a0', 'Mr. husnain zaheer', '2016-11-04 09:31:43', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(169, '534ee799-ee82-7523-0045-581c558a798d', '1', 'RT_Leaves', 'efb84701-650f-2170-e642-581b1e3334e3', 'hello leave', '2016-11-04 09:32:20', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(173, '6551e963-82c3-4c6c-c593-581c56ce564c', '1', 'RT_Employees', 'e1a3888d-1197-e4cd-148f-5811ddcc5adf', 'Mr. test supervisor', '2016-11-04 09:33:57', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(174, 'f24c27bd-4ec5-3918-5a89-581c5621ef84', '1', 'RT_Leaves', 'eaab9c3e-de01-df4d-b1ca-581c566fc192', NULL, '2016-11-04 09:35:21', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(177, '5157fc06-a969-60ef-676b-581c58ffc6c9', '1', 'RT_Leaves', 'eee149f8-8422-780d-f414-581c582ee6e3', 'Leave of test supervisor', '2016-11-04 09:44:26', 'editview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(178, '16a5b43c-3c6b-adac-21e4-581c6287de78', '1', 'RT_Employees', '737b29ff-85b2-7f4f-d66c-581c6273b780', 'Mr. employee for leave', '2016-11-04 10:25:20', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(179, 'f3667ef0-db9c-ac38-f137-581c62435c7f', '1', 'RT_Leaves', '19265a90-5689-f00f-8b05-581c62bbd81d', 'Leave of employee for leave', '2016-11-04 10:26:33', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(180, '21ef02d4-95f9-070d-8427-581c664f005c', '1', 'RT_Employees', '4cee38fc-0bec-02fa-5019-581c665b1ca8', 'Mr. atif zulfiqar', '2016-11-04 10:42:17', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(181, 'd5c39c1d-db1f-0871-3259-581c66862f84', '1', 'RT_Leaves', 'ec726d46-4dfc-a9c6-ea81-581c66b75a7c', 'Leave of atif zulfiqar', '2016-11-04 10:44:14', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(182, 'cf132898-5383-0ecb-3bdb-581c6835a313', '1', 'RT_Leaves', '1d8f60c6-0ce1-921e-12e7-581c68321275', 'Leave of atif zulfiqar', '2016-11-04 10:54:39', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(183, '3a400776-d1d4-ab36-73be-581c69ccdbc1', '1', 'RT_Leaves', '3eec9fff-4290-8187-aaab-581c69e626a5', 'Leave of atif zulfiqar', '2016-11-04 10:55:34', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(185, '50433b89-327f-dc0d-1709-581c693ef69c', '1', 'RT_Leaves', 'c165ba16-f1cb-1096-beb8-581c69a805ef', 'Leave of atif zulfiqar', '2016-11-04 10:56:18', 'editview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(186, '4ad80c47-6a1c-37b2-caed-581c69e0f465', '1', 'RT_Leaves', 'e9368a32-4066-ec82-a325-581c69ad38f3', 'Leave of atif zulfiqar', '2016-11-04 10:57:11', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(187, '4e28b121-f93d-861b-747f-581c6ae15836', '1', 'RT_Leaves', '30481dba-4507-4bb1-fdec-581c6a9ea798', NULL, '2016-11-04 11:00:54', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(189, '2475dea7-5c65-8fbe-137d-581c6a4a3c8d', '1', 'RT_Leaves', 'c85603f4-3a42-b365-c44d-581c6a3bf950', NULL, '2016-11-04 11:03:09', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(190, '5de95c21-67b7-2512-28b1-581c6c5f1bf7', '1', 'RT_Leaves', '3f5ec5f7-dec1-1e04-773e-581c6c81dbd4', NULL, '2016-11-04 11:08:25', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(191, 'b62697fc-01a1-a951-aa80-581c6fdd1b0b', '1', 'RT_Employees', '3a374cdb-63d1-c038-542d-581c6a0b23a3', 'Mr. ab  tech', '2016-11-04 11:21:39', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(192, '132cd4cd-0a01-b9f5-b672-581c73aa7585', '1', 'RT_Leaves', 'e37d4cc2-073e-b47d-6ce2-581c724e7a26', NULL, '2016-11-04 11:37:36', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(193, '84e12b1b-66c5-897e-0475-581c747e3461', '1', 'RT_Leaves', '4c01e199-f86f-848b-6ac9-581c748e4c35', NULL, '2016-11-04 11:44:57', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(194, '2cbb761a-17b3-526f-67d5-581c76de4ea9', '1', 'RT_Leaves', '9d7c579f-7f8e-94b2-7668-581c7633a323', NULL, '2016-11-04 11:54:18', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(195, 'bd996c9a-6663-86ed-54e9-581c772b7cf8', '1', 'RT_Leaves', '7ee60486-6ddc-bcb1-b167-581c776a7a86', NULL, '2016-11-04 11:57:41', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(196, '585e2c80-ddaa-d6a4-4e90-581c781196e2', '1', 'RT_Leaves', '4fd3008c-dfc3-eca5-0970-581c78055f0c', NULL, '2016-11-04 11:59:00', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(197, 'a288dcd5-3512-7234-8ba8-581c785dd195', '1', 'RT_Leaves', '43c5fee2-497a-6f2b-325a-581c787ae406', NULL, '2016-11-04 11:59:12', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(198, '89af9236-3148-f856-d264-581c78f2d585', '1', 'RT_Leaves', '27277984-4a35-0e80-8033-581c78e872dd', NULL, '2016-11-04 11:59:29', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(199, 'e707b91d-9a51-61c9-71fd-581c789c8e4b', '1', 'RT_Leaves', '7a80439b-dba9-a6c7-ffc7-581c78d73abd', NULL, '2016-11-04 11:59:42', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(200, '73ef8ec8-d93e-c8c5-36a0-581c7945ff82', '1', 'RT_Leaves', 'bd025d01-8668-fe8c-e51f-581c79e7913b', NULL, '2016-11-04 12:03:29', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(201, '1252b60f-9484-19bb-e7ac-581c7ac5c7d9', '1', 'RT_Leaves', '8a9f12d8-d2de-db36-237e-581c7ab00c79', NULL, '2016-11-04 12:08:08', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(202, '979c2f3f-b062-9335-bf4b-581c7b82b212', '1', 'RT_Leaves', 'e5e6f07c-4366-f093-7d27-581c7b00a90a', NULL, '2016-11-04 12:12:37', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(203, '516406fd-df47-9caf-dcca-581c83d3b918', '1', 'RT_Employees', '62c78e6c-5337-4b88-ac6c-581c83e61401', 'Mr. aoa test', '2016-11-04 12:48:50', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(204, '3d9eea28-01c9-aeb3-147e-581c84841a2d', '1', 'RT_Leaves', 'a08b92d4-cc8d-e8f9-a5c8-581c84d5153d', NULL, '2016-11-04 12:50:21', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(205, '531d56cb-a4e9-a8e4-c153-581c86c9f543', '1', 'RT_Leaves', '8bf9a14b-2da0-091c-ec20-581c86b4c65f', NULL, '2016-11-04 12:59:36', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(206, 'a0f2522f-8b30-9add-937d-581c8622f361', '1', 'RT_Leaves', 'cc53e6dc-2b70-41f6-27d2-581c868cc431', NULL, '2016-11-04 13:00:57', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(207, 'adb838fa-b9ce-b0dd-77b7-581c861435d2', '1', 'RT_Leaves', 'ebb9f082-8377-e66c-ab67-581c86e2a807', NULL, '2016-11-04 13:01:23', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(208, '5d6633a9-25c3-1748-ce4a-581c909929db', '1', 'RT_Employees', 'f11e5fcb-8d57-5814-e16a-581c90c81020', 'Mr. final employee', '2016-11-04 13:42:41', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(209, '79a2d4a5-aa56-dd42-bb97-581c900c8ca5', '1', 'RT_Leaves', 'b7bc10e5-1c96-1d49-4d4d-581c90d6b68a', NULL, '2016-11-04 13:44:38', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(210, 'd5ddd50a-8859-ddf6-a2f0-581c914fefee', '1', 'RT_Leaves', '25235af3-0fd4-b6a0-942c-581c919e4180', NULL, '2016-11-04 13:45:47', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(211, '980ed0f4-f183-78f3-f27d-581c92c6e67e', '1', 'RT_Leaves', 'e56c3a5f-9aed-791c-cc86-581c928402d2', NULL, '2016-11-04 13:50:02', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(212, '66a7016b-5e64-c9f1-86aa-581c9310e212', '1', 'RT_Leaves', 'a0a6137f-140a-04bb-f488-581c93c270cc', NULL, '2016-11-04 13:58:10', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(213, '8f9ee48b-64ba-66a1-a039-581c94486fe5', '1', 'RT_Leaves', 'cd1b47f1-63c8-378d-e088-581c94411b3e', NULL, '2016-11-04 14:01:41', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(214, '200008a1-7269-194b-5796-581c95cb6701', '1', 'RT_Leaves', '129c0d28-3e16-a457-3a9c-581c95c7b666', NULL, '2016-11-04 14:06:34', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(215, '868ff20e-cdd9-f604-4e8e-581c96bbe669', '1', 'RT_Leaves', 'b0c03988-6e8f-1e12-5eca-581c962e8a83', NULL, '2016-11-04 14:10:30', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(216, 'd40c552f-4989-dabc-4bee-581c962fa065', '1', 'RT_Leaves', 'bc36053e-1664-6246-5c5d-581c9646fb50', NULL, '2016-11-04 14:10:47', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(217, '3a97abfb-d405-7df2-5665-581c987ad078', '1', 'RT_Leaves', '500e3875-e6ee-08f6-8430-581c98cc51e1', NULL, '2016-11-04 14:19:16', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(219, '65c76693-76cd-4ae2-5b36-582169e11c48', '1', 'RT_Employees', '99155b84-6e60-e5ae-16fe-5821691782d2', 'Mr. today employee', '2016-11-08 05:58:46', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(220, 'af5a687b-d8dd-0dc6-c339-5821694984f9', '1', 'RT_Leaves', 'bccb3aad-c525-8c09-43c0-5821699c6fa5', NULL, '2016-11-08 05:59:15', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(221, 'e79db35d-24b2-e4c0-922c-58216967667f', '1', 'RT_Leaves', 'e72ad9df-80a5-6c0b-e309-582169ee980f', NULL, '2016-11-08 05:59:47', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(222, '7b78ad8a-0e99-cb64-048a-5821693300c6', '1', 'RT_Leaves', '77f03c5a-8f61-266d-c78a-582169bad777', NULL, '2016-11-08 06:00:06', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(226, 'cb4aab63-39eb-6848-1466-58217057e5f9', '1', 'RT_Leaves', 'a2ac8efa-5ebb-1b5b-746c-5821706062bc', NULL, '2016-11-08 06:30:09', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(227, '1d657f5c-4450-5c41-dca0-5821717f7a47', '1', 'RT_Leaves', '6c208010-20a1-5a91-655c-5821715a1605', NULL, '2016-11-08 06:30:53', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(228, '23f92218-739f-198d-88da-5821714d64ba', '1', 'RT_Leaves', '622f15d5-633f-c997-4c9f-582171e30b10', NULL, '2016-11-08 06:31:32', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(229, '3ec6f350-7f3d-89a3-c293-582172e9a222', '1', 'Schedulers', 'a42bfef5-4fb7-e7eb-3a5e-58047fe73f33', 'Clean Jobs Queue', '2016-11-08 06:34:44', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(239, '2af8455d-55cb-dd2a-73c0-582175eb2acf', '1', 'Schedulers', '18fce0c7-5449-1364-f239-5821728066c6', 'Leaves balance update', '2016-11-08 06:48:22', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(240, '72fc8c6c-a58a-f2ab-7608-5821768ddadc', '1', 'RT_Leaves', 'c1e80568-78c2-8167-ec76-5821764cba73', NULL, '2016-11-08 06:52:10', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(241, 'f35e1454-48bc-798c-73c1-582176f5aef3', '1', 'RT_Leaves', '41223377-d844-da08-c26a-58217613efd5', NULL, '2016-11-08 06:54:54', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(245, 'd9467b26-93e0-32a2-a58a-5821a15ddd6c', '1', 'RT_Leaves', 'f1bc0111-b9e2-72fe-101b-5821a03dc87d', NULL, '2016-11-08 09:55:42', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(246, 'c7cf7305-c9df-eb4b-9f6b-5821a2406243', '1', 'RT_Leaves', '6922b4ba-ca6a-6b17-5ca4-5821a27a418f', NULL, '2016-11-08 10:03:35', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(248, '4d137fcf-93a7-3197-2efd-5821b7c1e348', '1', 'RT_Leaves', '7f9a566e-44be-52c0-8c33-5821b7228c17', NULL, '2016-11-08 11:29:40', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(250, 'c266e53b-e3ce-2def-87ef-5821b7cdb8e3', '1', 'RT_Leaves', '203f1542-c7c4-fb27-b5e8-5821b76d4bc7', NULL, '2016-11-08 11:31:23', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(251, '94852867-bef9-1102-4d9b-5821b79db9bd', '1', 'RT_Leaves', 'aa434d92-d6c3-7287-d00b-5821b75a3363', NULL, '2016-11-08 11:32:13', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(252, '4a93e4c1-8555-78f7-101c-5821b83db676', '1', 'RT_Leaves', '65979b63-04ed-c281-e122-5821b84f1308', NULL, '2016-11-08 11:34:04', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(253, '841e0aa5-7cc7-5b5b-4224-5821b881692b', '1', 'RT_Leaves', '4c34c0b9-1005-059e-a17e-5821b858e340', NULL, '2016-11-08 11:35:50', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(255, '6c126c00-bddb-c4ad-af21-5821b9ff7bfd', '1', 'RT_Employees', 'eae18998-cf3d-17eb-9a12-58217076a5d0', 'Mr. last year employee', '2016-11-08 11:40:00', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(256, '82126fac-028e-47a0-e751-5821b961262b', '1', 'RT_Leaves', 'bf6ce812-8db5-b171-bfaa-5821b9ff5296', NULL, '2016-11-08 11:40:20', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(257, 'f0975ad7-c04a-4bb0-4510-5821b9f92c07', '1', 'RT_Leaves', '41718e72-0e01-c6d9-daa1-5821b9d79e5a', NULL, '2016-11-08 11:41:17', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(258, '7e8dcd3d-fd66-2691-f1c5-5821bf92accd', '1', 'RT_Leaves', '985eb2a2-ec99-7a5e-de7f-5821bfe3dd6c', NULL, '2016-11-08 12:04:32', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(259, 'c4d3bd47-aca5-78c1-63ae-5821bf327e70', '1', 'RT_Leaves', 'f0a9651c-e294-9008-2d90-5821bfd35155', NULL, '2016-11-08 12:05:43', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(260, 'ad76b84a-69de-6ccd-32f1-5821ccb162c4', '1', 'RT_Employees', '5b8d9fce-7389-baa6-071e-58219f695d0d', 'Mr. june employee', '2016-11-08 12:58:42', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(267, '8c318bcb-9d19-7e0d-9dce-5821cfe654f9', '1', 'RT_Leaves', 'e59cc988-f52a-2eff-6158-5821cebc69e9', 'husy leave', '2016-11-08 13:11:49', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(268, 'a961f666-5cd3-e9e6-7bca-5821d1e7212c', '1', 'RT_Leaves', 'bcecdb5c-3f21-26bf-5771-5821d194d220', NULL, '2016-11-08 13:21:21', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(269, '7d495144-046b-958b-cc9a-5821d3f3cd5b', '1', 'RT_Leaves', '8970882e-dbfd-9afd-199f-5821d3777014', NULL, '2016-11-08 13:28:50', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(270, '144fa3a5-e8d8-2afa-5684-5821d5596d64', '1', 'RT_Leaves', 'f187850e-5eb1-6816-1e33-5821d5e0b007', NULL, '2016-11-08 13:41:18', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(273, 'e7896546-dc59-7bc7-572e-5821d683d6bf', '1', 'RT_Leaves', 'f178b6da-e992-70e2-4660-5821d6c3ae44', NULL, '2016-11-08 13:43:19', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(274, 'c0aef3d4-197b-1516-0677-5821d6bcb2bb', '1', 'RT_Leaves', 'be3275df-7993-b6ff-2557-5821d67efdd2', NULL, '2016-11-08 13:43:56', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(275, 'cf0caff4-63de-6f88-493f-5821d65fa10a', '1', 'RT_Leaves', 'ae7b02d9-2123-61d9-3689-5821d6a85d4e', NULL, '2016-11-08 13:44:48', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(276, 'dcacc859-7448-ab43-442f-5821d6022bf5', '1', 'RT_Leaves', 'bf041c66-3105-2bc4-1383-5821d661fcf2', NULL, '2016-11-08 13:45:15', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(277, '44cd2665-e2ab-0454-db2c-5821d7b981d7', '1', 'RT_Leaves', '2534a194-117f-2e38-f651-5821d7325592', NULL, '2016-11-08 13:45:47', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(278, 'c75669e6-cac9-4e5b-145e-5821d79978a5', '1', 'RT_Leaves', '999fa007-5642-8f41-815c-5821d7cc3b4d', NULL, '2016-11-08 13:46:28', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(279, '900c03cf-ffc3-9605-1337-5821d7f3eeaf', '1', 'RT_Leaves', 'c07b1019-4c8c-7cde-8e21-5821d7022658', NULL, '2016-11-08 13:46:40', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(280, '7e3418c9-e237-edc8-0188-5821d83c0a13', '1', 'RT_Leaves', '39403597-f44d-c538-f1bd-5821d8eef470', NULL, '2016-11-08 13:52:05', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(281, '28415adc-35b4-22f1-ca46-5821d87abd13', '1', 'RT_Leaves', 'dc15356c-6776-8ed7-2acf-5821d8c262ac', NULL, '2016-11-08 13:53:14', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(282, '881adcde-b63a-29c7-d902-5821d80beaac', '1', 'RT_Leaves', '22499e10-79d6-60b9-59af-5821d8fd01f4', NULL, '2016-11-08 13:53:41', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(283, '260ddfc8-c5b5-3f19-2fc7-5821d96258cc', '1', 'RT_Leaves', 'a7947dc8-307d-eecb-e62e-5821d9ff128a', NULL, '2016-11-08 13:55:04', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(284, 'c50669ed-7726-3b0a-0665-5821d99cf3d1', '1', 'RT_Leaves', '64a02151-ba61-5b47-5441-5821d9fbb9e6', NULL, '2016-11-08 13:55:26', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(285, 'b4c4047b-5135-9b31-46c7-5821d95f3934', '1', 'RT_Leaves', '7c5b8d39-9d4b-db3f-e651-5821d9ea2557', NULL, '2016-11-08 13:55:46', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(286, '7a2756e4-44e2-9a6c-b204-5821da0d3a48', '1', 'RT_Leaves', '1476019d-17d2-50be-9958-5821dad98327', NULL, '2016-11-08 13:58:49', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(287, 'a7dc1891-6264-3aa3-a251-5821da390a13', '1', 'RT_Leaves', '56ff0270-ff07-a4f5-0346-5821dae273c6', NULL, '2016-11-08 14:00:44', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(293, 'c1a800eb-2b69-ac62-250f-5821def70ed7', '1', 'RT_Leaves', '3746b4ef-d6ff-6299-5a7f-5821dae6a1be', 'test', '2016-11-08 14:16:02', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(294, '186d8dda-8960-08dd-6d65-5821de890829', '1', 'RT_Employees', 'b49f614d-15c9-16f0-6756-5821ccd22e67', 'Mr. tttt zzzz', '2016-11-08 14:16:22', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(298, 'b7612129-c88c-b098-55ff-5821de4d735a', '1', 'RT_Leaves', '26570d90-2856-1167-fb4a-5821dec4e5d0', 'Leave of tttt zzzz', '2016-11-08 14:18:54', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 0, 0),
(299, '725ea930-010a-3f4c-2b71-5822c13f3b1c', '1', 'RT_Leaves', 'a41d1a4a-a1bd-32d1-66b1-5822c19cc74a', 'Leave of tttt zzzz', '2016-11-09 06:27:22', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(302, 'd212e360-5498-4b76-444a-5822c27299cb', '1', 'RT_Leaves', '23850b8d-971e-b019-3405-5822c1f17ef0', 'Leave of june employee', '2016-11-09 06:29:07', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(303, 'bed2f10e-309c-8470-6325-5822c25a0a60', '1', 'RT_Leaves', '186fc5da-9438-9824-d39a-5822c2ba7e88', 'Leave of june employee', '2016-11-09 06:29:17', 'detailview', '6hl30d8ujs81vap521qdfdr9q1', 1, 0),
(304, 'be303126-e191-990d-2f4d-5822d13c5137', '1', 'RT_Leaves', 'c1c60d36-b0d8-cc78-3af0-5822d16830d1', 'Leave of today employee', '2016-11-09 07:35:03', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(305, '4efedbed-ad12-8937-ad34-5822f3479fa0', '1', 'RT_Leaves', '90809499-5deb-dab0-6e7d-5822f33c05d8', 'Leave of last year employee', '2016-11-09 09:57:48', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(306, 'e05cef01-a091-fce4-724b-5822f31fb8ba', '1', 'RT_Leaves', '297365e8-febf-bd43-0c6d-5822f36ae57a', 'Leave of last year employee', '2016-11-09 09:58:04', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(307, 'cb837bfa-3356-a695-df05-5822f3a9d899', '1', 'RT_Leaves', 'bab70d05-9f70-d843-0c8c-5822f3d541e0', 'Leave of last year employee', '2016-11-09 09:59:11', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(308, 'd645c54f-dc3e-d7e4-4f84-5822fc352a4a', '1', 'RT_Leaves', '191f60d6-b378-c5ec-87a1-5822fc073645', 'Leave of june employee', '2016-11-09 10:37:36', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(309, 'cd964edc-44f9-0244-75be-58230a5e570a', '1', 'RT_Leaves', 'f1517d18-d9cb-61ce-ea23-58230a788f55', 'Leave of last year employee', '2016-11-09 11:37:52', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(311, 'a91f032b-373a-2a2b-11fc-58230be3aab5', '1', 'RT_Leaves', '71faec55-d518-cebd-93e2-58230b102fa8', 'Leave of today employee', '2016-11-09 11:40:54', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(312, '7ea20d8b-c8ef-fe33-50b0-58230b08e642', '1', 'RT_Leaves', '95d66fd6-1dd0-f716-96b1-58230bbd8c1c', 'Leave of today employee', '2016-11-09 11:42:21', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(314, 'ca4da10f-1448-c8a3-0788-58230c8890f4', '1', 'RT_Leaves', 'ce6fcb51-85aa-23c8-aeb2-58230c1a5522', 'Leave of emp 9 nov', '2016-11-09 11:44:53', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(315, '5292aea3-fb12-f468-43c4-58230cb3287c', '1', 'RT_Leaves', '564039c5-227b-f96d-4479-58230cd61214', 'Leave of emp 9 nov', '2016-11-09 11:47:41', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(316, '3fc9e066-4475-21a1-12d6-58230c578c48', '1', 'RT_Leaves', '4884d4bc-8b2c-9927-6618-58230ceeb88c', 'Leave of emp 9 nov', '2016-11-09 11:47:57', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(317, '51c84762-7be0-0b60-ee13-58230fa6079f', '1', 'RT_Leaves', '11ff3e86-2627-0d0e-4dc0-58230fa6d227', 'Leave of emp 9 nov', '2016-11-09 11:57:43', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(318, '43779a28-0152-737b-93cd-58230fb4976e', '1', 'RT_Leaves', '37f3d52e-4bd9-4354-07da-58230f7c59af', 'Leave of emp 9 nov', '2016-11-09 11:58:54', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(319, 'c3d499bb-7b21-3a46-b1df-5823107dbfed', '1', 'RT_Leaves', 'bc2e1806-098e-38b4-363c-582310a430a2', 'Leave of emp 9 nov', '2016-11-09 12:04:49', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(320, '6f2e802a-70f0-4f7e-954c-582314a3ffc0', '1', 'RT_Leaves', '617c81cf-bebf-e0e9-2cd4-582314c928df', 'Leave of today employee', '2016-11-09 12:21:36', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(321, 'a79beced-d3b6-22ea-033c-582315c97ea7', '1', 'RT_Leaves', '5257457d-2d47-3dc7-ca34-58231555cd91', 'Leave of june employee', '2016-11-09 12:23:32', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(322, '7094d993-bb41-8285-19a1-5823162ee1ab', '1', 'RT_Leaves', 'c075dcfc-9153-fefd-72fc-582316bb1c47', 'Leave of emp 9 nov', '2016-11-09 12:28:05', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(323, '960ee6bc-fb38-e0df-fca0-582316d83c48', '1', 'RT_Leaves', 'd62ce932-f521-19b1-b0d8-582316c17a44', 'Leave of emp 9 nov', '2016-11-09 12:30:22', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(324, 'c45d849a-f507-44c9-f127-58231a57431e', '1', 'RT_Leaves', '13566e85-4259-0395-76ef-58231afe513b', 'Leave of june employee', '2016-11-09 12:47:54', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(325, 'e93eae42-94e2-a273-41a0-58231b82fed2', '1', 'RT_Leaves', '3085909b-b6cb-ff1d-7071-58231bca89c3', 'Leave of emp 9 nov', '2016-11-09 12:51:08', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(327, '8ac943cb-8827-5279-6740-58231c2e2ba0', '1', 'RT_Leaves', '6dac0ea7-ae88-63ba-3828-58231c247757', 'Leave of emp 9 nov', '2016-11-09 12:53:57', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(328, '8af5fdf7-6e93-653b-a6c5-58231c36f492', '1', 'RT_Leaves', 'b68ae79f-1b32-fa1d-9575-58231cf760a3', 'Leave of today employee', '2016-11-09 12:54:10', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(329, 'ed5774d8-daec-9ea8-58e1-58231cb85564', '1', 'RT_Leaves', '166d31d1-7c62-5548-ae4b-58231cb6a659', 'Leave of today employee', '2016-11-09 12:54:21', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(330, 'e5c5f2ab-8449-56c0-aafa-58231d2d5114', '1', 'RT_Leaves', 'e3436c27-87a9-9f61-9673-58231d657438', 'Leave of today employee', '2016-11-09 12:56:33', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(331, 'b781d5d1-bce5-5087-ff41-58231f34fd91', '1', 'RT_Leaves', '130ad3d2-3415-8ff3-4c2b-58231f95d2fa', 'Leave of emp 9 nov', '2016-11-09 13:08:14', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(332, '219257ee-f50c-5b36-2950-58231f541e8f', '1', 'RT_Leaves', '4966853f-41b5-2032-0219-58231f2ae509', 'Leave of june employee', '2016-11-09 13:09:07', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(333, '996eb188-bc89-c4a1-58a8-582320c04e08', '1', 'RT_Leaves', 'd9037273-5c86-76e2-935d-5823202de7f3', 'Leave of emp 9 nov', '2016-11-09 13:11:18', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(334, 'c26de29b-7692-e1d9-bea4-58232038538d', '1', 'RT_Leaves', 'e4542d45-2fd1-8601-f0e0-5823209aa9a1', 'Leave of emp 9 nov', '2016-11-09 13:12:31', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(335, 'b4487885-2559-a344-4e1b-5823210173a5', '1', 'RT_Leaves', '110d60f3-3cb5-e515-04e7-582321b0d68e', 'Leave of emp 9 nov', '2016-11-09 13:16:27', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(339, '4b4e7edf-e092-a423-f052-58232209c47a', '1', 'RT_Leaves', '637d6d0d-f08c-95e2-e09f-5823221aef5c', 'Leave of tes  now', '2016-11-09 13:19:05', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(340, '454a08fc-359d-9e62-61a2-5823223b650f', '1', 'RT_Leaves', '9a701a8e-d47d-5a0d-7a9d-582322df6ce6', 'Leave of tes  now', '2016-11-09 13:19:24', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(341, 'b088fac2-4719-6a63-5686-582322b412aa', '1', 'RT_Leaves', '8f800f70-21b0-74df-ff9c-582322a8954e', 'Leave of tes  now', '2016-11-09 13:19:38', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(345, 'bb6c2797-da9c-1fd7-0723-58232f1fad67', '1', 'RT_Bonus', '734bf743-e260-fb91-2dae-58232f7f8ef5', NULL, '2016-11-09 14:16:17', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(346, 'ca851368-4b8a-75d1-de19-58233048992d', '1', 'RT_Bonus', '3bfdab33-1d05-41af-0847-582330adad94', 'tes  now 2016-11-10', '2016-11-09 14:18:29', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(351, 'b5aae2d0-1bc6-05f7-eebc-5824226b0479', '1', 'RT_Increment_History', '19b4233f-96bf-df5c-f3db-582421dedb3a', NULL, '2016-11-10 07:34:03', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(352, '3f71c7bc-8a8c-4759-4ce6-58242660abcd', '1', 'RT_Increment_History', '96883eab-a3ec-c063-5320-582426b0405e', NULL, '2016-11-10 07:49:48', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(356, 'd79fe660-5e6d-dd08-12f8-582429913d54', '1', 'RT_Employees', 'eae18998-cf3d-17eb-9a12-58217076a5d0', 'Mr. last year employee', '2016-11-10 08:01:41', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(357, '64d24f04-94cf-df0c-6fac-582429ab3e78', '1', 'RT_Employees', 'ef401f68-32e0-46bf-e3bb-58230c65631a', 'Mr. emp 9 nov', '2016-11-10 08:01:53', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(364, '5ea4107e-5523-dab8-aa2d-5824399cb6d4', '1', 'RT_Employees', '896268fc-c9d6-93cc-9fa8-582321bb0982', 'Mr. tes  now', '2016-11-10 09:12:03', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(366, '2ab9f1c2-ff99-e42f-3228-58243bc012f1', '1', 'RT_Increment_History', 'a6e5427b-c6ce-9aee-7610-58242aee5454', NULL, '2016-11-10 09:21:01', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(367, '54de03eb-d7e0-c326-7933-58243ce4a22a', '1', 'RT_Increment_History', '62fd92c9-23ac-4c2c-b850-58243c409f39', NULL, '2016-11-10 09:24:46', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(369, 'bc703153-a379-ae3f-9a45-58243d9a9c80', '1', 'RT_Increment_History', 'b42c2a3d-1df2-ff0a-8244-58243dc40703', 'today employee''s Increment', '2016-11-10 09:29:27', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(371, 'd183aba2-f465-3ea0-8118-582456f859e2', '1', 'RT_Increment_History', 'e229a1c8-fb55-3099-0495-5824567df806', 'june employee''s Increment', '2016-11-10 11:15:54', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(375, 'c5390034-e520-9aa9-7d62-5824574c6eae', '1', 'RT_Increment_History', '7f877ffd-ee3a-86d4-6100-582457c6c75b', 'tttt zzzz''s Increment', '2016-11-10 11:19:42', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(377, 'ab9acad0-1a98-cd51-aa51-58245868161d', '1', 'RT_Increment_History', '233a100a-6040-96a9-09cf-582458ac7ea6', 'june employee''s Increment', '2016-11-10 11:21:02', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(379, '5a1725ab-935a-b7cd-11d4-582458639bb8', '1', 'RT_Increment_History', '18c3a4f1-0720-b292-a104-5824589e82c7', 'last year employee''s Increment', '2016-11-10 11:22:50', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(381, '941c0a87-7482-76f5-2e19-5824590f2cae', '1', 'RT_Increment_History', '5d66c897-c74c-b496-e85b-5824594da37c', 'atif zulfiqar''s Increment', '2016-11-10 11:25:52', 'editview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(383, 'cc431bef-5874-e8c0-17f4-582459936188', '1', 'RT_Increment_History', '201266c0-1c8a-9f3b-16fa-58245952e77e', 'june employee''s Increment', '2016-11-10 11:27:06', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(392, 'e4af36fd-fff9-e9cc-6f78-58245a156f27', '1', 'RT_Increment_History', '9c58be18-11ab-5c5f-7eef-58245770104d', 'tes  now''s Increment', '2016-11-10 11:29:40', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(400, 'aba9892c-2824-835f-af5b-58245d701042', '1', 'RT_Increment_History', '8fe8db60-3809-14ba-2bf5-58245d264aef', 'today employee''s Increment', '2016-11-10 11:44:29', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(401, 'f1214429-7aba-6885-5a80-58245eac66e6', '1', 'RT_Increment_History', 'dbaf404f-6e8b-1942-325f-58245b35e8c2', 'june employee''s Increment', '2016-11-10 11:46:52', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(403, '9f17fe61-43ce-2c64-2d4d-58245e75f8f8', '1', 'RT_Increment_History', 'db763340-8a50-8558-398a-58245e0d8119', 'tes  now''s Increment', '2016-11-10 11:47:51', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(406, 'da7c31ab-b76c-df41-8889-58246369204b', '1', 'RT_Employees', 'da52008c-e23e-9467-29d3-582462632a21', 'Mr. sum salary emp', '2016-11-10 12:08:51', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(407, '2dbcfe5c-bdae-3eff-34a6-582463b482a8', '1', 'RT_Employees', '77eb48eb-2ff9-6767-cf58-582463a18d3e', 'Mrs. salary tt', '2016-11-10 12:09:55', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(409, '13d55c30-a810-c648-2ba9-582464e923e2', '1', 'RT_Employees', 'e93d3db3-c59b-51a3-2af8-582464bacdfc', 'Ms. sss salary', '2016-11-10 12:15:02', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(411, '671f058d-80f9-602c-ea48-58246599af9f', '1', 'RT_Increment_History', 'f3e6499d-8156-51cc-5f93-582464802c0c', 'sss salary''s Increment', '2016-11-10 12:16:08', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(419, 'b9ec0f94-8dd9-a28b-a1b6-5824782e78ef', '1', 'RT_Departments', 'c09d990f-111e-9ec0-38da-582475159060', 'test department aaaa', '2016-11-10 13:40:06', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(421, 'd5b52a69-2c3f-2f49-d954-582479e15ffb', '1', 'RT_Departments', '9a07271f-2a55-a043-ce74-58247837cef2', 'ddd department', '2016-11-10 13:42:45', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(425, '7753360b-aff1-fb76-6586-58247a185dc2', '1', 'RT_Departments', 'c5ca876e-d20b-f66a-2615-58247ae5294e', 'abc depe', '2016-11-10 13:46:44', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(426, 'b18b656d-634b-10f6-05f4-58247b8e15a1', '1', 'RT_Departments', '9874050f-8728-b05b-5857-58247bf6006e', 'tes depaaa', '2016-11-10 13:52:59', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(428, '14e8c18d-3564-53e5-c0fd-58247bd2909d', '1', 'RT_Departments', '429fb895-ede6-3aee-e146-58247b907038', 'asds', '2016-11-10 13:54:06', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(430, 'ded99771-c897-b8bd-beaf-58247cc3fa1d', '1', 'RT_Employees', '4fd9c21c-0f4d-1fb4-8bb0-5804cff4be78', 'Mr. test salary', '2016-11-10 13:54:38', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(431, '3e719a7f-7d65-8c11-789c-58247c026000', '1', 'RT_Employees', '380d7c06-497a-f0e2-e02a-580497b91089', 'Mr. test person', '2016-11-10 13:54:46', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(434, '9bca1f51-f4b9-a9f3-73e4-58247d15b983', '1', 'RT_Employees', 'dbf8b56f-74fe-4d70-1b5b-58247d1eb23a', 'Mr. husy test today 9 nov', '2016-11-10 14:00:42', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(435, '90990f9e-6fcd-d1a5-c349-58247da2f38b', '1', 'RT_Leaves', 'dd0f48ef-fb2c-0d12-e9d2-58247d88a1aa', 'Leave of husy test today 9 nov', '2016-11-10 14:01:16', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(436, '8153a57e-803a-0d26-e3d8-58247d77ce01', '1', 'RT_Leaves', '659567aa-6fb5-084c-f5e1-58247d2f74b8', 'Leave of husy test today 9 nov', '2016-11-10 14:01:36', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(437, '169fa7b5-4e00-7b6d-9f76-58247eb94fd2', '1', 'RT_Leaves', 'd0a81696-1830-283a-bba5-58247e715a9b', 'Leave of husy test today 9 nov', '2016-11-10 14:03:00', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(438, '63d73ba5-226e-55ac-5039-5825b50950e0', '1', 'RT_Payroll', '9281d884-c67e-3b1e-56f9-5825b5f189cd', NULL, '2016-11-11 12:13:49', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(439, '5dabebfa-9415-72e1-f022-5825c4bf7368', '1', 'RT_Payroll', '7cf8d445-6a20-b0e2-611f-5825c4a05a03', NULL, '2016-11-11 13:14:37', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(440, 'f00f3cd4-5ebe-f89d-9d65-5825c4924be1', '1', 'RT_Payroll', '158129a4-8463-01af-427c-5825c4a66ea9', NULL, '2016-11-11 13:16:18', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(441, '4d415c85-8159-ca97-2b59-5825c57f124d', '1', 'RT_Payroll', '8c40d965-eeca-bac4-4f87-5825c5eab376', NULL, '2016-11-11 13:21:27', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(442, 'cb64cb90-9a8f-beaa-d933-5825c61d40d7', '1', 'RT_Payroll', 'b3ad8b06-a8df-3432-a36d-5825c6e42bd0', NULL, '2016-11-11 13:24:31', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(443, '1d40ec70-12c8-ff20-d442-5825c7607d6c', '1', 'RT_Payroll', 'ffcd0c9e-5635-ffe7-63c0-5825c79c6317', NULL, '2016-11-11 13:30:07', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(444, '8d8226f6-ee16-e3b4-da58-5825c97d79fc', '1', 'RT_Payroll', 'eb610699-b999-6e3b-1070-5825c9738138', NULL, '2016-11-11 13:35:18', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(445, '8b158e94-96e2-5de1-6b88-5825df8d1b07', '1', 'RT_Payroll', '37c2bca6-9f8a-3e5d-f923-5825df350d1d', 'Payroll 6 0', '2016-11-11 15:10:32', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(446, 'ca2d08b2-be9c-8cb7-6ddb-5825dfe179c8', '1', 'RT_Payroll', '741d1449-4724-b1de-2e08-5825dfcb8b8f', 'Payroll 6 0', '2016-11-11 15:11:37', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(447, '61d5e0ce-6c0d-64a0-4417-5825e0801975', '1', 'RT_Employees', '4c74fae9-610d-e9a8-3ca1-5825e0f7fb39', 'Mr. test 11', '2016-11-11 15:16:43', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(448, 'dd8c7ba9-48f6-0e26-2a8c-5825e15ca90f', '1', 'RT_Employees', 'c0f14360-05b2-747b-fc95-5825e1c3419f', 'Ms. test 11 next', '2016-11-11 15:17:59', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 1, 0),
(449, 'ed800149-cd02-3b43-726f-5825e133b040', '1', 'RT_Payroll', 'bdcdab20-d490-b846-1216-5825e1f70850', 'Payroll 6 0', '2016-11-11 15:18:33', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(450, 'e109b14e-1924-0032-8030-5825e1d6bad3', '1', 'RT_Payroll', '62e8ad8f-0bed-caff-5263-5825e1e92e2b', 'Payroll 6 0', '2016-11-11 15:19:19', 'detailview', 'hov58lfq8hb26em171upa8r4o1', 0, 0),
(451, '9276bd5d-3d55-d195-4199-58295ec9304c', '1', 'RT_Payroll', '42ffbeac-7200-ddac-022d-58295ea1c62c', 'Payroll 6 0', '2016-11-14 06:48:22', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 0, 0),
(453, 'aaa13ae3-f865-c43a-d8d2-58296492a93e', '1', 'RT_Payroll', 'dfbc0933-dfa5-8311-c68d-582960ac18ef', 'Payroll ofatif zulfiqar  2 2016', '2016-11-14 07:14:13', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 0, 0),
(454, '229270a9-9614-aa33-4ab6-5829648561b7', '1', 'RT_Payroll', 'e46e7403-ba32-91b2-ffeb-582964e22612', 'Payroll oftest salary  2 2018', '2016-11-14 07:14:28', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 0, 0),
(456, 'e7743fb8-1c05-0bc0-15f6-58296865d539', '1', 'RT_Payroll', 'e78c4efb-2851-17ac-9d45-58296696102c', 'Payroll ofsalary tt  6 2016', '2016-11-14 07:32:32', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 0, 0),
(458, 'd99bb407-67b7-4577-62f6-58296a5fd751', '1', 'RT_Payroll', '8cf1549e-c76b-23d1-a4a1-58296a739d49', 'Payroll oftest  14 nov  7 2016', '2016-11-14 07:41:19', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(459, '95ad05ba-a527-956f-a39f-58296c3ab879', '1', 'RT_Payroll', 'b8ba4b77-b006-02d5-eb58-58296c7ac324', 'Payroll oftest  14 nov  4 2000', '2016-11-14 07:49:04', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(460, '21f70c32-57f6-1518-7d88-58296c559303', '1', 'RT_Payroll', 'a3433746-cae1-c999-7642-58296c23e25e', 'Payroll oftest  14 nov  2 2000', '2016-11-14 07:50:45', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(461, '4fbfd774-cd21-e102-6f42-58296d7c653f', '1', 'RT_Payroll', 'f132fc43-4e0a-169b-22d9-58296dd665c3', 'Payroll oftest  14 nov  4 2000', '2016-11-14 07:53:19', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(463, 'e57e5ea7-f74c-ce27-229c-58296f442359', '1', 'RT_Payroll', '67d66ae3-b194-1df1-91fe-58296fa619c3', 'Payroll oftest  14 nov  2 2000', '2016-11-14 08:00:12', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(464, '34d2ec52-bd1e-23d4-1a46-5829706bb43a', '1', 'RT_Payroll', '6bac980a-8758-640b-911a-582970b96cf4', 'Payroll oftest  14 nov  2 2000', '2016-11-14 08:06:19', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(465, '8a5f1488-ca7f-25ad-3c32-5829701ac165', '1', 'RT_Payroll', 'c634e050-bc34-d0d8-169a-582970238432', 'Payroll oftest  14 nov  5 2000', '2016-11-14 08:07:15', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(483, '66c775ef-0129-a4f5-c87c-5829867e70e2', '1', 'RT_Departments', 'e1de8860-9d36-6110-c20c-582479f8667d', 'husy department', '2016-11-14 09:41:45', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(507, 'f336ccac-f239-1de4-cda6-58298f50885a', '1', 'RT_Payroll', '18a7f190-327c-8fcc-8ccb-58297e3b4b18', 'Payroll oftest  14 nov  6 2000', '2016-11-14 10:18:34', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(521, 'ceb8b2ad-a588-6530-1000-5829926d6db2', '1', 'RT_Employees', 'df24096f-6644-4db0-1208-58296a7a7fba', 'Mr. test  14 nov', '2016-11-14 10:32:06', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(525, '80ef9bf6-2101-50c0-2362-582992a42a19', '1', 'RT_Payroll', '7406bfc2-6344-bb15-400b-582983ce398c', 'Payroll oftest  14 nov  5 2000', '2016-11-14 10:33:14', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(528, 'f36066bd-c616-54ef-9d89-58299514f91c', '1', 'RT_Departments', '2242f248-4c15-a46b-ba1c-58247cb61f11', 'test fianl department', '2016-11-14 10:43:42', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(529, '562b000a-e475-d705-8685-582995d2d390', '1', 'RT_Payroll', '8e84d12a-3f5a-b073-f61a-58298f1fd840', NULL, '2016-11-14 10:43:49', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(530, '33f2ccb7-3930-71c5-f321-5829953f8fad', '1', 'RT_Payroll', '42c5b9b2-3d33-1c9f-e652-5829905a23af', 'Payroll ofatif zulfiqar  3 2000', '2016-11-14 10:43:57', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(531, 'a0af1248-1f52-fb8d-e96d-582998281c30', '1', 'RT_Payroll', 'c127fdb0-359e-7d1e-fa6a-58299824ca90', 'Payroll 4 2000', '2016-11-14 10:55:03', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(532, '373da4af-9539-d11f-464a-582998b6fb62', '1', 'RT_Payroll', '7138d115-4d78-1efc-9894-58299872d26d', 'Payroll oftest  14 nov  2 2000', '2016-11-14 10:57:53', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(533, 'dfa4c117-826e-c7a4-1829-582998ecf47c', '1', 'RT_Payroll', 'eec60aef-c7f9-527b-3762-58299801bf42', 'Payroll 4 2000', '2016-11-14 10:58:40', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(534, '70f0abf1-6524-2654-2f2c-58299960689a', '1', 'RT_Payroll', '9c381038-e0cb-4c1b-619b-58299912826b', 'Payroll 2 2000', '2016-11-14 11:01:36', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(535, 'c5745910-4018-623b-834f-58299a73409c', '1', 'RT_Payroll', '2d0807e7-8831-59b4-c9b6-58299a36c792', 'Payroll oftest  14 nov  3 2000', '2016-11-14 11:04:39', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(536, '8b7bd58f-069a-4d9b-c092-58299c173727', '1', 'RT_Employees', 'c176d323-e9eb-0c9a-1c44-58299c7c1ff2', 'Mr. test  salary 14', '2016-11-14 11:14:27', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(538, '127c7f6f-a3a7-ddd8-df6a-58299e3b539a', '1', 'RT_Payroll', '3d804963-2a2d-42b5-5c51-58299e62da38', 'Payroll oftest  husy  3 2000', '2016-11-14 11:21:06', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(541, 'd6ab0cf4-1016-e7b5-fea6-5829a13ee826', '1', 'RT_Payroll', '89b50677-28ca-ae69-fd0b-5829a12ab465', 'Payroll oftest  husy  6 2000', '2016-11-14 11:37:09', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(542, 'f1f680b4-ffdc-b67f-7abf-5829a1560afd', '1', 'RT_Payroll', '1b03ecc7-5ca0-e9e8-b11e-5829a1e5f5d6', 'Payroll oftest  husy  12 2000', '2016-11-14 11:37:31', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(543, 'ef7ecd95-40b3-174b-6e8b-5829a36d0f3a', '1', 'RT_Payroll', '2059efcb-f22b-9037-d4af-5829a3203e0a', 'Payroll oftest  husy  4 2039', '2016-11-14 11:44:07', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(544, 'cab31f06-9888-372e-517f-5829a3495a96', '1', 'RT_Payroll', 'f113c288-2adc-531f-8698-5829a340e767', 'Payroll oftest  salary 14  3 2000', '2016-11-14 11:44:22', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0);
INSERT INTO `tracker` (`id`, `monitor_id`, `user_id`, `module_name`, `item_id`, `item_summary`, `date_modified`, `action`, `session_id`, `visible`, `deleted`) VALUES
(545, '91895dcc-dc76-0714-1eeb-5829a3a4626d', '1', 'RT_Payroll', 'adc85af6-d5f8-4c46-a966-5829a35c09bf', 'Payroll oftest  husy  2 2000', '2016-11-14 11:45:21', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(546, 'ed6830e9-dd86-3e29-aff3-5829a4919288', '1', 'RT_Payroll', '1b689704-08b1-6274-44b0-5829a4dd07cd', 'Payroll oftest  husy  4 2011', '2016-11-14 11:48:35', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(547, 'bbdb0107-85fa-442e-8064-5829abc4d495', '1', 'RT_Payroll', '72fecb72-ebc7-faa4-e6f0-5829abfc67dd', 'Payroll oftest  husy  2 2014', '2016-11-14 12:16:01', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(548, 'bd4e1d51-a496-44dd-f03e-5829abcd8379', '1', 'RT_Payroll', 'c5b50948-b665-102f-7373-5829ab8f3320', 'Payroll oftest  husy  2 2016', '2016-11-14 12:16:20', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(549, '9d1a0f8e-147e-7917-f945-5829ac1f2e57', '1', 'RT_Payroll', 'da57dbcf-1058-3026-5fd1-5829acae963f', 'Payroll oftest  husy  2 2000', '2016-11-14 12:21:52', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(550, 'bc401690-53a4-96b4-f941-5829ad31da53', '1', 'RT_Payroll', 'c768027d-9cf3-c8a8-3c12-5829adc0d341', 'Payroll oftest  husy  9 2014', '2016-11-14 12:25:47', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(551, '4d3d19e7-61db-0605-6bf3-5829b616d3cc', '1', 'RT_Payroll', '8c871776-2483-3da0-ad9b-5829b62acc3a', 'Payroll oftest  husy  10 2019', '2016-11-14 13:03:18', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(554, '9b347558-372b-cd2f-736b-5829c5ec42e3', '1', 'RT_Payroll', 'ca97ad9f-a256-6599-1e34-5829c1e7bcf9', 'Payroll oftest  husy  3 2016', '2016-11-14 14:09:44', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(555, '7b58975c-d037-da09-0976-5829c6a7ca7b', '1', 'RT_Employees', 'c61b0bc1-4fd4-51ad-076c-5829c678e76e', 'Mr. test  1412', '2016-11-14 14:13:17', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(556, '63470132-f0e6-6324-c267-5829c6b81c70', '1', 'RT_Employees', '1e300425-7cf1-5562-e81b-5829c66cfed9', 'Mr. etst mmm', '2016-11-14 14:14:11', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(557, 'ac96db90-a379-e214-1c9f-5829c637838f', '1', 'RT_Payroll', 'c75e6078-b2ae-07ee-d633-5829c657d3ad', 'Payroll 6 2016', '2016-11-14 14:14:33', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(568, '47eb1ddc-84fc-803f-4e42-5829cdd6979c', '1', 'RT_Employees', '4293caf3-8658-7509-b509-58299d9743d6', 'Mr. test  husy', '2016-11-14 14:44:37', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(570, '222ffa02-7cc4-ed15-c9d1-5829d7200c00', '1', 'RT_Payroll', 'dcc1b228-ec5b-30df-a5a7-5829bd3e25dc', 'Payroll oftest  husy  9 2015', '2016-11-14 15:25:44', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(572, 'e3581083-0e9a-130d-35da-582ab69f1914', '1', 'RT_Payroll', '14616535-7047-ff6f-8f89-582ab650e378', 'Payroll 4 2018', '2016-11-15 07:16:48', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(575, '551042cf-c37e-bed7-e2be-582ab9c86401', '1', 'RT_Payroll', '830dda78-8101-a286-f063-582ab926964e', 'Payroll oftoday 15  8 2000', '2016-11-15 07:31:07', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(576, 'e1aba7a5-25f0-cd13-8811-582ab9bba837', '1', 'RT_Payroll', 'f33c820d-c8d4-bdda-2c55-582ab9fe89a9', 'Payroll 3 2000', '2016-11-15 07:31:33', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(579, '7010a9c1-5e0d-e34d-5032-582abcc1b872', '1', 'RT_Payroll', '720d7f71-a2e5-d69f-4d9a-582abcedfbaf', 'Payroll oftoday 15  5 2000', '2016-11-15 07:43:24', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(580, 'e341cc5b-7a3f-3d52-87a7-582ac120e312', '1', 'RT_Payroll', '156b25b4-e4f3-71f0-caff-582ac11a73e9', 'Payroll oftoday 15  5 2013', '2016-11-15 08:03:10', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(581, '4a73867c-e1ce-ae56-d82b-582ad0f234ff', '1', 'RT_Payroll', '5e21152b-a3f0-3963-06fe-582ad0384e13', 'Payroll oftest  salary 14  3 2000', '2016-11-15 09:08:40', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(582, 'c24adee4-ffa5-fcc0-ebfa-582ad03d8e78', '1', 'RT_Payroll', 'd379c9bb-fc74-b4fb-6692-582ad0d35f0d', 'Payroll 10 2015', '2016-11-15 09:09:27', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(583, '8d4f0f9d-ff97-1403-559f-582ad8586af6', '1', 'RT_Payroll', '1d59088b-e5b4-1511-093b-582ad8cfe726', 'Payroll oftoday 15  2 2000', '2016-11-15 09:43:29', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(584, '28ad6605-894c-0744-79a8-582ad9279d87', '1', 'RT_Payroll', '3ca9a804-a7b2-9142-01ad-582ad9827124', 'Payroll oftoday 15  3 2000', '2016-11-15 09:45:59', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(585, '4620c62c-79e6-cfde-1b32-582adafd3e9f', '1', 'RT_Payroll', '60f2fb80-153d-d006-96a7-582adae1974c', 'Payroll oftoday 15  2 2018', '2016-11-15 09:49:11', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(586, '7d57b5b9-726c-c6f0-00e8-582ada7bf415', '1', 'RT_Payroll', '8dc712d4-a9ba-6ff1-ef31-582adaaac7b9', 'Payroll oftest  husy today 15  3 2000', '2016-11-15 09:49:48', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(587, '7f7c0d00-0a49-cf61-1b74-582addb9ae92', '1', 'RT_Payroll', '86e7607f-c180-e30a-b4fb-582addbc9340', 'Payroll oftoday 15  4 2000', '2016-11-15 10:02:08', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(588, '85c7c992-84e9-752b-1b9e-582addc302ab', '1', 'RT_Payroll', '78399783-e3dd-c4e2-3ddc-582addb37d7f', 'Payroll 4 2000', '2016-11-15 10:03:29', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(589, '31011af8-e6c5-eb9e-c2c5-582af075c649', '1', 'Leads', '21680eb7-82a6-c46d-7002-582af0005131', 'asdas', '2016-11-15 11:25:36', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(590, '62ab8590-35cd-4ee4-4974-582af1e66bb5', '1', 'RT_Payroll', '514278ff-6d21-702c-fb18-582af08f25d1', 'Payroll of today 15  6 2018', '2016-11-15 11:27:50', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(596, '59a775c5-244c-7a54-2b77-582af3d27d7f', '1', 'RT_Payroll', 'dc84e3c0-4193-dfb2-9b5b-582af3acd184', 'Payroll of today 15  1 2005', '2016-11-15 11:36:11', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(597, '4a7739d0-eb77-5a48-00db-582d4a8a7997', '1', 'RT_Payroll', '1bd14428-0219-5834-c306-582af270f61e', 'Payroll of today 15  3 2017', '2016-11-17 06:12:54', 'detailview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(602, '94ee4032-0308-999c-d4a6-582ee0c20d0f', '1', 'AOS_PDF_Templates', '1689f62b-fb36-3071-89d4-582ee080f758', 'aaaa', '2016-11-18 11:07:43', 'editview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0),
(604, '4eeef722-1616-7c81-6c11-582eebf4260a', '1', 'RT_Employees', '74ded684-06c4-ac4d-33d5-582ab6d3b7fd', 'Mr. today 15', '2016-11-18 11:53:18', 'editview', 'in7v50b724u8ec0dtvk9cvo7v0', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_history`
--

CREATE TABLE IF NOT EXISTS `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upgrade_history`
--

INSERT INTO `upgrade_history` (`id`, `filename`, `md5sum`, `type`, `status`, `version`, `name`, `description`, `id_name`, `manifest`, `date_entered`, `enabled`) VALUES
('1072dc61-3118-3b7e-0062-58241b708358', 'upload/upgrades/module/Increment_History2016_11_10_120321.zip', '0faf65cc48a3b801849d2fb3209e5243', 'module', 'installed', '1478761400', 'Increment_History', '', 'Increment_History', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjE3OiJJbmNyZW1lbnRfSGlzdG9yeSI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTk6IjIwMTYtMTEtMTAgMDc6MDM6MjAiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6NzoidmVyc2lvbiI7aToxNDc4NzYxNDAwO3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6OTp7czoyOiJpZCI7czoxNzoiSW5jcmVtZW50X0hpc3RvcnkiO3M6NToiYmVhbnMiO2E6MTp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6MjA6IlJUX0luY3JlbWVudF9IaXN0b3J5IjtzOjU6ImNsYXNzIjtzOjIwOiJSVF9JbmNyZW1lbnRfSGlzdG9yeSI7czo0OiJwYXRoIjtzOjUzOiJtb2R1bGVzL1JUX0luY3JlbWVudF9IaXN0b3J5L1JUX0luY3JlbWVudF9IaXN0b3J5LnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjk5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvcnRfaW5jcmVtZW50X2hpc3RvcnlfcnRfZW1wbG95ZWVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO319czoxMzoicmVsYXRpb25zaGlwcyI7YToxOntpOjA7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3J0X2luY3JlbWVudF9oaXN0b3J5X3J0X2VtcGxveWVlc01ldGFEYXRhLnBocCI7fX1zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo1MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9SVF9JbmNyZW1lbnRfSGlzdG9yeSI7czoyOiJ0byI7czoyODoibW9kdWxlcy9SVF9JbmNyZW1lbnRfSGlzdG9yeSI7fX1zOjg6Imxhbmd1YWdlIjthOjM6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9SVF9JbmNyZW1lbnRfSGlzdG9yeS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIwOiJSVF9JbmNyZW1lbnRfSGlzdG9yeSI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9SVF9FbXBsb3llZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiUlRfRW1wbG95ZWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToyO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lbl91cy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9fXM6NzoidmFyZGVmcyI7YToyOntpOjA7YToyOntzOjQ6ImZyb20iO3M6MTA0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfaW5jcmVtZW50X2hpc3RvcnlfcnRfZW1wbG95ZWVzX1JUX0luY3JlbWVudF9IaXN0b3J5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjA6IlJUX0luY3JlbWVudF9IaXN0b3J5Ijt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfaW5jcmVtZW50X2hpc3RvcnlfcnRfZW1wbG95ZWVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO319czoxMjoibGF5b3V0ZmllbGRzIjthOjE6e2k6MDthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjA6e319fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==', '2016-11-10 07:03:20', 1),
('2197d5e1-7d00-90af-da2a-5829d1b12201', 'upload/upgrades/module/SalarySetting2016_11_14_200151.zip', '76835478106c640833acef7b9f5e60f5', 'module', 'installed', '1479135711', 'SalarySetting', '', 'SalarySetting', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjEzOiJTYWxhcnlTZXR0aW5nIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNi0xMS0xNCAxNTowMTo1MSI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjE0NzkxMzU3MTE7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo3OntzOjI6ImlkIjtzOjEzOiJTYWxhcnlTZXR0aW5nIjtzOjU6ImJlYW5zIjthOjE6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjE2OiJSVF9TYWxhcnlTZXR0aW5nIjtzOjU6ImNsYXNzIjtzOjE2OiJSVF9TYWxhcnlTZXR0aW5nIjtzOjQ6InBhdGgiO3M6NDU6Im1vZHVsZXMvUlRfU2FsYXJ5U2V0dGluZy9SVF9TYWxhcnlTZXR0aW5nLnBocCI7czozOiJ0YWIiO2I6MDt9fXM6MTA6ImxheW91dGRlZnMiO2E6MDp7fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6MDp7fXM6OToiaW1hZ2VfZGlyIjtzOjE2OiI8YmFzZXBhdGg+L2ljb25zIjtzOjQ6ImNvcHkiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjQ4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL1JUX1NhbGFyeVNldHRpbmciO3M6MjoidG8iO3M6MjQ6Im1vZHVsZXMvUlRfU2FsYXJ5U2V0dGluZyI7fX1zOjg6Imxhbmd1YWdlIjthOjE6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=', '2016-11-14 15:01:51', 1),
('246a1515-c773-ee36-ff67-580898f8d5bd', 'upload/upgrades/module/Candidates2016_10_20_151152.zip', 'e25109621e370419efb6c8f569e15992', 'module', 'installed', '1476958312', 'Candidates', '', 'Candidates', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjEwOiJDYW5kaWRhdGVzIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNi0xMC0yMCAxMDoxMTo1MiI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjE0NzY5NTgzMTI7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo3OntzOjI6ImlkIjtzOjEwOiJDYW5kaWRhdGVzIjtzOjU6ImJlYW5zIjthOjE6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjEzOiJSVF9DYW5kaWRhdGVzIjtzOjU6ImNsYXNzIjtzOjEzOiJSVF9DYW5kaWRhdGVzIjtzOjQ6InBhdGgiO3M6Mzk6Im1vZHVsZXMvUlRfQ2FuZGlkYXRlcy9SVF9DYW5kaWRhdGVzLnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6MDp7fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6MDp7fXM6OToiaW1hZ2VfZGlyIjtzOjE2OiI8YmFzZXBhdGg+L2ljb25zIjtzOjQ6ImNvcHkiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjQ1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL1JUX0NhbmRpZGF0ZXMiO3M6MjoidG8iO3M6MjE6Im1vZHVsZXMvUlRfQ2FuZGlkYXRlcyI7fX1zOjg6Imxhbmd1YWdlIjthOjE6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=', '2016-10-20 10:11:52', 1),
('658f75ff-b75a-4e73-c74f-5804960f460a', 'upload/upgrades/module/Employee_Management2016_10_17_141450.zip', 'd62e16afa36f4546ead0dd1cbb349db5', 'module', 'installed', '1476695689', 'Employee_Management', '', 'Employee_Management', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjE5OiJFbXBsb3llZV9NYW5hZ2VtZW50IjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNi0xMC0xNyAwOToxNDo0OSI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjE0NzY2OTU2ODk7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo5OntzOjI6ImlkIjtzOjE5OiJFbXBsb3llZV9NYW5hZ2VtZW50IjtzOjU6ImJlYW5zIjthOjc6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjIwOiJSVF9JbmNyZW1lbnRfSGlzdG9yeSI7czo1OiJjbGFzcyI7czoyMDoiUlRfSW5jcmVtZW50X0hpc3RvcnkiO3M6NDoicGF0aCI7czo1MzoibW9kdWxlcy9SVF9JbmNyZW1lbnRfSGlzdG9yeS9SVF9JbmNyZW1lbnRfSGlzdG9yeS5waHAiO3M6MzoidGFiIjtiOjE7fWk6MTthOjQ6e3M6NjoibW9kdWxlIjtzOjEwOiJSVF9QYXlyb2xsIjtzOjU6ImNsYXNzIjtzOjEwOiJSVF9QYXlyb2xsIjtzOjQ6InBhdGgiO3M6MzM6Im1vZHVsZXMvUlRfUGF5cm9sbC9SVF9QYXlyb2xsLnBocCI7czozOiJ0YWIiO2I6MTt9aToyO2E6NDp7czo2OiJtb2R1bGUiO3M6MTI6IlJUX0VtcGxveWVlcyI7czo1OiJjbGFzcyI7czoxMjoiUlRfRW1wbG95ZWVzIjtzOjQ6InBhdGgiO3M6Mzc6Im1vZHVsZXMvUlRfRW1wbG95ZWVzL1JUX0VtcGxveWVlcy5waHAiO3M6MzoidGFiIjtiOjE7fWk6MzthOjQ6e3M6NjoibW9kdWxlIjtzOjg6IlJUX0JvbnVzIjtzOjU6ImNsYXNzIjtzOjg6IlJUX0JvbnVzIjtzOjQ6InBhdGgiO3M6Mjk6Im1vZHVsZXMvUlRfQm9udXMvUlRfQm9udXMucGhwIjtzOjM6InRhYiI7YjoxO31pOjQ7YTo0OntzOjY6Im1vZHVsZSI7czo5OiJSVF9MZWF2ZXMiO3M6NToiY2xhc3MiO3M6OToiUlRfTGVhdmVzIjtzOjQ6InBhdGgiO3M6MzE6Im1vZHVsZXMvUlRfTGVhdmVzL1JUX0xlYXZlcy5waHAiO3M6MzoidGFiIjtiOjE7fWk6NTthOjQ6e3M6NjoibW9kdWxlIjtzOjE0OiJSVF9EZWR1Y3RhYmxlcyI7czo1OiJjbGFzcyI7czoxNDoiUlRfRGVkdWN0YWJsZXMiO3M6NDoicGF0aCI7czo0MToibW9kdWxlcy9SVF9EZWR1Y3RhYmxlcy9SVF9EZWR1Y3RhYmxlcy5waHAiO3M6MzoidGFiIjtiOjE7fWk6NjthOjQ6e3M6NjoibW9kdWxlIjtzOjEzOiJSVF9BcHByYWlzYWxzIjtzOjU6ImNsYXNzIjtzOjEzOiJSVF9BcHByYWlzYWxzIjtzOjQ6InBhdGgiO3M6Mzk6Im1vZHVsZXMvUlRfQXBwcmFpc2Fscy9SVF9BcHByYWlzYWxzLnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6ODp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjg4OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvcnRfZW1wbG95ZWVzX3J0X2xlYXZlc19SVF9FbXBsb3llZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiUlRfRW1wbG95ZWVzIjt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjg3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvcnRfZW1wbG95ZWVzX3J0X2JvbnVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6OTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ydF9lbXBsb3llZXNfcnRfaW5jcmVtZW50X2hpc3RvcnlfUlRfRW1wbG95ZWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IlJUX0VtcGxveWVlcyI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czo5MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYXlvdXRkZWZzL3J0X2VtcGxveWVlc19ydF9hcHByYWlzYWxzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO31pOjQ7YToyOntzOjQ6ImZyb20iO3M6ODk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ydF9lbXBsb3llZXNfcnRfcGF5cm9sbF9SVF9FbXBsb3llZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiUlRfRW1wbG95ZWVzIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjkzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvcnRfZW1wbG95ZWVzX3J0X2RlZHVjdGFibGVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO31pOjY7YToyOntzOjQ6ImZyb20iO3M6ODg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ydF9lbXBsb3llZXNfZG9jdW1lbnRzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO31pOjc7YToyOntzOjQ6ImZyb20iO3M6OTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ydF9lbXBsb3llZXNfcnRfZW1wbG95ZWVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO319czoxMzoicmVsYXRpb25zaGlwcyI7YTo4OntpOjA7YToxOntzOjk6Im1ldGFfZGF0YSI7czo4NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3J0X2VtcGxveWVlc19ydF9sZWF2ZXNNZXRhRGF0YS5waHAiO31pOjE7YToxOntzOjk6Im1ldGFfZGF0YSI7czo4NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3J0X2VtcGxveWVlc19ydF9ib251c01ldGFEYXRhLnBocCI7fWk6MjthOjE6e3M6OToibWV0YV9kYXRhIjtzOjk3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvcnRfZW1wbG95ZWVzX3J0X2luY3JlbWVudF9oaXN0b3J5TWV0YURhdGEucGhwIjt9aTozO2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6OTA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy9ydF9lbXBsb3llZXNfcnRfYXBwcmFpc2Fsc01ldGFEYXRhLnBocCI7fWk6NDthOjE6e3M6OToibWV0YV9kYXRhIjtzOjg3OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvcnRfZW1wbG95ZWVzX3J0X3BheXJvbGxNZXRhRGF0YS5waHAiO31pOjU7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3J0X2VtcGxveWVlc19ydF9kZWR1Y3RhYmxlc01ldGFEYXRhLnBocCI7fWk6NjthOjE6e3M6OToibWV0YV9kYXRhIjtzOjg2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvcnRfZW1wbG95ZWVzX2RvY3VtZW50c01ldGFEYXRhLnBocCI7fWk6NzthOjE6e3M6OToibWV0YV9kYXRhIjtzOjg5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvcnRfZW1wbG95ZWVzX3J0X2VtcGxveWVlc01ldGFEYXRhLnBocCI7fX1zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjc6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo1MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9SVF9JbmNyZW1lbnRfSGlzdG9yeSI7czoyOiJ0byI7czoyODoibW9kdWxlcy9SVF9JbmNyZW1lbnRfSGlzdG9yeSI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czo0MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9SVF9QYXlyb2xsIjtzOjI6InRvIjtzOjE4OiJtb2R1bGVzL1JUX1BheXJvbGwiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6NDQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvUlRfRW1wbG95ZWVzIjtzOjI6InRvIjtzOjIwOiJtb2R1bGVzL1JUX0VtcGxveWVlcyI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czo0MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9SVF9Cb251cyI7czoyOiJ0byI7czoxNjoibW9kdWxlcy9SVF9Cb251cyI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czo0MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9SVF9MZWF2ZXMiO3M6MjoidG8iO3M6MTc6Im1vZHVsZXMvUlRfTGVhdmVzIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjQ2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL1JUX0RlZHVjdGFibGVzIjtzOjI6InRvIjtzOjIyOiJtb2R1bGVzL1JUX0RlZHVjdGFibGVzIjt9aTo2O2E6Mjp7czo0OiJmcm9tIjtzOjQ1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL1JUX0FwcHJhaXNhbHMiO3M6MjoidG8iO3M6MjE6Im1vZHVsZXMvUlRfQXBwcmFpc2FscyI7fX1zOjg6Imxhbmd1YWdlIjthOjE2OntpOjA7YTozOntzOjQ6ImZyb20iO3M6NjA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvUlRfTGVhdmVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiUlRfTGVhdmVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxO2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjI7YTozOntzOjQ6ImZyb20iO3M6NTk6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvUlRfQm9udXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJSVF9Cb251cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MzthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9SVF9FbXBsb3llZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiUlRfRW1wbG95ZWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo0O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1JUX0luY3JlbWVudF9IaXN0b3J5LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjA6IlJUX0luY3JlbWVudF9IaXN0b3J5IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo1O2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjY7YTozOntzOjQ6ImZyb20iO3M6NjQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvUlRfQXBwcmFpc2Fscy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJSVF9BcHByYWlzYWxzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo3O2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjg7YTozOntzOjQ6ImZyb20iO3M6NjE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvUlRfUGF5cm9sbC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJSVF9QYXlyb2xsIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo5O2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjEwO2E6Mzp7czo0OiJmcm9tIjtzOjY1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1JUX0RlZHVjdGFibGVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IlJUX0RlZHVjdGFibGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxMTthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9SVF9FbXBsb3llZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiUlRfRW1wbG95ZWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxMjthOjM6e3M6NDoiZnJvbSI7czo2MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9Eb2N1bWVudHMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjEzO2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE0O2E6Mzp7czo0OiJmcm9tIjtzOjYzOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE1O2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lbl91cy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9fXM6NzoidmFyZGVmcyI7YToxNTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjgyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfZW1wbG95ZWVzX3J0X2xlYXZlc19SVF9MZWF2ZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJSVF9MZWF2ZXMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6ODU6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ydF9lbXBsb3llZXNfcnRfbGVhdmVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6ODA6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ydF9lbXBsb3llZXNfcnRfYm9udXNfUlRfQm9udXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJSVF9Cb251cyI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czo4NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3J0X2VtcGxveWVlc19ydF9ib251c19SVF9FbXBsb3llZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiUlRfRW1wbG95ZWVzIjt9aTo0O2E6Mjp7czo0OiJmcm9tIjtzOjEwNDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3J0X2VtcGxveWVlc19ydF9pbmNyZW1lbnRfaGlzdG9yeV9SVF9JbmNyZW1lbnRfSGlzdG9yeS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIwOiJSVF9JbmNyZW1lbnRfSGlzdG9yeSI7fWk6NTthOjI6e3M6NDoiZnJvbSI7czo5NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3J0X2VtcGxveWVlc19ydF9pbmNyZW1lbnRfaGlzdG9yeV9SVF9FbXBsb3llZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiUlRfRW1wbG95ZWVzIjt9aTo2O2E6Mjp7czo0OiJmcm9tIjtzOjkwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfZW1wbG95ZWVzX3J0X2FwcHJhaXNhbHNfUlRfQXBwcmFpc2Fscy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJSVF9BcHByYWlzYWxzIjt9aTo3O2E6Mjp7czo0OiJmcm9tIjtzOjg5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfZW1wbG95ZWVzX3J0X2FwcHJhaXNhbHNfUlRfRW1wbG95ZWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IlJUX0VtcGxveWVlcyI7fWk6ODthOjI6e3M6NDoiZnJvbSI7czo4NDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3J0X2VtcGxveWVlc19ydF9wYXlyb2xsX1JUX1BheXJvbGwucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiUlRfUGF5cm9sbCI7fWk6OTthOjI6e3M6NDoiZnJvbSI7czo4NjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3J0X2VtcGxveWVlc19ydF9wYXlyb2xsX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO31pOjEwO2E6Mjp7czo0OiJmcm9tIjtzOjkyOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfZW1wbG95ZWVzX3J0X2RlZHVjdGFibGVzX1JUX0RlZHVjdGFibGVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IlJUX0RlZHVjdGFibGVzIjt9aToxMTthOjI6e3M6NDoiZnJvbSI7czo5MDoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3J0X2VtcGxveWVlc19ydF9kZWR1Y3RhYmxlc19SVF9FbXBsb3llZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiUlRfRW1wbG95ZWVzIjt9aToxMjthOjI6e3M6NDoiZnJvbSI7czo4MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3J0X2VtcGxveWVlc19kb2N1bWVudHNfRG9jdW1lbnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjt9aToxMzthOjI6e3M6NDoiZnJvbSI7czo4NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy92YXJkZWZzL3J0X2VtcGxveWVlc19kb2N1bWVudHNfUlRfRW1wbG95ZWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IlJUX0VtcGxveWVlcyI7fWk6MTQ7YToyOntzOjQ6ImZyb20iO3M6ODg6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ydF9lbXBsb3llZXNfcnRfZW1wbG95ZWVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO319czoxMjoibGF5b3V0ZmllbGRzIjthOjg6e2k6MDthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjA6e319aToxO2E6MTp7czoxNzoiYWRkaXRpb25hbF9maWVsZHMiO2E6MDp7fX1pOjI7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YTowOnt9fWk6MzthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjA6e319aTo0O2E6MTp7czoxNzoiYWRkaXRpb25hbF9maWVsZHMiO2E6MDp7fX1pOjU7YToxOntzOjE3OiJhZGRpdGlvbmFsX2ZpZWxkcyI7YTowOnt9fWk6NjthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjE6e3M6OToiRG9jdW1lbnRzIjtzOjI3OiJydF9lbXBsb3llZXNfZG9jdW1lbnRzX25hbWUiO319aTo3O2E6MTp7czoxNzoiYWRkaXRpb25hbF9maWVsZHMiO2E6MDp7fX19fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9', '2016-10-17 09:14:49', 1),
('821005a7-8ba5-952a-915e-58259a127f28', 'upload/upgrades/module/Pay_Track2016_11_11_151712.zip', '9cad5ff6d3bac69779652086dad8c526', 'module', 'installed', '1478859432', 'Pay_Track', '', 'Pay_Track', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjk6IlBheV9UcmFjayI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTk6IjIwMTYtMTEtMTEgMTA6MTc6MTIiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6NzoidmVyc2lvbiI7aToxNDc4ODU5NDMyO3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6Nzp7czoyOiJpZCI7czo5OiJQYXlfVHJhY2siO3M6NToiYmVhbnMiO2E6MTp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6MTQ6IlJUX1BheV9UcmFja2VyIjtzOjU6ImNsYXNzIjtzOjE0OiJSVF9QYXlfVHJhY2tlciI7czo0OiJwYXRoIjtzOjQxOiJtb2R1bGVzL1JUX1BheV9UcmFja2VyL1JUX1BheV9UcmFja2VyLnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6MDp7fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6MDp7fXM6OToiaW1hZ2VfZGlyIjtzOjE2OiI8YmFzZXBhdGg+L2ljb25zIjtzOjQ6ImNvcHkiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjQ2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL1JUX1BheV9UcmFja2VyIjtzOjI6InRvIjtzOjIyOiJtb2R1bGVzL1JUX1BheV9UcmFja2VyIjt9fXM6ODoibGFuZ3VhZ2UiO2E6MTp7aTowO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lbl91cy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==', '2016-11-11 10:17:12', 1),
('83c50cee-6455-07a7-ff9d-582333716652', 'upload/upgrades/module/Increment_Histroy2016_11_09_193333.zip', '1947971a95ae453a43d1a1ed39e3c386', 'module', 'installed', '1478702013', 'Increment_Histroy', '', 'Increment_Histroy', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjE3OiJJbmNyZW1lbnRfSGlzdHJveSI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTk6IjIwMTYtMTEtMDkgMTQ6MzM6MzMiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6NzoidmVyc2lvbiI7aToxNDc4NzAyMDEzO3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6OTp7czoyOiJpZCI7czoxNzoiSW5jcmVtZW50X0hpc3Ryb3kiO3M6NToiYmVhbnMiO2E6MTp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6MjA6IlJUX0luY3JlbWVudF9IaXN0cm95IjtzOjU6ImNsYXNzIjtzOjIwOiJSVF9JbmNyZW1lbnRfSGlzdHJveSI7czo0OiJwYXRoIjtzOjUzOiJtb2R1bGVzL1JUX0luY3JlbWVudF9IaXN0cm95L1JUX0luY3JlbWVudF9IaXN0cm95LnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjk5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvcnRfaW5jcmVtZW50X2hpc3Ryb3lfcnRfZW1wbG95ZWVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO319czoxMzoicmVsYXRpb25zaGlwcyI7YToxOntpOjA7YToxOntzOjk6Im1ldGFfZGF0YSI7czo5NzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9yZWxhdGlvbnNoaXBzL3J0X2luY3JlbWVudF9oaXN0cm95X3J0X2VtcGxveWVlc01ldGFEYXRhLnBocCI7fX1zOjk6ImltYWdlX2RpciI7czoxNjoiPGJhc2VwYXRoPi9pY29ucyI7czo0OiJjb3B5IjthOjE6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo1MjoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbW9kdWxlcy9SVF9JbmNyZW1lbnRfSGlzdHJveSI7czoyOiJ0byI7czoyODoibW9kdWxlcy9SVF9JbmNyZW1lbnRfSGlzdHJveSI7fX1zOjg6Imxhbmd1YWdlIjthOjM6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9SVF9JbmNyZW1lbnRfSGlzdHJveS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjIwOiJSVF9JbmNyZW1lbnRfSGlzdHJveSI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTthOjM6e3M6NDoiZnJvbSI7czo2MzoiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9SVF9FbXBsb3llZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMjoiUlRfRW1wbG95ZWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToyO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lbl91cy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9fXM6NzoidmFyZGVmcyI7YToyOntpOjA7YToyOntzOjQ6ImZyb20iO3M6MTA0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfaW5jcmVtZW50X2hpc3Ryb3lfcnRfZW1wbG95ZWVzX1JUX0luY3JlbWVudF9IaXN0cm95LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MjA6IlJUX0luY3JlbWVudF9IaXN0cm95Ijt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjk2OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfaW5jcmVtZW50X2hpc3Ryb3lfcnRfZW1wbG95ZWVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO319czoxMjoibGF5b3V0ZmllbGRzIjthOjE6e2k6MDthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjA6e319fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==', '2016-11-09 14:33:33', 1),
('9439085d-63db-f715-3050-58232c45549c', 'upload/upgrades/module/Bonus2016_11_09_190106.zip', 'f92e51c10b99608e917b3baadb163dfe', 'module', 'installed', '1478700066', 'Bonus', '', 'Bonus', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjU6IkJvbnVzIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNi0xMS0wOSAxNDowMTowNiI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjE0Nzg3MDAwNjY7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo5OntzOjI6ImlkIjtzOjU6IkJvbnVzIjtzOjU6ImJlYW5zIjthOjE6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjg6IlJUX0JvbnVzIjtzOjU6ImNsYXNzIjtzOjg6IlJUX0JvbnVzIjtzOjQ6InBhdGgiO3M6Mjk6Im1vZHVsZXMvUlRfQm9udXMvUlRfQm9udXMucGhwIjtzOjM6InRhYiI7YjoxO319czoxMDoibGF5b3V0ZGVmcyI7YToxOntpOjA7YToyOntzOjQ6ImZyb20iO3M6ODc6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGF5b3V0ZGVmcy9ydF9ib251c19ydF9lbXBsb3llZXNfUlRfRW1wbG95ZWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IlJUX0VtcGxveWVlcyI7fX1zOjEzOiJyZWxhdGlvbnNoaXBzIjthOjE6e2k6MDthOjE6e3M6OToibWV0YV9kYXRhIjtzOjg1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3JlbGF0aW9uc2hpcHMvcnRfYm9udXNfcnRfZW1wbG95ZWVzTWV0YURhdGEucGhwIjt9fXM6OToiaW1hZ2VfZGlyIjtzOjE2OiI8YmFzZXBhdGg+L2ljb25zIjtzOjQ6ImNvcHkiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjQwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL1JUX0JvbnVzIjtzOjI6InRvIjtzOjE2OiJtb2R1bGVzL1JUX0JvbnVzIjt9fXM6ODoibGFuZ3VhZ2UiO2E6Mzp7aTowO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xhbmd1YWdlL1JUX0JvbnVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiUlRfQm9udXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvUlRfRW1wbG95ZWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IlJUX0VtcGxveWVlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX1zOjc6InZhcmRlZnMiO2E6Mjp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjgwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfYm9udXNfcnRfZW1wbG95ZWVzX1JUX0JvbnVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiUlRfQm9udXMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6ODQ6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ydF9ib251c19ydF9lbXBsb3llZXNfUlRfRW1wbG95ZWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IlJUX0VtcGxveWVlcyI7fX1zOjEyOiJsYXlvdXRmaWVsZHMiO2E6MTp7aTowO2E6MTp7czoxNzoiYWRkaXRpb25hbF9maWVsZHMiO2E6MDp7fX19fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9', '2016-11-09 14:01:06', 1),
('b0636f1a-b3e1-9062-c340-58246ef8a769', 'upload/upgrades/module/Departments2016_11_10_175502.zip', '5644b281c6b180f31055126ad5ccde06', 'module', 'installed', '1478782502', 'Departments', '', 'Departments', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjExOiJEZXBhcnRtZW50cyI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTk6IjIwMTYtMTEtMTAgMTI6NTU6MDEiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6NzoidmVyc2lvbiI7aToxNDc4NzgyNTAyO3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6OTp7czoyOiJpZCI7czoxMToiRGVwYXJ0bWVudHMiO3M6NToiYmVhbnMiO2E6MTp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6MTQ6IlJUX0RlcGFydG1lbnRzIjtzOjU6ImNsYXNzIjtzOjE0OiJSVF9EZXBhcnRtZW50cyI7czo0OiJwYXRoIjtzOjQxOiJtb2R1bGVzL1JUX0RlcGFydG1lbnRzL1JUX0RlcGFydG1lbnRzLnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjk1OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL2xheW91dGRlZnMvcnRfZGVwYXJ0bWVudHNfcnRfZW1wbG95ZWVzX1JUX0RlcGFydG1lbnRzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IlJUX0RlcGFydG1lbnRzIjt9fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6MTp7aTowO2E6MTp7czo5OiJtZXRhX2RhdGEiO3M6OTE6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvcmVsYXRpb25zaGlwcy9ydF9kZXBhcnRtZW50c19ydF9lbXBsb3llZXNNZXRhRGF0YS5waHAiO319czo5OiJpbWFnZV9kaXIiO3M6MTY6IjxiYXNlcGF0aD4vaWNvbnMiO3M6NDoiY29weSI7YToxOntpOjA7YToyOntzOjQ6ImZyb20iO3M6NDY6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL21vZHVsZXMvUlRfRGVwYXJ0bWVudHMiO3M6MjoidG8iO3M6MjI6Im1vZHVsZXMvUlRfRGVwYXJ0bWVudHMiO319czo4OiJsYW5ndWFnZSI7YTozOntpOjA7YTozOntzOjQ6ImZyb20iO3M6NjM6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvbGFuZ3VhZ2UvUlRfRW1wbG95ZWVzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTI6IlJUX0VtcGxveWVlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTthOjM6e3M6NDoiZnJvbSI7czo2NToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvcmVsYXRpb25zaGlwcy9sYW5ndWFnZS9SVF9EZXBhcnRtZW50cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJSVF9EZXBhcnRtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MjthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX1zOjc6InZhcmRlZnMiO2E6Mjp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjkwOiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9yZWxhdGlvbnNoaXBzL3ZhcmRlZnMvcnRfZGVwYXJ0bWVudHNfcnRfZW1wbG95ZWVzX1JUX0VtcGxveWVlcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEyOiJSVF9FbXBsb3llZXMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6OTI6IjxiYXNlcGF0aD4vU3VnYXJNb2R1bGVzL3JlbGF0aW9uc2hpcHMvdmFyZGVmcy9ydF9kZXBhcnRtZW50c19ydF9lbXBsb3llZXNfUlRfRGVwYXJ0bWVudHMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiUlRfRGVwYXJ0bWVudHMiO319czoxMjoibGF5b3V0ZmllbGRzIjthOjE6e2k6MDthOjE6e3M6MTc6ImFkZGl0aW9uYWxfZmllbGRzIjthOjE6e3M6MTI6IlJUX0VtcGxveWVlcyI7czozMjoicnRfZGVwYXJ0bWVudHNfcnRfZW1wbG95ZWVzX25hbWUiO319fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==', '2016-11-10 12:55:01', 1),
('d91a9e38-b2fc-e68e-1173-5809b49270d0', 'upload/upgrades/module/Performance_Reviews2016_10_21_112331.zip', '33c03dbb8cf48c30906610fd887d6a2f', 'module', 'installed', '1477031011', 'Performance_Reviews', '', 'Performance_Reviews', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjE5OiJQZXJmb3JtYW5jZV9SZXZpZXdzIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxOToiMjAxNi0xMC0yMSAwNjoyMzozMSI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtpOjE0NzcwMzEwMTE7czoxMzoicmVtb3ZlX3RhYmxlcyI7czo2OiJwcm9tcHQiO31zOjExOiJpbnN0YWxsZGVmcyI7YTo3OntzOjI6ImlkIjtzOjE5OiJQZXJmb3JtYW5jZV9SZXZpZXdzIjtzOjU6ImJlYW5zIjthOjE6e2k6MDthOjQ6e3M6NjoibW9kdWxlIjtzOjIyOiJSVF9QZXJmb3JtYW5jZV9SZXZpZXdzIjtzOjU6ImNsYXNzIjtzOjIyOiJSVF9QZXJmb3JtYW5jZV9SZXZpZXdzIjtzOjQ6InBhdGgiO3M6NTc6Im1vZHVsZXMvUlRfUGVyZm9ybWFuY2VfUmV2aWV3cy9SVF9QZXJmb3JtYW5jZV9SZXZpZXdzLnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6MDp7fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6MDp7fXM6OToiaW1hZ2VfZGlyIjtzOjE2OiI8YmFzZXBhdGg+L2ljb25zIjtzOjQ6ImNvcHkiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjU0OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL1JUX1BlcmZvcm1hbmNlX1Jldmlld3MiO3M6MjoidG8iO3M6MzA6Im1vZHVsZXMvUlRfUGVyZm9ybWFuY2VfUmV2aWV3cyI7fX1zOjg6Imxhbmd1YWdlIjthOjE6e2k6MDthOjM6e3M6NDoiZnJvbSI7czo1OToiPGJhc2VwYXRoPi9TdWdhck1vZHVsZXMvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZW5fdXMubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fX19czoxNjoidXBncmFkZV9tYW5pZmVzdCI7czowOiIiO30=', '2016-10-21 06:23:31', 1),
('ebf0645d-c5db-7908-b9c5-580895a4c78c', 'upload/upgrades/module/Qualifications2016_10_20_150002.zip', 'f9e84fd2688f654e737f59d325798d7c', 'module', 'installed', '1476957602', 'Qualifications', '', 'Qualifications', 'YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntpOjA7YToxOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e2k6MDtzOjA6IiI7fX1pOjE7YToxOntzOjI0OiJhY2NlcHRhYmxlX3N1Z2FyX2ZsYXZvcnMiO2E6Mzp7aTowO3M6MjoiQ0UiO2k6MTtzOjM6IlBSTyI7aToyO3M6MzoiRU5UIjt9fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MjoiUlQiO3M6NjoiYXV0aG9yIjtzOjk6IlJvbHVzdGVjaCI7czoxMToiZGVzY3JpcHRpb24iO3M6MDoiIjtzOjQ6Imljb24iO3M6MDoiIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtiOjE7czo0OiJuYW1lIjtzOjE0OiJRdWFsaWZpY2F0aW9ucyI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTk6IjIwMTYtMTAtMjAgMTA6MDA6MDIiO3M6NDoidHlwZSI7czo2OiJtb2R1bGUiO3M6NzoidmVyc2lvbiI7aToxNDc2OTU3NjAyO3M6MTM6InJlbW92ZV90YWJsZXMiO3M6NjoicHJvbXB0Ijt9czoxMToiaW5zdGFsbGRlZnMiO2E6Nzp7czoyOiJpZCI7czoxNDoiUXVhbGlmaWNhdGlvbnMiO3M6NToiYmVhbnMiO2E6MTp7aTowO2E6NDp7czo2OiJtb2R1bGUiO3M6MTc6IlJUX1F1YWxpZmljYXRpb25zIjtzOjU6ImNsYXNzIjtzOjE3OiJSVF9RdWFsaWZpY2F0aW9ucyI7czo0OiJwYXRoIjtzOjQ3OiJtb2R1bGVzL1JUX1F1YWxpZmljYXRpb25zL1JUX1F1YWxpZmljYXRpb25zLnBocCI7czozOiJ0YWIiO2I6MTt9fXM6MTA6ImxheW91dGRlZnMiO2E6MDp7fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6MDp7fXM6OToiaW1hZ2VfZGlyIjtzOjE2OiI8YmFzZXBhdGg+L2ljb25zIjtzOjQ6ImNvcHkiO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjQ5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9tb2R1bGVzL1JUX1F1YWxpZmljYXRpb25zIjtzOjI6InRvIjtzOjI1OiJtb2R1bGVzL1JUX1F1YWxpZmljYXRpb25zIjt9fXM6ODoibGFuZ3VhZ2UiO2E6MTp7aTowO2E6Mzp7czo0OiJmcm9tIjtzOjU5OiI8YmFzZXBhdGg+L1N1Z2FyTW9kdWxlcy9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lbl91cy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==', '2016-10-20 10:00:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_hash`, `system_generated_password`, `pwd_last_changed`, `authenticate_id`, `sugar_login`, `first_name`, `last_name`, `is_admin`, `external_auth_only`, `receive_notifications`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `title`, `photo`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `status`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `deleted`, `portal_only`, `show_on_employees`, `employee_status`, `messenger_id`, `messenger_type`, `reports_to_id`, `is_group`) VALUES
('1', 'admin', '$1$xWBmqdKB$cUtxR8SP.aM8MnLXRc/rf/', 0, NULL, NULL, 1, NULL, 'Administrator', 1, 0, 1, NULL, '2016-10-17 07:38:32', '2016-10-17 07:38:32', '1', '', 'Administrator', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', NULL, NULL, '', 0),
('8df757f7-32ff-50be-7825-5813363b2b3b', 'CTO', '$1$ukXExtu.$aVleaREEe5itN7zc/bL03/', 0, '2016-10-28 11:29:00', NULL, 1, 'Shahrukh', 'Riaz', 1, 0, 1, NULL, '2016-10-28 11:28:17', '2016-10-28 11:30:26', '8df757f7-32ff-50be-7825-5813363b2b3b', '1', NULL, NULL, NULL, '1243232', '123412341', '21322132', '234232', NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 'Active', '231231', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_feeds`
--

CREATE TABLE IF NOT EXISTS `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_last_import`
--

CREATE TABLE IF NOT EXISTS `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_password_link`
--

CREATE TABLE IF NOT EXISTS `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_signatures`
--

CREATE TABLE IF NOT EXISTS `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE IF NOT EXISTS `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`id`, `category`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`) VALUES
('149ef291-eda8-c0a5-d5b8-581336dbc1fd', 'Home2_CALL', 0, '2016-10-28 11:30:27', '2016-10-28 11:30:27', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('14c7b51f-e7ea-4c66-fafe-580480fc5240', 'ETag', 0, '2016-10-17 07:38:32', '2016-11-14 15:01:51', '1', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTE7fQ=='),
('18e81fc1-dfc4-f8ef-9913-581336027320', 'Home2_MEETING', 0, '2016-10-28 11:30:27', '2016-10-28 11:30:27', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('1cda40f4-bcea-8e50-6163-580896b819b6', 'RT_Qualifications2_RT_QUALIFICATIONS', 0, '2016-10-20 10:02:02', '2016-10-20 12:17:48', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czo0OiJuYW1lIjtzOjk6InNvcnRPcmRlciI7czowOiIiO319'),
('1d421d6e-00c2-810d-3c5f-5813360b4bce', 'Home2_OPPORTUNITY', 0, '2016-10-28 11:30:27', '2016-10-28 11:30:27', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('1e9dae44-9418-7a8f-7957-58246e62c593', 'RT_Departments2_RT_DEPARTMENTS', 0, '2016-11-10 12:56:50', '2016-11-10 12:56:50', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('216a186b-2b0e-bbe9-35bd-58133648cba9', 'Home2_ACCOUNT', 0, '2016-10-28 11:30:27', '2016-10-28 11:30:27', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('229e0679-7428-4b44-d37c-5808b59fa047', 'RT_Qualifications', 0, '2016-10-20 12:16:45', '2016-10-20 12:16:45', '1', 'YToxOntzOjIyOiJMaXN0Vmlld0Rpc3BsYXlDb2x1bW5zIjthOjA6e319'),
('2606b24c-b5b2-7f8d-6426-581336a7d82c', 'Home2_LEAD', 0, '2016-10-28 11:30:27', '2016-10-28 11:30:27', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('290e5d62-1fc2-958a-2e15-582ee0adc218', 'AOS_PDF_Templates2_AOS_PDF_TEMPLATES', 0, '2016-11-18 11:05:41', '2016-11-18 11:05:41', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('29cf32ed-6066-d534-b4e4-58133629cdcc', 'Home2_SUGARFEED', 0, '2016-10-28 11:30:27', '2016-10-28 11:30:27', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('2b14f76f-91ba-f5ab-3a4f-5804962f5b6c', 'RT_Employees2_RT_EMPLOYEES', 0, '2016-10-17 09:16:29', '2016-10-17 09:16:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('35933bff-9266-7d20-d1ca-581334871de3', 'Users2_USER', 0, '2016-10-28 11:21:22', '2016-10-28 11:21:22', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('397afda5-3a5c-5328-56c9-5808a2f32db7', 'RT_Candidates2_RT_CANDIDATES', 0, '2016-10-20 10:56:03', '2016-10-20 10:56:03', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('39fc083e-44a4-edab-66e7-5813369a66c8', 'Home', 0, '2016-10-28 11:30:27', '2016-10-28 11:30:27', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6Ijc2NGI0MTM2LTg3NTItZTJlYy00Mzg4LTU4MTMzNjE4NjVhZiI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6Ijc4MjM1MThjLTA0OTMtYjY2NS0xNDI4LTU4MTMzNmUwNTkwZCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjdhMWUyMGYzLTgwNjUtNDEzMi1lMjA2LTU4MTMzNmU2MDc3MSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6IjdiNTc0NmYzLTZiZWItMGFhZi0wYzdlLTU4MTMzNmQ5MTgyYSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiN2RhOTA1NzQtN2JlOC1hOWIwLTZjZjItNTgxMzM2ZjFhZGViIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiN2ZlYzI1NzMtMzUxMy02NjhmLWQzODYtNTgxMzM2NzdiYmNjIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiI3ODIzNTE4Yy0wNDkzLWI2NjUtMTQyOC01ODEzMzZlMDU5MGQiO2k6MTtzOjM2OiI3YTFlMjBmMy04MDY1LTQxMzItZTIwNi01ODEzMzZlNjA3NzEiO2k6MjtzOjM2OiI3YjU3NDZmMy02YmViLTBhYWYtMGM3ZS01ODEzMzZkOTE4MmEiO2k6MztzOjM2OiI3ZGE5MDU3NC03YmU4LWE5YjAtNmNmMi01ODEzMzZmMWFkZWIiO2k6NDtzOjM2OiI3ZmVjMjU3My0zNTEzLTY2OGYtZDM4Ni01ODEzMzY3N2JiY2MiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6Ijc2NGI0MTM2LTg3NTItZTJlYy00Mzg4LTU4MTMzNjE4NjVhZiI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),
('3e6fae50-e46d-c5f3-900c-58071a7b4d47', 'RT_Leaves2_RT_LEAVES', 0, '2016-10-19 07:03:35', '2016-10-19 07:03:35', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('4cf0173b-2538-2e86-e8a5-580481d73337', 'Home', 0, '2016-10-17 07:43:29', '2016-10-17 07:43:29', '1', 'YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImMzZDI0YWU5LTI3Y2YtYmQ3Mi1jZmQ0LTU4MDQ4MWQ2Y2VjYyI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImM0ZTVkNmVmLWY1ODQtY2MxZS04ZDUzLTU4MDQ4MTU3ZDc1OSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImM2MWUzOTZiLTEyNWItYmI2MC1iYWI1LTU4MDQ4MTllZWY4MSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImM3MDhmOThiLTJlNWUtNTJhNS1mM2U0LTU4MDQ4MTRlNTJlMyI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYzgxYWNlYmQtNWFjNi0yMzI4LThlZjctNTgwNDgxMmJiMDAxIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiYzkxYWNkMmQtNzQwNS0xYTk5LWQ5ZjQtNTgwNDgxNWRlM2VhIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MDtzOjM2OiJjNGU1ZDZlZi1mNTg0LWNjMWUtOGQ1My01ODA0ODE1N2Q3NTkiO2k6MTtzOjM2OiJjNjFlMzk2Yi0xMjViLWJiNjAtYmFiNS01ODA0ODE5ZWVmODEiO2k6MjtzOjM2OiJjNzA4Zjk4Yi0yZTVlLTUyYTUtZjNlNC01ODA0ODE0ZTUyZTMiO2k6MztzOjM2OiJjODFhY2ViZC01YWM2LTIzMjgtOGVmNy01ODA0ODEyYmIwMDEiO2k6NDtzOjM2OiJjOTFhY2QyZC03NDA1LTFhOTktZDlmNC01ODA0ODE1ZGUzZWEiO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImMzZDI0YWU5LTI3Y2YtYmQ3Mi1jZmQ0LTU4MDQ4MWQ2Y2VjYyI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIzIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),
('51afbb48-18d4-c8c9-88b5-580481e67a10', 'Home2_CALL', 0, '2016-10-17 07:43:29', '2016-10-17 07:43:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('537db226-7a0d-41dd-acda-580db22114d4', 'Accounts2_ACCOUNT', 0, '2016-10-24 07:05:20', '2016-10-24 07:05:20', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('57115744-a414-cf04-4ed1-580481b6c0f2', 'Home2_MEETING', 0, '2016-10-17 07:43:29', '2016-10-17 07:43:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('5c45cc00-83ab-7e42-f37d-580481abf7a4', 'Home2_OPPORTUNITY', 0, '2016-10-17 07:43:29', '2016-10-17 07:43:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('5e5f95c7-7c5a-6c73-cc72-58232c10b8ad', 'RT_Bonus2_RT_BONUS', 0, '2016-11-09 14:01:47', '2016-11-09 14:01:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('60de7706-4dfc-ff80-b7ed-58133610930d', 'ETag', 0, '2016-10-28 11:30:26', '2016-10-28 11:30:26', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6MTt9'),
('61185c30-c056-2b5d-ed7b-5804817c18dc', 'Home2_ACCOUNT', 0, '2016-10-17 07:43:29', '2016-10-17 07:43:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('65aa87d7-cde7-2476-aa1d-580481e0beaa', 'Home2_LEAD', 0, '2016-10-17 07:43:29', '2016-10-17 07:43:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('6a911c50-8a96-a7e0-d13c-5804816a8ac5', 'Home2_SUGARFEED', 0, '2016-10-17 07:43:29', '2016-10-17 07:43:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('75012214-2a65-53e0-8eaa-58133644c2a3', 'Home2_LEAD_7fec2573-3513-668f-d386-58133677bbcc', 0, '2016-10-28 11:30:30', '2016-10-28 11:30:30', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('7881ebd1-9b6c-9ab8-a164-582d4ada4715', 'AOS_Quotes2_AOS_QUOTES', 0, '2016-11-17 06:14:28', '2016-11-17 06:14:28', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('7dba5853-66d2-cbd4-4d7b-5825ca6bd4e2', 'RT_Pay_Tracker2_RT_PAY_TRACKER', 0, '2016-11-11 13:42:59', '2016-11-11 13:42:59', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('8a10e1cb-be0d-b484-c3a9-58047f5e04b8', 'global', 0, '2016-10-17 07:38:32', '2016-11-08 06:34:37', '1', 'YTozNTp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6Ijg5ZDI0NThiLTVkYTAtZGNhOS01MmU4LTU4MDQ3ZjFmNjk0YyI7czo4OiJ0aW1lem9uZSI7czoxMjoiQXNpYS9LYXJhY2hpIjtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6MTY6InN3YXBfbGFzdF92aWV3ZWQiO3M6MDoiIjtzOjE0OiJzd2FwX3Nob3J0Y3V0cyI7czowOiIiO3M6MTk6Im5hdmlnYXRpb25fcGFyYWRpZ20iO3M6MjoiZ20iO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjEwOiJ1c2VyX3RoZW1lIjtzOjY6IlN1aXRlUCI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxNjoicmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjIyOiJlbWFpbF9yZW1pbmRlcl9jaGVja2VkIjtOO3M6MjoidXQiO3M6MToiMSI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czoxNToibWFpbF9zbXRwc2VydmVyIjtzOjA6IiI7czoxMzoibWFpbF9zbXRwcG9ydCI7czoyOiIyNSI7czoxMzoibWFpbF9zbXRwdXNlciI7czowOiIiO3M6MTM6Im1haWxfc210cHBhc3MiO3M6MDoiIjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MToiMSI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjE7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjIxOiJkZWZhdWx0X2VtYWlsX2NoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjtzOjE4OiJSVF9RdWFsaWZpY2F0aW9uc1EiO2E6MTM6e3M6NjoibW9kdWxlIjtzOjE3OiJSVF9RdWFsaWZpY2F0aW9ucyI7czo2OiJhY3Rpb24iO3M6NToiaW5kZXgiO3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTU6ImFkdmFuY2VkX3NlYXJjaCI7czo1OiJxdWVyeSI7czo0OiJ0cnVlIjtzOjEzOiJuYW1lX2FkdmFuY2VkIjtzOjA6IiI7czo5OiJzaG93U1NESVYiO3M6Mjoibm8iO3M6MTc6InNhdmVkX3NlYXJjaF9uYW1lIjtzOjA6IiI7czoxMzoic2VhcmNoX21vZHVsZSI7czowOiIiO3M6MTk6InNhdmVkX3NlYXJjaF9hY3Rpb24iO3M6MDoiIjtzOjE0OiJkaXNwbGF5Q29sdW1ucyI7czowOiIiO3M6ODoiaGlkZVRhYnMiO3M6MTg6IkFTU0lHTkVEX1VTRVJfTkFNRSI7czo3OiJvcmRlckJ5IjtzOjQ6Ik5BTUUiO3M6NjoiYnV0dG9uIjtzOjY6IlNlYXJjaCI7fXM6MTM6IlJUX0VtcGxveWVlc1EiO2E6OTp7czo2OiJtb2R1bGUiO3M6MTI6IlJUX0VtcGxveWVlcyI7czo2OiJhY3Rpb24iO3M6NToiaW5kZXgiO3M6MTM6InNlYXJjaEZvcm1UYWIiO3M6MTI6ImJhc2ljX3NlYXJjaCI7czo1OiJxdWVyeSI7czo0OiJ0cnVlIjtzOjc6Im9yZGVyQnkiO3M6MDoiIjtzOjk6InNvcnRPcmRlciI7czowOiIiO3M6MTc6InNlYXJjaF9uYW1lX2Jhc2ljIjtzOjA6IiI7czoyMzoiY3VycmVudF91c2VyX29ubHlfYmFzaWMiO3M6MToiMCI7czo2OiJidXR0b24iO3M6NjoiU2VhcmNoIjt9czozMjoiRW1haWxUZW1wbGF0ZXNfRE9DVU1FTlRfT1JERVJfQlkiO3M6MTM6ImRvY3VtZW50X25hbWUiO3M6MTE6IlNjaGVkdWxlcnNRIjthOjg6e3M6NjoibW9kdWxlIjtzOjEwOiJTY2hlZHVsZXJzIjtzOjY6ImFjdGlvbiI7czo1OiJpbmRleCI7czoxMzoic2VhcmNoRm9ybVRhYiI7czoxMjoiYmFzaWNfc2VhcmNoIjtzOjU6InF1ZXJ5IjtzOjQ6InRydWUiO3M6Nzoib3JkZXJCeSI7czowOiIiO3M6OToic29ydE9yZGVyIjtzOjA6IiI7czoxMDoibmFtZV9iYXNpYyI7czowOiIiO3M6NjoiYnV0dG9uIjtzOjY6IlNlYXJjaCI7fX0='),
('8dd049a2-7845-cda5-8aa0-582171b294cf', 'Schedulers2_SCHEDULER', 0, '2016-11-08 06:33:47', '2016-11-08 06:33:47', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('a46c043c-27a0-5451-2adc-5813360ade97', 'global', 0, '2016-10-28 11:28:17', '2016-10-28 11:30:26', '8df757f7-32ff-50be-7825-5813363b2b3b', 'YTozOTp7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjEzOiJzdWJwYW5lbF90YWJzIjtzOjA6IiI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTQ6Im1vZHVsZV9mYXZpY29uIjtzOjA6IiI7czo5OiJoaWRlX3RhYnMiO2E6MDp7fXM6MTE6InJlbW92ZV90YWJzIjthOjA6e31zOjc6Im5vX29wcHMiO3M6Mzoib2ZmIjtzOjEzOiJyZW1pbmRlcl90aW1lIjtpOjE4MDA7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTozNjAwO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMSI7czoyMjoiZW1haWxfcmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjg6InRpbWV6b25lIjtzOjEyOiJBc2lhL0thcmFjaGkiO3M6MjoidXQiO3M6MToiMSI7czo4OiJjdXJyZW5jeSI7czozOiItOTkiO3M6MzU6ImRlZmF1bHRfY3VycmVuY3lfc2lnbmlmaWNhbnRfZGlnaXRzIjtzOjE6IjIiO3M6MTE6Im51bV9ncnBfc2VwIjtzOjE6IiwiO3M6NzoiZGVjX3NlcCI7czoxOiIuIjtzOjQ6ImZkb3ciO3M6MToiMCI7czo1OiJkYXRlZiI7czo1OiJtL2QvWSI7czo1OiJ0aW1lZiI7czo0OiJoOmlhIjtzOjE1OiJtYWlsX3NtdHBzZXJ2ZXIiO3M6MTQ6InNtdHAuZ21haWwuY29tIjtzOjEzOiJtYWlsX3NtdHB1c2VyIjtzOjI3OiJodXNuYWluLnphaGVlcjg0MEBnbWFpbC5jb20iO3M6MTM6Im1haWxfc210cHBhc3MiO3M6MTE6IjQ0NzE0NDlqYXp6IjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNjoiZXhwb3J0X2RlbGltaXRlciI7czoxOiIsIjtzOjIyOiJkZWZhdWx0X2V4cG9ydF9jaGFyc2V0IjtzOjU6IlVURi04IjtzOjE0OiJ1c2VfcmVhbF9uYW1lcyI7czoyOiJvbiI7czoxNzoibWFpbF9zbXRwYXV0aF9yZXEiO3M6MDoiIjtzOjEyOiJtYWlsX3NtdHBzc2wiO2k6MDtzOjE1OiJlbWFpbF9saW5rX3R5cGUiO3M6NToic3VnYXIiO3M6MTc6ImVtYWlsX3Nob3dfY291bnRzIjtpOjA7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6ImE0MzQwYmVmLTIxMmEtMzFkNi1hZjlkLTU4MTMzNjZlNTljOCI7czoxNToibG9naW5leHBpcmF0aW9uIjtzOjE6IjAiO3M6NzoibG9ja291dCI7czowOiIiO3M6MTE6ImxvZ2luZmFpbGVkIjtzOjE6IjAiO3M6MTk6InRoZW1lX2N1cnJlbnRfZ3JvdXAiO3M6MzoiQWxsIjt9'),
('a5361440-582a-7119-983b-580481e22b3e', 'Home2_LEAD_c91acd2d-7405-1a99-d9f4-5804815de3ea', 0, '2016-10-17 07:43:33', '2016-10-17 07:43:33', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('a671fae0-66ce-3aad-b781-58256712f805', 'RT_Payroll2_RT_PAYROLL', 0, '2016-11-11 06:39:16', '2016-11-11 06:39:16', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('b3a6115a-b188-cc09-04ce-581ad21fef03', 'EmailTemplates2_EMAILTEMPLATE', 0, '2016-11-03 05:59:08', '2016-11-03 05:59:08', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('b7ba6e2a-0d04-2898-3b72-5809b4d0a09d', 'RT_Performance_Reviews2_RT_PERFORMANCE_REVIEWS', 0, '2016-10-21 06:24:14', '2016-10-21 06:24:14', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('b8fbc0a2-8420-4d9f-30c0-582af0d303ae', 'Leads2_LEAD', 0, '2016-11-15 11:25:27', '2016-11-15 11:25:27', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('bb7ad3ef-1f77-a028-22a4-582d93135da8', 'RT_SalarySetting2_RT_SALARYSETTING', 0, '2016-11-17 11:23:28', '2016-11-17 11:23:28', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d0100cb5-ef0e-d66a-e99f-5818646dbbc1', 'Emails', 0, '2016-11-01 09:46:29', '2016-11-01 09:46:29', '1', 'YToxOntzOjExOiJmb2N1c0ZvbGRlciI7czo2MjoiYToyOntzOjQ6ImllSWQiO3M6OToidW5kZWZpbmVkIjtzOjY6ImZvbGRlciI7czo5OiJ1bmRlZmluZWQiO30iO30='),
('d0a6f222-9c7c-5030-7bc6-5811f37e59aa', 'OutboundEmailAccounts2_OUTBOUNDEMAILACCOUNTS', 0, '2016-10-27 12:29:43', '2016-10-27 12:29:43', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d1661443-20c0-7823-fc12-5822d44a93fd', 'Contacts2_CONTACT', 0, '2016-11-09 07:49:05', '2016-11-09 07:49:05', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d178c961-4d77-729e-ede5-5823349576f2', 'RT_Increment_History2_RT_INCREMENT_HISTORY', 0, '2016-11-09 14:35:58', '2016-11-09 14:35:58', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('da1b3655-9f7f-0032-93a8-582ee06e068c', 'AOS_Products_Quotes2_AOS_PRODUCTS_QUOTES', 0, '2016-11-18 11:04:29', '2016-11-18 11:04:29', '1', 'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');

-- --------------------------------------------------------

--
-- Table structure for table `vcals`
--

CREATE TABLE IF NOT EXISTS `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
