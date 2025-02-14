-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 14 fév. 2025 à 17:06
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bicycle_stock_management_app`
--

-- --------------------------------------------------------

--
-- Structure de la table `bicycles`
--

CREATE TABLE `bicycles` (
  `id` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bicycles`
--

INSERT INTO `bicycles` (`id`, `model`, `quantity`, `price`) VALUES
(1, 'Mountain Bike', 20, 35000.00),
(2, 'Road Bike', 15, 75000.00),
(3, 'Sport Bike', 10, 45000.00);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `bicycle_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `bicycle_id`, `quantity`, `order_date`) VALUES
(1, 'John Doe', 1, 2, '2025-02-10 07:53:29'),
(2, 'Camelo', 1, 2, '2025-02-10 08:53:29');

-- --------------------------------------------------------

--
-- Structure de la table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `bicycle_id` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sales`
--

INSERT INTO `sales` (`id`, `bicycle_id`, `quantity_sold`, `total_price`, `customer_name`, `sale_date`) VALUES
(1, 1, 2, 1000.00, 'John Doe', '2025-02-10 12:40:07'),
(2, 2, 1, 750.00, 'Jane Smith', '2025-02-10 12:40:07'),
(3, 3, 3, 1500.00, 'Camel Deugoue', '2025-02-10 23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL,
  `bicycle_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `stocks`
--

INSERT INTO `stocks` (`id`, `bicycle_id`, `quantity`, `last_updated`) VALUES
(1, 1, 50, '2025-02-10 08:23:02'),
(2, 2, 60, '2025-02-10 08:23:02'),
(3, 3, 80, '2025-02-10 08:23:02'),
(16, 3, 80, '2025-01-10 23:00:00'),
(27, 3, 80, '2025-01-11 12:00:12');

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `name`, `contact`, `address`) VALUES
(1, 'Bike Supplier Inc.', '123-456-7890', '123 Main Street, NY'),
(2, 'Speedy Bikes Ltd.', '987-654-3210', '456 Elm Road, LA'),
(3, 'Eco Cycles Co.', '555-789-1234', '789 Greenway Blvd, SF'),
(4, 'Bike Cooper', '543-352-3500', '1.1 Nlongkak ');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','StoreManager','SalesStaff') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin1', 'adminpass', 'Admin'),
(2, 'manager1', 'managerpass', 'StoreManager'),
(3, 'staffpass', 'SalesStaf0', 'Admin'),
(4, 'user', 'userpass', 'Admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bicycles`
--
ALTER TABLE `bicycles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bicycle_id` (`bicycle_id`);

--
-- Index pour la table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bicycle_id` (`bicycle_id`);

--
-- Index pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bicycle_id` (`bicycle_id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bicycles`
--
ALTER TABLE `bicycles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`bicycle_id`) REFERENCES `bicycles` (`id`);

--
-- Contraintes pour la table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`bicycle_id`) REFERENCES `bicycles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`bicycle_id`) REFERENCES `bicycles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
