-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 05, 2016 at 08:14 PM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.36

--
-- Triggers `rt_job_application`
--
DROP TRIGGER IF EXISTS `before_rt_job_application_insert`;
DELIMITER //
CREATE TRIGGER `before_rt_job_application_insert` BEFORE INSERT ON `rt_job_application`
 FOR EACH ROW BEGIN  

SET NEW.name = fn_autoincrementvalue('rt_job_application');

END
//
DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
