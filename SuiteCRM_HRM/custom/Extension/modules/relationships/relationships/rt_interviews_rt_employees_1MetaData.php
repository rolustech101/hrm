<?php
// created: 2017-01-16 12:28:43
$dictionary["rt_interviews_rt_employees_1"] = array (
  'true_relationship_type' => 'many-to-many',
  'from_studio' => true,
  'relationships' => 
  array (
    'rt_interviews_rt_employees_1' => 
    array (
      'lhs_module' => 'RT_Interviews',
      'lhs_table' => 'rt_interviews',
      'lhs_key' => 'id',
      'rhs_module' => 'RT_Employees',
      'rhs_table' => 'rt_employees',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'rt_interviews_rt_employees_1_c',
      'join_key_lhs' => 'rt_interviews_rt_employees_1rt_interviews_ida',
      'join_key_rhs' => 'rt_interviews_rt_employees_1rt_employees_idb',
    ),
  ),
  'table' => 'rt_interviews_rt_employees_1_c',
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
      'name' => 'rt_interviews_rt_employees_1rt_interviews_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'rt_interviews_rt_employees_1rt_employees_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'rt_interviews_rt_employees_1spk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'rt_interviews_rt_employees_1_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'rt_interviews_rt_employees_1rt_interviews_ida',
        1 => 'rt_interviews_rt_employees_1rt_employees_idb',
      ),
    ),
  ),
);