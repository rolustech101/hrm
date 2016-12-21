<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class UnSerializeSalary
{
    function unserialize_salary($bean, $event, $arguments = null)
    {
        $salary = $bean->salary;
        $bean->salary = unserialize(html_entity_decode(stripslashes($salary)));
    }

}

?>
	
	
