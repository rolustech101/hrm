<?php
$module_name = 'RT_Bonus';
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
      'default' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'rt_employees_rt_bonus_name',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'amount',
            'comment' => 'Bonus Amount',
            'label' => 'LBL_AMOUNT',
          ),
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'bonus_date',
            'comment' => 'Bonus Date',
            'label' => 'LBL_DATE',
          ),
        ),
          3 =>
        array (
          0 =>
          array (
            'name' => 'assigned_user_name',
          ),
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
