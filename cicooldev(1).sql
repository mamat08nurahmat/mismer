-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17 Sep 2018 pada 03.28
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cicooldev`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_gen_limit`()
BEGIN

			INSERT INTO mismerdetail

			SELECT 
			NULL RowID,
			-- a.RowID,
			 (SELECT max(BatchID) as BatchID FROM systemupload) BatchID,
-- 			999 BatchID,
			
			--  date_format(str_to_date(a.OPEN_DATE,'%m/%d/%Y'),'%Y/%m/%d')
			-- AS OPEN_DATE , 
			
			a.OPEN_DATE,
			
			
			a.MID,
			a.MERCHAN_DBA_NAME,
			a.MSO,
			a.SOURCE_CODE,
			
			CASE
				WHEN a.POS1 <= 100 THEN 1
				ELSE LEFT(a.POS1,1)
			END
			AS
			POS1,
			
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
				
			-- 	WHEN LEFT(a.MSO,1)='' THEN 'BLANK'
				  ELSE NULL
			END
			
			as WILAYAH,
			
			
			mc.Channel as CHANNEL,
			 
			
			 
			 
			 CASE
			
				WHEN LEFT(a.MID,1)='3'  THEN 'YAP'
			
				  ELSE 'EDC'
			END
			
			as TYPE_MID
			
			 
			
			FROM templateuploadmismer a 
			
			LEFT JOIN mso_channel mc ON a.MSO=mc.MSO
            
             ORDER BY a.MID ASC 
            LIMIT 100
