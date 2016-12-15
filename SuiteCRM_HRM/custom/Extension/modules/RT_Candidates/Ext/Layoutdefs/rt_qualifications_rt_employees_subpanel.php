<?php
 // created: 2016-10-17 14:14:49
$layout_defs["RT_Candidates"]["subpanel_setup"]['rt_qualifications'] = array (
  'order' => 100,
  'module' => 'RT_Qualifications',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_QUALIFICATIONS_FROM_QUALIFICATIONS_TITLE',
  'get_subpanel_data' => 'rt_qualifications',
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
