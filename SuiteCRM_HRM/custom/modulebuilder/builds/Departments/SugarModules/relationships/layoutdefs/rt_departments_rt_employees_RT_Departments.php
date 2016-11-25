<?php
 // created: 2016-11-10 17:55:02
$layout_defs["RT_Departments"]["subpanel_setup"]['rt_departments_rt_employees'] = array (
  'order' => 100,
  'module' => 'RT_Employees',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_DEPARTMENTS_RT_EMPLOYEES_FROM_RT_EMPLOYEES_TITLE',
  'get_subpanel_data' => 'rt_departments_rt_employees',
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
