<?php
$module_name = 'RT_Time_Tracker';
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
          3 => 'FIND_DUPLICATES',
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
      'tabDefs' => 
      array (
        'DEFAULT' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
    ),
    'panels' => 
    array (
      'default' => 
      array (
        0 => 
        array (
          0 => 'name',
          1 => 'date_entered',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'date_start',
            'label' => 'LBL_CHECK_IN_TIME',
          ),
          1 => 
          array (
            'name' => 'date_end',
            'label' => 'LBL_CHECKOUT_TIME',
          ),
        ),

          2 =>
              array (
                  0 => array(
                      'name' => 'duration',
                      'customCode' => '{$fields.duration_hours.value}{$MOD.LBL_HOURS_ABBREV} {$fields.duration_minutes.value}{$MOD.LBL_MINSS_ABBREV} ',
                      'label' => 'LBL_DURATION',
                  ),
                  1 => '',
              ),

        3 =>
        array (
          0 => 
          array (
            'name' => 'rt_time_tracker_rt_employees_name',
          ),
          1 => 'assigned_user_name',
        ),

      ),
    ),
  ),
);
?>
