<?php
function employee_created($job)
{
    $GLOBALS['log']->fatal('employee_created JOB!');
    $data = json_decode(html_entity_decode($job->data), true);
    if (!empty($data)) {
        $emailObj = new Email();
        $defaults = $emailObj->getSystemDefaultEmail();
        $template_name = $data['template_name'];
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));

        $to = [];
        $sql_e = "select * from config where name = 'sm_email' and category = 'system'";
        $res_e = $GLOBALS['db']->query($sql_e);
        if ($res_e->num_rows > 0) {
            $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
            $sm_emails = explode(',', $row_e['value']);
            foreach ($sm_emails as $item) {
                $to[] = $item;
            }
        }
        $link = $data['link'];
        $employee = "<a href='$link'>Here</a>";
        $template->body_html = str_replace('{emp_id}', $data['emp_id'], $template->body_html);
        $template->body_html = str_replace('{name}', $data['name'], $template->body_html);
        $template->body_html = str_replace('{gender}', $data['gender'], $template->body_html);
        $template->body_html = str_replace('{email}', $data['email'], $template->body_html);
        $template->body_html = str_replace('{supervisor}', $data['supervisor'], $template->body_html);
        $template->body_html = str_replace('{total_salary}', $data['total_salary'], $template->body_html);
        $template->body_html = str_replace('{cnic}', $data['cnic'], $template->body_html);
        $template->body_html = str_replace('{marital_status}', $data['marital_status'], $template->body_html);
        $template->body_html = str_replace('{mobile_phone}', $data['mobile_phone'], $template->body_html);
        $template->body_html = str_replace('{country}', $data['country'], $template->body_html);
        $template->body_html = str_replace('{joining_date}', $data['joining_date'], $template->body_html);
        $template->body_html = str_replace('{emp_status}', $data['emp_status'], $template->body_html);
        $template->body_html = str_replace('{dob}', $data['dob'], $template->body_html);
        $template->body_html = str_replace('{address}', $data['address'], $template->body_html);
        $template->body_html = str_replace('{link}', $employee, $template->body_html);

        foreach ($to as $item) {
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
        return true;
    }
    return false;
}