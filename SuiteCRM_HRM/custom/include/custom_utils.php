<?php
function get_annual_balance($id)
{
    $emp_sql = "select joining_date_c from rt_employees_cstm  where id_c = '$id'";
    $emp_res = $GLOBALS['db']->query($emp_sql);
    $emp_row = $GLOBALS['db']->fetchByAssoc($emp_res);
    $emp_joining_date = $emp_row['joining_date_c'];
    $date_start = substr_replace($emp_joining_date,date('Y'),0,4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)) );
     $GLOBALS['log']->fatal($date_start .' => '.$futureDate);
 $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Annual' and deleted = '0' and  from_date_c BETWEEN '$date_start' and '$futureDate'";
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    $GLOBALS['log']->fatal('total_days'.$no_of_days);
    return $no_of_days;
}
function get_casual_balance($id)
{
    $emp_sql = "select joining_date_c from rt_employees_cstm  where id_c = '$id'";
    $emp_res = $GLOBALS['db']->query($emp_sql);
    $emp_row = $GLOBALS['db']->fetchByAssoc($emp_res);
    $emp_joining_date = $emp_row['joining_date_c'];
    $date_start = substr_replace($emp_joining_date,date('Y'),0,4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)) );
    $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Casual' and deleted = '0' and  from_date_c BETWEEN '$date_start' and '$futureDate'" ;
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    $GLOBALS['log']->fatal('total_days'.$no_of_days);
    return $no_of_days;
}
function get_annual_b($emp_id)
{
    $total_annual_leaves = get_annual_balance($emp_id);
    $sql = "select * from rt_employees_cstm where id_c = '$emp_id'";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $entitled_annual = $row['entitled_annual_leaves_c'];
    $balance = $entitled_annual - $total_annual_leaves;
    $absolute_balance = abs($balance);
    return $absolute_balance;

}
function get_casual_b($emp_id)
{
    $total_casual_leaves = get_casual_balance($emp_id);
    $sql = "select * from rt_employees_cstm where id_c = '$emp_id'";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $entitled_casual = $row['entitled_casual_leaves_c'];
    $balance = $total_casual_leaves - $entitled_casual;
    $absolute_balance = abs($balance);
    return $absolute_balance;
}
function get_filling_status_countries()
{
    return ['USA','AUSTRALIA'];
}
function get_non_filling_countries()
{
    return ['PAKISTAN','UNITED KINGDOM','CANADA'];
}
?>