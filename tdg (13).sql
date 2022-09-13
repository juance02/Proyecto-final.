-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 11-08-2022 a las 14:13:27
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tdg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`) VALUES
(1, 'Django', 1, 'Django administration', 1, '', 1, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add Theme', 1, 'add_theme'),
(2, 'Can change Theme', 1, 'change_theme'),
(3, 'Can delete Theme', 1, 'delete_theme'),
(4, 'Can view Theme', 1, 'view_theme'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categoria', 7, 'add_categoria'),
(26, 'Can change categoria', 7, 'change_categoria'),
(27, 'Can delete categoria', 7, 'delete_categoria'),
(28, 'Can view categoria', 7, 'view_categoria'),
(29, 'Can add cuentas', 8, 'add_cuentas'),
(30, 'Can change cuentas', 8, 'change_cuentas'),
(31, 'Can delete cuentas', 8, 'delete_cuentas'),
(32, 'Can view cuentas', 8, 'view_cuentas'),
(33, 'Can add Producto', 9, 'add_producto'),
(34, 'Can change Producto', 9, 'change_producto'),
(35, 'Can delete Producto', 9, 'delete_producto'),
(36, 'Can view Producto', 9, 'view_producto'),
(37, 'Can add user perfil', 10, 'add_userperfil'),
(38, 'Can change user perfil', 10, 'change_userperfil'),
(39, 'Can delete user perfil', 10, 'delete_userperfil'),
(40, 'Can view user perfil', 10, 'view_userperfil'),
(41, 'Can add kardex', 11, 'add_kardex'),
(42, 'Can change kardex', 11, 'change_kardex'),
(43, 'Can delete kardex', 11, 'delete_kardex'),
(44, 'Can view kardex', 11, 'view_kardex'),
(45, 'Can add carrito', 12, 'add_carrito'),
(46, 'Can change carrito', 12, 'change_carrito'),
(47, 'Can delete carrito', 12, 'delete_carrito'),
(48, 'Can view carrito', 12, 'view_carrito'),
(49, 'Can add carrito item', 13, 'add_carritoitem'),
(50, 'Can change carrito item', 13, 'change_carritoitem'),
(51, 'Can delete carrito item', 13, 'delete_carritoitem'),
(52, 'Can view carrito item', 13, 'view_carritoitem'),
(53, 'Can add orden producto', 14, 'add_ordenproducto'),
(54, 'Can change orden producto', 14, 'change_ordenproducto'),
(55, 'Can delete orden producto', 14, 'delete_ordenproducto'),
(56, 'Can view orden producto', 14, 'view_ordenproducto'),
(57, 'Can add orden', 15, 'add_orden'),
(58, 'Can change orden', 15, 'change_orden'),
(59, 'Can delete orden', 15, 'delete_orden'),
(60, 'Can view orden', 15, 'view_orden'),
(61, 'Can add pago', 16, 'add_pago'),
(62, 'Can change pago', 16, 'change_pago'),
(63, 'Can delete pago', 16, 'delete_pago'),
(64, 'Can view pago', 16, 'view_pago'),
(65, 'Can add orden', 17, 'add_orden'),
(66, 'Can change orden', 17, 'change_orden'),
(67, 'Can delete orden', 17, 'delete_orden'),
(68, 'Can view orden', 17, 'view_orden'),
(69, 'Can add orden producto', 18, 'add_ordenproducto'),
(70, 'Can change orden producto', 18, 'change_ordenproducto'),
(71, 'Can delete orden producto', 18, 'delete_ordenproducto'),
(72, 'Can view orden producto', 18, 'view_ordenproducto'),
(73, 'Can add pago', 19, 'add_pago'),
(74, 'Can change pago', 19, 'change_pago'),
(75, 'Can delete pago', 19, 'delete_pago'),
(76, 'Can view pago', 19, 'view_pago'),
(77, 'Can add revision calificacion', 20, 'add_revisioncalificacion'),
(78, 'Can change revision calificacion', 20, 'change_revisioncalificacion'),
(79, 'Can delete revision calificacion', 20, 'delete_revisioncalificacion'),
(80, 'Can view revision calificacion', 20, 'view_revisioncalificacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_carrito`
--

