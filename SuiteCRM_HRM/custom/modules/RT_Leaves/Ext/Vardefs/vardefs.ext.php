<?php 
 //WARNING: The contents of this file are auto-generated


// created: 2016-10-17 14:14:49
$dictionary["RT_Leaves"]["fields"]["rt_employees_rt_leaves"] = array (
  'name' => 'rt_employees_rt_leaves',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_leaves',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => false,
  'vname' => 'LBL_RT_EMPLOYEES_RT_LEAVES_FROM_RT_EMPLOYEES_TITLE',
  'id_name' => 'rt_employees_rt_leavesrt_employees_ida',
);
$dictionary["RT_Leaves"]["fields"]["rt_employees_rt_leaves_name"] = array (
  'name' => 'rt_employees_rt_leaves_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_EMPLOYEES_RT_LEAVES_FROM_RT_EMPLOYEES_TITLE',
  'save' => true,
  'id_name' => 'rt_employees_rt_leavesrt_employees_ida',
  'link' => 'rt_employees_rt_leaves',
  'table' => 'rt_employees',
  'module' => 'RT_Employees',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["RT_Leaves"]["fields"]["rt_employees_rt_leavesrt_employees_ida"] = array (
  'name' => 'rt_employees_rt_leavesrt_employees_ida',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_leaves',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_LEAVES_FROM_RT_LEAVES_TITLE',
);


$dictionary['RT_Leaves']['fields']['rt_employees_rt_leaves_name']['populate_list'] = array('name', 'id', 'joining_date_c');
$dictionary['RT_Leaves']['fields']['rt_employees_rt_leaves_name']['field_list'] = array('rt_employees_rt_leaves_name', 'rt_employees_rt_leavesrt_employees_ida', 'emp_date_of_joining');


$dictionary["RT_Leaves"]["fields"]["annual_leave_balance"] = array (
  'name' => 'annual_leave_balance',
  'vname' => 'ANNUAL_LEAVE_BALANCE',
  'type' => 'varchar',
  'source' => 'non-db',
  'len' => 20,  
  'isnull' => false,
);
$dictionary["RT_Leaves"]["fields"]["casual_leave_balance"] = array (
  'name' => 'casual_leave_balance',
  'vname' => 'CASUAL_LEAVE_BALANCE',
  'type' => 'varchar',
  'source' => 'non-db',
  'len' => 20,  
  'isnull' => false,
);

$dictionary["RT_Leaves"]["fields"]["emp_date_of_joining"] = array (
    'name' => 'emp_date_of_joining',
    'vname' => 'LBL_EMP_DATE_OF_JOINING',
    'type' => 'varchar',
    'source' => 'non-db',

);



 // created: 2016-10-20 17:48:35
$dictionary['RT_Leaves']['fields']['count_days_c']['inline_edit']='1';
$dictionary['RT_Leaves']['fields']['count_days_c']['labelValue']='No of Days';
$dictionary['RT_Leaves']['fields']['count_days_c']['readonly']= true;



$dictionary["RT_Leaves"]["fields"]["holidays"] = array (
    'name' => 'holidays',
    'vname' => '',
    'type' => 'varchar',
    'source' => 'non-db',
    'len' => 20,
    'isnull' => false,
);

?>