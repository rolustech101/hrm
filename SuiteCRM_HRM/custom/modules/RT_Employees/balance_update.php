<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class BalanceUpdate
{
    function update_balance($bean, $event, $arguments = null)
    {
        if (!isset($bean->fetched_row['id'])) //check if it is the new record
        {
            $GLOBALS['log']->fatal("EEEEEEEEEEEEEEEEEEEEEEEEEEE");
            // update balance fields
            $bean->annual_leave_balance= $bean->entitled_annual_leaves_c;
            $bean->casual_leave_balance= $bean->entitled_casual_leaves_c;
            //update appraisal date
            $join_date = $bean->joining_date_c;
            $join_date_current_year = substr_replace($join_date,date('Y'),0,4);
            $GLOBALS['log']->fatal("$join_date_current_year");
            $GLOBALS['log']->fatal($join_date_current_year);
            $inc_sql = "SELECT * FROM config WHERE name = 'increment_interval' and category = 'system'";
            $inc_res = $GLOBALS['db']->query($inc_sql);
            $inc_row = $GLOBALS['db']->fetchByAssoc($inc_res);
            $inc_interval = $inc_row['value'];
            if($inc_interval == 'by_annual'){
                $next_appraisal_date = date("Y-m-d", strtotime(date("Y-m-d", strtotime($join_date_current_year)) . " +6 month"));
                $GLOBALS['log']->fatal("$next_appraisal_date");
                $GLOBALS['log']->fatal($next_appraisal_date);
                $bean->appraisal_date = $next_appraisal_date;
            }else{
                $next_appraisal_date = date("Y-m-d", strtotime(date("Y-m-d", strtotime($join_date_current_year)) . " + 1 year"));
                $GLOBALS['log']->fatal("$next_appraisal_date");
                $GLOBALS['log']->fatal($next_appraisal_date);
                $bean->appraisal_date = $next_appraisal_date;
            }
        }
    }
}

?>
