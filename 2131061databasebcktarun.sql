-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tarunkumar_2131061
CREATE DATABASE IF NOT EXISTS `tarunkumar_2131061` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `tarunkumar_2131061`;

-- Dumping structure for table tarunkumar_2131061.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `customers_id` char(36) NOT NULL DEFAULT uuid(),
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `address` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `province` varchar(25) NOT NULL,
  `postal_code` varchar(7) NOT NULL,
  `username` varchar(15) NOT NULL,
  `passsword` varchar(255) NOT NULL,
  `picture` blob NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`customers_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table tarunkumar_2131061.customers: ~7 rows (approximately)
INSERT INTO `customers` (`customers_id`, `first_name`, `last_name`, `address`, `city`, `province`, `postal_code`, `username`, `passsword`, `picture`, `created_at`, `updated_at`) VALUES
	('', 'alex ', 'jones', 'ssss', 'ssss', 'ssss', 'ssss', 'sss1', '', _binary '', '2022-12-16 19:30:33', '2022-12-16 19:30:33'),
	('1000', 'tarry ', 'jons', 'ssss', 'ssss', 'ssss', 'ssss', 'username123', '', _binary '', '2022-12-16 19:32:22', '2022-12-16 19:32:22'),
	('111', 'Jack', 'Rolls', 'India', 'TN', 'FF', 'HHJ', 'Jacky', '444', _binary '', '2022-12-05 19:06:39', '2022-12-05 19:07:14'),
	('221', 'Tarun', 'Kumar', 'Montreal', 'MontrealNord', 'QC', 'HHH333', 'taru', '123', _binary '', '2022-12-05 18:18:53', '2022-12-05 18:19:06'),
	('223', 'John', 'Doe', 'Melbourne', 'Melb', 'SD', 'GGGT23', 'Jhonny', '333', _binary '', '2022-12-05 18:19:58', '2022-12-05 18:19:58'),
	('444', 'Shelly', 'Minding', 'Singapore', 'Singa', 'SR', 'HHHYYY', 'Shel', '777', _binary '', '2022-12-05 18:20:51', '2022-12-05 18:20:51'),
	('dc0c4613-7d7e-11ed-9ecf-70a6ccf828f1', 'Testingtar', '', '', '', '', '', '', '', _binary '', '2022-12-16 15:18:39', '2022-12-16 15:18:39'),
	('uuid()', 'Jenny', 'James', 'India', 'RT', 'HH', 'IO', 'HHU', '78', _binary '', '2022-12-06 20:26:32', '2022-12-06 20:26:32');

-- Dumping structure for procedure tarunkumar_2131061.customers_delete
DELIMITER //
CREATE PROCEDURE `customers_delete`(
	IN `p_customer_id` INT
)
BEGIN
 
 #deleting a customer of a customer id provided
DELETE FROM customers
WHERE customers_id = p_customer_id;

END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.customers_insert
DELIMITER //
CREATE PROCEDURE `customers_insert`(
	IN `p_customers_id` CHAR(36),
	IN `p_first_name` VARCHAR(50),
	IN `p_last_name` VARCHAR(50),
	IN `p_address` VARCHAR(50),
	IN `p_city` VARCHAR(50),
	IN `p_province` VARCHAR(50),
	IN `p_postal_code` VARCHAR(50),
	IN `p_username` VARCHAR(50),
	IN `p_password` VARCHAR(50)
)
BEGIN

#inserting data into the table schema
INSERT INTO customers
            (customers_id, first_name, last_name, address, 
				city, province, postal_code, username)
				
VALUES      (p_customers_id, p_first_name, p_last_name, p_address,
				 p_city, p_province, p_postal_code, p_username);


END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.customers_show_all
DELIMITER //
CREATE PROCEDURE `customers_show_all`()
BEGIN

#showing the data from all table fields
SELECT customers_id, first_name, last_name, address, 
				city, province, postal_code, username, passsword, picture
      FROM customers
		ORDER BY customers_id DESC;

END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.customers_show_one
DELIMITER //
CREATE PROCEDURE `customers_show_one`()
BEGIN

#showing only one column specified by a  parameter
 SELECT customers_id, first_name, last_name, address, 
		city, province, postal_code, username, passsword, picture
         FROM customers
         WHERE
         username = "taru" ;

END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.customers_update
DELIMITER //
CREATE PROCEDURE `customers_update`(
	IN `p_customers_id` CHAR(36),
	IN `p_first_name` VARCHAR(50),
	IN `p_last_name` VARCHAR(50),
	IN `p_address` VARCHAR(50),
	IN `p_city` VARCHAR(50),
	IN `p_province` VARCHAR(50),
	IN `p_postal_code` VARCHAR(50),
	IN `p_username` VARCHAR(50),
	IN `p_password` VARCHAR(50)
)
BEGIN

#updating the data pre-existing inside the table
UPDATE customers
        SET     customers_id = p_customers_id, first_name = p_first_name, 
		          last_name = p_last_name, address = p_address , 
				    city = p_city , province = p_province, postal_code = p_postal_code,
				    username = p_username, passsword = p_password

				 WHERE customers_id = p_customers_id;


END//
DELIMITER ;

-- Dumping structure for table tarunkumar_2131061.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` char(36) NOT NULL DEFAULT uuid(),
  `customer_id` char(36) NOT NULL DEFAULT '',
  `product_id` char(36) NOT NULL DEFAULT '',
  `quantity` int(11) NOT NULL,
  `sold_price` decimal(20,6) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `created_at_order` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at_order` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`orders_id`) USING BTREE,
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`,`customer_id`) USING BTREE,
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customers_id`),
  CONSTRAINT `fk_orders_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table tarunkumar_2131061.orders: ~3 rows (approximately)
