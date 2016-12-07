<?php
$dictionary['RT_Interviews']['fields']['rt_candidate_name'] = array(
    'required'  => false,
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
$dictionary['RT_Interviews']['fields']['rt_candidate_id'] = array(
    'name'              => 'rt_candidate_id',
    'rname'             => 'id',
    'vname'             => 'LBL_RT_CANDIDATE_ID',
    'type'              => 'id',
    'table'             => 'rt_candidates',
    'isnull'            => 'true',
    'module'            => 'RT_Candidates',
    'dbType'            => 'id',
    'reportable'        => false,
    'massupdate'        => false,
    'duplicate_merge'   => 'disabled',
);
$dictionary['RT_Interviews']['fields']['rt_candidates'] = array(
    'name'          => 'rt_candidates',
    'type'          => 'link',
    'relationship'  => 'rt_interviews_rt_candidates',
    'module'        => 'RT_Candidates',
    'bean_name'     => 'RT_Candidates',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_CANDIDATES',
);
$dictionary['RT_Interviews']['relationships']['rt_interviews_rt_candidates'] = array(
    'lhs_module'		=> 'RT_Interviews',
    'lhs_table'			=> 'rt_interviews',
    'lhs_key'			=> 'rt_candidate_id',
    'rhs_module'		=> 'RT_Candidates',
    'rhs_table'			=> 'rt_candidates',
    'rhs_key'			=> 'id',
    'relationship_type'	=> 'one-to-many',
);