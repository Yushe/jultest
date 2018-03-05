-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 03, 2018 at 02:09 AM
-- Server version: 1.0.109
-- PHP Version: 5.6.15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `julpower`
--

-- --------------------------------------------------------

--
-- Table structure for table `actionlog`
--

CREATE TABLE IF NOT EXISTS `actionlog` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `atime` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `adesc` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `aip` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `actionlog`
--


-- --------------------------------------------------------

--
-- Table structure for table `announcementread`
--

CREATE TABLE IF NOT EXISTS `announcementread` (
  `user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `forum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `readdate` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `userforum` (`user`,`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcementread`
--


-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `date` int(10) NOT NULL DEFAULT '0',
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8mb4_unicode_ci,
  `forum` tinyint(3) NOT NULL DEFAULT '0',
  `headtext` text COLLATE utf8mb4_unicode_ci,
  `signtext` text COLLATE utf8mb4_unicode_ci,
  `edited` text COLLATE utf8mb4_unicode_ci,
  `editdate` int(11) unsigned DEFAULT NULL,
  `headid` mediumint(6) NOT NULL DEFAULT '0',
  `signid` mediumint(6) NOT NULL DEFAULT '0',
  `tagval` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0|0',
  `moodid` tinyint(3) NOT NULL DEFAULT '0',
  `noob` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forum` (`forum`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--


-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE IF NOT EXISTS `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `mime` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `is_image` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post` (`post`),
  KEY `user` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attachments`
--


-- --------------------------------------------------------

--
-- Table structure for table `biggestposters`
--

CREATE TABLE IF NOT EXISTS `biggestposters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `posts` mediumint(8) NOT NULL,
  `waste` mediumint(8) NOT NULL,
  `average` mediumint(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `biggestposters`
--


-- --------------------------------------------------------

--
-- Table structure for table `blockedlayouts`
--

CREATE TABLE IF NOT EXISTS `blockedlayouts` (
  `user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `blocked` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blockedlayouts`
--


-- --------------------------------------------------------

--
-- Table structure for table `bots`
--

CREATE TABLE IF NOT EXISTS `bots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `signature` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `malicious` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `malicious` (`malicious`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=277 ;

--
-- Dumping data for table `bots`
--

INSERT INTO `bots` (`id`, `signature`, `malicious`) VALUES
(1, 'abcdatos botlink/1.0.2', 0),
(2, 'ahoy', 0),
(3, 'alkalinebot', 0),
(4, 'anthillv1.1', 0),
(5, 'appie/1.1', 0),
(6, 'arachnophilia', 0),
(7, 'arale', 0),
(8, 'araneo/0.7', 0),
(9, 'araybot/1.0', 0),
(10, 'architextspider', 0),
(11, 'arks/1.0', 0),
(12, 'aspider/0.09', 0),
(13, 'atn_worldwide', 0),
(14, 'atomz/1.0', 0),
(15, 'auresys/1.0', 0),
(16, 'backrub', 0),
(17, 'bayspider', 0),
(18, 'bbot/0.100', 0),
(19, 'big brother', 0),
(20, 'bjaaland/0.5', 0),
(21, 'blackwidow', 0),
(22, 'die blinde kuh', 0),
(23, 'ukonline', 0),
(24, 'borg-bot/0.9', 0),
(25, 'boxseabot/0.5 (http://boxsea.com/crawler)', 0),
(26, 'mozilla/3.01 (compatible;)', 0),
(27, 'bspider/1.0 libwww-perl/0.40', 0),
(28, 'cactvs chemistry spider', 0),
(29, 'calif/0.6', 0),
(30, 'digimarc cgireader/1.0', 0),
(31, 'checkbot/x.xx lwp/5.x', 0),
(32, 'christcrawler', 0),
(33, 'cienciaficcion.net spider', 0),
(34, 'cmc/0.01', 0),
(35, 'lwp', 0),
(36, 'combine/0.0', 0),
(37, 'confuzzledbot/x.x', 0),
(38, 'coolbot', 0),
(39, 'root/0.1', 0),
(40, 'cosmos/0.3', 0),
(41, 'internet cruiser robot/2.1', 0),
(42, 'cusco/3.2', 0),
(43, 'cyberspyder/2.1', 0),
(44, 'cydralspider/', 0),
(45, 'desertrealm.com; 0.2; [j];', 0),
(46, 'deweb/1.01', 0),
(47, 'dienstspider/1.0', 0),
(48, 'digger/1.0 jdk/1.3.0', 0),
(49, 'diibot', 0),
(50, 'grabber', 0),
(51, 'dnabot/1.0', 0),
(52, 'dragonbot/1.0 libwww/5.0', 0),
(53, 'dwcp/2.0', 0),
(54, 'lwp::', 0),
(55, 'ebiness/0.01a', 0),
(56, 'eit-link-verifier-robot/0.2', 0),
(57, 'elfinbot', 0),
(58, 'emacs-w3/v[0-9.]+', 0),
(59, 'emc spider', 0),
(60, 'esculapio/1.1', 0),
(61, 'esther', 0),
(62, 'evliya celebi v0.151 - http://ilker.ulak.net.tr', 0),
(63, 'explorersearch', 0),
(64, 'fastcrawler', 0),
(65, 'mozilla/4.0 (compatible: fdse robot)', 0),
(66, 'felixide/1.0', 0),
(67, 'hazel''s ferret web hopper,', 0),
(68, 'esirover v1.0', 0),
(69, 'fido/0.9 harvest/1.4.pl2', 0),
(70, 'hambot', 0),
(71, 'kit-fireball/2.0 libwww/5.0a', 0),
(72, 'fish-search-robot', 0),
(73, 'fouineur', 0),
(74, 'robot du crim 1.0a', 0),
(75, 'freecrawl', 0),
(76, 'funnelweb-1.0', 0),
(77, 'gammaspider xxxxxxx ()/', 0),
(78, 'gazz/1.0', 0),
(79, 'gcreep/1.0', 0),
(80, 'geturl.rexx v1.05', 0),
(81, 'golem/1.1', 0),
(82, 'googlebot', 0),
(83, 'griffon/1.0', 0),
(84, 'gromit/1.0', 0),
(85, 'gulliver/1.1', 0),
(86, 'gulper web bot', 0),
(87, 'yes', 0),
(88, 'havindex/', 0),
(89, 'aitcsrobot/1.1', 0),
(90, 'hometown spider pro', 0),
(91, 'wired-digital-newsbot/1.5', 0),
(92, 'htdig/3.1.0b2', 0),
(93, 'htmlgobble v2.2', 0),
(94, 'iajabot/0.1', 0),
(95, 'ibm_planetwide,', 0),
(96, 'gestalticonoclast/1.0 libwww-fm/2.17', 0),
(97, 'ingrid/0.1', 0),
(98, 'mozilla 3.01 pbwf (win95)', 0),
(99, 'incywincy/1.0b1', 0),
(100, 'informant', 0),
(101, 'infoseek robot 1.0', 0),
(102, 'infoseek sidewinder', 0),
(103, 'infospiders/0.1', 0),
(104, 'inspectorwww', 0),
(105, '''iagent/1.0''', 0),
(106, 'i robot 0.4 (irobot@chaos.dk)', 0),
(107, 'iron33/0.0', 0),
(108, 'israelisearch/1.0', 0),
(109, 'javabee', 0),
(110, 'jbot', 0),
(111, 'jcrawler/0.2', 0),
(112, 'teoma', 0),
(113, 'jobo', 0),
(114, 'jobot/0.1alpha libwww-perl/4.0', 0),
(115, 'joebot/x.x,', 0),
(116, 'jubiirobot/version#', 0),
(117, 'jumpstation', 0),
(118, 'image.kapsi.net/1.0', 0),
(119, 'katipo/1.0', 0),
(120, 'kdd-explorer/0.1', 0),
(121, 'ko_yappo_robot/', 0),
(122, 'labelgrab/1.1', 0),
(123, 'larbin (+mail)', 0),
(124, 'legs', 0),
(125, 'linkidator/0.93', 0),
(126, 'linkscan', 0),
(127, 'linkwalker', 0),
(128, 'lockon', 0),
(129, 'logo.gif crawler', 0),
(130, 'lycos/x.x', 0),
(131, 'magpie/1.0', 0),
(132, 'marvin', 0),
(133, 'm/3.8', 0),
(134, 'mediafox', 0),
(135, 'merzscope', 0),
(136, 'nec-meshexplorer', 0),
(137, 'mindcrawler', 0),
(138, 'udmsearch', 0),
(139, 'moget/1.0', 0),
(140, 'momspider/', 0),
(141, 'monster/', 0),
(142, 'motor/0.2', 0),
(143, 'msnbot/', 0),
(144, 'muninn/0.1 libwww-perl-5.76', 0),
(145, 'muscatferret/', 0),
(146, 'mwdsearch/0.1', 0),
(147, 'sharp-info-agent', 0),
(148, 'ndspider/1.5', 0),
(149, 'netcarta cyberpilot pro', 0),
(150, 'netmechanic', 0),
(151, 'netscoop/1.0 libwww/5.0a', 0),
(152, 'newscan-online/1.1', 0),
(153, 'nhsewalker/3.0', 0),
(154, 'nomad-v2.x', 0),
(155, 'northstar', 0),
(156, 'objectssearch/0.01', 0),
(157, 'occam/1.0', 0),
(158, 'hku www robot,', 0),
(159, 'ontospider/1.0 libwww-perl/5.65', 0),
(160, 'openbot/3.0', 0),
(161, 'orbsearch/1.0', 0),
(162, 'packrat/1.0', 0),
(163, 'pageboy/1.0', 0),
(164, 'parasite/0.21 (http://www.ianett.com/parasite/)', 0),
(165, 'patric/0.01a', 0),
(166, 'web robot pegasus', 0),
(167, 'peregrinator-mathematics/0.7', 0),
(168, 'perlcrawler/1.0 xavatoria/2.0', 0),
(169, 'duppies', 0),
(170, 'phpdig/x.x.x', 0),
(171, 'piltdownman/1.0 profitnet@myezmail.com', 0),
(172, 'pimptrain', 0),
(173, 'pioneer', 0),
(174, 'portaljuice.com/4.0', 0),
(175, 'pgp-ka/1.2', 0),
(176, 'plumtreewebaccessor/0.9', 0),
(177, 'poppi/1.0', 0),
(178, 'portalbspider/1.0 (spider@portalb.com)', 0),
(179, 'psbot/0.x (+http://www.picsearch.com/bot.html)', 0),
(180, 'getterroboplus', 0),
(181, 'raven-v2', 0),
(182, 'resume robot', 0),
(183, 'rhcs/1.0a', 0),
(184, 'rixbot (http://www.oops-as.no/rix/)', 0),
(185, 'road runner: imagescape robot (lim@cs.leidenuniv.nl)', 0),
(186, 'robbie/0.1', 0),
(187, 'computingsite robi/1.0 (robi@computingsite.com)', 0),
(188, 'robocrawl (http://www.canadiancontent.net)', 0),
(189, 'robofox v2.0', 0),
(190, 'robozilla/1.0', 0),
(191, 'roverbot', 0),
(192, 'rules/1.0 libwww/4.0', 0),
(193, 'safetynet robot 0.1,', 0),
(194, 'scooter/2.0 g.r.a.b. v1.1.0', 0),
(195, 'not available', 0),
(196, 'mozilla/4.0 (sleek spider/1.2)', 0),
(197, 'searchprocess/0.9', 0),
(198, 'senrigan/xxxxxx', 0),
(199, 'sg-scout', 0),
(200, 'shagseek', 0),
(201, 'shai''hulud', 0),
(202, 'libwww-perl-5.41', 0),
(203, 'simbot/1.0', 0),
(204, 'site valet', 0),
(205, 'sitetech-rover', 0),
(206, 'awapclient', 0),
(207, 'slcrawler', 0),
(208, 'slurp/2.0', 0),
(209, 'esismartspider/2.0', 0),
(210, 'snooper/b97_01', 0),
(211, 'solbot/1.0 lwp/5.07', 0),
(212, 'speedy spider', 0),
(213, 'mouse.house/7.1', 0),
(214, 'spiderbot/1.0', 0),
(215, 'spiderline/3.1.3', 0),
(216, 'spiderman 1.0', 0),
(217, 'spiderview', 0),
(218, 'ssearcher100', 0),
(219, 'suke/*.*', 0),
(220, 'suntek/1.0', 0),
(221, 'http://www.sygol.com', 0),
(222, 'black widow', 0),
(223, 'tarantula/1.0', 0),
(224, 'tarspider', 0),
(225, 'dlw3robot/x.y (in tclx by http://hplyot.obspm.fr/~dl/)', 0),
(226, 'techbot', 0),
(227, 'templeton/{version} for {platform}', 0),
(228, 'titin/0.2', 0),
(229, 'titan/0.1', 0),
(230, 'tlspider/1.1', 0),
(231, 'ucsd-crawler', 0),
(232, 'udmsearch/2.1.1', 0),
(233, 'uptimebot', 0),
(234, 'urlck/1.2.3', 0),
(235, 'url spider pro', 0),
(236, 'valkyrie/1.0 libwww-perl/0.40', 0),
(237, 'verticrawlbot', 0),
(238, 'victoria/1.0', 0),
(239, 'vision-search/3.0''', 0),
(240, 'void-bot/0.1 (bot@void.be; http://www.void.be/)', 0),
(241, 'voyager/0.0', 0),
(242, 'vwbot_k/4.2', 0),
(243, 'w3index', 0),
(244, 'w3m2/x.xxx', 0),
(245, 'crawlpaper/n.n.n (windows n)', 0),
(246, 'wwwwanderer v3.0', 0),
(247, 'w@pspider/xxx (unix) by wap4.com', 0),
(248, 'webbandit/1.0', 0),
(249, 'webcatcher/1.0', 0),
(250, 'webcopy/(version)', 0),
(251, 'webfetcher/0.8,', 0),
(252, 'weblayers/0.0', 0),
(253, 'weblinker/0.0 libwww-perl/0.1', 0),
(254, 'webmoose/0.0.0000', 0),
(255, 'webquest/1.0', 0),
(256, 'digimarc webreader/1.2', 0),
(257, 'webreaper [webreaper@otway.com]', 0),
(258, 'webs@recruit.co.jp', 0),
(259, 'webvac/1.0', 0),
(260, 'webwalk', 0),
(261, 'webwalker/1.10', 0),
(262, 'webwatch', 0),
(263, 'wget/1.4.0', 0),
(264, 'whatuseek_winona/3.0', 0),
(265, 'wlm-1.1', 0),
(266, 'w3mir', 0),
(267, 'wolp/1.0 mda/1.0', 0),
(268, 'wwwc/0.25 (win95)', 0),
(269, 'none', 0),
(270, 'xget/0.7', 0),
(271, 'nederland.zoek', 0),
(272, 'baiduspider', 0),
(273, 'infopath', 0),
(274, 'ezooms/1.0', 0),
(275, 'webindex', 0),
(276, 'yahoo!', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `minpower` tinyint(4) DEFAULT '0',
  `corder` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `minpower`, `corder`) VALUES
(1, 'Main', 0, 1),
(2, 'Special', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `dailystats`
--

CREATE TABLE IF NOT EXISTS `dailystats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `users` int(11) NOT NULL DEFAULT '0',
  `threads` int(11) NOT NULL DEFAULT '0',
  `posts` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dailystats`
--


-- --------------------------------------------------------

--
-- Table structure for table `defines`
--

CREATE TABLE IF NOT EXISTS `defines` (
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `definition` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(11) NOT NULL,
  `user` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `defines`
--


-- --------------------------------------------------------

--
-- Table structure for table `delusers`
--

CREATE TABLE IF NOT EXISTS `delusers` (
  `id` smallint(5) unsigned NOT NULL,
  `posts` mediumint(9) NOT NULL DEFAULT '0',
  `regdate` int(11) NOT NULL DEFAULT '0',
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `loginname` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `minipic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `picture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `moodurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postheader` text COLLATE utf8mb4_unicode_ci,
  `signature` text COLLATE utf8mb4_unicode_ci,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `powerlevel` tinyint(2) NOT NULL DEFAULT '0',
  `powerlevel_prev` tinyint(2) NOT NULL DEFAULT '0',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `oldsex` tinyint(4) NOT NULL DEFAULT '-1',
  `namecolor` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namecolor_bak` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `useranks` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleoption` tinyint(1) NOT NULL DEFAULT '1',
  `realname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `birthday` int(11) NOT NULL DEFAULT '0',
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `privateemail` tinyint(3) NOT NULL DEFAULT '0',
  `aim` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icq` int(10) unsigned NOT NULL DEFAULT '0',
  `imood` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `homepageurl` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `homepagename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastposttime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lasturl` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastforum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `postsperpage` smallint(4) unsigned NOT NULL DEFAULT '0',
  `threadsperpage` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timezone` float NOT NULL DEFAULT '0',
  `scheme` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `layout` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `viewsig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `posttool` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `signsep` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagestyle` tinyint(4) NOT NULL DEFAULT '0',
  `pollstyle` tinyint(4) NOT NULL DEFAULT '0',
  `profile_locked` tinyint(1) NOT NULL DEFAULT '0',
  `editing_locked` tinyint(1) NOT NULL DEFAULT '0',
  `uploads_locked` tinyint(1) NOT NULL DEFAULT '0',
  `avatar_locked` tinyint(1) NOT NULL DEFAULT '0',
  `influence` int(10) unsigned NOT NULL DEFAULT '1',
  `lastannouncement` int(11) NOT NULL DEFAULT '0',
  `dateformat` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateshort` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aka` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hideactivity` tinyint(1) NOT NULL DEFAULT '0',
  `ban_expire` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delusers`
--


-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `d` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `m` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `y` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--


-- --------------------------------------------------------

--
-- Table structure for table `failedlogins`
--

CREATE TABLE IF NOT EXISTS `failedlogins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`,`username`(191),`ip`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failedlogins`
--


-- --------------------------------------------------------

--
-- Table structure for table `failedregs`
--

CREATE TABLE IF NOT EXISTS `failedregs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regcode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`,`username`(191),`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failedregs`
--


-- --------------------------------------------------------

--
-- Table structure for table `failsupress`
--

CREATE TABLE IF NOT EXISTS `failsupress` (
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failsupress`
--


-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE IF NOT EXISTS `favorites` (
  `user` bigint(6) NOT NULL DEFAULT '0',
  `thread` bigint(9) NOT NULL DEFAULT '0',
  UNIQUE KEY `user` (`user`,`thread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--


-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `method` tinyint(4) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `forum` int(11) NOT NULL DEFAULT '0',
  `source` varchar(127) NOT NULL,
  `replacement` varchar(127) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum` (`forum`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`id`, `type`, `method`, `enabled`, `forum`, `source`, `replacement`, `comment`) VALUES
(3, 3, 2, 1, 0, 'position\\s*:\\s*fixed', 'display:none', ''),
(4, 3, 2, 0, 0, 'position\\s*:\\s*(absolute|fixed)', 'display:none', 'Absolute allowed now alongside position:relative div'),
(5, 6, 1, 1, 0, ':facepalm:', '<img src=images/facepalm.jpg>', ''),
(6, 6, 1, 1, 0, ':facepalm2:', '<img src=images/facepalm2.jpg>', ''),
(7, 6, 1, 1, 0, ':epicburn:', '<img src=images/epicburn.png>', ''),
(8, 6, 1, 1, 0, ':umad:', '<img src=images/umad.jpg>', ''),
(9, 6, 1, 1, 0, ':gamepro5:', '<img src=images/gamepro5.gif title="FIVE EXPLODING HEADS OUT OF FIVE">', ''),
(10, 6, 1, 1, 0, ':headdesk:', '<img src=images/headdesk.jpg title="Steven Colbert to the rescue">', NULL),
(11, 6, 1, 1, 0, ':rereggie:', '<img src=images/rereggie.png>', NULL),
(12, 6, 1, 1, 0, ':tmyk:', '<img src=images/themoreyouknow.jpg title="do doo do doooooo~">', NULL),
(13, 6, 1, 1, 0, ':jmsu:', '<img src=images/jmsu.png>', NULL),
(14, 6, 1, 1, 0, ':noted:', '<img src=images/noted.png title="NOTED, THANKS!!">', NULL),
(15, 6, 1, 1, 0, ':apathy:', '<img src=images/stickfigure-notext.png title="who cares">', NULL),
(16, 6, 1, 1, 0, ':spinnaz:', '<img src="images/smilies/spinnaz.gif">', NULL),
(17, 6, 1, 1, 0, ':trolldra:', '<img src="images/trolldra.png">', NULL),
(18, 6, 1, 1, 0, ':reggie:', '<img src=images/reggieshrug.jpg title="REGGIE!">', NULL),
(19, 5, 1, 0, 0, 'drama', 'batter blaster', NULL),
(20, 5, 1, 0, 0, 'TheKinoko', 'MY NAME MEANS MUSHROOM... IN <i>JAPANESE!</i> HOLY SHIT GUYS THIS IS <i>INCREDIBLE</i>!!!!!!!!!', NULL),
(21, 5, 1, 0, 0, 'hopy', 'I am a dumb', NULL),
(22, 5, 1, 0, 0, 'crashdance', 'CrashDunce', ''),
(23, 5, 1, 0, 0, 'get blue spheres', 'HI EVERYBODY I''M A RETARD PLEASE BAN ME', ''),
(24, 5, 1, 1, 0, 'zeon', 'shit', NULL),
(25, 5, 1, 0, 0, 'faith in humanity', 'IQ', ''),
(26, 5, 1, 0, 0, 'motorcycles', '<img src="images/cardgames.png" align="absmiddle" title="DERP DERP DERP">', NULL),
(27, 5, 1, 0, 0, 'card games', '<img src="images/motorcycles.png" align="absmiddle" title="GET BLUE SPHERES">', NULL),
(28, 5, 1, 0, 0, 'touhou', 'Baby''s First Bullet Hell&trade;', NULL),
(29, 5, 1, 0, 0, 'nintendo', 'grandma', NULL),
(30, 5, 1, 0, 0, 'card games on motorcycles', 'bard dames on rotorcycles', NULL),
(31, 2, 2, 0, 0, '^.*(http://hyperhacker.no-ip.org/b/smilies/lolface.png).*$', '<img src=images/smilies/roflx.gif><br><br><small>(Excessive post content hidden)</small>', ''),
(32, 2, 2, 0, 0, '.*?images/smilies/roflx.gif.*?', '<img src=images/smilies/roflx.gif><br><br><small>(Excessive post content hidden)</small>', ''),
(33, 2, 0, 0, 0, 'ftp://teconmoon.no-ip.org', 'about:blank', ''),
(34, 2, 0, 1, 0, 'http://insectduel.proboards82.com', 'idiotredir.php?', NULL),
(35, 2, 0, 0, 0, 'http://imageshack.us', 'imageshit', ''),
(36, 2, 2, 1, 0, 'http://.{0,3}.?tinypic.com', 'tinyshit', ''),
(37, 2, 0, 1, 0, '<link href="http://pieguy1372.freeweb7.com/misc/piehills.css" rel="stylesheet">', '<!-- -->', NULL),
(38, 3, 0, 1, 0, 'tabindex="0" ', 'title="the owner of this button is a fucking dumbass">', ''),
(39, 1, 0, 0, 0, '%WIKISTATSFRAME%', '<div id="widgetIframe"><iframe width="600" height="260" src="http://stats.rustedlogic.net/index.php?module=Widgetize&action=ifr', NULL),
(40, 1, 0, 0, 0, '%WIKISTATSFRAME2%', '<div id="widgetIframe"><iframe width="100%" height="600" src="http://stats.rustedlogic.net/index.php?module=Widgetize&action=if', NULL),
(41, 2, 0, 0, 0, 'http://xkeeper.shacknet.nu:5/', 'http://xchan.shacknet.nu:5/', NULL),
(42, 3, 1, 0, 0, '<style', '&lt;style', NULL),
(43, 5, 0, 0, 0, '-.-', 'MORONS EVERYWHERE BAN BAN BAN!!!', 'late 2016 was fun'),
(45, 3, 2, 1, 0, ' src=("|\\'')[a-z]:(.*?)("|\\'')', ' src="images/linkingfail.gif"', ''),
(46, 3, 1, 0, 0, '%BZZZ%', 'onclick="bzzz(', NULL),
(47, 6, 1, 0, 0, ':awesome:', '<small>[unfunny]</small>', ''),
(48, 3, 2, 0, 0, 'autoplay', 'ap', 'kills autoplay, need to think of a solution for embeds.'),
(49, 2, 2, 1, 0, '(https?://.*?photobucket.com/)', 'images/photobucket.png#\\\\1', 'photobucket replacement image');

-- --------------------------------------------------------

--
-- Table structure for table `forummods`
--

CREATE TABLE IF NOT EXISTS `forummods` (
  `forum` smallint(5) NOT NULL DEFAULT '0',
  `user` mediumint(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forummods`
--


-- --------------------------------------------------------

--
-- Table structure for table `forumread`
--

CREATE TABLE IF NOT EXISTS `forumread` (
  `user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `forum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `readdate` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `userforum` (`user`,`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forumread`
--


-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE IF NOT EXISTS `forums` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `olddesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `minpower` tinyint(2) NOT NULL DEFAULT '0',
  `minpowerthread` tinyint(2) NOT NULL DEFAULT '0',
  `minpowerreply` tinyint(2) NOT NULL DEFAULT '0',
  `numthreads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `numposts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lastpostdate` int(11) NOT NULL DEFAULT '0',
  `lastpostuser` int(11) unsigned NOT NULL DEFAULT '0',
  `lastpostid` int(11) NOT NULL DEFAULT '0',
  `forder` smallint(5) NOT NULL DEFAULT '0',
  `specialscheme` smallint(5) DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `specialtitle` tinytext COLLATE utf8mb4_unicode_ci,
  `pollstyle` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `minpower` (`minpower`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `forums`
--

INSERT INTO `forums` (`id`, `title`, `description`, `olddesc`, `catid`, `minpower`, `minpowerthread`, `minpowerreply`, `numthreads`, `numposts`, `lastpostdate`, `lastpostuser`, `lastpostid`, `forder`, `specialscheme`, `hidden`, `specialtitle`, `pollstyle`) VALUES
(1, 'General Forum', 'For everybody.', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, NULL, 0, '', 0),
(2, 'General Staff Forum', 'Not for everybody.', '', 2, 1, 1, 1, 0, 0, 0, 0, 0, 1, NULL, 0, '', 0),
(3, 'Trash Forum', '?', '', 1, 0, 2, 2, 0, 0, 0, 0, 0, 2, NULL, 0, '', 0),
(4, 'Announcements', 'Important stuff you need to read.', '', 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '', 0);


-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `lasturl` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastforum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guests`
--


-- --------------------------------------------------------

--
-- Table structure for table `hits`
--

CREATE TABLE IF NOT EXISTS `hits` (
  `num` int(11) NOT NULL DEFAULT '0',
  `user` mediumint(8) NOT NULL DEFAULT '0',
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  KEY `num` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hits`
--


-- --------------------------------------------------------

--
-- Table structure for table `ipbans`
--

CREATE TABLE IF NOT EXISTS `ipbans` (
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reason` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `perm` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `banner` smallint(5) unsigned NOT NULL DEFAULT '1',
  `expire` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ipbans`
--


-- --------------------------------------------------------

--
-- Table structure for table `itemcateg`
--

CREATE TABLE IF NOT EXISTS `itemcateg` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `corder` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `itemcateg`
--

INSERT INTO `itemcateg` (`id`, `corder`, `name`, `description`) VALUES
(1, 1, 'Weapons', 'kill stuff'),
(2, 2, 'Armor', 'yep'),
(3, 3, 'Shields', 'Wooden, big, mirror'),
(4, 4, 'Helmets', 'Football, baseball, hats, things to protect that empty space in your skull'),
(5, 5, 'Boots', 'Things you wear to prevent stepping in stinky landmines.'),
(6, 6, 'Accessories', 'bling bling'),
(7, 7, 'Usable crap', 'Pick an item, any item');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stype` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sHP` smallint(5) NOT NULL DEFAULT '100',
  `sMP` smallint(5) NOT NULL DEFAULT '100',
  `sAtk` smallint(5) NOT NULL DEFAULT '100',
  `sDef` smallint(5) NOT NULL DEFAULT '100',
  `sInt` smallint(5) NOT NULL DEFAULT '100',
  `sMDf` smallint(5) NOT NULL DEFAULT '100',
  `sDex` smallint(5) NOT NULL DEFAULT '100',
  `sLck` smallint(5) NOT NULL DEFAULT '100',
  `sSpd` smallint(5) NOT NULL DEFAULT '100',
  `effect` tinyint(4) NOT NULL,
  `coins` mediumint(8) NOT NULL DEFAULT '100',
  `gcoins` int(11) NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` int(11) NOT NULL,
  `hidden` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat` (`cat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `cat`, `type`, `name`, `stype`, `sHP`, `sMP`, `sAtk`, `sDef`, `sInt`, `sMDf`, `sDex`, `sLck`, `sSpd`, `effect`, `coins`, `gcoins`, `desc`, `user`, `hidden`) VALUES
(1, 1, 255, 'Obligatory Joke item', 'aamaaamma', 100, -233, 140, -233, 23, 555, 90, 500, 32767, 1, 10, 0, 'NO BONUS', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `itemtypes`
--

CREATE TABLE IF NOT EXISTS `itemtypes` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ord` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `itemtypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `jstrap`
--

CREATE TABLE IF NOT EXISTS `jstrap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loguser` smallint(5) NOT NULL,
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `filtered` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jstrap`
--


-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  `get` text COLLATE utf8mb4_unicode_ci,
  `post` text COLLATE utf8mb4_unicode_ci,
  `cookie` text COLLATE utf8mb4_unicode_ci,
  `useragent` text COLLATE utf8mb4_unicode_ci,
  `ref` text COLLATE utf8mb4_unicode_ci,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `banflags` smallint(5) DEFAULT NULL,
  `defntime` char(19) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log`
--


-- --------------------------------------------------------

--
-- Table structure for table `minilog`
--

CREATE TABLE IF NOT EXISTS `minilog` (
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `banflags` smallint(5) unsigned NOT NULL,
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `minilog`
--


-- --------------------------------------------------------

--
-- Table structure for table `misc`
--

CREATE TABLE IF NOT EXISTS `misc` (
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `hotcount` smallint(5) unsigned DEFAULT '30',
  `maxpostsday` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `maxpostshour` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `maxpostsdaydate` int(10) unsigned NOT NULL DEFAULT '0',
  `maxpostshourdate` int(10) unsigned NOT NULL DEFAULT '0',
  `maxusers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxusersdate` int(10) unsigned NOT NULL DEFAULT '0',
  `maxuserstext` text COLLATE utf8mb4_unicode_ci,
  `disable` tinyint(1) NOT NULL DEFAULT '0',
  `donations` float NOT NULL DEFAULT '0',
  `ads` float NOT NULL DEFAULT '0',
  `valkyrie` float NOT NULL DEFAULT '0',
  `scheme` smallint(5) DEFAULT NULL,
  `specialtitle` tinytext COLLATE utf8mb4_unicode_ci,
  `regmode` tinyint(2) NOT NULL DEFAULT '0',
  `regcode` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bigpostersupdate` int(11) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `backup` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `misc`
--

INSERT INTO `misc` () VALUES ();

-- --------------------------------------------------------

--
-- Table structure for table `pendingusers`
--

CREATE TABLE IF NOT EXISTS `pendingusers` (
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) unsigned NOT NULL,
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pendingusers`
--


-- --------------------------------------------------------

--
-- Table structure for table `pmsgs`
--

CREATE TABLE IF NOT EXISTS `pmsgs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userto` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userfrom` smallint(5) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `moodid` tinyint(4) NOT NULL DEFAULT '0',
  `msgread` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `headid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `signid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `folderto` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `folderfrom` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `headtext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `signtext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tagval` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userto` (`userto`),
  KEY `userfrom` (`userfrom`),
  KEY `msgread` (`msgread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pmsgs`
--


-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `briefing` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `doublevote` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poll`
--


-- --------------------------------------------------------

--
-- Table structure for table `pollvotes`
--

CREATE TABLE IF NOT EXISTS `pollvotes` (
  `poll` int(11) NOT NULL DEFAULT '0',
  `choice` int(11) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `choice` (`choice`,`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pollvotes`
--


-- --------------------------------------------------------

--
-- Table structure for table `poll_choices`
--

CREATE TABLE IF NOT EXISTS `poll_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll` int(11) NOT NULL DEFAULT '0',
  `choice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `color` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poll_choices`
--


-- --------------------------------------------------------

--
-- Table structure for table `postlayouts`
--

CREATE TABLE IF NOT EXISTS `postlayouts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postlayouts`
--


-- --------------------------------------------------------

--
-- Table structure for table `postradar`
--

CREATE TABLE IF NOT EXISTS `postradar` (
  `user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comp` smallint(5) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `user` (`user`,`comp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postradar`
--


-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `thread` int(10) unsigned NOT NULL DEFAULT '0',
  `user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0',
  `num` mediumint(8) NOT NULL DEFAULT '0',
  `noob` tinyint(4) NOT NULL DEFAULT '0',
  `moodid` tinyint(4) NOT NULL DEFAULT '0',
  `headid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `signid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `headtext` text COLLATE utf8mb4_unicode_ci,
  `text` mediumtext COLLATE utf8mb4_unicode_ci,
  `signtext` text COLLATE utf8mb4_unicode_ci,
  `tagval` text COLLATE utf8mb4_unicode_ci,
  `options` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0|0',
  `edited` text COLLATE utf8mb4_unicode_ci,
  `editdate` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `thread` (`thread`),
  KEY `date` (`date`),
  KEY `user` (`user`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--


-- --------------------------------------------------------

--
-- Table structure for table `postsday`
--

CREATE TABLE IF NOT EXISTS `postsday` (
  `time` int(11) NOT NULL DEFAULT '0',
  `acmlm2` int(11) NOT NULL DEFAULT '0',
  `justus` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postsday`
--


-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

CREATE TABLE IF NOT EXISTS `ranks` (
  `rset` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `num` mediumint(8) NOT NULL DEFAULT '0',
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  KEY `count` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`rset`, `num`, `text`) VALUES
(1, 0, 'Nobody'),
(1, 1, 'Random nobody'),
(1, 10, 'User'),
(1, 25, 'Member'),
(1, 1000, 'Catgirl'),
(1, 2500, 'Common spammer'),
(2, 0, '<img src=''images/ranks/tgm/9.png''>'),
(2, 10, '<img src=''images/ranks/tgm/8.png''>'),
(2, 25, '<img src=''images/ranks/tgm/7.png''>'),
(2, 50, '<img src=''images/ranks/tgm/6.png''>'),
(2, 100, '<img src=''images/ranks/tgm/5.png''>'),
(2, 150, '<img src=''images/ranks/tgm/4.png''>'),
(2, 200, '<img src=''images/ranks/tgm/3.png''>'),
(2, 250, '<img src=''images/ranks/tgm/2.png''>'),
(2, 350, '<img src=''images/ranks/tgm/1.png''>'),
(2, 500, '<img src=''images/ranks/tgm/s1.png''>'),
(2, 750, '<img src=''images/ranks/tgm/s2.png''>'),
(2, 1000, '<img src=''images/ranks/tgm/s3.png''>'),
(2, 1250, '<img src=''images/ranks/tgm/s4.png''>'),
(2, 1500, '<img src=''images/ranks/tgm/s5.png''>'),
(2, 2000, '<img src=''images/ranks/tgm/s6.png''>'),
(2, 2500, '<img src=''images/ranks/tgm/s7.png''>'),
(2, 3250, '<img src=''images/ranks/tgm/s8.png''>'),
(2, 4000, '<img src=''images/ranks/tgm/s9.png''>'),
(2, 5000, '<img src=''images/ranks/tgm/gm.png''>'),
(11, 0, 'Non-poster'),
(11, 1, 'Newcomer'),
(11, 625, '<img src=images/ranks/mario/drybones.gif><br>Dry Bones'),
(11, 10000, 'Climbing the ranks again!'),
(11, 20, '<img src=images/ranks/mario/goomba.gif width=16 height=16><br>Goomba'),
(11, 10, '<img src=images/ranks/mario/microgoomba.gif width=8 height=9><br>Micro-Goomba'),
(11, 35, '<img src=images/ranks/mario/redgoomba.gif width=16 height=16><br>Red Goomba'),
(11, 50, '<img src=images/ranks/mario/redparagoomba.gif width=20 height=24><br>Red Paragoomba'),
(11, 65, '<img src=images/ranks/mario/paragoomba.gif width=20 height=24><br>Paragoomba'),
(11, 80, '<img src=images/ranks/mario/shyguy.gif width=16 height=16><br>Shyguy'),
(11, 100, '<img src=images/ranks/mario/koopa.gif width=16 height=27><br>Koopa'),
(11, 120, '<img src=images/ranks/mario/redkoopa.gif width=16 height=27><br>Red Koopa'),
(11, 140, '<img src=images/ranks/mario/paratroopa.gif width=16 height=28><br>Paratroopa'),
(11, 160, '<img src=images/ranks/mario/redparatroopa.gif width=16 height=28><br>Red Paratroopa'),
(11, 180, '<img src=images/ranks/mario/cheepcheep.gif width=16 height=16><br>Cheep-cheep'),
(11, 200, '<img src=images/ranks/mario/redcheepcheep.gif width=16 height=16><br>Red Cheep-cheep'),
(11, 225, '<img src=images/ranks/mario/ninji.gif width=16 height=16><br>Ninji'),
(11, 250, '<img src=images/ranks/mario/flurry.gif width=16 height=16><br>Flurry'),
(11, 275, '<img src=images/ranks/mario/snifit.gif width=16 height=16><br>Snifit'),
(11, 300, '<img src=images/ranks/mario/porcupo.gif width=16 height=16><br>Porcupo'),
(11, 325, '<img src=images/ranks/mario/panser.gif width=16 height=16><br>Panser'),
(11, 350, '<img src=images/ranks/mario/mole.gif width=16 height=16><br>Mole'),
(11, 375, '<img src=images/ranks/mario/beetle.gif width=16 height=16><br>Buzzy Beetle'),
(11, 400, '<img src=images/ranks/mario/nipperplant.gif width=16 height=16><br>Nipper Plant'),
(11, 425, '<img src=images/ranks/mario/bloober.gif width=16 height=16><br>Bloober'),
(11, 450, '<img src=images/ranks/mario/busterbeetle.gif width=16 height=15><br>Buster Beetle'),
(11, 475, '<img src=images/ranks/mario/beezo.gif width=16 height=16><br>Beezo'),
(11, 500, '<img src=images/ranks/mario/bulletbill.gif width=16 height=14><br>Bullet Bill'),
(11, 525, '<img src=images/ranks/mario/rex.gif width=20 height=32><br>Rex'),
(11, 550, '<img src=images/ranks/mario/lakitu.gif width=16 height=24><br>Lakitu'),
(11, 575, '<img src=images/ranks/mario/spiny.gif width=16 height=16><br>Spiny'),
(11, 600, '<img src=images/ranks/mario/bobomb.gif width=16 height=16><br>Bob-Omb'),
(11, 700, '<img src=images/ranks/mario/spike.gif width=32 height=32><br>Spike'),
(11, 675, '<img src=images/ranks/mario/pokey.gif width=18 height=64><br>Pokey'),
(11, 650, '<img src=images/ranks/mario/cobrat.gif width=16 height=32><br>Cobrat'),
(11, 725, '<img src=images/ranks/mario/hedgehog.gif width=16 height=24><br>Melon Bug'),
(11, 750, '<img src=images/ranks/mario/lanternghost.gif width=26 height=19><br>Lantern Ghost'),
(11, 775, '<img src=images/ranks/mario/fuzzy.gif width=32 height=31><br>Fuzzy'),
(11, 800, '<img src=images/ranks/mario/bandit.gif width=23 height=28><br>Bandit'),
(11, 830, '<img src=images/ranks/mario/superkoopa.gif width=23 height=13><br>Super Koopa'),
(11, 860, '<img src=images/ranks/mario/redsuperkoopa.gif width=23 height=13><br>Red Super Koopa'),
(11, 900, '<img src=images/ranks/mario/boo.gif width=16 height=16><br>Boo'),
(11, 925, '<img src=images/ranks/mario/boo2.gif width=16 height=16><br>Boo'),
(11, 950, '<img src=images/ranks/mario/fuzzball.gif width=16 height=16><br>Fuzz Ball'),
(11, 1000, '<img src=images/ranks/mario/boomerangbrother.gif width=60 height=40><br>Boomerang Brother'),
(11, 1050, '<img src=images/ranks/mario/hammerbrother.gif width=60 height=40><br>Hammer Brother'),
(11, 1100, '<img src=images/ranks/mario/firebrother.gif width=60 height=24><br>Fire Brother'),
(11, 1150, '<img src=images/ranks/mario/firesnake.gif width=45 height=36><br>Fire Snake'),
(11, 1200, '<img src=images/ranks/mario/giantgoomba.gif width=24 height=23><br>Giant Goomba'),
(11, 1250, '<img src=images/ranks/mario/giantkoopa.gif width=24 height=31><br>Giant Koopa'),
(11, 1300, '<img src=images/ranks/mario/giantredkoopa.gif width=24 height=31><br>Giant Red Koopa'),
(11, 1350, '<img src=images/ranks/mario/giantparatroopa.gif width=24 height=31><br>Giant Paratroopa'),
(11, 1400, '<img src=images/ranks/mario/giantredparatroopa.gif width=24 height=31><br>Giant Red Paratroopa'),
(11, 1450, '<img src=images/ranks/mario/chuck.gif width=28 height=27><br>Chuck'),
(11, 1500, '<img src=images/ranks/mario/thwomp.gif width=44 height=32><br>Thwomp'),
(11, 1550, '<img src=images/ranks/mario/bigcheepcheep.gif width=24 height=32><br>Boss Bass'),
(11, 1600, '<img src=images/ranks/mario/volcanolotus.gif width=32 height=30><br>Volcano Lotus'),
(11, 1650, '<img src=images/ranks/mario/lavalotus.gif width=24 height=32><br>Lava Lotus'),
(11, 1700, '<img src=images/ranks/mario/ptooie2.gif width=16 height=43><br>Ptooie'),
(11, 1800, '<img src=images/ranks/mario/sledgebrother.gif width=60 height=50><br>Sledge Brother'),
(11, 1900, '<img src=images/ranks/mario/boomboom.gif width=28 height=26><br>Boomboom'),
(11, 2000, '<img src=images/ranks/mario/birdopink.gif width=60 height=36><br>Birdo'),
(11, 2100, '<img src=images/ranks/mario/birdored.gif width=60 height=36><br>Red Birdo'),
(11, 2200, '<img src=images/ranks/mario/birdogreen.gif width=60 height=36><br>Green Birdo'),
(11, 2300, '<img src=images/ranks/mario/iggy.gif width=28><br>Larry Koopa'),
(11, 2400, '<img src=images/ranks/mario/morton.gif width=34><br>Morton Koopa'),
(11, 2500, '<img src=images/ranks/mario/wendy.gif width=28><br>Wendy Koopa'),
(11, 2600, '<img src=images/ranks/mario/larry.gif width=28><br>Iggy Koopa'),
(11, 2700, '<img src=images/ranks/mario/roy.gif width=34><br>Roy Koopa'),
(11, 2800, '<img src=images/ranks/mario/lemmy.gif width=28><br>Lemmy Koopa'),
(11, 2900, '<img src=images/ranks/mario/ludwig.gif width=33><br>Ludwig Von Koopa'),
(11, 3000, '<img src=images/ranks/mario/triclyde.gif width=40 height=48><br>Triclyde'),
(11, 3100, '<img src=images/ranks/mario/kamek.gif width=45 height=34><br>Magikoopa'),
(11, 3200, '<img src=images/ranks/mario/wart.gif width=40 height=47><br>Wart'),
(11, 3300, '<img src=images/ranks/mario/babybowser.gif width=36 height=36><br>Baby Bowser'),
(11, 3400, '<img src=images/ranks/mario/bowser.gif width=52 height=49><br>King Bowser Koopa'),
(11, 3500, '<img src=images/ranks/mario/yoshi.gif width=31 height=33><br>Yoshi'),
(11, 3600, '<img src=images/ranks/mario/yoshiyellow.gif width=31 height=32><br>Yellow Yoshi'),
(11, 3700, '<img src=images/ranks/mario/yoshiblue.gif width=36 height=35><br>Blue Yoshi'),
(11, 3800, '<img src=images/ranks/mario/yoshired.gif width=33 height=36><br>Red Yoshi'),
(11, 3900, '<img src=images/ranks/mario/kingyoshi.gif width=24 height=34><br>King Yoshi'),
(11, 4000, '<img src=images/ranks/mario/babymario.gif width=28 height=24><br>Baby Mario'),
(11, 4100, '<img src=images/ranks/mario/luigismall.gif width=15 height=22><br>Luigi'),
(11, 4200, '<img src=images/ranks/mario/mariosmall.gif width=15 height=20><br>Mario'),
(11, 4300, '<img src=images/ranks/mario/luigibig.gif width=16 height=30><br>Super Luigi'),
(11, 4400, '<img src=images/ranks/mario/mariobig.gif width=16 height=28><br>Super Mario'),
(11, 4500, '<img src=images/ranks/mario/luigifire.gif width=16 height=30><br>Fire Luigi'),
(11, 4600, '<img src=images/ranks/mario/mariofire.gif width=16 height=28><br>Fire Mario'),
(11, 4700, '<img src=images/ranks/mario/luigicape.gif width=26 height=30><br>Cape Luigi'),
(11, 4800, '<img src=images/ranks/mario/mariocape.gif width=26 height=28><br>Cape Mario'),
(11, 4900, '<img src=images/ranks/mario/luigistar.gif width=16 height=30><br>Star Luigi'),
(11, 5000, '<img src=images/ranks/mario/mariostar.gif width=16 height=28><br>Star Mario');

-- --------------------------------------------------------

--
-- Table structure for table `ranksets`
--

CREATE TABLE IF NOT EXISTS `ranksets` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ranksets`
--

INSERT INTO `ranksets` (`id`, `name`) VALUES
(0, 'None'),
(1, 'Default'),
(2, 'TGM'),
(11, 'Mario'),
(255, 'Dots');

-- --------------------------------------------------------

--
-- Table structure for table `referer`
--

CREATE TABLE IF NOT EXISTS `referer` (
  `time` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referer`
--


-- --------------------------------------------------------

--
-- Table structure for table `rendertimes`
--

CREATE TABLE IF NOT EXISTS `rendertimes` (
  `page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `querycount` int(11) NOT NULL,
  `cachecount` int(11) NOT NULL,
  `querytime` double NOT NULL,
  `scripttime` double NOT NULL,
  `rendertime` double NOT NULL,
  KEY `page` (`page`(191)),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rendertimes`
--


-- --------------------------------------------------------

--
-- Table structure for table `rpg_classes`
--

CREATE TABLE IF NOT EXISTS `rpg_classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` tinyint(4) unsigned DEFAULT NULL,
  `minpowerselect` tinyint(4) DEFAULT NULL,
  `HP` float unsigned NOT NULL DEFAULT '1',
  `MP` float unsigned NOT NULL DEFAULT '1',
  `Atk` float unsigned NOT NULL DEFAULT '1',
  `Def` float unsigned NOT NULL DEFAULT '1',
  `Int` float unsigned NOT NULL DEFAULT '1',
  `MDf` float unsigned NOT NULL DEFAULT '1',
  `Dex` float unsigned NOT NULL DEFAULT '1',
  `Lck` float unsigned NOT NULL DEFAULT '1',
  `Spd` float unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `sex` (`sex`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rpg_classes`
--

INSERT INTO `rpg_classes` (`id`, `name`, `sex`, `minpowerselect`, `HP`, `MP`, `Atk`, `Def`, `Int`, `MDf`, `Dex`, `Lck`, `Spd`) VALUES
(1, 'Tyrant', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 'Demoness Overlord', NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rpg_inventory`
--

CREATE TABLE IF NOT EXISTS `rpg_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` mediumint(9) NOT NULL,
  `itemid` int(11) NOT NULL,
  `equippedto` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rpg_inventory`
--


-- --------------------------------------------------------

--
-- Table structure for table `schemes`
--

CREATE TABLE IF NOT EXISTS `schemes` (
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ord` smallint(5) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `special` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schemes`
--

INSERT INTO `schemes` (`id`, `ord`, `name`, `file`, `special`) VALUES
(0, 1, 'Night', 'night.php', 0),
(1, 3, 'Red Night (Drag)', 'rednight.php', 0),
(2, 2, 'The Com Port (BMF)', 'comport.php', 0),
(3, 4, 'Christmas', 'xmas.php', 0),
(4, 5, 'Cuppycakes13', 'cuppycakes.php', 0),
(5, 6, 'Hydra''s Blue Thing', 'hydras_blue_thing.php', 0),
(6, 7, 'Mario Movie', 'mariomovie.php', 0),
(7, 8, 'Hydra''s Blue Thing (Alternate)', 'hydras_blue_thing_alt.php', 0),
(8, 9, 'Purple', 'purple.php', 0),
(9, 10, 'Kafuka', 'kafuka.php', 0),
(10, 11, 'The Horrible Forced Scheme', 'ccs.php', 0),
(12, 12, 'Green Night (Bloodstar)', 'greennight.php', 0),
(13, 13, 'GarBG (FirePhoenix)', 'garbg.php', 0),
(14, 14, 'Darkest Night (Tyty)', 'dnss.php', 0),
(15, 15, 'Fragmentation II', 'fragmentation2.php', 0),
(16, 16, 'Summer Dreams', 'ymar.php', 0),
(20, 20, 'Desolation', 'desolation.php', 0),
(21, 22, 'Pinstripe Blue (Treeki)', 'pinstripe.php', 0),
(42, 23, 'The Lazy Null Scheme', 'null.php', 0),
(101, 21, 'Hydra''s Blue Thing (V2)', 'hydras_blue_thing_v2.php', 0),
(150, 150, 'AE Torture', 'aesucks.php', 1),
(151, 151, 'Daily Cycle', 'dailycycle.php', 1),
(202, 202, 'Attitude Barn', 'spec-attitude.php', 1),
(203, 203, 'Black Hole', 'spec-blackhole.php', 1),
(204, 204, 'Subcon', 'spec-subcon.php', 1),
(205, 205, 'Top Secret', 'spec-topsecret.php', 1),
(206, 206, 'Trolldra', 'spec-trolldra.php', 1),
(207, 207, 'Waffles', 'spec-waffle.php', 1),
(208, 208, 'The Zen', 'spec-zen.php', 1),
(209, 209, 'Unfiction', 'spec-unfiction.php', 1);

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE IF NOT EXISTS `threads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(5) unsigned NOT NULL DEFAULT '0',
  `closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `replies` smallint(5) unsigned NOT NULL DEFAULT '0',
  `firstpostdate` int(11) DEFAULT '0',
  `lastpostdate` int(10) NOT NULL DEFAULT '0',
  `lastposter` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `poll` smallint(5) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `announcement` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forum` (`forum`),
  KEY `user` (`user`),
  KEY `sticky` (`sticky`),
  KEY `pollid` (`poll`),
  KEY `lastpostdate` (`lastpostdate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threads`
--


-- --------------------------------------------------------

--
-- Table structure for table `threadsread`
--

CREATE TABLE IF NOT EXISTS `threadsread` (
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `read` tinyint(4) NOT NULL,
  UNIQUE KEY `combo` (`uid`,`tid`),
  KEY `read` (`read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `threadsread`
--


-- --------------------------------------------------------

--
-- Table structure for table `tinapoints`
--

CREATE TABLE IF NOT EXISTS `tinapoints` (
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` int(11) NOT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tinapoints`
--


-- --------------------------------------------------------

--
-- Table structure for table `tlayouts`
--

CREATE TABLE IF NOT EXISTS `tlayouts` (
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ord` smallint(5) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tlayouts`
--

INSERT INTO `tlayouts` (`id`, `ord`, `name`, `file`) VALUES
(1, 0, 'Regular', 'regular'),
(2, 2, 'Compact', 'compact'),
(3, 99, 'Hydra''s Layout&trade;', 'hydra'),
(4, 1, 'Regular with numgfx', 'regular');

-- --------------------------------------------------------

--
-- Table structure for table `tor`
--

CREATE TABLE IF NOT EXISTS `tor` (
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed` tinyint(4) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tor`
--


-- --------------------------------------------------------

--
-- Table structure for table `tournamentplayers`
--

CREATE TABLE IF NOT EXISTS `tournamentplayers` (
  `tid` mediumint(9) NOT NULL,
  `pid` mediumint(9) NOT NULL,
  `cmt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tournamentplayers`
--


-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE IF NOT EXISTS `tournaments` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `postid` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `scorehide` tinyint(4) NOT NULL,
  `scoretype` tinyint(4) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `organizer` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tournaments`
--


-- --------------------------------------------------------

--
-- Table structure for table `userpic`
--

CREATE TABLE IF NOT EXISTS `userpic` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `categ` smallint(5) unsigned NOT NULL DEFAULT '0',
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `categ` (`categ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userpic`
--


-- --------------------------------------------------------

--
-- Table structure for table `userpiccateg`
--

CREATE TABLE IF NOT EXISTS `userpiccateg` (
  `id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `page` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userpiccateg`
--


-- --------------------------------------------------------

--
-- Table structure for table `userratings`
--

CREATE TABLE IF NOT EXISTS `userratings` (
  `userfrom` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userrated` smallint(5) unsigned NOT NULL DEFAULT '0',
  `rating` smallint(5) NOT NULL DEFAULT '0',
  KEY `userrated` (`userrated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userratings`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `posts` mediumint(9) NOT NULL DEFAULT '0',
  `regdate` int(11) NOT NULL DEFAULT '0',
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `loginname` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `minipic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `picture` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `moodurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postheader` text COLLATE utf8mb4_unicode_ci,
  `signature` text COLLATE utf8mb4_unicode_ci,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `powerlevel` tinyint(2) NOT NULL DEFAULT '0',
  `powerlevel_prev` tinyint(2) NOT NULL DEFAULT '0',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `oldsex` tinyint(4) NOT NULL DEFAULT '-1',
  `namecolor` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namecolor_bak` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `useranks` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleoption` tinyint(1) NOT NULL DEFAULT '1',
  `realname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `birthday` int(11) NOT NULL DEFAULT '0',
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `privateemail` tinyint(3) NOT NULL DEFAULT '0',
  `aim` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `icq` int(10) unsigned NOT NULL DEFAULT '0',
  `imood` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `homepageurl` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `homepagename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastposttime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastactivity` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lasturl` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastforum` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `postsperpage` smallint(4) unsigned NOT NULL DEFAULT '0',
  `threadsperpage` smallint(4) unsigned NOT NULL DEFAULT '0',
  `timezone` float NOT NULL DEFAULT '0',
  `scheme` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `layout` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `viewsig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `posttool` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `signsep` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagestyle` tinyint(4) NOT NULL DEFAULT '0',
  `pollstyle` tinyint(4) NOT NULL DEFAULT '0',
  `profile_locked` tinyint(1) NOT NULL DEFAULT '0',
  `editing_locked` tinyint(1) NOT NULL DEFAULT '0',
  `uploads_locked` tinyint(1) NOT NULL DEFAULT '0',
  `avatar_locked` tinyint(1) NOT NULL DEFAULT '0',
  `influence` int(10) unsigned NOT NULL DEFAULT '1',
  `lastannouncement` int(11) NOT NULL DEFAULT '0',
  `dateformat` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateshort` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aka` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hideactivity` tinyint(1) NOT NULL DEFAULT '0',
  `ban_expire` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `posts` (`posts`),
  KEY `name` (`name`),
  KEY `lastforum` (`lastforum`),
  KEY `lastposttime` (`lastposttime`),
  KEY `lastactivity` (`lastactivity`),
  KEY `powerlevel` (`powerlevel`),
  KEY `sex` (`sex`),
  KEY `ban_expire` (`ban_expire`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--


-- --------------------------------------------------------

--
-- Table structure for table `users_avatars`
--

CREATE TABLE IF NOT EXISTS `users_avatars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` smallint(5) unsigned NOT NULL,
  `user` int(11) NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `weblink` varchar(127) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_2` (`file`,`user`),
  KEY `user` (`user`),
  KEY `file` (`file`),
  KEY `hidden` (`hidden`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_avatars`
--


-- --------------------------------------------------------

--
-- Table structure for table `users_rpg`
--

CREATE TABLE IF NOT EXISTS `users_rpg` (
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `class` int(11) NOT NULL DEFAULT '0',
  `damage` bigint(20) NOT NULL DEFAULT '0',
  `spent` int(11) NOT NULL DEFAULT '0',
  `gcoins` int(11) NOT NULL DEFAULT '0',
  `eq1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `eq2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `eq3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `eq4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `eq5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `eq6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `eq7` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_rpg`
--
