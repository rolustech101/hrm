<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class IncrementSalary
{
    function increment($bean)
    {
        $bean->name = $bean->rt_increment_history_rt_employees_name . "'s Increment";    //creating salary name
        if (isNewBean($bean) && $bean->status_c != 'Applied') {
            $bean->status_c = "Scheduled";
        }
    }
}

?>
	
	
