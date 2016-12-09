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
				echo 'collection is empty';
				die;
			}
			$job_application = BeanFactory::getBean('RT_Job_Application',$application_id);
			if($job_application->load_relationship('rt_vacancies')){
				$vacancies = $job_application->rt_vacancies->getBeans();

				$GLOBALS['log']->fatal('print_r($vacancies)');
				$GLOBALS['log']->fatal(print_r($vacancies));
				if(!empty($vacancies)){
					foreach ($vacancies as $vaca){
						$vacancy_id = $vaca->id;
					}
				}else{
					echo 'Collection is empty';
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
						echo 'Collection is empty';
						die;
					}
					$offer = BeanFactory::newBean('RT_Job_Offers');
					$offer->rt_candidate_id = $id;
					$offer->date_offered = date("Y-m-d");
					$offer->status = 'pending';
					$offer->rt_job_id = $job_id;
					$aa = $offer->save();
					if($aa){
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
//        echo json_encode(['annual' => $bean->annual_leave_balance, 'casual' => $bean->casual_leave_balance, 'joining_date' => $bean->joining_date_c]);
		die;
	}
}
	