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


require_once('include/MVC/View/views/view.detail.php');
class RT_EmployeesViewDetail extends ViewDetail{

 	function RT_EmployeesViewDetail(){
 		parent::ViewDetail();
 	}
	
 	function display(){

		$salaries = $this->bean->salary;
		$tr_table = '';
		global $mod_strings;
		$salary_label =   $mod_strings["LBL_LABEL_SALARY"];
		$salary_taxable =   $mod_strings["LBL_TAXABLE_SALARY"];
		$salary_amount =   $mod_strings["LBL_AMOUNT_SALARY"];
		foreach ($salaries as $key => $value){
			$checked = '';
			if($value['taxable'] == 1){
				$checked = 'checked';
			}
			$tr_table .= <<<EOQ
       <tr>
                <td width='12.5%' scope="row">
                 $salary_label
                </td>
                <td width='37.5%'>
                    $key
                </td>
                <td width='12.5%' scope="row">
                   $salary_taxable
                </td>
                <td width='37.5%'>
                    <input type="checkbox" class="checkbox" name="taxable_salary" class = "taxable_chbox" id="taxable_salary" disabled="true" $checked>
                </td>
            </tr>
            <tr>
                <td width='12.5%' scope="row">
                  $salary_amount
                </td>
                <td width='37.5%' colspan='3'>
                    <span class="sugar_field" id="amount_salary">{$value['amount']}</span>
                </td>
            </tr>
EOQ;
		}
//		die;
		$this->ss->assign("TAX", $this->bean->tax);
		$this->ss->assign("tr_table", $tr_table);
		if(!empty($this->bean->salary)){			
			$this->ss->assign("salary", $this->bean->salary);
			$this->ss->fetch("custom/modules/RT_Employees/tpls/Detailfooter.tpl");
		}/*
		$this->bean->casual_leave_balance = get_casual_balance($this->bean->id);
		$this->bean->annual_leave_balance = get_annual_balance($this->bean->id);*/

		parent::display();
	}

}
 
?>