-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26 Agu 2018 pada 20.21
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mismer`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `build_email_list`(INOUT `email_list` VARCHAR(4000))
BEGIN
 
 DECLARE v_finished INTEGER DEFAULT 0;
        DECLARE v_email varchar(100) DEFAULT "";
 
 
 DEClARE email_cursor CURSOR FOR 
 SELECT CITY FROM templateuploadmismer;
 
 
 DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
 
 OPEN email_cursor;
 
 get_email: LOOP
 
 FETCH email_cursor INTO v_email;
 
 IF v_finished = 1 THEN 
 LEAVE get_email;
 END IF;
 
 
 SET email_list = CONCAT(v_email,";",email_list);
 
 END LOOP get_email;
 
 CLOSE email_cursor;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`()
BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Delete_Mismerdetail_by_batchid`()
BEGIN

SET SQL_SAFE_UPDATES = 0;
  DELETE FROM MismerDetail WHERE BatchID=(SELECT max(BatchID) as BatchID FROM systemupload);  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Generate`()
BEGIN

INSERT INTO mismerdetail

SELECT 
NULL ID ,
a.RowID,
(SELECT max(BatchID) as BatchID FROM systemupload) BatchID,

date_format(
str_to_date(
CONCAT("20",SUBSTRING(a.OPEN_DATE ,5,2), "/", SUBSTRING(a.OPEN_DATE ,3,2), "/", SUBSTRING(a.OPEN_DATE ,1,2)), '%Y/%m/%d'), '%Y/%m/%d')
AS OPEN_DATE , 

a.MID,
a.MERCHAN_DBA_NAME,
a.MSO,
a.SOURCE_CODE,
a.POS1,

CASE
	WHEN LEFT(a.MSO,1)='A' THEN 'WMD'
	WHEN LEFT(a.MSO,1)='B' THEN 'WPD'
	WHEN LEFT(a.MSO,1)='C' THEN 'WPL'
	WHEN LEFT(a.MSO,1)='D' THEN 'WBN'
	WHEN LEFT(a.MSO,1)='E' THEN 'WSM'
	WHEN LEFT(a.MSO,1)='F' THEN 'WSY'
	WHEN LEFT(a.MSO,1)='G' THEN 'WMK'
	WHEN LEFT(a.MSO,1)='H' THEN 'WDR'
	WHEN LEFT(a.MSO,1)='I' THEN 'WBJ'
	WHEN LEFT(a.MSO,1)='J' THEN 'WMO'
	WHEN LEFT(a.MSO,1)='K' THEN 'WPU'
	WHEN LEFT(a.MSO,1)='L' THEN 'WJS'
	WHEN LEFT(a.MSO,1)='M' THEN 'WJK'
	WHEN LEFT(a.MSO,1)='N' THEN 'WJB'
	WHEN LEFT(a.MSO,1)='O' THEN 'WJY'
	WHEN LEFT(a.MSO,1)='R' THEN 'WYK'
	WHEN LEFT(a.MSO,1)='S' THEN 'WMA'	
 	WHEN LEFT(a.MSO,1)='' THEN 'BLANK'
  	ELSE 'ELSE'
END

as WILAYAH,

CASE
	WHEN RIGHT(a.MSO,2)='01' THEN '01.MBA'
	WHEN RIGHT(a.MSO,2)='02' THEN '02.MBR'
	WHEN RIGHT(a.MSO,2)='03' THEN '03.TDP'
	WHEN RIGHT(a.MSO,2)='04' THEN '04.TPU'
	WHEN RIGHT(a.MSO,2)='05' THEN '05.BDP'
	WHEN RIGHT(a.MSO,2)='06' THEN '06.PPP'
	WHEN RIGHT(a.MSO,2)='07' THEN '07.CABANG'
	WHEN RIGHT(a.MSO,2)='' THEN 'BLANK'
    ELSE  'ELSE'
END
 as CHANNEL,
 
  CASE
	WHEN LEFT(a.MSO,1)!='Q'  THEN 0
    ELSE 1
 END
 as IS_YAP, 
 
CASE
    WHEN CAST(a.POS1 AS UNSIGNED) < 100 THEN 1  
    ELSE  LEFT(CAST(a.POS1 AS UNSIGNED),1)
END

as EDC, 

CASE
	WHEN LEFT(a.MSO,1)='Q'  THEN 1
    ELSE 0
