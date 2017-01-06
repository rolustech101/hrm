<?php
// created: 2017-01-04 12:43:58
$dictionary["rt_employees_rt_performance_reviews_1"] = array (
  'true_relationship_type' => 'many-to-many',
  'from_studio' => true,
  'relationships' => 
  array (
    'rt_employees_rt_performance_reviews_1' => 
    array (
      'lhs_module' => 'RT_Employees',
      'lhs_table' => 'rt_employees',
      'lhs_key' => 'id',
      'rhs_module' => 'RT_Performance_Reviews',
      'rhs_table' => 'rt_performance_reviews',
      'rhs_key' => 'id',
      'relationship_type' => 'many-to-many',
      'join_table' => 'rt_employees_rt_performance_reviews_1_c',
      'join_key_lhs' => 'rt_employees_rt_performance_reviews_1rt_employees_ida',
      'join_key_rhs' => 'rt_employees_rt_performance_reviews_1rt_performance_reviews_idb',
    ),
  ),
  'table' => 'rt_employees_rt_performance_reviews_1_c',
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
      'name' => 'rt_employees_rt_performance_reviews_1rt_employees_ida',
      'type' => 'varchar',
      'len' => 36,
    ),
    4 => 
    array (
      'name' => 'rt_employees_rt_performance_reviews_1rt_performance_reviews_idb',
      'type' => 'varchar',
      'len' => 36,
    ),
  ),
  'indices' => 
  array (
    0 => 
    array (
      'name' => 'rt_employees_rt_performance_reviews_1spk',
      'type' => 'primary',
      'fields' => 
      array (
        0 => 'id',
      ),
    ),
    1 => 
    array (
      'name' => 'rt_employees_rt_performance_reviews_1_alt',
      'type' => 'alternate_key',
      'fields' => 
      array (
        0 => 'rt_employees_rt_performance_reviews_1rt_employees_ida',
        1 => 'rt_employees_rt_performance_reviews_1rt_performance_reviews_idb',
      ),
    ),
  ),
);