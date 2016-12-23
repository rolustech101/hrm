<?php
require_once('include/SugarPHPMailer.php');
require_once('modules/EmailTemplates/EmailTemplate.php');

class RT_Performance_ReviewsController extends SugarController
{
    function action_create_form()
    {
        if (isset($_REQUEST['show_all'])) {
            $sql = "SELECT id,name FROM rt_review_forms";
            $result = $GLOBALS['db']->query($sql);
            $forms = array();
            while ($row = $GLOBALS['db']->fetchByAssoc($result)) {
                $forms[] = array(
                    'id' => $row['id'],
                    'name' => $row['name'],
                );
            }
            $this->view_object_map['form_data'] = $forms;
            $this->view = 'all_forms';
            return;
        }
        $this->view = 'performance_review';
    }

    public function action_submit_form()
    {
        global $sugar_config;
        global $current_user;
        $user_id = $current_user->id;
        $form_name = $_REQUEST['form_name'];
        $questions = array();

        if (isset($_REQUEST['total_count'])) {
            for ($x = 0; $x < $_REQUEST['total_count']; $x++) {
                if (isset($_REQUEST['label_question' . $x])) {
                    $questions[$x] = array(
                        'question' => $_REQUEST['label_question' . $x],
                        'type' => $_REQUEST['question_type' . $x],
                    );
                    if (isset($_REQUEST['label_question' . $x . '_option'])) {
                        for ($i = 0; $i < count($_REQUEST['label_question' . $x . '_option']); $i++) {
                            $questions[$x]['options'][] = $_REQUEST['label_question' . $x . '_option'][$i];
                        }
                    }
                }
            }
        }

        $serialize_question = json_encode($questions);
        $id = create_guid();
        $date_entered = date("Y-m-d H:i:s");

        $qq = "select * from rt_review_forms where name = '{$form_name}'";
        $rr = $GLOBALS['db']->query($qq);
        if ($rr->num_rows > 0) {
            if ($rr->num_rows == 1) {
                $sql = "update `rt_review_forms` set form_meta = '$serialize_question', date_entered = '$date_entered'  WHERE name = '$form_name'";
            } else {
                die('more than one records exists');
            }
        } else {
            $sql = "INSERT INTO  rt_review_forms(id, name, form_meta, date_entered,	user_id ) VALUES('$id','$form_name','$serialize_question','$date_entered','$user_id')";
        }
        $result = $GLOBALS['db']->query($sql);

        $r_module = $_REQUEST['return_module'];
        $r_action = $_REQUEST['return_action'];
        SugarApplication::redirect("index.php?action=$r_action&module=$r_module");


    }

    public function action_edit_form()
    {
        if (isset($_REQUEST['form_id'])) {
            $id = $_REQUEST['form_id'];
            $sql = "SELECT form_meta FROM rt_review_forms WHERE id ='$id'";
            $result = $GLOBALS['db']->query($sql);
            $row = $GLOBALS['db']->fetchByAssoc($result);
            $meta = json_decode(html_entity_decode($row['form_meta']), true);
            isset($_REQUEST['form_name']) ? $name = $_REQUEST['form_name'] : $name = '';
            $this->view_object_map['form_data'] = $meta;
            $this->view_object_map['form_name'] = $name;
            $this->view = 'edit_form';
        }
    }

    public function action_review_create()
    {
        $sql = "SELECT id, name FROM rt_review_forms";
        $result = $GLOBALS['db']->query($sql);
        $d_options = array();
        while ($row = $GLOBALS['db']->fetchByAssoc($result)) {
            $d_options[$row['id']] = $row['name'];
        }
        $this->view_object_map['d_options'] = $d_options;
        $this->view = 'review';
    }

