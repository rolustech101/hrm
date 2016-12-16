<?php
class RT_EmployeesController extends SugarController{

	function action_calculate_tax() 
	{	
		ob_clean();
//		$tax = 0;
//		$fix_amount = 0;
//		$salary_exceed = 0; //amount that is exceeded from lower limit of tax salary range
		$tax_data = array();
		if(isset($_REQUEST['salary']) || !empty($_REQUEST['salary'])){
			$country = $_REQUEST['country'];
			$filling_status = $_REQUEST['file_status'];
			//calculate tax according to the range of salary
			$annual_taxable_salary = $_REQUEST['salary'] * 12;
			$GLOBALS['log']->fatal("annnual salary: ".$annual_taxable_salary);
			if($filling_status == 'any'){
				$query = "select * from rt_salarysetting where ($annual_taxable_salary >= sal_from AND $annual_taxable_salary <= sal_to  AND country = '$country'  AND deleted=0) OR ($annual_taxable_salary >= sal_from AND sal_to IS NULL AND country = '$country'  AND deleted=0)";
			}else{
				$query = "select * from rt_salarysetting where ($annual_taxable_salary >= sal_from AND $annual_taxable_salary <= sal_to AND country = '$country' AND filling_status = '$filling_status' AND deleted=0) OR ($annual_taxable_salary >= sal_from AND sal_to IS NULL AND country = '$country'  AND deleted=0)";
			}
			$GLOBALS['log']->fatal($query);
			$results = $GLOBALS['db']->query($query);
			$GLOBALS['log']->fatal(print_r($results,1));
			if($results->num_rows > 0){
				$GLOBALS['log']->fatal("HEllo");
				$taxes = $GLOBALS['db']->fetchByAssoc($results);
				$tax_data['tax'] = $taxes['tax_rate'];
				$tax_data['fix_amount'] = $taxes['fix_amount'];
				$tax_data['salary_exceed'] = $annual_taxable_salary - $taxes['sal_from'];
			}else{
				$GLOBALS['log']->fatal('This salary range do not fit with the current ranges for country OR you did not define ranges for '.$country. ' having filling status '.$filling_status);
			}
		}
		$GLOBALS['log']->fatal(print_r($tax_data,1));		
		echo json_encode($tax_data);
		die();
	}
	public function action_get_increment_options()
	{
		ob_clean();
		$list = get_salary_selectlist();
		echo json_encode($list);
		die();
	}

}
	