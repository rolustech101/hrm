<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

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
class SugarWidgetSubPanelHusyButton extends SugarWidgetField
{
    function displayHeaderCell($layout_def)
    {
        return '&nbsp;';
    }

    function displayList($layout_def)
    {
        global $app_strings;
        global $subpanel_item_count;
        $candidate_id = $layout_def['fields']['ID'];
        //based on listview since that lets you select records
        if ($layout_def['ListView']) {
            if ($layout_def['name'] == 'hired_button') {
                $icon_remove_text = mb_strtolower($app_strings['LBL_ID_FF_HIRED'], 'UTF-8');
                $unique_id = $layout_def['subpanel_id'] . "_hired_" . $subpanel_item_count; //bug 51512
                $retStr = "<a href=\"javascript:change_applicant_status('$candidate_id', 'hired');\""
                    . ' class="listViewTdToolsS1"'
                    . "id=$unique_id"
                    . ">$icon_remove_text</a>";
                return $retStr;
            } elseif ($layout_def['name'] == 'new_button') {
                $icon_remove_text = mb_strtolower($app_strings['LBL_ID_FF_NEW'], 'UTF-8');

                $unique_id = $layout_def['subpanel_id'] . "_new_" . $subpanel_item_count; //bug 51512
                $retStr = "<a href=\"javascript:change_applicant_status('$candidate_id', 'new');\""
                    . ' class="listViewTdToolsS1"'
                    . "id=$unique_id"
                    . ">$icon_remove_text</a>";
                return $retStr;

            } elseif ($layout_def['name'] == 'review_resume_button') {
                $icon_remove_text = mb_strtolower($app_strings['LBL_ID_FF_REVIEW_RESUME'], 'UTF-8');

                $unique_id = $layout_def['subpanel_id'] . "_reviewresume_" . $subpanel_item_count; //bug 51512
                $retStr = "<a href=\"javascript:change_applicant_status('$candidate_id', 'review_resume');\""
                    . ' class="listViewTdToolsS1"'
                    . "id=$unique_id"
                    . ">$icon_remove_text</a>";
                return $retStr;

            } elseif ($layout_def['name'] == 'phone_screen_button') {
                $icon_remove_text = mb_strtolower($app_strings['LBL_ID_FF_PHONE_SCREEN'], 'UTF-8');

                $unique_id = $layout_def['subpanel_id'] . "_phonescreen_" . $subpanel_item_count; //bug 51512
                $retStr = "<a href=\"javascript:change_applicant_status('$candidate_id', 'phone_screen');\""
                    . ' class="listViewTdToolsS1"'
                    . "id=$unique_id"
                    . ">$icon_remove_text</a>";
                return $retStr;

            } elseif ($layout_def['name'] == 'schedule_interviews_button') {
                $icon_remove_text = mb_strtolower($app_strings['LBL_ID_FF_SCHEDULE_INTERVIEW'], 'UTF-8');

                $unique_id = $layout_def['subpanel_id'] . "_scheduleinterviews_" . $subpanel_item_count; //bug 51512
                $retStr = "<a href=\"javascript:change_applicant_status('$candidate_id', 'schedule_interviews');\""
                    . ' class="listViewTdToolsS1"'
                    . "id=$unique_id"
                    . ">$icon_remove_text</a>";
                return $retStr;

            } elseif ($layout_def['name'] == 'extend_an_offer_button') {
                $icon_remove_text = mb_strtolower($app_strings['LBL_ID_FF_EXTEND_AN_OFFER'], 'UTF-8');

                $unique_id = $layout_def['subpanel_id'] . "_extendanoffer_" . $subpanel_item_count; //bug 51512
                $retStr = "<a href=\"javascript:change_applicant_status('$candidate_id', 'extend_an_offer');\""
                    . ' class="listViewTdToolsS1"'
                    . "id=$unique_id"
                    . ">$icon_remove_text</a>";
                return $retStr;

            } elseif ($layout_def['name'] == 'rejected_button') {
                $icon_remove_text = mb_strtolower($app_strings['LBL_ID_FF_REJECTED'], 'UTF-8');
                $unique_id = $layout_def['subpanel_id'] . "_rejected_" . $subpanel_item_count; //bug 51512
                $retStr = "<a href=\"javascript:change_applicant_status('$candidate_id', 'rejected');\""
                    . ' class="listViewTdToolsS1"'
                    . "id=$unique_id"
                    . ">$icon_remove_text</a>";
                return $retStr;

            } else {
                return '';
            }

        } else {
            return '';
        }
    }
}
