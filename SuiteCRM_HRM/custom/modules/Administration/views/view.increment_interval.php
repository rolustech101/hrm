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
        echo $this->ss->fetch("custom/modules/Administration/tpls/interval.tpl");
//        echo "ny custom view";
    }
}
?>