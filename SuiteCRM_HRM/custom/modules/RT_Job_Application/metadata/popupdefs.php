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
        'PARENT_NAME' =>
            array(
                'type' => 'parent',
                'studio' => 'visible',
                'label' => 'LBL_RT_JOB_APPLICATION_C',
                'link' => true,
                'sortable' => false,
                'ACLTag' => 'PARENT',
                'dynamic_module' => 'PARENT_TYPE',
                'id' => 'PARENT_ID',
                'related_fields' =>
                    array(
                        0 => 'parent_id',
                        1 => 'parent_type',
                    ),
                'width' => '10%',
                'default' => true,
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
