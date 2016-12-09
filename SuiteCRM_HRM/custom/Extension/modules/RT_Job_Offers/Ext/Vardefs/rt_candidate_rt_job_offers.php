<?php
$dictionary['RT_Job_Offers']['fields']['rt_candidate_name'] = array(
    'required'  => true,
    'source'    => 'non-db',
    'name'      => 'rt_candidate_name',
    'vname'     => 'LBL_RT_CANDIDATE_NAME',
    'type'      => 'relate',
    'rname'     => 'name',
    'id_name'   => 'rt_candidate_id',
    'join_name' => 'rt_candidates',
    'link'      => 'rt_candidates',
    'table'     => 'rt_candidates',
    'isnull'    => 'true',
    'module'    => 'RT_Candidates',
);
$dictionary['RT_Job_Offers']['fields']['rt_candidate_id'] = array(
    'name'              => 'rt_candidate_id',
    'rname'             => 'id',
    'vname'             => 'LBL_CANDIDATE_ID',
    'type'              => 'id',
    'table'             => 'rt_candidates',
    'isnull'            => 'true',
    'module'            => 'RT_Candidates',
    'dbType'            => 'id',
    'reportable'        => false,
    'massupdate'        => false,
    'duplicate_merge'   => 'disabled',
);
$dictionary['RT_Job_Offers']['fields']['rt_candidates'] = array(
    'name'          => 'rt_candidates',
    'type'          => 'link',
    'relationship'  => 'rt_job_offers_rt_candidates',
    'module'        => 'RT_Candidates',
    'bean_name'     => 'RT_Candidates',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_CANDIDATES',
);
$dictionary['RT_Job_Offers']['relationships']['rt_job_offers_rt_candidates'] = array(
    'lhs_module'		=> 'RT_Candidates',
    'lhs_table'			=> 'rt_candidates',
    'lhs_key'			=> 'id',
    'rhs_module'		=> 'RT_Job_Offers',
    'rhs_table'			=> 'rt_job_offers',
    'rhs_key'			=> 'rt_candidate_id',
    'relationship_type'	=> 'one-to-many',
);