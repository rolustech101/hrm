<?php
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
