<?php 
 //WARNING: The contents of this file are auto-generated


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

function candi_inter($job){
    $GLOBALS['log']->fatal('INTERVIEW JOB!!!!!!!!!!!!!!!!');
//    $GLOBALS['log']->fatal(print_r(json_decode($job->data,true),1));
    $GLOBALS['log']->fatal(print_r($job->data,1));

    $data = json_decode(html_entity_decode($job->data),true);
    $GLOBALS['log']->fatal('CHECK EMPTYYYY!!!!!!!!!!!!!!!!!!!!!!!!');
    $GLOBALS['log']->fatal(print_r($data,1));

    if (!empty($data))
    {
        $GLOBALS['log']->fatal('INTERVIEW JOB IFFFFFFF');
        $GLOBALS['log']->fatal(print_r($data,1));
        $emailObj = new Email();
        $defaults = $emailObj->getSystemDefaultEmail();
        $mail = new SugarPHPMailer();
        $mail->IsHTML(true);
        $mail->setMailerForSystem();
        $mail->From = $defaults['email'];
        $mail->FromName = $defaults['name'];
        $template_name = $data['template_name'];
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name,'type'=>'email'));
        $mail->Subject = $template->subject;

        if($data['module'] == 'RT_Candidates'){

            $GLOBALS['log']->fatal('IN THE CANDIDATE IFFFFFF');

            $sql = "select * from (select cand.id as cand_id, cand.phone_mobile,cand.phone_work,cand.phone_other,cand.phone_home,cand.phone_fax, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_candidates as cand inner join email_addr_bean_rel as e_add on e_add.bean_id = cand.id where cand.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where cand_id = '{$data['id']}' and addresses.deleted = 0";
            $res = $GLOBALS['db']->query($sql);
            if($res->num_rows > 1){
                $GLOBALS['log']->fatal('candidate has many emails');
            }elseif($res->num_rows > 0 && $res->num_rows == 1){
                $row = $GLOBALS['db']->fetchByAssoc($res);
                $to = $row['email_address'];
            }else{
                $GLOBALS['log']->fatal('Candidate does not have the Email Address');
            }
            $template->body_html = str_replace('{cand_name}',$data['candidate_name'],$template->body_html);
            $template->body_html = str_replace('{date}',$data['interview_date'],$template->body_html);

        }elseif ($data['module'] == 'RT_Employees'){

            $sql = "select * from (select emp.id as emp_id, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_employees as emp inner join email_addr_bean_rel as e_add on e_add.bean_id = emp.id where emp.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where emp_id = '{$data['id']}' and addresses.deleted = 0";
            $res = $GLOBALS['db']->query($sql);
            if($res->num_rows > 1){
                $GLOBALS['log']->fatal('Employee has many emails');
            }elseif($res->num_rows > 0 && $res->num_rows == 1){
                $row = $GLOBALS['db']->fetchByAssoc($res);
                $to = $row['email_address'];
            }else{
                $GLOBALS['log']->fatal('Employee does not have the Email Address');
            }

            $template->body_html = str_replace('{emp_name}',$data['employee_name'],$template->body_html);
            $template->body_html = str_replace('{date}',$data['interview_date'],$template->body_html);
//        $template->body_html = str_replace('{job_app}',$date,$template->body_html);
        }else{
            $GLOBALS['log']->fatal('Please provide a valid Module Name!');
            return false;
        }

        $mail->Body = from_html($template->body_html);
        $mail->prepForOutbound();
        $mail->AddAddress($to);

        if (!$mail->Send()) {
            $GLOBALS['log']->fatal("Could not send Mail:  " . $mail->ErrorInfo);
        }else{
            return true;
        }
//        if($mail->Send())
//        {
//            //return true for completed
//            return true;
//        }
    }
    return false;
}

