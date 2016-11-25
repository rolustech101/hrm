<?php
// created: 2012-01-17 11:23:21
$subpanel_layout['list_fields'] = array (
  'leave_type_c' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'vname' => 'LBL_LEAVE_TYPE',
    'width' => '10%',
  ),
  'from_date_c' => 
  array (
    'type' => 'date',
    'default' => true,
    'vname' => 'LBL_FROM_DATE',
    'width' => '10%',
  ),
  'to_date_c' => 
  array (
    'type' => 'date',
    'default' => true,
    'vname' => 'LBL_TO_DATE',
    'width' => '10%',
  ),
  'number_of_days_c' => 
  array (
    'type' => 'int',
    'default' => true,
    'vname' => 'LBL_NUMBER_OF_DAYS',
    'width' => '10%',
  ),
  'status_c' => 
  array (
    'type' => 'enum',
    'default' => true,
    'studio' => 'visible',
    'vname' => 'LBL_STATUS',
    'width' => '10%',
  ),
  'remove_button' => 
  array (
    'widget_class' => 'SubPanelRemoveButton',
    'module' => 'RT_Leaves',
    'width' => '5%',
    'default' => true,
  ),
  'edit_button' => 
  array (
    'widget_class' => 'SubPanelEditButton',
    'module' => 'RT_Leaves',
    'width' => '4%',
    'default' => true,
  ),
);
?>
