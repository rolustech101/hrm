<?php

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