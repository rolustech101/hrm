<?php

$dictionary['RT_Candidates']['fields']['rt_qualifications'] = array(
    'name' => 'rt_qualifications',
    'type' => 'link',
    'relationship' => 'rt_qualifications_rt_candidates',
    'module'=>'RT_Qualifications',
    'bean_name'=>'RT_Qualifications',
    'source'=>'non-db',
    'vname'=>'LBL_RT_QUALIFICATIONS',
);
?>