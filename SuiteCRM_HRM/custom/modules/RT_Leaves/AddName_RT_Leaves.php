<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class AddName_RT_Leaves
{
    function add_name($bean, $event, $arguments = null)
    {
        $GLOBALS['log']->fatal('in the PROCESS HOOK LEAVES>>>>>>>>>>');
        $bean->module_name2 = 'Leaves';

    }
}

?>
	
	
