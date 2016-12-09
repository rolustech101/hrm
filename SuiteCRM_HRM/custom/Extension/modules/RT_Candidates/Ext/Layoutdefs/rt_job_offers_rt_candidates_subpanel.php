<?php
$layout_defs["RT_Candidates"]["subpanel_setup"]['rt_job_offers'] = array (
  'order' => 100,
  'module' => 'RT_Job_Offers',
  'subpanel_name' => 'default',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_JOB_OFFERS_RT_CANDIDATES_JOB_OFFERS_TITLE',
  'get_subpanel_data' => 'rt_job_offers',
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
