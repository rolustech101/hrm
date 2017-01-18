<?php
function interview_status($job)
{
    $GLOBALS['log']->info('interview_status JOB!');
    $data = json_decode(html_entity_decode($job->data), true);
    if (!empty($data)) {
        $emailObj = new Email();
        $defaults = $emailObj->getSystemDefaultEmail();
        $template_name = $data['template_name'];
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));
        $sql_e = "select * from config where name = 'sm_email' and category = 'system'";
        $res_e = $GLOBALS['db']->query($sql_e);
        if($res_e->num_rows > 0){
            $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
            $sm_emails = explode(',',$row_e['value']);
            foreach ($sm_emails as $item){
                $to[] = $item;
            }
        }
        $sql_hr = "select * from config where name = 'notification_receiver_email' and category = 'system'";
        $res_hr = $GLOBALS['db']->query($sql_hr);
        if ($res_e->num_rows > 0) {
            $row_hr = $GLOBALS['db']->fetchByAssoc($res_hr);
            $to[] = $row_hr['value'];
        }
        $link = $data['link'];
        $interview = "<a href='$link'>Here</a>";
        $template->body_html = str_replace('{name}', $data['candidate_name'], $template->body_html);
        $template->body_html = str_replace('{status}', $data['status'], $template->body_html);
        $template->body_html = str_replace('{link}', $interview, $template->body_html);

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