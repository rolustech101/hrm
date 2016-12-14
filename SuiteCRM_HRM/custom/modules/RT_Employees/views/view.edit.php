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


class RT_EmployeesViewEdit extends ViewEdit
{   
 	public function __construct()
 	{
 		parent::ViewEdit();
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
//        $this->ev->process();
		$this->ss->assign("ID", $this->bean->id);
		$this->ss->assign("TAX", $this->bean->tax);
		if(!empty($this->bean->salary)){
			$this->ss->assign("salary", $this->bean->salary);
		}
		$salaries = $this->bean->salary;
		$tax = $this->bean->tax;
		global $mod_strings;
		$label_tax = $mod_strings['LBL_TAX'];
		$tr_table = '';
		$counter = 1;
		foreach ($salaries as $key => $value){
//            print_r($salaries);
//            echo '________________________________________________________';
			$checked = '';
			if($value['taxable'] == 1){
				$checked = 'checked';
			}

			$tr_table .= <<<EOQ
	<tr id="$counter">
            <td>
                <table>
                    <tr>
                        <td width="12.5%" valign="top" scope="row">Label:</td>
                        <td width="33.5%" valign="top" colspan="3"><input type="text" name="label_salary[]"
                                                                          id="label_salary" value="$key"></td>
                    </tr>
                    <tr>
                        <td width="12.5%" valign="top" scope="row">Amount:</td>
                        <td width="33.5%" valign="top" colspan="3"><input type="text" name="amount_salary[]"
                                                                          id="amount_salary" value='{$value["amount"]}'></td>
                        <td width="10%" scope="row">Taxable:</td>
                        <td width="30%" colspan="3"><input type="checkbox" class = "taxable_chbox" name="taxable_salary[]" id="taxable_salary$counter" value="1" $checked </td>
                    </tr>
                    <tr>
                        <td><input type="button" onclick="removeSalary('$counter');" id="remove_salary" value="Remove"></td>
                    </tr>
                </table>
            </td>
        </tr>
EOQ;
			$counter++;
		}

//		$this->ss->fetch("custom/modules/RT_Employees/tpls/Editfooter.tpl");
        $this->ss->assign("tr_table", $tr_table);
//        echo $this->ev->display($this->showTitle);
		parent::display();

    }
}