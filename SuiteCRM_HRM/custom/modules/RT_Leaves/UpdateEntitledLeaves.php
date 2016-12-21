<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class UpdateEntitledLeaves
{
    function update_leaves($bean, $event, $arguments)
    {
        if (!isset($bean->fetched_row['id'])) {
            //for new
            if ($bean->status_c == 'Taken') {
                $this->detuct_leaves($bean);
            }
        } else {
            // for existing
            if ($bean->fetched_row['status_c'] !== 'Taken' && $bean->status_c == 'Taken') {
                $this->detuct_leaves($bean);
            }
        }
    }

    function detuct_leaves($bean)
    {
        $id = $bean->rt_employees_rt_leavesrt_employees_ida;
        $emp_bean = BeanFactory::getBean('RT_Employees', $id);

        if ($bean->leave_type_c == 'Annual') {
            $annual_leaves = get_annual_balance($id);
            $annual_total = $annual_leaves + $bean->count_days_c;
            $entitled_annual = $emp_bean->entitled_annual_leaves_c;
            if ($annual_total > $entitled_annual) {
                $casual_leaves = get_casual_balance($id);
                $casual_total = $casual_leaves + $bean->count_days_c;
                $entitled_casual = $emp_bean->entitled_casual_leaves_c;
                if ($casual_total > $entitled_casual) {
                    $annual_balance = $entitled_annual - $annual_total;
                    $emp_bean->annual_leave_balance = $annual_balance;
                } else {
                    $bean->leave_type_c = 'Casual';
                    $casual_balance = $entitled_casual - $casual_total;
                    $emp_bean->casual_leave_balance = $casual_balance;
                }
            } else {
                $annual_balance = $entitled_annual - $annual_total;
                $emp_bean->annual_leave_balance = $annual_balance;
            }
        } else {
            $casual_leaves = get_casual_balance($id);
            $casual_total = $casual_leaves + $bean->count_days_c;
            $entitled_casual = $emp_bean->entitled_casual_leaves_c;
            if ($casual_total > $entitled_casual) {
                $annual_leaves = get_annual_balance($id);
                $annual_total = $annual_leaves + $bean->count_days_c;
                $entitled_annual = $emp_bean->entitled_annual_leaves_c;
                if ($annual_total > $entitled_annual) {
                    $casual_balance = $entitled_casual - $casual_total;
                    $emp_bean->casual_leave_balance = $casual_balance;
                } else {
                    $bean->leave_type_c = 'Annual';
                    $annual_balance = $entitled_annual - $annual_total;
                    $emp_bean->annual_leave_balance = $annual_balance;
                }
            } else {
                $casual_balance = $entitled_casual - $casual_total;
                $emp_bean->casual_leave_balance = $casual_balance;
            }

        }

        $emp_bean->save();
    }
}

?>
