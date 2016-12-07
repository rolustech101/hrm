<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;
$hook_array = array();
$hook_array['after_save'] = array();
$hook_array['after_save'][] = array(
    1,
    'email_to_candidate',
    'custom/modules/RT_Interviews/MailCandidate.php',
    'MailCandidate',
    'mail_to_candidate'
);

$hook_array['after_relationship_add'] = Array();
$hook_array['after_relationship_add'][] = Array(
    1,
    'after interview linked to interviewer',
    'custom/modules/RT_Interviews/MailInterviewer.php',
    'MailInterviewer',
    'mail_to_interviewer'
);


?>