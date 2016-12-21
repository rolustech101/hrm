<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
require_once('include/SugarQueue/SugarJobQueue.php');

class MailInterviewer
{
    function mail_to_interviewer($bean, $event, $arguments)
    {
        global $current_user;
        $GLOBALS['log']->fatal('mail_to_interviewer HOOK!!!!!');
        if($arguments['related_module'] == 'RT_Employees' && $arguments['link'] == 'rt_interviews_rt_employees_1' ){
            $cand_id = $bean->rt_candidate_id;
            $cand_bean = BeanFactory::getBean('RT_Candidates',$cand_id);
            if ($cand_bean->load_relationship('rt_job_application_c'))
            {
                $relatedBeans = $cand_bean->rt_job_application_c->getBeans(['limit' => 1, 'order_by' => 'date_entered DESC']);
                if (!empty($relatedBeans))
                {
                    foreach ($relatedBeans as $single){
                        $job_id = $single->id;
                    }
                    $job_app_id = $relatedBeans['id'];
                }
            }
            $interview_date = $bean->date_of_interview;
            $module = $arguments['related_module'];
            $emp_id = $arguments['related_id'];
            $emp_name = $arguments['related_bean']->name;
            $job = new SchedulersJob();
            $job->name = "Interview Alert Job";
            $arr = [];
            $arr['id'] = $emp_id;
            $arr['job_id'] = $job_id;
            $arr['module'] = 'RT_Employees';
            $arr['interview_date'] = $interview_date;
            $arr['template_name'] = 'Interview notify interviewer';
            $arr['employee_name'] = $emp_name;
            $arr['candidate_name'] = $bean->rt_candidate_name;
            $job->data = json_encode($arr);
            $job->target = "function::interview_job";
            $job->assigned_user_id = $current_user->id;
            $jq = new SugarJobQueue();
            $jobid = $jq->submitJob($job);
        }
    }
}

?>