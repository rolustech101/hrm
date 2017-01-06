<?php
if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.
 *
 * SuiteCRM is an extension to SugarCRM Community Edition developed by Salesagility Ltd.
 * Copyright (C) 2011 - 2016 Salesagility Ltd.
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


$layout_defs['RT_Employees'] = array(
    // list of what Subpanels to show in the DetailView
    'subpanel_setup' => array(

        'activities' => array(
            'order' => 10,
            'sort_order' => 'asc',
            'sort_by' => 'id',
            'title_key' => 'LBL_ACTIVITIES_SUBPANEL_TITLE',
            'type' => 'collection',
            'subpanel_name' => 'activities',   //this values is not associated with a physical file.
            'module' => 'Activities',

            'top_buttons' => array(
                array('widget_class' => 'SubPanelTopCreateTaskButton'),
                array('widget_class' => 'SubPanelTopScheduleMeetingButton'),
            ),
            'collection_list' => array(
                'rt_employees_rt_leaves' => array(
                    'module' => 'RT_Leaves',
                    'subpanel_name' => 'ForActivty',
                    'get_subpanel_data' => 'rt_employees_rt_leaves',
                ),
                'rt_increment_history_rt_employees' => array(
                    'module' => 'RT_Increment_History',
                    'subpanel_name' => 'ForActivty',
                    'get_subpanel_data' => 'rt_increment_history_rt_employees',
                ),
                'rt_interviews_rt_employees_1' => array(
                    'module' => 'RT_Interviews',
                    'subpanel_name' => 'ForActivty',
                    'get_subpanel_data' => 'rt_interviews_rt_employees_1',
                ),
                'rt_employees_rt_bonus' => array(
                    'module' => 'RT_Bonus',
                    'subpanel_name' => 'ForActivty',
                    'get_subpanel_data' => 'rt_employees_rt_bonus',
                ),
                'rt_employees_rt_payroll' => array(
                    'module' => 'RT_Payroll',
                    'subpanel_name' => 'ForActivty',
                    'get_subpanel_data' => 'rt_employees_rt_payroll',
                ),
            )
        ),
        'documents_link' => array(

            'order' => 100,
            'module' => 'Documents',
            'subpanel_name' => 'default',
            'sort_order' => 'asc',
            'sort_by' => 'id',
            'title_key' => 'LBL_DOCUMENTS_LINK_FROM_DOCUMENTS_TITLE',
            'get_subpanel_data' => 'documents_link',
            'top_buttons' =>
                array (
                    0 =>
                        array (
                            'widget_class' => 'SubPanelTopButtonQuickCreate',
                        ),
                    1 =>
                        array (
                            'widget_class' => 'SubPanelTopSelectButton',
                            'mode' => 'MultiSelect',
                        ),
                ),
        ),

    ),
);
?>
