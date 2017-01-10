<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class CalculateTotalHours
{
    function calculate_hours($bean, $event, $arguments)
    {
        $bean->check_in_time;
        $bean->checkout_time;
    }
}

?>
