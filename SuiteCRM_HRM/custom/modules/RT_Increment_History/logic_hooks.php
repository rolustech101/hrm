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
$hook_array['process_record'] = array();
$hook_array['process_record'][] = array(
    1,
    'add module name',
    'custom/modules/RT_Increment_History/AddName_RT_Increment_History.php',
    'AddName_RT_Increment_History',
    'add_name'
);


?>