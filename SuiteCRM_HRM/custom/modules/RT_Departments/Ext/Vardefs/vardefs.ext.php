<?php 
 //WARNING: The contents of this file are auto-generated


// created: 2016-11-10 17:55:02
$dictionary["RT_Departments"]["fields"]["rt_departments_rt_employees"] = array (
  'name' => 'rt_departments_rt_employees',
  'type' => 'link',
  'relationship' => 'rt_departments_rt_employees',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => 'RT_Employees',
  'side' => 'right',
  'vname' => 'LBL_RT_DEPARTMENTS_RT_EMPLOYEES_FROM_RT_EMPLOYEES_TITLE',
);


$dictionary["RT_Departments"]["fields"]["heads"] = array (
		 'name' => 'heads',
		 'vname' => 'LBL_HEADS',
		 'type' => 'varchar',
		'comment' => 'Department Heads',
);


 // created: 2012-02-24 06:25:48
$dictionary['RT_Departments']['fields']['heads']['required']=true;

 
?>