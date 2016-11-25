<?php
// created: 2016-10-17 14:14:49
$dictionary["RT_Payroll"]["fields"]["rt_employees_rt_payroll"] = array (
  'name' => 'rt_employees_rt_payroll',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_payroll',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => false,
  'vname' => 'LBL_RT_EMPLOYEES_RT_PAYROLL_FROM_RT_EMPLOYEES_TITLE',
  'id_name' => 'rt_employees_rt_payrollrt_employees_ida',
);
$dictionary["RT_Payroll"]["fields"]["rt_employees_rt_payroll_name"] = array (
  'name' => 'rt_employees_rt_payroll_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_EMPLOYEES_RT_PAYROLL_FROM_RT_EMPLOYEES_TITLE',
  'save' => true,
  'id_name' => 'rt_employees_rt_payrollrt_employees_ida',
  'link' => 'rt_employees_rt_payroll',
  'table' => 'rt_employees',
  'module' => 'RT_Employees',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["RT_Payroll"]["fields"]["rt_employees_rt_payrollrt_employees_ida"] = array (
  'name' => 'rt_employees_rt_payrollrt_employees_ida',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_payroll',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_PAYROLL_FROM_RT_PAYROLL_TITLE',
);
