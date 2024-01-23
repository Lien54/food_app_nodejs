/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int NOT NULL,
  `codes` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `desctiption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT NULL,
  `refresh_token` longtext,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Caesar Salad', 'food1.jpg', 10.99, 'Fresh and crisp', 5);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(2, 'Grilled Chicken', 'food2.jpg', 15.99, 'Juicy and flavorful', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(3, 'Margherita Pizza', 'food3.jpg', 12.99, 'Classic Italian pizza', 4);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(4, 'Double Cheeseburger', 'food4.jpg', 9.99, 'Double the cheese, double the delight', 2),
(5, 'Chocolate Brownie', 'food5.jpg', 7.99, 'Rich and decadent', 3),
(6, 'Fish Tacos', 'food6.jpg', 11.99, 'Tasty seafood in a tortilla', 6);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Appetizer');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Main Course');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Dessert');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Beverage'),
(5, 'Salad'),
(6, 'Snack');

INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(1, 1, 2, '2023-11-10 14:20:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(3, 3, 3, '2023-11-12 21:45:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(4, 4, 4, '2023-11-13 11:30:00');
INSERT INTO `like_res` (`like_id`, `user_id`, `res_id`, `date_like`) VALUES
(5, 5, 5, '2023-11-14 17:15:00'),
(6, 6, 6, '2023-11-15 22:00:00'),
(9, 2, 1, '2023-12-09 14:43:38'),
(10, 7, 1, '2023-12-09 17:54:11');

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `codes`, `arr_sub_id`) VALUES
(1, 1, 1, 2, 'ORDER123', '1');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `codes`, `arr_sub_id`) VALUES
(2, 2, 2, 1, 'ORDER456', '2');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `codes`, `arr_sub_id`) VALUES
(3, 3, 3, 3, 'ORDER789', '3,4');
INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `codes`, `arr_sub_id`) VALUES
(4, 4, 4, 2, 'ORDER101', '5'),
(5, 5, 5, 1, 'ORDER112', '6'),
(6, 6, 6, 2, 'ORDER131', '2,4'),
(7, 4, 4, 3, 'test1', '3,4,2');

INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 5, '2023-11-10 12:30:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 2, 4, '2023-11-11 15:45:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 1, 3, '2023-11-12 18:20:00');
INSERT INTO `rate_res` (`rate_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(4, 4, 3, 5, '2023-11-13 14:00:00'),
(5, 5, 4, 4, '2023-11-14 16:30:00'),
(6, 6, 5, 5, '2023-11-15 20:45:00'),
(9, 2, 1, 5, '2023-12-09 14:51:52'),
(10, 7, 1, NULL, '2023-12-09 17:56:46');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desctiption`) VALUES
(1, 'Awesome Restaurant', 'restaurant1.jpg', 'A great place to dine');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desctiption`) VALUES
(2, 'Delicious Deli', 'restaurant2.jpg', 'Fresh and tasty sandwiches');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desctiption`) VALUES
(3, 'Sushi Spot', 'restaurant3.jpg', 'Authentic Japanese cuisine');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desctiption`) VALUES
(4, 'Burger Haven', 'restaurant4.jpg', 'Home of the best burgers'),
(5, 'Pizza Palace', 'restaurant5.jpg', 'Where pizzas come alive'),
(6, 'Taco Time', 'restaurant6.jpg', 'Tacos that will blow your mind');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Cheese', 1.5, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Bacon', 2, 4);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Vanilla Ice Cream', 1.99, 5);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Guacamole', 1.5, 6),
(5, 'Onion Rings', 2.5, 4),
(6, 'Strawberry Sauce', 1, 3);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `role`, `refresh_token`) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password123', NULL, NULL);
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `role`, `refresh_token`) VALUES
(2, 'Jane Smith', 'jane.smith@example.com', 'securepassword', NULL, NULL);
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `role`, `refresh_token`) VALUES
(3, 'Alice Johnson', 'alice.j@example.com', 'pass123', NULL, NULL);
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`, `role`, `refresh_token`) VALUES
(4, 'Bob Brown', 'bob.brown@example.com', 'password456', NULL, NULL),
(5, 'Eva Davis', 'eva.davis@example.com', 'securepass', NULL, NULL),
(6, 'Charlie White', 'charlie.white@example.com', 'pass789', NULL, NULL),
(7, 'sang', 'sang@gmail.com', '$2b$10$mxHJxNfG7m1TW0/qmqH3GeAV.xkBT55G/Ch.2AviCZxnPNlq81ZcG', 'user', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InVzZXJfaWQiOjcsImtleSI6MTcwMjE0NDE5NzQyMX0sImlhdCI6MTcwMjE0NDE5NywiZXhwIjoxNzAyNzQ4OTk3fQ.a6PiPa05qHc2DZ1A93hidnmpP8r8rYYh3TawFKDulP4');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;