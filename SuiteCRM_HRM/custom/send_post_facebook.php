<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
if (!session_id()) {
    session_start();
}
require_once('php-graph-sdk-5.4/src/Facebook/autoload.php');

isset($_SESSION['vacancy_name']) && !empty($_SESSION['vacancy_name']) ? $vacancy_name = $_SESSION['vacancy_name'] : $vacancy_name = 'n/a';
isset($_SESSION['positions']) && !empty($_SESSION['positions']) ? $positions = $_SESSION['positions'] : $positions = 'n/a';
isset($_SESSION['requirement']) && !empty($_SESSION['requirement']) ? $requirement = $_SESSION['requirement'] : $requirement = 'n/a';
isset($_SESSION['last_date']) && !empty($_SESSION['last_date']) ? $last_date = $_SESSION['last_date'] : $last_date = 'n/a';
$sql = "SELECT * FROM config WHERE category = 'system' AND name = 'rt_page'";
$result = $GLOBALS['db']->query($sql);
if ($result->num_rows > 0) {
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $page_id = $row['value'];
} else {
    $GLOBALS['log']->fatal('Page ID does not Exists');
    return false;
}

$message = "Rolustech is looking for an ideal $vacancy_name \nJob Description:\n$requirement\n Total Position: $positions\nLast Date To Apply: $last_date";

require_once('include/connectors/sources/SourceFactory.php');

$source = SourceFactory::getSource('ext_rest_facebook');
$app_id = $source->getProperty('appid');
$app_secret = $source->getProperty('secret');
if (empty($app_id) || empty($app_secret)) {
    $GLOBALS['log']->fatal('App Secret OR APP ID is Empty!');
    return false;
}

$fb = new Facebook\Facebook([
    'app_id' => $app_id,
    'app_secret' => $app_secret,
    'default_graph_version' => 'v2.6',
]);
$helper = $fb->getRedirectLoginHelper();

try {
    $accessToken = $helper->getAccessToken();
} catch (Facebook\Exceptions\FacebookSDKException $e) {
    // There was an error communicating with Graph
    echo $e->getMessage();
    exit;
}

if (isset($accessToken)) {

    $client = $fb->getOAuth2Client();

    try {
        $accessToken = $client->getLongLivedAccessToken($accessToken);
    } catch (Facebook\Exceptions\FacebookSDKException $e) {
        echo $e->getMessage();
        exit;
    }

    $response = $fb->get('/me/accounts', (string)$accessToken);

    foreach ($response->getDecodedBody() as $allPages) {
        foreach ($allPages as $page) {

            if (isset($page['id']) && $page['id'] == $page_id) { // Suppose you save it as this variable
                $appAccessToken = (string)$page['access_token'];
                break;
            }
        }
    }

    try {
        $response = $fb->post(
            '/' . $page_id . '/feed',
            array(
                "message" => $message,
            ),
            $appAccessToken
        );
    } catch (Facebook\Exceptions\FacebookSDKException $e) {
        echo $e->getMessage();
        exit;
    }

    // Success
    $postId = $response->getGraphNode();
//    echo $postId;

} elseif ($helper->getError()) {
    var_dump($helper->getError());
    var_dump($helper->getErrorCode());
    var_dump($helper->getErrorReason());
    var_dump($helper->getErrorDescription());
    exit;
}
SugarApplication::redirect("index.php?action=index&module=RT_Vacancies");

