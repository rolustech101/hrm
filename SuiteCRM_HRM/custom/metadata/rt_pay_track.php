<?php
$dictionary["rt_pay_track"] = array (
    'table' => 'rt_pay_track',
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
                    'name' => 'date_entered',
                    'type' => 'datetime',
                    'len' => 36,
                ),
            2 =>
                array (
                    'name' => 'employee_id',
                    'type' => 'varchar',
                    'len' => 36,
                ),
            3 =>
                array (
                    'name' => 'payroll_id',
                    'type' => 'varchar',
                    'len' => 36,
                ),
            4 =>
                array (
                    'name' => 'month',
                    'type' => 'varchar',
                    'len' => 100,
                ),
            5 =>
                array (
                    'name' => 'year',
                    'type' => 'varchar',
                    'len' => 100,
                ),
            6 =>
                array (
                    'name' => 'salary',
                    'type' => 'varchar',
                    'len' => 9000,
                ),
            7 =>
                array (
                    'name' => 'bonus',
                    'type' => 'int',
                    'len' => 100,
                ),
            8 =>
                array (
                    'name' => 'tax',
                    'type' => 'double',
                    'len' => 100,
                ),
            9 =>
                array (
                    'name' => 'provident',
                    'type' => 'double',
                    'len' => 100,
                ),
            10 =>
                array (
                    'name' => 'casual_leaves',
                    'type' => 'int',
                    'len' => 100,
                ),
            11 =>
                array (
                    'name' => 'annual_leaves',
                    'type' => 'int',
                    'len' => 100,
                ),
            12 =>
                array (
                    'name' => 'casual_balance',
                    'type' => 'int',
                    'len' => 100,
                ),
            13 =>
                array (
                    'name' => 'annual_balance',
                    'type' => 'int',
                    'len' => 100,
                ),
            14 =>
                array (
                    'name' => 'total_minutes',
                    'type' => 'int',
                    'len' => 255,
                ),
            15 =>
                array (
                    'name' => 'per_hour_rate',
                    'type' => 'double',
                    'len' => 255,
                ),
            16 =>
                array (
                    'name' => 'stipend',
                    'type' => 'int',
                    'len' => 255,
                ),
            17 =>
                array (
                    'name' => 'salary_paid',
                    'type' => 'int',
                    'len' => 100,
                ),
            18 =>
                array (
                    'name' => 'employment_type',
                    'type' => 'varchar',
                    'len' => 100,
                ),
        ),
    'indices' =>
        array (
            0 =>
                array (
                    'name' => 'idpk',
                    'type' => 'primary',
                    'fields' =>
                        array (
                            0 => 'id',
                        ),
                ),
        ),
);
?>