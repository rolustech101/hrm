<?php
$dictionary['RT_Vacancies']['fields']['job_name'] = array(
    'required'  => true,
    'source'    => 'non-db',
    'name'      => 'job_name',
    'vname'     => 'LBL_JOB_NAME',
    'type'      => 'relate',
    'rname'     => 'name',
    'id_name'   => 'rt_job_id',
    'join_name' => 'rt_jobs',
    'link'      => 'rt_jobs',
    'table'     => 'rt_jobs',
    'isnull'    => 'true',
    'module'    => 'RT_Jobs',
);
$dictionary['RT_Vacancies']['fields']['rt_job_id'] = array(
    'name'              => 'rt_job_id',
    'rname'             => 'id',
    'vname'             => 'LBL_JOB_ID',
    'type'              => 'id',
    'table'             => 'rt_jobs',
    'isnull'            => 'true',
    'module'            => 'RT_Jobs',
    'dbType'            => 'id',
    'reportable'        => false,
    'massupdate'        => false,
    'duplicate_merge'   => 'disabled',
);
$dictionary['RT_Vacancies']['fields']['rt_jobs'] = array(
    'name'          => 'rt_jobs',
    'type'          => 'link',
    'relationship'  => 'rt_vacancies_rt_jobs',
    'module'        => 'RT_Jobs',
    'bean_name'     => 'RT_Jobs',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_JOBS',
);
$dictionary['RT_Vacancies']['relationships']['rt_vacancies_rt_jobs'] = array(
    'lhs_module'		=> 'RT_Jobs',
    'lhs_table'			=> 'rt_jobs',
    'lhs_key'			=> 'id',
    'rhs_module'		=> 'RT_Vacancies',
    'rhs_table'			=> 'rt_vacancies',
    'rhs_key'			=> 'rt_job_id',
    'relationship_type'	=> 'one-to-many',
);