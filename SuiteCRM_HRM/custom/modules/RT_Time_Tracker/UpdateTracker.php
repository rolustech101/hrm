<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class UpdateTracker
{
    function update_name($bean, $event, $arguments)
    {
        $bean->name = $bean->rt_time_tracker_rt_employees_name;
    }
}

?>

