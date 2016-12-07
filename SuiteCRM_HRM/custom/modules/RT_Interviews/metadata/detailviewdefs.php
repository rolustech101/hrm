<?php
$module_name = 'RT_Interviews';
$viewdefs [$module_name] = 
array (
  'DetailView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'buttons' => 
        array (
          0 => 'EDIT',
          1 => 'DUPLICATE',
          2 => 'DELETE',
        ),
      ),
      'maxColumns' => '2',
      'widths' => 
      array (
        0 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
        1 => 
        array (
          'label' => '10',
          'field' => '30',
        ),
      ),
      'useTabs' => false,
    ),
    'panels' => 
    array (
      'default' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'rt_candidate_name',
          ),
          1 => 
          array (
            'name' => 'date_entered',
            'customCode' => '{$fields.date_entered.value} {$APP.LBL_BY} {$fields.created_by_name.value}',
            'label' => 'LBL_DATE_ENTERED',
          ),
        ),
        2 =>
        array (
          0 => 
          array (
            'name' => 'date_of_interview_c',
            'label' => 'LBL_DATE_OF_INTERVIEW',
          ),
        ),
        3 =>
        array (
          0 => 
          array (
            'name' => 'rt_vacancy_name',
            'label' => 'LBL_VACANCY_NAME',
          ),
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'score_c',
            'label' => 'LBL_SCORE',
          ),
        ),
        6 => 
        array (
          0 => 
          array (
            'name' => 'status_c',
            'studio' => 'visible',
            'label' => 'LBL_STATUS',
          ),
          1 => '',
        ),
        7 => 
        array (
          0 => 
          array (
            'name' => 'comments_c',
            'studio' => 'visible',
            'label' => 'LBL_COMMENTS',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
?>
