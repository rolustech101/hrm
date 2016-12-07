<?php
$dictionary['RT_Interviews']['fields']['rt_vacancy_name'] = array(
    'required'  => false,
    'source'    => 'non-db',
    'name'      => 'rt_vacancy_name',
    'vname'     => 'LBL_RT_VACANCY_NAME',
    'type'      => 'relate',
    'rname'     => 'name',
    'id_name'   => 'rt_vacancy_id',
    'join_name' => 'rt_vacancies',
    'link'      => 'rt_vacancies',
    'table'     => 'rt_vacancies',
    'isnull'    => 'true',
    'module'    => 'RT_Vacancies',
);
$dictionary['RT_Interviews']['fields']['rt_vacancy_id'] = array(
    'name'              => 'rt_vacancy_id',
    'rname'             => 'id',
    'vname'             => 'LBL_RT_VACANCY_ID',
    'type'              => 'id',
    'table'             => 'rt_vacancies',
    'isnull'            => 'true',
    'module'            => 'RT_Vacancies',
    'dbType'            => 'id',
    'reportable'        => false,
    'massupdate'        => false,
    'duplicate_merge'   => 'disabled',
);
$dictionary['RT_Interviews']['fields']['rt_vacancies'] = array(
    'name'          => 'rt_vacancies',
    'type'          => 'link',
    'relationship'  => 'rt_interviews_rt_vacancies',
    'module'        => 'RT_Vacancies',
    'bean_name'     => 'RT_Vacancies',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_VACANCY',
);
$dictionary['RT_Interviews']['relationships']['rt_interviews_rt_vacancy'] = array(
    'lhs_module'		=> 'RT_Interviews',
    'lhs_table'			=> 'rt_interviews',
    'lhs_key'			=> 'rt_vacancy_id',
    'rhs_module'		=> 'RT_Vacancies',
    'rhs_table'			=> 'rt_vacancies',
    'rhs_key'			=> 'id',
    'relationship_type'	=> 'one-to-many',
);