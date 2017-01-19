<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;
$hook_array = array();
$hook_array['process_record'] = array();
$hook_array['process_record'][] = array(
    1,
    'AddPrintButton',
    'custom/modules/RT_Payroll/AddPrintButton.php',
    'AddPrintButton',
    'add_print'
);

$hook_array['process_record'][] = array(
    2,
    'add module name',
    'custom/modules/RT_Payroll/AddName_RT_Payroll.php',
    'AddName_RT_Payroll',
    'add_name'
);


?>