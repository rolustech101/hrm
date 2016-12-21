<?php
class RT_LeavesController extends SugarController{

	function action_getentitled() 
	{
		ob_clean();
		$firstname = $_REQUEST['firstname'];
		$lastname = $_REQUEST['lastname'];
			$sql="select * from rt_employees where deleted=0 AND first_name='".$firstname."' AND last_name='".$lastname."'";
			$res = $GLOBALS['db']->query($sql);
			$row = $GLOBALS['db']->fetchByAssoc($res);
			$eid = $row['id'];
			$emp = new RT_Employees();
			$emp->retrieve($eid);
			//echo $emp->annual_leave_balance;
			//echo $emp->entitled_annual_leaves_c;

		$sql = "select * from rt_employees_cstm where id_c='".$eid."'";
		$res = $GLOBALS['db']->query($sql);
		$row = $GLOBALS['db']->fetchByAssoc($res);
		$entitledannual = $row['entitled_annual_leaves_c'];
		$balanceannual=0;
		$fromdate = $row['balance_update_date_c'];
		$nextyear = date('Y-m-d',strtotime("+1 year $fromdate"));
		$todate = date('d-m-Y');
		$start_ts = strtotime($fromdate);
		$end_ts = strtotime($todate);
		$diff = $end_ts - $start_ts;
		$balanceupdatedays =  round($diff / 86400);
		if($balanceupdatedays<0){
			$balanceupdatedays = 0;
		}
		if($balanceupdatedays == 365)//year ended
		{			
			$sql = 'update rt_employees_cstm set balance_update_date_c="'.$nextyear.'" where id_c="'.$eid.'"';
			$GLOBALS['db']->query($sql);
			$balanceannual = $entitledannual;
		}
		else{
			$sql = "select * from rt_employees_cstm where id_c='".$id."'";
			$bal = $GLOBALS['db']->fetchByAssoc($GLOBALS['db']->query($sql));
			$sql = "select * from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida	='".$eid."' AND deleted=0";
			$res = $GLOBALS['db']->query($sql);
			$row = $GLOBALS['db']->fetchByAssoc($res);
			while($row){
				$lid = $row['rt_employees_rt_leavesrt_leaves_idb'];
				$sql2 = "select * from rt_leaves_cstm where id_c ='".$lid."' AND (status_c='Scheduled' OR status_c = 'Taken') AND leave_type_c='Annual' AND from_date_c >= '".$bal['balance_update_date_c']."'";
				$res2 = $GLOBALS['db']->query($sql2);
				$row2 = $GLOBALS['db']->fetchByAssoc($res2);
				$end_ts = $row2['from_date_c'];
				$dif = $end_ts - $start_ts;
				if($dif<0){
					$dif=0;
				}
				$days =  round($dif / 86400);
				if($days<=365){
					$noofdays = $row2['number_of_days_c'];
					$entitledannual = $entitledannual-$noofdays;
				}
				$row = $GLOBALS['db']->fetchByAssoc($res);
			}
			$balanceannual = $entitledannual;
		
		}
	/////////////////////////////////////
		$sql = "select * from rt_employees_cstm where id_c='".$eid."'";
		$res = $GLOBALS['db']->query($sql);
		$row = $GLOBALS['db']->fetchByAssoc($res);
		$entitledcasual = $row['entitled_casual_leaves_c'];
		$balancecasual=0;
		$fromdate = $row['balance_update_date_c'];
		$nextyear = date('Y-m-d',strtotime("+1 year $fromdate"));
		$todate = date('d-m-Y');
		$start_ts = strtotime($fromdate);
		$end_ts = strtotime($todate);
		$diff = $end_ts - $start_ts;
		$balanceupdatedays =  round($diff / 86400);
		$GLOBALS['log']->debug("hello ".$balanceupdatedays);

		if($balanceupdatedays<0){
			$balanceupdatedays = 0;
		}
		if($balanceupdatedays >= 365)//year ended
		{			
			$sql = 'update rt_employees_cstm set balance_update_date_c="'.$nextyear.'" where id_c="'.$eid.'"';
			$GLOBALS['db']->query($sql);
			$balancecasual = $entitledcasual;
			$GLOBALS['log']->debug("balance casual ".$balancecasual);
		}
		else{
			$sql = "select * from rt_employees_cstm where id_c='".$id."'";
			$bal = $GLOBALS['db']->fetchByAssoc($GLOBALS['db']->query($sql));
			$sql = "select * from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida='".$eid."' AND deleted=0";
			$res = $GLOBALS['db']->query($sql);
			$row = $GLOBALS['db']->fetchByAssoc($res);
			while($row){
				$lid = $row['rt_employees_rt_leavesrt_leaves_idb'];
				$sql2 = "select * from rt_leaves_cstm where id_c ='".$lid."' AND (status_c='Scheduled' OR status_c = 'Taken') AND leave_type_c='Casual' AND from_date_c >= '".$bal['balance_update_date_c']."'";
				$res2 = $GLOBALS['db']->query($sql2);
				$row2 = $GLOBALS['db']->fetchByAssoc($res2);
				$end_ts = $row2['from_date_c'];
				$GLOBALS['log']->debug("from date ".$end_ts);
				$dif = $end_ts - $start_ts;
				if($dif<0){
					$dif=0;
				}
				$dif = $end_ts - $start_ts;
				$days =  round($dif / 86400);
				$GLOBALS['log']->debug("days ".$days);
				if($days<=365){
					$noofdays = $row2['number_of_days_c'];
					$entitledcasual = $entitledcasual-$noofdays;
					$GLOBALS['log']->debug("days ".$noofdays);
					$GLOBALS['log']->debug("dayss ".$entitledcasual);
				}
				$row = $GLOBALS['db']->fetchByAssoc($res);
			}
			$balancecasual = $entitledcasual;
		
		}
		echo "Annual Leaves Balance:     ".$balanceannual."<br>Casual Leaves Balance:     ".$balancecasual;
			die();
	}
	public function action_getleaves_balance()
	{
		ob_clean();
		$id = $_REQUEST['employee_id'];
        $bean = BeanFactory::getBean('RT_Employees', $id);
        echo json_encode(['annual' => $bean->annual_leave_balance, 'casual' => $bean->casual_leave_balance, 'joining_date' => $bean->joining_date_c]);
		die;
	}
	public function action_validate_leaves(){
		ob_clean();
		$emp_id = $_POST['emp_id'];
		$leave_type = $_POST['leave_type'];
		$no_of_days = $_POST['no_of_days'];
		$emp_bean = BeanFactory::getBean('RT_Employees', $emp_id);

		if($leave_type == 'Annual'){
			$annual_leaves = get_annual_balance($emp_id);
			$annual_total = $annual_leaves + $no_of_days;
			$entitled_annual = $emp_bean->entitled_annual_leaves_c;
			if($annual_total > $entitled_annual){
				echo json_encode(['statuss' => 'error']);
				$GLOBALS['log']->fatal('You do not have sufficient balance for annual leaves');
				die;
			}else{
				$GLOBALS['log']->fatal('has annual balance!!');
			}
		}else{
			$casual_leaves = get_casual_balance($emp_id);
			$casual_total = $casual_leaves + $no_of_days;
			$entitled_casual = $emp_bean->entitled_casual_leaves_c;
			if($casual_total > $entitled_casual){
				echo json_encode(['statuss' => 'error']);
				$GLOBALS['log']->fatal('You do not have sufficient balance for casual leaves');
				die;
			}else{
				$GLOBALS['log']->fatal('has casual balance!!!');
			}
		}
		echo json_encode(['statuss' => 'success']);
		die;
	}
}
	