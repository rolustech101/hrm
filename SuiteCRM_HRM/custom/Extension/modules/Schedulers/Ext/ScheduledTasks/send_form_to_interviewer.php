<?php
function send_form_to_interviewer($job)
{
    $GLOBALS['log']->info('send_form_to_interviewer JOB!');
    $data = json_decode(html_entity_decode($job->data), true);
    if (!empty($data)) {
        $emailObj = new Email();
        $defaults = $emailObj->getSystemDefaultEmail();
        $template_name = $data['template_name'];
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));
        $sql = "select * from (select emp.id as emp_id, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_employees as emp inner join email_addr_bean_rel as e_add on e_add.bean_id = emp.id where emp.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where emp_id = '{$data['reviewer_id']}' and addresses.invalid_email = 0 AND addresses.opt_out = 0 and addresses.deleted = 0";
        $res = $GLOBALS['db']->query($sql);
        if ($res->num_rows > 1) {
            $GLOBALS['log']->fatal('Employee has many emails');
        } elseif ($res->num_rows > 0 && $res->num_rows == 1) {
            $row = $GLOBALS['db']->fetchByAssoc($res);
            $to = $row['email_address'];
        } else {
            $GLOBALS['log']->fatal('Employee does not have the Email Address');
        }

        $template->body_html = str_replace('{emp_name}', $data['employee_name'], $template->body_html);
        $template->body_html = str_replace('{link}', $data['form_path'], $template->body_html);


        if(!empty($to)){
            $mail = new SugarPHPMailer();
            $mail->IsHTML(true);
            $mail->setMailerForSystem();
            $mail->From = $defaults['email'];
            $mail->FromName = $defaults['name'];
            $mail->Subject = $template->subject .' '.$data['employee_name'];
            $mail->Body = from_html($template->body_html);
            $mail->prepForOutbound();
            $mail->AddAddress($to);
            $send = $mail->Send();
            if (!$send) {
                $GLOBALS['log']->fatal("Could not send Mail:  " . $mail->ErrorInfo);
            }
        }
        return true;
    }
    return false;
}