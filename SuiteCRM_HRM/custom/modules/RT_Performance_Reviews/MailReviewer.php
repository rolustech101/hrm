<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('include/SugarQueue/SugarJobQueue.php');

class MailReviewer
{
    function mail_to_reviewers($bean, $event, $arguments)
    {

        global $current_user;
        global $sugar_config;
        $GLOBALS['log']->fatal('REVIEWERS!!!!!! HOOK!!!!!');
        $GLOBALS['log']->fatal(print_r($arguments, 1));
        $GLOBALS['log']->fatal('*******************************');
        $GLOBALS['log']->fatal(print_r($bean, 1));

//        $employee_name = $bean->emp_name;
//         $employee_name = $arguments['related_bean']->name;
        $employee_id = $bean->rt_emp_id;
        $form_id = $bean->form_id;
        $id_pr = $bean->id;
        $emp_bean = BeanFactory::getBean('RT_Employees',$employee_id);
        $employee_name = $emp_bean->first_name.' '.$emp_bean->last_name;

        if ($arguments['related_module'] == 'RT_Employees' && $arguments['link'] == 'rt_employees_rt_performance_reviews_1') {

            $reviewer_id = $arguments['related_id'];


            if (!empty($form_id)) {

                $sql = "SELECT form_meta,name FROM rt_review_forms where id = '$form_id'";
                $result = $GLOBALS['db']->query($sql);
                $row = $GLOBALS['db']->fetchByAssoc($result);
                $form_data = $row['form_meta'];
                $form_name = $row['name'];
                $form_array = json_decode(html_entity_decode($form_data), true);
                $form_html = '<html><head><title>Performance Review</title></head><body><h2>Performance Review for ' . $employee_name . ' </h2>';
                $form_html .= '<form id="give_review" name="give_review" method="post" action="../index.php?entryPoint=performance_review_form&reviewer_id='.$reviewer_id.'"';

                $form_html .= "<input type='hidden' name='emp_id' id='emp_id' value= '$employee_id'>";
                $form_html .= "<input type='hidden' name='emp_name' id='emp_name' value='$employee_name'>";
                $num = 0;
                foreach ($form_array as $value) {
                    foreach ($value as $key => $val) {
                        if ($key == 'question') {
                            $form_html .= '<input type="text" name="question' . $num . '" maxlength = "10000" value="' . $val . '" readonly /><br>';
                        } elseif ($key == 'type') {
                            if ($val == 'mutliple_choice') {
                                foreach ($value['options'] as $op) {
                                    $form_html .= "<input type='radio' name='multi_$num' value= '$op' required>$op<br>";
                                }
                            } else {
                                $form_html .= '<textarea name="answers' . $num . '" rows="4" cols="50" required></textarea><br>';
                            }
                        }
                    }
                    $num++;
                }


                $file_location = '';

                $form_html .= "<input type='hidden' name='pr_id' value='$id_pr'>";
                $form_html .= "<input type='hidden' name='t_count' value='$num'>";
                $form_html .= '<input type="submit" value="Submit">';
                $form_html .= '</form>';
                $form_html .= '</body></html>';
                $time = strtotime("now");
                if (is_link($_SERVER['DOCUMENT_ROOT'])) {
                    if (!file_exists(readlink($_SERVER['DOCUMENT_ROOT']) . '/review_forms')) {
                        mkdir(readlink($_SERVER['DOCUMENT_ROOT']) . '/review_forms', 0777, true);
                    }
                    $output = file_put_contents(readlink($_SERVER['DOCUMENT_ROOT']) . '/review_forms/review_' . $form_name . '_' . $employee_id.'_'.$time. '.php',
                        $form_html);
                    $file_location = readlink($_SERVER['DOCUMENT_ROOT']) . '/review_forms/review_' . $form_name . '_' . $employee_id .'_'.$time. '.php';
                } else {
                    if (!file_exists($_SERVER['DOCUMENT_ROOT'] . '/' . $sugar_config['instance_url'] . '/review_forms')) {
                        mkdir($_SERVER['DOCUMENT_ROOT'] . '/' . $sugar_config['instance_url'] . '/review_forms', 0777,
                            true);
                    }
                    $output = file_put_contents($_SERVER['DOCUMENT_ROOT'] . '/' . $sugar_config['instance_url'] . '/review_forms/review_' . $form_name . '_' . $employee_id .'_'.$time. '.php',
                        $form_html);
                    $file_location = $sugar_config['site_url'] . '/review_forms/review_' . $form_name . '_' . $employee_id .'_'.$time. '.php';
                }
                if (!$output) {
                    $GLOBALS['log']->fatal('error occured while writing to the file!');
                }


                //sending email through job
                $job = new SchedulersJob();
                $job->name = "Send Review Forms";
                $arr = [];
                $arr['template_name'] = 'Rolustech Email Template';
                $arr['employee_name'] = $employee_name;
                $arr['reviewer_id'] = $reviewer_id;


                $arr['form_path'] = $file_location;
                $job->data = json_encode($arr);
                $job->target = "function::send_form_to_interviewer";
                $job->assigned_user_id = $current_user->id;
                $jq = new SugarJobQueue();
                $jobid = $jq->submitJob($job);
            }
        } 

    }
}

?>