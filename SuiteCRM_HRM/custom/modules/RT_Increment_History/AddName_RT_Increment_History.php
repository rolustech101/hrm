<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class AddName_RT_Increment_History
{
    function add_name($bean, $event, $arguments = null)
    {
        $bean->module_name = 'Increment History';

    }
}

?>
	
	
