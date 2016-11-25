<?php 
 //WARNING: The contents of this file are auto-generated


$dictionary['RT_Pay_Tracker']['fields'] = array (
    'employee_id' =>
        array (
            'name' => 'employee_id',
            'vname' => 'LBL_EMPLOYEE_ID',
            'type' => 'varchar',
            'required'=>false,
            'reportable'=>false,
        ),
    'payroll_id' =>
        array (
            'name' => 'payroll_id',
            'vname' => 'LBL_PAYROLL_ID',
            'type' => 'varchar',
            'required'=>false,
            'reportable'=>false,
        ),
    'month' =>
        array (
            'name' => 'month',
            'vname' => 'LBL_MONTH',
            'type' => 'enum',
            'options' => 'dom_cal_month_long',
            'required'=>false,
            'reportable'=>false,
        ),
    'year' =>
        array (
            'name' => 'year',
            'vname' => 'LBL_YEAR',
            'type' => 'enum',
            'options' => 'year_options',
            'required'=>false,
            'reportable'=>false,
        ),
    'salary' =>
        array (
            'name' => 'salary',
            'vname' => 'LBL_SALARY',
            'type' => 'varchar',
            'required'=>false,
            'reportable'=>false,
        ),
    'bonus' =>
        array (
            'name' => 'bonus',
            'vname' => 'LBL_BONUS',
            'type' => 'int',
            'required'=>false,
            'reportable'=>false,
        ),
    'tax' =>
        array (
            'name' => 'tax',
            'vname' => 'LBL_TAX',
            'type' => 'float',
            'required'=>false,
            'reportable'=>false,
        ),
    'provident' =>
        array (
            'name' => 'provident',
            'vname' => 'LBL_PROVIDENT',
            'type' => 'float',
            'required'=>false,
            'reportable'=>false,
        ),
    'casual_leaves' =>
        array (
            'name' => 'casual_leaves',
            'vname' => 'LBL_CASUAL_LEAVES',
            'type' => 'int',
            'required'=>false,
            'reportable'=>false,
        ),
    'annual_leaves' =>
        array (
            'name' => 'annual_leaves',
            'vname' => 'LBL_ANNUAL_LEAVES',
            'type' => 'int',
            'required'=>false,
            'reportable'=>false,
        ),
    'casual_balance' =>
        array (
            'name' => 'casual_balance',
            'vname' => 'LBL_CASUAL_BALANCE',
            'type' => 'int',
            'required'=>false,
            'reportable'=>false,
        ),
    'annual_balance' =>
        array (
            'name' => 'annual_balance',
            'vname' => 'LBL_ANNUAL_BALANCE',
            'type' => 'int',
            'required'=>false,
            'reportable'=>false,
        ),
    'salary_paid' =>
        array (
            'name' => 'salary_paid',
            'vname' => 'LBL_SALARY_PAID',
            'type' => 'int',
            'required'=>false,
            'reportable'=>false,
        ),
);

?>