#
# TABLE STRUCTURE FOR: sma_addresses
#

DROP TABLE IF EXISTS `sma_addresses`;

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_addresses` (`id`, `company_id`, `line1`, `line2`, `city`, `postal_code`, `state`, `country`, `phone`, `updated_at`) VALUES (1, 4, 'werwer', '', 'werwer', '', '', 'werwerwer', '23234234234', '2020-08-20 06:37:52');


#
# TABLE STRUCTURE FOR: sma_adjustment_items
#

DROP TABLE IF EXISTS `sma_adjustment_items`;

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_adjustments
#

DROP TABLE IF EXISTS `sma_adjustments`;

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_api_keys
#

DROP TABLE IF EXISTS `sma_api_keys`;

CREATE TABLE `sma_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reference` varchar(40) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_api_limits
#

DROP TABLE IF EXISTS `sma_api_limits`;

CREATE TABLE `sma_api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_api_logs
#

DROP TABLE IF EXISTS `sma_api_logs`;

CREATE TABLE `sma_api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_brands
#

DROP TABLE IF EXISTS `sma_brands`;

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_calendar
#

DROP TABLE IF EXISTS `sma_calendar`;

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_captcha
#

DROP TABLE IF EXISTS `sma_captcha`;

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_cart
#

DROP TABLE IF EXISTS `sma_cart`;

CREATE TABLE `sma_cart` (
  `id` varchar(40) NOT NULL,
  `time` varchar(30) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sma_cart` (`id`, `time`, `user_id`, `data`) VALUES ('8ed54e8edd0aeb3d706ce84927c9e470', '1597988490', NULL, '{\"cart_total\":200,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"5382b588edfb5646a554ac98206ffb1d\":{\"id\":\"ba71a178faf20e51dc46972bb29f488b\",\"product_id\":\"1\",\"qty\":1,\"name\":\"alger\",\"slug\":\"alger\",\"code\":\"alger\",\"price\":200,\"tax\":\"0.00\",\"image\":\"e161933c5985a0fe1a39fb37d10ad5a4.jpg\",\"option\":false,\"options\":null,\"rowid\":\"5382b588edfb5646a554ac98206ffb1d\",\"row_tax\":\"0.0000\",\"subtotal\":\"200.0000\"}}');
INSERT INTO `sma_cart` (`id`, `time`, `user_id`, `data`) VALUES ('d0147ed2cf8a4a35f7eca39678daa470', '1597941088', NULL, '{\"cart_total\":200,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"9aec08c7b69ee5c343ddad7c8d2d7c04\":{\"id\":\"e03013f02725bb0732bff7477d4643c6\",\"product_id\":\"1\",\"qty\":1,\"name\":\"alger\",\"slug\":\"alger\",\"code\":\"alger\",\"price\":200,\"tax\":\"0.00\",\"image\":\"e161933c5985a0fe1a39fb37d10ad5a4.jpg\",\"option\":false,\"options\":null,\"rowid\":\"9aec08c7b69ee5c343ddad7c8d2d7c04\",\"row_tax\":\"0.0000\",\"subtotal\":\"200.0000\"}}');
INSERT INTO `sma_cart` (`id`, `time`, `user_id`, `data`) VALUES ('eaceef343d15528b4d26da9d89c64c25', '1597935578', 1, '{\"cart_total\":200,\"total_item_tax\":0,\"total_items\":1,\"total_unique_items\":1,\"5d12e7833ee15a4d698d102ca3800c8a\":{\"id\":\"177e9c1b540934163408ed639967fc30\",\"product_id\":\"1\",\"qty\":1,\"name\":\"alger\",\"slug\":\"alger\",\"code\":\"alger\",\"price\":200,\"tax\":\"0.00\",\"image\":\"e161933c5985a0fe1a39fb37d10ad5a4.jpg\",\"option\":false,\"options\":null,\"rowid\":\"5d12e7833ee15a4d698d102ca3800c8a\",\"row_tax\":\"0.0000\",\"subtotal\":\"200.0000\"}}');


#
# TABLE STRUCTURE FOR: sma_categories
#

DROP TABLE IF EXISTS `sma_categories`;

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES (1, 'C1', 'Category 1', NULL, NULL, 'category-1', NULL);
INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES (2, 'German Dog', 'German Dog', NULL, 3, 'german-dog', 'German Dog');
INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES (3, 'Dog', 'Dog', NULL, 0, 'dog', 'Dog');
INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES (4, 'Cat', 'Cat', NULL, 0, 'cat', 'Cat');
INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES (5, 'German Cat', 'German Cat', NULL, 4, 'german-cat', 'German Cat');
INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES (6, 'Birds', 'Birds', NULL, 0, 'birds', 'Birds');
INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES (7, 'Australian Birds', 'Australian Birds', NULL, 6, 'australian-birds', 'Australian Birds');


#
# TABLE STRUCTURE FOR: sma_combo_items
#

DROP TABLE IF EXISTS `sma_combo_items`;

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_companies
#

