<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;

$hook_array = array();
$hook_array['before_save'] = array();
$hook_array['before_save'][] = array(1, 'genfile', 'custom/modules/RT_Departments/MakeFile.php', 'MakeFile', 'genfile');
$hook_array['process_record'] = array();
$hook_array['process_record'][] = array(
    1,
    'updatedepartment',
    'custom/modules/RT_Departments/UpdateDepartment.php',
    'UpdateDepartment',
    'update_department'
);
$hook_array['after_retrieve'] = array();
$hook_array['after_retrieve'][] = array(
    1,
    'updatedepartment logic hook',
    'custom/modules/RT_Departments/UpdateDepartment.php',
    'UpdateDepartment',
    'update_department'
);

?>