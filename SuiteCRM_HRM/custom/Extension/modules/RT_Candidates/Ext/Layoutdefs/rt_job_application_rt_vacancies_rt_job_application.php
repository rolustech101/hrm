<?php
$layout_defs["RT_Candidates"]["subpanel_setup"]['rt_job_application_c'] = array (
  'order' => 100,
  'module' => 'RT_Job_Application',
  'subpanel_name' => 'ForCandidate',
  'sort_order' => 'asc',
  'sort_by' => 'id',
  'title_key' => 'LBL_RT_JOB_APPLICATION_RT_CANDIDATES_FROM_RT_JOB_APPLICATION_TITLE',
  'get_subpanel_data' => 'rt_job_application_c',
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
