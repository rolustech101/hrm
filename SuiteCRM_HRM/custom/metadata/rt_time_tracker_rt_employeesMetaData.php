<?php
// created: 2017-01-10 11:55:34
$dictionary["rt_time_tracker_rt_employees"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'rt_time_tracker_rt_employees' => 
    array (
      'lhs_module' => 'RT_Employees',
      'lhs_table' => 'rt_employees',
      'lhs_key' => 'id',
      'rhs_module' => 'RT_Time_Tracker',
      'rhs_table' => 'rt_time_tracker',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'rt_time_tracker_rt_employees_c',
      'join_key_lhs' => 'rt_time_tracker_rt_employeesrt_employees_ida',
      'join_key_rhs' => 'rt_time_tracker_rt_employeesrt_time_tracker_idb',
    ),
  ),
  'table' => 'rt_time_tracker_rt_employees_c',
  'fields' => 
  array (
    0 => 
    array (
      'name' => 'id',
      'type' => 'varchar',
      'len' => 36,
    ),
    1 => 
    array (
      'name' => 'date_modified',
      'type' => 'datetime',
    ),
    2 => 
    array (
      'name' => 'deleted',
      'type' => 'bool',
      'len' => '1',
      'default' => '0',
      'required' => true,
    ),
    3 => 
    array (
      'name' => 'rt_time_tracker_rt_employeesrt_employees_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'rt_time_tracker_rt_employeesrt_time_tracker_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'rt_time_tracker_rt_employeesspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'rt_time_tracker_rt_employees_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'rt_time_tracker_rt_employeesrt_employees_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'rt_time_tracker_rt_employees_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'rt_time_tracker_rt_employeesrt_time_tracker_idb',
      ),
    ),
  ),
);