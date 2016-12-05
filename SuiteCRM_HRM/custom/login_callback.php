<?php
/*require_once ('custom/php-graph-sdk-5.4/src/Facebook/autoload.php');

$fb = new Facebook\Facebook([
    'app_id' => '323627451351772',
    'app_secret' => '85b2f5422afd161b3200d048880f3ec0',
    'default_graph_version' => 'v2.6',
]);

$helper = $fb->getRedirectLoginHelper();
try {
    $accessToken = $helper->getAccessToken();
} catch(Facebook\Exceptions\FacebookResponseException $e) {
    // When Graph returns an error
    echo 'Graph returned an error: ' . $e->getMessage();
    exit;
} catch(Facebook\Exceptions\FacebookSDKException $e) {
    // When validation fails or other local issues
    echo 'Facebook SDK returned an error: ' . $e->getMessage();
    exit;
}

if (isset($accessToken)) {
    // Logged in!
    global $sugar_config;
    $base_url = $sugar_config['site_url'];
    $_SESSION['facebook_access_token'] = (string) $accessToken;
    header("location:http://$base_url/index.php?entryPoint=send_post_facebook");
/////



    //////
    // Now you can redirect to another page and use the
    // access token from $_SESSION['facebook_access_token']
}*/
global $sugar_config;
$base_url = $sugar_config['site_url'];
$_SESSION['facebook_access_token'] = 'EAACEdEose0cBAPRv3jBA3Jcp94d5SrIHCRT62PXAWZBTZBhRKvQnRyOSLIqfFz7Mo8L4Qu0Gb3nosDAGsl0ABV4fpGumNFRvf9OodwlCxZBBm7SQNwVgfjrzJ5a3HKhKs0np2K4EF3xQi9rmNvC6pLF4XqMbw0yhgDZAu9CBZCiU4yjenPBKq';
header("location:$base_url/index.php?entryPoint=send_post_facebook");

?>