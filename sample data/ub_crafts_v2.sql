-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2014 at 11:11 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `crafts`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminnotification_inbox`
--

DROP TABLE IF EXISTS `adminnotification_inbox`;
CREATE TABLE IF NOT EXISTS `adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `IDX_ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `IDX_ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `IDX_ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_system_messages`
--

DROP TABLE IF EXISTS `admin_system_messages`;
CREATE TABLE IF NOT EXISTS `admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';

--
-- Dumping data for table `admin_system_messages`
--

INSERT INTO `admin_system_messages` (`identity`, `severity`, `created_at`) VALUES
('3c5a51dbe9feac32c1f6eef4200f26a0', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE IF NOT EXISTS `admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(5) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNQ_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin User Table' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `authorization_role`
--

DROP TABLE IF EXISTS `authorization_role`;
CREATE TABLE IF NOT EXISTS `authorization_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `IDX_AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `IDX_AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin Role Table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `authorization_role`
--

INSERT INTO `authorization_role` (`role_id`, `parent_id`, `tree_level`, `sort_order`, `role_type`, `user_id`, `user_type`, `role_name`) VALUES
(1, 0, 1, 1, 'G', 0, '2', 'Administrators'),
(2, 1, 2, 0, 'U', 1, '2', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `authorization_rule`
--

DROP TABLE IF EXISTS `authorization_rule`;
CREATE TABLE IF NOT EXISTS `authorization_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `IDX_AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `authorization_rule`
--

INSERT INTO `authorization_rule` (`rule_id`, `role_id`, `resource_id`, `privileges`, `permission`) VALUES
(1, 1, 'Magento_Adminhtml::all', NULL, 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `bannerslider_banner`
--

DROP TABLE IF EXISTS `bannerslider_banner`;
CREATE TABLE IF NOT EXISTS `bannerslider_banner` (
  `banner_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Banner ID',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `status` smallint(6) DEFAULT NULL COMMENT 'Status',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='bannerslider_banner' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `bannerslider_banner`
--

INSERT INTO `bannerslider_banner` (`banner_id`, `name`, `image`, `status`) VALUES
(1, 'Slide 01', '/p/r/product01.jpg', 1),
(2, 'Slide 02', '/p/r/product02.jpg', 1),
(3, 'Slide 03', '/p/r/product03.jpg', 1),
(4, 'Slide 04', '/p/r/product04.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `captcha_log`
--

DROP TABLE IF EXISTS `captcha_log`;
CREATE TABLE IF NOT EXISTS `captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock`
--

DROP TABLE IF EXISTS `cataloginventory_stock`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cataloginventory_stock`
--

INSERT INTO `cataloginventory_stock` (`stock_id`, `website_id`, `stock_name`) VALUES
(1, 0, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `cataloginventory_stock_item`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `UNQ_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_WEBSITE_ID` (`product_id`,`website_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item' AUTO_INCREMENT=32 ;

--
-- Dumping data for table `cataloginventory_stock_item`
--

INSERT INTO `cataloginventory_stock_item` (`item_id`, `product_id`, `stock_id`, `qty`, `min_qty`, `use_config_min_qty`, `is_qty_decimal`, `backorders`, `use_config_backorders`, `min_sale_qty`, `use_config_min_sale_qty`, `max_sale_qty`, `use_config_max_sale_qty`, `is_in_stock`, `low_stock_date`, `notify_stock_qty`, `use_config_notify_stock_qty`, `manage_stock`, `use_config_manage_stock`, `stock_status_changed_auto`, `use_config_qty_increments`, `qty_increments`, `use_config_enable_qty_inc`, `enable_qty_increments`, `is_decimal_divided`, `website_id`) VALUES
(1, 1, 1, '18.0000', '0.0000', 1, 0, 0, 1, '1.0000', 0, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(2, 2, 1, '56.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(3, 3, 1, '40.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(4, 4, 1, '32.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(5, 5, 1, '12.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(7, 6, 1, '21.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(9, 7, 1, '12.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(10, 8, 1, NULL, '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 0, '2014-12-19 02:04:28', NULL, 1, 0, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(11, 9, 1, '24.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(12, 10, 1, '42.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(13, 11, 1, '43.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(14, 12, 1, NULL, '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 0, '2014-12-19 02:20:59', NULL, 1, 0, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(15, 13, 1, '35.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(16, 14, 1, '12.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(17, 15, 1, '23.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(18, 16, 1, '23.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(20, 18, 1, '32.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(21, 19, 1, '13.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(27, 20, 1, '12.0000', '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 1, NULL, NULL, 1, 1, 0, 0, 1, '0.0000', 1, 0, 0, 1),
(31, 21, 1, NULL, '0.0000', 1, 0, 0, 1, '1.0000', 1, '0.0000', 1, 0, '2014-12-22 03:13:31', NULL, 1, 0, 0, 0, 1, '0.0000', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';

--
-- Dumping data for table `cataloginventory_stock_status`
--

INSERT INTO `cataloginventory_stock_status` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(1, 1, 1, '18.0000', 1),
(2, 1, 1, '56.0000', 1),
(3, 1, 1, '40.0000', 1),
(4, 1, 1, '32.0000', 1),
(5, 1, 1, '12.0000', 1),
(6, 1, 1, '21.0000', 1),
(7, 1, 1, '12.0000', 1),
(8, 1, 1, '0.0000', 1),
(9, 1, 1, '24.0000', 1),
(10, 1, 1, '42.0000', 1),
(11, 1, 1, '43.0000', 1),
(12, 1, 1, '0.0000', 1),
(13, 1, 1, '35.0000', 1),
(14, 1, 1, '12.0000', 1),
(15, 1, 1, '23.0000', 1),
(16, 1, 1, '23.0000', 1),
(18, 1, 1, '32.0000', 1),
(19, 1, 1, '13.0000', 1),
(20, 1, 1, '12.0000', 1),
(21, 1, 1, '0.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_idx`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';

--
-- Dumping data for table `cataloginventory_stock_status_idx`
--

INSERT INTO `cataloginventory_stock_status_idx` (`product_id`, `website_id`, `stock_id`, `qty`, `stock_status`) VALUES
(1, 1, 1, '18.0000', 1),
(2, 1, 1, '56.0000', 1),
(3, 1, 1, '40.0000', 1),
(4, 1, 1, '32.0000', 1),
(5, 1, 1, '12.0000', 1),
(6, 1, 1, '21.0000', 1),
(7, 1, 1, '12.0000', 1),
(8, 1, 1, '0.0000', 1),
(9, 1, 1, '24.0000', 1),
(10, 1, 1, '42.0000', 1),
(11, 1, 1, '43.0000', 1),
(12, 1, 1, '0.0000', 1),
(13, 1, 1, '35.0000', 1),
(14, 1, 1, '12.0000', 1),
(15, 1, 1, '23.0000', 1),
(16, 1, 1, '23.0000', 1),
(18, 1, 1, '32.0000', 1),
(19, 1, 1, '13.0000', 1),
(20, 1, 1, '12.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `cataloginventory_stock_status_tmp`;
CREATE TABLE IF NOT EXISTS `cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `IDX_CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule`
--

DROP TABLE IF EXISTS `catalogrule`;
CREATE TABLE IF NOT EXISTS `catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From Date',
  `to_date` date DEFAULT NULL COMMENT 'To Date',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `sub_is_enable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Rule Enable For Subitems',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_affected_product`
--

DROP TABLE IF EXISTS `catalogrule_affected_product`;
CREATE TABLE IF NOT EXISTS `catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Affected Product';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_customer_group`
--

DROP TABLE IF EXISTS `catalogrule_customer_group`;
CREATE TABLE IF NOT EXISTS `catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `IDX_CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_group_website`
--

DROP TABLE IF EXISTS `catalogrule_group_website`;
CREATE TABLE IF NOT EXISTS `catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product`
--

DROP TABLE IF EXISTS `catalogrule_product`;
CREATE TABLE IF NOT EXISTS `catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `IDX_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `IDX_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_product_price`
--

DROP TABLE IF EXISTS `catalogrule_product_price`;
CREATE TABLE IF NOT EXISTS `catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `UNQ_CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalogrule_website`
--

DROP TABLE IF EXISTS `catalogrule_website`;
CREATE TABLE IF NOT EXISTS `catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `IDX_CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Table structure for table `catalogsearch_fulltext`
--

DROP TABLE IF EXISTS `catalogsearch_fulltext`;
CREATE TABLE IF NOT EXISTS `catalogsearch_fulltext` (
  `fulltext_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`fulltext_id`),
  UNIQUE KEY `UNQ_CATALOGSEARCH_FULLTEXT_PRODUCT_ID_STORE_ID` (`product_id`,`store_id`),
  FULLTEXT KEY `FTI_CATALOGSEARCH_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Catalog search result table' AUTO_INCREMENT=186 ;

--
-- Dumping data for table `catalogsearch_fulltext`
--

INSERT INTO `catalogsearch_fulltext` (`fulltext_id`, `product_id`, `store_id`, `data_index`) VALUES
(138, 20, 1, 'Colorful Ruby-1 | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Colorful Becklec | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(137, 19, 1, 'Round Wall Clock | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_5 | Shanny Bee Bo | Round Wall Clock | Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications. | Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf Hang this unique clock in any room to instantly brighten up the space.This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).&nbsp;About Shannybeebo: &nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire &nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion. &nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents. &nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary. Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo'),
(136, 18, 1, 'Purple Wall Clock | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_5 | Shanny Bee Bo | Purple Wall Clock | Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications. | Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf Hang this unique clock in any room to instantly brighten up the space.This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).&nbsp;About Shannybeebo: &nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire &nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion. &nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents. &nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary. Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo'),
(135, 16, 1, 'Bohemian Wall Clock | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_5 | Shanny Bee Bo | Bohemian Wall Clock | Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications. | Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf Hang this unique clock in any room to instantly brighten up the space.This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).&nbsp;About Shannybeebo: &nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire &nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion. &nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents. &nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary. Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo'),
(134, 15, 1, 'Purple Ring | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Purple Ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(133, 14, 1, 'Colorful Ring | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Colorful Ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(132, 13, 1, 'Colorful Ruby | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Colorful Ruby | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(183, 11, 1, 'Bright Retro ring-1 | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bright Retro Ruby | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(131, 12, 1, 'Bright Retro ring-1-1 | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Occean Retro Ruby | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(129, 10, 1, 'Bright Retro ring | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bright Retro ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(127, 8, 1, 'Bird Nest necklace | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bird Nest necklace | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(128, 9, 1, 'Bohemian Wall Style | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bohemian Wall Style | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(122, 3, 1, 'Occean Hydrangea earrings-1 | attr_color_7 | Dark color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Purple Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(123, 4, 1, 'Steampunk Heart Necklace | attr_color_8 | Blue | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Steampunk Heart Necklace | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(124, 5, 1, 'Bright Retro necklace | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bright Retro necklace | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(125, 6, 1, 'Oval cocktail ring | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Oval cocktail ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(126, 7, 1, 'Wild Orchid ring | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Wild Orchid ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(177, 1, 1, 'Blue Hydrangea earrings | attr_color_ | | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_ | | Blue Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(121, 2, 1, 'Occean Hydrangea earrings | attr_tax_class_id_2 | Taxable Goods | attr_status_1 | Enabled | attr_visibility_4 | attr_color_6 | Light color | attr_brand_3 | Beauty Spot | Occean Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(157, 20, 2, 'Colorful Ruby-1 | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Colorful Becklec | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(156, 19, 2, 'Round Wall Clock | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_5 | Shanny Bee Bo | Round Wall Clock | Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications. | Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf Hang this unique clock in any room to instantly brighten up the space.This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).&nbsp;About Shannybeebo: &nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire &nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion. &nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents. &nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary. Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo'),
(155, 18, 2, 'Purple Wall Clock | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_5 | Shanny Bee Bo | Purple Wall Clock | Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications. | Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf Hang this unique clock in any room to instantly brighten up the space.This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).&nbsp;About Shannybeebo: &nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire &nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion. &nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents. &nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary. Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo'),
(154, 16, 2, 'Bohemian Wall Clock | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_5 | Shanny Bee Bo | Bohemian Wall Clock | Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications. | Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf Hang this unique clock in any room to instantly brighten up the space.This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).&nbsp;About Shannybeebo: &nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire &nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion. &nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents. &nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary. Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo'),
(153, 15, 2, 'Purple Ring | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Purple Ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(152, 14, 2, 'Colorful Ring | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Colorful Ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(151, 13, 2, 'Colorful Ruby | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Colorful Ruby | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(184, 11, 2, 'Bright Retro ring-1 | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bright Retro Ruby | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(150, 12, 2, 'Bright Retro ring-1-1 | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Occean Retro Ruby | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(148, 10, 2, 'Bright Retro ring | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bright Retro ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(145, 7, 2, 'Wild Orchid ring | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Wild Orchid ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(146, 8, 2, 'Bird Nest necklace | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bird Nest necklace | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(147, 9, 2, 'Bohemian Wall Style | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bohemian Wall Style | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.');
INSERT INTO `catalogsearch_fulltext` (`fulltext_id`, `product_id`, `store_id`, `data_index`) VALUES
(143, 5, 2, 'Bright Retro necklace | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bright Retro necklace | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(144, 6, 2, 'Oval cocktail ring | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Oval cocktail ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(140, 2, 2, 'Occean Hydrangea earrings | attr_tax_class_id_2 | Taxable Goods | attr_status_1 | Enabled | attr_visibility_4 | attr_color_6 | Light color | attr_brand_3 | Beauty Spot | Occean Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(141, 3, 2, 'Occean Hydrangea earrings-1 | attr_color_7 | Dark color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Purple Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(142, 4, 2, 'Steampunk Heart Necklace | attr_color_8 | Blue | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Steampunk Heart Necklace | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(178, 1, 2, 'Blue Hydrangea earrings | attr_color_ | | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_ | | Blue Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(176, 20, 3, 'Colorful Ruby-1 | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Colorful Becklec | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(175, 19, 3, 'Round Wall Clock | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_5 | Shanny Bee Bo | Round Wall Clock | Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications. | Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf Hang this unique clock in any room to instantly brighten up the space.This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).&nbsp;About Shannybeebo: &nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire &nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion. &nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents. &nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary. Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo'),
(174, 18, 3, 'Purple Wall Clock | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_5 | Shanny Bee Bo | Purple Wall Clock | Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications. | Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf Hang this unique clock in any room to instantly brighten up the space.This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).&nbsp;About Shannybeebo: &nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire &nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion. &nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents. &nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary. Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo'),
(173, 16, 3, 'Bohemian Wall Clock | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_5 | Shanny Bee Bo | Bohemian Wall Clock | Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now. And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications. | Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf Hang this unique clock in any room to instantly brighten up the space.This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).&nbsp;About Shannybeebo: &nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire &nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion. &nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents. &nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary. Hang this unique clock in any room to instantly brighten up the space. This clock is 12" in diameter. - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo'),
(172, 15, 3, 'Purple Ring | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Purple Ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(171, 14, 3, 'Colorful Ring | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Colorful Ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(170, 13, 3, 'Colorful Ruby | attr_color_6 | Light color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Colorful Ruby | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(185, 11, 3, 'Bright Retro ring-1 | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bright Retro Ruby | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(169, 12, 3, 'Bright Retro ring-1-1 | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Occean Retro Ruby | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(167, 10, 3, 'Bright Retro ring | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bright Retro ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(164, 7, 3, 'Wild Orchid ring | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Wild Orchid ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(165, 8, 3, 'Bird Nest necklace | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bird Nest necklace | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(166, 9, 3, 'Bohemian Wall Style | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bohemian Wall Style | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(162, 5, 3, 'Bright Retro necklace | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Bright Retro necklace | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(163, 6, 3, 'Oval cocktail ring | attr_color_9 | Purple | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Oval cocktail ring | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(159, 2, 3, 'Occean Hydrangea earrings | attr_tax_class_id_2 | Taxable Goods | attr_status_1 | Enabled | attr_visibility_4 | attr_color_6 | Light color | attr_brand_3 | Beauty Spot | Occean Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(160, 3, 3, 'Occean Hydrangea earrings-1 | attr_color_7 | Dark color | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Purple Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(161, 4, 3, 'Steampunk Heart Necklace | attr_color_8 | Blue | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_3 | Beauty Spot | Steampunk Heart Necklace | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(179, 1, 3, 'Blue Hydrangea earrings | attr_color_ | | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_ | | Blue Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(180, 21, 1, 'Blue Hydrangea earrings-1 | attr_color_ | | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_ | | Blue Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(181, 21, 2, 'Blue Hydrangea earrings-1 | attr_color_ | | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_ | | Blue Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.'),
(182, 21, 3, 'Blue Hydrangea earrings-1 | attr_color_ | | attr_status_1 | Enabled | attr_visibility_4 | attr_tax_class_id_2 | Taxable Goods | attr_brand_ | | Blue Hydrangea earrings | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.Measurements: &nbsp;Cab size 19x14mm/0.75x0.55" &nbsp;&nbsp; Adjustable ring base: minimum size is 8 Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry! | Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.About BeautySpot: &nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey &nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one! &nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity`
--

DROP TABLE IF EXISTS `catalog_category_entity`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `catalog_category_entity`
--

INSERT INTO `catalog_category_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `parent_id`, `created_at`, `updated_at`, `path`, `position`, `level`, `children_count`) VALUES
(1, 3, 0, 0, '2014-12-18 20:36:02', '2014-12-18 20:36:02', '1', 0, 0, 11),
(2, 3, 3, 1, '2014-12-18 20:36:03', '2014-12-18 20:36:03', '1/2', 1, 1, 10),
(3, 3, 3, 2, '2014-12-19 01:00:25', '2014-12-19 01:00:25', '1/2/3', 3, 2, 0),
(4, 3, 3, 2, '2014-12-19 01:01:49', '2014-12-19 01:01:49', '1/2/4', 1, 2, 5),
(5, 3, 3, 4, '2014-12-19 01:03:42', '2014-12-19 01:03:42', '1/2/4/5', 1, 3, 0),
(6, 3, 3, 4, '2014-12-19 01:04:33', '2014-12-19 01:04:33', '1/2/4/6', 2, 3, 0),
(7, 3, 3, 4, '2014-12-19 01:05:08', '2014-12-19 01:05:08', '1/2/4/7', 3, 3, 0),
(8, 3, 3, 4, '2014-12-19 01:06:02', '2014-12-19 01:06:02', '1/2/4/8', 4, 3, 0),
(9, 3, 3, 4, '2014-12-19 01:06:53', '2014-12-19 01:06:53', '1/2/4/9', 5, 3, 0),
(10, 3, 3, 2, '2014-12-19 01:07:16', '2014-12-19 01:07:16', '1/2/10', 2, 2, 0),
(11, 3, 3, 2, '2014-12-19 01:11:14', '2014-12-19 01:11:14', '1/2/11', 4, 2, 0),
(12, 3, 3, 2, '2014-12-19 01:11:44', '2014-12-19 01:11:44', '1/2/12', 5, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_category_entity_datetime`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_DTIME_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table' AUTO_INCREMENT=21 ;

--
-- Dumping data for table `catalog_category_entity_datetime`
--

INSERT INTO `catalog_category_entity_datetime` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 57, 0, 3, NULL),
(2, 3, 58, 0, 3, NULL),
(3, 3, 57, 0, 4, NULL),
(4, 3, 58, 0, 4, NULL),
(5, 3, 57, 0, 5, NULL),
(6, 3, 58, 0, 5, NULL),
(7, 3, 57, 0, 6, NULL),
(8, 3, 58, 0, 6, NULL),
(9, 3, 57, 0, 7, NULL),
(10, 3, 58, 0, 7, NULL),
(11, 3, 57, 0, 8, NULL),
(12, 3, 58, 0, 8, NULL),
(13, 3, 57, 0, 9, NULL),
(14, 3, 58, 0, 9, NULL),
(15, 3, 57, 0, 10, NULL),
(16, 3, 58, 0, 10, NULL),
(17, 3, 57, 0, 11, NULL),
(18, 3, 58, 0, 11, NULL),
(19, 3, 57, 0, 12, NULL),
(20, 3, 58, 0, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_category_entity_decimal`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_DEC_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `catalog_category_entity_decimal`
--

INSERT INTO `catalog_category_entity_decimal` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 68, 0, 3, NULL),
(2, 3, 68, 0, 4, NULL),
(3, 3, 68, 0, 5, NULL),
(4, 3, 68, 0, 6, NULL),
(5, 3, 68, 0, 7, NULL),
(6, 3, 68, 0, 8, NULL),
(7, 3, 68, 0, 9, NULL),
(8, 3, 68, 0, 10, NULL),
(9, 3, 68, 0, 11, NULL),
(10, 3, 68, 0, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_int`
--

DROP TABLE IF EXISTS `catalog_category_entity_int`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_INT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table' AUTO_INCREMENT=64 ;

--
-- Dumping data for table `catalog_category_entity_int`
--

INSERT INTO `catalog_category_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 65, 0, 1, 1),
(2, 3, 42, 0, 2, 1),
(3, 3, 65, 0, 2, 1),
(4, 3, 42, 0, 3, 1),
(5, 3, 65, 0, 3, 1),
(6, 3, 49, 0, 3, NULL),
(7, 3, 50, 0, 3, 0),
(8, 3, 66, 0, 3, 0),
(9, 3, 67, 0, 3, 0),
(10, 3, 42, 0, 4, 1),
(11, 3, 65, 0, 4, 1),
(12, 3, 49, 0, 4, NULL),
(13, 3, 50, 0, 4, 0),
(14, 3, 66, 0, 4, 0),
(15, 3, 67, 0, 4, 0),
(16, 3, 42, 0, 5, 1),
(17, 3, 65, 0, 5, 1),
(18, 3, 49, 0, 5, NULL),
(19, 3, 50, 0, 5, 0),
(20, 3, 66, 0, 5, 0),
(21, 3, 67, 0, 5, 0),
(22, 3, 42, 0, 6, 1),
(23, 3, 65, 0, 6, 1),
(24, 3, 49, 0, 6, NULL),
(25, 3, 50, 0, 6, 0),
(26, 3, 66, 0, 6, 0),
(27, 3, 67, 0, 6, 0),
(28, 3, 42, 0, 7, 1),
(29, 3, 65, 0, 7, 1),
(30, 3, 49, 0, 7, NULL),
(31, 3, 50, 0, 7, 0),
(32, 3, 66, 0, 7, 0),
(33, 3, 67, 0, 7, 0),
(34, 3, 42, 0, 8, 1),
(35, 3, 65, 0, 8, 1),
(36, 3, 49, 0, 8, NULL),
(37, 3, 50, 0, 8, 0),
(38, 3, 66, 0, 8, 0),
(39, 3, 67, 0, 8, 0),
(40, 3, 42, 0, 9, 1),
(41, 3, 65, 0, 9, 1),
(42, 3, 49, 0, 9, NULL),
(43, 3, 50, 0, 9, 0),
(44, 3, 66, 0, 9, 0),
(45, 3, 67, 0, 9, 0),
(46, 3, 42, 0, 10, 1),
(47, 3, 65, 0, 10, 1),
(48, 3, 49, 0, 10, NULL),
(49, 3, 50, 0, 10, 0),
(50, 3, 66, 0, 10, 0),
(51, 3, 67, 0, 10, 0),
(52, 3, 42, 0, 11, 1),
(53, 3, 65, 0, 11, 1),
(54, 3, 49, 0, 11, NULL),
(55, 3, 50, 0, 11, 0),
(56, 3, 66, 0, 11, 0),
(57, 3, 67, 0, 11, 0),
(58, 3, 42, 0, 12, 1),
(59, 3, 65, 0, 12, 1),
(60, 3, 49, 0, 12, NULL),
(61, 3, 50, 0, 12, 0),
(62, 3, 66, 0, 12, 0),
(63, 3, 67, 0, 12, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_text`
--

DROP TABLE IF EXISTS `catalog_category_entity_text`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_TEXT_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table' AUTO_INCREMENT=53 ;

--
-- Dumping data for table `catalog_category_entity_text`
--

INSERT INTO `catalog_category_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 63, 0, 1, NULL),
(2, 3, 63, 0, 2, NULL),
(3, 3, 43, 0, 3, NULL),
(4, 3, 46, 0, 3, NULL),
(5, 3, 47, 0, 3, NULL),
(6, 3, 63, 0, 3, NULL),
(7, 3, 60, 0, 3, NULL),
(8, 3, 43, 0, 4, NULL),
(9, 3, 46, 0, 4, NULL),
(10, 3, 47, 0, 4, NULL),
(11, 3, 63, 0, 4, NULL),
(12, 3, 60, 0, 4, NULL),
(13, 3, 43, 0, 5, NULL),
(14, 3, 46, 0, 5, NULL),
(15, 3, 47, 0, 5, NULL),
(16, 3, 63, 0, 5, NULL),
(17, 3, 60, 0, 5, NULL),
(18, 3, 43, 0, 6, NULL),
(19, 3, 46, 0, 6, NULL),
(20, 3, 47, 0, 6, NULL),
(21, 3, 63, 0, 6, NULL),
(22, 3, 60, 0, 6, NULL),
(23, 3, 43, 0, 7, NULL),
(24, 3, 46, 0, 7, NULL),
(25, 3, 47, 0, 7, NULL),
(26, 3, 63, 0, 7, NULL),
(27, 3, 60, 0, 7, NULL),
(28, 3, 43, 0, 8, NULL),
(29, 3, 46, 0, 8, NULL),
(30, 3, 47, 0, 8, NULL),
(31, 3, 63, 0, 8, NULL),
(32, 3, 60, 0, 8, NULL),
(33, 3, 43, 0, 9, NULL),
(34, 3, 46, 0, 9, NULL),
(35, 3, 47, 0, 9, NULL),
(36, 3, 63, 0, 9, NULL),
(37, 3, 60, 0, 9, NULL),
(38, 3, 43, 0, 10, NULL),
(39, 3, 46, 0, 10, NULL),
(40, 3, 47, 0, 10, NULL),
(41, 3, 63, 0, 10, NULL),
(42, 3, 60, 0, 10, NULL),
(43, 3, 43, 0, 11, NULL),
(44, 3, 46, 0, 11, NULL),
(45, 3, 47, 0, 11, NULL),
(46, 3, 63, 0, 11, NULL),
(47, 3, 60, 0, 11, NULL),
(48, 3, 43, 0, 12, NULL),
(49, 3, 46, 0, 12, NULL),
(50, 3, 47, 0, 12, NULL),
(51, 3, 63, 0, 12, NULL),
(52, 3, 60, 0, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_category_entity_varchar`;
CREATE TABLE IF NOT EXISTS `catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_CTGR_ENTT_VCHR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table' AUTO_INCREMENT=92 ;

--
-- Dumping data for table `catalog_category_entity_varchar`
--

INSERT INTO `catalog_category_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 3, 41, 0, 1, 'Root Catalog'),
(2, 3, 41, 0, 2, 'Default Category'),
(3, 3, 48, 0, 2, 'PRODUCTS'),
(4, 3, 41, 0, 3, 'Men'),
(5, 3, 126, 0, 3, 'men'),
(6, 3, 45, 0, 3, NULL),
(7, 3, 48, 0, 3, 'PRODUCTS'),
(8, 3, 56, 0, 3, NULL),
(9, 3, 59, 0, 3, NULL),
(10, 3, 64, 0, 3, NULL),
(11, 3, 127, 0, 3, 'men'),
(13, 3, 41, 0, 4, 'Women'),
(14, 3, 126, 0, 4, 'women'),
(15, 3, 45, 0, 4, NULL),
(16, 3, 48, 0, 4, 'PRODUCTS'),
(17, 3, 56, 0, 4, NULL),
(18, 3, 59, 0, 4, NULL),
(19, 3, 64, 0, 4, NULL),
(20, 3, 127, 0, 4, 'women'),
(21, 3, 41, 0, 5, 'Bags'),
(22, 3, 126, 0, 5, 'bags'),
(23, 3, 45, 0, 5, NULL),
(24, 3, 48, 0, 5, 'PRODUCTS'),
(25, 3, 56, 0, 5, NULL),
(26, 3, 59, 0, 5, NULL),
(27, 3, 64, 0, 5, NULL),
(28, 3, 127, 0, 5, 'women/bags'),
(29, 3, 41, 0, 6, 'Hats'),
(30, 3, 126, 0, 6, 'hats'),
(31, 3, 45, 0, 6, NULL),
(32, 3, 48, 0, 6, 'PRODUCTS'),
(33, 3, 56, 0, 6, NULL),
(34, 3, 59, 0, 6, NULL),
(35, 3, 64, 0, 6, NULL),
(36, 3, 127, 0, 6, 'women/hats'),
(37, 3, 41, 0, 7, 'Earrings'),
(38, 3, 126, 0, 7, 'earrings'),
(39, 3, 45, 0, 7, NULL),
(40, 3, 48, 0, 7, 'PRODUCTS'),
(41, 3, 56, 0, 7, NULL),
(42, 3, 59, 0, 7, NULL),
(43, 3, 64, 0, 7, NULL),
(44, 3, 127, 0, 7, 'women/earrings'),
(45, 3, 41, 0, 8, 'Boots & Shoes'),
(46, 3, 126, 0, 8, 'boots-shoes'),
(47, 3, 45, 0, 8, NULL),
(48, 3, 48, 0, 8, 'PRODUCTS'),
(49, 3, 56, 0, 8, NULL),
(50, 3, 59, 0, 8, NULL),
(51, 3, 64, 0, 8, NULL),
(52, 3, 127, 0, 8, 'women/boots-shoes'),
(53, 3, 41, 0, 9, 'Cosmetics'),
(54, 3, 126, 0, 9, 'cosmetics'),
(55, 3, 45, 0, 9, NULL),
(56, 3, 48, 0, 9, 'PRODUCTS'),
(57, 3, 56, 0, 9, NULL),
(58, 3, 59, 0, 9, NULL),
(59, 3, 64, 0, 9, NULL),
(60, 3, 127, 0, 9, 'women/cosmetics'),
(61, 3, 41, 0, 10, 'Kids'),
(62, 3, 126, 0, 10, 'kids'),
(63, 3, 45, 0, 10, NULL),
(64, 3, 48, 0, 10, 'PRODUCTS'),
(65, 3, 56, 0, 10, NULL),
(66, 3, 59, 0, 10, NULL),
(67, 3, 64, 0, 10, NULL),
(68, 3, 127, 0, 10, 'kids'),
(76, 3, 41, 0, 11, 'New arrivals'),
(77, 3, 126, 0, 11, 'new-arrivals'),
(78, 3, 45, 0, 11, NULL),
(79, 3, 48, 0, 11, 'PRODUCTS'),
(80, 3, 56, 0, 11, NULL),
(81, 3, 59, 0, 11, NULL),
(82, 3, 64, 0, 11, NULL),
(83, 3, 127, 0, 11, 'new-arrivals'),
(84, 3, 41, 0, 12, 'Sale'),
(85, 3, 126, 0, 12, 'sale'),
(86, 3, 45, 0, 12, NULL),
(87, 3, 48, 0, 12, 'PRODUCTS'),
(88, 3, 56, 0, 12, NULL),
(89, 3, 59, 0, 12, NULL),
(90, 3, 64, 0, 12, NULL),
(91, 3, 127, 0, 12, 'sale');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product`
--

DROP TABLE IF EXISTS `catalog_category_product`;
CREATE TABLE IF NOT EXISTS `catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `IDX_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';

--
-- Dumping data for table `catalog_category_product`
--

INSERT INTO `catalog_category_product` (`category_id`, `product_id`, `position`) VALUES
(3, 1, 1),
(3, 2, 1),
(3, 3, 1),
(3, 4, 1),
(3, 5, 1),
(3, 6, 1),
(3, 8, 1),
(3, 10, 1),
(3, 11, 1),
(3, 12, 1),
(3, 13, 1),
(3, 14, 1),
(3, 15, 1),
(3, 20, 1),
(3, 21, 1),
(4, 1, 1),
(4, 2, 1),
(4, 3, 1),
(4, 4, 1),
(4, 5, 1),
(4, 6, 1),
(4, 7, 1),
(4, 10, 1),
(4, 11, 1),
(4, 12, 1),
(4, 13, 1),
(4, 14, 1),
(4, 15, 1),
(4, 20, 1),
(4, 21, 1),
(5, 1, 1),
(5, 2, 1),
(5, 3, 1),
(5, 4, 1),
(5, 5, 1),
(5, 6, 1),
(5, 7, 1),
(5, 8, 1),
(5, 9, 1),
(5, 10, 1),
(5, 11, 1),
(5, 12, 1),
(5, 13, 1),
(5, 14, 1),
(5, 15, 1),
(5, 16, 1),
(5, 18, 1),
(5, 19, 1),
(5, 20, 1),
(5, 21, 1),
(6, 1, 1),
(6, 2, 1),
(6, 3, 1),
(6, 4, 1),
(6, 5, 1),
(6, 6, 1),
(6, 7, 1),
(6, 8, 1),
(6, 9, 1),
(6, 10, 1),
(6, 11, 1),
(6, 12, 1),
(6, 13, 1),
(6, 14, 1),
(6, 15, 1),
(6, 16, 1),
(6, 18, 1),
(6, 19, 1),
(6, 20, 1),
(6, 21, 1),
(7, 1, 1),
(7, 2, 1),
(7, 3, 1),
(7, 4, 1),
(7, 5, 1),
(7, 6, 1),
(7, 7, 1),
(7, 8, 1),
(7, 9, 1),
(7, 10, 1),
(7, 11, 1),
(7, 12, 1),
(7, 13, 1),
(7, 14, 1),
(7, 15, 1),
(7, 16, 1),
(7, 18, 1),
(7, 19, 1),
(7, 20, 1),
(7, 21, 1),
(8, 1, 1),
(8, 2, 1),
(8, 3, 1),
(8, 4, 1),
(8, 5, 1),
(8, 6, 1),
(8, 7, 1),
(8, 8, 1),
(8, 9, 1),
(8, 10, 1),
(8, 11, 1),
(8, 12, 1),
(8, 13, 1),
(8, 14, 1),
(8, 15, 1),
(8, 16, 1),
(8, 18, 1),
(8, 19, 1),
(8, 20, 1),
(8, 21, 1),
(9, 1, 1),
(9, 2, 1),
(9, 3, 1),
(9, 4, 1),
(9, 5, 1),
(9, 6, 1),
(9, 7, 1),
(9, 8, 1),
(9, 9, 1),
(9, 10, 1),
(9, 11, 1),
(9, 12, 1),
(9, 13, 1),
(9, 14, 1),
(9, 15, 1),
(9, 16, 1),
(9, 18, 1),
(9, 19, 1),
(9, 20, 1),
(9, 21, 1),
(10, 1, 1),
(10, 2, 1),
(10, 3, 1),
(10, 4, 1),
(10, 5, 1),
(10, 6, 1),
(10, 7, 1),
(10, 8, 1),
(10, 9, 1),
(10, 10, 1),
(10, 11, 1),
(10, 12, 1),
(10, 13, 1),
(10, 14, 1),
(10, 15, 1),
(10, 16, 1),
(10, 18, 1),
(10, 19, 1),
(10, 20, 1),
(10, 21, 1),
(11, 1, 1),
(11, 2, 1),
(11, 3, 1),
(11, 4, 1),
(11, 5, 1),
(11, 6, 1),
(11, 7, 1),
(11, 8, 1),
(11, 9, 1),
(11, 21, 1),
(12, 1, 1),
(12, 2, 1),
(12, 3, 1),
(12, 4, 1),
(12, 5, 1),
(12, 6, 1),
(12, 7, 1),
(12, 18, 1),
(12, 19, 1),
(12, 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index`
--

DROP TABLE IF EXISTS `catalog_category_product_index`;
CREATE TABLE IF NOT EXISTS `catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `15D3C269665C74C2219037D534F4B0DC` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';

--
-- Dumping data for table `catalog_category_product_index`
--

INSERT INTO `catalog_category_product_index` (`category_id`, `product_id`, `position`, `is_parent`, `store_id`, `visibility`) VALUES
(2, 1, 1, 1, 1, 4),
(2, 2, 1, 1, 1, 4),
(2, 3, 1, 1, 1, 4),
(2, 4, 1, 1, 1, 4),
(2, 5, 1, 1, 1, 4),
(2, 6, 1, 1, 1, 4),
(2, 7, 1, 1, 1, 4),
(2, 8, 1, 1, 1, 4),
(2, 9, 1, 1, 1, 4),
(2, 10, 1, 1, 1, 4),
(2, 11, 1, 1, 1, 4),
(2, 12, 1, 1, 1, 4),
(2, 13, 1, 1, 1, 4),
(2, 14, 1, 1, 1, 4),
(2, 15, 1, 1, 1, 4),
(2, 16, 1, 1, 1, 4),
(2, 18, 1, 1, 1, 4),
(2, 19, 1, 1, 1, 4),
(2, 20, 1, 1, 1, 4),
(2, 21, 1, 1, 1, 4),
(3, 1, 1, 1, 1, 4),
(3, 2, 1, 1, 1, 4),
(3, 3, 1, 1, 1, 4),
(3, 4, 1, 1, 1, 4),
(3, 5, 1, 1, 1, 4),
(3, 6, 1, 1, 1, 4),
(3, 8, 1, 1, 1, 4),
(3, 10, 1, 1, 1, 4),
(3, 11, 1, 1, 1, 4),
(3, 12, 1, 1, 1, 4),
(3, 13, 1, 1, 1, 4),
(3, 14, 1, 1, 1, 4),
(3, 15, 1, 1, 1, 4),
(3, 20, 1, 1, 1, 4),
(3, 21, 1, 1, 1, 4),
(4, 1, 1, 1, 1, 4),
(4, 2, 1, 1, 1, 4),
(4, 3, 1, 1, 1, 4),
(4, 4, 1, 1, 1, 4),
(4, 5, 1, 1, 1, 4),
(4, 6, 1, 1, 1, 4),
(4, 7, 1, 1, 1, 4),
(4, 10, 1, 1, 1, 4),
(4, 11, 1, 1, 1, 4),
(4, 12, 1, 1, 1, 4),
(4, 13, 1, 1, 1, 4),
(4, 14, 1, 1, 1, 4),
(4, 15, 1, 1, 1, 4),
(4, 20, 1, 1, 1, 4),
(4, 21, 1, 1, 1, 4),
(5, 1, 1, 1, 1, 4),
(5, 2, 1, 1, 1, 4),
(5, 3, 1, 1, 1, 4),
(5, 4, 1, 1, 1, 4),
(5, 5, 1, 1, 1, 4),
(5, 6, 1, 1, 1, 4),
(5, 7, 1, 1, 1, 4),
(5, 8, 1, 1, 1, 4),
(5, 9, 1, 1, 1, 4),
(5, 10, 1, 1, 1, 4),
(5, 11, 1, 1, 1, 4),
(5, 12, 1, 1, 1, 4),
(5, 13, 1, 1, 1, 4),
(5, 14, 1, 1, 1, 4),
(5, 15, 1, 1, 1, 4),
(5, 16, 1, 1, 1, 4),
(5, 18, 1, 1, 1, 4),
(5, 19, 1, 1, 1, 4),
(5, 20, 1, 1, 1, 4),
(5, 21, 1, 1, 1, 4),
(6, 1, 1, 1, 1, 4),
(6, 2, 1, 1, 1, 4),
(6, 3, 1, 1, 1, 4),
(6, 4, 1, 1, 1, 4),
(6, 5, 1, 1, 1, 4),
(6, 6, 1, 1, 1, 4),
(6, 7, 1, 1, 1, 4),
(6, 8, 1, 1, 1, 4),
(6, 9, 1, 1, 1, 4),
(6, 10, 1, 1, 1, 4),
(6, 11, 1, 1, 1, 4),
(6, 12, 1, 1, 1, 4),
(6, 13, 1, 1, 1, 4),
(6, 14, 1, 1, 1, 4),
(6, 15, 1, 1, 1, 4),
(6, 16, 1, 1, 1, 4),
(6, 18, 1, 1, 1, 4),
(6, 19, 1, 1, 1, 4),
(6, 20, 1, 1, 1, 4),
(6, 21, 1, 1, 1, 4),
(7, 1, 1, 1, 1, 4),
(7, 2, 1, 1, 1, 4),
(7, 3, 1, 1, 1, 4),
(7, 4, 1, 1, 1, 4),
(7, 5, 1, 1, 1, 4),
(7, 6, 1, 1, 1, 4),
(7, 7, 1, 1, 1, 4),
(7, 8, 1, 1, 1, 4),
(7, 9, 1, 1, 1, 4),
(7, 10, 1, 1, 1, 4),
(7, 11, 1, 1, 1, 4),
(7, 12, 1, 1, 1, 4),
(7, 13, 1, 1, 1, 4),
(7, 14, 1, 1, 1, 4),
(7, 15, 1, 1, 1, 4),
(7, 16, 1, 1, 1, 4),
(7, 18, 1, 1, 1, 4),
(7, 19, 1, 1, 1, 4),
(7, 20, 1, 1, 1, 4),
(7, 21, 1, 1, 1, 4),
(8, 1, 1, 1, 1, 4),
(8, 2, 1, 1, 1, 4),
(8, 3, 1, 1, 1, 4),
(8, 4, 1, 1, 1, 4),
(8, 5, 1, 1, 1, 4),
(8, 6, 1, 1, 1, 4),
(8, 7, 1, 1, 1, 4),
(8, 8, 1, 1, 1, 4),
(8, 9, 1, 1, 1, 4),
(8, 10, 1, 1, 1, 4),
(8, 11, 1, 1, 1, 4),
(8, 12, 1, 1, 1, 4),
(8, 13, 1, 1, 1, 4),
(8, 14, 1, 1, 1, 4),
(8, 15, 1, 1, 1, 4),
(8, 16, 1, 1, 1, 4),
(8, 18, 1, 1, 1, 4),
(8, 19, 1, 1, 1, 4),
(8, 20, 1, 1, 1, 4),
(8, 21, 1, 1, 1, 4),
(9, 1, 1, 1, 1, 4),
(9, 2, 1, 1, 1, 4),
(9, 3, 1, 1, 1, 4),
(9, 4, 1, 1, 1, 4),
(9, 5, 1, 1, 1, 4),
(9, 6, 1, 1, 1, 4),
(9, 7, 1, 1, 1, 4),
(9, 8, 1, 1, 1, 4),
(9, 9, 1, 1, 1, 4),
(9, 10, 1, 1, 1, 4),
(9, 11, 1, 1, 1, 4),
(9, 12, 1, 1, 1, 4),
(9, 13, 1, 1, 1, 4),
(9, 14, 1, 1, 1, 4),
(9, 15, 1, 1, 1, 4),
(9, 16, 1, 1, 1, 4),
(9, 18, 1, 1, 1, 4),
(9, 19, 1, 1, 1, 4),
(9, 20, 1, 1, 1, 4),
(9, 21, 1, 1, 1, 4),
(10, 1, 1, 1, 1, 4),
(10, 2, 1, 1, 1, 4),
(10, 3, 1, 1, 1, 4),
(10, 4, 1, 1, 1, 4),
(10, 5, 1, 1, 1, 4),
(10, 6, 1, 1, 1, 4),
(10, 7, 1, 1, 1, 4),
(10, 8, 1, 1, 1, 4),
(10, 9, 1, 1, 1, 4),
(10, 10, 1, 1, 1, 4),
(10, 11, 1, 1, 1, 4),
(10, 12, 1, 1, 1, 4),
(10, 13, 1, 1, 1, 4),
(10, 14, 1, 1, 1, 4),
(10, 15, 1, 1, 1, 4),
(10, 16, 1, 1, 1, 4),
(10, 18, 1, 1, 1, 4),
(10, 19, 1, 1, 1, 4),
(10, 20, 1, 1, 1, 4),
(10, 21, 1, 1, 1, 4),
(11, 1, 1, 1, 1, 4),
(11, 2, 1, 1, 1, 4),
(11, 3, 1, 1, 1, 4),
(11, 4, 1, 1, 1, 4),
(11, 5, 1, 1, 1, 4),
(11, 6, 1, 1, 1, 4),
(11, 7, 1, 1, 1, 4),
(11, 8, 1, 1, 1, 4),
(11, 9, 1, 1, 1, 4),
(11, 21, 1, 1, 1, 4),
(12, 1, 1, 1, 1, 4),
(12, 2, 1, 1, 1, 4),
(12, 3, 1, 1, 1, 4),
(12, 4, 1, 1, 1, 4),
(12, 5, 1, 1, 1, 4),
(12, 6, 1, 1, 1, 4),
(12, 7, 1, 1, 1, 4),
(12, 18, 1, 1, 1, 4),
(12, 19, 1, 1, 1, 4),
(12, 21, 1, 1, 1, 4),
(2, 1, 1, 1, 2, 4),
(2, 2, 1, 1, 2, 4),
(2, 3, 1, 1, 2, 4),
(2, 4, 1, 1, 2, 4),
(2, 5, 1, 1, 2, 4),
(2, 6, 1, 1, 2, 4),
(2, 7, 1, 1, 2, 4),
(2, 8, 1, 1, 2, 4),
(2, 9, 1, 1, 2, 4),
(2, 10, 1, 1, 2, 4),
(2, 11, 1, 1, 2, 4),
(2, 12, 1, 1, 2, 4),
(2, 13, 1, 1, 2, 4),
(2, 14, 1, 1, 2, 4),
(2, 15, 1, 1, 2, 4),
(2, 16, 1, 1, 2, 4),
(2, 18, 1, 1, 2, 4),
(2, 19, 1, 1, 2, 4),
(2, 20, 1, 1, 2, 4),
(2, 21, 1, 1, 2, 4),
(3, 1, 1, 1, 2, 4),
(3, 2, 1, 1, 2, 4),
(3, 3, 1, 1, 2, 4),
(3, 4, 1, 1, 2, 4),
(3, 5, 1, 1, 2, 4),
(3, 6, 1, 1, 2, 4),
(3, 8, 1, 1, 2, 4),
(3, 10, 1, 1, 2, 4),
(3, 11, 1, 1, 2, 4),
(3, 12, 1, 1, 2, 4),
(3, 13, 1, 1, 2, 4),
(3, 14, 1, 1, 2, 4),
(3, 15, 1, 1, 2, 4),
(3, 20, 1, 1, 2, 4),
(3, 21, 1, 1, 2, 4),
(4, 1, 1, 1, 2, 4),
(4, 2, 1, 1, 2, 4),
(4, 3, 1, 1, 2, 4),
(4, 4, 1, 1, 2, 4),
(4, 5, 1, 1, 2, 4),
(4, 6, 1, 1, 2, 4),
(4, 7, 1, 1, 2, 4),
(4, 10, 1, 1, 2, 4),
(4, 11, 1, 1, 2, 4),
(4, 12, 1, 1, 2, 4),
(4, 13, 1, 1, 2, 4),
(4, 14, 1, 1, 2, 4),
(4, 15, 1, 1, 2, 4),
(4, 20, 1, 1, 2, 4),
(4, 21, 1, 1, 2, 4),
(5, 1, 1, 1, 2, 4),
(5, 2, 1, 1, 2, 4),
(5, 3, 1, 1, 2, 4),
(5, 4, 1, 1, 2, 4),
(5, 5, 1, 1, 2, 4),
(5, 6, 1, 1, 2, 4),
(5, 7, 1, 1, 2, 4),
(5, 8, 1, 1, 2, 4),
(5, 9, 1, 1, 2, 4),
(5, 10, 1, 1, 2, 4),
(5, 11, 1, 1, 2, 4),
(5, 12, 1, 1, 2, 4),
(5, 13, 1, 1, 2, 4),
(5, 14, 1, 1, 2, 4),
(5, 15, 1, 1, 2, 4),
(5, 16, 1, 1, 2, 4),
(5, 18, 1, 1, 2, 4),
(5, 19, 1, 1, 2, 4),
(5, 20, 1, 1, 2, 4),
(5, 21, 1, 1, 2, 4),
(6, 1, 1, 1, 2, 4),
(6, 2, 1, 1, 2, 4),
(6, 3, 1, 1, 2, 4),
(6, 4, 1, 1, 2, 4),
(6, 5, 1, 1, 2, 4),
(6, 6, 1, 1, 2, 4),
(6, 7, 1, 1, 2, 4),
(6, 8, 1, 1, 2, 4),
(6, 9, 1, 1, 2, 4),
(6, 10, 1, 1, 2, 4),
(6, 11, 1, 1, 2, 4),
(6, 12, 1, 1, 2, 4),
(6, 13, 1, 1, 2, 4),
(6, 14, 1, 1, 2, 4),
(6, 15, 1, 1, 2, 4),
(6, 16, 1, 1, 2, 4),
(6, 18, 1, 1, 2, 4),
(6, 19, 1, 1, 2, 4),
(6, 20, 1, 1, 2, 4),
(6, 21, 1, 1, 2, 4),
(7, 1, 1, 1, 2, 4),
(7, 2, 1, 1, 2, 4),
(7, 3, 1, 1, 2, 4),
(7, 4, 1, 1, 2, 4),
(7, 5, 1, 1, 2, 4),
(7, 6, 1, 1, 2, 4),
(7, 7, 1, 1, 2, 4),
(7, 8, 1, 1, 2, 4),
(7, 9, 1, 1, 2, 4),
(7, 10, 1, 1, 2, 4),
(7, 11, 1, 1, 2, 4),
(7, 12, 1, 1, 2, 4),
(7, 13, 1, 1, 2, 4),
(7, 14, 1, 1, 2, 4),
(7, 15, 1, 1, 2, 4),
(7, 16, 1, 1, 2, 4),
(7, 18, 1, 1, 2, 4),
(7, 19, 1, 1, 2, 4),
(7, 20, 1, 1, 2, 4),
(7, 21, 1, 1, 2, 4),
(8, 1, 1, 1, 2, 4),
(8, 2, 1, 1, 2, 4),
(8, 3, 1, 1, 2, 4),
(8, 4, 1, 1, 2, 4),
(8, 5, 1, 1, 2, 4),
(8, 6, 1, 1, 2, 4),
(8, 7, 1, 1, 2, 4),
(8, 8, 1, 1, 2, 4),
(8, 9, 1, 1, 2, 4),
(8, 10, 1, 1, 2, 4),
(8, 11, 1, 1, 2, 4),
(8, 12, 1, 1, 2, 4),
(8, 13, 1, 1, 2, 4),
(8, 14, 1, 1, 2, 4),
(8, 15, 1, 1, 2, 4),
(8, 16, 1, 1, 2, 4),
(8, 18, 1, 1, 2, 4),
(8, 19, 1, 1, 2, 4),
(8, 20, 1, 1, 2, 4),
(8, 21, 1, 1, 2, 4),
(9, 1, 1, 1, 2, 4),
(9, 2, 1, 1, 2, 4),
(9, 3, 1, 1, 2, 4),
(9, 4, 1, 1, 2, 4),
(9, 5, 1, 1, 2, 4),
(9, 6, 1, 1, 2, 4),
(9, 7, 1, 1, 2, 4),
(9, 8, 1, 1, 2, 4),
(9, 9, 1, 1, 2, 4),
(9, 10, 1, 1, 2, 4),
(9, 11, 1, 1, 2, 4),
(9, 12, 1, 1, 2, 4),
(9, 13, 1, 1, 2, 4),
(9, 14, 1, 1, 2, 4),
(9, 15, 1, 1, 2, 4),
(9, 16, 1, 1, 2, 4),
(9, 18, 1, 1, 2, 4),
(9, 19, 1, 1, 2, 4),
(9, 20, 1, 1, 2, 4),
(9, 21, 1, 1, 2, 4),
(10, 1, 1, 1, 2, 4),
(10, 2, 1, 1, 2, 4),
(10, 3, 1, 1, 2, 4),
(10, 4, 1, 1, 2, 4),
(10, 5, 1, 1, 2, 4),
(10, 6, 1, 1, 2, 4),
(10, 7, 1, 1, 2, 4),
(10, 8, 1, 1, 2, 4),
(10, 9, 1, 1, 2, 4),
(10, 10, 1, 1, 2, 4),
(10, 11, 1, 1, 2, 4),
(10, 12, 1, 1, 2, 4),
(10, 13, 1, 1, 2, 4),
(10, 14, 1, 1, 2, 4),
(10, 15, 1, 1, 2, 4),
(10, 16, 1, 1, 2, 4),
(10, 18, 1, 1, 2, 4),
(10, 19, 1, 1, 2, 4),
(10, 20, 1, 1, 2, 4),
(10, 21, 1, 1, 2, 4),
(11, 1, 1, 1, 2, 4),
(11, 2, 1, 1, 2, 4),
(11, 3, 1, 1, 2, 4),
(11, 4, 1, 1, 2, 4),
(11, 5, 1, 1, 2, 4),
(11, 6, 1, 1, 2, 4),
(11, 7, 1, 1, 2, 4),
(11, 8, 1, 1, 2, 4),
(11, 9, 1, 1, 2, 4),
(11, 21, 1, 1, 2, 4),
(12, 1, 1, 1, 2, 4),
(12, 2, 1, 1, 2, 4),
(12, 3, 1, 1, 2, 4),
(12, 4, 1, 1, 2, 4),
(12, 5, 1, 1, 2, 4),
(12, 6, 1, 1, 2, 4),
(12, 7, 1, 1, 2, 4),
(12, 18, 1, 1, 2, 4),
(12, 19, 1, 1, 2, 4),
(12, 21, 1, 1, 2, 4),
(2, 1, 1, 1, 3, 4),
(2, 2, 1, 1, 3, 4),
(2, 3, 1, 1, 3, 4),
(2, 4, 1, 1, 3, 4),
(2, 5, 1, 1, 3, 4),
(2, 6, 1, 1, 3, 4),
(2, 7, 1, 1, 3, 4),
(2, 8, 1, 1, 3, 4),
(2, 9, 1, 1, 3, 4),
(2, 10, 1, 1, 3, 4),
(2, 11, 1, 1, 3, 4),
(2, 12, 1, 1, 3, 4),
(2, 13, 1, 1, 3, 4),
(2, 14, 1, 1, 3, 4),
(2, 15, 1, 1, 3, 4),
(2, 16, 1, 1, 3, 4),
(2, 18, 1, 1, 3, 4),
(2, 19, 1, 1, 3, 4),
(2, 20, 1, 1, 3, 4),
(2, 21, 1, 1, 3, 4),
(3, 1, 1, 1, 3, 4),
(3, 2, 1, 1, 3, 4),
(3, 3, 1, 1, 3, 4),
(3, 4, 1, 1, 3, 4),
(3, 5, 1, 1, 3, 4),
(3, 6, 1, 1, 3, 4),
(3, 8, 1, 1, 3, 4),
(3, 10, 1, 1, 3, 4),
(3, 11, 1, 1, 3, 4),
(3, 12, 1, 1, 3, 4),
(3, 13, 1, 1, 3, 4),
(3, 14, 1, 1, 3, 4),
(3, 15, 1, 1, 3, 4),
(3, 20, 1, 1, 3, 4),
(3, 21, 1, 1, 3, 4),
(4, 1, 1, 1, 3, 4),
(4, 2, 1, 1, 3, 4),
(4, 3, 1, 1, 3, 4),
(4, 4, 1, 1, 3, 4),
(4, 5, 1, 1, 3, 4),
(4, 6, 1, 1, 3, 4),
(4, 7, 1, 1, 3, 4),
(4, 10, 1, 1, 3, 4),
(4, 11, 1, 1, 3, 4),
(4, 12, 1, 1, 3, 4),
(4, 13, 1, 1, 3, 4),
(4, 14, 1, 1, 3, 4),
(4, 15, 1, 1, 3, 4),
(4, 20, 1, 1, 3, 4),
(4, 21, 1, 1, 3, 4),
(5, 1, 1, 1, 3, 4),
(5, 2, 1, 1, 3, 4),
(5, 3, 1, 1, 3, 4),
(5, 4, 1, 1, 3, 4),
(5, 5, 1, 1, 3, 4),
(5, 6, 1, 1, 3, 4),
(5, 7, 1, 1, 3, 4),
(5, 8, 1, 1, 3, 4),
(5, 9, 1, 1, 3, 4),
(5, 10, 1, 1, 3, 4),
(5, 11, 1, 1, 3, 4),
(5, 12, 1, 1, 3, 4),
(5, 13, 1, 1, 3, 4),
(5, 14, 1, 1, 3, 4),
(5, 15, 1, 1, 3, 4),
(5, 16, 1, 1, 3, 4),
(5, 18, 1, 1, 3, 4),
(5, 19, 1, 1, 3, 4),
(5, 20, 1, 1, 3, 4),
(5, 21, 1, 1, 3, 4),
(6, 1, 1, 1, 3, 4),
(6, 2, 1, 1, 3, 4),
(6, 3, 1, 1, 3, 4),
(6, 4, 1, 1, 3, 4),
(6, 5, 1, 1, 3, 4),
(6, 6, 1, 1, 3, 4),
(6, 7, 1, 1, 3, 4),
(6, 8, 1, 1, 3, 4),
(6, 9, 1, 1, 3, 4),
(6, 10, 1, 1, 3, 4),
(6, 11, 1, 1, 3, 4),
(6, 12, 1, 1, 3, 4),
(6, 13, 1, 1, 3, 4),
(6, 14, 1, 1, 3, 4),
(6, 15, 1, 1, 3, 4),
(6, 16, 1, 1, 3, 4),
(6, 18, 1, 1, 3, 4),
(6, 19, 1, 1, 3, 4),
(6, 20, 1, 1, 3, 4),
(6, 21, 1, 1, 3, 4),
(7, 1, 1, 1, 3, 4),
(7, 2, 1, 1, 3, 4),
(7, 3, 1, 1, 3, 4),
(7, 4, 1, 1, 3, 4),
(7, 5, 1, 1, 3, 4),
(7, 6, 1, 1, 3, 4),
(7, 7, 1, 1, 3, 4),
(7, 8, 1, 1, 3, 4),
(7, 9, 1, 1, 3, 4),
(7, 10, 1, 1, 3, 4),
(7, 11, 1, 1, 3, 4),
(7, 12, 1, 1, 3, 4),
(7, 13, 1, 1, 3, 4),
(7, 14, 1, 1, 3, 4),
(7, 15, 1, 1, 3, 4),
(7, 16, 1, 1, 3, 4),
(7, 18, 1, 1, 3, 4),
(7, 19, 1, 1, 3, 4),
(7, 20, 1, 1, 3, 4),
(7, 21, 1, 1, 3, 4),
(8, 1, 1, 1, 3, 4),
(8, 2, 1, 1, 3, 4),
(8, 3, 1, 1, 3, 4),
(8, 4, 1, 1, 3, 4),
(8, 5, 1, 1, 3, 4),
(8, 6, 1, 1, 3, 4),
(8, 7, 1, 1, 3, 4),
(8, 8, 1, 1, 3, 4),
(8, 9, 1, 1, 3, 4),
(8, 10, 1, 1, 3, 4),
(8, 11, 1, 1, 3, 4),
(8, 12, 1, 1, 3, 4),
(8, 13, 1, 1, 3, 4),
(8, 14, 1, 1, 3, 4),
(8, 15, 1, 1, 3, 4),
(8, 16, 1, 1, 3, 4),
(8, 18, 1, 1, 3, 4),
(8, 19, 1, 1, 3, 4),
(8, 20, 1, 1, 3, 4),
(8, 21, 1, 1, 3, 4),
(9, 1, 1, 1, 3, 4),
(9, 2, 1, 1, 3, 4),
(9, 3, 1, 1, 3, 4),
(9, 4, 1, 1, 3, 4),
(9, 5, 1, 1, 3, 4),
(9, 6, 1, 1, 3, 4),
(9, 7, 1, 1, 3, 4),
(9, 8, 1, 1, 3, 4),
(9, 9, 1, 1, 3, 4),
(9, 10, 1, 1, 3, 4),
(9, 11, 1, 1, 3, 4),
(9, 12, 1, 1, 3, 4),
(9, 13, 1, 1, 3, 4),
(9, 14, 1, 1, 3, 4),
(9, 15, 1, 1, 3, 4),
(9, 16, 1, 1, 3, 4),
(9, 18, 1, 1, 3, 4),
(9, 19, 1, 1, 3, 4),
(9, 20, 1, 1, 3, 4),
(9, 21, 1, 1, 3, 4),
(10, 1, 1, 1, 3, 4),
(10, 2, 1, 1, 3, 4),
(10, 3, 1, 1, 3, 4),
(10, 4, 1, 1, 3, 4),
(10, 5, 1, 1, 3, 4),
(10, 6, 1, 1, 3, 4),
(10, 7, 1, 1, 3, 4),
(10, 8, 1, 1, 3, 4),
(10, 9, 1, 1, 3, 4),
(10, 10, 1, 1, 3, 4),
(10, 11, 1, 1, 3, 4),
(10, 12, 1, 1, 3, 4),
(10, 13, 1, 1, 3, 4),
(10, 14, 1, 1, 3, 4),
(10, 15, 1, 1, 3, 4),
(10, 16, 1, 1, 3, 4),
(10, 18, 1, 1, 3, 4),
(10, 19, 1, 1, 3, 4),
(10, 20, 1, 1, 3, 4),
(10, 21, 1, 1, 3, 4),
(11, 1, 1, 1, 3, 4),
(11, 2, 1, 1, 3, 4),
(11, 3, 1, 1, 3, 4),
(11, 4, 1, 1, 3, 4),
(11, 5, 1, 1, 3, 4),
(11, 6, 1, 1, 3, 4),
(11, 7, 1, 1, 3, 4),
(11, 8, 1, 1, 3, 4),
(11, 9, 1, 1, 3, 4),
(11, 21, 1, 1, 3, 4),
(12, 1, 1, 1, 3, 4),
(12, 2, 1, 1, 3, 4),
(12, 3, 1, 1, 3, 4),
(12, 4, 1, 1, 3, 4),
(12, 5, 1, 1, 3, 4),
(12, 6, 1, 1, 3, 4),
(12, 7, 1, 1, 3, 4),
(12, 18, 1, 1, 3, 4),
(12, 19, 1, 1, 3, 4),
(12, 21, 1, 1, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `catalog_category_product_index_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  KEY `IDX_CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Temp Table';

--
-- Dumping data for table `catalog_category_product_index_tmp`
--

INSERT INTO `catalog_category_product_index_tmp` (`category_id`, `product_id`, `position`, `is_parent`, `store_id`, `visibility`) VALUES
(2, 1, 1, 1, 1, 4),
(2, 2, 1, 1, 1, 4),
(2, 3, 1, 1, 1, 4),
(2, 4, 1, 1, 1, 4),
(2, 5, 1, 1, 1, 4),
(2, 6, 1, 1, 1, 4),
(2, 7, 1, 1, 1, 4),
(2, 8, 1, 1, 1, 4),
(2, 9, 1, 1, 1, 4),
(2, 10, 1, 1, 1, 4),
(2, 11, 1, 1, 1, 4),
(2, 12, 1, 1, 1, 4),
(2, 13, 1, 1, 1, 4),
(2, 14, 1, 1, 1, 4),
(2, 15, 1, 1, 1, 4),
(2, 16, 1, 1, 1, 4),
(2, 18, 1, 1, 1, 4),
(2, 19, 1, 1, 1, 4),
(2, 20, 1, 1, 1, 4),
(3, 1, 1, 1, 1, 4),
(4, 1, 1, 1, 1, 4),
(5, 1, 1, 1, 1, 4),
(6, 1, 1, 1, 1, 4),
(7, 1, 1, 1, 1, 4),
(8, 1, 1, 1, 1, 4),
(9, 1, 1, 1, 1, 4),
(10, 1, 1, 1, 1, 4),
(11, 1, 1, 1, 1, 4),
(12, 1, 1, 1, 1, 4),
(3, 2, 1, 1, 1, 4),
(4, 2, 1, 1, 1, 4),
(5, 2, 1, 1, 1, 4),
(6, 2, 1, 1, 1, 4),
(7, 2, 1, 1, 1, 4),
(8, 2, 1, 1, 1, 4),
(9, 2, 1, 1, 1, 4),
(10, 2, 1, 1, 1, 4),
(11, 2, 1, 1, 1, 4),
(12, 2, 1, 1, 1, 4),
(3, 3, 1, 1, 1, 4),
(4, 3, 1, 1, 1, 4),
(5, 3, 1, 1, 1, 4),
(6, 3, 1, 1, 1, 4),
(7, 3, 1, 1, 1, 4),
(8, 3, 1, 1, 1, 4),
(9, 3, 1, 1, 1, 4),
(10, 3, 1, 1, 1, 4),
(11, 3, 1, 1, 1, 4),
(12, 3, 1, 1, 1, 4),
(3, 4, 1, 1, 1, 4),
(4, 4, 1, 1, 1, 4),
(5, 4, 1, 1, 1, 4),
(6, 4, 1, 1, 1, 4),
(7, 4, 1, 1, 1, 4),
(8, 4, 1, 1, 1, 4),
(9, 4, 1, 1, 1, 4),
(10, 4, 1, 1, 1, 4),
(11, 4, 1, 1, 1, 4),
(12, 4, 1, 1, 1, 4),
(3, 5, 1, 1, 1, 4),
(4, 5, 1, 1, 1, 4),
(5, 5, 1, 1, 1, 4),
(6, 5, 1, 1, 1, 4),
(7, 5, 1, 1, 1, 4),
(8, 5, 1, 1, 1, 4),
(9, 5, 1, 1, 1, 4),
(10, 5, 1, 1, 1, 4),
(11, 5, 1, 1, 1, 4),
(12, 5, 1, 1, 1, 4),
(3, 6, 1, 1, 1, 4),
(4, 6, 1, 1, 1, 4),
(5, 6, 1, 1, 1, 4),
(6, 6, 1, 1, 1, 4),
(7, 6, 1, 1, 1, 4),
(8, 6, 1, 1, 1, 4),
(9, 6, 1, 1, 1, 4),
(10, 6, 1, 1, 1, 4),
(11, 6, 1, 1, 1, 4),
(12, 6, 1, 1, 1, 4),
(4, 7, 1, 1, 1, 4),
(5, 7, 1, 1, 1, 4),
(6, 7, 1, 1, 1, 4),
(7, 7, 1, 1, 1, 4),
(8, 7, 1, 1, 1, 4),
(9, 7, 1, 1, 1, 4),
(10, 7, 1, 1, 1, 4),
(11, 7, 1, 1, 1, 4),
(12, 7, 1, 1, 1, 4),
(3, 8, 1, 1, 1, 4),
(5, 8, 1, 1, 1, 4),
(6, 8, 1, 1, 1, 4),
(7, 8, 1, 1, 1, 4),
(8, 8, 1, 1, 1, 4),
(9, 8, 1, 1, 1, 4),
(10, 8, 1, 1, 1, 4),
(11, 8, 1, 1, 1, 4),
(5, 9, 1, 1, 1, 4),
(6, 9, 1, 1, 1, 4),
(7, 9, 1, 1, 1, 4),
(8, 9, 1, 1, 1, 4),
(9, 9, 1, 1, 1, 4),
(10, 9, 1, 1, 1, 4),
(11, 9, 1, 1, 1, 4),
(3, 10, 1, 1, 1, 4),
(4, 10, 1, 1, 1, 4),
(5, 10, 1, 1, 1, 4),
(6, 10, 1, 1, 1, 4),
(7, 10, 1, 1, 1, 4),
(8, 10, 1, 1, 1, 4),
(9, 10, 1, 1, 1, 4),
(10, 10, 1, 1, 1, 4),
(3, 11, 1, 1, 1, 4),
(4, 11, 1, 1, 1, 4),
(5, 11, 1, 1, 1, 4),
(6, 11, 1, 1, 1, 4),
(7, 11, 1, 1, 1, 4),
(8, 11, 1, 1, 1, 4),
(9, 11, 1, 1, 1, 4),
(10, 11, 1, 1, 1, 4),
(3, 12, 1, 1, 1, 4),
(4, 12, 1, 1, 1, 4),
(5, 12, 1, 1, 1, 4),
(6, 12, 1, 1, 1, 4),
(7, 12, 1, 1, 1, 4),
(8, 12, 1, 1, 1, 4),
(9, 12, 1, 1, 1, 4),
(10, 12, 1, 1, 1, 4),
(3, 13, 1, 1, 1, 4),
(4, 13, 1, 1, 1, 4),
(5, 13, 1, 1, 1, 4),
(6, 13, 1, 1, 1, 4),
(7, 13, 1, 1, 1, 4),
(8, 13, 1, 1, 1, 4),
(9, 13, 1, 1, 1, 4),
(10, 13, 1, 1, 1, 4),
(3, 14, 1, 1, 1, 4),
(4, 14, 1, 1, 1, 4),
(5, 14, 1, 1, 1, 4),
(6, 14, 1, 1, 1, 4),
(7, 14, 1, 1, 1, 4),
(8, 14, 1, 1, 1, 4),
(9, 14, 1, 1, 1, 4),
(10, 14, 1, 1, 1, 4),
(3, 15, 1, 1, 1, 4),
(4, 15, 1, 1, 1, 4),
(5, 15, 1, 1, 1, 4),
(6, 15, 1, 1, 1, 4),
(7, 15, 1, 1, 1, 4),
(8, 15, 1, 1, 1, 4),
(9, 15, 1, 1, 1, 4),
(10, 15, 1, 1, 1, 4),
(5, 16, 1, 1, 1, 4),
(6, 16, 1, 1, 1, 4),
(7, 16, 1, 1, 1, 4),
(8, 16, 1, 1, 1, 4),
(9, 16, 1, 1, 1, 4),
(10, 16, 1, 1, 1, 4),
(5, 18, 1, 1, 1, 4),
(6, 18, 1, 1, 1, 4),
(7, 18, 1, 1, 1, 4),
(8, 18, 1, 1, 1, 4),
(9, 18, 1, 1, 1, 4),
(10, 18, 1, 1, 1, 4),
(12, 18, 1, 1, 1, 4),
(5, 19, 1, 1, 1, 4),
(6, 19, 1, 1, 1, 4),
(7, 19, 1, 1, 1, 4),
(8, 19, 1, 1, 1, 4),
(9, 19, 1, 1, 1, 4),
(10, 19, 1, 1, 1, 4),
(12, 19, 1, 1, 1, 4),
(3, 20, 1, 1, 1, 4),
(4, 20, 1, 1, 1, 4),
(5, 20, 1, 1, 1, 4),
(6, 20, 1, 1, 1, 4),
(7, 20, 1, 1, 1, 4),
(8, 20, 1, 1, 1, 4),
(9, 20, 1, 1, 1, 4),
(10, 20, 1, 1, 1, 4),
(2, 1, 1, 1, 2, 4),
(2, 2, 1, 1, 2, 4),
(2, 3, 1, 1, 2, 4),
(2, 4, 1, 1, 2, 4),
(2, 5, 1, 1, 2, 4),
(2, 6, 1, 1, 2, 4),
(2, 7, 1, 1, 2, 4),
(2, 8, 1, 1, 2, 4),
(2, 9, 1, 1, 2, 4),
(2, 10, 1, 1, 2, 4),
(2, 11, 1, 1, 2, 4),
(2, 12, 1, 1, 2, 4),
(2, 13, 1, 1, 2, 4),
(2, 14, 1, 1, 2, 4),
(2, 15, 1, 1, 2, 4),
(2, 16, 1, 1, 2, 4),
(2, 18, 1, 1, 2, 4),
(2, 19, 1, 1, 2, 4),
(2, 20, 1, 1, 2, 4),
(3, 1, 1, 1, 2, 4),
(4, 1, 1, 1, 2, 4),
(5, 1, 1, 1, 2, 4),
(6, 1, 1, 1, 2, 4),
(7, 1, 1, 1, 2, 4),
(8, 1, 1, 1, 2, 4),
(9, 1, 1, 1, 2, 4),
(10, 1, 1, 1, 2, 4),
(11, 1, 1, 1, 2, 4),
(12, 1, 1, 1, 2, 4),
(3, 2, 1, 1, 2, 4),
(4, 2, 1, 1, 2, 4),
(5, 2, 1, 1, 2, 4),
(6, 2, 1, 1, 2, 4),
(7, 2, 1, 1, 2, 4),
(8, 2, 1, 1, 2, 4),
(9, 2, 1, 1, 2, 4),
(10, 2, 1, 1, 2, 4),
(11, 2, 1, 1, 2, 4),
(12, 2, 1, 1, 2, 4),
(3, 3, 1, 1, 2, 4),
(4, 3, 1, 1, 2, 4),
(5, 3, 1, 1, 2, 4),
(6, 3, 1, 1, 2, 4),
(7, 3, 1, 1, 2, 4),
(8, 3, 1, 1, 2, 4),
(9, 3, 1, 1, 2, 4),
(10, 3, 1, 1, 2, 4),
(11, 3, 1, 1, 2, 4),
(12, 3, 1, 1, 2, 4),
(3, 4, 1, 1, 2, 4),
(4, 4, 1, 1, 2, 4),
(5, 4, 1, 1, 2, 4),
(6, 4, 1, 1, 2, 4),
(7, 4, 1, 1, 2, 4),
(8, 4, 1, 1, 2, 4),
(9, 4, 1, 1, 2, 4),
(10, 4, 1, 1, 2, 4),
(11, 4, 1, 1, 2, 4),
(12, 4, 1, 1, 2, 4),
(3, 5, 1, 1, 2, 4),
(4, 5, 1, 1, 2, 4),
(5, 5, 1, 1, 2, 4),
(6, 5, 1, 1, 2, 4),
(7, 5, 1, 1, 2, 4),
(8, 5, 1, 1, 2, 4),
(9, 5, 1, 1, 2, 4),
(10, 5, 1, 1, 2, 4),
(11, 5, 1, 1, 2, 4),
(12, 5, 1, 1, 2, 4),
(3, 6, 1, 1, 2, 4),
(4, 6, 1, 1, 2, 4),
(5, 6, 1, 1, 2, 4),
(6, 6, 1, 1, 2, 4),
(7, 6, 1, 1, 2, 4),
(8, 6, 1, 1, 2, 4),
(9, 6, 1, 1, 2, 4),
(10, 6, 1, 1, 2, 4),
(11, 6, 1, 1, 2, 4),
(12, 6, 1, 1, 2, 4),
(4, 7, 1, 1, 2, 4),
(5, 7, 1, 1, 2, 4),
(6, 7, 1, 1, 2, 4),
(7, 7, 1, 1, 2, 4),
(8, 7, 1, 1, 2, 4),
(9, 7, 1, 1, 2, 4),
(10, 7, 1, 1, 2, 4),
(11, 7, 1, 1, 2, 4),
(12, 7, 1, 1, 2, 4),
(3, 8, 1, 1, 2, 4),
(5, 8, 1, 1, 2, 4),
(6, 8, 1, 1, 2, 4),
(7, 8, 1, 1, 2, 4),
(8, 8, 1, 1, 2, 4),
(9, 8, 1, 1, 2, 4),
(10, 8, 1, 1, 2, 4),
(11, 8, 1, 1, 2, 4),
(5, 9, 1, 1, 2, 4),
(6, 9, 1, 1, 2, 4),
(7, 9, 1, 1, 2, 4),
(8, 9, 1, 1, 2, 4),
(9, 9, 1, 1, 2, 4),
(10, 9, 1, 1, 2, 4),
(11, 9, 1, 1, 2, 4),
(3, 10, 1, 1, 2, 4),
(4, 10, 1, 1, 2, 4),
(5, 10, 1, 1, 2, 4),
(6, 10, 1, 1, 2, 4),
(7, 10, 1, 1, 2, 4),
(8, 10, 1, 1, 2, 4),
(9, 10, 1, 1, 2, 4),
(10, 10, 1, 1, 2, 4),
(3, 11, 1, 1, 2, 4),
(4, 11, 1, 1, 2, 4),
(5, 11, 1, 1, 2, 4),
(6, 11, 1, 1, 2, 4),
(7, 11, 1, 1, 2, 4),
(8, 11, 1, 1, 2, 4),
(9, 11, 1, 1, 2, 4),
(10, 11, 1, 1, 2, 4),
(3, 12, 1, 1, 2, 4),
(4, 12, 1, 1, 2, 4),
(5, 12, 1, 1, 2, 4),
(6, 12, 1, 1, 2, 4),
(7, 12, 1, 1, 2, 4),
(8, 12, 1, 1, 2, 4),
(9, 12, 1, 1, 2, 4),
(10, 12, 1, 1, 2, 4),
(3, 13, 1, 1, 2, 4),
(4, 13, 1, 1, 2, 4),
(5, 13, 1, 1, 2, 4),
(6, 13, 1, 1, 2, 4),
(7, 13, 1, 1, 2, 4),
(8, 13, 1, 1, 2, 4),
(9, 13, 1, 1, 2, 4),
(10, 13, 1, 1, 2, 4),
(3, 14, 1, 1, 2, 4),
(4, 14, 1, 1, 2, 4),
(5, 14, 1, 1, 2, 4),
(6, 14, 1, 1, 2, 4),
(7, 14, 1, 1, 2, 4),
(8, 14, 1, 1, 2, 4),
(9, 14, 1, 1, 2, 4),
(10, 14, 1, 1, 2, 4),
(3, 15, 1, 1, 2, 4),
(4, 15, 1, 1, 2, 4),
(5, 15, 1, 1, 2, 4),
(6, 15, 1, 1, 2, 4),
(7, 15, 1, 1, 2, 4),
(8, 15, 1, 1, 2, 4),
(9, 15, 1, 1, 2, 4),
(10, 15, 1, 1, 2, 4),
(5, 16, 1, 1, 2, 4),
(6, 16, 1, 1, 2, 4),
(7, 16, 1, 1, 2, 4),
(8, 16, 1, 1, 2, 4),
(9, 16, 1, 1, 2, 4),
(10, 16, 1, 1, 2, 4),
(5, 18, 1, 1, 2, 4),
(6, 18, 1, 1, 2, 4),
(7, 18, 1, 1, 2, 4),
(8, 18, 1, 1, 2, 4),
(9, 18, 1, 1, 2, 4),
(10, 18, 1, 1, 2, 4),
(12, 18, 1, 1, 2, 4),
(5, 19, 1, 1, 2, 4),
(6, 19, 1, 1, 2, 4),
(7, 19, 1, 1, 2, 4),
(8, 19, 1, 1, 2, 4),
(9, 19, 1, 1, 2, 4),
(10, 19, 1, 1, 2, 4),
(12, 19, 1, 1, 2, 4),
(3, 20, 1, 1, 2, 4),
(4, 20, 1, 1, 2, 4),
(5, 20, 1, 1, 2, 4),
(6, 20, 1, 1, 2, 4),
(7, 20, 1, 1, 2, 4),
(8, 20, 1, 1, 2, 4),
(9, 20, 1, 1, 2, 4),
(10, 20, 1, 1, 2, 4),
(2, 1, 1, 1, 3, 4),
(2, 2, 1, 1, 3, 4),
(2, 3, 1, 1, 3, 4),
(2, 4, 1, 1, 3, 4),
(2, 5, 1, 1, 3, 4),
(2, 6, 1, 1, 3, 4),
(2, 7, 1, 1, 3, 4),
(2, 8, 1, 1, 3, 4),
(2, 9, 1, 1, 3, 4),
(2, 10, 1, 1, 3, 4),
(2, 11, 1, 1, 3, 4),
(2, 12, 1, 1, 3, 4),
(2, 13, 1, 1, 3, 4),
(2, 14, 1, 1, 3, 4),
(2, 15, 1, 1, 3, 4),
(2, 16, 1, 1, 3, 4),
(2, 18, 1, 1, 3, 4),
(2, 19, 1, 1, 3, 4),
(2, 20, 1, 1, 3, 4),
(3, 1, 1, 1, 3, 4),
(4, 1, 1, 1, 3, 4),
(5, 1, 1, 1, 3, 4),
(6, 1, 1, 1, 3, 4),
(7, 1, 1, 1, 3, 4),
(8, 1, 1, 1, 3, 4),
(9, 1, 1, 1, 3, 4),
(10, 1, 1, 1, 3, 4),
(11, 1, 1, 1, 3, 4),
(12, 1, 1, 1, 3, 4),
(3, 2, 1, 1, 3, 4),
(4, 2, 1, 1, 3, 4),
(5, 2, 1, 1, 3, 4),
(6, 2, 1, 1, 3, 4),
(7, 2, 1, 1, 3, 4),
(8, 2, 1, 1, 3, 4),
(9, 2, 1, 1, 3, 4),
(10, 2, 1, 1, 3, 4),
(11, 2, 1, 1, 3, 4),
(12, 2, 1, 1, 3, 4),
(3, 3, 1, 1, 3, 4),
(4, 3, 1, 1, 3, 4),
(5, 3, 1, 1, 3, 4),
(6, 3, 1, 1, 3, 4),
(7, 3, 1, 1, 3, 4),
(8, 3, 1, 1, 3, 4),
(9, 3, 1, 1, 3, 4),
(10, 3, 1, 1, 3, 4),
(11, 3, 1, 1, 3, 4),
(12, 3, 1, 1, 3, 4),
(3, 4, 1, 1, 3, 4),
(4, 4, 1, 1, 3, 4),
(5, 4, 1, 1, 3, 4),
(6, 4, 1, 1, 3, 4),
(7, 4, 1, 1, 3, 4),
(8, 4, 1, 1, 3, 4),
(9, 4, 1, 1, 3, 4),
(10, 4, 1, 1, 3, 4),
(11, 4, 1, 1, 3, 4),
(12, 4, 1, 1, 3, 4),
(3, 5, 1, 1, 3, 4),
(4, 5, 1, 1, 3, 4),
(5, 5, 1, 1, 3, 4),
(6, 5, 1, 1, 3, 4),
(7, 5, 1, 1, 3, 4),
(8, 5, 1, 1, 3, 4),
(9, 5, 1, 1, 3, 4),
(10, 5, 1, 1, 3, 4),
(11, 5, 1, 1, 3, 4),
(12, 5, 1, 1, 3, 4),
(3, 6, 1, 1, 3, 4),
(4, 6, 1, 1, 3, 4),
(5, 6, 1, 1, 3, 4),
(6, 6, 1, 1, 3, 4),
(7, 6, 1, 1, 3, 4),
(8, 6, 1, 1, 3, 4),
(9, 6, 1, 1, 3, 4),
(10, 6, 1, 1, 3, 4),
(11, 6, 1, 1, 3, 4),
(12, 6, 1, 1, 3, 4),
(4, 7, 1, 1, 3, 4),
(5, 7, 1, 1, 3, 4),
(6, 7, 1, 1, 3, 4),
(7, 7, 1, 1, 3, 4),
(8, 7, 1, 1, 3, 4),
(9, 7, 1, 1, 3, 4),
(10, 7, 1, 1, 3, 4),
(11, 7, 1, 1, 3, 4),
(12, 7, 1, 1, 3, 4),
(3, 8, 1, 1, 3, 4),
(5, 8, 1, 1, 3, 4),
(6, 8, 1, 1, 3, 4),
(7, 8, 1, 1, 3, 4),
(8, 8, 1, 1, 3, 4),
(9, 8, 1, 1, 3, 4),
(10, 8, 1, 1, 3, 4),
(11, 8, 1, 1, 3, 4),
(5, 9, 1, 1, 3, 4),
(6, 9, 1, 1, 3, 4),
(7, 9, 1, 1, 3, 4),
(8, 9, 1, 1, 3, 4),
(9, 9, 1, 1, 3, 4),
(10, 9, 1, 1, 3, 4),
(11, 9, 1, 1, 3, 4),
(3, 10, 1, 1, 3, 4),
(4, 10, 1, 1, 3, 4),
(5, 10, 1, 1, 3, 4),
(6, 10, 1, 1, 3, 4),
(7, 10, 1, 1, 3, 4),
(8, 10, 1, 1, 3, 4),
(9, 10, 1, 1, 3, 4),
(10, 10, 1, 1, 3, 4),
(3, 11, 1, 1, 3, 4),
(4, 11, 1, 1, 3, 4),
(5, 11, 1, 1, 3, 4),
(6, 11, 1, 1, 3, 4),
(7, 11, 1, 1, 3, 4),
(8, 11, 1, 1, 3, 4),
(9, 11, 1, 1, 3, 4),
(10, 11, 1, 1, 3, 4),
(3, 12, 1, 1, 3, 4),
(4, 12, 1, 1, 3, 4),
(5, 12, 1, 1, 3, 4),
(6, 12, 1, 1, 3, 4),
(7, 12, 1, 1, 3, 4),
(8, 12, 1, 1, 3, 4),
(9, 12, 1, 1, 3, 4),
(10, 12, 1, 1, 3, 4),
(3, 13, 1, 1, 3, 4),
(4, 13, 1, 1, 3, 4),
(5, 13, 1, 1, 3, 4),
(6, 13, 1, 1, 3, 4),
(7, 13, 1, 1, 3, 4),
(8, 13, 1, 1, 3, 4),
(9, 13, 1, 1, 3, 4),
(10, 13, 1, 1, 3, 4),
(3, 14, 1, 1, 3, 4),
(4, 14, 1, 1, 3, 4),
(5, 14, 1, 1, 3, 4),
(6, 14, 1, 1, 3, 4),
(7, 14, 1, 1, 3, 4),
(8, 14, 1, 1, 3, 4),
(9, 14, 1, 1, 3, 4),
(10, 14, 1, 1, 3, 4),
(3, 15, 1, 1, 3, 4),
(4, 15, 1, 1, 3, 4),
(5, 15, 1, 1, 3, 4),
(6, 15, 1, 1, 3, 4),
(7, 15, 1, 1, 3, 4),
(8, 15, 1, 1, 3, 4),
(9, 15, 1, 1, 3, 4),
(10, 15, 1, 1, 3, 4),
(5, 16, 1, 1, 3, 4),
(6, 16, 1, 1, 3, 4),
(7, 16, 1, 1, 3, 4),
(8, 16, 1, 1, 3, 4),
(9, 16, 1, 1, 3, 4),
(10, 16, 1, 1, 3, 4),
(5, 18, 1, 1, 3, 4),
(6, 18, 1, 1, 3, 4),
(7, 18, 1, 1, 3, 4),
(8, 18, 1, 1, 3, 4),
(9, 18, 1, 1, 3, 4),
(10, 18, 1, 1, 3, 4),
(12, 18, 1, 1, 3, 4),
(5, 19, 1, 1, 3, 4),
(6, 19, 1, 1, 3, 4),
(7, 19, 1, 1, 3, 4),
(8, 19, 1, 1, 3, 4),
(9, 19, 1, 1, 3, 4),
(10, 19, 1, 1, 3, 4),
(12, 19, 1, 1, 3, 4),
(3, 20, 1, 1, 3, 4),
(4, 20, 1, 1, 3, 4),
(5, 20, 1, 1, 3, 4),
(6, 20, 1, 1, 3, 4),
(7, 20, 1, 1, 3, 4),
(8, 20, 1, 1, 3, 4),
(9, 20, 1, 1, 3, 4),
(10, 20, 1, 1, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_compare_item`
--

DROP TABLE IF EXISTS `catalog_compare_item`;
CREATE TABLE IF NOT EXISTS `catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_eav_attribute`
--

DROP TABLE IF EXISTS `catalog_eav_attribute`;
CREATE TABLE IF NOT EXISTS `catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_configurable` smallint(5) unsigned DEFAULT NULL COMMENT 'Can be used to create configurable product',
  PRIMARY KEY (`attribute_id`),
  KEY `IDX_CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `IDX_CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';

--
-- Dumping data for table `catalog_eav_attribute`
--

INSERT INTO `catalog_eav_attribute` (`attribute_id`, `frontend_input_renderer`, `is_global`, `is_visible`, `is_searchable`, `is_filterable`, `is_comparable`, `is_visible_on_front`, `is_html_allowed_on_front`, `is_used_for_price_rules`, `is_filterable_in_search`, `used_in_product_listing`, `used_for_sort_by`, `apply_to`, `is_visible_in_advanced_search`, `position`, `is_wysiwyg_enabled`, `is_used_for_promo_rules`, `is_required_in_admin_store`, `is_configurable`) VALUES
(41, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(42, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(43, NULL, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, NULL, 0, 0, 1, 0, 0, 1),
(44, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(45, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(46, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(47, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(48, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(49, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(50, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(51, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(52, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(53, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(54, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(55, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(56, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(57, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(58, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(59, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(60, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(61, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(62, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(63, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(64, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(65, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(66, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(67, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(68, 'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(69, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, NULL, 1, 0, 0, 0, 0, 1),
(70, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, 1, 0, 0, 0, 0, 1),
(71, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, NULL, 1, 0, 1, 0, 0, 1),
(72, NULL, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 0, NULL, 1, 0, 1, 0, 0, 1),
(73, NULL, 2, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 'simple,virtual,bundle,downloadable,configurable', 1, 0, 0, 0, 0, 1),
(74, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1),
(75, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1),
(76, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1),
(77, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'virtual,downloadable', 0, 0, 0, 0, 0, 1),
(78, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1),
(79, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, NULL, 1, 0, 0, 0, 0, 1),
(80, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(81, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(82, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(83, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\BaseImage', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(84, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(85, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(86, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(87, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(88, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1),
(89, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1),
(90, NULL, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, NULL, 1, 0, 0, 0, 0, 1),
(91, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(92, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(93, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(94, 'Magento\\Framework\\Data\\Form\\Element\\Hidden', 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 1, 1),
(95, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,virtual,bundle,downloadable,configurable', 0, 0, 0, 0, 0, 1),
(96, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 1, 1),
(97, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(98, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(99, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(100, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(101, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(102, 'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(103, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(104, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(105, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(106, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(107, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(108, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(109, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(110, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(111, NULL, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'simple,bundle,grouped,configurable', 0, 0, 0, 0, 0, 1),
(112, 'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(113, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1),
(114, 'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price', 2, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,downloadable,bundle,configurable', 0, 0, 0, 0, 0, 1),
(115, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 1),
(116, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'bundle', 0, 0, 0, 0, 0, 1),
(117, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 1),
(118, NULL, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 1),
(119, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'bundle', 0, 0, 0, 0, 0, 1),
(120, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 1),
(121, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 1),
(122, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'downloadable', 0, 0, 0, 0, 0, 1),
(123, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 'downloadable', 0, 0, 0, 0, 0, 1),
(124, 'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(125, NULL, 2, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 'simple,virtual,bundle,downloadable,configurable', 1, 0, 0, 0, 0, 1),
(126, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(127, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(128, NULL, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, 0, 0, 0, 0, 1),
(129, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1),
(130, NULL, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, NULL, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `catalog_product_bundle_option_value`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION_ID_STORE_ID` (`option_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_price_index`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `catalog_product_bundle_selection_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  PRIMARY KEY (`selection_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `catalog_product_bundle_stock_index`;
CREATE TABLE IF NOT EXISTS `catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity`
--

DROP TABLE IF EXISTS `catalog_product_entity`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_SKU` (`sku`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table' AUTO_INCREMENT=22 ;

--
-- Dumping data for table `catalog_product_entity`
--

INSERT INTO `catalog_product_entity` (`entity_id`, `entity_type_id`, `attribute_set_id`, `type_id`, `sku`, `has_options`, `required_options`, `created_at`, `updated_at`) VALUES
(1, 4, 4, 'simple', 'Blue Hydrangea earrings', 0, 0, '2014-12-19 01:19:14', '2014-12-22 03:11:52'),
(2, 4, 4, 'simple', 'Occean Hydrangea earrings ', 1, 1, '2014-12-19 01:32:51', '2014-12-19 01:46:46'),
(3, 4, 4, 'simple', 'Occean Hydrangea earrings-1', 1, 1, '2014-12-19 01:46:47', '2014-12-19 01:51:55'),
(4, 4, 4, 'simple', 'Steampunk Heart Necklace', 1, 1, '2014-12-19 01:51:56', '2014-12-19 01:58:21'),
(5, 4, 4, 'simple', 'Bright Retro necklace ', 1, 1, '2014-12-19 01:55:10', '2014-12-19 02:00:04'),
(6, 4, 4, 'simple', 'Oval cocktail ring ', 1, 1, '2014-12-19 01:58:22', '2014-12-19 01:59:32'),
(7, 4, 4, 'simple', 'Wild Orchid ring ', 1, 1, '2014-12-19 02:00:05', '2014-12-19 02:02:48'),
(8, 4, 4, 'simple', 'Bird Nest necklace ', 1, 1, '2014-12-19 02:02:49', '2014-12-19 02:04:28'),
(9, 4, 4, 'simple', 'Bohemian Wall Style', 1, 1, '2014-12-19 02:04:29', '2014-12-19 02:10:57'),
(10, 4, 4, 'simple', 'Bright Retro ring', 1, 1, '2014-12-19 02:10:58', '2014-12-22 02:42:14'),
(11, 4, 4, 'simple', 'Bright Retro ring-1', 1, 1, '2014-12-19 02:18:05', '2014-12-22 04:06:11'),
(12, 4, 4, 'simple', 'Bright Retro ring-1-1', 1, 1, '2014-12-19 02:19:28', '2014-12-19 02:20:58'),
(13, 4, 4, 'simple', 'Colorful Ruby', 1, 1, '2014-12-19 02:20:59', '2014-12-19 02:54:36'),
(14, 4, 4, 'simple', 'Colorful Ring', 1, 1, '2014-12-19 02:27:23', '2014-12-19 02:29:08'),
(15, 4, 4, 'simple', 'Purple Ring', 1, 1, '2014-12-19 02:29:09', '2014-12-19 02:30:59'),
(16, 4, 4, 'simple', 'Bohemian Wall Clock ', 1, 1, '2014-12-19 02:31:00', '2014-12-19 02:44:16'),
(18, 4, 4, 'simple', 'Purple Wall Clock ', 1, 1, '2014-12-19 02:44:17', '2014-12-19 02:48:25'),
(19, 4, 4, 'simple', 'Round Wall Clock', 1, 1, '2014-12-19 02:48:26', '2014-12-19 02:51:01'),
(20, 4, 4, 'simple', 'Colorful Ruby-1', 1, 1, '2014-12-19 02:54:37', '2014-12-19 02:55:49'),
(21, 4, 4, 'simple', 'Blue Hydrangea earrings-1', 0, 0, '2014-12-22 03:11:54', '2014-12-22 03:13:30');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `catalog_product_entity_datetime`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table' AUTO_INCREMENT=589 ;

--
-- Dumping data for table `catalog_product_entity_datetime`
--

INSERT INTO `catalog_product_entity_datetime` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 4, 75, 0, 1, NULL),
(2, 4, 76, 0, 1, NULL),
(3, 4, 98, 0, 1, NULL),
(4, 4, 99, 0, 1, NULL),
(5, 4, 91, 0, 1, NULL),
(6, 4, 92, 0, 1, NULL),
(37, 4, 75, 0, 2, NULL),
(38, 4, 76, 0, 2, NULL),
(39, 4, 98, 0, 2, NULL),
(40, 4, 99, 0, 2, NULL),
(41, 4, 91, 0, 2, NULL),
(42, 4, 92, 0, 2, NULL),
(73, 4, 75, 0, 3, NULL),
(74, 4, 76, 0, 3, NULL),
(75, 4, 91, 0, 3, NULL),
(76, 4, 92, 0, 3, NULL),
(77, 4, 98, 0, 3, NULL),
(78, 4, 99, 0, 3, NULL),
(97, 4, 75, 0, 4, NULL),
(98, 4, 76, 0, 4, NULL),
(99, 4, 91, 0, 4, NULL),
(100, 4, 92, 0, 4, NULL),
(101, 4, 98, 0, 4, NULL),
(102, 4, 99, 0, 4, NULL),
(121, 4, 75, 0, 5, NULL),
(122, 4, 76, 0, 5, NULL),
(123, 4, 91, 0, 5, NULL),
(124, 4, 92, 0, 5, NULL),
(125, 4, 98, 0, 5, NULL),
(126, 4, 99, 0, 5, NULL),
(157, 4, 75, 0, 6, NULL),
(158, 4, 76, 0, 6, NULL),
(159, 4, 91, 0, 6, NULL),
(160, 4, 92, 0, 6, NULL),
(161, 4, 98, 0, 6, NULL),
(162, 4, 99, 0, 6, NULL),
(181, 4, 75, 0, 7, NULL),
(182, 4, 76, 0, 7, NULL),
(183, 4, 91, 0, 7, NULL),
(184, 4, 92, 0, 7, NULL),
(185, 4, 98, 0, 7, NULL),
(186, 4, 99, 0, 7, NULL),
(199, 4, 75, 0, 8, NULL),
(200, 4, 76, 0, 8, NULL),
(201, 4, 91, 0, 8, NULL),
(202, 4, 92, 0, 8, NULL),
(203, 4, 98, 0, 8, NULL),
(204, 4, 99, 0, 8, NULL),
(217, 4, 75, 0, 9, NULL),
(218, 4, 76, 0, 9, NULL),
(219, 4, 91, 0, 9, NULL),
(220, 4, 92, 0, 9, NULL),
(221, 4, 98, 0, 9, NULL),
(222, 4, 99, 0, 9, NULL),
(241, 4, 75, 0, 10, NULL),
(242, 4, 76, 0, 10, NULL),
(243, 4, 91, 0, 10, NULL),
(244, 4, 92, 0, 10, NULL),
(245, 4, 98, 0, 10, NULL),
(246, 4, 99, 0, 10, NULL),
(277, 4, 75, 0, 11, NULL),
(278, 4, 76, 0, 11, NULL),
(279, 4, 91, 0, 11, NULL),
(280, 4, 92, 0, 11, NULL),
(281, 4, 98, 0, 11, NULL),
(282, 4, 99, 0, 11, NULL),
(295, 4, 75, 0, 12, NULL),
(296, 4, 76, 0, 12, NULL),
(297, 4, 91, 0, 12, NULL),
(298, 4, 92, 0, 12, NULL),
(299, 4, 98, 0, 12, NULL),
(300, 4, 99, 0, 12, NULL),
(313, 4, 75, 0, 13, NULL),
(314, 4, 76, 0, 13, NULL),
(315, 4, 91, 0, 13, NULL),
(316, 4, 92, 0, 13, NULL),
(317, 4, 98, 0, 13, NULL),
(318, 4, 99, 0, 13, NULL),
(337, 4, 75, 0, 14, NULL),
(338, 4, 76, 0, 14, NULL),
(339, 4, 91, 0, 14, NULL),
(340, 4, 92, 0, 14, NULL),
(341, 4, 98, 0, 14, NULL),
(342, 4, 99, 0, 14, NULL),
(355, 4, 75, 0, 15, NULL),
(356, 4, 76, 0, 15, NULL),
(357, 4, 91, 0, 15, NULL),
(358, 4, 92, 0, 15, NULL),
(359, 4, 98, 0, 15, NULL),
(360, 4, 99, 0, 15, NULL),
(373, 4, 75, 0, 16, NULL),
(374, 4, 76, 0, 16, NULL),
(375, 4, 91, 0, 16, NULL),
(376, 4, 92, 0, 16, NULL),
(377, 4, 98, 0, 16, NULL),
(378, 4, 99, 0, 16, NULL),
(445, 4, 75, 0, 18, NULL),
(446, 4, 76, 0, 18, NULL),
(447, 4, 91, 0, 18, NULL),
(448, 4, 92, 0, 18, NULL),
(449, 4, 98, 0, 18, NULL),
(450, 4, 99, 0, 18, NULL),
(475, 4, 75, 0, 19, NULL),
(476, 4, 76, 0, 19, NULL),
(477, 4, 91, 0, 19, NULL),
(478, 4, 92, 0, 19, NULL),
(479, 4, 98, 0, 19, NULL),
(480, 4, 99, 0, 19, NULL),
(535, 4, 75, 0, 20, NULL),
(536, 4, 76, 0, 20, NULL),
(537, 4, 91, 0, 20, NULL),
(538, 4, 92, 0, 20, NULL),
(539, 4, 98, 0, 20, NULL),
(540, 4, 99, 0, 20, NULL),
(571, 4, 75, 0, 21, NULL),
(572, 4, 76, 0, 21, NULL),
(573, 4, 91, 0, 21, NULL),
(574, 4, 92, 0, 21, NULL),
(575, 4, 98, 0, 21, NULL),
(576, 4, 99, 0, 21, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `catalog_product_entity_decimal`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table' AUTO_INCREMENT=236 ;

--
-- Dumping data for table `catalog_product_entity_decimal`
--

INSERT INTO `catalog_product_entity_decimal` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 4, 73, 0, 1, '125.0000'),
(2, 4, 78, 0, 1, NULL),
(3, 4, 74, 0, 1, NULL),
(14, 4, 73, 0, 2, '125.0000'),
(15, 4, 78, 0, 2, NULL),
(16, 4, 74, 0, 2, NULL),
(27, 4, 73, 0, 3, '500.0000'),
(28, 4, 78, 0, 3, NULL),
(29, 4, 74, 0, 3, NULL),
(37, 4, 73, 0, 4, '500.0000'),
(38, 4, 74, 0, 4, NULL),
(39, 4, 78, 0, 4, NULL),
(46, 4, 73, 0, 5, '20.0000'),
(47, 4, 74, 0, 5, NULL),
(48, 4, 78, 0, 5, NULL),
(61, 4, 73, 0, 6, '1200.0000'),
(62, 4, 74, 0, 6, NULL),
(63, 4, 78, 0, 6, NULL),
(72, 4, 73, 0, 7, '2150.0000'),
(73, 4, 74, 0, 7, NULL),
(74, 4, 78, 0, 7, NULL),
(80, 4, 73, 0, 8, '2150.0000'),
(81, 4, 74, 0, 8, NULL),
(82, 4, 78, 0, 8, NULL),
(87, 4, 73, 0, 9, '520.0000'),
(88, 4, 74, 0, 9, NULL),
(89, 4, 78, 0, 9, NULL),
(97, 4, 73, 0, 10, '120.0000'),
(98, 4, 74, 0, 10, NULL),
(99, 4, 78, 0, 10, NULL),
(111, 4, 73, 0, 11, '120.0000'),
(112, 4, 74, 0, 11, NULL),
(113, 4, 78, 0, 11, NULL),
(118, 4, 73, 0, 12, '1520.0000'),
(119, 4, 74, 0, 12, NULL),
(120, 4, 78, 0, 12, NULL),
(126, 4, 73, 0, 13, '1520.0000'),
(127, 4, 74, 0, 13, NULL),
(128, 4, 78, 0, 13, NULL),
(135, 4, 73, 0, 14, '103.0000'),
(136, 4, 74, 0, 14, NULL),
(137, 4, 78, 0, 14, NULL),
(143, 4, 73, 0, 15, '103.0000'),
(144, 4, 74, 0, 15, NULL),
(145, 4, 78, 0, 15, NULL),
(150, 4, 73, 0, 16, '103.0000'),
(151, 4, 74, 0, 16, NULL),
(152, 4, 78, 0, 16, NULL),
(176, 4, 73, 0, 18, '103.0000'),
(177, 4, 74, 0, 18, NULL),
(178, 4, 78, 0, 18, NULL),
(187, 4, 73, 0, 19, '103.0000'),
(188, 4, 74, 0, 19, NULL),
(189, 4, 78, 0, 19, NULL),
(213, 4, 73, 0, 20, '1520.0000'),
(214, 4, 74, 0, 20, NULL),
(215, 4, 78, 0, 20, NULL),
(229, 4, 73, 0, 21, '125.0000'),
(230, 4, 74, 0, 21, NULL),
(231, 4, 78, 0, 21, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_gallery`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_GLR_ENTT_TYPE_ID_ENTT_ID_ATTR_ID_STORE_ID` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_group_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_group_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_group_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CC12C83765B562314470A24F2BDD0F36` (`entity_id`,`all_groups`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Attribute Backend Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_int`
--

DROP TABLE IF EXISTS `catalog_product_entity_int`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table' AUTO_INCREMENT=291 ;

--
-- Dumping data for table `catalog_product_entity_int`
--

INSERT INTO `catalog_product_entity_int` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 4, 125, 0, 1, 2),
(2, 4, 94, 0, 1, 1),
(3, 4, 96, 0, 1, 4),
(4, 4, 112, 0, 1, 1),
(7, 4, 90, 0, 1, NULL),
(8, 4, 130, 0, 1, NULL),
(16, 4, 125, 0, 2, 2),
(17, 4, 94, 0, 2, 1),
(18, 4, 96, 0, 2, 4),
(19, 4, 90, 0, 2, 6),
(20, 4, 130, 0, 2, 3),
(21, 4, 112, 0, 2, 1),
(32, 4, 90, 0, 3, 7),
(33, 4, 94, 0, 3, 1),
(34, 4, 96, 0, 3, 4),
(35, 4, 125, 0, 3, 2),
(36, 4, 130, 0, 3, 3),
(37, 4, 112, 0, 3, 1),
(43, 4, 90, 0, 4, 8),
(44, 4, 94, 0, 4, 1),
(45, 4, 96, 0, 4, 4),
(46, 4, 125, 0, 4, 2),
(47, 4, 130, 0, 4, 3),
(48, 4, 112, 0, 4, 1),
(54, 4, 90, 0, 5, 9),
(55, 4, 94, 0, 5, 1),
(56, 4, 96, 0, 5, 4),
(57, 4, 125, 0, 5, 2),
(58, 4, 130, 0, 5, 3),
(59, 4, 112, 0, 5, 1),
(72, 4, 90, 0, 6, 9),
(73, 4, 94, 0, 6, 1),
(74, 4, 96, 0, 6, 4),
(75, 4, 125, 0, 6, 2),
(76, 4, 130, 0, 6, 3),
(77, 4, 112, 0, 6, 1),
(88, 4, 90, 0, 7, 9),
(89, 4, 94, 0, 7, 1),
(90, 4, 96, 0, 7, 4),
(91, 4, 125, 0, 7, 2),
(92, 4, 130, 0, 7, 3),
(93, 4, 112, 0, 7, 1),
(97, 4, 90, 0, 8, 9),
(98, 4, 94, 0, 8, 1),
(99, 4, 96, 0, 8, 4),
(100, 4, 125, 0, 8, 2),
(101, 4, 130, 0, 8, 3),
(102, 4, 112, 0, 8, 1),
(106, 4, 90, 0, 9, 9),
(107, 4, 94, 0, 9, 1),
(108, 4, 96, 0, 9, 4),
(109, 4, 125, 0, 9, 2),
(110, 4, 130, 0, 9, 3),
(111, 4, 112, 0, 9, 1),
(116, 4, 90, 0, 10, 9),
(117, 4, 94, 0, 10, 1),
(118, 4, 96, 0, 10, 4),
(119, 4, 125, 0, 10, 2),
(120, 4, 130, 0, 10, 3),
(121, 4, 112, 0, 10, 1),
(128, 4, 90, 0, 11, 9),
(129, 4, 94, 0, 11, 1),
(130, 4, 96, 0, 11, 4),
(131, 4, 125, 0, 11, 2),
(132, 4, 130, 0, 11, 3),
(133, 4, 112, 0, 11, 1),
(137, 4, 90, 0, 12, 9),
(138, 4, 94, 0, 12, 1),
(139, 4, 96, 0, 12, 4),
(140, 4, 125, 0, 12, 2),
(141, 4, 130, 0, 12, 3),
(142, 4, 112, 0, 12, 1),
(146, 4, 90, 0, 13, 6),
(147, 4, 94, 0, 13, 1),
(148, 4, 96, 0, 13, 4),
(149, 4, 125, 0, 13, 2),
(150, 4, 130, 0, 13, 3),
(151, 4, 112, 0, 13, 1),
(157, 4, 90, 0, 14, 6),
(158, 4, 94, 0, 14, 1),
(159, 4, 96, 0, 14, 4),
(160, 4, 125, 0, 14, 2),
(161, 4, 130, 0, 14, 3),
(162, 4, 112, 0, 14, 1),
(166, 4, 90, 0, 15, 6),
(167, 4, 94, 0, 15, 1),
(168, 4, 96, 0, 15, 4),
(169, 4, 125, 0, 15, 2),
(170, 4, 130, 0, 15, 3),
(171, 4, 112, 0, 15, 1),
(175, 4, 90, 0, 16, 6),
(176, 4, 94, 0, 16, 1),
(177, 4, 96, 0, 16, 4),
(178, 4, 125, 0, 16, 2),
(179, 4, 130, 0, 16, 5),
(180, 4, 112, 0, 16, 1),
(199, 4, 90, 0, 18, 9),
(200, 4, 94, 0, 18, 1),
(201, 4, 96, 0, 18, 4),
(202, 4, 125, 0, 18, 2),
(203, 4, 130, 0, 18, 5),
(204, 4, 112, 0, 18, 1),
(211, 4, 90, 0, 19, 9),
(212, 4, 94, 0, 19, 1),
(213, 4, 96, 0, 19, 4),
(214, 4, 125, 0, 19, 2),
(215, 4, 130, 0, 19, 5),
(216, 4, 112, 0, 19, 1),
(252, 4, 90, 0, 20, 6),
(253, 4, 94, 0, 20, 1),
(254, 4, 96, 0, 20, 4),
(255, 4, 125, 0, 20, 2),
(256, 4, 130, 0, 20, 3),
(257, 4, 112, 0, 20, 1),
(280, 4, 90, 0, 21, NULL),
(281, 4, 94, 0, 21, 1),
(282, 4, 96, 0, 21, 4),
(283, 4, 125, 0, 21, 2),
(284, 4, 130, 0, 21, NULL),
(285, 4, 112, 0, 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table' AUTO_INCREMENT=162 ;

--
-- Dumping data for table `catalog_product_entity_media_gallery`
--

INSERT INTO `catalog_product_entity_media_gallery` (`value_id`, `attribute_id`, `entity_id`, `value`) VALUES
(1, 86, 1, '/1/a/1a_6.png'),
(2, 86, 1, '/1/b/1b_3.png'),
(3, 86, 1, '/1/c/1c.png'),
(4, 86, 1, '/1/d/1d.png'),
(9, 86, 2, '/1/a/1a_7.png'),
(10, 86, 2, '/1/b/1b_4.png'),
(11, 86, 2, '/1/c/1c_3.png'),
(12, 86, 2, '/9/a/9a.png'),
(13, 86, 3, '/1/a/1a_7_1.png'),
(14, 86, 3, '/1/b/1b_4_1.png'),
(15, 86, 3, '/1/c/1c_3_1.png'),
(16, 86, 3, '/9/a/9a_1.png'),
(21, 86, 4, '/2/a/2a_1.png'),
(22, 86, 4, '/2/b/2b_1.png'),
(23, 86, 4, '/3/a/3a_1.png'),
(24, 86, 4, '/3/b/3b_1.png'),
(25, 86, 5, '/2/a/2a_1_1.png'),
(26, 86, 5, '/2/b/2b_1_1.png'),
(27, 86, 5, '/3/a/3a_1_1.png'),
(28, 86, 5, '/3/b/3b_1_1.png'),
(34, 86, 6, '/2/b/2b_1_3.png'),
(35, 86, 6, '/3/a/3a_1_3.png'),
(36, 86, 6, '/3/b/3b_1_3.png'),
(37, 86, 6, '/1/c/1c_2.png'),
(46, 86, 7, '/6/b/6b.png'),
(47, 86, 7, '/5/c/5c.png'),
(48, 86, 7, '/5/b/5b.png'),
(49, 86, 7, '/6/c/6c.png'),
(50, 86, 8, '/6/b/6b_1.png'),
(51, 86, 8, '/5/c/5c_1.png'),
(52, 86, 8, '/5/b/5b_1.png'),
(53, 86, 8, '/6/c/6c_1.png'),
(55, 86, 9, '/5/c/5c_1_1.png'),
(58, 86, 9, '/8/a/8a_1_1.png'),
(59, 86, 9, '/8/b/8b_1_1.png'),
(60, 86, 9, '/8/c/8c_1_1.png'),
(61, 86, 10, '/5/c/5c_1_1_1.png'),
(63, 86, 10, '/8/b/8b_1_1_1.png'),
(64, 86, 10, '/8/c/8c_1_1_1.png'),
(67, 86, 10, '/9/b/9b.png'),
(69, 86, 11, '/5/c/5c_1_1_1_1.png'),
(70, 86, 11, '/8/b/8b_1_1_1_1.png'),
(72, 86, 11, '/9/b/9b_1.png'),
(73, 86, 11, '/7/a/7a.png'),
(74, 86, 12, '/5/c/5c_1_1_1_1_1.png'),
(77, 86, 12, '/9/b/9b_1_1.png'),
(78, 86, 12, '/7/a/7a_1.png'),
(79, 86, 12, '/8/a/8a_1_2.png'),
(81, 86, 13, '/9/b/9b_1_1_1.png'),
(82, 86, 13, '/7/a/7a_1_1.png'),
(83, 86, 13, '/8/a/8a_1_2_1.png'),
(84, 86, 13, '/5/b/5b_2.png'),
(85, 86, 14, '/9/b/9b_1_1_1_1.png'),
(86, 86, 14, '/7/a/7a_1_1_1.png'),
(87, 86, 14, '/8/a/8a_1_2_1_1.png'),
(88, 86, 14, '/5/b/5b_2_1.png'),
(89, 86, 14, '/6/b/6b_2.png'),
(92, 86, 15, '/8/a/8a_1_2_1_1_1.png'),
(94, 86, 15, '/6/b/6b_2_1.png'),
(95, 86, 15, '/1/1/11b_1.png'),
(96, 86, 15, '/1/1/11a_2.png'),
(101, 86, 16, '/1/5/15a.png'),
(102, 86, 16, '/1/5/15b.png'),
(103, 86, 16, '/1/5/15c.png'),
(110, 86, 18, '/2/2/22a_1_1.png'),
(111, 86, 18, '/2/2/22b_1_1.png'),
(112, 86, 18, '/2/2/22c_1_1.png'),
(116, 86, 19, '/1/8/18a.jpg'),
(117, 86, 19, '/1/8/18b.png'),
(118, 86, 19, '/1/8/18c.png'),
(143, 86, 20, '/1/b/1b_1_1.png'),
(144, 86, 20, '/1/c/1c_4.png'),
(145, 86, 20, '/1/a/1a_8.png'),
(158, 86, 21, '/1/a/1a_6_4.png'),
(159, 86, 21, '/1/b/1b_3_4.png'),
(160, 86, 21, '/1/c/1c_8.png'),
(161, 86, 21, '/1/d/1d_4.png');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `catalog_product_entity_media_gallery_value`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';

--
-- Dumping data for table `catalog_product_entity_media_gallery_value`
--

INSERT INTO `catalog_product_entity_media_gallery_value` (`value_id`, `store_id`, `entity_id`, `label`, `position`, `disabled`) VALUES
(1, 0, 1, NULL, 1, 0),
(2, 0, 1, NULL, 2, 0),
(3, 0, 1, NULL, 3, 0),
(4, 0, 1, NULL, 4, 0),
(9, 0, 2, NULL, 5, 0),
(10, 0, 2, NULL, 6, 0),
(11, 0, 2, NULL, 7, 0),
(12, 0, 2, NULL, 8, 0),
(13, 0, 3, NULL, 5, 0),
(14, 0, 3, NULL, 6, 0),
(15, 0, 3, NULL, 7, 0),
(16, 0, 3, NULL, 8, 0),
(21, 0, 4, NULL, 6, 0),
(22, 0, 4, NULL, 7, 0),
(23, 0, 4, NULL, 8, 0),
(24, 0, 4, NULL, 9, 0),
(25, 0, 5, NULL, 6, 0),
(26, 0, 5, NULL, 7, 0),
(27, 0, 5, NULL, 8, 0),
(28, 0, 5, NULL, 9, 0),
(34, 0, 6, NULL, 7, 0),
(35, 0, 6, NULL, 8, 0),
(36, 0, 6, NULL, 9, 0),
(37, 0, 6, NULL, 5, 0),
(46, 0, 7, NULL, 5, 0),
(47, 0, 7, NULL, 6, 0),
(48, 0, 7, NULL, 7, 0),
(49, 0, 7, NULL, 8, 0),
(50, 0, 8, NULL, 5, 0),
(51, 0, 8, NULL, 6, 0),
(52, 0, 8, NULL, 7, 0),
(53, 0, 8, NULL, 8, 0),
(55, 0, 9, NULL, 6, 0),
(58, 0, 9, NULL, 5, 0),
(59, 0, 9, NULL, 6, 0),
(60, 0, 9, NULL, 7, 0),
(61, 0, 10, NULL, 6, 0),
(63, 0, 10, NULL, 6, 0),
(64, 0, 10, NULL, 7, 0),
(67, 0, 10, NULL, 7, 0),
(69, 0, 11, NULL, 6, 0),
(70, 0, 11, NULL, 6, 0),
(72, 0, 11, NULL, 7, 0),
(73, 0, 11, NULL, 5, 0),
(74, 0, 12, NULL, 6, 0),
(77, 0, 12, NULL, 7, 0),
(78, 0, 12, NULL, 5, 0),
(79, 0, 12, NULL, 6, 0),
(81, 0, 13, NULL, 7, 0),
(82, 0, 13, NULL, 5, 0),
(83, 0, 13, NULL, 6, 0),
(84, 0, 13, NULL, 5, 0),
(85, 0, 14, NULL, 7, 0),
(86, 0, 14, NULL, 5, 0),
(87, 0, 14, NULL, 6, 0),
(88, 0, 14, NULL, 5, 0),
(89, 0, 14, NULL, 5, 0),
(92, 0, 15, NULL, 6, 0),
(94, 0, 15, NULL, 5, 0),
(95, 0, 15, NULL, 6, 0),
(96, 0, 15, NULL, 7, 0),
(101, 0, 16, NULL, 5, 0),
(102, 0, 16, NULL, 6, 0),
(103, 0, 16, NULL, 7, 0),
(110, 0, 18, NULL, 4, 0),
(111, 0, 18, NULL, 5, 0),
(112, 0, 18, NULL, 6, 0),
(116, 0, 19, NULL, 4, 0),
(117, 0, 19, NULL, 5, 0),
(118, 0, 19, NULL, 6, 0),
(143, 0, 20, NULL, 5, 0),
(144, 0, 20, NULL, 6, 0),
(145, 0, 20, NULL, 7, 0),
(158, 0, 21, NULL, 1, 0),
(159, 0, 21, NULL, 2, 0),
(160, 0, 21, NULL, 3, 0),
(161, 0, 21, NULL, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_text`
--

DROP TABLE IF EXISTS `catalog_product_entity_text`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table' AUTO_INCREMENT=205 ;

--
-- Dumping data for table `catalog_product_entity_text`
--

INSERT INTO `catalog_product_entity_text` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 4, 71, 0, 1, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(2, 4, 81, 0, 1, 'Blue Hydrangea earrings'),
(3, 4, 100, 0, 1, NULL),
(4, 4, 72, 0, 1, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(14, 4, 71, 0, 2, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(15, 4, 81, 0, 2, 'Blue Hydrangea earrings'),
(16, 4, 100, 0, 2, NULL),
(17, 4, 72, 0, 2, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(23, 4, 71, 0, 3, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(24, 4, 81, 0, 3, 'Blue Hydrangea earrings'),
(25, 4, 100, 0, 3, NULL),
(26, 4, 72, 0, 3, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(30, 4, 71, 0, 4, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(31, 4, 72, 0, 4, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(32, 4, 81, 0, 4, 'Steampunk Heart Necklace'),
(33, 4, 100, 0, 4, NULL),
(38, 4, 71, 0, 5, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(39, 4, 72, 0, 5, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(40, 4, 81, 0, 5, 'Steampunk Heart Necklace'),
(41, 4, 100, 0, 5, NULL),
(50, 4, 71, 0, 6, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(51, 4, 72, 0, 6, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(52, 4, 81, 0, 6, 'Steampunk Heart Necklace'),
(53, 4, 100, 0, 6, NULL),
(60, 4, 71, 0, 7, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(61, 4, 72, 0, 7, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(62, 4, 81, 0, 7, 'Steampunk Heart Necklace'),
(63, 4, 100, 0, 7, NULL),
(66, 4, 71, 0, 8, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(67, 4, 72, 0, 8, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(68, 4, 81, 0, 8, 'Steampunk Heart Necklace'),
(69, 4, 100, 0, 8, NULL),
(72, 4, 71, 0, 9, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(73, 4, 72, 0, 9, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(74, 4, 81, 0, 9, 'Steampunk Heart Necklace'),
(75, 4, 100, 0, 9, NULL),
(79, 4, 71, 0, 10, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(80, 4, 72, 0, 10, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(81, 4, 81, 0, 10, 'Bright Retro ring'),
(82, 4, 100, 0, 10, NULL),
(89, 4, 71, 0, 11, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(90, 4, 72, 0, 11, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(91, 4, 81, 0, 11, 'Bright Retro ring'),
(92, 4, 100, 0, 11, NULL),
(95, 4, 71, 0, 12, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(96, 4, 72, 0, 12, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(97, 4, 81, 0, 12, 'Bright Retro ring'),
(98, 4, 100, 0, 12, NULL),
(101, 4, 71, 0, 13, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(102, 4, 72, 0, 13, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(103, 4, 81, 0, 13, 'Bright Retro ring'),
(104, 4, 100, 0, 13, NULL),
(108, 4, 71, 0, 14, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(109, 4, 72, 0, 14, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(110, 4, 81, 0, 14, 'Bright Retro ring'),
(111, 4, 100, 0, 14, NULL),
(114, 4, 71, 0, 15, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(115, 4, 72, 0, 15, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(116, 4, 81, 0, 15, 'Bright Retro ring'),
(117, 4, 100, 0, 15, NULL),
(120, 4, 71, 0, 16, '<p><br />Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now.</p>\r\n<div id="stcpDiv" style="position: absolute; top: -1999px; left: -1988px;">\r\n<p>Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now.</p>\r\n<p>And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications.</p>\r\n</div>'),
(121, 4, 72, 0, 16, '<div id="stcpDiv" style="position: absolute; top: -1999px; left: -1988px;">Hang this unique clock in any room to instantly brighten up the space.<br /><br /> This clock is 12" in diameter.<br /><br /> - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf</div>\r\n<p>Hang this unique clock in any room to instantly brighten up the space.<br />This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.<br />There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).<br /><strong>&nbsp;About Shannybeebo:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire</li>\r\n<li>&nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion.</li>\r\n<li>&nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents.</li>\r\n<li>&nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary.</li>\r\n</ul>\r\n<div id="stcpDiv" style="position: absolute; top: -1999px; left: -1988px;">Hang this unique clock in any room to instantly brighten up the space.<br /><br /> This clock is 12" in diameter.<br /><br /> - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo</div>'),
(122, 4, 81, 0, 16, 'Bright Retro ring'),
(123, 4, 100, 0, 16, NULL),
(144, 4, 71, 0, 18, '<p>Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now.</p>\r\n<div id="stcpDiv" style="position: absolute; top: -1999px; left: -1988px;">\r\n<p>Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now.</p>\r\n<p>And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications.</p>\r\n</div>'),
(145, 4, 72, 0, 18, '<div id="stcpDiv" style="position: absolute; top: -1999px; left: -1988px;">Hang this unique clock in any room to instantly brighten up the space.<br /><br /> This clock is 12" in diameter.<br /><br /> - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf</div>\r\n<p>Hang this unique clock in any room to instantly brighten up the space.<br />This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.<br />There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).<br /><strong>&nbsp;About Shannybeebo:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire</li>\r\n<li>&nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion.</li>\r\n<li>&nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents.</li>\r\n<li>&nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary.</li>\r\n</ul>\r\n<div id="stcpDiv" style="position: absolute; top: -1999px; left: -1988px;">Hang this unique clock in any room to instantly brighten up the space.<br /><br /> This clock is 12" in diameter.<br /><br /> - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo</div>'),
(146, 4, 81, 0, 18, 'Bright Retro ring'),
(147, 4, 100, 0, 18, NULL),
(153, 4, 71, 0, 19, '<p>Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now.</p>\r\n<div id="stcpDiv" style="position: absolute; top: -1999px; left: -1988px;">\r\n<p>Brighten up a dull room in your home with this vibrant retro decorative wall clock. Custom handcrafted from two vinyl records, this designer wall clock is unlike anything you&acirc;&euro;&trade;ll find in stores. Each record has been meticulously covered in bright retro themed papers and both are connected to form one clock. Jet-black mechanisms complete the look while adding a measure of elegance. This clock is sure to complement any room in your home. It also looks positively stunning when hung in an office. You&acirc;&euro;&trade;ll feel a burst of joyous energy each time you look at it. It also makes an imaginative gift for a friend or relative. It is a limited edition Shannybeebo original. Order now.</p>\r\n<p>And remember that at Shannybeebo, I specialize in creating works of functional art to enhance your space. If you don&acirc;&euro;&trade;t see a clock that fulfills your design needs, send me a convo and I will work with you to create your own clock according to your design specifications.</p>\r\n</div>'),
(154, 4, 72, 0, 19, '<div id="stcpDiv" style="position: absolute; top: -1999px; left: -1988px;">Hang this unique clock in any room to instantly brighten up the space.<br /><br /> This clock is 12" in diameter.<br /><br /> - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf</div>\r\n<p>Hang this unique clock in any room to instantly brighten up the space.<br />This clock is 12" in diameter.The clock is assembled with a new quartz clock movement.<br />There''s a heavy duty hanger on the back for hanging. The clock takes one "AA" battery ( included).<br /><strong>&nbsp;About Shannybeebo:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Shannon: owner, maker, designer, Clock Maker, Marble Baker, Recycler Extraordinaire</li>\r\n<li>&nbsp;&nbsp;&nbsp; She''s Shannon, a San Antonio based artist, who focuses on recycled pieces for home and fashion.</li>\r\n<li>&nbsp;&nbsp;&nbsp; Her specialty is paper art incorporating time pieces, jewelry and home accents.</li>\r\n<li>&nbsp;&nbsp;&nbsp; Her style is upbeat and contemporary.</li>\r\n</ul>\r\n<div id="stcpDiv" style="position: absolute; top: -1999px; left: -1988px;">Hang this unique clock in any room to instantly brighten up the space.<br /><br /> This clock is 12" in diameter.<br /><br /> - See more at: http://crafts.demo.ubertheme.com/men/bohemian-wall-clock-by-shannybeebo.html#sthash.qaWWNzyD.dpuf About Shannybeebo</div>'),
(155, 4, 81, 0, 19, 'Bright Retro ring'),
(156, 4, 100, 0, 19, NULL),
(181, 4, 71, 0, 20, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(182, 4, 72, 0, 20, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(183, 4, 81, 0, 20, 'Bright Retro ring'),
(184, 4, 100, 0, 20, NULL),
(199, 4, 71, 0, 21, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal. For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br />Measurements:</p>\r\n<ul>\r\n<li>&nbsp;Cab size 19x14mm/0.75x0.55"</li>\r\n<li>&nbsp;&nbsp; Adjustable ring base: minimum size is 8</li>\r\n</ul>\r\n<p>Please note: the band is quite hard and heavy, so it needs some effort to be adjusted. It''s not possible to size down it, sorry!</p>'),
(200, 4, 72, 0, 21, '<p>Elegant and delicate long earrings consist of 4 parts: each with own print of blue hydrangea petal.<br />For creating this collection we collected real petals of flowers, scanned them and turned into wearable pieces.<br /><br /><strong>About BeautySpot:</strong></p>\r\n<ul>\r\n<li>&nbsp;&nbsp;&nbsp; Owner: Polina &amp; Sergey</li>\r\n<li>&nbsp;&nbsp;&nbsp; We are wife and husband, who decided not just spend our lives together, but even work together. And it''s obvious - two pairs of hands are better than one!</li>\r\n<li>&nbsp;&nbsp;&nbsp; Fun fact: "BeautySpot" is one of english translations of our last name from russian.</li>\r\n</ul>'),
(201, 4, 81, 0, 21, 'Blue Hydrangea earrings'),
(202, 4, 100, 0, 21, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_entity_tier_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `catalog_product_entity_varchar`;
CREATE TABLE IF NOT EXISTS `catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table' AUTO_INCREMENT=1002 ;

--
-- Dumping data for table `catalog_product_entity_varchar`
--

INSERT INTO `catalog_product_entity_varchar` (`value_id`, `entity_type_id`, `attribute_id`, `store_id`, `entity_id`, `value`) VALUES
(1, 4, 69, 0, 1, 'Blue Hydrangea earrings'),
(2, 4, 83, 0, 1, '/1/b/1b_3.png'),
(3, 4, 84, 0, 1, '/1/b/1b_3.png'),
(4, 4, 85, 0, 1, '/1/b/1b_3.png'),
(5, 4, 128, 0, 1, 'blue-hydrangea-earrings'),
(6, 4, 80, 0, 1, 'Blue Hydrangea earrings'),
(7, 4, 82, 0, 1, 'Blue Hydrangea earrings '),
(8, 4, 97, 0, 1, NULL),
(9, 4, 101, 0, 1, NULL),
(10, 4, 103, 0, 1, 'container2'),
(11, 4, 111, 0, 1, NULL),
(12, 4, 106, 0, 1, NULL),
(13, 4, 107, 0, 1, NULL),
(14, 4, 108, 0, 1, NULL),
(15, 4, 124, 0, 1, NULL),
(51, 4, 69, 0, 2, 'Occean Hydrangea earrings '),
(52, 4, 83, 0, 2, '/1/a/1a_7.png'),
(53, 4, 84, 0, 2, '/1/a/1a_7.png'),
(54, 4, 85, 0, 2, '/1/a/1a_7.png'),
(55, 4, 128, 0, 2, 'blue-hydrangea-earrings-1'),
(56, 4, 80, 0, 2, 'Blue Hydrangea earrings'),
(57, 4, 82, 0, 2, 'Blue Hydrangea earrings '),
(58, 4, 97, 0, 2, NULL),
(59, 4, 101, 0, 2, NULL),
(60, 4, 103, 0, 2, 'container2'),
(61, 4, 111, 0, 2, NULL),
(62, 4, 106, 0, 2, NULL),
(63, 4, 107, 0, 2, NULL),
(64, 4, 108, 0, 2, NULL),
(65, 4, 124, 0, 2, NULL),
(105, 4, 69, 0, 3, 'Purple Hydrangea earrings '),
(106, 4, 80, 0, 3, 'Blue Hydrangea earrings'),
(107, 4, 82, 0, 3, 'Blue Hydrangea earrings '),
(108, 4, 83, 0, 3, '/9/a/9a_1.png'),
(109, 4, 84, 0, 3, '/9/a/9a_1.png'),
(110, 4, 85, 0, 3, '/9/a/9a_1.png'),
(111, 4, 97, 0, 3, NULL),
(112, 4, 101, 0, 3, NULL),
(113, 4, 103, 0, 3, 'container2'),
(114, 4, 106, 0, 3, NULL),
(115, 4, 107, 0, 3, NULL),
(116, 4, 108, 0, 3, NULL),
(117, 4, 111, 0, 3, NULL),
(118, 4, 124, 0, 3, NULL),
(119, 4, 128, 0, 3, 'blue-hydrangea-earrings-2'),
(145, 4, 69, 0, 4, 'Steampunk Heart Necklace'),
(146, 4, 80, 0, 4, 'Steampunk Heart Necklace'),
(147, 4, 82, 0, 4, 'Blue Hydrangea earrings '),
(148, 4, 83, 0, 4, '/3/a/3a_1.png'),
(149, 4, 84, 0, 4, '/3/a/3a_1.png'),
(150, 4, 85, 0, 4, '/3/a/3a_1.png'),
(151, 4, 97, 0, 4, NULL),
(152, 4, 101, 0, 4, NULL),
(153, 4, 103, 0, 4, 'container2'),
(154, 4, 106, 0, 4, NULL),
(155, 4, 107, 0, 4, NULL),
(156, 4, 108, 0, 4, NULL),
(157, 4, 111, 0, 4, NULL),
(158, 4, 124, 0, 4, NULL),
(159, 4, 128, 0, 4, 'steampunk-heart-necklace'),
(178, 4, 69, 0, 5, 'Bright Retro necklace '),
(179, 4, 80, 0, 5, 'Steampunk Heart Necklace'),
(180, 4, 82, 0, 5, 'Blue Hydrangea earrings '),
(181, 4, 83, 0, 5, '/2/b/2b_1_1.png'),
(182, 4, 84, 0, 5, '/2/b/2b_1_1.png'),
(183, 4, 85, 0, 5, '/2/b/2b_1_1.png'),
(184, 4, 97, 0, 5, NULL),
(185, 4, 101, 0, 5, NULL),
(186, 4, 103, 0, 5, 'container2'),
(187, 4, 106, 0, 5, NULL),
(188, 4, 107, 0, 5, NULL),
(189, 4, 108, 0, 5, NULL),
(190, 4, 111, 0, 5, NULL),
(191, 4, 124, 0, 5, NULL),
(192, 4, 128, 0, 5, 'steampunk-heart-necklace-1'),
(243, 4, 69, 0, 6, 'Oval cocktail ring '),
(244, 4, 80, 0, 6, 'Steampunk Heart Necklace'),
(245, 4, 82, 0, 6, 'Blue Hydrangea earrings '),
(246, 4, 83, 0, 6, '/1/c/1c_2.png'),
(247, 4, 84, 0, 6, '/1/c/1c_2.png'),
(248, 4, 85, 0, 6, '/1/c/1c_2.png'),
(249, 4, 97, 0, 6, NULL),
(250, 4, 101, 0, 6, NULL),
(251, 4, 103, 0, 6, 'container2'),
(252, 4, 106, 0, 6, NULL),
(253, 4, 107, 0, 6, NULL),
(254, 4, 108, 0, 6, NULL),
(255, 4, 111, 0, 6, NULL),
(256, 4, 124, 0, 6, NULL),
(257, 4, 128, 0, 6, 'steampunk-heart-necklace-2'),
(291, 4, 69, 0, 7, 'Wild Orchid ring '),
(292, 4, 80, 0, 7, 'Steampunk Heart Necklace'),
(293, 4, 82, 0, 7, 'Blue Hydrangea earrings '),
(294, 4, 83, 0, 7, '/6/c/6c.png'),
(295, 4, 84, 0, 7, '/6/c/6c.png'),
(296, 4, 85, 0, 7, '/6/c/6c.png'),
(297, 4, 97, 0, 7, NULL),
(298, 4, 101, 0, 7, NULL),
(299, 4, 103, 0, 7, 'container2'),
(300, 4, 106, 0, 7, NULL),
(301, 4, 107, 0, 7, NULL),
(302, 4, 108, 0, 7, NULL),
(303, 4, 111, 0, 7, NULL),
(304, 4, 124, 0, 7, NULL),
(305, 4, 128, 0, 7, 'steampunk-heart-necklace-3'),
(324, 4, 69, 0, 8, 'Bird Nest necklace '),
(325, 4, 80, 0, 8, 'Steampunk Heart Necklace'),
(326, 4, 82, 0, 8, 'Blue Hydrangea earrings '),
(327, 4, 83, 0, 8, '/5/c/5c_1.png'),
(328, 4, 84, 0, 8, '/5/c/5c_1.png'),
(329, 4, 85, 0, 8, '/5/c/5c_1.png'),
(330, 4, 97, 0, 8, NULL),
(331, 4, 101, 0, 8, NULL),
(332, 4, 103, 0, 8, 'container2'),
(333, 4, 106, 0, 8, NULL),
(334, 4, 107, 0, 8, NULL),
(335, 4, 108, 0, 8, NULL),
(336, 4, 111, 0, 8, NULL),
(337, 4, 124, 0, 8, NULL),
(338, 4, 128, 0, 8, 'steampunk-heart-necklace-4'),
(357, 4, 69, 0, 9, 'Bohemian Wall Style'),
(358, 4, 80, 0, 9, 'Steampunk Heart Necklace'),
(359, 4, 82, 0, 9, 'Blue Hydrangea earrings '),
(360, 4, 83, 0, 9, '/8/b/8b_1_1.png'),
(361, 4, 84, 0, 9, '/8/b/8b_1_1.png'),
(362, 4, 85, 0, 9, '/8/b/8b_1_1.png'),
(363, 4, 97, 0, 9, NULL),
(364, 4, 101, 0, 9, NULL),
(365, 4, 103, 0, 9, 'container2'),
(366, 4, 106, 0, 9, NULL),
(367, 4, 107, 0, 9, NULL),
(368, 4, 108, 0, 9, NULL),
(369, 4, 111, 0, 9, NULL),
(370, 4, 124, 0, 9, NULL),
(371, 4, 128, 0, 9, 'steampunk-heart-necklace-5'),
(397, 4, 69, 0, 10, 'Bright Retro ring'),
(398, 4, 80, 0, 10, 'Bright Retro ring'),
(399, 4, 82, 0, 10, 'Bright Retro ring'),
(400, 4, 83, 0, 10, '/9/b/9b.png'),
(401, 4, 84, 0, 10, '/9/b/9b.png'),
(402, 4, 85, 0, 10, '/9/b/9b.png'),
(403, 4, 97, 0, 10, NULL),
(404, 4, 101, 0, 10, NULL),
(405, 4, 103, 0, 10, 'container2'),
(406, 4, 106, 0, 10, NULL),
(407, 4, 107, 0, 10, NULL),
(408, 4, 108, 0, 10, NULL),
(409, 4, 111, 0, 10, NULL),
(410, 4, 124, 0, 10, NULL),
(411, 4, 128, 0, 10, 'bright-retro-ring'),
(457, 4, 69, 0, 11, 'Bright Retro Ruby'),
(458, 4, 80, 0, 11, 'Bright Retro ring'),
(459, 4, 82, 0, 11, 'Bright Retro ring'),
(460, 4, 83, 0, 11, '/7/a/7a.png'),
(461, 4, 84, 0, 11, '/7/a/7a.png'),
(462, 4, 85, 0, 11, '/7/a/7a.png'),
(463, 4, 97, 0, 11, NULL),
(464, 4, 101, 0, 11, NULL),
(465, 4, 103, 0, 11, 'container2'),
(466, 4, 106, 0, 11, NULL),
(467, 4, 107, 0, 11, NULL),
(468, 4, 108, 0, 11, NULL),
(469, 4, 111, 0, 11, NULL),
(470, 4, 124, 0, 11, NULL),
(471, 4, 128, 0, 11, 'bright-retro-ring-1'),
(490, 4, 69, 0, 12, 'Occean Retro Ruby'),
(491, 4, 80, 0, 12, 'Bright Retro ring'),
(492, 4, 82, 0, 12, 'Bright Retro ring'),
(493, 4, 83, 0, 12, '/8/a/8a_1_2.png'),
(494, 4, 84, 0, 12, '/8/a/8a_1_2.png'),
(495, 4, 85, 0, 12, '/8/a/8a_1_2.png'),
(496, 4, 97, 0, 12, NULL),
(497, 4, 101, 0, 12, NULL),
(498, 4, 103, 0, 12, 'container2'),
(499, 4, 106, 0, 12, NULL),
(500, 4, 107, 0, 12, NULL),
(501, 4, 108, 0, 12, NULL),
(502, 4, 111, 0, 12, NULL),
(503, 4, 124, 0, 12, NULL),
(504, 4, 128, 0, 12, 'bright-retro-ring-2'),
(523, 4, 69, 0, 13, 'Colorful Ruby'),
(524, 4, 80, 0, 13, 'Bright Retro ring'),
(525, 4, 82, 0, 13, 'Bright Retro ring'),
(526, 4, 83, 0, 13, '/5/b/5b_2.png'),
(527, 4, 84, 0, 13, '/5/b/5b_2.png'),
(528, 4, 85, 0, 13, '/5/b/5b_2.png'),
(529, 4, 97, 0, 13, NULL),
(530, 4, 101, 0, 13, NULL),
(531, 4, 103, 0, 13, 'container2'),
(532, 4, 106, 0, 13, NULL),
(533, 4, 107, 0, 13, NULL),
(534, 4, 108, 0, 13, NULL),
(535, 4, 111, 0, 13, NULL),
(536, 4, 124, 0, 13, NULL),
(537, 4, 128, 0, 13, 'bright-retro-ring-3'),
(563, 4, 69, 0, 14, 'Colorful Ring'),
(564, 4, 80, 0, 14, 'Bright Retro ring'),
(565, 4, 82, 0, 14, 'Bright Retro ring'),
(566, 4, 83, 0, 14, '/6/b/6b_2.png'),
(567, 4, 84, 0, 14, '/6/b/6b_2.png'),
(568, 4, 85, 0, 14, '/6/b/6b_2.png'),
(569, 4, 97, 0, 14, NULL),
(570, 4, 101, 0, 14, NULL),
(571, 4, 103, 0, 14, 'container2'),
(572, 4, 106, 0, 14, NULL),
(573, 4, 107, 0, 14, NULL),
(574, 4, 108, 0, 14, NULL),
(575, 4, 111, 0, 14, NULL),
(576, 4, 124, 0, 14, NULL),
(577, 4, 128, 0, 14, 'bright-retro-ring-4'),
(596, 4, 69, 0, 15, 'Purple Ring'),
(597, 4, 80, 0, 15, 'Bright Retro ring'),
(598, 4, 82, 0, 15, 'Bright Retro ring'),
(599, 4, 83, 0, 15, '/1/1/11b_1.png'),
(600, 4, 84, 0, 15, '/1/1/11b_1.png'),
(601, 4, 85, 0, 15, '/1/1/11b_1.png'),
(602, 4, 97, 0, 15, NULL),
(603, 4, 101, 0, 15, NULL),
(604, 4, 103, 0, 15, 'container2'),
(605, 4, 106, 0, 15, NULL),
(606, 4, 107, 0, 15, NULL),
(607, 4, 108, 0, 15, NULL),
(608, 4, 111, 0, 15, NULL),
(609, 4, 124, 0, 15, NULL),
(610, 4, 128, 0, 15, 'bright-retro-ring-5'),
(629, 4, 69, 0, 16, 'Bohemian Wall Clock '),
(630, 4, 80, 0, 16, 'Bright Retro ring'),
(631, 4, 82, 0, 16, 'Bright Retro ring'),
(632, 4, 83, 0, 16, '/1/5/15b.png'),
(633, 4, 84, 0, 16, '/1/5/15b.png'),
(634, 4, 85, 0, 16, '/1/5/15b.png'),
(635, 4, 97, 0, 16, NULL),
(636, 4, 101, 0, 16, NULL),
(637, 4, 103, 0, 16, 'container2'),
(638, 4, 106, 0, 16, NULL),
(639, 4, 107, 0, 16, NULL),
(640, 4, 108, 0, 16, NULL),
(641, 4, 111, 0, 16, NULL),
(642, 4, 124, 0, 16, NULL),
(643, 4, 128, 0, 16, 'bright-retro-ring-6'),
(733, 4, 69, 0, 18, 'Purple Wall Clock '),
(734, 4, 80, 0, 18, 'Bright Retro ring'),
(735, 4, 82, 0, 18, 'Bright Retro ring'),
(736, 4, 83, 0, 18, '/2/2/22a_1_1.png'),
(737, 4, 84, 0, 18, '/2/2/22a_1_1.png'),
(738, 4, 85, 0, 18, '/2/2/22a_1_1.png'),
(739, 4, 97, 0, 18, NULL),
(740, 4, 101, 0, 18, NULL),
(741, 4, 103, 0, 18, 'container2'),
(742, 4, 106, 0, 18, NULL),
(743, 4, 107, 0, 18, NULL),
(744, 4, 108, 0, 18, NULL),
(745, 4, 111, 0, 18, NULL),
(746, 4, 124, 0, 18, NULL),
(747, 4, 128, 0, 18, 'bright-retro-ring-7'),
(780, 4, 69, 0, 19, 'Round Wall Clock '),
(781, 4, 80, 0, 19, 'Bright Retro ring'),
(782, 4, 82, 0, 19, 'Bright Retro ring'),
(783, 4, 83, 0, 19, '/1/8/18c.png'),
(784, 4, 84, 0, 19, '/1/8/18c.png'),
(785, 4, 85, 0, 19, '/1/8/18c.png'),
(786, 4, 97, 0, 19, NULL),
(787, 4, 101, 0, 19, NULL),
(788, 4, 103, 0, 19, 'container2'),
(789, 4, 106, 0, 19, NULL),
(790, 4, 107, 0, 19, NULL),
(791, 4, 108, 0, 19, NULL),
(792, 4, 111, 0, 19, NULL),
(793, 4, 124, 0, 19, NULL),
(794, 4, 128, 0, 19, 'bright-retro-ring-8'),
(902, 4, 69, 0, 20, 'Colorful Becklec'),
(903, 4, 80, 0, 20, 'Bright Retro ring'),
(904, 4, 82, 0, 20, 'Bright Retro ring'),
(905, 4, 83, 0, 20, '/1/a/1a_8.png'),
(906, 4, 84, 0, 20, '/1/a/1a_8.png'),
(907, 4, 85, 0, 20, '/1/a/1a_8.png'),
(908, 4, 97, 0, 20, NULL),
(909, 4, 101, 0, 20, NULL),
(910, 4, 103, 0, 20, 'container2'),
(911, 4, 106, 0, 20, NULL),
(912, 4, 107, 0, 20, NULL),
(913, 4, 108, 0, 20, NULL),
(914, 4, 111, 0, 20, NULL),
(915, 4, 124, 0, 20, NULL),
(916, 4, 128, 0, 20, 'bright-retro-ring-9'),
(976, 4, 69, 0, 21, 'Blue Hydrangea earrings'),
(977, 4, 80, 0, 21, 'Blue Hydrangea earrings'),
(978, 4, 82, 0, 21, 'Blue Hydrangea earrings '),
(979, 4, 83, 0, 21, '/1/b/1b_3_1.png'),
(980, 4, 84, 0, 21, '/1/b/1b_3_1.png'),
(981, 4, 85, 0, 21, '/1/b/1b_3_1.png'),
(982, 4, 97, 0, 21, NULL),
(983, 4, 101, 0, 21, NULL),
(984, 4, 103, 0, 21, 'container2'),
(985, 4, 106, 0, 21, NULL),
(986, 4, 107, 0, 21, NULL),
(987, 4, 108, 0, 21, NULL),
(988, 4, 111, 0, 21, NULL),
(989, 4, 124, 0, 21, NULL),
(990, 4, 128, 0, 21, 'blue-hydrangea-earrings-4');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav`
--

DROP TABLE IF EXISTS `catalog_product_index_eav`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';

--
-- Dumping data for table `catalog_product_index_eav`
--

INSERT INTO `catalog_product_index_eav` (`entity_id`, `attribute_id`, `store_id`, `value`) VALUES
(2, 90, 1, 6),
(2, 90, 2, 6),
(2, 90, 3, 6),
(3, 90, 1, 7),
(3, 90, 2, 7),
(3, 90, 3, 7),
(4, 90, 1, 8),
(4, 90, 2, 8),
(4, 90, 3, 8),
(5, 90, 1, 9),
(5, 90, 2, 9),
(5, 90, 3, 9),
(6, 90, 1, 9),
(6, 90, 2, 9),
(6, 90, 3, 9),
(7, 90, 1, 9),
(7, 90, 2, 9),
(7, 90, 3, 9),
(8, 90, 1, 9),
(8, 90, 2, 9),
(8, 90, 3, 9),
(9, 90, 1, 9),
(9, 90, 2, 9),
(9, 90, 3, 9),
(10, 90, 1, 9),
(10, 90, 2, 9),
(10, 90, 3, 9),
(11, 90, 1, 9),
(11, 90, 2, 9),
(11, 90, 3, 9),
(12, 90, 1, 9),
(12, 90, 2, 9),
(12, 90, 3, 9),
(13, 90, 1, 6),
(13, 90, 2, 6),
(13, 90, 3, 6),
(14, 90, 1, 6),
(14, 90, 2, 6),
(14, 90, 3, 6),
(15, 90, 1, 6),
(15, 90, 2, 6),
(15, 90, 3, 6),
(16, 90, 1, 6),
(16, 90, 2, 6),
(16, 90, 3, 6),
(18, 90, 1, 9),
(18, 90, 2, 9),
(18, 90, 3, 9),
(19, 90, 1, 9),
(19, 90, 2, 9),
(19, 90, 3, 9),
(20, 90, 1, 6),
(20, 90, 2, 6),
(20, 90, 3, 6),
(1, 125, 1, 2),
(1, 125, 2, 2),
(1, 125, 3, 2),
(2, 125, 1, 2),
(2, 125, 2, 2),
(2, 125, 3, 2),
(3, 125, 1, 2),
(3, 125, 2, 2),
(3, 125, 3, 2),
(4, 125, 1, 2),
(4, 125, 2, 2),
(4, 125, 3, 2),
(5, 125, 1, 2),
(5, 125, 2, 2),
(5, 125, 3, 2),
(6, 125, 1, 2),
(6, 125, 2, 2),
(6, 125, 3, 2),
(7, 125, 1, 2),
(7, 125, 2, 2),
(7, 125, 3, 2),
(8, 125, 1, 2),
(8, 125, 2, 2),
(8, 125, 3, 2),
(9, 125, 1, 2),
(9, 125, 2, 2),
(9, 125, 3, 2),
(10, 125, 1, 2),
(10, 125, 2, 2),
(10, 125, 3, 2),
(11, 125, 1, 2),
(11, 125, 2, 2),
(11, 125, 3, 2),
(12, 125, 1, 2),
(12, 125, 2, 2),
(12, 125, 3, 2),
(13, 125, 1, 2),
(13, 125, 2, 2),
(13, 125, 3, 2),
(14, 125, 1, 2),
(14, 125, 2, 2),
(14, 125, 3, 2),
(15, 125, 1, 2),
(15, 125, 2, 2),
(15, 125, 3, 2),
(16, 125, 1, 2),
(16, 125, 2, 2),
(16, 125, 3, 2),
(18, 125, 1, 2),
(18, 125, 2, 2),
(18, 125, 3, 2),
(19, 125, 1, 2),
(19, 125, 2, 2),
(19, 125, 3, 2),
(20, 125, 1, 2),
(20, 125, 2, 2),
(20, 125, 3, 2),
(21, 125, 1, 2),
(21, 125, 2, 2),
(21, 125, 3, 2),
(2, 130, 1, 3),
(2, 130, 2, 3),
(2, 130, 3, 3),
(3, 130, 1, 3),
(3, 130, 2, 3),
(3, 130, 3, 3),
(4, 130, 1, 3),
(4, 130, 2, 3),
(4, 130, 3, 3),
(5, 130, 1, 3),
(5, 130, 2, 3),
(5, 130, 3, 3),
(6, 130, 1, 3),
(6, 130, 2, 3),
(6, 130, 3, 3),
(7, 130, 1, 3),
(7, 130, 2, 3),
(7, 130, 3, 3),
(8, 130, 1, 3),
(8, 130, 2, 3),
(8, 130, 3, 3),
(9, 130, 1, 3),
(9, 130, 2, 3),
(9, 130, 3, 3),
(10, 130, 1, 3),
(10, 130, 2, 3),
(10, 130, 3, 3),
(11, 130, 1, 3),
(11, 130, 2, 3),
(11, 130, 3, 3),
(12, 130, 1, 3),
(12, 130, 2, 3),
(12, 130, 3, 3),
(13, 130, 1, 3),
(13, 130, 2, 3),
(13, 130, 3, 3),
(14, 130, 1, 3),
(14, 130, 2, 3),
(14, 130, 3, 3),
(15, 130, 1, 3),
(15, 130, 2, 3),
(15, 130, 3, 3),
(16, 130, 1, 5),
(16, 130, 2, 5),
(16, 130, 3, 5),
(18, 130, 1, 5),
(18, 130, 2, 5),
(18, 130, 3, 5),
(19, 130, 1, 5),
(19, 130, 2, 5),
(19, 130, 3, 5),
(20, 130, 1, 3),
(20, 130, 2, 3),
(20, 130, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_decimal_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';

--
-- Dumping data for table `catalog_product_index_eav_idx`
--

INSERT INTO `catalog_product_index_eav_idx` (`entity_id`, `attribute_id`, `store_id`, `value`) VALUES
(2, 90, 1, 6),
(2, 90, 2, 6),
(2, 90, 3, 6),
(3, 90, 1, 7),
(3, 90, 2, 7),
(3, 90, 3, 7),
(4, 90, 1, 8),
(4, 90, 2, 8),
(4, 90, 3, 8),
(5, 90, 1, 9),
(5, 90, 2, 9),
(5, 90, 3, 9),
(6, 90, 1, 9),
(6, 90, 2, 9),
(6, 90, 3, 9),
(7, 90, 1, 9),
(7, 90, 2, 9),
(7, 90, 3, 9),
(8, 90, 1, 9),
(8, 90, 2, 9),
(8, 90, 3, 9),
(9, 90, 1, 9),
(9, 90, 2, 9),
(9, 90, 3, 9),
(10, 90, 1, 9),
(10, 90, 2, 9),
(10, 90, 3, 9),
(11, 90, 1, 9),
(11, 90, 2, 9),
(11, 90, 3, 9),
(12, 90, 1, 9),
(12, 90, 2, 9),
(12, 90, 3, 9),
(13, 90, 1, 6),
(13, 90, 2, 6),
(13, 90, 3, 6),
(14, 90, 1, 6),
(14, 90, 2, 6),
(14, 90, 3, 6),
(15, 90, 1, 6),
(15, 90, 2, 6),
(15, 90, 3, 6),
(16, 90, 1, 6),
(16, 90, 2, 6),
(16, 90, 3, 6),
(18, 90, 1, 9),
(18, 90, 2, 9),
(18, 90, 3, 9),
(19, 90, 1, 9),
(19, 90, 2, 9),
(19, 90, 3, 9),
(20, 90, 1, 6),
(20, 90, 2, 6),
(20, 90, 3, 6),
(1, 125, 1, 2),
(1, 125, 2, 2),
(1, 125, 3, 2),
(2, 125, 1, 2),
(2, 125, 2, 2),
(2, 125, 3, 2),
(3, 125, 1, 2),
(3, 125, 2, 2),
(3, 125, 3, 2),
(4, 125, 1, 2),
(4, 125, 2, 2),
(4, 125, 3, 2),
(5, 125, 1, 2),
(5, 125, 2, 2),
(5, 125, 3, 2),
(6, 125, 1, 2),
(6, 125, 2, 2),
(6, 125, 3, 2),
(7, 125, 1, 2),
(7, 125, 2, 2),
(7, 125, 3, 2),
(8, 125, 1, 2),
(8, 125, 2, 2),
(8, 125, 3, 2),
(9, 125, 1, 2),
(9, 125, 2, 2),
(9, 125, 3, 2),
(10, 125, 1, 2),
(10, 125, 2, 2),
(10, 125, 3, 2),
(11, 125, 1, 2),
(11, 125, 2, 2),
(11, 125, 3, 2),
(12, 125, 1, 2),
(12, 125, 2, 2),
(12, 125, 3, 2),
(13, 125, 1, 2),
(13, 125, 2, 2),
(13, 125, 3, 2),
(14, 125, 1, 2),
(14, 125, 2, 2),
(14, 125, 3, 2),
(15, 125, 1, 2),
(15, 125, 2, 2),
(15, 125, 3, 2),
(16, 125, 1, 2),
(16, 125, 2, 2),
(16, 125, 3, 2),
(18, 125, 1, 2),
(18, 125, 2, 2),
(18, 125, 3, 2),
(19, 125, 1, 2),
(19, 125, 2, 2),
(19, 125, 3, 2),
(20, 125, 1, 2),
(20, 125, 2, 2),
(20, 125, 3, 2),
(2, 130, 1, 3),
(2, 130, 2, 3),
(2, 130, 3, 3),
(3, 130, 1, 3),
(3, 130, 2, 3),
(3, 130, 3, 3),
(4, 130, 1, 3),
(4, 130, 2, 3),
(4, 130, 3, 3),
(5, 130, 1, 3),
(5, 130, 2, 3),
(5, 130, 3, 3),
(6, 130, 1, 3),
(6, 130, 2, 3),
(6, 130, 3, 3),
(7, 130, 1, 3),
(7, 130, 2, 3),
(7, 130, 3, 3),
(8, 130, 1, 3),
(8, 130, 2, 3),
(8, 130, 3, 3),
(9, 130, 1, 3),
(9, 130, 2, 3),
(9, 130, 3, 3),
(10, 130, 1, 3),
(10, 130, 2, 3),
(10, 130, 3, 3),
(11, 130, 1, 3),
(11, 130, 2, 3),
(11, 130, 3, 3),
(12, 130, 1, 3),
(12, 130, 2, 3),
(12, 130, 3, 3),
(13, 130, 1, 3),
(13, 130, 2, 3),
(13, 130, 3, 3),
(14, 130, 1, 3),
(14, 130, 2, 3),
(14, 130, 3, 3),
(15, 130, 1, 3),
(15, 130, 2, 3),
(15, 130, 3, 3),
(16, 130, 1, 5),
(16, 130, 2, 5),
(16, 130, 3, 5),
(18, 130, 1, 5),
(18, 130, 2, 5),
(18, 130, 3, 5),
(19, 130, 1, 5),
(19, 130, 2, 5),
(19, 130, 3, 5),
(20, 130, 1, 3),
(20, 130, 2, 3),
(20, 130, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_eav_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';

--
-- Dumping data for table `catalog_product_index_eav_tmp`
--

INSERT INTO `catalog_product_index_eav_tmp` (`entity_id`, `attribute_id`, `store_id`, `value`) VALUES
(11, 90, 1, 9),
(11, 125, 1, 2),
(11, 130, 1, 3),
(11, 90, 2, 9),
(11, 125, 2, 2),
(11, 130, 2, 3),
(11, 90, 3, 9),
(11, 125, 3, 2),
(11, 130, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_group_price`
--

DROP TABLE IF EXISTS `catalog_product_index_group_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_group_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_GROUP_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price`
--

DROP TABLE IF EXISTS `catalog_product_index_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `IDX_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';

--
-- Dumping data for table `catalog_product_index_price`
--

INSERT INTO `catalog_product_index_price` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`, `group_price`) VALUES
(1, 0, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(1, 1, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(1, 2, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(1, 3, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(2, 0, 1, 2, '125.0000', '125.0000', '129.0000', '134.0000', NULL, NULL),
(2, 1, 1, 2, '125.0000', '125.0000', '129.0000', '134.0000', NULL, NULL),
(2, 2, 1, 2, '125.0000', '125.0000', '129.0000', '134.0000', NULL, NULL),
(2, 3, 1, 2, '125.0000', '125.0000', '129.0000', '134.0000', NULL, NULL),
(3, 0, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(3, 1, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(3, 2, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(3, 3, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(4, 0, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(4, 1, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(4, 2, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(4, 3, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(5, 0, 1, 2, '20.0000', '20.0000', '24.0000', '29.0000', NULL, NULL),
(5, 1, 1, 2, '20.0000', '20.0000', '24.0000', '29.0000', NULL, NULL),
(5, 2, 1, 2, '20.0000', '20.0000', '24.0000', '29.0000', NULL, NULL),
(5, 3, 1, 2, '20.0000', '20.0000', '24.0000', '29.0000', NULL, NULL),
(6, 0, 1, 2, '1200.0000', '1200.0000', '1204.0000', '1209.0000', NULL, NULL),
(6, 1, 1, 2, '1200.0000', '1200.0000', '1204.0000', '1209.0000', NULL, NULL),
(6, 2, 1, 2, '1200.0000', '1200.0000', '1204.0000', '1209.0000', NULL, NULL),
(6, 3, 1, 2, '1200.0000', '1200.0000', '1204.0000', '1209.0000', NULL, NULL),
(7, 0, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(7, 1, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(7, 2, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(7, 3, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(8, 0, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(8, 1, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(8, 2, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(8, 3, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(9, 0, 1, 2, '520.0000', '520.0000', '524.0000', '529.0000', NULL, NULL),
(9, 1, 1, 2, '520.0000', '520.0000', '524.0000', '529.0000', NULL, NULL),
(9, 2, 1, 2, '520.0000', '520.0000', '524.0000', '529.0000', NULL, NULL),
(9, 3, 1, 2, '520.0000', '520.0000', '524.0000', '529.0000', NULL, NULL),
(10, 0, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(10, 1, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(10, 2, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(10, 3, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(11, 0, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(11, 1, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(11, 2, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(11, 3, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(12, 0, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(12, 1, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(12, 2, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(12, 3, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(13, 0, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(13, 1, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(13, 2, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(13, 3, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(14, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(14, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(14, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(14, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(15, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(15, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(15, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(15, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(16, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(16, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(16, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(16, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(18, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(18, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(18, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(18, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(19, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(19, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(19, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(19, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(20, 0, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(20, 1, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(20, 2, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(20, 3, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(21, 0, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(21, 1, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(21, 2, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(21, 3, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_opt_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_sel_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_bundle_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_agr_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_cfg_opt_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_downlod_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_final_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';

--
-- Dumping data for table `catalog_product_index_price_idx`
--

INSERT INTO `catalog_product_index_price_idx` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`, `group_price`) VALUES
(1, 0, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(1, 1, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(1, 2, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(1, 3, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(2, 0, 1, 2, '125.0000', '125.0000', '129.0000', '134.0000', NULL, NULL),
(2, 1, 1, 2, '125.0000', '125.0000', '129.0000', '134.0000', NULL, NULL),
(2, 2, 1, 2, '125.0000', '125.0000', '129.0000', '134.0000', NULL, NULL),
(2, 3, 1, 2, '125.0000', '125.0000', '129.0000', '134.0000', NULL, NULL),
(3, 0, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(3, 1, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(3, 2, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(3, 3, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(4, 0, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(4, 1, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(4, 2, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(4, 3, 1, 2, '500.0000', '500.0000', '504.0000', '509.0000', NULL, NULL),
(5, 0, 1, 2, '20.0000', '20.0000', '24.0000', '29.0000', NULL, NULL),
(5, 1, 1, 2, '20.0000', '20.0000', '24.0000', '29.0000', NULL, NULL),
(5, 2, 1, 2, '20.0000', '20.0000', '24.0000', '29.0000', NULL, NULL),
(5, 3, 1, 2, '20.0000', '20.0000', '24.0000', '29.0000', NULL, NULL),
(6, 0, 1, 2, '1200.0000', '1200.0000', '1204.0000', '1209.0000', NULL, NULL),
(6, 1, 1, 2, '1200.0000', '1200.0000', '1204.0000', '1209.0000', NULL, NULL),
(6, 2, 1, 2, '1200.0000', '1200.0000', '1204.0000', '1209.0000', NULL, NULL),
(6, 3, 1, 2, '1200.0000', '1200.0000', '1204.0000', '1209.0000', NULL, NULL),
(7, 0, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(7, 1, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(7, 2, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(7, 3, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(8, 0, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(8, 1, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(8, 2, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(8, 3, 1, 2, '2150.0000', '2150.0000', '2154.0000', '2159.0000', NULL, NULL),
(9, 0, 1, 2, '520.0000', '520.0000', '524.0000', '529.0000', NULL, NULL),
(9, 1, 1, 2, '520.0000', '520.0000', '524.0000', '529.0000', NULL, NULL),
(9, 2, 1, 2, '520.0000', '520.0000', '524.0000', '529.0000', NULL, NULL),
(9, 3, 1, 2, '520.0000', '520.0000', '524.0000', '529.0000', NULL, NULL),
(10, 0, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(10, 1, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(10, 2, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(10, 3, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(11, 0, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(11, 1, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(11, 2, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(11, 3, 1, 2, '120.0000', '120.0000', '124.0000', '129.0000', NULL, NULL),
(12, 0, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(12, 1, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(12, 2, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(12, 3, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(13, 0, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(13, 1, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(13, 2, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(13, 3, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(14, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(14, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(14, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(14, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(15, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(15, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(15, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(15, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(16, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(16, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(16, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(16, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(18, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(18, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(18, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(18, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(19, 0, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(19, 1, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(19, 2, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(19, 3, 1, 2, '103.0000', '103.0000', '107.0000', '112.0000', NULL, NULL),
(20, 0, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(20, 1, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(20, 2, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL),
(20, 3, 1, 2, '1520.0000', '1520.0000', '1524.0000', '1529.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_agr_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_idx`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_opt_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `catalog_product_index_price_tmp`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';

--
-- Dumping data for table `catalog_product_index_price_tmp`
--

INSERT INTO `catalog_product_index_price_tmp` (`entity_id`, `customer_group_id`, `website_id`, `tax_class_id`, `price`, `final_price`, `min_price`, `max_price`, `tier_price`, `group_price`) VALUES
(21, 0, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(21, 1, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(21, 2, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL),
(21, 3, 1, 2, '125.0000', '125.0000', '125.0000', '125.0000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `catalog_product_index_tier_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_index_website`
--

DROP TABLE IF EXISTS `catalog_product_index_website`;
CREATE TABLE IF NOT EXISTS `catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `IDX_CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';

--
-- Dumping data for table `catalog_product_index_website`
--

INSERT INTO `catalog_product_index_website` (`website_id`, `website_date`, `rate`) VALUES
(1, '2014-12-22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link`
--

DROP TABLE IF EXISTS `catalog_product_link`;
CREATE TABLE IF NOT EXISTS `catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_LNK_TYPE_ID_PRD_ID_LNKED_PRD_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table' AUTO_INCREMENT=72 ;

--
-- Dumping data for table `catalog_product_link`
--

INSERT INTO `catalog_product_link` (`link_id`, `product_id`, `linked_product_id`, `link_type_id`) VALUES
(1, 3, 1, 1),
(2, 3, 2, 1),
(3, 4, 1, 1),
(4, 4, 2, 1),
(5, 5, 1, 1),
(6, 5, 2, 1),
(7, 5, 3, 1),
(10, 6, 1, 1),
(11, 6, 2, 1),
(15, 7, 1, 1),
(16, 7, 2, 1),
(17, 7, 3, 1),
(18, 8, 1, 1),
(19, 8, 2, 1),
(20, 8, 3, 1),
(21, 9, 1, 1),
(22, 9, 2, 1),
(23, 9, 3, 1),
(24, 10, 1, 1),
(25, 10, 2, 1),
(26, 10, 3, 1),
(27, 11, 1, 1),
(28, 11, 2, 1),
(29, 11, 3, 1),
(30, 12, 1, 1),
(31, 12, 2, 1),
(32, 12, 3, 1),
(33, 13, 1, 1),
(34, 13, 2, 1),
(35, 13, 3, 1),
(36, 14, 1, 1),
(37, 14, 2, 1),
(38, 14, 3, 1),
(39, 15, 1, 1),
(40, 15, 2, 1),
(41, 15, 3, 1),
(42, 16, 1, 1),
(43, 16, 2, 1),
(44, 16, 3, 1),
(48, 18, 1, 1),
(49, 18, 2, 1),
(50, 18, 3, 1),
(51, 19, 1, 1),
(52, 19, 2, 1),
(53, 19, 3, 1),
(69, 20, 1, 1),
(70, 20, 2, 1),
(71, 20, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_product_link_attribute`
--

INSERT INTO `catalog_product_link_attribute` (`product_link_attribute_id`, `link_type_id`, `product_link_attribute_code`, `data_type`) VALUES
(1, 1, 'position', 'int'),
(2, 4, 'position', 'int'),
(3, 5, 'position', 'int'),
(4, 3, 'position', 'int'),
(5, 3, 'qty', 'decimal');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_decimal`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_int`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table' AUTO_INCREMENT=82 ;

--
-- Dumping data for table `catalog_product_link_attribute_int`
--

INSERT INTO `catalog_product_link_attribute_int` (`value_id`, `product_link_attribute_id`, `link_id`, `value`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(5, 1, 3, 0),
(6, 1, 4, 0),
(7, 1, 5, 0),
(8, 1, 6, 0),
(11, 1, 7, 0),
(14, 1, 10, 0),
(15, 1, 11, 0),
(22, 1, 15, 0),
(23, 1, 16, 0),
(24, 1, 17, 0),
(28, 1, 18, 0),
(29, 1, 19, 0),
(30, 1, 20, 0),
(31, 1, 21, 0),
(32, 1, 22, 0),
(33, 1, 23, 0),
(34, 1, 24, 0),
(35, 1, 25, 0),
(36, 1, 26, 0),
(37, 1, 27, 0),
(38, 1, 28, 0),
(39, 1, 29, 0),
(40, 1, 30, 0),
(41, 1, 31, 0),
(42, 1, 32, 0),
(43, 1, 33, 0),
(44, 1, 34, 0),
(45, 1, 35, 0),
(46, 1, 36, 0),
(47, 1, 37, 0),
(48, 1, 38, 0),
(49, 1, 39, 0),
(50, 1, 40, 0),
(51, 1, 41, 0),
(52, 1, 42, 0),
(53, 1, 43, 0),
(54, 1, 44, 0),
(58, 1, 48, 0),
(59, 1, 49, 0),
(60, 1, 50, 0),
(61, 1, 51, 0),
(62, 1, 52, 0),
(63, 1, 53, 0),
(79, 1, 69, 0),
(80, 1, 70, 0),
(81, 1, 71, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `catalog_product_link_attribute_varchar`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_link_type`
--

DROP TABLE IF EXISTS `catalog_product_link_type`;
CREATE TABLE IF NOT EXISTS `catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `catalog_product_link_type`
--

INSERT INTO `catalog_product_link_type` (`link_type_id`, `code`) VALUES
(1, 'relation'),
(3, 'super'),
(4, 'up_sell'),
(5, 'cross_sell');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option`
--

DROP TABLE IF EXISTS `catalog_product_option`;
CREATE TABLE IF NOT EXISTS `catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `catalog_product_option`
--

INSERT INTO `catalog_product_option` (`option_id`, `product_id`, `type`, `is_require`, `sku`, `max_characters`, `file_extension`, `image_size_x`, `image_size_y`, `sort_order`) VALUES
(1, 2, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(2, 3, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(3, 4, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(4, 5, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(5, 6, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(6, 7, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(7, 8, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(8, 9, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(9, 10, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(10, 11, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(11, 12, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(12, 13, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(13, 14, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(14, 15, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(15, 16, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(17, 18, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(18, 19, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0),
(19, 20, 'radio', 1, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_price`
--

DROP TABLE IF EXISTS `catalog_product_option_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_title`
--

DROP TABLE IF EXISTS `catalog_product_option_title`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table' AUTO_INCREMENT=20 ;

--
-- Dumping data for table `catalog_product_option_title`
--

INSERT INTO `catalog_product_option_title` (`option_title_id`, `option_id`, `store_id`, `title`) VALUES
(1, 1, 0, 'Select an option'),
(2, 2, 0, 'Select an option'),
(3, 3, 0, 'Select an option'),
(4, 4, 0, 'Select an option'),
(5, 5, 0, 'Select an option'),
(6, 6, 0, 'Select an option'),
(7, 7, 0, 'Select an option'),
(8, 8, 0, 'Select an option'),
(9, 9, 0, 'Select an option'),
(10, 10, 0, 'Select an option'),
(11, 11, 0, 'Select an option'),
(12, 12, 0, 'Select an option'),
(13, 13, 0, 'Select an option'),
(14, 14, 0, 'Select an option'),
(15, 15, 0, 'Select an option'),
(17, 17, 0, 'Select an option'),
(18, 18, 0, 'Select an option'),
(19, 19, 0, 'Select an option');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `catalog_product_option_type_price`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table' AUTO_INCREMENT=58 ;

--
-- Dumping data for table `catalog_product_option_type_price`
--

INSERT INTO `catalog_product_option_type_price` (`option_type_price_id`, `option_type_id`, `store_id`, `price`, `price_type`) VALUES
(1, 1, 0, '4.0000', 'fixed'),
(2, 2, 0, '5.0000', 'fixed'),
(3, 3, 0, '9.0000', 'fixed'),
(4, 4, 0, '4.0000', 'fixed'),
(5, 5, 0, '5.0000', 'fixed'),
(6, 6, 0, '9.0000', 'fixed'),
(7, 7, 0, '4.0000', 'fixed'),
(8, 8, 0, '5.0000', 'fixed'),
(9, 9, 0, '9.0000', 'fixed'),
(10, 10, 0, '4.0000', 'fixed'),
(11, 11, 0, '5.0000', 'fixed'),
(12, 12, 0, '9.0000', 'fixed'),
(13, 13, 0, '4.0000', 'fixed'),
(14, 14, 0, '5.0000', 'fixed'),
(15, 15, 0, '9.0000', 'fixed'),
(16, 16, 0, '4.0000', 'fixed'),
(17, 17, 0, '5.0000', 'fixed'),
(18, 18, 0, '9.0000', 'fixed'),
(19, 19, 0, '4.0000', 'fixed'),
(20, 20, 0, '5.0000', 'fixed'),
(21, 21, 0, '9.0000', 'fixed'),
(22, 22, 0, '4.0000', 'fixed'),
(23, 23, 0, '5.0000', 'fixed'),
(24, 24, 0, '9.0000', 'fixed'),
(25, 25, 0, '4.0000', 'fixed'),
(26, 26, 0, '5.0000', 'fixed'),
(27, 27, 0, '9.0000', 'fixed'),
(28, 28, 0, '4.0000', 'fixed'),
(29, 29, 0, '5.0000', 'fixed'),
(30, 30, 0, '9.0000', 'fixed'),
(31, 31, 0, '4.0000', 'fixed'),
(32, 32, 0, '5.0000', 'fixed'),
(33, 33, 0, '9.0000', 'fixed'),
(34, 34, 0, '4.0000', 'fixed'),
(35, 35, 0, '5.0000', 'fixed'),
(36, 36, 0, '9.0000', 'fixed'),
(37, 37, 0, '4.0000', 'fixed'),
(38, 38, 0, '5.0000', 'fixed'),
(39, 39, 0, '9.0000', 'fixed'),
(40, 40, 0, '4.0000', 'fixed'),
(41, 41, 0, '5.0000', 'fixed'),
(42, 42, 0, '9.0000', 'fixed'),
(43, 43, 0, '4.0000', 'fixed'),
(44, 44, 0, '5.0000', 'fixed'),
(45, 45, 0, '9.0000', 'fixed'),
(49, 49, 0, '4.0000', 'fixed'),
(50, 50, 0, '5.0000', 'fixed'),
(51, 51, 0, '9.0000', 'fixed'),
(52, 52, 0, '4.0000', 'fixed'),
(53, 53, 0, '5.0000', 'fixed'),
(54, 54, 0, '9.0000', 'fixed'),
(55, 55, 0, '4.0000', 'fixed'),
(56, 56, 0, '5.0000', 'fixed'),
(57, 57, 0, '9.0000', 'fixed');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `catalog_product_option_type_title`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table' AUTO_INCREMENT=58 ;

--
-- Dumping data for table `catalog_product_option_type_title`
--

INSERT INTO `catalog_product_option_type_title` (`option_type_title_id`, `option_type_id`, `store_id`, `title`) VALUES
(1, 1, 0, 'Blue to Mint '),
(2, 2, 0, 'Flower jewelry'),
(3, 3, 0, 'Red diamond'),
(4, 4, 0, 'Blue to Mint '),
(5, 5, 0, 'Flower jewelry'),
(6, 6, 0, 'Red diamond'),
(7, 7, 0, 'Blue to Mint '),
(8, 8, 0, 'Flower jewelry'),
(9, 9, 0, 'Red diamond'),
(10, 10, 0, 'Blue to Mint '),
(11, 11, 0, 'Flower jewelry'),
(12, 12, 0, 'Red diamond'),
(13, 13, 0, 'Blue to Mint '),
(14, 14, 0, 'Flower jewelry'),
(15, 15, 0, 'Red diamond'),
(16, 16, 0, 'Blue to Mint '),
(17, 17, 0, 'Flower jewelry'),
(18, 18, 0, 'Red diamond'),
(19, 19, 0, 'Blue to Mint '),
(20, 20, 0, 'Flower jewelry'),
(21, 21, 0, 'Red diamond'),
(22, 22, 0, 'Blue to Mint '),
(23, 23, 0, 'Flower jewelry'),
(24, 24, 0, 'Red diamond'),
(25, 25, 0, 'Blue to Mint '),
(26, 26, 0, 'Flower jewelry'),
(27, 27, 0, 'Red diamond'),
(28, 28, 0, 'Blue to Mint '),
(29, 29, 0, 'Flower jewelry'),
(30, 30, 0, 'Red diamond'),
(31, 31, 0, 'Blue to Mint '),
(32, 32, 0, 'Flower jewelry'),
(33, 33, 0, 'Red diamond'),
(34, 34, 0, 'Blue to Mint '),
(35, 35, 0, 'Flower jewelry'),
(36, 36, 0, 'Red diamond'),
(37, 37, 0, 'Blue to Mint '),
(38, 38, 0, 'Flower jewelry'),
(39, 39, 0, 'Red diamond'),
(40, 40, 0, 'Blue to Mint '),
(41, 41, 0, 'Flower jewelry'),
(42, 42, 0, 'Red diamond'),
(43, 43, 0, 'Blue to Mint '),
(44, 44, 0, 'Flower jewelry'),
(45, 45, 0, 'Red diamond'),
(49, 49, 0, 'Blue to Mint '),
(50, 50, 0, 'Flower jewelry'),
(51, 51, 0, 'Red diamond'),
(52, 52, 0, 'Blue to Mint '),
(53, 53, 0, 'Flower jewelry'),
(54, 54, 0, 'Red diamond'),
(55, 55, 0, 'Blue to Mint '),
(56, 56, 0, 'Flower jewelry'),
(57, 57, 0, 'Red diamond');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `catalog_product_option_type_value`;
CREATE TABLE IF NOT EXISTS `catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `IDX_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table' AUTO_INCREMENT=58 ;

--
-- Dumping data for table `catalog_product_option_type_value`
--

INSERT INTO `catalog_product_option_type_value` (`option_type_id`, `option_id`, `sku`, `sort_order`) VALUES
(1, 1, NULL, 0),
(2, 1, NULL, 1),
(3, 1, NULL, 2),
(4, 2, NULL, 0),
(5, 2, NULL, 1),
(6, 2, NULL, 2),
(7, 3, NULL, 0),
(8, 3, NULL, 1),
(9, 3, NULL, 2),
(10, 4, NULL, 0),
(11, 4, NULL, 1),
(12, 4, NULL, 2),
(13, 5, NULL, 0),
(14, 5, NULL, 1),
(15, 5, NULL, 2),
(16, 6, NULL, 0),
(17, 6, NULL, 1),
(18, 6, NULL, 2),
(19, 7, NULL, 0),
(20, 7, NULL, 1),
(21, 7, NULL, 2),
(22, 8, NULL, 0),
(23, 8, NULL, 1),
(24, 8, NULL, 2),
(25, 9, NULL, 0),
(26, 9, NULL, 1),
(27, 9, NULL, 2),
(28, 10, NULL, 0),
(29, 10, NULL, 1),
(30, 10, NULL, 2),
(31, 11, NULL, 0),
(32, 11, NULL, 1),
(33, 11, NULL, 2),
(34, 12, NULL, 0),
(35, 12, NULL, 1),
(36, 12, NULL, 2),
(37, 13, NULL, 0),
(38, 13, NULL, 1),
(39, 13, NULL, 2),
(40, 14, NULL, 0),
(41, 14, NULL, 1),
(42, 14, NULL, 2),
(43, 15, NULL, 0),
(44, 15, NULL, 1),
(45, 15, NULL, 2),
(49, 17, NULL, 0),
(50, 17, NULL, 1),
(51, 17, NULL, 2),
(52, 18, NULL, 0),
(53, 18, NULL, 1),
(54, 18, NULL, 2),
(55, 19, NULL, 0),
(56, 19, NULL, 1),
(57, 19, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_relation`
--

DROP TABLE IF EXISTS `catalog_product_relation`;
CREATE TABLE IF NOT EXISTS `catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `IDX_CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute`;
CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_label`;
CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_attribute_pricing`
--

DROP TABLE IF EXISTS `catalog_product_super_attribute_pricing`;
CREATE TABLE IF NOT EXISTS `catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `value_index` varchar(255) DEFAULT NULL COMMENT 'Value Index',
  `is_percent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Percent',
  `pricing_value` decimal(12,4) DEFAULT NULL COMMENT 'Pricing Value',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID_VAL_IDX_WS_ID` (`product_super_attribute_id`,`value_index`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRICING_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Pricing Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_super_link`
--

DROP TABLE IF EXISTS `catalog_product_super_link`;
CREATE TABLE IF NOT EXISTS `catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `IDX_CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_product_website`
--

DROP TABLE IF EXISTS `catalog_product_website`;
CREATE TABLE IF NOT EXISTS `catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `IDX_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';

--
-- Dumping data for table `catalog_product_website`
--

INSERT INTO `catalog_product_website` (`product_id`, `website_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_url_rewrite_product_category`
--

DROP TABLE IF EXISTS `catalog_url_rewrite_product_category`;
CREATE TABLE IF NOT EXISTS `catalog_url_rewrite_product_category` (
  `url_rewrite_id` int(10) unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int(10) unsigned NOT NULL COMMENT 'category_id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'product_id',
  KEY `IDX_CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `FK_CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `FK_BB79E64705D7F17FE181F23144528FC8` (`url_rewrite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url_rewrite_relation';

--
-- Dumping data for table `catalog_url_rewrite_product_category`
--

INSERT INTO `catalog_url_rewrite_product_category` (`url_rewrite_id`, `category_id`, `product_id`) VALUES
(15, 3, 1),
(16, 4, 1),
(17, 5, 1),
(18, 6, 1),
(19, 7, 1),
(20, 8, 1),
(21, 9, 1),
(22, 10, 1),
(23, 11, 1),
(24, 12, 1),
(26, 3, 2),
(27, 4, 2),
(28, 5, 2),
(29, 6, 2),
(30, 7, 2),
(31, 8, 2),
(32, 9, 2),
(33, 10, 2),
(34, 11, 2),
(35, 12, 2),
(37, 3, 3),
(38, 4, 3),
(39, 5, 3),
(40, 6, 3),
(41, 7, 3),
(42, 8, 3),
(43, 9, 3),
(44, 10, 3),
(45, 11, 3),
(46, 12, 3),
(59, 3, 4),
(60, 4, 4),
(61, 5, 4),
(62, 6, 4),
(63, 7, 4),
(64, 8, 4),
(65, 9, 4),
(66, 10, 4),
(67, 11, 4),
(68, 12, 4),
(81, 3, 5),
(82, 4, 5),
(83, 5, 5),
(84, 6, 5),
(85, 7, 5),
(86, 8, 5),
(87, 9, 5),
(88, 10, 5),
(89, 11, 5),
(90, 12, 5),
(103, 3, 6),
(104, 4, 6),
(105, 5, 6),
(106, 6, 6),
(107, 7, 6),
(108, 8, 6),
(109, 9, 6),
(110, 10, 6),
(111, 11, 6),
(112, 12, 6),
(142, 10, 7),
(143, 11, 7),
(144, 12, 7),
(137, 5, 7),
(140, 8, 7),
(141, 9, 7),
(139, 7, 7),
(138, 6, 7),
(136, 4, 7),
(162, 10, 8),
(156, 3, 8),
(163, 11, 8),
(157, 5, 8),
(160, 8, 8),
(161, 9, 8),
(159, 7, 8),
(158, 6, 8),
(179, 10, 9),
(180, 11, 9),
(174, 5, 9),
(177, 8, 9),
(178, 9, 9),
(176, 7, 9),
(175, 6, 9),
(229, 10, 11),
(222, 3, 11),
(224, 5, 11),
(227, 8, 11),
(223, 4, 11),
(228, 9, 11),
(226, 7, 11),
(225, 6, 11),
(238, 10, 12),
(231, 3, 12),
(233, 5, 12),
(236, 8, 12),
(232, 4, 12),
(237, 9, 12),
(235, 7, 12),
(234, 6, 12),
(247, 10, 13),
(240, 3, 13),
(242, 5, 13),
(245, 8, 13),
(241, 4, 13),
(246, 9, 13),
(244, 7, 13),
(243, 6, 13),
(256, 10, 14),
(249, 3, 14),
(251, 5, 14),
(254, 8, 14),
(250, 4, 14),
(255, 9, 14),
(253, 7, 14),
(252, 6, 14),
(265, 10, 15),
(258, 3, 15),
(260, 5, 15),
(263, 8, 15),
(259, 4, 15),
(264, 9, 15),
(262, 7, 15),
(261, 6, 15),
(281, 10, 16),
(276, 5, 16),
(279, 8, 16),
(280, 9, 16),
(278, 7, 16),
(277, 6, 16),
(302, 10, 18),
(303, 12, 18),
(297, 5, 18),
(300, 8, 18),
(301, 9, 18),
(299, 7, 18),
(298, 6, 18),
(310, 10, 19),
(311, 12, 19),
(305, 5, 19),
(308, 8, 19),
(309, 9, 19),
(307, 7, 19),
(306, 6, 19),
(365, 10, 20),
(358, 3, 20),
(360, 5, 20),
(363, 8, 20),
(359, 4, 20),
(364, 9, 20),
(362, 7, 20),
(361, 6, 20),
(379, 3, 1),
(380, 4, 1),
(381, 5, 1),
(382, 6, 1),
(383, 7, 1),
(384, 8, 1),
(385, 9, 1),
(386, 10, 1),
(387, 11, 1),
(388, 12, 1),
(390, 3, 2),
(391, 4, 2),
(392, 5, 2),
(393, 6, 2),
(394, 7, 2),
(395, 8, 2),
(396, 9, 2),
(397, 10, 2),
(398, 11, 2),
(399, 12, 2),
(401, 3, 3),
(402, 4, 3),
(403, 5, 3),
(404, 6, 3),
(405, 7, 3),
(406, 8, 3),
(407, 9, 3),
(408, 10, 3),
(409, 11, 3),
(410, 12, 3),
(412, 3, 4),
(413, 4, 4),
(414, 5, 4),
(415, 6, 4),
(416, 7, 4),
(417, 8, 4),
(418, 9, 4),
(419, 10, 4),
(420, 11, 4),
(421, 12, 4),
(423, 3, 5),
(424, 4, 5),
(425, 5, 5),
(426, 6, 5),
(427, 7, 5),
(428, 8, 5),
(429, 9, 5),
(430, 10, 5),
(431, 11, 5),
(432, 12, 5),
(434, 3, 6),
(435, 4, 6),
(436, 5, 6),
(437, 6, 6),
(438, 7, 6),
(439, 8, 6),
(440, 9, 6),
(441, 10, 6),
(442, 11, 6),
(443, 12, 6),
(445, 4, 7),
(446, 5, 7),
(447, 6, 7),
(448, 7, 7),
(449, 8, 7),
(450, 9, 7),
(451, 10, 7),
(452, 11, 7),
(453, 12, 7),
(455, 3, 8),
(456, 5, 8),
(457, 6, 8),
(458, 7, 8),
(459, 8, 8),
(460, 9, 8),
(461, 10, 8),
(462, 11, 8),
(464, 5, 9),
(465, 6, 9),
(466, 7, 9),
(467, 8, 9),
(468, 9, 9),
(469, 10, 9),
(470, 11, 9),
(480, 3, 11),
(481, 4, 11),
(482, 5, 11),
(483, 6, 11),
(484, 7, 11),
(485, 8, 11),
(486, 9, 11),
(487, 10, 11),
(489, 3, 12),
(490, 4, 12),
(491, 5, 12),
(492, 6, 12),
(493, 7, 12),
(494, 8, 12),
(495, 9, 12),
(496, 10, 12),
(498, 3, 13),
(499, 4, 13),
(500, 5, 13),
(501, 6, 13),
(502, 7, 13),
(503, 8, 13),
(504, 9, 13),
(505, 10, 13),
(507, 3, 14),
(508, 4, 14),
(509, 5, 14),
(510, 6, 14),
(511, 7, 14),
(512, 8, 14),
(513, 9, 14),
(514, 10, 14),
(516, 3, 15),
(517, 4, 15),
(518, 5, 15),
(519, 6, 15),
(520, 7, 15),
(521, 8, 15),
(522, 9, 15),
(523, 10, 15),
(525, 5, 16),
(526, 6, 16),
(527, 7, 16),
(528, 8, 16),
(529, 9, 16),
(530, 10, 16),
(532, 5, 18),
(533, 6, 18),
(534, 7, 18),
(535, 8, 18),
(536, 9, 18),
(537, 10, 18),
(538, 12, 18),
(540, 5, 19),
(541, 6, 19),
(542, 7, 19),
(543, 8, 19),
(544, 9, 19),
(545, 10, 19),
(546, 12, 19),
(548, 3, 20),
(549, 4, 20),
(550, 5, 20),
(551, 6, 20),
(552, 7, 20),
(553, 8, 20),
(554, 9, 20),
(555, 10, 20),
(567, 3, 1),
(568, 4, 1),
(569, 5, 1),
(570, 6, 1),
(571, 7, 1),
(572, 8, 1),
(573, 9, 1),
(574, 10, 1),
(575, 11, 1),
(576, 12, 1),
(578, 3, 2),
(579, 4, 2),
(580, 5, 2),
(581, 6, 2),
(582, 7, 2),
(583, 8, 2),
(584, 9, 2),
(585, 10, 2),
(586, 11, 2),
(587, 12, 2),
(589, 3, 3),
(590, 4, 3),
(591, 5, 3),
(592, 6, 3),
(593, 7, 3),
(594, 8, 3),
(595, 9, 3),
(596, 10, 3),
(597, 11, 3),
(598, 12, 3),
(600, 3, 4),
(601, 4, 4),
(602, 5, 4),
(603, 6, 4),
(604, 7, 4),
(605, 8, 4),
(606, 9, 4),
(607, 10, 4),
(608, 11, 4),
(609, 12, 4),
(611, 3, 5),
(612, 4, 5),
(613, 5, 5),
(614, 6, 5),
(615, 7, 5),
(616, 8, 5),
(617, 9, 5),
(618, 10, 5),
(619, 11, 5),
(620, 12, 5),
(622, 3, 6),
(623, 4, 6),
(624, 5, 6),
(625, 6, 6),
(626, 7, 6),
(627, 8, 6),
(628, 9, 6),
(629, 10, 6),
(630, 11, 6),
(631, 12, 6),
(633, 4, 7),
(634, 5, 7),
(635, 6, 7),
(636, 7, 7),
(637, 8, 7),
(638, 9, 7),
(639, 10, 7),
(640, 11, 7),
(641, 12, 7),
(643, 3, 8),
(644, 5, 8),
(645, 6, 8),
(646, 7, 8),
(647, 8, 8),
(648, 9, 8),
(649, 10, 8),
(650, 11, 8),
(652, 5, 9),
(653, 6, 9),
(654, 7, 9),
(655, 8, 9),
(656, 9, 9),
(657, 10, 9),
(658, 11, 9),
(668, 3, 11),
(669, 4, 11),
(670, 5, 11),
(671, 6, 11),
(672, 7, 11),
(673, 8, 11),
(674, 9, 11),
(675, 10, 11),
(677, 3, 12),
(678, 4, 12),
(679, 5, 12),
(680, 6, 12),
(681, 7, 12),
(682, 8, 12),
(683, 9, 12),
(684, 10, 12),
(686, 3, 13),
(687, 4, 13),
(688, 5, 13),
(689, 6, 13),
(690, 7, 13),
(691, 8, 13),
(692, 9, 13),
(693, 10, 13),
(695, 3, 14),
(696, 4, 14),
(697, 5, 14),
(698, 6, 14),
(699, 7, 14),
(700, 8, 14),
(701, 9, 14),
(702, 10, 14),
(704, 3, 15),
(705, 4, 15),
(706, 5, 15),
(707, 6, 15),
(708, 7, 15),
(709, 8, 15),
(710, 9, 15),
(711, 10, 15),
(713, 5, 16),
(714, 6, 16),
(715, 7, 16),
(716, 8, 16),
(717, 9, 16),
(718, 10, 16),
(720, 5, 18),
(721, 6, 18),
(722, 7, 18),
(723, 8, 18),
(724, 9, 18),
(725, 10, 18),
(726, 12, 18),
(728, 5, 19),
(729, 6, 19),
(730, 7, 19),
(731, 8, 19),
(732, 9, 19),
(733, 10, 19),
(734, 12, 19),
(736, 3, 20),
(737, 4, 20),
(738, 5, 20),
(739, 6, 20),
(740, 7, 20),
(741, 8, 20),
(742, 9, 20),
(743, 10, 20),
(764, 10, 10),
(781, 10, 10),
(790, 10, 10),
(757, 3, 10),
(774, 3, 10),
(783, 3, 10),
(759, 5, 10),
(776, 5, 10),
(785, 5, 10),
(762, 8, 10),
(779, 8, 10),
(788, 8, 10),
(758, 4, 10),
(775, 4, 10),
(784, 4, 10),
(763, 9, 10),
(780, 9, 10),
(789, 9, 10),
(761, 7, 10),
(778, 7, 10),
(787, 7, 10),
(760, 6, 10),
(777, 6, 10),
(786, 6, 10),
(898, 10, 21),
(909, 10, 21),
(920, 10, 21),
(891, 3, 21),
(902, 3, 21),
(913, 3, 21),
(899, 11, 21),
(910, 11, 21),
(921, 11, 21),
(900, 12, 21),
(911, 12, 21),
(922, 12, 21),
(893, 5, 21),
(904, 5, 21),
(915, 5, 21),
(892, 4, 21),
(903, 4, 21),
(914, 4, 21),
(896, 8, 21),
(907, 8, 21),
(918, 8, 21),
(897, 9, 21),
(908, 9, 21),
(919, 9, 21),
(895, 7, 21),
(906, 7, 21),
(917, 7, 21),
(894, 6, 21),
(905, 6, 21),
(916, 6, 21);

-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement`
--

DROP TABLE IF EXISTS `checkout_agreement`;
CREATE TABLE IF NOT EXISTS `checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `checkout_agreement_store`
--

DROP TABLE IF EXISTS `checkout_agreement_store`;
CREATE TABLE IF NOT EXISTS `checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `FK_CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';

-- --------------------------------------------------------

--
-- Table structure for table `cms_block`
--

DROP TABLE IF EXISTS `cms_block`;
CREATE TABLE IF NOT EXISTS `cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Block Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS Block Table' AUTO_INCREMENT=42 ;

--
-- Dumping data for table `cms_block`
--

INSERT INTO `cms_block` (`block_id`, `title`, `identifier`, `content`, `creation_time`, `update_time`, `is_active`) VALUES
(1, 'Slideshow', 'position-1', '<div class="ub-slideshow">\r\n<div class="jm-slidewrap">{{block class="Magento\\Bannerslider\\Block\\Slideshow" template="bannerslider.phtml"}}</div>\r\n</div>', '2014-12-19 01:31:28', '2014-12-22 03:31:59', 1),
(27, 'Static-top1', 'position-2', '<div class="static-top bg-static-1">\r\n<div class="inner"><a title="Sales" href="#"><img src="{{media url="wysiwyg/banners/banner-01.png"}}" alt="" /></a></div>\r\n</div>', '2014-12-19 02:48:17', '2014-12-19 02:48:17', 1),
(28, 'Static-top2', 'position-3', '<div class="static-top bg-static-2">\r\n<div class="inner"><a title="Sales" href="#"><img src="{{media url="wysiwyg/banners/banner-02.png"}}" alt="" /></a></div>\r\n</div>', '2014-12-21 20:06:49', '2014-12-21 20:06:49', 1),
(29, 'What''s Hot', 'position-4', '<div class="hot-products">\r\n<div class="inner">\r\n<h3>What''s Hot</h3>\r\n<h4>Newest customer trends</h4>\r\n</div>\r\n</div>', '2014-12-21 20:08:06', '2014-12-21 20:08:06', 1),
(30, 'Static-top3', 'position-5', '<div class="static-top bg-static-3">\r\n<div class="inner"><a title="Shop Now" href="#"><img src="{{media url="wysiwyg/banners/banner-03.png"}}" alt="" /></a></div>\r\n</div>', '2014-12-21 20:10:15', '2014-12-21 20:10:15', 1),
(31, 'Static-top4', 'position-6', '<div class="static-top bg-static-4">\r\n<div class="inner"><a title="Shop Now" href="#"><img src="{{media url="wysiwyg/banners/banner-04.png"}}" alt="Banner 04" /></a></div>\r\n</div>', '2014-12-21 20:11:34', '2014-12-21 20:11:34', 1),
(32, 'Position-7', 'position-7', '<div class="block-welcome col-1">\r\n<div class="col-inner">\r\n<div class="hello">Hi.</div>\r\n<div class="desc">Donec pellentesque venenatis elit, quis aliquet mauris malesuada el. Donec uitae libero dolor.</div>\r\n<a class="read-welcome" title="Read More" href="#">Read</a></div>\r\n</div>', '2014-12-21 20:12:28', '2014-12-21 20:12:28', 1),
(33, 'Static-bottom1', 'position-8', '<div class="block-static-adv col-2">\r\n<div class="col-inner">\r\n<div class="static-bottom bg-static-5"><a title="Shop Now" href="#"><img src="{{media url="wysiwyg/banners/banner-05.png"}}" alt="Banner 05" /></a></div>\r\n</div>\r\n</div>', '2014-12-21 20:13:08', '2014-12-21 20:13:08', 1),
(34, 'Static-bottom2', 'position-9', '<div class="block-static-adv col-3">\r\n<div class="col-inner">\r\n<div class="static-bottom bg-static-6"><a title="Shop Now" href="#"><img src="{{media url="wysiwyg/banners/banner-06.png"}}" alt="Banner 06" /></a></div>\r\n</div>\r\n</div>', '2014-12-21 20:14:02', '2014-12-21 20:14:02', 1),
(35, 'Newsletter', 'position-10', '<div class="block block-subscribe col-4">\r\n<div class="col-inner">{{block class="Magento\\Newsletter\\Block\\Subscribe" name="form.subscribe" as="subscribe" before="-" template="subscribe.phtml"}}</div>\r\n</div>', '2014-12-21 20:14:46', '2014-12-21 20:14:46', 1),
(36, 'Store', 'position-11', '<div class="block-store  col-1">\r\n<div class="col-inner">\r\n<div class="block-title"><strong><span>Store</span></strong></div>\r\n<div class="block-content">\r\n<ul>\r\n<li><a href="{{store url="contact"}}">contact us</a></li>\r\n<li><a href="{{store url="sales/guest/form/"}}">order status</a></li>\r\n<li><a href="{{store url="contacts/"}}">faqs</a></li>\r\n<li><a href="{{store url="sales/guest/form/"}}">shipping &amp; returns</a></li>\r\n<li><a href="{{store url="wishlist/"}}">terms &amp; conditions</a></li>\r\n<li><a href="{{store url="privacy-policy-cookie-restriction-mode/"}}">privacy policy</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', '2014-12-21 20:15:23', '2014-12-22 02:44:37', 1),
(37, 'Info', 'position-12', '<div class="block-store  col-2">\r\n<div class="col-inner">\r\n<div class="block-title"><strong><span>Info</span></strong></div>\r\n<div class="block-content">\r\n<ul>\r\n<li><a href="{{store url="about-us"}}">about us</a></li>\r\n<li><a href="{{store url="customer-service/"}}">customer services</a></li>\r\n<li><a href="{{store url="privacy-policy-cookie-restriction-mode/"}}">privacty policy</a></li>\r\n<li><a href="{{store url="contact-us/"}}">feedback</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', '2014-12-21 20:15:59', '2014-12-21 20:15:59', 1),
(38, 'Help', 'position-13', '<div class="block-help col-3">\r\n<div class="col-inner">\r\n<div class="block-title"><strong><span>Help</span></strong></div>\r\n<div class="block-content">\r\n<ul>\r\n<li><a href="{{store url="customer-service/"}}">gift cards</a></li>\r\n<li><a href="{{store url="customer-service/"}}">icon glossary</a></li>\r\n<li><a href="{{store url="customer-service/"}}">video center</a></li>\r\n<li><a href="{{store url="customer-service/"}}">review center</a></li>\r\n<li><a href="{{store url="customer-service/"}}">payment &amp; shipping</a></li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', '2014-12-21 20:16:37', '2014-12-21 20:16:37', 1),
(39, 'Location', 'position-14', '<div class="block-location  col-4">\r\n<div class="col-inner">\r\n<div class="block-location-inner">\r\n<div class="block-title"><strong><span>Location</span></strong></div>\r\n<div class="block-content">\r\n<p class="email">Mail to: <a title="support@joomlart.com" href="mailto:support@joomlart.com">support@joomlart.com</a></p>\r\n<p class="phone">Phone: +123 456 7890</p>\r\n<p class="address">Address: 2411 Any Street. Any</p>\r\n</div>\r\n</div>\r\n<div class="block-socials">\r\n<div class="block-title"><strong><span>Socials</span></strong></div>\r\n<div class="block-content"><a class="sfacebook" title="Facebook" href="#"><span>Facebook</span></a> <a class="stwitter" title="twitter" href="#"><span>Twitter</span></a> <a class="sgoogle-plus" title="Google Plus" href="#"><span>Google Plus</span></a> <a class="rss-new" title="Rss News" href="#"><span>Rss News</span></a></div>\r\n</div>\r\n</div>\r\n</div>', '2014-12-21 20:17:20', '2014-12-21 20:17:20', 1),
(40, 'Account', 'account', '<ul class="links">\r\n<li><a href="{{config path="web/unsecure/base_url"}}customer/account/">My Account</a></li>\r\n<li><a href="{{config path="web/unsecure/base_url"}}customer/account/create/">Register</a></li>\r\n<li class="authorization-link"><a href="{{config path="web/unsecure/base_url"}}customer/account/login/">Log In</a></li>\r\n</ul>', '2014-12-21 20:17:57', '2014-12-21 20:17:57', 1),
(41, 'Banner Block', 'banner-block', '<div class="block block-static-adv sidebar">\r\n<div class="col-inner">\r\n<div class="static-sidebar"><a title="Shop Now" href="#"><img src="{{media url="wysiwyg/banners/banner-07.png"}}" alt="" /></a></div>\r\n</div>\r\n</div>', '2014-12-21 20:18:53', '2014-12-21 20:18:53', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_block_store`
--

DROP TABLE IF EXISTS `cms_block_store`;
CREATE TABLE IF NOT EXISTS `cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `IDX_CMS_BLOCK_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';

--
-- Dumping data for table `cms_block_store`
--

INSERT INTO `cms_block_store` (`block_id`, `store_id`) VALUES
(1, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page`
--

DROP TABLE IF EXISTS `cms_page`;
CREATE TABLE IF NOT EXISTS `cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Page Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  PRIMARY KEY (`page_id`),
  KEY `IDX_CMS_PAGE_IDENTIFIER` (`identifier`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='CMS Page Table' AUTO_INCREMENT=11 ;

--
-- Dumping data for table `cms_page`
--

INSERT INTO `cms_page` (`page_id`, `title`, `page_layout`, `meta_keywords`, `meta_description`, `identifier`, `content_heading`, `content`, `creation_time`, `update_time`, `is_active`, `sort_order`, `layout_update_xml`, `custom_theme`, `custom_root_template`, `custom_layout_update_xml`, `custom_theme_from`, `custom_theme_to`) VALUES
(1, '404 Not Found', '2columns-right', 'Page keywords', 'Page description', 'no-route', 'Whoops, our bad...', '<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class="disc">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class="disc">\r\n<li><a href="#" onclick="history.go(-1); return false;">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href="{{store url=""}}">Store Home</a> <span class="separator">|</span> <a href="{{store url="customer/account"}}">My Account</a></li></ul></dd></dl>\r\n', '2014-12-18 20:35:53', '2014-12-18 20:35:53', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Enable Cookies', '1column', NULL, NULL, 'enable-cookies', 'What are Cookies?', '<div class="message notice">\r\n            <div>Please enable cookies in your web browser to continue.</div>\r\n            </div>\r\n            <p>Cookies are short pieces of data that are sent to your computer when you visit a website. On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically whenever you visit our site so that we can personalize your experience and provide you with better service. We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes. If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase or take advantage of certain features of our website, such as storing items in your Shopping Cart or receiving personalized recommendations. As a result, we strongly encourage you to configure your web browser to accept cookies from our website.</p>\r\n    <h2 class="subtitle">Enabling Cookies</h2>\r\n    <ul class="disc">\r\n        <li><a href="#ie7">Internet Explorer 7.x</a></li>\r\n        <li><a href="#ie6">Internet Explorer 6.x</a></li>\r\n        <li><a href="#firefox">Mozilla/Firefox</a></li>\r\n        <li><a href="#opera">Opera 7.x</a></li>\r\n    </ul>\r\n    <h3><a name="ie7"></a>Internet Explorer 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Start Internet Explorer</p>\r\n        </li>\r\n        <li>\r\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/ie7-1.gif"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Privacy</strong> tab</p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/ie7-2.gif"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Advanced</strong> button</p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/ie7-3.gif"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>, put another check mark in the <strong>Always accept session cookies </strong>box</p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/ie7-4.gif"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/ie7-5.gif"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click <strong>OK</strong></p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/ie7-6.gif"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Restart Internet Explore</p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="ie6"></a>Internet Explorer 6.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/ie6-1.gif"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> tab</p>\r\n        </li>\r\n        <li>\r\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>) under <strong>Settings</strong>. Click <strong>OK</strong></p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/ie6-2.gif"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="firefox"></a>Mozilla/Firefox</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/firefox.png"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>Expand the <strong>Cookies</strong> section</p>\r\n        </li>\r\n        <li>\r\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n    <h3><a name="opera"></a>Opera 7.x</h3>\r\n    <ol>\r\n        <li>\r\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\r\n        </li>\r\n        <li>\r\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\r\n            <p><img src="{{view url="Magento_Cms::images/cookies/opera.png"  area=frontend}}" alt="" /></p>\r\n        </li>\r\n        <li>\r\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong> should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\r\n        </li>\r\n        <li>\r\n            <p>Save changes by clicking <strong>Ok</strong></p>\r\n        </li>\r\n    </ol>\r\n    <p class="a-top"><a href="#top">Back to Top</a></p>\r\n', '2014-12-18 20:35:53', '2014-12-18 20:35:53', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Privacy and Cookie Policy', '1column', NULL, NULL, 'privacy-policy-cookie-restriction-mode', 'Privacy and Cookie Policy', '<div class="message info">\n    <span>\n        Please replace this text with you Privacy Policy.\n        Please add any additional cookies your website uses below (e.g., Google Analytics)\n    </span>\n</div>\n<p>\n    This privacy policy sets out how {{config path="general/store_information/name"}} uses and protects any information\n    that you give {{config path="general/store_information/name"}} when you use this website.\n    {{config path="general/store_information/name"}} is committed to ensuring that your privacy is protected.\n    Should we ask you to provide certain information by which you can be identified when using this website,\n    then you can be assured that it will only be used in accordance with this privacy statement.\n    {{config path="general/store_information/name"}} may change this policy from time to time by updating this page.\n    You should check this page from time to time to ensure that you are happy with any changes.\n</p>\n<h2>What we collect</h2>\n<p>We may collect the following information:</p>\n<ul>\n    <li>name</li>\n    <li>contact information including email address</li>\n    <li>demographic information such as postcode, preferences and interests</li>\n    <li>other information relevant to customer surveys and/or offers</li>\n</ul>\n<p>\n    For the exhaustive list of cookies we collect see the <a href="#list">List of cookies we collect</a> section.\n</p>\n<h2>What we do with the information we gather</h2>\n<p>\n    We require this information to understand your needs and provide you with a better service,\n    and in particular for the following reasons:\n</p>\n<ul>\n    <li>Internal record keeping.</li>\n    <li>We may use the information to improve our products and services.</li>\n    <li>\n        We may periodically send promotional emails about new products, special offers or other information which we\n        think you may find interesting using the email address which you have provided.\n    </li>\n    <li>\n        From time to time, we may also use your information to contact you for market research purposes.\n        We may contact you by email, phone, fax or mail. We may use the information to customise the website\n        according to your interests.\n    </li>\n</ul>\n<h2>Security</h2>\n<p>\n    We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure,\n    we have put in place suitable physical, electronic and managerial procedures to safeguard and secure\n    the information we collect online.\n</p>\n<h2>How we use cookies</h2>\n<p>\n    A cookie is a small file which asks permission to be placed on your computer''s hard drive.\n    Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n    a particular site. Cookies allow web applications to respond to you as an individual. The web application\n    can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n    your preferences.\n</p>\n<p>\n    We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page traffic\n    and improve our website in order to tailor it to customer needs. We only use this information for statistical\n    analysis purposes and then the data is removed from the system.\n</p>\n<p>\n    Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful\n    and which you do not. A cookie in no way gives us access to your computer or any information about you,\n    other than the data you choose to share with us. You can choose to accept or decline cookies.\n    Most web browsers automatically accept cookies, but you can usually modify your browser setting\n    to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n</p>\n<h2>Links to other websites</h2>\n<p>\n    Our website may contain links to other websites of interest. However, once you have used these links\n    to leave our site, you should note that we do not have any control over that other website.\n    Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n    visiting such sites and such sites are not governed by this privacy statement.\n    You should exercise caution and look at the privacy statement applicable to the website in question.\n</p>\n<h2>Controlling your personal information</h2>\n<p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n<ul>\n    <li>\n        whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n        that you do not want the information to be used by anybody for direct marketing purposes\n    </li>\n    <li>\n        if you have previously agreed to us using your personal information for direct marketing purposes,\n        you may change your mind at any time by writing to or emailing us at\n        {{config path="trans_email/ident_general/email"}}\n    </li>\n</ul>\n<p>\n    We will not sell, distribute or lease your personal information to third parties unless we have your permission\n    or are required by law to do so. We may use your personal information to send you promotional information\n    about third parties which we think you may find interesting if you tell us that you wish this to happen.\n</p>\n<p>\n    You may request details of personal information which we hold about you under the Data Protection Act 1998.\n    A small fee will be payable. If you would like a copy of the information held on you please write to\n    {{config path="general/store_information/street_line1"}} {{config path="general/store_information/street_line2"}} {{config path="general/store_information/city"}} {{config path="general/store_information/postcode"}} {{config path="general/store_information/region_id"}} {{config path="general/store_information/country_id"}}.\n</p>\n<p>\n    If you believe that any information we are holding on you is incorrect or incomplete,\n    please write to or email us as soon as possible, at the above address.\n    We will promptly correct any information found to be incorrect.\n</p>\n<h2><a name="list"></a>List of cookies we collect</h2>\n<p>The table below lists the cookies we collect and what information they store.</p>\n<table class="data-table">\n    <thead>\n        <tr>\n            <th>COOKIE name</th>\n            <th>COOKIE Description</th>\n        </tr>\n    </thead>\n    <tbody>\n        <tr>\n            <th>CART</th>\n            <td>The association with your shopping cart.</td>\n        </tr>\n        <tr>\n            <th>CATEGORY_INFO</th>\n            <td>Stores the category info on the page, that allows to display pages more quickly.</td>\n        </tr>\n        <tr>\n            <th>COMPARE</th>\n            <td>The items that you have in the Compare Products list.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER</th>\n            <td>An encrypted version of your customer id with the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_AUTH</th>\n            <td>An indicator if you are currently logged into the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_INFO</th>\n            <td>An encrypted version of the customer group you belong to.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_SEGMENT_IDS</th>\n            <td>Stores the Customer Segment ID</td>\n        </tr>\n        <tr>\n            <th>EXTERNAL_NO_CACHE</th>\n            <td>A flag, which indicates whether caching is disabled or not.</td>\n        </tr>\n        <tr>\n            <th>FRONTEND</th>\n            <td>You sesssion ID on the server.</td>\n        </tr>\n        <tr>\n            <th>GUEST-VIEW</th>\n            <td>Allows guests to edit their orders.</td>\n        </tr>\n        <tr>\n            <th>LAST_CATEGORY</th>\n            <td>The last category you visited.</td>\n        </tr>\n        <tr>\n            <th>LAST_PRODUCT</th>\n            <td>The most recent product you have viewed.</td>\n        </tr>\n        <tr>\n            <th>NEWMESSAGE</th>\n            <td>Indicates whether a new message has been received.</td>\n        </tr>\n        <tr>\n            <th>NO_CACHE</th>\n            <td>Indicates whether it is allowed to use cache.</td>\n        </tr>\n        <tr>\n            <th>PERSISTENT_SHOPPING_CART</th>\n            <td>A link to information about your cart and viewing history if you have asked the site.</td>\n        </tr>\n        <tr>\n            <th>RECENTLYCOMPARED</th>\n            <td>The items that you have recently compared.            </td>\n        </tr>\n        <tr>\n            <th>STF</th>\n            <td>Information on products you have emailed to friends.</td>\n        </tr>\n        <tr>\n            <th>STORE</th>\n            <td>The store view or language you have selected.</td>\n        </tr>\n        <tr>\n            <th>USER_ALLOWED_SAVE_COOKIE</th>\n            <td>Indicates whether a customer allowed to use cookies.</td>\n        </tr>\n        <tr>\n            <th>VIEWED_PRODUCT_IDS</th>\n            <td>The products that you have recently viewed.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST</th>\n            <td>An encrypted list of products added to your Wishlist.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST_CNT</th>\n            <td>The number of items in your Wishlist.</td>\n        </tr>\n    </tbody>\n</table>', '2014-12-18 20:35:53', '2014-12-18 20:35:53', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Home page', '1column', NULL, NULL, 'home', NULL, '<div class="home-widget-product">{{widget type="Magento\\\\Catalog\\\\Block\\\\Product\\\\Widget\\\\NewWidget" display_type="all_products" show_pager="1" products_per_page="8" products_count="8" template="product/widget/new/content/new_grid.phtml"}}</div>', '2014-12-22 02:32:17', '2014-12-22 02:32:17', 1, 0, '<referenceContainer name="sections.top1">\r\n            <container name="sections.panel1" label="Sections Panel 1" htmlTag="div" htmlClass="container sections">\r\n                <block class="Magento\\Cms\\Block\\Block" name="position-1">\r\n                    <arguments>\r\n                        <argument name="block_id" xsi:type="string">position-1</argument>\r\n                    </arguments>\r\n                </block>\r\n                <block class="Magento\\Cms\\Block\\Block" name="position-2">\r\n                    <arguments>\r\n                        <argument name="block_id" xsi:type="string">position-2</argument>\r\n                    </arguments>\r\n                </block>\r\n                <block class="Magento\\Cms\\Block\\Block" name="position-3">\r\n                    <arguments>\r\n                        <argument name="block_id" xsi:type="string">position-3</argument>\r\n                    </arguments>\r\n                </block>\r\n            </container>\r\n        </referenceContainer>\r\n        <referenceContainer name="sections.top2">\r\n            <container name="sections.panel2" label="Sections Panel 2" htmlTag="div" htmlClass="container sections">\r\n                <block class="Magento\\Cms\\Block\\Block" name="position-4">\r\n                    <arguments>\r\n                        <argument name="block_id" xsi:type="string">position-4</argument>\r\n                    </arguments>\r\n                </block>\r\n                <block class="Magento\\Cms\\Block\\Block" name="position-5">\r\n                    <arguments>\r\n                        <argument name="block_id" xsi:type="string">position-5</argument>\r\n                    </arguments>\r\n                </block>\r\n                <block class="Magento\\Cms\\Block\\Block" name="position-6">\r\n                    <arguments>\r\n                        <argument name="block_id" xsi:type="string">position-6</argument>\r\n                    </arguments>\r\n                </block>\r\n            </container>\r\n        </referenceContainer>', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_store`
--

DROP TABLE IF EXISTS `cms_page_store`;
CREATE TABLE IF NOT EXISTS `cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `IDX_CMS_PAGE_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';

--
-- Dumping data for table `cms_page_store`
--

INSERT INTO `cms_page_store` (`page_id`, `store_id`) VALUES
(1, 0),
(3, 0),
(4, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_cache`
--

DROP TABLE IF EXISTS `core_cache`;
CREATE TABLE IF NOT EXISTS `core_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `IDX_CORE_CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';

-- --------------------------------------------------------

--
-- Table structure for table `core_cache_tag`
--

DROP TABLE IF EXISTS `core_cache_tag`;
CREATE TABLE IF NOT EXISTS `core_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `IDX_CORE_CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';

-- --------------------------------------------------------

--
-- Table structure for table `core_config_data`
--

DROP TABLE IF EXISTS `core_config_data`;
CREATE TABLE IF NOT EXISTS `core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `UNQ_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Config Data' AUTO_INCREMENT=98 ;

--
-- Dumping data for table `core_config_data`
--

INSERT INTO `core_config_data` (`config_id`, `scope`, `scope_id`, `path`, `value`) VALUES
(1, 'default', 0, 'web/seo/use_rewrites', '1'),
(2, 'default', 0, 'web/unsecure/base_url', 'http://10.0.0.159/crafts/'),
(3, 'default', 0, 'general/locale/code', 'en_US'),
(4, 'default', 0, 'general/locale/timezone', 'America/Los_Angeles'),
(5, 'default', 0, 'currency/options/base', 'USD'),
(6, 'default', 0, 'currency/options/default', 'USD'),
(7, 'default', 0, 'currency/options/allow', 'USD'),
(8, 'default', 0, 'general/region/display_all', '1'),
(9, 'default', 0, 'general/region/state_required', 'AT,BR,CA,CH,DE,EE,ES,FI,FR,LT,LV,RO,US'),
(10, 'default', 0, 'catalog/category/root_id', NULL),
(11, 'default', 0, 'design/theme/theme_id', '5'),
(12, 'default', 0, 'design/theme/ua_regexp', 'a:0:{}'),
(13, 'default', 0, 'design/head/default_title', 'Magento Commerce'),
(14, 'default', 0, 'design/head/title_prefix', NULL),
(15, 'default', 0, 'design/head/title_suffix', NULL),
(16, 'default', 0, 'design/head/default_description', 'Default Description'),
(17, 'default', 0, 'design/head/default_keywords', 'Magento, Varien, E-commerce'),
(18, 'default', 0, 'design/head/includes', NULL),
(19, 'default', 0, 'design/head/demonotice', '0'),
(20, 'default', 0, 'design/search_engine_robots/default_robots', 'INDEX,FOLLOW'),
(21, 'default', 0, 'design/search_engine_robots/custom_instructions', NULL),
(22, 'default', 0, 'design/header/logo_alt', 'Magento Commerce'),
(23, 'default', 0, 'design/header/welcome', 'Default welcome msg!'),
(24, 'default', 0, 'design/footer/copyright', '&copy; 2014 Magento Demo Store. All Rights Reserved.'),
(25, 'default', 0, 'design/footer/absolute_footer', NULL),
(26, 'default', 0, 'design/watermark/image_size', NULL),
(27, 'default', 0, 'design/watermark/image_imageOpacity', NULL),
(28, 'default', 0, 'design/watermark/image_position', 'stretch'),
(29, 'default', 0, 'design/watermark/small_image_size', NULL),
(30, 'default', 0, 'design/watermark/small_image_imageOpacity', NULL),
(31, 'default', 0, 'design/watermark/small_image_position', 'stretch'),
(32, 'default', 0, 'design/watermark/thumbnail_size', NULL),
(33, 'default', 0, 'design/watermark/thumbnail_imageOpacity', NULL),
(34, 'default', 0, 'design/watermark/thumbnail_position', 'stretch'),
(35, 'default', 0, 'design/pagination/pagination_frame', '5'),
(36, 'default', 0, 'design/pagination/pagination_frame_skip', NULL),
(37, 'default', 0, 'design/pagination/anchor_text_for_previous', NULL),
(38, 'default', 0, 'design/pagination/anchor_text_for_next', NULL),
(39, 'default', 0, 'design/email/logo_alt', NULL),
(40, 'default', 0, 'design/header/logo_src', 'default/logo_1.png'),
(41, 'default', 0, 'catalog/fields_masks/sku', '{{name}}'),
(42, 'default', 0, 'catalog/fields_masks/meta_title', '{{name}}'),
(43, 'default', 0, 'catalog/fields_masks/meta_keyword', '{{name}}'),
(44, 'default', 0, 'catalog/fields_masks/meta_description', '{{name}} {{description}}'),
(45, 'default', 0, 'catalog/frontend/list_mode', 'grid-list'),
(46, 'default', 0, 'catalog/frontend/grid_per_page_values', '9,15,30'),
(47, 'default', 0, 'catalog/frontend/grid_per_page', '9'),
(48, 'default', 0, 'catalog/frontend/list_per_page_values', '8,10,15,20,25'),
(49, 'default', 0, 'catalog/frontend/list_per_page', '10'),
(50, 'default', 0, 'catalog/frontend/list_allow_all', '0'),
(51, 'default', 0, 'catalog/frontend/default_sort_by', 'position'),
(52, 'default', 0, 'catalog/frontend/flat_catalog_category', '0'),
(53, 'default', 0, 'catalog/frontend/flat_catalog_product', '0'),
(54, 'default', 0, 'catalog/frontend/parse_url_directives', '1'),
(55, 'default', 0, 'catalog/review/allow_guest', '1'),
(56, 'default', 0, 'catalog/productalert/allow_price', '0'),
(57, 'default', 0, 'catalog/productalert/email_price_template', 'catalog_productalert_email_price_template'),
(58, 'default', 0, 'catalog/productalert/allow_stock', '0'),
(59, 'default', 0, 'catalog/productalert/email_stock_template', 'catalog_productalert_email_stock_template'),
(60, 'default', 0, 'catalog/productalert/email_identity', 'general'),
(61, 'default', 0, 'catalog/productalert_cron/frequency', 'D'),
(62, 'default', 0, 'crontab/default/jobs/catalog_product_alert/schedule/cron_expr', '0 0 * * *'),
(63, 'default', 0, 'crontab/default/jobs/catalog_product_alert/run/model', NULL),
(64, 'default', 0, 'catalog/productalert_cron/time', '00,00,00'),
(65, 'default', 0, 'catalog/productalert_cron/error_email', NULL),
(66, 'default', 0, 'catalog/productalert_cron/error_email_identity', 'general'),
(67, 'default', 0, 'catalog/productalert_cron/error_email_template', 'catalog_productalert_cron_error_email_template'),
(68, 'default', 0, 'catalog/recently_products/scope', 'website'),
(69, 'default', 0, 'catalog/recently_products/viewed_count', '5'),
(70, 'default', 0, 'catalog/recently_products/compared_count', '5'),
(71, 'default', 0, 'catalog/price/scope', '0'),
(72, 'default', 0, 'catalog/layered_navigation/display_product_count', '1'),
(73, 'default', 0, 'catalog/layered_navigation/price_range_calculation', 'auto'),
(74, 'default', 0, 'catalog/search/min_query_length', '1'),
(75, 'default', 0, 'catalog/search/max_query_length', '128'),
(76, 'default', 0, 'catalog/search/use_layered_navigation_count', '0'),
(77, 'default', 0, 'catalog/seo/search_terms', '1'),
(78, 'default', 0, 'catalog/seo/product_url_suffix', '.html'),
(79, 'default', 0, 'catalog/seo/category_url_suffix', '.html'),
(80, 'default', 0, 'catalog/seo/product_use_categories', '0'),
(81, 'default', 0, 'catalog/seo/save_rewrites_history', '1'),
(82, 'default', 0, 'catalog/seo/title_separator', '-'),
(83, 'default', 0, 'catalog/seo/category_canonical_tag', '0'),
(84, 'default', 0, 'catalog/seo/product_canonical_tag', '0'),
(85, 'default', 0, 'catalog/navigation/max_depth', '0'),
(86, 'default', 0, 'catalog/downloadable/order_item_status', '9'),
(87, 'default', 0, 'catalog/downloadable/downloads_number', '0'),
(88, 'default', 0, 'catalog/downloadable/shareable', '0'),
(89, 'default', 0, 'catalog/downloadable/samples_title', 'Samples'),
(90, 'default', 0, 'catalog/downloadable/links_title', 'Links'),
(91, 'default', 0, 'catalog/downloadable/links_target_new_window', '1'),
(92, 'default', 0, 'catalog/downloadable/content_disposition', 'inline'),
(93, 'default', 0, 'catalog/downloadable/disable_guest_checkout', '1'),
(94, 'default', 0, 'catalog/custom_options/use_calendar', '0'),
(95, 'default', 0, 'catalog/custom_options/date_fields_order', 'm,d,y'),
(96, 'default', 0, 'catalog/custom_options/time_format', '12h'),
(97, 'default', 0, 'catalog/custom_options/year_range', ',');

-- --------------------------------------------------------

--
-- Table structure for table `core_flag`
--

DROP TABLE IF EXISTS `core_flag`;
CREATE TABLE IF NOT EXISTS `core_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `IDX_CORE_FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_layout_link`
--

DROP TABLE IF EXISTS `core_layout_link`;
CREATE TABLE IF NOT EXISTS `core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `IDX_CORE_LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `UNQ_CORE_LYT_LNK_STORE_ID_THEME_ID_LYT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`),
  KEY `FK_CORE_LAYOUT_LINK_THEME_ID_CORE_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_layout_update`
--

DROP TABLE IF EXISTS `core_layout_update`;
CREATE TABLE IF NOT EXISTS `core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `IDX_CORE_LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_resource`
--

DROP TABLE IF EXISTS `core_resource`;
CREATE TABLE IF NOT EXISTS `core_resource` (
  `code` varchar(50) NOT NULL COMMENT 'Resource Code',
  `version` varchar(50) DEFAULT NULL COMMENT 'Resource Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resources';

--
-- Dumping data for table `core_resource`
--

INSERT INTO `core_resource` (`code`, `version`, `data_version`) VALUES
('adminnotification_setup', '2.0.0', '2.0.0'),
('authorization_setup', '2.0.0', '2.0.0'),
('bannerslider_setup', '1.0.0', '1.0.0'),
('bundle_setup', '2.0.0', '2.0.0'),
('captcha_setup', '2.0.0', '2.0.0'),
('cataloginventory_setup', '2.0.0', '2.0.0'),
('catalogrule_setup', '2.0.0', '2.0.0'),
('catalogsearch_setup', '2.0.0', '2.0.0'),
('catalogurlrewrite_setup', '2.0.0', '2.0.0'),
('catalog_setup', '2.0.0', '2.0.0'),
('checkoutagreements_setup', '2.0.0', '2.0.0'),
('checkout_setup', '2.0.0', '2.0.0'),
('cms_setup', '2.0.0', '2.0.0'),
('configurableproduct_setup', '2.0.0', '2.0.0'),
('core_setup', '2.0.0', '2.0.0'),
('cron_setup', '2.0.0', '2.0.0'),
('customer_setup', '2.0.0', '2.0.0'),
('designeditor_setup', '2.0.0', '2.0.0'),
('dhl_setup', '2.0.0', '2.0.0'),
('directory_setup', '2.0.0', '2.0.0'),
('downloadable_setup', '2.0.0', '2.0.0'),
('eav_setup', '2.0.0', '2.0.0'),
('email_setup', '2.0.0', '2.0.0'),
('fedex_setup', '2.0.0', '2.0.0'),
('giftmessage_setup', '2.0.0', '2.0.0'),
('googleoptimizer_setup', '2.0.0', '2.0.0'),
('googleshopping_setup', '2.0.0', '2.0.0'),
('groupedproduct_setup', '2.0.0', '2.0.0'),
('importexport_setup', '2.0.0', '2.0.0'),
('indexer_setup', '2.0.0', '2.0.0'),
('integration_setup', '2.0.0', '2.0.0'),
('log_setup', '2.0.0', '2.0.0'),
('msrp_setup', '2.0.0', '2.0.0'),
('newsletter_setup', '2.0.0', '2.0.0'),
('offlineshipping_setup', '2.0.0', '2.0.0'),
('persistent_setup', '2.0.0', '2.0.0'),
('productalert_setup', '2.0.0', '2.0.0'),
('reports_setup', '2.0.0', '2.0.0'),
('review_setup', '2.0.0', '2.0.0'),
('salesrule_setup', '2.0.0', '2.0.0'),
('sales_setup', '2.0.0', '2.0.0'),
('search_setup', '2.0.0', '2.0.0'),
('sendfriend_setup', '2.0.0', '2.0.0'),
('sitemap_setup', '2.0.0', '2.0.0'),
('store_setup', '2.0.0', '2.0.0'),
('tax_setup', '2.0.0', '2.0.0'),
('translation_setup', '2.0.0', '2.0.0'),
('urlrewrite_setup', '2.0.0', '2.0.0'),
('user_setup', '2.0.0', '2.0.0'),
('usps_setup', '2.0.0', '2.0.0'),
('weee_setup', '2.0.0', '2.0.0'),
('widget_setup', '2.0.0', '2.0.0'),
('wishlist_setup', '2.0.0', '2.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `core_session`
--

DROP TABLE IF EXISTS `core_session`;
CREATE TABLE IF NOT EXISTS `core_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';

-- --------------------------------------------------------

--
-- Table structure for table `core_theme`
--

DROP TABLE IF EXISTS `core_theme`;
CREATE TABLE IF NOT EXISTS `core_theme` (
  `theme_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent Id',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_version` varchar(255) NOT NULL COMMENT 'Theme Version',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint(6) NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Core theme' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `core_theme`
--

INSERT INTO `core_theme` (`theme_id`, `parent_id`, `theme_path`, `theme_version`, `theme_title`, `preview_image`, `is_featured`, `area`, `type`, `code`) VALUES
(1, NULL, 'Magento/backend', '0.42.0-beta1', 'Magento 2 backend', NULL, 0, 'adminhtml', 0, 'Magento/backend'),
(2, NULL, 'Magento/blank', '0.42.0-beta1', 'Magento Blank', 'preview_image_54938ef5b0585.jpeg', 0, 'frontend', 0, 'Magento/blank'),
(4, 2, 'Magento/luma', '0.42.0-beta1', 'Magento Luma', 'preview_image_54938ef5d7e5f.jpeg', 0, 'frontend', 0, 'Magento/luma'),
(5, NULL, 'UberTheme/craft', '0.1.0-beta1', 'UberTheme Craft', 'preview_image_5493e3a3a882a.jpeg', 0, 'frontend', 0, 'UberTheme/craft');

-- --------------------------------------------------------

--
-- Table structure for table `core_theme_file`
--

DROP TABLE IF EXISTS `core_theme_file`;
CREATE TABLE IF NOT EXISTS `core_theme_file` (
  `theme_files_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme Id',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `FK_CORE_THEME_FILE_THEME_ID_CORE_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme files' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_variable`
--

DROP TABLE IF EXISTS `core_variable`;
CREATE TABLE IF NOT EXISTS `core_variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `UNQ_CORE_VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_variable_value`
--

DROP TABLE IF EXISTS `core_variable_value`;
CREATE TABLE IF NOT EXISTS `core_variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CORE_VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `IDX_CORE_VARIABLE_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cron_schedule`
--

DROP TABLE IF EXISTS `cron_schedule`;
CREATE TABLE IF NOT EXISTS `cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `IDX_CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `IDX_CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity`
--

DROP TABLE IF EXISTS `customer_address_entity`;
CREATE TABLE IF NOT EXISTS `customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL COMMENT 'Created At',
  `updated_at` timestamp NOT NULL COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `customer_address_entity_datetime`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `customer_address_entity_decimal`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_int`
--

DROP TABLE IF EXISTS `customer_address_entity_int`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_text`
--

DROP TABLE IF EXISTS `customer_address_entity_text`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
CREATE TABLE IF NOT EXISTS `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute`
--

DROP TABLE IF EXISTS `customer_eav_attribute`;
CREATE TABLE IF NOT EXISTS `customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';

--
-- Dumping data for table `customer_eav_attribute`
--

INSERT INTO `customer_eav_attribute` (`attribute_id`, `is_visible`, `input_filter`, `multiline_count`, `validate_rules`, `is_system`, `sort_order`, `data_model`) VALUES
(1, 1, NULL, 0, NULL, 1, 10, NULL),
(2, 0, NULL, 0, NULL, 1, 0, NULL),
(3, 1, NULL, 0, NULL, 1, 20, NULL),
(4, 0, NULL, 0, NULL, 0, 30, NULL),
(5, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 40, NULL),
(6, 0, NULL, 0, NULL, 0, 50, NULL),
(7, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 60, NULL),
(8, 0, NULL, 0, NULL, 0, 70, NULL),
(9, 1, NULL, 0, 'a:1:{s:16:"input_validation";s:5:"email";}', 1, 80, NULL),
(10, 1, NULL, 0, NULL, 1, 25, NULL),
(11, 0, 'date', 0, 'a:1:{s:16:"input_validation";s:4:"date";}', 0, 90, NULL),
(12, 0, NULL, 0, NULL, 1, 0, NULL),
(13, 0, NULL, 0, NULL, 1, 0, NULL),
(14, 0, NULL, 0, NULL, 1, 0, NULL),
(15, 0, NULL, 0, 'a:1:{s:15:"max_text_length";i:255;}', 0, 100, NULL),
(16, 0, NULL, 0, NULL, 1, 0, NULL),
(17, 0, NULL, 0, NULL, 0, 0, NULL),
(18, 0, NULL, 0, 'a:0:{}', 0, 110, NULL),
(19, 0, NULL, 0, NULL, 0, 10, NULL),
(20, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 20, NULL),
(21, 0, NULL, 0, NULL, 0, 30, NULL),
(22, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 40, NULL),
(23, 0, NULL, 0, NULL, 0, 50, NULL),
(24, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 60, NULL),
(25, 1, NULL, 2, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 70, NULL),
(26, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 80, NULL),
(27, 1, NULL, 0, NULL, 1, 90, NULL),
(28, 1, NULL, 0, NULL, 1, 100, NULL),
(29, 1, NULL, 0, NULL, 1, 100, NULL),
(30, 1, NULL, 0, 'a:0:{}', 1, 110, 'Magento\\Customer\\Model\\Attribute\\Data\\Postcode'),
(31, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 120, NULL),
(32, 1, NULL, 0, 'a:2:{s:15:"max_text_length";i:255;s:15:"min_text_length";i:1;}', 1, 130, NULL),
(33, 0, NULL, 0, NULL, 1, 0, NULL),
(34, 0, NULL, 0, 'a:1:{s:16:"input_validation";s:4:"date";}', 1, 0, NULL),
(35, 1, NULL, 0, NULL, 1, 28, NULL),
(36, 1, NULL, 0, NULL, 1, 140, NULL),
(37, 0, NULL, 0, NULL, 1, 0, NULL),
(38, 0, NULL, 0, NULL, 1, 0, NULL),
(39, 0, NULL, 0, NULL, 1, 0, NULL),
(40, 0, NULL, 0, NULL, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `customer_eav_attribute_website`;
CREATE TABLE IF NOT EXISTS `customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `IDX_CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';

--
-- Dumping data for table `customer_eav_attribute_website`
--

INSERT INTO `customer_eav_attribute_website` (`attribute_id`, `website_id`, `is_visible`, `is_required`, `default_value`, `multiline_count`) VALUES
(35, 1, NULL, NULL, NULL, NULL),
(36, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity`
--

DROP TABLE IF EXISTS `customer_entity`;
CREATE TABLE IF NOT EXISTS `customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL COMMENT 'Created At',
  `updated_at` timestamp NOT NULL COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `IDX_CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `IDX_CUSTOMER_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_datetime`
--

DROP TABLE IF EXISTS `customer_entity_datetime`;
CREATE TABLE IF NOT EXISTS `customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_decimal`
--

DROP TABLE IF EXISTS `customer_entity_decimal`;
CREATE TABLE IF NOT EXISTS `customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_int`
--

DROP TABLE IF EXISTS `customer_entity_int`;
CREATE TABLE IF NOT EXISTS `customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_text`
--

DROP TABLE IF EXISTS `customer_entity_text`;
CREATE TABLE IF NOT EXISTS `customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_entity_varchar`
--

DROP TABLE IF EXISTS `customer_entity_varchar`;
CREATE TABLE IF NOT EXISTS `customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_form_attribute`
--

DROP TABLE IF EXISTS `customer_form_attribute`;
CREATE TABLE IF NOT EXISTS `customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `IDX_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';

--
-- Dumping data for table `customer_form_attribute`
--

INSERT INTO `customer_form_attribute` (`form_code`, `attribute_id`) VALUES
('adminhtml_customer', 1),
('adminhtml_customer', 3),
('adminhtml_customer', 4),
('checkout_register', 4),
('customer_account_create', 4),
('customer_account_edit', 4),
('adminhtml_customer', 5),
('checkout_register', 5),
('customer_account_create', 5),
('customer_account_edit', 5),
('adminhtml_customer', 6),
('checkout_register', 6),
('customer_account_create', 6),
('customer_account_edit', 6),
('adminhtml_customer', 7),
('checkout_register', 7),
('customer_account_create', 7),
('customer_account_edit', 7),
('adminhtml_customer', 8),
('checkout_register', 8),
('customer_account_create', 8),
('customer_account_edit', 8),
('adminhtml_checkout', 9),
('adminhtml_customer', 9),
('checkout_register', 9),
('customer_account_create', 9),
('customer_account_edit', 9),
('adminhtml_checkout', 10),
('adminhtml_customer', 10),
('adminhtml_checkout', 11),
('adminhtml_customer', 11),
('checkout_register', 11),
('customer_account_create', 11),
('customer_account_edit', 11),
('adminhtml_checkout', 15),
('adminhtml_customer', 15),
('checkout_register', 15),
('customer_account_create', 15),
('customer_account_edit', 15),
('adminhtml_customer', 17),
('checkout_register', 17),
('customer_account_create', 17),
('customer_account_edit', 17),
('adminhtml_checkout', 18),
('adminhtml_customer', 18),
('checkout_register', 18),
('customer_account_create', 18),
('customer_account_edit', 18),
('adminhtml_customer_address', 19),
('customer_address_edit', 19),
('customer_register_address', 19),
('adminhtml_customer_address', 20),
('customer_address_edit', 20),
('customer_register_address', 20),
('adminhtml_customer_address', 21),
('customer_address_edit', 21),
('customer_register_address', 21),
('adminhtml_customer_address', 22),
('customer_address_edit', 22),
('customer_register_address', 22),
('adminhtml_customer_address', 23),
('customer_address_edit', 23),
('customer_register_address', 23),
('adminhtml_customer_address', 24),
('customer_address_edit', 24),
('customer_register_address', 24),
('adminhtml_customer_address', 25),
('customer_address_edit', 25),
('customer_register_address', 25),
('adminhtml_customer_address', 26),
('customer_address_edit', 26),
('customer_register_address', 26),
('adminhtml_customer_address', 27),
('customer_address_edit', 27),
('customer_register_address', 27),
('adminhtml_customer_address', 28),
('customer_address_edit', 28),
('customer_register_address', 28),
('adminhtml_customer_address', 29),
('customer_address_edit', 29),
('customer_register_address', 29),
('adminhtml_customer_address', 30),
('customer_address_edit', 30),
('customer_register_address', 30),
('adminhtml_customer_address', 31),
('customer_address_edit', 31),
('customer_register_address', 31),
('adminhtml_customer_address', 32),
('customer_address_edit', 32),
('customer_register_address', 32),
('adminhtml_customer', 35),
('adminhtml_customer_address', 36),
('customer_address_edit', 36),
('customer_register_address', 36);

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Customer Group Id',
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customer Group' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `customer_group_code`, `tax_class_id`) VALUES
(0, 'NOT LOGGED IN', 3),
(1, 'General', 3),
(2, 'Wholesale', 3),
(3, 'Retailer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer_visitor`
--

DROP TABLE IF EXISTS `customer_visitor`;
CREATE TABLE IF NOT EXISTS `customer_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `last_visit_at` timestamp NOT NULL COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Visitor Table' AUTO_INCREMENT=81 ;

--
-- Dumping data for table `customer_visitor`
--

INSERT INTO `customer_visitor` (`visitor_id`, `session_id`, `last_visit_at`) VALUES
(1, 'dd7qvr053c8e9mt73479hufud7', '2014-12-18 20:36:54'),
(2, 'csahithks8pn05lehhgqdthv52', '2014-12-18 21:28:16'),
(3, '9i0kl664dajrhnr8dg8nve7l16', '2014-12-18 21:28:21'),
(4, 'ivuelh7sct43k740563udusmo3', '2014-12-19 00:38:31'),
(5, 'vq2b9edpi5mjnu4aac6rs6esa2', '2014-12-19 00:38:38'),
(6, 'pno6evr59fsdcjlt7nl2e3knm1', '2014-12-19 01:20:51'),
(7, 'jdpavm5pffgtmdm0ee1ite7ie2', '2014-12-19 01:31:06'),
(8, '0f3qmu1kmdvn819ktopi8snst6', '2014-12-19 01:31:09'),
(9, 'lal47ahrrb8alf92ssclr2d1b5', '2014-12-19 01:31:20'),
(10, '75jb67t8fro466ahra3ccd6sk2', '2014-12-19 01:31:30'),
(11, 'iljpl66cq4qe2hotvcv6e641k4', '2014-12-19 01:32:17'),
(12, '9td4snu0e0lsvgunsstgoqcg81', '2014-12-19 01:32:23'),
(13, 'hesoavt6edf4o7fq1sf9pms0n7', '2014-12-19 01:35:53'),
(14, '653lbim4q2rvaqal2rvdohf5q6', '2014-12-19 01:38:10'),
(15, 'b11bh72ueu3iqpjrql3bnlu7q6', '2014-12-19 01:41:09'),
(16, '0l68h4mcs4dmhhg2k1nimbevr7', '2014-12-19 01:44:34'),
(17, 'r5u0ulvrh6de6s4fs466t27jl2', '2014-12-19 01:44:41'),
(18, 'urtjmnk85ip4pqjn9juek7r4r3', '2014-12-19 01:51:08'),
(19, 'ahqol22peeq3rvpkqoc39shhu3', '2014-12-19 01:51:49'),
(20, '0piov3pfoj3k1p79gel6aiu3n2', '2014-12-19 01:53:37'),
(21, 'ecbu8ngjhfr0r7vu0fuu3lcb92', '2014-12-19 01:53:51'),
(22, 'j5cetfn2i9khb9dqsh7fpsv5h4', '2014-12-19 01:56:23'),
(23, '6orlputk41lmep7ci62pmidpl0', '2014-12-19 01:57:44'),
(24, 'rs1en7bp4blaf2p4gknhkidas6', '2014-12-19 01:59:47'),
(25, 'mp2ofbfgha8tg73ppk20885ka3', '2014-12-19 02:02:28'),
(26, 'bm05iatf9dqrc8iq9qepa8pm20', '2014-12-19 02:04:04'),
(27, '8a1rtc2uh7kh17h5n74mqp19k1', '2014-12-19 02:05:53'),
(28, 'a00m8bcuhqvcbvirimpefcgel3', '2014-12-19 02:07:32'),
(29, '24bq0qs5sr75gou8vbtlm8lsf1', '2014-12-19 02:07:38'),
(30, 'l9bk5jb10ih004qt577d538481', '2014-12-19 02:07:43'),
(31, 'pl3ngccpcg080aak38jg5h47v1', '2014-12-19 02:12:14'),
(32, 'uao6f8ujnl3o5g78113nvgs4a6', '2014-12-19 02:14:36'),
(33, 'av2gpbb9daqu0vt7972usf3n93', '2014-12-19 02:14:52'),
(34, 'q8tn85v9rspcqsupfdci0obt72', '2014-12-19 02:16:11'),
(35, '8jgvae6hhc52q4c9524lomdbp2', '2014-12-19 02:19:08'),
(36, 'rcr1ffmeivopngv7ug8h6eeih7', '2014-12-19 02:20:42'),
(37, '2okht3nd6vfjrf1e8d01v20271', '2014-12-19 02:26:28'),
(38, 'hddl1fk260sfuik3cpselogkq6', '2014-12-19 02:27:01'),
(39, '6ru5lgmea256uhrgijtsp0uqu7', '2014-12-19 02:28:29'),
(40, 'e2oagkc0s6bkotfge43q0d6dt2', '2014-12-19 02:28:29'),
(41, 'k1gm5g4n5kulj4kjh2rmavdot0', '2014-12-19 02:28:37'),
(42, '5po3eu2tpv3rgo32tro21vf360', '2014-12-19 02:28:48'),
(43, 'uuaenujjok89bugmjagkgqbr74', '2014-12-19 02:30:31'),
(44, 'e2rkg65h4f3codu3n4rct62oc5', '2014-12-19 02:30:45'),
(45, '2bi87s2md66jd0m02mnj4pjif3', '2014-12-19 02:36:55'),
(46, 'fffc4662tabqhhck8thhmh5on0', '2014-12-19 02:37:08'),
(47, '56en4hf6590q6f9mipr7pog161', '2014-12-19 02:43:24'),
(48, 'ki6olqrslu4q9vjsb545166sp5', '2014-12-19 02:44:10'),
(49, 'hq61uaesrd0af191vnrr8hf616', '2014-12-19 02:47:27'),
(50, 'tp5lspdie3a59bqr0k2jgir223', '2014-12-19 02:47:43'),
(51, '5l039qt2183vnlv4nlvpqnki42', '2014-12-19 02:50:58'),
(52, '05h9r37d1u2m393glusii6rqr0', '2014-12-19 02:51:14'),
(53, 'b6r2t1fgfhg3r103pdnkrm5h22', '2014-12-19 02:51:22'),
(54, 'total3d4pvbf73c8j2p3keeou2', '2014-12-19 02:51:26'),
(55, '3k6hhppnbnjh0c30gnioki9a85', '2014-12-19 02:53:02'),
(56, '51ia0spkl08a30chrncj89d0c5', '2014-12-19 02:53:10'),
(57, 'epkeqa07upd0q7tiuofnihg3d3', '2014-12-19 02:53:21'),
(58, 'qph4erogmcrb6pn4dcmj95h934', '2014-12-19 03:20:08'),
(59, '7v191b9ujoa0419d016jncnh86', '2014-12-21 19:57:40'),
(60, 'ccioku14edu5tv5kph6gg7o0q5', '2014-12-21 20:23:44'),
(61, 'qmlak0i72a8hk5etmmh0aecgv0', '2014-12-21 21:09:12'),
(62, 'lssc788085m98pdph4c8ol1s81', '2014-12-22 01:42:11'),
(63, '4pvllkpvkk7fuc9njqgrt6sdf5', '2014-12-22 01:51:31'),
(64, 'l59ebnbsn61nserv5je4knge07', '2014-12-22 01:54:55'),
(65, 'pg0gurd847ukga9u1tc5t63jg4', '2014-12-22 02:39:40'),
(66, 'krk644lockpda52lf11cf50qj7', '2014-12-22 02:57:48'),
(67, '4kgesm6qlathfs4ur3kse7lte2', '2014-12-22 03:05:56'),
(68, '18j2in2ic3a8gtuih717js7s87', '2014-12-22 03:07:39'),
(69, 'fn0ciqb1ekfv58mo4c0vdri3c6', '2014-12-22 03:45:42'),
(70, '7v5b7tqkqusdascciup5fjpjh2', '2014-12-22 03:09:17'),
(71, 's45btofmkn6rjp2hba5cmeko41', '2014-12-22 03:09:39'),
(72, 'p0a1rbjdqvjmfejibt1v1smch4', '2014-12-22 03:09:53'),
(73, 'uv71ansu3gq86bqiivu5jjlrs0', '2014-12-22 03:10:19'),
(74, 'n6rvcs6a46iinskqpiqdei1fs2', '2014-12-22 03:10:26'),
(75, '2nbn2s1vftf4g1ujfa3he24vg1', '2014-12-22 03:30:04'),
(76, 'fn0ciqb1ekfv58mo4c0vdri3c6', '2014-12-22 03:50:17'),
(77, 'fn0ciqb1ekfv58mo4c0vdri3c6', '2014-12-22 04:10:26'),
(78, '1pg7ij6s7fiivlvf3prf3vrui3', '2014-12-22 04:08:00'),
(79, 'otnrauhhq5sctjetuo9nmhhnv5', '2014-12-22 04:03:56'),
(80, 'pvve1knurs6n4j69k5u0cq76a3', '2014-12-22 04:04:00');

-- --------------------------------------------------------

--
-- Table structure for table `design_change`
--

DROP TABLE IF EXISTS `design_change`;
CREATE TABLE IF NOT EXISTS `design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `IDX_DESIGN_CHANGE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `directory_country`
--

DROP TABLE IF EXISTS `directory_country`;
CREATE TABLE IF NOT EXISTS `directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';

--
-- Dumping data for table `directory_country`
--

INSERT INTO `directory_country` (`country_id`, `iso2_code`, `iso3_code`) VALUES
('AD', 'AD', 'AND'),
('AE', 'AE', 'ARE'),
('AF', 'AF', 'AFG'),
('AG', 'AG', 'ATG'),
('AI', 'AI', 'AIA'),
('AL', 'AL', 'ALB'),
('AM', 'AM', 'ARM'),
('AN', 'AN', 'ANT'),
('AO', 'AO', 'AGO'),
('AQ', 'AQ', 'ATA'),
('AR', 'AR', 'ARG'),
('AS', 'AS', 'ASM'),
('AT', 'AT', 'AUT'),
('AU', 'AU', 'AUS'),
('AW', 'AW', 'ABW'),
('AX', 'AX', 'ALA'),
('AZ', 'AZ', 'AZE'),
('BA', 'BA', 'BIH'),
('BB', 'BB', 'BRB'),
('BD', 'BD', 'BGD'),
('BE', 'BE', 'BEL'),
('BF', 'BF', 'BFA'),
('BG', 'BG', 'BGR'),
('BH', 'BH', 'BHR'),
('BI', 'BI', 'BDI'),
('BJ', 'BJ', 'BEN'),
('BL', 'BL', 'BLM'),
('BM', 'BM', 'BMU'),
('BN', 'BN', 'BRN'),
('BO', 'BO', 'BOL'),
('BR', 'BR', 'BRA'),
('BS', 'BS', 'BHS'),
('BT', 'BT', 'BTN'),
('BV', 'BV', 'BVT'),
('BW', 'BW', 'BWA'),
('BY', 'BY', 'BLR'),
('BZ', 'BZ', 'BLZ'),
('CA', 'CA', 'CAN'),
('CC', 'CC', 'CCK'),
('CD', 'CD', 'COD'),
('CF', 'CF', 'CAF'),
('CG', 'CG', 'COG'),
('CH', 'CH', 'CHE'),
('CI', 'CI', 'CIV'),
('CK', 'CK', 'COK'),
('CL', 'CL', 'CHL'),
('CM', 'CM', 'CMR'),
('CN', 'CN', 'CHN'),
('CO', 'CO', 'COL'),
('CR', 'CR', 'CRI'),
('CU', 'CU', 'CUB'),
('CV', 'CV', 'CPV'),
('CX', 'CX', 'CXR'),
('CY', 'CY', 'CYP'),
('CZ', 'CZ', 'CZE'),
('DE', 'DE', 'DEU'),
('DJ', 'DJ', 'DJI'),
('DK', 'DK', 'DNK'),
('DM', 'DM', 'DMA'),
('DO', 'DO', 'DOM'),
('DZ', 'DZ', 'DZA'),
('EC', 'EC', 'ECU'),
('EE', 'EE', 'EST'),
('EG', 'EG', 'EGY'),
('EH', 'EH', 'ESH'),
('ER', 'ER', 'ERI'),
('ES', 'ES', 'ESP'),
('ET', 'ET', 'ETH'),
('FI', 'FI', 'FIN'),
('FJ', 'FJ', 'FJI'),
('FK', 'FK', 'FLK'),
('FM', 'FM', 'FSM'),
('FO', 'FO', 'FRO'),
('FR', 'FR', 'FRA'),
('GA', 'GA', 'GAB'),
('GB', 'GB', 'GBR'),
('GD', 'GD', 'GRD'),
('GE', 'GE', 'GEO'),
('GF', 'GF', 'GUF'),
('GG', 'GG', 'GGY'),
('GH', 'GH', 'GHA'),
('GI', 'GI', 'GIB'),
('GL', 'GL', 'GRL'),
('GM', 'GM', 'GMB'),
('GN', 'GN', 'GIN'),
('GP', 'GP', 'GLP'),
('GQ', 'GQ', 'GNQ'),
('GR', 'GR', 'GRC'),
('GS', 'GS', 'SGS'),
('GT', 'GT', 'GTM'),
('GU', 'GU', 'GUM'),
('GW', 'GW', 'GNB'),
('GY', 'GY', 'GUY'),
('HK', 'HK', 'HKG'),
('HM', 'HM', 'HMD'),
('HN', 'HN', 'HND'),
('HR', 'HR', 'HRV'),
('HT', 'HT', 'HTI'),
('HU', 'HU', 'HUN'),
('ID', 'ID', 'IDN'),
('IE', 'IE', 'IRL'),
('IL', 'IL', 'ISR'),
('IM', 'IM', 'IMN'),
('IN', 'IN', 'IND'),
('IO', 'IO', 'IOT'),
('IQ', 'IQ', 'IRQ'),
('IR', 'IR', 'IRN'),
('IS', 'IS', 'ISL'),
('IT', 'IT', 'ITA'),
('JE', 'JE', 'JEY'),
('JM', 'JM', 'JAM'),
('JO', 'JO', 'JOR'),
('JP', 'JP', 'JPN'),
('KE', 'KE', 'KEN'),
('KG', 'KG', 'KGZ'),
('KH', 'KH', 'KHM'),
('KI', 'KI', 'KIR'),
('KM', 'KM', 'COM'),
('KN', 'KN', 'KNA'),
('KP', 'KP', 'PRK'),
('KR', 'KR', 'KOR'),
('KW', 'KW', 'KWT'),
('KY', 'KY', 'CYM'),
('KZ', 'KZ', 'KAZ'),
('LA', 'LA', 'LAO'),
('LB', 'LB', 'LBN'),
('LC', 'LC', 'LCA'),
('LI', 'LI', 'LIE'),
('LK', 'LK', 'LKA'),
('LR', 'LR', 'LBR'),
('LS', 'LS', 'LSO'),
('LT', 'LT', 'LTU'),
('LU', 'LU', 'LUX'),
('LV', 'LV', 'LVA'),
('LY', 'LY', 'LBY'),
('MA', 'MA', 'MAR'),
('MC', 'MC', 'MCO'),
('MD', 'MD', 'MDA'),
('ME', 'ME', 'MNE'),
('MF', 'MF', 'MAF'),
('MG', 'MG', 'MDG'),
('MH', 'MH', 'MHL'),
('MK', 'MK', 'MKD'),
('ML', 'ML', 'MLI'),
('MM', 'MM', 'MMR'),
('MN', 'MN', 'MNG'),
('MO', 'MO', 'MAC'),
('MP', 'MP', 'MNP'),
('MQ', 'MQ', 'MTQ'),
('MR', 'MR', 'MRT'),
('MS', 'MS', 'MSR'),
('MT', 'MT', 'MLT'),
('MU', 'MU', 'MUS'),
('MV', 'MV', 'MDV'),
('MW', 'MW', 'MWI'),
('MX', 'MX', 'MEX'),
('MY', 'MY', 'MYS'),
('MZ', 'MZ', 'MOZ'),
('NA', 'NA', 'NAM'),
('NC', 'NC', 'NCL'),
('NE', 'NE', 'NER'),
('NF', 'NF', 'NFK'),
('NG', 'NG', 'NGA'),
('NI', 'NI', 'NIC'),
('NL', 'NL', 'NLD'),
('NO', 'NO', 'NOR'),
('NP', 'NP', 'NPL'),
('NR', 'NR', 'NRU'),
('NU', 'NU', 'NIU'),
('NZ', 'NZ', 'NZL'),
('OM', 'OM', 'OMN'),
('PA', 'PA', 'PAN'),
('PE', 'PE', 'PER'),
('PF', 'PF', 'PYF'),
('PG', 'PG', 'PNG'),
('PH', 'PH', 'PHL'),
('PK', 'PK', 'PAK'),
('PL', 'PL', 'POL'),
('PM', 'PM', 'SPM'),
('PN', 'PN', 'PCN'),
('PS', 'PS', 'PSE'),
('PT', 'PT', 'PRT'),
('PW', 'PW', 'PLW'),
('PY', 'PY', 'PRY'),
('QA', 'QA', 'QAT'),
('RE', 'RE', 'REU'),
('RO', 'RO', 'ROU'),
('RS', 'RS', 'SRB'),
('RU', 'RU', 'RUS'),
('RW', 'RW', 'RWA'),
('SA', 'SA', 'SAU'),
('SB', 'SB', 'SLB'),
('SC', 'SC', 'SYC'),
('SD', 'SD', 'SDN'),
('SE', 'SE', 'SWE'),
('SG', 'SG', 'SGP'),
('SH', 'SH', 'SHN'),
('SI', 'SI', 'SVN'),
('SJ', 'SJ', 'SJM'),
('SK', 'SK', 'SVK'),
('SL', 'SL', 'SLE'),
('SM', 'SM', 'SMR'),
('SN', 'SN', 'SEN'),
('SO', 'SO', 'SOM'),
('SR', 'SR', 'SUR'),
('ST', 'ST', 'STP'),
('SV', 'SV', 'SLV'),
('SY', 'SY', 'SYR'),
('SZ', 'SZ', 'SWZ'),
('TC', 'TC', 'TCA'),
('TD', 'TD', 'TCD'),
('TF', 'TF', 'ATF'),
('TG', 'TG', 'TGO'),
('TH', 'TH', 'THA'),
('TJ', 'TJ', 'TJK'),
('TK', 'TK', 'TKL'),
('TL', 'TL', 'TLS'),
('TM', 'TM', 'TKM'),
('TN', 'TN', 'TUN'),
('TO', 'TO', 'TON'),
('TR', 'TR', 'TUR'),
('TT', 'TT', 'TTO'),
('TV', 'TV', 'TUV'),
('TW', 'TW', 'TWN'),
('TZ', 'TZ', 'TZA'),
('UA', 'UA', 'UKR'),
('UG', 'UG', 'UGA'),
('UM', 'UM', 'UMI'),
('US', 'US', 'USA'),
('UY', 'UY', 'URY'),
('UZ', 'UZ', 'UZB'),
('VA', 'VA', 'VAT'),
('VC', 'VC', 'VCT'),
('VE', 'VE', 'VEN'),
('VG', 'VG', 'VGB'),
('VI', 'VI', 'VIR'),
('VN', 'VN', 'VNM'),
('VU', 'VU', 'VUT'),
('WF', 'WF', 'WLF'),
('WS', 'WS', 'WSM'),
('YE', 'YE', 'YEM'),
('YT', 'YT', 'MYT'),
('ZA', 'ZA', 'ZAF'),
('ZM', 'ZM', 'ZMB'),
('ZW', 'ZW', 'ZWE');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_format`
--

DROP TABLE IF EXISTS `directory_country_format`;
CREATE TABLE IF NOT EXISTS `directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `UNQ_DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region`
--

DROP TABLE IF EXISTS `directory_country_region`;
CREATE TABLE IF NOT EXISTS `directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `IDX_DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Directory Country Region' AUTO_INCREMENT=512 ;

--
-- Dumping data for table `directory_country_region`
--

INSERT INTO `directory_country_region` (`region_id`, `country_id`, `code`, `default_name`) VALUES
(1, 'US', 'AL', 'Alabama'),
(2, 'US', 'AK', 'Alaska'),
(3, 'US', 'AS', 'American Samoa'),
(4, 'US', 'AZ', 'Arizona'),
(5, 'US', 'AR', 'Arkansas'),
(6, 'US', 'AE', 'Armed Forces Africa'),
(7, 'US', 'AA', 'Armed Forces Americas'),
(8, 'US', 'AE', 'Armed Forces Canada'),
(9, 'US', 'AE', 'Armed Forces Europe'),
(10, 'US', 'AE', 'Armed Forces Middle East'),
(11, 'US', 'AP', 'Armed Forces Pacific'),
(12, 'US', 'CA', 'California'),
(13, 'US', 'CO', 'Colorado'),
(14, 'US', 'CT', 'Connecticut'),
(15, 'US', 'DE', 'Delaware'),
(16, 'US', 'DC', 'District of Columbia'),
(17, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 'US', 'FL', 'Florida'),
(19, 'US', 'GA', 'Georgia'),
(20, 'US', 'GU', 'Guam'),
(21, 'US', 'HI', 'Hawaii'),
(22, 'US', 'ID', 'Idaho'),
(23, 'US', 'IL', 'Illinois'),
(24, 'US', 'IN', 'Indiana'),
(25, 'US', 'IA', 'Iowa'),
(26, 'US', 'KS', 'Kansas'),
(27, 'US', 'KY', 'Kentucky'),
(28, 'US', 'LA', 'Louisiana'),
(29, 'US', 'ME', 'Maine'),
(30, 'US', 'MH', 'Marshall Islands'),
(31, 'US', 'MD', 'Maryland'),
(32, 'US', 'MA', 'Massachusetts'),
(33, 'US', 'MI', 'Michigan'),
(34, 'US', 'MN', 'Minnesota'),
(35, 'US', 'MS', 'Mississippi'),
(36, 'US', 'MO', 'Missouri'),
(37, 'US', 'MT', 'Montana'),
(38, 'US', 'NE', 'Nebraska'),
(39, 'US', 'NV', 'Nevada'),
(40, 'US', 'NH', 'New Hampshire'),
(41, 'US', 'NJ', 'New Jersey'),
(42, 'US', 'NM', 'New Mexico'),
(43, 'US', 'NY', 'New York'),
(44, 'US', 'NC', 'North Carolina'),
(45, 'US', 'ND', 'North Dakota'),
(46, 'US', 'MP', 'Northern Mariana Islands'),
(47, 'US', 'OH', 'Ohio'),
(48, 'US', 'OK', 'Oklahoma'),
(49, 'US', 'OR', 'Oregon'),
(50, 'US', 'PW', 'Palau'),
(51, 'US', 'PA', 'Pennsylvania'),
(52, 'US', 'PR', 'Puerto Rico'),
(53, 'US', 'RI', 'Rhode Island'),
(54, 'US', 'SC', 'South Carolina'),
(55, 'US', 'SD', 'South Dakota'),
(56, 'US', 'TN', 'Tennessee'),
(57, 'US', 'TX', 'Texas'),
(58, 'US', 'UT', 'Utah'),
(59, 'US', 'VT', 'Vermont'),
(60, 'US', 'VI', 'Virgin Islands'),
(61, 'US', 'VA', 'Virginia'),
(62, 'US', 'WA', 'Washington'),
(63, 'US', 'WV', 'West Virginia'),
(64, 'US', 'WI', 'Wisconsin'),
(65, 'US', 'WY', 'Wyoming'),
(66, 'CA', 'AB', 'Alberta'),
(67, 'CA', 'BC', 'British Columbia'),
(68, 'CA', 'MB', 'Manitoba'),
(69, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 'CA', 'NB', 'New Brunswick'),
(71, 'CA', 'NS', 'Nova Scotia'),
(72, 'CA', 'NT', 'Northwest Territories'),
(73, 'CA', 'NU', 'Nunavut'),
(74, 'CA', 'ON', 'Ontario'),
(75, 'CA', 'PE', 'Prince Edward Island'),
(76, 'CA', 'QC', 'Quebec'),
(77, 'CA', 'SK', 'Saskatchewan'),
(78, 'CA', 'YT', 'Yukon Territory'),
(79, 'DE', 'NDS', 'Niedersachsen'),
(80, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 'DE', 'BAY', 'Bayern'),
(82, 'DE', 'BER', 'Berlin'),
(83, 'DE', 'BRG', 'Brandenburg'),
(84, 'DE', 'BRE', 'Bremen'),
(85, 'DE', 'HAM', 'Hamburg'),
(86, 'DE', 'HES', 'Hessen'),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 'DE', 'SAR', 'Saarland'),
(91, 'DE', 'SAS', 'Sachsen'),
(92, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 'DE', 'THE', 'Thüringen'),
(95, 'AT', 'WI', 'Wien'),
(96, 'AT', 'NO', 'Niederösterreich'),
(97, 'AT', 'OO', 'Oberösterreich'),
(98, 'AT', 'SB', 'Salzburg'),
(99, 'AT', 'KN', 'Kärnten'),
(100, 'AT', 'ST', 'Steiermark'),
(101, 'AT', 'TI', 'Tirol'),
(102, 'AT', 'BL', 'Burgenland'),
(103, 'AT', 'VB', 'Vorarlberg'),
(104, 'CH', 'AG', 'Aargau'),
(105, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 'CH', 'BE', 'Bern'),
(108, 'CH', 'BL', 'Basel-Landschaft'),
(109, 'CH', 'BS', 'Basel-Stadt'),
(110, 'CH', 'FR', 'Freiburg'),
(111, 'CH', 'GE', 'Genf'),
(112, 'CH', 'GL', 'Glarus'),
(113, 'CH', 'GR', 'Graubünden'),
(114, 'CH', 'JU', 'Jura'),
(115, 'CH', 'LU', 'Luzern'),
(116, 'CH', 'NE', 'Neuenburg'),
(117, 'CH', 'NW', 'Nidwalden'),
(118, 'CH', 'OW', 'Obwalden'),
(119, 'CH', 'SG', 'St. Gallen'),
(120, 'CH', 'SH', 'Schaffhausen'),
(121, 'CH', 'SO', 'Solothurn'),
(122, 'CH', 'SZ', 'Schwyz'),
(123, 'CH', 'TG', 'Thurgau'),
(124, 'CH', 'TI', 'Tessin'),
(125, 'CH', 'UR', 'Uri'),
(126, 'CH', 'VD', 'Waadt'),
(127, 'CH', 'VS', 'Wallis'),
(128, 'CH', 'ZG', 'Zug'),
(129, 'CH', 'ZH', 'Zürich'),
(130, 'ES', 'A Coruсa', 'A Coruña'),
(131, 'ES', 'Alava', 'Alava'),
(132, 'ES', 'Albacete', 'Albacete'),
(133, 'ES', 'Alicante', 'Alicante'),
(134, 'ES', 'Almeria', 'Almeria'),
(135, 'ES', 'Asturias', 'Asturias'),
(136, 'ES', 'Avila', 'Avila'),
(137, 'ES', 'Badajoz', 'Badajoz'),
(138, 'ES', 'Baleares', 'Baleares'),
(139, 'ES', 'Barcelona', 'Barcelona'),
(140, 'ES', 'Burgos', 'Burgos'),
(141, 'ES', 'Caceres', 'Caceres'),
(142, 'ES', 'Cadiz', 'Cadiz'),
(143, 'ES', 'Cantabria', 'Cantabria'),
(144, 'ES', 'Castellon', 'Castellon'),
(145, 'ES', 'Ceuta', 'Ceuta'),
(146, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 'ES', 'Cordoba', 'Cordoba'),
(148, 'ES', 'Cuenca', 'Cuenca'),
(149, 'ES', 'Girona', 'Girona'),
(150, 'ES', 'Granada', 'Granada'),
(151, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 'ES', 'Huelva', 'Huelva'),
(154, 'ES', 'Huesca', 'Huesca'),
(155, 'ES', 'Jaen', 'Jaen'),
(156, 'ES', 'La Rioja', 'La Rioja'),
(157, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 'ES', 'Leon', 'Leon'),
(159, 'ES', 'Lleida', 'Lleida'),
(160, 'ES', 'Lugo', 'Lugo'),
(161, 'ES', 'Madrid', 'Madrid'),
(162, 'ES', 'Malaga', 'Malaga'),
(163, 'ES', 'Melilla', 'Melilla'),
(164, 'ES', 'Murcia', 'Murcia'),
(165, 'ES', 'Navarra', 'Navarra'),
(166, 'ES', 'Ourense', 'Ourense'),
(167, 'ES', 'Palencia', 'Palencia'),
(168, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 'ES', 'Salamanca', 'Salamanca'),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 'ES', 'Segovia', 'Segovia'),
(172, 'ES', 'Sevilla', 'Sevilla'),
(173, 'ES', 'Soria', 'Soria'),
(174, 'ES', 'Tarragona', 'Tarragona'),
(175, 'ES', 'Teruel', 'Teruel'),
(176, 'ES', 'Toledo', 'Toledo'),
(177, 'ES', 'Valencia', 'Valencia'),
(178, 'ES', 'Valladolid', 'Valladolid'),
(179, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 'ES', 'Zamora', 'Zamora'),
(181, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 'FR', '1', 'Ain'),
(183, 'FR', '2', 'Aisne'),
(184, 'FR', '3', 'Allier'),
(185, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 'FR', '5', 'Hautes-Alpes'),
(187, 'FR', '6', 'Alpes-Maritimes'),
(188, 'FR', '7', 'Ardèche'),
(189, 'FR', '8', 'Ardennes'),
(190, 'FR', '9', 'Ariège'),
(191, 'FR', '10', 'Aube'),
(192, 'FR', '11', 'Aude'),
(193, 'FR', '12', 'Aveyron'),
(194, 'FR', '13', 'Bouches-du-Rhône'),
(195, 'FR', '14', 'Calvados'),
(196, 'FR', '15', 'Cantal'),
(197, 'FR', '16', 'Charente'),
(198, 'FR', '17', 'Charente-Maritime'),
(199, 'FR', '18', 'Cher'),
(200, 'FR', '19', 'Corrèze'),
(201, 'FR', '2A', 'Corse-du-Sud'),
(202, 'FR', '2B', 'Haute-Corse'),
(203, 'FR', '21', 'Côte-d''Or'),
(204, 'FR', '22', 'Côtes-d''Armor'),
(205, 'FR', '23', 'Creuse'),
(206, 'FR', '24', 'Dordogne'),
(207, 'FR', '25', 'Doubs'),
(208, 'FR', '26', 'Drôme'),
(209, 'FR', '27', 'Eure'),
(210, 'FR', '28', 'Eure-et-Loir'),
(211, 'FR', '29', 'Finistère'),
(212, 'FR', '30', 'Gard'),
(213, 'FR', '31', 'Haute-Garonne'),
(214, 'FR', '32', 'Gers'),
(215, 'FR', '33', 'Gironde'),
(216, 'FR', '34', 'Hérault'),
(217, 'FR', '35', 'Ille-et-Vilaine'),
(218, 'FR', '36', 'Indre'),
(219, 'FR', '37', 'Indre-et-Loire'),
(220, 'FR', '38', 'Isère'),
(221, 'FR', '39', 'Jura'),
(222, 'FR', '40', 'Landes'),
(223, 'FR', '41', 'Loir-et-Cher'),
(224, 'FR', '42', 'Loire'),
(225, 'FR', '43', 'Haute-Loire'),
(226, 'FR', '44', 'Loire-Atlantique'),
(227, 'FR', '45', 'Loiret'),
(228, 'FR', '46', 'Lot'),
(229, 'FR', '47', 'Lot-et-Garonne'),
(230, 'FR', '48', 'Lozère'),
(231, 'FR', '49', 'Maine-et-Loire'),
(232, 'FR', '50', 'Manche'),
(233, 'FR', '51', 'Marne'),
(234, 'FR', '52', 'Haute-Marne'),
(235, 'FR', '53', 'Mayenne'),
(236, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 'FR', '55', 'Meuse'),
(238, 'FR', '56', 'Morbihan'),
(239, 'FR', '57', 'Moselle'),
(240, 'FR', '58', 'Nièvre'),
(241, 'FR', '59', 'Nord'),
(242, 'FR', '60', 'Oise'),
(243, 'FR', '61', 'Orne'),
(244, 'FR', '62', 'Pas-de-Calais'),
(245, 'FR', '63', 'Puy-de-Dôme'),
(246, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 'FR', '65', 'Hautes-Pyrénées'),
(248, 'FR', '66', 'Pyrénées-Orientales'),
(249, 'FR', '67', 'Bas-Rhin'),
(250, 'FR', '68', 'Haut-Rhin'),
(251, 'FR', '69', 'Rhône'),
(252, 'FR', '70', 'Haute-Saône'),
(253, 'FR', '71', 'Saône-et-Loire'),
(254, 'FR', '72', 'Sarthe'),
(255, 'FR', '73', 'Savoie'),
(256, 'FR', '74', 'Haute-Savoie'),
(257, 'FR', '75', 'Paris'),
(258, 'FR', '76', 'Seine-Maritime'),
(259, 'FR', '77', 'Seine-et-Marne'),
(260, 'FR', '78', 'Yvelines'),
(261, 'FR', '79', 'Deux-Sèvres'),
(262, 'FR', '80', 'Somme'),
(263, 'FR', '81', 'Tarn'),
(264, 'FR', '82', 'Tarn-et-Garonne'),
(265, 'FR', '83', 'Var'),
(266, 'FR', '84', 'Vaucluse'),
(267, 'FR', '85', 'Vendée'),
(268, 'FR', '86', 'Vienne'),
(269, 'FR', '87', 'Haute-Vienne'),
(270, 'FR', '88', 'Vosges'),
(271, 'FR', '89', 'Yonne'),
(272, 'FR', '90', 'Territoire-de-Belfort'),
(273, 'FR', '91', 'Essonne'),
(274, 'FR', '92', 'Hauts-de-Seine'),
(275, 'FR', '93', 'Seine-Saint-Denis'),
(276, 'FR', '94', 'Val-de-Marne'),
(277, 'FR', '95', 'Val-d''Oise'),
(278, 'RO', 'AB', 'Alba'),
(279, 'RO', 'AR', 'Arad'),
(280, 'RO', 'AG', 'Argeş'),
(281, 'RO', 'BC', 'Bacău'),
(282, 'RO', 'BH', 'Bihor'),
(283, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 'RO', 'BT', 'Botoşani'),
(285, 'RO', 'BV', 'Braşov'),
(286, 'RO', 'BR', 'Brăila'),
(287, 'RO', 'B', 'Bucureşti'),
(288, 'RO', 'BZ', 'Buzău'),
(289, 'RO', 'CS', 'Caraş-Severin'),
(290, 'RO', 'CL', 'Călăraşi'),
(291, 'RO', 'CJ', 'Cluj'),
(292, 'RO', 'CT', 'Constanţa'),
(293, 'RO', 'CV', 'Covasna'),
(294, 'RO', 'DB', 'Dâmboviţa'),
(295, 'RO', 'DJ', 'Dolj'),
(296, 'RO', 'GL', 'Galaţi'),
(297, 'RO', 'GR', 'Giurgiu'),
(298, 'RO', 'GJ', 'Gorj'),
(299, 'RO', 'HR', 'Harghita'),
(300, 'RO', 'HD', 'Hunedoara'),
(301, 'RO', 'IL', 'Ialomiţa'),
(302, 'RO', 'IS', 'Iaşi'),
(303, 'RO', 'IF', 'Ilfov'),
(304, 'RO', 'MM', 'Maramureş'),
(305, 'RO', 'MH', 'Mehedinţi'),
(306, 'RO', 'MS', 'Mureş'),
(307, 'RO', 'NT', 'Neamţ'),
(308, 'RO', 'OT', 'Olt'),
(309, 'RO', 'PH', 'Prahova'),
(310, 'RO', 'SM', 'Satu-Mare'),
(311, 'RO', 'SJ', 'Sălaj'),
(312, 'RO', 'SB', 'Sibiu'),
(313, 'RO', 'SV', 'Suceava'),
(314, 'RO', 'TR', 'Teleorman'),
(315, 'RO', 'TM', 'Timiş'),
(316, 'RO', 'TL', 'Tulcea'),
(317, 'RO', 'VS', 'Vaslui'),
(318, 'RO', 'VL', 'Vâlcea'),
(319, 'RO', 'VN', 'Vrancea'),
(320, 'FI', 'Lappi', 'Lappi'),
(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 'FI', 'Kainuu', 'Kainuu'),
(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 'FI', 'Satakunta', 'Satakunta'),
(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 'EE', 'EE-37', 'Harjumaa'),
(341, 'EE', 'EE-39', 'Hiiumaa'),
(342, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 'EE', 'EE-51', 'Järvamaa'),
(345, 'EE', 'EE-57', 'Läänemaa'),
(346, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 'EE', 'EE-65', 'Põlvamaa'),
(348, 'EE', 'EE-67', 'Pärnumaa'),
(349, 'EE', 'EE-70', 'Raplamaa'),
(350, 'EE', 'EE-74', 'Saaremaa'),
(351, 'EE', 'EE-78', 'Tartumaa'),
(352, 'EE', 'EE-82', 'Valgamaa'),
(353, 'EE', 'EE-84', 'Viljandimaa'),
(354, 'EE', 'EE-86', 'Võrumaa'),
(355, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 'LV', 'LV-JEL', 'Jelgava'),
(357, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 'LV', 'LV-LPX', 'Liepāja'),
(360, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 'LV', 'LV-RIX', 'Rīga'),
(363, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 'LV', 'Valmiera', 'Valmiera'),
(365, 'LV', 'LV-VEN', 'Ventspils'),
(366, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 'LV', 'Apes novads', 'Apes novads'),
(375, 'LV', 'Auces novads', 'Auces novads'),
(376, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 'LV', 'LV-BL', 'Balvu novads'),
(380, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 'LV', 'Engures novads', 'Engures novads'),
(394, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 'LV', 'LV-MA', 'Madonas novads'),
(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 'LV', 'LV-OG', 'Ogres novads'),
(427, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 'LV', 'Salas novads', 'Salas novads'),
(446, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 'LV', 'LV-SA', 'Saldus novads'),
(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 'LV', 'LV-TA', 'Talsu novads'),
(457, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 'LV', 'LV-VK', 'Valkas novads'),
(461, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 'BR', 'AC', 'Acre'),
(486, 'BR', 'AL', 'Alagoas'),
(487, 'BR', 'AP', 'Amapá'),
(488, 'BR', 'AM', 'Amazonas'),
(489, 'BR', 'BA', 'Bahia'),
(490, 'BR', 'CE', 'Ceará'),
(491, 'BR', 'ES', 'Espírito Santo'),
(492, 'BR', 'GO', 'Goiás'),
(493, 'BR', 'MA', 'Maranhão'),
(494, 'BR', 'MT', 'Mato Grosso'),
(495, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 'BR', 'MG', 'Minas Gerais'),
(497, 'BR', 'PA', 'Pará'),
(498, 'BR', 'PB', 'Paraíba'),
(499, 'BR', 'PR', 'Paraná'),
(500, 'BR', 'PE', 'Pernambuco'),
(501, 'BR', 'PI', 'Piauí'),
(502, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 'BR', 'RO', 'Rondônia'),
(506, 'BR', 'RR', 'Roraima'),
(507, 'BR', 'SC', 'Santa Catarina'),
(508, 'BR', 'SP', 'São Paulo'),
(509, 'BR', 'SE', 'Sergipe'),
(510, 'BR', 'TO', 'Tocantins'),
(511, 'BR', 'DF', 'Distrito Federal');

-- --------------------------------------------------------

--
-- Table structure for table `directory_country_region_name`
--

DROP TABLE IF EXISTS `directory_country_region_name`;
CREATE TABLE IF NOT EXISTS `directory_country_region_name` (
  `locale` varchar(8) NOT NULL COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `IDX_DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';

--
-- Dumping data for table `directory_country_region_name`
--

INSERT INTO `directory_country_region_name` (`locale`, `region_id`, `name`) VALUES
('en_US', 1, 'Alabama'),
('en_US', 2, 'Alaska'),
('en_US', 3, 'American Samoa'),
('en_US', 4, 'Arizona'),
('en_US', 5, 'Arkansas'),
('en_US', 6, 'Armed Forces Africa'),
('en_US', 7, 'Armed Forces Americas'),
('en_US', 8, 'Armed Forces Canada'),
('en_US', 9, 'Armed Forces Europe'),
('en_US', 10, 'Armed Forces Middle East'),
('en_US', 11, 'Armed Forces Pacific'),
('en_US', 12, 'California'),
('en_US', 13, 'Colorado'),
('en_US', 14, 'Connecticut'),
('en_US', 15, 'Delaware'),
('en_US', 16, 'District of Columbia'),
('en_US', 17, 'Federated States Of Micronesia'),
('en_US', 18, 'Florida'),
('en_US', 19, 'Georgia'),
('en_US', 20, 'Guam'),
('en_US', 21, 'Hawaii'),
('en_US', 22, 'Idaho'),
('en_US', 23, 'Illinois'),
('en_US', 24, 'Indiana'),
('en_US', 25, 'Iowa'),
('en_US', 26, 'Kansas'),
('en_US', 27, 'Kentucky'),
('en_US', 28, 'Louisiana'),
('en_US', 29, 'Maine'),
('en_US', 30, 'Marshall Islands'),
('en_US', 31, 'Maryland'),
('en_US', 32, 'Massachusetts'),
('en_US', 33, 'Michigan'),
('en_US', 34, 'Minnesota'),
('en_US', 35, 'Mississippi'),
('en_US', 36, 'Missouri'),
('en_US', 37, 'Montana'),
('en_US', 38, 'Nebraska'),
('en_US', 39, 'Nevada'),
('en_US', 40, 'New Hampshire'),
('en_US', 41, 'New Jersey'),
('en_US', 42, 'New Mexico'),
('en_US', 43, 'New York'),
('en_US', 44, 'North Carolina'),
('en_US', 45, 'North Dakota'),
('en_US', 46, 'Northern Mariana Islands'),
('en_US', 47, 'Ohio'),
('en_US', 48, 'Oklahoma'),
('en_US', 49, 'Oregon'),
('en_US', 50, 'Palau'),
('en_US', 51, 'Pennsylvania'),
('en_US', 52, 'Puerto Rico'),
('en_US', 53, 'Rhode Island'),
('en_US', 54, 'South Carolina'),
('en_US', 55, 'South Dakota'),
('en_US', 56, 'Tennessee'),
('en_US', 57, 'Texas'),
('en_US', 58, 'Utah'),
('en_US', 59, 'Vermont'),
('en_US', 60, 'Virgin Islands'),
('en_US', 61, 'Virginia'),
('en_US', 62, 'Washington'),
('en_US', 63, 'West Virginia'),
('en_US', 64, 'Wisconsin'),
('en_US', 65, 'Wyoming'),
('en_US', 66, 'Alberta'),
('en_US', 67, 'British Columbia'),
('en_US', 68, 'Manitoba'),
('en_US', 69, 'Newfoundland and Labrador'),
('en_US', 70, 'New Brunswick'),
('en_US', 71, 'Nova Scotia'),
('en_US', 72, 'Northwest Territories'),
('en_US', 73, 'Nunavut'),
('en_US', 74, 'Ontario'),
('en_US', 75, 'Prince Edward Island'),
('en_US', 76, 'Quebec'),
('en_US', 77, 'Saskatchewan'),
('en_US', 78, 'Yukon Territory'),
('en_US', 79, 'Niedersachsen'),
('en_US', 80, 'Baden-Württemberg'),
('en_US', 81, 'Bayern'),
('en_US', 82, 'Berlin'),
('en_US', 83, 'Brandenburg'),
('en_US', 84, 'Bremen'),
('en_US', 85, 'Hamburg'),
('en_US', 86, 'Hessen'),
('en_US', 87, 'Mecklenburg-Vorpommern'),
('en_US', 88, 'Nordrhein-Westfalen'),
('en_US', 89, 'Rheinland-Pfalz'),
('en_US', 90, 'Saarland'),
('en_US', 91, 'Sachsen'),
('en_US', 92, 'Sachsen-Anhalt'),
('en_US', 93, 'Schleswig-Holstein'),
('en_US', 94, 'Thüringen'),
('en_US', 95, 'Wien'),
('en_US', 96, 'Niederösterreich'),
('en_US', 97, 'Oberösterreich'),
('en_US', 98, 'Salzburg'),
('en_US', 99, 'Kärnten'),
('en_US', 100, 'Steiermark'),
('en_US', 101, 'Tirol'),
('en_US', 102, 'Burgenland'),
('en_US', 103, 'Vorarlberg'),
('en_US', 104, 'Aargau'),
('en_US', 105, 'Appenzell Innerrhoden'),
('en_US', 106, 'Appenzell Ausserrhoden'),
('en_US', 107, 'Bern'),
('en_US', 108, 'Basel-Landschaft'),
('en_US', 109, 'Basel-Stadt'),
('en_US', 110, 'Freiburg'),
('en_US', 111, 'Genf'),
('en_US', 112, 'Glarus'),
('en_US', 113, 'Graubünden'),
('en_US', 114, 'Jura'),
('en_US', 115, 'Luzern'),
('en_US', 116, 'Neuenburg'),
('en_US', 117, 'Nidwalden'),
('en_US', 118, 'Obwalden'),
('en_US', 119, 'St. Gallen'),
('en_US', 120, 'Schaffhausen'),
('en_US', 121, 'Solothurn'),
('en_US', 122, 'Schwyz'),
('en_US', 123, 'Thurgau'),
('en_US', 124, 'Tessin'),
('en_US', 125, 'Uri'),
('en_US', 126, 'Waadt'),
('en_US', 127, 'Wallis'),
('en_US', 128, 'Zug'),
('en_US', 129, 'Zürich'),
('en_US', 130, 'A Coruña'),
('en_US', 131, 'Alava'),
('en_US', 132, 'Albacete'),
('en_US', 133, 'Alicante'),
('en_US', 134, 'Almeria'),
('en_US', 135, 'Asturias'),
('en_US', 136, 'Avila'),
('en_US', 137, 'Badajoz'),
('en_US', 138, 'Baleares'),
('en_US', 139, 'Barcelona'),
('en_US', 140, 'Burgos'),
('en_US', 141, 'Caceres'),
('en_US', 142, 'Cadiz'),
('en_US', 143, 'Cantabria'),
('en_US', 144, 'Castellon'),
('en_US', 145, 'Ceuta'),
('en_US', 146, 'Ciudad Real'),
('en_US', 147, 'Cordoba'),
('en_US', 148, 'Cuenca'),
('en_US', 149, 'Girona'),
('en_US', 150, 'Granada'),
('en_US', 151, 'Guadalajara'),
('en_US', 152, 'Guipuzcoa'),
('en_US', 153, 'Huelva'),
('en_US', 154, 'Huesca'),
('en_US', 155, 'Jaen'),
('en_US', 156, 'La Rioja'),
('en_US', 157, 'Las Palmas'),
('en_US', 158, 'Leon'),
('en_US', 159, 'Lleida'),
('en_US', 160, 'Lugo'),
('en_US', 161, 'Madrid'),
('en_US', 162, 'Malaga'),
('en_US', 163, 'Melilla'),
('en_US', 164, 'Murcia'),
('en_US', 165, 'Navarra'),
('en_US', 166, 'Ourense'),
('en_US', 167, 'Palencia'),
('en_US', 168, 'Pontevedra'),
('en_US', 169, 'Salamanca'),
('en_US', 170, 'Santa Cruz de Tenerife'),
('en_US', 171, 'Segovia'),
('en_US', 172, 'Sevilla'),
('en_US', 173, 'Soria'),
('en_US', 174, 'Tarragona'),
('en_US', 175, 'Teruel'),
('en_US', 176, 'Toledo'),
('en_US', 177, 'Valencia'),
('en_US', 178, 'Valladolid'),
('en_US', 179, 'Vizcaya'),
('en_US', 180, 'Zamora'),
('en_US', 181, 'Zaragoza'),
('en_US', 182, 'Ain'),
('en_US', 183, 'Aisne'),
('en_US', 184, 'Allier'),
('en_US', 185, 'Alpes-de-Haute-Provence'),
('en_US', 186, 'Hautes-Alpes'),
('en_US', 187, 'Alpes-Maritimes'),
('en_US', 188, 'Ardèche'),
('en_US', 189, 'Ardennes'),
('en_US', 190, 'Ariège'),
('en_US', 191, 'Aube'),
('en_US', 192, 'Aude'),
('en_US', 193, 'Aveyron'),
('en_US', 194, 'Bouches-du-Rhône'),
('en_US', 195, 'Calvados'),
('en_US', 196, 'Cantal'),
('en_US', 197, 'Charente'),
('en_US', 198, 'Charente-Maritime'),
('en_US', 199, 'Cher'),
('en_US', 200, 'Corrèze'),
('en_US', 201, 'Corse-du-Sud'),
('en_US', 202, 'Haute-Corse'),
('en_US', 203, 'Côte-d''Or'),
('en_US', 204, 'Côtes-d''Armor'),
('en_US', 205, 'Creuse'),
('en_US', 206, 'Dordogne'),
('en_US', 207, 'Doubs'),
('en_US', 208, 'Drôme'),
('en_US', 209, 'Eure'),
('en_US', 210, 'Eure-et-Loir'),
('en_US', 211, 'Finistère'),
('en_US', 212, 'Gard'),
('en_US', 213, 'Haute-Garonne'),
('en_US', 214, 'Gers'),
('en_US', 215, 'Gironde'),
('en_US', 216, 'Hérault'),
('en_US', 217, 'Ille-et-Vilaine'),
('en_US', 218, 'Indre'),
('en_US', 219, 'Indre-et-Loire'),
('en_US', 220, 'Isère'),
('en_US', 221, 'Jura'),
('en_US', 222, 'Landes'),
('en_US', 223, 'Loir-et-Cher'),
('en_US', 224, 'Loire'),
('en_US', 225, 'Haute-Loire'),
('en_US', 226, 'Loire-Atlantique'),
('en_US', 227, 'Loiret'),
('en_US', 228, 'Lot'),
('en_US', 229, 'Lot-et-Garonne'),
('en_US', 230, 'Lozère'),
('en_US', 231, 'Maine-et-Loire'),
('en_US', 232, 'Manche'),
('en_US', 233, 'Marne'),
('en_US', 234, 'Haute-Marne'),
('en_US', 235, 'Mayenne'),
('en_US', 236, 'Meurthe-et-Moselle'),
('en_US', 237, 'Meuse'),
('en_US', 238, 'Morbihan'),
('en_US', 239, 'Moselle'),
('en_US', 240, 'Nièvre'),
('en_US', 241, 'Nord'),
('en_US', 242, 'Oise'),
('en_US', 243, 'Orne'),
('en_US', 244, 'Pas-de-Calais'),
('en_US', 245, 'Puy-de-Dôme'),
('en_US', 246, 'Pyrénées-Atlantiques'),
('en_US', 247, 'Hautes-Pyrénées'),
('en_US', 248, 'Pyrénées-Orientales'),
('en_US', 249, 'Bas-Rhin'),
('en_US', 250, 'Haut-Rhin'),
('en_US', 251, 'Rhône'),
('en_US', 252, 'Haute-Saône'),
('en_US', 253, 'Saône-et-Loire'),
('en_US', 254, 'Sarthe'),
('en_US', 255, 'Savoie'),
('en_US', 256, 'Haute-Savoie'),
('en_US', 257, 'Paris'),
('en_US', 258, 'Seine-Maritime'),
('en_US', 259, 'Seine-et-Marne'),
('en_US', 260, 'Yvelines'),
('en_US', 261, 'Deux-Sèvres'),
('en_US', 262, 'Somme'),
('en_US', 263, 'Tarn'),
('en_US', 264, 'Tarn-et-Garonne'),
('en_US', 265, 'Var'),
('en_US', 266, 'Vaucluse'),
('en_US', 267, 'Vendée'),
('en_US', 268, 'Vienne'),
('en_US', 269, 'Haute-Vienne'),
('en_US', 270, 'Vosges'),
('en_US', 271, 'Yonne'),
('en_US', 272, 'Territoire-de-Belfort'),
('en_US', 273, 'Essonne'),
('en_US', 274, 'Hauts-de-Seine'),
('en_US', 275, 'Seine-Saint-Denis'),
('en_US', 276, 'Val-de-Marne'),
('en_US', 277, 'Val-d''Oise'),
('en_US', 278, 'Alba'),
('en_US', 279, 'Arad'),
('en_US', 280, 'Argeş'),
('en_US', 281, 'Bacău'),
('en_US', 282, 'Bihor'),
('en_US', 283, 'Bistriţa-Năsăud'),
('en_US', 284, 'Botoşani'),
('en_US', 285, 'Braşov'),
('en_US', 286, 'Brăila'),
('en_US', 287, 'Bucureşti'),
('en_US', 288, 'Buzău'),
('en_US', 289, 'Caraş-Severin'),
('en_US', 290, 'Călăraşi'),
('en_US', 291, 'Cluj'),
('en_US', 292, 'Constanţa'),
('en_US', 293, 'Covasna'),
('en_US', 294, 'Dâmboviţa'),
('en_US', 295, 'Dolj'),
('en_US', 296, 'Galaţi'),
('en_US', 297, 'Giurgiu'),
('en_US', 298, 'Gorj'),
('en_US', 299, 'Harghita'),
('en_US', 300, 'Hunedoara'),
('en_US', 301, 'Ialomiţa'),
('en_US', 302, 'Iaşi'),
('en_US', 303, 'Ilfov'),
('en_US', 304, 'Maramureş'),
('en_US', 305, 'Mehedinţi'),
('en_US', 306, 'Mureş'),
('en_US', 307, 'Neamţ'),
('en_US', 308, 'Olt'),
('en_US', 309, 'Prahova'),
('en_US', 310, 'Satu-Mare'),
('en_US', 311, 'Sălaj'),
('en_US', 312, 'Sibiu'),
('en_US', 313, 'Suceava'),
('en_US', 314, 'Teleorman'),
('en_US', 315, 'Timiş'),
('en_US', 316, 'Tulcea'),
('en_US', 317, 'Vaslui'),
('en_US', 318, 'Vâlcea'),
('en_US', 319, 'Vrancea'),
('en_US', 320, 'Lappi'),
('en_US', 321, 'Pohjois-Pohjanmaa'),
('en_US', 322, 'Kainuu'),
('en_US', 323, 'Pohjois-Karjala'),
('en_US', 324, 'Pohjois-Savo'),
('en_US', 325, 'Etelä-Savo'),
('en_US', 326, 'Etelä-Pohjanmaa'),
('en_US', 327, 'Pohjanmaa'),
('en_US', 328, 'Pirkanmaa'),
('en_US', 329, 'Satakunta'),
('en_US', 330, 'Keski-Pohjanmaa'),
('en_US', 331, 'Keski-Suomi'),
('en_US', 332, 'Varsinais-Suomi'),
('en_US', 333, 'Etelä-Karjala'),
('en_US', 334, 'Päijät-Häme'),
('en_US', 335, 'Kanta-Häme'),
('en_US', 336, 'Uusimaa'),
('en_US', 337, 'Itä-Uusimaa'),
('en_US', 338, 'Kymenlaakso'),
('en_US', 339, 'Ahvenanmaa'),
('en_US', 340, 'Harjumaa'),
('en_US', 341, 'Hiiumaa'),
('en_US', 342, 'Ida-Virumaa'),
('en_US', 343, 'Jõgevamaa'),
('en_US', 344, 'Järvamaa'),
('en_US', 345, 'Läänemaa'),
('en_US', 346, 'Lääne-Virumaa'),
('en_US', 347, 'Põlvamaa'),
('en_US', 348, 'Pärnumaa'),
('en_US', 349, 'Raplamaa'),
('en_US', 350, 'Saaremaa'),
('en_US', 351, 'Tartumaa'),
('en_US', 352, 'Valgamaa'),
('en_US', 353, 'Viljandimaa'),
('en_US', 354, 'Võrumaa'),
('en_US', 355, 'Daugavpils'),
('en_US', 356, 'Jelgava'),
('en_US', 357, 'Jēkabpils'),
('en_US', 358, 'Jūrmala'),
('en_US', 359, 'Liepāja'),
('en_US', 360, 'Liepājas novads'),
('en_US', 361, 'Rēzekne'),
('en_US', 362, 'Rīga'),
('en_US', 363, 'Rīgas novads'),
('en_US', 364, 'Valmiera'),
('en_US', 365, 'Ventspils'),
('en_US', 366, 'Aglonas novads'),
('en_US', 367, 'Aizkraukles novads'),
('en_US', 368, 'Aizputes novads'),
('en_US', 369, 'Aknīstes novads'),
('en_US', 370, 'Alojas novads'),
('en_US', 371, 'Alsungas novads'),
('en_US', 372, 'Alūksnes novads'),
('en_US', 373, 'Amatas novads'),
('en_US', 374, 'Apes novads'),
('en_US', 375, 'Auces novads'),
('en_US', 376, 'Babītes novads'),
('en_US', 377, 'Baldones novads'),
('en_US', 378, 'Baltinavas novads'),
('en_US', 379, 'Balvu novads'),
('en_US', 380, 'Bauskas novads'),
('en_US', 381, 'Beverīnas novads'),
('en_US', 382, 'Brocēnu novads'),
('en_US', 383, 'Burtnieku novads'),
('en_US', 384, 'Carnikavas novads'),
('en_US', 385, 'Cesvaines novads'),
('en_US', 386, 'Ciblas novads'),
('en_US', 387, 'Cēsu novads'),
('en_US', 388, 'Dagdas novads'),
('en_US', 389, 'Daugavpils novads'),
('en_US', 390, 'Dobeles novads'),
('en_US', 391, 'Dundagas novads'),
('en_US', 392, 'Durbes novads'),
('en_US', 393, 'Engures novads'),
('en_US', 394, 'Garkalnes novads'),
('en_US', 395, 'Grobiņas novads'),
('en_US', 396, 'Gulbenes novads'),
('en_US', 397, 'Iecavas novads'),
('en_US', 398, 'Ikšķiles novads'),
('en_US', 399, 'Ilūkstes novads'),
('en_US', 400, 'Inčukalna novads'),
('en_US', 401, 'Jaunjelgavas novads'),
('en_US', 402, 'Jaunpiebalgas novads'),
('en_US', 403, 'Jaunpils novads'),
('en_US', 404, 'Jelgavas novads'),
('en_US', 405, 'Jēkabpils novads'),
('en_US', 406, 'Kandavas novads'),
('en_US', 407, 'Kokneses novads'),
('en_US', 408, 'Krimuldas novads'),
('en_US', 409, 'Krustpils novads'),
('en_US', 410, 'Krāslavas novads'),
('en_US', 411, 'Kuldīgas novads'),
('en_US', 412, 'Kārsavas novads'),
('en_US', 413, 'Lielvārdes novads'),
('en_US', 414, 'Limbažu novads'),
('en_US', 415, 'Lubānas novads'),
('en_US', 416, 'Ludzas novads'),
('en_US', 417, 'Līgatnes novads'),
('en_US', 418, 'Līvānu novads'),
('en_US', 419, 'Madonas novads'),
('en_US', 420, 'Mazsalacas novads'),
('en_US', 421, 'Mālpils novads'),
('en_US', 422, 'Mārupes novads'),
('en_US', 423, 'Naukšēnu novads'),
('en_US', 424, 'Neretas novads'),
('en_US', 425, 'Nīcas novads'),
('en_US', 426, 'Ogres novads'),
('en_US', 427, 'Olaines novads'),
('en_US', 428, 'Ozolnieku novads'),
('en_US', 429, 'Preiļu novads'),
('en_US', 430, 'Priekules novads'),
('en_US', 431, 'Priekuļu novads'),
('en_US', 432, 'Pārgaujas novads'),
('en_US', 433, 'Pāvilostas novads'),
('en_US', 434, 'Pļaviņu novads'),
('en_US', 435, 'Raunas novads'),
('en_US', 436, 'Riebiņu novads'),
('en_US', 437, 'Rojas novads'),
('en_US', 438, 'Ropažu novads'),
('en_US', 439, 'Rucavas novads'),
('en_US', 440, 'Rugāju novads'),
('en_US', 441, 'Rundāles novads'),
('en_US', 442, 'Rēzeknes novads'),
('en_US', 443, 'Rūjienas novads'),
('en_US', 444, 'Salacgrīvas novads'),
('en_US', 445, 'Salas novads'),
('en_US', 446, 'Salaspils novads'),
('en_US', 447, 'Saldus novads'),
('en_US', 448, 'Saulkrastu novads'),
('en_US', 449, 'Siguldas novads'),
('en_US', 450, 'Skrundas novads'),
('en_US', 451, 'Skrīveru novads'),
('en_US', 452, 'Smiltenes novads'),
('en_US', 453, 'Stopiņu novads'),
('en_US', 454, 'Strenču novads'),
('en_US', 455, 'Sējas novads'),
('en_US', 456, 'Talsu novads'),
('en_US', 457, 'Tukuma novads'),
('en_US', 458, 'Tērvetes novads'),
('en_US', 459, 'Vaiņodes novads'),
('en_US', 460, 'Valkas novads'),
('en_US', 461, 'Valmieras novads'),
('en_US', 462, 'Varakļānu novads'),
('en_US', 463, 'Vecpiebalgas novads'),
('en_US', 464, 'Vecumnieku novads'),
('en_US', 465, 'Ventspils novads'),
('en_US', 466, 'Viesītes novads'),
('en_US', 467, 'Viļakas novads'),
('en_US', 468, 'Viļānu novads'),
('en_US', 469, 'Vārkavas novads'),
('en_US', 470, 'Zilupes novads'),
('en_US', 471, 'Ādažu novads'),
('en_US', 472, 'Ērgļu novads'),
('en_US', 473, 'Ķeguma novads'),
('en_US', 474, 'Ķekavas novads'),
('en_US', 475, 'Alytaus Apskritis'),
('en_US', 476, 'Kauno Apskritis'),
('en_US', 477, 'Klaipėdos Apskritis'),
('en_US', 478, 'Marijampolės Apskritis'),
('en_US', 479, 'Panevėžio Apskritis'),
('en_US', 480, 'Šiaulių Apskritis'),
('en_US', 481, 'Tauragės Apskritis'),
('en_US', 482, 'Telšių Apskritis'),
('en_US', 483, 'Utenos Apskritis'),
('en_US', 484, 'Vilniaus Apskritis'),
('en_US', 485, 'Acre'),
('en_US', 486, 'Alagoas'),
('en_US', 487, 'Amapá'),
('en_US', 488, 'Amazonas'),
('en_US', 489, 'Bahia'),
('en_US', 490, 'Ceará'),
('en_US', 491, 'Espírito Santo'),
('en_US', 492, 'Goiás'),
('en_US', 493, 'Maranhão'),
('en_US', 494, 'Mato Grosso'),
('en_US', 495, 'Mato Grosso do Sul'),
('en_US', 496, 'Minas Gerais'),
('en_US', 497, 'Pará'),
('en_US', 498, 'Paraíba'),
('en_US', 499, 'Paraná'),
('en_US', 500, 'Pernambuco'),
('en_US', 501, 'Piauí'),
('en_US', 502, 'Rio de Janeiro'),
('en_US', 503, 'Rio Grande do Norte'),
('en_US', 504, 'Rio Grande do Sul'),
('en_US', 505, 'Rondônia'),
('en_US', 506, 'Roraima'),
('en_US', 507, 'Santa Catarina'),
('en_US', 508, 'São Paulo'),
('en_US', 509, 'Sergipe'),
('en_US', 510, 'Tocantins'),
('en_US', 511, 'Distrito Federal');

-- --------------------------------------------------------

--
-- Table structure for table `directory_currency_rate`
--

DROP TABLE IF EXISTS `directory_currency_rate`;
CREATE TABLE IF NOT EXISTS `directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `IDX_DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';

--
-- Dumping data for table `directory_currency_rate`
--

INSERT INTO `directory_currency_rate` (`currency_from`, `currency_to`, `rate`) VALUES
('EUR', 'EUR', '1.000000000000'),
('EUR', 'USD', '1.415000000000'),
('USD', 'EUR', '0.706700000000'),
('USD', 'USD', '1.000000000000');

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link`
--

DROP TABLE IF EXISTS `downloadable_link`;
CREATE TABLE IF NOT EXISTS `downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_price`
--

DROP TABLE IF EXISTS `downloadable_link_price`;
CREATE TABLE IF NOT EXISTS `downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
CREATE TABLE IF NOT EXISTS `downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `downloadable_link_purchased_item`;
CREATE TABLE IF NOT EXISTS `downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `IDX_DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_title`
--

DROP TABLE IF EXISTS `downloadable_link_title`;
CREATE TABLE IF NOT EXISTS `downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `IDX_DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample`
--

DROP TABLE IF EXISTS `downloadable_sample`;
CREATE TABLE IF NOT EXISTS `downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `IDX_DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_sample_title`
--

DROP TABLE IF EXISTS `downloadable_sample_title`;
CREATE TABLE IF NOT EXISTS `downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `IDX_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute`
--

DROP TABLE IF EXISTS `eav_attribute`;
CREATE TABLE IF NOT EXISTS `eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute' AUTO_INCREMENT=131 ;

--
-- Dumping data for table `eav_attribute`
--

INSERT INTO `eav_attribute` (`attribute_id`, `entity_type_id`, `attribute_code`, `attribute_model`, `backend_model`, `backend_type`, `backend_table`, `frontend_model`, `frontend_input`, `frontend_label`, `frontend_class`, `source_model`, `is_required`, `is_user_defined`, `default_value`, `is_unique`, `note`) VALUES
(1, 1, 'website_id', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website', 'static', NULL, NULL, 'select', 'Associate to Website', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website', 1, 0, NULL, 0, NULL),
(2, 1, 'store_id', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store', 'static', NULL, NULL, 'select', 'Create In', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store', 1, 0, NULL, 0, NULL),
(3, 1, 'created_in', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Created From', NULL, NULL, 0, 0, NULL, 0, NULL),
(4, 1, 'prefix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(5, 1, 'firstname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(6, 1, 'middlename', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(7, 1, 'lastname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(8, 1, 'suffix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(9, 1, 'email', NULL, NULL, 'static', NULL, NULL, 'text', 'Email', NULL, NULL, 1, 0, NULL, 0, NULL),
(10, 1, 'group_id', NULL, NULL, 'static', NULL, NULL, 'select', 'Group', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group', 1, 0, NULL, 0, NULL),
(11, 1, 'dob', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime', 'date', 'Date Of Birth', NULL, NULL, 0, 0, NULL, 0, NULL),
(12, 1, 'password_hash', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password', 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(13, 1, 'default_billing', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing', 'int', NULL, NULL, 'text', 'Default Billing Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(14, 1, 'default_shipping', NULL, 'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping', 'int', NULL, NULL, 'text', 'Default Shipping Address', NULL, NULL, 0, 0, NULL, 0, NULL),
(15, 1, 'taxvat', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Tax/VAT Number', NULL, NULL, 0, 0, NULL, 0, NULL),
(16, 1, 'confirmation', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Is Confirmed', NULL, NULL, 0, 0, NULL, 0, NULL),
(17, 1, 'created_at', NULL, NULL, 'static', NULL, NULL, 'date', 'Created At', NULL, NULL, 0, 0, NULL, 0, NULL),
(18, 1, 'gender', NULL, NULL, 'int', NULL, NULL, 'select', 'Gender', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table', 0, 0, NULL, 0, NULL),
(19, 2, 'prefix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Prefix', NULL, NULL, 0, 0, NULL, 0, NULL),
(20, 2, 'firstname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'First Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(21, 2, 'middlename', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Middle Name/Initial', NULL, NULL, 0, 0, NULL, 0, NULL),
(22, 2, 'lastname', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Last Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(23, 2, 'suffix', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Suffix', NULL, NULL, 0, 0, NULL, 0, NULL),
(24, 2, 'company', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Company', NULL, NULL, 0, 0, NULL, 0, NULL),
(25, 2, 'street', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend', 'text', NULL, NULL, 'multiline', 'Street Address', NULL, NULL, 1, 0, NULL, 0, NULL),
(26, 2, 'city', NULL, NULL, 'varchar', NULL, NULL, 'text', 'City', NULL, NULL, 1, 0, NULL, 0, NULL),
(27, 2, 'country_id', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country', NULL, 'Magento\\Customer\\Model\\Resource\\Address\\Attribute\\Source\\Country', 1, 0, NULL, 0, NULL),
(28, 2, 'region', NULL, 'Magento\\Customer\\Model\\Resource\\Address\\Attribute\\Backend\\Region', 'varchar', NULL, NULL, 'text', 'State/Province', NULL, NULL, 0, 0, NULL, 0, NULL),
(29, 2, 'region_id', NULL, NULL, 'int', NULL, NULL, 'hidden', 'State/Province', NULL, 'Magento\\Customer\\Model\\Resource\\Address\\Attribute\\Source\\Region', 0, 0, NULL, 0, NULL),
(30, 2, 'postcode', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Zip/Postal Code', NULL, NULL, 0, 0, NULL, 0, NULL),
(31, 2, 'telephone', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Phone Number', NULL, NULL, 1, 0, NULL, 0, NULL),
(32, 2, 'fax', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Fax', NULL, NULL, 0, 0, NULL, 0, NULL),
(33, 1, 'rp_token', NULL, NULL, 'varchar', NULL, NULL, 'hidden', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(34, 1, 'rp_token_created_at', NULL, NULL, 'datetime', NULL, NULL, 'date', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(35, 1, 'disable_auto_group_change', 'Magento\\Customer\\Model\\Attribute', 'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean', 'static', NULL, NULL, 'boolean', 'Disable Automatic Group Change Based on VAT ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(36, 2, 'vat_id', 'Magento\\Customer\\Model\\Attribute', NULL, 'varchar', NULL, NULL, 'text', 'VAT number', NULL, NULL, 0, 0, NULL, 0, NULL),
(37, 2, 'vat_is_valid', NULL, NULL, 'int', NULL, NULL, 'text', 'VAT number validity', NULL, NULL, 0, 0, NULL, 0, NULL),
(38, 2, 'vat_request_id', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number validation request ID', NULL, NULL, 0, 0, NULL, 0, NULL),
(39, 2, 'vat_request_date', NULL, NULL, 'varchar', NULL, NULL, 'text', 'VAT number validation request date', NULL, NULL, 0, 0, NULL, 0, NULL),
(40, 2, 'vat_request_success', NULL, NULL, 'int', NULL, NULL, 'text', 'VAT number validation request success', NULL, NULL, 0, 0, NULL, 0, NULL),
(41, 3, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', NULL, NULL, 1, 0, NULL, 0, NULL),
(42, 3, 'is_active', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Active', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 1, 0, NULL, 0, NULL),
(43, 3, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(44, 3, 'image', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image', 'varchar', NULL, NULL, 'image', 'Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(45, 3, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Page Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(46, 3, 'meta_keywords', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(47, 3, 'meta_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(48, 3, 'display_mode', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Mode', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode', 0, 0, NULL, 0, NULL),
(49, 3, 'landing_page', NULL, NULL, 'int', NULL, NULL, 'select', 'CMS Block', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page', 0, 0, NULL, 0, NULL),
(50, 3, 'is_anchor', NULL, NULL, 'int', NULL, NULL, 'select', 'Is Anchor', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(51, 3, 'path', NULL, NULL, 'static', NULL, NULL, 'text', 'Path', NULL, NULL, 0, 0, NULL, 0, NULL),
(52, 3, 'position', NULL, NULL, 'static', NULL, NULL, 'text', 'Position', NULL, NULL, 0, 0, NULL, 0, NULL),
(53, 3, 'all_children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(54, 3, 'path_in_store', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(55, 3, 'children', NULL, NULL, 'text', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(56, 3, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'Magento\\Core\\Model\\Theme\\Source\\Theme', 0, 0, NULL, 0, NULL),
(57, 3, 'custom_design_from', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(58, 3, 'custom_design_to', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(59, 3, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(60, 3, 'custom_layout_update', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL),
(61, 3, 'level', NULL, NULL, 'static', NULL, NULL, 'text', 'Level', NULL, NULL, 0, 0, NULL, 0, NULL),
(62, 3, 'children_count', NULL, NULL, 'static', NULL, NULL, 'text', 'Children Count', NULL, NULL, 0, 0, NULL, 0, NULL),
(63, 3, 'available_sort_by', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby', 'text', NULL, NULL, 'multiselect', 'Available Product Listing Sort By', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby', 1, 0, NULL, 0, NULL),
(64, 3, 'default_sort_by', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby', 'varchar', NULL, NULL, 'select', 'Default Product Listing Sort By', NULL, 'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby', 1, 0, NULL, 0, NULL),
(65, 3, 'include_in_menu', NULL, NULL, 'int', NULL, NULL, 'select', 'Include in Navigation Menu', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 1, 0, '1', 0, NULL),
(66, 3, 'custom_use_parent_settings', NULL, NULL, 'int', NULL, NULL, 'select', 'Use Parent Category Settings', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(67, 3, 'custom_apply_to_products', NULL, NULL, 'int', NULL, NULL, 'select', 'Apply To Products', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(68, 3, 'filter_price_range', NULL, NULL, 'decimal', NULL, NULL, 'text', 'Layered Navigation Price Step', NULL, NULL, 0, 0, NULL, 0, NULL),
(69, 4, 'name', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Name', 'validate-length maximum-length-255', NULL, 1, 0, NULL, 0, NULL),
(70, 4, 'sku', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku', 'static', NULL, NULL, 'text', 'SKU', 'validate-length maximum-length-64', NULL, 1, 0, NULL, 1, NULL),
(71, 4, 'description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(72, 4, 'short_description', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Short Description', NULL, NULL, 0, 0, NULL, 0, NULL),
(73, 4, 'price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Price', NULL, NULL, 1, 0, NULL, 0, NULL),
(74, 4, 'special_price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Special Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(75, 4, 'special_from_date', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Special Price From Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(76, 4, 'special_to_date', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Special Price To Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(77, 4, 'cost', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Cost', NULL, NULL, 0, 1, NULL, 0, NULL),
(78, 4, 'weight', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight', 'decimal', NULL, NULL, 'weight', 'Weight', NULL, NULL, 0, 0, NULL, 0, NULL),
(79, 4, 'manufacturer', NULL, NULL, 'int', NULL, NULL, 'select', 'Manufacturer', NULL, NULL, 0, 1, NULL, 0, NULL),
(80, 4, 'meta_title', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Meta Title', NULL, NULL, 0, 0, NULL, 0, NULL),
(81, 4, 'meta_keyword', NULL, NULL, 'text', NULL, NULL, 'textarea', 'Meta Keywords', NULL, NULL, 0, 0, NULL, 0, NULL),
(82, 4, 'meta_description', NULL, NULL, 'varchar', NULL, NULL, 'textarea', 'Meta Description', NULL, NULL, 0, 0, NULL, 0, 'Maximum 255 chars'),
(83, 4, 'image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Base Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(84, 4, 'small_image', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Small Image', NULL, NULL, 0, 0, NULL, 0, NULL),
(85, 4, 'thumbnail', NULL, NULL, 'varchar', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image', 'media_image', 'Thumbnail', NULL, NULL, 0, 0, NULL, 0, NULL),
(86, 4, 'media_gallery', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Media', 'varchar', NULL, NULL, 'gallery', 'Media Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(87, 4, 'old_id', NULL, NULL, 'int', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(88, 4, 'group_price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Groupprice', 'decimal', NULL, NULL, 'text', 'Group Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(89, 4, 'tier_price', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice', 'decimal', NULL, NULL, 'text', 'Tier Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(90, 4, 'color', NULL, NULL, 'int', NULL, NULL, 'select', 'Color', NULL, NULL, 0, 1, '6', 0, NULL),
(91, 4, 'news_from_date', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Set Product as New from Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(92, 4, 'news_to_date', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Set Product as New to Date', NULL, NULL, 0, 0, NULL, 0, NULL),
(93, 4, 'gallery', NULL, NULL, 'varchar', NULL, NULL, 'gallery', 'Image Gallery', NULL, NULL, 0, 0, NULL, 0, NULL),
(94, 4, 'status', NULL, NULL, 'int', NULL, NULL, 'select', 'Status', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status', 0, 0, '1', 0, NULL),
(95, 4, 'minimal_price', NULL, NULL, 'decimal', NULL, NULL, 'price', 'Minimal Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(96, 4, 'visibility', NULL, NULL, 'int', NULL, NULL, 'select', 'Visibility', NULL, 'Magento\\Catalog\\Model\\Product\\Visibility', 0, 0, '4', 0, NULL),
(97, 4, 'custom_design', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Custom Design', NULL, 'Magento\\Core\\Model\\Theme\\Source\\Theme', 0, 0, NULL, 0, NULL),
(98, 4, 'custom_design_from', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Startdate', 'datetime', NULL, NULL, 'date', 'Active From', NULL, NULL, 0, 0, NULL, 0, NULL),
(99, 4, 'custom_design_to', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime', 'datetime', NULL, NULL, 'date', 'Active To', NULL, NULL, 0, 0, NULL, 0, NULL),
(100, 4, 'custom_layout_update', NULL, 'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate', 'text', NULL, NULL, 'textarea', 'Custom Layout Update', NULL, NULL, 0, 0, NULL, 0, NULL),
(101, 4, 'page_layout', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Page Layout', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout', 0, 0, NULL, 0, NULL),
(102, 4, 'category_ids', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category', 'static', NULL, NULL, 'text', 'Categories', NULL, NULL, 0, 0, NULL, 0, NULL),
(103, 4, 'options_container', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Display Product Options In', NULL, 'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container', 0, 0, 'container2', 0, NULL),
(104, 4, 'required_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(105, 4, 'has_options', NULL, NULL, 'static', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(106, 4, 'image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(107, 4, 'small_image_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Small Image Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(108, 4, 'thumbnail_label', NULL, NULL, 'varchar', NULL, NULL, 'text', 'Thumbnail Label', NULL, NULL, 0, 0, NULL, 0, NULL),
(109, 4, 'created_at', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Time\\Created', 'static', NULL, NULL, 'text', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(110, 4, 'updated_at', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Time\\Updated', 'static', NULL, NULL, 'text', NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(111, 4, 'country_of_manufacture', NULL, NULL, 'varchar', NULL, NULL, 'select', 'Country of Manufacture', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture', 0, 0, NULL, 0, NULL),
(112, 4, 'quantity_and_stock_status', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock', 'int', NULL, NULL, 'select', 'Quantity', NULL, 'Magento\\CatalogInventory\\Model\\Source\\Stock', 0, 0, '1', 0, NULL),
(113, 4, 'msrp', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price', 'decimal', NULL, NULL, 'price', 'Manufacturer''s Suggested Retail Price', NULL, NULL, 0, 0, NULL, 0, NULL),
(114, 4, 'msrp_display_actual_price_type', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean', 'varchar', NULL, NULL, 'select', 'Display Actual Price', NULL, 'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price', 0, 0, '0', 0, NULL),
(115, 4, 'price_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(116, 4, 'sku_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(117, 4, 'weight_type', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 0, NULL),
(118, 4, 'price_view', NULL, NULL, 'int', NULL, NULL, 'select', 'Price View', NULL, 'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View', 1, 0, NULL, 0, NULL),
(119, 4, 'shipment_type', NULL, NULL, 'int', NULL, NULL, NULL, 'Shipment', NULL, NULL, 1, 0, NULL, 0, NULL),
(120, 4, 'links_purchased_separately', NULL, NULL, 'int', NULL, NULL, NULL, 'Links can be purchased separately', NULL, NULL, 1, 0, NULL, 0, NULL),
(121, 4, 'samples_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Samples title', NULL, NULL, 1, 0, NULL, 0, NULL),
(122, 4, 'links_title', NULL, NULL, 'varchar', NULL, NULL, NULL, 'Links title', NULL, NULL, 1, 0, NULL, 0, NULL),
(123, 4, 'links_exist', NULL, NULL, 'int', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '0', 0, NULL),
(124, 4, 'gift_message_available', NULL, 'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean', 'varchar', NULL, NULL, 'select', 'Allow Gift Message', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean', 0, 0, NULL, 0, NULL),
(125, 4, 'tax_class_id', NULL, NULL, 'int', NULL, NULL, 'select', 'Tax Class', NULL, 'Magento\\Tax\\Model\\TaxClass\\Source\\Product', 0, 0, '2', 0, NULL),
(126, 3, 'url_key', NULL, NULL, 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(127, 3, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(128, 4, 'url_key', NULL, NULL, 'varchar', NULL, NULL, 'text', 'URL Key', NULL, NULL, 0, 0, NULL, 0, NULL),
(129, 4, 'url_path', NULL, NULL, 'varchar', NULL, NULL, 'text', NULL, NULL, NULL, 0, 0, NULL, 0, NULL),
(130, 4, 'brand', NULL, NULL, 'int', NULL, NULL, 'select', 'brand', NULL, 'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table', 0, 1, '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_group`
--

DROP TABLE IF EXISTS `eav_attribute_group`;
CREATE TABLE IF NOT EXISTS `eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  `attribute_group_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `IDX_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group' AUTO_INCREMENT=24 ;

--
-- Dumping data for table `eav_attribute_group`
--

INSERT INTO `eav_attribute_group` (`attribute_group_id`, `attribute_set_id`, `attribute_group_name`, `sort_order`, `default_id`, `attribute_group_code`, `tab_group_code`) VALUES
(1, 1, 'General', 1, 1, NULL, NULL),
(2, 2, 'General', 1, 1, NULL, NULL),
(3, 3, 'General', 10, 1, NULL, NULL),
(4, 3, 'General Information', 2, 0, NULL, NULL),
(5, 3, 'Display Settings', 20, 0, NULL, NULL),
(6, 3, 'Custom Design', 30, 0, NULL, NULL),
(7, 4, 'Product Details', 1, 1, 'product-details', 'basic'),
(8, 4, 'Advanced Pricing', 4, 0, 'advanced-pricing', 'advanced'),
(9, 4, 'Search Engine Optimization', 3, 0, 'search-engine-optimization', 'basic'),
(10, 4, 'Image Management', 2, 0, 'image-management', 'basic'),
(11, 4, 'Design', 5, 0, 'design', 'advanced'),
(12, 4, 'Autosettings', 6, 0, 'autosettings', 'advanced'),
(13, 5, 'General', 1, 1, NULL, NULL),
(14, 6, 'General', 1, 1, NULL, NULL),
(15, 7, 'General', 1, 1, NULL, NULL),
(16, 8, 'General', 1, 1, NULL, NULL),
(18, 9, 'Autosettings', 6, 0, 'autosettings', 'advanced'),
(19, 9, 'Design', 5, 0, 'design', 'advanced'),
(20, 9, 'Advanced Pricing', 4, 0, 'advanced-pricing', 'advanced'),
(21, 9, 'Search Engine Optimization', 3, 0, 'search-engine-optimization', 'basic'),
(22, 9, 'Image Management', 2, 0, 'image-management', 'basic'),
(23, 9, 'Product Details', 1, 1, 'product-details', 'basic');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_label`
--

DROP TABLE IF EXISTS `eav_attribute_label`;
CREATE TABLE IF NOT EXISTS `eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `IDX_EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option`
--

DROP TABLE IF EXISTS `eav_attribute_option`;
CREATE TABLE IF NOT EXISTS `eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `IDX_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `eav_attribute_option`
--

INSERT INTO `eav_attribute_option` (`option_id`, `attribute_id`, `sort_order`) VALUES
(1, 18, 0),
(2, 18, 1),
(3, 130, 1),
(4, 130, 2),
(5, 130, 3),
(6, 90, 1),
(7, 90, 2),
(8, 90, 3),
(9, 90, 4);

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_option_value`
--

DROP TABLE IF EXISTS `eav_attribute_option_value`;
CREATE TABLE IF NOT EXISTS `eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `IDX_EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `IDX_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value' AUTO_INCREMENT=36 ;

--
-- Dumping data for table `eav_attribute_option_value`
--

INSERT INTO `eav_attribute_option_value` (`value_id`, `option_id`, `store_id`, `value`) VALUES
(1, 1, 0, 'Male'),
(2, 2, 0, 'Female'),
(20, 3, 0, 'Beauty Spot'),
(21, 3, 1, 'Beauty Spot'),
(22, 4, 0, 'PapergeekMY'),
(23, 4, 1, 'PapergeekMY'),
(24, 5, 0, 'Shanny Bee Bo'),
(25, 5, 1, 'Shanny Bee Bo'),
(31, 6, 0, 'Light color'),
(32, 6, 1, 'Light color'),
(33, 7, 0, 'Dark color'),
(34, 8, 0, 'Blue'),
(35, 9, 0, 'Purple');

-- --------------------------------------------------------

--
-- Table structure for table `eav_attribute_set`
--

DROP TABLE IF EXISTS `eav_attribute_set`;
CREATE TABLE IF NOT EXISTS `eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `UNQ_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `IDX_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `eav_attribute_set`
--

INSERT INTO `eav_attribute_set` (`attribute_set_id`, `entity_type_id`, `attribute_set_name`, `sort_order`) VALUES
(1, 1, 'Default', 2),
(2, 2, 'Default', 2),
(3, 3, 'Default', 1),
(4, 4, 'Default', 1),
(5, 5, 'Default', 1),
(6, 6, 'Default', 1),
(7, 7, 'Default', 1),
(8, 8, 'Default', 1),
(9, 4, 'fashion', 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity`
--

DROP TABLE IF EXISTS `eav_entity`;
CREATE TABLE IF NOT EXISTS `eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL COMMENT 'Created At',
  `updated_at` timestamp NOT NULL COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_attribute`
--

DROP TABLE IF EXISTS `eav_entity_attribute`;
CREATE TABLE IF NOT EXISTS `eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `IDX_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `IDX_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes' AUTO_INCREMENT=744 ;

--
-- Dumping data for table `eav_entity_attribute`
--

INSERT INTO `eav_entity_attribute` (`entity_attribute_id`, `entity_type_id`, `attribute_set_id`, `attribute_group_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 10),
(2, 1, 1, 1, 2, 20),
(3, 1, 1, 1, 3, 20),
(4, 1, 1, 1, 4, 30),
(5, 1, 1, 1, 5, 40),
(6, 1, 1, 1, 6, 50),
(7, 1, 1, 1, 7, 60),
(8, 1, 1, 1, 8, 70),
(9, 1, 1, 1, 9, 80),
(10, 1, 1, 1, 10, 25),
(11, 1, 1, 1, 11, 90),
(12, 1, 1, 1, 12, 81),
(13, 1, 1, 1, 13, 82),
(14, 1, 1, 1, 14, 83),
(15, 1, 1, 1, 15, 100),
(16, 1, 1, 1, 16, 85),
(17, 1, 1, 1, 17, 86),
(18, 1, 1, 1, 18, 110),
(19, 2, 2, 2, 19, 10),
(20, 2, 2, 2, 20, 20),
(21, 2, 2, 2, 21, 30),
(22, 2, 2, 2, 22, 40),
(23, 2, 2, 2, 23, 50),
(24, 2, 2, 2, 24, 60),
(25, 2, 2, 2, 25, 70),
(26, 2, 2, 2, 26, 80),
(27, 2, 2, 2, 27, 90),
(28, 2, 2, 2, 28, 100),
(29, 2, 2, 2, 29, 100),
(30, 2, 2, 2, 30, 110),
(31, 2, 2, 2, 31, 120),
(32, 2, 2, 2, 32, 130),
(33, 1, 1, 1, 33, 111),
(34, 1, 1, 1, 34, 112),
(35, 1, 1, 1, 35, 28),
(36, 2, 2, 2, 36, 140),
(37, 2, 2, 2, 37, 132),
(38, 2, 2, 2, 38, 133),
(39, 2, 2, 2, 39, 134),
(40, 2, 2, 2, 40, 135),
(41, 3, 3, 4, 41, 1),
(42, 3, 3, 4, 42, 2),
(43, 3, 3, 4, 43, 4),
(44, 3, 3, 4, 44, 5),
(45, 3, 3, 4, 45, 6),
(46, 3, 3, 4, 46, 7),
(47, 3, 3, 4, 47, 8),
(48, 3, 3, 5, 48, 10),
(49, 3, 3, 5, 49, 20),
(50, 3, 3, 5, 50, 30),
(51, 3, 3, 4, 51, 12),
(52, 3, 3, 4, 52, 13),
(53, 3, 3, 4, 53, 14),
(54, 3, 3, 4, 54, 15),
(55, 3, 3, 4, 55, 16),
(56, 3, 3, 6, 56, 10),
(57, 3, 3, 6, 57, 30),
(58, 3, 3, 6, 58, 40),
(59, 3, 3, 6, 59, 50),
(60, 3, 3, 6, 60, 60),
(61, 3, 3, 4, 61, 24),
(62, 3, 3, 4, 62, 25),
(63, 3, 3, 5, 63, 40),
(64, 3, 3, 5, 64, 50),
(65, 3, 3, 4, 65, 10),
(66, 3, 3, 6, 66, 5),
(67, 3, 3, 6, 67, 6),
(68, 3, 3, 5, 68, 51),
(86, 4, 4, 7, 87, 6),
(93, 4, 4, 8, 95, 8),
(102, 4, 4, 7, 104, 14),
(103, 4, 4, 7, 105, 15),
(104, 4, 4, 7, 106, 16),
(105, 4, 4, 7, 107, 17),
(106, 4, 4, 7, 108, 18),
(107, 4, 4, 7, 109, 19),
(108, 4, 4, 7, 110, 20),
(114, 4, 4, 7, 116, 102),
(115, 4, 4, 7, 117, 103),
(117, 4, 4, 7, 119, 104),
(118, 4, 4, 7, 120, 105),
(119, 4, 4, 7, 121, 106),
(120, 4, 4, 7, 122, 107),
(121, 4, 4, 7, 123, 108),
(124, 3, 3, 4, 126, 3),
(125, 3, 3, 4, 127, 17),
(127, 4, 4, 7, 129, 11),
(165, 4, 9, 20, 95, 8),
(189, 4, 9, 23, 87, 6),
(193, 4, 9, 23, 129, 11),
(195, 4, 9, 23, 104, 14),
(197, 4, 9, 23, 105, 15),
(199, 4, 9, 23, 106, 16),
(201, 4, 9, 23, 107, 17),
(203, 4, 9, 23, 108, 18),
(205, 4, 9, 23, 109, 19),
(207, 4, 9, 23, 110, 20),
(229, 4, 9, 23, 116, 102),
(231, 4, 9, 23, 117, 103),
(233, 4, 9, 23, 119, 104),
(235, 4, 9, 23, 120, 105),
(237, 4, 9, 23, 121, 106),
(239, 4, 9, 23, 122, 107),
(241, 4, 9, 23, 123, 108),
(577, 4, 4, 7, 69, 1),
(579, 4, 4, 7, 70, 2),
(581, 4, 4, 7, 71, 10),
(583, 4, 4, 7, 72, 9),
(585, 4, 4, 7, 73, 3),
(587, 4, 4, 7, 78, 7),
(589, 4, 4, 7, 83, 5),
(591, 4, 4, 7, 90, 13),
(593, 4, 4, 7, 94, 11),
(595, 4, 4, 7, 102, 8),
(597, 4, 4, 7, 112, 6),
(599, 4, 4, 7, 115, 12),
(601, 4, 4, 7, 125, 4),
(603, 4, 4, 7, 130, 14),
(605, 4, 4, 10, 84, 1),
(607, 4, 4, 10, 85, 2),
(609, 4, 4, 10, 86, 3),
(611, 4, 4, 10, 93, 4),
(613, 4, 4, 9, 80, 2),
(615, 4, 4, 9, 81, 3),
(617, 4, 4, 9, 82, 4),
(619, 4, 4, 9, 128, 1),
(621, 4, 4, 8, 74, 2),
(623, 4, 4, 8, 75, 3),
(625, 4, 4, 8, 76, 4),
(627, 4, 4, 8, 77, 5),
(629, 4, 4, 8, 88, 1),
(631, 4, 4, 8, 89, 6),
(633, 4, 4, 8, 113, 7),
(635, 4, 4, 8, 114, 8),
(637, 4, 4, 8, 118, 9),
(639, 4, 4, 11, 97, 1),
(641, 4, 4, 11, 98, 2),
(643, 4, 4, 11, 99, 3),
(645, 4, 4, 11, 100, 4),
(647, 4, 4, 11, 101, 5),
(649, 4, 4, 11, 103, 6),
(651, 4, 4, 12, 91, 2),
(653, 4, 4, 12, 92, 3),
(655, 4, 4, 12, 96, 1),
(657, 4, 4, 12, 111, 4),
(659, 4, 4, 12, 124, 5),
(661, 4, 9, 23, 69, 1),
(663, 4, 9, 23, 70, 2),
(665, 4, 9, 23, 71, 10),
(667, 4, 9, 23, 72, 9),
(669, 4, 9, 23, 73, 3),
(671, 4, 9, 23, 78, 7),
(673, 4, 9, 23, 83, 5),
(675, 4, 9, 23, 90, 13),
(677, 4, 9, 23, 94, 11),
(679, 4, 9, 23, 102, 8),
(681, 4, 9, 23, 112, 6),
(683, 4, 9, 23, 115, 12),
(685, 4, 9, 23, 125, 4),
(687, 4, 9, 23, 130, 14),
(689, 4, 9, 22, 84, 1),
(691, 4, 9, 22, 85, 2),
(693, 4, 9, 22, 86, 3),
(695, 4, 9, 22, 93, 4),
(697, 4, 9, 21, 80, 2),
(699, 4, 9, 21, 81, 3),
(701, 4, 9, 21, 82, 4),
(703, 4, 9, 21, 128, 1),
(705, 4, 9, 20, 74, 2),
(707, 4, 9, 20, 75, 3),
(709, 4, 9, 20, 76, 4),
(711, 4, 9, 20, 77, 5),
(713, 4, 9, 20, 88, 1),
(715, 4, 9, 20, 89, 6),
(717, 4, 9, 20, 113, 7),
(719, 4, 9, 20, 114, 8),
(721, 4, 9, 20, 118, 9),
(723, 4, 9, 19, 97, 1),
(725, 4, 9, 19, 98, 2),
(727, 4, 9, 19, 99, 3),
(729, 4, 9, 19, 100, 4),
(731, 4, 9, 19, 101, 5),
(733, 4, 9, 19, 103, 6),
(735, 4, 9, 18, 91, 2),
(737, 4, 9, 18, 92, 3),
(739, 4, 9, 18, 96, 1),
(741, 4, 9, 18, 111, 4),
(743, 4, 9, 18, 124, 5);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_datetime`
--

DROP TABLE IF EXISTS `eav_entity_datetime`;
CREATE TABLE IF NOT EXISTS `eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_decimal`
--

DROP TABLE IF EXISTS `eav_entity_decimal`;
CREATE TABLE IF NOT EXISTS `eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_int`
--

DROP TABLE IF EXISTS `eav_entity_int`;
CREATE TABLE IF NOT EXISTS `eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_store`
--

DROP TABLE IF EXISTS `eav_entity_store`;
CREATE TABLE IF NOT EXISTS `eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `IDX_EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_text`
--

DROP TABLE IF EXISTS `eav_entity_text`;
CREATE TABLE IF NOT EXISTS `eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_EAV_ENTITY_TEXT_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_type`
--

DROP TABLE IF EXISTS `eav_entity_type`;
CREATE TABLE IF NOT EXISTS `eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `IDX_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `eav_entity_type`
--

INSERT INTO `eav_entity_type` (`entity_type_id`, `entity_type_code`, `entity_model`, `attribute_model`, `entity_table`, `value_table_prefix`, `entity_id_field`, `is_data_sharing`, `data_sharing_key`, `default_attribute_set_id`, `increment_model`, `increment_per_store`, `increment_pad_length`, `increment_pad_char`, `additional_attribute_table`, `entity_attribute_collection`) VALUES
(1, 'customer', 'Magento\\Customer\\Model\\Resource\\Customer', 'Magento\\Customer\\Model\\Attribute', 'customer_entity', NULL, NULL, 1, 'default', 1, 'Magento\\Eav\\Model\\Entity\\Increment\\Numeric', 0, 8, '0', 'customer_eav_attribute', 'Magento\\Customer\\Model\\Resource\\Attribute\\Collection'),
(2, 'customer_address', 'Magento\\Customer\\Model\\Resource\\Address', 'Magento\\Customer\\Model\\Attribute', 'customer_address_entity', NULL, NULL, 1, 'default', 2, NULL, 0, 8, '0', 'customer_eav_attribute', 'Magento\\Customer\\Model\\Resource\\Address\\Attribute\\Collection'),
(3, 'catalog_category', 'Magento\\Catalog\\Model\\Resource\\Category', 'Magento\\Catalog\\Model\\Resource\\Eav\\Attribute', 'catalog_category_entity', NULL, NULL, 1, 'default', 3, NULL, 0, 8, '0', 'catalog_eav_attribute', 'Magento\\Catalog\\Model\\Resource\\Category\\Attribute\\Collection'),
(4, 'catalog_product', 'Magento\\Catalog\\Model\\Resource\\Product', 'Magento\\Catalog\\Model\\Resource\\Eav\\Attribute', 'catalog_product_entity', NULL, NULL, 1, 'default', 4, NULL, 0, 8, '0', 'catalog_eav_attribute', 'Magento\\Catalog\\Model\\Resource\\Product\\Attribute\\Collection'),
(5, 'order', 'Magento\\Sales\\Model\\Resource\\Order', NULL, 'sales_order', NULL, NULL, 1, 'default', 5, 'Magento\\Eav\\Model\\Entity\\Increment\\Numeric', 1, 8, '0', NULL, NULL),
(6, 'invoice', 'Magento\\Sales\\Model\\Resource\\Order\\Invoice', NULL, 'sales_invoice', NULL, NULL, 1, 'default', 6, 'Magento\\Eav\\Model\\Entity\\Increment\\Numeric', 1, 8, '0', NULL, NULL),
(7, 'creditmemo', 'Magento\\Sales\\Model\\Resource\\Order\\Creditmemo', NULL, 'sales_creditmemo', NULL, NULL, 1, 'default', 7, 'Magento\\Eav\\Model\\Entity\\Increment\\Numeric', 1, 8, '0', NULL, NULL),
(8, 'shipment', 'Magento\\Sales\\Model\\Resource\\Order\\Shipment', NULL, 'sales_shipment', NULL, NULL, 1, 'default', 8, 'Magento\\Eav\\Model\\Entity\\Increment\\Numeric', 1, 8, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `eav_entity_varchar`
--

DROP TABLE IF EXISTS `eav_entity_varchar`;
CREATE TABLE IF NOT EXISTS `eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_element`
--

DROP TABLE IF EXISTS `eav_form_element`;
CREATE TABLE IF NOT EXISTS `eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `UNQ_EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `IDX_EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `IDX_EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Form Element' AUTO_INCREMENT=43 ;

--
-- Dumping data for table `eav_form_element`
--

INSERT INTO `eav_form_element` (`element_id`, `type_id`, `fieldset_id`, `attribute_id`, `sort_order`) VALUES
(1, 1, NULL, 20, 0),
(2, 1, NULL, 22, 1),
(3, 1, NULL, 24, 2),
(4, 1, NULL, 9, 3),
(5, 1, NULL, 25, 4),
(6, 1, NULL, 26, 5),
(7, 1, NULL, 28, 6),
(8, 1, NULL, 30, 7),
(9, 1, NULL, 27, 8),
(10, 1, NULL, 31, 9),
(11, 1, NULL, 32, 10),
(12, 2, NULL, 20, 0),
(13, 2, NULL, 22, 1),
(14, 2, NULL, 24, 2),
(15, 2, NULL, 9, 3),
(16, 2, NULL, 25, 4),
(17, 2, NULL, 26, 5),
(18, 2, NULL, 28, 6),
(19, 2, NULL, 30, 7),
(20, 2, NULL, 27, 8),
(21, 2, NULL, 31, 9),
(22, 2, NULL, 32, 10),
(23, 3, NULL, 20, 0),
(24, 3, NULL, 22, 1),
(25, 3, NULL, 24, 2),
(26, 3, NULL, 25, 3),
(27, 3, NULL, 26, 4),
(28, 3, NULL, 28, 5),
(29, 3, NULL, 30, 6),
(30, 3, NULL, 27, 7),
(31, 3, NULL, 31, 8),
(32, 3, NULL, 32, 9),
(33, 4, NULL, 20, 0),
(34, 4, NULL, 22, 1),
(35, 4, NULL, 24, 2),
(36, 4, NULL, 25, 3),
(37, 4, NULL, 26, 4),
(38, 4, NULL, 28, 5),
(39, 4, NULL, 30, 6),
(40, 4, NULL, 27, 7),
(41, 4, NULL, 31, 8),
(42, 4, NULL, 32, 9);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset`
--

DROP TABLE IF EXISTS `eav_form_fieldset`;
CREATE TABLE IF NOT EXISTS `eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `UNQ_EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `eav_form_fieldset_label`;
CREATE TABLE IF NOT EXISTS `eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `IDX_EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type`
--

DROP TABLE IF EXISTS `eav_form_type`;
CREATE TABLE IF NOT EXISTS `eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `UNQ_EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `IDX_EAV_FORM_TYPE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Eav Form Type' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `eav_form_type`
--

INSERT INTO `eav_form_type` (`type_id`, `code`, `label`, `is_system`, `theme`, `store_id`) VALUES
(1, 'checkout_onepage_register', 'checkout_onepage_register', 1, '', 0),
(2, 'checkout_onepage_register_guest', 'checkout_onepage_register_guest', 1, '', 0),
(3, 'checkout_onepage_billing_address', 'checkout_onepage_billing_address', 1, '', 0),
(4, 'checkout_onepage_shipping_address', 'checkout_onepage_shipping_address', 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `eav_form_type_entity`
--

DROP TABLE IF EXISTS `eav_form_type_entity`;
CREATE TABLE IF NOT EXISTS `eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `IDX_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';

--
-- Dumping data for table `eav_form_type_entity`
--

INSERT INTO `eav_form_type_entity` (`type_id`, `entity_type_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
CREATE TABLE IF NOT EXISTS `email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Creation',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `UNQ_EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `IDX_EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `IDX_EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gift_message`
--

DROP TABLE IF EXISTS `gift_message`;
CREATE TABLE IF NOT EXISTS `gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Recipient',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `googleoptimizer_code`
--

DROP TABLE IF EXISTS `googleoptimizer_code`;
CREATE TABLE IF NOT EXISTS `googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code id',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Optimized entity id product id or catalog id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store id',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `UNQ_GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Experiment code' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `googleshopping_attributes`
--

DROP TABLE IF EXISTS `googleshopping_attributes`;
CREATE TABLE IF NOT EXISTS `googleshopping_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `gcontent_attribute` varchar(255) NOT NULL COMMENT 'Google Content Attribute',
  `type_id` int(10) unsigned NOT NULL COMMENT 'Type Id',
  PRIMARY KEY (`id`),
  KEY `FK_GOOGLESHOPPING_ATTRS_ATTR_ID_EAV_ATTR_ATTR_ID` (`attribute_id`),
  KEY `FK_GOOGLESHOPPING_ATTRS_TYPE_ID_GOOGLESHOPPING_TYPES_TYPE_ID` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Content Attributes link Product Attributes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `googleshopping_items`
--

DROP TABLE IF EXISTS `googleshopping_items`;
CREATE TABLE IF NOT EXISTS `googleshopping_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Type Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `gcontent_item_id` varchar(255) NOT NULL COMMENT 'Google Content Item Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `published` datetime DEFAULT NULL COMMENT 'Published date',
  `expires` datetime DEFAULT NULL COMMENT 'Expires date',
  PRIMARY KEY (`item_id`),
  KEY `IDX_GOOGLESHOPPING_ITEMS_PRODUCT_ID_STORE_ID` (`product_id`,`store_id`),
  KEY `FK_GOOGLESHOPPING_ITEMS_STORE_ID_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Content Items Products' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `googleshopping_types`
--

DROP TABLE IF EXISTS `googleshopping_types`;
CREATE TABLE IF NOT EXISTS `googleshopping_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Set Id',
  `target_country` varchar(2) NOT NULL DEFAULT 'US' COMMENT 'Target country',
  `category` varchar(40) DEFAULT NULL COMMENT 'Google product category',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `UNQ_GOOGLESHOPPING_TYPES_ATTRIBUTE_SET_ID_TARGET_COUNTRY` (`attribute_set_id`,`target_country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Content Item Types link Attribute Sets' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `importexport_importdata`
--

DROP TABLE IF EXISTS `importexport_importdata`;
CREATE TABLE IF NOT EXISTS `importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `indexer_state`
--

DROP TABLE IF EXISTS `indexer_state`;
CREATE TABLE IF NOT EXISTS `indexer_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State Id',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer Id',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  PRIMARY KEY (`state_id`),
  KEY `IDX_INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Indexer State' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `indexer_state`
--

INSERT INTO `indexer_state` (`state_id`, `indexer_id`, `status`, `updated`) VALUES
(1, 'catalog_category_product', 'valid', '2014-12-22 09:43:55'),
(2, 'catalog_product_attribute', 'invalid', '2014-12-22 10:21:20'),
(3, 'catalogsearch_fulltext', 'valid', '2014-12-22 09:43:58'),
(4, 'cataloginventory_stock', 'valid', '2014-12-22 09:43:56'),
(5, 'catalog_product_price', 'invalid', '2014-12-22 10:07:04'),
(6, 'catalog_product_category', 'valid', '2014-12-22 09:43:55'),
(7, 'catalogrule_product', 'valid', '2014-12-22 09:43:57'),
(8, 'catalogrule_rule', 'valid', '2014-12-22 09:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `integration`
--

DROP TABLE IF EXISTS `integration`;
CREATE TABLE IF NOT EXISTS `integration` (
  `integration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL COMMENT 'Update Time',
  `setup_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `UNQ_INTEGRATION_NAME` (`name`),
  UNIQUE KEY `UNQ_INTEGRATION_CONSUMER_ID` (`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='integration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_customer`
--

DROP TABLE IF EXISTS `log_customer`;
CREATE TABLE IF NOT EXISTS `log_customer` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `login_at` timestamp NOT NULL COMMENT 'Login Time',
  `logout_at` timestamp NULL DEFAULT NULL COMMENT 'Logout Time',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`log_id`),
  KEY `IDX_LOG_CUSTOMER_VISITOR_ID` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Customers Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_quote`
--

DROP TABLE IF EXISTS `log_quote`;
CREATE TABLE IF NOT EXISTS `log_quote` (
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `created_at` timestamp NOT NULL COMMENT 'Creation Time',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Deletion Time',
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Quotes Table';

--
-- Dumping data for table `log_quote`
--

INSERT INTO `log_quote` (`quote_id`, `visitor_id`, `created_at`, `deleted_at`) VALUES
(1, 75, '2014-12-22 03:10:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `log_summary`
--

DROP TABLE IF EXISTS `log_summary`;
CREATE TABLE IF NOT EXISTS `log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Summary ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Type ID',
  `visitor_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Visitor Count',
  `customer_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer Count',
  `add_date` timestamp NOT NULL COMMENT 'Date',
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Summary Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_summary_type`
--

DROP TABLE IF EXISTS `log_summary_type`;
CREATE TABLE IF NOT EXISTS `log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type ID',
  `type_code` varchar(64) DEFAULT NULL COMMENT 'Type Code',
  `period` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Period',
  `period_type` varchar(6) NOT NULL DEFAULT 'MINUTE' COMMENT 'Period Type',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Log Summary Types Table' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `log_summary_type`
--

INSERT INTO `log_summary_type` (`type_id`, `type_code`, `period`, `period_type`) VALUES
(1, 'hour', 1, 'HOUR'),
(2, 'day', 1, 'DAY');

-- --------------------------------------------------------

--
-- Table structure for table `log_url`
--

DROP TABLE IF EXISTS `log_url`;
CREATE TABLE IF NOT EXISTS `log_url` (
  `url_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'URL ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `visit_time` timestamp NOT NULL COMMENT 'Visit Time',
  PRIMARY KEY (`url_id`),
  KEY `IDX_LOG_URL_VISITOR_ID` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log URL Table';

--
-- Dumping data for table `log_url`
--

INSERT INTO `log_url` (`url_id`, `visitor_id`, `visit_time`) VALUES
(1, 1, '2014-12-18 20:36:54'),
(2, 1, '2014-12-18 21:09:28'),
(3, 3, '2014-12-18 21:28:23'),
(4, 5, '2014-12-19 00:38:38'),
(5, 5, '2014-12-19 00:46:05'),
(6, 10, '2014-12-19 01:31:31'),
(7, 12, '2014-12-19 01:32:24'),
(8, 30, '2014-12-19 02:07:44'),
(9, 48, '2014-12-19 02:44:10'),
(10, 48, '2014-12-19 02:49:09'),
(11, 53, '2014-12-19 02:51:23'),
(12, 61, '2014-12-21 20:23:51'),
(13, 61, '2014-12-21 20:35:19'),
(14, 61, '2014-12-21 20:38:32'),
(15, 61, '2014-12-21 20:39:01'),
(16, 61, '2014-12-21 20:40:52'),
(17, 61, '2014-12-21 20:41:11'),
(18, 61, '2014-12-21 20:46:24'),
(19, 61, '2014-12-21 20:47:08'),
(20, 61, '2014-12-21 20:48:38'),
(21, 61, '2014-12-21 20:49:28'),
(22, 61, '2014-12-21 20:51:00'),
(23, 61, '2014-12-21 20:51:46'),
(24, 61, '2014-12-21 20:52:41'),
(25, 61, '2014-12-21 20:53:54'),
(26, 61, '2014-12-21 21:02:30'),
(27, 61, '2014-12-21 21:03:19'),
(28, 61, '2014-12-21 21:04:55'),
(29, 61, '2014-12-21 21:05:06'),
(30, 61, '2014-12-21 21:06:19'),
(31, 61, '2014-12-21 21:07:24'),
(32, 61, '2014-12-21 21:09:12'),
(33, 61, '2014-12-21 21:10:48'),
(34, 65, '2014-12-22 01:55:01'),
(35, 65, '2014-12-22 01:55:37'),
(36, 65, '2014-12-22 01:55:59'),
(37, 65, '2014-12-22 01:56:05'),
(38, 65, '2014-12-22 02:32:28'),
(39, 65, '2014-12-22 02:32:34'),
(40, 65, '2014-12-22 02:33:05'),
(41, 65, '2014-12-22 02:33:17'),
(42, 65, '2014-12-22 02:39:40'),
(43, 65, '2014-12-22 02:43:32'),
(44, 69, '2014-12-22 03:07:45'),
(45, 74, '2014-12-22 03:10:27'),
(46, 69, '2014-12-22 03:10:44'),
(47, 75, '2014-12-22 03:10:54'),
(48, 75, '2014-12-22 03:10:58'),
(49, 75, '2014-12-22 03:11:10'),
(50, 75, '2014-12-22 03:13:06'),
(51, 69, '2014-12-22 03:14:30'),
(52, 75, '2014-12-22 03:15:18'),
(53, 75, '2014-12-22 03:15:51'),
(54, 69, '2014-12-22 03:16:24'),
(55, 69, '2014-12-22 03:16:52'),
(56, 69, '2014-12-22 03:17:46'),
(57, 69, '2014-12-22 03:17:55'),
(58, 75, '2014-12-22 03:18:12'),
(59, 75, '2014-12-22 03:18:20'),
(60, 75, '2014-12-22 03:18:28'),
(61, 75, '2014-12-22 03:21:57'),
(62, 69, '2014-12-22 03:24:22'),
(63, 75, '2014-12-22 03:30:04'),
(64, 75, '2014-12-22 03:30:25'),
(65, 69, '2014-12-22 03:32:39'),
(66, 69, '2014-12-22 03:34:33'),
(67, 69, '2014-12-22 03:39:59'),
(68, 69, '2014-12-22 03:40:51'),
(69, 69, '2014-12-22 03:42:41'),
(70, 69, '2014-12-22 03:45:06'),
(71, 69, '2014-12-22 03:45:42'),
(72, 69, '2014-12-22 03:46:17'),
(73, 76, '2014-12-22 03:47:28'),
(74, 76, '2014-12-22 03:47:34'),
(75, 76, '2014-12-22 03:50:17'),
(76, 76, '2014-12-22 03:52:52'),
(77, 77, '2014-12-22 03:53:51'),
(78, 78, '2014-12-22 03:59:44'),
(79, 78, '2014-12-22 04:00:02'),
(80, 78, '2014-12-22 04:00:04'),
(81, 78, '2014-12-22 04:02:00'),
(82, 78, '2014-12-22 04:02:05'),
(83, 78, '2014-12-22 04:02:07'),
(84, 80, '2014-12-22 04:04:01'),
(85, 78, '2014-12-22 04:04:06'),
(86, 78, '2014-12-22 04:04:08'),
(87, 78, '2014-12-22 04:05:06'),
(88, 78, '2014-12-22 04:08:00'),
(89, 78, '2014-12-22 04:08:05'),
(90, 77, '2014-12-22 04:10:17'),
(91, 77, '2014-12-22 04:10:26'),
(92, 77, '2014-12-22 04:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `log_url_info`
--

DROP TABLE IF EXISTS `log_url_info`;
CREATE TABLE IF NOT EXISTS `log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'URL ID',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `referer` varchar(255) DEFAULT NULL COMMENT 'Referrer',
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Log URL Info Table' AUTO_INCREMENT=93 ;

--
-- Dumping data for table `log_url_info`
--

INSERT INTO `log_url_info` (`url_id`, `url`, `referer`) VALUES
(1, 'http://10.0.0.159/crafts/page_cache/block/render/page_id/4/?blocks=%5B%22catalog.compare.link%22%2C%22catalog.compare.link%22%2C%22form.subscribe%22%2C%22global_messages%22%2C%22header%22%2C%22header%22%2C%22messages%22%2C%22messages%22%2C%22minicart', 'http://10.0.0.159/crafts/privacy-policy-cookie-restriction-mode/'),
(2, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22catalog.compare.link%22%2C%22catalog.compare.link%22%2C%22form.subscribe%22%2C%22global_messages%22%2C%22header%22%2C%22header%22%2C%22messages%22%2C%22minicart%22%2C%22my-account-link%22', 'http://10.0.0.159/crafts/contact/'),
(3, 'http://10.0.0.159/crafts/customer/account/create/', 'http://10.0.0.159/crafts/'),
(4, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22catalog.compare.link%22%2C%22catalog.compare.link%22%2C%22form.subscribe%22%2C%22global_messages%22%2C%22header%22%2C%22header%22%2C%22messages%22%2C%22messages%22%2C%22minicart%22%2C%22m', 'http://10.0.0.159/crafts/'),
(5, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(6, 'http://10.0.0.159/crafts/review/product/listAjax/id/1/', 'http://10.0.0.159/crafts/blue-hydrangea-earrings.html'),
(7, 'http://10.0.0.159/crafts/review/product/listAjax/id/1/', 'http://10.0.0.159/crafts/blue-hydrangea-earrings.html'),
(8, 'http://10.0.0.159/crafts/review/product/listAjax/id/7/?_=1418976501586', 'http://10.0.0.159/crafts/steampunk-heart-necklace-3.html'),
(9, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(10, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(11, 'http://10.0.0.159/crafts/review/product/listAjax/id/18/', 'http://10.0.0.159/crafts/bright-retro-ring-7.html'),
(12, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(13, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22catalog.compare.link%22%2C%22form.subscribe%22%2C%22global_messages%22%2C%22header%22%2C%22messages%22%2C%22messages%22%2C%22minicart%22%2C%22my-account-link%22%2C%22register-link%22%2C%2', 'http://10.0.0.159/crafts/'),
(14, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22catalog.compare.link%22%2C%22form.subscribe%22%2C%22global_messages%22%2C%22header%22%2C%22messages%22%2C%22messages%22%2C%22minicart%22%2C%22my-account-link%22%2C%22register-link%22%2C%2', 'http://10.0.0.159/crafts/'),
(15, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22catalog.compare.link%22%2C%22form.subscribe%22%2C%22global_messages%22%2C%22header%22%2C%22messages%22%2C%22messages%22%2C%22minicart%22%2C%22my-account-link%22%2C%22register-link%22%2C%2', 'http://10.0.0.159/crafts/'),
(16, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(17, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22catalog.compare.sidebar%22%2C%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%2C%22sale.reorder.sidebar%22%2C%22wishlist_sidebar%22%5D&handles=%5B%22default%', 'http://10.0.0.159/crafts/crafts-store.html'),
(18, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(19, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(20, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(21, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(22, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(23, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(24, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(25, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(26, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(27, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(28, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(29, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(30, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(31, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(32, 'http://10.0.0.159/crafts/kids.html', 'http://10.0.0.159/crafts/'),
(33, 'http://10.0.0.159/crafts/', 'http://10.0.0.159/crafts/kids.html'),
(34, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(35, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(36, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(37, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(38, 'http://10.0.0.159/crafts/', NULL),
(39, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_defaultindex%22%2C%22default_head_blocks%22%2C%22checkout_cart_sidebar_item_renderers', 'http://10.0.0.159/crafts/'),
(40, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_defaultindex%22%2C%22default_head_blocks%22%2C%22checkout_cart_sidebar_item_renderers', 'http://10.0.0.159/crafts/'),
(41, 'http://10.0.0.159/crafts/page_cache/block/render/id/4/?blocks=%5B%22catalog.compare.sidebar%22%2C%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%2C%22sale.reorder.sidebar%22%2C%22wishlist_sidebar%22%5D&handles=%5B%22default%22%2C%22cata', 'http://10.0.0.159/crafts/women.html'),
(42, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/index.php'),
(43, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22contact_index_index%22%2C%22default_head_blocks%22%2C%22checkout_cart_sidebar_item_renderers%22', 'http://10.0.0.159/crafts/contact'),
(44, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(45, 'http://10.0.0.159/crafts/review/product/listAjax/id/15/', 'http://10.0.0.159/crafts/bright-retro-ring-5.html'),
(46, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(47, 'http://10.0.0.159/crafts/checkout/cart/add/uenc/aHR0cDovLzEwLjAuMC4xNTkvY3JhZnRzL2NhdGFsb2cvcHJvZHVjdC92aWV3L2lkLzE1Lw,,/product/15/', 'http://10.0.0.159/crafts/bright-retro-ring-5.html'),
(48, 'http://10.0.0.159/crafts/checkout/cart/', 'http://10.0.0.159/crafts/bright-retro-ring-5.html'),
(49, 'http://10.0.0.159/crafts/checkout/onepage/', 'http://10.0.0.159/crafts/checkout/cart/'),
(50, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(51, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(52, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(53, 'http://10.0.0.159/crafts/page_cache/block/render/id/3/?blocks=%5B%22catalog.compare.sidebar%22%2C%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%2C%22sale.reorder.sidebar%22%2C%22wishlist_sidebar%22%5D&handles=%5B%22default%22%2C%22cata', 'http://10.0.0.159/crafts/men.html'),
(54, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(55, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(56, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(57, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(58, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(59, 'http://10.0.0.159/crafts/page_cache/block/render/id/4/?blocks=%5B%22catalog.compare.sidebar%22%2C%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%2C%22sale.reorder.sidebar%22%2C%22wishlist_sidebar%22%5D&handles=%5B%22default%22%2C%22cata', 'http://10.0.0.159/crafts/women.html'),
(60, 'http://10.0.0.159/crafts/page_cache/block/render/id/4/?blocks=%5B%22catalog.compare.sidebar%22%2C%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%2C%22sale.reorder.sidebar%22%2C%22wishlist_sidebar%22%5D&handles=%5B%22default%22%2C%22cata', 'http://10.0.0.159/crafts/women.html'),
(61, 'http://10.0.0.159/crafts/page_cache/block/render/id/4/?blocks=%5B%22catalog.compare.sidebar%22%2C%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%2C%22sale.reorder.sidebar%22%2C%22wishlist_sidebar%22%5D&handles=%5B%22default%22%2C%22cata', 'http://10.0.0.159/crafts/women.html'),
(62, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(63, 'http://10.0.0.159/crafts/page_cache/block/render/id/4/?blocks=%5B%22catalog.compare.sidebar%22%2C%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%2C%22sale.reorder.sidebar%22%2C%22wishlist_sidebar%22%5D&handles=%5B%22default%22%2C%22cata', 'http://10.0.0.159/crafts/women.html'),
(64, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(65, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(66, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(67, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(68, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(69, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(70, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(71, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(72, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(73, 'http://10.0.0.159/crafts/review/product/listAjax/id/21/', 'http://10.0.0.159/crafts/blue-hydrangea-earrings-4.html'),
(74, 'http://10.0.0.159/crafts/page_cache/block/render/id/21/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22catalog_product_view%22%2C%22catalog_product_view_id_21%22%2C%22catalog_product_view_sku_', 'http://10.0.0.159/crafts/blue-hydrangea-earrings-4.html'),
(75, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(76, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(77, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%2C%22', 'http://10.0.0.159/crafts/'),
(78, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(79, 'http://10.0.0.159/crafts/review/product/listAjax/id/11/', 'http://10.0.0.159/crafts/bright-retro-ring-1.html'),
(80, 'http://10.0.0.159/crafts/page_cache/block/render/id/11/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22catalog_product_view%22%2C%22catalog_product_view_id_11%22%2C%22catalog_product_view_sku_', 'http://10.0.0.159/crafts/bright-retro-ring-1.html'),
(81, 'http://10.0.0.159/crafts/page_cache/block/render/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22cms_index_index%22%2C%22cms_page_view%22%2C%22cms_index_index_id_home%22%5D&ve', 'http://10.0.0.159/crafts/'),
(82, 'http://10.0.0.159/crafts/review/product/listAjax/id/21/', 'http://10.0.0.159/crafts/blue-hydrangea-earrings-4.html'),
(83, 'http://10.0.0.159/crafts/page_cache/block/render/id/21/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22catalog_product_view%22%2C%22catalog_product_view_id_21%22%2C%22catalog_product_view_sku_', 'http://10.0.0.159/crafts/blue-hydrangea-earrings-4.html'),
(84, 'http://10.0.0.159/crafts/review/product/listAjax/id/11/', 'http://10.0.0.159/crafts/bright-retro-ring-1.html'),
(85, 'http://10.0.0.159/crafts/review/product/listAjax/id/15/', 'http://10.0.0.159/crafts/bright-retro-ring-5.html'),
(86, 'http://10.0.0.159/crafts/page_cache/block/render/id/15/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22catalog_product_view%22%2C%22catalog_product_view_id_15%22%2C%22catalog_product_view_sku_', 'http://10.0.0.159/crafts/bright-retro-ring-5.html'),
(87, 'http://10.0.0.159/crafts/page_cache/block/render/id/11/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22catalog_product_view%22%2C%22catalog_product_view_id_11%22%2C%22catalog_product_view_sku_', 'http://10.0.0.159/crafts/bright-retro-ring-1.html'),
(88, 'http://10.0.0.159/crafts/review/product/listAjax/id/11/', 'http://10.0.0.159/crafts/bright-retro-ring-1.html'),
(89, 'http://10.0.0.159/crafts/page_cache/block/render/id/11/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22catalog_product_view%22%2C%22catalog_product_view_id_11%22%2C%22catalog_product_view_sku_', 'http://10.0.0.159/crafts/bright-retro-ring-1.html'),
(90, 'http://10.0.0.159/crafts/review/product/listAjax/id/11/', 'http://10.0.0.159/crafts/bright-retro-ring-1.html'),
(91, 'http://10.0.0.159/crafts/page_cache/block/render/id/11/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22catalog_product_view%22%2C%22catalog_product_view_id_11%22%2C%22catalog_product_view_sku_', 'http://10.0.0.159/crafts/bright-retro-ring-1.html'),
(92, 'http://10.0.0.159/crafts/page_cache/block/render/id/11/?blocks=%5B%22global_messages%22%2C%22messages%22%2C%22minicartheader%22%5D&handles=%5B%22default%22%2C%22catalog_product_view%22%2C%22catalog_product_view_id_11%22%2C%22catalog_product_view_sku_', 'http://10.0.0.159/crafts/bright-retro-ring-1.html');

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor`
--

DROP TABLE IF EXISTS `log_visitor`;
CREATE TABLE IF NOT EXISTS `log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NOT NULL COMMENT 'Last Visit Time',
  `last_url_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Last URL ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Log Visitors Table' AUTO_INCREMENT=81 ;

--
-- Dumping data for table `log_visitor`
--

INSERT INTO `log_visitor` (`visitor_id`, `first_visit_at`, `last_visit_at`, `last_url_id`, `store_id`) VALUES
(1, '2014-12-18 20:36:42', '2014-12-18 21:09:28', 2, 1),
(2, '2014-12-18 21:28:16', '2014-12-18 21:28:16', 0, 1),
(3, '2014-12-18 21:28:21', '2014-12-18 21:28:23', 3, 1),
(4, '2014-12-19 00:38:31', '2014-12-19 00:38:31', 0, 1),
(5, '2014-12-19 00:38:37', '2014-12-19 00:46:05', 5, 1),
(6, '2014-12-19 01:20:51', '2014-12-19 01:20:51', 0, 1),
(7, '2014-12-19 01:31:06', '2014-12-19 01:31:06', 0, 1),
(8, '2014-12-19 01:31:09', '2014-12-19 01:31:09', 0, 1),
(9, '2014-12-19 01:31:20', '2014-12-19 01:31:20', 0, 1),
(10, '2014-12-19 01:31:30', '2014-12-19 01:31:31', 6, 1),
(11, '2014-12-19 01:32:17', '2014-12-19 01:32:17', 0, 1),
(12, '2014-12-19 01:32:23', '2014-12-19 01:32:24', 7, 1),
(13, '2014-12-19 01:35:53', '2014-12-19 01:35:53', 0, 1),
(14, '2014-12-19 01:38:10', '2014-12-19 01:38:10', 0, 1),
(15, '2014-12-19 01:41:09', '2014-12-19 01:41:09', 0, 1),
(16, '2014-12-19 01:44:34', '2014-12-19 01:44:34', 0, 1),
(17, '2014-12-19 01:44:42', '2014-12-19 01:44:41', 0, 1),
(18, '2014-12-19 01:51:08', '2014-12-19 01:51:08', 0, 1),
(19, '2014-12-19 01:51:49', '2014-12-19 01:51:49', 0, 1),
(20, '2014-12-19 01:53:37', '2014-12-19 01:53:37', 0, 1),
(21, '2014-12-19 01:53:51', '2014-12-19 01:53:51', 0, 1),
(22, '2014-12-19 01:56:23', '2014-12-19 01:56:23', 0, 1),
(23, '2014-12-19 01:57:44', '2014-12-19 01:57:44', 0, 1),
(24, '2014-12-19 01:59:47', '2014-12-19 01:59:47', 0, 1),
(25, '2014-12-19 02:02:28', '2014-12-19 02:02:28', 0, 1),
(26, '2014-12-19 02:04:04', '2014-12-19 02:04:04', 0, 1),
(27, '2014-12-19 02:05:53', '2014-12-19 02:05:53', 0, 1),
(28, '2014-12-19 02:07:32', '2014-12-19 02:07:32', 0, 1),
(29, '2014-12-19 02:07:38', '2014-12-19 02:07:38', 0, 1),
(30, '2014-12-19 02:07:43', '2014-12-19 02:07:44', 8, 1),
(31, '2014-12-19 02:12:14', '2014-12-19 02:12:14', 0, 1),
(32, '2014-12-19 02:14:36', '2014-12-19 02:14:36', 0, 1),
(33, '2014-12-19 02:14:52', '2014-12-19 02:14:52', 0, 1),
(34, '2014-12-19 02:16:11', '2014-12-19 02:16:11', 0, 1),
(35, '2014-12-19 02:19:08', '2014-12-19 02:19:08', 0, 1),
(36, '2014-12-19 02:20:42', '2014-12-19 02:20:42', 0, 1),
(37, '2014-12-19 02:26:28', '2014-12-19 02:26:28', 0, 1),
(38, '2014-12-19 02:27:01', '2014-12-19 02:27:01', 0, 1),
(39, '2014-12-19 02:28:29', '2014-12-19 02:28:29', 0, 1),
(40, '2014-12-19 02:28:29', '2014-12-19 02:28:29', 0, 1),
(41, '2014-12-19 02:28:37', '2014-12-19 02:28:37', 0, 1),
(42, '2014-12-19 02:28:48', '2014-12-19 02:28:48', 0, 1),
(43, '2014-12-19 02:30:31', '2014-12-19 02:30:31', 0, 1),
(44, '2014-12-19 02:30:45', '2014-12-19 02:30:45', 0, 1),
(45, '2014-12-19 02:36:55', '2014-12-19 02:36:55', 0, 1),
(46, '2014-12-19 02:37:08', '2014-12-19 02:37:08', 0, 1),
(47, '2014-12-19 02:43:24', '2014-12-19 02:43:24', 0, 1),
(48, '2014-12-19 02:44:07', '2014-12-19 02:49:09', 10, 1),
(49, '2014-12-19 02:47:27', '2014-12-19 02:47:27', 0, 1),
(50, '2014-12-19 02:47:43', '2014-12-19 02:47:43', 0, 1),
(51, '2014-12-19 02:50:58', '2014-12-19 02:50:58', 0, 1),
(52, '2014-12-19 02:51:14', '2014-12-19 02:51:14', 0, 1),
(53, '2014-12-19 02:51:23', '2014-12-19 02:51:23', 11, 1),
(54, '2014-12-19 02:51:26', '2014-12-19 02:51:26', 0, 1),
(55, '2014-12-19 02:53:02', '2014-12-19 02:53:02', 0, 1),
(56, '2014-12-19 02:53:10', '2014-12-19 02:53:10', 0, 1),
(57, '2014-12-19 02:53:22', '2014-12-19 02:53:21', 0, 1),
(58, '2014-12-19 03:20:08', '2014-12-19 03:20:08', 0, 1),
(59, '2014-12-21 19:57:40', '2014-12-21 19:57:40', 0, 1),
(60, '2014-12-21 20:23:44', '2014-12-21 20:23:44', 0, 1),
(61, '2014-12-21 20:23:49', '2014-12-21 21:10:48', 33, 1),
(62, '2014-12-22 01:42:11', '2014-12-22 01:42:11', 0, 1),
(63, '2014-12-22 01:51:31', '2014-12-22 01:51:31', 0, 1),
(64, '2014-12-22 01:54:55', '2014-12-22 01:54:55', 0, 1),
(65, '2014-12-22 01:54:59', '2014-12-22 02:43:32', 43, 1),
(66, '2014-12-22 02:57:48', '2014-12-22 02:57:48', 0, 1),
(67, '2014-12-22 03:05:56', '2014-12-22 03:05:56', 0, 1),
(68, '2014-12-22 03:07:39', '2014-12-22 03:07:39', 0, 1),
(69, '2014-12-22 03:07:43', '2014-12-22 03:46:17', 72, 1),
(70, '2014-12-22 03:09:17', '2014-12-22 03:09:17', 0, 1),
(71, '2014-12-22 03:09:39', '2014-12-22 03:09:39', 0, 1),
(72, '2014-12-22 03:09:53', '2014-12-22 03:09:53', 0, 1),
(73, '2014-12-22 03:10:19', '2014-12-22 03:10:19', 0, 1),
(74, '2014-12-22 03:10:26', '2014-12-22 03:10:27', 45, 1),
(75, '2014-12-22 03:10:52', '2014-12-22 03:30:25', 64, 1),
(76, '2014-12-22 03:46:28', '2014-12-22 03:52:52', 76, 1),
(77, '2014-12-22 03:53:03', '2014-12-22 04:10:50', 92, 1),
(78, '2014-12-22 03:59:38', '2014-12-22 04:08:05', 89, 1),
(79, '2014-12-22 04:03:56', '2014-12-22 04:03:56', 0, 1),
(80, '2014-12-22 04:04:00', '2014-12-22 04:04:01', 84, 1);

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor_info`
--

DROP TABLE IF EXISTS `log_visitor_info`;
CREATE TABLE IF NOT EXISTS `log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `http_referer` varchar(255) DEFAULT NULL COMMENT 'HTTP Referrer',
  `http_user_agent` varchar(255) DEFAULT NULL COMMENT 'HTTP User-Agent',
  `http_accept_charset` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Charset',
  `http_accept_language` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Language',
  `server_addr` bigint(20) DEFAULT NULL COMMENT 'Server Address',
  `remote_addr` bigint(20) DEFAULT NULL COMMENT 'Remote Address',
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Info Table';

--
-- Dumping data for table `log_visitor_info`
--

INSERT INTO `log_visitor_info` (`visitor_id`, `http_referer`, `http_user_agent`, `http_accept_charset`, `http_accept_language`, `server_addr`, `remote_addr`) VALUES
(1, 'http://10.0.0.159/crafts/setup/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(2, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', NULL, 'en-US,en;q=0.8,vi;q=0.6', 167772319, 167772319),
(3, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', NULL, 'en-US,en;q=0.8,vi;q=0.6', 167772319, 167772319),
(4, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(5, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(6, NULL, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(7, NULL, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(8, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(9, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(10, 'http://10.0.0.159/crafts/blue-hydrangea-earrings.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(11, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(12, 'http://10.0.0.159/crafts/blue-hydrangea-earrings.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(13, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(14, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(15, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(16, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(17, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(18, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(19, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(20, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(21, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(22, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(23, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(24, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(25, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(26, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(27, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(28, NULL, 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', NULL, 'en-US,en;q=0.8', 167772319, 167772330),
(29, 'http://10.0.0.159/crafts/women/bags.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(30, 'http://10.0.0.159/crafts/steampunk-heart-necklace-3.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(31, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(32, 'http://10.0.0.159/crafts/men.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(33, 'http://10.0.0.159/crafts/women/bags.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(34, 'http://10.0.0.159/crafts/catalog/category/view/id/5/?p=2', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(35, 'http://10.0.0.159/crafts/catalog/category/view/id/5/?p=2', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(36, 'http://10.0.0.159/crafts/catalog/category/view/id/5/?p=2', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(37, 'http://10.0.0.159/crafts/catalog/category/view/id/5/?p=2', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(38, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(39, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(40, 'http://10.0.0.159/crafts/catalog/category/view/id/4/?p=2', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(41, 'http://10.0.0.159/crafts/catalog/category/view/id/4/?p=2', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(42, 'http://10.0.0.159/crafts/catalog/category/view/id/4/?p=1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(43, 'http://10.0.0.159/crafts/sale.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(44, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(45, 'http://10.0.0.159/crafts/catalog/category/view/id/4/?p=2', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(46, NULL, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(47, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(48, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(49, 'http://10.0.0.159/crafts/catalog/category/view/id/4/?p=1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(50, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(51, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(52, 'http://10.0.0.159/crafts/sale.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(53, 'http://10.0.0.159/crafts/bright-retro-ring-7.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(54, 'http://10.0.0.159/crafts/bright-retro-ring-7.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(55, NULL, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(56, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(57, 'http://10.0.0.159/crafts/kids.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(58, 'http://10.0.0.159/crafts/admin/cms/page/index/key/363f75a21d219137b6da9b99f65431c654c1bb833a4512c444ccb7374651c792/', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(59, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(60, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(61, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(62, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(63, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(64, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(65, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(66, 'http://10.0.0.159/crafts/contact', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(67, NULL, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(68, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(69, 'http://10.0.0.159/crafts/', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(70, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(71, 'http://10.0.0.159/crafts/women.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(72, 'http://10.0.0.159/crafts/catalog/category/view/id/4/?p=2', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(73, 'http://10.0.0.159/crafts/catalog/category/view/id/4/?p=1', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(74, 'http://10.0.0.159/crafts/bright-retro-ring-5.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(75, 'http://10.0.0.159/crafts/bright-retro-ring-5.html', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(76, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(77, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772319),
(78, NULL, 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0', NULL, 'en-US,en;q=0.5', 167772319, 167772292),
(79, NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', NULL, 'en-US,en;q=0.8,vi;q=0.6', 167772319, 167772319),
(80, 'http://10.0.0.159/crafts/bright-retro-ring-1.html', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', NULL, 'en-US,en;q=0.8,vi;q=0.6', 167772319, 167772319);

-- --------------------------------------------------------

--
-- Table structure for table `log_visitor_online`
--

DROP TABLE IF EXISTS `log_visitor_online`;
CREATE TABLE IF NOT EXISTS `log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `visitor_type` varchar(1) NOT NULL COMMENT 'Visitor Type',
  `remote_addr` bigint(20) NOT NULL COMMENT 'Remote Address',
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NULL DEFAULT NULL COMMENT 'Last Visit Time',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `last_url` varchar(255) DEFAULT NULL COMMENT 'Last URL',
  PRIMARY KEY (`visitor_id`),
  KEY `IDX_LOG_VISITOR_ONLINE_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_LOG_VISITOR_ONLINE_FIRST_VISIT_AT_LAST_VISIT_AT` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_LOG_VISITOR_ONLINE_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Online Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mview_state`
--

DROP TABLE IF EXISTS `mview_state`;
CREATE TABLE IF NOT EXISTS `mview_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State Id',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View Id',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int(10) unsigned DEFAULT NULL COMMENT 'View Version Id',
  PRIMARY KEY (`state_id`),
  KEY `IDX_MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `IDX_MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='View State' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_problem`
--

DROP TABLE IF EXISTS `newsletter_problem`;
CREATE TABLE IF NOT EXISTS `newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `IDX_NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `IDX_NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue`
--

DROP TABLE IF EXISTS `newsletter_queue`;
CREATE TABLE IF NOT EXISTS `newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template Id',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `IDX_NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_link`
--

DROP TABLE IF EXISTS `newsletter_queue_link`;
CREATE TABLE IF NOT EXISTS `newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `IDX_NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `newsletter_queue_store_link`;
CREATE TABLE IF NOT EXISTS `newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `IDX_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriber`
--

DROP TABLE IF EXISTS `newsletter_subscriber`;
CREATE TABLE IF NOT EXISTS `newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `IDX_NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_template`
--

DROP TABLE IF EXISTS `newsletter_template`;
CREATE TABLE IF NOT EXISTS `newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_text_preprocessed` text COMMENT 'Template Text Preprocessed',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `IDX_NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `IDX_NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `IDX_NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
CREATE TABLE IF NOT EXISTS `oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` varchar(255) DEFAULT NULL COMMENT 'Callback URL',
  `rejected_callback_url` varchar(255) NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `UNQ_OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `IDX_OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `IDX_OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
CREATE TABLE IF NOT EXISTS `oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  UNIQUE KEY `UNQ_OAUTH_NONCE_NONCE_CONSUMER_ID` (`nonce`,`consumer_id`),
  KEY `FK_OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='OAuth Nonce';

-- --------------------------------------------------------

--
-- Table structure for table `oauth_token`
--

DROP TABLE IF EXISTS `oauth_token`;
CREATE TABLE IF NOT EXISTS `oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` varchar(255) NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int(11) DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_OAUTH_TOKEN_TOKEN` (`token`),
  KEY `IDX_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `FK_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `FK_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `persistent_session`
--

DROP TABLE IF EXISTS `persistent_session`;
CREATE TABLE IF NOT EXISTS `persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `IDX_PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `IDX_PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  KEY `FK_PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_alert_price`
--

DROP TABLE IF EXISTS `product_alert_price`;
CREATE TABLE IF NOT EXISTS `product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `IDX_PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `IDX_PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_alert_stock`
--

DROP TABLE IF EXISTS `product_alert_stock`;
CREATE TABLE IF NOT EXISTS `product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `IDX_PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `IDX_PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Frontend',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `UNQ_RATING_RATING_CODE` (`rating_code`),
  KEY `IDX_RATING_ENTITY_ID` (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Ratings' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`rating_id`, `entity_id`, `rating_code`, `position`, `is_active`) VALUES
(1, 1, 'Quality', 0, 1),
(2, 1, 'Value', 0, 1),
(3, 1, 'Price', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rating_entity`
--

DROP TABLE IF EXISTS `rating_entity`;
CREATE TABLE IF NOT EXISTS `rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rating_entity`
--

INSERT INTO `rating_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'product_review'),
(3, 'review');

-- --------------------------------------------------------

--
-- Table structure for table `rating_option`
--

DROP TABLE IF EXISTS `rating_option`;
CREATE TABLE IF NOT EXISTS `rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on frontend',
  PRIMARY KEY (`option_id`),
  KEY `IDX_RATING_OPTION_RATING_ID` (`rating_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Rating options' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `rating_option`
--

INSERT INTO `rating_option` (`option_id`, `rating_id`, `code`, `value`, `position`) VALUES
(1, 1, '1', 1, 1),
(2, 1, '2', 2, 2),
(3, 1, '3', 3, 3),
(4, 1, '4', 4, 4),
(5, 1, '5', 5, 5),
(6, 2, '1', 1, 1),
(7, 2, '2', 2, 2),
(8, 2, '3', 3, 3),
(9, 2, '4', 4, 4),
(10, 2, '5', 5, 5),
(11, 3, '1', 1, 1),
(12, 3, '2', 2, 2),
(13, 3, '3', 3, 3),
(14, 3, '4', 4, 4),
(15, 3, '5', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote`
--

DROP TABLE IF EXISTS `rating_option_vote`;
CREATE TABLE IF NOT EXISTS `rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `IDX_RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  KEY `FK_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `rating_option_vote_aggregated`;
CREATE TABLE IF NOT EXISTS `rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `IDX_RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `IDX_RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_store`
--

DROP TABLE IF EXISTS `rating_store`;
CREATE TABLE IF NOT EXISTS `rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `IDX_RATING_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';

-- --------------------------------------------------------

--
-- Table structure for table `rating_title`
--

DROP TABLE IF EXISTS `rating_title`;
CREATE TABLE IF NOT EXISTS `rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `IDX_RATING_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';

-- --------------------------------------------------------

--
-- Table structure for table `report_compared_product_index`
--

DROP TABLE IF EXISTS `report_compared_product_index`;
CREATE TABLE IF NOT EXISTS `report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `IDX_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_event`
--

DROP TABLE IF EXISTS `report_event`;
CREATE TABLE IF NOT EXISTS `report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `IDX_REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `IDX_REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `IDX_REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `IDX_REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `IDX_REPORT_EVENT_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Event Table' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `report_event`
--

INSERT INTO `report_event` (`event_id`, `logged_at`, `event_type_id`, `object_id`, `subject_id`, `subtype`, `store_id`) VALUES
(1, '2014-12-19 01:31:21', 1, 1, 9, 1, 1),
(2, '2014-12-19 01:32:18', 1, 1, 11, 1, 1),
(3, '2014-12-19 02:07:39', 1, 7, 29, 1, 1),
(4, '2014-12-19 02:51:14', 1, 18, 52, 1, 1),
(5, '2014-12-22 03:10:20', 1, 15, 73, 1, 1),
(6, '2014-12-22 03:10:54', 4, 15, 75, 1, 1),
(7, '2014-12-22 03:47:23', 1, 21, 76, 1, 1),
(8, '2014-12-22 03:59:56', 1, 11, 78, 1, 1),
(9, '2014-12-22 04:02:00', 1, 21, 78, 1, 1),
(10, '2014-12-22 04:03:57', 1, 11, 79, 1, 1),
(11, '2014-12-22 04:04:01', 1, 15, 78, 1, 1),
(12, '2014-12-22 04:07:56', 1, 11, 78, 1, 1),
(13, '2014-12-22 04:10:13', 1, 11, 77, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `report_event_types`
--

DROP TABLE IF EXISTS `report_event_types`;
CREATE TABLE IF NOT EXISTS `report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `report_event_types`
--

INSERT INTO `report_event_types` (`event_type_id`, `event_name`, `customer_login`) VALUES
(1, 'catalog_product_view', 0),
(2, 'sendfriend_product', 0),
(3, 'catalog_product_compare_add_product', 0),
(4, 'checkout_cart_add_product', 0),
(5, 'wishlist_add_product', 0),
(6, 'wishlist_share', 0);

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_daily`;
CREATE TABLE IF NOT EXISTS `report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_monthly`;
CREATE TABLE IF NOT EXISTS `report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `report_viewed_product_aggregated_yearly`;
CREATE TABLE IF NOT EXISTS `report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `report_viewed_product_index`
--

DROP TABLE IF EXISTS `report_viewed_product_index`;
CREATE TABLE IF NOT EXISTS `report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `IDX_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `report_viewed_product_index`
--

INSERT INTO `report_viewed_product_index` (`index_id`, `visitor_id`, `customer_id`, `product_id`, `store_id`, `added_at`) VALUES
(1, 9, NULL, 1, NULL, '0000-00-00 00:00:00'),
(2, 11, NULL, 1, NULL, '0000-00-00 00:00:00'),
(3, 29, NULL, 7, NULL, '0000-00-00 00:00:00'),
(4, 52, NULL, 18, NULL, '0000-00-00 00:00:00'),
(5, 73, NULL, 15, NULL, '0000-00-00 00:00:00'),
(6, 76, NULL, 21, NULL, '0000-00-00 00:00:00'),
(7, 78, NULL, 11, NULL, '0000-00-00 00:00:00'),
(8, 78, NULL, 21, NULL, '0000-00-00 00:00:00'),
(9, 79, NULL, 11, NULL, '0000-00-00 00:00:00'),
(10, 78, NULL, 15, NULL, '0000-00-00 00:00:00'),
(12, 77, NULL, 11, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `IDX_REVIEW_ENTITY_ID` (`entity_id`),
  KEY `IDX_REVIEW_STATUS_ID` (`status_id`),
  KEY `IDX_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_detail`
--

DROP TABLE IF EXISTS `review_detail`;
CREATE TABLE IF NOT EXISTS `review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `IDX_REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `IDX_REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `IDX_REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_entity`
--

DROP TABLE IF EXISTS `review_entity`;
CREATE TABLE IF NOT EXISTS `review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review entities' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `review_entity`
--

INSERT INTO `review_entity` (`entity_id`, `entity_code`) VALUES
(1, 'product'),
(2, 'customer'),
(3, 'category');

-- --------------------------------------------------------

--
-- Table structure for table `review_entity_summary`
--

DROP TABLE IF EXISTS `review_entity_summary`;
CREATE TABLE IF NOT EXISTS `review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `IDX_REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_status`
--

DROP TABLE IF EXISTS `review_status`;
CREATE TABLE IF NOT EXISTS `review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Review statuses' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `review_status`
--

INSERT INTO `review_status` (`status_id`, `status_code`) VALUES
(1, 'Approved'),
(2, 'Pending'),
(3, 'Not Approved');

-- --------------------------------------------------------

--
-- Table structure for table `review_store`
--

DROP TABLE IF EXISTS `review_store`;
CREATE TABLE IF NOT EXISTS `review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `IDX_REVIEW_STORE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule`
--

DROP TABLE IF EXISTS `salesrule`;
CREATE TABLE IF NOT EXISTS `salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From Date',
  `to_date` date DEFAULT NULL COMMENT 'To Date',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL COMMENT 'Discount Step',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  KEY `IDX_SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon`
--

DROP TABLE IF EXISTS `salesrule_coupon`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `UNQ_SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `UNQ_SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `IDX_SALESRULE_COUPON_RULE_ID` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_aggregated`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `E190B255EE85D3D58724453C7F718A6B` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `IDX_SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_aggregated_order`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_order`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `1094D1FBBCBB11704A29DEF3ACC37D2B` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `IDX_SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `salesrule_coupon_aggregated_updated`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `7196FA120A4F0F84E1B66605E87E213E` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `IDX_SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Aggregated Updated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `salesrule_coupon_usage`;
CREATE TABLE IF NOT EXISTS `salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `IDX_SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer`
--

DROP TABLE IF EXISTS `salesrule_customer`;
CREATE TABLE IF NOT EXISTS `salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `IDX_SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `IDX_SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_customer_group`
--

DROP TABLE IF EXISTS `salesrule_customer_group`;
CREATE TABLE IF NOT EXISTS `salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `IDX_SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_label`
--

DROP TABLE IF EXISTS `salesrule_label`;
CREATE TABLE IF NOT EXISTS `salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `UNQ_SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `IDX_SALESRULE_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_product_attribute`
--

DROP TABLE IF EXISTS `salesrule_product_attribute`;
CREATE TABLE IF NOT EXISTS `salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';

-- --------------------------------------------------------

--
-- Table structure for table `salesrule_website`
--

DROP TABLE IF EXISTS `salesrule_website`;
CREATE TABLE IF NOT EXISTS `salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `IDX_SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_daily`;
CREATE TABLE IF NOT EXISTS `sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_monthly`;
CREATE TABLE IF NOT EXISTS `sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `sales_bestsellers_aggregated_yearly`;
CREATE TABLE IF NOT EXISTS `sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_BESTSELLERS_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `IDX_SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo`
--

DROP TABLE IF EXISTS `sales_creditmemo`;
CREATE TABLE IF NOT EXISTS `sales_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_CREDITMEMO_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `IDX_SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_SALES_CREDITMEMO_STATE` (`state`),
  KEY `IDX_SALES_CREDITMEMO_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo_comment`
--

DROP TABLE IF EXISTS `sales_creditmemo_comment`;
CREATE TABLE IF NOT EXISTS `sales_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo_grid`
--

DROP TABLE IF EXISTS `sales_creditmemo_grid`;
CREATE TABLE IF NOT EXISTS `sales_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_CREDITMEMO_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_CREDITMEMO_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_CREDITMEMO_GRID_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `IDX_SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_creditmemo_item`
--

DROP TABLE IF EXISTS `sales_creditmemo_item`;
CREATE TABLE IF NOT EXISTS `sales_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice`
--

DROP TABLE IF EXISTS `sales_invoice`;
CREATE TABLE IF NOT EXISTS `sales_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_INVOICE_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `IDX_SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_INVOICE_STATE` (`state`),
  KEY `IDX_SALES_INVOICE_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated`;
CREATE TABLE IF NOT EXISTS `sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `sales_invoiced_aggregated_order`;
CREATE TABLE IF NOT EXISTS `sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_comment`
--

DROP TABLE IF EXISTS `sales_invoice_comment`;
CREATE TABLE IF NOT EXISTS `sales_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_grid`
--

DROP TABLE IF EXISTS `sales_invoice_grid`;
CREATE TABLE IF NOT EXISTS `sales_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_INVOICE_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_INVOICE_GRID_STATE` (`state`),
  KEY `IDX_SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_invoice_item`
--

DROP TABLE IF EXISTS `sales_invoice_item`;
CREATE TABLE IF NOT EXISTS `sales_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

DROP TABLE IF EXISTS `sales_order`;
CREATE TABLE IF NOT EXISTS `sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(255) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(255) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(255) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(255) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(255) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(255) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(50) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_ORDER_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_ORDER_STATUS` (`status`),
  KEY `IDX_SALES_ORDER_STATE` (`state`),
  KEY `IDX_SALES_ORDER_STORE_ID` (`store_id`),
  KEY `IDX_SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `IDX_SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `IDX_SALES_ORDER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_address`
--

DROP TABLE IF EXISTS `sales_order_address`;
CREATE TABLE IF NOT EXISTS `sales_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `sales_order_aggregated_created`;
CREATE TABLE IF NOT EXISTS `sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `sales_order_aggregated_updated`;
CREATE TABLE IF NOT EXISTS `sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_ORDER_AGGREGATED_UPDATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Updated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_grid`
--

DROP TABLE IF EXISTS `sales_order_grid`;
CREATE TABLE IF NOT EXISTS `sales_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_ORDER_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_ORDER_GRID_STATUS` (`status`),
  KEY `IDX_SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `IDX_SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `IDX_SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `IDX_SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `IDX_SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_SALES_ORDER_GRID_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_item`
--

DROP TABLE IF EXISTS `sales_order_item`;
CREATE TABLE IF NOT EXISTS `sales_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL COMMENT 'Created At',
  `updated_at` timestamp NOT NULL COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `is_nominal` int(11) NOT NULL DEFAULT '0' COMMENT 'Is Nominal',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `hidden_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `free_shipping` smallint(6) DEFAULT NULL,
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `IDX_SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_ORDER_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_payment`
--

DROP TABLE IF EXISTS `sales_order_payment`;
CREATE TABLE IF NOT EXISTS `sales_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(255) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(255) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(255) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(255) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(255) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(255) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(255) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(255) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(255) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_trans_id` varchar(255) DEFAULT NULL COMMENT 'Cc Trans Id',
  `address_status` varchar(255) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status`
--

DROP TABLE IF EXISTS `sales_order_status`;
CREATE TABLE IF NOT EXISTS `sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status`
--

INSERT INTO `sales_order_status` (`status`, `label`) VALUES
('canceled', 'Canceled'),
('closed', 'Closed'),
('complete', 'Complete'),
('fraud', 'Suspected Fraud'),
('holded', 'On Hold'),
('payment_review', 'Payment Review'),
('pending', 'Pending'),
('pending_payment', 'Pending Payment'),
('processing', 'Processing');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_history`
--

DROP TABLE IF EXISTS `sales_order_status_history`;
CREATE TABLE IF NOT EXISTS `sales_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `IDX_SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_label`
--

DROP TABLE IF EXISTS `sales_order_status_label`;
CREATE TABLE IF NOT EXISTS `sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `IDX_SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_status_state`
--

DROP TABLE IF EXISTS `sales_order_status_state`;
CREATE TABLE IF NOT EXISTS `sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';

--
-- Dumping data for table `sales_order_status_state`
--

INSERT INTO `sales_order_status_state` (`status`, `state`, `is_default`, `visible_on_front`) VALUES
('canceled', 'canceled', 1, 1),
('closed', 'closed', 1, 1),
('complete', 'complete', 1, 1),
('fraud', 'payment_review', 0, 1),
('holded', 'holded', 1, 1),
('payment_review', 'payment_review', 1, 1),
('pending', 'new', 1, 1),
('pending_payment', 'pending_payment', 1, 0),
('processing', 'processing', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax`
--

DROP TABLE IF EXISTS `sales_order_tax`;
CREATE TABLE IF NOT EXISTS `sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Hidden',
  PRIMARY KEY (`tax_id`),
  KEY `IDX_SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_order_tax_item`
--

DROP TABLE IF EXISTS `sales_order_tax_item`;
CREATE TABLE IF NOT EXISTS `sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(12,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(12,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(12,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(12,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `UNQ_SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `IDX_SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  KEY `FK_A2F1F40083C7C1A767C86AF11080505B` (`associated_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_payment_transaction`
--

DROP TABLE IF EXISTS `sales_payment_transaction`;
CREATE TABLE IF NOT EXISTS `sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `IDX_SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_quote`
--

DROP TABLE IF EXISTS `sales_quote`;
CREATE TABLE IF NOT EXISTS `sales_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `IDX_SALES_QUOTE_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_quote`
--

INSERT INTO `sales_quote` (`entity_id`, `store_id`, `created_at`, `updated_at`, `converted_at`, `is_active`, `is_virtual`, `is_multi_shipping`, `items_count`, `items_qty`, `orig_order_id`, `store_to_base_rate`, `store_to_quote_rate`, `base_currency_code`, `store_currency_code`, `quote_currency_code`, `grand_total`, `base_grand_total`, `checkout_method`, `customer_id`, `customer_tax_class_id`, `customer_group_id`, `customer_email`, `customer_prefix`, `customer_firstname`, `customer_middlename`, `customer_lastname`, `customer_suffix`, `customer_dob`, `customer_note`, `customer_note_notify`, `customer_is_guest`, `remote_ip`, `applied_rule_ids`, `reserved_order_id`, `password_hash`, `coupon_code`, `global_currency_code`, `base_to_global_rate`, `base_to_quote_rate`, `customer_taxvat`, `customer_gender`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `is_changed`, `trigger_recollect`, `ext_shipping_info`, `is_persistent`, `gift_message_id`) VALUES
(1, 1, '2014-12-22 09:10:54', '0000-00-00 00:00:00', NULL, 1, 0, 0, 1, '1.0000', 0, '0.0000', '0.0000', 'USD', 'USD', 'USD', '107.0000', '107.0000', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '10.0.0.132', NULL, NULL, NULL, NULL, 'USD', '1.0000', '1.0000', NULL, NULL, '107.0000', '107.0000', '107.0000', '107.0000', 1, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_quote_address`
--

DROP TABLE IF EXISTS `sales_quote_address`;
CREATE TABLE IF NOT EXISTS `sales_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `middlename` varchar(40) DEFAULT NULL COMMENT 'Middlename',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(255) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `free_shipping` smallint(6) DEFAULT NULL,
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_id`),
  KEY `IDX_SALES_QUOTE_ADDRESS_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sales_quote_address`
--

INSERT INTO `sales_quote_address` (`address_id`, `quote_id`, `created_at`, `updated_at`, `customer_id`, `save_in_address_book`, `customer_address_id`, `address_type`, `email`, `prefix`, `firstname`, `middlename`, `lastname`, `suffix`, `company`, `street`, `city`, `region`, `region_id`, `postcode`, `country_id`, `telephone`, `fax`, `same_as_billing`, `collect_shipping_rates`, `shipping_method`, `shipping_description`, `weight`, `subtotal`, `base_subtotal`, `subtotal_with_discount`, `base_subtotal_with_discount`, `tax_amount`, `base_tax_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `discount_amount`, `base_discount_amount`, `grand_total`, `base_grand_total`, `customer_notes`, `applied_taxes`, `discount_description`, `shipping_discount_amount`, `base_shipping_discount_amount`, `subtotal_incl_tax`, `base_subtotal_total_incl_tax`, `hidden_tax_amount`, `base_hidden_tax_amount`, `shipping_hidden_tax_amount`, `base_shipping_hidden_tax_amnt`, `shipping_incl_tax`, `base_shipping_incl_tax`, `free_shipping`, `vat_id`, `vat_is_valid`, `vat_request_id`, `vat_request_date`, `vat_request_success`, `gift_message_id`) VALUES
(1, 1, '2014-12-22 09:10:54', '0000-00-00 00:00:00', NULL, 0, NULL, 'billing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, '2014-12-22 09:10:54', '0000-00-00 00:00:00', NULL, 0, NULL, 'shipping', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, '0.0000', '107.0000', '107.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '107.0000', '107.0000', NULL, 'a:0:{}', NULL, '0.0000', '0.0000', '107.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_quote_address_item`
--

DROP TABLE IF EXISTS `sales_quote_address_item`;
CREATE TABLE IF NOT EXISTS `sales_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `free_shipping` int(11) DEFAULT NULL,
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_item_id`),
  KEY `IDX_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `IDX_SALES_QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `IDX_SALES_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_quote_item`
--

DROP TABLE IF EXISTS `sales_quote_item`;
CREATE TABLE IF NOT EXISTS `sales_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `free_shipping` smallint(6) DEFAULT NULL,
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `IDX_SALES_QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `IDX_SALES_QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_SALES_QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `IDX_SALES_QUOTE_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_quote_item`
--

INSERT INTO `sales_quote_item` (`item_id`, `quote_id`, `created_at`, `updated_at`, `product_id`, `store_id`, `parent_item_id`, `is_virtual`, `sku`, `name`, `description`, `applied_rule_ids`, `additional_data`, `is_qty_decimal`, `no_discount`, `weight`, `qty`, `price`, `base_price`, `custom_price`, `discount_percent`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `row_total`, `base_row_total`, `row_total_with_discount`, `row_weight`, `product_type`, `base_tax_before_discount`, `tax_before_discount`, `original_custom_price`, `redirect_url`, `base_cost`, `price_incl_tax`, `base_price_incl_tax`, `row_total_incl_tax`, `base_row_total_incl_tax`, `hidden_tax_amount`, `base_hidden_tax_amount`, `free_shipping`, `gift_message_id`, `weee_tax_applied`, `weee_tax_applied_amount`, `weee_tax_applied_row_amount`, `weee_tax_disposition`, `weee_tax_row_disposition`, `base_weee_tax_applied_amount`, `base_weee_tax_applied_row_amnt`, `base_weee_tax_disposition`, `base_weee_tax_row_disposition`) VALUES
(1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 15, 1, NULL, 0, 'Purple Ring', 'Purple Ring', NULL, NULL, NULL, 0, 0, NULL, '1.0000', '107.0000', '107.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '107.0000', '107.0000', '0.0000', '0.0000', 'simple', NULL, NULL, NULL, NULL, NULL, '107.0000', '107.0000', '107.0000', '107.0000', '0.0000', '0.0000', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_quote_item_option`
--

DROP TABLE IF EXISTS `sales_quote_item_option`;
CREATE TABLE IF NOT EXISTS `sales_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `IDX_SALES_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sales_quote_item_option`
--

INSERT INTO `sales_quote_item_option` (`option_id`, `item_id`, `product_id`, `code`, `value`) VALUES
(1, 1, 15, 'info_buyRequest', 'a:5:{s:4:"uenc";s:72:"aHR0cDovLzEwLjAuMC4xNTkvY3JhZnRzL2NhdGFsb2cvcHJvZHVjdC92aWV3L2lkLzE1Lw,,";s:7:"product";s:2:"15";s:15:"related_product";s:0:"";s:7:"options";a:1:{i:14;s:2:"40";}s:3:"qty";s:1:"1";}'),
(2, 1, 15, 'option_ids', '14'),
(3, 1, 15, 'option_14', '40');

-- --------------------------------------------------------

--
-- Table structure for table `sales_quote_payment`
--

DROP TABLE IF EXISTS `sales_quote_payment`;
CREATE TABLE IF NOT EXISTS `sales_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`payment_id`),
  KEY `IDX_SALES_QUOTE_PAYMENT_QUOTE_ID` (`quote_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales_quote_payment`
--

INSERT INTO `sales_quote_payment` (`payment_id`, `quote_id`, `created_at`, `updated_at`, `method`, `cc_type`, `cc_number_enc`, `cc_last_4`, `cc_cid_enc`, `cc_owner`, `cc_exp_month`, `cc_exp_year`, `cc_ss_owner`, `cc_ss_start_month`, `cc_ss_start_year`, `po_number`, `additional_data`, `cc_ss_issue`, `additional_information`) VALUES
(1, 1, '2014-12-22 09:10:56', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_quote_shipping_rate`
--

DROP TABLE IF EXISTS `sales_quote_shipping_rate`;
CREATE TABLE IF NOT EXISTS `sales_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `IDX_SALES_QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated`;
CREATE TABLE IF NOT EXISTS `sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `sales_refunded_aggregated_order`;
CREATE TABLE IF NOT EXISTS `sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `IDX_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment`
--

DROP TABLE IF EXISTS `sales_shipment`;
CREATE TABLE IF NOT EXISTS `sales_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_SHIPMENT_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `IDX_SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `IDX_SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_SHIPMENT_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_comment`
--

DROP TABLE IF EXISTS `sales_shipment_comment`;
CREATE TABLE IF NOT EXISTS `sales_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_grid`
--

DROP TABLE IF EXISTS `sales_shipment_grid`;
CREATE TABLE IF NOT EXISTS `sales_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_SALES_SHIPMENT_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `IDX_SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `IDX_SALES_SHIPMENT_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `IDX_SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_item`
--

DROP TABLE IF EXISTS `sales_shipment_item`;
CREATE TABLE IF NOT EXISTS `sales_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipment_track`
--

DROP TABLE IF EXISTS `sales_shipment_track`;
CREATE TABLE IF NOT EXISTS `sales_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `IDX_SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `IDX_SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated`;
CREATE TABLE IF NOT EXISTS `sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `sales_shipping_aggregated_order`;
CREATE TABLE IF NOT EXISTS `sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `search_query`
--

DROP TABLE IF EXISTS `search_query`;
CREATE TABLE IF NOT EXISTS `search_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `synonym_for` varchar(255) DEFAULT NULL COMMENT 'Synonym for',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  KEY `IDX_SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `IDX_SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `IDX_SEARCH_QUERY_SYNONYM_FOR` (`synonym_for`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Search query table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sendfriend_log`
--

DROP TABLE IF EXISTS `sendfriend_log`;
CREATE TABLE IF NOT EXISTS `sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `IDX_SENDFRIEND_LOG_IP` (`ip`),
  KEY `IDX_SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_tablerate`
--

DROP TABLE IF EXISTS `shipping_tablerate`;
CREATE TABLE IF NOT EXISTS `shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sitemap`
--

DROP TABLE IF EXISTS `sitemap`;
CREATE TABLE IF NOT EXISTS `sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `IDX_SITEMAP_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XML Sitemap' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `UNQ_STORE_CODE` (`code`),
  KEY `IDX_STORE_WEBSITE_ID` (`website_id`),
  KEY `IDX_STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `IDX_STORE_GROUP_ID` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `code`, `website_id`, `group_id`, `name`, `sort_order`, `is_active`) VALUES
(0, 'admin', 0, 0, 'Admin', 0, 1),
(1, 'default', 1, 1, 'English', 0, 1),
(2, 'french', 1, 1, 'French', 1, 1),
(3, 'german', 1, 1, 'German', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `store_group`
--

DROP TABLE IF EXISTS `store_group`;
CREATE TABLE IF NOT EXISTS `store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  PRIMARY KEY (`group_id`),
  KEY `IDX_STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `IDX_STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Store Groups' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `store_group`
--

INSERT INTO `store_group` (`group_id`, `website_id`, `name`, `root_category_id`, `default_store_id`) VALUES
(0, 0, 'Default', 0, 0),
(1, 1, 'Main Store', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `store_website`
--

DROP TABLE IF EXISTS `store_website`;
CREATE TABLE IF NOT EXISTS `store_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `UNQ_STORE_WEBSITE_CODE` (`code`),
  KEY `IDX_STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `IDX_STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Websites' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `store_website`
--

INSERT INTO `store_website` (`website_id`, `code`, `name`, `sort_order`, `default_group_id`, `is_default`) VALUES
(0, 'admin', 'Admin', 0, 0, 0),
(1, 'base', 'Main Website', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation`
--

DROP TABLE IF EXISTS `tax_calculation`;
CREATE TABLE IF NOT EXISTS `tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `IDX_TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `IDX_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `IDX_TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate`
--

DROP TABLE IF EXISTS `tax_calculation_rate`;
CREATE TABLE IF NOT EXISTS `tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `IDX_TAX_CALC_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tax_calculation_rate`
--

INSERT INTO `tax_calculation_rate` (`tax_calculation_rate_id`, `tax_country_id`, `tax_region_id`, `tax_postcode`, `code`, `rate`, `zip_is_range`, `zip_from`, `zip_to`) VALUES
(1, 'US', 12, '*', 'US-CA-*-Rate 1', '8.2500', NULL, NULL, NULL),
(2, 'US', 43, '*', 'US-NY-*-Rate 1', '8.3750', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `tax_calculation_rate_title`;
CREATE TABLE IF NOT EXISTS `tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `IDX_TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_calculation_rule`
--

DROP TABLE IF EXISTS `tax_calculation_rule`;
CREATE TABLE IF NOT EXISTS `tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `IDX_TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `IDX_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE IF NOT EXISTS `tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tax Class' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`class_id`, `class_name`, `class_type`) VALUES
(2, 'Taxable Goods', 'PRODUCT'),
(3, 'Retail Customer', 'CUSTOMER');

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `tax_order_aggregated_created`;
CREATE TABLE IF NOT EXISTS `tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `FCA5E2C02689EB2641B30580D7AACF12` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `IDX_TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `tax_order_aggregated_updated`;
CREATE TABLE IF NOT EXISTS `tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `DB0AF14011199AA6CD31D5078B90AA8D` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `IDX_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregated Updated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `translation`
--

DROP TABLE IF EXISTS `translation`;
CREATE TABLE IF NOT EXISTS `translation` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `UNQ_TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `url_rewrite`
--

DROP TABLE IF EXISTS `url_rewrite`;
CREATE TABLE IF NOT EXISTS `url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `UNQ_URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `IDX_URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `IDX_URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Url Rewrites' AUTO_INCREMENT=923 ;

--
-- Dumping data for table `url_rewrite`
--

INSERT INTO `url_rewrite` (`url_rewrite_id`, `entity_type`, `entity_id`, `request_path`, `target_path`, `redirect_type`, `store_id`, `description`, `is_autogenerated`, `metadata`) VALUES
(1, 'category', 3, 'men.html', 'catalog/category/view/id/3', 0, 1, NULL, 1, NULL),
(2, 'category', 4, 'women.html', 'catalog/category/view/id/4', 0, 1, NULL, 1, NULL),
(3, 'category', 5, 'women/bags.html', 'catalog/category/view/id/5', 0, 1, NULL, 1, NULL),
(4, 'category', 6, 'women/hats.html', 'catalog/category/view/id/6', 0, 1, NULL, 1, NULL),
(5, 'category', 7, 'women/earrings.html', 'catalog/category/view/id/7', 0, 1, NULL, 1, NULL),
(6, 'category', 8, 'women/boots-shoes.html', 'catalog/category/view/id/8', 0, 1, NULL, 1, NULL),
(7, 'category', 9, 'women/cosmetics.html', 'catalog/category/view/id/9', 0, 1, NULL, 1, NULL),
(9, 'category', 10, 'kids.html', 'catalog/category/view/id/10', 0, 1, NULL, 1, NULL),
(10, 'category', 10, 'women/cosmetics/kids.html', 'kids.html', 301, 1, NULL, 0, NULL),
(11, 'category', 11, 'new-arrivals.html', 'catalog/category/view/id/11', 0, 1, NULL, 1, NULL),
(12, 'category', 12, 'sale.html', 'catalog/category/view/id/12', 0, 1, NULL, 1, NULL),
(14, 'product', 1, 'blue-hydrangea-earrings.html', 'catalog/product/view/id/1', 0, 1, NULL, 1, NULL),
(15, 'product', 1, 'men/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(16, 'product', 1, 'women/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(17, 'product', 1, 'women/bags/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(18, 'product', 1, 'women/hats/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(19, 'product', 1, 'women/earrings/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(20, 'product', 1, 'women/boots-shoes/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(21, 'product', 1, 'women/cosmetics/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(22, 'product', 1, 'kids/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(23, 'product', 1, 'new-arrivals/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(24, 'product', 1, 'sale/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(25, 'product', 2, 'blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2', 0, 1, NULL, 1, NULL),
(26, 'product', 2, 'men/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(27, 'product', 2, 'women/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(28, 'product', 2, 'women/bags/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(29, 'product', 2, 'women/hats/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(30, 'product', 2, 'women/earrings/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(31, 'product', 2, 'women/boots-shoes/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(32, 'product', 2, 'women/cosmetics/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(33, 'product', 2, 'kids/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(34, 'product', 2, 'new-arrivals/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(35, 'product', 2, 'sale/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(36, 'product', 3, 'blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3', 0, 1, NULL, 1, NULL),
(37, 'product', 3, 'men/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(38, 'product', 3, 'women/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(39, 'product', 3, 'women/bags/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(40, 'product', 3, 'women/hats/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(41, 'product', 3, 'women/earrings/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(42, 'product', 3, 'women/boots-shoes/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(43, 'product', 3, 'women/cosmetics/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(44, 'product', 3, 'kids/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(45, 'product', 3, 'new-arrivals/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(46, 'product', 3, 'sale/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(58, 'product', 4, 'steampunk-heart-necklace.html', 'catalog/product/view/id/4', 0, 1, NULL, 1, NULL),
(59, 'product', 4, 'men/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(60, 'product', 4, 'women/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(61, 'product', 4, 'women/bags/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(62, 'product', 4, 'women/hats/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(63, 'product', 4, 'women/earrings/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(64, 'product', 4, 'women/boots-shoes/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(65, 'product', 4, 'women/cosmetics/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(66, 'product', 4, 'kids/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(67, 'product', 4, 'new-arrivals/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(68, 'product', 4, 'sale/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(69, 'product', 4, 'blue-hydrangea-earrings-3.html', 'steampunk-heart-necklace.html', 301, 1, NULL, 0, NULL),
(70, 'product', 4, 'men/blue-hydrangea-earrings-3.html', 'men/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"3";}'),
(71, 'product', 4, 'women/blue-hydrangea-earrings-3.html', 'women/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"4";}'),
(72, 'product', 4, 'women/bags/blue-hydrangea-earrings-3.html', 'women/bags/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"5";}'),
(73, 'product', 4, 'women/hats/blue-hydrangea-earrings-3.html', 'women/hats/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"6";}'),
(74, 'product', 4, 'women/earrings/blue-hydrangea-earrings-3.html', 'women/earrings/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"7";}'),
(75, 'product', 4, 'women/boots-shoes/blue-hydrangea-earrings-3.html', 'women/boots-shoes/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"8";}'),
(76, 'product', 4, 'women/cosmetics/blue-hydrangea-earrings-3.html', 'women/cosmetics/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"9";}'),
(77, 'product', 4, 'kids/blue-hydrangea-earrings-3.html', 'kids/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:2:"10";}'),
(78, 'product', 4, 'new-arrivals/blue-hydrangea-earrings-3.html', 'new-arrivals/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:2:"11";}'),
(79, 'product', 4, 'sale/blue-hydrangea-earrings-3.html', 'sale/steampunk-heart-necklace.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:2:"12";}'),
(80, 'product', 5, 'steampunk-heart-necklace-1.html', 'catalog/product/view/id/5', 0, 1, NULL, 1, NULL),
(81, 'product', 5, 'men/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(82, 'product', 5, 'women/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(83, 'product', 5, 'women/bags/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(84, 'product', 5, 'women/hats/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(85, 'product', 5, 'women/earrings/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(86, 'product', 5, 'women/boots-shoes/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(87, 'product', 5, 'women/cosmetics/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(88, 'product', 5, 'kids/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(89, 'product', 5, 'new-arrivals/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(90, 'product', 5, 'sale/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(102, 'product', 6, 'steampunk-heart-necklace-2.html', 'catalog/product/view/id/6', 0, 1, NULL, 1, NULL),
(103, 'product', 6, 'men/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(104, 'product', 6, 'women/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(105, 'product', 6, 'women/bags/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(106, 'product', 6, 'women/hats/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(107, 'product', 6, 'women/earrings/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(108, 'product', 6, 'women/boots-shoes/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(109, 'product', 6, 'women/cosmetics/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(110, 'product', 6, 'kids/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(111, 'product', 6, 'new-arrivals/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(112, 'product', 6, 'sale/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(135, 'product', 7, 'steampunk-heart-necklace-3.html', 'catalog/product/view/id/7', 0, 1, NULL, 1, NULL),
(136, 'product', 7, 'women/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(137, 'product', 7, 'women/bags/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(138, 'product', 7, 'women/hats/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(139, 'product', 7, 'women/earrings/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(140, 'product', 7, 'women/boots-shoes/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(141, 'product', 7, 'women/cosmetics/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(142, 'product', 7, 'kids/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(143, 'product', 7, 'new-arrivals/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(144, 'product', 7, 'sale/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(155, 'product', 8, 'steampunk-heart-necklace-4.html', 'catalog/product/view/id/8', 0, 1, NULL, 1, NULL),
(156, 'product', 8, 'men/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(157, 'product', 8, 'women/bags/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(158, 'product', 8, 'women/hats/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(159, 'product', 8, 'women/earrings/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(160, 'product', 8, 'women/boots-shoes/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(161, 'product', 8, 'women/cosmetics/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(162, 'product', 8, 'kids/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(163, 'product', 8, 'new-arrivals/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(173, 'product', 9, 'steampunk-heart-necklace-5.html', 'catalog/product/view/id/9', 0, 1, NULL, 1, NULL),
(174, 'product', 9, 'women/bags/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(175, 'product', 9, 'women/hats/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(176, 'product', 9, 'women/earrings/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(177, 'product', 9, 'women/boots-shoes/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(178, 'product', 9, 'women/cosmetics/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(179, 'product', 9, 'kids/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(180, 'product', 9, 'new-arrivals/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(221, 'product', 11, 'bright-retro-ring-1.html', 'catalog/product/view/id/11', 0, 1, NULL, 1, NULL),
(222, 'product', 11, 'men/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(223, 'product', 11, 'women/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(224, 'product', 11, 'women/bags/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(225, 'product', 11, 'women/hats/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(226, 'product', 11, 'women/earrings/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(227, 'product', 11, 'women/boots-shoes/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(228, 'product', 11, 'women/cosmetics/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(229, 'product', 11, 'kids/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(230, 'product', 12, 'bright-retro-ring-2.html', 'catalog/product/view/id/12', 0, 1, NULL, 1, NULL),
(231, 'product', 12, 'men/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(232, 'product', 12, 'women/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(233, 'product', 12, 'women/bags/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(234, 'product', 12, 'women/hats/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(235, 'product', 12, 'women/earrings/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(236, 'product', 12, 'women/boots-shoes/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(237, 'product', 12, 'women/cosmetics/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(238, 'product', 12, 'kids/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(239, 'product', 13, 'bright-retro-ring-3.html', 'catalog/product/view/id/13', 0, 1, NULL, 1, NULL),
(240, 'product', 13, 'men/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(241, 'product', 13, 'women/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(242, 'product', 13, 'women/bags/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(243, 'product', 13, 'women/hats/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(244, 'product', 13, 'women/earrings/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(245, 'product', 13, 'women/boots-shoes/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(246, 'product', 13, 'women/cosmetics/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(247, 'product', 13, 'kids/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(248, 'product', 14, 'bright-retro-ring-4.html', 'catalog/product/view/id/14', 0, 1, NULL, 1, NULL),
(249, 'product', 14, 'men/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(250, 'product', 14, 'women/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(251, 'product', 14, 'women/bags/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(252, 'product', 14, 'women/hats/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(253, 'product', 14, 'women/earrings/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(254, 'product', 14, 'women/boots-shoes/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(255, 'product', 14, 'women/cosmetics/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(256, 'product', 14, 'kids/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(257, 'product', 15, 'bright-retro-ring-5.html', 'catalog/product/view/id/15', 0, 1, NULL, 1, NULL),
(258, 'product', 15, 'men/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(259, 'product', 15, 'women/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(260, 'product', 15, 'women/bags/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(261, 'product', 15, 'women/hats/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(262, 'product', 15, 'women/earrings/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(263, 'product', 15, 'women/boots-shoes/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(264, 'product', 15, 'women/cosmetics/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(265, 'product', 15, 'kids/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(275, 'product', 16, 'bright-retro-ring-6.html', 'catalog/product/view/id/16', 0, 1, NULL, 1, NULL),
(276, 'product', 16, 'women/bags/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(277, 'product', 16, 'women/hats/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(278, 'product', 16, 'women/earrings/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(279, 'product', 16, 'women/boots-shoes/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(280, 'product', 16, 'women/cosmetics/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(281, 'product', 16, 'kids/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(296, 'product', 18, 'bright-retro-ring-7.html', 'catalog/product/view/id/18', 0, 1, NULL, 1, NULL),
(297, 'product', 18, 'women/bags/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(298, 'product', 18, 'women/hats/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(299, 'product', 18, 'women/earrings/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(300, 'product', 18, 'women/boots-shoes/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(301, 'product', 18, 'women/cosmetics/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(302, 'product', 18, 'kids/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(303, 'product', 18, 'sale/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(304, 'product', 19, 'bright-retro-ring-8.html', 'catalog/product/view/id/19', 0, 1, NULL, 1, NULL),
(305, 'product', 19, 'women/bags/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(306, 'product', 19, 'women/hats/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(307, 'product', 19, 'women/earrings/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(308, 'product', 19, 'women/boots-shoes/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(309, 'product', 19, 'women/cosmetics/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(310, 'product', 19, 'kids/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(311, 'product', 19, 'sale/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(357, 'product', 20, 'bright-retro-ring-9.html', 'catalog/product/view/id/20', 0, 1, NULL, 1, NULL),
(358, 'product', 20, 'men/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(359, 'product', 20, 'women/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(360, 'product', 20, 'women/bags/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(361, 'product', 20, 'women/hats/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(362, 'product', 20, 'women/earrings/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(363, 'product', 20, 'women/boots-shoes/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(364, 'product', 20, 'women/cosmetics/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(365, 'product', 20, 'kids/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(366, 'cms-page', 5, 'craft', 'cms/page/view/page_id/5', 0, 1, NULL, 1, NULL),
(367, 'cms-page', 6, 'home', 'cms/page/view/page_id/6', 0, 1, NULL, 1, NULL),
(368, 'category', 3, 'men.html', 'catalog/category/view/id/3', 0, 2, NULL, 1, NULL),
(369, 'category', 4, 'women.html', 'catalog/category/view/id/4', 0, 2, NULL, 1, NULL),
(370, 'category', 5, 'women/bags.html', 'catalog/category/view/id/5', 0, 2, NULL, 1, NULL),
(371, 'category', 6, 'women/hats.html', 'catalog/category/view/id/6', 0, 2, NULL, 1, NULL),
(372, 'category', 7, 'women/earrings.html', 'catalog/category/view/id/7', 0, 2, NULL, 1, NULL),
(373, 'category', 8, 'women/boots-shoes.html', 'catalog/category/view/id/8', 0, 2, NULL, 1, NULL),
(374, 'category', 9, 'women/cosmetics.html', 'catalog/category/view/id/9', 0, 2, NULL, 1, NULL),
(375, 'category', 10, 'kids.html', 'catalog/category/view/id/10', 0, 2, NULL, 1, NULL),
(376, 'category', 11, 'new-arrivals.html', 'catalog/category/view/id/11', 0, 2, NULL, 1, NULL),
(377, 'category', 12, 'sale.html', 'catalog/category/view/id/12', 0, 2, NULL, 1, NULL),
(378, 'product', 1, 'blue-hydrangea-earrings.html', 'catalog/product/view/id/1', 0, 2, NULL, 1, NULL),
(379, 'product', 1, 'men/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(380, 'product', 1, 'women/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(381, 'product', 1, 'women/bags/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(382, 'product', 1, 'women/hats/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(383, 'product', 1, 'women/earrings/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(384, 'product', 1, 'women/boots-shoes/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(385, 'product', 1, 'women/cosmetics/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(386, 'product', 1, 'kids/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(387, 'product', 1, 'new-arrivals/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(388, 'product', 1, 'sale/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(389, 'product', 2, 'blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2', 0, 2, NULL, 1, NULL),
(390, 'product', 2, 'men/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(391, 'product', 2, 'women/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(392, 'product', 2, 'women/bags/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(393, 'product', 2, 'women/hats/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(394, 'product', 2, 'women/earrings/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(395, 'product', 2, 'women/boots-shoes/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(396, 'product', 2, 'women/cosmetics/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(397, 'product', 2, 'kids/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(398, 'product', 2, 'new-arrivals/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(399, 'product', 2, 'sale/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(400, 'product', 3, 'blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3', 0, 2, NULL, 1, NULL),
(401, 'product', 3, 'men/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(402, 'product', 3, 'women/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(403, 'product', 3, 'women/bags/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(404, 'product', 3, 'women/hats/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(405, 'product', 3, 'women/earrings/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(406, 'product', 3, 'women/boots-shoes/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(407, 'product', 3, 'women/cosmetics/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(408, 'product', 3, 'kids/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(409, 'product', 3, 'new-arrivals/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(410, 'product', 3, 'sale/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(411, 'product', 4, 'steampunk-heart-necklace.html', 'catalog/product/view/id/4', 0, 2, NULL, 1, NULL),
(412, 'product', 4, 'men/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(413, 'product', 4, 'women/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(414, 'product', 4, 'women/bags/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(415, 'product', 4, 'women/hats/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(416, 'product', 4, 'women/earrings/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(417, 'product', 4, 'women/boots-shoes/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(418, 'product', 4, 'women/cosmetics/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(419, 'product', 4, 'kids/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(420, 'product', 4, 'new-arrivals/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(421, 'product', 4, 'sale/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(422, 'product', 5, 'steampunk-heart-necklace-1.html', 'catalog/product/view/id/5', 0, 2, NULL, 1, NULL),
(423, 'product', 5, 'men/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(424, 'product', 5, 'women/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(425, 'product', 5, 'women/bags/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(426, 'product', 5, 'women/hats/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(427, 'product', 5, 'women/earrings/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(428, 'product', 5, 'women/boots-shoes/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(429, 'product', 5, 'women/cosmetics/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(430, 'product', 5, 'kids/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(431, 'product', 5, 'new-arrivals/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(432, 'product', 5, 'sale/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(433, 'product', 6, 'steampunk-heart-necklace-2.html', 'catalog/product/view/id/6', 0, 2, NULL, 1, NULL),
(434, 'product', 6, 'men/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(435, 'product', 6, 'women/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(436, 'product', 6, 'women/bags/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(437, 'product', 6, 'women/hats/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(438, 'product', 6, 'women/earrings/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(439, 'product', 6, 'women/boots-shoes/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(440, 'product', 6, 'women/cosmetics/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(441, 'product', 6, 'kids/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(442, 'product', 6, 'new-arrivals/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(443, 'product', 6, 'sale/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(444, 'product', 7, 'steampunk-heart-necklace-3.html', 'catalog/product/view/id/7', 0, 2, NULL, 1, NULL),
(445, 'product', 7, 'women/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(446, 'product', 7, 'women/bags/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(447, 'product', 7, 'women/hats/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(448, 'product', 7, 'women/earrings/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(449, 'product', 7, 'women/boots-shoes/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(450, 'product', 7, 'women/cosmetics/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(451, 'product', 7, 'kids/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(452, 'product', 7, 'new-arrivals/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(453, 'product', 7, 'sale/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(454, 'product', 8, 'steampunk-heart-necklace-4.html', 'catalog/product/view/id/8', 0, 2, NULL, 1, NULL),
(455, 'product', 8, 'men/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(456, 'product', 8, 'women/bags/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(457, 'product', 8, 'women/hats/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(458, 'product', 8, 'women/earrings/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(459, 'product', 8, 'women/boots-shoes/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(460, 'product', 8, 'women/cosmetics/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(461, 'product', 8, 'kids/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(462, 'product', 8, 'new-arrivals/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(463, 'product', 9, 'steampunk-heart-necklace-5.html', 'catalog/product/view/id/9', 0, 2, NULL, 1, NULL),
(464, 'product', 9, 'women/bags/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(465, 'product', 9, 'women/hats/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(466, 'product', 9, 'women/earrings/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(467, 'product', 9, 'women/boots-shoes/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(468, 'product', 9, 'women/cosmetics/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(469, 'product', 9, 'kids/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(470, 'product', 9, 'new-arrivals/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(479, 'product', 11, 'bright-retro-ring-1.html', 'catalog/product/view/id/11', 0, 2, NULL, 1, NULL),
(480, 'product', 11, 'men/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(481, 'product', 11, 'women/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(482, 'product', 11, 'women/bags/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(483, 'product', 11, 'women/hats/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(484, 'product', 11, 'women/earrings/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(485, 'product', 11, 'women/boots-shoes/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(486, 'product', 11, 'women/cosmetics/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(487, 'product', 11, 'kids/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(488, 'product', 12, 'bright-retro-ring-2.html', 'catalog/product/view/id/12', 0, 2, NULL, 1, NULL),
(489, 'product', 12, 'men/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(490, 'product', 12, 'women/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(491, 'product', 12, 'women/bags/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(492, 'product', 12, 'women/hats/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(493, 'product', 12, 'women/earrings/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(494, 'product', 12, 'women/boots-shoes/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(495, 'product', 12, 'women/cosmetics/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(496, 'product', 12, 'kids/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(497, 'product', 13, 'bright-retro-ring-3.html', 'catalog/product/view/id/13', 0, 2, NULL, 1, NULL),
(498, 'product', 13, 'men/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(499, 'product', 13, 'women/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(500, 'product', 13, 'women/bags/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(501, 'product', 13, 'women/hats/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(502, 'product', 13, 'women/earrings/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(503, 'product', 13, 'women/boots-shoes/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(504, 'product', 13, 'women/cosmetics/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(505, 'product', 13, 'kids/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(506, 'product', 14, 'bright-retro-ring-4.html', 'catalog/product/view/id/14', 0, 2, NULL, 1, NULL),
(507, 'product', 14, 'men/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(508, 'product', 14, 'women/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(509, 'product', 14, 'women/bags/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(510, 'product', 14, 'women/hats/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(511, 'product', 14, 'women/earrings/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(512, 'product', 14, 'women/boots-shoes/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(513, 'product', 14, 'women/cosmetics/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(514, 'product', 14, 'kids/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(515, 'product', 15, 'bright-retro-ring-5.html', 'catalog/product/view/id/15', 0, 2, NULL, 1, NULL),
(516, 'product', 15, 'men/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(517, 'product', 15, 'women/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(518, 'product', 15, 'women/bags/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(519, 'product', 15, 'women/hats/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(520, 'product', 15, 'women/earrings/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(521, 'product', 15, 'women/boots-shoes/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(522, 'product', 15, 'women/cosmetics/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(523, 'product', 15, 'kids/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(524, 'product', 16, 'bright-retro-ring-6.html', 'catalog/product/view/id/16', 0, 2, NULL, 1, NULL);
INSERT INTO `url_rewrite` (`url_rewrite_id`, `entity_type`, `entity_id`, `request_path`, `target_path`, `redirect_type`, `store_id`, `description`, `is_autogenerated`, `metadata`) VALUES
(525, 'product', 16, 'women/bags/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(526, 'product', 16, 'women/hats/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(527, 'product', 16, 'women/earrings/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(528, 'product', 16, 'women/boots-shoes/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(529, 'product', 16, 'women/cosmetics/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(530, 'product', 16, 'kids/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(531, 'product', 18, 'bright-retro-ring-7.html', 'catalog/product/view/id/18', 0, 2, NULL, 1, NULL),
(532, 'product', 18, 'women/bags/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(533, 'product', 18, 'women/hats/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(534, 'product', 18, 'women/earrings/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(535, 'product', 18, 'women/boots-shoes/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(536, 'product', 18, 'women/cosmetics/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(537, 'product', 18, 'kids/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(538, 'product', 18, 'sale/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(539, 'product', 19, 'bright-retro-ring-8.html', 'catalog/product/view/id/19', 0, 2, NULL, 1, NULL),
(540, 'product', 19, 'women/bags/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(541, 'product', 19, 'women/hats/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(542, 'product', 19, 'women/earrings/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(543, 'product', 19, 'women/boots-shoes/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(544, 'product', 19, 'women/cosmetics/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(545, 'product', 19, 'kids/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(546, 'product', 19, 'sale/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(547, 'product', 20, 'bright-retro-ring-9.html', 'catalog/product/view/id/20', 0, 2, NULL, 1, NULL),
(548, 'product', 20, 'men/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(549, 'product', 20, 'women/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(550, 'product', 20, 'women/bags/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(551, 'product', 20, 'women/hats/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(552, 'product', 20, 'women/earrings/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(553, 'product', 20, 'women/boots-shoes/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(554, 'product', 20, 'women/cosmetics/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(555, 'product', 20, 'kids/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(556, 'category', 3, 'men.html', 'catalog/category/view/id/3', 0, 3, NULL, 1, NULL),
(557, 'category', 4, 'women.html', 'catalog/category/view/id/4', 0, 3, NULL, 1, NULL),
(558, 'category', 5, 'women/bags.html', 'catalog/category/view/id/5', 0, 3, NULL, 1, NULL),
(559, 'category', 6, 'women/hats.html', 'catalog/category/view/id/6', 0, 3, NULL, 1, NULL),
(560, 'category', 7, 'women/earrings.html', 'catalog/category/view/id/7', 0, 3, NULL, 1, NULL),
(561, 'category', 8, 'women/boots-shoes.html', 'catalog/category/view/id/8', 0, 3, NULL, 1, NULL),
(562, 'category', 9, 'women/cosmetics.html', 'catalog/category/view/id/9', 0, 3, NULL, 1, NULL),
(563, 'category', 10, 'kids.html', 'catalog/category/view/id/10', 0, 3, NULL, 1, NULL),
(564, 'category', 11, 'new-arrivals.html', 'catalog/category/view/id/11', 0, 3, NULL, 1, NULL),
(565, 'category', 12, 'sale.html', 'catalog/category/view/id/12', 0, 3, NULL, 1, NULL),
(566, 'product', 1, 'blue-hydrangea-earrings.html', 'catalog/product/view/id/1', 0, 3, NULL, 1, NULL),
(567, 'product', 1, 'men/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(568, 'product', 1, 'women/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(569, 'product', 1, 'women/bags/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(570, 'product', 1, 'women/hats/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(571, 'product', 1, 'women/earrings/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(572, 'product', 1, 'women/boots-shoes/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(573, 'product', 1, 'women/cosmetics/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(574, 'product', 1, 'kids/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(575, 'product', 1, 'new-arrivals/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(576, 'product', 1, 'sale/blue-hydrangea-earrings.html', 'catalog/product/view/id/1/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(577, 'product', 2, 'blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2', 0, 3, NULL, 1, NULL),
(578, 'product', 2, 'men/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(579, 'product', 2, 'women/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(580, 'product', 2, 'women/bags/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(581, 'product', 2, 'women/hats/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(582, 'product', 2, 'women/earrings/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(583, 'product', 2, 'women/boots-shoes/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(584, 'product', 2, 'women/cosmetics/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(585, 'product', 2, 'kids/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(586, 'product', 2, 'new-arrivals/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(587, 'product', 2, 'sale/blue-hydrangea-earrings-1.html', 'catalog/product/view/id/2/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(588, 'product', 3, 'blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3', 0, 3, NULL, 1, NULL),
(589, 'product', 3, 'men/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(590, 'product', 3, 'women/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(591, 'product', 3, 'women/bags/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(592, 'product', 3, 'women/hats/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(593, 'product', 3, 'women/earrings/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(594, 'product', 3, 'women/boots-shoes/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(595, 'product', 3, 'women/cosmetics/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(596, 'product', 3, 'kids/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(597, 'product', 3, 'new-arrivals/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(598, 'product', 3, 'sale/blue-hydrangea-earrings-2.html', 'catalog/product/view/id/3/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(599, 'product', 4, 'steampunk-heart-necklace.html', 'catalog/product/view/id/4', 0, 3, NULL, 1, NULL),
(600, 'product', 4, 'men/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(601, 'product', 4, 'women/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(602, 'product', 4, 'women/bags/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(603, 'product', 4, 'women/hats/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(604, 'product', 4, 'women/earrings/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(605, 'product', 4, 'women/boots-shoes/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(606, 'product', 4, 'women/cosmetics/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(607, 'product', 4, 'kids/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(608, 'product', 4, 'new-arrivals/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(609, 'product', 4, 'sale/steampunk-heart-necklace.html', 'catalog/product/view/id/4/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(610, 'product', 5, 'steampunk-heart-necklace-1.html', 'catalog/product/view/id/5', 0, 3, NULL, 1, NULL),
(611, 'product', 5, 'men/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(612, 'product', 5, 'women/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(613, 'product', 5, 'women/bags/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(614, 'product', 5, 'women/hats/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(615, 'product', 5, 'women/earrings/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(616, 'product', 5, 'women/boots-shoes/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(617, 'product', 5, 'women/cosmetics/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(618, 'product', 5, 'kids/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(619, 'product', 5, 'new-arrivals/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(620, 'product', 5, 'sale/steampunk-heart-necklace-1.html', 'catalog/product/view/id/5/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(621, 'product', 6, 'steampunk-heart-necklace-2.html', 'catalog/product/view/id/6', 0, 3, NULL, 1, NULL),
(622, 'product', 6, 'men/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(623, 'product', 6, 'women/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(624, 'product', 6, 'women/bags/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(625, 'product', 6, 'women/hats/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(626, 'product', 6, 'women/earrings/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(627, 'product', 6, 'women/boots-shoes/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(628, 'product', 6, 'women/cosmetics/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(629, 'product', 6, 'kids/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(630, 'product', 6, 'new-arrivals/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(631, 'product', 6, 'sale/steampunk-heart-necklace-2.html', 'catalog/product/view/id/6/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(632, 'product', 7, 'steampunk-heart-necklace-3.html', 'catalog/product/view/id/7', 0, 3, NULL, 1, NULL),
(633, 'product', 7, 'women/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(634, 'product', 7, 'women/bags/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(635, 'product', 7, 'women/hats/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(636, 'product', 7, 'women/earrings/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(637, 'product', 7, 'women/boots-shoes/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(638, 'product', 7, 'women/cosmetics/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(639, 'product', 7, 'kids/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(640, 'product', 7, 'new-arrivals/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(641, 'product', 7, 'sale/steampunk-heart-necklace-3.html', 'catalog/product/view/id/7/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(642, 'product', 8, 'steampunk-heart-necklace-4.html', 'catalog/product/view/id/8', 0, 3, NULL, 1, NULL),
(643, 'product', 8, 'men/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(644, 'product', 8, 'women/bags/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(645, 'product', 8, 'women/hats/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(646, 'product', 8, 'women/earrings/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(647, 'product', 8, 'women/boots-shoes/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(648, 'product', 8, 'women/cosmetics/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(649, 'product', 8, 'kids/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(650, 'product', 8, 'new-arrivals/steampunk-heart-necklace-4.html', 'catalog/product/view/id/8/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(651, 'product', 9, 'steampunk-heart-necklace-5.html', 'catalog/product/view/id/9', 0, 3, NULL, 1, NULL),
(652, 'product', 9, 'women/bags/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(653, 'product', 9, 'women/hats/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(654, 'product', 9, 'women/earrings/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(655, 'product', 9, 'women/boots-shoes/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(656, 'product', 9, 'women/cosmetics/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(657, 'product', 9, 'kids/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(658, 'product', 9, 'new-arrivals/steampunk-heart-necklace-5.html', 'catalog/product/view/id/9/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(667, 'product', 11, 'bright-retro-ring-1.html', 'catalog/product/view/id/11', 0, 3, NULL, 1, NULL),
(668, 'product', 11, 'men/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(669, 'product', 11, 'women/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(670, 'product', 11, 'women/bags/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(671, 'product', 11, 'women/hats/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(672, 'product', 11, 'women/earrings/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(673, 'product', 11, 'women/boots-shoes/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(674, 'product', 11, 'women/cosmetics/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(675, 'product', 11, 'kids/bright-retro-ring-1.html', 'catalog/product/view/id/11/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(676, 'product', 12, 'bright-retro-ring-2.html', 'catalog/product/view/id/12', 0, 3, NULL, 1, NULL),
(677, 'product', 12, 'men/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(678, 'product', 12, 'women/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(679, 'product', 12, 'women/bags/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(680, 'product', 12, 'women/hats/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(681, 'product', 12, 'women/earrings/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(682, 'product', 12, 'women/boots-shoes/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(683, 'product', 12, 'women/cosmetics/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(684, 'product', 12, 'kids/bright-retro-ring-2.html', 'catalog/product/view/id/12/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(685, 'product', 13, 'bright-retro-ring-3.html', 'catalog/product/view/id/13', 0, 3, NULL, 1, NULL),
(686, 'product', 13, 'men/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(687, 'product', 13, 'women/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(688, 'product', 13, 'women/bags/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(689, 'product', 13, 'women/hats/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(690, 'product', 13, 'women/earrings/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(691, 'product', 13, 'women/boots-shoes/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(692, 'product', 13, 'women/cosmetics/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(693, 'product', 13, 'kids/bright-retro-ring-3.html', 'catalog/product/view/id/13/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(694, 'product', 14, 'bright-retro-ring-4.html', 'catalog/product/view/id/14', 0, 3, NULL, 1, NULL),
(695, 'product', 14, 'men/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(696, 'product', 14, 'women/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(697, 'product', 14, 'women/bags/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(698, 'product', 14, 'women/hats/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(699, 'product', 14, 'women/earrings/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(700, 'product', 14, 'women/boots-shoes/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(701, 'product', 14, 'women/cosmetics/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(702, 'product', 14, 'kids/bright-retro-ring-4.html', 'catalog/product/view/id/14/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(703, 'product', 15, 'bright-retro-ring-5.html', 'catalog/product/view/id/15', 0, 3, NULL, 1, NULL),
(704, 'product', 15, 'men/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(705, 'product', 15, 'women/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(706, 'product', 15, 'women/bags/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(707, 'product', 15, 'women/hats/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(708, 'product', 15, 'women/earrings/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(709, 'product', 15, 'women/boots-shoes/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(710, 'product', 15, 'women/cosmetics/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(711, 'product', 15, 'kids/bright-retro-ring-5.html', 'catalog/product/view/id/15/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(712, 'product', 16, 'bright-retro-ring-6.html', 'catalog/product/view/id/16', 0, 3, NULL, 1, NULL),
(713, 'product', 16, 'women/bags/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(714, 'product', 16, 'women/hats/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(715, 'product', 16, 'women/earrings/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(716, 'product', 16, 'women/boots-shoes/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(717, 'product', 16, 'women/cosmetics/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(718, 'product', 16, 'kids/bright-retro-ring-6.html', 'catalog/product/view/id/16/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(719, 'product', 18, 'bright-retro-ring-7.html', 'catalog/product/view/id/18', 0, 3, NULL, 1, NULL),
(720, 'product', 18, 'women/bags/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(721, 'product', 18, 'women/hats/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(722, 'product', 18, 'women/earrings/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(723, 'product', 18, 'women/boots-shoes/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(724, 'product', 18, 'women/cosmetics/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(725, 'product', 18, 'kids/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(726, 'product', 18, 'sale/bright-retro-ring-7.html', 'catalog/product/view/id/18/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(727, 'product', 19, 'bright-retro-ring-8.html', 'catalog/product/view/id/19', 0, 3, NULL, 1, NULL),
(728, 'product', 19, 'women/bags/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(729, 'product', 19, 'women/hats/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(730, 'product', 19, 'women/earrings/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(731, 'product', 19, 'women/boots-shoes/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(732, 'product', 19, 'women/cosmetics/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(733, 'product', 19, 'kids/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(734, 'product', 19, 'sale/bright-retro-ring-8.html', 'catalog/product/view/id/19/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(735, 'product', 20, 'bright-retro-ring-9.html', 'catalog/product/view/id/20', 0, 3, NULL, 1, NULL),
(736, 'product', 20, 'men/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(737, 'product', 20, 'women/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(738, 'product', 20, 'women/bags/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(739, 'product', 20, 'women/hats/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(740, 'product', 20, 'women/earrings/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(741, 'product', 20, 'women/boots-shoes/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(742, 'product', 20, 'women/cosmetics/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(743, 'product', 20, 'kids/bright-retro-ring-9.html', 'catalog/product/view/id/20/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(753, 'cms-page', 10, 'home-page', 'cms/page/view/page_id/10', 0, 1, NULL, 1, NULL),
(754, 'cms-page', 10, 'home-page', 'cms/page/view/page_id/10', 0, 2, NULL, 1, NULL),
(755, 'cms-page', 10, 'home-page', 'cms/page/view/page_id/10', 0, 3, NULL, 1, NULL),
(756, 'product', 10, 'bright-retro-ring.html', 'catalog/product/view/id/10', 0, 1, NULL, 1, NULL),
(757, 'product', 10, 'men/bright-retro-ring.html', 'catalog/product/view/id/10/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(758, 'product', 10, 'women/bright-retro-ring.html', 'catalog/product/view/id/10/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(759, 'product', 10, 'women/bags/bright-retro-ring.html', 'catalog/product/view/id/10/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(760, 'product', 10, 'women/hats/bright-retro-ring.html', 'catalog/product/view/id/10/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(761, 'product', 10, 'women/earrings/bright-retro-ring.html', 'catalog/product/view/id/10/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(762, 'product', 10, 'women/boots-shoes/bright-retro-ring.html', 'catalog/product/view/id/10/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(763, 'product', 10, 'women/cosmetics/bright-retro-ring.html', 'catalog/product/view/id/10/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(764, 'product', 10, 'kids/bright-retro-ring.html', 'catalog/product/view/id/10/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(765, 'product', 10, 'steampunk-heart-necklace-6.html', 'bright-retro-ring.html', 301, 1, NULL, 0, NULL),
(766, 'product', 10, 'men/steampunk-heart-necklace-6.html', 'men/bright-retro-ring.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"3";}'),
(767, 'product', 10, 'women/bags/steampunk-heart-necklace-6.html', 'women/bags/bright-retro-ring.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"5";}'),
(768, 'product', 10, 'women/hats/steampunk-heart-necklace-6.html', 'women/hats/bright-retro-ring.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"6";}'),
(769, 'product', 10, 'women/earrings/steampunk-heart-necklace-6.html', 'women/earrings/bright-retro-ring.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"7";}'),
(770, 'product', 10, 'women/boots-shoes/steampunk-heart-necklace-6.html', 'women/boots-shoes/bright-retro-ring.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"8";}'),
(771, 'product', 10, 'women/cosmetics/steampunk-heart-necklace-6.html', 'women/cosmetics/bright-retro-ring.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:1:"9";}'),
(772, 'product', 10, 'kids/steampunk-heart-necklace-6.html', 'kids/bright-retro-ring.html', 301, 1, NULL, 0, 'a:1:{s:11:"category_id";s:2:"10";}'),
(773, 'product', 10, 'bright-retro-ring.html', 'catalog/product/view/id/10', 0, 2, NULL, 1, NULL),
(774, 'product', 10, 'men/bright-retro-ring.html', 'catalog/product/view/id/10/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(775, 'product', 10, 'women/bright-retro-ring.html', 'catalog/product/view/id/10/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(776, 'product', 10, 'women/bags/bright-retro-ring.html', 'catalog/product/view/id/10/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(777, 'product', 10, 'women/hats/bright-retro-ring.html', 'catalog/product/view/id/10/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(778, 'product', 10, 'women/earrings/bright-retro-ring.html', 'catalog/product/view/id/10/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(779, 'product', 10, 'women/boots-shoes/bright-retro-ring.html', 'catalog/product/view/id/10/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(780, 'product', 10, 'women/cosmetics/bright-retro-ring.html', 'catalog/product/view/id/10/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(781, 'product', 10, 'kids/bright-retro-ring.html', 'catalog/product/view/id/10/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(782, 'product', 10, 'bright-retro-ring.html', 'catalog/product/view/id/10', 0, 3, NULL, 1, NULL),
(783, 'product', 10, 'men/bright-retro-ring.html', 'catalog/product/view/id/10/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(784, 'product', 10, 'women/bright-retro-ring.html', 'catalog/product/view/id/10/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(785, 'product', 10, 'women/bags/bright-retro-ring.html', 'catalog/product/view/id/10/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(786, 'product', 10, 'women/hats/bright-retro-ring.html', 'catalog/product/view/id/10/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(787, 'product', 10, 'women/earrings/bright-retro-ring.html', 'catalog/product/view/id/10/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(788, 'product', 10, 'women/boots-shoes/bright-retro-ring.html', 'catalog/product/view/id/10/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(789, 'product', 10, 'women/cosmetics/bright-retro-ring.html', 'catalog/product/view/id/10/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(790, 'product', 10, 'kids/bright-retro-ring.html', 'catalog/product/view/id/10/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(890, 'product', 21, 'blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21', 0, 1, NULL, 1, NULL),
(891, 'product', 21, 'men/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/3', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(892, 'product', 21, 'women/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/4', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(893, 'product', 21, 'women/bags/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/5', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(894, 'product', 21, 'women/hats/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/6', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(895, 'product', 21, 'women/earrings/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/7', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(896, 'product', 21, 'women/boots-shoes/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/8', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(897, 'product', 21, 'women/cosmetics/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/9', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(898, 'product', 21, 'kids/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/10', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(899, 'product', 21, 'new-arrivals/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/11', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(900, 'product', 21, 'sale/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/12', 0, 1, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(901, 'product', 21, 'blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21', 0, 2, NULL, 1, NULL),
(902, 'product', 21, 'men/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/3', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(903, 'product', 21, 'women/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/4', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(904, 'product', 21, 'women/bags/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/5', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(905, 'product', 21, 'women/hats/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/6', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(906, 'product', 21, 'women/earrings/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/7', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(907, 'product', 21, 'women/boots-shoes/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/8', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(908, 'product', 21, 'women/cosmetics/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/9', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(909, 'product', 21, 'kids/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/10', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(910, 'product', 21, 'new-arrivals/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/11', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(911, 'product', 21, 'sale/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/12', 0, 2, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}'),
(912, 'product', 21, 'blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21', 0, 3, NULL, 1, NULL),
(913, 'product', 21, 'men/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/3', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"3";}'),
(914, 'product', 21, 'women/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/4', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"4";}'),
(915, 'product', 21, 'women/bags/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/5', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"5";}'),
(916, 'product', 21, 'women/hats/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/6', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"6";}'),
(917, 'product', 21, 'women/earrings/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/7', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"7";}'),
(918, 'product', 21, 'women/boots-shoes/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/8', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"8";}'),
(919, 'product', 21, 'women/cosmetics/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/9', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:1:"9";}'),
(920, 'product', 21, 'kids/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/10', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"10";}'),
(921, 'product', 21, 'new-arrivals/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/11', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"11";}'),
(922, 'product', 21, 'sale/blue-hydrangea-earrings-4.html', 'catalog/product/view/id/21/category/12', 0, 3, NULL, 1, 'a:1:{s:11:"category_id";s:2:"12";}');

-- --------------------------------------------------------

--
-- Table structure for table `vde_theme_change`
--

DROP TABLE IF EXISTS `vde_theme_change`;
CREATE TABLE IF NOT EXISTS `vde_theme_change` (
  `change_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme Change Identifier',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme Id',
  `change_time` timestamp NOT NULL COMMENT 'Change Time',
  PRIMARY KEY (`change_id`),
  KEY `FK_VDE_THEME_CHANGE_THEME_ID_CORE_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Editor Theme Change' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `weee_tax`
--

DROP TABLE IF EXISTS `weee_tax`;
CREATE TABLE IF NOT EXISTS `weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` varchar(255) NOT NULL DEFAULT '*' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`value_id`),
  KEY `IDX_WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `IDX_WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `IDX_WEEE_TAX_COUNTRY` (`country`),
  KEY `IDX_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
CREATE TABLE IF NOT EXISTS `widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `IDX_WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance`
--

DROP TABLE IF EXISTS `widget_instance`;
CREATE TABLE IF NOT EXISTS `widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `FK_WIDGET_INSTANCE_THEME_ID_CORE_THEME_THEME_ID` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page`
--

DROP TABLE IF EXISTS `widget_instance_page`;
CREATE TABLE IF NOT EXISTS `widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `IDX_WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `widget_instance_page_layout`
--

DROP TABLE IF EXISTS `widget_instance_page_layout`;
CREATE TABLE IF NOT EXISTS `widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `UNQ_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `IDX_WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE IF NOT EXISTS `wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `UNQ_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_WISHLIST_SHARED` (`shared`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item`
--

DROP TABLE IF EXISTS `wishlist_item`;
CREATE TABLE IF NOT EXISTS `wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `IDX_WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `IDX_WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_WISHLIST_ITEM_STORE_ID` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_item_option`
--

DROP TABLE IF EXISTS `wishlist_item_option`;
CREATE TABLE IF NOT EXISTS `wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table' AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorization_rule`
--
ALTER TABLE `authorization_rule`
  ADD CONSTRAINT `FK_AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `authorization_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cataloginventory_stock_item`
--
ALTER TABLE `cataloginventory_stock_item`
  ADD CONSTRAINT `FK_CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_customer_group`
--
ALTER TABLE `catalogrule_customer_group`
  ADD CONSTRAINT `FK_CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_group_website`
--
ALTER TABLE `catalogrule_group_website`
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATRULE_GROUP_WS_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalogrule_website`
--
ALTER TABLE `catalogrule_website`
  ADD CONSTRAINT `FK_CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_datetime`
--
ALTER TABLE `catalog_category_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_decimal`
--
ALTER TABLE `catalog_category_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_int`
--
ALTER TABLE `catalog_category_entity_int`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_text`
--
ALTER TABLE `catalog_category_entity_text`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_entity_varchar`
--
ALTER TABLE `catalog_category_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_category_product`
--
ALTER TABLE `catalog_category_product`
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_compare_item`
--
ALTER TABLE `catalog_compare_item`
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_CMP_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_eav_attribute`
--
ALTER TABLE `catalog_eav_attribute`
  ADD CONSTRAINT `FK_CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option`
--
ALTER TABLE `catalog_product_bundle_option`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_option_value`
--
ALTER TABLE `catalog_product_bundle_option_value`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_price_index`
--
ALTER TABLE `catalog_product_bundle_price_index`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_selection`
--
ALTER TABLE `catalog_product_bundle_selection`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_bundle_selection_price`
--
ALTER TABLE `catalog_product_bundle_selection_price`
  ADD CONSTRAINT `FK_CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity`
--
ALTER TABLE `catalog_product_entity`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_datetime`
--
ALTER TABLE `catalog_product_entity_datetime`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_decimal`
--
ALTER TABLE `catalog_product_entity_decimal`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_gallery`
--
ALTER TABLE `catalog_product_entity_gallery`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_group_price`
--
ALTER TABLE `catalog_product_entity_group_price`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GROUP_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_GROUP_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DF909D22C11B60B1E5E3EE64AB220ECE` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_int`
--
ALTER TABLE `catalog_product_entity_int`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery`
--
ALTER TABLE `catalog_product_entity_media_gallery`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_media_gallery_value`
--
ALTER TABLE `catalog_product_entity_media_gallery_value`
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_text`
--
ALTER TABLE `catalog_product_entity_text`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_tier_price`
--
ALTER TABLE `catalog_product_entity_tier_price`
  ADD CONSTRAINT `FK_6E08D719F0501DD1D8E6D4EFF2511C85` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_entity_varchar`
--
ALTER TABLE `catalog_product_entity_varchar`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_group_price`
--
ALTER TABLE `catalog_product_index_group_price`
  ADD CONSTRAINT `FK_195DF97C81B0BDD6A2EEC50F870E16D1` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_GROUP_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_GROUP_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_price`
--
ALTER TABLE `catalog_product_index_price`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_tier_price`
--
ALTER TABLE `catalog_product_index_tier_price`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_index_website`
--
ALTER TABLE `catalog_product_index_website`
  ADD CONSTRAINT `FK_CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link`
--
ALTER TABLE `catalog_product_link`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute`
--
ALTER TABLE `catalog_product_link_attribute`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_decimal`
--
ALTER TABLE `catalog_product_link_attribute_decimal`
  ADD CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_int`
--
ALTER TABLE `catalog_product_link_attribute_int`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_link_attribute_varchar`
--
ALTER TABLE `catalog_product_link_attribute_varchar`
  ADD CONSTRAINT `FK_CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option`
--
ALTER TABLE `catalog_product_option`
  ADD CONSTRAINT `FK_CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_price`
--
ALTER TABLE `catalog_product_option_price`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_title`
--
ALTER TABLE `catalog_product_option_title`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_price`
--
ALTER TABLE `catalog_product_option_type_price`
  ADD CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_title`
--
ALTER TABLE `catalog_product_option_type_title`
  ADD CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_option_type_value`
--
ALTER TABLE `catalog_product_option_type_value`
  ADD CONSTRAINT `FK_CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_relation`
--
ALTER TABLE `catalog_product_relation`
  ADD CONSTRAINT `FK_CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute`
--
ALTER TABLE `catalog_product_super_attribute`
  ADD CONSTRAINT `FK_CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `catalog_product_super_attribute_label`
--
ALTER TABLE `catalog_product_super_attribute_label`
  ADD CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_attribute_pricing`
--
ALTER TABLE `catalog_product_super_attribute_pricing`
  ADD CONSTRAINT `FK_CAT_PRD_SPR_ATTR_PRICING_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CDE8813117106CFAA3AD209358F66332` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_super_link`
--
ALTER TABLE `catalog_product_super_link`
  ADD CONSTRAINT `FK_CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_product_website`
--
ALTER TABLE `catalog_product_website`
  ADD CONSTRAINT `FK_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `catalog_url_rewrite_product_category`
--
ALTER TABLE `catalog_url_rewrite_product_category`
  ADD CONSTRAINT `FK_BB79E64705D7F17FE181F23144528FC8` FOREIGN KEY (`url_rewrite_id`) REFERENCES `url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `checkout_agreement_store`
--
ALTER TABLE `checkout_agreement_store`
  ADD CONSTRAINT `FK_CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cms_block_store`
--
ALTER TABLE `cms_block_store`
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cms_page_store`
--
ALTER TABLE `cms_page_store`
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_layout_link`
--
ALTER TABLE `core_layout_link`
  ADD CONSTRAINT `FK_CORE_LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_LAYOUT_LINK_THEME_ID_CORE_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `core_theme` (`theme_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_LYT_LNK_LYT_UPDATE_ID_CORE_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_theme_file`
--
ALTER TABLE `core_theme_file`
  ADD CONSTRAINT `FK_CORE_THEME_FILE_THEME_ID_CORE_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `core_theme` (`theme_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `core_variable_value`
--
ALTER TABLE `core_variable_value`
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CORE_VARIABLE_VALUE_VARIABLE_ID_CORE_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity`
--
ALTER TABLE `customer_address_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_datetime`
--
ALTER TABLE `customer_address_entity_datetime`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_decimal`
--
ALTER TABLE `customer_address_entity_decimal`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_int`
--
ALTER TABLE `customer_address_entity_int`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_text`
--
ALTER TABLE `customer_address_entity_text`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_address_entity_varchar`
--
ALTER TABLE `customer_address_entity_varchar`
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_eav_attribute`
--
ALTER TABLE `customer_eav_attribute`
  ADD CONSTRAINT `FK_CSTR_EAV_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_eav_attribute_website`
--
ALTER TABLE `customer_eav_attribute_website`
  ADD CONSTRAINT `FK_CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity`
--
ALTER TABLE `customer_entity`
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_datetime`
--
ALTER TABLE `customer_entity_datetime`
  ADD CONSTRAINT `FK_CSTR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_decimal`
--
ALTER TABLE `customer_entity_decimal`
  ADD CONSTRAINT `FK_CSTR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_int`
--
ALTER TABLE `customer_entity_int`
  ADD CONSTRAINT `FK_CSTR_ENTT_INT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_text`
--
ALTER TABLE `customer_entity_text`
  ADD CONSTRAINT `FK_CSTR_ENTT_TEXT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_entity_varchar`
--
ALTER TABLE `customer_entity_varchar`
  ADD CONSTRAINT `FK_CSTR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CSTR_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_form_attribute`
--
ALTER TABLE `customer_form_attribute`
  ADD CONSTRAINT `FK_CSTR_FORM_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `design_change`
--
ALTER TABLE `design_change`
  ADD CONSTRAINT `FK_DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `directory_country_region_name`
--
ALTER TABLE `directory_country_region_name`
  ADD CONSTRAINT `FK_D7CFDEB379F775328EB6F62695E2B3E1` FOREIGN KEY (`region_id`) REFERENCES `directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link`
--
ALTER TABLE `downloadable_link`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_price`
--
ALTER TABLE `downloadable_link_price`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `FK_DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_purchased_item`
--
ALTER TABLE `downloadable_link_purchased_item`
  ADD CONSTRAINT `FK_46CC8E252307CE62F00A8F1887512A39` FOREIGN KEY (`purchased_id`) REFERENCES `downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_link_title`
--
ALTER TABLE `downloadable_link_title`
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_sample`
--
ALTER TABLE `downloadable_sample`
  ADD CONSTRAINT `FK_DL_SAMPLE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `downloadable_sample_title`
--
ALTER TABLE `downloadable_sample_title`
  ADD CONSTRAINT `FK_DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute`
--
ALTER TABLE `eav_attribute`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_group`
--
ALTER TABLE `eav_attribute_group`
  ADD CONSTRAINT `FK_EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_label`
--
ALTER TABLE `eav_attribute_label`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_option`
--
ALTER TABLE `eav_attribute_option`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_option_value`
--
ALTER TABLE `eav_attribute_option_value`
  ADD CONSTRAINT `FK_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_attribute_set`
--
ALTER TABLE `eav_attribute_set`
  ADD CONSTRAINT `FK_EAV_ATTR_SET_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity`
--
ALTER TABLE `eav_entity`
  ADD CONSTRAINT `FK_EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_attribute`
--
ALTER TABLE `eav_entity_attribute`
  ADD CONSTRAINT `FK_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_datetime`
--
ALTER TABLE `eav_entity_datetime`
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_decimal`
--
ALTER TABLE `eav_entity_decimal`
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_DEC_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_int`
--
ALTER TABLE `eav_entity_int`
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_store`
--
ALTER TABLE `eav_entity_store`
  ADD CONSTRAINT `FK_EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_STORE_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_text`
--
ALTER TABLE `eav_entity_text`
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_entity_varchar`
--
ALTER TABLE `eav_entity_varchar`
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_element`
--
ALTER TABLE `eav_form_element`
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_fieldset`
--
ALTER TABLE `eav_form_fieldset`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_fieldset_label`
--
ALTER TABLE `eav_form_fieldset_label`
  ADD CONSTRAINT `FK_EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_type`
--
ALTER TABLE `eav_form_type`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eav_form_type_entity`
--
ALTER TABLE `eav_form_type_entity`
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `googleoptimizer_code`
--
ALTER TABLE `googleoptimizer_code`
  ADD CONSTRAINT `FK_GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `googleshopping_attributes`
--
ALTER TABLE `googleshopping_attributes`
  ADD CONSTRAINT `FK_GOOGLESHOPPING_ATTRS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_GOOGLESHOPPING_ATTRS_TYPE_ID_GOOGLESHOPPING_TYPES_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `googleshopping_types` (`type_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `googleshopping_items`
--
ALTER TABLE `googleshopping_items`
  ADD CONSTRAINT `FK_GOOGLESHOPPING_ITEMS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_GOOGLESHOPPING_ITEMS_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `googleshopping_types`
--
ALTER TABLE `googleshopping_types`
  ADD CONSTRAINT `FK_GOOGLESHOPPING_TYPES_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `integration`
--
ALTER TABLE `integration`
  ADD CONSTRAINT `FK_INTEGRATION_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_problem`
--
ALTER TABLE `newsletter_problem`
  ADD CONSTRAINT `FK_NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_queue`
--
ALTER TABLE `newsletter_queue`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `newsletter_template` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_queue_link`
--
ALTER TABLE `newsletter_queue_link`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_queue_store_link`
--
ALTER TABLE `newsletter_queue_store_link`
  ADD CONSTRAINT `FK_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_NLTTR_QUEUE_STORE_LNK_QUEUE_ID_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD CONSTRAINT `FK_NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oauth_token`
--
ALTER TABLE `oauth_token`
  ADD CONSTRAINT `FK_OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `oauth_consumer` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `persistent_session`
--
ALTER TABLE `persistent_session`
  ADD CONSTRAINT `FK_PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `product_alert_price`
--
ALTER TABLE `product_alert_price`
  ADD CONSTRAINT `FK_PRD_ALERT_PRICE_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_alert_stock`
--
ALTER TABLE `product_alert_stock`
  ADD CONSTRAINT `FK_PRD_ALERT_STOCK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `FK_RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option`
--
ALTER TABLE `rating_option`
  ADD CONSTRAINT `FK_RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option_vote`
--
ALTER TABLE `rating_option_vote`
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_option_vote_aggregated`
--
ALTER TABLE `rating_option_vote_aggregated`
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_store`
--
ALTER TABLE `rating_store`
  ADD CONSTRAINT `FK_RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rating_title`
--
ALTER TABLE `rating_title`
  ADD CONSTRAINT `FK_RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_compared_product_index`
--
ALTER TABLE `report_compared_product_index`
  ADD CONSTRAINT `FK_REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `report_event`
--
ALTER TABLE `report_event`
  ADD CONSTRAINT `FK_REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_daily`
--
ALTER TABLE `report_viewed_product_aggregated_daily`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_monthly`
--
ALTER TABLE `report_viewed_product_aggregated_monthly`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_aggregated_yearly`
--
ALTER TABLE `report_viewed_product_aggregated_yearly`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_AGGRED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report_viewed_product_index`
--
ALTER TABLE `report_viewed_product_index`
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `review_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `review_detail`
--
ALTER TABLE `review_detail`
  ADD CONSTRAINT `FK_REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `review_entity_summary`
--
ALTER TABLE `review_entity_summary`
  ADD CONSTRAINT `FK_REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review_store`
--
ALTER TABLE `review_store`
  ADD CONSTRAINT `FK_REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_coupon`
--
ALTER TABLE `salesrule_coupon`
  ADD CONSTRAINT `FK_SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_coupon_aggregated`
--
ALTER TABLE `salesrule_coupon_aggregated`
  ADD CONSTRAINT `FK_SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_coupon_aggregated_order`
--
ALTER TABLE `salesrule_coupon_aggregated_order`
  ADD CONSTRAINT `FK_SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_coupon_aggregated_updated`
--
ALTER TABLE `salesrule_coupon_aggregated_updated`
  ADD CONSTRAINT `FK_SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_coupon_usage`
--
ALTER TABLE `salesrule_coupon_usage`
  ADD CONSTRAINT `FK_SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `salesrule_coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_customer`
--
ALTER TABLE `salesrule_customer`
  ADD CONSTRAINT `FK_SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_customer_group`
--
ALTER TABLE `salesrule_customer_group`
  ADD CONSTRAINT `FK_SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_label`
--
ALTER TABLE `salesrule_label`
  ADD CONSTRAINT `FK_SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salesrule_product_attribute`
--
ALTER TABLE `salesrule_product_attribute`
  ADD CONSTRAINT `FK_SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SALESRULE_PRD_ATTR_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `salesrule_website`
--
ALTER TABLE `salesrule_website`
  ADD CONSTRAINT `FK_SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALESRULE_WEBSITE_WEBSITE_ID_CORE/WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_daily`
--
ALTER TABLE `sales_bestsellers_aggregated_daily`
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_monthly`
--
ALTER TABLE `sales_bestsellers_aggregated_monthly`
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_bestsellers_aggregated_yearly`
--
ALTER TABLE `sales_bestsellers_aggregated_yearly`
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_creditmemo`
--
ALTER TABLE `sales_creditmemo`
  ADD CONSTRAINT `FK_SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_creditmemo_comment`
--
ALTER TABLE `sales_creditmemo_comment`
  ADD CONSTRAINT `FK_SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_creditmemo_grid`
--
ALTER TABLE `sales_creditmemo_grid`
  ADD CONSTRAINT `FK_SALES_CREDITMEMO_GRID_ENTITY_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_CREDITMEMO_GRID_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_creditmemo_item`
--
ALTER TABLE `sales_creditmemo_item`
  ADD CONSTRAINT `FK_SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoice`
--
ALTER TABLE `sales_invoice`
  ADD CONSTRAINT `FK_SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoiced_aggregated`
--
ALTER TABLE `sales_invoiced_aggregated`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoiced_aggregated_order`
--
ALTER TABLE `sales_invoiced_aggregated_order`
  ADD CONSTRAINT `FK_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoice_comment`
--
ALTER TABLE `sales_invoice_comment`
  ADD CONSTRAINT `FK_SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoice_grid`
--
ALTER TABLE `sales_invoice_grid`
  ADD CONSTRAINT `FK_SALES_INVOICE_GRID_ENTITY_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_INVOICE_GRID_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_invoice_item`
--
ALTER TABLE `sales_invoice_item`
  ADD CONSTRAINT `FK_SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD CONSTRAINT `FK_SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_address`
--
ALTER TABLE `sales_order_address`
  ADD CONSTRAINT `FK_SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_aggregated_created`
--
ALTER TABLE `sales_order_aggregated_created`
  ADD CONSTRAINT `FK_SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_aggregated_updated`
--
ALTER TABLE `sales_order_aggregated_updated`
  ADD CONSTRAINT `FK_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_grid`
--
ALTER TABLE `sales_order_grid`
  ADD CONSTRAINT `FK_SALES_ORDER_GRID_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_GRID_ENTITY_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_GRID_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_item`
--
ALTER TABLE `sales_order_item`
  ADD CONSTRAINT `FK_SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_payment`
--
ALTER TABLE `sales_order_payment`
  ADD CONSTRAINT `FK_SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_status_history`
--
ALTER TABLE `sales_order_status_history`
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_status_label`
--
ALTER TABLE `sales_order_status_label`
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_status_state`
--
ALTER TABLE `sales_order_status_state`
  ADD CONSTRAINT `FK_SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_order_tax_item`
--
ALTER TABLE `sales_order_tax_item`
  ADD CONSTRAINT `FK_A2F1F40083C7C1A767C86AF11080505B` FOREIGN KEY (`associated_item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `sales_order_tax` (`tax_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_payment_transaction`
--
ALTER TABLE `sales_payment_transaction`
  ADD CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DBEA77BE19876AF496E5DE10370FBC59` FOREIGN KEY (`payment_id`) REFERENCES `sales_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_quote`
--
ALTER TABLE `sales_quote`
  ADD CONSTRAINT `FK_SALES_QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_quote_address`
--
ALTER TABLE `sales_quote_address`
  ADD CONSTRAINT `FK_SALES_QUOTE_ADDRESS_QUOTE_ID_SALES_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_quote_address_item`
--
ALTER TABLE `sales_quote_address_item`
  ADD CONSTRAINT `FK_273D0114AFB05268B24B87E76183AB97` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ADDR_ITEM_QUOTE_ADDR_ID_SALES_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `sales_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ADDR_ITEM_QUOTE_ITEM_ID_SALES_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `sales_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_quote_item`
--
ALTER TABLE `sales_quote_item`
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_PARENT_ITEM_ID_SALES_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `sales_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_QUOTE_ID_SALES_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_quote_item_option`
--
ALTER TABLE `sales_quote_item_option`
  ADD CONSTRAINT `FK_SALES_QUOTE_ITEM_OPTION_ITEM_ID_SALES_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `sales_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_quote_payment`
--
ALTER TABLE `sales_quote_payment`
  ADD CONSTRAINT `FK_SALES_QUOTE_PAYMENT_QUOTE_ID_SALES_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `sales_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_quote_shipping_rate`
--
ALTER TABLE `sales_quote_shipping_rate`
  ADD CONSTRAINT `FK_SALES_QUOTE_SHPP_RATE_ADDR_ID_SALES_QUOTE_ADDR_ADDR_ID` FOREIGN KEY (`address_id`) REFERENCES `sales_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_refunded_aggregated`
--
ALTER TABLE `sales_refunded_aggregated`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_refunded_aggregated_order`
--
ALTER TABLE `sales_refunded_aggregated_order`
  ADD CONSTRAINT `FK_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipment`
--
ALTER TABLE `sales_shipment`
  ADD CONSTRAINT `FK_SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `sales_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipment_comment`
--
ALTER TABLE `sales_shipment_comment`
  ADD CONSTRAINT `FK_SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipment_grid`
--
ALTER TABLE `sales_shipment_grid`
  ADD CONSTRAINT `FK_SALES_SHIPMENT_GRID_ENTITY_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SALES_SHIPMENT_GRID_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipment_item`
--
ALTER TABLE `sales_shipment_item`
  ADD CONSTRAINT `FK_SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipment_track`
--
ALTER TABLE `sales_shipment_track`
  ADD CONSTRAINT `FK_SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `sales_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipping_aggregated`
--
ALTER TABLE `sales_shipping_aggregated`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_shipping_aggregated_order`
--
ALTER TABLE `sales_shipping_aggregated_order`
  ADD CONSTRAINT `FK_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `search_query`
--
ALTER TABLE `search_query`
  ADD CONSTRAINT `FK_SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sitemap`
--
ALTER TABLE `sitemap`
  ADD CONSTRAINT `FK_SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `FK_STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `store_group`
--
ALTER TABLE `store_group`
  ADD CONSTRAINT `FK_STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_calculation`
--
ALTER TABLE `tax_calculation`
  ADD CONSTRAINT `FK_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_calculation_rate_title`
--
ALTER TABLE `tax_calculation_rate_title`
  ADD CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_order_aggregated_created`
--
ALTER TABLE `tax_order_aggregated_created`
  ADD CONSTRAINT `FK_TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tax_order_aggregated_updated`
--
ALTER TABLE `tax_order_aggregated_updated`
  ADD CONSTRAINT `FK_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `translation`
--
ALTER TABLE `translation`
  ADD CONSTRAINT `FK_TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vde_theme_change`
--
ALTER TABLE `vde_theme_change`
  ADD CONSTRAINT `FK_VDE_THEME_CHANGE_THEME_ID_CORE_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `core_theme` (`theme_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weee_tax`
--
ALTER TABLE `weee_tax`
  ADD CONSTRAINT `FK_WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `store_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_instance`
--
ALTER TABLE `widget_instance`
  ADD CONSTRAINT `FK_WIDGET_INSTANCE_THEME_ID_CORE_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `core_theme` (`theme_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_instance_page`
--
ALTER TABLE `widget_instance_page`
  ADD CONSTRAINT `FK_WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_instance_page_layout`
--
ALTER TABLE `widget_instance_page_layout`
  ADD CONSTRAINT `FK_0A5D06DCEC6A6845F50E5FAAC5A1C96D` FOREIGN KEY (`layout_update_id`) REFERENCES `core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WIDGET_INSTANCE_PAGE_LYT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `FK_WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist_item`
--
ALTER TABLE `wishlist_item`
  ADD CONSTRAINT `FK_WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist_item_option`
--
ALTER TABLE `wishlist_item_option`
  ADD CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
