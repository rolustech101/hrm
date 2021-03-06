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
    $date_start = substr_replace($emp_joining_date, date('Y'), 0, 4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)));
    $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
    select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Annual' and status_c = 'Taken' and deleted = '0' and  leave_start_date_c BETWEEN '$date_start' and '$futureDate'";
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    return $no_of_days;
}

function get_casual_balance($id)
{
    $emp_sql = "select joining_date_c from rt_employees_cstm  where id_c = '$id'";
    $emp_res = $GLOBALS['db']->query($emp_sql);
    $emp_row = $GLOBALS['db']->fetchByAssoc($emp_res);
    $emp_joining_date = $emp_row['joining_date_c'];
    $date_start = substr_replace($emp_joining_date, date('Y'), 0, 4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)));
    $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
    select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Casual' and status_c = 'Taken' and deleted = '0' and  leave_start_date_c BETWEEN '$date_start' and '$futureDate'";
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    return $no_of_days;
}

function get_annual_b($emp_id)
{
    $sql = "select casual_leave_balance,annual_leave_balance  from rt_employees_cstm inner join rt_employees on id = id_c where id_c = '$emp_id' and deleted = 0";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $annual_balance = $row['annual_leave_balance'];
    return $annual_balance;

}

function get_casual_b($emp_id)
{
    $sql = "select casual_leave_balance,annual_leave_balance  from rt_employees_cstm inner join rt_employees on id = id_c where id_c = '$emp_id' and deleted = 0";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $casual_balance = $row['casual_leave_balance'];
    return $casual_balance;
}

function get_filling_status_countries()
{
    return ['USA', 'AUSTRALIA'];
}

function get_non_filling_countries()
{
    return ['PAKISTAN', 'UNITED KINGDOM', 'CANADA'];
}

function getCandidate($email)
{
    $sql = "select * from (select cand.id as cand_id, cand.phone_mobile,cand.phone_work,cand.phone_other,cand.phone_home,cand.phone_fax, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_candidates as cand inner join email_addr_bean_rel as e_add on e_add.bean_id = cand.id where cand.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where addresses.email_address = '$email' and addresses.invalid_email = 0 AND addresses.opt_out = 0 AND addresses.deleted = 0";
    $res = $GLOBALS['db']->query($sql);
    if ($res->num_rows > 1) {
        $GLOBALS['log']->fatal('Duplicate candidates exists please delete there should be unique names!');
        return '';
    } elseif ($res->num_rows > 0 && $res->num_rows == 1) {
        $GLOBALS['log']->info('using existing candidate');
        $row = $GLOBALS['db']->fetchByAssoc($res);
        $cid = $row['cand_id'];
        $c = BeanFactory::getBean('RT_Candidates', $cid);
    } else {
        $GLOBALS['log']->info('creating new candidate');
        $c = BeanFactory::newBean('RT_Candidates');
    }
    return $c;
}