END
 as EXH,
 
 CASE
	WHEN SUBSTRING(a.MID,2,2)='01' THEN 'WMD'
	WHEN SUBSTRING(a.MID,2,2)='02' THEN 'WPD'
	WHEN SUBSTRING(a.MID,2,2)='03' THEN 'WPL'
	WHEN SUBSTRING(a.MID,2,2)='04' THEN 'WBN'
	WHEN SUBSTRING(a.MID,2,2)='05' THEN 'WSM'
	WHEN SUBSTRING(a.MID,2,2)='06' THEN 'WSY'
	WHEN SUBSTRING(a.MID,2,2)='07' THEN 'WMK'
	WHEN SUBSTRING(a.MID,2,2)='08' THEN 'WDR'
	WHEN SUBSTRING(a.MID,2,2)='09' THEN 'WBJ'
	WHEN SUBSTRING(a.MID,2,2)='10' THEN 'WJS'
	WHEN SUBSTRING(a.MID,2,2)='11' THEN 'WMO'
	WHEN SUBSTRING(a.MID,2,2)='12' THEN 'WJK'
	WHEN SUBSTRING(a.MID,2,2)='14' THEN 'WJB'
	WHEN SUBSTRING(a.MID,2,2)='15' THEN 'WJY'
	WHEN SUBSTRING(a.MID,2,2)='16' THEN 'WPU'
	WHEN SUBSTRING(a.MID,2,2)='17' THEN 'WYK'
	WHEN SUBSTRING(a.MID,2,2)='18' THEN 'WMA'
    ELSE 'ELSE'
 END
 as WILAYAH_2 

FROM templateuploadmismer a 

;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_mapping_mid`()
BEGIN


INSERT INTO mid_mapping

SELECT 
NULL ID ,
/*
a.RowID,
(SELECT max(BatchID) as BatchID FROM systemupload) BatchID,

date_format(
str_to_date(
CONCAT("20",SUBSTRING(a.OPEN_DATE ,5,2), "/", SUBSTRING(a.OPEN_DATE ,3,2), "/", SUBSTRING(a.OPEN_DATE ,1,2)), '%Y/%m/%d'), '%Y/%m/%d')
AS OPEN_DATE , 
*/
a.MID,
a.MERCHAN_DBA_NAME,
0 EXH
FROM templateuploadmismer a 

;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `P_upload`()
BEGIN






TRUNCATE `mismer`.`templateuploadmismer`;

 
 
 
 
 
 
 
 






END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_groups`
--

CREATE TABLE IF NOT EXISTS `aauth_groups` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `aauth_groups`
--

INSERT INTO `aauth_groups` (`id`, `name`, `definition`) VALUES
(1, 'Admin', 'Superadmin Group'),
(2, 'Public', 'Public Group'),
(3, 'Default', 'Default Access Group'),
(4, 'Member', 'Member Access Group');

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_group_to_group`
--

CREATE TABLE IF NOT EXISTS `aauth_group_to_group` (
  `group_id` int(11) unsigned NOT NULL,
  `subgroup_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_login_attempts`
--

CREATE TABLE IF NOT EXISTS `aauth_login_attempts` (
`id` int(11) unsigned NOT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `login_attempts` tinyint(2) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_perms`
--

