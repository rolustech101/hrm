<?php
function create_post($url,$data)
{
    if((isset($url) && !empty($url)) && (isset($data) && !empty($data))){
        send_curl($url,$data);
    }else{
        $GLOBALS['log']->fatal('create_post: empty parameters');
    }
}
function send_curl($post_url,$data)
{
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $post_url);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $resp = curl_exec($ch);
    if(!$resp){
        die('Error: "' . curl_error($ch) . '" - Code: ' . curl_errno($ch));
    }
    curl_close($ch);
}
?>