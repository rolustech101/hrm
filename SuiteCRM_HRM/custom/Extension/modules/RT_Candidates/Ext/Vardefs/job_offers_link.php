<?php
$dictionary['RT_Candidates']['fields']['rt_job_offers'] = array(
    'name'          => 'rt_job_offers',
    'type'          => 'link',
    'relationship'  => 'rt_job_offers_rt_candidates',
    'module'        => 'RT_Job_Offers',
    'bean_name'     => 'RT_Job_Offers',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_JOB_OFFERS',
);
?>