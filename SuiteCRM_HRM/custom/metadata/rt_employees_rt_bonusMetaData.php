<?php
// created: 2016-10-17 14:14:49
$dictionary["rt_employees_rt_bonus"] = array (
  'true_relationship_type' => 'one-to-many',
  'relationships' => 
  array (
    'rt_employees_rt_bonus' => 
    array (
      'lhs_module' => 'RT_Employees',
      'lhs_table' => 'rt_employees',
      'lhs_key' => 'id',
      'rhs_module' => 'RT_Bonus',
      'rhs_table' => 'rt_bonus',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'rt_employees_rt_bonus_c',
      'join_key_lhs' => 'rt_employees_rt_bonusrt_employees_ida',
      'join_key_rhs' => 'rt_employees_rt_bonusrt_bonus_idb',
    ),
  ),
  'table' => 'rt_employees_rt_bonus_c',
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
      'name' => 'rt_employees_rt_bonusrt_employees_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'rt_employees_rt_bonusrt_bonus_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'rt_employees_rt_bonusspk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'rt_employees_rt_bonus_ida1',
      'type' => 'index',
      'fields' => 
      array (
        0 => 'rt_employees_rt_bonusrt_employees_ida',
      ),
    ),
    2 => 
    array (
      'name' => 'rt_employees_rt_bonus_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'rt_employees_rt_bonusrt_bonus_idb',
      ),
    ),
  ),
);