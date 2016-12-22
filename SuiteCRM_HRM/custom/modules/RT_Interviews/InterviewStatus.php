<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

require_once('include/SugarQueue/SugarJobQueue.php');

class InterviewStatus
{
    function iv_status($bean, $event, $arguments)
    {
        if($bean->status_c == 'Approved' || $bean->status_c == 'Rejected' || $bean->status_c == 'Forwarded'){
            $this->queue_job($bean->id,'IV Status',$bean->rt_candidate_name,$bean->status_c);
        }
    }

    function queue_job($interview_id,$template_name,$candidate_name,$status)
    {
        global $current_user;
        global $sugar_config;
        $base_url = $sugar_config['site_url'];
        $job = new SchedulersJob();
        $job->name = "Interview Status";
        $arr = [];
        $arr['link'] = $base_url . "/index.php?module=RT_Interviews&return_module=RT_Interviews&action=DetailView&record={$interview_id}";
        $arr['template_name'] = $template_name;
        $arr['candidate_name'] = $candidate_name;
        $arr['status'] = $status;
        $job->data = json_encode($arr);
        $job->target = "function::interview_status";
        //user the job runs as
        $job->assigned_user_id = $current_user->id;
        $jq = new SugarJobQueue();
        $jobid = $jq->submitJob($job);
    }
}