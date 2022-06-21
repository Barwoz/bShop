DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '1',
  `rare` tinyint(4) NOT NULL DEFAULT '0',
  `can_remove` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('bread', 'Pain', 1, 0, 1),
('chocolate', 'Chocolat', 1, 0, 1),
('cocacola', 'Coca-Cola', 1, 0, 1),
('icetea', 'Ice-Tea', 1, 0, 1),
('sandwich', 'Sandwich', 1, 0, 1),
('water', 'Eau', 1, 0, 1)