function employee_created($job)
{
    $GLOBALS['log']->fatal('employee_created JOB!!!!!!!!!!!!!!!!');
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

require_once('include/SugarPHPMailer.php');
require_once('modules/EmailTemplates/EmailTemplate.php');
require_once('custom/include/custom_utils.php');
array_push($job_strings, 'create_candidate_from_email');
function create_candidate_from_email()
{
    require_once 'modules/InboundEmail/AOPInboundEmail.php';
    $GLOBALS['log']->fatal('----->Scheduler fired job of type create_candidate_from_email()');
    global $dictionary;
    global $app_strings;
    global $sugar_config;

    require_once('modules/Configurator/Configurator.php');
    require_once('modules/Emails/EmailUI.php');

    $ie = new AOPInboundEmail();
    $emailUI = new EmailUI();
    $r = $ie->db->query('SELECT id, name FROM inbound_email WHERE is_personal = 0 AND deleted=0 AND status=\'Active\' AND mailbox_type != \'bounce\'');
    $GLOBALS['log']->fatal('Just got Result from get all Inbounds of Inbound Emails husnain');

    while ($a = $ie->db->fetchByAssoc($r)) {
        $GLOBALS['log']->fatal('In while loop of Inbound Emails husnain');
        $ieX = new AOPInboundEmail();
        $ieX->retrieve($a['id']);
        $mailboxes = $ieX->mailboxarray;
        foreach ($mailboxes as $mbox) {
            $ieX->mailbox = $mbox;
            $newMsgs = array();
            $msgNoToUIDL = array();
            $connectToMailServer = false;
            if ($ieX->isPop3Protocol()) {
                $msgNoToUIDL = $ieX->getPop3NewMessagesToDownloadForCron();
                // get all the keys which are msgnos;
                $newMsgs = array_keys($msgNoToUIDL);
            }
            if ($ieX->connectMailserver() == 'true') {
                $connectToMailServer = true;
            } // if

            $GLOBALS['log']->fatal('Trying to connect to mailserver for [ ' . $a['name'] . ' ] husnain');
            if ($connectToMailServer) {
                $GLOBALS['log']->fatal('Connected to mailserver husnain');
                if (!$ieX->isPop3Protocol()) {
                    $newMsgs = $ieX->getNewMessageIds();
                    $GLOBALS['log']->fatal('isPop3Protocol to mailserver husnain');
                }
                if (is_array($newMsgs)) {
                    $GLOBALS['log']->fatal('newMsgs to mailserver husnain');
                    $current = 1;
                    $total = count($newMsgs);
                    require_once("include/SugarFolders/SugarFolders.php");
                    $sugarFolder = new SugarFolder();
                    $groupFolderId = $ieX->groupfolder_id;
                    $isGroupFolderExists = false;
                    $users = array();
                    if ($groupFolderId != null && $groupFolderId != "") {
                        $GLOBALS['log']->fatal('groupFolderId to mailserver husnain');
                        $sugarFolder->retrieve($groupFolderId);
                        $isGroupFolderExists = true;
                    } // if
                    $messagesToDelete = array();
                    if ($ieX->isMailBoxTypeCreateCase()) {
                        $GLOBALS['log']->fatal('isMailBoxTypeCreateCase to mailserver husnain');
                        /* require_once 'modules/AOP_Case_Updates/AOPAssignManager.php';
                         $assignManager = new AOPAssignManager($ieX);*/
                    }
                    foreach ($newMsgs as $k => $msgNo) {
                        $GLOBALS['log']->fatal('foreach llop to mailserver husnain');
                        $uid = $msgNo;
                        if ($ieX->isPop3Protocol()) {
                            $uid = $msgNoToUIDL[$msgNo];
                        } else {
                            $uid = imap_uid($ieX->conn, $msgNo);
                        } // else
                        if ($isGroupFolderExists) {
                            $GLOBALS['log']->fatal('Group folder exists husnain');

                            if ($ieX->importOneEmail($msgNo, $uid)) {
                                // add to folder
                                $sugarFolder->addBean($ieX->email);
                                if ($ieX->isPop3Protocol()) {
                                    $messagesToDelete[] = $msgNo;
                                } else {
                                    $messagesToDelete[] = $uid;
                                }
                                if ($ieX->isMailBoxTypeCreateCase()) {

                                  /*  $userId = $assignManager->getNextAssignedUser();
                                    $GLOBALS['log']->debug('userId [ ' . $userId . ' ]');*/
                                    $GLOBALS['log']->fatal('Going to call handlecreate canddate husnain');
                                    $GLOBALS['log']->fatal('NAMEEE EMAILLLL');
                                    $GLOBALS['log']->fatal($ieX->email->name);
                                    $email_subject = $ieX->email->name;
                                    $email_subject = strtolower($email_subject);
                                    if (strpos($email_subject, 'job application') !== false) {
                                        handleCreateCandidate($ieX->email);////////////////////////////////
                                    }
                                } // if
                            } // if
                        } else {
                            $GLOBALS['log']->fatal('else not exist to mailserver husnain');
                            if ($ieX->isAutoImport()) {
                                $ieX->importOneEmail($msgNo, $uid);
                            } else {
                                /*If the group folder doesn't exist then download only those messages
                                 which has caseid in message*/

                                $ieX->getMessagesInEmailCache($msgNo, $uid);
                                $email = new Email();
                                $header = imap_headerinfo($ieX->conn, $msgNo);
                                $email->name = $ieX->handleMimeHeaderDecode($header->subject);
                                $email->from_addr = $ieX->convertImapToSugarEmailAddress($header->from);
                                $email->reply_to_email = $ieX->convertImapToSugarEmailAddress($header->reply_to);
                                if (!empty($email->reply_to_email)) {
                                    $contactAddr = $email->reply_to_email;
                                } else {
                                    $contactAddr = $email->from_addr;
                                }
                                $mailBoxType = $ieX->mailbox_type;
                                $ieX->handleAutoresponse($email, $contactAddr);
                            } // else
                        } // else
                        $GLOBALS['log']->fatal('***** On message [ ' . $current . ' of ' . $total . ' ] ***** husnain');
                        $current++;
                    } // foreach
                    // update Inbound Account with last robin

                } // if
                if ($isGroupFolderExists) {
                    $GLOBALS['log']->fatal('$isGroupFolderExists husnain');

                    $leaveMessagesOnMailServer = $ieX->get_stored_options("leaveMessagesOnMailServer", 0);
                    if (!$leaveMessagesOnMailServer) {
                        $GLOBALS['log']->fatal('leaveMessagesOnMailServer husnain');
                        if ($ieX->isPop3Protocol()) {
                            $GLOBALS['log']->fatal(' asd isPop3Protocol husnain');
                            $ieX->deleteMessageOnMailServerForPop3(implode(",", $messagesToDelete));
                        } else {
                            $GLOBALS['log']->fatal(' else as isPop3Protocol husnain');
                            $GLOBALS['log']->fatal('leaveMessagesOnMailServer husnain');
                            $ieX->deleteMessageOnMailServer(implode($app_strings['LBL_EMAIL_DELIMITER'], $messagesToDelete));
                        }
                    }
                }
            } else {
                $GLOBALS['log']->fatal(' LAst else husnain');
                $GLOBALS['log']->fatal("SCHEDULERS: could not get an IMAP connection resource for ID [ {$a['id']} ]. Skipping mailbox [ {$a['name']} ].");
                // cn: bug 9171 - continue while
            } // else
        } // foreach
        imap_expunge($ieX->conn);
        imap_close($ieX->conn, CL_EXPUNGE);
        $GLOBALS['log']->fatal(' in the while itration husnain');

    } // while
    $GLOBALS['log']->fatal(' before return true.... husnain');
    return true;
}

function job_posted($job)
{
    $GLOBALS['log']->fatal('job_posted JOB!!!!!!!!!!!!!!!!');
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
        $link = $data['link'];
        $posting = "<a href='$link'>Here</a>";
        $template->body_html = str_replace('{name}', $data['posting_name'], $template->body_html);
        $template->body_html = str_replace('{link}', $posting, $template->body_html);

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

require_once('include/SugarPHPMailer.php');
require_once('modules/EmailTemplates/EmailTemplate.php');
array_push($job_strings, 'birthday_job');
function birthday_job()
{
    $sql = "select concat(first_name,' ',last_name) as name , date_format(date_of_birth_c ,'%m-%d') as birthday from rt_employees_cstm as emp_cstm inner join rt_employees as emp ON id_c = id where date_format(date_of_birth_c ,'%m-%d') = date_format(now() ,'%m-%d')";
    $res = $GLOBALS['db']->query($sql);
    while($row = $GLOBALS['db']->fetchByAssoc($res)){
        $GLOBALS['log']->fatal('birthday run!!!');
        $name = $row['name'];
        $sugar_email = new SugarPHPMailer();
        $sugar_email->IsHTML(true);
        $admin = new Administration();
        $admin->retrieveSettings();
        $sugar_email->Subject = "Happy Birthday ".$name;
        $sugar_email->prepForOutbound();
        $sugar_email->setMailerForSystem();
        $sugar_email->From = $admin->settings['notify_fromaddress'];
        $sugar_email->FromName = $admin->settings['notify_fromname'];
        $template_name = 'Birthday Template';
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name,'type'=>'email'));
        $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));
        $template->body_html = str_replace('{emp_name}',$name,$template->body_html);
        $GLOBALS['log']->fatal('**************');
        $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));

        $sugar_email->Body = from_html($template->body_html);
            // to mail

            $sql_e = "select * from config where name = 'notification_receiver_email' and category = 'system'";
            $res_e = $GLOBALS['db']->query($sql_e);
            if($res_e->num_rows > 0){
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


array_push($job_strings, 'balance_update_job');
function balance_update_job()
{
   $sql = "select id, date_format(joining_date_c ,'%m-%d') as joining_date, annual_leave_balance, casual_leave_balance,entitled_annual_leaves_c,entitled_casual_leaves_c from rt_employees inner join rt_employees_cstm ON id = id_c where date_format(joining_date_c ,'%m-%d') = date_format(now() ,'%m-%d')";
    $res = $GLOBALS['db']->query($sql);
    while($row = $GLOBALS['db']->fetchByAssoc($res)){
        $entilted_annual = $row['entitled_annual_leaves_c'];
        $entilted_casual= $row['entitled_casual_leaves_c'];
        $id= $row['id'];
        $u_sql = "UPDATE rt_employees set annual_leave_balance = '$entilted_annual',casual_leave_balance = '$entilted_casual' where id = '$id'";
        $result = $GLOBALS['db']->query($u_sql);
        $GLOBALS['log']->fatal('scheduler run and updated => '.$id);
    }
    return true;
}

require_once('include/SugarPHPMailer.php');
require_once('modules/EmailTemplates/EmailTemplate.php');
array_push($job_strings, 'performance_review_reminder_job');
function performance_review_reminder_job()
{
    $sql = "select emp.*, concat(emp.first_name,' ',emp.last_name) as name,emp_cstm.*  from rt_employees as emp inner join rt_employees_cstm as emp_cstm on id_c = id where emp.deleted = 0";
    $res = $GLOBALS['db']->query($sql);
    while($row = $GLOBALS['db']->fetchByAssoc($res)){
        $GLOBALS['log']->fatal('birthday run!!!');
        $name = $row['name'];
        $appraisal_date = $row['appraisal_date'];
        if(!isset($appraisal_date) || empty($appraisal_date)){
            continue;
        }
        $appraisal_date = strtotime($appraisal_date);
        $appraisal_date = date("Y-m-d",$appraisal_date);

        $current_date = date("Y-m-d");

        if($current_date >= $appraisal_date){
            $GLOBALS['log']->fatal('hello >>>>>>>>>>');
            $GLOBALS['log']->fatal($current_date);
            $GLOBALS['log']->fatal($appraisal_date);
            $GLOBALS['log']->fatal($current_date >= $appraisal_date);
            $GLOBALS['log']->fatal($row['appraisal_date']);
            $sugar_email = new SugarPHPMailer();
            $sugar_email->IsHTML(true);
            $admin = new Administration();
            $admin->retrieveSettings();
            $sugar_email->Subject = "[CASE:Appraisal Due of".$name."]";
            $sugar_email->prepForOutbound();
            $sugar_email->setMailerForSystem();
            $sugar_email->From = $admin->settings['notify_fromaddress'];
            $sugar_email->FromName = $admin->settings['notify_fromname'];
            $template_name = 'Performance Review Reminder';
            $template = new EmailTemplate();
            $template->retrieve_by_string_fields(array('name' => $template_name,'type'=>'email'));
            $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));
            $template->body_html = str_replace('{emp_name}',$name,$template->body_html);
            $GLOBALS['log']->fatal('**************');
            $GLOBALS['log']->fatal(print_r(from_html($template->body_html),1));

            $sugar_email->Body = from_html($template->body_html);

            $sql_e = "select * from config where name = 'notification_receiver_email' and category = 'system'";
            $res_e = $GLOBALS['db']->query($sql_e);
            if($res_e->num_rows > 0){
                $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
                $to = $row_e['value'];
                $sugar_email->AddAddress($to);
            }
            if (!$sugar_email->Send()) {
                $GLOBALS['log']->fatal("Could not send Mail:  " . $sugar_email->ErrorInfo);
            }
        }
    }

    return true;
}

