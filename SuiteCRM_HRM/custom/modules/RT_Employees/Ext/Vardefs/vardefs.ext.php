<?php 
 //WARNING: The contents of this file are auto-generated


$dictionary['RT_Employees']['fields']['entitled_casual_leaves_c']['required']=true;




/*// created: 2016-10-17 14:14:50
$dictionary["RT_Employees"]["fields"]["rt_employees_documents"] = array (
  'name' => 'rt_employees_documents',
  'type' => 'link',
  'relationship' => 'rt_employees_documents',
  'source' => 'non-db',
  'module' => 'Documents',
  'bean_name' => 'Document',
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_DOCUMENTS_FROM_DOCUMENTS_TITLE',
);*/


// created: 2016-10-17 14:14:49
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_payroll"] = array (
  'name' => 'rt_employees_rt_payroll',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_payroll',
  'source' => 'non-db',
  'module' => 'RT_Payroll',
  'bean_name' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_PAYROLL_FROM_RT_PAYROLL_TITLE',
);


$dictionary['RT_Employees']['fields']['rt_performance_review'] = array(
    'name' => 'rt_performance_review_name',
    'type' => 'link',
    'relationship' => 'rt_performance_reviews_rt_employees',
    'module' => 'RT_Performance_Reviews',
    'bean_name' => 'RT_Performance_Reviews',
    'source' => 'non-db',
    'vname' => 'LBL_RT_PERFORMANCE_REVIEW_NAME',
);

// created: 2016-10-17 14:14:50
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_deductables"] = array (
  'name' => 'rt_employees_rt_deductables',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_deductables',
  'source' => 'non-db',
  'module' => 'RT_Deductables',
  'bean_name' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_DEDUCTABLES_FROM_RT_DEDUCTABLES_TITLE',
);


 // created: 2012-02-23 09:42:48
$dictionary['RT_Employees']['fields']['phone_mobile']['required']=true;

 


$dictionary['RT_Employees']['fields']['entitled_annual_leaves_c']['required']=true;



 // created: 2012-02-23 09:41:25
$dictionary['RT_Employees']['fields']['primary_address_street']['required']=true;

 


// created: 2016-11-09 19:01:06
$dictionary["RT_Employees"]["fields"]["rt_bonus_rt_employees"] = array (
  'name' => 'rt_bonus_rt_employees',
  'type' => 'link',
  'relationship' => 'rt_bonus_rt_employees',
  'source' => 'non-db',
  'module' => 'RT_Bonus',
  'bean_name' => 'RT_Bonus',
  'side' => 'right',
  'vname' => 'LBL_RT_BONUS_RT_EMPLOYEES_FROM_RT_BONUS_TITLE',
);


// created: 2016-12-07 14:59:02
$dictionary["RT_Employees"]["fields"]["rt_interviews_rt_employees_1"] = array (
  'name' => 'rt_interviews_rt_employees_1',
  'type' => 'link',
  'relationship' => 'rt_interviews_rt_employees_1',
  'source' => 'non-db',
  'module' => 'RT_Interviews',
  'bean_name' => 'RT_Interviews',
  'vname' => 'LBL_RT_INTERVIEWS_RT_EMPLOYEES_1_FROM_RT_INTERVIEWS_TITLE',
);


 // created: 2012-02-23 09:41:25
$dictionary['RT_Employees']['fields']['primary_address_country']['required']=true;
$dictionary['RT_Employees']['fields']['primary_address_country']['type']='enum';
$dictionary['RT_Employees']['fields']['primary_address_country']['options']='countries_dom';

 


// created: 2016-10-17 14:14:49
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_leaves"] = array (
  'name' => 'rt_employees_rt_leaves',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_leaves',
  'source' => 'non-db',
  'module' => 'RT_Leaves',
  'bean_name' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_LEAVES_FROM_RT_LEAVES_TITLE',
);


// created: 2016-11-10 12:03:21
$dictionary["RT_Employees"]["fields"]["rt_increment_history_rt_employees"] = array (
  'name' => 'rt_increment_history_rt_employees',
  'type' => 'link',
  'relationship' => 'rt_increment_history_rt_employees',
  'source' => 'non-db',
  'module' => 'RT_Increment_History',
  'bean_name' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_INCREMENT_HISTORY_RT_EMPLOYEES_FROM_RT_INCREMENT_HISTORY_TITLE',
);


