<?php
$module_name = 'RT_Vacancies';
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
        array(
//            0 =>
//                array(
//                    0 => 'rt_job_app_name',
//                ),
            1 =>
                array(
                    0 => 'name',
                ),
            2 =>
                array(
                    0 =>
                        array(
                            'name' => 'positions_c',
                            'label' => 'LBL_POSITIONS',
                        ),
                    1 =>
                        array(
                            'name' => 'financial_area',
                            'label' => 'LBL_FINANCIAL_AREA',
                        ),
                ),
            3 =>
                array(
                    0 =>
                        array(
                            'name' => 'open_date',
                            'label' => 'LBL_OPEN_DATE',
                        ),
                    1 =>
                        array(
                            'name' => 'close_date',
                            'label' => 'LBL_CLOSE_DATE',
                        ),
                ),
            4 =>
                array(
                    0 =>
                        array(
                            'name' => 'days_open',
                            'label' => 'LBL_DAYS_OPEN',
                        ),
                    1 => array(),
                ),
            5 =>
                array(
                    0 =>
                        array(
                            'name' => 'travel_required',
                            'label' => 'LBL_TRAVEL_REQUIRED',
                        ),
                    1 =>
                        array(
                            'name' => 'assigned_user_name',
                            'label' => 'LBL_HIRING_MANAGER',
                        ),
                ),
            6 =>
                array(
                    0 =>
                        array(
                            'name' => 'job_type',
                            'label' => 'LBL_JOB_TYPE',
                        ),
                    1 => array(
                            'name' => 'date_entered',
                            'customCode' => '{$fields.date_entered.value} {$APP.LBL_BY} {$fields.created_by_name.value}',
                            'label' => 'LBL_DATE_ENTERED',
                    ),
                ),
            7 =>
                array(
                    0 =>
                        array(
                            'name' => 'job_level',
                            'label' => 'LBL_JOB_LEVEL',
                        ),
                    1 =>
                        array(
                            'name' => 'location',
                            'label' => 'LBL_location',
                        ),
                ),
            8 =>
                array(
                    0 =>
                        array(
                            'name' => 'educational_requirement',
                            'label' => 'LBL_EDUCATIONAL_RQUIREMENT',
                        ),
                ),
            9 =>
                array(
                    0 =>
                        array(
                            'name' => 'skills_required',
                            'label' => 'LBL_SKILLS_REQUIRED',
                        ),

                ),
            10 =>
                array(
                    0 =>
                        array(
                            'name' => 'status_c',
                            'studio' => 'visible',
                            'label' => 'LBL_STATUS',
                        ),
                    1 => '',
                ),
            11 =>
                array(
                    0 => 'description',
                    1 => '',
                ),
        ),
        'lbl_editview_panel1' =>
            array(
                0 =>
                    array(
                        0 => '',
                        1 => '',
                    ),
                1 =>
                    array(
                        0 =>
                            array(
                                'name' => 'min_pay',
                                'label' => 'LBL_MIN_PAY',
                            ),
                        1 =>
                            array(
                                'name' => 'max_pay',
                                'label' => 'LBL_MAX_PAY',
                            ),
                    ),
            ),
    ),
  ),
);
?>
