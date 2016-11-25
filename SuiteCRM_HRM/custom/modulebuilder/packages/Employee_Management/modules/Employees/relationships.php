<?php
/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.

 * SuiteCRM is an extension to SugarCRM Community Edition developed by Salesagility Ltd.
 * Copyright (C) 2011 - 2014 Salesagility Ltd.
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
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for  technical reasons, the Appropriate Legal Notices must
 * display the words  "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 ********************************************************************************/

$relationships = array (
  'rt_employees_rt_leaves' => 
  array (
    'rhs_label' => 'Leaves',
    'lhs_label' => 'Employees',
    'rhs_subpanel' => 'default',
    'lhs_module' => 'RT_Employees',
    'rhs_module' => 'RT_Leaves',
    'relationship_type' => 'one-to-many',
    'readonly' => false,
    'deleted' => false,
    'relationship_only' => false,
    'for_activities' => false,
    'is_custom' => false,
    'from_studio' => false,
    'relationship_name' => 'rt_employees_rt_leaves',
  ),
  'rt_employees_rt_bonus' => 
  array (
    'rhs_label' => 'Bonus',
    'lhs_label' => 'Employees',
    'rhs_subpanel' => 'default',
    'lhs_module' => 'RT_Employees',
    'rhs_module' => 'RT_Bonus',
    'relationship_type' => 'one-to-many',
    'readonly' => false,
    'deleted' => false,
    'relationship_only' => false,
    'for_activities' => false,
    'is_custom' => false,
    'from_studio' => false,
    'relationship_name' => 'rt_employees_rt_bonus',
  ),
  'rt_employees_rt_increment_history' => 
  array (
    'rhs_label' => 'Increment History',
    'lhs_label' => 'Employees',
    'rhs_subpanel' => 'default',
    'lhs_module' => 'RT_Employees',
    'rhs_module' => 'RT_Increment_History',
    'relationship_type' => 'one-to-many',
    'readonly' => false,
    'deleted' => false,
    'relationship_only' => false,
    'for_activities' => false,
    'is_custom' => false,
    'from_studio' => false,
    'relationship_name' => 'rt_employees_rt_increment_history',
  ),
  'rt_employees_rt_appraisals' => 
  array (
    'rhs_label' => 'Appraisal',
    'lhs_label' => 'Employees',
    'rhs_subpanel' => 'default',
    'lhs_module' => 'RT_Employees',
    'rhs_module' => 'RT_Appraisals',
    'relationship_type' => 'one-to-many',
    'readonly' => false,
    'deleted' => false,
    'relationship_only' => false,
    'for_activities' => false,
    'is_custom' => false,
    'from_studio' => false,
    'relationship_name' => 'rt_employees_rt_appraisals',
  ),
  'rt_employees_rt_payroll' => 
  array (
    'rhs_label' => 'Payroll',
    'lhs_label' => 'Employees',
    'rhs_subpanel' => 'default',
    'lhs_module' => 'RT_Employees',
    'rhs_module' => 'RT_Payroll',
    'relationship_type' => 'one-to-many',
    'readonly' => false,
    'deleted' => false,
    'relationship_only' => false,
    'for_activities' => false,
    'is_custom' => false,
    'from_studio' => false,
    'relationship_name' => 'rt_employees_rt_payroll',
  ),
  'rt_employees_rt_deductables' => 
  array (
    'rhs_label' => 'Loan/Deductables',
    'lhs_label' => 'Employees',
    'rhs_subpanel' => 'default',
    'lhs_module' => 'RT_Employees',
    'rhs_module' => 'RT_Deductables',
    'relationship_type' => 'one-to-many',
    'readonly' => false,
    'deleted' => false,
    'relationship_only' => false,
    'for_activities' => false,
    'is_custom' => false,
    'from_studio' => false,
    'relationship_name' => 'rt_employees_rt_deductables',
  ),
  'rt_employees_documents' => 
  array (
    'rhs_label' => 'Documents',
    'lhs_label' => 'Employees',
    'rhs_subpanel' => 'default',
    'lhs_module' => 'RT_Employees',
    'rhs_module' => 'Documents',
    'relationship_type' => 'one-to-many',
    'readonly' => false,
    'deleted' => false,
    'relationship_only' => false,
    'for_activities' => false,
    'is_custom' => false,
    'from_studio' => false,
    'relationship_name' => 'rt_employees_documents',
  ),
  'rt_employees_rt_employees' => 
  array (
    'rhs_label' => 'Subordinates',
    'lhs_label' => 'Employees',
    'rhs_subpanel' => 'default',
    'lhs_module' => 'RT_Employees',
    'rhs_module' => 'RT_Employees',
    'relationship_type' => 'one-to-many',
    'readonly' => false,
    'deleted' => false,
    'relationship_only' => false,
    'for_activities' => false,
    'is_custom' => false,
    'from_studio' => false,
    'relationship_name' => 'rt_employees_rt_employees',
  ),
);