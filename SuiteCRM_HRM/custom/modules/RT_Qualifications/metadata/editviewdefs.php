<?php
$module_name = 'RT_Qualifications';
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
    ),
    'panels' => 
    array (
      'lbl_editview_panel5' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'qualification_type_c',
            'studio' => 'visible',
            'label' => 'LBL_QUALIFICATION_TYPE',
            'displayParams' => 
            array (
//              'field' =>
//              array (
//                'onChange' => 'showHidePanel();',
                      'javascript' => 'onchange=showHidePanel();',
//              ),
            ),
          ),
          1 => '',
        ),
      ),
      'lbl_editview_panel4' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'parent_name',
            'displayParams' => 
            array (
              'required' => true,
            ),
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => '',
          1 => '',
        ),
      ),
      'lbl_editview_panel3' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'company_c',
            'label' => 'LBL_COMPANY',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => '',
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'job_title_c',
            'label' => 'LBL_JOB_TITLE',
          ),
          1 => '',
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'start_date_c',
            'label' => 'LBL_START_DATE',
          ),
          1 => '',
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'end_date_c',
            'label' => 'LBL_END_DATE',
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
        6 => 
        array (
          0 => '',
          1 => '',
        ),
      ),
      'lbl_editview_panel2' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'level_c',
            'label' => 'LBL_LEVEL',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'specialization_c',
            'label' => 'LBL_SPECIALIZATION',
          ),
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'institute_c',
            'label' => 'LBL_INSTITUTE',
          ),
          1 => '',
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'gpa_score_c',
            'label' => 'LBL_GPA_SCORE',
          ),
          1 => '',
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'start_c',
            'label' => 'LBL_START',
          ),
            1 => '',
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'ends_c',
            'label' => 'LBL_ENDS',
          ),
            1 => '',
        ),
      ),
      'lbl_editview_panel1' => 
      array (
        0 => 
        array (
          0 => 
          array (
            'name' => 'skill_c',
            'label' => 'LBL_SKILL',
          ),
          1 => '',
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'skill_institute_c',
            'label' => 'LBL_SKILL_INSTITUTE',
          ),
          1 => '',
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'from_skill_c',
            'label' => 'LBL_FROM_SKILL',
          ),
          1 => '',
        ),
        3 => 
        array (
          0 => 
          array (
            'name' => 'to_skill_c',
            'label' => 'LBL_TO_SKILL',
          ),
          1 => '',
        ),
        4 => 
        array (
          0 => 
          array (
            'name' => 'years_of_experience_c',
            'label' => 'LBL_YEARS_OF_EXPERIENCE',
          ),
          1 => '',
        ),
        5 => 
        array (
          0 => 
          array (
            'name' => 'skill_comment_c',
            'studio' => 'visible',
            'label' => 'LBL_SKILL_COMMENT',
          ),
          1 => '',
        ),
      ),
    ),
  ),
);
?>
