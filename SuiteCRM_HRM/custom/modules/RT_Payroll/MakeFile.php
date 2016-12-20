<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
class MakeFile{
    function genfile($bean,$event, $arguments){
        $GLOBALS['log']->fatal('in RT payroll before save');
        $ids = $bean->abc_c;
        global $current_user;
        $month = $bean->month;
        $year = $bean->year;
        $pieces = explode("^,^", $ids);
        $pieces[0] = trim($pieces[0], "^");
        $size = sizeof($pieces);
        $GLOBALS['log']->fatal('SIxe is::::::'.$size);
        $pieces[$size-1] = trim($pieces[$size-1], "^");
        $provident = 0;

        $date = $month." ".$year;

        $i=0;$name="";
        while($i<$size){
            $id = $pieces[$i];
            $sqls="select * from rt_employees, rt_employees_cstm where rt_employees_cstm.id_c =rt_employees.id AND rt_employees_cstm.id_c ='$id'";
            $ress = $GLOBALS['db']->query($sqls);
            $rows = $GLOBALS['db']->fetchByAssoc($ress);
            $salary = unserialize(html_entity_decode(stripslashes($rows['salary'])));
            $GLOBALS['log']->fatal("bedore if!!!!! unserialze");
            $GLOBALS['log']->fatal(print_r($salary,1));
            $total_salary = 0;
            $taxable_salary = 0;
            foreach($salary as $label=>$detail){
                $amount = $detail['amount'];
                $taxable = $detail['taxable'];
                $total_salary += $amount;
                if($taxable == 'Yes')
                    $taxable_salary += $amount;
            }
            $net_salary = $taxable_salary;
            $i++;
            $guid = create_guid();
            $query1="insert into rt_employees_rt_payroll_c (id, date_modified, rt_employees_rt_payrollrt_employees_ida, rt_employees_rt_payrollrt_payroll_idb) values ('".$guid."', '".$date."', '".$id."', '".$bean->id."')";
            $GLOBALS['db']->query($query1);

            if($size>1){

                //commulative record save
                //deductables
                /* 						$sql = "SELECT * FROM a_deductables
                                                LEFT JOIN a_employs_a_deductables_c ON a_deductables.id = a_employs_a_deductables_c.a_emplo0533bles_idb
                                                where a_deductables.remaining_amount > 0 AND a_deductables.deleted = 0 AND a_employs_a_deductables_c.a_emplo1bfdyees_ida = '$id' AND a_employs_a_deductables_c.deleted = 0";
                                        $ded_result = $GLOBALS['db']->query($sql);
                                        $deduction = $GLOBALS['db']->fetchByAssoc($ded_result);
                                        $deduct_amount = 0;
                                        require "modules/a_Deductables/a_Deductables.php";
                                        while($deduction){
                                            $deductable = new a_Deductables();
                                            $deductable->retrieve($deduction['id']);
                                            if($deduction['pay_back'] == 'Fix'){
                                                $amount_deduct = $deduction['payback_fix_amount'];
                                                $deductable->remaining_amount = $deductable->remaining_amount - $deductable->payback_fix_amount;
                                                $deductable->save();
                                            }
                                            else if($deduction['pay_back'] == 'Percentage'){
                                                $amount_deduct = ($deduction['amount']/100) * $deduction['payback_percentage'];
                                                $deductable->remaining_amount = $deductable->remaining_amount - $deductable->payback_percentage;
                                                $deductable->save();
                                            }
                                            $net_salary -= $amount_deduct;
                                            $pay_tracker->salary_paid = $net_salary;
                                            $deduction = $GLOBALS['db']->fetchByAssoc($result);
                                        } */
                $sql_pro = "SELECT * FROM config where name = 'provident_fund' AND category = 'system'";
                $res_pro = $GLOBALS['db']->query($sql_pro);
                if($rows['deduct_provident'] && !empty($rows['provident_fund'])){
                    $GLOBALS['log']->fatal("YES GO WITH employeee FUND!!!!!!!!!!!!!!!!!");
                    $provident = $total_salary /100 * $rows['provident_fund'];
                }elseif($res_pro->num_rows > 0){
                    $GLOBALS['log']->fatal("YES GO WITH CONFIG FUND!!!!!!!!!!!!!!!!!");
                    $row_pro = $GLOBALS['db']->fetchByAssoc($res_pro);
                    $p_fund = $row_pro['value'];
                    $provident = $total_salary /100 * $p_fund;
                }else{
                    $GLOBALS['log']->fatal("YES GO WITH 0000000000000000000000!!!!!!!!!!!!!!!!!");
                    $provident = 0;
                }
                $annual_salary = $total_salary*12;

                require_once "modules/RT_Employees/RT_Employees.php";
                $emp = new RT_Employees();
                $emp->retrieve($id);
                $bonus_amount = 0;
                $bonuses = $emp->get_linked_beans("rt_employees_rt_bonus","RT_Bonus");
                foreach($bonuses as $bon){
                    if(date('m', strtotime($bon->fetched_row['bonus_date']))==$month && date('Y', strtotime($bon->fetched_row['bonus_date']))==$year)
                        $bonus_amount += $bon->fetched_row['amount'];
                }

                $date_entered = date("Y-m-d H:i:s");

                $pay_track_id = create_guid();
                $serialize_sal = serialize($salary);
                $annual_l = $rows['entitled_annual_leaves_c'];
                $casual_l = $rows['entitled_casual_leaves_c'];
                $casual_b = get_casual_b($id);
                $annual_b = get_annual_b($id);
                $salary_paid = $total_salary - $rows['tax'] - $provident;
                $tax = $rows['tax'];
                $p_track_sql = "INSERT INTO rt_pay_track(id, date_entered, employee_id, payroll_id, month, year, salary, bonus, tax, provident, casual_leaves, annual_leaves, casual_balance, annual_balance, salary_paid)
                                          VALUES('$pay_track_id', '$date_entered', '$id', '$bean->id', '$month', '$year', '$serialize_sal', '$bonus_amount', '$tax', '$provident', '$casual_l', '$annual_l', '$casual_b', '$annual_b', '$salary_paid')";
                $GLOBALS['db']->query($p_track_sql);

                //individual record save
                $individual_name = $rows['first_name']." ".$rows['last_name']." ";
                $guid2 = create_guid();
                $payroll_id = create_guid();
                $doc_name = "Payroll of ".$individual_name." ".$date;
                $query2="insert into rt_payroll (id, modified_user_id, created_by, document_name) values ('".$payroll_id."', '".$current_user->id."','".$current_user->id."', '".$doc_name."')";
                $query3="insert into rt_payroll_cstm (id_c, abc_c) values ('".$payroll_id."', '^".$id."^')";
                $query4="insert into rt_employees_rt_payroll_c (id, date_modified, rt_employees_rt_payrollrt_employees_ida, rt_employees_rt_payrollrt_payroll_idb) values ('".$guid2."', '".$date."', '".$id."', '".$payroll_id."')";
                $GLOBALS['db']->query($query2);
                $GLOBALS['db']->query($query3);
                $GLOBALS['db']->query($query4);


                $annual_salary = $total_salary*12;
                require_once "modules/RT_Employees/RT_Employees.php";
                $emp = new RT_Employees();
                $emp->retrieve($id);
                $bonus_amount = 0;
                $bonuses = $emp->get_linked_beans("rt_employees_rt_bonus","RT_Bonus");
                foreach($bonuses as $bon){
                    if(date('m', strtotime($bon->fetched_row['bonus_date']))==$month && date('Y', strtotime($bon->fetched_row['bonus_date']))==$year)
                        $bonus_amount += $bon->fetched_row['amount'];
                }
                $pay_track_id = create_guid();
                $date_entered = date("Y-m-d H:i:s");
                $serialize_sal = serialize($salary);
                $annual_l = $rows['entitled_annual_leaves_c'];
                $casual_l = $rows['entitled_casual_leaves_c'];
                $casual_b = get_casual_b($id);
                $annual_b = get_annual_b($id);
                $GLOBALS['log']->fatal('Annual_b =>'.$annual_b,' Casual_b => '.$casual_b);
                $salary_paid = $total_salary - $rows['tax'] - $provident;
                $tax = $rows['tax'];
                $p_track_sql = "INSERT INTO rt_pay_track(id, date_entered, employee_id, payroll_id, month, year, salary, bonus, tax, provident, casual_leaves, annual_leaves, casual_balance, annual_balance, salary_paid)
                                          VALUES('$pay_track_id', '$date_entered', '$id', '$bean->id', '$month', '$year', '$serialize_sal', '$bonus_amount', '$tax', '$provident', '$casual_l', '$annual_l', '$casual_b', '$annual_b', '$salary_paid')";
                $GLOBALS['db']->query($p_track_sql);
                $bean->document_name = "Payroll ".$date;
            }
            else{
                $name = $name.$rows['first_name']." ".$rows['last_name']." ";
                //deductables
                /* 						$sql = "SELECT * FROM a_deductables
                                                LEFT JOIN a_employs_a_deductables_c ON a_deductables.id = a_employs_a_deductables_c.a_emplo0533bles_idb
                                                where a_deductables.remaining_amount > 0 AND a_deductables.deleted = 0 AND a_employs_a_deductables_c.a_emplo1bfdyees_ida = '$id' AND a_employs_a_deductables_c.deleted = 0";
                                        $ded_result = $GLOBALS['db']->query($sql);
                                        $deduction = $GLOBALS['db']->fetchByAssoc($ded_result);
                                        $deduct_amount = 0;
                                        require "modules/a_Deductables/a_Deductables.php";
                                        while($deduction){
                                            $deductable = new a_Deductables();
                                            $deductable->retrieve($deduction['id']);
                                            if($deduction['pay_back'] == 'Fix'){
                                                $amount_deduct = $deduction['payback_fix_amount'];
                                                $deductable->remaining_amount = $deductable->remaining_amount - $deductable->payback_fix_amount;
                                                $deductable->save();
                                            }
                                            else if($deduction['pay_back'] == 'Percentage'){
                                                $amount_deduct = ($deduction['amount']/100) * $deduction['payback_percentage'];
                                                $deductable->remaining_amount = $deductable->remaining_amount - $deductable->payback_percentage;
                                                $deductable->save();
                                            }
                                            $net_salary -= $amount_deduct;
                                            $pay_tracker->salary_paid = $net_salary;
                                            $deduction = $GLOBALS['db']->fetchByAssoc($result);

                                        } */
                $sql_pro = "SELECT * FROM config where name = 'provident_fund' AND category = 'system'";
                $res_pro = $GLOBALS['db']->query($sql_pro);
                if ($rows['deduct_provident'] && !empty($rows['provident_fund'])){
                    $GLOBALS['log']->fatal("YES GO WITH employeee FUND!!!!!!!!!!!!!!!!!");
                    $provident = $total_salary /100 * $rows['provident_fund'];
                }elseif($res_pro->num_rows > 0){
                    $GLOBALS['log']->fatal("YES GO WITH CONFIG FUND!!!!!!!!!!!!!!!!!");
                    $row_pro = $GLOBALS['db']->fetchByAssoc($res_pro);
                    $p_fund = $row_pro['value'];
                    $provident = $total_salary /100 * $p_fund;
                }else{
                    $GLOBALS['log']->fatal("YES GO WITH 000000000000000 FUND!!!!!!!!!!!!!!!!!");
                    $provident = 0;
                }
                $annual_salary = $total_salary*12;

                require_once "modules/RT_Employees/RT_Employees.php";
                $emp = new RT_Employees();
                $emp->retrieve($id);
                $bonus_amount = 0;
                $bonuses = $emp->get_linked_beans("rt_employees_rt_bonus","RT_Bonus");
                foreach($bonuses as $bon){
                    if(date('m', strtotime($bon->fetched_row['bonus_date']))==$month && date('Y', strtotime($bon->fetched_row['bonus_date']))==$year)
                        $bonus_amount += $bon->fetched_row['amount'];
                }
                $pay_track_id = create_guid();
                $date_entered = date("Y-m-d H:i:s");
                $serialize_sal = serialize($salary);
                $annual_l = $rows['entitled_annual_leaves_c'];
                $casual_l = $rows['entitled_casual_leaves_c'];
                $casual_b = get_casual_b($id);
                $annual_b = get_annual_b($id);
                $salary_paid = $total_salary - $rows['tax'] - $provident;
                $tax = $rows['tax'];
                $p_track_sql = "INSERT INTO rt_pay_track(id, date_entered, employee_id, payroll_id, month, year, salary, bonus, tax, provident, casual_leaves, annual_leaves, casual_balance, annual_balance, salary_paid)
                                          VALUES('$pay_track_id', '$date_entered', '$id', '$bean->id', '$month', '$year', '$serialize_sal', '$bonus_amount', '$tax', '$provident', '$casual_l', '$annual_l', '$casual_b', '$annual_b', '$salary_paid')";
                $GLOBALS['db']->query($p_track_sql);

                $bean->document_name = "Payroll of".$name." ".$date;
            }


        }
    }
    /*function calculate_annualleavebalance($id){
        $sql = "select * from rt_employees_cstm where id_c='".$id."'";
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
            $sql = 'update rt_employees_cstm set balance_update_date_c="'.$nextyear.'" where id_c="'.$id.'"';
            $GLOBALS['db']->query($sql);
            $balanceannual = $entitledannual;
        }
        else{
            $sql = "select * from rt_employees_cstm where id_c='".$id."'";
            $bal = $GLOBALS['db']->fetchByAssoc($GLOBALS['db']->query($sql));
            $sql = "select * from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida ='".$id."' AND deleted=0";
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
        return $balanceannual;
//        return 7;
    }

    function calculate_casualleavebalance($id) {
        $sql = "select * from rt_employees_cstm where id_c='".$id."'";
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
        if($balanceupdatedays<0){
            $balanceupdatedays = 0;
        }
        if($balanceupdatedays >= 365)//year ended
        {
            $sql = 'update rt_employees_cstm set balance_update_date_c="'.$nextyear.'" where id_c="'.$id.'"';
            $GLOBALS['db']->query($sql);
            $balancecasual = $entitledcasual;
        }
        else{
            $sql = "select * from rt_employees_cstm where id_c='".$id."'";
            $bal = $GLOBALS['db']->fetchByAssoc($GLOBALS['db']->query($sql));
            $sql = "select * from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida='".$id."' AND deleted=0";
            $res = $GLOBALS['db']->query($sql);
            $row = $GLOBALS['db']->fetchByAssoc($res);
            while($row){
                $lid = $row['rt_employees_rt_leavesrt_leaves_idb'];
                $sql2 = "select * from rt_leaves_cstm where id_c ='".$lid."' AND (status_c='Scheduled' OR status_c = 'Taken') AND leave_type_c='Casual' AND from_date_c >= '".$bal['balance_update_date_c']."'";
                $res2 = $GLOBALS['db']->query($sql2);
                $row2 = $GLOBALS['db']->fetchByAssoc($res2);
                $end_ts = $row2['from_date_c'];
                $dif = $end_ts - $start_ts;
                if($dif<0){
                    $dif=0;
                }
                $dif = $end_ts - $start_ts;
                $days =  round($dif / 86400);
                if($days<=365){
                    $noofdays = $row2['number_of_days_c'];
                    $entitledcasual = $entitledcasual-$noofdays;
                }
                $row = $GLOBALS['db']->fetchByAssoc($res);
            }
            $balancecasual = $entitledcasual;

        }
        return $balancecasual;
//        return 5;
    }*/
}

?>
	
	