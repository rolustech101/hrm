<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class MailInterviewer
{
    function mail_to_interviewer($bean, $event, $arguments)
    {
        $GLOBALS['log']->fatal('mail_to_interviewer HOOK!!!!!');
        if($arguments['related_module'] = 'RT_Employees' && !empty($arguments['related_id'])){
            $GLOBALS['log']->fatal(print_r($arguments,1));
        }
    }
}

?>