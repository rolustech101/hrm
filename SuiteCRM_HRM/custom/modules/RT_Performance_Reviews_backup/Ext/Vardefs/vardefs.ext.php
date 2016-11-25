<?php 
 //WARNING: The contents of this file are auto-generated


$dictionary['RT_Performance_Reviews']['fields']['emp_name'] = array(
    'required'  => false,
    'source'    => 'non-db',
    'name'      => 'emp_name',
    'vname'     => 'LBL_EMP_NAME',
    'type'      => 'relate',
    'rname'     => 'name',
    'id_name'   => 'rt_emp_id',
    'join_name' => 'rt_employees',
    'link'      => 'rt_employees',
    'table'     => 'rt_employees',
    'isnull'    => 'true',
    'module'    => 'RT_Employees',
);
$dictionary['RT_Performance_Reviews']['fields']['rt_emp_id'] = array(
    'name'              => 'rt_emp_id',
    'rname'             => 'id',
    'vname'             => 'LBL_EMP_ID',
    'type'              => 'id',
    'table'             => 'rt_employees',
    'isnull'            => 'true',
    'module'            => 'RT_Employees',
    'dbType'            => 'id',
    'reportable'        => false,
    'massupdate'        => false,
    'duplicate_merge'   => 'disabled',
);
$dictionary['RT_Performance_Reviews']['fields']['rt_employees'] = array(
    'name'          => 'rt_employees',
    'type'          => 'link',
    'relationship'  => 'rt_performance_reviews_rt_employees',
    'module'        => 'RT_Employees',
    'bean_name'     => 'RT_Employees',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_EMPLOYEES',
);
$dictionary['RT_Performance_Reviews']['relationships']['rt_performance_reviews_rt_employees'] = array(
    'lhs_module'		=> 'RT_Performance_Reviews',
    'lhs_table'			=> 'rt_performance_reviews',
    'lhs_key'			=> 'rt_emp_id',
    'rhs_module'		=> 'RT_Employees',
    'rhs_table'			=> 'rt_employees',
    'rhs_key'			=> 'id',
    'relationship_type'	=> 'one-to-many',
);


$dictionary['RT_Performance_Reviews']['fields']['form_meta'] = array (
    'name' => 'form_meta',
    'type' => 'varchar',
	'vname'=>'LBL_FORM_META',
     );


?>