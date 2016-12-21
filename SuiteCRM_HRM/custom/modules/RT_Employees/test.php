<?php
echo 'hello';
global $app_list_strings;
$list = array();
if (isset($app_list_strings['countries_dom']))
{
    $list = $app_list_strings['countries_dom'];
    foreach ($list as $key => $value){
        echo "<option value='$key'>$value<option>";
    }
}
?>
