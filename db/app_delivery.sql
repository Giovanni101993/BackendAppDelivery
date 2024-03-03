-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-03-2024 a las 20:30:33
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
(1, 'Casa', 'Modelia', 4.695514385908713, -74.1654166392982, '2024-02-12 21:04:26', '2024-02-12 21:04:26', 9),
(2, 'Trabajo', 'Dorado', 4.678759158385363, -74.11936612799764, '2024-02-14 23:00:34', '2024-02-14 23:00:34', 9),
(3, 'Sucursal ', 'Centro', 4.6856511852075915, -74.1539398021996, '2024-02-14 23:33:17', '2024-02-14 23:33:17', 9),
(4, 'Apartamento ', 'Cedritos ', 4.726883581558255, -74.03875367715955, '2024-02-14 23:34:44', '2024-02-14 23:34:44', 9),
(5, 'Ph', 'Pueblo nuevo', 4.667093943094438, -74.15575632825494, '2024-02-14 23:38:21', '2024-02-14 23:38:21', 9),
(6, 'Calle 3 #34-76', 'Comuneros', 4.659797758898389, -74.129787851125, '2024-02-19 19:53:34', '2024-02-19 19:53:34', 8);

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
(1, 'Hamburguesa ', 'Hamburguesas doble carne', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706645584369?alt=media&token=27eabf20-3dea-4f14-951e-1ca76deba7fc', '2024-01-30 20:13:05', '2024-01-30 20:13:05'),
(9, 'Salchipapas ', 'Diferentes combinaciones de salsas', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706989809657?alt=media&token=f84e1036-2af1-4100-b6c2-f95e14a90e1b', '2024-02-03 19:48:47', '2024-02-03 19:50:10'),
(10, 'Jugos Naturales ', 'Jugos en agua y en leche', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1707495396806?alt=media&token=95f405d0-4c98-4810-881c-2bae905f0d80', '2024-02-09 16:16:38', '2024-02-09 16:16:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint NOT NULL,
  `id_client` bigint NOT NULL,
  `id_delivery` bigint DEFAULT NULL,
  `id_address` bigint NOT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `status` varchar(90) NOT NULL,
  `timestamp` bigint NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `id_client`, `id_delivery`, `id_address`, `lat`, `lng`, `status`, `timestamp`, `created_at`, `updated_at`) VALUES
(1, 9, NULL, 1, NULL, NULL, 'PAGADO', 1708027619361, '2024-02-15 20:06:59', '2024-02-15 20:06:59'),
(2, 9, NULL, 2, NULL, NULL, 'PAGADO', 1708027719841, '2024-02-15 20:08:40', '2024-02-15 20:08:40'),
(3, 9, NULL, 2, NULL, NULL, 'EN CAMINO', 1708028225481, '2024-02-15 20:17:05', '2024-02-24 21:49:37'),
(4, 9, NULL, 1, NULL, NULL, 'PAGADO', 1708030395085, '2024-02-15 20:53:15', '2024-02-15 20:53:15'),
(5, 9, 9, 1, NULL, NULL, 'EN CAMINO', 1708119370936, '2024-02-16 21:36:11', '2024-02-24 22:05:16'),
(6, 8, 9, 6, NULL, NULL, 'ENTREGADO', 1708372419402, '2024-02-19 19:53:39', '2024-02-26 01:36:17'),
(7, 8, 9, 6, NULL, NULL, 'EN CAMINO', 1709241884578, '2024-02-29 21:24:45', '2024-02-29 21:36:40');

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

--
-- Volcado de datos para la tabla `order_has_products`
--

INSERT INTO `order_has_products` (`id_order`, `id_product`, `quantity`, `created_at`, `updated_at`) VALUES
(3, 1, 4, '2024-02-15 20:17:05', '2024-02-15 20:17:05'),
(3, 2, 5, '2024-02-15 20:17:05', '2024-02-15 20:17:05'),
(4, 2, 6, '2024-02-15 20:53:15', '2024-02-15 20:53:15'),
(5, 1, 2, '2024-02-16 21:36:11', '2024-02-16 21:36:11'),
(5, 2, 7, '2024-02-16 21:36:11', '2024-02-16 21:36:11'),
(6, 1, 1, '2024-02-19 19:53:39', '2024-02-19 19:53:39'),
(7, 2, 1, '2024-02-29 21:24:45', '2024-02-29 21:24:45'),
(7, 3, 2, '2024-02-29 21:24:45', '2024-02-29 21:24:45'),
(7, 4, 1, '2024-02-29 21:24:45', '2024-02-29 21:24:45');

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
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image1`, `image2`, `image3`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 'Hamburguesa de carne', 'Doble carne y salsas ', '21000', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1707338519514?alt=media&token=eadcc4a5-c5e1-4b33-83b2-65557aa1a88b', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1707338520685?alt=media&token=eadcc4a5-c5e1-4b33-83b2-65557aa1a88b', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1707338521061?alt=media&token=eadcc4a5-c5e1-4b33-83b2-65557aa1a88b', 1, '2024-02-07 17:19:30', '2024-02-07 20:42:02'),
(2, 'Hamburguesa de pollo', 'Hamburguesa de pollo con papas', '30000', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1707607938916?alt=media&token=4f011736-811a-4bde-935b-95917bea26cb', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1707607939919?alt=media&token=4f011736-811a-4bde-935b-95917bea26cb', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1707607940503?alt=media&token=4f011736-811a-4bde-935b-95917bea26cb', 1, '2024-02-10 23:32:19', '2024-02-10 23:32:21'),
(3, 'Jugo de maracuyá ', 'Refrescante Jugo de maracuyá', '4000', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1709241447419?alt=media&token=2b0e83d0-dda5-4107-8947-faae1a6f3b57', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1709241448335?alt=media&token=2b0e83d0-dda5-4107-8947-faae1a6f3b57', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1709241448767?alt=media&token=2b0e83d0-dda5-4107-8947-faae1a6f3b57', 10, '2024-02-29 21:17:27', '2024-02-29 21:17:29'),
(4, 'Salchipapas ', 'Con todas las salsas', '10000', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1709241534522?alt=media&token=2b0e83d0-dda5-4107-8947-faae1a6f3b57', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1709241535665?alt=media&token=2b0e83d0-dda5-4107-8947-faae1a6f3b57', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1709241536135?alt=media&token=2b0e83d0-dda5-4107-8947-faae1a6f3b57', 9, '2024-02-29 21:18:55', '2024-02-29 21:18:57');

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
(1, 'ADMIN', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/tienda.png?alt=media&token=217a3c6c-6661-416f-9866-07bd5c8a5873', '/restaurant/order/list', '2024-01-20 05:00:00', '2024-01-20 05:00:00'),
(2, 'REPARTIDOR', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/delivery.png?alt=media&token=9845b820-1020-4653-a446-40614e3442db', '/delivery/order/list', '2024-01-20 05:00:00', '2024-01-20 05:00:00'),
(3, 'CLIENTE', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/cliente.png?alt=media&token=f08eefc1-491a-4480-b773-24527d1b9ddd', '/client/products/list', '2024-01-20 05:00:00', '2024-01-20 05:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `email` varchar(180) NOT NULL,
  `name` varchar(90) NOT NULL,
  `lastname` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(90) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `lastname`, `phone`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'raul@gmail.com', 'Raul', 'Roa', '3122345678', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1705792977618?alt=media&token=86ad59b5-d438-455d-8ae1-adb6bf8208e8', '$2a$10$Q6y9iDnQ.2PEETA9IMIFmuGPKGWcQdxVyeUjsImyBkVBZA0fD9GHm', '2024-01-20 23:22:59', '2024-01-20 23:22:59'),
(2, 'salo@gmail.com', 'MariaSalome', 'Salas López ', '3219871233', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706224467749?alt=media&token=9ad9e28b-d8db-48d2-a83b-3bdee50ed3b8', '12345678', '2024-01-20 23:25:55', '2024-01-25 23:14:29'),
(3, 'jose@gmail.com', 'Jose Luis ', 'Salazar Pérez ', '3002136782', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706226841634?alt=media&token=81b4ab77-7862-4a50-802e-a5562894ce23', '1234567', '2024-01-25 23:17:56', '2024-01-25 23:54:02'),
(4, 'Jair@gmail.com', 'Jair Andres', 'Barrios', '3215647683', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706233071929?alt=media&token=81b4ab77-7862-4a50-802e-a5562894ce23', '1234567', '2024-01-26 01:36:50', '2024-01-26 01:37:52'),
(5, 'Gabi@gmail.com', 'Gabriela Sandra ', 'García ', '3216547865', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706233252087?alt=media&token=81b4ab77-7862-4a50-802e-a5562894ce23', '1234567', '2024-01-26 01:40:53', '2024-01-26 01:50:32'),
(6, 'pablo@gmail.com', 'Pablo', 'García ', '3218765421', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706235157628?alt=media&token=92b39f1a-6b79-4b9a-b25c-1a75cf423c64', '123456', '2024-01-26 02:12:39', '2024-01-26 02:12:39'),
(7, 'Fabian@gmail.com', 'Fabian Camilo ', 'Pulido Arias ', '3457689054', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706236969484?alt=media&token=48518899-873e-4aa9-8d40-dd5594d39036', '$2a$10$zlL1kurUP10gqTHQwpUrS.p7N1Mdu986np3sAv0T3l6dkqEj0a8q6', '2024-01-26 02:40:10', '2024-01-26 02:42:50'),
(8, 'Vale@gmail.com', 'Valentina ', 'Reyes Ramos', '3210987612', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706299150556?alt=media&token=790e7640-f5ff-473a-bdd3-5a7b0bbd9739', '$2a$10$gne9dIHpNUZUFJOOn/W6juJ/Tvfd3KdhaTEDBBogVgH3d3jWBdWDi', '2024-01-26 17:20:19', '2024-02-29 21:23:07'),
(9, 'Giovanni@gmail.com', 'Giovanni', 'Cobo', '3123027812', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1706491015413?alt=media&token=6aa8497f-59ef-4fe6-a9fc-e862a6699194', '$2a$10$HNYJeKyu.V2BXbdcDpWyV.NbmDtz3r32x7.O002MRG2gZanvz1gAi', '2024-01-29 01:16:57', '2024-01-29 01:16:57');

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
(2, 1, '2024-01-20 23:25:55', '2024-01-20 23:25:55'),
(2, 2, '2024-01-20 23:25:55', '2024-01-20 23:25:55'),
(2, 3, '2024-01-20 23:25:55', '2024-01-20 23:25:55'),
(3, 1, '2024-01-25 23:17:56', '2024-01-25 23:17:56'),
(3, 2, '2024-01-25 23:17:56', '2024-01-25 23:17:56'),
(3, 3, '2024-01-25 23:17:56', '2024-01-25 23:17:56'),
(4, 3, '2024-01-26 01:36:50', '2024-01-26 01:36:50'),
(5, 1, '2024-01-26 01:40:53', '2024-01-26 01:40:53'),
(5, 2, '2024-01-26 01:40:53', '2024-01-26 01:40:53'),
(5, 3, '2024-01-26 01:40:53', '2024-01-26 01:40:53'),
(6, 3, '2024-01-26 02:12:39', '2024-01-26 02:12:39'),
(7, 3, '2024-01-26 02:40:10', '2024-01-26 02:40:10'),
(8, 3, '2024-01-26 17:20:19', '2024-01-26 17:20:19'),
(9, 1, '2024-01-29 01:16:57', '2024-01-29 01:16:57'),
(9, 2, '2024-01-29 01:16:57', '2024-01-29 01:16:57'),
(9, 3, '2024-01-29 01:16:57', '2024-01-29 01:16:57');

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
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_delivery` (`id_delivery`),
  ADD KEY `id_address` (`id_address`);

--
-- Indices de la tabla `order_has_products`
--
ALTER TABLE `order_has_products`
  ADD PRIMARY KEY (`id_order`,`id_product`),
  ADD KEY `id_product` (`id_product`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id_category` (`id_category`);

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_delivery`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `order_has_products`
--
ALTER TABLE `order_has_products`
  ADD CONSTRAINT `order_has_products_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_has_products_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
