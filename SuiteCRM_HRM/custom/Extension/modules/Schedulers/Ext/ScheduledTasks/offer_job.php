<?php
function offer_job($job)
{
    global $timedate;

    $GLOBALS['log']->fatal('offer_job JOB!!!!!!!!!!!!!!!!');
    $data = json_decode(html_entity_decode($job->data), true);
    if (!empty($data)) {
        $emailObj = new Email();
        $defaults = $emailObj->getSystemDefaultEmail();
        $template_name = $data['template_name'];
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));

        $to = [];
        $sql = "select * from (select cand.id as cand_id, cand.phone_mobile,cand.phone_work,cand.phone_other,cand.phone_home,cand.phone_fax, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_candidates as cand inner join email_addr_bean_rel as e_add on e_add.bean_id = cand.id where cand.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where cand_id = '{$data['id']}' and addresses.invalid_email = 0 AND addresses.opt_out = 0 and addresses.deleted = 0";
        $res = $GLOBALS['db']->query($sql);
        if ($res->num_rows > 1) {
            $GLOBALS['log']->fatal('candidate has many emails');
        } elseif ($res->num_rows > 0 && $res->num_rows == 1) {
            $row = $GLOBALS['db']->fetchByAssoc($res);
            $to[] = $row['email_address'];
        } else {
            $GLOBALS['log']->fatal('Candidate does not have the Email Address');
        }

        $sql_e = "select * from config where name = 'sm_email' and category = 'system'";
        $res_e = $GLOBALS['db']->query($sql_e);
        if($res_e->num_rows > 0){
            $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
            $sm_emails = explode(',',$row_e['value']);
            foreach ($sm_emails as $item){
                $to[] = $item;
            }
        }
        $template->body_html = str_replace('{name}', $data['candidate_name'], $template->body_html);

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
            $mail->Send();
        }
        return true;

    }
    return false;
}