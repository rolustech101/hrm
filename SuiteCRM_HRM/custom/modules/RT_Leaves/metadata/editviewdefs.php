<?php
$module_name = 'RT_Leaves';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'maxColumns' => '2',
        'form' =>
            array (
                'buttons' =>
                    array (
                        0 => array (
                            'customCode' => "<input type='submit' name='save' id='save' value='Save' onClick=\"this.form.return_action.value='DetailView'; this.form.action.value='Save'; return custom_function('editView');\" />",
          ),
        ),
                'hidden' =>
                    array (
                        'customCode' => '<input type="hidden" id="emp_date_of_joining" name="emp_date_of_joining" value="" />',
                    ),
      ),
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
          'file' => 'custom/modules/RT_Leaves/funcs.js',
        ),
      ),
      'useTabs' => false,
      'tabDefs' => 
      array (
        'LBL_EDITVIEW_PANEL2' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
    ),
    'panels' => 
    array (
      'lbl_editview_panel2' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'rt_employees_rt_leaves_name',
            'displayParams' => 
            array (
                'call_back_function' => 'set_custom_return',

            ),
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'annual_leave_balance',
              'label' => 'LBL_ANNUAL_LEAVE_BALANCE',


          ),
          1 => '',
        ),
          2=>
            array (
            0 =>
               array (
                 'name' => 'casual_leave_balance',
                   'label' => 'LBL_CASUAL_LEAVE_BALANCE',
                  ),
                    1 => '',
          ),
        3 =>
        array (
          0 => 
          array (
            'name' => 'leave_type_c',
            'studio' => 'visible',
            'label' => 'LBL_LEAVE_TYPE',
          ),
          1 => '',
        ),
        4 =>
        array (
          0 => 
          array (
            'name' => 'from_date_c',
            'label' => 'LBL_FROM_DATE',
          ),
          1 => '',
        ),
        5 =>
        array (
          0 => 
          array (
            'name' => 'to_date_c',
            'label' => 'LBL_TO_DATE',
              'displayParams' =>
                  array (
                      'field' =>
                          array (
                              'onChange' => 'count_no_of_days()',
                          ),
                  ),
/*              'displayParams' =>
                  array (
                      'javascript' => 'alert(0)',
//              ),
                  ),*/
          ),
          1 => '',
        ),
        6 =>
        array (
          0 => 
          array (
            'name' => 'count_days_c',
            'label' => 'LBL_COUNT_DAYS',
              'readonly' => 'true',
          ),
          1 => '',
        ),
        7 =>
        array (
          0 => 
          array (
            'name' => 'status_c',
            'studio' => 'visible',
            'label' => 'LBL_STATUS',
          ),
        ),
        8 =>
        array (
          0 => 
          array (
            'name' => 'comments_c',
            'studio' => 'visible',
            'label' => 'LBL_COMMENTS',
          ),
        ),
      ),
    ),
  ),
);
?>
