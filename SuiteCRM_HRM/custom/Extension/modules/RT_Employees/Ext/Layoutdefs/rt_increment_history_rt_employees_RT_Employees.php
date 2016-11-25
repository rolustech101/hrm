<?php
 // created: 2016-11-10 12:03:21
$layout_defs["RT_Employees"]["subpanel_setup"]['rt_increment_history_rt_employees'] = array (
  'order' => 100,
  'module' => 'RT_Increment_History',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_INCREMENT_HISTORY_RT_EMPLOYEES_FROM_RT_INCREMENT_HISTORY_TITLE',
  'get_subpanel_data' => 'rt_increment_history_rt_employees',
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
