<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class AddName_RT_Bonus
{
    function add_name($bean, $event, $arguments = null)
    {
        $bean->module_name = 'Bonus';

    }
}

?>
	
	
