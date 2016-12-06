<?php

$dictionary['Note']['relationships']['notes_rt_job_application']['lhs_module'] = 'RT_Job_Application';
$dictionary['Note']['relationships']['notes_rt_job_application']['lhs_table'] = 'rt_job_application';
$dictionary['Note']['relationships']['notes_rt_job_application']['lhs_key'] = 'id';
$dictionary['Note']['relationships']['notes_rt_job_application']['rhs_module'] = 'Notes';
$dictionary['Note']['relationships']['notes_rt_job_application']['rhs_table'] = 'notes';
$dictionary['Note']['relationships']['notes_rt_job_application']['rhs_key'] = 'parent_id';
$dictionary['Note']['relationships']['notes_rt_job_application']['relationship_type'] = 'one-to-many';
$dictionary['Note']['relationships']['notes_rt_job_application']['relationship_role_column'] = 'parent_type';
$dictionary['Note']['relationships']['notes_rt_job_application']['relationship_role_column_value'] = 'RT_Job_Application';

$dictionary['Note']['fields']['rt_job_application']['name'] = 'rt_job_application';
$dictionary['Note']['fields']['rt_job_application']['type'] = 'link';
$dictionary['Note']['fields']['rt_job_application']['relationship'] = 'notes_rt_job_application';
$dictionary['Note']['fields']['rt_job_application']['bean_name'] = 'RT_Job_Application';
$dictionary['Note']['fields']['rt_job_application']['source'] = 'non-db';
$dictionary['Note']['fields']['rt_job_application']['vname'] = 'LBL_RT_Job_Application';