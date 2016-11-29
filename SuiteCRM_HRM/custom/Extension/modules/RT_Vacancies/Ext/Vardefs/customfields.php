<?php

$dictionary['RT_Vacancies']['fields']['financial_area'] = array (
    'name' => 'financial_area',
    'type' => 'enum',
    'vname'=>'LBL_FINANCIAL_AREA',
    'options'=>'financial_area_list',
);
$dictionary['RT_Vacancies']['fields']['open_date'] = array (
    'name' => 'open_date',
    'type' => 'date',
    'vname'=>'LBL_OPEN_DATE',
    'required' => true,
);
$dictionary['RT_Vacancies']['fields']['close_date'] = array (
    'name' => 'close_date',
    'type' => 'date',
    'vname'=>'LBL_CLOSE_DATE',
    'required' => true,
);
$dictionary['RT_Vacancies']['fields']['travel_required'] = array (
    'name' => 'travel_required',
    'type' => 'bool',
    'vname'=>'LBL_TRAVEL_REQUIRED',
);
$dictionary['RT_Vacancies']['fields']['hiring_manager'] = array (
    'name' => 'hiring_manager',
    'type' => 'varchar',
    'vname'=>'LBL_HIRING_MANAGER',
);

$dictionary['RT_Vacancies']['fields']['days_open'] = array (
    'name' => 'days_open',
    'type' => 'int',
    'vname'=>'LBL_DAYS_OPEN',
);
$dictionary['RT_Vacancies']['fields']['min_pay'] = array (
    'name' => 'min_pay',
    'type' => 'int',
    'vname'=>'LBL_MIN_PAY',
    'required' => true,

);
$dictionary['RT_Vacancies']['fields']['max_pay'] = array (
    'name' => 'max_pay',
    'type' => 'int',
    'vname'=>'LBL_MAX_PAY',
    'required' => true,
);
$dictionary['RT_Vacancies']['fields']['job_level'] = array (
    'name' => 'job_level',
    'type' => 'enum',
    'vname'=>'LBL_JOB_LEVEL',
);
$dictionary['RT_Vacancies']['fields']['location'] = array (
    'name' => 'location',
    'type' => 'enum',
    'vname'=>'LBL_location',
    'options' => 'countries_dom',
);
$dictionary['RT_Vacancies']['fields']['job_type'] = array (
    'name' => 'job_type',
    'type' => 'enum',
    'vname'=>'LBL_JOB_TYPE',
    'options' => 'job_type_dom',
);
$dictionary['RT_Vacancies']['fields']['skills_required'] = array (
    'name' => 'skills_required',
    'type' => 'text',
    'vname'=>'LBL_SKILLS_REQUIRED',
    'rows' => 5,
    'cols' => 80,
);
$dictionary['RT_Vacancies']['fields']['educational_requirement'] = array (
    'name' => 'educational_requirement',
    'type' => 'text',
    'vname'=>'LBL_SKILLS_REQUIRED',
    'rows' => 5,
    'cols' => 80,
);


 ?>