CREATE TABLE `carrito_carrito` (
  `id` bigint(20) NOT NULL,
  `carrito_id` varchar(250) NOT NULL,
  `date_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito_carrito`
--

INSERT INTO `carrito_carrito` (`id`, `carrito_id`, `date_creacion`) VALUES
(26, 'n2tfp6lquwfniz7cekrk09dyssdotvy4', '2022-07-27'),
(27, 'dtxdyzuswlj96dbjclhqv9wbp4deqh5m', '2022-07-27'),
(28, '0futfl3jli9buifkykhi6c3ia5m9dyjl', '2022-07-27'),
(29, 'n8355k6d25iw016fll5m65nxp30fo95s', '2022-07-27'),
(30, '9z5vlyfj80179jl3imqotoeq550jv9lw', '2022-07-27'),
(31, '4srelh928iguzwf7yaobilkem474l6t5', '2022-07-27'),
(32, '04yu0nogyrf52vro8lg0pt3p7apcbtnm', '2022-07-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_carritoitem`
--

CREATE TABLE `carrito_carritoitem` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `carrito_id` bigint(20) DEFAULT NULL,
  `productos_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito_carritoitem`
--

INSERT INTO `carrito_carritoitem` (`id`, `cantidad`, `activo`, `carrito_id`, `productos_id`, `user_id`) VALUES
(44, 2, 1, 26, 3, NULL),
(45, 2, 1, 27, 2, NULL),
(47, 1, 1, 28, 6, NULL),
(48, 1, 1, 29, 3, NULL),
(51, 1, 1, 31, 6, NULL),
(52, 1, 1, 32, 6, NULL),
(60, 1, 1, NULL, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_carritoitem_kardexob`
--

CREATE TABLE `carrito_carritoitem_kardexob` (
  `id` bigint(20) NOT NULL,
  `carritoitem_id` bigint(20) NOT NULL,
  `kardex_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_categoria`
--

CREATE TABLE `categorias_categoria` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias_categoria`
--

INSERT INTO `categorias_categoria` (`id`, `nombre`, `slug`, `descripcion`, `image`, `activo`) VALUES
(1, 'Frutas', 'frutas', 'Muy Buenas frutas', 'Frutas_zf3Cl9W.jpg', 1),
(2, 'Verduras', 'verduras', 'Muy buenas Verduras', 'verduras1_9vZWl0c.jpg', 1),
(3, 'Granos', 'granos', 'Muy buenos Granos', 'granos_ipvOZoh.jpg', 1),
(4, 'Lacteos', 'lacteos', 'Muy buenos Lacteos', 'lacteos_bJKkKva.jpg', 1),
(5, 'Carnes', 'carnes', 'Muy buenas Carnes para el usuario', 'carnes_Gmr7mRR.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_cuentas`
--

CREATE TABLE `cuentas_cuentas` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `nombreusuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `numero_telefono` varchar(50) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superadmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas_cuentas`
--

INSERT INTO `cuentas_cuentas` (`id`, `password`, `nombres`, `apellidos`, `nombreusuario`, `email`, `numero_telefono`, `date_joined`, `last_login`, `is_admin`, `is_staff`, `is_active`, `is_superadmin`) VALUES
(1, 'pbkdf2_sha256$320000$8YThhWgTRxzSVJxNbqMgJo$6BdsyBRvo3cTzU10hHJHHe1wRiIbWPb6srYKNUQUSco=', 'Juan Pablo', 'Ceron', 'juance_', 'juanceronquinayas@gmail.com', '3214565155', '2022-07-20 21:14:20.612145', '2022-08-09 16:05:04.286907', 1, 1, 1, 1),
(2, 'pbkdf2_sha256$320000$YiNjSYg907dnziC6ixWm1m$IEJJI1P5WtuehN8yIzpKUCRULfJk5ezVii5wMEO/T84=', 'JUAN', 'PABLO', 'juapceron1', 'juapceron1@misena.edu.co', '3125611651', '2022-07-20 21:18:25.737075', '2022-08-09 16:38:44.366021', 0, 0, 1, 0),
(3, 'pbkdf2_sha256$320000$Da9EjygX6GgytZ1yVdg2To$MB1LKW5PNC/OBa41ULxeKSFsKb0+VpleFC0I8rksRGk=', 'kevin', 'romero', 'kevin7.kr7821', 'kevin7.kr7821@gmail.com', '323444665', '2022-07-30 19:06:10.233126', '2022-07-30 19:38:39.576767', 0, 0, 1, 0),
(4, 'pbkdf2_sha256$320000$TKSYIpUG61v4wUVeEfhKHy$By8avfcX+azACpYlpNElcgPaE+DSNdPyf3/dqxRBrME=', 'juan pablo', 'Ceron Quinayas', 'juanchorriarte', 'juanchorriarte@gmail.com', '3215969320', '2022-07-30 19:11:01.856045', '2022-07-30 19:11:01.856045', 0, 0, 0, 0),
(5, 'pbkdf2_sha256$320000$Gh5WkI3hCwmzLhY8XRehxj$LHJ9hgJV1Dq9Fh/7NeUVE6J1JDB+1lcy8hLMWS8//04=', 'juan pablo', 'Ceron Quinayas', 'pabloceroqui', 'pabloceroqui@gmail.com', '3215969320', '2022-07-30 19:11:58.186076', '2022-07-30 19:11:58.186076', 0, 0, 0, 0),
(6, 'pbkdf2_sha256$320000$zAqsdlk0UfNrI9f0ZLdnal$67+Ic4U4EPuez8+i9At1WzeJS4cyVuOpahRPXReZqOw=', 'Jose', 'Hernandez', 'josechego.hercam14', 'josechego.hercam14@gmail.com', '3168646125', '2022-07-31 17:16:42.068458', '2022-07-31 17:17:27.903752', 0, 0, 1, 0),
(7, 'pbkdf2_sha256$320000$JHZ1HYpXPLPUT4dw54khm0$Uw04uvXox7LbkqbBS+ADZr4dNcJE8ej9P14QBxccBWA=', 'juan pablo', 'ceron quinayas', 'ceronjuanpablo165', 'ceronjuanpablo165@gmail.com', '3168646124', '2022-08-09 14:02:53.729948', '2022-08-09 14:03:53.538865', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_userperfil`
--

CREATE TABLE `cuentas_userperfil` (
  `id` bigint(20) NOT NULL,
  `direccion_linea_1` varchar(100) NOT NULL,
  `direccion_linea_2` varchar(100) NOT NULL,
  `image_perfil` varchar(100) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `departamento` varchar(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `descripcion` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas_userperfil`
--

INSERT INTO `cuentas_userperfil` (`id`, `direccion_linea_1`, `direccion_linea_2`, `image_perfil`, `ciudad`, `departamento`, `user_id`, `descripcion`) VALUES
(1, 'CRRA_4', 'Ce22211', 'userperfil/paisaje1.jpeg', 'Popayan', 'Cauca', 1, 'muy buen vendedor'),
(2, 'vereda los llanos', 'la huacaswwww', 'userperfil/goku_rZxAGI9.jpg', 'Popayán', 'Caucaakkkkkk', 2, 'muy buenas cosas voy a vender'),
(3, 'vereda', 'jhhhhhhh', 'userperfil/KEVIN_R..jpg', 'popayan', 'cauca', 3, ''),
(4, '', '', 'perfiles/perfil.jfif', '', '', 4, ''),
(5, '', '', 'perfiles/perfil.jfif', '', '', 5, ''),
(6, '', '', 'perfiles/perfil.jfif', '', '', 6, ''),
(7, '', '', 'perfiles/perfil.jfif', '', '', 7, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-06-22 02:11:53.153798', '1', 'Frutas', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-06-22 02:12:24.245879', '2', 'Verduras', 1, '[{\"added\": {}}]', 7, 1),
(3, '2022-06-22 02:12:47.807304', '3', 'Granos', 1, '[{\"added\": {}}]', 7, 1),
(4, '2022-06-22 02:13:22.165654', '4', 'Lacteos', 1, '[{\"added\": {}}]', 7, 1),
(5, '2022-06-22 02:13:53.874732', '5', 'Carnes', 1, '[{\"added\": {}}]', 7, 1),
(6, '2022-06-22 04:12:17.393388', '1', 'Tomates', 1, '[{\"added\": {}}]', 9, 1),
(7, '2022-06-22 04:13:06.760878', '2', 'papas', 1, '[{\"added\": {}}]', 9, 1),
(8, '2022-06-22 04:13:53.941703', '3', 'Moras', 1, '[{\"added\": {}}]', 9, 1),
(9, '2022-06-22 04:14:59.876099', '4', 'naranjas', 1, '[{\"added\": {}}]', 9, 1),
(10, '2022-06-22 04:15:51.391034', '5', 'Pollo Amarillo De La Mejor Calidad', 1, '[{\"added\": {}}]', 9, 1),
(11, '2022-06-22 04:16:53.476035', '6', 'chuleta de cerdo', 1, '[{\"added\": {}}]', 9, 1),
(12, '2022-06-22 04:17:27.959258', '7', 'caffe', 1, '[{\"added\": {}}]', 9, 1),
(13, '2022-06-22 23:57:06.398136', '8', 'Papayas', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 9, 1),
(14, '2022-06-23 02:45:21.941867', '4', 'tierradegrandes@gamil.com', 2, '[{\"changed\": {\"fields\": [\"Is active\"]}}]', 8, 1),
(15, '2022-06-23 12:53:22.012677', '6', 'juanchorriarte@gmail.com', 3, '', 8, 1),
(16, '2022-06-23 12:53:28.156807', '5', 'jghernandez317@misena.edu.co', 3, '', 8, 1),
(17, '2022-06-23 12:53:38.081502', '4', 'tierradegrandes@gamil.com', 3, '', 8, 1),
(18, '2022-06-23 12:53:44.411313', '2', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(19, '2022-06-23 12:53:53.782986', '3', 'camilo.camayo@gmail.com', 3, '', 8, 1),
(20, '2022-06-23 13:18:01.463401', '7', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(21, '2022-06-23 13:21:11.108332', '8', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(22, '2022-06-23 13:28:03.989774', '9', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(23, '2022-06-23 13:31:59.290257', '10', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(24, '2022-06-23 13:43:33.077582', '11', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(25, '2022-06-23 13:46:21.925273', '12', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(26, '2022-06-23 16:03:11.482197', '14', 'juanchorriarte@gmail.com', 3, '', 8, 1),
(27, '2022-06-23 16:03:17.306023', '13', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(28, '2022-06-23 16:06:39.431631', '15', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(29, '2022-06-23 16:23:27.507820', '17', 'jghernandez317@misena.edu.co', 3, '', 8, 1),
(30, '2022-06-23 16:23:33.418096', '16', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(31, '2022-06-23 16:58:19.770413', '19', 'juanchorriarte@gmail.com', 3, '', 8, 1),
(32, '2022-06-23 16:58:30.019351', '18', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(33, '2022-06-23 17:00:38.972223', '20', 'juapceron1@misena.edu.co', 3, '', 8, 1),
(34, '2022-06-24 19:28:44.935751', '1', 'pablo', 1, '[{\"added\": {}}]', 10, 1),
(35, '2022-07-20 21:03:58.702757', '2', 'Juan Pablo', 1, '[{\"added\": {}}]', 10, 1),
(36, '2022-07-20 21:15:16.787332', '1', 'Juan Pablo', 1, '[{\"added\": {}}]', 10, 1),
(37, '2022-07-26 14:40:44.791847', '7', 'Guayaba Tipo Pera Ica 1', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(38, '2022-07-27 16:55:54.503993', '9', '8k5cdf1j2tnrbpl6s1gbhcm7p4mgabmu', 3, '', 12, 1),
(39, '2022-07-27 16:55:54.506571', '8', 'mdkgj6s6n1p3xsf7jw4cnh1ae0d9ezhw', 3, '', 12, 1),
(40, '2022-07-27 16:55:54.509148', '7', 'lrm74xxhwgief070gbl58noyo7lpkllt', 3, '', 12, 1),
(41, '2022-07-27 16:55:54.512221', '6', '4h7452vem0ng2jy9rhsu9gkcqcjlgzxt', 3, '', 12, 1),
(42, '2022-07-27 16:55:54.514674', '5', '8kj28elqogkewoeyk1ybf3vq96fzud1g', 3, '', 12, 1),
(43, '2022-07-27 16:55:54.517620', '4', 'zpgwxd9axjuf4jwj9entb90p2swzd6og', 3, '', 12, 1),
(44, '2022-07-27 16:55:54.522142', '3', 'sg42i8kqe1wsyxv2m7clu4iaixoz624x', 3, '', 12, 1),
(45, '2022-07-27 16:55:54.524999', '2', 'n25mztp09iadqe8x16al1718vpl59uuy', 3, '', 12, 1),
(46, '2022-07-27 16:55:54.527993', '1', 'yjdcpomjhkmsoh7ham48u32c22x3kx36', 3, '', 12, 1),
(47, '2022-07-27 17:55:15.726770', '1', 'calidad:500kg', 1, '[{\"added\": {}}]', 11, 1),
(48, '2022-07-27 17:55:22.328116', '2', 'cantidad:500kg', 1, '[{\"added\": {}}]', 11, 1),
(49, '2022-07-27 17:55:28.876112', '3', 'calidad:muy buena', 1, '[{\"added\": {}}]', 11, 1),
(50, '2022-07-27 17:56:26.974534', '29', 'CarritoItem object (29)', 2, '[{\"changed\": {\"fields\": [\"User\", \"Kardexob\"]}}]', 13, 1),
(51, '2022-07-27 17:56:41.387469', '25', 'CarritoItem object (25)', 2, '[{\"changed\": {\"fields\": [\"User\", \"Kardexob\"]}}]', 13, 1),
(52, '2022-07-27 18:46:20.540458', '29', 'CarritoItem object (29)', 3, '', 13, 1),
(53, '2022-07-27 18:46:20.548560', '28', 'CarritoItem object (28)', 3, '', 13, 1),
(54, '2022-07-27 18:46:20.548560', '27', 'CarritoItem object (27)', 3, '', 13, 1),
(55, '2022-07-27 18:46:20.548560', '26', 'CarritoItem object (26)', 3, '', 13, 1),
(56, '2022-07-27 18:46:20.556512', '25', 'CarritoItem object (25)', 3, '', 13, 1),
(57, '2022-07-27 18:46:20.556512', '24', 'CarritoItem object (24)', 3, '', 13, 1),
(58, '2022-07-27 18:46:20.564518', '23', 'CarritoItem object (23)', 3, '', 13, 1),
(59, '2022-07-27 18:46:20.564518', '22', 'CarritoItem object (22)', 3, '', 13, 1),
(60, '2022-07-27 18:46:20.564518', '21', 'CarritoItem object (21)', 3, '', 13, 1),
(61, '2022-07-27 18:46:20.572444', '19', 'CarritoItem object (19)', 3, '', 13, 1),
(62, '2022-07-27 18:46:20.572444', '17', 'CarritoItem object (17)', 3, '', 13, 1),
(63, '2022-07-27 18:46:20.572444', '16', 'CarritoItem object (16)', 3, '', 13, 1),
(64, '2022-07-27 18:46:20.580470', '14', 'CarritoItem object (14)', 3, '', 13, 1),
(65, '2022-07-27 19:40:17.453955', '22', 'j6x03nn04cyotwoa34c00go95jr5pjyx', 3, '', 12, 1),
(66, '2022-07-27 19:40:17.461898', '21', 'dkm8ayyvv3wqpi7pgxqrgxmcccyl1l48', 3, '', 12, 1),
(67, '2022-07-27 19:40:17.467053', '20', 'nsi1q4kx0ykw9qex49x6uj4k42c7ktzi', 3, '', 12, 1),
(68, '2022-07-27 19:40:17.467053', '19', 'o2rceqbxlyk16f0qlpumnshuuic6u37e', 3, '', 12, 1),
(69, '2022-07-27 19:40:17.475433', '18', '4vzpqagysr3hav9rvv2g6gcoo3grak5p', 3, '', 12, 1),
(70, '2022-07-27 19:40:17.475433', '17', 'u0c86ucw2ytipbraf0u4hiehou5mdta9', 3, '', 12, 1),
(71, '2022-07-27 19:40:17.482746', '16', '7cohn4ikt4brc5rymf1zf7qm0oaedgzm', 3, '', 12, 1),
(72, '2022-07-27 19:40:17.482746', '15', 't8uot7ukcyy9kc0mt0bxs9xq1tqx48y8', 3, '', 12, 1),
(73, '2022-07-27 19:40:17.490888', '14', 'i1wydsa5d6qzj2mw8koel01nt8z2yc0r', 3, '', 12, 1),
(74, '2022-07-27 19:40:17.495517', '13', '85kz4ov0qnpmd6mggg01tzhf6qy9im9s', 3, '', 12, 1),
(75, '2022-07-27 19:40:17.495517', '12', '2ggdig393ihjn1b35est4vz24n8375z4', 3, '', 12, 1),
(76, '2022-07-27 19:40:17.505755', '11', 'bxddom0npyrdl7lctklw5njwxkrx6f9u', 3, '', 12, 1),
(77, '2022-07-27 19:40:17.505755', '10', 'oehwi40khj80283vlnbmvhb6lklsokd1', 3, '', 12, 1),
(78, '2022-07-27 19:58:01.644777', '25', 'hb41nlupj1hgbt56dgihnltb5ubt11j1', 3, '', 12, 1),
(79, '2022-07-27 19:58:01.654043', '24', 'uystjxxnvly2exx38dj8guoa6a5kvxwe', 3, '', 12, 1),
(80, '2022-07-27 19:58:01.654043', '23', '1nj4x6i26574orwcmu2dxuheiz0wgqrs', 3, '', 12, 1),
(81, '2022-07-27 20:23:02.237429', '36', 'CarritoItem object (36)', 3, '', 13, 1),
(82, '2022-07-27 20:23:02.240444', '35', 'CarritoItem object (35)', 3, '', 13, 1),
(83, '2022-07-27 20:40:31.430567', '42', 'CarritoItem object (42)', 3, '', 13, 1),
(84, '2022-07-30 21:16:07.733353', '1', '2222222', 1, '[{\"added\": {}}]', 16, 1),
(85, '2022-07-30 21:17:00.319583', '1', 'juan pablo', 1, '[{\"added\": {}}]', 15, 1),
(86, '2022-07-31 16:17:07.253127', '1', 'juan pablo', 3, '', 17, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(1, 'admin_interface', 'theme'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(12, 'carrito', 'carrito'),
(13, 'carrito', 'carritoitem'),
(7, 'categorias', 'categoria'),
(5, 'contenttypes', 'contenttype'),
(8, 'cuentas', 'cuentas'),
(10, 'cuentas', 'userperfil'),
(15, 'ordenes', 'orden'),
(14, 'ordenes', 'ordenproducto'),
(16, 'ordenes', 'pago'),
(17, 'ordenes_de_compra', 'orden'),
(18, 'ordenes_de_compra', 'ordenproducto'),
(19, 'ordenes_de_compra', 'pago'),
(11, 'productos', 'kardex'),
(9, 'productos', 'producto'),
(20, 'productos', 'revisioncalificacion'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'cuentas', '0001_initial', '2022-06-22 02:08:30.874439'),
(2, 'contenttypes', '0001_initial', '2022-06-22 02:08:30.923766'),
(3, 'admin', '0001_initial', '2022-06-22 02:08:31.157983'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-22 02:08:31.173212'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-22 02:08:31.186542'),
(6, 'admin_interface', '0001_initial', '2022-06-22 02:08:31.238472'),
(7, 'admin_interface', '0002_add_related_modal', '2022-06-22 02:08:31.404131'),
(8, 'admin_interface', '0003_add_logo_color', '2022-06-22 02:08:31.445534'),
(9, 'admin_interface', '0004_rename_title_color', '2022-06-22 02:08:31.468801'),
(10, 'admin_interface', '0005_add_recent_actions_visible', '2022-06-22 02:08:31.499892'),
(11, 'admin_interface', '0006_bytes_to_str', '2022-06-22 02:08:31.643909'),
(12, 'admin_interface', '0007_add_favicon', '2022-06-22 02:08:31.712920'),
(13, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2022-06-22 02:08:31.794000'),
(14, 'admin_interface', '0009_add_enviroment', '2022-06-22 02:08:31.879350'),
(15, 'admin_interface', '0010_add_localization', '2022-06-22 02:08:31.911085'),
(16, 'admin_interface', '0011_add_environment_options', '2022-06-22 02:08:32.021052'),
(17, 'admin_interface', '0012_update_verbose_names', '2022-06-22 02:08:32.029871'),
(18, 'admin_interface', '0013_add_related_modal_close_button', '2022-06-22 02:08:32.066136'),
(19, 'admin_interface', '0014_name_unique', '2022-06-22 02:08:32.104959'),
(20, 'admin_interface', '0015_add_language_chooser_active', '2022-06-22 02:08:32.150522'),
(21, 'admin_interface', '0016_add_language_chooser_display', '2022-06-22 02:08:32.199270'),
(22, 'admin_interface', '0017_change_list_filter_dropdown', '2022-06-22 02:08:32.212969'),
(23, 'admin_interface', '0018_theme_list_filter_sticky', '2022-06-22 02:08:32.261502'),
(24, 'admin_interface', '0019_add_form_sticky', '2022-06-22 02:08:32.344598'),
(25, 'admin_interface', '0020_module_selected_colors', '2022-06-22 02:08:32.429427'),
(26, 'admin_interface', '0021_file_extension_validator', '2022-06-22 02:08:32.445299'),
(27, 'admin_interface', '0022_add_logo_max_width_and_height', '2022-06-22 02:08:32.527014'),
(28, 'admin_interface', '0023_theme_foldable_apps', '2022-06-22 02:08:32.568479'),
(29, 'admin_interface', '0024_remove_theme_css', '2022-06-22 02:08:32.592103'),
(30, 'contenttypes', '0002_remove_content_type_name', '2022-06-22 02:08:32.739435'),
(31, 'auth', '0001_initial', '2022-06-22 02:08:33.079337'),
(32, 'auth', '0002_alter_permission_name_max_length', '2022-06-22 02:08:33.167246'),
(33, 'auth', '0003_alter_user_email_max_length', '2022-06-22 02:08:33.187127'),
(34, 'auth', '0004_alter_user_username_opts', '2022-06-22 02:08:33.201479'),
(35, 'auth', '0005_alter_user_last_login_null', '2022-06-22 02:08:33.210449'),
(36, 'auth', '0006_require_contenttypes_0002', '2022-06-22 02:08:33.213440'),
(37, 'auth', '0007_alter_validators_add_error_messages', '2022-06-22 02:08:33.239168'),
(38, 'auth', '0008_alter_user_username_max_length', '2022-06-22 02:08:33.246781'),
(39, 'auth', '0009_alter_user_last_name_max_length', '2022-06-22 02:08:33.276056'),
(40, 'auth', '0010_alter_group_name_max_length', '2022-06-22 02:08:33.306883'),
(41, 'auth', '0011_update_proxy_permissions', '2022-06-22 02:08:33.323929'),
(42, 'auth', '0012_alter_user_first_name_max_length', '2022-06-22 02:08:33.336221'),
(43, 'categorias', '0001_initial', '2022-06-22 02:08:33.370235'),
(44, 'cuentas', '0002_rename_cuentas_cuenta', '2022-06-22 02:08:33.818389'),
(45, 'cuentas', '0003_rename_cuenta_cuentas', '2022-06-22 02:08:33.979640'),
(46, 'cuentas', '0004_rename_numero_telfono_cuentas_numero_telefono', '2022-06-22 02:08:34.000693'),
(47, 'productos', '0001_initial', '2022-06-22 02:08:34.090870'),
(48, 'productos', '0002_alter_producto_image', '2022-06-22 02:08:34.211284'),
(49, 'sessions', '0001_initial', '2022-06-22 02:08:34.278211'),
(50, 'productos', '0003_producto_user', '2022-06-22 23:31:38.104045'),
(51, 'productos', '0004_alter_producto_slug', '2022-06-23 00:16:22.848407'),
(52, 'cuentas', '0005_userperfil', '2022-06-24 19:25:08.709375'),
(53, 'productos', '0005_kardex', '2022-07-12 15:37:23.117600'),
(54, 'productos', '0006_kardexmanager_alter_kardex_kardex_categoria', '2022-07-12 15:37:23.152975'),
(55, 'productos', '0007_delete_kardexmanager', '2022-07-12 15:37:23.173446'),
(56, 'productos', '0008_alter_kardex_producto', '2022-07-12 15:37:23.182885'),
(57, 'carrito', '0001_initial', '2022-07-12 15:37:23.388811'),
(58, 'carrito', '0002_carritoitem_kardex', '2022-07-12 15:37:23.582807'),
(59, 'carrito', '0003_rename_kardex_carritoitem_karde', '2022-07-12 15:37:23.604001'),
(60, 'carrito', '0004_remove_carritoitem_karde_carritoitem_kardee', '2022-07-12 15:37:23.807741'),
(61, 'carrito', '0005_rename_kardee_carritoitem_karde', '2022-07-12 15:37:23.846110'),
(62, 'carrito', '0006_remove_carritoitem_karde_carritoitem_kardex', '2022-07-12 15:37:24.076646'),
(63, 'carrito', '0007_remove_carritoitem_kardex', '2022-07-12 15:37:24.105363'),
(64, 'carrito', '0008_carritoitem_kardex', '2022-07-12 15:37:24.295371'),
(65, 'carrito', '0009_rename_kardex_carritoitem_kardexob', '2022-07-12 15:37:24.316087'),
(66, 'carrito', '0010_carritoitem_user_alter_carritoitem_carrito', '2022-07-27 16:46:22.207210'),
(67, 'productos', '0009_alter_producto_image', '2022-07-27 16:46:22.223927'),
(68, 'ordenes', '0001_initial', '2022-07-30 16:24:21.923929'),
(69, 'ordenes', '0002_rename_nombres_orden_nombre', '2022-07-30 18:45:07.897623'),
(70, 'ordenes', '0003_remove_orden_nombre_orden_nombres', '2022-07-30 19:32:28.438827'),
(71, 'ordenes', '0004_remove_orden_nombres', '2022-07-30 20:28:57.200122'),
(72, 'ordenes', '0005_orden_nombres', '2022-07-30 21:12:58.975318'),
(73, 'ordenes', '0006_remove_ordenproducto_kardex_and_more', '2022-07-30 21:20:47.726935'),
(74, 'ordenes_de_compra', '0001_initial', '2022-07-30 21:23:26.252282'),
(75, 'ordenes_de_compra', '0002_rename_impuesto_orden_inpuesto_alter_orden_ip', '2022-07-31 15:34:49.912959'),
(76, 'cuentas', '0006_userperfil_descripcion', '2022-08-01 23:09:42.868719'),
(77, 'cuentas', '0007_alter_userperfil_descripcion', '2022-08-01 23:14:54.487364'),
(78, 'ordenes_de_compra', '0003_remove_ordenproducto_kardex_ordenproducto_kardex', '2022-08-04 00:42:34.137207'),
(79, 'ordenes_de_compra', '0004_rename_estado_id_pago_estado', '2022-08-04 00:42:34.167303'),
(80, 'ordenes_de_compra', '0005_rename_estado_pago_status', '2022-08-04 00:42:34.241904'),
(81, 'ordenes_de_compra', '0006_rename_pagos_metodos_pago_payment_method', '2022-08-04 00:42:34.276287'),
(82, 'ordenes_de_compra', '0007_rename_producto_precio_ordenproducto_precio', '2022-08-04 00:42:34.319278'),
(83, 'productos', '0010_revisioncalificacion', '2022-08-09 14:01:44.849324'),
(84, 'productos', '0011_rename_productos_revisioncalificacion_producto', '2022-08-09 14:01:45.029802');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0h4wj1f40s25vd2zkb56lsm55qgk76iy', '.eJxVjMsOwiAQRf-FtSHDo0Nx6d5vIDAwUjU0Ke3K-O_apAvd3nPOfYkQt7WGrZclTFmchRKn3y1FepS2g3yP7TZLmtu6TEnuijxol9c5l-flcP8Oauz1W5uinCVABsSSMQJZhgTsyTgDSo8evUZro3dFm0xjGryDITMmBlYo3h_LNDdI:1o4pXI:kKcFAKOGN5Lx_HBQ3mo4mpsWFb0wnB4YLBWu6ozG-MU', '2022-07-08 20:04:12.541237'),
('1b5hf7ccqm0qcrpmi9d0r1tic38rwvz7', '.eJxVjEEOwiAQRe_C2hCBoU5duu8ZmmEYpGogKe3KeHfbpAvd_vf-e6uR1iWPa5N5nKK6KqdOv1sgfkrZQXxQuVfNtSzzFPSu6IM2PdQor9vh_gUytby9LRpH4MEyAEdAKyAXSNgTdFYic--SFc_nLRnEg0OhLqDhZDA5Y9TnC-DkOC8:1oHrnc:LcyVsgid-62Sv-hPTTFQpcLAN12SYyESVnlDwxM3Qhc', '2022-08-13 19:06:56.472299'),
('1ujngpld3ngpm4ddmowtla07jgf8ovxo', '.eJxtjDsOwjAQRO_iGlnxN5iSnjNYu_YuDiBHiuMKcXcSKQ0SxTTz3sxb9CmLi9DiJCL0tcTeaIn_OoT0pLqD_IB6n2Wa67pMKHdFHrTJ25zpdT3cn4MCrWxrOwR0KkAwXjtmYmBvmLRWzicezgFVNiNgoATgtyAptsoa60dnM4nPF5uvOvM:1o4rk8:B9aLsbNV12x7npVzkKMnuprsqGCh1ieeDQDgN_ZBM48', '2022-07-08 22:25:36.669753'),
('2v62he7y20tjbv5zo48cgoxpb1zdz1ao', '.eJxVjEEOwiAQRe_C2hCYKQIu3fcMZMqMUjU0Ke3KeHdD0oVu_3vvv1WifStpb7KmmdVFeXX63SbKT6kd8IPqfdF5qds6T7or-qBNjwvL63q4fweFWul1jBgFxQWfz5EJvLPkbTBohxB8uGVwBsBlIbYGB3RggYzLMVrDKOrzBbuINoc:1oLPpp:-zC190qvg6qAQgv1ounpU1dCCa2W9_zkomnRaU3NNMs', '2022-08-23 14:03:53.542547'),
('45f8htx6atqfx3gbvzjqur2ylamg5sx0', 'e30:1oLPpR:zmALWGq8WWKCtF_i4_iP-kp--UHOiLNOCuUXn5bcaEc', '2022-08-23 14:03:29.411505'),
('48a7r8fc529e0js66e4nuik50g6r3bap', '.eJxtjMEKgzAQRP8l5xKyMYmxx979hrDZXattMWD0VPrvVfBSKANzmDczb7VNrK4K1EUl3NYxbVWW9C_LSE-ZD8APnO9FU5nXZcr6qOiTVt0Xltft7P4cjFjHfe0c7mJvo9ktU2RgsEMMYERcFyhDG9FYN5ANrsMGAoodvCdupG1Rfb5_zDok:1oI2kH:k7bjD8Ywr-eMFmoNPv1PufVjFCtdjAfjTnxxuK8AbAI', '2022-08-14 06:48:13.626938'),
('5kvnczlgfxs52p1zxbozd4mvj6di33fv', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oK4H2:oQ8TfuuCvzXMKihnnqBHd_-Dt6nq1BFSErExtNzgnP8', '2022-08-19 20:50:24.506617'),
('5rpjlmtl13xyv3ystma5rtk0eoin6au0', '.eJxVjDsOwjAQBe_iGlneGP8o6XMGy_bu4gBypDipEHeHSCmgfTPzXiKmba1x67TECcVFDOL0u-VUHtR2gPfUbrMsc1uXKctdkQftcpyRntfD_TuoqddvrQdr81kVTZkhYPCojAdGy9axAmYGB5wMZCqUvAZtlSNGEwIFrbR4fwDriTgR:1oLSFg:5HfjhIYilFnpnMXW_GXMzDam2FhAt8xDe0XHzYqXAeM', '2022-08-23 16:38:44.366021'),
('5xlgpxtt7qg3deemdnwuylvfrttshmau', 'e30:1oHsJM:j6Kw4_QXRg8C4T2DiVpVo9vdntaksTOGS1H3X9UkgYc', '2022-08-13 19:39:44.426525'),
('67151j8nqyt72tzw9qxw2vvbvcemcsbj', 'e30:1oLQCb:OuY7VBAL7g1KHfrEvJX-lJZolYsvC6_xqiqInmbiDSU', '2022-08-23 14:27:25.281840'),
('8jauvri1erzghs8k5unswj6xekwo924k', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oJflf:BHfhuFCsIhe-8YD3TYX1sHapxjwl69yOcYaAYsm4ovQ', '2022-08-18 18:40:23.549391'),
('d379f3su2770zxgg4xs31e7f4ct4g953', '.eJxVjDsOwjAQRO_iGln-EWNK-pzB2vWucQDZUpxUiLuTSCmgmGbem3mLCOtS4tp5jhOJqzDi9NshpCfXHdAD6r3J1OoyTyh3RR60y7ERv26H-3dQoJdtjUEj5ZQME4Le4owKfjg7vASTfdIZAiKhd14zKEKrQINFR5gGm1l8viHTOZI:1o4q1f:Vs62Tqj7-gryDJYYHq_iOSKYXdWbt0w8wdWKdmHzcRw', '2022-07-08 20:35:35.159235'),
('dpapopct3tdqr4c56qbyghcvy2gp6qb3', 'e30:1oLRil:5THPQmtFGPuk6mOla0mw8AbQt9-a4JKV__-J_Ze_RzI', '2022-08-23 16:04:43.248679'),
('frq4ehv477jb1g4vg3y5m0gxqnkw7l7q', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oI2nr:wB5pW1czRkZYtobjVz27PWw5hZ77qdQzGRBdjkf1xog', '2022-08-14 06:51:55.120530'),
('fuov43ur46vqbavztzb2g27dkjrh9v3k', '.eJxVjEEOwiAQRe_C2pAywEBduvcMBJhBqqYkpV0Z765NutDtf-_9lwhxW2vYOi9hInEWWpx-txTzg-cd0D3OtyZzm9dlSnJX5EG7vDbi5-Vw_w5q7PVbg0M_ao9uSCqONLBVbIGpOK2BFNqS0VmCbLxhsNqOCQGcwZwxcSni_QG-Mzda:1o5AV4:_Gjb7btX1m67efwm99Rej2hUe5-FWHYpes9T9v7Koxo', '2022-07-09 18:27:18.114406'),
('fuwv80n25ue3fzkd36avflovqftevb5b', 'e30:1oK4jW:QXCNyl8uzLVeBqwIUqpbveHYjIkCj6RSQy4hPgOQ5hg', '2022-08-19 21:19:50.682989'),
('gvt4hisrj0th01r2bp3jmjzwqhbuff9r', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oHZhW:b8dm5TDnqO3ZSWhuxoYVdZryLu7EA4IQwbA7x3qILKA', '2022-08-12 23:47:26.885718'),
('h5921igcg4cv2hxctbw7mxsxg3fdz6h5', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oHrxR:--XGxP6zNtiyMJcQ6dUkucAySsKS2cX5nx1sX18mLy8', '2022-08-13 19:17:05.814569'),
('hxg76td5mcc2dsmsunbhs5ngqdrdz756', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oLRj6:9JzXLl7Pm1OaMFZ5JhdgGDt-4xMWC_9j5Y3_t31iDNk', '2022-08-23 16:05:04.293588'),
('iu2yotc7u9ts2wg57xp5jdaf47y645fz', '.eJxVjEEOwiAQRe_C2hCBoU5duu8ZmmEYpGogKe3KeHfbpAvd_vf-e6uR1iWPa5N5nKK6KqdOv1sgfkrZQXxQuVfNtSzzFPSu6IM2PdQor9vh_gUytby9LRpH4MEyAEdAKyAXSNgTdFYic--SFc_nLRnEg0OhLqDhZDA5Y9TnC-DkOC8:1oHrnc:LcyVsgid-62Sv-hPTTFQpcLAN12SYyESVnlDwxM3Qhc', '2022-08-13 19:06:56.472299'),
('joa584zc94vejm6shzmtpcfpdnvhe89n', '.eJxVjMsOwiAQRf-FtSHDo0Nx6d5vIDAwUjU0Ke3K-O_apAvd3nPOfYkQt7WGrZclTFmchRKn3y1FepS2g3yP7TZLmtu6TEnuijxol9c5l-flcP8Oauz1W5uinCVABsSSMQJZhgTsyTgDSo8evUZro3dFm0xjGryDITMmBlYo3h_LNDdI:1o3ra2:JCLLI8nW35tK-Q8-gvIn47U0bdb-jWFKC4fr6gQxlms', '2022-07-06 04:03:02.849615'),
('k6190x3axy7j4itgyx3060owdsuvca04', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oJb0Z:spf8CUZrNW5I-VngzcKF9kI6ATm4ysR3RA8_e6hJ7l8', '2022-08-18 13:35:27.928060'),
('kxpssqg2rg43n7dnoz6i809t2h7p8o8g', 'e30:1oICW2:pNsKqzy9ndjFMsvKbU72DxXLinNCo6EbUhs89Hxq2no', '2022-08-14 17:14:10.646453'),
('lcv6m3b7r0fnoyte1zmn3smrsoxh79zu', '.eJxVjMsOwiAQRf-FtSG8hMGl-34DGQaQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYE7uwMzv9bhHpkdsO0h3brXPqbV3myHeFH3Twqaf8vB7u30HFUb-1laBkSS5HQiCv0YCWPilfLKJSQMYakYUmZyyQk5CL0qjBFuG1QMfeH9wPN00:1o5VmU:sVc8lNM6yRaL8wrRvh-wH4AoNxNubtT4Ig4PNK4nutI', '2022-07-10 17:10:42.467133'),
('lha4ql0zr8t8ehfej522ljd1x2f4m1si', '.eJxVjDkOwjAUBe_iGlneFDuU9JzB-v4LDiBHipMKcXeIlALaNzPvpTJsa81b5yVPpM4qqNPvVgAf3HZAd2i3WePc1mUqelf0Qbu-zsTPy-H-HVTo9VszD2woWfSeZQSHKBKKtc4QxhJBjBCkYMQPgZKnAImBrCNxxdIY1fsDHRA5Rg:1o5Bfe:esWvy0dlhhqx1aavGWjsYFQFuqASS2lbbMZp8OJ0sLo', '2022-07-09 19:42:18.589984'),
('lmj379pm7oj36htja0llb891xlxv1coc', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oHt5T:2hutDFYkVdlkfm2lxl0Mm-q73adIbvdGoeBeJlw7ikM', '2022-08-13 20:29:27.312188'),
('n25mztp09iadqe8x16al1718vpl59uuy', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oGKXO:Yon_h4MOL5JxBkaDM5FOJOwVPbWJpxcNneHwQ1VByMc', '2022-08-09 13:23:50.093607'),
('odgs7qmjrt1bsokvbwycolk6a1gl23fc', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oLRdw:z4_SbMHhHKdxFadU8YzpfpcvLIiWsL6j9pItyB3Yl_8', '2022-08-23 15:59:44.383268'),
('p4v6kgum68q6fgxxppg0wye68jh16irg', '.eJxVjMsOwiAQRf-FtSGDPAou3fcbyAwMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxYX4cTpdyNMD247yHdst1mmua3LRHJX5EG7HOfMz-vh_h1U7PVbcwkU0OpCYB0PaENKg3NZETuv0QBqn1M2YIsnAGMpkFJQzsYUzT6J9wf9VTg0:1oEGvm:guLvTCFUusvuANUxLIIXzT1QM0BdQVA2RhGChFAc1qo', '2022-08-03 21:08:30.578431'),
('qgo7izg5htr6w97c2cxprljjsg2c67zv', '.eJxVjDsOwyAQRO9CHSEDXj4p0_sMaGFXwUkEkrGrKHePLblIqpHmvZm3iLitJW6dlziTuAorLr9dwvzkegB6YL03mVtdlznJQ5En7XJqxK_b6f4dFOxlX_ugQXs9ggYmBRmNVd7pwJSCVajJ2hEBB-cp-D0SJEcDg0FrMjKLzxe6OTd7:1oICZD:AeecAmvuhXXqEoNNPDvr9XRt_qqlcnG8K__sEtWXftQ', '2022-08-14 17:17:27.906751'),
('qjyrt7pwuegrvzkey09mccnvkwg4v9e1', '.eJxVjMsOwiAQRf-FtSE8ygAu3fcbyACjVA0kpV0Z_11JutDVTe45OS8WcN9K2DutYcnszCQ7_X4R04PqAPmO9dZ4anVbl8iHwg_a-dwyPS-H-xco2MvIGgDvXbQSpizEd529SkVOKyvJCAQlfQKf02SNRkIHUnuIzkR0ngR7fwClFjaW:1o5BYF:RLUWFy_XGdsMU9AF-46RELbhDRDT1LxZMjp3oCCL3Eo', '2022-07-09 19:34:39.704807'),
('rl3y8uacty5jdrjr8l8bt7z365g3t66l', '.eJxVjEsOAiEQBe_C2hA-Aw0u3XsG0g09Mmogmc_KeHedZBa6fVX1XiLhtta0LTynqYiz0FGcfkfC_OC2k3LHdusy97bOE8ldkQdd5LUXfl4O9--g4lK_dXB69AMacJYYRqLAEKxH42JAZdiAdUBZkUVfBgzRe7ABBp19RmVZvD_46jeG:1o4Pxq:fz_KY-wl-L55gzEOEcb5QO03tMf3BpV_H_ZofPQqafk', '2022-07-07 16:45:54.409144'),
('sftsz3v9bz69ethpt472swnvl1ck6enh', '.eJxVjEEOwiAQRe_C2hCBoU5duu8ZmmEYpGogKe3KeHfbpAvd_vf-e6uR1iWPa5N5nKK6KqdOv1sgfkrZQXxQuVfNtSzzFPSu6IM2PdQor9vh_gUytby9LRpH4MEyAEdAKyAXSNgTdFYic--SFc_nLRnEg0OhLqDhZDA5Y9TnC-DkOC8:1oHrnc:LcyVsgid-62Sv-hPTTFQpcLAN12SYyESVnlDwxM3Qhc', '2022-08-13 19:06:56.852086'),
('sg42i8kqe1wsyxv2m7clu4iaixoz624x', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oGLYe:HVwUlkv-N2eIlT4p0ve5aQOOHaAv0DZ5zBq5f4Hz30I', '2022-08-09 14:29:12.217777'),
('teo2n5loeniwo1oum4jjipub5ipv8ocp', '.eJxVjMsOwiAQRf-FtSHDo0Nx6d5vIDAwUjU0Ke3K-O_apAvd3nPOfYkQt7WGrZclTFmchRKn3y1FepS2g3yP7TZLmtu6TEnuijxol9c5l-flcP8Oauz1W5uinCVABsSSMQJZhgTsyTgDSo8evUZro3dFm0xjGryDITMmBlYo3h_LNDdI:1o3rsB:-0YNo1CmjYHBDOU-Fqi7fGxA4SEOmqriidYvlQlw_BI', '2022-07-06 04:21:47.849412'),
('u0c86ucw2ytipbraf0u4hiehou5mdta9', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oGl1k:P8z9h-rrsj35B-XMKOeY-ltShToj7cl3bwMQXdC8mzI', '2022-08-10 17:40:56.028701'),
('uemxhw3g52jkwkr0udmujlc747u91r13', '.eJxVjEEOwiAQRe_C2hCBoU5duu8ZmmEYpGogKe3KeHfbpAvd_vf-e6uR1iWPa5N5nKK6KqdOv1sgfkrZQXxQuVfNtSzzFPSu6IM2PdQor9vh_gUytby9LRpH4MEyAEdAKyAXSNgTdFYic--SFc_nLRnEg0OhLqDhZDA5Y9TnC-DkOC8:1oHsIJ:xCv3Ql8b5A93OJ2JNcXjIu1QwLKePBoqOx4yzF_i7zQ', '2022-08-13 19:38:39.576767'),
('umm7wx9fz7c5k9x2mnyuw0lrdbv75w9h', '.eJxVjDsOwjAQBe_iGlneGP8o6XMGy_bu4gBypDipEHeHSCmgfTPzXiKmba1x67TECcVFDOL0u-VUHtR2gPfUbrMsc1uXKctdkQftcpyRntfD_TuoqddvrQdr81kVTZkhYPCojAdGy9axAmYGB5wMZCqUvAZtlSNGEwIFrbR4fwDriTgR:1oIck3:u380POXAk4L15vpBmL_9aPNI0TttnMl1j3sbkud6a58', '2022-08-15 21:14:23.683206'),
('uulaui6hoq9jch6c6eqpe71brf44r5af', '.eJxVjMsOwiAQRf-FtSHDo0Nx6d5vIDAwUjU0Ke3K-O_apAvd3nPOfYkQt7WGrZclTFmchRKn3y1FepS2g3yP7TZLmtu6TEnuijxol9c5l-flcP8Oauz1W5uinCVABsSSMQJZhgTsyTgDSo8evUZro3dFm0xjGryDITMmBlYo3h_LNDdI:1o4pXI:kKcFAKOGN5Lx_HBQ3mo4mpsWFb0wnB4YLBWu6ozG-MU', '2022-07-08 20:04:12.797998'),
('vaili08a5xck90byhxdxbwc3rgytnhnk', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oGoFq:YOSF2X7wZ35lg6AqiA1QHJL9S8CSJruGiYY6j202cdo', '2022-08-10 21:07:42.917690'),
('xxgju1ytrrsc17pn8if9bsb09b8wdvkj', 'e30:1oEuk0:IuGgv5a8ddJSAAiyPOO77KCWdAruvO4PG3Zh7YZb8K8', '2022-08-05 15:39:00.081161'),
('yjdcpomjhkmsoh7ham48u32c22x3kx36', '.eJxVjL0OwyAQg9-FuUKB8JeO3fMM6OCOkrYCKSRT1XcvkTK0suTBn-0387Bv2e-NVr8guzLBLr9ZgPikcgB8QLlXHmvZ1iXwo8JP2vhckV63s_t3kKHlvlYKulBLN3QL0aFAIZMzYiBSk4lBWAeDVClKoyYYhQGSSeuII1kL7PMF1343ww:1oEurb:AAcvNUSXY3n_cj1X34Kh6kPJSyUhmeTSreJVdvKqhmk', '2022-08-05 15:46:51.415257'),
('zpgwxd9axjuf4jwj9entb90p2swzd6og', 'e30:1oGLrJ:_dBlOgxjImOuZziMQWBriW4b54Qy9eRmnCDPsVnmTbM', '2022-08-09 14:48:29.270287');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_de_compra_orden`
--

CREATE TABLE `ordenes_de_compra_orden` (
  `id` bigint(20) NOT NULL,
  `orden_numero` varchar(20) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `numero_telefono` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion_linea_1` varchar(100) NOT NULL,
  `direccion_linea_2` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `orden_descripcion` varchar(100) NOT NULL,
  `orden_total` double NOT NULL,
  `inpuesto` double NOT NULL,
  `estado` varchar(50) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `confirmacion_orden` tinyint(1) NOT NULL,
  `orden_creacion` datetime(6) NOT NULL,
  `orden_actualizada` datetime(6) NOT NULL,
  `pagos_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes_de_compra_orden`
--

INSERT INTO `ordenes_de_compra_orden` (`id`, `orden_numero`, `nombres`, `apellidos`, `numero_telefono`, `email`, `direccion_linea_1`, `direccion_linea_2`, `ciudad`, `departamento`, `orden_descripcion`, `orden_total`, `inpuesto`, `estado`, `ip`, `confirmacion_orden`, `orden_creacion`, `orden_actualizada`, `pagos_id`, `user_id`) VALUES
(1, '202208051', 'Juan Pablo', 'Ceron Quinayas', '3215969324', 'juapceron1@misena.edu.co', 'cra 231', 'vereda los llanos', 'Popayan', 'Cauca', 'jaunnn', 102000, 2000, 'Nuevo', '127.0.0.1', 1, '2022-08-05 20:45:21.223858', '2022-08-05 20:45:45.992353', NULL, 2),
(2, '202208052', 'Juan Pablo', 'ceron quinayas', '3215969324', 'juapceron1@misena.edu.co', 'Carre2222', 'vereda los llanos', 'Popayan', 'Cauca', '', 3.2538, 0.0638, 'Nuevo', '127.0.0.1', 1, '2022-08-05 20:48:51.402954', '2022-08-05 20:49:02.962315', NULL, 2),
(3, '202208053', 'Juan Pablo', 'Ceron Quinayas', '3215969322', 'juanceronquinayas@gmail.com', 'vereda los llanos', 'Barrio sjsjsjs', 'Popayan', 'Cauca', '', 3.2538, 0.0638, 'Nuevo', '127.0.0.1', 1, '2022-08-05 20:52:06.321628', '2022-08-05 20:52:18.052106', NULL, 1),
(4, '202208094', 'juan pablo', 'ceron quinayas', '3168646124', 'ceronjuanpablo165@gmail.com', 'vereda los llanos', 'Barrio sjsjsjs', 'Timbio', 'Cauca', 'ffffffffff', 13770, 270, 'Nuevo', '127.0.0.1', 1, '2022-08-09 14:49:33.551270', '2022-08-09 14:49:52.710140', NULL, 7),
(5, '202208095', 'juan pablo', 'ceron quinayas', '3168646124', 'ceronjuanpablo165@gmail.com', 'vereda los llanos', 'Barrio sjsjsjs', 'Timbio', 'Cauca', '', 27540, 540, 'Nuevo', '127.0.0.1', 1, '2022-08-09 14:52:18.622020', '2022-08-09 14:52:29.260377', NULL, 7),
(6, '202208096', 'Juan Pablo', 'Ceron Quinayas', '3215969320', 'juanceronquinayas@gmail.com', 'gytyytvcycv', 'la huacaswwww', 'Popayan', 'Cauca', 'mjjjh', 14.677800000000001, 0.2878, 'Nuevo', '127.0.0.1', 1, '2022-08-09 15:53:14.492729', '2022-08-09 15:53:31.630214', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_de_compra_ordenproducto`
--

CREATE TABLE `ordenes_de_compra_ordenproducto` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `ordenado` tinyint(1) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_actualizado` datetime(6) NOT NULL,
  `orden_id` bigint(20) NOT NULL,
  `pagos_id` bigint(20) NOT NULL,
  `productos_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes_de_compra_ordenproducto`
--

INSERT INTO `ordenes_de_compra_ordenproducto` (`id`, `cantidad`, `precio`, `ordenado`, `fecha_creacion`, `fecha_actualizado`, `orden_id`, `pagos_id`, `productos_id`, `user_id`) VALUES
(1, 2, 50000, 1, '2022-08-05 20:45:45.997336', '2022-08-05 20:45:46.010295', 1, 1, 2, 2),
(2, 1, 3.19, 1, '2022-08-05 20:49:02.969291', '2022-08-05 20:49:02.977266', 2, 2, 16, 2),
(3, 1, 3.19, 1, '2022-08-05 20:52:18.057094', '2022-08-05 20:52:18.065471', 3, 3, 16, 1),
(4, 1, 13500, 1, '2022-08-09 14:49:52.716036', '2022-08-09 14:49:52.724687', 4, 4, 13, 7),
(5, 2, 13500, 1, '2022-08-09 14:52:29.276015', '2022-08-09 14:52:29.291670', 5, 5, 13, 7),
(6, 1, 14.39, 1, '2022-08-09 15:53:31.635425', '2022-08-09 15:53:31.644293', 6, 6, 21, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_de_compra_ordenproducto_kardex`
--

CREATE TABLE `ordenes_de_compra_ordenproducto_kardex` (
  `id` bigint(20) NOT NULL,
  `ordenproducto_id` bigint(20) NOT NULL,
  `kardex_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_de_compra_pago`
--

CREATE TABLE `ordenes_de_compra_pago` (
  `id` bigint(20) NOT NULL,
  `pagos_id` varchar(100) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `monto_id` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes_de_compra_pago`
--

INSERT INTO `ordenes_de_compra_pago` (`id`, `pagos_id`, `payment_method`, `monto_id`, `status`, `fecha_creacion`, `user_id`) VALUES
(1, '78P52167YJ993045C', 'Paypal', '102000.0', 'COMPLETED', '2022-08-05 20:45:45.989365', 2),
(2, '1KD941314M454000E', 'Paypal', '3.2538', 'COMPLETED', '2022-08-05 20:49:02.959325', 2),
(3, '6ML2991703239203P', 'Paypal', '3.2538', 'COMPLETED', '2022-08-05 20:52:18.048438', 1),
(4, '54243715GH4570606', 'Paypal', '13770.0', 'COMPLETED', '2022-08-09 14:49:52.704044', 7),
(5, '0SN23032SC676182D', 'Paypal', '27540.0', 'COMPLETED', '2022-08-09 14:52:29.260377', 7),
(6, '2P989646BX880614H', 'Paypal', '14.677800000000001', 'COMPLETED', '2022-08-09 15:53:31.628186', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_kardex`
--

CREATE TABLE `productos_kardex` (
  `id` bigint(20) NOT NULL,
  `kardex_categoria` varchar(100) NOT NULL,
  `kardex_value` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos_kardex`
--

INSERT INTO `productos_kardex` (`id`, `kardex_categoria`, `kardex_value`, `activo`, `fecha_creacion`, `producto_id`) VALUES
(1, 'calidad', '500kg', 1, '2022-07-27 17:55:15.725774', 6),
(2, 'cantidad', '500kg', 1, '2022-07-27 17:55:22.328116', 6),
(3, 'calidad', 'muy buena', 1, '2022-07-27 17:55:28.875121', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_producto`
--

CREATE TABLE `productos_producto` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `precio` double NOT NULL,
  `Informacion_de_produccion` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `descripcion` longtext NOT NULL,
  `destacado` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `modificacion_date` datetime(6) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos_producto`
--

INSERT INTO `productos_producto` (`id`, `nombre`, `slug`, `precio`, `Informacion_de_produccion`, `image`, `stock`, `timestamp`, `descripcion`, `destacado`, `activo`, `fecha_creacion`, `modificacion_date`, `categoria_id`, `user_id`) VALUES
(1, 'Papa Seleccionada Variedad Betina Y Ruby,', 'papa-seleccionada-variedad-betina-y-ruby', 50000, '300 Bulto(s) cada 1 Semanas', 'papas.jpg', 1, '2022-07-22 15:43:25.206627', 'Vendemos papas de variedad Betina y Ruby seleccionadas para el mercado, seleccionadas, ofrecemos papá gruesa, y pareja', 1, 1, '2022-07-22 15:43:25.529381', '2022-07-22 15:43:25.529381', 2, 2),
(2, 'Mango Tommy', 'mango-tommy', 50000, '20 Tonelada(s) cada 2 Semestre(s)', 'mango.jpg', 331, '2022-07-22 15:46:04.666052', 'Mango sano de excelente calidad, su precio varia de acuerdo a su tamaño y el mercado. canastillas de 25 kilos de 40 mangos cada una.', 1, 1, '2022-07-22 15:46:04.680287', '2022-08-05 20:45:46.014280', 1, 2),
(3, 'Naranja Acida', 'naranja-acida', 20000, '1000 A 1500 Kilogramo(s) cada 8 Dia(s)', 'naranja-1.jpg', 1, '2022-07-22 15:48:07.569461', 'muy buenas naranjas', 1, 1, '2022-07-22 15:48:07.579229', '2022-08-05 16:54:21.413182', 1, 1),
(4, 'Parda Superior', 'parda-superior', 8000, '300 Bulto(s) cada 4 Mes(es)', 'fig._1_papa.png', 3, '2022-07-22 16:02:25.902261', 'Papa PARDA SUPERIOR fresca. Ubicada en la vereda de Muesas ( Municipio de Aldana, Nariño)', 1, 1, '2022-07-22 16:02:25.918457', '2022-08-05 16:54:30.129462', 2, 1),
(5, 'Zanahoria Orgánica', 'zanahoria-organica', 3.5, 'Gramo(s) cada Dia(s)', 'Captura_de_pantalla_2021-07-13_a_las_12.38.35_p._m..png', 2, '2022-07-22 16:17:29.565070', 'El precio publicado es por una CANTIDAD DE 500 GRAMOS. Realizamos domicilios a Chía, Cajicá y Bogotá por compras superiores a $20.000 pesos. El domicilio tiene un costo adicional de $5.000 o $7.000 pesos dependiendo de la ubicación. Nota: El peso puede variar dependiendo del tamaño de los vegetales.', 1, 0, '2022-07-22 16:17:29.589700', '2022-08-04 18:50:05.300226', 2, 1),
(6, 'Queso Fresco', 'queso-fresco', 6.7, 'Gramo(s) cada Dia(s)', 'WhatsApp_Image_2020-12-16_at_11.26.07_AM.jpeg', 3, '2022-07-22 16:21:46.331950', 'Fresco y delicioso queso natural. Degústalo, en tu mesa o prepara exquisitas recetas. Se vende kg y lb, la cantidad que necesite. El precio está en libras', 1, 0, '2022-07-22 16:21:46.341886', '2022-08-05 18:03:44.675946', 4, 1),
(8, 'Espinacas', 'espinacas', 2000, 'Cada mes hay produccion', 'Cultivo-de-Espinaca-330x205.jpg', 7, '2022-07-31 17:24:13.429780', 'Produsco espinca en el municpio de TImbio, muy buena', 1, 1, '2022-07-31 17:24:13.588240', '2022-07-31 17:24:13.588240', 2, 6),
(9, 'Trucha Roja', 'trucha-roja', 20000, '30 Kilogramo(s) cada 1 Mes(es)', 'D4JUL3MWWKMEXPVBXM7KY54E3E.jpg', 4, '2022-07-31 17:24:47.361749', 'Venta de kilo, 4 truchas deshuesada', 1, 1, '2022-07-31 17:24:47.366823', '2022-07-31 17:24:47.366823', 5, 3),
(10, 'Pulpa De Cerdo X Kg', 'pulpa-de-cerdo-x-kg', 20380, 'Gramo(s) cada Dia(s)', '869903-800-auto.webp', 33, '2022-07-31 17:27:34.893852', 'Pulpa de Cerdo X Kg', 1, 1, '2022-07-31 17:27:34.899667', '2022-07-31 17:27:34.899667', 5, 2),
(11, 'Beef Steak', 'beef-steak', 14.84, 'Beef Steak en bandeja x500gr', 'images.jpg', 10, '2022-07-31 17:29:13.891064', 'Carne angus y hereford de las mejores praderas del mundo, tierna, jugosa, de aroma exquisito con un actractivo e indiscutible sabor que destacan su calidad * Recuerda que este producto se vende porcionado, no se garantiza la presentación de la fotografia. * Foto con ambientación * La presentación de este producto varia dependiendo el pedido.', 1, 1, '2022-07-31 17:29:13.895062', '2022-07-31 17:29:13.895062', 5, 6),
(12, 'Pez Mojarra Roja X Kg', 'pez-mojarra-roja-x-kg', 16000, 'Pescados Frescos', '711068-800-auto.webp', 22, '2022-07-31 17:29:19.748835', 'Pez Mojarra Roja X Kg', 1, 1, '2022-07-31 17:29:19.752835', '2022-08-04 00:49:32.435401', 5, 2),
(13, 'Pez Cojinua X Kg', 'pez-cojinua-x-kg', 13500, 'Gramo(s) cada Dia(s)', '765620-800-auto.webp', 20, '2022-07-31 17:31:07.213078', 'PEZ COJINUA', 1, 1, '2022-07-31 17:31:07.217076', '2022-08-09 14:52:29.291670', 5, 2),
(14, 'Carne molida res', 'carne-molida-res', 13.25, 'molida res especial en bandeja x500gr', 'Unknown-234.jpeg', 0, '2022-07-31 17:31:40.527001', 'Crea deliciosa recetas ideales para compartir agradables momentos con tu familia y amigos. * Recuerda que este producto se vende porcionado, no segarantiza la presentación de la fotografia.', 1, 1, '2022-07-31 17:31:40.530000', '2022-08-05 17:01:44.120200', 5, 6),
(15, 'Chuleta De Cerdo Importada Oferta X Kg', 'chuleta-de-cerdo-importada-oferta-x-kg', 13100, 'ssssssss', '711226-800-auto.webp', 31, '2022-07-31 17:33:14.525520', 'Chuleta de Cerdo Importada Oferta X Kg', 1, 1, '2022-07-31 17:33:14.529521', '2022-08-05 17:34:56.976605', 5, 2),
(16, 'Plátano llanero', 'platano-llanero', 3.19, 'Plátano llanero x 500 g', 'platanos_uniban_6.jpg', 4, '2022-07-31 17:34:00.733777', 'Disfruta con tu familia y amigos todas las deliciosas recetas', 1, 1, '2022-07-31 17:34:00.741881', '2022-08-05 20:52:18.068117', 2, 6),
(21, 'Frijol', 'frijol', 14.39, 'Frijol maritza bola roja premium x1000g', 'dreamstime_m_30357508-1080x675.jpg', 4, '2022-07-31 17:42:41.755691', 'Frijol maritza bola roja premium x1000g', 1, 1, '2022-07-31 17:42:41.834081', '2022-08-09 15:53:31.648029', 3, 6),
(22, 'Leche', 'leche', 28.99, 'Leche Descremada  Grasa 1.1 L Sixpack', 'produccion_leche.jpg', 2, '2022-07-31 17:46:00.228229', 'Esta puede ser una buena opción para las personas que buscan alimentos sin grasas y que aporte las mismas cantidades de propiedades de una leche normal.', 1, 1, '2022-07-31 17:46:00.247228', '2022-07-31 17:46:00.247228', 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_revisioncalificacion`
--

CREATE TABLE `productos_revisioncalificacion` (
  `id` bigint(20) NOT NULL,
  `Sujeto` varchar(200) NOT NULL,
  `comentario` varchar(500) NOT NULL,
  `calificacion` double NOT NULL,
  `ip` varchar(20) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_subido` datetime(6) NOT NULL,
  `producto_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos_revisioncalificacion`
--

INSERT INTO `productos_revisioncalificacion` (`id`, `Sujeto`, `comentario`, `calificacion`, `ip`, `estado`, `fecha_creacion`, `fecha_subido`, `producto_id`, `user_id`) VALUES
(1, 'hjhjhhjhkhmnb', 'nnbnbnbnbn', 4, '127.0.0.1', 1, '2022-08-09 16:01:10.753555', '2022-08-09 16:01:10.753555', 21, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `carrito_carrito`
--
ALTER TABLE `carrito_carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito_carritoitem`
--
ALTER TABLE `carrito_carritoitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrito_carritoitem_carrito_id_d26705d1_fk_carrito_carrito_id` (`carrito_id`),
  ADD KEY `carrito_carritoitem_productos_id_1667afcd_fk_productos` (`productos_id`),
  ADD KEY `carrito_carritoitem_user_id_bb70ded7_fk_cuentas_cuentas_id` (`user_id`);

--
-- Indices de la tabla `carrito_carritoitem_kardexob`
--
ALTER TABLE `carrito_carritoitem_kardexob`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carrito_carritoitem_kard_carritoitem_id_kardex_id_411a057b_uniq` (`carritoitem_id`,`kardex_id`),
  ADD KEY `carrito_carritoitem__kardex_id_ffbbdca8_fk_productos` (`kardex_id`);

--
-- Indices de la tabla `categorias_categoria`
--
ALTER TABLE `categorias_categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indices de la tabla `cuentas_cuentas`
--
ALTER TABLE `cuentas_cuentas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombreusuario` (`nombreusuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `cuentas_userperfil`
--
ALTER TABLE `cuentas_userperfil`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_cuentas_cuentas_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `ordenes_de_compra_orden`
--
ALTER TABLE `ordenes_de_compra_orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordenes_de_compra_or_pagos_id_9bd20395_fk_ordenes_d` (`pagos_id`),
  ADD KEY `ordenes_de_compra_orden_user_id_acce989f_fk_cuentas_cuentas_id` (`user_id`);

--
-- Indices de la tabla `ordenes_de_compra_ordenproducto`
--
ALTER TABLE `ordenes_de_compra_ordenproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordenes_de_compra_or_orden_id_a61cba36_fk_ordenes_d` (`orden_id`),
  ADD KEY `ordenes_de_compra_or_pagos_id_4d7c61eb_fk_ordenes_d` (`pagos_id`),
  ADD KEY `ordenes_de_compra_or_productos_id_56046c08_fk_productos` (`productos_id`),
  ADD KEY `ordenes_de_compra_or_user_id_7aae4e01_fk_cuentas_c` (`user_id`);

--
-- Indices de la tabla `ordenes_de_compra_ordenproducto_kardex`
--
ALTER TABLE `ordenes_de_compra_ordenproducto_kardex`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ordenes_de_compra_ordenp_ordenproducto_id_kardex__d1e7f821_uniq` (`ordenproducto_id`,`kardex_id`),
  ADD KEY `ordenes_de_compra_or_kardex_id_2aa7ac53_fk_productos` (`kardex_id`);

--
-- Indices de la tabla `ordenes_de_compra_pago`
--
ALTER TABLE `ordenes_de_compra_pago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordenes_de_compra_pago_user_id_2079fc15_fk_cuentas_cuentas_id` (`user_id`);

--
-- Indices de la tabla `productos_kardex`
--
ALTER TABLE `productos_kardex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_kardex_producto_id_ff1c6bba_fk_productos_producto_id` (`producto_id`);

--
-- Indices de la tabla `productos_producto`
--
ALTER TABLE `productos_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_producto_categoria_id_1fef506a_fk_categoria` (`categoria_id`),
  ADD KEY `productos_producto_user_id_7908083a_fk_cuentas_cuentas_id` (`user_id`),
  ADD KEY `productos_producto_slug_8e5f75e2` (`slug`);

--
-- Indices de la tabla `productos_revisioncalificacion`
--
ALTER TABLE `productos_revisioncalificacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_revisionca_user_id_cd12f49f_fk_cuentas_c` (`user_id`),
  ADD KEY `productos_revisionca_producto_id_0588228f_fk_productos` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT de la tabla `carrito_carrito`
--
ALTER TABLE `carrito_carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `carrito_carritoitem`
--
ALTER TABLE `carrito_carritoitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `carrito_carritoitem_kardexob`
--
ALTER TABLE `carrito_carritoitem_kardexob`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias_categoria`
--
ALTER TABLE `categorias_categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cuentas_cuentas`
--
ALTER TABLE `cuentas_cuentas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `cuentas_userperfil`
--
ALTER TABLE `cuentas_userperfil`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `ordenes_de_compra_orden`
--
ALTER TABLE `ordenes_de_compra_orden`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ordenes_de_compra_ordenproducto`
--
ALTER TABLE `ordenes_de_compra_ordenproducto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ordenes_de_compra_ordenproducto_kardex`
--
ALTER TABLE `ordenes_de_compra_ordenproducto_kardex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenes_de_compra_pago`
--
ALTER TABLE `ordenes_de_compra_pago`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos_kardex`
--
ALTER TABLE `productos_kardex`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos_producto`
--
ALTER TABLE `productos_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos_revisioncalificacion`
--
ALTER TABLE `productos_revisioncalificacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `carrito_carritoitem`
--
ALTER TABLE `carrito_carritoitem`
  ADD CONSTRAINT `carrito_carritoitem_carrito_id_d26705d1_fk_carrito_carrito_id` FOREIGN KEY (`carrito_id`) REFERENCES `carrito_carrito` (`id`),
  ADD CONSTRAINT `carrito_carritoitem_productos_id_1667afcd_fk_productos` FOREIGN KEY (`productos_id`) REFERENCES `productos_producto` (`id`),
  ADD CONSTRAINT `carrito_carritoitem_user_id_bb70ded7_fk_cuentas_cuentas_id` FOREIGN KEY (`user_id`) REFERENCES `cuentas_cuentas` (`id`);

--
-- Filtros para la tabla `carrito_carritoitem_kardexob`
--
ALTER TABLE `carrito_carritoitem_kardexob`
  ADD CONSTRAINT `carrito_carritoitem__carritoitem_id_adb14039_fk_carrito_c` FOREIGN KEY (`carritoitem_id`) REFERENCES `carrito_carritoitem` (`id`),
  ADD CONSTRAINT `carrito_carritoitem__kardex_id_ffbbdca8_fk_productos` FOREIGN KEY (`kardex_id`) REFERENCES `productos_kardex` (`id`);

--
-- Filtros para la tabla `cuentas_userperfil`
--
ALTER TABLE `cuentas_userperfil`
  ADD CONSTRAINT `cuentas_userperfil_user_id_0f4b868e_fk_cuentas_cuentas_id` FOREIGN KEY (`user_id`) REFERENCES `cuentas_cuentas` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_cuentas_cuentas_id` FOREIGN KEY (`user_id`) REFERENCES `cuentas_cuentas` (`id`);

--
-- Filtros para la tabla `ordenes_de_compra_orden`
--
ALTER TABLE `ordenes_de_compra_orden`
  ADD CONSTRAINT `ordenes_de_compra_or_pagos_id_9bd20395_fk_ordenes_d` FOREIGN KEY (`pagos_id`) REFERENCES `ordenes_de_compra_pago` (`id`),
  ADD CONSTRAINT `ordenes_de_compra_orden_user_id_acce989f_fk_cuentas_cuentas_id` FOREIGN KEY (`user_id`) REFERENCES `cuentas_cuentas` (`id`);

--
-- Filtros para la tabla `ordenes_de_compra_ordenproducto`
--
ALTER TABLE `ordenes_de_compra_ordenproducto`
  ADD CONSTRAINT `ordenes_de_compra_or_orden_id_a61cba36_fk_ordenes_d` FOREIGN KEY (`orden_id`) REFERENCES `ordenes_de_compra_orden` (`id`),
  ADD CONSTRAINT `ordenes_de_compra_or_pagos_id_4d7c61eb_fk_ordenes_d` FOREIGN KEY (`pagos_id`) REFERENCES `ordenes_de_compra_pago` (`id`),
  ADD CONSTRAINT `ordenes_de_compra_or_productos_id_56046c08_fk_productos` FOREIGN KEY (`productos_id`) REFERENCES `productos_producto` (`id`),
  ADD CONSTRAINT `ordenes_de_compra_or_user_id_7aae4e01_fk_cuentas_c` FOREIGN KEY (`user_id`) REFERENCES `cuentas_cuentas` (`id`);

--
-- Filtros para la tabla `ordenes_de_compra_ordenproducto_kardex`
--
ALTER TABLE `ordenes_de_compra_ordenproducto_kardex`
  ADD CONSTRAINT `ordenes_de_compra_or_kardex_id_2aa7ac53_fk_productos` FOREIGN KEY (`kardex_id`) REFERENCES `productos_kardex` (`id`),
  ADD CONSTRAINT `ordenes_de_compra_or_ordenproducto_id_0c21b7c4_fk_ordenes_d` FOREIGN KEY (`ordenproducto_id`) REFERENCES `ordenes_de_compra_ordenproducto` (`id`);

--
-- Filtros para la tabla `ordenes_de_compra_pago`
--
ALTER TABLE `ordenes_de_compra_pago`
  ADD CONSTRAINT `ordenes_de_compra_pago_user_id_2079fc15_fk_cuentas_cuentas_id` FOREIGN KEY (`user_id`) REFERENCES `cuentas_cuentas` (`id`);

--
-- Filtros para la tabla `productos_kardex`
--
ALTER TABLE `productos_kardex`
  ADD CONSTRAINT `productos_kardex_producto_id_ff1c6bba_fk_productos_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `productos_producto` (`id`);

--
-- Filtros para la tabla `productos_producto`
--
ALTER TABLE `productos_producto`
  ADD CONSTRAINT `productos_producto_categoria_id_1fef506a_fk_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias_categoria` (`id`),
  ADD CONSTRAINT `productos_producto_user_id_7908083a_fk_cuentas_cuentas_id` FOREIGN KEY (`user_id`) REFERENCES `cuentas_cuentas` (`id`);

--
-- Filtros para la tabla `productos_revisioncalificacion`
--
ALTER TABLE `productos_revisioncalificacion`
  ADD CONSTRAINT `productos_revisionca_producto_id_0588228f_fk_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos_producto` (`id`),
  ADD CONSTRAINT `productos_revisionca_user_id_cd12f49f_fk_cuentas_c` FOREIGN KEY (`user_id`) REFERENCES `cuentas_cuentas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
