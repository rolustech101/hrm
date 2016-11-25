<?php
$module_name = 'RT_Bonus';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'rt_employees_rt_bonus_name' =>
  array (
    'type' => 'relate',
    'link' => 'rt_employees_rt_bonus',
    'label' => 'LBL_RT_EMPLOYEES_RT_BONUS_FROM_RT_EMPLOYEES_TITLE',
    'width' => '10%',
    'default' => true,
  ),
  'AMOUNT' => 
  array (
    'type' => 'int',
    'label' => 'LBL_AMOUNT',
    'width' => '10%',
    'default' => true,
  ),
  'BONUS_DATE' => 
  array (
    'type' => 'datetime',
    'label' => 'LBL_DATE',
    'width' => '10%',
    'default' => true,
  ),
  'ASSIGNED_USER_NAME' => 
  array (
    'width' => '9%',
    'label' => 'LBL_ASSIGNED_TO_NAME',
    'module' => 'Employees',
    'id' => 'ASSIGNED_USER_ID',
    'default' => false,
  ),
  'DATE' => 
  array (
    'type' => 'datetime',
    'label' => 'LBL_DATE',
    'width' => '10%',
    'default' => false,
  ),
);
?>
