-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-04-2024 a las 01:38:49
-- Versión del servidor: 8.0.35
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app_delivery`
--
CREATE DATABASE IF NOT EXISTS `app_delivery` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `app_delivery`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `id` bigint NOT NULL,
  `address` varchar(255) NOT NULL,
  `neighborhood` varchar(180) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`id`, `address`, `neighborhood`, `lat`, `lng`, `created_at`, `updated_at`, `id_user`) VALUES
(1, 'Calle 25 #34-76', 'Marroquín ', 4.682478370751652, -74.15538618341088, '2024-03-29 23:20:51', '2024-03-29 23:20:51', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint NOT NULL,
  `name` varchar(180) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Salchipapas ', 'Gran variedad de salchipapas ', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754170705?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', '2024-03-29 23:16:12', '2024-03-29 23:16:12'),
(2, 'Hamburguesas ', 'Gran variedad de hamburguesas ', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754201092?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', '2024-03-29 23:16:42', '2024-03-29 23:16:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery`
--

CREATE TABLE `delivery` (
  `id` bigint NOT NULL,
  `email` varchar(180) NOT NULL,
  `name` varchar(90) NOT NULL,
  `lastname` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(90) NOT NULL,
  `id_store` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `delivery`
--

INSERT INTO `delivery` (`id`, `email`, `name`, `lastname`, `phone`, `image`, `password`, `id_store`, `created_at`, `updated_at`) VALUES
(1, 'carmen@gmail.com', 'Aaq', 'Aaqa', '333332554585', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711927620715?alt=media&token=2872dc52-5553-4a2d-97a5-eb79aa5cec00', '$2a$10$eSTVRibFFJvWtBVi96AAmubEV1gz/X.8Ci739pgQGXreS1o3UVEcu', 1, '2024-03-31 23:27:02', '2024-03-31 23:27:02'),
(2, 'sandra@gmail.com', 'Sandra', 'Marin', '3215649870', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711927955017?alt=media&token=e406a737-7040-4c0f-bd85-55252b39c5d1', '$2a$10$zfibgJtJ0glNIhxcbJ9gJ.6gYwAo8p.aCNiYxj6gAXr1r3DY5Ngy6', 3, '2024-03-31 23:32:36', '2024-03-31 23:32:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint NOT NULL,
  `id_client` bigint NOT NULL,
  `id_store` bigint NOT NULL,
  `id_delivery` bigint DEFAULT NULL,
  `id_address` bigint NOT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `status` varchar(90) NOT NULL,
  `timestamp` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_has_products`
--

CREATE TABLE `order_has_products` (
  `id_order` bigint NOT NULL,
  `id_product` bigint NOT NULL,
  `quantity` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `id` bigint NOT NULL,
  `code_qr` varchar(255) DEFAULT NULL,
  `bank` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `id_user` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `payment`
--

INSERT INTO `payment` (`id`, `code_qr`, `bank`, `phone`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754936100?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 'Nequi', '3123027314', 1, '2024-03-29 23:28:57', '2024-03-29 23:28:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint NOT NULL,
  `name` varchar(180) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `id_category` bigint NOT NULL,
  `id_user` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image1`, `image2`, `image3`, `id_category`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'Hamburguesa de pollo ', '140gr de pollo acompañado de papas', '30000', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754266372?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754267142?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754267714?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 2, 1, '2024-03-29 23:17:46', '2024-03-29 23:17:48'),
(2, 'Salchipapa con tocineta ', '150gr de papa salchicha y tocineta ', '15000', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754355742?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754356122?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754356798?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 1, 1, '2024-03-29 23:19:16', '2024-03-29 23:19:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `route` varchar(180) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `image`, `route`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/admin.png?alt=media&token=cf536650-6220-4aa9-94d6-6927e6b5ce5f', '/admin/order/list', '2024-01-20 05:00:00', '2024-01-20 05:00:00'),
(2, 'TIENDA', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/tienda.png?alt=media&token=217a3c6c-6661-416f-9866-07bd5c8a5873', '/store/order/list', '2024-01-20 05:00:00', '2024-01-20 05:00:00'),
(3, 'CLIENTE', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/cliente.png?alt=media&token=0b33b628-7588-42fb-9b10-c4a8c940b302', '/client/products/list', '2024-01-20 05:00:00', '2024-01-20 05:00:00'),
(4, 'REPARTIDOR', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/delivery.png?alt=media&token=9845b820-1020-4653-a446-40614e3442db', '/delivery/order/list', '2024-01-20 05:00:00', '2024-01-20 05:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `email` varchar(180) NOT NULL,
  `name` varchar(90) NOT NULL,
  `lastname` varchar(90) NOT NULL,
  `name_store` varchar(90) DEFAULT NULL,
  `address` varchar(90) DEFAULT NULL,
  `business_type` varchar(90) DEFAULT NULL,
  `phone` varchar(90) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(90) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `lastname`, `name_store`, `address`, `business_type`, `phone`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'giovanni.cobo10@gmail.com', 'Giovanni ', 'Cobo ', 'GiiO', 'Calle siempreviva ', 'Comidas rapidas', '3123027314', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711326239268?alt=media&token=24a2b29c-d22a-4145-8e31-9ea5171f1793', '$2a$10$MYUBHUXUAxDxIFbaDSNAWOZUoXFCoIL0/gLHoRsXz96/uToSAcTiC', '2024-03-25 00:24:00', '2024-03-25 00:24:00'),
(2, 'marce@gmail.com', 'Marcela ', 'Cobo', '', '', NULL, '3123456541', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711326726963?alt=media&token=24a2b29c-d22a-4145-8e31-9ea5171f1793', '$2a$10$qeq58PtzsRV1hMvfFmAR/.dWq65dUtNNVgFKzlaT29v3VO6ZIt8y2', '2024-03-25 00:32:08', '2024-03-25 00:32:08'),
(3, 'maria@gmail.com', 'Maria', 'Mar', 'Variedades María ', 'Calle 61', 'Restaurante', '3128096471', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711330528527?alt=media&token=24a2b29c-d22a-4145-8e31-9ea5171f1793', '$2a$10$J68hUu9KS4/oQxAGyJYXAeohg2Hi2XSe6qjBuktuNIxQ2ve0f5I56', '2024-03-25 01:35:30', '2024-03-25 01:35:30'),
(4, 'jair@gmail.com', 'Jair', 'Barrios', 'JaiRestaurant', 'Calle 35', 'Restaurante ', '3123589526', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711840119086?alt=media&token=f1c8d801-0fe0-4d55-9714-86dd671e50b1', '$2a$10$QBEH8Cb.5F0CeqmYb.eOYeeusInYFZ6cE/F9eFa9lPWFLtOqTJ.d2', '2024-03-30 23:08:40', '2024-03-30 23:08:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_has_roles`
--

CREATE TABLE `user_has_roles` (
  `id_user` bigint NOT NULL,
  `id_rol` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user_has_roles`
--

INSERT INTO `user_has_roles` (`id_user`, `id_rol`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-03-25 00:24:01', '2024-03-25 00:24:01'),
(1, 2, '2024-03-25 00:24:01', '2024-03-25 00:24:01'),
(1, 3, '2024-03-25 00:24:01', '2024-03-25 00:24:01'),
(1, 4, '2024-03-25 00:24:01', '2024-03-25 00:24:01'),
(2, 3, '2024-03-25 00:32:08', '2024-03-25 00:32:08'),
(2, 4, '2024-03-31 20:38:32', '2024-03-31 20:38:32'),
(3, 2, '2024-03-25 01:35:30', '2024-03-25 01:35:30'),
(4, 2, '2024-03-30 23:08:40', '2024-03-30 23:08:40');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `id_store` (`id_store`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_store` (`id_store`),
  ADD KEY `id_delivery` (`id_delivery`),
  ADD KEY `id_address` (`id_address`);

--
-- Indices de la tabla `order_has_products`
--
ALTER TABLE `order_has_products`
  ADD PRIMARY KEY (`id_order`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indices de la tabla `user_has_roles`
--
ALTER TABLE `user_has_roles`
  ADD PRIMARY KEY (`id_user`,`id_rol`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`id_store`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_store`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_delivery`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `order_has_products`
--
ALTER TABLE `order_has_products`
  ADD CONSTRAINT `order_has_products_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_has_products_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_has_roles`
--
ALTER TABLE `user_has_roles`
  ADD CONSTRAINT `user_has_roles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_has_roles_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
