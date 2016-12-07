<?php
$module_name = 'RT_Interviews';
$listViewDefs [$module_name] = 
array (
  'NAME' =>
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'RT_CANDIDATE_NAME' =>
  array (
    'type' => 'relate',
//    'link' => 'rt_interviews_rt_candidates',
    'link' => true,
    'label' => 'LBL_RT_CANDIDATE_NAME',
    'width' => '10%',
    'default' => true,
  ),
  'RT_VACANCY_NAME' =>
  array (
    'type' => 'varchar',
    'default' => true,
    'label' => 'LBL_VACANCY_NAME',
    'width' => '10%',
  ),
  'DATE_OF_INTERVIEW_C' => 
  array (
    'type' => 'date',
    'default' => true,
    'label' => 'LBL_DATE_OF_INTERVIEW',
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
  'SCORE_C' => 
  array (
    'type' => 'int',
    'default' => true,
    'link' => true,
    'label' => 'LBL_SCORE',
    'width' => '10%',
  ),
//  'ASSIGNED_USER_NAME' =>
//  array (
//    'width' => '9%',
//    'label' => 'LBL_ASSIGNED_TO_NAME',
//    'module' => 'Employees',
//    'id' => 'ASSIGNED_USER_ID',
//    'default' => false,
//  ),
);
?>