DROP TABLE IF EXISTS `sma_companies`;

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `group_id_2` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES (1, 3, 'customer', 1, 'General', 'Walk-in Customer', 'Walk-in Customer', '', 'Customer Address', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', '0123456789', 'customer@tecdiary.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, NULL);
INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES (2, 4, 'supplier', NULL, NULL, 'Test Supplier', 'Supplier Company Name', NULL, 'Supplier Address', 'Petaling Jaya', 'Selangor', '46050', 'Malaysia', '0123456789', 'supplier@tecdiary.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, NULL);
INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES (3, NULL, 'biller', NULL, NULL, 'Mian Saleem', 'Test Biller', '5555', 'Biller adddress', 'City', '', '', 'Country', '012345678', 'saleem@tecdiary.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL, NULL);
INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES (4, 4, 'supplier', NULL, NULL, 'abc', 'ABC', '', 'Weligton 23324234', 'Riyadh', '', '', '', '12312312', 'admin@example.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, '');


#
# TABLE STRUCTURE FOR: sma_costing
#

DROP TABLE IF EXISTS `sma_costing`;

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_currencies
#

DROP TABLE IF EXISTS `sma_currencies`;

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES (1, 'USD', 'US Dollar', '1.0000', 0, NULL);
INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES (2, 'EUR', 'EURO', '0.7340', 0, NULL);
INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES (3, 'SAR', 'Saudi Riyal', '0.2700', 1, 'SAR');


#
# TABLE STRUCTURE FOR: sma_customer_groups
#

DROP TABLE IF EXISTS `sma_customer_groups`;

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES (1, 'General', 0);
INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES (2, 'Reseller', -5);
INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES (3, 'Distributor', -15);
INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES (4, 'New Customer (+10)', 10);


#
# TABLE STRUCTURE FOR: sma_date_format
#

DROP TABLE IF EXISTS `sma_date_format`;

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES (1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y');
INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES (2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y');
INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES (3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y');
INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES (4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y');
INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES (5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y');
INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES (6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');


#
# TABLE STRUCTURE FOR: sma_deliveries
#

DROP TABLE IF EXISTS `sma_deliveries`;

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_deposits
#

DROP TABLE IF EXISTS `sma_deposits`;

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_expense_categories
#

DROP TABLE IF EXISTS `sma_expense_categories`;

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_expenses
#

DROP TABLE IF EXISTS `sma_expenses`;

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_gift_card_topups
#

DROP TABLE IF EXISTS `sma_gift_card_topups`;

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_gift_cards
#

DROP TABLE IF EXISTS `sma_gift_cards`;

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_groups
#

DROP TABLE IF EXISTS `sma_groups`;

CREATE TABLE `sma_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES (1, 'owner', 'Owner');
INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES (2, 'admin', 'Administrator');
INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES (3, 'customer', 'Customer');
INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES (4, 'supplier', 'Supplier');
INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES (5, 'sales', 'Sales Staff');


#
# TABLE STRUCTURE FOR: sma_login_attempts
#

DROP TABLE IF EXISTS `sma_login_attempts`;

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_migrations
#

DROP TABLE IF EXISTS `sma_migrations`;

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sma_migrations` (`version`) VALUES ('315');


#
# TABLE STRUCTURE FOR: sma_notifications
#

DROP TABLE IF EXISTS `sma_notifications`;

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES (1, '<p>Thank you for purchasing Stock Manager Advance. Please do not forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-15 06:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);


#
# TABLE STRUCTURE FOR: sma_order_ref
#

DROP TABLE IF EXISTS `sma_order_ref`;

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES (1, '2020-08-01', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);


#
# TABLE STRUCTURE FOR: sma_pages
#

DROP TABLE IF EXISTS `sma_pages`;

CREATE TABLE `sma_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_no` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_payments
#

DROP TABLE IF EXISTS `sma_payments`;

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES (1, '2020-08-20 16:39:00', 1, NULL, NULL, 'IPAY2020/08/0001', NULL, 'cash', '', '', '', '', '', 'Visa', '200.0000', NULL, 1, NULL, 'received', '', '0.0000', '0.0000', NULL);
INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES (2, '2020-08-21 10:45:00', NULL, NULL, 2, 'POP2020/08/0001', NULL, 'cash', '', '', '', '', '', 'Visa', '20000.0000', NULL, 1, NULL, 'sent', '', '0.0000', '0.0000', NULL);
INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES (3, '2020-08-21 10:45:00', NULL, NULL, 1, 'POP2020/08/0002', NULL, 'cash', '', '', '', '', '', 'Visa', '9000.0000', NULL, 1, NULL, 'sent', '', '0.0000', '0.0000', NULL);


#
# TABLE STRUCTURE FOR: sma_paypal
#

DROP TABLE IF EXISTS `sma_paypal`;

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES (1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');


#
# TABLE STRUCTURE FOR: sma_permissions
#

DROP TABLE IF EXISTS `sma_permissions`;

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `returns-index` tinyint(1) DEFAULT '0',
  `returns-add` tinyint(1) DEFAULT '0',
  `returns-edit` tinyint(1) DEFAULT '0',
  `returns-delete` tinyint(1) DEFAULT '0',
  `returns-email` tinyint(1) DEFAULT '0',
  `returns-pdf` tinyint(1) DEFAULT '0',
  `reports-tax` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES (1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


#
# TABLE STRUCTURE FOR: sma_pos_register
#

DROP TABLE IF EXISTS `sma_pos_register`;

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES (1, '2020-08-20 19:45:38', 1, '90.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: sma_pos_settings
#

DROP TABLE IF EXISTS `sma_pos_settings`;

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.38',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES (1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.4.38', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL);


#
# TABLE STRUCTURE FOR: sma_price_groups
#

DROP TABLE IF EXISTS `sma_price_groups`;

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES (1, 'Default');


#
# TABLE STRUCTURE FOR: sma_printers
#

DROP TABLE IF EXISTS `sma_printers`;

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) unsigned DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_product_photos
#

DROP TABLE IF EXISTS `sma_product_photos`;

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES (1, 1, '2e6c142a2465e2c3e3ea98ee4dc680fc.jpg');
INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES (2, 2, '242b2d56c1d00d73f26dd9cdc1a83f05.jpg');
INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES (3, 3, '6b448463b57cfb93cd19bf54e4520f8c.jpg');


#
# TABLE STRUCTURE FOR: sma_product_prices
#

DROP TABLE IF EXISTS `sma_product_prices`;

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `price_group_id` (`price_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_product_variants
#

DROP TABLE IF EXISTS `sma_product_variants`;

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product_id_name` (`product_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_products
#

DROP TABLE IF EXISTS `sma_products`;

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `category_id` (`category_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `category_id_2` (`category_id`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES (1, 'alger', 'alger', 1, '100.0000', '200.0000', '0.0000', 'e161933c5985a0fe1a39fb37d10ad5a4.jpg', 3, 2, '', '', '', '', '', '', '90.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'alger', 1, '0.0000', NULL, 0, 0, '', 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES (2, '86062956', 'German Cat 001', 1, '400.0000', '600.0000', '0.0000', '0ea63148c4e528a878600e3e95674def.jpg', 4, 5, '', '', '', '', '', '', '50.0000', 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, '86062956', 1, '0.0000', NULL, 0, 0, '', 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES (3, '01387529', 'cat0002', 1, '500.0000', '700.0000', '0.0000', 'e8bd4f72e7a8c73bfd97dd20d4aa6f54.jpg', 4, 5, '', '', '', '', '', '', NULL, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, '01387529', 1, '0.0000', NULL, 0, 0, '', 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES (4, '50038016', 'cat0003', 1, '350.0000', '690.0000', '0.0000', '5c6032979d6cd7ab82eda98225445db3.jpg', 4, 5, '', '', '', '', '', '', NULL, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '500.0000', '2020-08-21', '2020-08-31', '', NULL, NULL, NULL, NULL, 1, 1, 0, '50038016', 1, '0.0000', NULL, 0, 0, '', 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES (5, '51327741', 'cat0004', 1, '560.0000', '770.0000', '0.0000', 'b87884bf851606d304ae41c81a8f5f26.jpg', 4, 5, '', '', '', '', '', '', NULL, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'cat0004', 1, '0.0000', NULL, 0, 0, '', 0);
INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES (6, '03588710', 'Birds', 1, '11.0000', '14.0000', '2.0000', '43d5abd3b174b81a34a0812dafd67742.jpg', 6, 7, '', '', '', '', '', '', NULL, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, '03588710', 1, '0.0000', NULL, 0, 0, '', 0);


#
# TABLE STRUCTURE FOR: sma_promos
#

DROP TABLE IF EXISTS `sma_promos`;

CREATE TABLE `sma_promos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `product2buy` int(11) NOT NULL,
  `product2get` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_purchase_items
#

DROP TABLE IF EXISTS `sma_purchase_items`;

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `base_unit_cost` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`, `base_unit_cost`) VALUES (1, 1, NULL, 1, 'alger', 'alger', NULL, '100.0000', '90.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '9000.0000', '90.0000', '2020-08-20', 'received', '100.0000', '100.0000', '90.0000', NULL, NULL, 1, 'Pc', '90.0000', NULL, NULL, NULL, NULL, '100.0000');
INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`, `base_unit_cost`) VALUES (2, 2, NULL, 2, '86062956', 'German Cat 001', NULL, '400.0000', '50.0000', 1, '0.0000', 1, '0', '0', '0.0000', NULL, '20000.0000', '50.0000', '2020-08-21', 'received', '400.0000', '400.0000', '50.0000', NULL, NULL, 1, 'Pc', '50.0000', NULL, NULL, NULL, NULL, '400.0000');


#
# TABLE STRUCTURE FOR: sma_purchases
#

DROP TABLE IF EXISTS `sma_purchases`;

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`) VALUES (1, 'PO2020/08/0001', '2020-08-20 11:00:00', 4, 'ABC', 1, '', '9000.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '9000.0000', '9000.0000', 'received', 'paid', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL);
INSERT INTO `sma_purchases` (`id`, `reference_no`, `date`, `supplier_id`, `supplier`, `warehouse_id`, `note`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `paid`, `status`, `payment_status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `payment_term`, `due_date`, `return_id`, `surcharge`, `return_purchase_ref`, `purchase_id`, `return_purchase_total`, `cgst`, `sgst`, `igst`) VALUES (2, 'PO2020/08/0002', '2020-08-21 10:43:00', 4, 'ABC', 1, '', '20000.0000', '0.0000', '', '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '20000.0000', '20000.0000', 'received', 'paid', 1, NULL, NULL, NULL, 0, NULL, NULL, '0.0000', NULL, NULL, '0.0000', NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: sma_quote_items
#

DROP TABLE IF EXISTS `sma_quote_items`;

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`quote_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `sma_quote_items` (`id`, `quote_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES (1, 1, 1, 'alger', 'alger', 'standard', NULL, '200.0000', '200.0000', '3.0000', 1, '0.0000', 1, '0', '0', '0.0000', '600.0000', NULL, '200.0000', 1, 'Pc', '3.0000', NULL, NULL, NULL, NULL);
INSERT INTO `sma_quote_items` (`id`, `quote_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`) VALUES (2, 1, 2, '86062956', 'German Cat 001', 'standard', NULL, '600.0000', '600.0000', '2.0000', 1, '0.0000', 1, '0', '0', '0.0000', '1200.0000', NULL, '600.0000', 1, 'Pc', '2.0000', NULL, NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: sma_quotes
#

DROP TABLE IF EXISTS `sma_quotes`;

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_quotes` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `warehouse_id`, `biller_id`, `biller`, `note`, `internal_note`, `total`, `product_discount`, `order_discount`, `order_discount_id`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `status`, `created_by`, `updated_by`, `updated_at`, `attachment`, `supplier_id`, `supplier`, `hash`, `cgst`, `sgst`, `igst`) VALUES (1, '2020-08-21 09:43:00', 'QUOTE2020/08/0001', 1, 'Walk-in Customer', 1, 3, 'Test Biller', '', NULL, '1800.0000', '0.0000', '0.0000', '', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '1800.0000', 'pending', 1, NULL, NULL, NULL, 0, NULL, '21976043c7a972fbd9a8708f123108c9a4957e079df820e9d843cc53b4092e0e', NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: sma_return_items
#

DROP TABLE IF EXISTS `sma_return_items`;

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `return_id` (`return_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`return_id`),
  KEY `return_id_2` (`return_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_returns
#

DROP TABLE IF EXISTS `sma_returns`;

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT '0.0000',
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_sale_items
#

DROP TABLE IF EXISTS `sma_sale_items`;

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`sale_id`),
  KEY `sale_id_2` (`sale_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES (1, 1, 1, 'alger', 'alger', 'standard', NULL, '200.0000', '200.0000', '1.0000', 1, '0.0000', 1, '0', NULL, '0.0000', '200.0000', NULL, '200.0000', NULL, 1, 'Pc', '1.0000', NULL, NULL, NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: sma_sales
#

DROP TABLE IF EXISTS `sma_sales`;

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`, `manual_payment`, `cgst`, `sgst`, `igst`, `payment_method`) VALUES (1, '2020-08-20 16:37:52', 'SALE2020/08/0001', 4, 'ABC', 3, 'Test Biller', 1, '', NULL, '200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '200.0000', 'pending', 'paid', NULL, NULL, NULL, NULL, NULL, 1, 0, '200.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', NULL, NULL, 0, 1, 1, NULL, 'ee1fbbd8e5866f253ea086566728dbea1edc301712a19f5dddc06155f6b05edd', NULL, NULL, NULL, NULL, 'cod');


#
# TABLE STRUCTURE FOR: sma_sessions
#

DROP TABLE IF EXISTS `sma_sessions`;

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('004ba0b1883a706208203c68c50d4c4e56252a07', '110.93.207.211', 1597984623, '__ci_last_regenerate|i:1597984623;requested_page|s:13:\"shop/products\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('02cf7377e1d3ea76a9bce176a3c9f49f9c20bffe', '110.93.207.170', 1597990840, '__ci_last_regenerate|i:1597990840;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"aDT7vZfhOjsKFkLNpeXn\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('065b53f1bba685497a7d0f5457b3dfbcaf67eeed', '110.93.207.211', 1597902345, '__ci_last_regenerate|i:1597902345;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597901379\";last_ip|s:14:\"182.180.59.197\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('07fd654ad3e49b631fd10d0a77001194c36df098', '43.245.11.86', 1597934507, '__ci_last_regenerate|i:1597934505;requested_page|s:5:\"admin\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('0b3c3cc8dd35ef8db848ce03fff09a6f1558bf9d', '110.93.207.211', 1597989668, '__ci_last_regenerate|i:1597989668;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"aDT7vZfhOjsKFkLNpeXn\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('13ab5888067db0bb1a849778454843b7d026c7de', '51.235.24.186', 1597941544, '__ci_last_regenerate|i:1597941522;requested_page|s:23:\"category/dog/german-dog\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('199ecabf906bbce12b8e42c7f41219e63523478f', '182.180.59.197', 1597906489, '__ci_last_regenerate|i:1597906449;identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597832154\";last_ip|s:14:\"182.191.85.135\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1597906488;');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('20d0ed1036112b17f5eab73285ef3b26885c4e05', '182.191.85.135', 1597832238, '__ci_last_regenerate|i:1597832122;identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597832003\";last_ip|s:14:\"182.191.85.135\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('21065b29032356fdcb6d794899ac59e12ac4fded', '192.185.23.174', 1597923473, '__ci_last_regenerate|i:1597923472;');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('28075cee529af336763f1dbba8353ab49ccddbed', '192.185.23.174', 1597923474, '__ci_last_regenerate|i:1597923474;');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('282aabb025a1571cf929a4035f7046d5c583b6bf', '43.245.8.109', 1597832644, '__ci_last_regenerate|i:1597832370;requested_page|s:13:\"shop/products\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2a0a03732090576a68127613e11764c3c494794a', '110.93.207.170', 1597993838, '__ci_last_regenerate|i:1597993838;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"aDT7vZfhOjsKFkLNpeXn\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('2b23f6e4436096fbd02a53c6a52912fb0a3447e2', '110.93.207.211', 1597988971, '__ci_last_regenerate|i:1597988971;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"aDT7vZfhOjsKFkLNpeXn\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3159d2b464417ea08569446e920ec77d56afd713', '110.93.207.211', 1597900631, '__ci_last_regenerate|i:1597900631;error|s:37:\"<p>Login Failed, Please try again</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('3f8bec922268f05636c7e88d0a9df2c28616ddba', '43.245.11.86', 1597937670, '__ci_last_regenerate|i:1597937670;');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('43c7f2cd8c75b9e5f285fe395679388dfe5ad197', '192.185.23.174', 1597923488, '__ci_last_regenerate|i:1597923488;error|s:76:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('46dda5ab06e52183643de6208d3802b36bcd5dce', '182.191.85.135', 1597988490, '__ci_last_regenerate|i:1597988397;');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4968bb882d8627c0b0a3857391d628c15b5203fd', '43.245.11.86', 1597934505, '__ci_last_regenerate|i:1597934505;requested_page|s:11:\"admin/sales\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4cf9513f9ad4723bc6c73fdbcf535a98cd479211', '110.93.207.211', 1597988579, '__ci_last_regenerate|i:1597988579;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4db3e2acdfa93550cb5f8bd35aa9b16c064dc706', '110.93.207.211', 1597902737, '__ci_last_regenerate|i:1597902737;requested_page|s:14:\"admin/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597901963\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('4fea813224a0fe6fe3fb954cf5585f5429eae3a5', '37.107.87.193', 1597945789, '__ci_last_regenerate|i:1597945787;requested_page|s:13:\"shop/products\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('520027636ea0c6cb88133fb5961a2685662356c9', '110.93.207.170', 1597990460, '__ci_last_regenerate|i:1597990460;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"aDT7vZfhOjsKFkLNpeXn\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5ab052917c3bf0ffca02d71398162b430fa04657', '37.107.87.193', 1597945787, '__ci_last_regenerate|i:1597945787;requested_page|s:13:\"shop/products\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('5e431c399778789132db06c28315bf0b5d29d075', '182.191.85.135', 1597905796, '__ci_last_regenerate|i:1597905796;identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597832154\";last_ip|s:14:\"182.191.85.135\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('6322cccd54237183fc792e14dda7221dac125583', '110.93.207.211', 1597903056, '__ci_last_regenerate|i:1597903056;requested_page|s:14:\"admin/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597901963\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('687f38dba3ff0c2324df35fac3131b324300d030', '110.93.207.211', 1597987771, '__ci_last_regenerate|i:1597987771;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('77a56b09b9ee536890040a18f2008a35b53190ed', '110.93.207.211', 1597904207, '__ci_last_regenerate|i:1597904207;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597901963\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"evq7YQsd0DhrfSnzbigo\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('7f1844c9539de48ae352b4d07c5a4c39d23a1932', '182.191.85.135', 1597906115, '__ci_last_regenerate|i:1597906115;identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597832154\";last_ip|s:14:\"182.191.85.135\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";message|s:29:\"Settings successfully updated\";__ci_vars|a:1:{s:7:\"message\";s:3:\"old\";}');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('88c9389759d77ee399195629e78e5b678a6cd4c9', '110.93.207.170', 1597993534, '__ci_last_regenerate|i:1597993534;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"aDT7vZfhOjsKFkLNpeXn\";error|s:86:\"<p>The image you are attempting to upload doesn\'t fit into the allowed dimensions.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('89ac7f9c018af9f729edcd5222bf2ec2b2f7dab9', '110.93.207.170', 1597990028, '__ci_last_regenerate|i:1597990028;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"aDT7vZfhOjsKFkLNpeXn\";error|s:86:\"<p>The image you are attempting to upload doesn\'t fit into the allowed dimensions.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('89b4acd1ccf45572e000351c8e4452fbfa24e565', '110.93.207.211', 1597923623, '__ci_last_regenerate|i:1597923410;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597902491\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8ae16779ae5d834b8d531cce94daa85bf1342f72', '43.245.11.86', 1597941821, '__ci_last_regenerate|i:1597941821;requested_page|s:13:\"cart/checkout\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597923521\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1597934740;register_id|s:1:\"1\";cash_in_hand|s:7:\"90.0000\";register_open_time|s:19:\"2020-08-20 19:45:38\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('8dae561a8085984d4d788975ea67e49a809c5e20', '182.191.85.135', 1597903553, '__ci_last_regenerate|i:1597903553;identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597832154\";last_ip|s:14:\"182.191.85.135\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('936ad91b301e16855cd527245a6c4f5e8e3de134', '110.93.207.211', 1597904302, '__ci_last_regenerate|i:1597904207;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597901963\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"evq7YQsd0DhrfSnzbigo\";error|s:89:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>shop/products\";__ci_vars|a:1:{s:5:\"error\";s:3:\"old\";}');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9b7a50c89ad60fe6fb2622d8d291a3d9bbaa78f9', '43.245.11.86', 1597935182, '__ci_last_regenerate|i:1597935182;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597923521\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1597934740;register_id|s:1:\"1\";cash_in_hand|s:7:\"90.0000\";register_open_time|s:19:\"2020-08-20 19:45:38\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('9ff503e08bffe11647ec4e30f4d3ec38a1e858b3', '39.40.87.180', 1597941106, '__ci_last_regenerate|i:1597941067;requested_page|s:13:\"cart/checkout\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('a1a817102e24c350c82048eaa6016b9f6121e387', '37.107.87.193', 1597940540, '__ci_last_regenerate|i:1597940540;requested_page|s:13:\"shop/products\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('acc8a5e2cd29419a20c40c17004ca8e12d84c8b2', '192.185.23.174', 1597923488, '__ci_last_regenerate|i:1597923488;');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('afedcb4c82d2f4d2cd2362d8905c6a0550f8b6a4', '110.93.207.211', 1597901963, '__ci_last_regenerate|i:1597901963;requested_page|s:13:\"shop/products\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('aff67ababaa53dc4437e16ea2a433551ffa0fd6f', '51.253.99.186', 1597988637, '__ci_last_regenerate|i:1597988434;identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597984807\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('b38d4e0bfb7db2c7381c27e00347771bda812527', '192.185.23.174', 1597923474, '__ci_last_regenerate|i:1597923474;error|s:76:\"<h4>404 Not Found!</h4><p>The page you are looking for can not be found.</p>\";__ci_vars|a:1:{s:5:\"error\";s:3:\"new\";}');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('bc69c68d222783b19075545f25db51c02820cde5', '182.176.130.7', 1597858146, '__ci_last_regenerate|i:1597858138;requested_page|s:19:\"category/category-1\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('cc75c40d08e1573c8e7c94ff2b393e0221318ed6', '43.245.11.86', 1597935495, '__ci_last_regenerate|i:1597935495;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597923521\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1597934740;register_id|s:1:\"1\";cash_in_hand|s:7:\"90.0000\";register_open_time|s:19:\"2020-08-20 19:45:38\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('d0796fead46a68c3fa839e52089555e3af5caa30', '110.93.207.170', 1597994172, '__ci_last_regenerate|i:1597994172;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";user_csrf|s:20:\"aDT7vZfhOjsKFkLNpeXn\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('d2335ca214dd11fc7dd1c3422f0e80c78e6883b9', '43.245.11.86', 1597934843, '__ci_last_regenerate|i:1597934843;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597923521\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1597934740;register_id|s:1:\"1\";cash_in_hand|s:7:\"90.0000\";register_open_time|s:19:\"2020-08-20 19:45:38\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('d84bbec33fab73cf0c763eb10c862a9ca13e7f4e', '43.245.11.86', 1597941936, '__ci_last_regenerate|i:1597941821;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597923521\";last_ip|s:14:\"110.93.207.211\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1597934740;register_id|s:1:\"1\";cash_in_hand|s:7:\"90.0000\";register_open_time|s:19:\"2020-08-20 19:45:38\";csrfkey|s:8:\"RprjId27\";__ci_vars|a:2:{s:7:\"csrfkey\";s:3:\"old\";s:9:\"csrfvalue\";s:3:\"old\";}csrfvalue|s:20:\"acIHEFg2hWQXzZlVCnmU\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('ef671bd45ad2306e2764d466e1fc8071c5b3c71e', '110.93.207.211', 1597984955, '__ci_last_regenerate|i:1597984955;requested_page|s:13:\"shop/products\";identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597934533\";last_ip|s:12:\"43.245.11.86\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('efea0d78e7196088c0c21a3737e76d2383b67d27', '43.245.11.86', 1597937669, '__ci_last_regenerate|i:1597937669;');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f182388154ec32b68b46664d0ba26f962bfe36d2', '192.185.23.174', 1597923489, '__ci_last_regenerate|i:1597923489;');
INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES ('f97a63b7a08243d3df8b167d2c27f416795bdf44', '182.180.59.197', 1597906449, '__ci_last_regenerate|i:1597906449;identity|s:20:\"owner@techtrands.com\";username|s:5:\"owner\";email|s:20:\"owner@techtrands.com\";user_id|s:1:\"1\";old_last_login|s:10:\"1597832154\";last_ip|s:14:\"182.191.85.135\";avatar|N;gender|s:4:\"male\";group_id|s:1:\"1\";warehouse_id|N;view_right|s:1:\"0\";edit_right|s:1:\"0\";allow_discount|s:1:\"0\";biller_id|N;company_id|N;show_cost|s:1:\"0\";show_price|s:1:\"0\";last_activity|i:1597906142;');


#
# TABLE STRUCTURE FOR: sma_settings
#

DROP TABLE IF EXISTS `sma_settings`;

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint(4) DEFAULT NULL,
  `flag_chars` tinyint(4) DEFAULT NULL,
  `item_code_start` tinyint(4) DEFAULT NULL,
  `item_code_chars` tinyint(4) DEFAULT NULL,
  `price_start` tinyint(4) DEFAULT NULL,
  `price_chars` tinyint(4) DEFAULT NULL,
  `price_divide_by` int(11) DEFAULT NULL,
  `weight_start` tinyint(4) DEFAULT NULL,
  `weight_chars` tinyint(4) DEFAULT NULL,
  `weight_divide_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`, `use_code_for_slug`, `ws_barcode_type`, `ws_barcode_chars`, `flag_chars`, `item_code_start`, `item_code_chars`, `price_start`, `price_chars`, `price_divide_by`, `weight_start`, `weight_chars`, `weight_divide_by`) VALUES (1, 'logo2.png', 'logo3.png', 'Ecommerce', 'english', 1, 0, 'USD', 1, 10, '3.4.38', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'Asia/Karachi', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'contact@techtrands.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, 'j0nenvat0', 'bafd6ba3-5ad3-441a-a608-aab4c88ce0fd', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', 0, '-', 0, 1, 1, 'POP', 90, '', 0, 0, 'AN', 'dompdf', 0, 'weight', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


#
# TABLE STRUCTURE FOR: sma_shop_settings
#

DROP TABLE IF EXISTS `sma_shop_settings`;

CREATE TABLE `sma_shop_settings` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(55) NOT NULL,
  `description` varchar(160) NOT NULL,
  `warehouse` int(11) NOT NULL,
  `biller` int(11) NOT NULL,
  `about_link` varchar(55) NOT NULL,
  `terms_link` varchar(55) NOT NULL,
  `privacy_link` varchar(55) NOT NULL,
  `contact_link` varchar(55) NOT NULL,
  `payment_text` varchar(100) NOT NULL,
  `follow_text` varchar(100) NOT NULL,
  `facebook` varchar(55) NOT NULL,
  `twitter` varchar(55) DEFAULT NULL,
  `google_plus` varchar(55) DEFAULT NULL,
  `instagram` varchar(55) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `cookie_message` varchar(180) DEFAULT NULL,
  `cookie_link` varchar(55) DEFAULT NULL,
  `slider` text,
  `shipping` int(11) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.4.38',
  `logo` varchar(55) DEFAULT NULL,
  `bank_details` varchar(255) DEFAULT NULL,
  `products_page` tinyint(1) DEFAULT NULL,
  `hide0` tinyint(1) DEFAULT '0',
  `products_description` varchar(255) DEFAULT NULL,
  `private` tinyint(1) DEFAULT '0',
  `hide_price` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sma_shop_settings` (`shop_id`, `shop_name`, `description`, `warehouse`, `biller`, `about_link`, `terms_link`, `privacy_link`, `contact_link`, `payment_text`, `follow_text`, `facebook`, `twitter`, `google_plus`, `instagram`, `phone`, `email`, `cookie_message`, `cookie_link`, `slider`, `shipping`, `purchase_code`, `envato_username`, `version`, `logo`, `bank_details`, `products_page`, `hide0`, `products_description`, `private`, `hide_price`, `stripe`) VALUES (1, 'Ecommerce', 'Ecommerce - Shop that would help you to sell your products from your site.', 1, 3, '', '', '', '', 'We accept PayPal or you can pay with your credit/debit cards.', 'Please click the link below to follow us on social media.', 'http://facebook.com/techtrands', 'http://twitter.com/techtrands', '', '', '010 1234 567', 'info@techtrands.com', 'We use cookies to improve your experience on our website. By browsing this website, you agree to our use of cookies.', '', '[{\"image\":\"s1.jpg\",\"link\":\"http:\\/\\/ci.dev\\/sma\\/shop\\/products\",\"caption\":\"\"},{\"image\":\"s2.jpg\",\"link\":\"\",\"caption\":\"\"},{\"image\":\"s3.jpg\",\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"},{\"link\":\"\",\"caption\":\"\"}]', 0, '', 'envato_username', '3.4.38', 'sma-shop.png', '', 0, 0, 'techtrands', 0, 0, 0);


#
# TABLE STRUCTURE FOR: sma_skrill
#

DROP TABLE IF EXISTS `sma_skrill`;

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES (1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');


#
# TABLE STRUCTURE FOR: sma_sms_settings
#

DROP TABLE IF EXISTS `sma_sms_settings`;

CREATE TABLE `sma_sms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auto_send` tinyint(1) DEFAULT NULL,
  `config` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_sms_settings` (`id`, `auto_send`, `config`) VALUES (1, NULL, '{\"gateway\":\"Log\",\"Log\":{}');


#
# TABLE STRUCTURE FOR: sma_stock_count_items
#

DROP TABLE IF EXISTS `sma_stock_count_items`;

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_count_id` (`stock_count_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_stock_counts
#

DROP TABLE IF EXISTS `sma_stock_counts`;

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_suspended_bills
#

DROP TABLE IF EXISTS `sma_suspended_bills`;

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_suspended_items
#

DROP TABLE IF EXISTS `sma_suspended_items`;

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspend_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_tax_rates
#

DROP TABLE IF EXISTS `sma_tax_rates`;

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES (1, 'No Tax', 'NT', '0.0000', '2');
INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES (2, 'VAT @10%', 'VAT10', '10.0000', '1');
INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES (3, 'GST @6%', 'GST', '6.0000', '1');
INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES (4, 'VAT @20%', 'VT20', '20.0000', '1');


#
# TABLE STRUCTURE FOR: sma_transfer_items
#

DROP TABLE IF EXISTS `sma_transfer_items`;

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_transfers
#

DROP TABLE IF EXISTS `sma_transfers`;

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_units
#

DROP TABLE IF EXISTS `sma_units`;

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_unit` (`base_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES (1, 'Pc', 'Pc', NULL, NULL, NULL, NULL);


#
# TABLE STRUCTURE FOR: sma_user_logins
#

DROP TABLE IF EXISTS `sma_user_logins`;

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES (1, 1, NULL, '182.191.85.135', 'owner@tecdiary.com', '2020-08-19 05:13:23');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES (2, 1, NULL, '182.191.85.135', 'owner@techtrands.com', '2020-08-19 05:15:54');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES (3, 1, NULL, '182.180.59.197', 'owner@techtrands.com', '2020-08-20 00:29:39');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES (4, 1, NULL, '110.93.207.211', 'owner@techtrands.com', '2020-08-20 00:39:23');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES (5, 1, NULL, '110.93.207.211', 'owner@techtrands.com', '2020-08-20 00:48:11');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES (6, 1, NULL, '110.93.207.211', 'owner@techtrands.com', '2020-08-20 06:38:41');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES (7, 1, NULL, '43.245.11.86', 'owner@techtrands.com', '2020-08-20 09:42:13');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES (8, 1, NULL, '110.93.207.211', 'owner@techtrands.com', '2020-08-20 23:40:07');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES (9, 1, NULL, '51.253.99.186', 'owner@techtrands.com', '2020-08-21 00:41:21');


#
# TABLE STRUCTURE FOR: sma_users
#

DROP TABLE IF EXISTS `sma_users`;

CREATE TABLE `sma_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `warehouse_id` int(10) unsigned DEFAULT NULL,
  `biller_id` int(10) unsigned DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  KEY `group_id_2` (`group_id`,`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES (1, '51.253.99.186', '\0\0', 'owner', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'owner@techtrands.com', NULL, NULL, NULL, NULL, 1351661704, 1597988481, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0);


#
# TABLE STRUCTURE FOR: sma_variants
#

DROP TABLE IF EXISTS `sma_variants`;

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_warehouses
#

DROP TABLE IF EXISTS `sma_warehouses`;

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES (1, 'WHI', 'Warehouse 1', '<p>Address, City</p>', NULL, '012345678', 'whi@tecdiary.com', NULL);
INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES (2, 'WHII', 'Warehouse 2', '<p>Warehouse 2, Jalan Sultan Ismail, 54000, Kuala Lumpur</p>', NULL, '0105292122', 'whii@tecdiary.com', NULL);


#
# TABLE STRUCTURE FOR: sma_warehouses_products
#

DROP TABLE IF EXISTS `sma_warehouses_products`;

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (1, 1, 1, '90.0000', NULL, '100.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (2, 1, 2, '0.0000', NULL, '100.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (3, 2, 1, '50.0000', NULL, '400.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (4, 2, 2, '0.0000', NULL, '400.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (5, 3, 1, '0.0000', NULL, '500.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (6, 3, 2, '0.0000', NULL, '500.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (7, 4, 1, '0.0000', NULL, '350.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (8, 4, 2, '0.0000', NULL, '350.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (9, 5, 1, '0.0000', NULL, '560.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (10, 5, 2, '0.0000', NULL, '560.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (11, 6, 1, '0.0000', NULL, '11.0000');
INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES (12, 6, 2, '0.0000', NULL, '11.0000');


#
# TABLE STRUCTURE FOR: sma_warehouses_products_variants
#

DROP TABLE IF EXISTS `sma_warehouses_products_variants`;

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_id` (`option_id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: sma_wishlist
#

DROP TABLE IF EXISTS `sma_wishlist`;

CREATE TABLE `sma_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