INSERT INTO `orders` (`orders_id`, `customer_id`, `product_id`, `quantity`, `sold_price`, `comments`, `created_at_order`, `updated_at_order`) VALUES
	('111', '444', '333', 788, 45646.000000, 'gghh', '2022-12-05 18:22:59', '2022-12-05 19:05:27'),
	('447', '223', '333', 68, 33.000000, 'ggg', '2022-12-05 18:22:22', '2022-12-05 18:22:22'),
	('5ca9ac69-75d0-11ed-a', '111', 'b9fbe31d-75ce-11ed-a', 99, 99.000000, 'TESTTEST', '2022-12-06 20:42:01', '2022-12-06 20:42:01');

-- Dumping structure for procedure tarunkumar_2131061.orders_delete
DELIMITER //
CREATE PROCEDURE `orders_delete`(
	IN `p_order_id` INT
)
BEGIN

#deleting an order of a customer id provided
DELETE FROM orders
WHERE orders_id = p_order_id;

END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.orders_insert
DELIMITER //
CREATE PROCEDURE `orders_insert`(
	IN `p_orders_id` CHAR(36),
	IN `p_customer_id` CHAR(36),
	IN `p_product_id` CHAR(36),
	IN `p_quantity` INT,
	IN `p_sold_price` DECIMAL(20,6),
	IN `p_comments` VARCHAR(255)
)
BEGIN

#inserting data into the table schema
INSERT INTO orders
            (orders_id, customer_id, product_id, quantity, 
				sold_price, comments)
				
VALUES      (p_orders_id, p_customer_id, p_product_id, p_quantity,
				 p_sold_price, p_comments);
END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.orders_show_all
DELIMITER //
CREATE PROCEDURE `orders_show_all`()
BEGIN

#showing the data from all table fields
SELECT orders_id, customer_id, product_id, quantity, sold_price, 
      comments, created_at_order, updated_at_order 
      FROM orders
		ORDER BY quantity DESC;
      

END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.orders_show_one
DELIMITER //
CREATE PROCEDURE `orders_show_one`()
BEGIN

#showing only one column specified by a  parameter
 SELECT orders_id, customer_id, product_id, quantity, sold_price, 
         comments, created_at_order, updated_at_order 
         FROM orders 
         WHERE
         quantity = 68;

END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.orders_update
DELIMITER //
CREATE PROCEDURE `orders_update`(
	IN `p_orders_id` CHAR(36),
	IN `p_customer_id` CHAR(36),
	IN `p_product_id` CHAR(36),
	IN `p_quantity` INT(11),
	IN `p_sold_price` DECIMAL(20,6),
	IN `p_comments` VARCHAR(255)
)
BEGIN

#updating the data pre-existing inside the table
UPDATE orders
        SET     customer_id = p_customer_id, product_id = p_product_id,
		          quantity = p_quantity, 
				sold_price = p_sold_price, comments =p_comments
				

				 WHERE orders_id = P_orders_id;

END//
DELIMITER ;

