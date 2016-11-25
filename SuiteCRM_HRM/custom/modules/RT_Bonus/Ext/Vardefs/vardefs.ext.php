<?php 
 //WARNING: The contents of this file are auto-generated


// created: 2016-10-17 14:14:49
$dictionary["RT_Bonus"]["fields"]["rt_employees_rt_bonus"] = array (
  'name' => 'rt_employees_rt_bonus',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_bonus',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => false,
  'vname' => 'LBL_RT_EMPLOYEES_RT_BONUS_FROM_RT_EMPLOYEES_TITLE',
  'id_name' => 'rt_employees_rt_bonusrt_employees_ida',
);
$dictionary["RT_Bonus"]["fields"]["rt_employees_rt_bonus_name"] = array (
  'name' => 'rt_employees_rt_bonus_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_EMPLOYEES_RT_BONUS_FROM_RT_EMPLOYEES_TITLE',
  'save' => true,
  'id_name' => 'rt_employees_rt_bonusrt_employees_ida',
  'link' => 'rt_employees_rt_bonus',
  'table' => 'rt_employees',
  'module' => 'RT_Employees',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["RT_Bonus"]["fields"]["rt_employees_rt_bonusrt_employees_ida"] = array (
  'name' => 'rt_employees_rt_bonusrt_employees_ida',
  'type' => 'link',
  'relationship' => 'rt_employees_rt_bonus',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_RT_BONUS_FROM_RT_BONUS_TITLE',
);


// created: 2016-11-09 19:01:06
$dictionary["RT_Bonus"]["fields"]["rt_bonus_rt_employees"] = array (
  'name' => 'rt_bonus_rt_employees',
  'type' => 'link',
  'relationship' => 'rt_bonus_rt_employees',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => 'RT_Employees',
  'vname' => 'LBL_RT_BONUS_RT_EMPLOYEES_FROM_RT_EMPLOYEES_TITLE',
  'id_name' => 'rt_bonus_rt_employeesrt_employees_ida',
);
$dictionary["RT_Bonus"]["fields"]["rt_bonus_rt_employees_name"] = array (
  'name' => 'rt_bonus_rt_employees_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_BONUS_RT_EMPLOYEES_FROM_RT_EMPLOYEES_TITLE',
  'save' => true,
  'id_name' => 'rt_bonus_rt_employeesrt_employees_ida',
  'link' => 'rt_bonus_rt_employees',
  'table' => 'rt_employees',
  'module' => 'RT_Employees',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["RT_Bonus"]["fields"]["rt_bonus_rt_employeesrt_employees_ida"] = array (
  'name' => 'rt_bonus_rt_employeesrt_employees_ida',
  'type' => 'link',
  'relationship' => 'rt_bonus_rt_employees',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_BONUS_RT_EMPLOYEES_FROM_RT_BONUS_TITLE',
);


$dictionary["RT_Bonus"]["fields"]["amount"] = array (
		 'name' => 'amount',
		 'vname' => 'LBL_AMOUNT',
		 'type' => 'int',
		'comment' => 'Bonus Amount',
);
$dictionary["RT_Bonus"]["fields"]["bonus_date"] = array (
		 'name' => 'bonus_date',
		 'vname' => 'LBL_DATE',
		 'type' => 'date',
		'comment' => 'Bonus Date',
);

?>