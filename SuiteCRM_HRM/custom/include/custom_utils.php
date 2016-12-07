<?php
require_once('include/SugarPHPMailer.php');
require_once('modules/EmailTemplates/EmailTemplate.php');
require_once 'modules/InboundEmail/InboundEmail.php';
require_once 'include/clean.php';
require_once 'custom/include/helpers/DocxConversion.php';
function get_annual_balance($id)
{
    $emp_sql = "select joining_date_c from rt_employees_cstm  where id_c = '$id'";
    $emp_res = $GLOBALS['db']->query($emp_sql);
    $emp_row = $GLOBALS['db']->fetchByAssoc($emp_res);
    $emp_joining_date = $emp_row['joining_date_c'];
    $date_start = substr_replace($emp_joining_date,date('Y'),0,4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)) );
     $GLOBALS['log']->fatal($date_start .' => '.$futureDate);
 $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Annual' and deleted = '0' and  from_date_c BETWEEN '$date_start' and '$futureDate'";
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    $GLOBALS['log']->fatal('total_days'.$no_of_days);
    return $no_of_days;
}
function get_casual_balance($id)
{
    $emp_sql = "select joining_date_c from rt_employees_cstm  where id_c = '$id'";
    $emp_res = $GLOBALS['db']->query($emp_sql);
    $emp_row = $GLOBALS['db']->fetchByAssoc($emp_res);
    $emp_joining_date = $emp_row['joining_date_c'];
    $date_start = substr_replace($emp_joining_date,date('Y'),0,4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)) );
    $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Casual' and deleted = '0' and  from_date_c BETWEEN '$date_start' and '$futureDate'" ;
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    $GLOBALS['log']->fatal('total_days'.$no_of_days);
    return $no_of_days;
}
function get_annual_b($emp_id)
{
    $total_annual_leaves = get_annual_balance($emp_id);
    $sql = "select * from rt_employees_cstm where id_c = '$emp_id'";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $entitled_annual = $row['entitled_annual_leaves_c'];
    $balance = $entitled_annual - $total_annual_leaves;
    $absolute_balance = abs($balance);
    return $absolute_balance;

}
function get_casual_b($emp_id)
{
    $total_casual_leaves = get_casual_balance($emp_id);
    $sql = "select * from rt_employees_cstm where id_c = '$emp_id'";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $entitled_casual = $row['entitled_casual_leaves_c'];
    $balance = $total_casual_leaves - $entitled_casual;
    $absolute_balance = abs($balance);
    return $absolute_balance;
}
function get_filling_status_countries()
{
    return ['USA','AUSTRALIA'];
}
function get_non_filling_countries()
{
    return ['PAKISTAN','UNITED KINGDOM','CANADA'];
}
function getCandidate($email)
{
//    $sql = "select * from rt_candidates where last_name = '$email'";
    $sql = "select * from (select cand.id as cand_id, cand.phone_mobile,cand.phone_work,cand.phone_other,cand.phone_home,cand.phone_fax, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_candidates as cand inner join email_addr_bean_rel as e_add on e_add.bean_id = cand.id where cand.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where addresses.email_address = '$email' AND addresses.deleted = 0";
    $res = $GLOBALS['db']->query($sql);
    if($res->num_rows > 1){
        $GLOBALS['log']->fatal('Duplicate candidates exists please delete there should be unique names!');
        return '';
    }elseif($res->num_rows > 0 && $res->num_rows == 1){
        $GLOBALS['log']->fatal('use existing candidate');
        $row = $GLOBALS['db']->fetchByAssoc($res);
        $cid = $row['cand_id'];
        $c = BeanFactory::getBean('RT_Candidates',$cid);
    }else{
        $GLOBALS['log']->fatal('creating new candidate');
        $c = BeanFactory::newBean('RT_Candidates');
    }
    return $c;
}
function send_interview_mail($module, $name, $id, $date, $template_name, $job_app_id = '')
{
    $sugar_email = new SugarPHPMailer();
    $sugar_email->IsHTML(true);
    $admin = new Administration();
    $admin->retrieveSettings();

    $sugar_email->prepForOutbound();
    $sugar_email->setMailerForSystem();
    $sugar_email->From = $admin->settings['notify_fromaddress'];
    $sugar_email->FromName = $admin->settings['notify_fromname'];
    $template_name = $template_name;
    $template = new EmailTemplate();
    $template->retrieve_by_string_fields(array('name' => $template_name,'type'=>'email'));
    $sugar_email->Subject = $template->subject;
    $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));
    if($module == 'RT_Candidates'){
        $sql = "select * from (select cand.id as cand_id, cand.phone_mobile,cand.phone_work,cand.phone_other,cand.phone_home,cand.phone_fax, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_candidates as cand inner join email_addr_bean_rel as e_add on e_add.bean_id = cand.id where cand.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where cand_id = '$id' and addresses.deleted = 0;";
        $res = $GLOBALS['db']->query($sql);
        if($res->num_rows > 1){
            $GLOBALS['log']->fatal('candidate has many emails');
        }elseif($res->num_rows > 0 && $res->num_rows == 1){
            $row = $GLOBALS['db']->fetchByAssoc($res);
            $c_email = $row['email_address'];
        }else{
            $GLOBALS['log']->fatal('Candidate does not have the Email Address');
        }
        $template->body_html = str_replace('{cand_name}',$name,$template->body_html);
        $template->body_html = str_replace('{date}',$date,$template->body_html);
        $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));
    }elseif ($module == 'RT_Employees'){
        $template->body_html = str_replace('{emp_name}',$name,$template->body_html);
        $template->body_html = str_replace('{date}',$date,$template->body_html);
//        $template->body_html = str_replace('{job_app}',$date,$template->body_html);
    }else{
        $GLOBALS['log']->fatal('Please Provide a valid module name');
        die;
    }

    $sugar_email->Body = from_html($template->body_html);

    $sql_e = "select * from config where name = 'notification_receiver_email' and category = 'system'";
    $res_e = $GLOBALS['db']->query($sql_e);
    if($res_e->num_rows > 0){
        $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
        $to = $row_e['value'];
        $sugar_email->AddAddress($to);
    }else{
        $GLOBALS['log']->fatal('Could not find notification_receiver_email in the system settings!');
        return false;
    }

    if (!$sugar_email->Send()) {
        $GLOBALS['log']->fatal("Could not send Mail:  " . $sugar_email->ErrorInfo);
    }
}
function send_email($cand_id,$job_app_id,$job_post_id)
{
    global $sugar_config;
    $base_url = $sugar_config['site_url'];
    $candidate = $base_url."/index.php?module=RT_Candidates&return_module=RT_Candidates&action=DetailView&record=$cand_id";
    $job_application = $base_url."/index.php?module=RT_Job_Application&return_module=RT_Job_Application&action=DetailView&record=$job_app_id";
    if(!empty($job_post_id)){
        $job_posting = $base_url."/index.php?module=RT_Vacancies&return_module=RT_Vacancies&action=DetailView&record=$job_post_id";
    }else{
        $job_posting = $base_url."/index.php?module=RT_Vacancies&action=index&return_module=RT_Vacancies&return_action=DetailView";
    }

    $sugar_email = new SugarPHPMailer();
    $sugar_email->IsHTML(true);
    $admin = new Administration();
    $admin->retrieveSettings();

    $sugar_email->prepForOutbound();
    $sugar_email->setMailerForSystem();
    $sugar_email->From = $admin->settings['notify_fromaddress'];
    $sugar_email->FromName = $admin->settings['notify_fromname'];
    $template_name = 'Job Application';
    $template = new EmailTemplate();
    $template->retrieve_by_string_fields(array('name' => $template_name,'type'=>'email'));
    $sugar_email->Subject = $template->subject;
    $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));
    $template->body_html = str_replace('{cand}',"<a href='$candidate'>Candidate</a>",$template->body_html);
    $template->body_html = str_replace('{posting}',"<a href='$job_posting'>Job Posting</a>",$template->body_html);
    $template->body_html = str_replace('{job_app}',"<a href='$job_application'>Job Application</a>",$template->body_html);
    $GLOBALS['log']->fatal('**************');
    $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));

    $sugar_email->Body = from_html($template->body_html);

    $sql_e = "select * from config where name = 'notification_receiver_email' and category = 'system'";
    $res_e = $GLOBALS['db']->query($sql_e);
    if($res_e->num_rows > 0){
        $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
        $to = $row_e['value'];
        $sugar_email->AddAddress($to);
    }else{
        $GLOBALS['log']->fatal('Could not find notification_receiver_email in the system settings!');
        return false;
    }

    if (!$sugar_email->Send()) {
        $GLOBALS['log']->fatal("Could not send Mail:  " . $sugar_email->ErrorInfo);
    }
}
function handleCreateCandidate($email,$job_title) {

    $GLOBALS['log']->fatal('in the handleCreateCandidate AOP husnain UTILS');
    global $current_user, $mod_strings, $current_language;
    $mod_strings = return_module_language($current_language, "Emails");

        $GLOBALS['log']->fatal('AOP GOING TO create case!!!!');
        $GLOBALS['log']->debug('retrieveing email');
        $email->retrieve($email->id);

    if(!empty($email->reply_to_email)) {
        $c = getCandidate($email->reply_to_email);
        if(!empty($c)){
            $c->last_name  = $email->reply_to_email;
            $c->email1 = $email->reply_to_email;
        }else{
            $GLOBALS['log']->fatal('duplicate records exists!');
            return false;
        }
    } else {
        $c = getCandidate($email->from_addr);
        if(!empty($c)){
            $c->last_name  = $email->from_addr;
            $c->email1   = $email->from_addr;
        }else{
            $GLOBALS['log']->fatal('Duplicate records exists!');
            return false;
        }
    }
        $notes = $email->get_linked_beans('notes','Notes');
        $noteIds = array();
        foreach($notes as $note){
            $noteIds[] = $note->id;
        }
        $GLOBALS['log']->fatal('print_r($notes,1)');
        $GLOBALS['log']->fatal(print_r($notes,1));
        if($email->description_html) {
//            $c->description = $this->processImageLinks(SugarCleaner::cleanHtml($email->description_html),$noteIds);
            $c->description = $email->description;
        }else{
            $c->description = $email->description;
        }

//        $c->phone_mobile = '123';
        $c->save();

        $vacancy_bean = BeanFactory::getBean('RT_Vacancies');
        if(!empty($job_title)){
            $job_title = trim($job_title);
            $vacancy_bean->retrieve_by_string_fields(array('name' => $job_title,'status_c'=>'new_position'));
            $GLOBALS['log']->fatal('print_r($vacancy_bean,1)');
            $GLOBALS['log']->fatal(print_r($vacancy_bean,1));
        }
        // create new job_application
        $GLOBALS['log']->fatal('create new job application');

        $new_job_application = BeanFactory::newBean('RT_Job_Application');
        $new_job_application->status = 'new';
        $new_job_application->parent_type = 'RT_Candidates';
        $new_job_application->parent_id = $c->id;
        $new_job_application->rt_vacancy_id = $vacancy_bean->id;
        $new_job_application->save();

        // relate vacancy to job application

        foreach($notes as $note){

            $GLOBALS['log']->fatal('create new note husnain');
            $GLOBALS['log']->fatal('MIMEEEEEEEEE TYPEEEEE:::::::::::');
            $GLOBALS['log']->fatal($note->file_mime_type);

            $newNote = BeanFactory::newBean('Notes');
            $newNote->name = $note->name;

            $newNote->file_mime_type = $note->file_mime_type;
            $newNote->filename = $note->filename;
            $newNote->parent_type = 'RT_Job_Application';
            $newNote->parent_id = $new_job_application->id;
            $newNote->save();
            $srcFile = "upload://{$note->id}";
            $destFile = "upload://{$newNote->id}";
            copy($srcFile,$destFile);
        }
    echo "End of handle create Candidate\n";
    $GLOBALS['log']->fatal('END of handle create husnain');
    send_email($c->id,$new_job_application->id,$vacancy_bean->id);

} // fn
?>