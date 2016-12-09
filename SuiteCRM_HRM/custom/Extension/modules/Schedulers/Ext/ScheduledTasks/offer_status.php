<?php
function offer_status($job)
{
    $GLOBALS['log']->fatal('offer_job JOB!!!!!!!!!!!!!!!!');
    $data = json_decode(html_entity_decode($job->data), true);
    if (!empty($data)) {
        $GLOBALS['log']->fatal('offer_accepted JOB IFFFFFFF');
        $GLOBALS['log']->fatal(print_r($data, 1));
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

        $to = [];
        $sql_hr = "select * from config where name = 'notification_receiver_email' and category = 'system'";
        $res_hr = $GLOBALS['db']->query($sql_hr);
        if($res_hr->num_rows > 0){
            $row_hr = $GLOBALS['db']->fetchByAssoc($res_hr);
            $to[] = $row_hr['value'];
        }
        $sql_e = "select * from config where name = 'sm_email' and category = 'system'";
        $res_e = $GLOBALS['db']->query($sql_e);
        if($res_e->num_rows > 0){
            $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
            $to[] = $row_e['value'];
        }

        $GLOBALS['log']->fatal('TTTTTTTTTTTTTTTTTTTTTTOOOOOOOOOOOOOOOOOOOOOO');
        $GLOBALS['log']->fatal(print_r($to,1));
        $template->body_html = str_replace('{name}', $data['candidate_name'], $template->body_html);
        $template->body_html = str_replace('{status}', $data['status'], $template->body_html);

        $mail->Body = from_html($template->body_html);
        $mail->prepForOutbound();

        foreach ($to as $item) {
            $mail->AddAddress($item);
            $mail->Send();
        }
        return true;
//        if (!$mail->Send()) {
//            $GLOBALS['log']->fatal("Could not send Mail:  " . $mail->ErrorInfo);
//        } else {
//            return true;
//        }

    }
    return false;
}