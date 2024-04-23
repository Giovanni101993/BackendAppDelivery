-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2024 a las 04:26:02
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
(1, 'Calle 25 #34-76', 'Marroquín ', 4.682478370751652, -74.15538618341088, '2024-03-29 23:20:51', '2024-03-29 23:20:51', 2),
(2, 'Calle 13', 'Fontibón ', 4.695513049305257, -74.16542200371623, '2024-04-04 02:24:53', '2024-04-04 02:24:53', 1),
(3, 'Calle 13', 'Fontibón ', 4.695513049305257, -74.16542200371623, '2024-04-04 02:36:16', '2024-04-04 02:36:16', 1),
(4, 'Calle 13', 'Fontibón ', 4.695513049305257, -74.16542200371623, '2024-04-04 02:36:19', '2024-04-04 02:36:19', 1);

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
(2, 'Hamburguesas ', 'Gran variedad de hamburguesas ', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754201092?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', '2024-03-29 23:16:42', '2024-03-29 23:16:42'),
(3, 'Bebidas', 'Jugos naturales ', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1713823066383?alt=media&token=23520920-48da-4481-ab50-161e8759e433', '2024-04-22 21:57:47', '2024-04-22 21:57:47');

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
(1, 1, NULL, 2, NULL, NULL, 'PAGADO', 1712523741528, '2024-04-07 21:02:22', '2024-04-07 21:02:22'),
(2, 1, NULL, 3, NULL, NULL, 'PAGADO', 1712524203691, '2024-04-07 21:10:04', '2024-04-07 21:10:04'),
(3, 1, NULL, 2, NULL, NULL, 'PAGADO', 1712524389341, '2024-04-07 21:13:09', '2024-04-07 21:13:09'),
(4, 1, 49, 3, NULL, NULL, 'ENTREGADO', 1712524910365, '2024-04-07 21:21:50', '2024-04-07 21:40:35'),
(5, 1, 2, 3, NULL, NULL, 'DESPACHADO', 1712527951022, '2024-04-07 22:12:31', '2024-04-14 02:54:14'),
(6, 1, NULL, 2, NULL, NULL, 'PAGADO', 1713063498185, '2024-04-14 02:58:18', '2024-04-14 02:58:18'),
(7, 1, 35, 4, NULL, NULL, 'DESPACHADO', 1713746709082, '2024-04-22 00:45:09', '2024-04-22 19:01:26'),
(8, 1, NULL, 4, NULL, NULL, 'PAGADO', 1713746800147, '2024-04-22 00:46:40', '2024-04-22 00:46:40'),
(9, 1, NULL, 4, NULL, NULL, 'PAGADO', 1713747483148, '2024-04-22 00:58:03', '2024-04-22 00:58:03'),
(10, 1, NULL, 4, NULL, NULL, 'PAGADO', 1713747734031, '2024-04-22 01:02:14', '2024-04-22 01:02:14'),
(11, 1, NULL, 4, NULL, NULL, 'PAGADO', 1713748200687, '2024-04-22 01:10:01', '2024-04-22 01:10:01'),
(12, 1, NULL, 3, NULL, NULL, 'PAGADO', 1713748621857, '2024-04-22 01:17:02', '2024-04-22 01:17:02'),
(13, 1, NULL, 3, NULL, NULL, 'PAGADO', 1713748763527, '2024-04-22 01:19:24', '2024-04-22 01:19:24'),
(14, 1, NULL, 3, NULL, NULL, 'PAGADO', 1713748788154, '2024-04-22 01:19:48', '2024-04-22 01:19:48'),
(15, 1, NULL, 3, NULL, NULL, 'PAGADO', 1713752594297, '2024-04-22 02:23:14', '2024-04-22 02:23:14'),
(16, 1, NULL, 3, NULL, NULL, 'PAGADO', 1713753288877, '2024-04-22 02:34:49', '2024-04-22 02:34:49'),
(17, 1, NULL, 3, NULL, NULL, 'PAGADO', 1713753814356, '2024-04-22 02:43:34', '2024-04-22 02:43:34'),
(18, 1, NULL, 3, NULL, NULL, 'PAGADO', 1713758555776, '2024-04-22 04:02:36', '2024-04-22 04:02:36'),
(19, 1, NULL, 3, NULL, NULL, 'PAGADO', 1713758999154, '2024-04-22 04:09:59', '2024-04-22 04:09:59'),
(20, 1, NULL, 3, NULL, NULL, 'PAGADO', 1713759060163, '2024-04-22 04:11:00', '2024-04-22 04:11:00'),
(21, 1, NULL, 4, NULL, NULL, 'PAGADO', 1713798064126, '2024-04-22 15:01:04', '2024-04-22 15:01:04'),
(22, 1, NULL, 4, NULL, NULL, 'PAGADO', 1713798426438, '2024-04-22 15:07:06', '2024-04-22 15:07:06'),
(23, 1, NULL, 2, NULL, NULL, 'PAGADO', 1713798576532, '2024-04-22 15:09:37', '2024-04-22 15:09:37');

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
(4, 1, 2, '2024-04-07 21:21:50', '2024-04-07 21:21:50'),
(4, 2, 1, '2024-04-07 21:21:50', '2024-04-07 21:21:50'),
(5, 1, 1, '2024-04-07 22:12:31', '2024-04-07 22:12:31'),
(6, 2, 1, '2024-04-14 02:58:18', '2024-04-14 02:58:18'),
(7, 1, 2, '2024-04-22 00:45:09', '2024-04-22 00:45:09'),
(8, 1, 2, '2024-04-22 00:46:40', '2024-04-22 00:46:40'),
(9, 1, 2, '2024-04-22 00:58:03', '2024-04-22 00:58:03'),
(10, 1, 2, '2024-04-22 01:02:14', '2024-04-22 01:02:14'),
(11, 1, 2, '2024-04-22 01:10:01', '2024-04-22 01:10:01'),
(12, 1, 2, '2024-04-22 01:17:02', '2024-04-22 01:17:02'),
(13, 1, 2, '2024-04-22 01:19:24', '2024-04-22 01:19:24'),
(14, 1, 2, '2024-04-22 01:19:48', '2024-04-22 01:19:48'),
(15, 1, 3, '2024-04-22 02:23:14', '2024-04-22 02:23:14'),
(16, 1, 3, '2024-04-22 02:34:49', '2024-04-22 02:34:49'),
(17, 1, 3, '2024-04-22 02:43:34', '2024-04-22 02:43:34'),
(18, 1, 3, '2024-04-22 04:02:36', '2024-04-22 04:02:36'),
(19, 1, 3, '2024-04-22 04:09:59', '2024-04-22 04:09:59'),
(20, 1, 3, '2024-04-22 04:11:00', '2024-04-22 04:11:00'),
(21, 1, 3, '2024-04-22 15:01:04', '2024-04-22 15:01:04'),
(21, 2, 1, '2024-04-22 15:01:04', '2024-04-22 15:01:04'),
(22, 1, 3, '2024-04-22 15:07:06', '2024-04-22 15:07:06'),
(22, 2, 1, '2024-04-22 15:07:06', '2024-04-22 15:07:06'),
(23, 1, 1, '2024-04-22 15:09:37', '2024-04-22 15:09:37'),
(23, 2, 1, '2024-04-22 15:09:37', '2024-04-22 15:09:37');

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
(2, 'Salchipapa con tocineta ', '150gr de papa salchicha y tocineta ', '15000', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754355742?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754356122?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711754356798?alt=media&token=d7515def-23ea-4795-bb00-7e777c9687e1', 1, 1, '2024-03-29 23:19:16', '2024-03-29 23:19:17'),
(3, 'Jugo de maracuyá ', 'Jugos naturales ', '5000', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1713823122094?alt=media&token=23520920-48da-4481-ab50-161e8759e433', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1713823122451?alt=media&token=23520920-48da-4481-ab50-161e8759e433', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1713823122930?alt=media&token=23520920-48da-4481-ab50-161e8759e433', 3, 1, '2024-04-22 21:58:42', '2024-04-22 21:58:43');

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
-- Estructura de tabla para la tabla `store`
--

CREATE TABLE `store` (
  `id` bigint NOT NULL,
  `email` varchar(180) NOT NULL,
  `name` varchar(90) NOT NULL,
  `lastname` varchar(90) NOT NULL,
  `name_store` varchar(90) NOT NULL,
  `address` varchar(90) NOT NULL,
  `business_type` varchar(90) NOT NULL,
  `departamento` varchar(90) NOT NULL,
  `ciudad` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(90) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `store`
--

INSERT INTO `store` (`id`, `email`, `name`, `lastname`, `name_store`, `address`, `business_type`, `departamento`, `ciudad`, `phone`, `image`, `password`, `created_at`, `updated_at`) VALUES
(1, 'martind@gmail.com', 'Martin ', 'Del valle ', 'Comidas', 'Calle 23', 'Comidas rápidas ', '', '', '3147800852', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712945670427?alt=media&token=3e85e16e-a746-40d0-92cb-70a6a138fb7a', '$2a$10$xu.3u39rRNNclCtD5R39ueDc/4SdZFamAJjNsaxneNE8YuhYmxBa.', '2024-04-12 18:14:31', '2024-04-12 18:14:31'),
(3, 'martindvj@gmail.com', 'Martin ', 'Del valle ', 'Comidas', 'Calle 23', 'Comidas rápidas ', '', '', '3147800851', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712946543301?alt=media&token=6280b530-d57f-4ee5-942e-e56ede617400', '$2a$10$s2E.W0NVFI.s13mYDEjnDunkFVta35BKOx0UbRPuonTRuJsYCN3TW', '2024-04-12 18:29:04', '2024-04-12 18:29:04'),
(4, 'alvarito@gmail.com', 'Alvaro ', 'Uribe ', 'Paracomer', 'Calle 6402', 'Restaurante ', '', '', '3640264023', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712953736101?alt=media&token=3fea15f4-2f41-4c28-8d2d-f3102129d168', '$2a$10$p3qGCNxgncmHe4JDfq2DeOxYOahtSHE2duiKlDzz.p/RE7EQiswqK', '2024-04-12 20:28:57', '2024-04-12 20:28:57'),
(5, 'guri@gmail.com', 'Claudia', 'Gurisati', 'Comidas Guri ', 'Calle9', 'Comidas rápidas ', '', '', '3165487041', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712954430916?alt=media&token=3fea15f4-2f41-4c28-8d2d-f3102129d168', '$2a$10$7YlqE2WdZ3bhVilWw/bC8OX3Gbtru0Y0UjHhB45KCyiMz99UMUYne', '2024-04-12 20:40:32', '2024-04-12 20:40:32'),
(6, 'sara@gmail.com', 'Sara', 'Ramírez ', 'Sara Vet', 'Calle 123', 'Veterinaria ', 'Valle del Cauca', 'Cali', '3163457890', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712957679867?alt=media&token=c475e575-f72c-4445-9d16-d1b507924e6e', '$2a$10$qzKxWEhCnBfH8J1p/VYRLeSwJF1/hn/gSyjTJGOfp2Jp5cxz7enOS', '2024-04-12 21:34:41', '2024-04-12 21:34:41'),
(7, 'jisefa@gmail.com', 'Josefina', 'Aponza', 'Mar comidas', 'Calle4', 'Restaurante ', 'Valle del Cauca ', 'Cali', '3156548790', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1713022986017?alt=media&token=c5db6e1f-3c4d-49df-9e59-f7aa7e5c97a5', '$2a$10$VaaYuZm0qEMTCZiXdikYNu8lzrdKDF2t5IQhRV3iBlWAoQusXD/LW', '2024-04-13 15:43:07', '2024-04-13 15:43:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `store_has_delivery`
--

CREATE TABLE `store_has_delivery` (
  `id_store` bigint NOT NULL,
  `id_delivery` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `store_has_delivery`
--

INSERT INTO `store_has_delivery` (`id_store`, `id_delivery`, `created_at`) VALUES
(1, 35, '2024-04-03 17:09:32'),
(1, 38, '2024-04-03 17:09:32'),
(1, 40, '2024-04-04 18:35:02'),
(1, 43, '2024-04-04 18:36:21'),
(1, 44, '2024-04-04 18:40:19'),
(1, 45, '2024-04-04 20:00:50'),
(1, 48, '2024-04-04 20:14:58'),
(1, 49, '2024-04-04 21:26:44'),
(3, 39, '2024-04-03 17:09:32'),
(3, 46, '2024-04-04 20:03:38'),
(3, 47, '2024-04-04 20:08:58');

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
  `id_store` bigint DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  `notification_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `lastname`, `name_store`, `address`, `business_type`, `phone`, `image`, `password`, `id_store`, `created_at`, `updated_at`, `notification_token`) VALUES
(1, 'giovanni.cobo10@gmail.com', 'Giovanni ', 'Cobo ', 'GiiO', 'Calle siempreviva ', 'Comidas rapidas', '3123027314', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1713822638959?alt=media&token=1120dc79-5c7b-44b0-8079-222328773faf', '$2a$10$MYUBHUXUAxDxIFbaDSNAWOZUoXFCoIL0/gLHoRsXz96/uToSAcTiC', NULL, '2024-03-25 00:24:00', '2024-04-22 21:50:40', NULL),
(2, 'marce@gmail.com', 'Marcela ', 'Cobo', '', '', NULL, '3123456541', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711326726963?alt=media&token=24a2b29c-d22a-4145-8e31-9ea5171f1793', '$2a$10$qeq58PtzsRV1hMvfFmAR/.dWq65dUtNNVgFKzlaT29v3VO6ZIt8y2', NULL, '2024-03-25 00:32:08', '2024-03-25 00:32:08', NULL),
(3, 'maria@gmail.com', 'Maria', 'Mar', 'Variedades María ', 'Calle 61', 'Restaurante', '3128096471', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1711330528527?alt=media&token=24a2b29c-d22a-4145-8e31-9ea5171f1793', '$2a$10$J68hUu9KS4/oQxAGyJYXAeohg2Hi2XSe6qjBuktuNIxQ2ve0f5I56', NULL, '2024-03-25 01:35:30', '2024-04-22 18:34:25', 'ExponentPushToken[rDgEQfCmrQ6Kc2-P1sm3I0]'),
(5, 'pipe@gmail.com', 'Felipe ', 'Flores ', NULL, NULL, NULL, '3215469870', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712085080778?alt=media&token=c8526f45-32ac-471f-aa3d-50690dfc6cf7', '$2a$10$a6G6Pjw5Asl17sr5IQt3d.6TgZa//4F7cG5az6xBVS.bUJy5HlZTq', 1, '2024-04-02 19:11:22', '2024-04-02 19:11:22', NULL),
(6, 'jose@gmail.com', 'Jose', 'Nazareth ', NULL, NULL, NULL, '3587401245', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712085805246?alt=media&token=c3ce70ec-d0fe-45e4-9905-2187ca6fbc75', '$2a$10$5cYM5G.mwQVMZ7XsS/lHLuvlDgQvgpDM7MgKTEECNRqiF66H4fdBG', NULL, '2024-04-02 19:23:26', '2024-04-02 19:23:26', NULL),
(7, 'cesar@gmail.com', 'Cesar', 'Garzón ', NULL, NULL, NULL, '3215467841', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712086093953?alt=media&token=479a39ef-33da-4e31-b665-6930b29d5558', '$2a$10$qQ.nlkDHHZodT6I6C5iWs.Oq.x4aBegfNN0D7sbEG2vpYAJMG3zzG', NULL, '2024-04-02 19:28:15', '2024-04-02 19:28:15', NULL),
(8, 'flor@gmail.com', 'Flor', 'Franco', NULL, NULL, NULL, '3125649784', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712086290657?alt=media&token=479a39ef-33da-4e31-b665-6930b29d5558', '$2a$10$Ky2yYfAy0rBw1pKsVvCTIuE3lluZWHJhYsgvFZ1GN5YfHcQJa8922', NULL, '2024-04-02 19:31:31', '2024-04-02 19:31:31', NULL),
(9, 'vale@gmail.com', 'Valeria', 'Velez', NULL, NULL, NULL, '31236574001', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712086511761?alt=media&token=0d5831f1-3d4b-486b-b090-82a939b62b25', '$2a$10$mJd8ynUf.5W2PgUyTOoEeeUME5rumwo671vQgatBY5GSmB3w7Y/fK', NULL, '2024-04-02 19:35:13', '2024-04-02 19:35:13', NULL),
(10, 'adri@gmail.com', 'Adriana ', 'Lima', NULL, NULL, NULL, '3124578004', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712086706734?alt=media&token=cbfda9b5-0c41-4813-a7fe-41d383bf0080', '$2a$10$HQCWV2/SQffqA9YqRnGjYercpPlCqXd.cuIHTa6Tpf8pE2uGRToVC', 1, '2024-04-02 19:38:28', '2024-04-02 19:38:28', NULL),
(11, 'jere@gmail.com', 'Jeremias', 'Hernández ', NULL, NULL, NULL, '31569807741', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712086831002?alt=media&token=87d69064-4c64-46be-af66-ece62e6279fd', '$2a$10$HnozrsFtIalw59iEtcPJ8edRljLjgyNymldfkWWUAvl7zJJb8ejUK', NULL, '2024-04-02 19:40:32', '2024-04-02 19:40:32', NULL),
(12, 'edgar@gmail.com', 'Edgar', 'Jurado ', NULL, NULL, NULL, '3147004132', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712086932774?alt=media&token=69f14ab9-41e6-48bb-822a-7323a5cfca02', '$2a$10$pmmcLgooRKRWPXOcnege0uTM77NYO9a/eijqQzcBNWW5/l8tEGEzW', NULL, '2024-04-02 19:42:14', '2024-04-02 19:42:14', NULL),
(13, 'raul@gmail.com', 'Raul', 'Pulido', NULL, NULL, NULL, '3126807000', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712087037957?alt=media&token=05a34bf8-2a2c-44ce-99a5-f49df05648d4', '$2a$10$a8v56EwPPQGjSXluB4E8..iHMhA6hEsH3SAwaJFvdY/i1qoqwrovS', NULL, '2024-04-02 19:43:59', '2024-04-02 19:43:59', NULL),
(14, 'bart@gmail.com', 'Bart', 'Simpson ', NULL, NULL, NULL, '3169704812', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712087225345?alt=media&token=24139d4c-f719-4f88-94e1-4d8b24dba7fc', '$2a$10$K.h.mrDyD5W6RvheuKR9j.QtxPQPG/U1.rIOZOUnsCosVF2nFKDl6', NULL, '2024-04-02 19:47:07', '2024-04-02 19:47:07', NULL),
(15, 'jime@gmail.com', 'Jimena ', 'Jaramillo ', NULL, NULL, NULL, '3169754801', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712087297849?alt=media&token=f39eb4ab-b31f-481a-9372-779d913ba3e5', '$2a$10$LTviHDFXXB2ZCPPUnU3M9eJridiQljnR73TIuGrovIe2Q/qcRl7Za', NULL, '2024-04-02 19:48:19', '2024-04-02 19:48:19', NULL),
(16, 'ramiro@gmail.com', 'Ramiro', 'Ramirez ', NULL, NULL, NULL, '31155544871', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712087515658?alt=media&token=eea53963-26f6-4f94-9502-d31ce95ddf95', '$2a$10$W5refSKPxMKgqFcqVA4LPutL3uqMNZfa.OQV63ifi5SyBW5wtiHum', NULL, '2024-04-02 19:51:56', '2024-04-02 19:51:56', NULL),
(17, 'juli@gmail.com', 'Juliana ', 'Torres ', NULL, NULL, NULL, '3698074512', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712087807014?alt=media&token=ac1498c0-a23b-45d4-a3b6-347e116b24d0', '$2a$10$Rv148/0OhXkc2GAz0U9Er.8wDQDKArr/4/ka1WJBvUITWkJTlwATG', NULL, '2024-04-02 19:56:49', '2024-04-02 19:56:49', NULL),
(18, 'mela@gmail.com', 'Melanie ', 'Diaz', NULL, NULL, NULL, '3158961524', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712088004262?alt=media&token=ac1498c0-a23b-45d4-a3b6-347e116b24d0', '$2a$10$KhQGqnwsqWSv1IEO4cDYMOXSOchY9sys/MLO.YJAyZcmdsR.JgCMS', NULL, '2024-04-02 20:00:05', '2024-04-02 20:00:05', NULL),
(19, 'fer@gmail.com', 'Fernanda ', 'Cadena', NULL, NULL, NULL, '31235689077', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712088138707?alt=media&token=9c2ab36f-59af-45c6-bd4d-a4f17175b763', '$2a$10$tyi8jN.0uoqJtUoQWnBFBOhgt2qGgXla.nINex4HJYyQ7Ry5IKI.i', 1, '2024-04-02 20:02:20', '2024-04-02 20:02:20', NULL),
(20, 'david@gmail.com', 'David', 'Giron', NULL, NULL, NULL, '31564787711', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712088223871?alt=media&token=19a35b7f-1c7b-4810-86ec-81e0310cfb3c', '$2a$10$qIekL9rP43P3/eNHw8EwIeAgiyYO01SwZjoEW2M1EXYe3kPXehjSC', NULL, '2024-04-02 20:03:45', '2024-04-02 20:03:45', NULL),
(21, 'gio@gmail.com', 'Giovanna', 'Gil', NULL, NULL, NULL, '3111111122', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712088326754?alt=media&token=e1a14428-9fdf-4a74-91ea-403fa6e9c932', '$2a$10$a.f8H.P.Uo2093S/kGew1ush7iMhqttPnY9K0FJowy1h0TBKnXGEa', NULL, '2024-04-02 20:05:28', '2024-04-02 20:05:28', NULL),
(22, 'marti@gmail.com', 'Martin', 'Valle', NULL, NULL, NULL, '3258741111', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712088433747?alt=media&token=5b3ccf27-fbd9-4374-95bb-8f82ee7858cc', '$2a$10$Uf09.QnBziBFnmKUQy/UMOFmrUCHOyww9bjfHxG.SLwbvNhF3yF4W', NULL, '2024-04-02 20:07:15', '2024-04-02 20:07:15', NULL),
(23, 'cris@gmail.com', 'Cristian ', 'Cruz', NULL, NULL, NULL, '3154780074', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712088679365?alt=media&token=25a932de-f8e8-4b43-ae15-359256c6114a', '$2a$10$uWacEz5HuIDG5blOs4ApCu/NCgJ3HdIuV0WCzIXGjHIkg6yOGLP4C', NULL, '2024-04-02 20:11:20', '2024-04-02 20:11:20', NULL),
(24, 'isabella@gmail.com', 'Isabella ', 'Cobo', NULL, NULL, NULL, '3154723214', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712088890393?alt=media&token=da5412f7-1b84-4135-af3f-a49f6dd5fd2e', '$2a$10$H0KhO2OCR2gdeP9MF0GdpeNSy7gQXU9ortNqYd9iMVsY5x27mkHmS', NULL, '2024-04-02 20:14:51', '2024-04-02 20:14:51', NULL),
(25, 'milton@gmail.com', 'Milton', 'Zambrano ', NULL, NULL, NULL, '3159977890', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712089023379?alt=media&token=447fe844-36b9-4650-92ff-3e122811f566', '$2a$10$clq01QOI9OhD4zdg8ht2Nus.by488gtxTJER..3y1iGs3sgCEmubu', NULL, '2024-04-02 20:17:04', '2024-04-02 20:17:04', NULL),
(26, 'milton1tf@gmail.com', 'Milton', 'Zambrano ', NULL, NULL, NULL, '31599778213', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712089113700?alt=media&token=89a8c85c-911a-47b7-a833-6706f8c5180d', '$2a$10$E6zH6SKdQNAzQvEXZCJ3Ee7y5lzPnb4m6kq09.XsItOVwcdaHCvX6', NULL, '2024-04-02 20:18:35', '2024-04-02 20:18:35', NULL),
(27, 'milton1tfu@gmail.com', 'Milton', 'Zambrano ', NULL, NULL, NULL, '315997766', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712089176235?alt=media&token=ddcaf332-33e0-4ea4-ba43-c8aa1dbf21d6', '$2a$10$iRVjBBg53Al/2qMjg4Ufw.dlTgneDvL1Zmuf63A2/gl7JWbAqJ9p6', NULL, '2024-04-02 20:19:37', '2024-04-02 20:19:37', NULL),
(28, 'miltonm@gmail.com', 'Milton', 'Zambrano ', NULL, NULL, NULL, '315997147', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712089252072?alt=media&token=da3b7630-1949-46ea-8f77-09d35f405ea5', '$2a$10$M8ActeFSO2mgc9loP3ENX.F/3AtY2hBR9qTiHVjufLntZg1WNUxtq', NULL, '2024-04-02 20:20:53', '2024-04-02 20:20:53', NULL),
(29, 'miltonmz@gmail.com', 'Milton', 'Zambrano ', NULL, NULL, NULL, '315997145', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712089296121?alt=media&token=b7ce59b6-a6ac-47ac-90ff-101a73318c7f', '$2a$10$9utAsTNHAzEGAdrkBsH7k.AIVI9t2p5qAVWbJYbe7gdShrefBwdcm', NULL, '2024-04-02 20:21:37', '2024-04-02 20:21:37', NULL),
(30, 'miltonml@gmail.com', 'Milton', 'Zambrano ', NULL, NULL, NULL, '315997140', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712089331970?alt=media&token=b7ce59b6-a6ac-47ac-90ff-101a73318c7f', '$2a$10$kE/xwzdj9pOwDQZxmh8wg.VbA69Xsr8wGZGdY20NSnqdcj/aMuLIi', NULL, '2024-04-02 20:22:13', '2024-04-02 20:22:13', NULL),
(31, 'miltoncxu@gmail.com', 'Milton', 'Zambrano ', NULL, NULL, NULL, '315997235', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712089614157?alt=media&token=bef8263a-ef0b-4089-b78b-9e7b242339ba', '$2a$10$m57b4zQgHTUVhyYSUt3TD.l2nERIyjAItWYPDKSVA0Aaymf4Xg2nm', NULL, '2024-04-02 20:26:55', '2024-04-02 20:26:55', NULL),
(32, 'miltoncxm@gmail.com', 'Milton', 'Zambrano ', NULL, NULL, NULL, '315997230', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712089760026?alt=media&token=71aeb5ca-d594-4e51-8756-956ee7020559', '$2a$10$o.jKc8wzNIWrphqlBA9uk.NzlCbO7NoZEipQbG5zXsjTC434/J/aK', NULL, '2024-04-02 20:29:21', '2024-04-02 20:29:21', NULL),
(33, 'palo@gmail.com', 'Paz', 'Paloma', NULL, NULL, NULL, '31234567897', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712089866484?alt=media&token=71aeb5ca-d594-4e51-8756-956ee7020559', '$2a$10$enGeVka.i5kioIFmrWrD4uJDPL5KLrDZwZGSRNq4AWs19Z49.INQK', NULL, '2024-04-02 20:31:07', '2024-04-02 20:31:07', NULL),
(34, 'andreah@gmail.com', 'Andrea', 'Alfaro ', '', '', '', '3158741580', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712116650762?alt=media&token=4816bec0-307e-4557-a78b-b1cd75526f62', '$2a$10$o2blo8Vha5zFYxmu3wUYLOLiocy6tUhDH.ROcXZdR6jBSDDEOnWhC', NULL, '2024-04-03 03:57:32', '2024-04-03 03:57:32', NULL),
(35, 'gabi@gmail.com', 'Gabriela ', 'Ortiz', '', '', '', '3156930852', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712117330331?alt=media&token=4816bec0-307e-4557-a78b-b1cd75526f62', '$2a$10$.a.IrSg0IFQLmsvO5fTNzeckdtQyhY9Q2b0PjVTY.WFGLObW.Xlya', 1, '2024-04-03 04:08:51', '2024-04-22 18:58:32', 'ExponentPushToken[rDgEQfCmrQ6Kc2-P1sm3I0]'),
(36, 'fredy@gmail.com', 'Freddy ', 'Montero', '', '', '', '3169807412', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712117586170?alt=media&token=4816bec0-307e-4557-a78b-b1cd75526f62', '$2a$10$r66rZI1UECyjvdfa3YVzveERFaWJ7mnxwReKKZgKs7tB84A.EvD7u', 3, '2024-04-03 04:13:07', '2024-04-03 04:13:07', NULL),
(37, 'richard@gmail.com', 'Ricardo', 'Rios', '', '', '', '3145279077', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712118033207?alt=media&token=4816bec0-307e-4557-a78b-b1cd75526f62', '$2a$10$B6yHUCv9AuEvFNTWCVIcEOJjBm6J6nM9eYV74R5HUslqOjENfl1uu', 3, '2024-04-03 04:20:34', '2024-04-03 04:20:34', NULL),
(38, 'rosa@gmail.com', 'Rosa', 'Leyton', '', '', '', '3167984074', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712118651941?alt=media&token=4816bec0-307e-4557-a78b-b1cd75526f62', '$2a$10$msYTCULMrg3f6YJx/ZNu2eMDyY1KY5benNNCfVlwLvFPEzboeo6ny', 1, '2024-04-03 04:30:53', '2024-04-03 04:30:53', NULL),
(39, 'bob@gmail.com', 'Bob ', 'Esponja', '', '', '', '3169784521', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712164170649?alt=media&token=a5acb2e9-7010-43f3-9e7c-cabe5ca801fc', '$2a$10$qqxqpMvjBUURuLNIqPyIcOslOEr/zjfouDslDL7pVjSYAo23HvIW6', 3, '2024-04-03 17:09:32', '2024-04-03 17:09:32', NULL),
(40, 'caro@yopmail.com', 'Carolina', 'Kelsen', '', '', '', '3145278052', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712255700307?alt=media&token=78085205-ceac-4acb-963d-8c29cd3fd0c2', '$2a$10$Jxuow9K/NoTvfhCEJe/rguLBwl9.eEGIA/1ds1.P2hL4MPuB0h552', 1, '2024-04-04 18:35:01', '2024-04-04 18:35:01', NULL),
(43, 'caro1@yopmail.com', 'Carolina', 'Kelsen', '', '', '', '3145278053', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712255778347?alt=media&token=a0b3c1ed-861d-44aa-a0cf-0c2f9f519432', '$2a$10$oDN9aydRwtj.jsQyGppgAu5oNU/gXQ5Uh80PehuSCxslbm23ueNOG', 1, '2024-04-04 18:36:21', '2024-04-04 18:36:21', NULL),
(44, 'kyle@yopmail.com', 'Kylie', 'Jhonson ', '', '', '', '3124548787', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712256017572?alt=media&token=c12d183d-c4d1-41ef-a9f2-2f5b5abfcbaf', '$2a$10$FPWJkbaZdeyW5IgRZTzoJugRDJqR911rq/OVOBpeEI4b2DgOctx9q', 1, '2024-04-04 18:40:19', '2024-04-04 18:40:19', NULL),
(45, 'carlos@gmail.com', 'Carlos', 'Amparo ', '', '', '', '3153214578074', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712260848840?alt=media&token=c12d183d-c4d1-41ef-a9f2-2f5b5abfcbaf', '$2a$10$Z5odPME5s70/PEpr7qIOaOg0vA6qVE0m73EqnSOhlZIxNzfx2qeue', 1, '2024-04-04 20:00:50', '2024-04-04 20:00:50', NULL),
(46, 'ceci@yopmail.com', 'Cecilia ', 'Cruz', '', '', '', '3145278054', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712261016771?alt=media&token=c12d183d-c4d1-41ef-a9f2-2f5b5abfcbaf', '$2a$10$JQyuDVGTukJQXWWfYHms3.qNn3of8SFux1KEJ8Yzes5BzxjvbjBUi', 3, '2024-04-04 20:03:38', '2024-04-04 20:03:38', NULL),
(47, 'tomas@yopmail.com', 'Tomas', 'Uribe ', '', '', '', '3143215458', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712261336759?alt=media&token=0e6e52f5-de14-4eb9-b4ca-7800e91d0ec1', '$2a$10$aF5aiSLCcnm1oFAtYmS7BujPu6A4SpZwp3BexJEqGkacbX3aXir56', 3, '2024-04-04 20:08:58', '2024-04-04 20:08:58', NULL),
(48, 'benja@yopmail.com', 'Benjamin ', 'Pavard', '', '', '', '3169745124', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712261696712?alt=media&token=0e6e52f5-de14-4eb9-b4ca-7800e91d0ec1', '$2a$10$HJjg7SuwThV.We3kQG6Aq.cj.fMaJO.tjOMW1kw0MS3geWAm41e7.', 1, '2024-04-04 20:14:58', '2024-04-04 20:14:58', NULL),
(49, 'silvio@yopmail.com', 'Silvio', 'Brown', '', '', '', '3169704815', 'https://firebasestorage.googleapis.com/v0/b/app-de-delivery-70b08.appspot.com/o/image_1712266003025?alt=media&token=0e6e52f5-de14-4eb9-b4ca-7800e91d0ec1', '$2a$10$oaZ6gTYh8nyzfL2jxzAB0.k1UiKSEQTTV4tYMoDZsiFqn1Og4Wlui', 1, '2024-04-04 21:26:44', '2024-04-04 21:26:44', NULL);

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
(34, 4, '2024-04-03 03:57:32', '2024-04-03 03:57:32'),
(35, 4, '2024-04-03 04:08:51', '2024-04-03 04:08:51'),
(36, 4, '2024-04-03 04:13:07', '2024-04-03 04:13:07'),
(37, 4, '2024-04-03 04:20:34', '2024-04-03 04:20:34'),
(38, 4, '2024-04-03 04:30:53', '2024-04-03 04:30:53'),
(39, 4, '2024-04-03 17:09:32', '2024-04-03 17:09:32'),
(40, 4, '2024-04-04 18:35:02', '2024-04-04 18:35:02'),
(43, 4, '2024-04-04 18:36:21', '2024-04-04 18:36:21'),
(44, 4, '2024-04-04 18:40:19', '2024-04-04 18:40:19'),
(45, 4, '2024-04-04 20:00:50', '2024-04-04 20:00:50'),
(46, 4, '2024-04-04 20:03:38', '2024-04-04 20:03:38'),
(47, 4, '2024-04-04 20:08:58', '2024-04-04 20:08:58'),
(48, 4, '2024-04-04 20:14:58', '2024-04-04 20:14:58'),
(49, 4, '2024-04-04 21:26:44', '2024-04-04 21:26:44');

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
-- Indices de la tabla `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indices de la tabla `store_has_delivery`
--
ALTER TABLE `store_has_delivery`
  ADD PRIMARY KEY (`id_store`,`id_delivery`),
  ADD KEY `id_delivery` (`id_delivery`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `idx_id_store` (`id_store`);

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
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `store`
--
ALTER TABLE `store`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
-- Filtros para la tabla `store_has_delivery`
--
ALTER TABLE `store_has_delivery`
  ADD CONSTRAINT `store_has_delivery_ibfk_1` FOREIGN KEY (`id_store`) REFERENCES `users` (`id_store`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `store_has_delivery_ibfk_2` FOREIGN KEY (`id_delivery`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
