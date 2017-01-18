<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('include/SugarQueue/SugarJobQueue.php');

class NotifyMail
{
    function send_notification($bean, $event, $arguments)
    {
        global $sugar_config;
        $base_url = $sugar_config['site_url'];
        global $current_user;
        if ($bean->status_c == 'new_position') {
            $job = new SchedulersJob();
            $job->name = "Notify About job Posting";
            $data = [];
            $data['posting_name'] = $bean->name;
            $data['link'] = $base_url . "/index.php?module=RT_Vacancies&return_module=RT_Vacancies&action=DetailView&record={$bean->id}";
            $data['template_name'] = 'Job Posting Alert';
            $job->data = json_encode($data);
            $job->target = "function::job_posted";
            $job->assigned_user_id = $current_user->id;
            $jq = new SugarJobQueue();
            $jobid = $jq->submitJob($job);
        }

    }
}

?>