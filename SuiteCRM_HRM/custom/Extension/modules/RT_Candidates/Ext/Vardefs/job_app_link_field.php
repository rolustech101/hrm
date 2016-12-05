<?php

$dictionary['RT_Candidates']['fields']['rt_job_application_c'] = array(
    'name'          => 'rt_job_application_c',
    'type'          => 'link',
    'relationship'  => 'rt_job_application_rt_candidates',
    'module'        => 'RT_Job_Application',
    'bean_name'     => 'RT_Job_Application',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_JOB_APPLICATION',
);

?>