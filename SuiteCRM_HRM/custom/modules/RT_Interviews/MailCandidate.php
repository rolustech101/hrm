<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class MailCandidate
{
    function mail_to_candidate($bean, $event, $arguments)
    {

        $GLOBALS['log']->fatal('mail_to_candidate HOOK!!!!!');
        if($bean->status_c == 'scheduled'){
            $GLOBALS['log']->fatal(print_r($bean,1));
            send_interview_mail($bean->rt_candidate_name,$bean->rt_candidate_id,'Interview notify candidate');
        }
    }
}

?>