function interview_job($job){
    global $timedate;

    $GLOBALS['log']->fatal('INTERVIEW JOB!!!!!!!!!!!!!!!!');
    $data = json_decode(html_entity_decode($job->data),true);
    if (!empty($data))
    {
        $GLOBALS['log']->fatal('INTERVIEW JOB IFFFFFFF');
        $GLOBALS['log']->fatal(print_r($data,1));
        $emailObj = new Email();
        $defaults = $emailObj->getSystemDefaultEmail();
        $mail = new SugarPHPMailer();
        $mail->IsHTML(true);
        $mail->setMailerForSystem();
        $mail->From = $defaults['email'];
        $mail->FromName = $defaults['name'];
        $template_name = $data['template_name'];
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name,'type'=>'email'));
        $mail->Subject = $template->subject;

        if($data['module'] == 'RT_Candidates'){

            $GLOBALS['log']->fatal('IN THE CANDIDATE IFFFFFF');

            $sql = "select * from (select cand.id as cand_id, cand.phone_mobile,cand.phone_work,cand.phone_other,cand.phone_home,cand.phone_fax, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_candidates as cand inner join email_addr_bean_rel as e_add on e_add.bean_id = cand.id where cand.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where cand_id = '{$data['id']}' and addresses.invalid_email = 0 AND addresses.opt_out = 0 and addresses.deleted = 0";
            $res = $GLOBALS['db']->query($sql);
            if($res->num_rows > 1){
                $GLOBALS['log']->fatal('candidate has many emails');
            }elseif($res->num_rows > 0 && $res->num_rows == 1){
                $row = $GLOBALS['db']->fetchByAssoc($res);
                $to = $row['email_address'];
            }else{
                $GLOBALS['log']->fatal('Candidate does not have the Email Address');
            }
            $db_date = $data['interview_date'];
            $local_date = $timedate->to_display_date_time($db_date);
            $newDate = date("F j, Y, g:i a", strtotime($local_date));
            $template->body_html = str_replace('{cand_name}',$data['candidate_name'],$template->body_html);
            $template->body_html = str_replace('{date}',$newDate,$template->body_html);

        }elseif ($data['module'] == 'RT_Employees'){

            $sql = "select * from (select emp.id as emp_id, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_employees as emp inner join email_addr_bean_rel as e_add on e_add.bean_id = emp.id where emp.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where emp_id = '{$data['id']}' and addresses.invalid_email = 0 AND addresses.opt_out = 0 and addresses.deleted = 0";
            $res = $GLOBALS['db']->query($sql);
            if($res->num_rows > 1){
                $GLOBALS['log']->fatal('Employee has many emails');
            }elseif($res->num_rows > 0 && $res->num_rows == 1){
                $row = $GLOBALS['db']->fetchByAssoc($res);
                $to = $row['email_address'];
            }else{
                $GLOBALS['log']->fatal('Employee does not have the Email Address');
            }

            $db_date = $data['interview_date'];
          $GLOBALS['log']->fatal($data['interview_date']);
//            $local_date = $timedate->to_display_date_time($db_date);
//            $GLOBALS['log']->fatal('$local_date');
//            $GLOBALS['log']->fatal($local_date);

            $newDate = date("F j, Y, g:i a", strtotime($db_date));
//            $GLOBALS['log']->fatal('$tt');
//            $GLOBALS['log']->fatal($tt);
            
//            $newDate = date("F j, Y, g:i a", strtotime($local_date));
//            $GLOBALS['log']->fatal('$newDate');
//            $GLOBALS['log']->fatal($newDate);
            $template->body_html = str_replace('{emp_name}',$data['employee_name'],$template->body_html);
            $template->body_html = str_replace('{date}',$newDate,$template->body_html);
            $template->body_html = str_replace('{cand_name}',$data['candidate_name'],$template->body_html);

            $job_id = $data['job_id'];
            global $sugar_config;
            $base_url = $sugar_config['site_url'];
            $job_application = $base_url."/index.php?module=RT_Job_Application&return_module=RT_Job_Application&action=DetailView&record=$job_id";
            $link = "<a href='$job_application'>Job Apllication</a>";
            $template->body_html = str_replace('{job_app}',$link,$template->body_html);
        }else{
            $GLOBALS['log']->fatal('Please provide a valid Module Name!');
            return false;
        }

        $mail->Body = from_html($template->body_html);
        $mail->prepForOutbound();
        $mail->AddAddress($to);

        if (!$mail->Send()) {
            $GLOBALS['log']->fatal("Could not send Mail:  " . $mail->ErrorInfo);
        }else{
            return true;
        }

    }
    return false;
}

