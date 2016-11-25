<?php 
 //WARNING: The contents of this file are auto-generated


$dictionary['RT_Qualifications']['fields']['parent_name'] = array(
    'required' => false,
    'source' => 'non-db',
    'name' => 'parent_name',
    'vname' => 'LBL_RT_QUALIFICATIONS',
    'type' => 'parent',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => false,
    'reportable' => true,
    'len' => 25,
    'size' => '20',
    'options' => 'RT_Qualifications_options',
    'studio' => 'visible',
    'type_name' => 'parent_type',
    'id_name' => 'parent_id',
    'parent_type' => 'RT_Qualifications_options',
);
$dictionary['RT_Qualifications']['fields']['parent_type'] = array(
    'required' => false,
    'name' => 'parent_type',
    'vname' => 'LBL_PARENT_TYPE',
    'type' => 'parent_type',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => 0,
    'audited' => false,
    'reportable' => true,
    'len' => 255,
    'size' => '20',
    'dbType' => 'varchar',
    'studio' => 'hidden',
);
$dictionary['RT_Qualifications']['fields']['parent_id'] = array(
    'required' => false,
    'name' => 'parent_id',
    'vname' => 'LBL_PARENT_ID',
    'type' => 'id',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => 0,
    'audited' => false,
    'reportable' => true,
    'len' => 36,
    'size' => '20',
);
$dictionary['RT_Qualifications']['fields']['rt_employees'] = array(
    'name' => 'rt_employees',
    'type' => 'link',
    'relationship' => 'rt_qualifications_rt_employees',
    'module'=>'RT_Employees',
    'bean_name'=>'Contact',
    'source'=>'non-db',
    'vname'=>'LBL_RT_EEMPLOYEES',
);
$dictionary['RT_Qualifications']['fields']['rt_candidates'] = array(
    'name' => 'rt_candidates',
    'type' => 'link',
    'relationship' => 'rt_qualifications_rt_candidates',
    'module'=>'RT_Candidates',
    'bean_name'=>'Lead',
    'source'=>'non-db',
    'vname'=>'LBL_RT_CANDIDATES',
);
$dictionary['RT_Qualifications']['relationships']['rt_qualifications_rt_employees'] = array(
    'lhs_module'		=> 'RT_Qualifications',
    'lhs_table'			=> 'rt_qualifications',
    'lhs_key'			=> 'parent_id',
    'rhs_module'		=> 'RT_Employees',
    'rhs_table'			=> 'rt_employees',
    'rhs_key'			=> 'id',
    'relationship_type'	=> 'one-to-many',
    'relationship_role_column'=>'parent_type',
    'relationship_role_column_value'=>'RT_Employees'
);
$dictionary['RT_Qualifications']['relationships']['rt_qualifications_rt_candidates'] = array(
    'lhs_module'		=> 'RT_Qualifications',
    'lhs_table'			=> 'rt_qualifications',
    'lhs_key'			=> 'parent_id',
    'rhs_module'		=> 'RT_Candidates',
    'rhs_table'			=> 'rt_candidates',
    'rhs_key'			=> 'id',
    'relationship_type'	=> 'one-to-many',
    'relationship_role_column'=>'parent_type',
    'relationship_role_column_value'=>'RT_Candidates'
);
?>