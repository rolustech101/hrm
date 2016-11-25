<?php
 // created: 2016-10-17 14:14:49
$layout_defs["RT_Payroll"]["subpanel_setup"]['rt_employees_rt_payroll'] = array (
  'order' => 100,
  'module' => 'RT_Employees',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_EMPLOYEES_RT_PAYROLL_FROM_RT_PAYROLL_TITLE',
  'get_subpanel_data' => 'rt_employees_rt_payroll',
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
