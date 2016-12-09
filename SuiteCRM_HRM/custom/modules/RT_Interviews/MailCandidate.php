<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/SugarQueue/SugarJobQueue.php');

class MailCandidate
{
    function mail_to_candidate($bean, $event, $arguments)
    {
        $pp = $bean->fetched_row['date_of_interview'];
        $nn = $bean->date_of_interview;

        $GLOBALS['log']->fatal($pp);
        $GLOBALS['log']->fatal($nn);
        $GLOBALS['log']->fatal('mail_to_candidate HOOK!!!!!');

        if (!isset($bean->fetched_row['id']))
        {
            $bean->is_set = true;
            if($bean->status_c == 'scheduled'){
                $GLOBALS['log']->fatal(print_r($bean,1));

                $this->setjob('RT_Candidates',$bean->rt_candidate_name,$bean->rt_candidate_id,$bean->date_of_interview,'Interview notify candidate');
            }
        }
        else
        {
            /*if($bean->status_c == 'scheduled' && $bean->fetched_row['is_set'] == true){
                $this->setjob('RT_Candidates',$bean->rt_candidate_name,$bean->rt_candidate_id,$bean->date_of_interview,'Interview notify candidate');
            }*/
            if($bean->fetched_row['date_of_interview'] != $bean->date_of_interview){
                if($bean->status_c == 'scheduled'){
                    $this->setjob('RT_Candidates',$bean->rt_candidate_name,$bean->rt_candidate_id,$bean->date_of_interview,'Interview notify candidate');
                }
            }
        }
    }
    function setjob($module_name, $candidate_name, $candidate_id, $interview_date, $template_name)
    {
        global $current_user;
        $job = new SchedulersJob();
        $job->name = "Interview Candidate";
        $arr = [];
        $arr['id'] = $candidate_id;
        $arr['module'] = $module_name;
        $arr['interview_date'] = $interview_date;
        $arr['template_name'] = $template_name;
        $arr['candidate_name'] = $candidate_name;
        $job->data = json_encode($arr);
        $job->target = "function::interview_job";
        //user the job runs as
        $job->assigned_user_id = $current_user->id;
        $jq = new SugarJobQueue();
        $jobid = $jq->submitJob($job);
    }
}

?>