function send_interview_mail($module, $name, $id, $date, $template, $job_app_id = '')
{
    $sugar_email = new SugarPHPMailer();
    $sugar_email->IsHTML(true);
    $admin = new Administration();
    $admin->retrieveSettings();

    $sugar_email->prepForOutbound();
    $sugar_email->setMailerForSystem();
    $sugar_email->From = $admin->settings['notify_fromaddress'];
    $sugar_email->FromName = $admin->settings['notify_fromname'];
    $template_name = $template;
    $template = new EmailTemplate();
    $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));
    $sugar_email->Subject = $template->subject;
    if ($module == 'RT_Candidates') {
        $sql = "select * from (select cand.id as cand_id, cand.phone_mobile,cand.phone_work,cand.phone_other,cand.phone_home,cand.phone_fax, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_candidates as cand inner join email_addr_bean_rel as e_add on e_add.bean_id = cand.id where cand.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where cand_id = '$id' and addresses.invalid_email = 0 AND addresses.opt_out = 0 and addresses.deleted = 0";
        $res = $GLOBALS['db']->query($sql);
        if ($res->num_rows > 1) {
            $GLOBALS['log']->fatal('candidate has many emails');
        } elseif ($res->num_rows > 0 && $res->num_rows == 1) {
            $row = $GLOBALS['db']->fetchByAssoc($res);
            $cand_mail = $row['email_address'];
        } else {
            $GLOBALS['log']->fatal('Candidate does not have the Email Address');
        }
        $template->body_html = str_replace('{cand_name}', $name, $template->body_html);
        $template->body_html = str_replace('{date}', $date, $template->body_html);
    } elseif ($module == 'RT_Employees') {
        $sql = "select * from (select emp.id as emp_id, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_employees as emp inner join email_addr_bean_rel as e_add on e_add.bean_id = emp.id where emp.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where emp_id = '$id' and addresses.invalid_email = 0 AND addresses.opt_out = 0 and addresses.deleted = 0";
        $res = $GLOBALS['db']->query($sql);
        if ($res->num_rows > 1) {
            $GLOBALS['log']->fatal('Employee has many emails');
        } elseif ($res->num_rows > 0 && $res->num_rows == 1) {
            $row = $GLOBALS['db']->fetchByAssoc($res);
            $iv_mail = $row['email_address'];

        } else {
            $GLOBALS['log']->fatal('Employee does not have the Email Address');
        }

        $template->body_html = str_replace('{emp_name}', $name, $template->body_html);
        $template->body_html = str_replace('{date}', $date, $template->body_html);
//        $template->body_html = str_replace('{job_app}',$date,$template->body_html);
    } else {
        $GLOBALS['log']->fatal('Please Provide a valid module name');
        die;
    }

    $sugar_email->Body = from_html($template->body_html);

    if ($module == 'RT_Employees') {
        $to = $iv_mail;
        $sugar_email->AddAddress($to);
    } elseif ($module == 'RT_Candidates') {
        $to = $cand_mail;
        $sugar_email->AddAddress($to);
    }

    if (!$sugar_email->Send()) {
        $GLOBALS['log']->fatal("Could not send Mail:  " . $sugar_email->ErrorInfo);
    }
}

function send_email($cand_id, $job_app_id, $job_post_id)
{
    global $sugar_config;
    $cand_bean = BeanFactory::getBean('RT_Candidates',$cand_id);
    $name_candidate = $cand_bean->name;
    $base_url = $sugar_config['site_url'];
    $candidate = $base_url . "/index.php?module=RT_Candidates&return_module=RT_Candidates&action=DetailView&record=$cand_id";
    $job_application = $base_url . "/index.php?module=RT_Job_Application&return_module=RT_Job_Application&action=DetailView&record=$job_app_id";
    if (!empty($job_post_id)) {
        $job_posting = $base_url . "/index.php?module=RT_Vacancies&return_module=RT_Vacancies&action=DetailView&record=$job_post_id";
    } else {
        $job_posting = $base_url . "/index.php?module=RT_Vacancies&action=index&return_module=RT_Vacancies&return_action=DetailView";
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
    $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));
    $sugar_email->Subject = $template->subject;
    $template->body_html = str_replace('{cand}', "<a href='$candidate'>$name_candidate</a>", $template->body_html);
    $template->body_html = str_replace('{posting}', "<a href='$job_posting'>Job Posting</a>", $template->body_html);
    $template->body_html = str_replace('{job_app}', "<a href='$job_application'>Job Application</a>",
        $template->body_html);

    $sugar_email->Body = from_html($template->body_html);

    $sql_e = "select * from config where name = 'notification_receiver_email' and category = 'system'";
    $res_e = $GLOBALS['db']->query($sql_e);
    if ($res_e->num_rows > 0) {
        $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
        $to = $row_e['value'];
        $sugar_email->AddAddress($to);
    } else {
        $GLOBALS['log']->fatal('Could not find notification_receiver_email in the system settings!');
        return false;
    }

    if (!$sugar_email->Send()) {
        $GLOBALS['log']->fatal("Could not send Mail:  " . $sugar_email->ErrorInfo);
    }
}

