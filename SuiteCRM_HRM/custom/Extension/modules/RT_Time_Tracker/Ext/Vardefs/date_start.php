<?php
$dictionary["RT_Time_Tracker"]["fields"]["date_start"] = array(

    'name' => 'date_start',
    'vname' => 'LBL_CHECK_IN_TIME',
    'type' => 'datetimecombo',
    'dbType' => 'datetime',
    'comment' => '',
    'display_default' => 'now',
    'importable' => 'required',
    'required' => true,
    'enable_range_search' => true,
    'options' => 'date_range_search_dom',
    'validation' =>
        array (
            'type' => 'isbefore',
            'compareto' => 'date_end',
            'blank' => false,
        ),
);
?>