function offer_status($job)
{
    $GLOBALS['log']->fatal('offer_job JOB!!!!!!!!!!!!!!!!');
    $data = json_decode(html_entity_decode($job->data), true);
    if (!empty($data)) {
        $GLOBALS['log']->fatal('offer_accepted JOB IFFFFFFF');
        $GLOBALS['log']->fatal(print_r($data, 1));
        $template_name = $data['template_name'];
        $template = new EmailTemplate();
        $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));
        if($data['status'] == 'Accepted'){
            $subject = 'Offer Accepted';
        }elseif ($data['status'] == 'Rejected'){
            $subject = 'Offer Rejected';
        }
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
            $sm_emails = explode(',',$row_e['value']);
            foreach ($sm_emails as $item){
                $to[] = $item;
            }
        }
        $template->body_html = str_replace('{name}', $data['candidate_name'], $template->body_html);
        $template->body_html = str_replace('{status}', $data['status'], $template->body_html);

        foreach ($to as $item) {

            $emailObj = new Email();
            $defaults = $emailObj->getSystemDefaultEmail();
            $mail = new SugarPHPMailer();
            $mail->IsHTML(true);
            $mail->setMailerForSystem();
            $mail->From = $defaults['email'];
            $mail->FromName = $defaults['name'];
            $mail->Subject = $subject;
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


array_push($job_strings, 'pollMonitoredInboxesAOP');

function pollMonitoredInboxesAOP()
{
    require_once 'modules/InboundEmail/AOPInboundEmail.php';
    $GLOBALS['log']->info('----->Scheduler fired job of type pollMonitoredInboxesAOP()');
    global $dictionary;
    global $app_strings;
    global $sugar_config;

    require_once('modules/Configurator/Configurator.php');
    require_once('modules/Emails/EmailUI.php');

    $ie = new AOPInboundEmail();
    $emailUI = new EmailUI();
    $r = $ie->db->query('SELECT id, name FROM inbound_email WHERE is_personal = 0 AND deleted=0 AND status=\'Active\' AND mailbox_type != \'bounce\'');
    $GLOBALS['log']->debug('Just got Result from get all Inbounds of Inbound Emails');

    while ($a = $ie->db->fetchByAssoc($r)) {
        $GLOBALS['log']->debug('In while loop of Inbound Emails');
        $ieX = new AOPInboundEmail();
        $ieX->retrieve($a['id']);
        $mailboxes = $ieX->mailboxarray;
        foreach ($mailboxes as $mbox) {
            $ieX->mailbox = $mbox;
            $newMsgs = array();
            $msgNoToUIDL = array();
            $connectToMailServer = false;
            if ($ieX->isPop3Protocol()) {
                $msgNoToUIDL = $ieX->getPop3NewMessagesToDownloadForCron();
                // get all the keys which are msgnos;
                $newMsgs = array_keys($msgNoToUIDL);
            }
            if ($ieX->connectMailserver() == 'true') {
                $connectToMailServer = true;
            } // if

            $GLOBALS['log']->debug('Trying to connect to mailserver for [ ' . $a['name'] . ' ]');
            if ($connectToMailServer) {
                $GLOBALS['log']->debug('Connected to mailserver');
                if (!$ieX->isPop3Protocol()) {
                    $newMsgs = $ieX->getNewMessageIds();
                }
                $GLOBALS['log']->fatal('print_r($newMsgs,1)');
                $GLOBALS['log']->fatal(print_r($newMsgs,1));
                if (is_array($newMsgs)) {
                    $current = 1;
                    $total = count($newMsgs);
                    $GLOBALS['log']->fatal('COUNT NEW MESSAGE');
                    $GLOBALS['log']->fatal(count($newMsgs));

                    require_once("include/SugarFolders/SugarFolders.php");
                    $sugarFolder = new SugarFolder();
                    $groupFolderId = $ieX->groupfolder_id;
                    $isGroupFolderExists = false;
                    $users = array();
                    if ($groupFolderId != null && $groupFolderId != "") {
                        $sugarFolder->retrieve($groupFolderId);
                        $isGroupFolderExists = true;
                    } // if
                    $messagesToDelete = array();
                    if ($ieX->isMailBoxTypeCreateCase()) {
                        require_once 'modules/AOP_Case_Updates/AOPAssignManager.php';
                        $assignManager = new AOPAssignManager($ieX);
                    }
                    foreach ($newMsgs as $k => $msgNo) {
                        $uid = $msgNo;
                        if ($ieX->isPop3Protocol()) {
                            $uid = $msgNoToUIDL[$msgNo];
                        } else {
                            $uid = imap_uid($ieX->conn, $msgNo);
                        } // else
                        if ($isGroupFolderExists) {
                            if ($ieX->importOneEmail($msgNo, $uid)) {
                                // add to folder
                                $sugarFolder->addBean($ieX->email);
                                if ($ieX->isPop3Protocol()) {
                                    $messagesToDelete[] = $msgNo;
                                } else {
                                    $messagesToDelete[] = $uid;
                                }
                                if ($ieX->isMailBoxTypeCreateCase()) {
                                    $userId = $assignManager->getNextAssignedUser();
                                    $GLOBALS['log']->debug('userId [ ' . $userId . ' ]');
                                    $email_subject = $ieX->email->name;

                                    ///
                                    $sql_s = "SELECT * FROM config where name = 'email_subject_for_job' AND category = 'system'";
                                    $res_s = $GLOBALS['db']->query($sql_s);
                                    if($res_s->num_rows > 0){
                                        $row_s = $GLOBALS['db']->fetchByAssoc($res_s);
                                        $sub_macro = $row_s['value'];
                                    }else{
                                        $GLOBALS['log']->fatal('Job Macro enty is not defined in the system settings');
                                        return false;
                                    }
                                    $email_subject = strtolower(trim($email_subject));
                                    $sub_macro = strtolower(trim($sub_macro));
                                    if (strpos($email_subject, $sub_macro) !== false) {
                                        ////
                                        $GLOBALS['log']->fatal('It contains the ');
                                        $sql_sep = "select * from config where name = 'email_subject_separator' and category = 'system'";
                                        $res_sep = $GLOBALS['db']->query($sql_sep);
                                        if($res_sep->num_rows > 0){
                                            $row_sep = $GLOBALS['db']->fetchByAssoc($res_sep);
                                            $separator = $row_sep['value'];
                                            if (strpos($email_subject, $separator) !== false) {
                                                $arr = explode($separator,$email_subject);
                                                $subject = strtolower($arr[0]);
                                                $job_title = strtolower($arr[1]);
                                            }else{
                                                $GLOBALS['log']->fatal('Email subject not includes the specified Separator!!!');
                                                $job_title = '';
                                            }
                                        }else{
                                            $GLOBALS['log']->fatal('System settings does not have entry for email_subject_separator');
                                        }
                                        ////
                                        require_once('custom/include/custom_utils.php');
                                        handleCreateCandidate($ieX->email,$job_title); // customizations
                                    }
                                    $ieX->handleCreateCase($ieX->email, $userId);
                                } // if
                            } // if
                        } else {
                            if ($ieX->isAutoImport()) {
                                $ieX->importOneEmail($msgNo, $uid);
                            } else {
                                /*If the group folder doesn't exist then download only those messages
                                 which has caseid in message*/

                                $ieX->getMessagesInEmailCache($msgNo, $uid);
                                $email = new Email();
                                $header = imap_headerinfo($ieX->conn, $msgNo);
                                $email->name = $ieX->handleMimeHeaderDecode($header->subject);
                                $email->from_addr = $ieX->convertImapToSugarEmailAddress($header->from);
                                $email->reply_to_email = $ieX->convertImapToSugarEmailAddress($header->reply_to);
                                if (!empty($email->reply_to_email)) {
                                    $contactAddr = $email->reply_to_email;
                                } else {
                                    $contactAddr = $email->from_addr;
                                }
                                $mailBoxType = $ieX->mailbox_type;
                                $ieX->handleAutoresponse($email, $contactAddr);
                            } // else
                        } // else
                        $GLOBALS['log']->debug('***** On message [ ' . $current . ' of ' . $total . ' ] *****');
                        $current++;
                    } // foreach
                    // update Inbound Account with last robin

                } // if
                if ($isGroupFolderExists) {
                    $leaveMessagesOnMailServer = $ieX->get_stored_options("leaveMessagesOnMailServer", 0);
                    if (!$leaveMessagesOnMailServer) {
                        if ($ieX->isPop3Protocol()) {
                            $ieX->deleteMessageOnMailServerForPop3(implode(",", $messagesToDelete));
                        } else {
                            $ieX->deleteMessageOnMailServer(implode($app_strings['LBL_EMAIL_DELIMITER'], $messagesToDelete));
                        }
                    }
                }
            } else {
                $GLOBALS['log']->fatal("SCHEDULERS: could not get an IMAP connection resource for ID [ {$a['id']} ]. Skipping mailbox [ {$a['name']} ].");
                // cn: bug 9171 - continue while
            } // else
        } // foreach
        imap_expunge($ieX->conn);
        imap_close($ieX->conn, CL_EXPUNGE);
    } // while
    return true;
}

?>