<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class UpdateEntitledLeaves
{
    function update_leaves($bean, $event, $arguments)
    {
        $GLOBALS['log']->fatal('before save leaves update entitiled');

        $id  = $bean->rt_employees_rt_leavesrt_employees_ida;
        $emp_bean = BeanFactory::getBean('RT_Employees', $id);

        if($bean->leave_type_c == 'Annual'){
            $annual_leaves = get_annual_balance($id);
            $annual_total = $annual_leaves + $bean->count_days_c;
            $GLOBALS['log']->fatal('count_days_c'.$bean->count_days_c);
            $GLOBALS['log']->fatal('annual_total'.$annual_total);
            $entitled_annual = $emp_bean->entitled_annual_leaves_c;
            $GLOBALS['log']->fatal('entitled_annual'.$entitled_annual);

            if($annual_total > $entitled_annual){

                $GLOBALS['log']->fatal('You do not have sufficient balance for annual leaves');
            }else{

                $annual_balance = $entitled_annual - $annual_total;
                $emp_bean->annual_leave_balance = $annual_balance;
                $GLOBALS['log']->fatal('annual_balance'.$annual_balance);
            }

          /*  if( (int)$annual_balance == $annual_balance && (int)$annual_balance > 0 ){
                $emp_bean->annual_leave_balance = $annual_balance;
            }else{
                $GLOBALS['log']->fatal('You do not have sufficient balance for annual leaves');
            }*/
        }else{
            $casual_leaves = get_casual_balance($id);
            $casual_total = $casual_leaves + $bean->count_days_c;
            $GLOBALS['log']->fatal('count_days_c'.$bean->count_days_c);
            $GLOBALS['log']->fatal('casual_total'.$casual_total);
            $entitled_casual = $emp_bean->entitled_casual_leaves_c;
            $GLOBALS['log']->fatal('entitled_annual'.$entitled_casual);

            if($casual_total > $entitled_casual){
                $GLOBALS['log']->fatal('You do not have sufficient balance for casual leaves');
            }else{
                $casual_balance = $entitled_casual - $casual_total;
                $emp_bean->casual_leave_balance = $casual_balance;
                $GLOBALS['log']->fatal('casual_balance'.$casual_balance);
            }

           /* if( (int)$casual_balance == $casual_balance && (int)$casual_balance > 0 ){
                $emp_bean->casual_leave_balance = $casual_balance;
            }else{
                $GLOBALS['log']->fatal('You do not have sufficient balance for casual leaves');
            }*/

        }

        $emp_bean->save();
    }
}

?>
