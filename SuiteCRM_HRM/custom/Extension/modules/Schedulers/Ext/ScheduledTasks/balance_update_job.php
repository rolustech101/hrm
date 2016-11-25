<?php

array_push($job_strings, 'balance_update_job');
function balance_update_job()
{
   $sql = "select id, date_format(joining_date_c ,'%m-%d') as joining_date, annual_leave_balance, casual_leave_balance,entitled_annual_leaves_c,entitled_casual_leaves_c from rt_employees inner join rt_employees_cstm ON id = id_c where date_format(joining_date_c ,'%m-%d') = date_format(now() ,'%m-%d')";
    $res = $GLOBALS['db']->query($sql);
    while($row = $GLOBALS['db']->fetchByAssoc($res)){
        $entilted_annual = $row['entitled_annual_leaves_c'];
        $entilted_casual= $row['entitled_casual_leaves_c'];
        $id= $row['id'];
        $u_sql = "UPDATE rt_employees set annual_leave_balance = '$entilted_annual',casual_leave_balance = '$entilted_casual' where id = '$id'";
        $result = $GLOBALS['db']->query($u_sql);
        $GLOBALS['log']->fatal('scheduler run and updated => '.$id);
    }
    return true;
}