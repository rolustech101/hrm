<?php 
 //WARNING: The contents of this file are auto-generated



$admin_option_defs = array();
$admin_option_defs['Administration']['Performance_review_panel_1'] = array(
    //Icon name. Available icons are located in ./themes/default/images
    'Administration',

    //Link name label
    'LBL_LINK_NAME_1',

    //Link description label
    'LBL_LINK_DESCRIPTION_1',

    //Link URL
    './index.php?module=RT_Performance_Reviews&action=create_form',
);
$admin_option_defs['Administration']['Performance_review_panel_2'] = array(
    //Icon name. Available icons are located in ./themes/default/images
    'Administration',

    //Link name label
    'LBL_LINK_NAME_2',

    //Link description label
    'LBL_LINK_DESCRIPTION_2',

    //Link URL
    './index.php?module=RT_Performance_Reviews&action=review_create',
);
$admin_group_header[] = array(
    //Section header label
    'LBL_SECTION_HEADER',

    //$other_text parameter for get_form_header()
    '',

    //$show_help parameter for get_form_header()
    false,

    //Section links
    $admin_option_defs,

    //Section description label
    'LBL_SECTION_DESCRIPTION'
);


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


$admin_option_defs = array();
$admin_option_defs['Administration']['Increment_interval_panel'] = array(
    //Icon name. Available icons are located in ./themes/default/images
    'Administration',

    //Link name label
    'LBL_LINK_INCREMENT',

    //Link description label
    'LBL_INCREMENT_DESCRIPTION',

    //Link URL
    './index.php?module=Administration&action=set_increment_interval',
);
$admin_group_header[] = array(
    //Section header label
    'LBL_SECTION_HEADER_INCREMENT',

    //$other_text parameter for get_form_header()
    '',

    //$show_help parameter for get_form_header()
    false,

    //Section links
    $admin_option_defs,

    //Section description label
    'LBL_INCREMENT_DESCRIPTION'
);
?>