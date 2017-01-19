<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;
$hook_array = array();
$hook_array['process_record'] = array();
$hook_array['process_record'][] = array(
    1,
    'add module name',
    'custom/modules/RT_Job_Application/MakeLinkable.php',
    'MakeLinkable',
    'make_link'
);


?>