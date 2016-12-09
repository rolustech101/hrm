<?php
$module_name = 'RT_Vacancies';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'JOB_NAME' =>
  array (
    'type' => 'relate',
    'default' => true,
    'label' => 'LBL_JOB_NAME',
    'width' => '10%',
    'link' => true,
  ),
  'DEPARTMENT_C' =>
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_DEPARTMENT',
    'width' => '10%',
  ),
  'POSITIONS_C' => 
  array (
    'type' => 'int',
    'default' => true,
    'label' => 'LBL_POSITIONS',
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
  'DATE_ENTERED' => 
  array (
    'type' => 'datetime',
    'label' => 'LBL_DATE_ENTERED',
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
);
?>
