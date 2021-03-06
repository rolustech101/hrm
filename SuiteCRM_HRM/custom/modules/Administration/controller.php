<?php
require_once('modules/Administration/controller.php');
class CustomAdministrationController extends AdministrationController
{
    function action_set_increment_interval()
    {
        //for entitled annual
        $sql_ea = "SELECT * FROM config where name = 'entitled_annual' AND category = 'system'";
        $res_ea = $GLOBALS['db']->query($sql_ea);
        if($res_ea->num_rows > 0){
            $row_ea = $GLOBALS['db']->fetchByAssoc($res_ea);
            $this->view_object_map['entitled_annual'] = $row_ea['value'];
        }
        //for entitled casual
        $sql_ec = "SELECT * FROM config where name = 'entitled_casual' AND category = 'system'";
        $res_ec = $GLOBALS['db']->query($sql_ec);
        if($res_ec->num_rows > 0){
            $row_ec = $GLOBALS['db']->fetchByAssoc($res_ec);
            $this->view_object_map['entitled_casual'] = $row_ec['value'];
        }
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

        // for Job Title Macro
        $sql_s = "SELECT * FROM config where name = 'email_subject_for_job' AND category = 'system'";
        $res_s = $GLOBALS['db']->query($sql_s);
        if($res_s->num_rows > 0){
            $row_s = $GLOBALS['db']->fetchByAssoc($res_s);
            $this->view_object_map['email_subject'] = $row_s['value'];
        }

        // email subject separator
        $sql_sep = "SELECT * FROM config where name = 'email_subject_separator' AND category = 'system'";
        $res_sep = $GLOBALS['db']->query($sql_sep);
        if($res_sep->num_rows > 0){
            $row_sep = $GLOBALS['db']->fetchByAssoc($res_sep);
            $this->view_object_map['email_subject_separator'] = $row_sep['value'];
        }

        $sql_sm = "SELECT * FROM config where name = 'sm_email' AND category = 'system'";
        $res_sm = $GLOBALS['db']->query($sql_sm);
        if($res_sm->num_rows > 0){
            $row_sm = $GLOBALS['db']->fetchByAssoc($res_sm);
            $emails = explode(',',$row_sm['value']);
            $this->view_object_map['sm_email'] = $emails;
        }

        $sql_st = "SELECT * FROM config where name = 'salary_types' AND category = 'system'";
        $res_st = $GLOBALS['db']->query($sql_st);
        if($res_st->num_rows > 0){
            $row_st = $GLOBALS['db']->fetchByAssoc($res_st);
            $types = explode(',',$row_st['value']);
            $this->view_object_map['salary_types'] = $types;
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
        //for entitled annual
        $entitled_annual = $_REQUEST['entitled_annual'];
        $test_ea = "SELECT * FROM config where name = 'entitled_annual' and category = 'system'";
        $test_res_ea = $GLOBALS['db']->query($test_ea);
        if($test_res_ea->num_rows > 0){
            $sql_update_ea = "UPDATE config SET value = '$entitled_annual' where name = 'entitled_annual' and category = 'system' ";
            $res_update_ea = $GLOBALS['db']->query($sql_update_ea);
        }else{
            $sql_ea = "INSERT INTO config(category, name, value) VALUES('system', 'entitled_annual', '$entitled_annual')";
            $result_ea = $GLOBALS['db']->query($sql_ea);
        }
        // for entitled casual
        $entitled_casual = $_REQUEST['entitled_casual'];
        $test_ec = "SELECT * FROM config where name = 'entitled_casual' and category = 'system'";
        $test_res_ec = $GLOBALS['db']->query($test_ec);
        if($test_res_ec->num_rows > 0){
            $sql_update_ec = "UPDATE config SET value = '$entitled_casual' where name = 'entitled_casual' and category = 'system' ";
            $res_update_ec = $GLOBALS['db']->query($sql_update_ec);
        }else{
            $sql_ec = "INSERT INTO config(category, name, value) VALUES('system', 'entitled_casual', '$entitled_casual')";
            $result_ec = $GLOBALS['db']->query($sql_ec);
        }

        // for notify email address
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

        // for email subject macro
        $subject = $_REQUEST['email_subject'];
        $test_sub = "SELECT * FROM config where name = 'email_subject_for_job' and category = 'system'";
        $test_res_sub = $GLOBALS['db']->query($test_sub);
        if($test_res_sub->num_rows > 0){
            $sql_update_sub = "UPDATE config SET value = '$subject' where name = 'email_subject_for_job' and category = 'system' ";
            $res_update_email = $GLOBALS['db']->query($sql_update_sub);
        }else{
            $sql_sub = "INSERT INTO config(category, name, value) VALUES('system', 'email_subject_for_job', '$subject')";
            $result_sub = $GLOBALS['db']->query($sql_sub);
        }
        // for email subject separator
        $subject_sep = trim($_REQUEST['email_subject_separator']);
        $test_sub_sep = "SELECT * FROM config where name = 'email_subject_separator' and category = 'system'";
        $test_res_sub_sep = $GLOBALS['db']->query($test_sub_sep);
        if($test_res_sub_sep->num_rows > 0){
            $sql_update_sub_sep = "UPDATE config SET value = '$subject_sep' where name = 'email_subject_separator' and category = 'system' ";
            $res_update_email_sep = $GLOBALS['db']->query($sql_update_sub_sep);
        }else{
            $sql_sub_sep = "INSERT INTO config(category, name, value) VALUES('system', 'email_subject_separator', '$subject_sep')";
            $result_sub_sep = $GLOBALS['db']->query($sql_sub_sep);
        }


        $email_sm = $_REQUEST['sm_email'];
        $email_address = '';
        foreach ($email_sm as $item){
            $email_address .= $item.',';
        }
        $email_address = rtrim($email_address,',');

        /////////////////////////////////////////////
//        $email_sm = trim($_REQUEST['sm_email']);
        $test_sm = "SELECT * FROM config where name = 'sm_email' and category = 'system'";
        $test_res_sm = $GLOBALS['db']->query($test_sm);
        if($test_res_sm->num_rows > 0){
            $sql_update_sm = "UPDATE config SET value = '$email_address' where name = 'sm_email' and category = 'system'";
            $res_update_email_sm = $GLOBALS['db']->query($sql_update_sm);
        }else{
            $sql_sub_sm = "INSERT INTO config(category, name, value) VALUES('system', 'sm_email', '$email_address')";
            $result_sub_sm = $GLOBALS['db']->query($sql_sub_sm);
        }

        $sal_type = $_REQUEST['salary_types'];
        $types = '';
        foreach ($sal_type as $item){
            $types.= $item.',';
        }
        $types = rtrim($types,',');

        /////////////////////////////////////////////
//        $email_sm = trim($_REQUEST['sm_email']);
        $test_st = "SELECT * FROM config where name = 'salary_types' and category = 'system'";
        $test_res_st = $GLOBALS['db']->query($test_st);
        if($test_res_st->num_rows > 0){
            $sql_update_st = "UPDATE config SET value = '$types' where name = 'salary_types' and category = 'system'";
            $res_update_type_st = $GLOBALS['db']->query($sql_update_st);
        }else{
            $sql_sub_st = "INSERT INTO config(category, name, value) VALUES('system', 'salary_types', '$types')";
            $result_sub_sm = $GLOBALS['db']->query($sql_sub_st);
        }

        $r_module = $_REQUEST['return_module'];
        $r_action = $_REQUEST['return_action'];
        SugarApplication::redirect("index.php?action=$r_action&module=$r_module");
    }
}
	