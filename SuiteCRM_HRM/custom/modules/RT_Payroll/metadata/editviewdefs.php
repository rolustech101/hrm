<?php
$module_name = 'RT_Payroll';
$viewdefs [$module_name] = 
array (
  'EditView' => 
  array (
    'templateMeta' => 
    array (
      'form' => 
      array (
        'enctype' => 'multipart/form-data',
        'hidden' => 
        array (
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
      'javascript' => '<script type="text/javascript" src="include/javascript/popup_parent_helper.js?s={$SUGAR_VERSION}&c={$JS_CUSTOM_VERSION}"></script>
	<script type="text/javascript" src="include/javascript/jsclass_base.js"></script>
	<script type="text/javascript" src="include/javascript/jsclass_async.js"></script>
	<script type="text/javascript" src="custom/modules/RT_Payroll/funcs.js"></script>
	<script type="text/javascript" src="modules/Documents/documents.js?s={$SUGAR_VERSION}&c={$JS_CUSTOM_VERSION}"></script>',
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
            'name' => 'abc_c',
            'studio' => 'visible',
            'label' => 'LBL_ABC',
            'customCode' => '
<select name="abc_c[]" id="abc_c" multiple="true" size="15" style="width:150px;"></select>
',
          ),
        ),
        1 => 
        array (
          0 => 
          array (
            'name' => 'month',
            'label' => 'LBL_MONTH',
          ),
        ),
        2 => 
        array (
          0 => 
          array (
            'name' => 'year',
            'label' => 'LBL_YEAR',
          ),
        ),
          3 =>
        array (
          0 =>
          array (
            'name' => 'assigned_user_name',
          ),
        ),
      ),
    ),
  ),
);
?>
