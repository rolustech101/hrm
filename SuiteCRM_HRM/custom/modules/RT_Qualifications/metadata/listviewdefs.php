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
//  'PARENT_NAME' =>
//  array (
//    'type' => 'parent',
//    'label' => 'LBL_RT_QUALIFICATIONS',
//    'width' => '32%',
//    'default' => true,
//      'link' => true,
//  ),

  'QUALIFICATION_TYPE_C' =>
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'label' => 'LBL_QUALIFICATION_TYPE',
    'width' => '10%',
  ),
    'DATE_ENTERED'  => array(
        'width' => '9',
        'label' => 'LBL_DATE_ENTERED',
        'default' => true),
);
?>
