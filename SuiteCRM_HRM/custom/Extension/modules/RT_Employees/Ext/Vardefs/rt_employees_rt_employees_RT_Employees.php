<?php
// created: 2016-10-17 14:14:50
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_employees"] = array (
  'name' => 'rt_employees_rt_employees',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_employees',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => false,
  'vname' => 'LBL_RT_EMPLOYEES_RT_EMPLOYEES_FROM_RT_EMPLOYEES_L_TITLE',
  'id_name' => 'rt_employees_rt_employeesrt_employees_ida',
);
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_employees_name"] = array (
  'name' => 'rt_employees_rt_employees_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_EMPLOYEES_RT_EMPLOYEES_FROM_RT_EMPLOYEES_L_TITLE',
  'save' => true,
  'id_name' => 'rt_employees_rt_employeesrt_employees_ida',
  'link' => 'rt_employees_rt_employees',
  'table' => 'rt_employees',
  'module' => 'RT_Employees',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_employeesrt_employees_ida"] = array (
  'name' => 'rt_employees_rt_employeesrt_employees_ida',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_employees',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_EMPLOYEES_FROM_RT_EMPLOYEES_R_TITLE',
);
