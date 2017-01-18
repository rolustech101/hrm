<?php
class RT_Increment_HistoryController extends SugarController{

	function action_updatestatus() 
	{
		ob_clean();
		$rid = @$_REQUEST['rid'];
		$eid = @$_REQUEST['eid'];
		$inc_date = @$_REQUEST['inc_date'];
		$inc_type = $_REQUEST['inc_type'];
		$sql5 = "select * from rt_increment_history_cstm where id_c='".$rid."'";
		$res5 = $GLOBALS['db']->query($sql5);
		$row5 = $GLOBALS['db']->fetchByAssoc($res5);
		$increment = $row5['increment_c'];
		$sql_e = "select last_name,salary from rt_employees where id = '$eid'";
		$res_e = $GLOBALS['db']->query($sql_e);
		$row_e = $GLOBALS['db']->fetchByAssoc($res_e);
		$serialized_sal = $row_e['salary'];
		$unserialized_sal = unserialize(html_entity_decode(stripslashes($serialized_sal)));
		$is_exists = false;
		foreach ($unserialized_sal as $key => $value){
			if(strtolower($key) == strtolower($inc_type)){
				$is_exists = true;
				$unserialized_sal[$key]['amount'] += $increment;
			}
		}
		if($is_exists){
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

			$updated_serialize = serialize($unserialized_sal);
			$sql_up = "update rt_employees set salary = '$updated_serialize'  where id = '$eid'";
			$res_up = $GLOBALS['db']->query($sql_up);
			echo 'yes';
		}else{
			$GLOBALS['log']->error("$inc_type is not exists for this Employee");
			echo 'no';
		}
		die();
	}
	
}
	