<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once('custom/include/fb_helper.php');
require_once('custom/php-graph-sdk-5.4/src/Facebook/autoload.php');

class UpdateStatus
{
    function post_to_page($bean, $event, $arguments)
    {
        if ($bean->status_c == 'new_position') {

            $vacancy_name = $bean->name;
            $last_date = $bean->close_date;
            $positions = $bean->positions_c;
            if (isset($bean->description) && !empty($bean->description)) {
                $requirement = $bean->description;
            } else {
                $requirement = '';
            }
            $_SESSION['vacancy_name'] = $vacancy_name;
            $_SESSION['positions'] = $positions;
            $_SESSION['requirement'] = $requirement;
            $_SESSION['last_date'] = $last_date;

            require_once('include/connectors/sources/SourceFactory.php');

            $source = SourceFactory::getSource('ext_rest_facebook');
            $app_id = $source->getProperty('appid');
            $app_secret = $source->getProperty('secret');
            if (empty($app_id) || empty($app_secret)) {
                $GLOBALS['log']->fatal('App Secret OR APP ID is Empty!');
                return false;
            }

            // initial setup
            $fb = new Facebook\Facebook([
                'app_id' => $app_id,
                'app_secret' => $app_secret,
                'default_graph_version' => 'v2.6',
            ]);
            // generating login URL
            $helper = $fb->getRedirectLoginHelper();
//            $permissions = ['publish_pages', 'manage_pages']; // optional
//        $loginUrl = $helper->getLoginUrl('http://{your-website}/login-callback.php', $permissions);
            global $sugar_config;
            $base_url = $sugar_config['site_url'];
            $loginUrl = $helper->getLoginUrl("$base_url/index.php?entryPoint=send_post_facebook");

            SugarApplication::redirect($loginUrl);
        }
    }
}

?>
