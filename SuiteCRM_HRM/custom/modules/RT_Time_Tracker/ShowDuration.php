<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class ShowDuration
{
    function show($bean, $event, $arguments)
    {
        $tracker = BeanFactory::getBean('RT_Time_Tracker',$bean->id);
        empty($tracker->duration_hours)?$hours = 0:$hours = $tracker->duration_hours;
        empty($tracker->duration_minutes)?$mins = 0:$mins = $tracker->duration_minutes;
        $bean->total_hours = $hours.'h '.$mins.'m';
    }
}

?>

