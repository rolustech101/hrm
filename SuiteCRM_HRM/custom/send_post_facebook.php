<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('custom/include/fb_helper.php');
echo 'in the entrypoint of send post!!!';
$GLOBALS['log']->fatal("hello in the send_post_facebook");

if (isset($_SESSION['facebook_access_token']) && !empty($_SESSION['facebook_access_token'])) {
    $GLOBALS['log']->fatal("in the iffff");

    $page_access_token = $_SESSION['facebook_access_token'];
    isset($_SESSION['vacancy_name']) && !empty($_SESSION['vacancy_name']) ? $vacancy_name = $_SESSION['vacancy_name'] : $vacancy_name = 'empty';
    isset($_SESSION['positions']) && !empty($_SESSION['positions']) ? $positions = $_SESSION['positions'] : $positions = 'empyy';
    isset($_SESSION['requirement']) && !empty($_SESSION['requirement']) ? $requirement = $_SESSION['requirement'] : $requirement = 'empty';
    $sql = "SELECT * FROM config WHERE category = 'system' AND name = 'rt_page'";
    $result = $GLOBALS['db']->query($sql);
    if ($result->num_rows > 0) {
        $row = $GLOBALS['db']->fetchByAssoc($result);
        $page_id = $row['value'];
    } else {
        $GLOBALS['log']->fatal('Page ID does not Exists');
        return false;
    }

    $data['message'] = "Rolustech is looking for aaan na  an ideal $vacancy_name \nJob Description:\n$requirement\n Total Position: $positions";
    $data['access_token'] = $page_access_token;
    $post_url = 'https://graph.facebook.com/' . $page_id . '/feed';
    $GLOBALS['log']->fatal("before create_post");
    create_post($post_url, $data);
    $GLOBALS['log']->fatal("after create_post");

} else {
    return false;
}
$GLOBALS['log']->fatal("hello in the send_post_facebook after success");
SugarApplication::redirect("index.php?action=index&module=RT_Vacancies");
echo "      After";

