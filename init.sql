/*
 Navicat Premium Data Transfer

 Source Server         : HoviDB
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3307
 Source Schema         : HoviDB

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 23/12/2019 14:27:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_bank_account
-- ----------------------------
DROP TABLE IF EXISTS `admin_bank_account`;
CREATE TABLE `admin_bank_account` (
  `account_id` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Id of the account',
  `bank` varchar(255) DEFAULT NULL COMMENT 'Bank name of the account',
  `account_number` varchar(255) DEFAULT NULL COMMENT 'Account number of the account',
  `holder_name` varchar(255) DEFAULT NULL COMMENT 'Name of the account holder',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_bank_account
-- ----------------------------
BEGIN;
INSERT INTO `admin_bank_account` VALUES (1, 'TPBank', '02725034001', 'NGUYEN VAN HOANG', '2019-11-19 18:10:10.953832', '2019-11-19 18:10:21.756397');
INSERT INTO `admin_bank_account` VALUES (2, 'BIDV', '35110000383727', 'HOANG LE THANH SON', '2019-11-19 18:10:10.953832', '2019-11-19 18:10:26.275560');
COMMIT;

-- ----------------------------
-- Table structure for amenities
-- ----------------------------
DROP TABLE IF EXISTS `amenities`;
CREATE TABLE `amenities` (
  `amenities_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of amenities',
  `icon_id` varchar(50) DEFAULT NULL COMMENT 'id of icon show UI',
  `usable_name` varchar(255) DEFAULT NULL COMMENT 'Name of amenities when usable',
  `unusable_name` varchar(255) DEFAULT NULL COMMENT 'Name of amenities when unusable',
  `description` text COMMENT 'Description for amenities',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`amenities_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of amenities
-- ----------------------------
BEGIN;
INSERT INTO `amenities` VALUES (1, '1', 'Không chung chủ', 'Chung chủ', 'tự do khu nhà ở', '2019-10-23 12:18:55.952131', '2019-10-23 12:18:55.952131');
INSERT INTO `amenities` VALUES (2, '2', 'Khép kín', 'Chung phòng tắm', 'Khu vực ở có khép kín hay k?', '2019-10-23 12:18:56.705670', '2019-10-23 12:18:56.705670');
INSERT INTO `amenities` VALUES (3, '3', 'Ban công', '', 'Ban công phòng', '2019-10-23 12:18:57.511849', '2019-10-23 12:18:57.511849');
INSERT INTO `amenities` VALUES (4, '4', 'Thang máy', '', '', '2019-10-23 12:18:58.256340', '2019-10-23 12:18:58.256340');
INSERT INTO `amenities` VALUES (5, '5', 'Nuôi thú cưng', '', '', '2019-10-23 12:18:58.982570', '2019-10-23 12:18:58.982570');
INSERT INTO `amenities` VALUES (6, '6', 'Nấu ăn', '', NULL, '2019-10-23 12:18:59.684756', '2019-10-23 12:18:59.684756');
INSERT INTO `amenities` VALUES (7, '7', 'Điều hòa', '', NULL, '2019-10-23 12:19:00.887824', '2019-10-23 12:19:00.887824');
INSERT INTO `amenities` VALUES (8, '8', 'Bình nóng lạnh', '', NULL, '2019-10-23 12:19:01.625316', '2019-10-23 12:19:01.625316');
INSERT INTO `amenities` VALUES (9, '9', 'Giường', '', NULL, '2019-10-23 12:19:02.765866', '2019-10-23 12:19:02.765866');
INSERT INTO `amenities` VALUES (10, '10', 'Tủ', '', NULL, '2019-10-23 12:19:04.547522', '2019-10-23 12:19:04.547522');
INSERT INTO `amenities` VALUES (11, '11', 'Bàn ghế', '', NULL, '2019-10-23 12:19:05.396939', '2019-10-23 12:19:05.396939');
COMMIT;

-- ----------------------------
-- Table structure for bank_transfer_history
-- ----------------------------
DROP TABLE IF EXISTS `bank_transfer_history`;
CREATE TABLE `bank_transfer_history` (
  `transfer_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID of the bank transferation',
  `sender_user_id` int(5) DEFAULT NULL COMMENT 'Sender user id',
  `sender_bank` varchar(255) DEFAULT NULL COMMENT 'Bank of sender',
  `sender_account_number` varchar(255) DEFAULT NULL COMMENT 'Sender account number',
  `sender_user_type` tinyint(1) DEFAULT NULL COMMENT 'Sender user type',
  `receiver_user_id` int(5) DEFAULT NULL COMMENT 'Receiver user id',
  `receiver_bank` varchar(255) DEFAULT NULL COMMENT 'Bank of receiver',
  `receiver_account_number` varchar(255) DEFAULT NULL COMMENT 'Receiver account number',
  `receiver_user_type` tinyint(1) DEFAULT NULL COMMENT 'Receiver user type',
  `transfer_time` timestamp(6) NULL DEFAULT NULL COMMENT 'Time of transferation',
  `money_amount` double(10,0) DEFAULT NULL COMMENT 'Money amount of the transfer',
  `transfer_code` varchar(255) DEFAULT NULL COMMENT 'Code of transfer',
  `transfer_note` varchar(255) DEFAULT NULL COMMENT 'Note of transfer',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`transfer_id`) USING BTREE,
  KEY `FK_user_bank_transfer_history-sender_id` (`sender_user_id`) USING BTREE,
  KEY `FK_user_bank_transfer_history-receiver_id` (`receiver_user_id`) USING BTREE,
  CONSTRAINT `FK_user_bank_transfer_history-receiver_id` FOREIGN KEY (`receiver_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_user_bank_transfer_history-sender_id` FOREIGN KEY (`sender_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building` (
  `building_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of building',
  `building_name` varchar(255) DEFAULT NULL COMMENT 'name of the building',
  `building_type_id` int(2) DEFAULT NULL COMMENT 'ID of building type',
  `host_id` int(11) DEFAULT NULL COMMENT 'ID of host of building',
  `province` varchar(255) DEFAULT 'default value' COMMENT 'Province of the building',
  `district` varchar(255) DEFAULT NULL COMMENT 'District of the building',
  `ward` varchar(255) DEFAULT NULL COMMENT 'Ward of the building',
  `detailed_address` varchar(255) DEFAULT NULL COMMENT 'Detailed address of the building',
  `address_description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL COMMENT 'Location of the building',
  `floor_quantity` int(2) DEFAULT '1' COMMENT 'Number of floors in the building',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`building_id`) USING BTREE,
  KEY `FK_room_type_building` (`building_type_id`) USING BTREE,
  KEY `FK_user_building` (`host_id`) USING BTREE,
  CONSTRAINT `FK_type_building` FOREIGN KEY (`building_type_id`) REFERENCES `building_type` (`type_id`),
  CONSTRAINT `FK_user_building` FOREIGN KEY (`host_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for building_service
-- ----------------------------
DROP TABLE IF EXISTS `building_service`;
CREATE TABLE `building_service` (
  `building_id` int(5) NOT NULL COMMENT 'ID of the building',
  `service_id` int(5) NOT NULL COMMENT 'ID of the service in the building',
  `service_price` double(10,0) DEFAULT NULL COMMENT 'Price of service',
  `note` text COMMENT 'Note for building service',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`building_id`,`service_id`) USING BTREE,
  KEY `FK_service` (`service_id`) USING BTREE,
  CONSTRAINT `FK_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`),
  CONSTRAINT `FK_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for building_type
-- ----------------------------
DROP TABLE IF EXISTS `building_type`;
CREATE TABLE `building_type` (
  `type_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the room type',
  `building_type` varchar(255) DEFAULT NULL COMMENT 'Name of the type',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time ',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of building_type
-- ----------------------------
BEGIN;
INSERT INTO `building_type` VALUES (1, 'Căn hộ chung cư', '2019-10-17 04:26:20.980356', '2019-10-17 04:26:20.980356');
INSERT INTO `building_type` VALUES (2, 'Nhà nguyên căn', '2019-10-17 04:26:19.703176', '2019-10-17 04:26:19.703176');
INSERT INTO `building_type` VALUES (3, 'Khu nhà trọ', '2019-10-17 04:26:14.933942', '2019-10-17 04:26:14.933942');
COMMIT;

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `feedback_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the feedback',
  `user_id` int(5) DEFAULT NULL COMMENT 'ID of user who sends the feedback',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email of the user who sends feedback',
  `content` text NOT NULL COMMENT 'Content of the feedback',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`feedback_id`) USING BTREE,
  KEY `FK_user_feedback` (`user_id`) USING BTREE,
  CONSTRAINT `FK_user_feedback` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for host_review
-- ----------------------------
DROP TABLE IF EXISTS `host_review`;
CREATE TABLE `host_review` (
  `review_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the review',
  `host_id` int(5) DEFAULT NULL COMMENT 'ID of the host who sends the review',
  `tenant_id` int(5) DEFAULT NULL COMMENT 'ID of targeted tenant of the review',
  `comment` text COMMENT 'Content of the comment',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`review_id`) USING BTREE,
  KEY `FK_user_host` (`host_id`) USING BTREE,
  KEY `FK_user_tenant` (`tenant_id`) USING BTREE,
  CONSTRAINT `FK_user_host` FOREIGN KEY (`host_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_user_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for reported_room
-- ----------------------------
DROP TABLE IF EXISTS `reported_room`;
CREATE TABLE `reported_room` (
  `report_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Id of the report',
  `user_id` int(5) NOT NULL COMMENT 'ID of user who sends the report',
  `room_group_id` int(5) NOT NULL COMMENT 'ID of reported room group',
  `report_content` text COMMENT 'Content of the report',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`report_id`) USING BTREE,
  KEY `FK_room_report` (`room_group_id`) USING BTREE,
  KEY `FK_user_report` (`user_id`) USING BTREE,
  CONSTRAINT `FK_roomGroup_report` FOREIGN KEY (`room_group_id`) REFERENCES `room_group` (`room_group_id`),
  CONSTRAINT `FK_user_report` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the room',
  `room_group_id` int(5) NOT NULL COMMENT 'ID of group that room belongs to',
  `room_name` text COMMENT 'name of the room',
  `room_status` tinyint(2) DEFAULT NULL COMMENT 'Room status code',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`room_id`) USING BTREE,
  KEY `FK_room_group` (`room_group_id`) USING BTREE,
  CONSTRAINT `FK_room_group` FOREIGN KEY (`room_group_id`) REFERENCES `room_group` (`room_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for room_amenities
-- ----------------------------
DROP TABLE IF EXISTS `room_amenities`;
CREATE TABLE `room_amenities` (
  `room_group_id` int(5) NOT NULL COMMENT 'ID of the room group',
  `amenities_id` int(5) NOT NULL COMMENT 'ID of amenities in the room group',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`room_group_id`,`amenities_id`) USING BTREE,
  KEY `FK_Amenities-Room_Amenities` (`amenities_id`) USING BTREE,
  CONSTRAINT `FK_Amenities-Room_Amenities` FOREIGN KEY (`amenities_id`) REFERENCES `amenities` (`amenities_id`),
  CONSTRAINT `FK_Room-Room_Amenities` FOREIGN KEY (`room_group_id`) REFERENCES `room_group` (`room_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for room_group
-- ----------------------------
DROP TABLE IF EXISTS `room_group`;
CREATE TABLE `room_group` (
  `room_group_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the room group',
  `building_id` int(5) DEFAULT NULL COMMENT 'ID of the building that the group belongs to',
  `gender` tinyint(1) DEFAULT '2' COMMENT 'Gender in the group',
  `rent_price` double(10,0) DEFAULT NULL COMMENT 'Rent price of the room group',
  `min_deposit_period` int(5) DEFAULT '1' COMMENT 'minimun months of deposit',
  `area` double(10,0) DEFAULT NULL COMMENT 'Area of the room group',
  `bedroom_quantity` int(5) DEFAULT '1' COMMENT 'Number of  bedrooms in the building',
  `bathroom_quantity` int(5) DEFAULT '1' COMMENT 'Number of bathrooms in the building',
  `direction` varchar(255) DEFAULT NULL COMMENT 'direction of the room',
  `is_available` tinyint(1) DEFAULT '1' COMMENT 'The group is available or not',
  `deposit_price` double(10,0) DEFAULT NULL COMMENT 'Deposit price of the room group',
  `description` text COMMENT 'Description of the room group',
  `capacity` int(10) DEFAULT '1' COMMENT 'Capacity of the room group',
  `view_amount` int(10) DEFAULT '0' COMMENT 'View amount of the room group',
  `phone_view_amount` int(10) DEFAULT '0' COMMENT 'View via phone amount of the room group',
  `is_sponsored` bit(1) DEFAULT b'0' COMMENT 'The room group is sponsored or not',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`room_group_id`) USING BTREE,
  KEY `FK_room_group_building` (`building_id`) USING BTREE,
  CONSTRAINT `FK_room_group_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for room_image
-- ----------------------------
DROP TABLE IF EXISTS `room_image`;
CREATE TABLE `room_image` (
  `image_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the image',
  `image_url` text COMMENT 'URL of the image',
  `room_group_id` int(2) DEFAULT NULL COMMENT 'ID of room group of image',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`image_id`) USING BTREE,
  KEY `FK_roomGroup_image` (`room_group_id`) USING BTREE,
  CONSTRAINT `FK_roomGroup_image` FOREIGN KEY (`room_group_id`) REFERENCES `room_group` (`room_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for saved_room
-- ----------------------------
DROP TABLE IF EXISTS `saved_room`;
CREATE TABLE `saved_room` (
  `user_id` int(5) NOT NULL COMMENT 'ID of the user who saved the room',
  `room_group_id` int(5) NOT NULL COMMENT 'ID of the saved room group',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`user_id`,`room_group_id`) USING BTREE,
  KEY `FK_room_group_saved_room` (`room_group_id`) USING BTREE,
  CONSTRAINT `FK_room_group_saved_room` FOREIGN KEY (`room_group_id`) REFERENCES `room_group` (`room_group_id`),
  CONSTRAINT `FK_user_saved_room` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `service_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the service',
  `icon_id` varchar(50) DEFAULT NULL,
  `service_name` varchar(255) DEFAULT NULL COMMENT 'Name of the service',
  `description` text COMMENT 'Description of the service',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`service_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of service
-- ----------------------------
BEGIN;
INSERT INTO `service` VALUES (1, '1', 'Wifi', 'Internet access', '2019-10-23 12:18:47.727281', '2019-10-23 12:18:47.727281');
INSERT INTO `service` VALUES (2, '2', 'Điện', 'Giá điện', '2019-10-23 12:18:48.405884', '2019-10-23 12:18:48.405884');
INSERT INTO `service` VALUES (3, '3', 'Nước', 'Giá nước', '2019-10-23 12:18:49.143173', '2019-10-23 12:18:49.143173');
INSERT INTO `service` VALUES (4, '4', 'Bảo vệ', 'Bảo vệ vật tư', '2019-10-23 12:18:50.165008', '2019-10-23 12:18:50.165008');
INSERT INTO `service` VALUES (5, '5', 'Giặt đồ', 'Giặt quần áo', '2019-10-23 12:18:50.828194', '2019-10-23 12:18:50.828194');
INSERT INTO `service` VALUES (6, '6', 'Trông xe', 'Trông xe tại nhà', '2019-10-23 12:18:51.756663', '2019-10-23 12:18:51.756663');
INSERT INTO `service` VALUES (7, '7', 'Dọn vệ sinh', 'Dịch vụ dọn vệ sinh tận phòng', '2019-10-23 12:18:52.902631', '2019-10-23 12:18:52.902631');
COMMIT;

-- ----------------------------
-- Table structure for system_information
-- ----------------------------
DROP TABLE IF EXISTS `system_information`;
CREATE TABLE `system_information` (
  `info_id` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Id of the information',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title of the information',
  `content` text COMMENT 'Content of the information',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_information
-- ----------------------------
BEGIN;
INSERT INTO `system_information` VALUES (1, 'web_title', 'HomoHouse', '2019-11-24 13:47:24.099984', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tenant_review
-- ----------------------------
DROP TABLE IF EXISTS `tenant_review`;
CREATE TABLE `tenant_review` (
  `review_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the review',
  `user_id` int(5) NOT NULL COMMENT 'ID of user who sends the review',
  `room_group_id` int(5) NOT NULL COMMENT 'ID of reviewed room group',
  `comment` text COMMENT 'Content of the review',
  `accuracy_star` int(2) DEFAULT NULL COMMENT 'Rating stars for accuracy',
  `host_star` int(2) DEFAULT NULL COMMENT 'Rating stars for hosting',
  `security_star` int(2) DEFAULT NULL COMMENT 'Rating stars for security',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`review_id`) USING BTREE,
  KEY `FK_user_tenant_review` (`user_id`) USING BTREE,
  KEY `FK_room_group_review` (`room_group_id`) USING BTREE,
  CONSTRAINT `FK_room_group_review` FOREIGN KEY (`room_group_id`) REFERENCES `room_group` (`room_group_id`),
  CONSTRAINT `FK_user_tenant_review` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `transaction_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the transaction',
  `user_id` int(5) NOT NULL COMMENT 'ID of the user who make the transaction',
  `room_id` int(5) NOT NULL COMMENT 'ID of room in the transaction',
  `start_date` timestamp(6) NULL DEFAULT NULL COMMENT 'Start date of the transaction',
  `transaction_status` tinyint(1) DEFAULT NULL COMMENT 'Status code of the transaction',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`transaction_id`) USING BTREE,
  KEY `FK_User_Transaction` (`user_id`) USING BTREE,
  KEY `FK_Room_Transaction` (`room_id`) USING BTREE,
  CONSTRAINT `FK_Room_Transaction` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `FK_User_Transaction` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID of the user',
  `first_name` varchar(255) DEFAULT NULL COMMENT 'First name of the user',
  `last_name` varchar(255) DEFAULT NULL COMMENT 'Last name of the user',
  `phone_number` varchar(20) DEFAULT NULL COMMENT 'Phone number of the user',
  `password` varchar(255) DEFAULT NULL COMMENT 'Password of user',
  `role_admin` varchar(255) DEFAULT NULL COMMENT 'Role of account login admin page',
  `gender` tinyint(1) DEFAULT NULL COMMENT 'Gender of the user',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email of the user',
  `avatar` text COMMENT 'Avatar URL of the user',
  `address` text COMMENT 'Address of the user',
  `bank_account_number` varchar(255) DEFAULT NULL COMMENT 'Bank account number of user',
  `bank_name` varchar(255) DEFAULT NULL COMMENT 'Bank name of user',
  `selfie_image` text COMMENT 'Image of user selfie',
  `id_card_back` text COMMENT 'Image of back side of ID card',
  `id_card_front` text COMMENT 'Image of front side of ID card',
  `is_email_verified` tinyint(1) DEFAULT '0' COMMENT 'User email is verifid or not',
  `is_phone_number_verified` tinyint(1) DEFAULT '0' COMMENT 'User phone number is verifid or not',
  `is_selfie_verified` tinyint(1) DEFAULT '0' COMMENT 'User selfie image is verified or not',
  `is_government_id_verified` tinyint(1) DEFAULT '0' COMMENT 'User government id card is verified or not',
  `is_active` tinyint(1) DEFAULT '1' COMMENT 'User is active or not',
  `balance` double(20,0) unsigned DEFAULT '0' COMMENT 'Balance of user in system',
  `created_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'Record create time',
  `updated_at` timestamp(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6) COMMENT 'Record update time',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'Nguyễn Như', 'Thưởng', '+84986352227', '$2a$08$eLWhjIpUj1juaDDwksF9IOX3TW3qC4DgQ5ai9XfAtRbQq9I5cPnze', 'admin', 2, 'thuongnn1997@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/hovi-dev.appspot.com/o/default_avatar.png?alt=media&token=ac1a882c-c8ad-47c2-9c2d-f85ab0c1d79b', 'not yet', NULL, NULL, NULL, 'https://storage.googleapis.com/room_images_bucket/user-idCardBack-1-rc-upload-1577041300347-4', 'https://storage.googleapis.com/room_images_bucket/user-idCardFront-1-rc-upload-1577033442319-15', 0, 1, 0, 0, 1, 1000000, '2019-12-11 17:23:33.715182', '2019-12-23 02:02:20.078174');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
