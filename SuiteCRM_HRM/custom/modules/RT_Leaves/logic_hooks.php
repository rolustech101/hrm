<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;

$hook_array = array();
$hook_array['before_save'] = array();
$hook_array['before_save'][] = array(
    1,
    'entitled leaves',
    'custom/modules/RT_Leaves/UpdateEntitledLeaves.php',
    'UpdateEntitledLeaves',
    'update_leaves'
);
$hook_array['before_save'][] = array(
    2,
    'update name',
    'custom/modules/RT_Leaves/UpdateName.php',
    'UpdateName',
    'update_name'
);
$hook_array['process_record'] = array();
$hook_array['process_record'][] = array(
    1,
    'add module name',
    'custom/modules/RT_Leaves/AddName_RT_Leaves.php',
    'AddName_RT_Leaves',
    'add_name'
);

?>