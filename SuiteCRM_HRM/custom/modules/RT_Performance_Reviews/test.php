<?php
//
//echo $_SERVER['DOCUMENT_ROOT'];
//echo readlink($_SERVER['DOCUMENT_ROOT']);
echo "\n";
//echo $sugar_config['instance_url'];
//echo $_SERVER['DOCUMENT_ROOT'].'/'. $sugar_config['instance_url']. '/review_forms';
global $timedate;

$timedate->getInstance()->userTimezone(); // Time Zone

$CurrenrDateTime = $timedate->getInstance()->nowDb(); //This will give database datetime ...

$CurrenrDateTime1 = $timedate->now(); // Actual Time....
echo $CurrenrDateTime1;
?>