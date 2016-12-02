<?php 
 //WARNING: The contents of this file are auto-generated


$dictionary['Document']['fields']['parent_name'] = array(
    'required' => false,
    'source' => 'non-db',
    'name' => 'parent_name',
    'vname' => 'LBL_DOCUMENTS_C',
    'type' => 'parent',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => '0',
    'audited' => false,
    'reportable' => true,
    'len' => 25,
    'size' => '20',
    'options' => 'Documents_options',
    'studio' => 'visible',
    'type_name' => 'parent_type',
    'id_name' => 'parent_id',
    'parent_type' => 'Documents_options',
);
$dictionary['Document']['fields']['parent_type'] = array(
    'required' => false,
    'name' => 'parent_type',
    'vname' => 'LBL_PARENT_TYPE',
    'type' => 'parent_type',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => 0,
    'audited' => false,
    'reportable' => true,
    'len' => 255,
    'size' => '20',
    'dbType' => 'varchar',
    'studio' => 'hidden',
);
$dictionary['Document']['fields']['parent_id'] = array(
    'required' => false,
    'name' => 'parent_id',
    'vname' => 'LBL_PARENT_ID',
    'type' => 'id',
    'massupdate' => 0,
    'comments' => '',
    'help' => '',
    'importable' => 'true',
    'duplicate_merge' => 'disabled',
    'duplicate_merge_dom_value' => 0,
    'audited' => false,
    'reportable' => true,
    'len' => 36,
    'size' => '20',
);
$dictionary['Document']['fields']['rt_employees'] = array(
    'name' => 'rt_employees',
    'type' => 'link',
    'relationship' => 'documents_rt_employees',
    'module'=>'RT_Employees',
    'bean_name'=>'Contact',
    'source'=>'non-db',
    'vname'=>'LBL_RT_EEMPLOYEES',
);
$dictionary['Document']['fields']['rt_job_application'] = array(
    'name' => 'rt_job_application',
    'type' => 'link',
    'relationship' => 'documents_rt_job_application',
    'module'=>'RT_Job_Application',
    'bean_name'=>'Lead',
    'source'=>'non-db',
    'vname'=>'LBL_RT_Job_Application',
);
$dictionary['Document']['relationships']['documents_rt_employees'] = array(
    'lhs_module'		=> 'Documents',
    'lhs_table'			=> 'documents',
    'lhs_key'			=> 'parent_id',
    'rhs_module'		=> 'RT_Employees',
    'rhs_table'			=> 'rt_employees',
    'rhs_key'			=> 'id',
    'relationship_type'	=> 'one-to-many',
    'relationship_role_column'=>'parent_type',
    'relationship_role_column_value'=>'RT_Employees'
);
$dictionary['Document']['relationships']['documents_rt_job_application'] = array(
    'lhs_module'		=> 'Documents',
    'lhs_table'			=> 'documents',
    'lhs_key'			=> 'parent_id',
    'rhs_module'		=> 'RT_Job_Application',
    'rhs_table'			=> 'rt_job_application',
    'rhs_key'			=> 'id',
    'relationship_type'	=> 'one-to-many',
    'relationship_role_column'=>'parent_type',
    'relationship_role_column_value'=>'RT_Job_Application'
);

/*// created: 2016-10-17 14:14:50
$dictionary["Document"]["fields"]["rt_employees_documents"] = array (
  'name' => 'rt_employees_documents',
  'type' => 'link',
  'relationship' => 'rt_employees_documents',
  'source' => 'non-db',
  'module' => 'RT_Employees',
  'bean_name' => false,
  'vname' => 'LBL_RT_EMPLOYEES_DOCUMENTS_FROM_RT_EMPLOYEES_TITLE',
  'id_name' => 'rt_employees_documentsrt_employees_ida',
);
$dictionary["Document"]["fields"]["rt_employees_documents_name"] = array (
  'name' => 'rt_employees_documents_name',
  'type' => 'relate',
  'source' => 'non-db',
  'vname' => 'LBL_RT_EMPLOYEES_DOCUMENTS_FROM_RT_EMPLOYEES_TITLE',
  'save' => true,
  'id_name' => 'rt_employees_documentsrt_employees_ida',
  'link' => 'rt_employees_documents',
  'table' => 'rt_employees',
  'module' => 'RT_Employees',
  'rname' => 'name',
  'db_concat_fields' => 
  array (
    0 => 'first_name',
    1 => 'last_name',
  ),
);
$dictionary["Document"]["fields"]["rt_employees_documentsrt_employees_ida"] = array (
  'name' => 'rt_employees_documentsrt_employees_ida',
  'type' => 'link',
  'relationship' => 'rt_employees_documents',
  'source' => 'non-db',
  'reportable' => false,
  'side' => 'right',
  'vname' => 'LBL_RT_EMPLOYEES_DOCUMENTS_FROM_DOCUMENTS_TITLE',
);*/

?>