function getSalaryTypes()
{
    $list = array();
    $sql_st = "SELECT * FROM config where name = 'salary_types' AND category = 'system'";
    $res_st = $GLOBALS['db']->query($sql_st);
    if ($res_st->num_rows > 0) {
        $row_st = $GLOBALS['db']->fetchByAssoc($res_st);
        $types = explode(',', $row_st['value']);
        foreach ($types as $item) {
            $list[strtolower($item)] = ucfirst($item);
        }
    }

    return $list;
}

function get_salary_selectlist()
{
    $list = array();
    $sql_st = "SELECT * FROM config where name = 'salary_types' AND category = 'system'";
    $res_st = $GLOBALS['db']->query($sql_st);
    if ($res_st->num_rows > 0) {
        $row_st = $GLOBALS['db']->fetchByAssoc($res_st);
        $types = explode(',', $row_st['value']);
        foreach ($types as $item) {
            $list[strtolower($item)] = ucfirst($item);
        }
    }
    $sal_options = "<select name='label_salary[]' id = 'label_salary'>";
    foreach ($list as $key => $value) {
        $sal_options .= ("<option value='$key'>". $value ."</option>");
    }
    $sal_options .= "</select>";
    return $list;

}

function get_tax_calculation($emp_id,$salary)
{
    $sql = "select * from rt_employees where id = '$emp_id' AND deleted = 0";
    $res = $GLOBALS['db']->query($sql);
    if ($res->num_rows > 0) {
        $row = $GLOBALS['db']->fetchByAssoc($res);
//        $serialized_sal = $row['salary'];
        $country = $row['primary_address_country'];
        $filling_status = $row['filling_status'];
//        $unserialized_sal = unserialize(html_entity_decode($serialized_sal));
        $unserialized_sal = $salary;
        $taxable_amount = 0;
        foreach ($unserialized_sal as $key => $value) {
            if ($unserialized_sal[$key]['taxable'] == 1) {
                $taxable_amount += $unserialized_sal[$key]['amount'];
            }
        }
        if ($filling_status == '') {
            $filling_status = 'any';
        }
        $tax_data = array();
        //calculate tax according to the range of salary
        $annual_taxable_salary = $taxable_amount * 12;
        $GLOBALS['log']->fatal("annnual salary: " . $annual_taxable_salary);
        if ($filling_status == 'any') {
            $query = "select * from rt_salarysetting where ($annual_taxable_salary >= sal_from AND $annual_taxable_salary <= sal_to  AND country = '$country'  AND deleted=0) OR ($annual_taxable_salary >= sal_from AND sal_to IS NULL AND country = '$country'  AND deleted=0)";
        } else {
            $query = "select * from rt_salarysetting where ($annual_taxable_salary >= sal_from AND $annual_taxable_salary <= sal_to AND country = '$country' AND filling_status = '$filling_status' AND deleted=0) OR ($annual_taxable_salary >= sal_from AND sal_to IS NULL AND country = '$country'  AND deleted=0)";
        }
        $GLOBALS['log']->fatal($query);
        $results = $GLOBALS['db']->query($query);
        $GLOBALS['log']->fatal(print_r($results, 1));
        if ($results->num_rows > 0) {
            $GLOBALS['log']->fatal("HEllo");
            $taxes = $GLOBALS['db']->fetchByAssoc($results);
            $tax_data['tax'] = $taxes['tax_rate'];
            $tax_data['fix_amount'] = $taxes['fix_amount'];
            $tax_data['salary_exceed'] = $annual_taxable_salary - $taxes['sal_from'];
        } else {
            $GLOBALS['log']->fatal('This salary range do not fit with the current ranges for country OR you did not define ranges for ' . $country . ' having filling status ' . $filling_status);
        }
        $GLOBALS['log']->fatal(print_r($tax_data, 1));
        $tax_amount = ($tax_data['fix_amount'] / 12) + (($tax_data['salary_exceed'] / 100) * $tax_data['tax']) / 12;
//        echo json_encode($tax_data);

        return round($tax_amount);
    }
    $GLOBALS['log']->fatal('Employee Does not exits!');
}
function isNewBean(SugarBean $bean) {
    if(empty($bean->fetched_row['id'])) {
        return true;
    }
    return false;
}

