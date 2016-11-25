<?php
// created: 2016-10-17 14:14:49
$dictionary["RT_Appraisals"]["fields"]["rt_employees_rt_appraisals"] = array (
  'name' => 'rt_employees_rt_appraisals',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_appraisals',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => false,
  'vname' => 'LBL_RT_EMPLOYEES_RT_APPRAISALS_FROM_RT_EMPLOYEES_TITLE',
  'id_name' => 'rt_employees_rt_appraisalsrt_employees_ida',
);
$dictionary["RT_Appraisals"]["fields"]["rt_employees_rt_appraisals_name"] = array (
  'name' => 'rt_employees_rt_appraisals_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_EMPLOYEES_RT_APPRAISALS_FROM_RT_EMPLOYEES_TITLE',
  'save' => true,
  'id_name' => 'rt_employees_rt_appraisalsrt_employees_ida',
  'link' => 'rt_employees_rt_appraisals',
  'table' => 'rt_employees',
  'module' => 'RT_Employees',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["RT_Appraisals"]["fields"]["rt_employees_rt_appraisalsrt_employees_ida"] = array (
  'name' => 'rt_employees_rt_appraisalsrt_employees_ida',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_appraisals',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_APPRAISALS_FROM_RT_APPRAISALS_TITLE',
);
