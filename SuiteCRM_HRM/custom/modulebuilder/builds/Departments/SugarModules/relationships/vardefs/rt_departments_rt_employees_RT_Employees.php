<?php
// created: 2016-11-10 17:55:02
$dictionary["RT_Employees"]["fields"]["rt_departments_rt_employees"] = array (
  'name' => 'rt_departments_rt_employees',
  'type' => 'link',
  'relationship' => 'rt_departments_rt_employees',
  'source' => 'non-db',
  'module' => 'RT_Departments',
  'bean_name' => false,
  'vname' => 'LBL_RT_DEPARTMENTS_RT_EMPLOYEES_FROM_RT_DEPARTMENTS_TITLE',
  'id_name' => 'rt_departments_rt_employeesrt_departments_ida',
);
$dictionary["RT_Employees"]["fields"]["rt_departments_rt_employees_name"] = array (
  'name' => 'rt_departments_rt_employees_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_DEPARTMENTS_RT_EMPLOYEES_FROM_RT_DEPARTMENTS_TITLE',
  'save' => true,
  'id_name' => 'rt_departments_rt_employeesrt_departments_ida',
  'link' => 'rt_departments_rt_employees',
  'table' => 'rt_departments',
  'module' => 'RT_Departments',
  'rname' => 'name',
);
$dictionary["RT_Employees"]["fields"]["rt_departments_rt_employeesrt_departments_ida"] = array (
  'name' => 'rt_departments_rt_employeesrt_departments_ida',
  'type' => 'link',
  'relationship' => 'rt_departments_rt_employees',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_DEPARTMENTS_RT_EMPLOYEES_FROM_RT_EMPLOYEES_TITLE',
);
