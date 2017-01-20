<?php
function interview_job($job)
{
    global $timedate;

    $GLOBALS['log']->info('INTERVIEW JOB!');
    $data = json_decode(html_entity_decode($job->data), true);
    if (!empty($data)) {
        $emailObj = new Email();
        $defaults = $emailObj->getSystemDefaultEmail();
        $mail = new SugarPHPMailer();
        $mail->IsHTML(true);
        $mail->setMailerForSystem();
        $mail->From = $defaults['email'];
        $mail->FromName = $defaults['name'];
        $template_name = $data['template_name'];
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));
        $mail->Subject = $template->subject;

        if ($data['module'] == 'RT_Candidates') {
            $sql = "select * from (select cand.id as cand_id, cand.phone_mobile,cand.phone_work,cand.phone_other,cand.phone_home,cand.phone_fax, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_candidates as cand inner join email_addr_bean_rel as e_add on e_add.bean_id = cand.id where cand.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where cand_id = '{$data['id']}' and addresses.invalid_email = 0 AND addresses.opt_out = 0 and addresses.deleted = 0";
            $res = $GLOBALS['db']->query($sql);
            if ($res->num_rows > 1) {
                $GLOBALS['log']->fatal('candidate has many emails');
            } elseif ($res->num_rows > 0 && $res->num_rows == 1) {
                $row = $GLOBALS['db']->fetchByAssoc($res);
                $to = $row['email_address'];
            } else {
                $GLOBALS['log']->fatal('Candidate does not have the Email Address');
            }
            $db_date = $data['interview_date'];
            $local_date = $timedate->to_display_date_time($db_date);
            $newDate = date("F j, Y, g:i a", strtotime($local_date));
            $template->body_html = str_replace('{cand_name}', $data['candidate_name'], $template->body_html);
            $template->body_html = str_replace('{date}', $newDate, $template->body_html);

        } elseif ($data['module'] == 'RT_Employees') {

            $sql = "select * from (select emp.id as emp_id, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_employees as emp inner join email_addr_bean_rel as e_add on e_add.bean_id = emp.id where emp.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where emp_id = '{$data['id']}' and addresses.invalid_email = 0 AND addresses.opt_out = 0 and addresses.deleted = 0";
            $res = $GLOBALS['db']->query($sql);
            if ($res->num_rows > 1) {
                $GLOBALS['log']->fatal('Employee has many emails');
            } elseif ($res->num_rows > 0 && $res->num_rows == 1) {
                $row = $GLOBALS['db']->fetchByAssoc($res);
                $to = $row['email_address'];
            } else {
                $GLOBALS['log']->fatal('Employee does not have the Email Address');
            }

            $db_date = $data['interview_date'];
            $newDate = date("F j, Y, g:i a", strtotime($db_date));
            $template->body_html = str_replace('{emp_name}', $data['employee_name'], $template->body_html);
            $template->body_html = str_replace('{date}', $newDate, $template->body_html);
            $template->body_html = str_replace('{cand_name}', $data['candidate_name'], $template->body_html);

            $job_id = $data['job_id'];
            global $sugar_config;
            $base_url = $sugar_config['site_url'];
            if(empty($job_id)){
                $job_application = $base_url . "/index.php?module=RT_Job_Application&action=index";
            }else{
                $job_application = $base_url . "/index.php?module=RT_Job_Application&return_module=RT_Job_Application&action=DetailView&record=$job_id";
            }
            $link = "<a href='$job_application'>Job Apllication</a>";
            $template->body_html = str_replace('{job_app}', $link, $template->body_html);
        } else {
            $GLOBALS['log']->fatal('Please provide a valid Module Name!');
            return false;
        }

        $mail->Body = from_html($template->body_html);
        $mail->prepForOutbound();
        $mail->AddAddress($to);

        if (!$mail->Send()) {
            $GLOBALS['log']->fatal("Could not send Mail:  " . $mail->ErrorInfo);
        } else {
            return true;
        }
    }
    return false;
}