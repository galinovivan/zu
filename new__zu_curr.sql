-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 26 2017 г., 20:07
-- Версия сервера: 10.1.26-MariaDB
-- Версия PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `new__zu_curr`
--

-- --------------------------------------------------------

--
-- Структура таблицы `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '127.0.0.1', '2017-09-14 07:17:18', '2017-09-14 07:17:18'),
(2, 1, '127.0.0.1', '2017-09-14 07:19:29', '2017-09-14 07:19:29'),
(3, 1, '127.0.0.1', '2017-09-19 04:53:36', '2017-09-19 04:53:36'),
(4, 1, '127.0.0.1', '2017-09-19 07:12:58', '2017-09-19 07:12:58'),
(5, 1, '127.0.0.1', '2017-09-23 05:25:45', '2017-09-23 05:25:45');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `activated_at`, `last_login`, `created_at`, `updated_at`, `is_superuser`, `role_id`) VALUES
(1, 'Admin', 'Person', 'admin', '9225913@gmail.com', '$2y$10$GdogOxakjS581vYAU7IPZunDtfDvr4RDbqof7afmdvD.5sGFxy0DG', NULL, '$2y$10$D48g3mIROnQjIWIXvJ72Zemf/OzHjMJg1gf5h7Ad1lgnhrttqhcwS', NULL, '', 1, NULL, '2017-09-23 05:25:43', '2017-09-14 07:16:25', '2017-09-23 05:25:43', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', '2017-09-14 07:16:25', '2017-09-14 07:16:25', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `backend_user_preferences`
--

INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 1, 'backend', 'backend', 'preferences', '{\"locale\":\"ru\",\"fallback_locale\":\"en\",\"timezone\":\"UTC\",\"editor_font_size\":\"12\",\"editor_word_wrap\":\"fluid\",\"editor_code_folding\":\"manual\",\"editor_tab_size\":\"4\",\"editor_theme\":\"twilight\",\"editor_show_invisibles\":\"0\",\"editor_highlight_active_line\":\"1\",\"editor_use_hard_tabs\":\"0\",\"editor_show_gutter\":\"1\",\"editor_auto_closing\":\"0\",\"editor_autocompletion\":\"manual\",\"editor_enable_snippets\":\"0\",\"editor_display_indent_guides\":\"0\",\"editor_show_print_margin\":\"0\",\"user_id\":\"1\"}'),
(2, 1, 'backend', 'hints', 'hidden', '{\"Form-field-Settings-template_hint\":1}');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_roles`
--

