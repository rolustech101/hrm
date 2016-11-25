<?php
class RT_DepartmentsController extends SugarController{

	function action_getemployees() 
	{
	
		ob_clean();
		$sql2="select * from rt_employees";
		$res2 = $GLOBALS['db']->query($sql2);
		$row2 = $GLOBALS['db']->fetchByAssoc($res2);
		while($row2){
			$eid = $row2['id'];			
			$name = $row2['first_name']." ".$row2['last_name'];
			echo "<option value='".$eid."'>".$name."</option>";
			$row2 = $GLOBALS['db']->fetchByAssoc($res2);
		}
			die();
	}
}
	