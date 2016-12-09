<?php
$module_name = 'RT_Interviews';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
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
      'tabDefs' => 
      array (
        'DEFAULT' => 
        array (
          'newTab' => false,
          'panelDefault' => 'expanded',
        ),
      ),
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
            'label' => 'LBL_RT_CANDIDATE_NAME',
          ),
            1 => array(),
        ), 
          1 => 
        array (
          0 => 
          array (
            'name' => 'date_of_interview',
            'label' => 'LBL_DATE_OF_INTERVIEW',
          ),
            1 => array(),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'rt_vacancy_name',
            'label' => 'LBL_RT_VACANCY_NAME',
          ),
            1 => array(),
        ),
          3 =>
              array (
                  0 =>
                      array (
                          'name' => 'score_c',
                          'label' => 'LBL_SCORE',
                      ),
                  1 => '',
              ),
          4 =>
              array (
                  0 =>
                      array (
                          'name' => 'status_c',
                          'studio' => 'visible',
                          'label' => 'LBL_STATUS',
                      ),
                  1 => '',
              ),
          5 =>
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
