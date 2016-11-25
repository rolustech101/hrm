<?php

if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
$form = '';

for ($x=0;$x<$_REQUEST['t_count'];$x++){
    $form .= 'Question: '.$_REQUEST['question'.$x]."\n".'Answer: ';
    if(isset($_REQUEST['answers'.$x]) && !empty($_REQUEST['answers'.$x])){
        $form .= $_REQUEST['answers'.$x]."\n";
    }else{
        $form .= $_REQUEST['multi_'.$x]."\n";
    }
}
$date_entered = date("Y-m-d H:i:s");
$bean = BeanFactory::newBean('RT_Performance_Reviews');
$bean->name = 'Review From of '.$_POST['emp_name'].' '.$date_entered;
$bean->description = $form;
$bean->rt_emp_id = $_POST['emp_id'];
// update appraisal date

if(isset($_POST['emp_id']) && !empty($_POST['emp_id'])){
    $id = $_POST['emp_id'];
    $emp = BeanFactory::getBean('RT_Employees',$id);
    $emp->update_date_modified = false;
    $join_date = $emp->joining_date_c; // of that employee change 'bean'
    $join_date_current_year = substr_replace($join_date,date('Y'),6);
    $inc_sql = "SELECT * FROM config WHERE name = 'increment_interval' and category = 'system'";
    $inc_res = $GLOBALS['db']->query($inc_sql);
    $inc_row = $GLOBALS['db']->fetchByAssoc($inc_res);
    $inc_interval = $inc_row['value'];
    if($inc_interval == 'by_annual'){
        $next_appraisal_date = date("Y-m-d", strtotime(date("Y-m-d", strtotime($join_date_current_year)) . " +6 month"));
        $emp->appraisal_date = $next_appraisal_date;
    }else{
        $next_appraisal_date = date("Y-m-d", strtotime(date("Y-m-d", strtotime($join_date_current_year)) . " + 1 year"));
        $emp->appraisal_date = $next_appraisal_date;
    }
    $emp->save(); // save employee
}


$bean->save(); // save performance review

echo "Thank You! for the Review";



