<?php

class RT_PayrollController extends SugarController
{

    function action_getemployees()
    {
        ob_clean();
        $sql2 = "select * from rt_employees where deleted = 0";
        $res2 = $GLOBALS['db']->query($sql2);
        $row2 = $GLOBALS['db']->fetchByAssoc($res2);
        while ($row2) {
            $eid = $row2['id'];
            $name = $row2['first_name'] . " " . $row2['last_name'];
            echo "<option value='" . $eid . "'>" . $name . "</option>";
            $row2 = $GLOBALS['db']->fetchByAssoc($res2);
        }
        die();
    }

    function action_save()
    {
        $salary_paid = $minutes_of_month = $per_hour_rate = $stipend = 0;
        $ids = $_REQUEST['abc_c'];
        global $current_user;
        $month = $_REQUEST['month'];
        $year = $_REQUEST['year'];
        $pieces = explode("^,^", $ids);

        $pieces[0] = trim($pieces[0], "^");
        $size = sizeof($_REQUEST['abc_c']);
        $pieces[$size - 1] = trim($pieces[$size - 1], "^");
        $provident = 0;
        $date = $month . " " . $year;
        $i = 0;
        $name = "";

        for ($i = 0; $i < $size; $i++) {
            $id = $_REQUEST['abc_c'][$i];
//            $sqls = "select * from rt_employees, rt_employees_cstm where rt_employees_cstm.id_c =rt_employees.id AND rt_employees_cstm.id_c ='$id'";
            $sqls = "select 
    *
from
    rt_employees
        left outer join
    rt_employees_cstm ON rt_employees_cstm.id_c = rt_employees.id
where
    rt_employees.id = '$id'
        and rt_employees.deleted = 0";


            $ress = $GLOBALS['db']->query($sqls);
            $rows = $GLOBALS['db']->fetchByAssoc($ress);
            if ($rows['employment_type_c'] == 'Part_Time' && $rows['is_hourly'] && !empty($rows['hourly_rate'])) {
                $emplyment_type = 'Part Time';
                $hourly_rate = $rows['hourly_rate'];
                $emp_bean = BeanFactory::getBean('RT_Employees', $id);
                if ($emp_bean->load_relationship('rt_time_tracker_rt_employees')) {
                    $time_entries = $emp_bean->rt_time_tracker_rt_employees->getBeans();
                    if (!empty($time_entries)) {
                        $total_hours = 0;
                        $total_minutes = 0;
                        foreach ($time_entries as $entry) {
                            $check_in_date = $entry->date_start;
                            $checkin_month = date('m', strtotime($check_in_date));
                            $checkin_year = date('Y', strtotime($check_in_date));
                            if ($checkin_month == $month && $checkin_year == $year) {
                                if (!empty($entry->duration_hours)) {
                                    $total_hours = $total_hours + $entry->duration_hours;
                                    $total_minutes = $total_minutes + $entry->duration_minutes;
                                }
                            }
                        }

                        $total_minutes_of_month = $total_hours * 60;
                        $total_minutes_of_month = $total_minutes_of_month + $total_minutes;
                        $per_minute_rate = $hourly_rate / 60;
                        $total_salary = $total_minutes_of_month * $per_minute_rate;
                        $salary_paid = $total_salary; //no tax deductions yet
                        $minutes_of_month = $total_minutes_of_month;
                        $per_hour_rate = $hourly_rate;


                    }
                }

            } elseif ($rows['employment_type_c'] == 'Internship' && !empty($rows['stipend'])) {
                $emplyment_type = 'Internship';
                $total_salary = $rows['stipend'];
                $salary_paid = $total_salary; // no tax deductions yet
                $stipend = $salary_paid;

            } else {
                // full_time
                $emplyment_type = 'Full Time';
                $salary = unserialize(html_entity_decode(stripslashes($rows['salary'])));
                $total_salary = 0;
                $taxable_salary = 0;
                foreach ($salary as $label => $detail) {
                    $amount = $detail['amount'];
                    $taxable = $detail['taxable'];
                    $total_salary += $amount;
                    if ($taxable == 'Yes') {
                        $taxable_salary += $amount;
                    }
                }
                $net_salary = $taxable_salary;


                //			if($rows['deduct_provident'] && !empty($rows['provident_fund'])){
                //				$provident = $total_salary /100 * $rows['provident_fund'];
                //			}
                $sql_pro = "SELECT * FROM config where name = 'provident_fund' AND category = 'system'";
                $res_pro = $GLOBALS['db']->query($sql_pro);
                if ($rows['deduct_provident'] && !empty($rows['provident_fund'])) {
                    $provident = $total_salary / 100 * $rows['provident_fund'];
                } elseif ($res_pro->num_rows > 0) {
                    $row_pro = $GLOBALS['db']->fetchByAssoc($res_pro);
                    $p_fund = $row_pro['value'];
                    $provident = $total_salary / 100 * $p_fund;
                } else {
                    $provident = 0;
                }

                $serialize_sal = serialize($salary);
                $salary_paid = $total_salary - $rows['tax'] - $provident;
                $tax = $rows['tax'];
            }
            $guid = create_guid();
            $payroll_id = create_guid();


            $annual_salary = $total_salary * 12;

            //individual record save
            $individual_name = $rows['first_name'] . " " . $rows['last_name'] . " ";
            $guid2 = create_guid();
            $doc_name = "Payroll of " . $individual_name . " " . $date;
            $query2 = "insert into rt_payroll (id, modified_user_id, created_by, document_name,month,year) values ('" . $payroll_id . "', '" . $current_user->id . "','" . $current_user->id . "', '" . $doc_name . "','" . $month . "','" . $year . "')";
            $query3 = "insert into rt_payroll_cstm (id_c, abc_c) values ('" . $payroll_id . "', '" . $id . "')";
            $query4 = "insert into rt_employees_rt_payroll_c (id, date_modified, rt_employees_rt_payrollrt_employees_ida, rt_employees_rt_payrollrt_payroll_idb) values ('" . $guid2 . "', '" . $date . "', '" . $id . "', '" . $payroll_id . "')";
            $GLOBALS['db']->query($query2);
            $GLOBALS['db']->query($query3);
            $GLOBALS['db']->query($query4);

            require_once "modules/RT_Employees/RT_Employees.php";
            $emp = new RT_Employees();
            $emp->retrieve($id);
            $bonus_amount = 0;
            $bonuses = $emp->get_linked_beans("rt_employees_rt_bonus", "RT_Bonus");
            foreach ($bonuses as $bon) {
                if (date('m', strtotime($bon->fetched_row['bonus_date'])) == $month && date('Y',
                        strtotime($bon->fetched_row['bonus_date'])) == $year
                ) {
                    $bonus_amount += $bon->fetched_row['amount'];
                }
            }
            $pay_track_id = create_guid();
            $date_entered = date("Y-m-d H:i:s");

            $annual_l = $rows['entitled_annual_leaves_c'];
            $casual_l = $rows['entitled_casual_leaves_c'];
            $casual_b = get_casual_b($id);
            $annual_b = get_annual_b($id);

            $p_track_sql = "INSERT INTO rt_pay_track(id, date_entered, employee_id, payroll_id, month, year, salary, bonus, tax, provident, casual_leaves, annual_leaves, casual_balance, annual_balance, salary_paid, total_minutes, per_hour_rate, stipend, employment_type)
                                          VALUES('$pay_track_id', '$date_entered', '$id', '$payroll_id', '$month', '$year', '$serialize_sal', $bonus_amount, $tax, $provident, $casual_l, $annual_l, $casual_b, $annual_b, $salary_paid,$minutes_of_month,$per_hour_rate,$stipend, '$emplyment_type')";
            $GLOBALS['db']->query($p_track_sql);
        }

        $r_module = $_REQUEST['return_module'];
        SugarApplication::redirect("index.php?action=index&module=$r_module");
    }
}
	