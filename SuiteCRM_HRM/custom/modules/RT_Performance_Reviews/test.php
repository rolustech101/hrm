<?php
$url = $_SERVER['SCRIPT_FILENAME']; //. dirname(__FILE__);
//echo $url;
echo SUGAR_PATH.DIRECTORY_SEPARATOR;
$array = explode('/', $url);
$count = count($array);
echo "\n";
echo ""
//echo $array[$count - 1];
?>