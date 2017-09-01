/*
Navicat MySQL Data Transfer

Source Server         : homestead-7
Source Server Version : 50716
Source Host           : 127.0.0.1:33060
Source Database       : homestead

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-09-01 16:36:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_role`;
CREATE TABLE `admin_permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permission_role
-- ----------------------------

-- ----------------------------
-- Table structure for `admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'system', '系统管理', '2017-08-28 16:04:22', '2017-08-28 16:04:22');
INSERT INTO `admin_permissions` VALUES ('2', 'post', '文章管理', '2017-08-28 16:06:06', '2017-08-28 16:06:06');
INSERT INTO `admin_permissions` VALUES ('3', 'topic', '专题管理', '2017-08-28 16:06:35', '2017-08-28 16:06:35');
INSERT INTO `admin_permissions` VALUES ('4', 'notice', '通知管理', '2017-08-28 16:06:55', '2017-08-28 16:06:55');

-- ----------------------------
-- Table structure for `admin_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_user`;
CREATE TABLE `admin_role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_user
-- ----------------------------
INSERT INTO `admin_role_user` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'sys-manager', '系统管理员', '2017-08-28 16:07:34', '2017-08-28 16:07:34');
INSERT INTO `admin_roles` VALUES ('2', 'post-manager', '文章管理员', '2017-08-28 16:19:25', '2017-08-28 16:19:25');

-- ----------------------------
-- Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'test1', '$2y$10$f3Jnnhi8ycgXe01PLbQJB.P2nYb/tld251cTD5O0dXMgADq06dVgy', '2017-08-28 11:25:41', '2017-08-28 11:25:43');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('3', '3', '18', '13gfsdgsdfgsdfg', '2017-08-24 11:21:39', '2017-08-24 11:21:39');
INSERT INTO `comments` VALUES ('4', '3', '18', 'gsdf公司的风格的是', '2017-08-24 11:21:55', '2017-08-24 11:21:55');
INSERT INTO `comments` VALUES ('5', '3', '23', '哈哈哈', '2017-08-25 14:44:34', '2017-08-25 14:44:34');

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `fans`
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fan_id` int(11) NOT NULL DEFAULT '0',
  `star_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of fans
-- ----------------------------
INSERT INTO `fans` VALUES ('5', '3', '1', '2017-08-25 14:59:39', '2017-08-25 14:59:39');

-- ----------------------------
-- Table structure for `jobs`
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('3', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('4', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('5', '2017_08_19_103116_createte_posts_table', '2');
INSERT INTO `migrations` VALUES ('6', '2017_08_24_095637_create_comments_table', '3');
INSERT INTO `migrations` VALUES ('7', '2017_08_24_115759_create_zans_table', '4');
INSERT INTO `migrations` VALUES ('8', '2017_08_24_215750_create_fans_table', '5');
INSERT INTO `migrations` VALUES ('9', '2017_08_25_151344_create_topics_table', '6');
INSERT INTO `migrations` VALUES ('10', '2017_08_25_151413_create_post_topics_table', '6');
INSERT INTO `migrations` VALUES ('11', '2017_08_27_171132_create_admin_users', '7');
INSERT INTO `migrations` VALUES ('12', '2017_08_27_185456_alter_posts_table', '7');
INSERT INTO `migrations` VALUES ('13', '2017_08_27_220824_create_permission_and_roles', '7');
INSERT INTO `migrations` VALUES ('14', '2017_08_27_220841_create_notice_table', '7');
INSERT INTO `migrations` VALUES ('15', '2017_08_27_220900_create_jobs_table', '7');
INSERT INTO `migrations` VALUES ('16', '2017_08_27_220914_create_failed_jobs_table', '7');
INSERT INTO `migrations` VALUES ('17', '2017_08_27_220944_alter_user_table_add_avatar', '7');

-- ----------------------------
-- Table structure for `notices`
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES ('6', 'notice_test111', 'fasdfaaaaaaa割发代首高大上', '2017-09-01 11:09:25', '2017-09-01 11:09:25');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `post_topics`
-- ----------------------------
DROP TABLE IF EXISTS `post_topics`;
CREATE TABLE `post_topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of post_topics
-- ----------------------------
INSERT INTO `post_topics` VALUES ('1', '16', '1', '2017-08-25 17:03:19', '2017-08-25 17:03:22');
INSERT INTO `post_topics` VALUES ('2', '21', '1', '2017-08-25 17:18:02', '2017-08-25 17:18:02');

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('16', 'Vero aut nesciunt fugiat et laudantium labore ut.', 'Natus nesciunt maxime velit saepe rerum. Quasi exercitationem beatae voluptatem nulla. Ut iusto optio ad fuga officiis accusamus aliquam. Et autem aut voluptates optio. Repellendus iure ut quaerat quo est commodi. Tempora qui saepe qui eum ullam temporibus. Nisi quibusdam qui et pariatur aliquam et. Voluptatem quasi vel aut vel et animi ut. Cum illo porro fugiat architecto ea. Similique quia repellat rerum. Et aut totam unde tenetur consequatur voluptatem occaecati. Quia sint et id officiis molestiae laboriosam. Asperiores sit adipisci sint rerum.', '1', '2017-08-21 10:03:42', '2017-08-21 10:03:42', '0');
INSERT INTO `posts` VALUES ('17', 'Porro ea voluptates ut maiores.', 'Deleniti saepe qui est eum inventore. Fuga magni aut facilis explicabo vitae perferendis. Impedit cumque praesentium vel voluptas eum dolores consequatur. Eos iste distinctio ut perferendis. Nisi voluptatum et excepturi eum porro. Quis atque iure eum non doloremque. Sed ipsum quia dolores dolorem. Ad et eaque similique fuga ad. Vel esse et quidem ut. Nesciunt accusantium sit fugiat eos.', '2', '2017-08-21 10:03:42', '2017-08-21 10:03:42', '0');
INSERT INTO `posts` VALUES ('18', 'Aut ex id quisquam quas.', 'Voluptas ut eum deserunt quidem adipisci. Ut totam et possimus quibusdam. Omnis occaecati qui ut maiores laboriosam quidem. Fuga nisi consequuntur esse ipsa occaecati modi impedit. Tempore quaerat deserunt qui nesciunt id alias quia deleniti. Repellendus corrupti voluptas earum nihil et repudiandae omnis. Iure tempore ab quia quaerat. Fugit laudantium praesentium non quam natus blanditiis. Nulla quis et eius numquam. Dolores nam repudiandae aut ratione fugit dolorum nihil.', '1', '2017-08-21 10:03:42', '2017-08-21 10:03:42', '0');
INSERT INTO `posts` VALUES ('19', 'Rem quibusdam nihil quidem commodi.', 'Perferendis qui culpa accusamus illo. Sunt itaque vero inventore modi. Accusantium consequuntur exercitationem vel et. Non possimus velit tempore. Ut veritatis ipsam incidunt qui vel sunt molestiae voluptatum. Eum consequatur expedita quam eum minus id. Explicabo fugiat harum non aut corrupti exercitationem eos. Harum natus distinctio veritatis molestias eaque. Praesentium molestiae et quia possimus rerum. Consequuntur facere est molestiae molestiae aspernatur totam veniam.', '1', '2017-08-21 10:03:42', '2017-08-21 10:03:42', '0');
INSERT INTO `posts` VALUES ('20', 'Delectus voluptatibus et iusto ad.', 'Labore deleniti fugiat sint. Dolorum est beatae amet voluptas iste alias quae. Est ex corrupti natus harum. Aut tempore praesentium molestiae quibusdam ipsa quibusdam maxime. Porro harum iste voluptatem voluptatem temporibus temporibus reprehenderit. Occaecati asperiores sapiente voluptatem rerum autem. Accusamus nulla nisi reprehenderit quod. Aperiam neque enim earum vitae. Sint sit fuga qui. Ducimus dolor debitis rerum sunt. Soluta et dignissimos blanditiis voluptates. Temporibus quis magni voluptatem et. Itaque molestiae quo earum vel. Suscipit qui error omnis rerum minus et.', '1', '2017-08-21 10:03:42', '2017-08-21 10:03:42', '0');
INSERT INTO `posts` VALUES ('21', '123', '123123123', '1', '2017-08-21 10:46:05', '2017-08-21 10:46:05', '0');
INSERT INTO `posts` VALUES ('22', '你好你好11', '<p>1234567890</p><p>法撒旦法撒旦</p><p>fdsfas &nbsp; &nbsp;</p><p>123</p>', '1', '2017-08-21 14:52:52', '2017-08-21 16:38:41', '0');
INSERT INTO `posts` VALUES ('23', '3444444444444444444444', '<p>23333333</p>', '1', '2017-08-21 15:26:00', '2017-08-21 15:26:00', '0');
INSERT INTO `posts` VALUES ('24', '从贫民窟女孩到哈佛高材生，她用逆袭告诉我们奋斗的意义！', '<p>世界在转动，你只是一粒尘埃，没有你地球照样在转。现实是不会按照你的意志去改变的，因为别人的意志会比你的更强些。</p><p>“就在那一刻，我明白了，我得作出选择。我可以为自己寻找各种借口对生活低头，也可以迫使自己创造更好的生活！”</p><p>抱怨是没有用的，你只有选择改变你自己</p><p>抱怨生活从来都是没有用的，你只能去改变它。</p><p>丽兹一个月只上学三天，考试就能得到一百分。</p><p>老师问她：这个（一百分）&nbsp;你是怎么做到的？你都没来过学校。</p><p>丽兹说：我读了很多书（在家里），像《百科全书》。</p><p>后来，丽兹主动找到一所正常的中学，孤注一掷地向校长推荐自己。</p><p>“我很聪明，我知道我能成功。我只是，我只是需要一个机会，爬出我出生的那个环境。”</p><p><br><br></p><p>作者：麦家理想谷</p><p><br></p><p>链接：http://www.jianshu.com/p/035b765df6ad</p><p><br></p><p>來源：简书</p><p><br></p><p>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p><p><br></p>', '3', '2017-08-25 14:33:10', '2017-08-25 14:33:10', '0');
INSERT INTO `posts` VALUES ('25', '简书出版首批版权合伙人公布', '<p>以出版科技创新类图书为主，编辑出版有《创业三板斧：重运营》《时间不靠挤：意想不到的时间管理》《新媒体营销密码》《在风口，让梦想飞》《数码摄影佳作典藏.故事》《软件测试之道》《大数据分析的道与术》等创业、经管、互联网+等图书。</p><h1>★寄语写给作者：</h1><p>在电子化写作与电子化阅读已经非常方便的今天，当你想写书时，希望你在关注的主题上能做深做透、让自己成为专家。</p><p>你的专注，成就你的梦想。</p><p><br><br></p><p>作者：简书出版</p><p><br></p><p>链接：http://www.jianshu.com/p/3754497fa7e6</p><p><br></p><p>來源：简书</p><p><br></p><p>著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。</p><p><br></p>', '3', '2017-08-30 16:33:27', '2017-08-30 16:33:27', '0');
INSERT INTO `posts` VALUES ('27', '简书出版首批版权合伙人公布', '<p>以出版科技创新类图书为主，编辑出版有《创业三板斧：重运营》《时间不靠挤：意想不到的时间管理》《新媒体营销密码》《在风口，让梦想飞》《数码摄影佳作典藏.故事》《软件测试之道》《大数据分析的道与术》等创业、经管、互联网+等图书。</p>', '3', '2017-08-30 16:37:19', '2017-08-30 16:37:19', '0');

-- ----------------------------
-- Table structure for `topics`
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES ('1', '旅游', '2017-08-25 16:02:26', '2017-08-25 16:02:29');
INSERT INTO `topics` VALUES ('2', 'IT', '2017-08-25 16:02:41', '2017-08-25 16:02:44');

-- ----------------------------
-- Table structure for `user_notice`
-- ----------------------------
DROP TABLE IF EXISTS `user_notice`;
CREATE TABLE `user_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `notice_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_notice
-- ----------------------------
INSERT INTO `user_notice` VALUES ('1', '1', '6', null, null);
INSERT INTO `user_notice` VALUES ('2', '2', '6', null, null);
INSERT INTO `user_notice` VALUES ('3', '3', '6', null, null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户邮箱',
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Aufree', 'aufree@estgroupe.com', '$2y$10$3mEeYn70KP1yZ5xAWlmkMO8/QCsFWJ/xdUkKynQkJ7z6MrzBKcPo6', null, '2017-06-09 08:42:51', '2017-06-09 08:42:51', '');
INSERT INTO `users` VALUES ('2', 'xuyang', '1026825079@qq.com', '$2y$10$R9.ojnAIA796U1aAyuAtNOHLK4nexEa4vRZa6iF7FShk9HtsgPEy6', null, '2017-06-12 01:39:53', '2017-06-12 01:39:53', '');
INSERT INTO `users` VALUES ('3', 'test1', 'test1@qq.com', '$2y$10$f3Jnnhi8ycgXe01PLbQJB.P2nYb/tld251cTD5O0dXMgADq06dVgy', 'Zk7GWnL1tj8NdT80Mx3XOq5JWvA0hxN6bEbhiTQnNepd6yc36Pf4L92Lp4GE', '2017-08-23 11:45:15', '2017-08-23 11:45:15', '');

-- ----------------------------
-- Table structure for `zans`
-- ----------------------------
DROP TABLE IF EXISTS `zans`;
CREATE TABLE `zans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zans
-- ----------------------------
INSERT INTO `zans` VALUES ('8', '3', '0', '2017-08-24 14:48:47', '2017-08-24 14:48:47');
INSERT INTO `zans` VALUES ('10', '3', '21', '2017-08-24 16:35:38', '2017-08-24 16:35:38');
INSERT INTO `zans` VALUES ('11', '3', '17', '2017-08-25 10:46:33', '2017-08-25 10:46:33');
INSERT INTO `zans` VALUES ('12', '3', '23', '2017-08-25 14:37:39', '2017-08-25 14:37:39');
