<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
//require_once('modules/Import/ImportMap.php');

class RT_Performance_ReviewsViewEdit_Form extends SugarView {
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

        $this->ss->assign('form_meta', $this->view_object_map['form_data']);
        $this->ss->assign('f_name', $this->view_object_map['form_name']);
        echo $this->ss->fetch("custom/modules/RT_Performance_Reviews/tpls/edit_form.tpl");
    }
}
?>