-- Dumping structure for table tarunkumar_2131061.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` char(36) NOT NULL DEFAULT uuid(),
  `product_code` varchar(12) NOT NULL,
  `p_description` varchar(100) NOT NULL,
  `retail_price` decimal(20,6) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`product_id`) USING BTREE,
  CONSTRAINT `max_cost_price` CHECK (`retail_price` <= 10000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table tarunkumar_2131061.products: ~6 rows (approximately)
INSERT INTO `products` (`product_id`, `product_code`, `p_description`, `retail_price`, `created_at`, `updated_at`) VALUES
	('', '6699', 'jio', 8.000000, '2022-12-16 18:14:40', '2022-12-16 18:14:40'),
	('111', '9090', 'jhgj', 675.000000, '2022-12-05 19:06:23', '2022-12-06 20:29:32'),
	('333', '666', 'hgjh', 777.000000, '2022-11-29 16:48:35', '2022-11-29 17:05:21'),
	('678', '556', 'vfty', 66.000000, '2022-12-05 18:23:48', '2022-12-05 18:23:48'),
	('890f34f8-7d7e-11ed-9ecf-70a6ccf828f1', '99999', 'newprod', 456.000000, '2022-12-16 15:16:20', '2022-12-16 15:16:20'),
	('b9fbe31d-75ce-11ed-a', '3333', 'DEFEDFDF', 3434.000000, '2022-12-06 20:30:18', '2022-12-06 20:30:18');

-- Dumping structure for procedure tarunkumar_2131061.product_delete
DELIMITER //
CREATE PROCEDURE `product_delete`(
	IN `p_product_id` INT
)
BEGIN

#deleting a customer of a customer id provided
DELETE FROM products
WHERE product_id = p_product_id;

END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.product_insert
DELIMITER //
CREATE PROCEDURE `product_insert`(
	IN `p_product_id` CHAR(36),
	IN `p_product_code` VARCHAR(50),
	IN `p_p_description` VARCHAR(50),
	IN `p_retail_price` DECIMAL(20,6)
)
BEGIN

#inserting data into the table schema
INSERT INTO products
            (product_id, product_code, p_description, retail_price)
				
VALUES      (p_product_id, p_product_code, p_p_description, p_retail_price);




END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.product_show_all
DELIMITER //
CREATE PROCEDURE `product_show_all`(
	IN `p_product_id` CHAR(36),
	IN `p_product_code` VARCHAR(50),
	IN `p_p_description` VARCHAR(50),
	IN `p_retail_price` DECIMAL(20,6)
)
BEGIN

#showing the data from all table fields
SELECT product_id, product_code, p_description, retail_price
      FROM products
		ORDER BY product_code DESC;



END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.product_show_one
DELIMITER //
CREATE PROCEDURE `product_show_one`()
BEGIN

#showing only one column specified by a  parameter
 SELECT product_id, product_code, p_description, retail_price
         FROM products 
         WHERE
         product_code = 9090 ;

END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.product_update
DELIMITER //
CREATE PROCEDURE `product_update`(
	IN `p_product_id` INT,
	IN `p_product_code` INT,
	IN `p_p_description` INT,
	IN `p_retail_price` INT
)
BEGIN

#updating the data pre-existing inside the table
UPDATE products
        SET     product_id = p_product_id, product_code = p_product_code,
		          p_description = p_p_description, 
				retail_price = p_retail_price
				

				 WHERE product_id = p_product_id;

END//
DELIMITER ;

-- Dumping structure for view tarunkumar_2131061.viewofall_data
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `viewofall_data` (
	`orders_id` CHAR(36) NOT NULL COLLATE 'utf8mb4_general_ci',
	`customer_id` CHAR(36) NOT NULL COLLATE 'utf8mb4_general_ci',
	`product_id` CHAR(36) NOT NULL COLLATE 'utf8mb4_general_ci',
	`quantity` INT(11) NOT NULL,
	`sold_price` DECIMAL(20,6) NOT NULL,
	`comments` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`created_at_order` DATETIME NOT NULL,
	`updated_at_order` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for procedure tarunkumar_2131061.z_login
DELIMITER //
CREATE PROCEDURE `z_login`(
	IN `p_username` VARCHAR(50)
)
BEGIN

#showing the password corresponding to a particular username
SELECT passsword FROM customers WHERE username = p_username;

END//
DELIMITER ;

-- Dumping structure for procedure tarunkumar_2131061.z_search
DELIMITER //
CREATE PROCEDURE `z_search`(
	IN `p_customer_id` CHAR(36),
	IN `p_date` DATETIME
)
BEGIN

SELECT * FROM 
orders  
WHERE
orders.customer_id = p_customer_id 
AND 
orders.created_at_order >= p_date 
OR p_date 
IS NULL 
ORDER BY
orders.created_at_order DESC;


END//
DELIMITER ;

-- Dumping structure for view tarunkumar_2131061.viewofall_data
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `viewofall_data`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `viewofall_data` AS SELECT orders.orders_id, orders.customer_id, orders.product_id, orders.quantity, orders.sold_price, orders.comments, orders.created_at_order, orders.updated_at_order
      FROM orders 
          INNER JOIN customers
            ON orders.orders_id = customers.customers_id
           INNER JOIN products
           ON orders.orders_id = products.product_id
            ORDER BY updated_at_order ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
