<?php
$dictionary['RT_Jobs']['fields']['rt_vacancies'] = array(
    'name'          => 'rt_vacancies',
    'type'          => 'link',
    'relationship'  => 'rt_vacancies_rt_jobs',
    'module'        => 'RT_Vacancies',
    'bean_name'     => 'RT_Vacancies',
    'source'        => 'non-db',
    'vname'         => 'LBL_RT_JOBS',
);