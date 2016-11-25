<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
//require_once('modules/Import/ImportMap.php');

class RT_SalarySettingViewSal_Settings extends SugarView {
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
        $this->ss->assign('row', $this->view_object_map['row']);
        echo $this->ss->fetch("custom/modules/RT_SalarySetting/tpls/Create_settings.tpl");
//        echo "ny custom view";
    }
}
?>