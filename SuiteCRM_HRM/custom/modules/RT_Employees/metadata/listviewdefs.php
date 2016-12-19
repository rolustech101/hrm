<?php
$module_name = 'RT_Employees';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '20%',
    'label' => 'LBL_NAME',
    'link' => true,
    'orderBy' => 'last_name',
    'default' => true,
    'related_fields' => 
    array (
      0 => 'first_name',
      1 => 'last_name',
      2 => 'salutation',
    ),
  ),
  'rt_employees_rt_jobs_name_c' =>
  array (
    'label' => 'RT_EMPLOYEES_RT_JOB_NAME_C',
    'width' => '10%',
    'default' => true,
  ),
  'EMPLOYMENT_STATUS' => 
  array (
    'type' => 'enum',
    'studio' => 'visible',
    'label' => 'LBL_EMPLOYMENT_STATUS',
    'width' => '10%',
    'default' => true,
  ),
  'EMPLOYMENT_TYPE_C' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_EMPLOYMENT_TYPE',
    'width' => '10%',
  ),
  'DATE_ENTERED' => 
  array (
    'width' => '10%',
    'label' => 'LBL_DATE_ENTERED',
    'default' => true,
  ),
);
?>
