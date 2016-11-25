<?php
	    if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
        $hook_version = 1;
	    $hook_array = array();
		$hook_array['before_save'] = array();	 
	    $hook_array['before_save'][] = array(1, 'genfile', 'custom/modules/RT_Payroll/MakeFile.php', 'MakeFile', 'genfile');
		$hook_array['process_record'] = array();
	    $hook_array['process_record'][] = array(1, 'AddPrintButton', 'custom/modules/RT_Payroll/AddPrintButton.php', 'AddPrintButton', 'add_print');
	 

?>