    public function action_generate_form()
    {
        global $sugar_config;
        isset($_REQUEST['rt_emp_id']) ? $emp_id = $_REQUEST['rt_emp_id'] : $emp_id = '';
        isset($_REQUEST['emp_name']) ? $emp_name = $_REQUEST['emp_name'] : $emp_name = '';
        isset($_REQUEST['form_name']) ? $form_name = $_REQUEST['form_name'] : $form_name = '';
        $form_name = str_replace(' ', '_', $form_name);

        $bean = BeanFactory::getBean('RT_Employees', $emp_id);

        $supervisor_id = $bean->rt_employees_rt_employeesrt_employees_ida;

        ob_clean();
        if (isset($_REQUEST['form_id']) || !empty($_REQUEST['form_id'])) {
            $id = $_REQUEST['form_id'];
            $sql = "SELECT form_meta FROM rt_review_forms where id = '$id'";
            $result = $GLOBALS['db']->query($sql);
            $row = $GLOBALS['db']->fetchByAssoc($result);
            $form_data = $row['form_meta'];
            $form_array = json_decode(html_entity_decode($form_data), true);
            $form_html = '<!DOCTYPE html><html><head><title>Performance Review</title></head><body><h2>Performance Review for ' . $emp_name . ' </h2>';
            $form_html .= '<form id="give_review" name="give_review" action="../index.php?entryPoint=performance_review_form" method="post">';
            $form_html .= "<input type='hidden' name='emp_id' id='emp_id' value= '$emp_id'>";
            $form_html .= "<input type='hidden' name='emp_name' id='emp_name' value='$emp_name'>";
            $num = 0;
            foreach ($form_array as $value) {
                foreach ($value as $key => $val) {
                    if ($key == 'question') {
                        $form_html .= '<input type="text" name="question' . $num . '" maxlength = "10000" value="' . $val . '" readonly /><br>';
                    } elseif ($key == 'type') {
                        if ($val == 'mutliple_choice') {
                            foreach ($value['options'] as $op) {
                                $form_html .= "<input type='radio' name='multi_$num' value= '$op' required>$op<br>";
                            }
                        } else {
                            $form_html .= '<textarea name="answers' . $num . '" rows="4" cols="50" required></textarea><br>';
                        }
                    }
                }
                $num++;
            }
            $form_html .= "<input type='hidden' name='t_count' value='$num'>";
            $form_html .= '<input type="submit" value="Submit">';
            $form_html .= '</form>';
            $form_html .= '</body></html>';
            if (is_link($_SERVER['DOCUMENT_ROOT'])) {
                if (!file_exists(readlink($_SERVER['DOCUMENT_ROOT']) . '/review_forms')) {
                    mkdir(readlink($_SERVER['DOCUMENT_ROOT']) . '/review_forms', 0777, true);
                }
                $output = file_put_contents(readlink($_SERVER['DOCUMENT_ROOT']) . '/review_forms/review_' . $form_name . '.html',
                    $form_html);
            } else {
                if (!file_exists($_SERVER['DOCUMENT_ROOT'] . '/review_forms')) {
                    mkdir($_SERVER['DOCUMENT_ROOT'] . '/review_forms', 0777, true);
                }
                $output = file_put_contents($_SERVER['DOCUMENT_ROOT'] . '/SuiteCRM_HRM/review_forms/review_' . $form_name . '.html',
                    $form_html);
            }
            if (!$output) {
                $GLOBALS['log']->fatal('error occured while writing to the file!');
            }
            $sugar_email = new SugarPHPMailer();
            $sugar_email->IsHTML(true);
            $admin = new Administration();
            $admin->retrieveSettings();
            $sugar_email->Subject = "Performance Review Form For " . $emp_name;
            $sugar_email->prepForOutbound();
            $sugar_email->setMailerForSystem();
            $sugar_email->From = $admin->settings['notify_fromaddress'];
            $sugar_email->FromName = $admin->settings['notify_fromname'];
            $template_name = 'Rolustech Email Template';
            $template = new EmailTemplate();
            $template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));
            $template->body_html = str_replace('{emp_name}', $emp_name, $template->body_html);
            $template->body_html = str_replace('{link}',
                $sugar_config['site_url'] . '/review_forms/review_' . $form_name . '.html', $template->body_html);

            $sugar_email->Body = from_html($template->body_html);
            if ($supervisor_id) {//if supervisor exists
                $sql = "select email_addresses.email_address FROM email_addresses LEFT OUTER JOIN email_addr_bean_rel ON email_addresses.id = email_addr_bean_rel.email_address_id WHERE email_addr_bean_rel.bean_id='" . $supervisor_id . "' AND email_addr_bean_rel.deleted='0' AND email_addresses.deleted ='0'";
                $res = $GLOBALS['db']->query($sql);
                $row = $GLOBALS['db']->fetchByAssoc($res);
                $to = $row['email_address'];

            } else {//if supervisor does not exist email to CTO
                $ss = "SELECT id FROM users where user_name = 'CTO' AND deleted = '0'";
                $rr = $GLOBALS['db']->query($ss);
                $rw = $GLOBALS['db']->fetchByAssoc($rr);
                $cto_id = $rw['id'];
                $sql_cto = "select email_addresses.email_address FROM email_addresses LEFT OUTER JOIN email_addr_bean_rel ON email_addresses.id = email_addr_bean_rel.email_address_id WHERE email_addr_bean_rel.bean_id='" . $cto_id . "' AND email_addr_bean_rel.deleted='0' AND email_addresses.deleted ='0'";
                $res_cto = $GLOBALS['db']->query($sql_cto);
                $row_cto = $GLOBALS['db']->fetchByAssoc($res_cto);
                $to = $row_cto['email_address'];
            }
            $sugar_email->AddAddress($to);

            if (!$sugar_email->Send()) {
                $GLOBALS['log']->fatal("Could not send Mail:  " . $sugar_email->ErrorInfo);
                echo "an error has been occured while sending an email";
            }

        }

        $r_module = $_REQUEST['return_module'];
        $r_action = $_REQUEST['return_action'];
        SugarApplication::redirect("index.php?action=$r_action&module=$r_module");
    }

    public function action_check_existing()
    {
        ob_clean();
        $form_name = $_REQUEST['form_name'];
        $qq = "select * from rt_review_forms where name = '{$form_name}'";
        $rr = $GLOBALS['db']->query($qq);
        if ($rr->num_rows > 0) {
            echo 'yes';
        } else {
            echo 'no';
        }
        die;
    }
}
	