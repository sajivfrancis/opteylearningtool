-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 25, 2018 at 06:08 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `olt`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_activation`
--

CREATE TABLE `accounts_activation` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `code` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts_activation`
--

INSERT INTO `accounts_activation` (`id`, `created_at`, `code`, `email`, `user_id`) VALUES
(15, '2018-11-05 23:43:06.577835', 'YdwmZ73b7dqlHxduPQ3u', '', 16);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add activation', 8, 'add_activation'),
(23, 'Can change activation', 8, 'change_activation'),
(24, 'Can delete activation', 8, 'delete_activation'),
(25, 'Can view log entry', 1, 'view_logentry'),
(26, 'Can view permission', 2, 'view_permission'),
(27, 'Can view group', 3, 'view_group'),
(28, 'Can view user', 4, 'view_user'),
(29, 'Can view content type', 5, 'view_contenttype'),
(30, 'Can view session', 6, 'view_session'),
(31, 'Can view site', 7, 'view_site'),
(32, 'Can view activation', 8, 'view_activation'),
(33, 'Can add blog_posts', 9, 'add_blog_posts'),
(34, 'Can change blog_posts', 9, 'change_blog_posts'),
(35, 'Can delete blog_posts', 9, 'delete_blog_posts'),
(36, 'Can view blog_posts', 9, 'view_blog_posts'),
(37, 'Can add uploadfolder', 10, 'add_uploadfolder'),
(38, 'Can change uploadfolder', 10, 'change_uploadfolder'),
(39, 'Can delete uploadfolder', 10, 'delete_uploadfolder'),
(40, 'Can view uploadfolder', 10, 'view_uploadfolder'),
(41, 'Can add photo', 11, 'add_photo'),
(42, 'Can change photo', 11, 'change_photo'),
(43, 'Can delete photo', 11, 'delete_photo'),
(44, 'Can view photo', 11, 'view_photo');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$cJRFJn1wUXrZ$3v5jd34s7Ils6WITMcnbEpdvKcBxXWyH7/7C3c/bNTY=', '2018-11-25 17:45:58.881240', 1, 'sajivfrancis', '', '', 'sajiv.francis@student.fairfield.edu', 1, 1, '2018-10-31 14:10:02.374533'),
(16, 'pbkdf2_sha256$120000$mP3MxLQSbWx9$eBp9HofgAgY3BMfC1CiFPa3JwWHRYAZ4rxjtoPYGlm0=', NULL, 0, 'hungnguyen2018', 'Hung', 'Nguyen', 'hung.nguyen@student.fairfield.edu', 0, 0, '2018-11-05 23:43:06.464280');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2018-11-01 17:41:27.506055', '4', 'francis.sajiv@gmail.com', 3, '', 4, 1),
(2, '2018-11-01 17:41:27.507354', '3', 'testuser1@gmail.com', 3, '', 4, 1),
(3, '2018-11-01 17:41:27.508912', '2', 'testuser@gmail.com', 3, '', 4, 1),
(4, '2018-11-01 17:44:23.148722', '5', 'francis.sajiv@gmail.com', 3, '', 4, 1),
(5, '2018-11-01 17:48:39.732516', '6', 'francis.sajiv@gmail.com', 3, '', 4, 1),
(6, '2018-11-01 18:04:56.041008', '8', 'connectsfrancis@gmail.com', 3, '', 4, 1),
(7, '2018-11-01 18:04:56.044215', '7', 'francis.sajiv@gmail.com', 3, '', 4, 1),
(8, '2018-11-01 18:13:20.606654', '9', 'connectsfrancis@gmail.com', 3, '', 4, 1),
(9, '2018-11-01 18:15:34.484673', '10', 'connectsfrancis@gmail.com', 3, '', 4, 1),
(10, '2018-11-01 18:45:37.644980', '11', 'connectsfrancis@gmail.com', 3, '', 4, 1),
(11, '2018-11-05 02:57:16.900768', '12', 'testuser', 3, '', 4, 1),
(12, '2018-11-05 02:57:16.903866', '13', 'testuser12@gmail.com', 3, '', 4, 1),
(13, '2018-11-05 20:09:52.309341', '14', 'fred', 3, '', 4, 1),
(14, '2018-11-05 23:42:18.140113', '15', 'hungnguyen2018', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'accounts', 'activation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'portal', 'blog_posts'),
(11, 'portal', 'photo'),
(10, 'portal', 'uploadfolder'),
(6, 'sessions', 'session'),
(7, 'sites', 'site');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-10-31 14:05:29.831403'),
(2, 'auth', '0001_initial', '2018-10-31 14:05:30.118519'),
(3, 'accounts', '0001_initial', '2018-10-31 14:05:30.163286'),
(4, 'accounts', '0002_auto_20180616_1933', '2018-10-31 14:05:30.184481'),
(5, 'admin', '0001_initial', '2018-10-31 14:05:30.242527'),
(6, 'admin', '0002_logentry_remove_auto_add', '2018-10-31 14:05:30.252006'),
(7, 'contenttypes', '0002_remove_content_type_name', '2018-10-31 14:05:30.305179'),
(8, 'auth', '0002_alter_permission_name_max_length', '2018-10-31 14:05:30.328401'),
(9, 'auth', '0003_alter_user_email_max_length', '2018-10-31 14:05:30.355821'),
(10, 'auth', '0004_alter_user_username_opts', '2018-10-31 14:05:30.364922'),
(11, 'auth', '0005_alter_user_last_login_null', '2018-10-31 14:05:30.388916'),
(12, 'auth', '0006_require_contenttypes_0002', '2018-10-31 14:05:30.390824'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2018-10-31 14:05:30.402574'),
(14, 'auth', '0008_alter_user_username_max_length', '2018-10-31 14:05:30.427710'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2018-10-31 14:05:30.455617'),
(16, 'sessions', '0001_initial', '2018-10-31 14:05:30.492057'),
(17, 'sites', '0001_initial', '2018-10-31 14:05:30.509293'),
(18, 'sites', '0002_alter_domain_unique', '2018-10-31 14:05:30.524567'),
(19, 'admin', '0003_logentry_add_action_flag_choices', '2018-11-05 20:15:24.854554'),
(20, 'portal', '0001_initial', '2018-11-25 02:09:08.894966');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4go9gt8t39gf7f4gikdqwl5wgd6z5cnu', 'M2VlN2FkOGY5Njk2NTViZmE0YmYyNzc0MDI4NjU2ZGEyZmNmMjFmNjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE0MGRmNzlmNzkxOGYwYjg4OWQyMzZlMWNkNWZkNjNiOGNhOTQ5ZDYifQ==', '2018-11-19 16:56:39.473938'),
('8pypt06b4kp3d17ln8jsgmn1zywl72e9', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-11-15 19:46:07.109284'),
('8r6l92zvcfa8pjb2afmfqzg717uvf0gd', 'OGZmNDAxNDFhOGM4YTZmOTA5YTU5OTk5MzZhYjA2YmQ1NTY4MzU2NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxNDBkZjc5Zjc5MThmMGI4ODlkMjM2ZTFjZDVmZDYzYjhjYTk0OWQ2In0=', '2018-11-19 03:52:36.951491'),
('8suneyxtbfotzz7jigw29zmes9ne0kk1', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-11-16 03:31:53.342665'),
('etaxb3nd6r7mrbqb2agrtoxux07rzcrf', 'Y2QxNzkxZGQ2NDVmNDQyNWNiZWMwMTM2Nzc3NjM3ZTY4NzFhNTlmOTp7Il9sYW5ndWFnZSI6ImVuIn0=', '2018-11-14 14:15:49.437483'),
('h6lv4d4au7pwcy28tum9tbbdxe592z3l', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-11-15 19:44:17.490812'),
('hxru7icksxuwiz20f2xjli4e6hriob2u', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-11-15 19:26:24.828358'),
('l6sn99e789cpvozla49xwnadqwejafjg', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-11-15 20:26:57.488313'),
('lrst86dporv126tijw3lhkdjdriuf10x', 'ZWY4ODAyMzQ4MGY4NDA0MmI0ZDU3ZmNlZjk4ZjBmMjkxYzUyZmI5Nzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFmYTI1MmJhMWM1YjkzNjBhMmIwNGMwMDU0ZmI2N2E1ZjFjZTE2NTgifQ==', '2018-12-09 17:45:58.882799'),
('n92drx7vi2jnx52xwj6sv7ttdg6xorew', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-11-15 19:57:30.273345'),
('noopt1du9z82xrlzhc1a1ebvzxkwqcww', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-12-03 03:41:17.248814'),
('oy25d3xxps80zgwm04emdtux9o07kgr9', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-11-16 18:47:57.464823'),
('t9d7mxyu6ed1gw5yu46iiwh1g8g8lciv', 'M2VlN2FkOGY5Njk2NTViZmE0YmYyNzc0MDI4NjU2ZGEyZmNmMjFmNjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE0MGRmNzlmNzkxOGYwYjg4OWQyMzZlMWNkNWZkNjNiOGNhOTQ5ZDYifQ==', '2018-11-15 18:18:52.844929'),
('w27g0wqdbndrio2oten0un7j9vt1kbld', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-11-16 00:37:14.172616'),
('yc3ry5lfb3hr6c56xl8b6urt1d3kclp3', 'Y2FiZDg5ZDNiOGE3NzlmNmFkZTgwNzk1NDQwMTljZTlmOWU3N2Y2OTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==', '2018-11-15 18:42:11.473070'),
('zkxsbflsxxq801zqr9425awkby7qfx3l', 'ZWY4ODAyMzQ4MGY4NDA0MmI0ZDU3ZmNlZjk4ZjBmMjkxYzUyZmI5Nzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImFmYTI1MmJhMWM1YjkzNjBhMmIwNGMwMDU0ZmI2N2E1ZjFjZTE2NTgifQ==', '2018-12-09 05:07:46.374692');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `portal_file`
--

CREATE TABLE `portal_file` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portal_file`
--

INSERT INTO `portal_file` (`id`, `title`, `file`, `uploaded_at`) VALUES
(5, '', 'files/SW301_Brochure_1_Q1G9W6r.docx', '2018-11-25 06:07:04.035590'),
(6, '', 'files/SW301_Brochure_1.docx', '2018-11-25 06:23:39.964221'),
(7, '', 'files/SW301_Brochure_1_Zr7p03G.docx', '2018-11-25 17:07:53.708879');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_activation`
--
ALTER TABLE `accounts_activation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_activation_code_79258aef_uniq` (`code`),
  ADD KEY `accounts_activation_user_id_25e4fc41_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `portal_file`
--
ALTER TABLE `portal_file`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_activation`
--
ALTER TABLE `accounts_activation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `portal_file`
--
ALTER TABLE `portal_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_activation`
--
ALTER TABLE `accounts_activation`
  ADD CONSTRAINT `accounts_activation_user_id_25e4fc41_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
