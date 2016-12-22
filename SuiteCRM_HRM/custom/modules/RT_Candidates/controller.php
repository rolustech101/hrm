<?php
class RT_CandidatesController extends SugarController{

	public function action_create_offer()
	{
		ob_clean();
		global $current_user;
		$id = $_REQUEST['candidate_id'];
		$candidate = BeanFactory::getBean('RT_Candidates',$id);
		if($candidate->load_relationship('rt_job_application_c')){
			$applications = $candidate->rt_job_application_c->getBeans(['limit' => 1, 'order_by' => 'date_entered DESC']);
			if(!empty($applications)){
				foreach ($applications as $app){
					$application_id = $app->id;
				}
			}else{
				echo 'error404';
				die;
			}
			$job_application = BeanFactory::getBean('RT_Job_Application',$application_id);
			if($job_application->load_relationship('rt_vacancies')){
				$vacancies = $job_application->rt_vacancies->getBeans();

				if(!empty($vacancies)){
					foreach ($vacancies as $vaca){
						$vacancy_id = $vaca->id;
					}
				}else{
					echo 'error404';
					die;
				}
				$rt_vacancy = BeanFactory::getBean('RT_Vacancies',$vacancy_id);
				if($rt_vacancy->load_relationship('rt_jobs')){
					$jobs = $rt_vacancy->rt_jobs->getBeans();
					if(!empty($jobs)){
						foreach ($jobs as $job){
							$job_id = $job->id;
						}
					}else{
						echo 'error404';
						die;
					}
					$offer = BeanFactory::newBean('RT_Job_Offers');
					$offer->rt_candidate_id = $id;
					$offer->date_offered = date("Y-m-d");
					$offer->status = 'pending';
					$offer->rt_job_id = $job_id;
					$aa = $offer->save();
					if($aa){
						$candidate->is_offered = true;
						$candidate->save();
						$job = new SchedulersJob();
						$job->name = "Job Offered";
						$arr = [];
						$arr['id'] = $id;
						$arr['candidate_name'] = $candidate->name;
						$arr['template_name'] = 'job offered';
						$job->data = json_encode($arr);
						$job->target = "function::offer_job";
						$job->assigned_user_id = $current_user->id;
						$jq = new SugarJobQueue();
						$jobid = $jq->submitJob($job);
					}
				}
			}
		}
		echo json_encode('result from controller!!!');
		die;
	}
    public function action_convert_cand()
    {
		ob_clean();
        $candidate_id = $_REQUEST['candidate_id'];
        $candidate = BeanFactory::getBean('RT_Candidates',$candidate_id);
        $employee = BeanFactory::newBean('RT_Employees');
        $employee->salutation = $candidate->salutation;
        $employee->first_name = $candidate->first_name;
        $employee->last_name = $candidate->last_name;
        $employee->email1 = $candidate->email1;
        $employee->entitled_annual_leaves_c = 10;
        $employee->entitled_casual_leaves_c = 6;
        $employee->joining_date_c = date("Y-m-d");
        $employee->employment_status = 'Active';
        $employee->nic_number_c = $candidate->cnic;
        $employee->phone_mobile = $candidate->phone_mobile;
        $employee->primary_address_street = $candidate->primary_address_street;
        $employee->primary_address_country = $candidate->primary_address_country;
		$ee = $employee->save();
		if($ee){
			$candidate->is_converted = true;
			$candidate->employee_id = $employee->id;
			$candidate->save();
		}

		echo json_encode('result from controller!!!');
		die;

    }
}
	