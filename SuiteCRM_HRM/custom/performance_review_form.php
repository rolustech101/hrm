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

$template_name = 'Appraisal Submitted';
$template = new EmailTemplate();
$template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));
$emp_name = $_POST['emp_name'];
$template->body_html = str_replace('{name}', $emp_name, $template->body_html);

$to = [];
$sql_hr = "select * from config where name = 'notification_receiver_email' and category = 'system'";
$res_hr = $GLOBALS['db']->query($sql_hr);
if ($res_hr->num_rows > 0) {
    $row_hr = $GLOBALS['db']->fetchByAssoc($res_hr);
    $to[] = $row_hr['value'];
}
$sql_e = "select * from config where name = 'sm_email' and category = 'system'";
$res_e = $GLOBALS['db']->query($sql_e);
if ($res_e->num_rows > 0) {
    $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
    $sm_emails = explode(',', $row_e['value']);
    foreach ($sm_emails as $item) {
        $to[] = $item;
    }
}

foreach ($to as $item) {
    $emailObj = new Email();
    $defaults = $emailObj->getSystemDefaultEmail();
    $mail = new SugarPHPMailer();
    $mail->IsHTML(true);
    $mail->setMailerForSystem();
    $mail->From = $defaults['email'];
    $mail->FromName = $defaults['name'];
    $mail->Subject = $template->subject;
    $mail->Body = from_html($template->body_html);
    $mail->prepForOutbound();
    $mail->AddAddress($item);
    $send = $mail->Send();
    if (!$send) {
        $GLOBALS['log']->fatal("Could not send Mail:  " . $mail->ErrorInfo);
    }
}


echo "Thank You! for the Review";

