<?php
 // created: 2016-11-09 19:01:06
$layout_defs["RT_Employees"]["subpanel_setup"]['rt_bonus_rt_employees'] = array (
  'order' => 100,
  'module' => 'RT_Bonus',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_BONUS_RT_EMPLOYEES_FROM_RT_BONUS_TITLE',
  'get_subpanel_data' => 'rt_bonus_rt_employees',
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