function handleCreateCandidate($email, $job_title)
{
    global $current_user, $mod_strings, $current_language;
    $mod_strings = return_module_language($current_language, "Emails");

    $GLOBALS['log']->debug('retrieveing email');
    $email->retrieve($email->id);

    if (!empty($email->reply_to_email)) {
        $c = getCandidate($email->reply_to_email);
        if (!empty($c)) {
            $c->last_name = $email->reply_to_email;
            $c->email1 = $email->reply_to_email;
        } else {
            $GLOBALS['log']->fatal('duplicate records exists!');
            return false;
        }
    } else {
        $c = getCandidate($email->from_addr);
        if (!empty($c)) {
            $c->last_name = $email->from_addr;
            $c->email1 = $email->from_addr;
        } else {
            $GLOBALS['log']->fatal('Duplicate records exists!');
            return false;
        }
    }
    $notes = $email->get_linked_beans('notes', 'Notes');
    $noteIds = array();
    foreach ($notes as $note) {
        $noteIds[] = $note->id;
    }
    if ($email->description_html) {
//            $c->description = $this->processImageLinks(SugarCleaner::cleanHtml($email->description_html),$noteIds);
        $c->description = $email->description;
    } else {
        $c->description = $email->description;
    }

//        $c->phone_mobile = '123';
    $c->save();
    $vacancy_id = '';
    if (!empty($job_title)) {
        $sql = "select * from rt_vacancies inner join rt_vacancies_cstm on id = id_c where name = '$job_title' and  status_c = 'new_position' and deleted = 0 order by date_entered DESC limit 1";
        $res = $GLOBALS['db']->query($sql);
        if($res->num_rows > 0){
            $row = $GLOBALS['db']->fetchByAssoc($res);
            $vacancy_id = $row['id'];
        }
    }


    /*$vacancy_bean = BeanFactory::getBean('RT_Vacancies');
    if (!empty($job_title)) {
        $job_title = trim($job_title);
//        $vacancy_bean->retrieve_by_string_fields(array('name' => $job_title, 'status_c' => 'new_position'));
        $vacancy_bean->get_full_list("order by date_entered DESC","name = $job_title AND status_c = new_position");
        $GLOBALS['log']->fatal('HEllo retrieve_by_string_fields!!!!!!!!!!!!!!');
        foreach ($vacancy_bean as $value){
            $GLOBALS['log']->fatal(print_r($value,1));
            $GLOBALS['log']->fatal('_________________________________________________________________________');
        }
//        $GLOBALS['log']->fatal(print_r($vacancy_bean,1));
//        $GLOBALS['log']->fatal('print_r($vacancy_bean,1)');
//        $GLOBALS['log']->fatal(print_r($vacancy_bean, 1));
        die;
    }*/
    // create new job_application
    $GLOBALS['log']->fatal('create new job application');

    $new_job_application = BeanFactory::newBean('RT_Job_Application');
    $new_job_application->status = 'new';
    $new_job_application->parent_type = 'RT_Candidates';
    $new_job_application->parent_id = $c->id;
//    $new_job_application->rt_vacancy_id = $vacancy_bean->id;
    $new_job_application->rt_vacancy_id = $vacancy_id;
    $new_job_application->save();


    foreach ($notes as $note) {
        $newNote = BeanFactory::newBean('Notes');
        $newNote->name = $note->name;

        $newNote->file_mime_type = $note->file_mime_type;
        $newNote->filename = $note->filename;
        $newNote->parent_type = 'RT_Job_Application';
        $newNote->parent_id = $new_job_application->id;
        $newNote->save();
        $srcFile = "upload://{$note->id}";
        $destFile = "upload://{$newNote->id}";
        copy($srcFile, $destFile);
    }
//    send_email($c->id, $new_job_application->id, $vacancy_bean->id);
    send_email($c->id, $new_job_application->id, $vacancy_id);

} // fn
?>