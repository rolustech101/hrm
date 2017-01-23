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

		//for entitled annual
		$entitled_annual = '';
		$sql_ea = "SELECT * FROM config where name = 'entitled_annual' AND category = 'system'";
		$res_ea = $GLOBALS['db']->query($sql_ea);
		if($res_ea->num_rows > 0){
			$row_ea = $GLOBALS['db']->fetchByAssoc($res_ea);
			$entitled_annual = $row_ea['value'];
		}
		//for entitled casual
		$entitled_casual = '';
		$sql_ec = "SELECT * FROM config where name = 'entitled_casual' AND category = 'system'";
		$res_ec = $GLOBALS['db']->query($sql_ec);
		if($res_ec->num_rows > 0){
			$row_ec = $GLOBALS['db']->fetchByAssoc($res_ec);
			$entitled_casual = $row_ec['value'];
		}

        $candidate_id = $_REQUEST['candidate_id'];
        $candidate = BeanFactory::getBean('RT_Candidates',$candidate_id);
        if($candidate->load_relationship('rt_job_offers')){
            $rt_offers = $candidate->rt_job_offers->getBeans(['where' => array(
                'lhs_field' => 'status',
                'operator' => '=',
                'rhs_value' => 'accepted'
            ),'limit' => 1, 'order_by' => 'date_entered DESC']);
			if(!empty($rt_offers)){
                foreach ($rt_offers as $offer){
                    $joining_date = $offer->joining_date;
                    $job_name = $offer->rt_job_name;
                    $job_id = $offer->rt_job_id;
                }
            }
        }
        $employee = BeanFactory::newBean('RT_Employees');
        $employee->salutation = $candidate->salutation;
        $employee->first_name = $candidate->first_name;
        $employee->last_name = $candidate->last_name;
        $employee->email1 = $candidate->email1;
        $employee->entitled_annual_leaves_c = $entitled_annual;
        $employee->entitled_casual_leaves_c = $entitled_casual;
        $employee->joining_date_c = $joining_date;
        $employee->rt_employees_rt_jobs_name_c = $job_name;
        $employee->rt_jobs_id_c = $job_id;
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
			if($candidate->load_relationship('rt_job_application_c')){
				$job_application = $candidate->rt_job_application_c->getBeans(['limit' => 1, 'order_by' => 'date_entered DESC']);

				if(!empty($job_application)){
					$GLOBALS['log']->fatal('HELLO JOB_APP>>>>>'.print_r($job_application,1));
					foreach ($job_application as $job_app ){
						$job_app->status = 'hired';
						$vacany_id =  $job_app->rt_vacancy_id;
						$job_app->save();
						$rt_vacancy =  BeanFactory::getBean('RT_Vacancies',$vacany_id);
						$rt_vacancy->positions_c = $rt_vacancy->positions_c -1;
						$rt_vacancy->save();
					}
				}
			}
		}
		echo 'result from controller!';
		die;
    }

	public function action_change_status()
	{
		ob_clean();

		$id = $_REQUEST['candidate_id'];
		$status = $_REQUEST['status'];
		$job_app = BeanFactory::getBean('RT_Job_Application',$id);
		$job_app->status = $status;
		$job_app->save();

		die;

	}
	public function action_is_unique_email()
	{
		ob_clean();
		$emails = $_POST['data'];
		$sql = "select 
    *
from
    (select 
        cand.id as cand_id,
            cand.phone_mobile,
            cand.phone_work,
            cand.phone_other,
            cand.phone_home,
            cand.phone_fax,
            e_add.id as e_id,
            e_add.email_address_id,
            e_add.bean_id
    from
        rt_candidates as cand
    inner join email_addr_bean_rel as e_add ON e_add.bean_id = cand.id
    where
        cand.deleted = 0 AND e_add.deleted = 0 ) as tt
        inner join
    email_addresses as addresses ON addresses.id = tt.email_address_id";

		if (!empty($emails)) {
			$sql .= " where ";
			foreach ($emails as $email) {
				$sql .= "addresses.email_address = '$email' OR ";
			}
		}
		$sql = rtrim($sql,'OR ');
		$sql .= " AND addresses.deleted = 0";


        $res = $GLOBALS['db']->query($sql);
        if($res->num_rows > 0){
            echo 'no';
        }else{
            echo 'yes';
        }
		die;
	}
}
	