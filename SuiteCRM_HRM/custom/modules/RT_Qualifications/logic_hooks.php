<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;
$hook_array = array();
$hook_array['before_save'] = array();
$hook_array['before_save'][] = array(
    1,
    'update name',
    'custom/modules/RT_Qualifications/UpdateName.php',
    'UpdateName',
    'update_name'
);

?>