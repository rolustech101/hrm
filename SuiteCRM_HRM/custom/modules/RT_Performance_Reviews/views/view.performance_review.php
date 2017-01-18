<?php
if (!defined('sugarEntry') || !sugarEntry)
    die('Not A Valid Entry Point');

require_once('include/MVC/View/SugarView.php');
//require_once('modules/Import/ImportMap.php');

class RT_Performance_ReviewsViewPerformance_Review extends SugarView {
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
        echo $this->ss->fetch("custom/modules/RT_Performance_Reviews/tpls/Create_from.tpl");
    }
}
?>