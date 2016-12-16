<?php
$module_name = 'RT_Increment_History';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
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
      'default' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'rt_increment_history_rt_employees_name',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'increment_type',
            'label' => 'LBL_INCREMENT_TYPE',
          ),
          1 => '',
        ),
          2 =>
        array (
          0 =>
          array (
            'name' => 'increment_c',
            'label' => 'LBL_INCREMENT',
          ),
          1 => '',
        ),
        3 =>
        array (
          0 => 
          array (
            'name' => 'increment_date_c',
            'label' => 'LBL_INCREMENT_DATE',
          ),
          1 => '',
        ),
        4 =>
        array (
          0 => 'description',
        ),
      ),
    ),
  ),
);
?>
