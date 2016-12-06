<?php 
 //WARNING: The contents of this file are auto-generated


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