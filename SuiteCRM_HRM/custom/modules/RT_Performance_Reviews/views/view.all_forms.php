<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
//require_once('modules/Import/ImportMap.php');

class RT_Performance_ReviewsViewAll_Forms extends SugarView {
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

        $this->ss->assign('data', $this->view_object_map['form_data']);
        echo $this->ss->fetch("custom/modules/RT_Performance_Reviews/tpls/show_all_forms.tpl");
    }
}
?>