<?php
if (!defined('sugarEntry') || !sugarEntry){
   define('sugarEntry',true);
}//$originalDate = "2010-03-21";
require_once 'include/TimeDate.php';
$originalDate = "2001-03-10 17:16:18";
$aa = to_display_date_time($originalDate);
$newDate = date("F j, Y, g:i a", strtotime($aa));
//date("F j, Y, g:i a");
echo $newDate;
?>
