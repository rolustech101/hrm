<?php
if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2011 SugarCRM Inc.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 * 
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 * 
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 * 
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo. If the display of the logo is not reasonably feasible for
 * technical reasons, the Appropriate Legal Notices must display the words
 * "Powered by SugarCRM".
 ********************************************************************************/


class RT_LeavesViewEdit extends ViewEdit
{   
 	public function __construct()
 	{
		parent::__construct();
// 		parent::ViewEdit();
 		$this->useForSubpanel = true;
 		$this->useModuleQuickCreateTemplate = true;
 	}

	/**
 	 * @see SugarView::display()
	 * 
 	 * We are overridding the display method to manipulate the sectionPanels.
 	 * If portal is not enabled then don't show the Portal Information panel.
 	 */
 	public function display() 
 	{
        $this->ev->process();
		//echo '<pre>';
		//print_r($this->bean);
		//echo $this->bean->number_of_days_c;
				//$beanList = $this->bean->get_linked_beans('a_employees_a_leaves','a_Leaves');
				//if(!empty($beanList))
				//{
					//foreach($beanList as $list)
					//{
				/*	$lea = new a_Leaves();
					//$le = $lea->retrieve($this->bean->id);

					echo $this->bean->number_of_days_c;
					//foreach($le as $list)
					//{
						if($list->leave_type_c=="Annual"){
							$fdate = $list->from_date_c;
							$todate = $list->to_date_c;
							echo $fdate." ";
							echo $todate." ";
							$start_ts = strtotime($fdate);
							$end_ts = strtotime($todate);
							$diff = $end_ts - $start_ts;
							$noofdaysannual = $noofdaysannual + round($diff / 86400);
						}
						if($list->leave_type_c=="Casual"){
							$fdate = $list->from_date_c;
							$todate = $list->to_date_c;
							echo $fdate." ";
							echo $todate." ";
							$start_ts = strtotime($fdate);
							$end_ts = strtotime($todate);
							$diff = $end_ts - $start_ts;
							$noofdayscasual = $noofdayscasual + round($diff / 86400);
						}
					//}
				//}*/
			//echo '<pre>';
			//print_r($this->bean);
				//$emp = new a_Employees();
				//$emp->retrieve($this->bean->a_emploabafyees_ida);
				//echo $emp->date_of_birth_c;
		echo $this->ev->display($this->showTitle);
//		echo '<script type="text/javascript" src="custom/modules/RT_Leaves/funcs.js"></script>';
 	}

}