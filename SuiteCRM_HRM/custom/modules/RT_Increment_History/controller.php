<?php
class RT_Increment_HistoryController extends SugarController{

	function action_updatestatus() 
	{
		ob_clean();
		$rid = @$_REQUEST['rid'];
		$eid = @$_REQUEST['eid'];
		$inc_date = @$_REQUEST['inc_date'];

		$sql="update rt_increment_history_cstm set status_c='Applied' where id_c ='".$rid."'";
		$GLOBALS['db']->query($sql);
        $inc_sql = "SELECT * FROM config WHERE name = 'increment_interval' and category = 'system'";
        $inc_res = $GLOBALS['db']->query($inc_sql);
        $inc_row = $GLOBALS['db']->fetchByAssoc($inc_res);
        $inc_interval = $inc_row['value'];
        if($inc_interval == 'by_annual'){
            $next = date("Y-m-d", strtotime(date("Y-m-d", strtotime($inc_date)) . " +6 month"));
        }else{
            $next = date("Y-m-d", strtotime(date("Y-m-d", strtotime($inc_date)) . " + 1 year"));
        }
		$sql2="update rt_increment_history_cstm set next_increment_c='".$next."' where id_c ='".$rid."'";
		$GLOBALS['db']->query($sql2);
		$sql3 = "select * from rt_employees_cstm where id_c='".$eid."'";
		$res3 = $GLOBALS['db']->query($sql3);
		$row3 = $GLOBALS['db']->fetchByAssoc($res3);
		$salary = $row3['salary_c'];
		$sql5 = "select * from rt_increment_history_cstm where id_c='".$rid."'";
		$res5 = $GLOBALS['db']->query($sql5);
		$row5 = $GLOBALS['db']->fetchByAssoc($res5);
		$salary = $row3['salary_c'];
		$increment = $row5['increment_c'];
		$salary = $salary + $increment;
		$sql4="update rt_increment_history_cstm set next_increment_c='".$next."' where id_c ='".$rid."'";
		$GLOBALS['db']->query($sql4);
		$sql6="update rt_employees_cstm set salary_c=".$salary." where id_c ='".$eid."'";
		$GLOBALS['db']->query($sql6);
		die();
	}
	
}
	