CREATE TABLE IF NOT EXISTS `aauth_perms` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `aauth_perms`
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
(112, 'systemupload_list', ''),
(113, 'mismerdetail_add', ''),
(114, 'mismerdetail_update', ''),
(115, 'mismerdetail_view', ''),
(116, 'mismerdetail_delete', ''),
(117, 'mismerdetail_list', ''),
(118, 'mid_mapping_add', ''),
(119, 'mid_mapping_update', ''),
(120, 'mid_mapping_view', ''),
(121, 'mid_mapping_delete', ''),
(122, 'mid_mapping_list', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_perm_to_group`
--

CREATE TABLE IF NOT EXISTS `aauth_perm_to_group` (
  `perm_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_perm_to_user`
--

CREATE TABLE IF NOT EXISTS `aauth_perm_to_user` (
  `perm_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_pms`
--

CREATE TABLE IF NOT EXISTS `aauth_pms` (
`id` int(11) unsigned NOT NULL,
  `sender_id` int(11) unsigned NOT NULL,
  `receiver_id` int(11) unsigned NOT NULL,
  `title` varchar(225) NOT NULL,
  `message` text,
  `date_sent` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `pm_deleted_sender` int(1) DEFAULT NULL,
  `pm_deleted_receiver` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_user`
--

CREATE TABLE IF NOT EXISTS `aauth_user` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_users`
--

CREATE TABLE IF NOT EXISTS `aauth_users` (
`id` int(11) unsigned NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `aauth_users`
--

INSERT INTO `aauth_users` (`id`, `email`, `oauth_uid`, `oauth_provider`, `pass`, `username`, `full_name`, `avatar`, `banned`, `last_login`, `last_activity`, `date_created`, `forgot_exp`, `remember_time`, `remember_exp`, `verification_code`, `top_secret`, `ip_address`) VALUES
(1, 'admin001@bni.co.id', NULL, NULL, 'cf07ba6fe22ad82c8460f195a6e4cd4d175b3381e8c6f192b12aada8a03b07c4', 'admin001', 'admin001', '', 0, '2018-08-25 10:22:14', '2018-08-25 10:22:14', '2018-08-09 04:12:51', NULL, NULL, NULL, NULL, NULL, '::1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_user_to_group`
--

CREATE TABLE IF NOT EXISTS `aauth_user_to_group` (
  `user_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `aauth_user_to_group`
--

INSERT INTO `aauth_user_to_group` (`user_id`, `group_id`) VALUES
(1, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `aauth_user_variables`
--

CREATE TABLE IF NOT EXISTS `aauth_user_variables` (
`id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `data_key` varchar(100) NOT NULL,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `applicationtype`
--

CREATE TABLE IF NOT EXISTS `applicationtype` (
`ID` int(11) NOT NULL,
  `ApplicationName` varchar(255) NOT NULL,
  `ApplicationSource` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `applicationtype`
--

INSERT INTO `applicationtype` (`ID`, `ApplicationName`, `ApplicationSource`) VALUES
(1, 'Data CIF', 'CardLink'),
(2, 'CCOS', 'Data Incoming'),
(3, 'Data EDC', 'MISMER');

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
`id` int(11) unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image` text NOT NULL,
  `category` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `blog`
--

INSERT INTO `blog` (`id`, `title`, `content`, `image`, `category`, `created_at`) VALUES
(1, 'AAAA', 'TESSSSSSSS', '20180810094007-2018-08-10blog093929.csv', 'XXX', '2018-08-09 13:00:00'),
(2, 'csv', 'sssssssss', '20180826160641-2018-08-26blog160607.csv', 'sss', '2018-08-04 17:00:00'),
(3, 'aaaaaaaa', 'zzzzzzzzzzzzz', '20180826214403-2018-08-26blog214350.csv', 'MISMER', '2018-08-26 21:44:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `blog_category`
--

CREATE TABLE IF NOT EXISTS `blog_category` (
`category_id` int(11) unsigned NOT NULL,
  `category_name` varchar(200) NOT NULL,
  `category_desc` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `blog_category`
--

INSERT INTO `blog_category` (`category_id`, `category_name`, `category_desc`) VALUES
(1, 'Technology', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `captcha`
--

CREATE TABLE IF NOT EXISTS `captcha` (
`captcha_id` int(11) unsigned NOT NULL,
  `captcha_time` int(10) DEFAULT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cc_options`
--

CREATE TABLE IF NOT EXISTS `cc_options` (
`id` int(11) unsigned NOT NULL,
  `option_name` varchar(200) NOT NULL,
  `option_value` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `cc_options`
--

INSERT INTO `cc_options` (`id`, `option_name`, `option_value`) VALUES
(1, 'active_theme', 'cicool'),
(2, 'favicon', 'default.png'),
(3, 'site_name', 'MISMER Dashboard');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cc_session`
--

CREATE TABLE IF NOT EXISTS `cc_session` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) NOT NULL,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `channel`
--

CREATE TABLE IF NOT EXISTS `channel` (
`ID` int(11) NOT NULL,
  `ChannelID` varchar(5) NOT NULL,
  `ChannelCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `channel`
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
-- Struktur dari tabel `crud`
--

CREATE TABLE IF NOT EXISTS `crud` (
`id` int(11) unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `primary_key` varchar(200) NOT NULL,
  `page_read` varchar(20) DEFAULT NULL,
  `page_create` varchar(20) DEFAULT NULL,
  `page_update` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `crud`
--

INSERT INTO `crud` (`id`, `title`, `subject`, `table_name`, `primary_key`, `page_read`, `page_create`, `page_update`) VALUES
(1, 'Templateupload', 'Templateupload', 'templateupload', 'RowID', 'yes', 'yes', 'yes'),
(2, 'Channel', 'Channel', 'channel', 'ID', 'yes', 'yes', 'yes'),
(3, 'Wilayah', 'Wilayah', 'wilayah', 'ID', 'yes', 'yes', 'yes'),
(4, 'Templateuploadmismer', 'Templateuploadmismer', 'templateuploadmismer', 'RowID', 'yes', 'yes', 'yes'),
(5, 'Blog', 'Blog', 'blog', 'id', 'yes', 'yes', 'yes'),
(6, 'Applicationtype', 'Applicationtype', 'applicationtype', 'ID', 'yes', 'yes', 'yes'),
(7, 'Systemupload', 'Systemupload', 'systemupload', 'ID', 'yes', 'yes', 'yes'),
(8, 'Mismerdetail', 'Mismerdetail', 'mismerdetail', 'ID', 'yes', 'yes', 'yes'),
(9, 'Mid Mapping', 'Mid Mapping', 'mid_mapping', 'ID', 'yes', 'yes', 'yes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `crud_custom_option`
--

CREATE TABLE IF NOT EXISTS `crud_custom_option` (
`id` int(11) unsigned NOT NULL,
  `crud_field_id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `crud_field`
--

CREATE TABLE IF NOT EXISTS `crud_field` (
`id` int(11) unsigned NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `crud_field`
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
(107, 7, 'ApprovalID', 'ApprovalID', 'number', 'yes', 'yes', 'yes', 'yes', 16, '', '', ''),
(140, 8, 'ID', 'ID', 'number', '', '', '', 'yes', 1, '', '', ''),
(141, 8, 'RowID', 'RowID', 'number', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(142, 8, 'BatchID', 'BatchID', 'number', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(143, 8, 'OPEN_DATE', 'OPEN_DATE', 'date', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(144, 8, 'MID', 'MID', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(145, 8, 'MERCHAN_DBA_NAME', 'MERCHAN_DBA_NAME', 'input', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(146, 8, 'MSO', 'MSO', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(147, 8, 'SOURCE_CODE', 'SOURCE_CODE', 'input', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(148, 8, 'POS1', 'POS1', 'input', 'yes', 'yes', 'yes', 'yes', 9, '', '', ''),
(149, 8, 'WILAYAH', 'WILAYAH', 'input', 'yes', 'yes', 'yes', 'yes', 10, '', '', ''),
(150, 8, 'WILAYAH_2', 'WILAYAH_2', 'input', 'yes', 'yes', 'yes', 'yes', 11, '', '', ''),
(151, 8, 'CHANNEL', 'CHANNEL', 'input', 'yes', 'yes', 'yes', 'yes', 12, '', '', ''),
(152, 8, 'IS_YAP', 'IS_YAP', 'input', 'yes', 'yes', 'yes', 'yes', 13, '', '', ''),
(153, 8, 'EDC', 'EDC', 'number', 'yes', 'yes', 'yes', 'yes', 14, '', '', ''),
(154, 8, 'EXH', 'EXH', 'number', 'yes', 'yes', 'yes', 'yes', 15, '', '', ''),
(155, 9, 'ID', 'ID', 'number', '', '', '', 'yes', 1, '', '', ''),
(156, 9, 'MID', 'MID', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(157, 9, 'MERCHAN_DBA_NAME', 'MERCHAN_DBA_NAME', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(158, 9, 'EXH', 'EXH', 'number', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(165, 5, 'id', 'id', 'number', '', '', '', 'yes', 1, '', '', ''),
(166, 5, 'title', 'title', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(167, 5, 'content', 'content', 'editor_wysiwyg', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(168, 5, 'image', 'image', 'file', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(169, 5, 'category', 'category', 'select', 'yes', 'yes', 'yes', 'yes', 5, 'applicationtype', 'ApplicationSource', 'ApplicationSource'),
(170, 5, 'created_at', 'created_at', 'timestamp', 'yes', 'yes', 'yes', 'yes', 6, '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `crud_field_validation`
--

CREATE TABLE IF NOT EXISTS `crud_field_validation` (
`id` int(11) unsigned NOT NULL,
  `crud_field_id` int(11) NOT NULL,
  `crud_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `crud_field_validation`
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
(173, 107, 7, 'max_length', '11'),
(228, 141, 8, 'required', ''),
(229, 141, 8, 'max_length', '11'),
(230, 142, 8, 'required', ''),
(231, 142, 8, 'max_length', '11'),
(232, 143, 8, 'required', ''),
(233, 144, 8, 'required', ''),
(234, 144, 8, 'max_length', '255'),
(235, 145, 8, 'required', ''),
(236, 145, 8, 'max_length', '255'),
(237, 146, 8, 'required', ''),
(238, 146, 8, 'max_length', '255'),
(239, 147, 8, 'required', ''),
(240, 147, 8, 'max_length', '255'),
(241, 148, 8, 'required', ''),
(242, 148, 8, 'max_length', '255'),
(243, 149, 8, 'required', ''),
(244, 149, 8, 'max_length', '255'),
(245, 151, 8, 'required', ''),
(246, 151, 8, 'max_length', '255'),
(247, 153, 8, 'required', ''),
(248, 153, 8, 'max_length', '11'),
(249, 154, 8, 'required', ''),
(250, 154, 8, 'max_length', '11'),
(251, 156, 9, 'required', ''),
(252, 156, 9, 'max_length', '255'),
(253, 157, 9, 'required', ''),
(254, 157, 9, 'max_length', '255'),
(255, 158, 9, 'required', ''),
(256, 158, 9, 'max_length', '11'),
(263, 166, 5, 'required', ''),
(264, 166, 5, 'max_length', '200'),
(265, 167, 5, 'required', ''),
(266, 168, 5, 'required', ''),
(267, 169, 5, 'required', ''),
(268, 169, 5, 'max_length', '200');

-- --------------------------------------------------------

--
-- Struktur dari tabel `crud_input_type`
--

CREATE TABLE IF NOT EXISTS `crud_input_type` (
`id` int(11) unsigned NOT NULL,
  `type` varchar(200) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `custom_value` int(11) NOT NULL,
  `validation_group` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `crud_input_type`
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
-- Struktur dari tabel `crud_input_validation`
--

CREATE TABLE IF NOT EXISTS `crud_input_validation` (
`id` int(11) unsigned NOT NULL,
  `validation` varchar(200) NOT NULL,
  `input_able` varchar(20) NOT NULL,
  `group_input` text NOT NULL,
  `input_placeholder` text NOT NULL,
  `call_back` varchar(10) NOT NULL,
  `input_validation` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `crud_input_validation`
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
-- Struktur dari tabel `form`
--

CREATE TABLE IF NOT EXISTS `form` (
`id` int(11) unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_custom_attribute`
--

CREATE TABLE IF NOT EXISTS `form_custom_attribute` (
`id` int(11) unsigned NOT NULL,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `attribute_value` text NOT NULL,
  `attribute_label` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_custom_option`
--

CREATE TABLE IF NOT EXISTS `form_custom_option` (
`id` int(11) unsigned NOT NULL,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_field`
--

CREATE TABLE IF NOT EXISTS `form_field` (
`id` int(11) unsigned NOT NULL,
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
-- Struktur dari tabel `form_field_validation`
--

CREATE TABLE IF NOT EXISTS `form_field_validation` (
`id` int(11) unsigned NOT NULL,
  `form_field_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE IF NOT EXISTS `keys` (
`id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL,
  `is_private_key` tinyint(1) NOT NULL,
  `ip_addresses` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'D1AD05E978F746BA59192B128231D357', 0, 0, 0, NULL, '2018-08-08 21:12:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
`id` int(11) unsigned NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `icon_color` varchar(200) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `parent` int(11) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `menu_type_id` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu`
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
-- Struktur dari tabel `menu_type`
--

CREATE TABLE IF NOT EXISTS `menu_type` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `definition` text
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_type`
--

INSERT INTO `menu_type` (`id`, `name`, `definition`) VALUES
(1, 'side menu', NULL),
(2, 'top menu', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mid_mapping`
--

CREATE TABLE IF NOT EXISTS `mid_mapping` (
`ID` int(11) NOT NULL,
  `MID` varchar(255) DEFAULT NULL,
  `MERCHAN_DBA_NAME` varchar(255) DEFAULT NULL,
  `EXH` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mismerdetail`
--

CREATE TABLE IF NOT EXISTS `mismerdetail` (
`ID` int(11) NOT NULL,
  `RowID` int(11) NOT NULL,
  `BatchID` int(11) NOT NULL,
  `OPEN_DATE` date DEFAULT NULL,
  `MID` varchar(55) DEFAULT NULL,
  `MERCHAN_DBA_NAME` varchar(55) DEFAULT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `SOURCE_CODE` varchar(55) DEFAULT NULL,
  `POS1` varchar(55) DEFAULT NULL,
  `WILAYAH` varchar(55) DEFAULT NULL,
  `CHANNEL` varchar(55) DEFAULT NULL,
  `IS_YAP` int(11) NOT NULL,
  `EDC` int(11) DEFAULT NULL,
  `EXH` int(11) DEFAULT NULL,
  `WILAYAH_2` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `page`
--

CREATE TABLE IF NOT EXISTS `page` (
`id` int(11) unsigned NOT NULL,
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
-- Struktur dari tabel `page_block_element`
--

CREATE TABLE IF NOT EXISTS `page_block_element` (
`id` int(11) unsigned NOT NULL,
  `group_name` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image_preview` varchar(200) NOT NULL,
  `block_name` varchar(200) NOT NULL,
  `content_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rest`
--

CREATE TABLE IF NOT EXISTS `rest` (
`id` int(11) unsigned NOT NULL,
  `subject` varchar(200) NOT NULL,
  `table_name` varchar(200) NOT NULL,
  `primary_key` varchar(200) NOT NULL,
  `x_api_key` varchar(20) DEFAULT NULL,
  `x_token` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rest_field`
--

CREATE TABLE IF NOT EXISTS `rest_field` (
`id` int(11) unsigned NOT NULL,
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
-- Struktur dari tabel `rest_field_validation`
--

CREATE TABLE IF NOT EXISTS `rest_field_validation` (
`id` int(11) unsigned NOT NULL,
  `rest_field_id` int(11) NOT NULL,
  `rest_id` int(11) NOT NULL,
  `validation_name` varchar(200) NOT NULL,
  `validation_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rest_input_type`
--

CREATE TABLE IF NOT EXISTS `rest_input_type` (
`id` int(11) unsigned NOT NULL,
  `type` varchar(200) NOT NULL,
  `relation` varchar(20) NOT NULL,
  `validation_group` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `rest_input_type`
--

INSERT INTO `rest_input_type` (`id`, `type`, `relation`, `validation_group`) VALUES
(1, 'input', '0', 'input'),
(2, 'timestamp', '0', 'timestamp'),
(3, 'file', '0', 'file');

-- --------------------------------------------------------

--
-- Struktur dari tabel `systemupload`
--

CREATE TABLE IF NOT EXISTS `systemupload` (
`ID` int(11) NOT NULL,
  `BatchID` int(11) NOT NULL,
  `UploadDate` datetime DEFAULT NULL,
  `UploadBy` int(11) DEFAULT NULL,
  `UploadRemark` varchar(255) DEFAULT NULL,
  `ApplicationSource` varchar(255) DEFAULT NULL,
  `ProcessYear` int(11) DEFAULT NULL,
  `ProcessMonth` int(11) DEFAULT NULL,
  `ProcessDate` int(11) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `VirtualPath` varchar(255) DEFAULT NULL,
  `FileSize` varchar(255) DEFAULT NULL,
  `ReportPath` varchar(255) DEFAULT NULL,
  `RowDataCount` int(11) DEFAULT NULL,
  `RowDataSucceed` int(11) DEFAULT NULL,
  `RowDataFailed` int(11) DEFAULT NULL,
  `ApprovalID` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `systemupload`
--

INSERT INTO `systemupload` (`ID`, `BatchID`, `UploadDate`, `UploadBy`, `UploadRemark`, `ApplicationSource`, `ProcessYear`, `ProcessMonth`, `ProcessDate`, `FilePath`, `VirtualPath`, `FileSize`, `ReportPath`, `RowDataCount`, `RowDataSucceed`, `RowDataFailed`, `ApprovalID`) VALUES
(1, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, '2018-08-27 01:05:14', 999, NULL, 'MISMER', NULL, NULL, NULL, 'MISMER_2018-08-20.csv', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 3, '2018-08-27 01:07:06', 999, 'aaaaaaaaa', 'MISMER', NULL, NULL, NULL, 'MISMER_2018-08-13.csv', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `templateupload`
--

CREATE TABLE IF NOT EXISTS `templateupload` (
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `templateupload`
--

INSERT INTO `templateupload` (`RowID`, `BatchID`, `MID`, `MERCHAN_DBA_NAME`, `STATUS_EDC`, `OPEN_DATE`, `CITY`, `MSO`, `SOURCE_CODE`, `POS1`) VALUES
(1, 123, '0123456789', 'ABCD', 1, '20181231', 'AAAAA', '999', 'XXXXXXXXXX', 999),
(2, 123, '1231564646', 'XZYYYYYYYYYYYYY', 99, '20181231', 'XXXXXX', '3123', '031', 2123),
(3, 123, '123456789', 'ABCD', 1, '20181231', 'AAAAA', '999', 'XXXXXXXXXX', 999),
(4, 123, '1231564646', 'XZYYYYYYYYYYYYY', 99, '20181231', 'XXXXXX', '3123', '31', 2123);

-- --------------------------------------------------------

--
-- Struktur dari tabel `templateuploadmismer`
--

CREATE TABLE IF NOT EXISTS `templateuploadmismer` (
  `RowID` int(11) DEFAULT NULL,
  `MID` varchar(55) NOT NULL,
  `MERCHAN_DBA_NAME` varchar(55) DEFAULT NULL,
  `STATUS_EDC` varchar(55) DEFAULT NULL,
  `OPEN_DATE` varchar(55) DEFAULT NULL,
  `CITY` varchar(55) DEFAULT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `SOURCE_CODE` varchar(255) DEFAULT NULL,
  `POS1` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wilayah`
--

CREATE TABLE IF NOT EXISTS `wilayah` (
`ID` int(11) NOT NULL,
  `WilayahID` varchar(255) NOT NULL,
  `WilayahCode` varchar(255) DEFAULT NULL,
  `WilayahName` varchar(255) DEFAULT NULL,
  `KodeWilayah` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `wilayah`
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
-- Indexes for table `mid_mapping`
--
ALTER TABLE `mid_mapping`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mismerdetail`
--
ALTER TABLE `mismerdetail`
 ADD PRIMARY KEY (`ID`);

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
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `aauth_login_attempts`
--
ALTER TABLE `aauth_login_attempts`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aauth_perms`
--
ALTER TABLE `aauth_perms`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `aauth_pms`
--
ALTER TABLE `aauth_pms`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aauth_user`
--
ALTER TABLE `aauth_user`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aauth_users`
--
ALTER TABLE `aauth_users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `aauth_user_variables`
--
ALTER TABLE `aauth_user_variables`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `applicationtype`
--
ALTER TABLE `applicationtype`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
MODIFY `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
MODIFY `captcha_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cc_options`
--
ALTER TABLE `cc_options`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `crud`
--
ALTER TABLE `crud`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `crud_custom_option`
--
ALTER TABLE `crud_custom_option`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `crud_field`
--
ALTER TABLE `crud_field`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `crud_field_validation`
--
ALTER TABLE `crud_field_validation`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=269;
--
-- AUTO_INCREMENT for table `crud_input_type`
--
ALTER TABLE `crud_input_type`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `crud_input_validation`
--
ALTER TABLE `crud_input_validation`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form_custom_attribute`
--
ALTER TABLE `form_custom_attribute`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form_custom_option`
--
ALTER TABLE `form_custom_option`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form_field`
--
ALTER TABLE `form_field`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `form_field_validation`
--
ALTER TABLE `form_field_validation`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `menu_type`
--
ALTER TABLE `menu_type`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mid_mapping`
--
ALTER TABLE `mid_mapping`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mismerdetail`
--
ALTER TABLE `mismerdetail`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `page_block_element`
--
ALTER TABLE `page_block_element`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rest`
--
ALTER TABLE `rest`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rest_field`
--
ALTER TABLE `rest_field`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rest_field_validation`
--
ALTER TABLE `rest_field_validation`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rest_input_type`
--
ALTER TABLE `rest_input_type`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `systemupload`
--
ALTER TABLE `systemupload`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `templateupload`
--
ALTER TABLE `templateupload`
MODIFY `RowID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
