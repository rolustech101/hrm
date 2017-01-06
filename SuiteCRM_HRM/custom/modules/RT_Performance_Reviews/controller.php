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
           
//            $date_entered = date("Y-m-d H:i:s");
            $pr = BeanFactory::newBean('RT_Performance_Reviews');
//            $date_entered = $pr->date_entered;
            global $timedate;
            $timedate->getInstance()->userTimezone();
            $CurrenrDateTime1 = $timedate->now();
            $pr->name = 'Review From of ' . $_REQUEST['emp_name'] . ' ' . $CurrenrDateTime1;
            $pr->rt_emp_id = $_REQUEST['rt_emp_id'];
            $pr->status = 'pending';
            $pr->form_id = $id;
            $pr->save();
            // add supervisor as a reviewer
            if(!empty($supervisor_id)){
                $pr->load_relationship('rt_employees_rt_performance_reviews_1');
                $pr->rt_employees_rt_performance_reviews_1->add($supervisor_id);
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
	