<?php
require_once('include/SugarPHPMailer.php');
require_once('modules/EmailTemplates/EmailTemplate.php');
array_push($job_strings, 'birthday_job');
function birthday_job()
{
    $sql = "select concat(first_name,' ',last_name) as name , date_format(date_of_birth_c ,'%m-%d') as birthday from rt_employees_cstm as emp_cstm inner join rt_employees as emp ON id_c = id where date_format(date_of_birth_c ,'%m-%d') = date_format(now() ,'%m-%d')";
    $res = $GLOBALS['db']->query($sql);
    while ($row = $GLOBALS['db']->fetchByAssoc($res)) {
        $GLOBALS['log']->fatal('birthday run!!!');
        $name = $row['name'];
        $sugar_email = new SugarPHPMailer();
        $sugar_email->IsHTML(true);
        $admin = new Administration();
        $admin->retrieveSettings();
        $sugar_email->Subject = "Happy Birthday " . $name;
        $sugar_email->prepForOutbound();
        $sugar_email->setMailerForSystem();
        $sugar_email->From = $admin->settings['notify_fromaddress'];
        $sugar_email->FromName = $admin->settings['notify_fromname'];
        $template_name = 'Birthday Template';
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));
        $template->body_html = str_replace('{emp_name}', $name, $template->body_html);

        $sugar_email->Body = from_html($template->body_html);
        // to mail

        $sql_e = "select * from config where name = 'notification_receiver_email' and category = 'system'";
        $res_e = $GLOBALS['db']->query($sql_e);
        if ($res_e->num_rows > 0) {
            $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
            $to = $row_e['value'];
            $sugar_email->AddAddress($to);
        }

        if (!$sugar_email->Send()) {
            $GLOBALS['log']->fatal("Could not send Mail:  " . $sugar_email->ErrorInfo);
        }
    }

    return true;
}