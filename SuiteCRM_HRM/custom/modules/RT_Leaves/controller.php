<?php

class RT_LeavesController extends SugarController
{

    public function action_getleaves_balance()
    {
        ob_clean();
        $id = $_REQUEST['employee_id'];
        $bean = BeanFactory::getBean('RT_Employees', $id);
        echo json_encode([
            'annual' => $bean->annual_leave_balance,
            'casual' => $bean->casual_leave_balance,
            'joining_date' => $bean->joining_date_c
        ]);
        die;
    }

    public function action_validate_leaves()
    {
        ob_clean();
        $emp_id = $_POST['emp_id'];
        $leave_type = $_POST['leave_type'];
        $no_of_days = $_POST['no_of_days'];
        $emp_bean = BeanFactory::getBean('RT_Employees', $emp_id);

        if ($leave_type == 'Annual') {
            $annual_leaves = get_annual_balance($emp_id);
            $annual_total = $annual_leaves + $no_of_days;
            $entitled_annual = $emp_bean->entitled_annual_leaves_c;
            if ($annual_total > $entitled_annual) {
                echo json_encode(['statuss' => 'error']);
                $GLOBALS['log']->error('You do not have sufficient balance for annual leaves');
                die;
            }
        } else {
            $casual_leaves = get_casual_balance($emp_id);
            $casual_total = $casual_leaves + $no_of_days;
            $entitled_casual = $emp_bean->entitled_casual_leaves_c;
            if ($casual_total > $entitled_casual) {
                echo json_encode(['statuss' => 'error']);
                $GLOBALS['log']->error('You do not have sufficient balance for casual leaves');
                die;
            }
        }
        echo json_encode(['statuss' => 'success']);
        die;
    }
}
	