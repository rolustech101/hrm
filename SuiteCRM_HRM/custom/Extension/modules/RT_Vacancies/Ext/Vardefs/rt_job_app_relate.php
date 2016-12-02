<?php
/*$dictionary['RT_Vacancies']['fields']['rt_job_app_name'] = array(
    'required'  => false,
    'source'    => 'non-db',
    'name'      => 'rt_job_app_name',
    'vname'     => 'LBL_JOB_APP_NAME_NAME',
    'type'      => 'relate',
    'rname'     => 'name',
    'id_name'   => 'rt_job_app_id',
    'join_name' => 'rt_job_application',
    'link'      => 'rt_job_application',
    'table'     => 'rt_job_application',
    'isnull'    => 'true',
    'module'    => 'RT_Job_Application',
);
$dictionary['RT_Vacancies']['fields']['rt_job_app_id'] = array(
    'name'              => 'rt_job_app_id',
    'rname'             => 'id',
    'vname'             => 'LBL_JOB_APP_ID',
    'type'              => 'id',
    'table'             => 'rt_job_application',
    'isnull'            => 'true',
    'module'            => 'RT_Job_Application',
    'dbType'            => 'id',
    'reportable'        => false,
    'massupdate'        => false,
    'duplicate_merge'   => 'disabled',
);*/
$dictionary['RT_Vacancies']['fields']['rt_job_application'] = array(
    'name'          => 'rt_job_application',
    'type'          => 'link',
    'relationship'  => 'rt_job_application_rt_vacancies',
    'module'        => 'RT_Job_Application',
    'bean_name'     => 'RT_Job_Application',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_JOB_APPLICATION',
);
?>