CREATE TABLE `backend_user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', NULL, 0, NULL, NULL),
(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `theme` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `old_content` longtext COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `master_field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slave_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2013_10_01_000001_Db_Deferred_Bindings', 1),
('2013_10_01_000002_Db_System_Files', 1),
('2013_10_01_000003_Db_System_Plugin_Versions', 1),
('2013_10_01_000004_Db_System_Plugin_History', 1),
('2013_10_01_000005_Db_System_Settings', 1),
('2013_10_01_000006_Db_System_Parameters', 1),
('2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
('2013_10_01_000008_Db_System_Mail_Templates', 1),
('2013_10_01_000009_Db_System_Mail_Layouts', 1),
('2014_10_01_000010_Db_Jobs', 1),
('2014_10_01_000011_Db_System_Event_Logs', 1),
('2014_10_01_000012_Db_System_Request_Logs', 1),
('2014_10_01_000013_Db_System_Sessions', 1),
('2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
('2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
('2015_10_01_000016_Db_Cache', 1),
('2015_10_01_000017_Db_System_Revisions', 1),
('2015_10_01_000018_Db_FailedJobs', 1),
('2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
('2016_10_01_000020_Db_System_Timestamp_Fix', 1),
('2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
('2017_10_01_000021_Db_System_Sessions_Update', 1),
('2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
('2017_10_01_000023_Db_System_Mail_Partials', 1),
('2013_10_01_000001_Db_Backend_Users', 2),
('2013_10_01_000002_Db_Backend_User_Groups', 2),
('2013_10_01_000003_Db_Backend_Users_Groups', 2),
('2013_10_01_000004_Db_Backend_User_Throttle', 2),
('2014_01_04_000005_Db_Backend_User_Preferences', 2),
('2014_10_01_000006_Db_Backend_Access_Log', 2),
('2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
('2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
('2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
('2017_10_01_000010_Db_Backend_User_Roles', 2),
('2014_10_01_000001_Db_Cms_Theme_Data', 3),
('2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
('2017_10_01_000003_Db_Cms_Theme_Logs', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_blog_categories`
--

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `rainlab_blog_categories`
--

INSERT INTO `rainlab_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2017-09-14 07:15:37', '2017-09-14 07:15:37');

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_blog_posts`
--

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `content_html` longtext COLLATE utf8_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `rainlab_blog_posts`
--

INSERT INTO `rainlab_blog_posts` (`id`, `user_id`, `title`, `slug`, `excerpt`, `content`, `content_html`, `published_at`, `published`, `created_at`, `updated_at`) VALUES
(1, NULL, 'First blog post', 'first-blog-post', 'The first ever blog post is here. It might be a good idea to update this post with some more relevant content.', 'This is your first ever **blog post**! It might be a good idea to update this post with some more relevant content.\n\nYou can edit this content by selecting **Blog** from the administration back-end menu.\n\n*Enjoy the good times!*', '<p>This is your first ever <strong>blog post</strong>! It might be a good idea to update this post with some more relevant content.</p>\n<p>You can edit this content by selecting <strong>Blog</strong> from the administration back-end menu.</p>\n<p><em>Enjoy the good times!</em></p>', '2017-09-14 07:15:37', 1, '2017-09-14 07:15:37', '2017-09-14 07:15:37');

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_blog_posts_categories`
--

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_location_countries`
--

CREATE TABLE `rainlab_location_countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_pinned` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `rainlab_location_countries`
--

INSERT INTO `rainlab_location_countries` (`id`, `is_enabled`, `name`, `code`, `is_pinned`) VALUES
(1, 1, 'Australia', 'AU', 1),
(2, 1, 'Canada', 'CA', 1),
(3, 1, 'United Kingdom', 'GB', 1),
(4, 1, 'United States', 'US', 1),
(5, 0, 'Afghanistan', 'AF', 0),
(6, 0, 'Aland Islands ', 'AX', 0),
(7, 0, 'Albania', 'AL', 0),
(8, 0, 'Algeria', 'DZ', 0),
(9, 0, 'American Samoa', 'AS', 0),
(10, 0, 'Andorra', 'AD', 0),
(11, 0, 'Angola', 'AO', 0),
(12, 0, 'Anguilla', 'AI', 0),
(13, 0, 'Antarctica', 'AQ', 0),
(14, 0, 'Antigua and Barbuda', 'AG', 0),
(15, 0, 'Argentina', 'AR', 0),
(16, 0, 'Armenia', 'AM', 0),
(17, 0, 'Aruba', 'AW', 0),
(18, 0, 'Austria', 'AT', 0),
(19, 0, 'Azerbaijan', 'AZ', 0),
(20, 0, 'Bahamas', 'BS', 0),
(21, 0, 'Bahrain', 'BH', 0),
(22, 0, 'Bangladesh', 'BD', 0),
(23, 0, 'Barbados', 'BB', 0),
(24, 0, 'Belarus', 'BY', 0),
(25, 0, 'Belgium', 'BE', 0),
(26, 0, 'Belize', 'BZ', 0),
(27, 0, 'Benin', 'BJ', 0),
(28, 0, 'Bermuda', 'BM', 0),
(29, 0, 'Bhutan', 'BT', 0),
(30, 0, 'Bolivia, Plurinational State of', 'BO', 0),
(31, 0, 'Bonaire, Sint Eustatius and Saba', 'BQ', 0),
(32, 0, 'Bosnia and Herzegovina', 'BA', 0),
(33, 0, 'Botswana', 'BW', 0),
(34, 0, 'Bouvet Island', 'BV', 0),
(35, 0, 'Brazil', 'BR', 0),
(36, 0, 'British Indian Ocean Territory', 'IO', 0),
(37, 0, 'Brunei Darussalam', 'BN', 0),
(38, 0, 'Bulgaria', 'BG', 0),
(39, 0, 'Burkina Faso', 'BF', 0),
(40, 0, 'Burundi', 'BI', 0),
(41, 0, 'Cambodia', 'KH', 0),
(42, 0, 'Cameroon', 'CM', 0),
(43, 0, 'Cape Verde', 'CV', 0),
(44, 0, 'Cayman Islands', 'KY', 0),
(45, 0, 'Central African Republic', 'CF', 0),
(46, 0, 'Chad', 'TD', 0),
(47, 0, 'Chile', 'CL', 0),
(48, 0, 'China', 'CN', 0),
(49, 0, 'Christmas Island', 'CX', 0),
(50, 0, 'Cocos (Keeling) Islands', 'CC', 0),
(51, 0, 'Colombia', 'CO', 0),
(52, 0, 'Comoros', 'KM', 0),
(53, 0, 'Congo', 'CG', 0),
(54, 0, 'Congo, the Democratic Republic of the', 'CD', 0),
(55, 0, 'Cook Islands', 'CK', 0),
(56, 0, 'Costa Rica', 'CR', 0),
(57, 0, 'Cote d\'Ivoire', 'CI', 0),
(58, 0, 'Croatia', 'HR', 0),
(59, 0, 'Cuba', 'CU', 0),
(60, 0, 'Curaçao', 'CW', 0),
(61, 0, 'Cyprus', 'CY', 0),
(62, 0, 'Czech Republic', 'CZ', 0),
(63, 0, 'Denmark', 'DK', 0),
(64, 0, 'Djibouti', 'DJ', 0),
(65, 0, 'Dominica', 'DM', 0),
(66, 0, 'Dominican Republic', 'DO', 0),
(67, 0, 'Ecuador', 'EC', 0),
(68, 0, 'Egypt', 'EG', 0),
(69, 0, 'El Salvador', 'SV', 0),
(70, 0, 'Equatorial Guinea', 'GQ', 0),
(71, 0, 'Eritrea', 'ER', 0),
(72, 0, 'Estonia', 'EE', 0),
(73, 0, 'Ethiopia', 'ET', 0),
(74, 0, 'Falkland Islands (Malvinas)', 'FK', 0),
(75, 0, 'Faroe Islands', 'FO', 0),
(76, 0, 'Finland', 'FI', 0),
(77, 0, 'Fiji', 'FJ', 0),
(78, 1, 'France', 'FR', 0),
(79, 0, 'French Guiana', 'GF', 0),
(80, 0, 'French Polynesia', 'PF', 0),
(81, 0, 'French Southern Territories', 'TF', 0),
(82, 0, 'Gabon', 'GA', 0),
(83, 0, 'Gambia', 'GM', 0),
(84, 0, 'Georgia', 'GE', 0),
(85, 0, 'Germany', 'DE', 0),
(86, 0, 'Ghana', 'GH', 0),
(87, 0, 'Gibraltar', 'GI', 0),
(88, 0, 'Greece', 'GR', 0),
(89, 0, 'Greenland', 'GL', 0),
(90, 0, 'Grenada', 'GD', 0),
(91, 0, 'Guadeloupe', 'GP', 0),
(92, 0, 'Guam', 'GU', 0),
(93, 0, 'Guatemala', 'GT', 0),
(94, 0, 'Guernsey', 'GG', 0),
(95, 0, 'Guinea', 'GN', 0),
(96, 0, 'Guinea-Bissau', 'GW', 0),
(97, 0, 'Guyana', 'GY', 0),
(98, 0, 'Haiti', 'HT', 0),
(99, 0, 'Heard Island and McDonald Islands', 'HM', 0),
(100, 0, 'Holy See (Vatican City State)', 'VA', 0),
(101, 0, 'Honduras', 'HN', 0),
(102, 0, 'Hong Kong', 'HK', 0),
(103, 1, 'Hungary', 'HU', 0),
(104, 0, 'Iceland', 'IS', 0),
(105, 1, 'India', 'IN', 0),
(106, 0, 'Indonesia', 'ID', 0),
(107, 0, 'Iran, Islamic Republic of', 'IR', 0),
(108, 0, 'Iraq', 'IQ', 0),
(109, 1, 'Ireland', 'IE', 0),
(110, 0, 'Isle of Man', 'IM', 0),
(111, 0, 'Israel', 'IL', 0),
(112, 0, 'Italy', 'IT', 0),
(113, 0, 'Jamaica', 'JM', 0),
(114, 0, 'Japan', 'JP', 0),
(115, 0, 'Jersey', 'JE', 0),
(116, 0, 'Jordan', 'JO', 0),
(117, 0, 'Kazakhstan', 'KZ', 0),
(118, 0, 'Kenya', 'KE', 0),
(119, 0, 'Kiribati', 'KI', 0),
(120, 0, 'Korea, Democratic People\'s Republic of', 'KP', 0),
(121, 0, 'Korea, Republic of', 'KR', 0),
(122, 0, 'Kuwait', 'KW', 0),
(123, 0, 'Kyrgyzstan', 'KG', 0),
(124, 0, 'Lao People\'s Democratic Republic', 'LA', 0),
(125, 0, 'Latvia', 'LV', 0),
(126, 0, 'Lebanon', 'LB', 0),
(127, 0, 'Lesotho', 'LS', 0),
(128, 0, 'Liberia', 'LR', 0),
(129, 0, 'Libyan Arab Jamahiriya', 'LY', 0),
(130, 0, 'Liechtenstein', 'LI', 0),
(131, 0, 'Lithuania', 'LT', 0),
(132, 0, 'Luxembourg', 'LU', 0),
(133, 0, 'Macao', 'MO', 0),
(134, 0, 'Macedonia', 'MK', 0),
(135, 0, 'Madagascar', 'MG', 0),
(136, 0, 'Malawi', 'MW', 0),
(137, 0, 'Malaysia', 'MY', 0),
(138, 0, 'Maldives', 'MV', 0),
(139, 0, 'Mali', 'ML', 0),
(140, 0, 'Malta', 'MT', 0),
(141, 0, 'Marshall Islands', 'MH', 0),
(142, 0, 'Martinique', 'MQ', 0),
(143, 0, 'Mauritania', 'MR', 0),
(144, 0, 'Mauritius', 'MU', 0),
(145, 0, 'Mayotte', 'YT', 0),
(146, 0, 'Mexico', 'MX', 0),
(147, 0, 'Micronesia, Federated States of', 'FM', 0),
(148, 0, 'Moldova, Republic of', 'MD', 0),
(149, 0, 'Monaco', 'MC', 0),
(150, 0, 'Mongolia', 'MN', 0),
(151, 0, 'Montenegro', 'ME', 0),
(152, 0, 'Montserrat', 'MS', 0),
(153, 0, 'Morocco', 'MA', 0),
(154, 0, 'Mozambique', 'MZ', 0),
(155, 0, 'Myanmar', 'MM', 0),
(156, 0, 'Namibia', 'NA', 0),
(157, 0, 'Nauru', 'NR', 0),
(158, 0, 'Nepal', 'NP', 0),
(159, 1, 'Netherlands', 'NL', 0),
(160, 0, 'New Caledonia', 'NC', 0),
(161, 1, 'New Zealand', 'NZ', 0),
(162, 0, 'Nicaragua', 'NI', 0),
(163, 0, 'Niger', 'NE', 0),
(164, 0, 'Nigeria', 'NG', 0),
(165, 0, 'Niue', 'NU', 0),
(166, 0, 'Norfolk Island', 'NF', 0),
(167, 0, 'Northern Mariana Islands', 'MP', 0),
(168, 0, 'Norway', 'NO', 0),
(169, 0, 'Oman', 'OM', 0),
(170, 0, 'Pakistan', 'PK', 0),
(171, 0, 'Palau', 'PW', 0),
(172, 0, 'Palestine', 'PS', 0),
(173, 0, 'Panama', 'PA', 0),
(174, 0, 'Papua New Guinea', 'PG', 0),
(175, 0, 'Paraguay', 'PY', 0),
(176, 0, 'Peru', 'PE', 0),
(177, 0, 'Philippines', 'PH', 0),
(178, 0, 'Pitcairn', 'PN', 0),
(179, 0, 'Poland', 'PL', 0),
(180, 0, 'Portugal', 'PT', 0),
(181, 0, 'Puerto Rico', 'PR', 0),
(182, 0, 'Qatar', 'QA', 0),
(183, 0, 'Reunion', 'RE', 0),
(184, 1, 'Romania', 'RO', 0),
(185, 0, 'Russian Federation', 'RU', 0),
(186, 0, 'Rwanda', 'RW', 0),
(187, 0, 'Saint Barthélemy', 'BL', 0),
(188, 0, 'Saint Helena', 'SH', 0),
(189, 0, 'Saint Kitts and Nevis', 'KN', 0),
(190, 0, 'Saint Lucia', 'LC', 0),
(191, 0, 'Saint Martin (French part)', 'MF', 0),
(192, 0, 'Saint Pierre and Miquelon', 'PM', 0),
(193, 0, 'Saint Vincent and the Grenadines', 'VC', 0),
(194, 0, 'Samoa', 'WS', 0),
(195, 0, 'San Marino', 'SM', 0),
(196, 0, 'Sao Tome and Principe', 'ST', 0),
(197, 0, 'Saudi Arabia', 'SA', 0),
(198, 0, 'Senegal', 'SN', 0),
(199, 0, 'Serbia', 'RS', 0),
(200, 0, 'Seychelles', 'SC', 0),
(201, 0, 'Sierra Leone', 'SL', 0),
(202, 0, 'Singapore', 'SG', 0),
(203, 0, 'Sint Maarten (Dutch part)', 'SX', 0),
(204, 0, 'Slovakia', 'SK', 0),
(205, 0, 'Slovenia', 'SI', 0),
(206, 0, 'Solomon Islands', 'SB', 0),
(207, 0, 'Somalia', 'SO', 0),
(208, 0, 'South Africa', 'ZA', 0),
(209, 0, 'South Georgia and the South Sandwich Islands', 'GS', 0),
(210, 0, 'Spain', 'ES', 0),
(211, 0, 'Sri Lanka', 'LK', 0),
(212, 0, 'Sudan', 'SD', 0),
(213, 0, 'Suriname', 'SR', 0),
(214, 0, 'Svalbard and Jan Mayen', 'SJ', 0),
(215, 0, 'Swaziland', 'SZ', 0),
(216, 0, 'Sweden', 'SE', 0),
(217, 0, 'Switzerland', 'CH', 0),
(218, 0, 'Syrian Arab Republic', 'SY', 0),
(219, 0, 'Taiwan, Province of China', 'TW', 0),
(220, 0, 'Tajikistan', 'TJ', 0),
(221, 0, 'Tanzania, United Republic of', 'TZ', 0),
(222, 0, 'Thailand', 'TH', 0),
(223, 0, 'Timor-Leste', 'TL', 0),
(224, 0, 'Togo', 'TG', 0),
(225, 0, 'Tokelau', 'TK', 0),
(226, 0, 'Tonga', 'TO', 0),
(227, 0, 'Trinidad and Tobago', 'TT', 0),
(228, 0, 'Tunisia', 'TN', 0),
(229, 0, 'Turkey', 'TR', 0),
(230, 0, 'Turkmenistan', 'TM', 0),
(231, 0, 'Turks and Caicos Islands', 'TC', 0),
(232, 0, 'Tuvalu', 'TV', 0),
(233, 0, 'Uganda', 'UG', 0),
(234, 0, 'Ukraine', 'UA', 0),
(235, 0, 'United Arab Emirates', 'AE', 0),
(236, 0, 'United States Minor Outlying Islands', 'UM', 0),
(237, 0, 'Uruguay', 'UY', 0),
(238, 0, 'Uzbekistan', 'UZ', 0),
(239, 0, 'Vanuatu', 'VU', 0),
(240, 0, 'Venezuela, Bolivarian Republic of', 'VE', 0),
(241, 0, 'Viet Nam', 'VN', 0),
(242, 0, 'Virgin Islands, British', 'VG', 0),
(243, 0, 'Virgin Islands, U.S.', 'VI', 0),
(244, 0, 'Wallis and Futuna', 'WF', 0),
(245, 0, 'Western Sahara', 'EH', 0),
(246, 0, 'Yemen', 'YE', 0),
(247, 0, 'Zambia', 'ZM', 0),
(248, 0, 'Zimbabwe', 'ZW', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_location_states`
--

CREATE TABLE `rainlab_location_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `rainlab_location_states`
--

INSERT INTO `rainlab_location_states` (`id`, `country_id`, `name`, `code`) VALUES
(1, 4, 'Alabama', 'AL'),
(2, 4, 'Alaska', 'AK'),
(3, 4, 'American Samoa', 'AS'),
(4, 4, 'Arizona', 'AZ'),
(5, 4, 'Arkansas', 'AR'),
(6, 4, 'California', 'CA'),
(7, 4, 'Colorado', 'CO'),
(8, 4, 'Connecticut', 'CT'),
(9, 4, 'Delaware', 'DE'),
(10, 4, 'Dist. of Columbia', 'DC'),
(11, 4, 'Florida', 'FL'),
(12, 4, 'Georgia', 'GA'),
(13, 4, 'Guam', 'GU'),
(14, 4, 'Hawaii', 'HI'),
(15, 4, 'Idaho', 'ID'),
(16, 4, 'Illinois', 'IL'),
(17, 4, 'Indiana', 'IN'),
(18, 4, 'Iowa', 'IA'),
(19, 4, 'Kansas', 'KS'),
(20, 4, 'Kentucky', 'KY'),
(21, 4, 'Louisiana', 'LA'),
(22, 4, 'Maine', 'ME'),
(23, 4, 'Maryland', 'MD'),
(24, 4, 'Marshall Islands', 'MH'),
(25, 4, 'Massachusetts', 'MA'),
(26, 4, 'Michigan', 'MI'),
(27, 4, 'Micronesia', 'FM'),
(28, 4, 'Minnesota', 'MN'),
(29, 4, 'Mississippi', 'MS'),
(30, 4, 'Missouri', 'MO'),
(31, 4, 'Montana', 'MT'),
(32, 4, 'Nebraska', 'NE'),
(33, 4, 'Nevada', 'NV'),
(34, 4, 'New Hampshire', 'NH'),
(35, 4, 'New Jersey', 'NJ'),
(36, 4, 'New Mexico', 'NM'),
(37, 4, 'New York', 'NY'),
(38, 4, 'North Carolina', 'NC'),
(39, 4, 'North Dakota', 'ND'),
(40, 4, 'Northern Marianas', 'MP'),
(41, 4, 'Ohio', 'OH'),
(42, 4, 'Oklahoma', 'OK'),
(43, 4, 'Oregon', 'OR'),
(44, 4, 'Palau', 'PW'),
(45, 4, 'Pennsylvania', 'PA'),
(46, 4, 'Puerto Rico', 'PR'),
(47, 4, 'Rhode Island', 'RI'),
(48, 4, 'South Carolina', 'SC'),
(49, 4, 'South Dakota', 'SD'),
(50, 4, 'Tennessee', 'TN'),
(51, 4, 'Texas', 'TX'),
(52, 4, 'Utah', 'UT'),
(53, 4, 'Vermont', 'VT'),
(54, 4, 'Virginia', 'VA'),
(55, 4, 'Virgin Islands', 'VI'),
(56, 4, 'Washington', 'WA'),
(57, 4, 'West Virginia', 'WV'),
(58, 4, 'Wisconsin', 'WI'),
(59, 4, 'Wyoming', 'WY'),
(60, 35, 'Acre', 'AC'),
(61, 35, 'Alagoas', 'AL'),
(62, 35, 'Amapá', 'AP'),
(63, 35, 'Amazonas', 'AM'),
(64, 35, 'Bahia', 'BA'),
(65, 35, 'Ceará', 'CE'),
(66, 35, 'Distrito Federal', 'DF'),
(67, 35, 'Espírito Santo', 'ES'),
(68, 35, 'Goiás', 'GO'),
(69, 35, 'Maranhão', 'MA'),
(70, 35, 'Mato Grosso', 'MT'),
(71, 35, 'Mato Grosso do Sul', 'MS'),
(72, 35, 'Minas Gerais', 'MG'),
(73, 35, 'Pará', 'PA'),
(74, 35, 'Paraíba', 'PB'),
(75, 35, 'Paraná', 'PR'),
(76, 35, 'Pernambuco', 'PE'),
(77, 35, 'Piauí', 'PI'),
(78, 35, 'Rio de Janeiro', 'RJ'),
(79, 35, 'Rio Grande do Norte', 'RN'),
(80, 35, 'Rio Grande do Sul', 'RS'),
(81, 35, 'Rondônia', 'RO'),
(82, 35, 'Roraima', 'RR'),
(83, 35, 'Santa Catarina', 'SC'),
(84, 35, 'São Paulo', 'SP'),
(85, 35, 'Sergipe', 'SE'),
(86, 35, 'Tocantins', 'TO'),
(87, 2, 'Alberta', 'AB'),
(88, 2, 'British Columbia', 'BC'),
(89, 2, 'Manitoba', 'MB'),
(90, 2, 'New Brunswick', 'NB'),
(91, 2, 'Newfoundland and Labrador', 'NL'),
(92, 2, 'Northwest Territories', 'NT'),
(93, 2, 'Nova Scotia', 'NS'),
(94, 2, 'Nunavut', 'NU'),
(95, 2, 'Ontario', 'ON'),
(96, 2, 'Prince Edward Island', 'PE'),
(97, 2, 'Quebec', 'QC'),
(98, 2, 'Saskatchewan', 'SK'),
(99, 2, 'Yukon', 'YT'),
(100, 217, 'Aargau', 'AG'),
(101, 217, 'Appenzell Innerrhoden', 'AI'),
(102, 217, 'Appenzell Ausserrhoden', 'AR'),
(103, 217, 'Bern', 'BE'),
(104, 217, 'Basel-Landschaft', 'BL'),
(105, 217, 'Basel-Stadt', 'BS'),
(106, 217, 'Fribourg', 'FR'),
(107, 217, 'Genève', 'GE'),
(108, 217, 'Glarus', 'GL'),
(109, 217, 'Graubünden', 'GR'),
(110, 217, 'Jura', 'JU'),
(111, 217, 'Luzern', 'LU'),
(112, 217, 'Neuchâtel', 'NE'),
(113, 217, 'Nidwalden', 'NW'),
(114, 217, 'Obwalden', 'OW'),
(115, 217, 'St. Gallen', 'SG'),
(116, 217, 'Solothurn', 'SO'),
(117, 217, 'Schwyz', 'SZ'),
(118, 217, 'Thurgau', 'TG'),
(119, 217, 'Ticino', 'TI'),
(120, 217, 'Uri', 'UR'),
(121, 217, 'Vaud', 'VD'),
(122, 217, 'Valais', 'VS'),
(123, 217, 'Zug', 'ZG'),
(124, 217, 'Zürich', 'ZH'),
(125, 1, 'New South Wales', 'NSW'),
(126, 1, 'Queensland', 'QLD'),
(127, 1, 'South Australia', 'SA'),
(128, 1, 'Tasmania', 'TAS'),
(129, 1, 'Victoria', 'VIC'),
(130, 1, 'Western Australia', 'WA'),
(131, 1, 'Northern Territory', 'NT'),
(132, 1, 'Australian Capital Territory', 'ACT'),
(133, 85, 'Baden-Württemberg', 'BW'),
(134, 85, 'Bavaria', 'BY'),
(135, 85, 'Berlin', 'BE'),
(136, 85, 'Brandenburg', 'BB'),
(137, 85, 'Bremen', 'HB'),
(138, 85, 'Hamburg', 'HH'),
(139, 85, 'Hesse', 'HE'),
(140, 85, 'Mecklenburg-Vorpommern', 'MV'),
(141, 85, 'Lower Saxony', 'NI'),
(142, 85, 'North Rhine-Westphalia', 'NW'),
(143, 85, 'Rhineland-Palatinate', 'RP'),
(144, 85, 'Saarland', 'SL'),
(145, 85, 'Saxony', 'SN'),
(146, 85, 'Saxony-Anhalt', 'ST'),
(147, 85, 'Schleswig-Holstein', 'SH'),
(148, 85, 'Thuringia', 'TH'),
(149, 72, 'Harju', 'HA'),
(150, 72, 'Hiiu', 'HI'),
(151, 72, 'Ida-Viru', 'IV'),
(152, 72, 'Jõgeva', 'JR'),
(153, 72, 'Järva', 'JN'),
(154, 72, 'Lääne', 'LN'),
(155, 72, 'Lääne-Viru', 'LV'),
(156, 72, 'Põlva', 'PL'),
(157, 72, 'Pärnu', 'PR'),
(158, 72, 'Rapla', 'RA'),
(159, 72, 'Saare', 'SA'),
(160, 72, 'Tartu', 'TA'),
(161, 72, 'Valga', 'VG'),
(162, 72, 'Viljandi', 'VD'),
(163, 72, 'Võru', 'VR'),
(164, 109, 'Dublin', 'D'),
(165, 109, 'Wicklow', 'WW'),
(166, 109, 'Wexford', 'WX'),
(167, 109, 'Carlow', 'CW'),
(168, 109, 'Kildare', 'KE'),
(169, 109, 'Meath', 'MH'),
(170, 109, 'Louth', 'LH'),
(171, 109, 'Monaghan', 'MN'),
(172, 109, 'Cavan', 'CN'),
(173, 109, 'Longford', 'LD'),
(174, 109, 'Westmeath', 'WH'),
(175, 109, 'Offaly', 'OY'),
(176, 109, 'Laois', 'LS'),
(177, 109, 'Kilkenny', 'KK'),
(178, 109, 'Waterford', 'WD'),
(179, 109, 'Cork', 'C'),
(180, 109, 'Kerry', 'KY'),
(181, 109, 'Limerick', 'LK'),
(182, 109, 'North Tipperary', 'TN'),
(183, 109, 'South Tipperary', 'TS'),
(184, 109, 'Clare', 'CE'),
(185, 109, 'Galway', 'G'),
(186, 109, 'Mayo', 'MO'),
(187, 109, 'Roscommon', 'RN'),
(188, 109, 'Sligo', 'SO'),
(189, 109, 'Leitrim', 'LM'),
(190, 109, 'Donegal', 'DL'),
(191, 159, 'Drenthe', 'DR'),
(192, 159, 'Flevoland', 'FL'),
(193, 159, 'Friesland', 'FR'),
(194, 159, 'Gelderland', 'GE'),
(195, 159, 'Groningen', 'GR'),
(196, 159, 'Limburg', 'LI'),
(197, 159, 'Noord-Brabant', 'NB'),
(198, 159, 'Noord-Holland', 'NH'),
(199, 159, 'Overijssel', 'OV'),
(200, 159, 'Utrecht', 'UT'),
(201, 159, 'Zeeland', 'ZE'),
(202, 159, 'Zuid-Holland', 'ZH'),
(203, 3, 'Aberdeenshire', 'ABE'),
(204, 3, 'Anglesey', 'ALY'),
(205, 3, 'Angus', 'ANG'),
(206, 3, 'Argyll', 'ARG'),
(207, 3, 'Ayrshire', 'AYR'),
(208, 3, 'Banffshire', 'BAN'),
(209, 3, 'Bedfordshire', 'BED'),
(210, 3, 'Berkshire', 'BER'),
(211, 3, 'Berwickshire', 'BWS'),
(212, 3, 'Brecknockshire', 'BRE'),
(213, 3, 'Buckinghamshire', 'BUC'),
(214, 3, 'Bute', 'BUT'),
(215, 3, 'Caernarfonshire', 'CAE'),
(216, 3, 'Caithness', 'CAI'),
(217, 3, 'Cambridgeshire', 'CAM'),
(218, 3, 'Cardiganshire', 'CAR'),
(219, 3, 'Carmarthenshire', 'CMS'),
(220, 3, 'Cheshire', 'CHE'),
(221, 3, 'Clackmannanshire', 'CLA'),
(222, 3, 'Cleveland', 'CLE'),
(223, 3, 'Cornwall', 'COR'),
(224, 3, 'Cromartyshire', 'CRO'),
(225, 3, 'Cumberland', 'CBR'),
(226, 3, 'Cumbria', 'CUM'),
(227, 3, 'Denbighshire', 'DEN'),
(228, 3, 'Derbyshire', 'DER'),
(229, 3, 'Devon', 'DEV'),
(230, 3, 'Dorset', 'DOR'),
(231, 3, 'Dumbartonshire', 'DBS'),
(232, 3, 'Dumfriesshire', 'DUM'),
(233, 3, 'Durham', 'DUR'),
(234, 3, 'East Lothian', 'ELO'),
(235, 3, 'Essex', 'ESS'),
(236, 3, 'Flintshire', 'FLI'),
(237, 3, 'Fife', 'FIF'),
(238, 3, 'Glamorgan', 'GLA'),
(239, 3, 'Gloucestershire', 'GLO'),
(240, 3, 'Hampshire', 'HAM'),
(241, 3, 'Herefordshire', 'HER'),
(242, 3, 'Hertfordshire', 'HTF'),
(243, 3, 'Huntingdonshire', 'HUN'),
(244, 3, 'Inverness', 'INV'),
(245, 3, 'Kent', 'KEN'),
(246, 3, 'Kincardineshire', 'KCD'),
(247, 3, 'Kinross-shire', 'KIN'),
(248, 3, 'Kirkcudbrightshire', 'KIR'),
(249, 3, 'Lanarkshire', 'LKS'),
(250, 3, 'Lancashire', 'LAN'),
(251, 3, 'Leicestershire', 'LEI'),
(252, 3, 'Lincolnshire', 'LIN'),
(253, 3, 'London', 'LON'),
(254, 3, 'Manchester', 'MAN'),
(255, 3, 'Merionethshire', 'MER'),
(256, 3, 'Merseyside', 'MSY'),
(257, 3, 'Middlesex', 'MDX'),
(258, 3, 'Midlands', 'MID'),
(259, 3, 'Midlothian', 'MLT'),
(260, 3, 'Monmouthshire', 'MON'),
(261, 3, 'Montgomeryshire', 'MGY'),
(262, 3, 'Moray', 'MOR'),
(263, 3, 'Nairnshire', 'NAI'),
(264, 3, 'Norfolk', 'NOR'),
(265, 3, 'Northamptonshire', 'NMP'),
(266, 3, 'Northumberland', 'NUM'),
(267, 3, 'Nottinghamshire', 'NOT'),
(268, 3, 'Orkney', 'ORK'),
(269, 3, 'Oxfordshire', 'OXF'),
(270, 3, 'Peebleshire', 'PEE'),
(271, 3, 'Pembrokeshire', 'PEM'),
(272, 3, 'Perthshire', 'PER'),
(273, 3, 'Radnorshire', 'RAD'),
(274, 3, 'Renfrewshire', 'REN'),
(275, 3, 'Ross & Cromarty', 'ROS'),
(276, 3, 'Roxburghshire', 'ROX'),
(277, 3, 'Rutland', 'RUT'),
(278, 3, 'Selkirkshire', 'SEL'),
(279, 3, 'Shetland', 'SHE'),
(280, 3, 'Shropshire', 'SHR'),
(281, 3, 'Somerset', 'SOM'),
(282, 3, 'Staffordshire', 'STA'),
(283, 3, 'Stirlingshire', 'STI'),
(284, 3, 'Suffolk', 'SUF'),
(285, 3, 'Surrey', 'SUR'),
(286, 3, 'Sussex', 'SUS'),
(287, 3, 'Sutherland', 'SUT'),
(288, 3, 'Tyne & Wear', 'TYN'),
(289, 3, 'Warwickshire', 'WAR'),
(290, 3, 'West Lothian', 'WLO'),
(291, 3, 'Westmorland', 'WES'),
(292, 3, 'Wigtownshire', 'WIG'),
(293, 3, 'Wiltshire', 'WIL'),
(294, 3, 'Worcestershire', 'WOR'),
(295, 3, 'Yorkshire', 'YOR'),
(296, 184, 'Alba', 'AB'),
(297, 184, 'Arad', 'AR'),
(298, 184, 'Arges', 'AG'),
(299, 184, 'Bacău', 'BC'),
(300, 184, 'Bihor', 'BH'),
(301, 184, 'Bistrita - Nasaud Bistrita', 'BN'),
(302, 184, 'Botosani', 'BT'),
(303, 184, 'Brasov', 'BV'),
(304, 184, 'Braila', 'BR'),
(305, 184, 'Bucuresti', 'B'),
(306, 184, 'Buzau', 'BZ'),
(307, 184, 'Caras - Severin', 'CS'),
(308, 184, 'Calarasi', 'CL'),
(309, 184, 'Cluj', 'CJ'),
(310, 184, 'Constanta', 'CT'),
(311, 184, 'Covasna Sfantu Gheorghe', 'CV'),
(312, 184, 'Dambovita', 'DB'),
(313, 184, 'Dolj', 'DJ'),
(314, 184, 'Galati', 'GL'),
(315, 184, 'Giurgiu', 'GR'),
(316, 184, 'Gorj', 'GJ'),
(317, 184, 'Harghita', 'HR'),
(318, 184, 'Hunedoara', 'HD'),
(319, 184, 'Ialomita', 'IL'),
(320, 184, 'Iasi', 'IS'),
(321, 184, 'Ilfov', 'IF'),
(322, 184, 'Maramures', 'MM'),
(323, 184, 'Mehedinti', 'MH'),
(324, 184, 'Mures', 'MS'),
(325, 184, 'Neamt', 'NT'),
(326, 184, 'Olt', 'OT'),
(327, 184, 'Prahova Ploiesti', 'PH'),
(328, 184, 'Satu Mare', 'SM'),
(329, 184, 'Salaj', 'SJ'),
(330, 184, 'Sibiu', 'SB'),
(331, 184, 'Suceava', 'SV'),
(332, 184, 'Teleorman', 'TR'),
(333, 184, 'Timis', 'TM'),
(334, 184, 'Tulcea', 'TL'),
(335, 184, 'Vaslui', 'VS'),
(336, 184, 'Valcea', 'VL'),
(337, 184, 'Vrancea', 'VN'),
(338, 103, 'Budapest', 'BUD'),
(339, 103, 'Baranya', 'BAR'),
(340, 103, 'Bács-Kiskun', 'BKM'),
(341, 103, 'Békés', 'BEK'),
(342, 103, 'Borsod-Abaúj-Zemplén', 'BAZ'),
(343, 103, 'Csongrád', 'CSO'),
(344, 103, 'Fejér', 'FEJ'),
(345, 103, 'Győr-Moson-Sopron', 'GMS'),
(346, 103, 'Hajdú-Bihar', 'HBM'),
(347, 103, 'Heves', 'HEV'),
(348, 103, 'Jász-Nagykun-Szolnok', 'JNS'),
(349, 103, 'Komárom-Esztergom', 'KEM'),
(350, 103, 'Nógrád', 'NOG'),
(351, 103, 'Pest', 'PES'),
(352, 103, 'Somogy', 'SOM'),
(353, 103, 'Szabolcs-Szatmár-Bereg', 'SSB'),
(354, 103, 'Tolna', 'TOL'),
(355, 103, 'Vas', 'VAS'),
(356, 103, 'Veszprém', 'VES'),
(357, 103, 'Zala', 'ZAL'),
(358, 105, 'Andhra Pradesh', 'AP'),
(359, 105, 'Arunachal Pradesh', 'AR'),
(360, 105, 'Assam', 'AS'),
(361, 105, 'Bihar', 'BR'),
(362, 105, 'Chhattisgarh', 'CT'),
(363, 105, 'Goa', 'GA'),
(364, 105, 'Gujarat', 'GJ'),
(365, 105, 'Haryana', 'HR'),
(366, 105, 'Himachal Pradesh', 'HP'),
(367, 105, 'Jammu and Kashmir', 'JK'),
(368, 105, 'Jharkhand', 'JH'),
(369, 105, 'Karnataka', 'KA'),
(370, 105, 'Kerala', 'KL'),
(371, 105, 'Madhya Pradesh', 'MP'),
(372, 105, 'Maharashtra', 'MH'),
(373, 105, 'Manipur', 'MN'),
(374, 105, 'Meghalaya', 'ML'),
(375, 105, 'Mizoram', 'MZ'),
(376, 105, 'Nagaland', 'NL'),
(377, 105, 'Odisha', 'OR'),
(378, 105, 'Punjab', 'PB'),
(379, 105, 'Rajasthan', 'RJ'),
(380, 105, 'Sikkim', 'SK'),
(381, 105, 'Tamil Nadu', 'TN'),
(382, 105, 'Telangana', 'TG'),
(383, 105, 'Tripura', 'TR'),
(384, 105, 'Uttarakhand', 'UT'),
(385, 105, 'Uttar Pradesh', 'UP'),
(386, 105, 'West Bengal', 'WB'),
(387, 105, 'Andaman and Nicobar Islands', 'AN'),
(388, 105, 'Chandigarh', 'CH'),
(389, 105, 'Dadra and Nagar Haveli', 'DN'),
(390, 105, 'Daman and Diu', 'DD'),
(391, 105, 'Delhi', 'DL'),
(392, 105, 'Lakshadweep', 'LD'),
(393, 105, 'Puducherry', 'PY'),
(394, 78, 'Auvergne-Rhône-Alpes', 'ARA'),
(395, 78, 'Bourgogne-Franche-Comté', 'BFC'),
(396, 78, 'Bretagne', 'BZH'),
(397, 78, 'Centre–Val-de-Loire', 'CVL'),
(398, 78, 'Corse', 'COR'),
(399, 78, 'Guadeloupe', 'GP'),
(400, 78, 'Guyane', 'GF'),
(401, 78, 'Grand-Est', 'GE'),
(402, 78, 'Hauts-de-France', 'HF'),
(403, 78, 'Île-de-France', 'IDF'),
(404, 78, 'Martinique', 'MQ'),
(405, 78, 'Mayotte', 'YT'),
(406, 78, 'Normandie', 'NOR'),
(407, 78, 'Pays-de-la-Loire', 'PL'),
(408, 78, 'Nouvelle-Aquitaine', 'NA'),
(409, 78, 'Occitanie', 'OCC'),
(410, 78, 'Provence-Alpes-Côte-d\'Azur', 'PACA'),
(411, 78, 'Réunion', 'RE'),
(412, 161, 'Northland', 'NTL'),
(413, 161, 'Auckland', 'AUK'),
(414, 161, 'Waikato', 'WKO'),
(415, 161, 'Bay of Plenty', 'BOP'),
(416, 161, 'Gisborne', 'GIS'),
(417, 161, 'Hawke\'s Bay', 'HKB'),
(418, 161, 'Taranaki', 'TKI'),
(419, 161, 'Manawatu-Wanganui', 'MWT'),
(420, 161, 'Wellington', 'WGN'),
(421, 161, 'Tasman', 'TAS'),
(422, 161, 'Nelson', 'NSN'),
(423, 161, 'Marlborough', 'MBH'),
(424, 161, 'West Coast', 'WTC'),
(425, 161, 'Canterbury', 'CAN'),
(426, 161, 'Otago Otago', 'OTA'),
(427, 161, 'Southland', 'STL');

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_user_mail_blockers`
--

CREATE TABLE `rainlab_user_mail_blockers` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `details` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'UserGrop\' not found in /home/ivan/project/newZU/october/modules/cms/classes/CodeParser.php(290) : eval()\'d code:5\nStack trace:\n#0 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(427): Cms59ba60637aa98092131248_91279b9f1d63be8f7e28e82bdf405fc7Class->onStart()\n#1 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(349): Cms\\Classes\\Controller->execPageCycle()\n#2 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#3 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#4 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#5 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#6 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#8 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#9 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#10 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#12 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#14 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#15 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#16 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#17 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#42 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#48 {main}', NULL, '2017-09-14 07:56:35', '2017-09-14 07:56:35'),
(2, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Class \'UserGrops\' not found in /home/ivan/project/newZU/october/modules/cms/classes/CodeParser.php(290) : eval()\'d code:5\nStack trace:\n#0 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(427): Cms59ba6073dd6b9596417846_57d617beecbffa0d608d855ea9a101e9Class->onStart()\n#1 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(349): Cms\\Classes\\Controller->execPageCycle()\n#2 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#3 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#4 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#5 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#6 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#8 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#9 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#10 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#12 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#13 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#14 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#15 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#16 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#17 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#25 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#42 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#48 {main}', NULL, '2017-09-14 07:56:51', '2017-09-14 07:56:51'),
(3, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Type error: Too few arguments to function Illuminate\\Support\\Collection::get(), 0 passed in /home/ivan/project/newZU/october/plugins/akira/user/components/Registration.php on line 26 and at least 1 expected in /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Collection.php:294\nStack trace:\n#0 /home/ivan/project/newZU/october/plugins/akira/user/components/Registration.php(26): Illuminate\\Support\\Collection->get()\n#1 /home/ivan/project/newZU/october/modules/cms/classes/CmsCompoundObject.php(171): Akira\\User\\Components\\Registration->onRun()\n#2 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(428): Cms\\Classes\\CmsCompoundObject->runComponents()\n#3 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(349): Cms\\Classes\\Controller->execPageCycle()\n#4 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#5 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#6 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#8 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#9 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#10 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#12 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#16 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#17 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#18 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#27 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#44 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#49 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#50 {main}', NULL, '2017-09-14 08:06:00', '2017-09-14 08:06:00'),
(4, 'error', 'ErrorException: Undefined property: October\\Rain\\Database\\Collection::$user in /home/ivan/project/newZU/october/plugins/akira/user/components/Registration.php:27\nStack trace:\n#0 /home/ivan/project/newZU/october/plugins/akira/user/components/Registration.php(27): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined prope...\', \'/home/ivan/proj...\', 27, Array)\n#1 /home/ivan/project/newZU/october/modules/cms/classes/CmsCompoundObject.php(171): Akira\\User\\Components\\Registration->onRun()\n#2 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(428): Cms\\Classes\\CmsCompoundObject->runComponents()\n#3 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(349): Cms\\Classes\\Controller->execPageCycle()\n#4 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#5 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#6 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#8 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#9 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#10 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#12 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#16 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#17 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#18 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#27 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#44 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#49 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#50 {main}', NULL, '2017-09-14 08:09:00', '2017-09-14 08:09:00'),
(5, 'error', 'ErrorException: Undefined property: October\\Rain\\Database\\Collection::$users in /home/ivan/project/newZU/october/plugins/akira/user/components/Registration.php:27\nStack trace:\n#0 /home/ivan/project/newZU/october/plugins/akira/user/components/Registration.php(27): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined prope...\', \'/home/ivan/proj...\', 27, Array)\n#1 /home/ivan/project/newZU/october/modules/cms/classes/CmsCompoundObject.php(171): Akira\\User\\Components\\Registration->onRun()\n#2 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(428): Cms\\Classes\\CmsCompoundObject->runComponents()\n#3 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(349): Cms\\Classes\\Controller->execPageCycle()\n#4 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#5 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#6 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#8 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#9 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#10 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#12 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#15 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#16 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#17 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#18 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#19 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#27 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#39 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#44 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#49 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#50 {main}', NULL, '2017-09-14 08:09:05', '2017-09-14 08:09:05');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(6, 'error', 'ErrorException: Undefined offset: 4 in /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Collection.php:1043\nStack trace:\n#0 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Collection.php(1043): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined offse...\', \'/home/ivan/proj...\', 1043, Array)\n#1 /home/ivan/project/newZU/october/plugins/akira/user/components/Registration.php(27): Illuminate\\Support\\Collection->offsetGet(4)\n#2 /home/ivan/project/newZU/october/modules/cms/classes/CmsCompoundObject.php(171): Akira\\User\\Components\\Registration->onRun()\n#3 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(428): Cms\\Classes\\CmsCompoundObject->runComponents()\n#4 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(349): Cms\\Classes\\Controller->execPageCycle()\n#5 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#7 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#8 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#9 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#10 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#11 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#15 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#17 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#18 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#19 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#28 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#31 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#34 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#37 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#40 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#43 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#45 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#48 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#49 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#50 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#51 {main}', NULL, '2017-09-14 08:09:30', '2017-09-14 08:09:30'),
(7, 'error', 'Cms\\Classes\\CmsException: The partial \'user/widget\' is not found. in /home/ivan/project/newZU/october/modules/cms/classes/Controller.php:852\nStack trace:\n#0 /home/ivan/project/newZU/october/modules/cms/twig/Extension.php(117): Cms\\Classes\\Controller->renderPartial(\'user/widget\', Array)\n#1 /home/ivan/project/newZU/october/storage/cms/twig/7b/7b72c214e9a24c332dda69e800eda89f39dd2c067759117c5e01102e095233cf.php(56): Cms\\Twig\\Extension->partialFunction(\'user/widget\', Array)\n#2 /home/ivan/project/newZU/october/vendor/twig/twig/lib/Twig/Template.php(432): __TwigTemplate_ed2a0c063044772fd5bd87b7f9d822622df2e931c7d293a17d35a2e7c78be454->doDisplay(Array, Array)\n#3 /home/ivan/project/newZU/october/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#4 /home/ivan/project/newZU/october/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#5 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(376): Twig_Template->render(Array)\n#6 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#7 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'profile\')\n#8 [internal function]: Cms\\Classes\\CmsController->run(\'profile\')\n#9 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#10 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#12 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#14 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#16 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#17 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#18 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#19 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#21 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#23 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#46 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#49 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#50 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#51 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#52 {main}\n\nNext Twig_Error_Runtime: An exception has been thrown during the rendering of a template (\"The partial \'user/widget\' is not found.\") in \"/home/ivan/project/newZU/october/themes/zu/layouts/default.htm\" at line 18. in /home/ivan/project/newZU/october/vendor/twig/twig/lib/Twig/Template.php:447\nStack trace:\n#0 /home/ivan/project/newZU/october/vendor/twig/twig/lib/Twig/Template.php(403): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 /home/ivan/project/newZU/october/vendor/twig/twig/lib/Twig/Template.php(411): Twig_Template->display(Array)\n#2 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(376): Twig_Template->render(Array)\n#3 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'profile\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'profile\')\n#6 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(256): call_user_func_array(Array, Array)\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(164): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(112): Illuminate\\Routing\\ControllerDispatcher->call(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), \'run\')\n#9 [internal function]: Illuminate\\Routing\\ControllerDispatcher->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#10 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#11 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#13 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(114): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(68): Illuminate\\Routing\\ControllerDispatcher->callWithinStack(Object(Cms\\Classes\\CmsController), Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'run\')\n#15 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(203): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request), \'Cms\\\\Classes\\\\Cms...\', \'run\')\n#16 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(134): Illuminate\\Routing\\Route->runWithCustomDispatcher(Object(Illuminate\\Http\\Request))\n#17 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(708): Illuminate\\Routing\\Route->run(Object(Illuminate\\Http\\Request))\n#18 [internal function]: Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#20 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(710): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(674): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(236): Illuminate\\Routing\\Router->dispatch(Object(Illuminate\\Http\\Request))\n#26 [internal function]: Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(139): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 [internal function]: Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(62): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 [internal function]: Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 [internal function]: Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 [internal function]: Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(44): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 [internal function]: Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(124): call_user_func_array(Array, Array)\n#43 [internal function]: Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): call_user_func(Object(Closure), Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(122): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(87): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#49 {main}', NULL, '2017-09-14 11:00:07', '2017-09-14 11:00:07'),
(8, 'error', 'Swift_TransportException: Expected response code 220 but got code \"\", with message \"\" in /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:419\nStack trace:\n#0 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(325): Swift_Transport_AbstractSmtpTransport->assertResponseCode(\'\', Array)\n#1 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(130): Swift_Transport_AbstractSmtpTransport->readGreeting()\n#2 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/SendmailTransport.php(52): Swift_Transport_AbstractSmtpTransport->start()\n#3 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(67): Swift_Transport_SendmailTransport->start()\n#4 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#5 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(84): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#6 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(136): October\\Rain\\Mail\\Mailer->send(\'rainlab.user::m...\', Array, Object(Closure))\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Mail\\Mailer->sendTo(Array, \'rainlab.user::m...\', Array)\n#8 /home/ivan/project/newZU/october/plugins/rainlab/user/models/User.php(82): Illuminate\\Support\\Facades\\Facade::__callStatic(\'sendTo\', Array)\n#9 /home/ivan/project/newZU/october/vendor/october/rain/src/Auth/Manager.php(86): RainLab\\User\\Models\\User->attemptActivation(\'DAuCIK19VfiMLQs...\')\n#10 /home/ivan/project/newZU/october/plugins/rainlab/user/classes/AuthManager.php(59): October\\Rain\\Auth\\Manager->register(Array, true)\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): RainLab\\User\\Classes\\AuthManager->register(Array, true)\n#12 /home/ivan/project/newZU/october/plugins/rainlab/user/components/Account.php(219): Illuminate\\Support\\Facades\\Facade::__callStatic(\'register\', Array)\n#13 /home/ivan/project/newZU/october/modules/cms/classes/ComponentBase.php(163): RainLab\\User\\Components\\Account->onRegister()\n#14 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onRegister\')\n#15 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onRegister\')\n#16 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#17 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#18 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#19 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(162): Illuminate\\Routing\\Route->runController()\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(610): Illuminate\\Routing\\Route->run()\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#55 {main}', NULL, '2017-09-19 04:54:43', '2017-09-19 04:54:43'),
(9, 'error', 'Swift_TransportException: Expected response code 220 but got code \"\", with message \"\" in /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:419\nStack trace:\n#0 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(325): Swift_Transport_AbstractSmtpTransport->assertResponseCode(\'\', Array)\n#1 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(130): Swift_Transport_AbstractSmtpTransport->readGreeting()\n#2 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/SendmailTransport.php(52): Swift_Transport_AbstractSmtpTransport->start()\n#3 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(67): Swift_Transport_SendmailTransport->start()\n#4 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#5 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(84): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#6 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(136): October\\Rain\\Mail\\Mailer->send(\'rainlab.user::m...\', Array, Object(Closure))\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Mail\\Mailer->sendTo(Array, \'rainlab.user::m...\', Array)\n#8 /home/ivan/project/newZU/october/plugins/rainlab/user/models/User.php(82): Illuminate\\Support\\Facades\\Facade::__callStatic(\'sendTo\', Array)\n#9 /home/ivan/project/newZU/october/vendor/october/rain/src/Auth/Manager.php(86): RainLab\\User\\Models\\User->attemptActivation(\'CSKpoFhXht4MepX...\')\n#10 /home/ivan/project/newZU/october/plugins/rainlab/user/classes/AuthManager.php(59): October\\Rain\\Auth\\Manager->register(Array, true)\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): RainLab\\User\\Classes\\AuthManager->register(Array, true)\n#12 /home/ivan/project/newZU/october/plugins/rainlab/user/components/Account.php(219): Illuminate\\Support\\Facades\\Facade::__callStatic(\'register\', Array)\n#13 /home/ivan/project/newZU/october/modules/cms/classes/ComponentBase.php(163): RainLab\\User\\Components\\Account->onRegister()\n#14 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onRegister\')\n#15 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onRegister\')\n#16 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#17 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#18 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#19 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(162): Illuminate\\Routing\\Route->runController()\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(610): Illuminate\\Routing\\Route->run()\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#55 {main}', NULL, '2017-09-19 04:57:01', '2017-09-19 04:57:01');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(10, 'error', 'Swift_TransportException: Expected response code 220 but got code \"\", with message \"\" in /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:419\nStack trace:\n#0 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(325): Swift_Transport_AbstractSmtpTransport->assertResponseCode(\'\', Array)\n#1 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(130): Swift_Transport_AbstractSmtpTransport->readGreeting()\n#2 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/SendmailTransport.php(52): Swift_Transport_AbstractSmtpTransport->start()\n#3 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(67): Swift_Transport_SendmailTransport->start()\n#4 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#5 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(84): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#6 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(136): October\\Rain\\Mail\\Mailer->send(\'rainlab.user::m...\', Array, Object(Closure))\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Mail\\Mailer->sendTo(Array, \'rainlab.user::m...\', Array)\n#8 /home/ivan/project/newZU/october/plugins/rainlab/user/models/User.php(82): Illuminate\\Support\\Facades\\Facade::__callStatic(\'sendTo\', Array)\n#9 /home/ivan/project/newZU/october/vendor/october/rain/src/Auth/Manager.php(86): RainLab\\User\\Models\\User->attemptActivation(\'lEloknAaRQN06Ms...\')\n#10 /home/ivan/project/newZU/october/plugins/rainlab/user/classes/AuthManager.php(59): October\\Rain\\Auth\\Manager->register(Array, true)\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): RainLab\\User\\Classes\\AuthManager->register(Array, true)\n#12 /home/ivan/project/newZU/october/plugins/rainlab/user/components/Account.php(219): Illuminate\\Support\\Facades\\Facade::__callStatic(\'register\', Array)\n#13 /home/ivan/project/newZU/october/modules/cms/classes/ComponentBase.php(163): RainLab\\User\\Components\\Account->onRegister()\n#14 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onRegister\')\n#15 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onRegister\')\n#16 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#17 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#18 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#19 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(162): Illuminate\\Routing\\Route->runController()\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(610): Illuminate\\Routing\\Route->run()\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#55 {main}', NULL, '2017-09-19 04:57:35', '2017-09-19 04:57:35'),
(11, 'error', 'Swift_TransportException: Expected response code 220 but got code \"\", with message \"\" in /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:419\nStack trace:\n#0 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(325): Swift_Transport_AbstractSmtpTransport->assertResponseCode(\'\', Array)\n#1 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(130): Swift_Transport_AbstractSmtpTransport->readGreeting()\n#2 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/SendmailTransport.php(52): Swift_Transport_AbstractSmtpTransport->start()\n#3 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(67): Swift_Transport_SendmailTransport->start()\n#4 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#5 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(84): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#6 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(136): October\\Rain\\Mail\\Mailer->send(\'rainlab.user::m...\', Array, Object(Closure))\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Mail\\Mailer->sendTo(Array, \'rainlab.user::m...\', Array)\n#8 /home/ivan/project/newZU/october/plugins/rainlab/user/models/User.php(82): Illuminate\\Support\\Facades\\Facade::__callStatic(\'sendTo\', Array)\n#9 /home/ivan/project/newZU/october/vendor/october/rain/src/Auth/Manager.php(86): RainLab\\User\\Models\\User->attemptActivation(\'maQkTP0hnaephyC...\')\n#10 /home/ivan/project/newZU/october/plugins/rainlab/user/classes/AuthManager.php(59): October\\Rain\\Auth\\Manager->register(Array, true)\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): RainLab\\User\\Classes\\AuthManager->register(Array, true)\n#12 /home/ivan/project/newZU/october/plugins/rainlab/user/components/Account.php(219): Illuminate\\Support\\Facades\\Facade::__callStatic(\'register\', Array)\n#13 /home/ivan/project/newZU/october/modules/cms/classes/ComponentBase.php(163): RainLab\\User\\Components\\Account->onRegister()\n#14 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onRegister\')\n#15 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onRegister\')\n#16 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#17 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#18 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#19 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(162): Illuminate\\Routing\\Route->runController()\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(610): Illuminate\\Routing\\Route->run()\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#55 {main}', NULL, '2017-09-19 04:57:43', '2017-09-19 04:57:43'),
(12, 'error', 'Swift_TransportException: Expected response code 220 but got code \"\", with message \"\" in /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:419\nStack trace:\n#0 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(325): Swift_Transport_AbstractSmtpTransport->assertResponseCode(\'\', Array)\n#1 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(130): Swift_Transport_AbstractSmtpTransport->readGreeting()\n#2 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/SendmailTransport.php(52): Swift_Transport_AbstractSmtpTransport->start()\n#3 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(67): Swift_Transport_SendmailTransport->start()\n#4 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#5 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(84): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#6 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(136): October\\Rain\\Mail\\Mailer->send(\'rainlab.user::m...\', Array, Object(Closure))\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Mail\\Mailer->sendTo(Array, \'rainlab.user::m...\', Array)\n#8 /home/ivan/project/newZU/october/plugins/rainlab/user/models/User.php(82): Illuminate\\Support\\Facades\\Facade::__callStatic(\'sendTo\', Array)\n#9 /home/ivan/project/newZU/october/vendor/october/rain/src/Auth/Manager.php(86): RainLab\\User\\Models\\User->attemptActivation(\'EiixBWv8GlEoomf...\')\n#10 /home/ivan/project/newZU/october/plugins/rainlab/user/classes/AuthManager.php(59): October\\Rain\\Auth\\Manager->register(Array, true)\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): RainLab\\User\\Classes\\AuthManager->register(Array, true)\n#12 /home/ivan/project/newZU/october/plugins/rainlab/user/components/Account.php(219): Illuminate\\Support\\Facades\\Facade::__callStatic(\'register\', Array)\n#13 /home/ivan/project/newZU/october/modules/cms/classes/ComponentBase.php(163): RainLab\\User\\Components\\Account->onRegister()\n#14 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onRegister\')\n#15 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onRegister\')\n#16 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#17 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#18 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#19 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(162): Illuminate\\Routing\\Route->runController()\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(610): Illuminate\\Routing\\Route->run()\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#55 {main}', NULL, '2017-09-19 05:00:47', '2017-09-19 05:00:47'),
(13, 'error', 'Swift_TransportException: Expected response code 220 but got code \"\", with message \"\" in /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:419\nStack trace:\n#0 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(325): Swift_Transport_AbstractSmtpTransport->assertResponseCode(\'\', Array)\n#1 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(130): Swift_Transport_AbstractSmtpTransport->readGreeting()\n#2 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/SendmailTransport.php(52): Swift_Transport_AbstractSmtpTransport->start()\n#3 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(67): Swift_Transport_SendmailTransport->start()\n#4 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#5 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(84): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#6 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(136): October\\Rain\\Mail\\Mailer->send(\'rainlab.user::m...\', Array, Object(Closure))\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Mail\\Mailer->sendTo(Array, \'rainlab.user::m...\', Array)\n#8 /home/ivan/project/newZU/october/plugins/rainlab/user/models/User.php(82): Illuminate\\Support\\Facades\\Facade::__callStatic(\'sendTo\', Array)\n#9 /home/ivan/project/newZU/october/vendor/october/rain/src/Auth/Manager.php(86): RainLab\\User\\Models\\User->attemptActivation(\'AWnRLncQs7OQONp...\')\n#10 /home/ivan/project/newZU/october/plugins/rainlab/user/classes/AuthManager.php(59): October\\Rain\\Auth\\Manager->register(Array, true)\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): RainLab\\User\\Classes\\AuthManager->register(Array, true)\n#12 /home/ivan/project/newZU/october/plugins/rainlab/user/components/Account.php(219): Illuminate\\Support\\Facades\\Facade::__callStatic(\'register\', Array)\n#13 /home/ivan/project/newZU/october/modules/cms/classes/ComponentBase.php(163): RainLab\\User\\Components\\Account->onRegister()\n#14 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onRegister\')\n#15 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onRegister\')\n#16 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#17 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#18 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#19 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(162): Illuminate\\Routing\\Route->runController()\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(610): Illuminate\\Routing\\Route->run()\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#55 {main}', NULL, '2017-09-19 05:04:45', '2017-09-19 05:04:45');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(14, 'error', 'Swift_TransportException: Expected response code 220 but got code \"\", with message \"\" in /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:419\nStack trace:\n#0 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(325): Swift_Transport_AbstractSmtpTransport->assertResponseCode(\'\', Array)\n#1 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(130): Swift_Transport_AbstractSmtpTransport->readGreeting()\n#2 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/SendmailTransport.php(52): Swift_Transport_AbstractSmtpTransport->start()\n#3 /home/ivan/project/newZU/october/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(67): Swift_Transport_SendmailTransport->start()\n#4 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(451): Swift_Mailer->send(Object(Swift_Message), Array)\n#5 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(84): Illuminate\\Mail\\Mailer->sendSwiftMessage(Object(Swift_Message))\n#6 /home/ivan/project/newZU/october/vendor/october/rain/src/Mail/Mailer.php(136): October\\Rain\\Mail\\Mailer->send(\'rainlab.user::m...\', Array, Object(Closure))\n#7 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): October\\Rain\\Mail\\Mailer->sendTo(Array, \'rainlab.user::m...\', Array)\n#8 /home/ivan/project/newZU/october/plugins/rainlab/user/models/User.php(82): Illuminate\\Support\\Facades\\Facade::__callStatic(\'sendTo\', Array)\n#9 /home/ivan/project/newZU/october/vendor/october/rain/src/Auth/Manager.php(86): RainLab\\User\\Models\\User->attemptActivation(\'zyeX1k6sdrX4Fvp...\')\n#10 /home/ivan/project/newZU/october/plugins/rainlab/user/classes/AuthManager.php(59): October\\Rain\\Auth\\Manager->register(Array, true)\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Support/Facades/Facade.php(221): RainLab\\User\\Classes\\AuthManager->register(Array, true)\n#12 /home/ivan/project/newZU/october/plugins/rainlab/user/components/Account.php(219): Illuminate\\Support\\Facades\\Facade::__callStatic(\'register\', Array)\n#13 /home/ivan/project/newZU/october/modules/cms/classes/ComponentBase.php(163): RainLab\\User\\Components\\Account->onRegister()\n#14 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(721): Cms\\Classes\\ComponentBase->runAjaxHandler(\'onRegister\')\n#15 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(621): Cms\\Classes\\Controller->runAjaxHandler(\'onRegister\')\n#16 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(330): Cms\\Classes\\Controller->execAjaxHandlers()\n#17 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#18 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#19 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(162): Illuminate\\Routing\\Route->runController()\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(610): Illuminate\\Routing\\Route->run()\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#44 /home/ivan/project/newZU/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#45 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#46 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#47 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#53 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#54 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#55 {main}', NULL, '2017-09-19 05:16:38', '2017-09-19 05:16:38'),
(15, 'debug', 'Message-ID: <4764e5b71e59f5f406a866fceaa6e831@127.0.0.1>\r\nDate: Tue, 19 Sep 2017 08:19:28 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: studi <study@study.study>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505809168_8a7f3dff047e9291dd68b9dc9fab118d_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellostudi,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHellostudi,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-19 05:19:28', '2017-09-19 05:19:28'),
(16, 'debug', 'Message-ID: <b9a7d6b5163cc53f52cf4a63e25aa82a@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 14:44:23 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: arh_hot_list <bnmjjlll@list.ru>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505918663_ca56430378df9ae7e0c5834f7331414d_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloarh_hot_list,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloarh_hot_list,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 11:44:23', '2017-09-20 11:44:23'),
(17, 'debug', 'Message-ID: <625aa07e8723cea0f0d815ddf4850b95@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 14:46:50 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: =?utf-8?Q?=D0=9F=D0=B5=D0=B4=D0=B0=D0=B3=D0=BE=D0=B3=D0=B8?=\r\n =?utf-8?Q?_=D0=90=D0=A0=D0=A5=D0=BF=D1=80=D0=BE=D0=B5=D0=BA=D1=82=D0=B0?=\r\n <ghjkhjkhjj@HJHJ.COM>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505918810_d918695c46ba20827e9c42d046e05f37_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">HelloПедагоги АРХпроекта,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloПедагоги АРХпроекта,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 11:46:50', '2017-09-20 11:46:50'),
(18, 'debug', 'Message-ID: <5b10331be26ec4960803d1c5a8625bd3@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 14:48:54 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: adssd <asfsdf@fdsfd.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505918934_9470ec37e54aed90da51af848afa0a7c_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloadssd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloadssd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 11:48:54', '2017-09-20 11:48:54'),
(19, 'debug', 'Message-ID: <8f65d971ce0c2ae988c3632f3e8be293@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:04:39 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: asddasd <uhjkkkl@jjkj.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505919879_0829576757e9d0c6cc628e011ee26643_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloasddasd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloasddasd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:04:39', '2017-09-20 12:04:39'),
(20, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Parse error: syntax error, unexpected \'if\' (T_IF), expecting function (T_FUNCTION) or const (T_CONST) in /home/ivan/project/newZU/october/modules/cms/classes/CodeParser.php(290) : eval()\'d code:4\nStack trace:\n#0 /home/ivan/project/newZU/october/modules/cms/classes/CodeParser.php(151): Cms\\Classes\\CodeParser->validate(\'<?php \\nclass Cm...\')\n#1 /home/ivan/project/newZU/october/modules/cms/classes/CodeParser.php(111): Cms\\Classes\\CodeParser->rebuild(\'/home/ivan/proj...\')\n#2 /home/ivan/project/newZU/october/modules/cms/classes/CodeParser.php(169): Cms\\Classes\\CodeParser->parse()\n#3 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(530): Cms\\Classes\\CodeParser->source(Object(Cms\\Classes\\Page), Object(Cms\\Classes\\Layout), Object(Cms\\Classes\\Controller))\n#4 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(302): Cms\\Classes\\Controller->initCustomObjects()\n#5 /home/ivan/project/newZU/october/modules/cms/classes/Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 /home/ivan/project/newZU/october/modules/cms/classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#7 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#8 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#9 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#10 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#11 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Route.php(162): Illuminate\\Routing\\Route->runController()\n#12 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(610): Illuminate\\Routing\\Route->run()\n#13 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#16 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#17 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#19 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#32 /home/ivan/project/newZU/october/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#33 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#34 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#35 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#40 /home/ivan/project/newZU/october/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#41 /home/ivan/project/newZU/october/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#42 /home/ivan/project/newZU/october/server.php(18): require_once(\'/home/ivan/proj...\')\n#43 {main}', NULL, '2017-09-20 12:13:09', '2017-09-20 12:13:09'),
(21, 'debug', 'Message-ID: <2c0f104a2cd28361fbb211dc560aebf8@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:17:56 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: =?utf-8?Q?=D0=9F=D0=B5=D0=B4=D0=B0=D0=B3=D0=BE=D0=B3=D0=B8?=\r\n =?utf-8?Q?_=D0=90=D0=A0=D0=A5=D0=BF=D1=80=D0=BE=D0=B5=D0=BA=D1=82=D0=B0?=\r\n <dgsgsdgsd@hjhjjjjk.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505920676_7675d18a66dfa74103475d425918e72b_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">HelloПедагоги АРХпроекта,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloПедагоги АРХпроекта,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:17:56', '2017-09-20 12:17:56'),
(22, 'debug', 'Message-ID: <d36043c1334cc206d3c3a78ac5b6b4df@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:21:28 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: adsd <2313123123@adsdf.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505920888_4f4f16595d0b3ecfc3bd4e9424f07582_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloadsd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloadsd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:21:28', '2017-09-20 12:21:28'),
(23, 'debug', 'Message-ID: <d7af33d67f929188129a6be599e4e8d5@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:22:11 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: dsadsd <dasndkkmllklkl@klkl.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505920931_0504aaea218b8dba0d75eb8ce3b30248_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellodsadsd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHellodsadsd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:22:11', '2017-09-20 12:22:11'),
(24, 'debug', 'Message-ID: <92a01e670419003c8de8ed69963f909f@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:22:49 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: asdsad <sfdf@fdsaf.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505920969_cd40d64983365bb094bb8d8de8421d3c_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloasdsad,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloasdsad,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:22:49', '2017-09-20 12:22:49'),
(25, 'debug', 'Message-ID: <4eabcc5e4fbdef649222033462e9cac9@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:25:02 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: dasdd <sadfdsafd@jhkjkj.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505921102_4342c4c8be3e0a9e0efe6d68345b9084_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellodasdd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHellodasdd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:25:02', '2017-09-20 12:25:02'),
(26, 'debug', 'Message-ID: <187ca327543546634ec2fcef1594f93f@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:28:10 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: =?utf-8?Q?=D0=9F=D0=B5=D0=B4=D0=B0=D0=B3=D0=BE=D0=B3=D0=B8?=\r\n =?utf-8?Q?_=D0=90=D0=A0=D0=A5=D0=BF=D1=80=D0=BE=D0=B5=D0=BA=D1=82=D0=B0?=\r\n <dasdA@fsafas.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505921290_ba9385b90b9552047cad3c7c8ace1e2f_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">HelloПедагоги АРХпроекта,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloПедагоги АРХпроекта,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:28:10', '2017-09-20 12:28:10'),
(27, 'debug', 'Message-ID: <a60213c1278cdedd3746dfff6e8aade5@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:28:59 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: sadasd <sadfdsafd@jhkjkj.comdasda>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505921339_1ccfa0053ccec2e4947c6dc75b2c83fc_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellosadasd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHellosadasd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:28:59', '2017-09-20 12:28:59'),
(28, 'debug', 'Message-ID: <fdfc733ce1d59502feae27c38d2c6992@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:30:43 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: =?utf-8?Q?=D0=9F=D0=B5=D0=B4=D0=B0=D0=B3=D0=BE=D0=B3=D0=B8?=\r\n =?utf-8?Q?_=D0=90=D0=A0=D0=A5=D0=BF=D1=80=D0=BE=D0=B5=D0=BA=D1=82=D0=B0?=\r\n <sadfdsafd@jhkjkj.comsadsd>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505921443_7878e0e7ddb264474c7eca2a6a27472b_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">HelloПедагоги АРХпроекта,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloПедагоги АРХпроекта,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:30:43', '2017-09-20 12:30:43'),
(29, 'debug', 'Message-ID: <a10ac31b6eb2814e359d5f9341fde2ef@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:32:33 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: asdasasd <sadfdsafd@jhkjkj.comsadsddasdasdasdsdas>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505921553_20500add459586776c4dcfea486f916a_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloasdasasd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloasdasasd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:32:33', '2017-09-20 12:32:33'),
(30, 'debug', 'Message-ID: <cbecbd9a29c4409b8f49c83aa3bb75d4@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:35:06 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: =?utf-8?Q?=D0=9F=D0=B5=D0=B4=D0=B0=D0=B3=D0=BE=D0=B3=D0=B8?=\r\n =?utf-8?Q?_=D0=90=D0=A0=D0=A5=D0=BF=D1=80=D0=BE=D0=B5=D0=BA=D1=82=D0=B0?=\r\n <sadfdsafd@jhkjkj.comsadsdsdasaa>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505921706_cc0cececd49e7a991da3daca9df8c6fa_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">HelloПедагоги АРХпроекта,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloПедагоги АРХпроекта,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:35:06', '2017-09-20 12:35:06'),
(31, 'debug', 'Message-ID: <17558cae166ea829779b4da588ce6a13@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:36:47 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: arh_hot_list <sadfdsafd@jhkjkj.comsadsddasdasdsd>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505921807_0105ae848b6525a937f5aee116824a84_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloarh_hot_list,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloarh_hot_list,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:36:47', '2017-09-20 12:36:47');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(32, 'debug', 'Message-ID: <c3f59072db1fc54df5fdb632e0498b0f@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:38:39 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: adasd <sadfdsafd@jhkjkj.comsadsdDAWD>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505921919_cc99d6044ea7279f69f7a560621de986_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloadasd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloadasd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:38:39', '2017-09-20 12:38:39'),
(33, 'debug', 'Message-ID: <36df282ca13fdc61fe3d47807f67cdf2@127.0.0.1>\r\nDate: Wed, 20 Sep 2017 15:40:28 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: asdsdas <sfzdzsd@das.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1505922028_101afc1744faa311a5f627a79c1b7817_=_\"\r\n\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloasdsdas,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\n\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\nHelloasdsdas,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-20 12:40:28', '2017-09-20 12:40:28'),
(34, 'debug', 'Message-ID: <c1617e7dbf6cdb0d19dc671fadb6e267@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 08:12:56 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: =?utf-8?Q?=D0=98=D0=B2=D0=B0=D0=BD?= <ivan@ivan.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506154379_1512aad650dd11250a8b1b3aae9bdc62_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">HelloИван,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHelloИван,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 05:13:00', '2017-09-23 05:13:00'),
(35, 'debug', 'Message-ID: <e4f4368d99c690e1dee7548723a5642e@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 08:53:01 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: ref <admin@jlklkkl.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506156782_6a55d4b681e8ff97b28448d0f55d52ab_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloref,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHelloref,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 05:53:02', '2017-09-23 05:53:02'),
(36, 'debug', 'Message-ID: <2e8cf17d36228b0ac237e6562c18b4c3@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 08:54:22 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: bjhhh <e24@ewfh.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506156862_1711ad75183646772cd986f9fe2df672_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellobjhhh,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHellobjhhh,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 05:54:22', '2017-09-23 05:54:22'),
(37, 'debug', 'Message-ID: <3e02253682cb4b88c516c36a9e2f988a@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 08:59:44 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: dsad <e24c2a16@rett.com>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506157184_a70c0e86354a2c1d47f8bc0c0ee79c89_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellodsad,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHellodsad,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 05:59:44', '2017-09-23 05:59:44'),
(38, 'debug', 'Message-ID: <3bb8237dd597423f4acee91292924ab3@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 09:27:09 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: dadw <admin@wweaeawe.lo>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506158831_ec7a5ed2810db2e390683cd065844d97_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellodadw,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHellodadw,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 06:27:11', '2017-09-23 06:27:11'),
(39, 'debug', 'Message-ID: <c67088bd90f4523b3fdc7546fa5393d7@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 09:44:12 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: ererwe <adminRWRWEer@FSD.VOM>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506159854_8196bc2839d18bb218443e8e5d14e229_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Helloererwe,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHelloererwe,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 06:44:14', '2017-09-23 06:44:14'),
(40, 'debug', 'Message-ID: <77291fe50b564c421d012290fcc4cd34@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 09:45:19 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: sdd <admin@dhhhhfdf.ooo>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506159919_755741765ec4fcfbaa275a5afc81c32c_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellosdd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHellosdd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 06:45:19', '2017-09-23 06:45:19'),
(41, 'debug', 'Message-ID: <73f73b39ca08ef190bbe82234da20cdc@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 09:47:28 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: sdfdfsd <admin@sseresrwer.ol>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506160048_3bdcc55f2f3dd7d13e046164d1862f74_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellosdfdfsd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHellosdfdfsd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 06:47:28', '2017-09-23 06:47:28'),
(42, 'debug', 'Message-ID: <26da09f886bd07d4894c4d366464fe73@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 09:49:50 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: grgerg <admin22@HKJK.COM>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506160190_68b595e3ce1d88922b064d7aaf6ccde6_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellogrgerg,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHellogrgerg,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 06:49:50', '2017-09-23 06:49:50'),
(43, 'debug', 'Message-ID: <c8e564238da4e2bf1b42764392be4d47@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 09:53:42 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: sdfsdfsd <admin@dsfsdfs.tu>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506160422_94a23d86d2adaaf6605e97cb7f718f3f_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">Hellosdfsdfsd,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHellosdfsdfsd,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 06:53:42', '2017-09-23 06:53:42'),
(44, 'debug', 'Message-ID: <c4c98bb63cbe9954405ad677b34d652a@127.0.0.1>\r\nDate: Sat, 23 Sep 2017 09:57:10 +0000\r\nSubject: Your account has been confirmed!\r\nFrom: OctoberCMS <noreply@domain.tld>\r\nTo: DSADDS <admDADSin@DSASDAS.RO>\r\nMIME-Version: 1.0\r\nContent-Type: multipart/alternative;\r\n boundary=\"_=_swift_v4_1506160630_8b1cd889a8b953a3181bbd5d468cb099_=_\"\r\n\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html>\n<head><style type=\"text/css\" media=\"screen\">\n            a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}\n        </style></head>\n<body style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; background-color: #f5f8fa; color: #74787e; height: 100%; hyphens: auto; line-height: 1.4; margin: 0; -moz-hyphens: auto; -ms-word-break: break-all; width: 100% !important; -webkit-hyphens: auto; -webkit-text-size-adjust: none; word-break: break-word;\">\n        <p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">HelloDSADDS,</p>\n<p style=\"font-family: Avenir,Helvetica,sans-serif; box-sizing: border-box; color: #74787e; font-size: 16px; line-height: 1.5em; margin-top: 0; text-align: left; margin: 10px 0;\">This is a message to inform you that your account has been activated successfully.</p>\n    </body>\n</html>\r\n\r\nContent-Type: text/plain; charset=utf-8\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\nHelloDSADDS,\n\nThis is a message to inform you that your account has been activated successfully.', NULL, '2017-09-23 06:57:10', '2017-09-23 06:57:10'),
(45, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 07:50:15', '2017-09-23 07:50:15'),
(46, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 07:58:09', '2017-09-23 07:58:09'),
(47, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:17:23', '2017-09-23 09:17:23'),
(48, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:17:50', '2017-09-23 09:17:50'),
(49, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:18:27', '2017-09-23 09:18:27'),
(50, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:19:24', '2017-09-23 09:19:24'),
(51, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:19:34', '2017-09-23 09:19:34'),
(52, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:45:47', '2017-09-23 09:45:47'),
(53, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:45:58', '2017-09-23 09:45:58'),
(54, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Parse error: syntax error, unexpected \';\', expecting function (T_FUNCTION) or const (T_CONST) in C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\CodeParser.php(290) : eval()\'d code:4\nStack trace:\n#0 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\CodeParser.php(151): Cms\\Classes\\CodeParser->validate(\'<?php \\r\\nclass C...\')\n#1 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\CodeParser.php(111): Cms\\Classes\\CodeParser->rebuild(\'C:\\\\Users\\\\91178\\\\...\')\n#2 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\CodeParser.php(169): Cms\\Classes\\CodeParser->parse()\n#3 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(524): Cms\\Classes\\CodeParser->source(Object(Cms\\Classes\\Page), Object(Cms\\Classes\\Layout), Object(Cms\\Classes\\Controller))\n#4 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(302): Cms\\Classes\\Controller->initCustomObjects()\n#5 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#6 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'school\')\n#7 [internal function]: Cms\\Classes\\CmsController->run(\'school\')\n#8 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#9 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#10 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#11 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(162): Illuminate\\Routing\\Route->runController()\n#12 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(610): Illuminate\\Routing\\Route->run()\n#13 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#14 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#16 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#17 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#19 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#31 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#32 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#34 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#40 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\91178\\Desktop\\zu\\zu\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#42 C:\\Users\\91178\\Desktop\\zu\\zu\\server.php(18): require_once(\'C:\\\\Users\\\\91178\\\\...\')\n#43 {main}', NULL, '2017-09-23 09:45:58', '2017-09-23 09:45:58');
INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(55, 'error', 'Cms\\Classes\\CmsException: The partial \'app/user-widget\' is not found. in C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php:858\nStack trace:\n#0 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\twig\\Extension.php(106): Cms\\Classes\\Controller->renderPartial(\'app/user-widget\', Array)\n#1 C:\\Users\\91178\\Desktop\\zu\\zu\\storage\\cms\\twig\\08\\086ab9de4807e7950f3e8f2887234165413afeb63c94d25700a12e0ea119c412.php(40): Cms\\Twig\\Extension->partialFunction(\'app/user-widget\', Array)\n#2 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(389): __TwigTemplate_60a1ecc948e06f310de36534321769b90372a833921c2f1d330e7c6d114b511d->doDisplay(Array, Array)\n#3 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(366): Twig_Template->displayWithErrorHandling(Array, Array)\n#4 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(374): Twig_Template->display(Array)\n#5 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(918): Twig_Template->render(Array)\n#6 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\twig\\Extension.php(106): Cms\\Classes\\Controller->renderPartial(\'school/sidebar\', Array)\n#7 C:\\Users\\91178\\Desktop\\zu\\zu\\storage\\cms\\twig\\85\\8593b9aff85db00f30835c177ce16ec756e1055f6f3a8217aaf63bd8a66ba129.php(63): Cms\\Twig\\Extension->partialFunction(\'school/sidebar\', Array)\n#8 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(389): __TwigTemplate_1e179b44f184c7bcf2255346ce39ff633c875a6e44226ab2bf571bbc4bf11b49->doDisplay(Array, Array)\n#9 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(366): Twig_Template->displayWithErrorHandling(Array, Array)\n#10 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(374): Twig_Template->display(Array)\n#11 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(376): Twig_Template->render(Array)\n#12 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#13 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'school\')\n#14 [internal function]: Cms\\Classes\\CmsController->run(\'school\')\n#15 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#16 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#17 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#18 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(162): Illuminate\\Routing\\Route->runController()\n#19 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(610): Illuminate\\Routing\\Route->run()\n#20 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#35 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#38 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#45 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#47 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#48 C:\\Users\\91178\\Desktop\\zu\\zu\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#49 C:\\Users\\91178\\Desktop\\zu\\zu\\server.php(18): require_once(\'C:\\\\Users\\\\91178\\\\...\')\n#50 {main}\n\nNext Twig_Error_Runtime: An exception has been thrown during the rendering of a template (\"The partial \'app/user-widget\' is not found.\") in \"C:\\Users\\91178\\Desktop\\zu\\zu/themes/zu/partials/school/sidebar.htm\" at line 8. in C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php:404\nStack trace:\n#0 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(366): Twig_Template->displayWithErrorHandling(Array, Array)\n#1 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(374): Twig_Template->display(Array)\n#2 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(918): Twig_Template->render(Array)\n#3 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\twig\\Extension.php(106): Cms\\Classes\\Controller->renderPartial(\'school/sidebar\', Array)\n#4 C:\\Users\\91178\\Desktop\\zu\\zu\\storage\\cms\\twig\\85\\8593b9aff85db00f30835c177ce16ec756e1055f6f3a8217aaf63bd8a66ba129.php(63): Cms\\Twig\\Extension->partialFunction(\'school/sidebar\', Array)\n#5 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(389): __TwigTemplate_1e179b44f184c7bcf2255346ce39ff633c875a6e44226ab2bf571bbc4bf11b49->doDisplay(Array, Array)\n#6 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(366): Twig_Template->displayWithErrorHandling(Array, Array)\n#7 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(374): Twig_Template->display(Array)\n#8 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(376): Twig_Template->render(Array)\n#9 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#10 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'school\')\n#11 [internal function]: Cms\\Classes\\CmsController->run(\'school\')\n#12 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#13 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#14 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#15 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(162): Illuminate\\Routing\\Route->runController()\n#16 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(610): Illuminate\\Routing\\Route->run()\n#17 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#32 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#35 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#37 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#40 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#41 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#44 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#45 C:\\Users\\91178\\Desktop\\zu\\zu\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#46 C:\\Users\\91178\\Desktop\\zu\\zu\\server.php(18): require_once(\'C:\\\\Users\\\\91178\\\\...\')\n#47 {main}', NULL, '2017-09-23 09:46:56', '2017-09-23 09:46:56'),
(56, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:58:17', '2017-09-23 09:58:17'),
(57, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:58:56', '2017-09-23 09:58:56'),
(58, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 09:58:56', '2017-09-23 09:58:56'),
(59, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:12:34', '2017-09-23 10:12:34'),
(60, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:12:34', '2017-09-23 10:12:34'),
(61, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:13:04', '2017-09-23 10:13:04'),
(62, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:13:04', '2017-09-23 10:13:04'),
(63, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:24:44', '2017-09-23 10:24:44'),
(64, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:24:44', '2017-09-23 10:24:44'),
(65, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:28:44', '2017-09-23 10:28:44'),
(66, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:28:44', '2017-09-23 10:28:44'),
(67, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:29:04', '2017-09-23 10:29:04'),
(68, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:29:04', '2017-09-23 10:29:04'),
(69, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:29:21', '2017-09-23 10:29:21'),
(70, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:29:21', '2017-09-23 10:29:21'),
(71, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:29:34', '2017-09-23 10:29:34'),
(72, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 10:29:34', '2017-09-23 10:29:34'),
(73, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalErrorException: Maximum execution time of 60 seconds exceeded in C:\\Users\\91178\\Desktop\\zu\\zu\\storage\\cms\\twig\\ac\\ac98a4672a14a9cf005122959a37f0c2f90720954739874c02211039ea22c3cf.php:4\nStack trace:\n#0 {main}', NULL, '2017-09-23 11:02:46', '2017-09-23 11:02:46'),
(74, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:16:11', '2017-09-23 11:16:11'),
(75, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:16:11', '2017-09-23 11:16:11'),
(76, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:16:56', '2017-09-23 11:16:56'),
(77, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:16:56', '2017-09-23 11:16:56'),
(78, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:16:56', '2017-09-23 11:16:56'),
(79, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:03', '2017-09-23 11:18:03'),
(80, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:03', '2017-09-23 11:18:03'),
(81, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:04', '2017-09-23 11:18:04'),
(82, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:04', '2017-09-23 11:18:04'),
(83, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:31', '2017-09-23 11:18:31'),
(84, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:31', '2017-09-23 11:18:31'),
(85, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:31', '2017-09-23 11:18:31'),
(86, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:31', '2017-09-23 11:18:31'),
(87, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:56', '2017-09-23 11:18:56'),
(88, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:56', '2017-09-23 11:18:56'),
(89, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:56', '2017-09-23 11:18:56'),
(90, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:18:56', '2017-09-23 11:18:56'),
(91, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:20:00', '2017-09-23 11:20:00'),
(92, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:20:00', '2017-09-23 11:20:00'),
(93, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:20:00', '2017-09-23 11:20:00'),
(94, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:20:00', '2017-09-23 11:20:00'),
(95, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-23 11:20:00', '2017-09-23 11:20:00'),
(96, 'error', 'Twig_Error_Syntax: Unknown \"uppercase\" filter in \"C:\\Users\\91178\\Desktop\\zu\\zu/themes/zu/partials/app/nav.htm\" at line 10. in C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php:674\nStack trace:\n#0 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(467): Twig_ExpressionParser->getFilterNodeClass(\'uppercase\', 10)\n#1 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(452): Twig_ExpressionParser->parseFilterExpressionRaw(Object(Twig_Node_Expression_GetAttr))\n#2 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(310): Twig_ExpressionParser->parseFilterExpression(Object(Twig_Node_Expression_GetAttr))\n#3 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(202): Twig_ExpressionParser->parsePostfixExpression(Object(Twig_Node_Expression_GetAttr))\n#4 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(92): Twig_ExpressionParser->parsePrimaryExpression()\n#5 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\ExpressionParser.php(45): Twig_ExpressionParser->getPrimary()\n#6 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Parser.php(123): Twig_ExpressionParser->parseExpression()\n#7 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\TokenParser\\For.php(40): Twig_Parser->subparse(Array)\n#8 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Parser.php(166): Twig_TokenParser_For->parse(Object(Twig_Token))\n#9 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Parser.php(79): Twig_Parser->subparse(NULL, false)\n#10 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(512): Twig_Parser->parse(Object(Twig_TokenStream))\n#11 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(544): Twig_Environment->parse(Object(Twig_TokenStream))\n#12 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Environment.php(363): Twig_Environment->compileSource(Object(Twig_Source))\n#13 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(917): Twig_Environment->loadTemplate(\'C:\\\\Users\\\\91178\\\\...\')\n#14 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\twig\\Extension.php(106): Cms\\Classes\\Controller->renderPartial(\'app/nav\', Array)\n#15 C:\\Users\\91178\\Desktop\\zu\\zu\\storage\\cms\\twig\\48\\487fcbab4888251ef483fac474f703c94239b7a48304f69dd0e4687e996d6fc6.php(32): Cms\\Twig\\Extension->partialFunction(\'app/nav\', Array)\n#16 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(389): __TwigTemplate_210d992f7dfd4729a09b0b5765a06c07f1634514fa10d1f16d90ff63ee97d33e->doDisplay(Array, Array)\n#17 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(366): Twig_Template->displayWithErrorHandling(Array, Array)\n#18 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(374): Twig_Template->display(Array)\n#19 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(918): Twig_Template->render(Array)\n#20 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\twig\\Extension.php(106): Cms\\Classes\\Controller->renderPartial(\'app/sidebar\', Array)\n#21 C:\\Users\\91178\\Desktop\\zu\\zu\\storage\\cms\\twig\\b9\\b945627317c0edf28dc9c2485d47ffd7bae24888ecf6397cffbc36fe3c2ba580.php(52): Cms\\Twig\\Extension->partialFunction(\'app/sidebar\', Array)\n#22 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(389): __TwigTemplate_105368ebedfd855f7d2f76718ed6a67ad5ee3a20dc57e6886a503b449bf1d60e->doDisplay(Array, Array)\n#23 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(366): Twig_Template->displayWithErrorHandling(Array, Array)\n#24 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\twig\\twig\\lib\\Twig\\Template.php(374): Twig_Template->display(Array)\n#25 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(376): Twig_Template->render(Array)\n#26 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\Controller.php(213): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#27 C:\\Users\\91178\\Desktop\\zu\\zu\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'school/partners\')\n#28 [internal function]: Cms\\Classes\\CmsController->run(\'school/partners\')\n#29 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#30 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#31 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(205): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#32 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(162): Illuminate\\Routing\\Route->runController()\n#33 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(610): Illuminate\\Routing\\Route->run()\n#34 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#46 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(59): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#48 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#49 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#51 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(612): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#52 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(571): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#53 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#54 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#55 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#56 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#57 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#58 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#59 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#60 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#61 C:\\Users\\91178\\Desktop\\zu\\zu\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#62 C:\\Users\\91178\\Desktop\\zu\\zu\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#63 C:\\Users\\91178\\Desktop\\zu\\zu\\server.php(18): require_once(\'C:\\\\Users\\\\91178\\\\...\')\n#64 {main}', NULL, '2017-09-23 12:13:17', '2017-09-23 12:13:17'),
(97, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-24 14:43:57', '2017-09-24 14:43:57'),
(98, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-24 14:43:57', '2017-09-24 14:43:57'),
(99, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-24 14:43:57', '2017-09-24 14:43:57'),
(100, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-24 14:43:57', '2017-09-24 14:43:57'),
(101, 'info', 'getGroupStatus is deprecated. Please update getCollapseStatus instead. Class: RainLab\\Pages\\Widgets\\PageList', NULL, '2017-09-24 14:43:57', '2017-09-24 14:43:57');

-- --------------------------------------------------------

--
-- Структура таблицы `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `system_files`
--

INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
(2, '59ba57cbef943991163653.png', 'new_school_logo.png', 164096, 'image/png', NULL, NULL, 'logo', '1', 'Backend\\Models\\BrandSetting', 1, 2, '2017-09-14 07:19:55', '2017-09-14 07:19:58');

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `content_css` text COLLATE utf8_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `created_at`, `updated_at`) VALUES
(1, 'Default', 'default', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n    </body>\n</html>', '{{ content|raw }}', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2017-09-14 07:16:25', '2017-09-14 07:16:25'),
(2, 'System', 'system', '<html>\n    <head>\n        <style type=\"text/css\" media=\"screen\">\n            {{ css|raw }}\n        </style>\n    </head>\n    <body>\n        {{ content|raw }}\n        <hr />\n        <p>This is an automatic message. Please do not reply to it.</p>\n    </body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', 'a, a:hover {\n    text-decoration: none;\n    color: #0862A2;\n    font-weight: bold;\n}\n\ntd, tr, th, table {\n    padding: 0px;\n    margin: 0px;\n}\n\np {\n    margin: 10px 0;\n}', 1, '2017-09-14 07:16:25', '2017-09-14 07:16:25');

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_partials`
--

CREATE TABLE `system_mail_partials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `content_html` text COLLATE utf8_unicode_ci,
  `content_text` text COLLATE utf8_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'update', 'retry', '1506361413'),
(3, 'system', 'core', 'hash', '\"386846ebe3802c4f192625743abb3f06\"'),
(4, 'system', 'core', 'build', '\"419\"'),
(5, 'cms', 'theme', 'active', '\"zu\"');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2017-09-14 07:15:31'),
(2, 'RainLab.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2017-09-14 07:15:31'),
(3, 'RainLab.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2017-09-14 07:15:32'),
(4, 'RainLab.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2017-09-14 07:15:32'),
(5, 'RainLab.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2017-09-14 07:15:32'),
(6, 'RainLab.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2017-09-14 07:15:32'),
(7, 'RainLab.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2017-09-14 07:15:32'),
(8, 'RainLab.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2017-09-14 07:15:32'),
(9, 'RainLab.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2017-09-14 07:15:32'),
(10, 'RainLab.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2017-09-14 07:15:32'),
(11, 'RainLab.Builder', 'comment', '1.0.10', 'Minor styling update.', '2017-09-14 07:15:32'),
(12, 'RainLab.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2017-09-14 07:15:33'),
(13, 'RainLab.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2017-09-14 07:15:33'),
(14, 'RainLab.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2017-09-14 07:15:33'),
(15, 'RainLab.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2017-09-14 07:15:33'),
(16, 'RainLab.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2017-09-14 07:15:33'),
(17, 'RainLab.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2017-09-14 07:15:33'),
(18, 'RainLab.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2017-09-14 07:15:33'),
(19, 'RainLab.Builder', 'comment', '1.0.18', 'Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2017-09-14 07:15:33'),
(20, 'RainLab.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2017-09-14 07:15:33'),
(21, 'RainLab.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.', '2017-09-14 07:15:33'),
(22, 'RainLab.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2017-09-14 07:15:34'),
(23, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2017-09-14 07:15:35'),
(24, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2017-09-14 07:15:36'),
(25, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2017-09-14 07:15:37'),
(26, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2017-09-14 07:15:37'),
(27, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2017-09-14 07:15:37'),
(28, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2017-09-14 07:15:37'),
(29, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2017-09-14 07:15:37'),
(30, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2017-09-14 07:15:37'),
(31, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2017-09-14 07:15:37'),
(32, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2017-09-14 07:15:37'),
(33, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2017-09-14 07:15:37'),
(34, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2017-09-14 07:15:38'),
(35, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2017-09-14 07:15:38'),
(36, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate \"idParam\" component property in favour of \"slug\" property.', '2017-09-14 07:15:38'),
(37, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2017-09-14 07:15:38'),
(38, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2017-09-14 07:15:38'),
(39, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2017-09-14 07:15:38'),
(40, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2017-09-14 07:15:38'),
(41, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2017-09-14 07:15:38'),
(42, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2017-09-14 07:15:38'),
(43, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2017-09-14 07:15:38'),
(44, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2017-09-14 07:15:39'),
(45, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2017-09-14 07:15:39'),
(46, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2017-09-14 07:15:39'),
(47, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2017-09-14 07:15:39'),
(48, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2017-09-14 07:15:39'),
(49, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2017-09-14 07:15:39'),
(50, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2017-09-14 07:15:39'),
(51, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2017-09-14 07:15:39'),
(52, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2017-09-14 07:15:40'),
(53, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2017-09-14 07:15:40'),
(54, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2017-09-14 07:15:40'),
(55, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2017-09-14 07:15:40'),
(56, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2017-09-14 07:15:40'),
(57, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2017-09-14 07:15:40'),
(58, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2017-09-14 07:15:40'),
(59, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2017-09-14 07:15:40'),
(60, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2017-09-14 07:15:40'),
(61, 'RainLab.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2017-09-14 07:15:40'),
(62, 'RainLab.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2017-09-14 07:15:41'),
(63, 'RainLab.Location', 'comment', '1.0.1', 'Initialize plugin.', '2017-09-14 07:15:41'),
(64, 'RainLab.Location', 'script', '1.0.2', 'create_states_table.php', '2017-09-14 07:15:41'),
(65, 'RainLab.Location', 'script', '1.0.2', 'create_countries_table.php', '2017-09-14 07:15:42'),
(66, 'RainLab.Location', 'comment', '1.0.2', 'Create database tables.', '2017-09-14 07:15:42'),
(67, 'RainLab.Location', 'script', '1.0.3', 'seed_all_tables.php', '2017-09-14 07:16:02'),
(68, 'RainLab.Location', 'comment', '1.0.3', 'Add seed data for countries and states.', '2017-09-14 07:16:02'),
(69, 'RainLab.Location', 'comment', '1.0.4', 'Satisfy the new Google API key requirement.', '2017-09-14 07:16:02'),
(70, 'RainLab.Location', 'script', '1.0.5', 'add_country_pinned_flag.php', '2017-09-14 07:16:03'),
(71, 'RainLab.Location', 'comment', '1.0.5', 'Countries can now be pinned to make them appear at the top of the list.', '2017-09-14 07:16:03'),
(72, 'RainLab.Location', 'comment', '1.0.6', 'Added support for defining a default country and state.', '2017-09-14 07:16:03'),
(73, 'RainLab.Location', 'comment', '1.0.7', 'Added basic geocoding method to the Country model.', '2017-09-14 07:16:03'),
(74, 'RainLab.User', 'script', '1.0.1', 'create_users_table.php', '2017-09-14 07:16:05'),
(75, 'RainLab.User', 'script', '1.0.1', 'create_throttle_table.php', '2017-09-14 07:16:06'),
(76, 'RainLab.User', 'comment', '1.0.1', 'Initialize plugin.', '2017-09-14 07:16:06'),
(77, 'RainLab.User', 'comment', '1.0.2', 'Seed tables.', '2017-09-14 07:16:06'),
(78, 'RainLab.User', 'comment', '1.0.3', 'Translated hard-coded text to language strings.', '2017-09-14 07:16:06'),
(79, 'RainLab.User', 'comment', '1.0.4', 'Improvements to user-interface for Location manager.', '2017-09-14 07:16:06'),
(80, 'RainLab.User', 'comment', '1.0.5', 'Added contact details for users.', '2017-09-14 07:16:06'),
(81, 'RainLab.User', 'script', '1.0.6', 'create_mail_blockers_table.php', '2017-09-14 07:16:08'),
(82, 'RainLab.User', 'comment', '1.0.6', 'Added Mail Blocker utility so users can block specific mail templates.', '2017-09-14 07:16:08'),
(83, 'RainLab.User', 'comment', '1.0.7', 'Add back-end Settings page.', '2017-09-14 07:16:08'),
(84, 'RainLab.User', 'comment', '1.0.8', 'Updated the Settings page.', '2017-09-14 07:16:08'),
(85, 'RainLab.User', 'comment', '1.0.9', 'Adds new welcome mail message for users and administrators.', '2017-09-14 07:16:08'),
(86, 'RainLab.User', 'comment', '1.0.10', 'Adds administrator-only activation mode.', '2017-09-14 07:16:08'),
(87, 'RainLab.User', 'script', '1.0.11', 'users_add_login_column.php', '2017-09-14 07:16:10'),
(88, 'RainLab.User', 'comment', '1.0.11', 'Users now have an optional login field that defaults to the email field.', '2017-09-14 07:16:10'),
(89, 'RainLab.User', 'script', '1.0.12', 'users_rename_login_to_username.php', '2017-09-14 07:16:10'),
(90, 'RainLab.User', 'comment', '1.0.12', 'Create a dedicated setting for choosing the login mode.', '2017-09-14 07:16:10'),
(91, 'RainLab.User', 'comment', '1.0.13', 'Minor fix to the Account sign in logic.', '2017-09-14 07:16:10'),
(92, 'RainLab.User', 'comment', '1.0.14', 'Minor improvements to the code.', '2017-09-14 07:16:10'),
(93, 'RainLab.User', 'script', '1.0.15', 'users_add_surname.php', '2017-09-14 07:16:11'),
(94, 'RainLab.User', 'comment', '1.0.15', 'Adds last name column to users table (surname).', '2017-09-14 07:16:11'),
(95, 'RainLab.User', 'comment', '1.0.16', 'Require permissions for settings page too.', '2017-09-14 07:16:11'),
(96, 'RainLab.User', 'comment', '1.1.0', '!!! Profile fields and Locations have been removed.', '2017-09-14 07:16:11'),
(97, 'RainLab.User', 'script', '1.1.1', 'create_user_groups_table.php', '2017-09-14 07:16:13'),
(98, 'RainLab.User', 'script', '1.1.1', 'seed_user_groups_table.php', '2017-09-14 07:16:13'),
(99, 'RainLab.User', 'comment', '1.1.1', 'Users can now be added to groups.', '2017-09-14 07:16:13'),
(100, 'RainLab.User', 'comment', '1.1.2', 'A raw URL can now be passed as the redirect property in the Account component.', '2017-09-14 07:16:14'),
(101, 'RainLab.User', 'comment', '1.1.3', 'Adds a super user flag to the users table, reserved for future use.', '2017-09-14 07:16:14'),
(102, 'RainLab.User', 'comment', '1.1.4', 'User list can be filtered by the group they belong to.', '2017-09-14 07:16:14'),
(103, 'RainLab.User', 'comment', '1.1.5', 'Adds a new permission to hide the User settings menu item.', '2017-09-14 07:16:14'),
(104, 'RainLab.User', 'script', '1.2.0', 'users_add_deleted_at.php', '2017-09-14 07:16:15'),
(105, 'RainLab.User', 'comment', '1.2.0', 'Users can now deactivate their own accounts.', '2017-09-14 07:16:15'),
(106, 'RainLab.User', 'comment', '1.2.1', 'New feature for checking if a user is recently active/online.', '2017-09-14 07:16:15'),
(107, 'RainLab.User', 'comment', '1.2.2', 'Add bulk action button to user list.', '2017-09-14 07:16:15'),
(108, 'RainLab.User', 'comment', '1.2.3', 'Included some descriptive paragraphs in the Reset Password component markup.', '2017-09-14 07:16:16'),
(109, 'RainLab.User', 'comment', '1.2.4', 'Added a checkbox for blocking all mail sent to the user.', '2017-09-14 07:16:16'),
(110, 'RainLab.User', 'script', '1.2.5', 'update_timestamp_nullable.php', '2017-09-14 07:16:16'),
(111, 'RainLab.User', 'comment', '1.2.5', 'Database maintenance. Updated all timestamp columns to be nullable.', '2017-09-14 07:16:16'),
(112, 'RainLab.User', 'script', '1.2.6', 'users_add_last_seen.php', '2017-09-14 07:16:17'),
(113, 'RainLab.User', 'comment', '1.2.6', 'Add a dedicated last seen column for users.', '2017-09-14 07:16:17'),
(114, 'RainLab.User', 'comment', '1.2.7', 'Minor fix to user timestamp attributes.', '2017-09-14 07:16:17'),
(115, 'RainLab.User', 'comment', '1.2.8', 'Add date range filter to users list. Introduced a logout event.', '2017-09-14 07:16:17'),
(116, 'RainLab.User', 'comment', '1.2.9', 'Add invitation mail for new accounts created in the back-end.', '2017-09-14 07:16:17'),
(117, 'RainLab.User', 'script', '1.3.0', 'users_add_guest_flag.php', '2017-09-14 07:16:18'),
(118, 'RainLab.User', 'script', '1.3.0', 'users_add_superuser_flag.php', '2017-09-14 07:16:19'),
(119, 'RainLab.User', 'comment', '1.3.0', 'Introduced guest user accounts.', '2017-09-14 07:16:19'),
(120, 'RainLab.User', 'comment', '1.3.1', 'User notification variables can now be extended.', '2017-09-14 07:16:19'),
(121, 'RainLab.User', 'comment', '1.3.2', 'Minor fix to the Auth::register method.', '2017-09-14 07:16:19'),
(122, 'RainLab.User', 'comment', '1.3.3', 'Allow prevention of concurrent user sessions via the user settings.', '2017-09-14 07:16:19'),
(123, 'RainLab.User', 'comment', '1.3.4', 'Added force secure protocol property to the account component.', '2017-09-14 07:16:19'),
(124, 'RainLab.Pages', 'comment', '1.0.1', 'Implemented the static pages management and the Static Page component.', '2017-09-14 07:16:19'),
(125, 'RainLab.Pages', 'comment', '1.0.2', 'Fixed the page preview URL.', '2017-09-14 07:16:19'),
(126, 'RainLab.Pages', 'comment', '1.0.3', 'Implemented menus.', '2017-09-14 07:16:19'),
(127, 'RainLab.Pages', 'comment', '1.0.4', 'Implemented the content block management and placeholder support.', '2017-09-14 07:16:20'),
(128, 'RainLab.Pages', 'comment', '1.0.5', 'Added support for the Sitemap plugin.', '2017-09-14 07:16:20'),
(129, 'RainLab.Pages', 'comment', '1.0.6', 'Minor updates to the internal API.', '2017-09-14 07:16:20'),
(130, 'RainLab.Pages', 'comment', '1.0.7', 'Added the Snippets feature.', '2017-09-14 07:16:20'),
(131, 'RainLab.Pages', 'comment', '1.0.8', 'Minor improvements to the code.', '2017-09-14 07:16:20'),
(132, 'RainLab.Pages', 'comment', '1.0.9', 'Fixes issue where Snippet tab is missing from the Partials form.', '2017-09-14 07:16:20'),
(133, 'RainLab.Pages', 'comment', '1.0.10', 'Add translations for various locales.', '2017-09-14 07:16:20'),
(134, 'RainLab.Pages', 'comment', '1.0.11', 'Fixes issue where placeholders tabs were missing from Page form.', '2017-09-14 07:16:20'),
(135, 'RainLab.Pages', 'comment', '1.0.12', 'Implement Media Manager support.', '2017-09-14 07:16:20'),
(136, 'RainLab.Pages', 'script', '1.1.0', 'snippets_rename_viewbag_properties.php', '2017-09-14 07:16:20'),
(137, 'RainLab.Pages', 'comment', '1.1.0', 'Adds meta title and description to pages. Adds |staticPage filter.', '2017-09-14 07:16:20'),
(138, 'RainLab.Pages', 'comment', '1.1.1', 'Add support for Syntax Fields.', '2017-09-14 07:16:21'),
(139, 'RainLab.Pages', 'comment', '1.1.2', 'Static Breadcrumbs component now respects the hide from navigation setting.', '2017-09-14 07:16:21'),
(140, 'RainLab.Pages', 'comment', '1.1.3', 'Minor back-end styling fix.', '2017-09-14 07:16:21'),
(141, 'RainLab.Pages', 'comment', '1.1.4', 'Minor fix to the StaticPage component API.', '2017-09-14 07:16:21'),
(142, 'RainLab.Pages', 'comment', '1.1.5', 'Fixes bug when using syntax fields.', '2017-09-14 07:16:21'),
(143, 'RainLab.Pages', 'comment', '1.1.6', 'Minor styling fix to the back-end UI.', '2017-09-14 07:16:21'),
(144, 'RainLab.Pages', 'comment', '1.1.7', 'Improved menu item form to include CSS class, open in a new window and hidden flag.', '2017-09-14 07:16:21'),
(145, 'RainLab.Pages', 'comment', '1.1.8', 'Improved the output of snippet partials when saved.', '2017-09-14 07:16:21'),
(146, 'RainLab.Pages', 'comment', '1.1.9', 'Minor update to snippet inspector internal API.', '2017-09-14 07:16:21'),
(147, 'RainLab.Pages', 'comment', '1.1.10', 'Fixes a bug where selecting a layout causes permanent unsaved changes.', '2017-09-14 07:16:21'),
(148, 'RainLab.Pages', 'comment', '1.1.11', 'Add support for repeater syntax field.', '2017-09-14 07:16:21'),
(149, 'RainLab.Pages', 'comment', '1.2.0', 'Added support for translations, UI updates.', '2017-09-14 07:16:22'),
(150, 'RainLab.Pages', 'comment', '1.2.1', 'Use nice titles when listing the content files.', '2017-09-14 07:16:22'),
(151, 'RainLab.Pages', 'comment', '1.2.2', 'Minor styling update.', '2017-09-14 07:16:22'),
(152, 'RainLab.Pages', 'comment', '1.2.3', 'Snippets can now be moved by dragging them.', '2017-09-14 07:16:22'),
(153, 'RainLab.Pages', 'comment', '1.2.4', 'Fixes a bug where the cursor is misplaced when editing text files.', '2017-09-14 07:16:22'),
(154, 'RainLab.Pages', 'comment', '1.2.5', 'Fixes a bug where the parent page is lost upon changing a page layout.', '2017-09-14 07:16:22'),
(155, 'RainLab.Pages', 'comment', '1.2.6', 'Shared view variables are now passed to static pages.', '2017-09-14 07:16:23'),
(156, 'RainLab.Pages', 'comment', '1.2.7', 'Fixes issue with duplicating properties when adding multiple snippets on the same page.', '2017-09-14 07:16:23'),
(157, 'RainLab.Pages', 'comment', '1.2.8', 'Fixes a bug where creating a content block without extension doesn\'t save the contents to file.', '2017-09-14 07:16:23'),
(158, 'RainLab.Pages', 'comment', '1.2.9', 'Add conditional support for translating page URLs.', '2017-09-14 07:16:23'),
(159, 'RainLab.Pages', 'comment', '1.2.10', 'Streamline generation of URLs to use the new Cms::url helper.', '2017-09-14 07:16:23'),
(160, 'RainLab.Pages', 'comment', '1.2.11', 'Implements repeater usage with translate plugin.', '2017-09-14 07:16:23'),
(161, 'RainLab.Pages', 'comment', '1.2.12', 'Fixes minor issue when using snippets and switching the application locale.', '2017-09-14 07:16:23'),
(162, 'RainLab.Pages', 'comment', '1.2.13', 'Fixes bug when AJAX is used on a page that does not yet exist.', '2017-09-14 07:16:23'),
(163, 'RainLab.Pages', 'comment', '1.2.14', 'Add theme logging support for changes made to menus.', '2017-09-14 07:16:23'),
(164, 'RainLab.Pages', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2017-09-14 07:16:23'),
(165, 'RainLab.Pages', 'comment', '1.2.16', 'Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).', '2017-09-14 07:16:24'),
(166, 'Akira.User', 'script', '1.0.0', 'user_add_fields.php', '2017-09-14 07:16:24'),
(167, 'Akira.User', 'comment', '1.0.0', 'initial version', '2017-09-14 07:16:24'),
(168, 'Akira.User', 'script', '1.0.1', 'user_add_fields.php', '2017-09-14 07:16:24'),
(169, 'Akira.User', 'comment', '1.0.1', 'fix users table', '2017-09-14 07:16:25');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'October.Demo', '1.0.1', '2017-09-14 07:15:31', 0, 0),
(2, 'RainLab.Builder', '1.0.21', '2017-09-14 07:15:34', 0, 0),
(3, 'RainLab.Blog', '1.2.16', '2017-09-14 07:15:41', 0, 0),
(4, 'RainLab.Location', '1.0.7', '2017-09-14 07:16:03', 0, 0),
(5, 'RainLab.User', '1.3.4', '2017-09-14 07:16:19', 0, 1),
(6, 'RainLab.Pages', '1.2.16', '2017-09-14 07:16:24', 0, 0),
(7, 'Akira.User', '1.0.1', '2017-09-14 07:16:25', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cast` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8_unicode_ci,
  `new_value` text COLLATE utf8_unicode_ci,
  `revisionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'backend_brand_settings', '{\"app_name\":\"ZU\",\"app_tagline\":\"\\u0412\\u043e\\u0437\\u0432\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u0435 \\u043a \\u0438\\u0441\\u0442\\u043e\\u043a\\u0430\\u043c\",\"primary_color\":\"#34495e\",\"secondary_color\":\"#e67e22\",\"accent_color\":\"#3498db\",\"menu_mode\":\"inline\",\"custom_css\":\"\"}'),
(2, 'user_settings', '{\"require_activation\":\"0\",\"activate_mode\":\"auto\",\"use_throttle\":\"1\",\"block_persistence\":\"0\",\"allow_registration\":\"1\",\"welcome_template\":\"rainlab.user::mail.welcome\",\"login_attribute\":\"email\"}'),
(3, 'system_mail_settings', '{\"send_mode\":\"log\",\"sender_name\":\"OctoberCMS\",\"sender_email\":\"noreply@domain.tld\",\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\",\"smtp_address\":\"smtp.mailgun.org\",\"smtp_port\":\"587\",\"smtp_user\":\"\",\"smtp_password\":\"\",\"smtp_authorization\":\"0\",\"smtp_encryption\":\"tls\",\"mailgun_domain\":\"\",\"mailgun_secret\":\"\",\"mandrill_secret\":\"\",\"ses_key\":\"\",\"ses_secret\":\"\",\"ses_region\":\"\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persist_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `date_of_bithday` date DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `activated_at`, `last_login`, `created_at`, `updated_at`, `username`, `surname`, `deleted_at`, `last_seen`, `is_guest`, `is_superuser`, `date_of_bithday`, `city`, `phone`, `school`, `lead`) VALUES
(1, 'Тестер', '9225913@gmail.com', '$2y$10$fz707oewXTXaIaED7lNXS.mSUdPrdYvc4rJ3.yinCom4tQRh0Dkjy', NULL, NULL, NULL, NULL, 1, '2017-09-14 07:33:11', '2017-09-19 12:36:17', '2017-09-14 07:32:58', '2017-09-19 12:36:20', '9225913@gmail.com', 'Просто тестер', NULL, '2017-09-19 12:36:17', 0, 0, NULL, '', NULL, '', ''),
(2, 'bdfy', 'admin@sdsa.com', '$2y$10$sconXkTk07ucHJf8m4v6S.djWailmTx7YaOvLMrStgu7tfODJ4spK', NULL, '$2y$10$MgEJf8qgQfPFFoulgOyDs.WX2DZBs58L0XAd3MnxL71D0I1f0NLSK', NULL, NULL, 1, '2017-09-14 07:35:26', '2017-09-14 07:35:26', '2017-09-14 07:35:26', '2017-09-14 07:35:26', 'admin@sdsa.com', NULL, NULL, '2017-09-14 07:35:26', 0, 0, NULL, NULL, NULL, NULL, NULL),
(3, 'ivan', 'administrator@SA.COM', '$2y$10$OhcJKvxwoXLOZG/bgoffy.CDr9VBMKEfqDsLKzyRQm9HN1XIBJZdy', NULL, '$2y$10$49SW65oleyKPYg6vHJ8n8eybt7xQElldY8EhGf83RQ6qlpmV0dKCq', NULL, NULL, 1, '2017-09-14 07:38:00', '2017-09-14 07:38:00', '2017-09-14 07:38:00', '2017-09-14 07:38:00', 'administrator@SA.COM', NULL, NULL, '2017-09-14 07:38:00', 0, 0, NULL, NULL, NULL, NULL, NULL),
(4, 'dsa', 'dsadmin@dsada.com', '$2y$10$FD5thlczdHK1GofBmaw/MOcR.tBwPXVrAPqY5/9A6ZEWtKYuNbgie', NULL, NULL, NULL, NULL, 1, '2017-09-14 08:12:21', NULL, '2017-09-14 08:12:20', '2017-09-14 08:12:21', 'dsadmin@dsada.com', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(5, 'sda', 'das@dasda.com', '$2y$10$aqUNkVbxohVsb/ym2NVfuuARoeCXdPvlJsjaiA9SHFiSQ1tlANThO', NULL, '$2y$10$QOu.kuLF4CtnqVFhICDjLOBd3Rqp6Fv0rnIpgM5UBAPTlIvlmQo4K', NULL, NULL, 1, '2017-09-14 08:15:28', '2017-09-14 08:15:28', '2017-09-14 08:15:28', '2017-09-14 08:15:28', 'das@dasda.com', NULL, NULL, '2017-09-14 08:15:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(6, 'dasd', 'fghjjkjhjh@jkj.com', '$2y$10$GFT1aHJZexBqjjczAusOK./kKCNKDEs9qhuiIcJ6BBUcfuC8.Ce.m', NULL, '$2y$10$ral/.gHYTxLbx7jzz.SvsOEzOXNuaC1SsNdFYLof2JAPLQowCpXuO', NULL, NULL, 1, '2017-09-14 08:18:08', '2017-09-14 08:18:08', '2017-09-14 08:18:08', '2017-09-14 08:18:08', 'fghjjkjhjh@jkj.com', NULL, NULL, '2017-09-14 08:18:08', 0, 0, NULL, NULL, NULL, NULL, NULL),
(7, 'adsdsd', 'admin@dasdsfdsda.com', '$2y$10$9Bg670gAI5VjT0W2XKFbGeEpD1/Hbe6cbD9ul0FtcGYhVl7z4gsiC', NULL, NULL, NULL, NULL, 1, '2017-09-14 08:18:54', NULL, '2017-09-14 08:18:54', '2017-09-14 08:18:54', 'admin@dasdsfdsda.com', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(8, 'test_students', 'admin@students.ri', '$2y$10$JZ.SOrHHflTGwmnbqchPlOfSR2bJTLLBIYhjRxQY03yGT3Z3uLtxa', NULL, '$2y$10$XqeisDbqfcyM/bAUNco60.P3X5PXnmwwhRvKsfbThJ9l2ot24P/iS', NULL, NULL, 1, '2017-09-14 09:19:09', '2017-09-14 09:19:09', '2017-09-14 09:19:09', '2017-09-14 09:19:09', 'admin@students.ri', NULL, NULL, '2017-09-14 09:19:09', 0, 0, NULL, NULL, NULL, NULL, NULL),
(9, 'test_shool', 'admin@shool.ri', '$2y$10$o9o2kXQFmR5rTlZBRXdI.Oo9E0TMoXcL3LynBsq/PKcjtVWlvpE7e', NULL, '$2y$10$R1xOc57mO6yes7/hRsCZCurwuObMjkO3evjCrbr0VbMDGvvxfHWpi', NULL, NULL, 1, '2017-09-14 09:19:41', '2017-09-14 09:19:41', '2017-09-14 09:19:40', '2017-09-14 09:19:41', 'admin@shool.ri', NULL, NULL, '2017-09-14 09:19:41', 0, 0, NULL, NULL, NULL, NULL, NULL),
(10, 'new_Shool', 'shcool_sh@kk.ru', '$2y$10$2Ht9DnLs6Xd1cqrbACE73.KXT4qp4/kFJxgZLx7rL1Fbo/3JzB27e', NULL, '$2y$10$UKYH901mUhpDqk9kyNghte2Clws2r2UmZn35.GJs8mkcbZgvxmrZq', NULL, NULL, 1, '2017-09-14 09:20:11', '2017-09-14 09:20:11', '2017-09-14 09:20:11', '2017-09-14 09:20:11', 'shcool_sh@kk.ru', NULL, NULL, '2017-09-14 09:20:11', 0, 0, NULL, NULL, NULL, NULL, NULL),
(11, 'вфы', 'pupil@pupi.pi', '$2y$10$1o.DCgNnJY6JHSXH9avPTeAs5GniPTk5Q5lp/WLMd3mFFIENXiiaS', NULL, '$2y$10$aaGpGT75JsHHJrAO9eJLkuVAoLo6P.6zKeWnjza/0P0CeQfWzeoV.', NULL, NULL, 1, '2017-09-14 09:45:22', '2017-09-14 09:45:23', '2017-09-14 09:45:22', '2017-09-14 09:45:23', 'pupil@pupi.pi', NULL, NULL, '2017-09-14 09:45:23', 0, 0, NULL, NULL, NULL, NULL, NULL),
(12, 'self', 'anna@anna.com', '$2y$10$gVgK6Jjf32Kh2YkL0TIKD./3LhtVJ7fTtVTp5JmaeJcTf.9QTFNu6', NULL, '$2y$10$2JA8m5eqtg2/poXV7kR6GO0PDUkzV5yJVNcyxU5zQHf9YCcTA369.', NULL, NULL, 1, '2017-09-14 09:45:47', '2017-09-14 09:45:47', '2017-09-14 09:45:47', '2017-09-14 09:45:47', 'anna@anna.com', NULL, NULL, '2017-09-14 09:45:47', 0, 0, NULL, NULL, NULL, NULL, NULL),
(13, 'test', 'tester_shola@sddas.co', '$2y$10$mu0u.m82WjdG3eBCF1pcHOSugljfjoJ.rmK0ynRwYRgWNURl.0qOS', NULL, NULL, NULL, NULL, 1, '2017-09-14 09:46:21', '2017-09-14 09:46:21', '2017-09-14 09:46:21', '2017-09-15 09:57:59', 'tester_shola@sddas.co', NULL, NULL, '2017-09-15 09:57:58', 0, 0, NULL, NULL, NULL, NULL, NULL),
(14, 'testSud', 'stu@stus.stud', '$2y$10$5hqGiFWODNWBCdaZNWj/9ex/LBtfFhtwXc/xW1qwEi0qP5I1Ew6mG', NULL, NULL, NULL, NULL, 1, '2017-09-19 04:54:43', NULL, '2017-09-19 04:54:43', '2017-09-19 04:54:43', 'stu@stus.stud', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(15, 'studddddddddd', 'studddddddddd@studddddddddd.studddddddddd', '$2y$10$1CNZGBOFCmtaODtVT97dyO8iyn4vM2PEtwNZYcXpnCcrwQh.IOm.K', NULL, NULL, NULL, NULL, 1, '2017-09-19 04:57:01', NULL, '2017-09-19 04:57:01', '2017-09-19 04:57:01', 'studddddddddd@studddddddddd.studddddddddd', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(16, 'shcooool', 'admin@example.org.com', '$2y$10$k15KewON0Afv/eIs1Ds6CuEOiGE0RSpALmLi2fpWBlu7ODqaP7v2C', NULL, NULL, NULL, NULL, 1, '2017-09-19 04:57:35', NULL, '2017-09-19 04:57:35', '2017-09-19 04:57:35', 'admin@example.org.com', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(17, 'shcooool', 'shcooool@shcooool.shcooool', '$2y$10$BlWFeSXHE0imxpYqKykUoO8pVj3myWAgVWbBDLzNqi7leCkW7qylm', NULL, NULL, NULL, NULL, 1, '2017-09-19 04:57:43', NULL, '2017-09-19 04:57:43', '2017-09-19 04:57:43', 'shcooool@shcooool.shcooool', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(18, 'students', 'studentsstudentsstudents@students.students', '$2y$10$AVsSi8GmzVONrRM6XnA.ROomfbzmfI3iS.RmEHIp8PQfIHPHDEYFm', NULL, NULL, NULL, NULL, 1, '2017-09-19 05:00:47', NULL, '2017-09-19 05:00:47', '2017-09-19 05:00:47', 'studentsstudentsstudents@students.students', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(19, 'newStus', 'stud@stud.srude', '$2y$10$r4GYOVMxd6McM2WhEIsWx.Hq1zlMuEpWL1WtmtQDyZeHSuLJ6YUj2', NULL, NULL, NULL, NULL, 1, '2017-09-19 05:04:45', NULL, '2017-09-19 05:04:45', '2017-09-19 05:04:45', 'stud@stud.srude', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(20, 'цйуцу', 'chu@chu.com', '$2y$10$CqKcc7LmbVLLPOuyrB4KyezGqpbKWN9u9OV1QOtfAMJu3j2nfecqK', NULL, NULL, NULL, NULL, 1, '2017-09-19 05:16:37', NULL, '2017-09-19 05:16:37', '2017-09-19 05:16:37', 'chu@chu.com', NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(21, 'studi', 'study@study.study', '$2y$10$c.WPntovhJ.IRUEvGmt92eSuMymwVNm6GN/1Upi.GZTgSSWT4wubS', NULL, NULL, NULL, NULL, 1, '2017-09-19 05:19:28', '2017-09-19 05:19:28', '2017-09-19 05:19:28', '2017-09-19 06:01:08', 'study@study.study', NULL, NULL, '2017-09-19 06:00:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(22, 'arh_hot_list', 'bnmjjlll@list.ru', '$2y$10$VlsaV1k7pGPFUUYmK1Ol5e.a8DHNk5JHH8BLWHhOxouJ9EfhedvCi', NULL, NULL, NULL, NULL, 1, '2017-09-20 11:44:23', '2017-09-20 11:44:24', '2017-09-20 11:44:23', '2017-09-20 11:46:13', 'bnmjjlll@list.ru', NULL, NULL, '2017-09-20 11:44:24', 0, 0, NULL, NULL, NULL, NULL, NULL),
(23, 'Педагоги АРХпроекта', 'ghjkhjkhjj@HJHJ.COM', '$2y$10$sRX9QeBu3Ue/8O0bCJybPeP5Uw8q7ZqABwJ1wKWAbuViM8XcZEiOm', NULL, NULL, NULL, NULL, 1, '2017-09-20 11:46:50', '2017-09-20 11:46:50', '2017-09-20 11:46:50', '2017-09-20 11:48:34', 'ghjkhjkhjj@HJHJ.COM', NULL, NULL, '2017-09-20 11:46:50', 0, 0, NULL, NULL, NULL, NULL, NULL),
(24, 'adssd', 'asfsdf@fdsfd.com', '$2y$10$dwjNL5h75JK/rJhDCLCbFuL/jiSLWEtOp2kpWieM16XMePjv8oDx6', NULL, NULL, NULL, NULL, 1, '2017-09-20 11:48:53', '2017-09-20 11:48:54', '2017-09-20 11:48:53', '2017-09-20 12:02:18', 'asfsdf@fdsfd.com', NULL, NULL, '2017-09-20 12:02:14', 0, 0, NULL, NULL, NULL, NULL, NULL),
(25, 'asddasd', 'uhjkkkl@jjkj.com', '$2y$10$cOoAg5xtZTVmaaYCjZNivulPRhZe8eFzlpy7Rd8SnS/fX5zQ1ETO.', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:04:39', '2017-09-20 12:04:39', '2017-09-20 12:04:38', '2017-09-20 12:05:07', 'uhjkkkl@jjkj.com', NULL, NULL, '2017-09-20 12:04:39', 0, 0, NULL, NULL, NULL, NULL, NULL),
(26, 'Педагоги АРХпроекта', 'dgsgsdgsd@hjhjjjjk.com', '$2y$10$Lb.WQByUUAkQHRqsQ98AJOhxUIPmVXjrqEqDuGA3AbqTYfkMgzcqK', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:17:56', '2017-09-20 12:17:56', '2017-09-20 12:17:56', '2017-09-20 12:18:51', 'dgsgsdgsd@hjhjjjjk.com', NULL, NULL, '2017-09-20 12:17:56', 0, 0, NULL, NULL, NULL, NULL, NULL),
(27, 'adsd', '2313123123@adsdf.com', '$2y$10$N82ZHiwlW7TVrn/jFGKZqu1LIidPbP9q5Ln7fvvQF.Gfe8pgF2oV.', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:21:28', '2017-09-20 12:21:28', '2017-09-20 12:21:28', '2017-09-20 12:21:53', '2313123123@adsdf.com', NULL, NULL, '2017-09-20 12:21:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(28, 'dsadsd', 'dasndkkmllklkl@klkl.com', '$2y$10$mdV1omdksJWlUeyBbHwuOOvdC59C4ZAa9dbLMWqkRfBgQKNeoeDUq', NULL, '$2y$10$afixsrk0sjt4gO3q8lKm5.5KA6gmT.GmZ25Ea8BsOv2Qf.0ll12.q', NULL, NULL, 1, '2017-09-20 12:22:11', '2017-09-20 12:22:11', '2017-09-20 12:22:11', '2017-09-20 12:22:11', 'dasndkkmllklkl@klkl.com', NULL, NULL, '2017-09-20 12:22:11', 0, 0, NULL, NULL, NULL, NULL, NULL),
(29, 'asdsad', 'sfdf@fdsaf.com', '$2y$10$rAkPXqS9Y8Hayg/D.4TtiORIKAef0kVyOgwaeBXifFX0qHUFgXSRK', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:22:49', '2017-09-20 12:22:50', '2017-09-20 12:22:49', '2017-09-20 12:22:54', 'sfdf@fdsaf.com', NULL, NULL, '2017-09-20 12:22:50', 0, 0, NULL, NULL, NULL, NULL, NULL),
(30, 'dasdd', 'sadfdsafd@jhkjkj.com', '$2y$10$n/.xCLG2yTsNGxjB9HXSbujGG/gZ2zlbp00P0m4Yr3Bbg5EiYmpDq', NULL, '$2y$10$EE77GJhX5g5PTo7PFmDeveOy.PogwJ.5wjZRP.OFdBCHtKzjE5XyK', NULL, NULL, 1, '2017-09-20 12:25:02', '2017-09-20 12:26:29', '2017-09-20 12:25:02', '2017-09-20 12:26:29', 'sadfdsafd@jhkjkj.com', NULL, NULL, '2017-09-20 12:26:29', 0, 0, NULL, NULL, NULL, NULL, NULL),
(31, 'Педагоги АРХпроекта', 'dasdA@fsafas.com', '$2y$10$DwoHmklpKY4xf.YY5tLRLeX4kc4hDIwWeG.Kr00FEqD0cnRPZniYy', NULL, '$2y$10$O9Uo67RWTn2FX8DWDVmFWO7TVPyEMfV.IeXMGSip8N//wxlZreOEG', NULL, NULL, 1, '2017-09-20 12:28:10', '2017-09-20 12:28:10', '2017-09-20 12:28:10', '2017-09-20 12:28:10', 'dasdA@fsafas.com', NULL, NULL, '2017-09-20 12:28:10', 0, 0, NULL, NULL, NULL, NULL, NULL),
(32, 'sadasd', 'sadfdsafd@jhkjkj.comdasda', '$2y$10$RAFMdQfcJJUgOk6XQJWTXeVzbkDxUvJnsV.4BHowtAF0a5PMCj9cS', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:28:59', '2017-09-20 12:28:59', '2017-09-20 12:28:59', '2017-09-20 12:30:32', 'sadfdsafd@jhkjkj.comdasda', NULL, NULL, '2017-09-20 12:28:59', 0, 0, NULL, NULL, NULL, NULL, NULL),
(33, 'Педагоги АРХпроекта', 'sadfdsafd@jhkjkj.comsadsd', '$2y$10$IqxiqtdTeJgsVRmt6M0He.rcxIIC/cvMylmav6E65jzaTDHDsRc/.', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:30:43', '2017-09-20 12:30:43', '2017-09-20 12:30:43', '2017-09-20 12:32:18', 'sadfdsafd@jhkjkj.comsadsd', NULL, NULL, '2017-09-20 12:30:43', 0, 0, NULL, NULL, NULL, NULL, NULL),
(34, 'asdasasd', 'sadfdsafd@jhkjkj.comsadsddasdasdasdsdas', '$2y$10$mhzSI/.dclkmpEuHJdhmpe7nRc5FG1QAb/f55WtYcOvJMiWAF4MXW', NULL, '$2y$10$ncmBy.0a3fYwGkBlG4uz3uqr4m4Uq/Q15UxkB1U1HHeQrN0Cv/W8K', NULL, NULL, 1, '2017-09-20 12:32:33', '2017-09-20 12:32:34', '2017-09-20 12:32:33', '2017-09-20 12:32:34', 'sadfdsafd@jhkjkj.comsadsddasdasdasdsdas', NULL, NULL, '2017-09-20 12:32:34', 0, 0, NULL, NULL, NULL, NULL, NULL),
(35, 'Педагоги АРХпроекта', 'sadfdsafd@jhkjkj.comsadsdsdasaa', '$2y$10$ozlGYkhqgw2C5SsOTkflDePPewSnDDaqwf4JJ3VNmAEXGa9UHtdP2', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:35:06', '2017-09-20 12:35:06', '2017-09-20 12:35:05', '2017-09-20 12:36:18', 'sadfdsafd@jhkjkj.comsadsdsdasaa', NULL, NULL, '2017-09-20 12:35:06', 0, 0, NULL, NULL, NULL, NULL, NULL),
(36, 'arh_hot_list', 'sadfdsafd@jhkjkj.comsadsddasdasdsd', '$2y$10$DAjvq5HQjM04wcG9e/eus.Mqgz2P97PuUrbuPaobClP5871W//oK.', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:36:47', '2017-09-20 12:36:47', '2017-09-20 12:36:47', '2017-09-20 12:38:06', 'sadfdsafd@jhkjkj.comsadsddasdasdsd', NULL, NULL, '2017-09-20 12:36:47', 0, 0, NULL, NULL, NULL, NULL, NULL),
(37, 'adasd', 'sadfdsafd@jhkjkj.comsadsdDAWD', '$2y$10$FMJYqChKEFBbr9bXj0GkXeRx6pZdhahJO9NxDFrazRl7HjiH9UVfG', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:38:38', '2017-09-20 12:38:39', '2017-09-20 12:38:38', '2017-09-20 12:40:02', 'sadfdsafd@jhkjkj.comsadsdDAWD', NULL, NULL, '2017-09-20 12:38:39', 0, 0, NULL, NULL, NULL, NULL, NULL),
(38, 'asdsdas', 'sfzdzsd@das.com', '$2y$10$8uzxm23YufR.NgN.TqNBuu4tUbenrYLrplfhG1pxbY5t3AN5ZMCXO', NULL, NULL, NULL, NULL, 1, '2017-09-20 12:40:27', '2017-09-20 12:40:28', '2017-09-20 12:40:27', '2017-09-20 12:41:04', 'sfzdzsd@das.com', NULL, NULL, '2017-09-20 12:40:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(39, 'Иван', 'ivan@ivan.com', '$2y$10$4S57S7jAVKCYGrY4EuZH2.dQ4fIWlthylYzk9ApE/saljmZTNjHNu', NULL, NULL, NULL, NULL, 1, '2017-09-23 05:12:52', '2017-09-23 05:13:01', '2017-09-23 05:12:52', '2017-09-23 05:52:23', 'ivan@ivan.com', NULL, NULL, '2017-09-23 05:52:18', 0, 0, NULL, NULL, NULL, NULL, NULL),
(40, 'ref', 'admin@jlklkkl.com', '$2y$10$rW9TSVpNjicazulq6bpQyO9zpTIk8LC5Ynf07vPIAvAlYTV74etSK', NULL, NULL, NULL, NULL, 1, '2017-09-23 05:53:01', '2017-09-23 05:53:02', '2017-09-23 05:53:01', '2017-09-23 05:53:57', 'admin@jlklkkl.com', NULL, NULL, '2017-09-23 05:53:02', 0, 0, NULL, NULL, NULL, NULL, NULL),
(41, 'bjhhh', 'e24@ewfh.com', '$2y$10$2Zyz220giqCjdyPFMViLBOZ887zrKkBeYb5xEvoTMDmuSlSWzWkJG', NULL, NULL, NULL, NULL, 1, '2017-09-23 05:54:22', '2017-09-23 05:54:22', '2017-09-23 05:54:21', '2017-09-23 05:59:22', 'e24@ewfh.com', NULL, NULL, '2017-09-23 05:54:22', 0, 0, NULL, NULL, NULL, NULL, NULL),
(42, 'dsad', 'e24c2a16@rett.com', '$2y$10$vqbY1Ud8ndc2FKGp6jszAOCd6brYGSGowq6K04TMhu54ixuNuN6fm', NULL, NULL, NULL, NULL, 1, '2017-09-23 05:59:43', '2017-09-23 05:59:44', '2017-09-23 05:59:43', '2017-09-23 06:26:54', 'e24c2a16@rett.com', NULL, NULL, '2017-09-23 06:23:13', 0, 0, NULL, NULL, NULL, NULL, NULL),
(43, 'dadw', 'admin@wweaeawe.lo', '$2y$10$78n/lx68oP2UlFEQtRwIqe1PNMxHLmTsbZL7Yf8ENxWude8GtVnbK', NULL, NULL, NULL, NULL, 1, '2017-09-23 06:27:06', '2017-09-23 06:27:12', '2017-09-23 06:27:05', '2017-09-23 06:34:18', 'admin@wweaeawe.lo', NULL, NULL, '2017-09-23 06:34:08', 0, 0, NULL, NULL, NULL, NULL, NULL),
(44, 'ererwe', 'adminRWRWEer@FSD.VOM', '$2y$10$JU5XV.bWxF5dt31KgAZ8ROWRoByDFCvk2yLyNdOEhFXkVS75uH0oi', NULL, NULL, NULL, NULL, 1, '2017-09-23 06:44:10', '2017-09-23 06:44:15', '2017-09-23 06:44:10', '2017-09-23 06:44:19', 'adminRWRWEer@FSD.VOM', NULL, NULL, '2017-09-23 06:44:15', 0, 0, NULL, NULL, NULL, NULL, NULL),
(45, 'sdd', 'admin@dhhhhfdf.ooo', '$2y$10$c3PXft9EbbeNHr0nvKFlRuTYgOb515S7X4hGu.Enj0xXcJgnzdAw6', NULL, NULL, NULL, NULL, 1, '2017-09-23 06:45:19', '2017-09-23 06:45:20', '2017-09-23 06:45:19', '2017-09-23 06:45:34', 'admin@dhhhhfdf.ooo', NULL, NULL, '2017-09-23 06:45:20', 0, 0, NULL, NULL, NULL, NULL, NULL),
(46, 'sdfdfsd', 'admin@sseresrwer.ol', '$2y$10$YRPmd2lQ6lyUvcjIC6.u9e37rTyz8uwfGEFSxCNRTgg5Rj9J9lCGO', NULL, NULL, NULL, NULL, 1, '2017-09-23 06:47:28', '2017-09-23 06:47:28', '2017-09-23 06:47:27', '2017-09-23 06:47:36', 'admin@sseresrwer.ol', NULL, NULL, '2017-09-23 06:47:28', 0, 0, NULL, NULL, NULL, NULL, NULL),
(47, 'grgerg', 'admin22@HKJK.COM', '$2y$10$KXi9235BYuuYoofFSPrL0OypmsURT2cCjflTtNEdEGNQeGpjHwmrW', NULL, NULL, NULL, NULL, 1, '2017-09-23 06:49:50', '2017-09-23 06:49:50', '2017-09-23 06:49:49', '2017-09-23 06:49:57', 'admin22@HKJK.COM', NULL, NULL, '2017-09-23 06:49:50', 0, 0, NULL, NULL, NULL, NULL, NULL),
(48, 'sdfsdfsd', 'admin@dsfsdfs.tu', '$2y$10$dMyZv/K.Kwg3HzG1x7ee3OOasa2LpXFIf8g7eKitJx.sItbGMzX8i', NULL, NULL, NULL, NULL, 1, '2017-09-23 06:53:42', '2017-09-23 06:53:42', '2017-09-23 06:53:42', '2017-09-23 06:56:24', 'admin@dsfsdfs.tu', NULL, NULL, '2017-09-23 06:53:42', 0, 0, NULL, NULL, NULL, NULL, NULL),
(49, 'DSADDS', 'admDADSin@DSASDAS.RO', '$2y$10$JtwSBWa23BOUAuO3TCaf3eRAREdGxooetCIcqZn7yv9NMTKn0GGGa', NULL, NULL, NULL, NULL, 1, '2017-09-23 06:57:10', '2017-09-23 06:57:10', '2017-09-23 06:57:09', '2017-09-23 12:31:22', 'admDADSin@DSASDAS.RO', NULL, NULL, '2017-09-23 12:30:11', 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users_groups`
--

INSERT INTO `users_groups` (`user_id`, `user_group_id`) VALUES
(1, 3),
(7, 3),
(8, 3),
(13, 4),
(21, 3),
(22, 4),
(23, 3),
(24, 3),
(25, 4),
(29, 4),
(31, 3),
(32, 3),
(33, 3),
(35, 3),
(36, 3),
(37, 4),
(38, 3),
(39, 4),
(40, 4),
(42, 4),
(43, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user_groups`
--

INSERT INTO `user_groups` (`id`, `name`, `code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Guest', 'guest', 'Default group for guest users.', '2017-09-14 07:16:13', '2017-09-14 07:16:13'),
(2, 'Registered', 'registered', 'Default group for registered users.', '2017-09-14 07:16:13', '2017-09-14 07:16:13'),
(3, 'Студенты', 'students', 'Группа студентов', '2017-09-14 07:26:08', '2017-09-14 07:26:08'),
(4, 'Школьники', 'school', 'группа школьников', '2017-09-14 07:26:30', '2017-09-14 07:26:30');

-- --------------------------------------------------------

--
-- Структура таблицы `user_throttle`
--

CREATE TABLE `user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user_throttle`
--

INSERT INTO `user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 2, NULL, 0, NULL, 0, NULL, 0, NULL),
(2, 3, NULL, 0, NULL, 0, NULL, 0, NULL),
(3, 5, NULL, 0, NULL, 0, NULL, 0, NULL),
(4, 6, NULL, 0, NULL, 0, NULL, 0, NULL),
(5, 8, NULL, 0, NULL, 0, NULL, 0, NULL),
(6, 9, NULL, 0, NULL, 0, NULL, 0, NULL),
(7, 10, NULL, 0, NULL, 0, NULL, 0, NULL),
(8, 11, NULL, 0, NULL, 0, NULL, 0, NULL),
(9, 12, NULL, 0, NULL, 0, NULL, 0, NULL),
(10, 13, NULL, 0, NULL, 0, NULL, 0, NULL),
(11, 21, NULL, 0, NULL, 0, NULL, 0, NULL),
(12, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL),
(13, 22, NULL, 0, NULL, 0, NULL, 0, NULL),
(14, 23, NULL, 0, NULL, 0, NULL, 0, NULL),
(15, 24, NULL, 0, NULL, 0, NULL, 0, NULL),
(16, 25, NULL, 0, NULL, 0, NULL, 0, NULL),
(17, 26, NULL, 0, NULL, 0, NULL, 0, NULL),
(18, 27, NULL, 0, NULL, 0, NULL, 0, NULL),
(19, 28, NULL, 0, NULL, 0, NULL, 0, NULL),
(20, 29, NULL, 0, NULL, 0, NULL, 0, NULL),
(21, 30, NULL, 0, NULL, 0, NULL, 0, NULL),
(22, 31, NULL, 0, NULL, 0, NULL, 0, NULL),
(23, 32, NULL, 0, NULL, 0, NULL, 0, NULL),
(24, 33, NULL, 0, NULL, 0, NULL, 0, NULL),
(25, 34, NULL, 0, NULL, 0, NULL, 0, NULL),
(26, 35, NULL, 0, NULL, 0, NULL, 0, NULL),
(27, 36, NULL, 0, NULL, 0, NULL, 0, NULL),
(28, 37, NULL, 0, NULL, 0, NULL, 0, NULL),
(29, 38, NULL, 0, NULL, 0, NULL, 0, NULL),
(30, 39, NULL, 0, NULL, 0, NULL, 0, NULL),
(31, 40, NULL, 0, NULL, 0, NULL, 0, NULL),
(32, 41, NULL, 0, NULL, 0, NULL, 0, NULL),
(33, 42, NULL, 0, NULL, 0, NULL, 0, NULL),
(34, 43, NULL, 0, NULL, 0, NULL, 0, NULL),
(35, 44, NULL, 0, NULL, 0, NULL, 0, NULL),
(36, 45, NULL, 0, NULL, 0, NULL, 0, NULL),
(37, 46, NULL, 0, NULL, 0, NULL, 0, NULL),
(38, 47, NULL, 0, NULL, 0, NULL, 0, NULL),
(39, 48, NULL, 0, NULL, 0, NULL, 0, NULL),
(40, 49, NULL, 0, NULL, 0, NULL, 0, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`),
  ADD KEY `admin_role_index` (`role_id`);

--
-- Индексы таблицы `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Индексы таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Индексы таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Индексы таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_unique` (`name`),
  ADD KEY `role_code_index` (`code`);

--
-- Индексы таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Индексы таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Индексы таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Индексы таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`),
  ADD KEY `deferred_bindings_session_key_index` (`session_key`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Индексы таблицы `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_categories_slug_index` (`slug`),
  ADD KEY `rainlab_blog_categories_parent_id_index` (`parent_id`);

--
-- Индексы таблицы `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  ADD KEY `rainlab_blog_posts_slug_index` (`slug`);

--
-- Индексы таблицы `rainlab_blog_posts_categories`
--
ALTER TABLE `rainlab_blog_posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`);

--
-- Индексы таблицы `rainlab_location_countries`
--
ALTER TABLE `rainlab_location_countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_location_countries_name_index` (`name`);

--
-- Индексы таблицы `rainlab_location_states`
--
ALTER TABLE `rainlab_location_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_location_states_country_id_index` (`country_id`),
  ADD KEY `rainlab_location_states_name_index` (`name`);

--
-- Индексы таблицы `rainlab_user_mail_blockers`
--
ALTER TABLE `rainlab_user_mail_blockers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_user_mail_blockers_email_index` (`email`),
  ADD KEY `rainlab_user_mail_blockers_template_index` (`template`),
  ADD KEY `rainlab_user_mail_blockers_user_id_index` (`user_id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Индексы таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Индексы таблицы `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Индексы таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Индексы таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Индексы таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Индексы таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Индексы таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Индексы таблицы `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_login_unique` (`username`),
  ADD KEY `users_activation_code_index` (`activation_code`),
  ADD KEY `users_reset_password_code_index` (`reset_password_code`),
  ADD KEY `users_login_index` (`username`);

--
-- Индексы таблицы `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Индексы таблицы `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_groups_code_index` (`code`);

--
-- Индексы таблицы `user_throttle`
--
ALTER TABLE `user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_throttle_user_id_index` (`user_id`),
  ADD KEY `user_throttle_ip_address_index` (`ip_address`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `rainlab_location_countries`
--
ALTER TABLE `rainlab_location_countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;
--
-- AUTO_INCREMENT для таблицы `rainlab_location_states`
--
ALTER TABLE `rainlab_location_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=428;
--
-- AUTO_INCREMENT для таблицы `rainlab_user_mail_blockers`
--
ALTER TABLE `rainlab_user_mail_blockers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT для таблицы `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT для таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT для таблицы `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `user_throttle`
--
ALTER TABLE `user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
