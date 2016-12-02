<?php


$dictionary['RT_Job_Application']['fields']['job_application_number'] = array (
    'name' => 'job_application_number',
    'vname' => 'LBL_JOB_APPLICATION_NUMBER',
    'type' => 'int',
    'readonly' => true,
    'len' => 11,
    'required' => true,
    'auto_increment' => true,
    'unified_search' => true,
    'full_text_search' =>
        array (
            'boost' => 3,
        ),
    'comment' => 'Visual unique identifier',
    'duplicate_merge' => 'disabled',
    'disable_num_format' => true,
    'studio' =>
        array (
            'quickcreate' => false,
        ),
    'inline_edit' => false,
    'indices' => array(
        array('name' => 'job_application_number', 'type' => 'unique', 'fields' => array('job_application_number')),),
);
?>