<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/SugarQueue/SugarJobQueue.php');

class MailCandidate
{
    function mail_to_candidate($bean, $event, $arguments)
    {
        if (isNewBean($bean))
        {
            $bean->is_set = true;
            if($bean->status_c == 'scheduled'){
                $this->setjob('RT_Candidates',$bean->rt_candidate_name,$bean->rt_candidate_id,$bean->date_of_interview,'Interview notify candidate');
            }
        }
        else
        {
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
        $data = [];
        $data['id'] = $candidate_id;
        $data['module'] = $module_name;
        $data['interview_date'] = $interview_date;
        $data['template_name'] = $template_name;
        $data['candidate_name'] = $candidate_name;
        $job->data = json_encode($data);
        $job->target = "function::interview_job";
        //user the job runs as
        $job->assigned_user_id = $current_user->id;
        $jq = new SugarJobQueue();
        $jobid = $jq->submitJob($job);
    }
}
?>