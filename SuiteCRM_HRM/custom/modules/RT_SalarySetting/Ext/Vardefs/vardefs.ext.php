<?php 
 //WARNING: The contents of this file are auto-generated


$dictionary["RT_SalarySetting"]["fields"]["tax_rate"] = array (
		 'name' => 'tax_rate',
		 'vname' => 'LBL_TAX_RATE',
		 'type' => 'float',
		'comment' => 'Income Tax Rate',
);
$dictionary["RT_SalarySetting"]["fields"]["provident_fund"] = array (
		 'name' => 'provident_fund',
		 'vname' => 'LBL_PROVIDENT_FUND',
		 'type' => 'int',
		'comment' => 'Provident Fund',
);
$dictionary["RT_SalarySetting"]["fields"]["sal_from"] = array (
		 'name' => 'sal_from',
		 'vname' => 'LBL_SALARY_FROM',
		 'type' => 'int',
		'comment' => 'Salary Range From',
		'required' => true,
);
$dictionary["RT_SalarySetting"]["fields"]["sal_to"] = array (
		 'name' => 'sal_to',
		 'vname' => 'LBL_SALARY_TO',
		 'type' => 'int',
		'comment' => 'Salary Range From',
		'required' => true,
);
$dictionary["RT_SalarySetting"]["fields"]["fix_amount"] = array (
		 'name' => 'fix_amount',
		 'vname' => 'LBL_FIX_AMOUNT',
		 'type' => 'double',
		'comment' => 'Fix amount for tax range',
);
$dictionary["RT_SalarySetting"]["fields"]["country"] = array (
	'name' => 'country',
	'vname' => 'LBL_COUNTRY',
	'type' => 'varchar',
	'comment' => 'country for tax',
);
$dictionary["RT_SalarySetting"]["fields"]["filling_status"] = array (
    'name' => 'filling_status',
    'vname' => 'LBL_FILLING_STATUS',
    'type' => 'varchar',
    'comment' => 'filling status',
);


?>