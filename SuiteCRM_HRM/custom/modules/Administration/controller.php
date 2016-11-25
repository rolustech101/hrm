<?php
require_once('modules/Administration/controller.php');
class CustomAdministrationController extends AdministrationController
{
    function action_set_increment_interval()
    {
        //for provident fund
        $sql = "SELECT * FROM config where name = 'provident_fund' AND category = 'system'";
        $res = $GLOBALS['db']->query($sql);
        if($res->num_rows > 0){
            $row = $GLOBALS['db']->fetchByAssoc($res);
            $this->view_object_map['p_fund'] = $row['value'];
        }
        // for Notification Receiver's email address

        $sql_e = "SELECT * FROM config where name = 'notification_receiver_email' AND category = 'system'";
        $res_e = $GLOBALS['db']->query($sql_e);
        if($res_e->num_rows > 0){
            $row_e = $GLOBALS['db']->fetchByAssoc($res_e);
            $this->view_object_map['noty_email'] = $row_e['value'];
        }
        $this->view = 'increment_interval';
    }
    function action_submit_interval_form()
    {
        global $sugar_config;
        // for increment interval
        $interval = $_REQUEST['increment_interval'];
        $test = "SELECT * FROM config where name = 'increment_interval' and category = 'system'";
        $test_res = $GLOBALS['db']->query($test);
        if($test_res->num_rows > 0){
            $sql_update = "UPDATE config SET value = '$interval' where name = 'increment_interval' and category = 'system' ";
            $res_update = $GLOBALS['db']->query($sql_update);
        }else{
            $sql = "INSERT INTO config(category, name, value) VALUES('system', 'increment_interval', '$interval')";
            $result = $GLOBALS['db']->query($sql);
        }
        // for provident fund
        $fund = $_REQUEST['provident_fund'];
        $test_p = "SELECT * FROM config where name = 'provident_fund' and category = 'system'";
        $test_res_p = $GLOBALS['db']->query($test_p);
        if($test_res_p->num_rows > 0){
            $sql_update_p = "UPDATE config SET value = '$fund' where name = 'provident_fund' and category = 'system' ";
            $res_update_p = $GLOBALS['db']->query($sql_update_p);
        }else{
            $sql_p = "INSERT INTO config(category, name, value) VALUES('system', 'provident_fund', '$fund')";
            $result_p = $GLOBALS['db']->query($sql_p);
        }

        $noty_email = $_REQUEST['noty_receiver_email'];
        $test_email = "SELECT * FROM config where name = 'notification_receiver_email' and category = 'system'";
        $test_res_email = $GLOBALS['db']->query($test_email);
        if($test_res_email->num_rows > 0){
            $sql_update_email = "UPDATE config SET value = '$noty_email' where name = 'notification_receiver_email' and category = 'system' ";
            $res_update_email = $GLOBALS['db']->query($sql_update_email);
        }else{
            $sql_email = "INSERT INTO config(category, name, value) VALUES('system', 'notification_receiver_email', '$noty_email')";
            $result_email = $GLOBALS['db']->query($sql_email);
        }

        $r_module = $_REQUEST['return_module'];
        $r_action = $_REQUEST['return_action'];
        SugarApplication::redirect("index.php?action=$r_action&module=$r_module");
    }
}
	