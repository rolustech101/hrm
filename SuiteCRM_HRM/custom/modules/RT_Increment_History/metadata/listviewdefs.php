<?php
$module_name = 'RT_Increment_History';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'rt_increment_history_rt_employees_name' =>
  array (
    'type' => 'relate',
    'link' => 'rt_increment_history_rt_employees',
    'label' => 'LBL_RT_EMPLOYEES_RT_INCREMENT_HISTORY_FROM_RT_EMPLOYEES_TITLE',
    'width' => '10%',
    'default' => true,
  ),
  'INCREMENT_C' => 
  array (
    'type' => 'int',
    'default' => true,
    'label' => 'LBL_INCREMENT',
    'width' => '10%',
  ),
  'INCREMENT_DATE_C' => 
  array (
    'type' => 'datetimecombo',
    'default' => true,
    'label' => 'LBL_INCREMENT_DATE',
    'width' => '10%',
  ),
  'NEXT_INCREMENT_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_NEXT_INCREMENT',
    'width' => '10%',
  ),
  'STATUS_C' => 
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_STATUS',
    'width' => '10%',
  ),
  'ASSIGNED_USER_NAME' => 
  array (
    'width' => '9%',
    'label' => 'LBL_ASSIGNED_TO_NAME',
    'module' => 'Employees',
    'id' => 'ASSIGNED_USER_ID',
    'default' => false,
  ),
);
?>
