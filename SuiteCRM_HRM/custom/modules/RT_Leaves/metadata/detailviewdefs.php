<?php
$module_name = 'RT_Leaves';
$viewdefs [$module_name] = 
array (
  'DetailView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'buttons' => 
        array (
          0 => 'EDIT',
          1 => 'DUPLICATE',
          2 => 'DELETE',
        ),
      ),
      'maxColumns' => '2',
      'widths' => 
      array (
        0 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
        1 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
      ),
      'useTabs' => false,
    ),
    'panels' => 
    array (
      'lbl_detailview_panel2' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'rt_employees_rt_leaves_name',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'leave_type_c',
            'studio' => 'visible',
            'label' => 'LBL_LEAVE_TYPE',
          ),
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'leave_start_date_c',
            'label' => 'LBL_FROM_DATE',
          ),
          1 => '',
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'to_date_c',
            'label' => 'LBL_TO_DATE',
          ),
          1 => '',
        ),
        4 => 
        array (
          0 => 
          array (
              'name' => 'count_days_c',
              'label' => 'LBL_COUNT_DAYS',
          ),
          1 => '',
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'status_c',
            'studio' => 'visible',
            'label' => 'LBL_STATUS',
          ),
          1 => 
          array (
            'name' => 'comments_c',
            'studio' => 'visible',
            'label' => 'LBL_COMMENTS',
          ),
        ),
          6 =>
        array (
          0 =>
          array (
            'name' => 'assigned_user_name',
          ),
          1 =>
          array (
            '',
          ),
        ),
        7 =>
        array (
          0 => '',
          1 => '',
        ),
      ),
    ),
  ),
);
?>
