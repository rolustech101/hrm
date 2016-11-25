<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;
$hook_array = array();
$hook_array['before_save'] = array();
$hook_array['before_save'][] = array(
    1,
    'increment',
    'custom/modules/RT_Increment_History/IncrementSalary.php',
    'IncrementSalary',
    'increment'
);


?>