;
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

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
(83, 'blog_category_add', ''),
(84, 'blog_category_update', ''),
(85, 'blog_category_view', ''),
(86, 'blog_category_delete', ''),
(87, 'blog_category_list', ''),
(88, 'api_blog_category_all', ''),
(89, 'api_blog_category_detail', ''),
(90, 'api_blog_category_add', ''),
(91, 'api_blog_category_update', ''),
(92, 'api_blog_category_delete', ''),
(93, 'api_blog_all', ''),
(94, 'api_blog_detail', ''),
(95, 'api_blog_add', ''),
(96, 'api_blog_update', ''),
(97, 'api_blog_delete', ''),
(98, 'mso_channel_add', ''),
(99, 'mso_channel_update', ''),
(100, 'mso_channel_view', ''),
(101, 'mso_channel_delete', ''),
(102, 'mso_channel_list', ''),
(103, 'templateuploadmismer_add', ''),
(104, 'templateuploadmismer_update', ''),
(105, 'templateuploadmismer_view', ''),
(106, 'templateuploadmismer_delete', ''),
(107, 'templateuploadmismer_list', ''),
(108, 'mismerdetail_add', ''),
(109, 'mismerdetail_update', ''),
(110, 'mismerdetail_view', ''),
(111, 'mismerdetail_delete', ''),
(112, 'mismerdetail_list', ''),
(113, 'mismerunmatch_add', ''),
(114, 'mismerunmatch_update', ''),
(115, 'mismerunmatch_view', ''),
(116, 'mismerunmatch_delete', ''),
(117, 'mismerunmatch_list', ''),
(123, 'templateuploadunmatch_add', ''),
(124, 'templateuploadunmatch_update', ''),
(125, 'templateuploadunmatch_view', ''),
(126, 'templateuploadunmatch_delete', ''),
(127, 'templateuploadunmatch_list', ''),
(128, 'systemupload_add', ''),
(129, 'systemupload_update', ''),
(130, 'systemupload_view', ''),
(131, 'systemupload_delete', ''),
(132, 'systemupload_list', '');

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
(1, 'admin@admin.com', NULL, NULL, '8b235284a9f7a82364468e52dab386f33844421b481113794e0b4d634c86d0f3', 'admin', 'admin', '', 0, '2018-09-15 01:56:05', '2018-09-15 01:56:05', '2018-09-14 20:55:52', NULL, NULL, NULL, NULL, NULL, '::1');

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
-- Struktur dari tabel `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
`id` int(11) unsigned NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `image` text NOT NULL,
  `category` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, 'site_name', 'CICOOL DEV');

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
(1, 'Blog Category', 'Blog Category', 'blog_category', 'category_id', 'yes', 'yes', 'yes'),
(2, 'Blog', 'Blog', 'blog', 'id', 'yes', 'yes', 'yes'),
(3, 'Mso Channel', 'Mso Channel', 'mso_channel', 'ID', 'yes', 'yes', 'yes'),
(4, 'Templateuploadmismer', 'Templateuploadmismer', 'templateuploadmismer', 'ID', 'yes', 'yes', 'yes'),
(5, 'Mismerdetail', 'Mismerdetail', 'mismerdetail', 'RowID', 'yes', 'yes', 'yes'),
(6, 'Mismerunmatch', 'Mismerunmatch', 'mismerunmatch', 'RowID', 'yes', 'yes', 'yes'),
(8, 'Templateuploadunmatch', 'Templateuploadunmatch', 'templateuploadunmatch', 'RowID', 'yes', 'yes', 'yes'),
(9, 'Systemupload', 'Systemupload', 'systemupload', 'BatchID', 'yes', 'yes', 'yes');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `crud_custom_option`
--

INSERT INTO `crud_custom_option` (`id`, `crud_field_id`, `crud_id`, `option_value`, `option_label`) VALUES
(11, 87, 9, 'MISMER', 'MISMER'),
(12, 87, 9, 'UMNATCH', 'UNMATCH'),
(13, 88, 9, '2018', '2018'),
(14, 88, 9, '2017', '2017'),
(15, 89, 9, '1', 'Januari'),
(16, 89, 9, '2', 'Februari'),
(17, 89, 9, '3', 'Maret'),
(18, 90, 9, '1', '1'),
(19, 90, 9, '2', '2'),
(20, 90, 9, '3', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `crud_field`
--

INSERT INTO `crud_field` (`id`, `crud_id`, `field_name`, `field_label`, `input_type`, `show_column`, `show_add_form`, `show_update_form`, `show_detail_page`, `sort`, `relation_table`, `relation_value`, `relation_label`) VALUES
(1, 1, 'category_id', 'category_id', 'number', '', '', '', 'yes', 1, '', '', ''),
(2, 1, 'category_name', 'category_name', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(3, 1, 'category_desc', 'category_desc', 'editor_wysiwyg', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(4, 2, 'id', 'id', 'number', '', '', '', 'yes', 1, '', '', ''),
(5, 2, 'title', 'title', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(6, 2, 'content', 'content', 'editor_wysiwyg', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(7, 2, 'image', 'image', 'file', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(8, 2, 'category', 'category', 'select', 'yes', 'yes', 'yes', 'yes', 5, 'blog_category', 'category_id', 'category_name'),
(9, 2, 'created_at', 'created_at', 'timestamp', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(10, 3, 'ID', 'ID', 'number', '', '', '', 'yes', 1, '', '', ''),
(11, 3, 'Wilayah', 'Wilayah', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(12, 3, 'KodeWilayah', 'KodeWilayah', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(13, 3, 'MSO', 'MSO', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(14, 3, 'Channel', 'Channel', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(15, 4, 'MID', 'MID', 'number', 'yes', 'yes', 'yes', 'yes', 1, '', '', ''),
(16, 4, 'MERCHAN_DBA_NAME', 'MERCHAN_DBA_NAME', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(17, 4, 'STATUS_EDC', 'STATUS_EDC', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(18, 4, 'OPEN_DATE', 'OPEN_DATE', 'date', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(19, 4, 'MSO', 'MSO', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(20, 4, 'SOURCE_CODE', 'SOURCE_CODE', 'input', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(21, 4, 'POS1', 'POS1', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(22, 4, 'IS_VALID', 'IS_VALID', 'number', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(23, 4, 'ID', 'ID', 'number', '', '', '', 'yes', 9, '', '', ''),
(24, 5, 'RowID', 'RowID', 'number', '', '', '', 'yes', 1, '', '', ''),
(25, 5, 'BatchID', 'BatchID', 'number', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(26, 5, 'OPEN_DATE', 'OPEN_DATE', 'date', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(27, 5, 'MID', 'MID', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(28, 5, 'MERCHAN_DBA_NAME', 'MERCHAN_DBA_NAME', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(29, 5, 'MSO', 'MSO', 'input', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(30, 5, 'SOURCE_CODE', 'SOURCE_CODE', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(31, 5, 'POS1', 'POS1', 'input', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(32, 5, 'WILAYAH', 'WILAYAH', 'input', 'yes', 'yes', 'yes', 'yes', 9, '', '', ''),
(33, 5, 'CHANNEL', 'CHANNEL', 'input', 'yes', 'yes', 'yes', 'yes', 10, '', '', ''),
(34, 5, 'TYPE_MID', 'TYPE_MID', 'input', 'yes', 'yes', 'yes', 'yes', 11, '', '', ''),
(35, 6, 'RowID', 'RowID', 'number', '', '', '', 'yes', 1, '', '', ''),
(36, 6, 'BatchID', 'BatchID', 'number', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(37, 6, 'OPEN_DATE', 'OPEN_DATE', 'date', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(38, 6, 'MID', 'MID', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(39, 6, 'MERCHAN_DBA_NAME', 'MERCHAN_DBA_NAME', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(40, 6, 'MSO', 'MSO', 'input', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(41, 6, 'SOURCE_CODE', 'SOURCE_CODE', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(42, 6, 'POS1', 'POS1', 'input', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(43, 6, 'WILAYAH', 'WILAYAH', 'input', 'yes', 'yes', 'yes', 'yes', 9, '', '', ''),
(44, 6, 'CHANNEL', 'CHANNEL', 'input', 'yes', 'yes', 'yes', 'yes', 10, '', '', ''),
(45, 6, 'TYPE_MID', 'TYPE_MID', 'input', 'yes', 'yes', 'yes', 'yes', 11, '', '', ''),
(46, 6, 'IS_UPDATE', 'IS_UPDATE', 'number', 'yes', 'yes', 'yes', 'yes', 12, '', '', ''),
(47, 7, 'MID', 'MID', 'number', 'yes', 'yes', 'yes', 'yes', 1, '', '', ''),
(48, 7, 'MERCHAN_DBA_NAME', 'MERCHAN_DBA_NAME', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(49, 7, 'STATUS_EDC', 'STATUS_EDC', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(50, 7, 'OPEN_DATE', 'OPEN_DATE', 'date', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(51, 7, 'MSO', 'MSO', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(52, 7, 'SOURCE_CODE', 'SOURCE_CODE', 'input', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(53, 7, 'POS1', 'POS1', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(54, 7, 'IS_VALID', 'IS_VALID', 'number', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(55, 7, 'ID', 'ID', 'number', '', '', '', 'yes', 9, '', '', ''),
(56, 8, 'OPEN_DATE', 'OPEN_DATE', 'date', 'yes', 'yes', 'yes', 'yes', 1, '', '', ''),
(57, 8, 'MID', 'MID', 'input', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(58, 8, 'MERCHAN_DBA_NAME', 'MERCHAN_DBA_NAME', 'input', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(59, 8, 'MSO', 'MSO', 'input', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(60, 8, 'SOURCE_CODE', 'SOURCE_CODE', 'input', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(61, 8, 'POS1', 'POS1', 'input', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(62, 8, 'WILAYAH', 'WILAYAH', 'input', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(63, 8, 'CHANNEL', 'CHANNEL', 'input', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(64, 8, 'TYPE_MID', 'TYPE_MID', 'input', 'yes', 'yes', 'yes', 'yes', 9, '', '', ''),
(65, 8, 'RowID', 'RowID', 'number', '', '', '', 'yes', 10, '', '', ''),
(83, 9, 'BatchID', 'BatchID', 'number', '', '', '', 'yes', 1, '', '', ''),
(84, 9, 'UploadDate', 'UploadDate', 'timestamp', 'yes', 'yes', 'yes', 'yes', 2, '', '', ''),
(85, 9, 'UploadBy', 'UploadBy', 'number', 'yes', 'yes', 'yes', 'yes', 3, '', '', ''),
(86, 9, 'UploadRemark', 'UploadRemark', 'textarea', 'yes', 'yes', 'yes', 'yes', 4, '', '', ''),
(87, 9, 'ApplicationSource', 'ApplicationSource', 'custom_select', 'yes', 'yes', 'yes', 'yes', 5, '', '', ''),
(88, 9, 'ProcessYear', 'ProcessYear', 'custom_select', 'yes', 'yes', 'yes', 'yes', 6, '', '', ''),
(89, 9, 'ProcessMonth', 'ProcessMonth', 'custom_select', 'yes', 'yes', 'yes', 'yes', 7, '', '', ''),
(90, 9, 'ProcessDate', 'ProcessDate', 'custom_select', 'yes', 'yes', 'yes', 'yes', 8, '', '', ''),
(91, 9, 'FilePath', 'FilePath', 'file', 'yes', 'yes', 'yes', 'yes', 9, '', '', ''),
(92, 9, 'VirtualPath', 'VirtualPath', 'input', 'yes', 'yes', 'yes', 'yes', 10, '', '', ''),
(93, 9, 'FileSize', 'FileSize', 'input', 'yes', 'yes', 'yes', 'yes', 11, '', '', ''),
(94, 9, 'ReportPath', 'ReportPath', 'input', 'yes', 'yes', 'yes', 'yes', 12, '', '', ''),
(95, 9, 'RowDataCount', 'RowDataCount', 'number', 'yes', 'yes', 'yes', 'yes', 13, '', '', ''),
(96, 9, 'RowDataSucceed', 'RowDataSucceed', 'number', 'yes', 'yes', 'yes', 'yes', 14, '', '', ''),
(97, 9, 'RowDataFailed', 'RowDataFailed', 'number', 'yes', 'yes', 'yes', 'yes', 15, '', '', ''),
(98, 9, 'ApprovalID', 'ApprovalID', 'number', 'yes', 'yes', 'yes', 'yes', 16, '', '', ''),
(99, 9, 'IS_APPROVED', 'IS_APPROVED', 'number', 'yes', 'yes', 'yes', 'yes', 17, '', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `crud_field_validation`
--

INSERT INTO `crud_field_validation` (`id`, `crud_field_id`, `crud_id`, `validation_name`, `validation_value`) VALUES
(1, 2, 1, 'required', ''),
(2, 2, 1, 'max_length', '200'),
(3, 3, 1, 'required', ''),
(4, 5, 2, 'required', ''),
(5, 5, 2, 'max_length', '200'),
(6, 6, 2, 'required', ''),
(7, 7, 2, 'required', ''),
(8, 8, 2, 'required', ''),
(9, 8, 2, 'max_length', '200'),
(10, 9, 2, 'required', ''),
(11, 11, 3, 'required', ''),
(12, 11, 3, 'max_length', '55'),
(13, 12, 3, 'required', ''),
(14, 12, 3, 'max_length', '55'),
(15, 13, 3, 'required', ''),
(16, 13, 3, 'max_length', '55'),
(17, 14, 3, 'required', ''),
(18, 14, 3, 'max_length', '55'),
(19, 15, 4, 'required', ''),
(20, 15, 4, 'max_length', '11'),
(21, 16, 4, 'required', ''),
(22, 16, 4, 'max_length', '55'),
(23, 17, 4, 'required', ''),
(24, 17, 4, 'max_length', '55'),
(25, 18, 4, 'required', ''),
(26, 19, 4, 'required', ''),
(27, 19, 4, 'max_length', '55'),
(28, 20, 4, 'required', ''),
(29, 20, 4, 'max_length', '255'),
(30, 21, 4, 'required', ''),
(31, 21, 4, 'max_length', '25'),
(32, 22, 4, 'required', ''),
(33, 22, 4, 'max_length', '11'),
(34, 25, 5, 'required', ''),
(35, 25, 5, 'max_length', '11'),
(36, 26, 5, 'required', ''),
(37, 27, 5, 'required', ''),
(38, 27, 5, 'max_length', '55'),
(39, 28, 5, 'required', ''),
(40, 28, 5, 'max_length', '55'),
(41, 29, 5, 'required', ''),
(42, 29, 5, 'max_length', '55'),
(43, 30, 5, 'required', ''),
(44, 30, 5, 'max_length', '55'),
(45, 31, 5, 'required', ''),
(46, 31, 5, 'max_length', '55'),
(47, 32, 5, 'required', ''),
(48, 32, 5, 'max_length', '55'),
(49, 33, 5, 'required', ''),
(50, 33, 5, 'max_length', '55'),
(51, 34, 5, 'required', ''),
(52, 34, 5, 'max_length', '45'),
(53, 36, 6, 'required', ''),
(54, 36, 6, 'max_length', '11'),
(55, 37, 6, 'required', ''),
(56, 38, 6, 'required', ''),
(57, 38, 6, 'max_length', '55'),
(58, 39, 6, 'required', ''),
(59, 39, 6, 'max_length', '55'),
(60, 40, 6, 'required', ''),
(61, 40, 6, 'max_length', '55'),
(62, 41, 6, 'required', ''),
(63, 41, 6, 'max_length', '55'),
(64, 42, 6, 'required', ''),
(65, 42, 6, 'max_length', '55'),
(66, 43, 6, 'required', ''),
(67, 43, 6, 'max_length', '55'),
(68, 44, 6, 'required', ''),
(69, 44, 6, 'max_length', '55'),
(70, 45, 6, 'required', ''),
(71, 45, 6, 'max_length', '45'),
(72, 46, 6, 'required', ''),
(73, 46, 6, 'max_length', '11'),
(74, 47, 7, 'required', ''),
(75, 47, 7, 'max_length', '11'),
(76, 48, 7, 'required', ''),
(77, 48, 7, 'max_length', '55'),
(78, 49, 7, 'required', ''),
(79, 49, 7, 'max_length', '55'),
(80, 50, 7, 'required', ''),
(81, 51, 7, 'required', ''),
(82, 51, 7, 'max_length', '55'),
(83, 52, 7, 'required', ''),
(84, 52, 7, 'max_length', '255'),
(85, 53, 7, 'required', ''),
(86, 53, 7, 'max_length', '25'),
(87, 54, 7, 'required', ''),
(88, 54, 7, 'max_length', '11'),
(89, 56, 8, 'required', ''),
(90, 57, 8, 'required', ''),
(91, 57, 8, 'max_length', '55'),
(92, 58, 8, 'required', ''),
(93, 58, 8, 'max_length', '55'),
(94, 59, 8, 'required', ''),
(95, 59, 8, 'max_length', '55'),
(96, 60, 8, 'required', ''),
(97, 60, 8, 'max_length', '55'),
(98, 61, 8, 'required', ''),
(99, 61, 8, 'max_length', '55'),
(100, 62, 8, 'required', ''),
(101, 62, 8, 'max_length', '55'),
(102, 63, 8, 'required', ''),
(103, 63, 8, 'max_length', '55'),
(104, 64, 8, 'required', ''),
(105, 64, 8, 'max_length', '45'),
(137, 85, 9, 'required', ''),
(138, 85, 9, 'max_length', '11'),
(139, 86, 9, 'required', ''),
(140, 86, 9, 'max_length', '255'),
(141, 87, 9, 'required', ''),
(142, 88, 9, 'required', ''),
(143, 89, 9, 'required', ''),
(144, 90, 9, 'required', ''),
(145, 91, 9, 'required', ''),
(146, 92, 9, 'required', ''),
(147, 92, 9, 'max_length', '255'),
(148, 93, 9, 'required', ''),
(149, 93, 9, 'max_length', '255'),
(150, 94, 9, 'required', ''),
(151, 94, 9, 'max_length', '255'),
(152, 95, 9, 'required', ''),
(153, 95, 9, 'max_length', '11'),
(154, 96, 9, 'required', ''),
(155, 96, 9, 'max_length', '11'),
(156, 97, 9, 'required', ''),
(157, 97, 9, 'max_length', '11'),
(158, 98, 9, 'required', ''),
(159, 98, 9, 'max_length', '11'),
(160, 99, 9, 'required', ''),
(161, 99, 9, 'max_length', '11');

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
(1, 0, 'B67F71474A72BD24931413FEE0934796', 0, 0, 0, NULL, '2018-09-14 13:55:52');

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
  `TYPE_MID` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mismerunmatch`
