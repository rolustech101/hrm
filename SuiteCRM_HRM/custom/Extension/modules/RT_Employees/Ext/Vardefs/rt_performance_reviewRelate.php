<?php
$dictionary['RT_Employees']['fields']['rt_performance_review'] = array(
    'name' => 'rt_performance_review_name',
    'type' => 'link',
    'relationship' => 'rt_performance_reviews_rt_employees',
    'module' => 'RT_Performance_Reviews',
    'bean_name' => 'RT_Performance_Reviews',
    'source' => 'non-db',
    'vname' => 'LBL_RT_PERFORMANCE_REVIEW_NAME',
);