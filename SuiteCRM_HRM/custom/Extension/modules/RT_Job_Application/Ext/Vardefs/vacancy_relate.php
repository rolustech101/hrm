<?php
$dictionary['RT_Job_Application']['fields']['vacancy_name'] = array(
    'required'  => false,
    'source'    => 'non-db',
    'name'      => 'vacancy_name',
    'vname'     => 'LBL_VACANCY_NAME',
    'type'      => 'relate',
    'rname'     => 'name',
    'id_name'   => 'rt_vacancy_id',
    'join_name' => 'rt_vacancies',
    'link'      => 'rt_vacancies',
    'table'     => 'rt_vacancies',
    'isnull'    => 'true',
    'module'    => 'RT_Vacancies',
);
$dictionary['RT_Job_Application']['fields']['rt_vacancy_id'] = array(
    'name'              => 'rt_vacancy_id',
    'rname'             => 'id',
    'vname'             => 'LBL_VACANCY_ID',
    'type'              => 'id',
    'table'             => 'rt_vacancies',
    'isnull'            => 'true',
    'module'            => 'RT_Vacancies',
    'dbType'            => 'id',
    'reportable'        => false,
    'massupdate'        => false,
    'duplicate_merge'   => 'disabled',
);
$dictionary['RT_Job_Application']['fields']['rt_vacancies'] = array(
    'name'          => 'rt_vacancies',
    'type'          => 'link',
    'relationship'  => 'rt_job_application_rt_vacancies',
    'module'        => 'RT_Vacancies',
    'bean_name'     => 'RT_Vacancies',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_VACANCIES',
);
$dictionary['RT_Job_Application']['relationships']['rt_job_application_rt_vacancies'] = array(
    'lhs_module'		=> 'RT_Job_Application',
    'lhs_table'			=> 'rt_job_application',
    'lhs_key'			=> 'rt_vacancy_id',
    'rhs_module'		=> 'RT_Vacancies',
    'rhs_table'			=> 'rt_vacancies',
    'rhs_key'			=> 'id',
    'relationship_type'	=> 'one-to-many',
);