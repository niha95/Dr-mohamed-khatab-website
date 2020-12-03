-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2018 at 04:43 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mohamed_vadecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `description_en` text COLLATE utf8_unicode_ci NOT NULL,
  `description_ar` text COLLATE utf8_unicode_ci NOT NULL,
  `description_pt` text COLLATE utf8_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `user_id`, `description_en`, `description_ar`, `description_pt`, `reference`, `created_at`, `updated_at`) VALUES
(1, 7, 'User "admin@vadecom.net" has created "Slide".', 'activities.created_entity', 'activities.created_entity', '/vc-admin/en/slides/1/edit', '2018-03-19 21:25:14', '2018-03-19 21:25:14'),
(2, 7, 'User "admin@vadecom.net" has created "Slide".', 'activities.created_entity', 'activities.created_entity', '/vc-admin/en/slides/2/edit', '2018-03-19 21:25:30', '2018-03-19 21:25:30'),
(3, 7, 'User "admin@vadecom.net" has deleted "Menu".', 'activities.deleted_entity', 'activities.deleted_entity', '', '2018-03-21 22:47:14', '2018-03-21 22:47:14'),
(4, 7, '', 'User "admin@vadecom.net" has created "الشريحة".', '', '/vc-admin/en/slides/4/edit', '2018-07-30 09:03:44', '2018-07-30 09:03:44'),
(5, 7, '', 'User "admin@vadecom.net" has edited "الشريحة".', '', '/vc-admin/en/slides/4/edit', '2018-07-30 10:07:57', '2018-07-30 10:07:57'),
(6, 7, '', 'User "admin@vadecom.net" has deleted "القائمة".', '', '', '2018-07-30 11:09:38', '2018-07-30 11:09:38'),
(7, 7, '', 'User "admin@vadecom.net" has deleted "القائمة".', '', '', '2018-07-30 11:09:43', '2018-07-30 11:09:43'),
(8, 7, '', 'User "admin@vadecom.net" has deleted "القائمة".', '', '', '2018-07-30 11:09:46', '2018-07-30 11:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(10) UNSIGNED NOT NULL,
  `album_category_id` int(11) DEFAULT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_es` text COLLATE utf8_unicode_ci NOT NULL,
  `name_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description_en` text COLLATE utf8_unicode_ci NOT NULL,
  `description_es` text COLLATE utf8_unicode_ci NOT NULL,
  `description_pt` text COLLATE utf8_unicode_ci NOT NULL,
  `status_en` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_es` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_pt` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `albums_categories`
--

CREATE TABLE `albums_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_es` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `newsletter` tinyint(4) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_es` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt_es` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_en` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_es` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_pt` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `original_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumb_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `caption_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `caption_es` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `caption_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `album_id`, `original_filename`, `image_filename`, `thumb_filename`, `caption_en`, `caption_es`, `caption_pt`, `created_at`, `updated_at`) VALUES
(1, NULL, 'slide1.jpg', '617f9c9a6ade16820159273d1ec46fc1a83e3df9.jpg', 'thumb_617f9c9a6ade16820159273d1ec46fc1a83e3df9.jpg', '', '', '', '2018-03-19 21:25:14', '2018-03-19 21:25:14'),
(2, NULL, 'slide2.jpg', '32a3871e64e20ae77c40cba06fea54f6539ca8b7.jpg', 'thumb_32a3871e64e20ae77c40cba06fea54f6539ca8b7.jpg', '', '', '', '2018-03-19 21:25:30', '2018-03-19 21:25:30'),
(3, NULL, 'package1.jpg', '3777d780e7a38bd88309f3b07a8feadf0283e32f.jpg', 'thumb_3777d780e7a38bd88309f3b07a8feadf0283e32f.jpg', '', '', '', '2018-03-21 21:31:07', '2018-03-21 21:31:07'),
(4, NULL, 'slide1.jpg', 'eb51814433aef8799a9395cb12185b60e3eed3b2.jpg', 'thumb_eb51814433aef8799a9395cb12185b60e3eed3b2.jpg', '', '', '', '2018-07-30 08:57:48', '2018-07-30 08:57:48'),
(5, NULL, 'slide1.jpg', '237799773c9c9d343fe13d765b86fcd8dad73460.jpg', 'thumb_237799773c9c9d343fe13d765b86fcd8dad73460.jpg', '', '', '', '2018-07-30 09:03:44', '2018-07-30 09:03:44'),
(6, NULL, 'service1.jpg', 'a1334c7c6a9eae351bc99de7760f833fc8aac4c1.jpg', 'thumb_a1334c7c6a9eae351bc99de7760f833fc8aac4c1.jpg', '', '', '', '2018-07-30 09:19:36', '2018-07-30 09:19:36'),
(7, NULL, 'service2.jpg', '8e7f2e6dc700a1af9324eeb9e1ccfd0387e28526.jpg', 'thumb_8e7f2e6dc700a1af9324eeb9e1ccfd0387e28526.jpg', '', '', '', '2018-07-30 09:25:27', '2018-07-30 09:25:27'),
(8, NULL, 'service3.jpg', '869834d7a1a227f3280f34e1cfc8c21c431de5b0.jpg', 'thumb_869834d7a1a227f3280f34e1cfc8c21c431de5b0.jpg', '', '', '', '2018-07-30 09:26:41', '2018-07-30 09:26:41'),
(9, NULL, 'service4.jpg', '6fb7da01822329237b64887094cb103331fbe913.jpg', 'thumb_6fb7da01822329237b64887094cb103331fbe913.jpg', '', '', '', '2018-07-30 09:27:12', '2018-07-30 09:27:12'),
(10, NULL, 'info-icon3.jpg', '52c6d4b116b986a7f02636ace10fa7813ed39fd2.jpg', 'thumb_52c6d4b116b986a7f02636ace10fa7813ed39fd2.jpg', '', '', '', '2018-07-30 09:31:05', '2018-07-30 09:31:05'),
(11, NULL, 'info-icon3.jpg', '4a522ed459d39db87a54136ec62c7211137275e7.jpg', 'thumb_4a522ed459d39db87a54136ec62c7211137275e7.jpg', '', '', '', '2018-07-30 09:32:09', '2018-07-30 09:32:09'),
(12, NULL, 'info-icon3.jpg', 'a6701e356ac83af928a73e758285a84632a59ff1.jpg', 'thumb_a6701e356ac83af928a73e758285a84632a59ff1.jpg', '', '', '', '2018-07-30 09:32:58', '2018-07-30 09:32:58'),
(13, NULL, 'info-icon2.jpg', 'a203402fd27655614d3ccbacc76fe0896e2e5cfe.jpg', 'thumb_a203402fd27655614d3ccbacc76fe0896e2e5cfe.jpg', '', '', '', '2018-07-30 09:37:51', '2018-07-30 09:37:51'),
(14, NULL, 'info-icon1.jpg', 'd4d64d1c44260e85c745d6da2962712ca733748a.jpg', 'thumb_d4d64d1c44260e85c745d6da2962712ca733748a.jpg', '', '', '', '2018-07-30 09:38:46', '2018-07-30 09:38:46'),
(15, NULL, 'info-icon6.jpg', 'c0a26095213bcc70b5f11106917135fa31e3611e.jpg', 'thumb_c0a26095213bcc70b5f11106917135fa31e3611e.jpg', '', '', '', '2018-07-30 09:39:31', '2018-07-30 09:39:31'),
(16, NULL, 'info-icon5.jpg', '3d2e0b1d097a0780fbfd06babcea7ed40ebed720.jpg', 'thumb_3d2e0b1d097a0780fbfd06babcea7ed40ebed720.jpg', '', '', '', '2018-07-30 09:39:58', '2018-07-30 09:39:58'),
(17, NULL, 'info-icon4.jpg', 'b98fd808ea0dbdbd7bf541a88e10a0f236ea2c74.jpg', 'thumb_b98fd808ea0dbdbd7bf541a88e10a0f236ea2c74.jpg', '', '', '', '2018-07-30 09:40:45', '2018-07-30 09:40:45'),
(18, NULL, 'slide2.jpg', '3bff46268620ee64861eb1f09b11bda28b7ecc0e.jpg', 'thumb_3bff46268620ee64861eb1f09b11bda28b7ecc0e.jpg', '', '', '', '2018-07-30 10:07:57', '2018-07-30 10:07:57'),
(19, NULL, 'info-bg.jpg', '4c1082cbcad5b318cee71905b8028738fafcaaf5.jpg', 'thumb_4c1082cbcad5b318cee71905b8028738fafcaaf5.jpg', '', '', '', '2018-07-30 10:46:18', '2018-07-30 10:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_ar` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_en` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_pt` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `position` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title_en`, `title_ar`, `title_pt`, `status_ar`, `status_en`, `status_pt`, `link`, `order`, `parent_id`, `position`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Home', 'الرئيسية', 'Home', 'active', 'active', 'active', '/', 1, 0, 'top', 'fa fa-home', '2017-01-09 11:22:23', '2018-07-30 09:08:32'),
(2, 'About Us', 'د محمد', 'About Us', 'active', 'active', 'active', '/about-us.html', 2, 0, 'top', '', '2017-01-09 11:22:46', '2018-07-30 09:09:17'),
(18, 'Contact Us', 'اتصل بنا', 'Contact Us', 'active', 'active', 'active', '/contact-us', 4, 0, 'top', '', '2018-03-19 21:09:09', '2018-07-30 09:09:28'),
(14, 'Tours', 'خدمات المركز', 'Tours', 'active', 'active', 'active', '/خدمتنا', 3, 0, 'top', 'the-new-factory', '2017-09-19 12:56:13', '2018-07-30 10:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_07_27_080323_create_pages_table', 1),
('2016_07_27_120650_create_images_table', 1),
('2016_07_31_084101_create_albums_table', 1),
('2016_07_31_085854_create_albums_categories_table', 1),
('2016_07_31_105738_create_slides_table', 1),
('2016_08_01_094031_create_misc_table', 1),
('2016_08_22_122731_create_pages_categories_table', 1),
('2016_08_31_093223_create_menus_table', 1),
('2016_09_07_122243_create_activities_table', 1),
('2016_09_07_173452_create_visitors_messages_table', 1),
('2016_09_08_091634_create_contacts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `misc`
--

CREATE TABLE `misc` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_name_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_name_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_word_title_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_word_title_ar` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `site_word_title_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_word_content_en` text COLLATE utf8_unicode_ci NOT NULL,
  `site_word_content_ar` text COLLATE utf8_unicode_ci NOT NULL,
  `site_word_content_pt` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_description_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_ar` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `address_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `other_contact_data_en` text COLLATE utf8_unicode_ci NOT NULL,
  `other_contact_data_ar` text COLLATE utf8_unicode_ci NOT NULL,
  `other_contact_data_pt` text COLLATE utf8_unicode_ci NOT NULL,
  `closing_message_en` text COLLATE utf8_unicode_ci NOT NULL,
  `closing_message_ar` text COLLATE utf8_unicode_ci NOT NULL,
  `closing_message_pt` text COLLATE utf8_unicode_ci NOT NULL,
  `closing_status` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `phone_numbers` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `emails` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `google_map` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `linked_in` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catalog_pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `misc`
--

INSERT INTO `misc` (`id`, `site_name_en`, `site_name_ar`, `site_name_pt`, `site_word_title_en`, `site_word_title_ar`, `site_word_title_pt`, `site_word_content_en`, `site_word_content_ar`, `site_word_content_pt`, `meta_description_en`, `meta_description_ar`, `meta_description_pt`, `meta_keywords_en`, `meta_keywords_ar`, `meta_keywords_pt`, `address_en`, `address_ar`, `address_pt`, `other_contact_data_en`, `other_contact_data_ar`, `other_contact_data_pt`, `closing_message_en`, `closing_message_ar`, `closing_message_pt`, `closing_status`, `phone_numbers`, `emails`, `google_map`, `postal_code`, `facebook`, `twitter`, `youtube`, `instagram`, `google_plus`, `linked_in`, `catalog_pdf`, `created_at`, `updated_at`) VALUES
(1, 'Optimo', ' د. محمد خطاب', 'Optimo', 'Welcome', 'أهلا بكم بموقع د. محمد خطاب', 'Welcome', '<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipisicing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua. Ut Enim Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo Consequat. Duis Aute Irure Reprehenderit In Voluptate Velit</p>\r\n', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى حد ما. هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على ...</p>\r\n', '<p>Lorem Ipsum Dolor Sit Amet, Consectetur Adipisicing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua. Ut Enim Ad Minim Veniam, Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo Consequat. Duis Aute Irure Reprehenderit In Voluptate Velit</p>\r\n', '', '', '', '', '', '', 'Xxxxxxxxxxxxx', 'Xxxxxxxxxxxxx', 'Xxxxxxxxxxxxx', '<h3>Integer Tempus Venenatis Facilisis. Nunc Sagittis Mi Nec Elit Dictum At Porta Dolor Praesent Erat Mauris, Imperdiet Eu Dictum Id, Fringilla Id Ligula. Donec Id Eros Vel Nisl Porta Porttitor. Suspendisse A Libero Eget Risus Vulputate Feugiat In Vel Sapien. Aenean Imperdiet Euismod Convallis. Aliquam Non Tellus Velit, Vel Semper Nisl.</h3>\r\n\r\n<ul>\r\n</ul>\r\n', '<h3>Integer Tempus Venenatis Facilisis. Nunc Sagittis Mi Nec Elit Dictum At Porta Dolor Praesent Erat Mauris, Imperdiet Eu Dictum Id, Fringilla Id Ligula. Donec Id Eros Vel Nisl Porta Porttitor. Suspendisse A Libero Eget Risus Vulputate Feugiat In Vel Sapien. Aenean Imperdiet Euismod Convallis. Aliquam Non Tellus Velit, Vel Semper Nisl.</h3>\r\n', '<h3>Integer Tempus Venenatis Facilisis. Nunc Sagittis Mi Nec Elit Dictum At Porta Dolor Praesent Erat Mauris, Imperdiet Eu Dictum Id, Fringilla Id Ligula. Donec Id Eros Vel Nisl Porta Porttitor. Suspendisse A Libero Eget Risus Vulputate Feugiat In Vel Sapien. Aenean Imperdiet Euismod Convallis. Aliquam Non Tellus Velit, Vel Semper Nisl.</h3>\r\n', '<p>sorry we are out sevice we improve outer weebsite</p>\r\n', '<p>نعذتباسيللسيل</p>\r\n', '', 'opened', '[{"label_en":"","label_es":"","label_pt":"","value":"Xxxxxxxxxxxxx","featured":false}]', '[{"label_en":"","label_es":"","label_pt":"","value":"Xxxxxxxxxxxxx","featured":false}]', '{"lat":21.415119,"lng":39.266124}', '', 'https://www.facebook.com/', 'https://twitter.com/', 'http://www.youtube.com/', 'https://www.instagram.com/', 'https://plus.google.com/', '', 'Doc1.pdf', '2017-01-09 08:35:24', '2018-07-30 09:12:16');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vedio` text COLLATE utf8_unicode_ci NOT NULL,
  `status_en` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_ar` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_pt` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `featured_image_id` int(11) NOT NULL,
  `icon_image_id` int(11) NOT NULL,
  `page_category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `title_en`, `title_ar`, `title_pt`, `meta_keywords_en`, `meta_keywords_ar`, `meta_keywords_pt`, `meta_description_en`, `meta_description_ar`, `meta_description_pt`, `vedio`, `status_en`, `status_ar`, `status_pt`, `content`, `featured_image_id`, `icon_image_id`, `page_category_id`, `created_at`, `updated_at`) VALUES
(24, 'الانزلاق-الغضروفى-والعلاج-بالتردد-الحرارى', '', 'الانزلاق الغضروفى والعلاج بالتردد الحرارى', '', '', '', '', '', '', '', '', '', 'featured', '', '{"layout":"one-column","positions":[{"slug":"middle","name":"Middle","modules":[{"type":"text-content","data":{"localized":[{"locale":"ar","title":"الانزلاق الغضروفى والعلاج بالتردد الحرارى","content":"<ul>\\n\\t<li><a href=\\"\\">الانزلاق الغضروفى والعلاج بالتردد الحرارى</a></li>\\n</ul>\\n"}]},"title_as_text":"<i class=\\"fa fa-align-center fa-fw\\" aria-hidden=\\"true\\"></i> | الانزلاق الغضروفى والعلاج بالتردد الحرارى"}]}]}', 6, 0, 0, '2018-07-30 09:19:36', '2018-07-30 09:19:43'),
(25, 'افضل-علاج-لخشونه-الركبه', '', 'افضل علاج لخشونه الركبه', '', '', '', '', '', '', '', '', '', 'featured', '', '{"layout":"one-column","positions":[{"slug":"middle","name":"Middle","modules":[{"type":"text-content","data":{"localized":[{"locale":"ar","title":"افضل علاج لخشونه الركبه","content":"<ul>\\n\\t<li><a href=\\"\\">افضل علاج لخشونه الركبه</a></li>\\n</ul>\\n"}]},"title_as_text":"<i class=\\"fa fa-align-center fa-fw\\" aria-hidden=\\"true\\"></i> | افضل علاج لخشونه الركبه"}]}]}', 7, 0, 0, '2018-07-30 09:25:27', '2018-07-30 09:25:27'),
(26, 'تعرف-على-علاج-آلام-القدم', '', 'تعرف على علاج آلام القدم', '', '', '', '', '', '', '', '', '', 'featured', '', '{"layout":"one-column","positions":[{"slug":"middle","name":"Middle","modules":[{"type":"text-content","data":{"localized":[{"locale":"ar","title":"تعرف على علاج آلام القدم","content":"<ul>\\n\\t<li><a href=\\"\\">تعرف على علاج آلام القدم</a></li>\\n</ul>\\n"}]},"title_as_text":"<i class=\\"fa fa-align-center fa-fw\\" aria-hidden=\\"true\\"></i> | تعرف على علاج آلام القدم"}]}]}', 8, 0, 0, '2018-07-30 09:26:41', '2018-07-30 09:26:41'),
(27, 'علاج-الغضروف-بالخلايا-الجزعيه-فى-مصر', '', 'علاج الغضروف بالخلايا الجزعيه فى مصر', '', '', '', '', '', '', '', '', '', 'featured', '', '{"layout":"one-column","positions":[{"slug":"middle","name":"Middle","modules":[{"type":"text-content","data":{"localized":[{"locale":"ar","title":"علاج الغضروف بالخلايا الجزعيه فى مصر","content":"<ul>\\n\\t<li><a href=\\"\\">علاج الغضروف بالخلايا الجزعيه فى مصر</a></li>\\n</ul>\\n"}]},"title_as_text":"<i class=\\"fa fa-align-center fa-fw\\" aria-hidden=\\"true\\"></i> | علاج الغضروف بالخلايا الجزعيه فى مصر"}]}]}', 9, 0, 0, '2018-07-30 09:27:12', '2018-07-30 09:27:12'),
(28, 'الانزلاق-الغضروفى-والعلاج-بالتردد-الحرارى', '', 'الانزلاق الغضروفى والعلاج بالتردد الحرارى', '', '', '', '', '', '', '', 'https://www.youtube.com/embed/Q-Q-KT1X9ok?controls=1', '', 'inactive', '', '{"layout":"one-column","positions":[{"slug":"middle","name":"Middle","modules":[{"type":"text-content","data":{"localized":[{"locale":"ar","title":"الانزلاق الغضروفى والعلاج بالتردد الحرارى","content":"<p>https://youtu.be/Q-Q-KT1X9ok</p>\\n"}]},"title_as_text":"<i class=\\"fa fa-align-center fa-fw\\" aria-hidden=\\"true\\"></i> | الانزلاق الغضروفى والعلاج بالتردد الحرارى"}]}]}', 0, 0, 0, '2018-07-30 09:47:33', '2018-07-30 09:57:53'),
(29, 'about-us', '', 'about-us', '', '', '', '', '', '', '', '', '', 'active', '', '{"layout":"one-column","positions":[{"slug":"middle","name":"Middle","modules":[{"type":"text-content","data":{"localized":[{"locale":"ar","title":"د / محمد خطاب / استشاري عـلاج الآلام وطرق التردد الحراري في علاج آلام العمــود الفقـري والمفـاصل","content":"<p style=\\"text-align: right;\\">يقوم مركز الدكتور محمد خطاب بالعناية الطبية الكاملة للمريض والعمل علي علاج الام العضلات والعظام دون اللجوء إلى عمليات جراحية، و ذلك عن طريق جلسات الهدف منها تهيئة العضلات وعلاج الالتهابات التي قد تكون موجودة بها وذلك عن طريق أحدث الأجهزة والأساليب العلمية والاعتماد علي نخبة من كبار المتخصصين لضمان مستوى الجودة و الأمان المطلوب ويتمثل اختصاصات مركز دكتور اشرف خليل.&nbsp;<br />\\n1- علاج آلام العمود الفقري.<br />\\n2- علاج الانزلاق الغضروفي (القطني &ndash; العنقي).&nbsp;<br />\\n3- علاج آلام الرقبة.<br />\\n4- علاج آلام الكتف.<br />\\n5- علاج آلام الركبة.<br />\\n6- علاج آلام مفصل الحوض.&nbsp;<br />\\n7- علاج آلام الكعب شوكة الكعب.</p>\\n"}]},"title_as_text":"<i class=\\"fa fa-align-center fa-fw\\" aria-hidden=\\"true\\"></i> | د / محمد خطاب / استشاري عـلاج الآلام وطرق التردد الحراري في علاج آلام العمــود الفقـري والمفـاصل"}]}]}', 0, 0, 0, '2018-07-30 10:39:08', '2018-07-30 10:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `pages_categories`
--

CREATE TABLE `pages_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_en` text COLLATE utf8_unicode_ci NOT NULL,
  `content_ar` text COLLATE utf8_unicode_ci NOT NULL,
  `content_pt` text COLLATE utf8_unicode_ci NOT NULL,
  `_lft` int(10) UNSIGNED NOT NULL,
  `_rgt` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name_pt` varchar(255) NOT NULL,
  `description_en` text NOT NULL,
  `description_ar` text NOT NULL,
  `description_pt` text NOT NULL,
  `price` varchar(100) NOT NULL DEFAULT '0',
  `status` varchar(10) NOT NULL,
  `image_product` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `slug`, `product_category_id`, `name_en`, `name_ar`, `name_pt`, `description_en`, `description_ar`, `description_pt`, `price`, `status`, `image_product`, `created_at`, `updated_at`) VALUES
(4, 'آلام-العضلات-و-اسبابها-4', 3, '', 'آلام العضلات و اسبابها', '', '', '<p>&nbsp;</p>\r\n\r\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم</p>\r\n', '', '0', 'featured', 12, '2018-07-30 09:32:58', '2018-07-30 09:35:38'),
(5, '-نصائح-لالتهاب-المفاصل-5', 3, '', '  نصائح لالتهاب المفاصل', '', '', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم</p>\r\n', '', '0', 'featured', 13, '2018-07-30 09:37:51', '2018-07-30 09:38:00'),
(6, 'علاج-ألام-الظهر-وأسباب-آلام-الظهر-6', 3, '', 'علاج ألام الظهر وأسباب آلام الظهر', '', '', '<p>&nbsp;</p>\r\n\r\n<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم</p>\r\n', '', '0', 'featured', 14, '2018-07-30 09:38:47', '2018-07-30 09:38:54'),
(7, '-ماهو-غضروف-الرقبه-وما-اسبابه-وعلاجه', 3, '', '  ماهو غضروف الرقبه وما اسبابه وعلاجه', '', '', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم</p>\r\n', '', '0', 'featured', 15, '2018-07-30 09:39:31', '2018-07-30 09:39:31'),
(8, 'تعرف-على-علاج-التهاب-المفاصل-8', 3, '', 'تعرف على علاج التهاب المفاصل', '', '', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم</p>\r\n\r\n<p>&nbsp;</p>\r\n', '', '0', 'featured', 16, '2018-07-30 09:39:58', '2018-07-30 09:40:19'),
(9, 'تعرف-على-أسباب-وعلاج-آلام-اسفل-الظهر', 3, '', 'تعرف على أسباب وعلاج آلام اسفل الظهر', '', '', '<p>هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم</p>\r\n\r\n<p>&nbsp;</p>\r\n', '', '0', 'featured', 17, '2018-07-30 09:40:45', '2018-07-30 09:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `products_categories`
--

CREATE TABLE `products_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `layout` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_en` text COLLATE utf8_unicode_ci NOT NULL,
  `content_ar` text COLLATE utf8_unicode_ci NOT NULL,
  `content_pt` text COLLATE utf8_unicode_ci NOT NULL,
  `featured_image_id` int(11) NOT NULL,
  `_lft` int(10) UNSIGNED NOT NULL,
  `_rgt` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `title_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_pt` text COLLATE utf8_unicode_ci NOT NULL,
  `footer_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `footer_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `footer_pt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_en` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_ar` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `status_pt` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `title_en`, `title_ar`, `title_pt`, `content_en`, `content_ar`, `content_pt`, `footer_en`, `footer_ar`, `footer_pt`, `status_en`, `status_ar`, `status_pt`, `order`, `link`, `image_id`, `created_at`, `updated_at`) VALUES
(3, '', 's1', '', '', 's1', '', '', '', '', '', 'active', '', 1, '', 4, '2018-07-30 08:57:48', '2018-07-30 08:57:48'),
(4, '', 's2', '', '', 's2', '', '', '', '', '', 'active', '', 2, '', 18, '2018-07-30 09:03:44', '2018-07-30 10:07:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `role` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `status`, `role`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(7, 'Vadecom', 'Vadecom', 'admin@vadecom.net', '$2y$10$uxLe6uDzLAGJeQw2i.PQPeh2hGhrLsck1QL8dJn/9/3xaN7M.yis.', 'active', 'admin', NULL, 'UaBYQSMbtTkb2IVuehqtg0kc4pl2Cdo68erdyILzGl0x3pvFEsDBoteMXS4h', '2017-01-09 08:35:24', '2017-10-17 04:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `visitors_messages`
--

CREATE TABLE `visitors_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sender_email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sender_phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `visitors_messages`
--

INSERT INTO `visitors_messages` (`id`, `sender_name`, `sender_email_address`, `sender_phone_number`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(6, 'ttest', 'nmnsayed@test.test', '', 'اتصل بنا', 'test', 'new', '2018-08-01 14:16:21', '2018-08-01 14:16:21'),
(7, 'ttest', 'test@tes.com', NULL, 'اتصل بنا', 'تجربة', 'new', '2018-08-01 14:42:39', '2018-08-01 14:42:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_user_id_foreign` (`user_id`);

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `albums_categories`
--
ALTER TABLE `albums_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `misc`
--
ALTER TABLE `misc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages_categories`
--
ALTER TABLE `pages_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_categories`
--
ALTER TABLE `products_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visitors_messages`
--
ALTER TABLE `visitors_messages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `albums_categories`
--
ALTER TABLE `albums_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `misc`
--
ALTER TABLE `misc`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `pages_categories`
--
ALTER TABLE `pages_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `products_categories`
--
ALTER TABLE `products_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `visitors_messages`
--
ALTER TABLE `visitors_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
