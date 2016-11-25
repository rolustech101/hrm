<?php
/*$dictionary['RT_Employees']['fields']['employee_id'] = array (
    'name' => 'employee_id',
    'type' => 'link',
    'relationship' => 'employees_issues', 
    'module'=>'a_Issues',
    'source'=>'non-db',
	'vname'=>'LBL_EMPLOYEE_NAME',
     );
$dictionary['RT_Employees']['relationships']['employees_issues'] = array(
        'lhs_module'=> 'RT_Employees',
        'lhs_table'=> 'rt_employees',
        'lhs_key' => 'id',
        'rhs_module'=> 'a_Issues',
        'rhs_table'=> 'a_issues',
        'rhs_key' => 'employee_id',
        'relationship_type'=>'one-to-many'
    ); */
$dictionary['RT_Employees']['fields']['salary'] = array (
    'name' => 'salary',
    'type' => 'varchar',
	'vname'=>'LBL_SALARY',
     );
$dictionary['RT_Employees']['fields']['amount_salary'] = array (
    'name' => 'amount_salary',
    'type' => 'varchar',
	'source' => 'non-db',
	'vname'=>'LBL_AMOUNT_SALARY',
     );
$dictionary['RT_Employees']['fields']['label_salary'] = array (
    'name' => 'label_salary',
    'type' => 'varchar',
	'source' => 'non-db',
	'vname'=>'LBL_LABEL_SALARY',
     );	
$dictionary['RT_Employees']['fields']['taxable_salary'] = array (
    'name' => 'taxable_salary',
    'type' => 'bool',
	'source' => 'non-db',
	'vname'=>'LBL_TAXABLE_SALARY',
     );	
$dictionary['RT_Employees']['fields']['tax'] = array (
    'name' => 'tax',
    'type' => 'varchar',
	'vname'=>'LBL_TAX',
     );
$dictionary['RT_Employees']['fields']['provident_fund'] = array (
    'name' => 'provident_fund',
    'type' => 'varchar',
	'vname'=>'LBL_PROVIDENT_FUND',
     );
$dictionary['RT_Employees']['fields']['rtemployee_id'] = array (
	'name' => 'rtemployee_id',
	'type' => 'varchar',
	'vname'=>'LBL_RTEMPLOYEE_ID',
);
$dictionary['RT_Employees']['fields']['appraisal_date'] = array (
	'name' => 'appraisal_date',
	'type' => 'date',
	'vname'=>'LBL_APPRAISAL_DATE',
);
?>
