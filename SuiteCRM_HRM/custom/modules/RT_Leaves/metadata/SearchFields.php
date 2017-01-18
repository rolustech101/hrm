<?php
// created: 2012-02-01 04:47:04
$searchFields['RT_Leaves'] = array(
    'name' =>
        array(
            'query_type' => 'default',
        ),
    'current_user_only' =>
        array(
            'query_type' => 'default',
            'db_field' =>
                array(
                    0 => 'assigned_user_id',
                ),
            'my_items' => true,
            'vname' => 'LBL_CURRENT_USER_FILTER',
            'type' => 'bool',
        ),
    'assigned_user_id' =>
        array(
            'query_type' => 'default',
        ),
    'range_date_entered' =>
        array(
            'query_type' => 'default',
            'enable_range_search' => true,
            'is_date_field' => true,
        ),
    'start_range_date_entered' =>
        array(
            'query_type' => 'default',
            'enable_range_search' => true,
            'is_date_field' => true,
        ),
    'end_range_date_entered' =>
        array(
            'query_type' => 'default',
            'enable_range_search' => true,
            'is_date_field' => true,
        ),
    'range_date_modified' =>
        array(
            'query_type' => 'default',
            'enable_range_search' => true,
            'is_date_field' => true,
        ),
    'start_range_date_modified' =>
        array(
            'query_type' => 'default',
            'enable_range_search' => true,
            'is_date_field' => true,
        ),
    'end_range_date_modified' =>
        array(
            'query_type' => 'default',
            'enable_range_search' => true,
            'is_date_field' => true,
        ),
    'year_of_leave' =>
        array(
            'query_type' => 'default',
            'operator' => 'subquery',
            'subquery' => 'select leave_start_date_c from rt_leaves left join rt_leaves_cstm on id = id_c where rt_leaves.deleted = 0 AND status_c = \'Taken\' AND leave_start_date_c LIKE',
            'db_field' => array(
                'rt_leaves_cstm.leave_start_date_c',
            ),
        ),
);
?>
