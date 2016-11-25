<?php 
 //WARNING: The contents of this file are auto-generated


// created: 2016-10-17 14:14:50
$dictionary["RT_Deductables"]["fields"]["rt_employees_rt_deductables"] = array (
  'name' => 'rt_employees_rt_deductables',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_deductables',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => false,
  'vname' => 'LBL_RT_EMPLOYEES_RT_DEDUCTABLES_FROM_RT_EMPLOYEES_TITLE',
  'id_name' => 'rt_employees_rt_deductablesrt_employees_ida',
);
$dictionary["RT_Deductables"]["fields"]["rt_employees_rt_deductables_name"] = array (
  'name' => 'rt_employees_rt_deductables_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_EMPLOYEES_RT_DEDUCTABLES_FROM_RT_EMPLOYEES_TITLE',
  'save' => true,
  'id_name' => 'rt_employees_rt_deductablesrt_employees_ida',
  'link' => 'rt_employees_rt_deductables',
  'table' => 'rt_employees',
  'module' => 'RT_Employees',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["RT_Deductables"]["fields"]["rt_employees_rt_deductablesrt_employees_ida"] = array (
  'name' => 'rt_employees_rt_deductablesrt_employees_ida',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_deductables',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_DEDUCTABLES_FROM_RT_DEDUCTABLES_TITLE',
);

?>