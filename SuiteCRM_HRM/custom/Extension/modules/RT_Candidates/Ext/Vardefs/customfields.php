<?php
$dictionary["RT_Candidates"]["fields"]["ssn"] = array(
    'name' => 'ssn',
    'vname' => 'LBL_SSN',
    'type' => 'varchar',
    'comment' => 'SSN Number',
);
$dictionary["RT_Candidates"]["fields"]["cnic"] = array(
    'name' => 'cnic',
    'vname' => 'LBL_CNIC',
    'type' => 'varchar',
    'required' => true,
    'comment' => 'CNIC Number',
);
$dictionary["RT_Candidates"]["fields"]["currently_employed"] = array(
    'name' => 'currently_employed',
    'vname' => 'LBL_CURRENTLY_EMPLOYED',
    'type' => 'bool',
);
$dictionary["RT_Candidates"]["fields"]["current_employer"] = array(
    'name' => 'current_employer',
    'vname' => 'LBL_CURRENT_EMPLOYER',
    'type' => 'varchar',
);
$dictionary["RT_Candidates"]["fields"]["years_of_experience"] = array(
    'name' => 'years_of_experience',
    'vname' => 'LBL_YEARS_OF_EXPERIENCE',
    'type' => 'int',
);
$dictionary["RT_Candidates"]["fields"]["us_citizen"] = array(
    'name' => 'us_citizen',
    'vname' => 'LBL_US_CITIZEN',
    'type' => 'bool',
);
$dictionary["RT_Candidates"]["fields"]["education"] = array(
    'name' => 'education',
    'vname' => 'LBL_EDUCATION',
    'type' => 'enum',
    'options' => 'education_dom',
);
$dictionary["RT_Candidates"]["fields"]["visa_required"] = array(
    'name' => 'visa_required',
    'vname' => 'LBL_VISA_REQUIRED',
    'type' => 'bool',
);
?>