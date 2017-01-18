<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class AddPrintButton
{
    function add_print($bean, $event, $arguments)
    {
        $bean->button_c = '<input type="button" value="View" title="Click to View Payroll" onclick="window.open(\'index.php?module=RT_Payroll&action=printing&record=' . $bean->id . '\');">';
    }
}

?>
	
	