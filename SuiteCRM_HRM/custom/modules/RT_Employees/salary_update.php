<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class SalaryUpdate
{
    function update_salary($bean, $event, $arguments = null)
    {
        $bean->salary_c = array_sum($bean->amount_salary);
    }
}
?>