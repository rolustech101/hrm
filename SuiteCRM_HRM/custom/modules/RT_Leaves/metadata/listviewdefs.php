<?php
$module_name = 'RT_Leaves';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'RT_EMPLOYEES_RT_LEAVES_NAME' =>
  array (
    'type' => 'relate',
    'link' => 'rt_employees_rt_leaves',
    'label' => 'LBL_A_EMPLOYEES_A_LEAVES_FROM_A_EMPLOYEES_TITLE',
    'width' => '10%',
    'default' => true,
  ),
  'LEAVE_TYPE_C' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_LEAVE_TYPE',
    'width' => '10%',
  ),
  'LEAVE_START_DATE_C' =>
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_FROM_DATE',
    'width' => '10%',
  ),
  'TO_DATE_C' => 
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_TO_DATE',
    'width' => '10%',
  ),
  'COUNT_DAYS_C' =>
  array (
    'type' => 'int',
    'default' => true,
    'label' => 'LBL_NUMBER_OF_DAYS',
    'width' => '10%',
  ),
  'STATUS_C' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_STATUS',
    'width' => '10%',
  ),
  'COMMENTS_C' => 
  array (
    'type' => 'text',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_COMMENTS',
    'sortable' => false,
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
  'ACTION_C' => 
  array (
    'type' => 'enum',
    'default' => false,
    'studio' => 'visible',
    'label' => 'LBL_ACTION',
    'width' => '10%',
  ),
);
?>
