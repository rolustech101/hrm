<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class UpdateName
{
    function update_name($bean, $event, $arguments)
    {
        $bean->name = "Leave of " . $bean->rt_employees_rt_leaves_name;
    }
}

?>
