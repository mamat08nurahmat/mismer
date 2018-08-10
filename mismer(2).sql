-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2018 at 03:33 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mismer`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure` ()  BEGIN
SELECT 
MID,
MERCHAN_DBA_NAME,
STATUS_EDC,
CITY,
MSO,
SOURCE_CODE,
POS1 
FROM templateuploadmismer;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_groups`
--

CREATE TABLE `aauth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aauth_groups`
--

INSERT INTO `aauth_groups` (`id`, `name`, `definition`) VALUES
(1, 'Admin', 'Superadmin Group'),
(2, 'Public', 'Public Group'),
(3, 'Default', 'Default Access Group'),
(4, 'Member', 'Member Access Group');

-- --------------------------------------------------------

--
-- Table structure for table `aauth_group_to_group`
--

CREATE TABLE `aauth_group_to_group` (
  `group_id` int(11) UNSIGNED NOT NULL,
  `subgroup_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_login_attempts`
--

CREATE TABLE `aauth_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `login_attempts` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_perms`
--

CREATE TABLE `aauth_perms` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aauth_perms`
--

INSERT INTO `aauth_perms` (`id`, `name`, `definition`) VALUES
(1, 'menu_dashboard', NULL),
(2, 'menu_crud_builder', NULL),
(3, 'menu_api_builder', NULL),
(4, 'menu_page_builder', NULL),
(5, 'menu_form_builder', NULL),
(6, 'menu_menu', NULL),
(7, 'menu_auth', NULL),
(8, 'menu_user', NULL),
(9, 'menu_group', NULL),
(10, 'menu_access', NULL),
(11, 'menu_permission', NULL),
(12, 'menu_api_documentation', NULL),
(13, 'menu_web_documentation', NULL),
(14, 'menu_settings', NULL),
(15, 'user_list', NULL),
(16, 'user_update_status', NULL),
(17, 'user_export', NULL),
(18, 'user_add', NULL),
(19, 'user_update', NULL),
(20, 'user_update_profile', NULL),
(21, 'user_update_password', NULL),
(22, 'user_profile', NULL),
(23, 'user_view', NULL),
(24, 'user_delete', NULL),
(25, 'blog_list', NULL),
(26, 'blog_export', NULL),
(27, 'blog_add', NULL),
(28, 'blog_update', NULL),
(29, 'blog_view', NULL),
(30, 'blog_delete', NULL),
(31, 'form_list', NULL),
(32, 'form_export', NULL),
(33, 'form_add', NULL),
(34, 'form_update', NULL),
(35, 'form_view', NULL),
(36, 'form_manage', NULL),
(37, 'form_delete', NULL),
(38, 'crud_list', NULL),
(39, 'crud_export', NULL),
(40, 'crud_add', NULL),
(41, 'crud_update', NULL),
(42, 'crud_view', NULL),
(43, 'crud_delete', NULL),
(44, 'rest_list', NULL),
(45, 'rest_export', NULL),
(46, 'rest_add', NULL),
(47, 'rest_update', NULL),
(48, 'rest_view', NULL),
(49, 'rest_delete', NULL),
(50, 'group_list', NULL),
(51, 'group_export', NULL),
(52, 'group_add', NULL),
(53, 'group_update', NULL),
(54, 'group_view', NULL),
(55, 'group_delete', NULL),
(56, 'permission_list', NULL),
(57, 'permission_export', NULL),
(58, 'permission_add', NULL),
(59, 'permission_update', NULL),
(60, 'permission_view', NULL),
(61, 'permission_delete', NULL),
(62, 'access_list', NULL),
(63, 'access_add', NULL),
(64, 'access_update', NULL),
(65, 'menu_list', NULL),
(66, 'menu_add', NULL),
(67, 'menu_update', NULL),
(68, 'menu_delete', NULL),
(69, 'menu_save_ordering', NULL),
(70, 'menu_type_add', NULL),
(71, 'page_list', NULL),
(72, 'page_export', NULL),
(73, 'page_add', NULL),
(74, 'page_update', NULL),
(75, 'page_view', NULL),
(76, 'page_delete', NULL),
(77, 'setting', NULL),
(78, 'setting_update', NULL),
(79, 'dashboard', NULL),
(80, 'extension_list', NULL),
(81, 'extension_activate', NULL),
(82, 'extension_deactivate', NULL),
(83, 'templateupload_add', ''),
(84, 'templateupload_update', ''),
(85, 'templateupload_view', ''),
(86, 'templateupload_delete', ''),
(87, 'templateupload_list', ''),
(88, 'channel_add', ''),
(89, 'channel_update', ''),
(90, 'channel_view', ''),
(91, 'channel_delete', ''),
(92, 'channel_list', ''),
(93, 'wilayah_add', ''),
(94, 'wilayah_update', ''),
(95, 'wilayah_view', ''),
(96, 'wilayah_delete', ''),
(97, 'wilayah_list', ''),
(98, 'templateuploadmismer_add', ''),
(99, 'templateuploadmismer_update', ''),
(100, 'templateuploadmismer_view', ''),
(101, 'templateuploadmismer_delete', ''),
(102, 'templateuploadmismer_list', ''),
(103, 'applicationtype_add', ''),
(104, 'applicationtype_update', ''),
(105, 'applicationtype_view', ''),
(106, 'applicationtype_delete', ''),
(107, 'applicationtype_list', ''),
(108, 'systemupload_add', ''),
(109, 'systemupload_update', ''),
(110, 'systemupload_view', ''),
(111, 'systemupload_delete', ''),
(112, 'systemupload_list', '');

-- --------------------------------------------------------

--
-- Table structure for table `aauth_perm_to_group`
--

