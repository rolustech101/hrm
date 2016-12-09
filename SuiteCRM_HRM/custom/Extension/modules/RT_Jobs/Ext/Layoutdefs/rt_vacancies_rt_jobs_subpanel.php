<?php
$layout_defs["RT_Jobs"]["subpanel_setup"]['rt_vacancies'] = array (
  'order' => 100,
  'module' => 'RT_Vacancies',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_VACANCIES_RT_JOBS_FROM_VACANCIES_RT_TITLE',
  'get_subpanel_data' => 'rt_vacancies',
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