--

CREATE TABLE IF NOT EXISTS `mismerunmatch` (
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
  `TYPE_MID` varchar(45) DEFAULT NULL,
  `IS_UPDATE` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mso_channel`
--

CREATE TABLE IF NOT EXISTS `mso_channel` (
`ID` int(11) NOT NULL,
  `Wilayah` varchar(55) DEFAULT NULL,
  `KodeWilayah` varchar(55) DEFAULT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `Channel` varchar(55) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mso_channel`
--

INSERT INTO `mso_channel` (`ID`, `Wilayah`, `KodeWilayah`, `MSO`, `Channel`) VALUES
(2, 'WMD', 'A', 'A03', 'PPU'),
(3, 'WMD', 'A', 'A04', 'PPP'),
(4, 'WMD', 'A', 'A09', 'BDP'),
(5, 'WMD', 'A', 'A10', 'MBA'),
(6, 'WMD', 'A', 'A11', 'MBA'),
(7, 'WMD', 'A', 'A12', 'MBA'),
(8, 'WMD', 'A', 'A13', 'MBA'),
(9, 'WMD', 'A', 'A14', 'MBA'),
(10, 'WMD', 'A', 'A15', 'MBA'),
(11, 'WMD', 'A', 'A16', 'MBA'),
(12, 'WMD', 'A', 'A17', 'MBA'),
(13, 'WMD', 'A', 'A18', 'MBA'),
(14, 'WMD', 'A', 'A19', 'MBA'),
(15, 'WMD', 'A', 'A20', 'MBA'),
(16, 'WMD', 'A', 'A21', 'MBA'),
(17, 'WMD', 'A', 'A22', 'MBA'),
(18, 'WMD', 'A', 'A23', 'MBA'),
(19, 'WMD', 'A', 'A24', 'MBA'),
(20, 'WMD', 'A', 'A25', 'MBA'),
(21, 'WMD', 'A', 'A26', 'MBA'),
(22, 'WMD', 'A', 'A27', 'MBA'),
(23, 'WMD', 'A', 'A28', 'MBA'),
(24, 'WMD', 'A', 'A29', 'MBA'),
(25, 'WMD', 'A', 'A30', 'MBA'),
(26, 'WMD', 'A', 'A31', 'MBA'),
(27, 'WPD', 'B', 'B15', 'MBA'),
(28, 'WPD', 'B', 'B16', 'MBA'),
(29, 'WPD', 'B', 'B17', 'MBA'),
(30, 'WPD', 'B', 'B18', 'MBA'),
(31, 'WPD', 'B', 'B19', 'MBA'),
(32, 'WPD', 'B', 'B20', 'MBA'),
(33, 'WPD', 'B', 'B21', 'MBA'),
(34, 'WPD', 'B', 'B22', 'MBA'),
(35, 'WPD', 'B', 'B23', 'MBA'),
(36, 'WPD', 'B', 'B24', 'MBA'),
(37, 'WPD', 'B', 'B25', 'MBA'),
(38, 'WPD', 'B', 'B26', 'MBA'),
(39, 'WPD', 'B', 'B27', 'MBA'),
(40, 'WPD', 'B', 'B28', 'MBA'),
(41, 'WPD', 'B', 'B29', 'MBA'),
(42, 'WPD', 'B', 'B30', 'MBA'),
(43, 'WPD', 'B', 'B31', 'MBA'),
(44, 'WPD', 'B', 'B32', 'MBA'),
(45, 'WPD', 'B', 'B33', 'MBA'),
(46, 'WPD', 'B', 'B34', 'MBA'),
(47, 'WPD', 'B', 'B35', 'MBA'),
(48, 'WPD', 'B', 'B36', 'MBA'),
(49, 'WPD', 'B', 'B37', 'MBA'),
(50, 'WPD', 'B', 'B38', 'MBA'),
(51, 'WPD', 'B', 'B39', 'MBA'),
(52, 'WPD', 'B', 'B40', 'MBA'),
(53, 'WPD', 'B', 'B41', 'MBA'),
(54, 'WPD', 'B', 'B42', 'MBA'),
(55, 'WPD', 'B', 'B43', 'MBA'),
(56, 'WPD', 'B', 'B44', 'MBA'),
(57, 'WPD', 'B', 'B45', 'MBA'),
(58, 'WPD', 'B', 'B46', 'MBA'),
(59, 'WPD', 'B', 'B47', 'MBA'),
(60, 'WPD', 'B', 'B48', 'MBA'),
(61, 'WPD', 'B', 'B49', 'MBA'),
(62, 'WPD', 'B', 'B50', 'MBA'),
(63, 'WPD', 'B', 'B51', 'MBA'),
(64, 'WPD', 'B', 'B52', 'MBA'),
(65, 'WPD', 'B', 'B53', 'MBA'),
(66, 'WPD', 'B', 'B54', 'MBA'),
(67, 'WPD', 'B', 'B55', 'MBA'),
(68, 'WPD', 'B', 'B56', 'MBA'),
(69, 'WPD', 'B', 'B57', 'MBA'),
(70, 'WPD', 'B', 'B58', 'MBA'),
(71, 'WPD', 'B', 'B59', 'MBA'),
(72, 'WPL', 'C', 'C03', 'PPU'),
(73, 'WPL', 'C', 'C04', 'PPP'),
(74, 'WPL', 'C', 'C09', 'BDP'),
(75, 'WPL', 'C', 'C10', 'MBA'),
(76, 'WPL', 'C', 'C11', 'MBA'),
(77, 'WPL', 'C', 'C12', 'MBA'),
(78, 'WPL', 'C', 'C13', 'MBA'),
(79, 'WPL', 'C', 'C14', 'MBA'),
(80, 'WPL', 'C', 'C15', 'MBA'),
(81, 'WPL', 'C', 'C16', 'MBA'),
(82, 'WPL', 'C', 'C17', 'MBA'),
(83, 'WPL', 'C', 'C18', 'MBA'),
(84, 'WPL', 'C', 'C19', 'MBA'),
(85, 'WPL', 'C', 'C20', 'MBA'),
(86, 'WPL', 'C', 'C21', 'MBA'),
(87, 'WPL', 'C', 'C22', 'MBA'),
(88, 'WPL', 'C', 'C23', 'MBA'),
(89, 'WPL', 'C', 'C24', 'MBA'),
(90, 'WPL', 'C', 'C25', 'MBA'),
(91, 'WPL', 'C', 'C26', 'MBA'),
(92, 'WPL', 'C', 'C27', 'MBA'),
(93, 'WPL', 'C', 'C28', 'MBA'),
(94, 'WPL', 'C', 'C29', 'MBA'),
(95, 'WPL', 'C', 'C30', 'MBA'),
(96, 'WPL', 'C', 'C31', 'MBA'),
(97, 'WPL', 'C', 'C32', 'MBA'),
(98, 'WPL', 'C', 'C33', 'MBA'),
(99, 'WPL', 'C', 'C34', 'MBA'),
(100, 'WPL', 'C', 'C35', 'MBA'),
(101, 'WPL', 'C', 'C36', 'MBA'),
(102, 'WPL', 'C', 'C37', 'MBA'),
(103, 'WPL', 'C', 'C38', 'MBA'),
(104, 'WPL', 'C', 'C39', 'MBA'),
(105, 'WPL', 'C', 'C40', 'MBA'),
(106, 'WPL', 'C', 'C41', 'MBA'),
(107, 'WPL', 'C', 'C42', 'MBA'),
(108, 'WPL', 'C', 'C43', 'MBA'),
(109, 'WPL', 'C', 'C44', 'MBA'),
(110, 'WPL', 'C', 'C45', 'MBA'),
(111, 'WPL', 'C', 'C46', 'MBA'),
(112, 'WPL', 'C', 'C47', 'MBA'),
(113, 'WPL', 'C', 'C48', 'MBA'),
(114, 'WPL', 'C', 'C49', 'MBA'),
(115, 'WPL', 'C', 'C50', 'MBA'),
(116, 'WPL', 'C', 'C51', 'MBA'),
(117, 'WPL', 'C', 'C52', 'MBA'),
(118, 'WPL', 'C', 'C53', 'MBA'),
(119, 'WBN', 'D', 'D03', 'PPU'),
(120, 'WBN', 'D', 'D04', 'PPP'),
(121, 'WBN', 'D', 'D09', 'BDP'),
(122, 'WBN', 'D', 'D10', 'MBA'),
(123, 'WBN', 'D', 'D11', 'MBA'),
(124, 'WBN', 'D', 'D12', 'MBA'),
(125, 'WBN', 'D', 'D13', 'MBA'),
(126, 'WBN', 'D', 'D14', 'MBA'),
(127, 'WBN', 'D', 'D15', 'MBA'),
(128, 'WBN', 'D', 'D16', 'MBA'),
(129, 'WBN', 'D', 'D17', 'MBA'),
(130, 'WBN', 'D', 'D18', 'MBA'),
(131, 'WBN', 'D', 'D19', 'MBA'),
(132, 'WBN', 'D', 'D20', 'MBA'),
(133, 'WBN', 'D', 'D21', 'MBA'),
(134, 'WBN', 'D', 'D22', 'MBA'),
(135, 'WBN', 'D', 'D23', 'MBA'),
(136, 'WBN', 'D', 'D24', 'MBA'),
(137, 'WSM', 'E', 'E03', 'PPU'),
(138, 'WSM', 'E', 'E04', 'PPP'),
(139, 'WSM', 'E', 'E09', 'BDP'),
(140, 'WSM', 'E', 'E15', 'MBA'),
(141, 'WSM', 'E', 'E16', 'MBA'),
(142, 'WSM', 'E', 'E17', 'MBA'),
(143, 'WSM', 'E', 'E18', 'MBA'),
(144, 'WSM', 'E', 'E19', 'MBA'),
(145, 'WSM', 'E', 'E20', 'MBA'),
(146, 'WSM', 'E', 'E21', 'MBA'),
(147, 'WSM', 'E', 'E22', 'MBA'),
(148, 'WSM', 'E', 'E23', 'MBA'),
(149, 'WSM', 'E', 'E24', 'MBA'),
(150, 'WSM', 'E', 'E25', 'MBA'),
(151, 'WSM', 'E', 'E26', 'MBA'),
(152, 'WSM', 'E', 'E27', 'MBA'),
(153, 'WSM', 'E', 'E28', 'MBA'),
(154, 'WSM', 'E', 'E29', 'MBA'),
(155, 'WSM', 'E', 'E30', 'MBA'),
(156, 'WSY', 'F', 'F03', 'PPU'),
(157, 'WSY', 'F', 'F04', 'PPP'),
(158, 'WSY', 'F', 'F09', 'BDP'),
(159, 'WSY', 'F', 'F11', 'MBA'),
(160, 'WSY', 'F', 'F12', 'MBA'),
(161, 'WSY', 'F', 'F13', 'MBA'),
(162, 'WSY', 'F', 'F14', 'MBA'),
(163, 'WSY', 'F', 'F15', 'MBA'),
(164, 'WSY', 'F', 'F16', 'MBA'),
(165, 'WSY', 'F', 'F17', 'MBA'),
(166, 'WSY', 'F', 'F18', 'MBA'),
(167, 'WSY', 'F', 'F19', 'MBA'),
(168, 'WSY', 'F', 'F20', 'MBA'),
(169, 'WSY', 'F', 'F21', 'MBA'),
(170, 'WSY', 'F', 'F22', 'MBA'),
(171, 'WSY', 'F', 'F23', 'MBA'),
(172, 'WMK', 'G', 'G03', 'PPU'),
(173, 'WMK', 'G', 'G04', 'PPP'),
(174, 'WMK', 'G', 'G09', 'BDP'),
(175, 'WMK', 'G', 'G10', 'MBA'),
(176, 'WMK', 'G', 'G11', 'MBA'),
(177, 'WMK', 'G', 'G12', 'MBA'),
(178, 'WMK', 'G', 'G13', 'MBA'),
(179, 'WMK', 'G', 'G14', 'MBA'),
(180, 'WMK', 'G', 'G15', 'MBA'),
(181, 'WMK', 'G', 'G16', 'MBA'),
(182, 'WMK', 'G', 'G17', 'MBA'),
(183, 'WMK', 'G', 'G18', 'MBA'),
(184, 'WMK', 'G', 'G19', 'MBA'),
(185, 'WMK', 'G', 'G20', 'MBA'),
(186, 'WMK', 'G', 'G21', 'MBA'),
(187, 'WMK', 'G', 'G22', 'MBA'),
(188, 'WMK', 'G', 'G23', 'MBA'),
(189, 'WMK', 'G', 'G24', 'MBA'),
(190, 'WMK', 'G', 'G25', 'MBA'),
(191, 'WMK', 'G', 'G26', 'MBA'),
(192, 'WMK', 'G', 'G27', 'MBA'),
(193, 'WMK', 'G', 'G28', 'MBA'),
(194, 'WMK', 'G', 'G29', 'MBA'),
(195, 'WMK', 'G', 'G30', 'MBA'),
(196, 'WMK', 'G', 'G31', 'MBA'),
(197, 'WMK', 'G', 'G32', 'MBA'),
(198, 'WMK', 'G', 'G33', 'MBA'),
(199, 'WMK', 'G', 'G34', 'MBA'),
(200, 'WDR', 'H', 'H04', 'PPP'),
(201, 'WDR', 'H', 'H09', 'BDP'),
(202, 'WDR', 'H', 'H10', 'MBA'),
(203, 'WDR', 'H', 'H11', 'MBA'),
(204, 'WDR', 'H', 'H12', 'MBA'),
(205, 'WDR', 'H', 'H13', 'MBA'),
(206, 'WDR', 'H', 'H14', 'MBA'),
(207, 'WDR', 'H', 'H15', 'MBA'),
(208, 'WDR', 'H', 'H16', 'MBA'),
(209, 'WDR', 'H', 'H17', 'MBA'),
(210, 'WDR', 'H', 'H18', 'MBA'),
(211, 'WDR', 'H', 'H19', 'MBA'),
(212, 'WDR', 'H', 'H20', 'MBA'),
(213, 'WDR', 'H', 'H21', 'MBA'),
(214, 'WDR', 'H', 'H22', 'MBA'),
(215, 'WDR', 'H', 'H23', 'MBA'),
(216, 'WDR', 'H', 'H24', 'MBA'),
(217, 'WDR', 'H', 'H25', 'MBA'),
(218, 'WDR', 'H', 'H26', 'MBA'),
(219, 'WDR', 'H', 'H27', 'MBA'),
(220, 'WDR', 'H', 'H28', 'MBA'),
(221, 'WDR', 'H', 'H29', 'MBA'),
(222, 'WDR', 'H', 'H30', 'MBA'),
(223, 'WDR', 'H', 'H31', 'MBA'),
(224, 'WDR', 'H', 'H32', 'MBA'),
(225, 'WDR', 'H', 'H33', 'MBA'),
(226, 'WBJ', 'I', 'I04', 'PPP'),
(227, 'WBJ', 'I', 'I09', 'BDP'),
(228, 'WBJ', 'I', 'I10', 'MBA'),
(229, 'WBJ', 'I', 'I11', 'MBA'),
(230, 'WBJ', 'I', 'I12', 'MBA'),
(231, 'WBJ', 'I', 'I13', 'MBA'),
(232, 'WBJ', 'I', 'I14', 'MBA'),
(233, 'WBJ', 'I', 'I15', 'MBA'),
(234, 'WBJ', 'I', 'I16', 'MBA'),
(235, 'WBJ', 'I', 'I17', 'MBA'),
(236, 'WBJ', 'I', 'I18', 'MBA'),
(237, 'WBJ', 'I', 'I19', 'MBA'),
(238, 'WBJ', 'I', 'I20', 'MBA'),
(239, 'WBJ', 'I', 'I21', 'MBA'),
(240, 'WBJ', 'I', 'I22', 'MBA'),
(241, 'WBJ', 'I', 'I23', 'MBA'),
(242, 'WBJ', 'I', 'I24', 'MBA'),
(243, 'WBJ', 'I', 'I25', 'MBA'),
(244, 'WBJ', 'I', 'I26', 'MBA'),
(245, 'WBJ', 'I', 'I27', 'MBA'),
(246, 'WBJ', 'I', 'I28', 'MBA'),
(247, 'WBJ', 'I', 'I29', 'MBA'),
(248, 'WBJ', 'I', 'I30', 'MBA'),
(249, 'WBJ', 'I', 'I31', 'MBA'),
(250, 'WBJ', 'I', 'I32', 'MBA'),
(251, 'WBJ', 'I', 'I33', 'MBA'),
(252, 'WBJ', 'I', 'I34', 'MBA'),
(253, 'WBJ', 'I', 'I35', 'MBA'),
(254, 'WBJ', 'I', 'I36', 'MBA'),
(255, 'WMO', 'J', 'J10', 'MBA'),
(256, 'WMO', 'J', 'J11', 'MBA'),
(257, 'WMO', 'J', 'J12', 'MBA'),
(258, 'WMO', 'J', 'J13', 'MBA'),
(259, 'WMO', 'J', 'J14', 'MBA'),
(260, 'WMO', 'J', 'J15', 'MBA'),
(261, 'WMO', 'J', 'J16', 'MBA'),
(262, 'WMO', 'J', 'J17', 'MBA'),
(263, 'WMO', 'J', 'J18', 'MBA'),
(264, 'WMO', 'J', 'J19', 'MBA'),
(265, 'WMO', 'J', 'J20', 'MBA'),
(266, 'WMO', 'J', 'J21', 'MBA'),
(267, 'WMO', 'J', 'J22', 'MBA'),
(268, 'WMO', 'J', 'J23', 'MBA'),
(269, 'WMO', 'J', 'J24', 'MBA'),
(270, 'WMO', 'J', 'J25', 'MBA'),
(271, 'WMO', 'J', 'J26', 'MBA'),
(272, 'WMO', 'J', 'J27', 'MBA'),
(273, 'WMO', 'J', 'J28', 'MBA'),
(274, 'WMO', 'J', 'J29', 'MBA'),
(275, 'WMO', 'J', 'J30', 'MBA'),
(276, 'WMO', 'J', 'J31', 'MBA'),
(277, 'WMO', 'J', 'J32', 'MBA'),
(278, 'WPU', 'K', 'K60', 'MBA'),
(279, 'WPU', 'K', 'K61', 'MBA'),
(280, 'WPU', 'K', 'K94', 'MBA'),
(281, 'WPU', 'K', 'K95', 'MBA'),
(282, 'WJS', 'L', 'L92', 'TDP'),
(283, 'WJS', 'L', 'L93', 'PPU'),
(284, 'WJS', 'L', 'L04', 'PPP'),
(285, 'WJS', 'L', 'L09', 'BDP'),
(286, 'WJS', 'L', 'L10', 'MBA'),
(287, 'WJS', 'L', 'L11', 'MBA'),
(288, 'WJS', 'L', 'L12', 'MBA'),
(289, 'WJS', 'L', 'L13', 'MBA'),
(290, 'WJS', 'L', 'L14', 'MBA'),
(291, 'WJS', 'L', 'L15', 'MBA'),
(292, 'WJS', 'L', 'L16', 'MBA'),
(293, 'WJS', 'L', 'L17', 'MBA'),
(294, 'WJS', 'L', 'L18', 'MBA'),
(295, 'WJK', 'M', 'M02', 'TDP'),
(296, 'WJK', 'M', 'M03', 'PPU'),
(297, 'WJK', 'M', 'M04', 'PPP'),
(298, 'WJK', 'M', 'M09', 'BDP'),
(299, 'WJK', 'M', 'M11', 'MBA'),
(300, 'WJK', 'M', 'M30', 'MBA'),
(301, 'WJK', 'M', 'M45', 'MBA'),
(302, 'WJK', 'M', 'M49', 'MBA'),
(303, 'WJK', 'M', 'M52', 'MBA'),
(304, 'WJK', 'M', 'M54', 'MBA'),
(305, 'WJB', 'N', 'N02', 'TDP'),
(306, 'WJB', 'N', 'N03', 'PPU'),
(307, 'WJB', 'N', 'N04', 'PPP'),
(308, 'WJB', 'N', 'N09', 'BDP'),
(309, 'WJB', 'N', 'N16', 'MBA'),
(310, 'WJB', 'N', 'N17', 'MBA'),
(311, 'WJB', 'N', 'N18', 'MBA'),
(312, 'WJB', 'N', 'N19', 'MBA'),
(313, 'WJB', 'N', 'N20', 'MBA'),
(314, 'WJB', 'N', 'N21', 'MBA'),
(315, 'WJB', 'N', 'N22', 'MBA'),
(316, 'WJB', 'N', 'N23', 'MBA'),
(317, 'WJB', 'N', 'N24', 'MBA'),
(318, 'WJB', 'N', 'N25', 'MBA'),
(319, 'WJB', 'N', 'N26', 'MBA'),
(320, 'WJB', 'N', 'N27', 'MBA'),
(321, 'WJB', 'N', 'N28', 'MBA'),
(322, 'WJB', 'N', 'N29', 'MBA'),
(323, 'WJB', 'N', 'N30', 'MBA'),
(324, 'WJB', 'N', 'N31', 'MBA'),
(325, 'WJB', 'N', 'N32', 'MBA'),
(326, 'WJB', 'N', 'N33', 'MBA'),
(327, 'WJB', 'N', 'N34', 'MBA'),
(328, 'WJB', 'N', 'N35', 'MBA'),
(329, 'WJB', 'N', 'N36', 'MBA'),
(330, 'WJB', 'N', 'N37', 'MBA'),
(331, 'WJB', 'N', 'N38', 'MBA'),
(332, 'WJB', 'N', 'N39', 'MBA'),
(333, 'WJB', 'N', 'N40', 'MBA'),
(334, 'WJB', 'N', 'N41', 'MBA'),
(335, 'WJB', 'N', 'N42', 'MBA'),
(336, 'WJB', 'N', 'N43', 'MBA'),
(337, 'WJB', 'N', 'N44', 'MBA'),
(338, 'WJB', 'N', 'N45', 'MBA'),
(339, 'WJB', 'N', 'N46', 'MBA'),
(340, 'WJB', 'N', 'N47', 'MBA'),
(341, 'WJB', 'N', 'N48', 'MBA'),
(342, 'WJB', 'N', 'N49', 'MBA'),
(343, 'WJB', 'N', 'N50', 'MBA'),
(344, 'WJB', 'N', 'N51', 'MBA'),
(345, 'WJB', 'N', 'N52', 'MBA'),
(346, 'WJB', 'N', 'N53', 'MBA'),
(347, 'WJB', 'N', 'N54', 'MBA'),
(348, 'WJB', 'N', 'N55', 'MBA'),
(349, 'WJB', 'N', 'N56', 'MBA'),
(350, 'WJY', 'O', 'O02', 'TDP'),
(351, 'WJY', 'O', 'O03', 'PPU'),
(352, 'WJY', 'O', 'O04', 'PPP'),
(353, 'WJY', 'O', 'O09', 'BDP'),
(354, 'WJY', 'O', 'O10', 'MBA'),
(355, 'WJY', 'O', 'O11', 'MBA'),
(356, 'WJY', 'O', 'O12', 'MBA'),
(357, 'WJY', 'O', 'O13', 'MBA'),
(358, 'WJY', 'O', 'O14', 'MBA'),
(359, 'WJY', 'O', 'O15', 'MBA'),
(360, 'WJY', 'O', 'O16', 'MBA'),
(361, 'WJY', 'O', 'O17', 'MBA'),
(362, 'WJY', 'O', 'O18', 'MBA'),
(363, 'WJY', 'O', 'O19', 'MBA'),
(364, 'WYK', 'R', 'R03', 'PPU'),
(365, 'WYK', 'R', 'R04', 'PPP'),
(366, 'WYK', 'R', 'R09', 'BDP'),
(367, 'WYK', 'R', 'R10', 'MBA'),
(368, 'WYK', 'R', 'R11', 'MBA'),
(369, 'WYK', 'R', 'R12', 'MBA'),
(370, 'WYK', 'R', 'R13', 'MBA'),
(371, 'WYK', 'R', 'R14', 'MBA'),
(372, 'WYK', 'R', 'R15', 'MBA'),
(373, 'WYK', 'R', 'R16', 'MBA'),
(374, 'WMA', 'S', 'S03', 'PPU'),
(375, 'WMA', 'S', 'S04', 'PPP'),
(376, 'WMA', 'S', 'S09', 'BDP'),
(377, 'WMA', 'S', 'S11', 'MBA'),
(378, 'WMA', 'S', 'S12', 'MBA'),
(379, 'WMA', 'S', 'S13', 'MBA'),
(380, 'WMA', 'S', 'S14', 'MBA'),
(381, 'GABUNGAN', 'MSO LAMA', 'XXX', 'CABANG'),
(382, 'WJK', 'MSO LAMA', 'K11', 'MBA'),
(383, 'WJY', 'MSO LAMA', 'K12', 'MBA'),
(384, 'WJB', 'MSO LAMA', 'K16', 'MBA'),
(385, 'WJB', 'MSO LAMA', 'K17', 'MBA'),
(386, 'WJY', 'MSO LAMA', 'K18', 'MBA'),
(387, 'WJY', 'MSO LAMA', 'K20', 'MBA'),
(388, 'WJB', 'MSO LAMA', 'K21', 'MBA'),
(389, 'WJY', 'MSO LAMA', 'K23', 'MBA'),
(390, 'WJS', 'MSO LAMA', 'K29', 'MBA'),
(391, 'WJK', 'MSO LAMA', 'K30', 'MBA'),
(392, 'WJS', 'MSO LAMA', 'K32', 'MBA'),
(393, 'WJB', 'MSO LAMA', 'K33', 'MBA'),
(394, 'WJY', 'MSO LAMA', 'K34', 'MBA'),
(395, 'WJY', 'MSO LAMA', 'K35', 'MBA'),
(396, 'WJS', 'MSO LAMA', 'K40', 'MBA'),
(397, 'WJB', 'MSO LAMA', 'K42', 'MBA'),
(398, 'WJB', 'MSO LAMA', 'K44', 'MBA'),
(399, 'WJK', 'MSO LAMA', 'K45', 'MBA'),
(400, 'WJK', 'MSO LAMA', 'K47', 'MBA'),
(401, 'WJB', 'MSO LAMA', 'K48', 'MBA'),
(402, 'WJK', 'MSO LAMA', 'K49', 'MBA'),
(403, 'WJK', 'MSO LAMA', 'K52', 'MBA'),
(404, 'WJK', 'MSO LAMA', 'K54', 'MBA'),
(405, 'WMD', '9', '901', 'MBR'),
(406, 'WPD', '9', '902', 'MBR'),
(407, 'WPL', '9', '903', 'MBR'),
(408, 'WBN', '9', '904', 'MBR'),
(409, 'WSM', '9', '905', 'MBR'),
(410, 'WSY', '9', '906', 'MBR'),
(411, 'WMK', '9', '907', 'MBR'),
(412, 'WDR', '9', '908', 'MBR'),
(413, 'WBJ', '9', '909', 'MBR'),
(414, 'WJS', '9', '910', 'MBR'),
(415, 'WMO', '9', '911', 'MBR'),
(416, 'WJB', '9', '914', 'MBR'),
(417, 'WJY', '9', '915', 'MBR'),
(418, 'WPU', '9', '916', 'MBR'),
(419, 'WYK', '9', '917', 'MBR'),
(420, 'WMA', '9', '918', 'MBR'),
(421, 'WJK', '9', '920', 'MBR'),
(422, 'EBK', '9', '912', 'MBR');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `rest`
--

INSERT INTO `rest` (`id`, `subject`, `table_name`, `primary_key`, `x_api_key`, `x_token`) VALUES
(1, 'Blog Category', 'blog_category', 'category_id', 'no', 'yes'),
(2, 'Blog', 'blog', 'id', 'no', 'yes');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `rest_field`
--

INSERT INTO `rest_field` (`id`, `rest_id`, `field_name`, `field_label`, `input_type`, `show_column`, `show_add_api`, `show_update_api`, `show_detail_api`) VALUES
(1, 1, 'category_id', NULL, 'input', 'yes', '', '', 'yes'),
(2, 1, 'category_name', NULL, 'input', 'yes', 'yes', 'yes', 'yes'),
(3, 1, 'category_desc', NULL, 'input', 'yes', 'yes', 'yes', 'yes'),
(4, 2, 'id', NULL, 'input', 'yes', '', '', 'yes'),
(5, 2, 'title', NULL, 'input', 'yes', 'yes', 'yes', 'yes'),
(6, 2, 'content', NULL, 'input', 'yes', 'yes', 'yes', 'yes'),
(7, 2, 'image', NULL, 'input', 'yes', 'yes', 'yes', 'yes'),
(8, 2, 'category', NULL, 'input', 'yes', 'yes', 'yes', 'yes'),
(9, 2, 'created_at', NULL, 'input', 'yes', 'yes', 'yes', 'yes');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `rest_field_validation`
--

INSERT INTO `rest_field_validation` (`id`, `rest_field_id`, `rest_id`, `validation_name`, `validation_value`) VALUES
(1, 2, 1, 'required', ''),
(2, 2, 1, 'max_length', '200'),
(3, 3, 1, 'required', ''),
(4, 5, 2, 'required', ''),
(5, 5, 2, 'max_length', '200'),
(6, 6, 2, 'required', ''),
(7, 7, 2, 'required', ''),
(8, 8, 2, 'required', ''),
(9, 8, 2, 'max_length', '200'),
(10, 9, 2, 'required', '');

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
`BatchID` int(11) NOT NULL,
  `UploadDate` datetime DEFAULT NULL,
  `UploadBy` int(11) DEFAULT NULL,
  `UploadRemark` varchar(255) DEFAULT NULL,
  `ApplicationSource` varchar(55) DEFAULT NULL,
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
  `ApprovalID` int(11) DEFAULT '999',
  `IS_APPROVED` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `systemupload`
--

INSERT INTO `systemupload` (`BatchID`, `UploadDate`, `UploadBy`, `UploadRemark`, `ApplicationSource`, `ProcessYear`, `ProcessMonth`, `ProcessDate`, `FilePath`, `VirtualPath`, `FileSize`, `ReportPath`, `RowDataCount`, `RowDataSucceed`, `RowDataFailed`, `ApprovalID`, `IS_APPROVED`) VALUES
(5, '2018-09-17 00:43:50', 999, 'fdsgjlj', 'UNMATCH', 2018, 4, 2, '-UNMATCH.csv', 'VirtualPath', '123', 'ReportPath', 111, 222, 333, 999, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `templateuploadmismer`
--

CREATE TABLE IF NOT EXISTS `templateuploadmismer` (
  `MID` int(11) NOT NULL,
  `MERCHAN_DBA_NAME` varchar(55) DEFAULT NULL,
  `STATUS_EDC` varchar(55) DEFAULT NULL,
  `OPEN_DATE` date NOT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `SOURCE_CODE` varchar(255) DEFAULT NULL,
  `POS1` varchar(25) DEFAULT NULL,
  `IS_VALID` int(11) DEFAULT '0',
`ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `templateuploadunmatch`
--

CREATE TABLE IF NOT EXISTS `templateuploadunmatch` (
  `OPEN_DATE` date DEFAULT NULL,
  `MID` varchar(55) DEFAULT NULL,
  `MERCHAN_DBA_NAME` varchar(55) DEFAULT NULL,
  `MSO` varchar(55) DEFAULT NULL,
  `SOURCE_CODE` varchar(55) DEFAULT NULL,
  `POS1` varchar(55) DEFAULT NULL,
  `WILAYAH` varchar(55) DEFAULT NULL,
  `CHANNEL` varchar(55) DEFAULT NULL,
  `TYPE_MID` varchar(45) DEFAULT NULL,
`RowID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `mismerdetail`
--
ALTER TABLE `mismerdetail`
 ADD PRIMARY KEY (`RowID`);

--
-- Indexes for table `mismerunmatch`
--
ALTER TABLE `mismerunmatch`
 ADD PRIMARY KEY (`RowID`);

--
-- Indexes for table `mso_channel`
--
ALTER TABLE `mso_channel`
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
 ADD PRIMARY KEY (`BatchID`);

--
-- Indexes for table `templateuploadmismer`
--
ALTER TABLE `templateuploadmismer`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `templateuploadunmatch`
--
ALTER TABLE `templateuploadunmatch`
 ADD PRIMARY KEY (`RowID`);

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
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=133;
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
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `crud`
--
ALTER TABLE `crud`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `crud_custom_option`
--
ALTER TABLE `crud_custom_option`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `crud_field`
--
ALTER TABLE `crud_field`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `crud_field_validation`
--
ALTER TABLE `crud_field_validation`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=162;
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
-- AUTO_INCREMENT for table `mismerdetail`
--
ALTER TABLE `mismerdetail`
MODIFY `RowID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mismerunmatch`
--
ALTER TABLE `mismerunmatch`
MODIFY `RowID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mso_channel`
--
ALTER TABLE `mso_channel`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=423;
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
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `rest_field`
--
ALTER TABLE `rest_field`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `rest_field_validation`
--
ALTER TABLE `rest_field_validation`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `rest_input_type`
--
ALTER TABLE `rest_input_type`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `systemupload`
--
ALTER TABLE `systemupload`
MODIFY `BatchID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `templateuploadmismer`
--
ALTER TABLE `templateuploadmismer`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `templateuploadunmatch`
--
ALTER TABLE `templateuploadunmatch`
MODIFY `RowID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