CREATE TABLE `aauth_perm_to_group` (
  `perm_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_perm_to_user`
--

CREATE TABLE `aauth_perm_to_user` (
  `perm_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_pms`
--

CREATE TABLE `aauth_pms` (
  `id` int(11) UNSIGNED NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `receiver_id` int(11) UNSIGNED NOT NULL,
  `title` varchar(225) NOT NULL,
  `message` text,
  `date_sent` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `pm_deleted_sender` int(1) DEFAULT NULL,
  `pm_deleted_receiver` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_user`
--

CREATE TABLE `aauth_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aauth_users`
--

CREATE TABLE `aauth_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `oauth_uid` text,
  `oauth_provider` varchar(100) DEFAULT NULL,
  `pass` varchar(64) NOT NULL,
  `username` varchar(100) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `avatar` text NOT NULL,
  `banned` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `forgot_exp` text,
  `remember_time` datetime DEFAULT NULL,
  `remember_exp` text,
  `verification_code` text,
  `top_secret` varchar(16) DEFAULT NULL,
  `ip_address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aauth_users`
--

INSERT INTO `aauth_users` (`id`, `email`, `oauth_uid`, `oauth_provider`, `pass`, `username`, `full_name`, `avatar`, `banned`, `last_login`, `last_activity`, `date_created`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `top_secret`, `ip_address`) VALUES
(1, 'admin001@bni.co.id', NULL, NULL, 'cf07ba6fe22ad82c8460f195a6e4cd4d175b3381e8c6f192b12aada8a03b07c4', 'admin001', 'admin001', '', 0, '2018-08-09 09:22:51', '2018-08-09 09:22:51', '2018-08-09 04:12:51', NULL, NULL, NULL, NULL, NULL, '::1');

-- --------------------------------------------------------

--
-- Table structure for table `aauth_user_to_group`
--

CREATE TABLE `aauth_user_to_group` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aauth_user_to_group`
--

INSERT INTO `aauth_user_to_group` (`user_id`, `group_id`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `aauth_user_variables`
--

CREATE TABLE `aauth_user_variables` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `data_key` varchar(100) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `applicationtype`
--

CREATE TABLE `applicationtype` (
  `ID` int(11) NOT NULL,
  `ApplicationName` varchar(255) NOT NULL,
  `ApplicationSource` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `applicationtype`
--

INSERT INTO `applicationtype` (`ID`, `ApplicationName`, `ApplicationSource`) VALUES
(1, 'Data CIF', 'CardLink'),
(2, 'CCOS', 'Data Incoming'),
(3, 'Data EDC', 'MISMER');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image` text NOT NULL,
  `category` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `content`, `image`, `category`, `created_at`) VALUES
(1, 'AAAA', 'TESSSSSSSS', '20180810094007-2018-08-10blog093929.csv', 'XXX', '2018-08-09 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `category_id` int(11) UNSIGNED NOT NULL,
  `category_name` varchar(200) NOT NULL,
  `category_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `blog_category`
--

INSERT INTO `blog_category` (`category_id`, `category_name`, `category_desc`) VALUES
(1, 'Technology', '');

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE `captcha` (
  `captcha_id` int(11) UNSIGNED NOT NULL,
  `captcha_time` int(10) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cc_options`
--

CREATE TABLE `cc_options` (
  `id` int(11) UNSIGNED NOT NULL,
  `option_name` varchar(200) NOT NULL,
  `option_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cc_options`
--

INSERT INTO `cc_options` (`id`, `option_name`, `option_value`) VALUES
(1, 'active_theme', 'cicool'),
(2, 'favicon', 'default.png'),
(3, 'site_name', 'MISMER Dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `cc_session`
--

CREATE TABLE `cc_session` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) NOT NULL,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `ID` int(11) NOT NULL,
  `ChannelID` varchar(5) NOT NULL,
  `ChannelCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`ID`, `ChannelID`, `ChannelCode`) VALUES
(1, '01', 'MBA'),
(2, '02', 'MBR'),
(3, '03', 'TDP'),
(4, '04', 'PPU'),
(5, '05', 'BDP'),
(6, '06', 'PPP'),
(7, '07', 'CABANG'),
(8, '08', 'E-COMM'),
(9, '09', 'M-POS'),
(10, '10', 'RECCURING'),
(11, '11', 'SUPPORT');

-- --------------------------------------------------------

--
-- Table structure for table `crud`
--

CREATE TABLE `crud` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `primary_key` varchar(200) NOT NULL,
  `page_read` varchar(20) DEFAULT NULL,
  `page_create` varchar(20) DEFAULT NULL,
  `page_update` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crud`
--

INSERT INTO `crud` (`id`, `title`, `subject`, `table_name`, `primary_key`, `page_read`, `page_create`, `page_update`) VALUES
(1, 'Templateupload', 'Templateupload', 'templateupload', 'RowID', 'yes', 'yes', 'yes'),
(2, 'Channel', 'Channel', 'channel', 'ID', 'yes', 'yes', 'yes'),
(3, 'Wilayah', 'Wilayah', 'wilayah', 'ID', 'yes', 'yes', 'yes'),
(4, 'Templateuploadmismer', 'Templateuploadmismer', 'templateuploadmismer', 'RowID', 'yes', 'yes', 'yes'),
(5, 'Blog', 'Blog', 'blog', 'id', 'yes', 'yes', 'yes'),
(6, 'Applicationtype', 'Applicationtype', 'applicationtype', 'ID', 'yes', 'yes', 'yes'),
(7, 'Systemupload', 'Systemupload', 'systemupload', 'ID', 'yes', 'yes', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `crud_custom_option`
--

CREATE TABLE `crud_custom_option` (
  `id` int(11) UNSIGNED NOT NULL,
  `crud_field_id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `crud_field`
--

CREATE TABLE `crud_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `crud_id` int(11) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `input_type` varchar(200) NOT NULL,
  `show_column` varchar(10) DEFAULT NULL,
  `show_add_form` varchar(10) DEFAULT NULL,
  `show_update_form` varchar(10) DEFAULT NULL,
  `show_detail_page` varchar(10) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `relation_table` varchar(200) DEFAULT NULL,
  `relation_value` varchar(200) DEFAULT NULL,
  `relation_label` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crud_field`
--

INSERT INTO `crud_field` (`id`, `crud_id`, `field_name`, `field_label`, `input_type`, `show_column`, `show_add_form`, `show_update_form`, `show_detail_page`, `sort`, `relation_table`, `relation_value`, `relation_label`) VALUES
(1, 1, 'RowID', 'RowID', 'number', '', '', '', 'yes', 1, '', '', ''),
(2, 1, 'BatchID', 'BatchID', 'number', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(3, 1, 'MID', 'MID', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(4, 1, 'MERCHAN_DBA_NAME', 'MERCHAN_DBA_NAME', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(5, 1, 'STATUS_EDC', 'STATUS_EDC', 'number', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(6, 1, 'OPEN_DATE', 'OPEN_DATE', 'input', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(7, 1, 'CITY', 'CITY', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(8, 1, 'MSO', 'MSO', 'input', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(9, 1, 'SOURCE_CODE', 'SOURCE_CODE', 'input', 'yes', 'yes', 'yes', 'yes', 9, '', '', ''),
(10, 1, 'POS1', 'POS1', 'number', 'yes', 'yes', 'yes', 'yes', 10, '', '', ''),
(14, 2, 'ID', 'ID', 'number', '', '', '', 'yes', 1, '', '', ''),
(15, 2, 'ChannelID', 'ChannelID', 'number', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(16, 2, 'ChannelCode', 'ChannelCode', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(21, 4, 'RowID', 'RowID', 'number', '', '', '', 'yes', 1, '', '', ''),
(22, 4, 'MID', 'MID', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(23, 4, 'MERCHAN_DBA_NAME', 'MERCHAN_DBA_NAME', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(24, 4, 'STATUS_EDC', 'STATUS_EDC', 'number', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(25, 4, 'OPEN_DATE', 'OPEN_DATE', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(26, 4, 'CITY', 'CITY', 'input', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(27, 4, 'MSO', 'MSO', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(28, 4, 'SOURCE_CODE', 'SOURCE_CODE', 'input', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(29, 4, 'POS1', 'POS1', 'number', 'yes', 'yes', 'yes', 'yes', 9, '', '', ''),
(30, 3, 'ID', 'ID', 'number', '', '', '', 'yes', 1, '', '', ''),
(31, 3, 'WilayahID', 'WilayahID', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(32, 3, 'WilayahCode', 'WilayahCode', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(33, 3, 'WilayahName', 'WilayahName', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(34, 3, 'KodeWilayah', 'KodeWilayah', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(35, 5, 'id', 'id', 'number', '', '', '', 'yes', 1, '', '', ''),
(36, 5, 'title', 'title', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(37, 5, 'content', 'content', 'editor_wysiwyg', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(38, 5, 'image', 'image', 'file', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(39, 5, 'category', 'category', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(40, 5, 'created_at', 'created_at', 'datetime', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(41, 6, 'ID', 'ID', 'number', '', '', '', 'yes', 1, '', '', ''),
(42, 6, 'ApplicationName', 'ApplicationName', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(43, 6, 'ApplicationSource', 'ApplicationSource', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(92, 7, 'ID', 'ID', 'number', '', '', '', 'yes', 1, '', '', ''),
(93, 7, 'BatchID', 'BatchID', 'number', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(94, 7, 'UploadDate', 'UploadDate', 'timestamp', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(95, 7, 'UploadBy', 'UploadBy', 'select', 'yes', 'yes', 'yes', 'yes', 4, 'aauth_users', 'id', 'username'),
(96, 7, 'UploadRemark', 'UploadRemark', 'textarea', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(97, 7, 'ApplicationSource', 'ApplicationSource', 'select', 'yes', 'yes', 'yes', 'yes', 6, 'applicationtype', 'ApplicationSource', 'ApplicationSource'),
(98, 7, 'ProcessMonth', 'ProcessMonth', 'number', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(99, 7, 'ProcessYear', 'ProcessYear', 'number', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(100, 7, 'FilePath', 'FilePath', 'file', 'yes', 'yes', 'yes', 'yes', 9, '', '', ''),
(101, 7, 'VirtualPath', 'VirtualPath', 'input', 'yes', 'yes', 'yes', 'yes', 10, '', '', ''),
(102, 7, 'FileSize', 'FileSize', 'input', 'yes', 'yes', 'yes', 'yes', 11, '', '', ''),
(103, 7, 'ReportPath', 'ReportPath', 'input', 'yes', 'yes', 'yes', 'yes', 12, '', '', ''),
(104, 7, 'RowDataCount', 'RowDataCount', 'number', 'yes', 'yes', 'yes', 'yes', 13, '', '', ''),
(105, 7, 'RowDataSucceed', 'RowDataSucceed', 'number', 'yes', 'yes', 'yes', 'yes', 14, '', '', ''),
(106, 7, 'RowDataFailed', 'RowDataFailed', 'number', 'yes', 'yes', 'yes', 'yes', 15, '', '', ''),
(107, 7, 'ApprovalID', 'ApprovalID', 'number', 'yes', 'yes', 'yes', 'yes', 16, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `crud_field_validation`
--

CREATE TABLE `crud_field_validation` (
  `id` int(11) UNSIGNED NOT NULL,
  `crud_field_id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crud_field_validation`
--

INSERT INTO `crud_field_validation` (`id`, `crud_field_id`, `crud_id`, `validation_name`, `validation_value`) VALUES
(1, 2, 1, 'required', ''),
(2, 2, 1, 'max_length', '11'),
(3, 3, 1, 'required', ''),
(4, 3, 1, 'max_length', '255'),
(5, 4, 1, 'required', ''),
(6, 4, 1, 'max_length', '255'),
(7, 5, 1, 'required', ''),
(8, 5, 1, 'max_length', '5'),
(9, 6, 1, 'required', ''),
(10, 6, 1, 'max_length', '255'),
(11, 7, 1, 'required', ''),
(12, 7, 1, 'max_length', '255'),
(13, 8, 1, 'required', ''),
(14, 8, 1, 'max_length', '255'),
(15, 9, 1, 'required', ''),
(16, 9, 1, 'max_length', '255'),
(17, 10, 1, 'required', ''),
(18, 10, 1, 'max_length', '5'),
(23, 15, 2, 'required', ''),
(24, 15, 2, 'max_length', '5'),
(31, 22, 4, 'required', ''),
(32, 22, 4, 'max_length', '255'),
(33, 23, 4, 'required', ''),
(34, 23, 4, 'max_length', '255'),
(35, 24, 4, 'required', ''),
(36, 24, 4, 'max_length', '5'),
(37, 25, 4, 'required', ''),
(38, 25, 4, 'max_length', '255'),
(39, 26, 4, 'required', ''),
(40, 26, 4, 'max_length', '255'),
(41, 27, 4, 'required', ''),
(42, 27, 4, 'max_length', '255'),
(43, 28, 4, 'required', ''),
(44, 28, 4, 'max_length', '255'),
(45, 29, 4, 'required', ''),
(46, 29, 4, 'max_length', '5'),
(47, 31, 3, 'required', ''),
(48, 31, 3, 'max_length', '255'),
(49, 32, 3, 'required', ''),
(50, 32, 3, 'max_length', '255'),
(51, 33, 3, 'required', ''),
(52, 33, 3, 'max_length', '255'),
(53, 36, 5, 'required', ''),
(54, 36, 5, 'max_length', '200'),
(55, 37, 5, 'required', ''),
(56, 38, 5, 'required', ''),
(57, 39, 5, 'required', ''),
(58, 39, 5, 'max_length', '200'),
(59, 40, 5, 'required', ''),
(60, 42, 6, 'required', ''),
(61, 42, 6, 'max_length', '255'),
(62, 43, 6, 'required', ''),
(63, 43, 6, 'max_length', '255'),
(147, 93, 7, 'required', ''),
(148, 93, 7, 'max_length', '11'),
(149, 95, 7, 'required', ''),
(150, 95, 7, 'max_length', '11'),
(151, 96, 7, 'required', ''),
(152, 96, 7, 'max_length', '255'),
(153, 97, 7, 'required', ''),
(154, 97, 7, 'max_length', '255'),
(155, 98, 7, 'required', ''),
(156, 98, 7, 'max_length', '11'),
(157, 99, 7, 'required', ''),
(158, 99, 7, 'max_length', '11'),
(159, 100, 7, 'required', ''),
(160, 101, 7, 'required', ''),
(161, 101, 7, 'max_length', '255'),
(162, 102, 7, 'required', ''),
(163, 102, 7, 'max_length', '255'),
(164, 103, 7, 'required', ''),
(165, 103, 7, 'max_length', '255'),
(166, 104, 7, 'required', ''),
(167, 104, 7, 'max_length', '11'),
(168, 105, 7, 'required', ''),
(169, 105, 7, 'max_length', '11'),
(170, 106, 7, 'required', ''),
(171, 106, 7, 'max_length', '11'),
(172, 107, 7, 'required', ''),
(173, 107, 7, 'max_length', '11');

-- --------------------------------------------------------

--
-- Table structure for table `crud_input_type`
--

CREATE TABLE `crud_input_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(200) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `custom_value` int(11) NOT NULL,
  `validation_group` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crud_input_type`
--

INSERT INTO `crud_input_type` (`id`, `type`, `relation`, `custom_value`, `validation_group`) VALUES
(1, 'input', '0', 0, 'input'),
(2, 'textarea', '0', 0, 'text'),
(3, 'select', '1', 0, 'select'),
(4, 'editor_wysiwyg', '0', 0, 'editor'),
(5, 'password', '0', 0, 'password'),
(6, 'email', '0', 0, 'email'),
(7, 'address_map', '0', 0, 'address_map'),
(8, 'file', '0', 0, 'file'),
(9, 'file_multiple', '0', 0, 'file_multiple'),
(10, 'datetime', '0', 0, 'datetime'),
(11, 'date', '0', 0, 'date'),
(12, 'timestamp', '0', 0, 'timestamp'),
(13, 'number', '0', 0, 'number'),
(14, 'yes_no', '0', 0, 'yes_no'),
(15, 'time', '0', 0, 'time'),
(16, 'year', '0', 0, 'year'),
(17, 'select_multiple', '1', 0, 'select_multiple'),
(18, 'checkboxes', '1', 0, 'checkboxes'),
(19, 'options', '1', 0, 'options'),
(20, 'true_false', '0', 0, 'true_false'),
(21, 'current_user_username', '0', 0, 'user_username'),
(22, 'current_user_id', '0', 0, 'current_user_id'),
(23, 'custom_option', '0', 1, 'custom_option'),
(24, 'custom_checkbox', '0', 1, 'custom_checkbox'),
(25, 'custom_select_multiple', '0', 1, 'custom_select_multiple'),
(26, 'custom_select', '0', 1, 'custom_select');

-- --------------------------------------------------------

--
-- Table structure for table `crud_input_validation`
--

CREATE TABLE `crud_input_validation` (
  `id` int(11) UNSIGNED NOT NULL,
  `validation` varchar(200) NOT NULL,
  `input_able` varchar(20) NOT NULL,
  `group_input` text NOT NULL,
  `input_placeholder` text NOT NULL,
  `call_back` varchar(10) NOT NULL,
  `input_validation` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crud_input_validation`
--

INSERT INTO `crud_input_validation` (`id`, `validation`, `input_able`, `group_input`, `input_placeholder`, `call_back`, `input_validation`) VALUES
(1, 'required', 'no', 'input, file, number, text, datetime, select, password, email, editor, date, yes_no, time, year, select_multiple, options, checkboxes, true_false, address_map, custom_option, custom_checkbox, custom_select_multiple, custom_select, file_multiple', '', '', ''),
(2, 'max_length', 'yes', 'input, number, text, select, password, email, editor, yes_no, time, year, select_multiple, options, checkboxes, address_map', '', '', 'numeric'),
(3, 'min_length', 'yes', 'input, number, text, select, password, email, editor, time, year, select_multiple, address_map', '', '', 'numeric'),
(4, 'valid_email', 'no', 'input, email', '', '', ''),
(5, 'valid_emails', 'no', 'input, email', '', '', ''),
(6, 'regex', 'yes', 'input, number, text, datetime, select, password, email, editor, date, yes_no, time, year, select_multiple, options, checkboxes', '', 'yes', 'callback_valid_regex'),
(7, 'decimal', 'no', 'input, number, text, select', '', '', ''),
(8, 'allowed_extension', 'yes', 'file, file_multiple', 'ex : jpg,png,..', '', 'callback_valid_extension_list'),
(9, 'max_width', 'yes', 'file, file_multiple', '', '', 'numeric'),
(10, 'max_height', 'yes', 'file, file_multiple', '', '', 'numeric'),
(11, 'max_size', 'yes', 'file, file_multiple', '... kb', '', 'numeric'),
(12, 'max_item', 'yes', 'file_multiple', '', '', 'numeric'),
(13, 'valid_url', 'no', 'input, text', '', '', ''),
(14, 'alpha', 'no', 'input, text, select, password, editor, yes_no', '', '', ''),
(15, 'alpha_numeric', 'no', 'input, number, text, select, password, editor', '', '', ''),
(16, 'alpha_numeric_spaces', 'no', 'input, number, text,select, password, editor', '', '', ''),
(17, 'valid_number', 'no', 'input, number, text, password, editor, true_false', '', 'yes', ''),
(18, 'valid_datetime', 'no', 'input, datetime, text', '', 'yes', ''),
(19, 'valid_date', 'no', 'input, datetime, date, text', '', 'yes', ''),
(20, 'valid_max_selected_option', 'yes', 'select_multiple, custom_select_multiple, custom_checkbox, checkboxes', '', 'yes', 'numeric'),
(21, 'valid_min_selected_option', 'yes', 'select_multiple, custom_select_multiple, custom_checkbox, checkboxes', '', 'yes', 'numeric'),
(22, 'valid_alpha_numeric_spaces_underscores', 'no', 'input, text,select, password, editor', '', 'yes', ''),
(23, 'matches', 'yes', 'input, number, text, password, email', 'any field', 'no', 'callback_valid_alpha_numeric_spaces_underscores'),
(24, 'valid_json', 'no', 'input, text, editor', '', 'yes', ' '),
(25, 'valid_url', 'no', 'input, text, editor', '', 'no', ' '),
(26, 'exact_length', 'yes', 'input, text, number', '0 - 99999*', 'no', 'numeric'),
(27, 'alpha_dash', 'no', 'input, text', '', 'no', ''),
(28, 'integer', 'no', 'input, text, number', '', 'no', ''),
(29, 'differs', 'yes', 'input, text, number, email, password, editor, options, select', 'any field', 'no', 'callback_valid_alpha_numeric_spaces_underscores'),
(30, 'is_natural', 'no', 'input, text, number', '', 'no', ''),
(31, 'is_natural_no_zero', 'no', 'input, text, number', '', 'no', ''),
(32, 'less_than', 'yes', 'input, text, number', '', 'no', 'numeric'),
(33, 'less_than_equal_to', 'yes', 'input, text, number', '', 'no', 'numeric'),
(34, 'greater_than', 'yes', 'input, text, number', '', 'no', 'numeric'),
(35, 'greater_than_equal_to', 'yes', 'input, text, number', '', 'no', 'numeric'),
(36, 'in_list', 'yes', 'input, text, number, select, options', '', 'no', 'callback_valid_multiple_value'),
(37, 'valid_ip', 'no', 'input, text', '', 'no', '');

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_custom_attribute`
--

CREATE TABLE `form_custom_attribute` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `attribute_value` text NOT NULL,
  `attribute_label` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_custom_option`
--

CREATE TABLE `form_custom_option` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_field`
--

CREATE TABLE `form_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `input_type` varchar(200) NOT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `placeholder` text,
  `auto_generate_help_block` varchar(10) DEFAULT NULL,
  `help_block` text,
  `relation_table` varchar(200) DEFAULT NULL,
  `relation_value` varchar(200) DEFAULT NULL,
  `relation_label` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_field_validation`
--

CREATE TABLE `form_field_validation` (
  `id` int(11) UNSIGNED NOT NULL,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE `keys` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL,
  `is_private_key` tinyint(1) NOT NULL,
  `ip_addresses` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'D1AD05E978F746BA59192B128231D357', 0, 0, 0, NULL, '2018-08-08 21:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `icon_color` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `menu_type_id` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `label`, `type`, `icon_color`, `link`, `sort`, `parent`, `icon`, `menu_type_id`, `active`) VALUES
(1, 'MAIN NAVIGATION', 'label', '', 'administrator/dashboard', 1, 0, '', 1, 1),
(2, 'Dashboard', 'menu', '', 'administrator/dashboard', 2, 0, 'fa-dashboard', 1, 1),
(3, 'CRUD Builder', 'menu', '', 'administrator/crud', 3, 0, 'fa-table', 1, 1),
(4, 'API Builder', 'menu', '', 'administrator/rest', 4, 0, 'fa-code', 1, 1),
(5, 'Page Builder', 'menu', '', 'administrator/page', 5, 0, 'fa-file-o', 1, 1),
(6, 'Form Builder', 'menu', '', 'administrator/form', 6, 0, 'fa-newspaper-o', 1, 1),
(7, 'Menu', 'menu', '', 'administrator/menu', 7, 0, 'fa-bars', 1, 1),
(8, 'Auth', 'menu', '', '', 8, 0, 'fa-shield', 1, 1),
(9, 'User', 'menu', '', 'administrator/user', 9, 8, '', 1, 1),
(10, 'Groups', 'menu', '', 'administrator/group', 10, 8, '', 1, 1),
(11, 'Access', 'menu', '', 'administrator/access', 11, 8, '', 1, 1),
(12, 'Permission', 'menu', '', 'administrator/permission', 12, 8, '', 1, 1),
(13, 'API Keys', 'menu', '', 'administrator/keys', 13, 8, '', 1, 1),
(14, 'Extension', 'menu', '', 'administrator/extension', 13, 0, 'fa-puzzle-piece', 1, 1),
(15, 'OTHER', 'label', '', '', 14, 0, '', 1, 1),
(16, 'Settings', 'menu', 'text-red', 'administrator/setting', 15, 0, 'fa-circle-o', 1, 1),
(17, 'Web Documentation', 'menu', 'text-blue', 'administrator/doc/web', 16, 0, 'fa-circle-o', 1, 1),
(18, 'API Documentation', 'menu', 'text-yellow', 'administrator/doc/api', 17, 0, 'fa-circle-o', 1, 1),
(19, 'Home', 'menu', '', '/', 1, 0, '', 2, 1),
(20, 'About', 'menu', '', 'page/about', 2, 0, '', 2, 1),
(21, 'Get Started', 'menu', '', 'page/get-started', 3, 0, '', 2, 1),
(22, 'Dashboard', 'menu', '', 'administrator/dashboard', 4, 0, '', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_type`
--

CREATE TABLE `menu_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_type`
--

INSERT INTO `menu_type` (`id`, `name`, `definition`) VALUES
(1, 'side menu', NULL),
(2, 'top menu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `fresh_content` text NOT NULL,
  `keyword` text,
  `description` text,
  `link` varchar(200) DEFAULT NULL,
  `template` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `page_block_element`
--

CREATE TABLE `page_block_element` (
  `id` int(11) UNSIGNED NOT NULL,
  `group_name` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image_preview` varchar(200) NOT NULL,
  `block_name` varchar(200) NOT NULL,
  `content_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rest`
--

CREATE TABLE `rest` (
  `id` int(11) UNSIGNED NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `primary_key` varchar(200) NOT NULL,
  `x_api_key` varchar(20) DEFAULT NULL,
  `x_token` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rest_field`
--

CREATE TABLE `rest_field` (
  `id` int(11) UNSIGNED NOT NULL,
  `rest_id` int(11) NOT NULL,
  `field_name` varchar(200) NOT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `input_type` varchar(200) NOT NULL,
  `show_column` varchar(10) DEFAULT NULL,
  `show_add_api` varchar(10) DEFAULT NULL,
  `show_update_api` varchar(10) DEFAULT NULL,
  `show_detail_api` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rest_field_validation`
--

CREATE TABLE `rest_field_validation` (
  `id` int(11) UNSIGNED NOT NULL,
  `rest_field_id` int(11) NOT NULL,
  `rest_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rest_input_type`
--

CREATE TABLE `rest_input_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(200) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `validation_group` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rest_input_type`
--

INSERT INTO `rest_input_type` (`id`, `type`, `relation`, `validation_group`) VALUES
(1, 'input', '0', 'input'),
(2, 'timestamp', '0', 'timestamp'),
(3, 'file', '0', 'file');

-- --------------------------------------------------------

--
-- Table structure for table `systemupload`
--

CREATE TABLE `systemupload` (
  `ID` int(11) NOT NULL,
  `BatchID` int(11) NOT NULL,
  `UploadDate` datetime DEFAULT NULL,
  `UploadBy` int(11) DEFAULT NULL,
  `UploadRemark` varchar(255) DEFAULT NULL,
  `ApplicationSource` varchar(255) DEFAULT NULL,
  `ProcessMonth` int(11) DEFAULT NULL,
  `ProcessYear` int(11) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `VirtualPath` varchar(255) DEFAULT NULL,
  `FileSize` varchar(255) DEFAULT NULL,
  `ReportPath` varchar(255) DEFAULT NULL,
  `RowDataCount` int(11) DEFAULT NULL,
  `RowDataSucceed` int(11) DEFAULT NULL,
  `RowDataFailed` int(11) DEFAULT NULL,
  `ApprovalID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `systemupload`
--

INSERT INTO `systemupload` (`ID`, `BatchID`, `UploadDate`, `UploadBy`, `UploadRemark`, `ApplicationSource`, `ProcessMonth`, `ProcessYear`, `FilePath`, `VirtualPath`, `FileSize`, `ReportPath`, `RowDataCount`, `RowDataSucceed`, `RowDataFailed`, `ApprovalID`) VALUES
(1, 123, '2018-08-10 10:47:50', 1, 'tes mismer', 'MISMER', 8, 2018, '20180810104750-2018-08-10systemupload104746.csv', 'virtual', '123', 'ok', 123, 0, 0, 123),
(2, 888, '2018-08-10 10:51:34', 1, 'fsdfdsf', 'MISMER', 12, 2018, '20180810105134-2018-08-10systemupload105031.csv', 'sdfsdfd', '23', 'sdfsdfdsf', 123, 213, 3423, 234234);

-- --------------------------------------------------------

--
-- Table structure for table `templateupload`
--

CREATE TABLE `templateupload` (
  `RowID` int(11) NOT NULL,
  `BatchID` int(11) NOT NULL,
  `MID` varchar(255) NOT NULL,
  `MERCHAN_DBA_NAME` varchar(255) DEFAULT NULL,
  `STATUS_EDC` int(5) DEFAULT NULL,
  `OPEN_DATE` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `MSO` varchar(255) DEFAULT NULL,
  `SOURCE_CODE` varchar(255) DEFAULT NULL,
  `POS1` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `templateupload`
--

INSERT INTO `templateupload` (`RowID`, `BatchID`, `MID`, `MERCHAN_DBA_NAME`, `STATUS_EDC`, `OPEN_DATE`, `CITY`, `MSO`, `SOURCE_CODE`, `POS1`) VALUES
(1, 123, '0123456789', 'ABCD', 1, '20181231', 'AAAAA', '999', 'XXXXXXXXXX', 999),
(2, 123, '1231564646', 'XZYYYYYYYYYYYYY', 99, '20181231', 'XXXXXX', '3123', '031', 2123),
(3, 123, '123456789', 'ABCD', 1, '20181231', 'AAAAA', '999', 'XXXXXXXXXX', 999),
(4, 123, '1231564646', 'XZYYYYYYYYYYYYY', 99, '20181231', 'XXXXXX', '3123', '31', 2123);

-- --------------------------------------------------------

--
-- Table structure for table `templateuploadmismer`
--

CREATE TABLE `templateuploadmismer` (
  `RowID` int(11) NOT NULL,
  `MID` varchar(55) NOT NULL,
  `MERCHAN_DBA_NAME` varchar(55) DEFAULT NULL,
  `STATUS_EDC` varchar(55) DEFAULT NULL,
  `OPEN_DATE` varchar(55) DEFAULT NULL,
  `CITY` varchar(55) DEFAULT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `SOURCE_CODE` varchar(255) DEFAULT NULL,
  `POS1` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `templateuploadmismer`
--

INSERT INTO `templateuploadmismer` (`RowID`, `MID`, `MERCHAN_DBA_NAME`, `STATUS_EDC`, `OPEN_DATE`, `CITY`, `MSO`, `SOURCE_CODE`, `POS1`) VALUES
(1, '000000001', 'PEN.TUNAI ATM JKT KOTA   ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(2, '000000002', 'PEN.TUNAI ATM BANDUNG    ', '01', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(3, '000000003', 'PEN.TUNAI ATM JAMBI      ', '01', '181000', 'JAMBI        ', '   ', '                  ', '000'),
(4, '000000004', 'PEN.TUNAI ATM YOGYAKARTA ', '01', '181000', 'YOGYAKARTA   ', '   ', '                  ', '000'),
(5, '000000005', 'PEN.TUNAI ATM BANDA ACEH ', '01', '181000', 'BANDA ACEH   ', '   ', '                  ', '000'),
(6, '000000006', 'PEN.TUNAI ATM MEDAN      ', '01', '181000', 'MEDAN        ', '   ', '                  ', '000'),
(7, '000000007', 'PEN.TUNAI ATM UJ.PANDANG ', '01', '181000', 'UJUNG PANDANG', '00 ', '                  ', '000'),
(8, '000000008', 'PEN.TUNAI ATM PEKANBARU  ', '01', '191000', 'PEKANBARU    ', '00 ', '                  ', '000'),
(9, '000000009', 'PEN.TUNAI ATM PADANG     ', '01', '201000', 'PADANG       ', '00 ', '                  ', '000'),
(10, '000000010', 'PEN.TUNAI ATM PALEMBANG  ', '01', '181000', 'PALEMBANG    ', '   ', '                  ', '000'),
(11, '000000011', 'PEN.TUNAI ATM SURAKARTA  ', '01', '181000', 'SURAKARTA    ', '   ', '                  ', '000'),
(12, '000000012', 'PEN.TUNAI ATM SIBOLGA    ', '01', '181000', 'SIBOLGA      ', '   ', '                  ', '000'),
(13, '000000013', 'PEN.TUNAI ATM SEMARANG   ', '01', '181000', 'SEMARANG     ', '   ', '                  ', '000'),
(14, '000000014', 'PEN.TUNIA ATM SURABAYA   ', '01', '181000', 'SURABAYA     ', '   ', '                  ', '000'),
(15, '000000015', 'PEN.TUNAI ATM BANJARMASIN', '01', '181000', 'BANJARMASIN  ', '00 ', '                  ', '000'),
(16, '000000017', 'PEN.TUNAI ATM KRAMAT     ', '08', '181000', 'JAKARTA      ', '   ', '                  ', '001'),
(17, '000000018', 'PEN.TUNAI ATM MENADO     ', '01', '181000', 'MENADO       ', '00 ', '                  ', '000'),
(18, '000000019', 'PEN.TUNAI ATM CIREBON    ', '01', '181000', 'CIREBON      ', '   ', '                  ', '000'),
(19, '000000020', 'PEN.TUNAI ATM TJG PINANG ', '01', '201000', 'TANJ. PINANG ', '00 ', '                  ', '000'),
(20, '000000021', 'PEN.TUNAI ATM MAGELANG   ', '01', '181000', 'MAGELANG     ', '   ', '                  ', '000'),
(21, '000000022', 'PEN.TUNAI ATM KEBAYORAN B', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(22, '000000023', 'PEN.TUNAI ATM PONTIANAK  ', '01', '181000', 'PONTIANAK    ', '   ', '                  ', '000'),
(23, '000000024', 'PEN.TUNAI ATM TANJUNG PRK', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(24, '000000025', 'PEN.TUNAI ATM BDR LAMPUNG', '01', '181000', 'BDR LAMPUNG  ', '   ', '                  ', '000'),
(25, '000000026', 'PEN.TUNAI ATM TASIKMALAYA', '01', '181000', 'TASIKMALAYA  ', '   ', '                  ', '000'),
(26, '000000027', 'PEN.TUNAI ATM RENGAT     ', '01', '91100', 'RENGAT       ', '   ', '                  ', '000'),
(27, '000000028', 'PEN.TUNAI ATM PURWOKERTO ', '01', '181000', 'PURWOKERTO   ', '   ', '                  ', '000'),
(28, '000000030', 'PEN.TUNAI ATM JEMBER     ', '01', '181000', 'JEMBER       ', '   ', '                  ', '000'),
(29, '000000031', 'PEN.TUNAI ATM J.SDRMN BDG', '01', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(30, '000000032', 'PEN.TUNAI ATM GUNUNG STL ', '01', '181000', 'GUNUNG SITOLI', '   ', '                  ', '000'),
(31, '000000034', 'PEN.TUNAI ATM DENPASAR   ', '01', '181000', 'DENPASAR     ', '00 ', '                  ', '000'),
(32, '000000035', 'PEN.TUNAI ATM SAMPIT     ', '01', '181000', 'SAMPIT       ', '00 ', '                  ', '000'),
(33, '000000037', 'PEN.TUNAI ATM JATINEGARA ', '01', '191000', 'JAKARTA      ', '00 ', '                  ', '000'),
(34, '000000038', 'PEN.TUNAI ATM MATARAM    ', '01', '181000', 'MATARAM      ', '00 ', '                  ', '000'),
(35, '000000039', 'PEN.TUNAI ATM GORONTALO  ', '01', '181000', 'GORONTALO    ', '00 ', '                  ', '000'),
(36, '000000040', 'PEN.TUNAI ATM MEULABOH   ', '01', '181000', 'MEULABOH     ', '   ', '                  ', '000'),
(37, '000000041', 'PEN.TUNAI ATM AMBON      ', '01', '181000', 'AMBON        ', '00 ', '                  ', '000'),
(38, '000000042', 'PEN.TUNAI ATM T.PERAK    ', '01', '181000', 'TANJUNG PERAK', '   ', '                  ', '000'),
(39, '000000043', 'PEN.TUNAI ATM KUDUS      ', '01', '181000', 'KUDUS        ', '   ', '                  ', '000'),
(40, '000000044', 'PEN.TUNAI ATM CILACAP    ', '01', '181000', 'CILACAP      ', '   ', '                  ', '000'),
(41, '000000045', 'PEN.TUNAI ATM TEMBILAHAN ', '01', '201000', 'TEMBILAHAN   ', '00 ', '                  ', '000'),
(42, '000000046', 'PEN.TUNAI ATM SERANG     ', '01', '181000', 'SERANG       ', '   ', '                  ', '000'),
(43, '000000048', 'PEN.TUNAI ATM KUALA TKL  ', '01', '181000', 'KUALA TUNGKAL', '   ', '                  ', '000'),
(44, '000000049', 'PEN.TUNAI ATM BALIKPAPAN ', '01', '181000', 'BALIKPAPAN   ', '00 ', '                  ', '000'),
(45, '000000050', 'PEN.TUNAI ATM LHOKSEUMAWE', '01', '181000', 'LHOKSEUMAWEH ', '   ', '                  ', '000'),
(46, '000000051', 'PEN.TUNAI ATM TJ.BL.KARIM', '01', '91100', 'TJ.BL.KARIMUN', '00 ', '                  ', '000'),
(47, '000000053', 'PEN.TUNAI ATM BELAWAN    ', '02', '181000', 'BELAWAN      ', '   ', '                  ', '000'),
(48, '000000055', 'PEN.TUNAI ATM BUKITTINGGI', '01', '181000', 'BUKITTINGGI  ', '   ', '                  ', '000'),
(49, '000000056', 'PEN.TUNAI ATM URIP S.SBY ', '01', '181000', 'SURABAYA     ', '   ', '                  ', '000'),
(50, '000000057', 'PEN.TUNAI ATM PEKALONGAN ', '01', '181000', 'PEKALONGAN   ', '   ', '                  ', '000'),
(51, '000000058', 'PEN.TUNAI ATM GUNUNG SHR ', '02', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(52, '000000059', 'PEN.TUNAI ATM DUMAI      ', '01', '201000', 'JAKARTA      ', '00 ', '                  ', '000'),
(53, '000000060', 'PEN.TUNAI ATM DUKUH BWH  ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(54, '000000061', 'PEN.TUNAI ATM BOGOR      ', '01', '181000', 'BOGOR        ', '   ', '                  ', '042'),
(55, '000000062', 'PEN.TUNAI ATM SINGARAJA  ', '01', '181000', 'SINGARAJA-BAL', '00 ', '                  ', '000'),
(56, '000000063', 'PEN.TUNAI ATM SENAYAN    ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(57, '000000064', 'PEN.TUNAI ATM TG.BLASAHAN', '01', '181000', 'TG.BALAIASAHA', '   ', '                  ', '000'),
(58, '000000065', 'PEN.TUNAI ATM PEMANGKAT  ', '01', '181000', 'PEMANGKAT    ', '   ', '                  ', '000'),
(59, '000000066', 'PEN.TUNAI ATM SUMBAWA BSR', '01', '181000', 'SUMBAWA BESAR', '00 ', '                  ', '000'),
(60, '000000067', 'PEN.TUNAI ATM SELAT PJG  ', '01', '91100', 'SELAT PANJANG', '   ', '                  ', '000'),
(61, '000000068', 'PEN.TUNAI ATM POSO       ', '01', '181000', 'POSO         ', '00 ', '                  ', '000'),
(62, '000000069', 'PEN.TUNAI ATM MAJALAYA   ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(63, '000000070', 'PEN.TUNAI ATM HARMONI    ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(64, '000000071', 'PEN.TUNAI ATM K.BANGSA   ', '02', '181000', 'KUSUMA BANGSA', '   ', '                  ', '000'),
(65, '000000072', 'PEN.TUNAI ATM WONOSOBO   ', '01', '181000', 'WONOSOBO     ', '   ', '                  ', '000'),
(66, '000000073', 'PEN.TUNAI ATM KEBUMEN    ', '01', '181000', 'KEBUMEN      ', '   ', '                  ', '000'),
(67, '000000074', 'PEN.TUNAI ATM SUKABUMI   ', '01', '181000', 'SUKABUMI     ', '   ', '                  ', '000'),
(68, '000000076', 'PEN.TUNAI ATM PASAR MYTK ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(69, '000000077', 'PEN.TUNAI ATM JEMB.MERAH ', '01', '181000', 'JEMB. MERAH  ', '   ', '                  ', '000'),
(70, '000000078', 'PEN.TUNAI ATM A.YANI PDG ', '01', '191000', 'PADANG       ', '00 ', '                  ', '000'),
(71, '000000080', 'PEN.TUNAI ATM KENDARI    ', '01', '181000', 'KENDARI      ', '00 ', '                  ', '000'),
(72, '000000081', 'PEN.TUNAI ATM TANGERANG  ', '01', '181000', 'TANGERANG    ', '   ', '                  ', '000'),
(73, '000000082', 'PEN.TUNAI ATM SITUBONDO  ', '01', '181000', 'SITUBONDO    ', '   ', '                  ', '000'),
(74, '000000083', 'PEN.TUNAI ATM SUMENEP    ', '01', '181000', 'SUMENEP      ', '   ', '                  ', '000'),
(75, '000000084', 'PEN.TUNAI ATM PURBALINGGA', '01', '181000', 'PURBALINGGA  ', '   ', '                  ', '000'),
(76, '000000085', 'PEN.TUNAI ATM BANJAR     ', '01', '181000', 'BANJAR       ', '   ', '                  ', '000'),
(77, '000000087', 'PEN.TUNAI ATM A. YANI BDG', '02', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(78, '000000088', 'PEN.TUNAI ATM PADANG SDP ', '01', '181000', 'PADANG       ', '   ', '                  ', '000'),
(79, '000000089', 'PEN.TUNAI ATM GAMBIR     ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(80, '000000090', 'PEN.TUNAI ATM LANGSA     ', '01', '181000', 'LANGSA       ', '   ', '                  ', '000'),
(81, '000000091', 'PEN.TUNAI ATM BANYUWANGI ', '01', '181000', 'BANYUWANGI   ', '   ', '                  ', '000'),
(82, '000000093', 'PEN.TUNAI ATM PEMANTANG S', '01', '181000', 'PEMANTANG STR', '   ', '                  ', '000'),
(83, '000000094', 'PEN.TUNAI ATM MENTENG    ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(84, '000000095', 'PEN.TUNAI ATM KARAWANG   ', '01', '181000', 'KARAWANG     ', '   ', '                  ', '000'),
(85, '000000096', 'PEN.TUNAI ATM LUWUK      ', '01', '181000', 'LUWUK        ', '00 ', '                  ', '000'),
(86, '000000097', 'PEN.TUNAI ATM TERNATE    ', '01', '181000', 'BITUNG       ', '00 ', '                  ', '000'),
(87, '000000098', 'PEN.TUNAI ATM PAMEKASAN  ', '01', '181000', 'PAMEKASAN    ', '00 ', '                  ', '000'),
(88, '000000099', 'PEN.TUNAI ATM KANAKA MND ', '02', '181000', 'MENADO       ', '00 ', '                  ', '000'),
(89, '000000100', 'PEN.TUNAI ATM PARE-PARE  ', '01', '181000', 'PARE-PARE    ', '00 ', '                  ', '000'),
(90, '000000101', 'PEN.TUNAI ATM SENGKANG   ', '01', '181000', 'SENGKANG     ', '00 ', '                  ', '000'),
(91, '000000102', 'PENG.TUNAI ATM GARUT     ', '01', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(92, '000000103', 'PEN.TUNAI ATM CIANJUR    ', '01', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(93, '000000105', 'PEN.TUNAI ATM BIREUN     ', '01', '181000', 'ACEH         ', '   ', '                  ', '000'),
(94, '000000106', 'PEN.TUNAI ATM KOTAMOBAGU ', '01', '91100', 'KOTAMOBAGU   ', '   ', '                  ', '000'),
(95, '000000107', 'PEN.TUNAI ATM IMAM BONJOL', '01', '191000', 'PADANG       ', '00 ', '                  ', '000'),
(96, '000000108', 'PENG TUNAI ATM BNI KETAPA', '01', '181000', 'KETAPANG     ', '   ', '                  ', '000'),
(97, '000000109', 'PEN.TUNAI ATM PROBOLINGGO', '01', '181000', 'PROBOLINGGO  ', '   ', '                  ', '000'),
(98, '000000110', 'PEN.TUNAI ATM ILIR PLBG  ', '01', '181000', 'PALEMBANG    ', '   ', '                  ', '000'),
(99, '000000111', 'PEN.TUNAI ATM MUSI PLBG  ', '01', '181000', 'PALEMBANG    ', '   ', '                  ', '000'),
(100, '000000113', 'PEN.TUNAI ATM KEDIRI     ', '01', '181000', 'KEDIRI       ', '   ', '                  ', '000'),
(101, '000000114', 'PEN.TUNAI ATM JL. STM MDN', '01', '181000', 'MEDAN        ', '   ', '                  ', '000'),
(102, '000000116', 'PEN.TUNAI ATM KOTABUMI   ', '01', '181000', 'KOTABUMI     ', '   ', '                  ', '000'),
(103, '000000117', 'PEN.TUNAI ATM BOJONEGORO ', '01', '181000', 'BOJONEGORO   ', '   ', '                  ', '000'),
(104, '000000118', 'PEN.TUNAI ATM INDRAMAYU  ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(105, '000000119', 'PEN.TUNAI ATM MADIUN     ', '01', '181000', 'MADIUN       ', '   ', '                  ', '000'),
(106, '000000120', 'PEN.TUNAI ATM TEBET      ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(107, '000000121', 'PEN.TUNAI ATM MALANG     ', '01', '181000', 'MALANG       ', '   ', '                  ', '000'),
(108, '000000123', 'PEN.TUNAI ATM JOMBANG    ', '01', '181000', 'JOMBANG      ', '   ', '                  ', '000'),
(109, '000000124', 'PEN.TUNAI ATM MOJOKERTO  ', '01', '181000', 'MOJOKERTO    ', '   ', '                  ', '000'),
(110, '000000125', 'PEN. TUNAI ATM CILEGON   ', '01', '181000', 'CILEGON      ', '   ', '                  ', '000'),
(111, '000000126', 'PEN. TUNAI ATM RKS BITUNG', '01', '181000', 'RKS BITUNG   ', '   ', '                  ', '000'),
(112, '000000128', 'PEN.TUNAI ATM KTBARU P.LA', '01', '181000', 'KOTABARU     ', '00 ', '                  ', '000'),
(113, '000000130', 'PENG.TUNAI ATM PECENONGAN', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(114, '000000131', 'PEN.TUNAI ATM KUNINGAN   ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(115, '000000133', 'PEN.TUNAI ATM LUWUK      ', '01', '91100', 'LUWUK        ', '   ', '                  ', '000'),
(116, '000000134', 'PEN.TUNAI ATM WATANSOPENG', '01', '181000', 'WATANSOPENG  ', '00 ', '                  ', '000'),
(117, '000000135', 'PEN.TUNAI ATM P.PINANG   ', '01', '181000', 'PANGKALPINANG', '   ', '                  ', '000'),
(118, '000000136', 'PEN.TUNAI ATM CIAMIS     ', '01', '181000', 'CIAMIS       ', '   ', '                  ', '000'),
(119, '000000137', 'PEN.TUNAI ATM SALATIGA   ', '01', '181000', 'SALATIGA     ', '   ', '                  ', '000'),
(120, '000000138', 'PEN.TUNAI ATM PURWOREJO  ', '01', '181000', 'PURWOREJO    ', '   ', '                  ', '000'),
(121, '000000139', 'PEN.TUNAI ATM BITUNG     ', '01', '181000', 'TERNATE      ', '   ', '                  ', '000'),
(122, '000000140', 'PEN.TUNAI ATM PAYAKUMBUH ', '01', '201000', 'PAYAKUMBUH   ', '00 ', '                  ', '000'),
(123, '000000142', 'PEN.TUNAI ATM T.KARANG   ', '01', '181000', 'TANJUNGKARANG', '   ', '                  ', '000'),
(124, '000000145', 'PEN.TUNAI ATM PATI       ', '01', '181000', 'PATI         ', '   ', '                  ', '000'),
(125, '000000146', 'PEN.TUNAI ATM JEPARA     ', '01', '181000', 'JEPARA       ', '   ', '                  ', '000'),
(126, '000000147', 'PEN.TUNAI ATM PPST PKBARU', '01', '191000', 'PEKANBARU    ', '00 ', '                  ', '000'),
(127, '000000148', 'PEN.TUNAI ATM SIGLI      ', '01', '181000', 'SIGLI        ', '   ', '                  ', '000'),
(128, '000000151', 'PEN. TUNAI ATM SINGKAWANG', '01', '181000', 'SINGKAWANG   ', '   ', '                  ', '000'),
(129, '000000155', 'PEN.TUNAI ATM BANJARBARU ', '01', '181000', 'BANJARBARU   ', '00 ', '                  ', '000'),
(130, '000000156', 'PEN.TUNAI ATM BALIGE     ', '01', '181000', 'BALIGE       ', '   ', '                  ', '000'),
(131, '000000158', 'PEN.TUNAI ATM PANJANG    ', '01', '181000', 'PANJANG      ', '   ', '                  ', '000'),
(132, '000000166', 'PEN.TUNAI ATM KUALA KAPS.', '01', '181000', 'KUALA KAPUAS ', '00 ', '                  ', '000'),
(133, '000000168', 'PEN.TUNAI ATM BAU-BAU    ', '01', '181000', 'BAU-BAU      ', '   ', '                  ', '000'),
(134, '000000169', 'PEN.TUNAI ATM TEGAL      ', '01', '181000', 'TEGAL        ', '   ', '                  ', '000'),
(135, '000000172', 'PEN. TUNAI ATM ROA MALAKA', '01', '181000', 'ROA MALAKA   ', '   ', '                  ', '000'),
(136, '000000178', 'PEN.TUNAI ATM SUNGAI PNH ', '01', '91100', 'SUNGAI PENUH ', '   ', '                  ', '000'),
(137, '000000179', 'PEN.TUNAI ATM PURWAKARTA ', '01', '181000', 'PURWAKARTA   ', '   ', '                  ', '000'),
(138, '000000180', 'PEN.TUNAI ATM SUMEDANG   ', '01', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(139, '000000181', 'PEN. TUNAI ATM BEKASI    ', '01', '181000', 'BEKASI       ', '   ', '                  ', '000'),
(140, '000000182', 'PEN.TUNAI ATM SUBANG     ', '01', '181000', 'SUBANG       ', '   ', '                  ', '000'),
(141, '000000183', 'PEN.TUNAI ATM BLITAR     ', '01', '181000', 'BLITAR       ', '   ', '                  ', '000'),
(142, '000000184', 'PEN.TUNAI ATM SAMARINDA  ', '01', '181000', 'SAMARINDA    ', '00 ', '                  ', '000'),
(143, '000000185', 'PEN.TUNAI ATM T.TINGGI T ', '01', '181000', 'T. TINGGI    ', '   ', '                  ', '000'),
(144, '000000188', 'PEN.TUNAI ATM TAHUNA     ', '01', '181000', 'TAHUNA       ', '   ', '                  ', '000'),
(145, '000000190', 'PEN.TUNAI ATM BIMA       ', '01', '181000', 'BIMA         ', '   ', '                  ', '000'),
(146, '000000191', 'PEN.TUNAI ATM WONOGIRI   ', '01', '181000', 'WONOGIRI     ', '   ', '                  ', '000'),
(147, '000000193', 'PEN.TUNAI ATM KABANJAHE  ', '01', '181000', 'KABANJAHE    ', '   ', '                  ', '000'),
(148, '000000197', 'PEN.TUNAI ATM T0LI TOLI  ', '01', '181000', 'TOLI TOLI    ', '   ', '                  ', '000'),
(149, '000000200', 'PEN.TUNAI ATM PANGKL.BUN ', '01', '181000', 'PANGKALAN BUN', '00 ', '                  ', '000'),
(150, '000000203', 'PEN.TUNAI ATM PALOPO     ', '01', '181000', 'PALOPO       ', '00 ', '                  ', '000'),
(151, '000000204', 'PEN.TUNAI ATM LUBUK LINGG', '01', '181000', 'LUBUKLINGGAU ', '   ', '                  ', '000'),
(152, '000000205', 'PEN.TUNAI ATM P.ANTASARI ', '01', '181000', 'P.ANTASR BJR ', '00 ', '                  ', '000'),
(153, '000000207', 'PEN.TUNAI ATM KLATEN     ', '01', '181000', 'KLATEN       ', '   ', '                  ', '000'),
(154, '000000209', 'PEN. TUNAI ATM CIKAMPEK  ', '01', '181000', 'CIKAMPEK     ', '   ', '                  ', '000'),
(155, '000000212', 'REG DAN UNREG ATU        ', '02', '250914', 'BNICC        ', '   ', '                  ', '000'),
(156, '000000213', 'TRANSAKSI ATU            ', '02', '250914', 'BNICC        ', '   ', '                  ', '000'),
(157, '000000216', 'PEN.TUNAI ATM PASURUAN   ', '01', '181000', 'PASURUAN     ', '   ', '                  ', '000'),
(158, '000000217', 'PEN.TUNAI ATM POLEWALI   ', '01', '181000', 'POLEWALI     ', '00 ', '                  ', '000'),
(159, '000000220', 'PEN.TUNAI ATM KANAKA MND ', '01', '191000', 'MENADO       ', '00 ', '                  ', '000'),
(160, '000000221', 'PEN.TUNAI ATM NUNUKAN    ', '01', '181000', 'NUNUKAN      ', '00 ', '                  ', '000'),
(161, '000000222', 'PEN.TUNAI ATM PALU       ', '01', '181000', 'PALU         ', '00 ', '                  ', '000'),
(162, '000000223', 'PEN.TUNAI ATM BENGKULU   ', '01', '181000', 'BENGKULU     ', '   ', '                  ', '000'),
(163, '000000224', 'PEN.TUNAI ATM GRESIK     ', '01', '181000', 'GRESIK       ', '   ', '                  ', '000'),
(164, '000000225', 'PEN.TUNAI ATM.TARAKAN    ', '01', '181000', 'TARAKAN      ', '00 ', '                  ', '000'),
(165, '000000227', 'PEN.TUNAI ATM PSR KLEWER ', '01', '181000', 'SOLO         ', '   ', '                  ', '000'),
(166, '000000228', 'PEN.TUNAI ATM UGM YGYRTA ', '01', '181000', 'YOGYAKARTA   ', '   ', '                  ', '000'),
(167, '000000229', 'PEN.TUNAI ATM KUPANG     ', '01', '181000', 'KUPANG       ', '00 ', '                  ', '000'),
(168, '000000230', 'PEN.TUNAI ATM SIDOARJO   ', '01', '181000', 'SIDOARJO     ', '   ', '                  ', '000'),
(169, '000000231', 'PEN.TUNAI ATM PDSARI BLK ', '01', '181000', 'PANDANSARI BL', '00 ', '                  ', '000'),
(170, '000000232', 'PEN.TUNAI ATM BOOM BR PLB', '01', '181000', 'BOOM BR PLB  ', '   ', '                  ', '000'),
(171, '000000233', 'PEN.TUNAI ATM MH.THAMRIN ', '02', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(172, '000000234', 'PEN.TUNAI ATM TJ.REDEB   ', '01', '181000', 'TANJUNG REDEB', '00 ', '                  ', '000'),
(173, '000000235', 'PEN.TUNAI ATM BONDOWOSO  ', '01', '181000', 'BONDOWOSO    ', '   ', '                  ', '000'),
(174, '000000236', 'PEN.TUNAI ATM ITB BANDUNG', '01', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(175, '000000237', 'PEN.TUNAI ATM TOMANG PLAZ', '02', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(176, '000000238', 'PEN.TUNAI ATM TOBELO     ', '02', '181000', 'TOBELO       ', '00 ', '                  ', '000'),
(177, '000000239', 'PEN.TUNAI ATM RATU PLAZA ', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(178, '000000240', 'PEN.TUNAI ATM KUALA TKL  ', '01', '181000', 'KUALATUNGKAL ', '   ', '                  ', '000'),
(179, '000000241', 'PEN. TUNAI ATM MANGGA DUA', '08', '181000', 'MANGGA DUA   ', '   ', '                  ', '000'),
(180, '000000242', 'PEN.TUNAI ATM TULUNGAGUNG', '01', '181000', 'TULUNGAGUNG  ', '   ', '                  ', '000'),
(181, '000000243', 'PEN.TUNAI ATM RAWAMANGUN ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(182, '000000244', 'PEN.TUNAI ATM KARANGAYU  ', '01', '181000', 'KARANGAYU    ', '   ', '                  ', '000'),
(183, '000000245', 'PEN.TUNAI ATM BATAM      ', '01', '191000', 'BATAM        ', '00 ', '                  ', '000'),
(184, '000000246', 'PEN.TUNAI ATM RASUNA SAID', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(185, '000000248', 'PEN.TUNAI ATM MATTOANGIN ', '01', '181000', 'MATTOANGIN   ', '00 ', '                  ', '000'),
(186, '000000250', 'PEN.TUNAI ATM PS MINGGU  ', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(187, '000000251', 'PEN.TUNAI ATM FATMAWATI  ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(188, '000000252', 'PEN.TUNAI ATM CEPU       ', '01', '181000', 'CEPU         ', '   ', '                  ', '000'),
(189, '000000253', 'PEN.TUNAI ATM UNIBRAW MLG', '01', '181000', 'UNIBRAW MLG  ', '   ', '                  ', '000'),
(190, '000000254', 'PEN.TUNAI ATM IKIP BDG   ', '01', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(191, '000000255', 'PEN.TUNAI ATM G.PANGE.SBY', '01', '181000', 'G.PANGERAN SB', '   ', '                  ', '000'),
(192, '000000256', 'PEN.TUNAI ATM CIPINANG   ', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(193, '000000257', 'PEN.TUNAI ATM BARABAI    ', '01', '181000', 'BARABAI      ', '00 ', '                  ', '000'),
(194, '000000258', 'PEN.TUNAI ATM UNAIR SBY  ', '02', '181000', 'UNAIR SBY    ', '   ', '                  ', '000'),
(195, '000000259', 'PEN.TUNAI ATM JAKARTA PST', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(196, '000000260', 'PEN.TUNAI ATM WISMA ARGMN', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(197, '000000261', 'PEN.TUNAI ATM UNDIP      ', '02', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(198, '000000262', 'PENG.TUNAI ATM HOTEL IND ', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(199, '000000263', 'PEN.TUNAI B.SKRN HATTA   ', '02', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(200, '000000264', 'PEN.TUNAI ATM LEGIAN     ', '01', '181000', 'LEGIAN-KUTA  ', '00 ', '                  ', '000'),
(201, '000000265', 'PEN.TUNAI ATM USU MEDAN  ', '02', '181000', 'MEDAN        ', '   ', '                  ', '000'),
(202, '000000266', 'PENG.TUNAI ATM MERDEKA SL', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(203, '000000268', 'PEN.TUNAI ATM JAYAPURA   ', '01', '181000', 'JAYAPURA     ', '00 ', '                  ', '000'),
(204, '000000269', 'PEN.TUNAI P.KEMERDEKAAN  ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(205, '000000270', 'PEN.TUNAI UNPAD BANDUNG  ', '01', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(206, '000000271', 'PEN.TUNAI ATM CIMAHI     ', '01', '181000', 'CIMAHI       ', '   ', '                  ', '000'),
(207, '000000272', 'PENG.TUNAI ATM PDKINDAH M', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(208, '000000273', 'PENG.TUNAI ATM UI DEPOK  ', '01', '240701', 'DEPOK        ', '   ', '                  ', '000'),
(209, '000000274', 'PEN.TUNAI ATM UNS SOLO   ', '01', '181000', 'UNS SOLO     ', '   ', '                  ', '000'),
(210, '000000275', 'PENG.TUNAI ATM SEMANGGI  ', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(211, '000000276', 'PEN.TUNAI ATM TUBAN      ', '01', '181000', 'TUBAN        ', '   ', '                  ', '000'),
(212, '000000277', 'PEN.TUNAI ATM DILI       ', '02', '181000', 'DILI         ', '00 ', '                  ', '000'),
(213, '000000278', 'PEN.TUNAI ATM PLKARAYA   ', '01', '181000', 'PALANGKARAYA ', '00 ', '                  ', '000'),
(214, '000000279', 'PEN.TUNAI ATM SORONG     ', '01', '181000', 'SORONG       ', '00 ', '                  ', '000'),
(215, '000000280', 'PEN.TUNAI ATM BANGKO     ', '01', '181000', 'BANGKO       ', '   ', '                  ', '000'),
(216, '000000281', 'PENG.TUNAI ATM SETIABLDG ', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(217, '000000282', 'PEN.TUNAI ATM RANTAU PRT ', '01', '181000', 'RANTAU PRT   ', '   ', '                  ', '000'),
(218, '000000283', 'PEN.TUNAI ATM MELAWAI    ', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(219, '000000284', 'PEN.TUNAI ATM ENDE       ', '01', '181000', 'ENDE         ', '00 ', '                  ', '000'),
(220, '000000285', 'PEN.TUNAI ATM MARGONDA   ', '02', '91100', 'DEPOK-JABAR  ', '   ', '                  ', '000'),
(221, '000000286', 'PEN.TUNAI ATM WISMA 46   ', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(222, '000000287', 'PEN.TUNAI ATM TENGGARONG ', '02', '181000', 'TENGGARONG   ', '00 ', '                  ', '000'),
(223, '000000288', 'PEN.TUNAI ATM PONOROGO   ', '01', '181000', 'PONOROGO     ', '   ', '                  ', '000'),
(224, '000000289', 'PEN.TUNAI ATM METRO      ', '01', '181000', 'METRO        ', '   ', '                  ', '000'),
(225, '000000290', 'PEN.TUNAI ATM MAUMERE    ', '01', '181000', 'MAUMERE      ', '00 ', '                  ', '000'),
(226, '000000291', 'PEN.TUNAI ATM MERDEKA TMR', '08', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(227, '000000292', 'PEN.TUNAI ATM LUMAJANG   ', '01', '181000', 'LUMAJANG     ', '   ', '                  ', '000'),
(228, '000000293', 'PEN.TUNAI ATM KAYU AGUNG ', '01', '181000', 'JAKARTA      ', '   ', '                  ', '000'),
(229, '000000294', 'PEN.TUNAI ATM PRABUMULIH ', '01', '181000', 'PRABUMULIH   ', '   ', '                  ', '000'),
(230, '000000295', 'PEN.TUNAI ATM BATURAJA   ', '01', '181000', 'BATURAJA     ', '   ', '                  ', '000'),
(231, '000000296', 'PEN.TUNAI ATM POSINDO BDG', '02', '181000', 'BANDUNG      ', '   ', '                  ', '000'),
(232, '000000297', 'PEN.TUNAI ATM BONTANG    ', '01', '181000', 'BONTANG      ', '00 ', '                  ', '000'),
(233, '000000298', 'PEN.TUNAI ATM MANOKWARI  ', '01', '181000', 'MANOKWARI    ', '00 ', '                  ', '000'),
(234, '000000299', 'PEN.TUNAI ATM BIAK       ', '01', '181000', 'BIAK         ', '00 ', '                  ', '000'),
(235, '000000300', 'PEN.TUNAI ATM MERAUKE    ', '01', '20507', 'MERAUKE      ', '   ', '                  ', '000'),
(236, '000000301', 'PEN.TUNAI ATM BULUKUMBA  ', '01', '181000', 'BULUKUMBA    ', '00 ', '                  ', '000'),
(237, '000000302', 'PEN.TUNAI ATM RENON DPS  ', '01', '181000', 'DENPASAR     ', '00 ', '                  ', '000'),
(238, '000000303', 'PEN.TUNAI ATM MUARA BUNGO', '01', '181000', 'MUARA BUNGO  ', '   ', '                  ', '000'),
(239, '000000304', 'PEN.TUNAI ATM SOLOK      ', '01', '21100', 'SOLOK        ', '00 ', '                  ', '000'),
(240, '000000305', 'TEST SMS                 ', '02', '230101', 'JAKARTA      ', '   ', '                  ', '000'),
(241, '000000306', 'ATM BNI CAB MUARA TEWEH  ', '02', '61108', 'MUARA TEWEH  ', '   ', '                  ', '000'),
(242, '000000307', 'PEN.TUNAI ATM  PLW       ', '01', '31108', 'POLEWALI     ', '   ', '                  ', '000'),
(243, '000000308', 'PEN.TUNAI ATM SINTANG    ', '01', '240316', 'SINTANG      ', '   ', '                  ', '000'),
(244, '000000309', 'PEN.TUNAI ATM KALAPA GDG ', '02', '180110', 'JAKARTA      ', '   ', '                  ', '000'),
(245, '000000310', 'KWJ KPD VENDOR CORPCRD   ', '01', '270317', 'JAKARTA      ', '   ', '                  ', '000'),
(246, '000000311', 'SS PCTD 0,25%            ', '02', '270717', 'JAKARTA      ', '   ', '                  ', '000'),
(247, '000000312', 'RE-SS PCTD 0,25%         ', '02', '270717', 'JAKARTA      ', '   ', '                  ', '000'),
(248, '000000313', 'SS 0.71%                 ', '02', '200617', 'JAKARTA      ', '   ', '                  ', '000'),
(249, '000000314', 'RE-SS 0,71%              ', '02', '200617', 'JAKARTA      ', '   ', '                  ', '000'),
(250, '000000315', 'PEN.TUNAI ATM  PACITAN   ', '01', '50517', 'PACITAN      ', '   ', '                  ', '000'),
(251, '000000316', 'FAMILY PROTECTION        ', '01', '260417', 'JAKARTA      ', '   ', '                  ', '005'),
(252, '000000317', 'CRITICAL PROTECTION      ', '01', '280417', 'JAKARTA      ', '   ', '                  ', '005'),
(253, '000000318', 'PROTEKSI PRIMA           ', '01', '270417', 'JAKARTA      ', '   ', '                  ', '005'),
(254, '000000319', 'PA PROTECTION PLUS       ', '01', '270417', 'JAKARTA      ', '   ', '                  ', '005'),
(255, '000000320', 'SS OVERSEAS 0%           ', '02', '200317', 'JAKARTA      ', '   ', '                  ', '000'),
(256, '000000321', 'RE-SS OVERSEAS 0%        ', '02', '200317', 'JAKARTA      ', '   ', '                  ', '000'),
(257, '000000322', 'SS BIC 24 BULAN          ', '02', '270217', 'JAKARTA      ', '   ', '                  ', '000'),
(258, '000000323', 'RE-SS BIC 24 BLN         ', '02', '270217', 'JAKARTA      ', '   ', '                  ', '000'),
(259, '000000324', 'SS UMROH 24 BULAN        ', '02', '270217', 'JAKARTA      ', '   ', '                  ', '000'),
(260, '000000325', 'RE- SS UMROH 24 BULAN    ', '02', '270217', 'JAKARTA      ', '   ', '                  ', '000'),
(261, '000000326', 'DANA TUNAI SPECIAL       ', '01', '280217', 'JAKARTA      ', '   ', '                  ', '000'),
(262, '000000327', 'SMART GUARD INSURANCE    ', '01', '130217', 'JAKARTA      ', '   ', '                  ', '005'),
(263, '000000328', 'AKSENBELANJA INSTL       ', '01', '200117', 'JAKARTA      ', '   ', '                  ', '000'),
(264, '000000329', 'RE-AKSENBELANJA INSTL    ', '02', '200117', 'JAKARTA      ', '   ', '                  ', '000'),
(265, '000000330', 'AKSENBELANJA INSTL       ', '01', '200117', 'JAKARTA      ', '   ', '                  ', '000'),
(266, '000000331', 'RE-AKSENBELANJA INSTL    ', '02', '200117', 'JAKARTA      ', '   ', '                  ', '000'),
(267, '000000332', 'TELETRAVEL HIS 0%        ', '02', '100117', 'JAKARTA      ', '   ', '                  ', '000'),
(268, '000000333', 'RE-TELETRAVEL HIS 0%     ', '02', '100117', 'JAKARTA      ', '   ', '                  ', '000'),
(269, '000000334', 'TELETRAVEL UMROH 0%      ', '02', '100117', 'JAKARTA      ', '   ', '                  ', '000'),
(270, '000000335', 'RE-T.TRAVEL UMROH 0%     ', '02', '100117', 'JAKARTA      ', '   ', '                  ', '000'),
(271, '000000336', 'SS PCTD 0.45             ', '02', '61216', 'JAKARTA      ', '   ', '                  ', '000'),
(272, '000000337', 'RE-OTO SS PCTD 0.45      ', '02', '61216', 'JAKARTA      ', '   ', '                  ', '000'),
(273, '000000338', 'XTRADANA 0,45%           ', '01', '141116', 'JAKARTA      ', '   ', '                  ', '000'),
(274, '000000339', 'RE-OTO XTRADANA 0,45%    ', '02', '141116', 'JAKARTA      ', '   ', '                  ', '001'),
(275, '000000340', 'ACTIVE PLUS              ', '01', '260816', 'JAKARTA      ', '   ', '                  ', '002'),
(276, '000000341', 'SAFE MEDICAL PLAN        ', '01', '260816', 'JAKARTA      ', '   ', '                  ', '002'),
(277, '000000342', 'STRENGTH PLUS            ', '01', '260816', 'JAKARTA      ', '   ', '                  ', '002'),
(278, '000000343', 'BNI TELETRAVEL           ', '01', '260816', 'JAKARTA      ', '   ', '                  ', '001'),
(279, '000000344', 'DANA TUNAI HASANAH       ', '02', '41115', 'JAKARTA      ', '   ', '                  ', '000'),
(280, '000000345', 'RE OTO DANA TUNAI HASANAH', '02', '41115', 'JAKARTA      ', '   ', '                  ', '000'),
(281, '000000346', 'INS DANA TUNAI HASANAH?? ', '02', '41115', 'JAKARTA      ', '   ', '                  ', '001'),
(282, '000000347', 'RE OTO INS DTUNAI HASANAH', '02', '41115', 'JAKARTA      ', '   ', '                  ', '001'),
(283, '000000348', 'BNI INSTALLMENT 0,6      ', '02', '100415', 'JAKARTA      ', '   ', '                  ', '001'),
(284, '000000349', 'RE-INSTALLMENT 0,6%      ', '02', '100415', 'JAKARTA      ', '   ', '                  ', '000'),
(285, '000000350', 'SMART TRAVELLER PLUS     ', '01', '211114', 'JAKARTA      ', '   ', '                  ', '002'),
(286, '000000351', 'LIFE STYLE PROTECTION    ', '08', '211114', 'JAKARTA      ', '   ', '                  ', '002'),
(287, '000000353', 'RE-OTO LUXURY BRAND      ', '02', '201014', 'JAKARTA      ', '   ', '                  ', '000'),
(288, '000000354', 'CASH LOAN HASANAH CARD   ', '01', '240914', 'JAKARTA      ', '   ', '                  ', '000'),
(289, '000000355', 'SS CASHLOAN HASANHCARD   ', '02', '240914', 'JAKARTA      ', '   ', '                  ', '000'),
(290, '000000356', 'REOTO CASH HASANAHCARD   ', '02', '240914', 'JAKARTA      ', '   ', '                  ', '000'),
(291, '000000357', 'QURBAN RUMAH ZAKAT       ', '01', '240914', 'JAKARTA      ', '   ', '                  ', '000'),
(292, '000000358', 'SS QURBAN RUMAH ZAKAT    ', '02', '240914', 'JAKARTA      ', '   ', '                  ', '000'),
(293, '000000359', 'RE-OTO QURBAN RZ         ', '02', '240914', 'JAKARTA      ', '   ', '                  ', '000'),
(294, '000000360', 'BIAYA TRANSAKSI          ', '02', '240914', 'JAKARTA      ', '   ', '                  ', '000'),
(295, '000000361', 'SS BIAYA TRANSAKSI       ', '02', '240914', 'JAKARTA      ', '   ', '                  ', '000'),
(296, '000000362', 'RE-OTO BY TRANSAKSI      ', '02', '240914', 'JAKARTA      ', '   ', '                  ', '000'),
(297, '000000363', 'BNI INSTALLMENT 0,4      ', '02', '250914', 'JAKARTA      ', '   ', '                  ', '000'),
(298, '000000364', 'RE-INSTALLMENT 0,4%      ', '02', '250914', 'JAKARTA      ', '   ', '                  ', '000'),
(299, '000000365', 'PERLINDUNGAN ABSOLUT     ', '01', '20414', 'JAKARTA      ', '   ', '                  ', '000'),
(300, '000000366', 'KARTU TUNAI GOLD INST    ', '02', '160114', 'JAKARTA      ', '   ', '                  ', '001'),
(301, '000000367', 'RE-OTO KRTU TUNAI GOLD   ', '02', '160114', 'JAKARTA      ', '   ', '                  ', '001'),
(302, '000000368', 'KARTU TUNAI PLAT INST    ', '02', '160114', 'JAKARTA      ', '   ', '                  ', '001'),
(303, '000000369', 'RE-OTO KRTU TUNAI PLAT   ', '02', '160114', 'JAKARTA      ', '   ', '                  ', '001'),
(304, '000000370', 'KARTU TUNAI STAF INST    ', '02', '160114', 'JAKARTA      ', '   ', '                  ', '001'),
(305, '000000371', 'RE-OTO KRTU TUNAI STAF   ', '02', '160114', 'JAKARTA      ', '   ', '                  ', '001'),
(306, '000000372', 'PROMO 0% GA INDONESIA    ', '02', '201113', 'JAKARTA      ', '   ', '                  ', '000'),
(307, '000000373', 'RE-OTO PROMO 0% GA IND   ', '02', '201113', 'JAKARTA      ', '   ', '                  ', '000'),
(308, '000000374', 'UANG PDKN BINUS 9BL      ', '02', '221013', 'JAKARTA      ', '   ', '                  ', '000'),
(309, '000000375', 'RE-OTO PDKN BINUS 9BL    ', '02', '221013', 'JAKARTA      ', '   ', '                  ', '000'),
(310, '000000376', 'UANG PDKN BINUS 12BL     ', '02', '221013', 'JAKARTA      ', '   ', '                  ', '000'),
(311, '000000377', 'RE-OTO PDKN BINUS 12BL   ', '02', '221013', 'JAKARTA      ', '   ', '                  ', '000'),
(312, '000000378', 'ALLISYA PROTEKSIKU       ', '01', '171013', 'JAKARTA      ', '   ', '                  ', '010'),
(313, '000000379', 'ALLISYA KESEHATANKU      ', '01', '171013', 'JAKARTA      ', '   ', '                  ', '010'),
(314, '000000380', 'TELETRAVEL CICILAN  0%   ', '01', '140813', 'JAKARTA      ', '   ', '                  ', '000'),
(315, '000000381', 'RE-OTO T.TRAVEL 0%       ', '02', '140813', 'JAKARTA      ', '   ', '                  ', '000'),
(316, '000000382', 'UMROH CICILAN            ', '02', '140813', 'JAKARTA      ', '   ', '                  ', '000'),
(317, '000000383', 'RE-OTO T.TRAVEL REG      ', '02', '140813', 'JAKARTA      ', '   ', '                  ', '000'),
(318, '000000384', 'TELETRAVEL INST 0% GA    ', '02', '140813', 'JAKARTA      ', '   ', '                  ', '000'),
(319, '000000385', 'RE-OTO T.TRAVEL 0% GA    ', '02', '140813', 'JAKARTA      ', '   ', '                  ', '000'),
(320, '000000386', 'UANG PENDIDIKAN BINUS    ', '02', '171013', 'JAKARTA      ', '   ', '                  ', '001'),
(321, '000000387', 'RE-OTO UANG PDKN BINUS   ', '02', '171013', 'JAKARTA      ', '   ', '                  ', '000'),
(322, '000000389', 'SS 0% AIRLINES           ', '02', '190713', 'JAKARTA      ', '   ', '                  ', '000'),
(323, '000000390', 'RE-OTO SS 0% AIRLINES    ', '02', '190713', 'JAKARTA      ', '   ', '                  ', '000'),
(324, '000000391', 'SS 0% TRAVEL             ', '02', '190713', 'JAKARTA      ', '   ', '                  ', '000'),
(325, '000000392', 'RE-OTO SS 0% TRAVEL      ', '02', '190713', 'JAKARTA      ', '   ', '                  ', '000'),
(326, '000000393', 'RE-OTO GE HEALTHY INDONES', '02', '60912', 'JAKARTA      ', '000', '                  ', '001'),
(327, '000000394', 'GE HEALTHY INDONESIA     ', '01', '70312', 'JAKARTA      ', '   ', '                  ', '000'),
(328, '000000395', 'SS 0% FASHION AT MTA     ', '02', '50112', 'JAKARTA      ', '   ', '                  ', '000'),
(329, '000000396', 'RE-OTO SS % FASHION AT MT', '02', '50112', 'JAKARTA      ', '   ', '                  ', '000'),
(330, '000000397', 'PROGRAM ADOPSI WWF       ', '02', '20112', 'JAKARTA      ', '   ', '                  ', '000'),
(331, '000000398', 'XTRADANA ASRI            ', '02', '251011', 'JAKARTA      ', '   ', '                  ', '000'),
(332, '000000399', 'RE-OTO XTRADANA ASRI     ', '02', '251011', 'JAKARTA      ', '   ', '                  ', '000'),
(333, '000000400', 'SMARTSPENDING UMROH      ', '01', '191009', 'JAKARTA      ', '   ', '                  ', '000'),
(334, '000000401', 'DANAPLUS PEDULI SUMATERA ', '02', '191009', 'JAKARTA      ', '   ', '                  ', '000'),
(335, '000000402', 'RE-OTORISASI SMARTSPENDIN', '02', '191009', 'JAKARTA      ', '   ', '                  ', '000'),
(336, '000000403', 'UMROH BNI HASANAH CARD   ', '01', '191009', 'JAKARTA      ', '   ', '                  ', '000'),
(337, '000000404', 'TRAVEL INSP.GARUDA IND   ', '02', '181109', 'JAKARTA      ', '   ', '                  ', '000'),
(338, '000000405', 'SINGAPORE HEALTH INSPIRAT', '02', '231209', 'JAKARTA      ', '   ', '                  ', '000'),
(339, '000000406', 'BNI TELETRAVEL           ', '01', '161211', 'JAKARTA      ', '   ', '                  ', '000'),
(340, '000000407', 'TELETRAVEL HASANAH CARD  ', '01', '161211', 'JAKARTA      ', '   ', '                  ', '000'),
(341, '000000408', 'RE-OTO SS UMROH          ', '02', '201113', 'JAKARTA      ', '   ', '                  ', '000'),
(342, '000000409', 'AS KENDARAAN BINTANG     ', '02', '280912', 'JAKARTA      ', '   ', '                  ', '000'),
(343, '000000410', 'SMARTSPENDING 0.9%       ', '01', '131109', 'JAKARTA      ', '   ', '                  ', '000'),
(344, '000000411', 'CHINESE NEW YEAR TRAVEL I', '02', '220110', 'JAKARTA      ', '   ', '                  ', '000'),
(345, '000000412', 'JAVA JAZZ BLACKBERRY     ', '02', '280110', 'JAKARTA      ', '   ', '                  ', '000'),
(346, '000000413', 'HEALTHYDENT              ', '01', '100210', 'JAKARTA      ', '   ', '                  ', '010'),
(347, '000000414', 'HEALTHYLIFE              ', '01', '100210', 'JAKARTA      ', '   ', '                  ', '010'),
(348, '000000415', 'INSTLLMNT PCTD 0,8%      ', '01', '300310', 'JAKARTA      ', '   ', '                  ', '000'),
(349, '000000416', 'SMARTSPENDING 0,9%       ', '02', '150410', 'JAKARTA      ', '   ', '                  ', '000'),
(350, '000000417', 'SCHOOL HOLIDAY 2010      ', '01', '60510', 'JAKARTA      ', '   ', '                  ', '000'),
(351, '000000418', 'SMARTSPENDING 0,8%       ', '01', '100510', 'JAKARTA      ', '   ', '                  ', '000'),
(352, '000000419', 'INSTALLMENT 0% OVERSEAS  ', '02', '170613', 'JAKARTA      ', '   ', '                  ', '000'),
(353, '000000420', 'RE-OTO INST 0% OVERSEAS  ', '02', '170613', 'JAKARTA      ', '   ', '                  ', '000'),
(354, '000000421', 'YAYASAN ACT-DONASI       ', '01', '70610', 'JAKARTA      ', '   ', '                  ', '000'),
(355, '000000422', 'YPS BAK INFAK SEDEKAH    ', '01', '70610', 'JAKARTA      ', '   ', '                  ', '000'),
(356, '000000423', 'SMARTTRANSFER ZIS/DOMPET ', '02', '70610', 'JAKARTA      ', '   ', '                  ', '000'),
(357, '000000424', 'SMARTTRANSFER ZIS/WAKAF-Y', '02', '70610', 'JAKARTA      ', '   ', '                  ', '000'),
(358, '000000425', 'SMARTTRANSFER ZIS/DAARUT ', '01', '70610', 'JAKARTA      ', '   ', '                  ', '000'),
(359, '000000426', 'YAYASAN MER-C DONASI     ', '01', '70610', 'JAKARTA      ', '   ', '                  ', '000'),
(360, '000000428', 'ICT TRAVEL - HOLIDAY INSP', '02', '110610', 'JAKARTA      ', '   ', '                  ', '000'),
(361, '000000429', 'TELETRAVEL HASANAH CARD  ', '08', '170610', 'JAKARTA      ', '   ', '                  ', '000'),
(362, '000000430', 'TELETRAVEL HASANAH CARD  ', '02', '170610', 'JAKARTA      ', '   ', '                  ', '000'),
(363, '000000431', 'MERCHANDISING 0,8%       ', '01', '170610', 'JAKARTA      ', '   ', '                  ', '000'),
(364, '000000432', 'SMARTSPENDING OVERSEAS   ', '02', '170610', 'JAKARTA      ', '   ', '                  ', '000'),
(365, '000000433', 'SS UMROH ITIKAF NRA 2014 ', '02', '250610', 'JAKARTA      ', '   ', '                  ', '000'),
(366, '000000434', 'SMARTSPENDING 0% HEALTH  ', '01', '280610', 'JAKARTA      ', '   ', '                  ', '000'),
(367, '000000435', 'UMROH/I\'TIKAF BACKPACKER ', '02', '280610', 'JAKARTA      ', '   ', '                  ', '000'),
(368, '000000437', 'XD SPEC PUASA LEBARAN    ', '02', '100810', 'JAKARTA      ', '   ', '                  ', '000'),
(369, '000000438', 'SS PUASA LEBARAN         ', '01', '40810', 'JAKARTA      ', '   ', '                  ', '000'),
(370, '000000439', 'RAMADHAN TRAVEL INSPIRATI', '02', '100810', 'JAKARTA      ', '   ', '                  ', '000'),
(371, '000000440', 'TRIP TO MILAN - PARIS    ', '01', '100810', 'JAKARTA      ', '   ', '                  ', '000'),
(372, '000000441', '3RD ITTF 2010            ', '02', '230910', 'JAKARTA      ', '   ', '                  ', '000'),
(373, '000000442', 'INSTL 0%-HEALTH          ', '02', '230910', 'JAKARTA      ', '   ', '                  ', '000'),
(374, '000000443', 'SMARTSPENDING 0,8% - HEAL', '02', '230910', 'JAKARTA      ', '   ', '                  ', '000'),
(375, '000000444', 'INSPIRASI QURBAN DD      ', '01', '11010', 'JAKARTA      ', '   ', '                  ', '000'),
(376, '000000445', 'DOMPET DHUAFA (RE-OTO)   ', '02', '11010', 'JAKARTA      ', '   ', '                  ', '000'),
(377, '000000446', 'INSPIRASI KURBAN PKPU    ', '01', '11010', 'JAKARTA      ', '   ', '                  ', '000'),
(378, '000000447', 'PKPU (RE-OTO)            ', '02', '11010', 'JAKARTA      ', '   ', '                  ', '000'),
(379, '000000448', 'SMARTSPENDING 0,8% - 3RD ', '02', '11010', 'JAKARTA      ', '   ', '                  ', '000'),
(380, '000000449', 'SS DOMPET DHUAFA         ', '01', '11010', 'JAKARTA      ', '   ', '                  ', '000'),
(381, '000000450', 'SMART TRANSFER WAKAF     ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(382, '000000451', 'SMART TRANSFER INFAQ     ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(383, '000000452', 'SMARTTRANSFER SADAQAH    ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(384, '000000453', 'SMART TRANSFER WAKAF     ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(385, '000000454', 'SMART TRANSFER INFAQ     ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(386, '000000455', 'SMARTTRANSFER SADAQAH    ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(387, '000000456', 'SMART TRANSFER WAKAF     ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(388, '000000457', 'SMART TRANSFER INFAQ     ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(389, '000000458', 'SMARTTRANSFER SADAQAH    ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(390, '000000459', 'SMART TRANSFER WAKAF     ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(391, '000000460', 'SMART TRANSFER INFAQ     ', '01', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(392, '000000461', 'SMARTTRANSFER SADAQAH    ', '02', '210110', 'JAKARTA      ', '   ', '                  ', '000'),
(393, '000000462', 'SS PKPU                  ', '01', '11010', 'JAKARTA      ', '   ', '                  ', '000'),
(394, '000000463', 'TRF RUTIN IND MENGAJAR   ', '02', '280612', 'JAKARTA      ', '   ', '                  ', '000'),
(395, '000000464', 'BONUS PASTI SHOP         ', '02', '81010', 'JAKARTA      ', '   ', '                  ', '000'),
(396, '000000465', 'INSPIRASI QURBAN ACT     ', '01', '260811', 'JAKARTA      ', '   ', '                  ', '000'),
(397, '000000466', 'SS ACT                   ', '01', '260811', 'JAKARTA      ', '   ', '                  ', '000'),
(398, '000000467', 'ACT (RE-OTO)             ', '02', '260811', 'JAKARTA      ', '   ', '                  ', '000'),
(399, '000000468', 'BLACKBERRY SERVICEXL     ', '01', '11110', 'JAKARTA      ', '   ', '                  ', '001'),
(400, '000000469', 'JAKARTA FASHION WEEK     ', '02', '31110', 'JAKARTA      ', '   ', '                  ', '000'),
(401, '000000470', '3ANAPLUS PEDULI          ', '02', '121110', 'JAKARTA      ', '   ', '                  ', '000'),
(402, '000000471', 'DANA PEDULI ORANGUTAN    ', '01', '270911', 'JAKARTA      ', '   ', '                  ', '000'),
(403, '000000472', 'TRANSFER BALANCE         ', '02', '90610', 'JAKARTA      ', '   ', '                  ', '000'),
(404, '000000473', 'DANA TUNAI IND MENGAJAR  ', '02', '280612', 'JAKARTA      ', '   ', '                  ', '000'),
(405, '000000474', 'TRANSFER BALANCE(HASANAH)', '02', '201210', 'JAKARTA      ', '   ', '                  ', '000'),
(406, '000000475', 'BIAYA KPR                ', '02', '110311', 'JAKARTA      ', '   ', '                  ', '000'),
(407, '000000476', 'TRFRBAL HASANAH-DIRHAM   ', '02', '260911', 'JAKARTA      ', '   ', '                  ', '000'),
(408, '000000477', 'RE-OTO TRFRBAL HASANAH-DI', '02', '260911', 'JAKARTA      ', '   ', '                  ', '000'),
(409, '000000478', 'CICILAN 0% HASANAHCARD   ', '01', '141111', 'JAKARTA      ', '   ', '                  ', '000'),
(410, '000000479', 'RE-OTO CICILAN 0% HASANAH', '02', '141111', 'JAKARTA      ', '   ', '                  ', '000'),
(411, '000000480', 'SS LUXURY VILLAS         ', '02', '231211', 'JAKARTA      ', '   ', '                  ', '000'),
(412, '000000481', 'RE-OTO SS LUXURY VILLAS  ', '02', '231211', 'JAKARTA      ', '   ', '                  ', '000'),
(413, '000000482', 'UMROHHAJI SAHID TOUR 2015', '02', '20112', 'JAKARTA      ', '   ', '                  ', '000'),
(414, '000000483', 'SS UMROHHAJI SAHID TOUR 2', '02', '20112', 'JAKARTA      ', '   ', '                  ', '000'),
(415, '000000484', 'RE-OTO UMROHHAJI SAHID TO', '02', '20112', 'JAKARTA      ', '   ', '                  ', '000'),
(416, '000000485', 'UMROH ITIKAF NRA 2014    ', '02', '20112', 'JAKARTA      ', '   ', '                  ', '000'),
(417, '000000486', 'RE-OTO UMROH-I\'TIKAF NRA ', '02', '20112', 'JAKARTA      ', '   ', '                  ', '000'),
(418, '000000487', 'UMROH NRA 2014/2015      ', '02', '20112', 'JAKARTA      ', '   ', '                  ', '000'),
(419, '000000488', 'SS UMROH NRA 2014/2015   ', '02', '20112', 'JAKARTA      ', '   ', '                  ', '000'),
(420, '000000489', 'RE-OTO UMROH NRA 2014/201', '02', '20112', 'JAKARTA      ', '   ', '                  ', '000'),
(421, '000000490', 'UMROH PLUS NRA 2014/2015 ', '02', '20212', 'JAKARTA      ', '   ', '                  ', '000'),
(422, '000000491', 'SS UMROH PLUS NRA 2014/20', '02', '20212', 'JAKARTA      ', '   ', '                  ', '000'),
(423, '000000492', 'RE-OTO UMROH PLUS NRA 201', '02', '20212', 'JAKARTA      ', '   ', '                  ', '000'),
(424, '000000493', 'UMROH TALBIA TRAVEL      ', '02', '270312', 'JAKARTA      ', '   ', '                  ', '000'),
(425, '000000494', 'SS UMROH TALBIA TRAVEL   ', '02', '270312', 'JAKARTA      ', '   ', '                  ', '000'),
(426, '000000495', 'RE-OTO UMROH TALBIA TRAVE', '02', '270312', 'JAKARTA      ', '   ', '                  ', '000'),
(427, '000000496', 'PROG IB HASANAH CARD     ', '01', '270312', 'JAKARTA      ', '   ', '                  ', '000'),
(428, '000000497', 'SS PROG IB HASANAH CARD  ', '01', '270312', 'JAKARTA      ', '   ', '                  ', '000'),
(429, '000000498', 'RE-OTO PROG IB HASANAH CA', '02', '270312', 'JAKARTA      ', '   ', '                  ', '000'),
(430, '000000500', 'SMART SPENDING PROMO     ', '01', '280906', 'JAKARTA      ', 'BKT', '                  ', '000'),
(431, '000000501', 'SMART SPENDING PROMO     ', '02', '11206', 'JAKARTA      ', 'BKT', '                  ', '000');
INSERT INTO `templateuploadmismer` (`RowID`, `MID`, `MERCHAN_DBA_NAME`, `STATUS_EDC`, `OPEN_DATE`, `CITY`, `MSO`, `SOURCE_CODE`, `POS1`) VALUES
(432, '000000502', 'COSMOPOLITAN TRIP        ', '02', '201206', 'JAKARTA      ', 'BKT', '                  ', '000'),
(433, '000000503', 'SS AS KENDARAAN BINTANG  ', '02', '280912', 'JAKARTA      ', '   ', '                  ', '000'),
(434, '000000504', 'RE-OTOT ASURANSI RUMAH BI', '02', '280912', 'JAKARTA      ', '   ', '                  ', '000'),
(435, '000000505', 'DANAPLUS                 ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(436, '000000506', 'TRF SALDO KARTU KREDIT   ', '02', '271102', 'JAKARTA      ', '   ', '                  ', '000'),
(437, '000000507', 'DANAPLUS CICILAN FREEZE  ', '01', '290303', 'JAKARTA      ', '00 ', '                  ', '000'),
(438, '000000508', 'DANAPLUS CICILAN NON FRZ ', '02', '290303', 'JAKARTA      ', '00 ', '                  ', '000'),
(439, '000000509', 'DANAPLUS CICILAN FRZ&NON ', '02', '40403', 'JAKARTA      ', '   ', '                  ', '000'),
(440, '000000510', 'DANAPLUS CICILAN FRZ&NON ', '01', '160403', 'JAKARTA      ', '   ', '                  ', '000'),
(441, '000000511', 'PLN                      ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(442, '000000512', 'DANAPLUS CICILAN FRZ&NON ', '01', '280403', 'JAKARTA      ', '000', '                  ', '000'),
(443, '000000513', 'DANAPLUS CICILAN FRZ&NON ', '01', '280403', 'JAKARTA      ', '000', '                  ', '000'),
(444, '000000514', 'SEMINAR EDUKASI          ', '01', '290403', 'JAKARTA      ', '   ', '                  ', '000'),
(445, '000000515', 'CICILAN X-TRADANA        ', '01', '220503', 'JAKARTA      ', '   ', '                  ', '001'),
(446, '000000516', 'SMART SPENDING           ', '01', '220503', 'JAKARTA      ', '   ', '                  ', '000'),
(447, '000000517', 'SPP                      ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(448, '000000518', 'CICILAN X-TRADANA        ', '01', '270503', 'JAKARTA      ', '   ', '                  ', '001'),
(449, '000000519', 'CICILAN X-TRADANA        ', '01', '280503', 'JAKARTA      ', '   ', '                  ', '000'),
(450, '000000520', 'RE-OTO INSTL 0%-HEALTH   ', '02', '210613', 'JAKARTA      ', '   ', '                  ', '000'),
(451, '000000521', 'TECC PLUS VOUCHER        ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(452, '000000522', 'TECC PLUS STARTERPACK    ', '01', '191000', 'JAKARTA      ', '00 ', '                  ', '000'),
(453, '000000523', 'HEALTHY EXTRA PLUS       ', '01', '70912', 'JAKARTA      ', '   ', '                  ', '010'),
(454, '000000524', 'KIDS CARE PLUS           ', '01', '70912', 'JAKARTA      ', '   ', '                  ', '010'),
(455, '000000525', 'DANAPLUS KEMENKEU        ', '01', '200711', 'JAKARTA      ', '   ', '                  ', '000'),
(456, '000000526', 'BNI INS 0% 3 BLN         ', '01', '211212', 'JAKARTA      ', '   ', '                  ', '001'),
(457, '000000527', 'RE-OTO BNI INS 0% 3 BLN  ', '02', '211212', 'JAKARTA      ', '   ', '                  ', '001'),
(458, '000000528', 'BNI INST  0.75%          ', '02', '310513', 'JAKARTA      ', '   ', '                  ', '000'),
(459, '000000529', 'BNI INST  0.7%           ', '01', '310513', 'JAKARTA      ', '   ', '                  ', '000'),
(460, '000000530', 'TOP UP CITILINK          ', '02', '300413', 'JAKARTA      ', '   ', '                  ', '000'),
(461, '000000531', 'TELKOM                   ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(462, '000000532', 'SPRING SUMMER 2013       ', '02', '20513', 'JAKARTA      ', '   ', '                  ', '000'),
(463, '000000533', 'AKSEN BELANJA - CICILAN  ', '02', '80513', 'JAKARTA      ', '   ', '                  ', '001'),
(464, '000000535', 'SATELINDO                ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(465, '000000536', 'BNI INS 0% 6 BLN         ', '01', '110413', 'JAKARTA      ', '100', '                  ', '001'),
(466, '000000537', 'RE-OTO BNI INS 0% 6 BLN  ', '01', '110413', 'JAKARTA      ', '100', '                  ', '001'),
(467, '000000538', 'BNI INS 0% 9 BLN         ', '01', '110413', 'JAKARTA      ', '100', '                  ', '001'),
(468, '000000539', 'RE-OTO BNI INS 0% 9 BLN  ', '01', '110413', 'JAKARTA      ', '100', '                  ', '001'),
(469, '000000540', 'BNI INS 0% 12 BLN        ', '01', '110413', 'JAKARTA      ', '100', '                  ', '001'),
(470, '000000541', 'RE-OTO BNI INS 0% 12 BLN ', '01', '110413', 'JAKARTA      ', '100', '                  ', '001'),
(471, '000000542', 'RE-OTO INST 0.75%        ', '02', '50613', 'JAKARTA      ', '   ', '                  ', '001'),
(472, '000000543', 'RE-OTO INST 0.7%         ', '02', '50613', 'JAKARTA      ', '   ', '                  ', '000'),
(473, '000000545', 'MENTARI                  ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(474, '000000546', 'XD MIDYEAR EXP           ', '02', '290813', 'JAKARTA      ', '   ', '                  ', '000'),
(475, '000000547', 'RE OTO XD MIDYEAR EXP    ', '02', '290813', 'JAKARTA      ', '   ', '                  ', '000'),
(476, '000000548', 'INS MIDYEAR EXP          ', '02', '290813', 'JAKARTA      ', '   ', '                  ', '000'),
(477, '000000549', 'RE OTO INS MIDYEAR EXP   ', '02', '290813', 'JAKARTA      ', '   ', '                  ', '001'),
(478, '000000550', 'CAR SAFE INSURANCE       ', '01', '110117', 'JAKARTA      ', '   ', '                  ', '005'),
(479, '000000551', 'ICC PLUS                 ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(480, '000000552', 'BNI TRAVELLING CARD      ', '02', '10318', 'JAKARTA      ', '   ', '                  ', '000'),
(481, '000000553', 'DENTAL INSURANCE PLAN    ', '01', '80618', 'JAKARTA      ', '   ', '                  ', '000'),
(482, '000000555', 'TELKOMSEL                ', '08', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(483, '000000556', 'PERSONAL SHIELD PLUS     ', '01', '30712', 'JAKARTA      ', '   ', '                  ', '010'),
(484, '000000557', 'FAMILY CARE PLUS         ', '01', '30712', 'JAKARTA      ', '   ', '                  ', '010'),
(485, '000000558', 'JAMINAN BELANJA PLUS     ', '01', '30712', 'JAKARTA      ', '   ', '                  ', '010'),
(486, '000000559', 'DREAD DISEASE PLUS       ', '01', '30712', 'JAKARTA      ', '   ', '                  ', '010'),
(487, '000000560', 'EARLY PROTECTION PLUS    ', '01', '30712', 'JAKARTA      ', '   ', '                  ', '010'),
(488, '000000561', 'SIMPATI                  ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(489, '000000562', 'RENCANA EXTRA DINI       ', '01', '31012', 'JAKARTA      ', '   ', '                  ', '010'),
(490, '000000563', 'TELE TRAVEL ASTRINDO     ', '01', '300113', 'JAKARTA      ', '   ', '                  ', '000'),
(491, '000000564', 'TELE TRAVEL HASANAH CARD ', '01', '300113', 'JAKARTA      ', '   ', '                  ', '000'),
(492, '000000565', 'GARUDA SATU              ', '02', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(493, '000000566', 'PRIORITY PASS            ', '01', '250612', 'JAKARTA      ', '   ', '                  ', '000'),
(494, '000000567', 'BNI INSTALLMENT 0.66%    ', '02', '40712', 'JAKARTA      ', '   ', '                  ', '000'),
(495, '000000568', 'RE-OTO BNI INSTALLMENT 0.', '02', '40712', 'JAKARTA      ', '   ', '                  ', '000'),
(496, '000000569', 'TELE TRAVEL              ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '000'),
(497, '000000570', 'IM3 SMART                ', '01', '121201', 'JAKARTA      ', '   ', '                  ', '000'),
(498, '000000571', 'XL BEBAS REGULER         ', '01', '100102', 'JAKARTA      ', '   ', '                  ', '000'),
(499, '000000572', 'IM3 BRIGHT               ', '01', '280502', 'JAKARTA      ', '   ', '                  ', '000'),
(500, '000000573', 'HOSPITAL INCOME          ', '01', '181000', 'JAKARTA      ', '00 ', '                  ', '003');

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `ID` int(11) NOT NULL,
  `WilayahID` varchar(255) NOT NULL,
  `WilayahCode` varchar(255) DEFAULT NULL,
  `WilayahName` varchar(255) DEFAULT NULL,
  `KodeWilayah` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`ID`, `WilayahID`, `WilayahCode`, `WilayahName`, `KodeWilayah`) VALUES
(1, '01', 'WMD', 'MEDAN', 'A'),
(2, '02', 'WPD', 'PADANG', 'B'),
(3, '03', 'WPL', 'PALEMBANG', 'C'),
(4, '04', 'WBN', 'BANDUNG', 'D'),
(5, '05', 'WSM', 'SEMARANG', 'E'),
(6, '06', 'WSY', 'SURABAYA', 'F'),
(7, '07', 'WMK', 'MAKASSAR', 'G'),
(8, '08', 'WDR', 'DENPASAR', 'H'),
(9, '09', 'WBJ', 'BANJARMASIN', 'I'),
(10, '11', 'WMO', 'MANADO', 'J'),
(11, '16', 'WPU', 'PAPUA', 'K'),
(12, '12', 'WJK', 'JAKARTA KOTA', 'M'),
(13, '14', 'WJB', 'JAKARTA BSD', 'N'),
(14, '15', 'WJY', 'JAKARTA KEMAYORAN', 'O'),
(15, '16', 'WJS', 'JAKARTA SENAYAN', 'L'),
(16, '17', 'WYK', 'YOGYAKARTA', 'R'),
(17, '18', 'WMA', '18.WMA', 'S'),
(18, '19', 'EBK', 'EBK', ''),
(19, '20', 'SUPPORT', 'SUPPORT', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aauth_groups`
--
ALTER TABLE `aauth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aauth_group_to_group`
--
ALTER TABLE `aauth_group_to_group`
  ADD PRIMARY KEY (`group_id`,`subgroup_id`);

--
-- Indexes for table `aauth_login_attempts`
--
ALTER TABLE `aauth_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aauth_perms`
--
ALTER TABLE `aauth_perms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aauth_perm_to_user`
--
ALTER TABLE `aauth_perm_to_user`
  ADD PRIMARY KEY (`user_id`,`perm_id`);

--
-- Indexes for table `aauth_pms`
--
ALTER TABLE `aauth_pms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aauth_user`
--
ALTER TABLE `aauth_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aauth_users`
--
ALTER TABLE `aauth_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aauth_user_to_group`
--
ALTER TABLE `aauth_user_to_group`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `aauth_user_variables`
--
ALTER TABLE `aauth_user_variables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applicationtype`
--
ALTER TABLE `applicationtype`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`captcha_id`);

--
-- Indexes for table `cc_options`
--
ALTER TABLE `cc_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `crud`
--
ALTER TABLE `crud`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud_custom_option`
--
ALTER TABLE `crud_custom_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud_field`
--
ALTER TABLE `crud_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud_field_validation`
--
ALTER TABLE `crud_field_validation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud_input_type`
--
ALTER TABLE `crud_input_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crud_input_validation`
--
ALTER TABLE `crud_input_validation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_custom_attribute`
--
ALTER TABLE `form_custom_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_custom_option`
--
ALTER TABLE `form_custom_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_field`
--
ALTER TABLE `form_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_field_validation`
--
ALTER TABLE `form_field_validation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_type`
--
ALTER TABLE `menu_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_block_element`
--
ALTER TABLE `page_block_element`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rest`
--
ALTER TABLE `rest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rest_field`
--
ALTER TABLE `rest_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rest_field_validation`
--
ALTER TABLE `rest_field_validation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rest_input_type`
--
ALTER TABLE `rest_input_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systemupload`
--
ALTER TABLE `systemupload`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `templateupload`
--
ALTER TABLE `templateupload`
  ADD PRIMARY KEY (`RowID`);

--
-- Indexes for table `templateuploadmismer`
--
ALTER TABLE `templateuploadmismer`
  ADD PRIMARY KEY (`RowID`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aauth_groups`
--
ALTER TABLE `aauth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `aauth_login_attempts`
--
ALTER TABLE `aauth_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aauth_perms`
--
ALTER TABLE `aauth_perms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `aauth_pms`
--
ALTER TABLE `aauth_pms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aauth_user`
--
ALTER TABLE `aauth_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aauth_users`
--
ALTER TABLE `aauth_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aauth_user_variables`
--
ALTER TABLE `aauth_user_variables`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicationtype`
--
ALTER TABLE `applicationtype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `category_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `captcha_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cc_options`
--
ALTER TABLE `cc_options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `crud`
--
ALTER TABLE `crud`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `crud_custom_option`
--
ALTER TABLE `crud_custom_option`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crud_field`
--
ALTER TABLE `crud_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `crud_field_validation`
--
ALTER TABLE `crud_field_validation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `crud_input_type`
--
ALTER TABLE `crud_input_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `crud_input_validation`
--
ALTER TABLE `crud_input_validation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_custom_attribute`
--
ALTER TABLE `form_custom_attribute`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_custom_option`
--
ALTER TABLE `form_custom_option`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_field`
--
ALTER TABLE `form_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_field_validation`
--
ALTER TABLE `form_field_validation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_block_element`
--
ALTER TABLE `page_block_element`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rest`
--
ALTER TABLE `rest`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rest_field`
--
ALTER TABLE `rest_field`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rest_field_validation`
--
ALTER TABLE `rest_field_validation`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rest_input_type`
--
ALTER TABLE `rest_input_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `systemupload`
--
ALTER TABLE `systemupload`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `templateupload`
--
ALTER TABLE `templateupload`
  MODIFY `RowID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `templateuploadmismer`
--
ALTER TABLE `templateuploadmismer`
  MODIFY `RowID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
