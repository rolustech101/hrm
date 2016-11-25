<?php
$dictionary["rt_review_forms"] = array (
    'table' => 'rt_review_forms',
    'fields' =>
        array (
            0 =>
                array (
                    'name' => 'id',
                    'type' => 'varchar',
                    'len' => 36,
                ),
            2 =>
                array (
                    'name' => 'name',
                    'type' => 'varchar',
                    'len' => 100,
                ),
            3 =>
                array (
                    'name' => 'date_entered',
                    'type' => 'datetime',
                    'len' => 36,
                ),
            4 =>
                array (
                    'name' => 'user_id',
                    'type' => 'varchar',
                    'len' => 36,
                ),
            5 =>
                array (
                    'name' => 'form_meta',
                    'type' => 'varchar',
                    'len' => 10000,
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
            1 =>
                array (
                    'name' => 'user_idindex',
                    'type' => 'index',
                    'fields' =>
                        array (
                            0 => 'user_id',
                        ),
                ),
        ),
);
?>