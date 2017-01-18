<?php
 // created: 2017-01-16 12:28:43
$layout_defs["RT_Interviews"]["subpanel_setup"]['rt_interviews_rt_employees_1'] = array (
  'order' => 100,
  'module' => 'RT_Employees',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_INTERVIEWS_RT_EMPLOYEES_1_FROM_RT_EMPLOYEES_TITLE',
  'get_subpanel_data' => 'rt_interviews_rt_employees_1',
  'top_buttons' => 
  array (
    0 => 
    array (
      'widget_class' => 'SubPanelTopButtonQuickCreate',
    ),
    1 => 
    array (
      'widget_class' => 'SubPanelTopSelectButton',
      'mode' => 'MultiSelect',
    ),
  ),
);
