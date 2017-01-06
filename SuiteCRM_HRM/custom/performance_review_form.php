<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('include/SugarQueue/SugarJobQueue.php');

if (!empty($_REQUEST['pr_id'])) {



    $form = '';

    for ($x = 0; $x < $_REQUEST['t_count']; $x++) {
        $form .= 'Question: ' . $_REQUEST['question' . $x] . "\n" . 'Answer: ';
        if (isset($_REQUEST['answers' . $x]) && !empty($_REQUEST['answers' . $x])) {
            $form .= $_REQUEST['answers' . $x] . "\n";
        } else {
            $form .= $_REQUEST['multi_' . $x] . "\n";
        }
    }
    $performance_id = $_REQUEST['pr_id'];
    $reviewer_id = $_REQUEST['reviewer_id'];

    $reviewer = BeanFactory::getBean('RT_Employees', $reviewer_id);
    $fname = $reviewer->first_name;
    $lname = $reviewer->last_name;
    $reviewer_name = $fname . ' ' . $lname;

    $date_entered = date("Y-m-d H:i:s");
//    $bean = BeanFactory::newBean('RT_Performance_Reviews');
    $bean = BeanFactory::getBean('RT_Performance_Reviews', $performance_id);
    $bean->name = 'Review From of ' . $_POST['emp_name'] . ' ' . $date_entered;
    $bean->status = 'completed';

    $old_des = $bean->description;
    $old_des = $old_des . 'Reviewed By' . ".$reviewer_name\n\n";
    $updated_des = $old_des . $form . "--------------------------------------\n";
    $bean->description = $updated_des;
//    $bean->rt_emp_id = $_POST['emp_id'];
// update appraisal date

    if (isset($_POST['emp_id']) && !empty($_POST['emp_id'])) {
        $id = $_POST['emp_id'];
        $emp = BeanFactory::getBean('RT_Employees', $id);
        $emp->update_date_modified = false;
        $join_date = $emp->joining_date_c; // of that employee change 'bean'
        $join_date_current_year = substr_replace($join_date, date('Y'), 6);
        $inc_sql = "SELECT * FROM config WHERE name = 'increment_interval' and category = 'system'";
        $inc_res = $GLOBALS['db']->query($inc_sql);
        $inc_row = $GLOBALS['db']->fetchByAssoc($inc_res);
        $inc_interval = $inc_row['value'];
        if ($inc_interval == 'by_annual') {
            $next_appraisal_date = date("Y-m-d",
                strtotime(date("Y-m-d", strtotime($join_date_current_year)) . " +6 month"));
            $emp->appraisal_date = $next_appraisal_date;
        } else {
            $next_appraisal_date = date("Y-m-d",
                strtotime(date("Y-m-d", strtotime($join_date_current_year)) . " + 1 year"));
            $emp->appraisal_date = $next_appraisal_date;
        }
        $emp->save(); // save employee
    }


    global $current_user;
    $current_user->retrieve(1);
    $bean->save(); // save performance review

    echo "Thank You! for the Review";

    $emp_name = $_POST['emp_name'];

    //sending email through job
    $job = new SchedulersJob();
    $job->name = "Appraisal Submit Notify";
    $arr = [];
    $arr['template_name'] = 'Appraisal Submitted';
    $arr['employee_name'] = $emp_name;
    $arr['reviewed_by'] = $reviewer_name;
    $job->data = json_encode($arr);
    $job->target = "function::appraisal_submitted";
    $job->assigned_user_id = $current_user->id;
    $jq = new SugarJobQueue();
    $jobid = $jq->submitJob($job);

} else {
    echo 'Performance Review Record was not created previously!';
}