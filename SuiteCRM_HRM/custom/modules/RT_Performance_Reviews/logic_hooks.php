<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
$hook_version = 1;
$hook_array = array();

$hook_array['after_relationship_add'] = Array();
$hook_array['after_relationship_add'][] = Array(
    1,
    'after interviewer linked to performance review',
    'custom/modules/RT_Performance_Reviews/MailReviewer.php',
    'MailReviewer',
    'mail_to_reviewers'
);


?>