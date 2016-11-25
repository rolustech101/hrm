<?php
require_once('include/SugarPHPMailer.php');
require_once('modules/EmailTemplates/EmailTemplate.php');
array_push($job_strings, 'performance_review_reminder_job');
function performance_review_reminder_job()
{
    $sql = "select emp.*, concat(emp.first_name,' ',emp.last_name) as name,emp_cstm.*  from rt_employees as emp inner join rt_employees_cstm as emp_cstm on id_c = id where emp.deleted = 0";
    $res = $GLOBALS['db']->query($sql);
    while($row = $GLOBALS['db']->fetchByAssoc($res)){
        $GLOBALS['log']->fatal('birthday run!!!');
        $name = $row['name'];
        $appraisal_date = $row['appraisal_date'];
        if(!isset($appraisal_date) || empty($appraisal_date)){
            continue;
        }
        $appraisal_date = strtotime($appraisal_date);
        $appraisal_date = date("Y-m-d",$appraisal_date);

        $current_date = date("Y-m-d");

        if($current_date >= $appraisal_date){
            $GLOBALS['log']->fatal('hello >>>>>>>>>>');
            $GLOBALS['log']->fatal($current_date);
            $GLOBALS['log']->fatal($appraisal_date);
            $GLOBALS['log']->fatal($current_date >= $appraisal_date);
            $GLOBALS['log']->fatal($row['appraisal_date']);
            $sugar_email = new SugarPHPMailer();
            $sugar_email->IsHTML(true);
            $admin = new Administration();
            $admin->retrieveSettings();
            $sugar_email->Subject = "Please Submit review of ".$name;
            $sugar_email->prepForOutbound();
            $sugar_email->setMailerForSystem();
            $sugar_email->From = $admin->settings['notify_fromaddress'];
            $sugar_email->FromName = $admin->settings['notify_fromname'];
            $template_name = 'Performance Review Reminder';
            $template = new EmailTemplate();
            $template->retrieve_by_string_fields(array('name' => $template_name,'type'=>'email'));
            $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));
            $template->body_html = str_replace('{emp_name}',$name,$template->body_html);
            $GLOBALS['log']->fatal('**************');
            $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));

            $sugar_email->Body = from_html($template->body_html);

            $sql_e = "select * from config where name = 'notification_receiver_email' and category = 'system'";
            $res_e = $GLOBALS['db']->query($sql_e);
            if($res_e->num_rows > 0){
                $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
                $to = $row_e['value'];
                $sugar_email->AddAddress($to);
            }
            if (!$sugar_email->Send()) {
                $GLOBALS['log']->fatal("Could not send Mail:  " . $sugar_email->ErrorInfo);
            }
        }
    }

    return true;
}