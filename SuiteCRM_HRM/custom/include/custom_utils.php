<?php
require_once 'modules/InboundEmail/InboundEmail.php';
require_once 'include/clean.php';
function get_annual_balance($id)
{
    $emp_sql = "select joining_date_c from rt_employees_cstm  where id_c = '$id'";
    $emp_res = $GLOBALS['db']->query($emp_sql);
    $emp_row = $GLOBALS['db']->fetchByAssoc($emp_res);
    $emp_joining_date = $emp_row['joining_date_c'];
    $date_start = substr_replace($emp_joining_date,date('Y'),0,4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)) );
     $GLOBALS['log']->fatal($date_start .' => '.$futureDate);
 $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Annual' and deleted = '0' and  from_date_c BETWEEN '$date_start' and '$futureDate'";
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    $GLOBALS['log']->fatal('total_days'.$no_of_days);
    return $no_of_days;
}
function get_casual_balance($id)
{
    $emp_sql = "select joining_date_c from rt_employees_cstm  where id_c = '$id'";
    $emp_res = $GLOBALS['db']->query($emp_sql);
    $emp_row = $GLOBALS['db']->fetchByAssoc($emp_res);
    $emp_joining_date = $emp_row['joining_date_c'];
    $date_start = substr_replace($emp_joining_date,date('Y'),0,4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)) );
    $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Casual' and deleted = '0' and  from_date_c BETWEEN '$date_start' and '$futureDate'" ;
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    $GLOBALS['log']->fatal('total_days'.$no_of_days);
    return $no_of_days;
}
function get_annual_b($emp_id)
{
    $total_annual_leaves = get_annual_balance($emp_id);
    $sql = "select * from rt_employees_cstm where id_c = '$emp_id'";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $entitled_annual = $row['entitled_annual_leaves_c'];
    $balance = $entitled_annual - $total_annual_leaves;
    $absolute_balance = abs($balance);
    return $absolute_balance;

}
function get_casual_b($emp_id)
{
    $total_casual_leaves = get_casual_balance($emp_id);
    $sql = "select * from rt_employees_cstm where id_c = '$emp_id'";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $entitled_casual = $row['entitled_casual_leaves_c'];
    $balance = $total_casual_leaves - $entitled_casual;
    $absolute_balance = abs($balance);
    return $absolute_balance;
}
function get_filling_status_countries()
{
    return ['USA','AUSTRALIA'];
}
function get_non_filling_countries()
{
    return ['PAKISTAN','UNITED KINGDOM','CANADA'];
}
function handleCreateCandidate($email) {
    $GLOBALS['log']->fatal('in the handleCreateCase AOP');
    global $current_user, $mod_strings, $current_language;
    $mod_strings = return_module_language($current_language, "Emails");
    $GLOBALS['log']->debug('In handleCreateCase in AOPInboundEmail CUSTOMMMMM');
//    $c = new aCase();
//    $this->getCaseIdFromCaseNumber($email->name, $c);

//    if (!$this->handleCaseAssignment($email) && $this->isMailBoxTypeCreateCase()) {
    if (true) {
        $GLOBALS['log']->fatal('AOP GOING TO create case!!!!');
        // create a case
        $GLOBALS['log']->debug('retrieveing email');
        $email->retrieve($email->id);
//        $c = new aCase();
        $c = BeanFactory::newBean('RT_Candidates');

        $notes = $email->get_linked_beans('notes','Notes');
        $noteIds = array();
        foreach($notes as $note){
            $noteIds[] = $note->id;
        }
        if($email->description_html) {
//            $c->description = $this->processImageLinks(SugarCleaner::cleanHtml($email->description_html),$noteIds);
            $c->description = 'Hello description from code!!!!';
        }else{
            $c->description = $email->description;
        }
//        $c->assigned_user_id = $userId;
        $c->last_name = $email->name;
//        $c->status = 'New';
//        $c->priority = 'P1';

        if(!empty($email->reply_to_email)) {
            $contactAddr = $email->reply_to_email;
        } else {
            $contactAddr = $email->from_addr;
        }
/*
        $GLOBALS['log']->debug('finding related accounts with address ' . $contactAddr);
        if($accountIds = $this->getRelatedId($contactAddr, 'accounts')) {
            if (sizeof($accountIds) == 1) {
                $c->account_id = $accountIds[0];

                $acct = new Account();
                $acct->retrieve($c->account_id);
                $c->account_name = $acct->name;
            } // if
        } // if
        $contactIds = $this->getRelatedId($contactAddr, 'contacts');
        if(!empty($contactIds)) {
            $c->contact_created_by_id = $contactIds[0];
        }*/

        $c->phone_mobile = '123';
        $c->save(true);
    /*    $caseId = $c->id;
        $c = new aCase();
        $c->retrieve($caseId);
        if($c->load_relationship('emails')) {
            $c->emails->add($email->id);
        } */// if
/*        if(!empty($contactIds) && $c->load_relationship('contacts')) {
            if (!$accountIds && count($contactIds) == 1) {
                $contact = BeanFactory::getBean('Contacts', $contactIds[0]);
                if ($contact->load_relationship('accounts')) {
                    $acct = $contact->accounts->get();
                    if ($c->load_relationship('accounts') && !empty($acct[0])) {
                        $c->accounts->add($acct[0]);
                    }
                }
            }
            $c->contacts->add($contactIds);
        } // if*/
        // uncomment and add flexrelate to document module
       /* foreach($notes as $note){
            //Link notes to case also
            $newNote = BeanFactory::newBean('Notes');
            $newNote->name = $note->name;
            $newNote->file_mime_type = $note->file_mime_type;
            $newNote->filename = $note->filename;
            $newNote->parent_type = 'Cases';
            $newNote->parent_id = $c->id;
            $newNote->save();
            $srcFile = "upload://{$note->id}";
            $destFile = "upload://{$newNote->id}";
            copy($srcFile,$destFile);

        }*/
        // uncomment and add flexrelate to document module

        // uncomment and add flexrelate to flexrelate module many to many relationship
        /*$c->email_id = $email->id;
        $email->parent_type = "Cases";
        $email->parent_id = $caseId;
        // assign the email to the case owner
        $email->assigned_user_id = $c->assigned_user_id;
        $email->name = str_replace('%1', $c->case_number, $c->getEmailSubjectMacro()) . " ". $email->name;
        $email->save();*/
        // uncomment and add flexrelate to flexrelate module many to many relationship
//        $GLOBALS['log']->debug('InboundEmail created one candidate with number: '.$c->case_number);
        // uncomment to create email record for reply....
        /*$createCaseTemplateId = $this->get_stored_options('create_case_email_template', "");
        if(!empty($this->stored_options)) {
            $storedOptions = unserialize(base64_decode($this->stored_options));
        }
        if(!empty($createCaseTemplateId)) {
            $fromName = "";
            $fromAddress = "";
            if (!empty($this->stored_options)) {
                $fromAddress = $storedOptions['from_addr'];
                $fromName = from_html($storedOptions['from_name']);
                $replyToName = (!empty($storedOptions['reply_to_name']))? from_html($storedOptions['reply_to_name']) :$fromName ;
                $replyToAddr = (!empty($storedOptions['reply_to_addr'])) ? $storedOptions['reply_to_addr'] : $fromAddress;
            } // if
            $defaults = $current_user->getPreferredEmail();
            $fromAddress = (!empty($fromAddress)) ? $fromAddress : $defaults['email'];
            $fromName = (!empty($fromName)) ? $fromName : $defaults['name'];
            $to[0]['email'] = $contactAddr;

            // handle to name: address, prefer reply-to
            if(!empty($email->reply_to_name)) {
                $to[0]['display'] = $email->reply_to_name;
            } elseif(!empty($email->from_name)) {
                $to[0]['display'] = $email->from_name;
            }

            $et = new EmailTemplate();
            $et->retrieve($createCaseTemplateId);
            if(empty($et->subject))		{ $et->subject = ''; }
            if(empty($et->body))		{ $et->body = ''; }
            if(empty($et->body_html))	{ $et->body_html = ''; }

            $et->subject = "Re:" . " " . str_replace('%1', $c->case_number, $c->getEmailSubjectMacro() . " ". $c->name);

            $html = trim($email->description_html);
            $plain = trim($email->description);

            $email->email2init();
            $email->from_addr = $email->from_addr_name;
            $email->to_addrs = $email->to_addrs_names;
            $email->cc_addrs = $email->cc_addrs_names;
            $email->bcc_addrs = $email->bcc_addrs_names;
            $email->from_name = $email->from_addr;

            $email = $email->et->handleReplyType($email, "reply");
            $ret = $email->et->displayComposeEmail($email);
            $ret['description'] = empty($email->description_html) ?  str_replace("\n", "\n<BR/>", $email->description) : $email->description_html;

            $reply = new Email();
            $reply->type				= 'out';
            $reply->to_addrs			= $to[0]['email'];
            $reply->to_addrs_arr		= $to;
            $reply->cc_addrs_arr		= array();
            $reply->bcc_addrs_arr		= array();
            $reply->from_name			= $fromName;
            $reply->from_addr			= $fromAddress;
            $reply->reply_to_name		= $replyToName;
            $reply->reply_to_addr		= $replyToAddr;
            $reply->name				= $et->subject;
            $reply->description			= $et->body . "<div><hr /></div>" .  $email->description;
            if (!$et->text_only) {
                $reply->description_html	= $et->body_html .  "<div><hr /></div>" . $email->description;
            }
            $GLOBALS['log']->debug('saving and sending auto-reply email');
            //$reply->save(); // don't save the actual email.
            $reply->send();
        } // if*/
        // uncomment to create email record for reply....

    } /*else {
        echo "First if not matching\n";
        if(!empty($email->reply_to_email)) {
            $contactAddr = $email->reply_to_email;
        } else {
            $contactAddr = $email->from_addr;
        }
        $this->handleAutoresponse($email, $contactAddr);
    }*/
    echo "End of handle create Candidate\n";

} // fn
?>