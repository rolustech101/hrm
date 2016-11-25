<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;
$hook_array = array();
//$hook_array['after_retrieve'] = array();	 
//$hook_array['after_retrieve'][] = array(1, 'count_leave', 'custom/modules/RT_Employees/CountLeave.php', 'CountLeave', 'count_leave');
$hook_array['before_save'] = array();
//$hook_array['before_save'][] = array(1, 'entitleleaves', 'custom/modules/RT_Employees/LeavesEntitled.php', 'LeavesEntitled', 'entitleleaves');
$hook_array['before_save'][] = array(
    1,
    'serialize_salary',
    'custom/modules/RT_Employees/Salary.php',
    'Salary',
    'serialize_salary'
);
$hook_array['before_save'][] = array(
    2,
    'balance_update',
    'custom/modules/RT_Employees/balance_update.php',
    'BalanceUpdate',
    'update_balance'
);
$hook_array['before_save'][] = array(
    3,
    'salary_update',
    'custom/modules/RT_Employees/salary_update.php',
    'SalaryUpdate',
    'update_salary'
);
$hook_array['after_retrieve'][] = array(
    1,
    'unserialize_salary',
    'custom/modules/RT_Employees/UnSerializeSalary.php',
    'UnSerializeSalary',
    'unserialize_salary'
);



?>