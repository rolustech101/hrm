<?php
class RT_InterviewsController extends SugarController{

	public function action_get_related_candidates()
	{
		ob_clean();
		$vacancy_id = $_REQUEST['vacancy_id'];
		if(!empty($vacancy_id)){

			$sql_st = "select distinct
    iv.rt_candidate_id,
    concat(cand.first_name, ' ', cand.last_name) as candidate_name
from
    rt_interviews iv
        inner join
    rt_candidates cand ON iv.rt_candidate_id = cand.id
where
    rt_vacancy_id = '$vacancy_id'";
			$res_st = $GLOBALS['db']->query($sql_st);
			$options = '';
			while($row_st = $GLOBALS['db']->fetchByAssoc($res_st)){
				$c_id = $row_st['rt_candidate_id'];
				$c_name = $row_st['candidate_name'];
				$options .= ("<option value='$c_id'>". $c_name ."</option>");
			}


			echo $options;
			die();
		}
		$GLOBALS['log']->fatal('Vacancy id is empty!');
		echo 'error';
		die;

	}

}
	