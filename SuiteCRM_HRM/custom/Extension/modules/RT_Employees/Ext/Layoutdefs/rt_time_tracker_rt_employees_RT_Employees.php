<?php
 // created: 2017-01-10 11:55:34
$layout_defs["RT_Employees"]["subpanel_setup"]['rt_time_tracker_rt_employees'] = array (
  'order' => 100,
  'module' => 'RT_Time_Tracker',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_TIME_TRACKER_RT_EMPLOYEES_FROM_RT_TIME_TRACKER_TITLE',
  'get_subpanel_data' => 'rt_time_tracker_rt_employees',
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
