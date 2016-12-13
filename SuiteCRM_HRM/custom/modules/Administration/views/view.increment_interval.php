<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
//require_once('modules/Import/ImportMap.php');

class AdministrationViewIncrement_Interval extends SugarView {
    /**
     * Constructor
     */

    public function __construct() {
        parent::SugarView();
    }

    /**
     * display the form
     */

    public function display() {
        $this->ss->assign('provident_fund', $this->view_object_map['p_fund']);
        $this->ss->assign('noty_receiver_email', $this->view_object_map['noty_email']);
        $this->ss->assign('email_subject',$this->view_object_map['email_subject']);
        /////////////////////////
        $this->ss->assign('sm_email',$this->view_object_map['sm_email']);
        $emails = $this->view_object_map['sm_email'];

        $tr_table = '';
        $counter = 1;
        foreach ($emails as $value){
//            print_r($salaries);
//            echo '________________________________________________________';


            $tr_table .= <<<EOQ
	<tr id="$counter">
            <td>
                <table>
                    <tr>
                        <td width="33.5%" valign="top" colspan="3"><input type="text" name="sm_email[]" id="sm_email" value='{$value}'></td>
                    </tr>
                    <tr>
                        <td><input type="button" onclick="removeEmail('$counter');" id="remove_email" value="Remove"></td>
                    </tr>
                </table>
            </td>
        </tr>
EOQ;
            $counter++;
        }

//		$this->ss->fetch("custom/modules/RT_Employees/tpls/Editfooter.tpl");
        $this->ss->assign("tr_table", $tr_table);


        //////////////////////////////
        $this->ss->assign('email_subject_separator',$this->view_object_map['email_subject_separator']);
        echo $this->ss->fetch("custom/modules/Administration/tpls/interval.tpl");
//        echo "ny custom view";
    }
}
?>