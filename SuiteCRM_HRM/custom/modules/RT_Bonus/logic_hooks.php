<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;

$hook_array = array();
$hook_array['before_save'] = array();
$hook_array['before_save'][] = array(1, 'makename', 'custom/modules/RT_Bonus/Make.php', 'Make', 'makename');
$hook_array['process_record'] = array();
$hook_array['process_record'][] = array(
    1,
    'add module name',
    'custom/modules/RT_Bonus/AddName_RT_Bonus.php',
    'AddName_RT_Bonus',
    'add_name'
);


?>
