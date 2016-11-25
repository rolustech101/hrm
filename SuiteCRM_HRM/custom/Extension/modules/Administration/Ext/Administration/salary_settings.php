<?php

$admin_option_defs = array();
$admin_option_defs['Administration']['Salary_Settings_panel'] = array(
    //Icon name. Available icons are located in ./themes/default/images
    'Administration',

    //Link name label
    'LBL_LINK_SALARY_SETTINGS',

    //Link description label
    'LBL_SALARY_SETTINGS_DESCRIPTION',

    //Link URL
    './index.php?module=RT_SalarySetting&action=salary_settings',
);
$admin_group_header[] = array(
    //Section header label
    'LBL_SECTION_HEADER_SALARY_SETTINGS',

    //$other_text parameter for get_form_header()
    '',

    //$show_help parameter for get_form_header()
    false,

    //Section links
    $admin_option_defs,

    //Section description label
    'LBL_SALARY_SETTINGS_DESCRIPTION'
);