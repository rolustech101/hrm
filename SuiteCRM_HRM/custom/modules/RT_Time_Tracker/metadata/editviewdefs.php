<?php
$module_name = 'RT_Time_Tracker';
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
//        0 =>
//        array (
//          0 => 'name',
//          1 => '',
//        ),
        1 =>
        array (
          0 =>
              array (
                  'name' => 'date_start',
                  'type' => 'datetimecombo',
                  'displayParams' =>
                      array (
                          'required' => true,
                          'updateCallback' => 'SugarWidgetScheduler.update_time();',
                      ),
          ),
          1 => 
          array (
              'name' => 'date_end',
              'type' => 'datetimecombo',
              'displayParams' =>
                  array (
                      'required' => true,
                      'updateCallback' => 'SugarWidgetScheduler.update_time();',
                  ),
          ),
        ),
        2 => 
        array (
          0 =>
              array (
                  'name' => 'duration',
                  'customCode' => '
                @@FIELD@@
                <input id="duration_hours" name="duration_hours" type="hidden" value="{$fields.duration_hours.value}">
                <input id="duration_minutes" name="duration_minutes" type="hidden" value="{$fields.duration_minutes.value}">
                {sugar_getscript file="modules/Meetings/duration_dependency.js"}
                <script type="text/javascript">
                    var date_time_format = "{$CALENDAR_FORMAT}";
                    {literal}
                    SUGAR.util.doWhen(function(){return typeof DurationDependency != "undefined" && typeof document.getElementById("duration") != "undefined"}, function(){
                        var duration_dependency = new DurationDependency("date_start","date_end","duration",date_time_format);
                        initEditView(YAHOO.util.Selector.query(\'select#duration\')[0].form);
                    });
                    {/literal}
                </script>            
            ',
                  'customCodeReadOnly' => '{$fields.duration_hours.value}{$MOD.LBL_HOURS_ABBREV} {$fields.duration_minutes.value}{$MOD.LBL_MINSS_ABBREV} ',
              ),
          array (
            'name' => 'rt_time_tracker_rt_employees_name',
          ),
          1 => 'assigned_user_name',
        ),
      ),
    ),
  ),
);
?>