// created: 2016-10-17 14:14:49
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_bonus"] = array (
  'name' => 'rt_employees_rt_bonus',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_bonus',
  'source' => 'non-db',
  'module' => 'RT_Bonus',
  'bean_name' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_BONUS_FROM_RT_BONUS_TITLE',
);



    $dictionary["RT_Employees"]["fields"]["casual_leave_balance"] = array (
        'name' => 'casual_leave_balance',
        'vname' => 'Casual Leave Balance',
        'type' => 'varchar',
        'len' => '150',
        'readonly' => true,

    );
    $dictionary["RT_Employees"]["fields"]["annual_leave_balance"] = array (
        'name' => 'annual_leave_balance',
        'vname' => 'Annual Leave Balance',
        'type' => 'varchar',
        'len' => '150',
        'readonly' => 'true',

    );



$dictionary["RT_Employees"]["fields"]["phone_extension"] = array (
		 'name' => 'phone_extension',
		 'vname' => 'LBL_PHONE_EXTENSION',
		 'type' => 'varchar',
		'comment' => 'Phone Extension',
);



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



 // created: 2012-02-28 07:22:09
$dictionary['RT_Employees']['fields']['employment_status']['default']='Active';
$dictionary['RT_Employees']['fields']['employment_status']['options']='employee_status_dom';
$dictionary['RT_Employees']['fields']['employment_status']['audited']=true;

 


// created: 2016-10-17 14:14:50
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_employees"] = array (
  'name' => 'rt_employees_rt_employees',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_employees',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => false,
  'vname' => 'LBL_RT_EMPLOYEES_RT_EMPLOYEES_FROM_RT_EMPLOYEES_L_TITLE',
  'id_name' => 'rt_employees_rt_employeesrt_employees_ida',
);
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_employees_name"] = array (
  'name' => 'rt_employees_rt_employees_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_EMPLOYEES_RT_EMPLOYEES_FROM_RT_EMPLOYEES_L_TITLE',
  'save' => true,
  'id_name' => 'rt_employees_rt_employeesrt_employees_ida',
  'link' => 'rt_employees_rt_employees',
  'table' => 'rt_employees',
  'module' => 'RT_Employees',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_employeesrt_employees_ida"] = array (
  'name' => 'rt_employees_rt_employeesrt_employees_ida',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_employees',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_EMPLOYEES_FROM_RT_EMPLOYEES_R_TITLE',
);


// created: 2016-10-17 14:14:49
$dictionary["RT_Employees"]["fields"]["rt_employees_rt_appraisals"] = array (
  'name' => 'rt_employees_rt_appraisals',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_appraisals',
  'source' => 'non-db',
  'module' => 'RT_Appraisals',
  'bean_name' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_APPRAISALS_FROM_RT_APPRAISALS_TITLE',
);


// created: 2016-11-10 17:55:02
$dictionary["RT_Employees"]["fields"]["rt_departments_rt_employees"] = array (
  'name' => 'rt_departments_rt_employees',
  'type' => 'link',
  'relationship' => 'rt_departments_rt_employees',
  'source' => 'non-db',
  'module' => 'RT_Departments',
  'bean_name' => false,
  'vname' => 'LBL_RT_DEPARTMENTS_RT_EMPLOYEES_FROM_RT_DEPARTMENTS_TITLE',
  'id_name' => 'rt_departments_rt_employeesrt_departments_ida',
);
$dictionary["RT_Employees"]["fields"]["rt_departments_rt_employees_name"] = array (
  'name' => 'rt_departments_rt_employees_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_DEPARTMENTS_RT_EMPLOYEES_FROM_RT_DEPARTMENTS_TITLE',
  'save' => true,
  'id_name' => 'rt_departments_rt_employeesrt_departments_ida',
  'link' => 'rt_departments_rt_employees',
  'table' => 'rt_departments',
  'module' => 'RT_Departments',
  'rname' => 'name',
);
$dictionary["RT_Employees"]["fields"]["rt_departments_rt_employeesrt_departments_ida"] = array (
  'name' => 'rt_departments_rt_employeesrt_departments_ida',
  'type' => 'link',
  'relationship' => 'rt_departments_rt_employees',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_DEPARTMENTS_RT_EMPLOYEES_FROM_RT_EMPLOYEES_TITLE',
);



$dictionary["RT_Employees"]["fields"]["email1"]['required'] = true;


?>