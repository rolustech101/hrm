<?php
$popupMeta = array(
    'moduleMain' => 'RT_Job_Application',
    'varName' => 'RT_Job_Application',
    'orderBy' => 'rt_job_application.name',
    'whereClauses' => array(
        'name' => 'rt_job_application.name',
    ),
    'searchInputs' => array(
        0 => 'rt_job_application_number',
        1 => 'name',
        2 => 'priority',
        3 => 'status',
    ),
    'listviewdefs' => array(
        'NAME' =>
            array(
                'width' => '32%',
                'label' => 'LBL_NAME',
                'default' => true,
                'link' => true,
                'name' => 'name',
            ),
        'VACANCY_NAME' =>
            array(
                'width' => '32%',
                'label' => 'LBL_VACANCY_NAME',
                'default' => true,
                'link' => true,
                'type' => 'relate',
            ),
        'STATUS' =>
            array(
                'type' => 'enum',
                'label' => 'LBL_STATUS',
                'width' => '10%',
                'default' => true,
            ),
        'CANDIDATE_NAME' =>
            array(
                'width' => '32%',
                'default' => true,
                'label' => 'LBL_CANDIDATE_NAME',
                'link' => true,
                'type' => 'relate',
            ),
        'DATE_ENTERED' =>
            array(
                'width' => '9%',
                'label' => 'LBL_DATE_ENTERED',
                'default' => true,
                'name' => 'date_entered',
            ),

    ),
);
