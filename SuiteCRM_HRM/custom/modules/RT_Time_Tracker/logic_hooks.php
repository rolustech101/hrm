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
$hook_array['before_save'][] = array(
    2,
    'calculate total hours',
    'custom/modules/RT_Time_Tracker/CalculateTotalHours.php',
    'CalculateTotalHours',
    'calculate_hours'
);


?>