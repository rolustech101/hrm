<?php
$module_name = 'RT_Employees';
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
    ),
    'panels' => 
    array (
      'default' => 
      array (
        0 => 
        array (
          0 => 'full_name',
          1 => 'phone_work',
        ),
        1 => 
        array (
          0 => 'title',
          1 => 'phone_mobile',
        ),
        2 => 
        array (
          0 => 'department',
          1 => 'phone_home',
        ),
        3 => 
        array (
          0 => 'phone_other',
        ),
        4 => 
        array (
          0 => 'date_entered',
          1 => 'phone_fax',
        ),
        5 => 
        array (
          0 => 'date_modified',
          1 => 'do_not_call',
        ),
        6 => 
        array (
          0 => 'assigned_user_name',
        ),
        7 => 
        array (
          0 => 'email1',
        ),
        8 => 
        array (
          0 => 'primary_address_street',
          1 => 'alt_address_street',
        ),
        9 => 
        array (
          0 => 'description',
          1 => 
          array (
            'name' => 'rt_employees_rt_employees_name',
          ),
        ),
        10 => 
        array (
          0 => 
          array (
            'name' => 'rt_departments_rt_employees_name',
          ),
        ),
      ),
    ),
  ),
);
?>
