<?php
$dictionary["RT_Time_Tracker"]["fields"]["date_start"] = array(

    'name' => 'date_start',
    'vname' => 'LBL_DATE',
    'type' => 'datetimecombo',
    'dbType' => 'datetime',
    'comment' => '',
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