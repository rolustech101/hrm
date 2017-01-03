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
        'footerTpl' => 'custom/modules/RT_Employees/tpls/Detailfooter.tpl',
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
           array(
               'name' => 'rtemployee_id',
           ),
            1 => array(),
        ),
          1 => array(
              0 =>
                  array (
                      'name' => 'first_name',
                      'comment' => 'First name of the contact',
                      'label' => 'LBL_FIRST_NAME',
                  ),
              1 =>
                  array (
                      'name' => 'last_name',
                      'comment' => 'Last name of the contact',
                      'label' => 'LBL_LAST_NAME',
                  ),
          ),
        2 =>
        array (
          0 => 
          array (
            'name' => 'gender_c',
            'studio' => 'visible',
            'label' => 'LBL_GENDER',
          ),
          1 => 
          array (
            'name' => 'marital_status_c',
            'studio' => 'visible',
            'label' => 'LBL_MARITAL_STATUS',
          ),
        ),
        3 =>
        array (
          0 => 
          array (
            'name' => 'nic_number_c',
            'label' => 'LBL_NIC_NUMBER',
          ),
          1 => 
          array (
            'name' => 'ntn_number_c',
            'label' => 'LBL_NTN_NUMBER',
          ),
        ),
        4 =>
        array (
          0 => 
          array (
            'name' => 'date_of_birth_c',
            'label' => 'LBL_DATE_OF_BIRTH',
          ),
            1 => array(),
        ),
        5 =>
        array (
          0 => 
          array (
            'name' => 'bank_account_c',
            'label' => 'LBL_BANK_ACCOUNT',
          ),
          1 => 
          array (
            'name' => 'photo',
            'label' => 'LBL_PHOTO',
            'type' => 'images',
          ),
        ),
        6 =>
        array (
          0 => 
          array (
            'name' => 'account_name_c',
            'label' => 'LBL_ACCOUNT_NAME',
          ),
            1 => array(),
        ),
        7 =>
        array (
          0 => 
          array (
            'name' => 'bank_name_c',
            'studio' => 'visible',
            'label' => 'LBL_BANK_NAME',
          ),
            1 => array(),
        ),
        8 =>
        array (
          0 => 
          array (
            'name' => 'rt_departments_rt_employees_name',
          ),
            1 => array(),
        ),
      ),
      'lbl_detailview_panel3' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'phone_home',
            'label' => 'LBL_HOME_PHONE',
          ),
            1 => array(),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'phone_work',
          ),
            1 => array(),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'phone_extension',
            'comment' => 'Phone Extension',
            'label' => 'LBL_PHONE_EXTENSION',
          ),
            1 => array(),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'phone_mobile',
          ),
            1 => array(),
        ),
        4 => 
        array (
          0 => 'email1',
        ),
          1 => array(),
        5 => 
        array (
          0 => 
          array (
            'name' => 'primary_address_street',
            'label' => 'LBL_PRIMARY_ADDRESS',
            'type' => 'address',
            'displayParams' => 
            array (
              'key' => 'primary',
            ),
          ),
            1 => array(),
        ),
      ),
      'lbl_detailview_panel4' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'rt_employees_rt_jobs_name_c',
              'label' => 'RT_EMPLOYEES_RT_JOB_NAME_C',

          ),
          1 => 'department',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'employment_status',
            'studio' => 'visible',
            'label' => 'LBL_EMPLOYMENT_STATUS',
          ),
          1 => 
          array (
            'name' => 'joining_date_c',
            'label' => 'LBL_JOINING_DATE',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'employment_type_c',
            'studio' => 'visible',
            'label' => 'LBL_EMPLOYMENT_TYPE',
          ),
          1 => 
          array (
            'name' => 'RT_employ_RT_employees_name',
          ),
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'provident_fund',
            'label' => 'LBL_PROVIDENT_FUND',
          ),
          1 => 
          array (
            'name' => 'deduct_provident',
            'label' => 'LBL_DEDUCT_PROVIDENT',
          ),
        ),
        4 => 
        array (
            0 =>
            array (
                'name' => 'rt_employees_rt_employees_name',
                'label' => 'LBL_RT_EMPLOYEES_RT_EMPLOYEES_NAME',
            ),
          1 => 'description',
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'entitled_annual_leaves_c',
            'label' => 'LBL_ENTITLED_ANNUAL_LEAVES',
          ),
          1 => 
          array (
            'name' => 'entitled_casual_leaves_c',
            'label' => 'LBL_ENTITLED_CASUAL_LEAVES',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'annual_leave_balance',
            'label' => 'LBL_ANNUAL_LEAVE_BALANCE',
          ),
          1 => 
          array (
            'name' => 'casual_leave_balance',
            'label' => 'LBL_CASUAL_LEAVE_BALANCE',
          ),
        ),
      ),
    ),
  ),
);
?>
