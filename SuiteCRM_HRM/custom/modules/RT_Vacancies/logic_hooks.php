<?php
	    if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
		$hook_version = 1;
	    $hook_array = array();	 
	    $hook_array['after_save'] = array();
	    $hook_array['after_save'][] = array(1, 'post to facebook page', 'custom/modules/RT_Vacancies/UpdateStatus.php', 'UpdateStatus', 'post_to_page');
	    $hook_array['before_save'] = array();
	    $hook_array['before_save'][] = array(1, 'Notify about job posting', 'custom/modules/RT_Vacancies/NotifyMail.php', 'NotifyMail', 'send_notification');


?>