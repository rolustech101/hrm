<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class AddName_RT_Interviews
{
    function add_name($bean, $event, $arguments = null)
    {
        $bean->module_name = 'Interview';

    }
}

?>
	
	
