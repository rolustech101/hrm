<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class Salary
{
    function serialize_salary($bean, $event, $arguments = null)
    {
        $salary = array();
        $i = 0;
        if(!empty($_REQUEST['amount_salary'])){
            $taxable_chk = $_REQUEST['taxable_status'];
            $taxable_chk = explode(',',$taxable_chk);
            foreach ($bean->label_salary as $label) {
                $check = 0;
                if($taxable_chk[$i] == 'true'){
                    $check = 1;
                }else{
                    $check = 0;
                }
                $salary[$label] = array(
                    'amount' => $bean->amount_salary[$i],
                    'taxable' => $check,
                );
                $i++;
            }
            $serialize_salary = serialize($salary);
            $bean->salary = $serialize_salary;
        }
        $is_seialized = unserialize(html_entity_decode(stripslashes($bean->salary)));
        if($is_seialized == false){
            if(!empty($bean->salary)){
                $bean->salary = serialize($bean->salary);
            }
        }

    }
}

?>
	
	
