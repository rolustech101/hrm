<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;
$hook_array = array();
$hook_array['before_save'] = array();
$hook_array['before_save'][] = array(
    1,
    'Update name of time tracker',
    'custom/modules/RT_Time_Tracker/UpdateTracker.php',
    'UpdateTracker',
    'update_name'
);
$hook_array['process_record'] = array();
$hook_array['process_record'][] = array(
    1,
    'Shows duration in the listview',
    'custom/modules/RT_Time_Tracker/ShowDuration.php',
    'ShowDuration',
    'show'
);


?>