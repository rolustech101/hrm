<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/SugarQueue/SugarJobQueue.php');

class UpdateName
{
    function name_update($bean, $event, $arguments)
    {
        global $current_user;
        $candidate = BeanFactory::getBean('RT_Candidates',$bean->rt_candidate_id);
        $job = BeanFactory::getBean('RT_Jobs',$bean->rt_job_id);
        $bean->name = 'Job Offered to '.$candidate->name.' as '.$job->name;
        $GLOBALS['log']->fatal('JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ');


        if($bean->status == 'accepted'){
            $job = new SchedulersJob();
            $job->name = "Job Accepted";
            $arr = [];
            $arr['id'] = $bean->rt_candidate_id;
            $arr['candidate_name'] = $candidate->name;
            $arr['status'] = 'Accepted';
            $arr['template_name'] = 'Job Accepted';
            $job->data = json_encode($arr);
            $job->target = "function::offer_status";
            $job->assigned_user_id = $current_user->id;
            $jq = new SugarJobQueue();
            $jobid = $jq->submitJob($job);
        }elseif ($bean->status == 'rejected'){

            $job = new SchedulersJob();
            $job->name = "Job Accepted";
            $arr = [];
            $arr['id'] = $bean->rt_candidate_id;
            $arr['candidate_name'] = $candidate->name;
            $arr['status'] = 'Rejected';
            $arr['template_name'] = 'Job Accepted';
            $job->data = json_encode($arr);
            $job->target = "function::offer_status";
            $job->assigned_user_id = $current_user->id;
            $jq = new SugarJobQueue();
            $jobid = $jq->submitJob($job);
        }


        $GLOBALS['log']->fatal('Queued JOBBB!!!!!!!!!!');
    }
}
