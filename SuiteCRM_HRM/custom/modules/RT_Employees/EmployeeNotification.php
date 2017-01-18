<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('include/SugarQueue/SugarJobQueue.php');

class EmployeeNotification
{
    function send_mail($bean, $event, $arguments = null)
    {
        if(isNewBean($bean)){
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
            $data = [];
            $data['emp_id'] = !empty($bean->rtemployee_id)?$bean->rtemployee_id:'N/A';
            $data['name'] = $bean->salutation.' '.$bean->first_name.' '.$bean->last_name;
            $data['gender'] = !empty($bean->gender_c)?$bean->gender_c:'N/A';
            $data['dob'] = !empty($bean->date_of_birth_c)?$bean->date_of_birth_c:'N/A';
            $data['address'] = !empty($bean->primary_address_street)? $bean->primary_address_street:'N/A';
            $data['email'] = $bean->email1;
            $data['supervisor'] = !empty($bean->rt_employees_rt_employees_name)?$bean->rt_employees_rt_employees_name:'N/A';
            $data['total_salary'] = $total_salary;
            $data['cnic'] = !empty($bean->nic_number_c)?$bean->nic_number_c:'N/A';
            $data['marital_status'] = !empty($bean->marital_status_c)?$bean->marital_status_c:'N/A';;
            $data['mobile_phone'] = !empty($bean->phone_mobile)?$bean->phone_mobile:'N/A';
            $data['country'] = !empty($bean->primary_address_country)?$bean->primary_address_country:'N/A';
            $data['joining_date'] = !empty($bean->joining_date_c)?$bean->joining_date_c:'N/A';
            $data['emp_status'] = !empty($bean->employment_status)?$bean->employment_status:'N/A';
            $data['link'] = $base_url . "/index.php?module=RT_Employees&return_module=RT_Employees&action=DetailView&record={$bean->id}";

            $data['template_name'] = 'Employee Information';
            $job->data = json_encode($data);
            $job->target = "function::employee_created";
            $job->assigned_user_id = $current_user->id;
            $jq = new SugarJobQueue();
            $jobid = $jq->submitJob($job);

        }
    }

}

?>

