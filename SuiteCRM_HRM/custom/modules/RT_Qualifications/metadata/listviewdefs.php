<?php
$module_name = 'RT_Qualifications';
$listViewDefs [$module_name] =
array (
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'PARENT_NAME' =>
  array (
    'type' => 'parent',
    'label' => 'LBL_RT_QUALIFICATIONS',
    'width' => '10%',
    'default' => true,
  ),
  'QUALIFICATION_TYPE_C' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_QUALIFICATION_TYPE',
    'width' => '10%',
    //'link' => true,
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
