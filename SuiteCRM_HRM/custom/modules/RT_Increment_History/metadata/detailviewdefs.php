<?php
$module_name = 'RT_Increment_History';
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
          3 =>
          array (
            'customCode' => '<input title="Click to Apply Increment" class="button" type="button" name="apply" value="Apply" onclick="applyincrement(\'{$fields.id.value}\', \'{$fields.rt_increment_history_rt_employeesrt_employees_ida.value}\', \'{$fields.increment_date_c.value}\',\'{$fields.increment_type.value}\')">',
          ),
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
        'includes' =>
            array (
                0 =>
                    array (
                        'file' => 'custom/modules/RT_Increment_History/funcs.js',
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
          0 => 'name',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'rt_increment_history_rt_employees_name',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
              'name' => 'increment_type',
              'label' => 'LBL_INCREMENT_TYPE',
          ),
        ),
          3 =>
        array (
          0 =>
          array (
            'name' => 'increment_c',
            'label' => 'LBL_INCREMENT',
          ),
        ),
        4 =>
        array (
          0 => 
          array (
            'name' => 'increment_date_c',
            'label' => 'LBL_INCREMENT_DATE',
          ),
          1 =>
          array (
            'name' => 'status_c',
            'label' => 'LBL_STATUS',
          ),
        ),
        5 =>
        array (
          0 => 
          array (
            'name' => 'next_increment_c',
            'label' => 'LBL_NEXT_INCREMENT',
          ),
        ),
        6 =>
        array (
          0 => 'description',
        ),
      ),
    ),
  ),
);
?>
