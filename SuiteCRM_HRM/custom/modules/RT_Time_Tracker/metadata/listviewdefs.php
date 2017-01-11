<?php
$module_name = 'RT_Time_Tracker';
$listViewDefs [$module_name] = 
array (
  'NAME' => 
  array (
    'width' => '32%',
    'label' => 'LBL_NAME',
    'default' => true,
    'link' => true,
  ),
  'DATE_START' =>
  array (
    'type' => 'datetimecombo',
    'label' => 'LBL_CHECK_IN_TIME',
    'width' => '10%',
    'default' => true,
  ),
  'DATE_END' =>
  array (
    'type' => 'datetimecombo',
    'label' => 'LBL_CHECKOUT_TIME',
    'width' => '10%',
    'default' => true,
  ),
  'RT_TIME_TRACKER_RT_EMPLOYEES_NAME' => 
  array (
    'type' => 'relate',
    'link' => true,
    'label' => 'LBL_RT_TIME_TRACKER_RT_EMPLOYEES_FROM_RT_EMPLOYEES_TITLE',
    'id' => 'RT_TIME_TRACKER_RT_EMPLOYEESRT_EMPLOYEES_IDA',
    'width' => '10%',
    'default' => true,
  ),
    'duration_hours' =>
        array (
            'type' => 'int',
            'label' => 'LBL_DURATION_HOURS',
            'width' => '10%',
            'default' => false,
        ),
    'duration_minutes' =>
        array (
            'type' => 'int',
            'label' => 'LBL_DURATION_MINUTES',
            'width' => '10%',
            'default' => false,
        ),
//    'DURATION' =>
//        array (
//            'type' => 'int',
//            'label' => 'LBL_DURATION',
//            'width' => '10%',
//            'default' => true,
//        ),
    'TOTAL_HOURS' =>
        array (
            'type' => 'varchar',
            'label' => 'LBL_TOTAL_HOURS',
            'width' => '10%',
            'default' => true,
        ),
  'DATE_ENTERED' => 
  array (
    'type' => 'datetime',
    'label' => 'LBL_DATE_ENTERED',
    'width' => '10%',
    'default' => true,
  ),
  'ASSIGNED_USER_NAME' => 
  array (
    'width' => '9%',
    'label' => 'LBL_ASSIGNED_TO_NAME',
    'module' => 'Employees',
    'id' => 'ASSIGNED_USER_ID',
    'default' => false,
  ),
);
?>
