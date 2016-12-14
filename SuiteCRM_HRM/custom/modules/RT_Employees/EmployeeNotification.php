<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('include/SugarQueue/SugarJobQueue.php');

class EmployeeNotification
{
    function send_mail($bean, $event, $arguments = null)
    {
        if (!isset($bean->fetched_row['id'])) {
            global $sugar_config;
            $base_url = $sugar_config['site_url'];
            global $current_user;
            $i = 0;
            $total_salary = 0;
            foreach ($bean->label_salary as $label) {
                $total_salary += $bean->amount_salary[$i];
                $i++;
            }
            $job = new SchedulersJob();
            $job->name = "Notify About New Employee";
            $arr = [];
            $arr['emp_id'] = !empty($bean->rtemployee_id)?$bean->rtemployee_id:'N/A';
            $arr['name'] = $bean->salutation.' '.$bean->first_name.' '.$bean->last_name;
            $arr['gender'] = !empty($bean->gender_c)?$bean->gender_c:' ';
            $arr['dob'] = !empty($bean->date_of_birth_c)?$bean->date_of_birth_c:'N/A';
            $arr['address'] = $bean->primary_address_street;
            $arr['email'] = $bean->email1;
            $arr['supervisor'] = !empty($bean->rt_employees_rt_employees_name)?$bean->rt_employees_rt_employees_name:'N/A';
            $arr['total_salary'] = $total_salary;
            $arr['cnic'] = $bean->nic_number_c;
            $arr['marital_status'] = !empty($bean->marital_status_c)?$bean->marital_status_c:'N/A';;
            $arr['mobile_phone'] = $bean->phone_mobile;
            $arr['country'] = $bean->primary_address_country;
            $arr['joining_date'] = $bean->joining_date_c;
            $arr['emp_status'] = !empty($bean->employment_status)?$bean->employment_status:'N/A';
            $arr['link'] = $base_url . "/index.php?module=RT_Employees&return_module=RT_Employees&action=DetailView&record={$bean->id}";

            $arr['template_name'] = 'Employee Information';
            $job->data = json_encode($arr);
            $job->target = "function::employee_created";
            $job->assigned_user_id = $current_user->id;
            $jq = new SugarJobQueue();
            $jobid = $jq->submitJob($job);

        }
    }

}

?>
