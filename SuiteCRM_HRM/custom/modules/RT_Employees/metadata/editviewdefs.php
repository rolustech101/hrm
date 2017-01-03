<?php
$module_name = 'RT_Employees';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'maxColumns' => '2',
        'form' =>
            array (
                'enctype' => 'multipart/form-data',
                'footerTpl' => 'custom/modules/RT_Employees/tpls/EditFooter.tpl',
                'buttons' =>
                    array (
                        0 => array (
                            'customCode' => '<input type="submit" name="save" id="save" onClick="var _form = document.getElementById(\'EditView\');_form.action.value = \'Save\';  return set_taxable(\'EditView\',_form);" value="Save">',
          ),
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
                        'file' => 'custom/modules/RT_Employees/funcs.js',
                    ),
            ),
      'useTabs' => false,
//      'form' =>
//      array (
//        'enctype' => 'multipart/form-data',
//        'footerTpl' => 'custom/modules/RT_Employees/tpls/EditFooter.tpl',
//      ),
    ),
    'panels' => 
    array (
      'lbl_contact_information' => 
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
                      'customCode' => '{html_options name="salutation" id="salutation" options=$fields.salutation.options selected=$fields.salutation.value}&nbsp;<input name="first_name"  id="first_name" size="25" maxlength="25" type="text" value="{$fields.first_name.value}">',
                  ),
              1 => 'last_name',
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
            'displayParams' => 
            array (
              'required' => true,
            ),
          ),
          1 => 
          array (
            'name' => 'photo',
            'label' => 'LBL_PHOTO',
          ),
        ),
        4 =>
        array (
          0 => 
          array (
            'name' => 'ntn_number_c',
            'label' => 'LBL_NTN_NUMBER',
          ),
            1 => array(),
        ),
        5 =>
        array (
          0 => 
          array (
            'name' => 'date_of_birth_c',
            'label' => 'LBL_DATE_OF_BIRTH',
          ),
            1 => array(),
        ),
        6 =>
        array (
          0 => 
          array (
            'name' => 'bank_account_c',
            'label' => 'LBL_BANK_ACCOUNT',
          ),
            1 => array(),
        ),
        7 =>
        array (
          0 => 
          array (
            'name' => 'account_name_c',
            'label' => 'LBL_ACCOUNT_NAME',
          ),
            1 => array(),
        ),
        8 =>
        array (
          0 => 
          array (
            'name' => 'bank_name_c',
            'studio' => 'visible',
            'label' => 'LBL_BANK_NAME',
          ),
            1 => array(),
        ),
        9 =>
        array (
          0 => 
          array (
            'name' => 'rt_departments_rt_employees_name',
          ),
            1 => array(),
        ),
          10 => array(
            0 => array(
                'name' => 'filling_status',
            ),
              1 => array(),
          ),
      ),
      'lbl_email_addresses' => 
      array (
        0 => 
        array (
          0 => 'phone_home',
            1 => array(),
        ),
        1 => 
        array (
          0 => 'phone_work',
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
          0 => 'phone_mobile',
            1 => array(),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'primary_address_street',
            'hideLabel' => true,
            'type' => 'address',
            'displayParams' => 
            array (
              'key' => 'primary',
              'rows' => 2,
              'cols' => 30,
              'maxlength' => 150,
            ),
          ),
            1 => array(),
        ),
        5 => 
        array (
          0 => 'email1',
            1 => array(),
        ),
      ),
      'lbl_editview_panel1' => 
      array (
        1 => 
        array (
          0 =>
          array (
            'name' => 'rt_employees_rt_jobs_name_c',
            'label' => 'RT_EMPLOYEES_RT_JOB_NAME_C',
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
            'name' => 'employment_status',
            'studio' => 'visible',
            'label' => 'LBL_EMPLOYMENT_STATUS',
          ),
          1 => 
          array (
            'name' => 'employment_type_c',
            'studio' => 'visible',
            'label' => 'LBL_EMPLOYMENT_TYPE',
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
            1 => array(),
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'entitled_annual_leaves_c',
            'label' => 'LBL_ENTITLED_ANNUAL_LEAVES',
          ),
            1 => array(),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'entitled_casual_leaves_c',
            'label' => 'LBL_ENTITLED_CASUAL_LEAVES',
          ),
            1 => array(),
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'description',
            'comment' => 'Full text of the note',
            'label' => 'LBL_DESCRIPTION',
          ),
            1 => array(),
        ),
      ),
    ),
  ),
);
?>
