<?php
if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

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
class RT_InterviewsViewEdit extends ViewEdit
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
        if (isset($_REQUEST['from_job_app'])) {
            if (isset($_REQUEST['job_app_id']) && !empty($_REQUEST['job_app_id'])) {

                $id = $_REQUEST['job_app_id'];
                $job_app = BeanFactory::getBean('RT_Job_Application', $id);

                if ($job_app->load_relationship('rt_candidates')) {
                    $relatedBeans = $job_app->rt_candidates->getBeans();

                    $candidate = false;
                    if (!empty($relatedBeans)) {
                        reset($relatedBeans);
                        $candidate = current($relatedBeans);
                        $candidate = $candidate->id;
                    }
                }
                $job_app2 = BeanFactory::getBean('RT_Job_Application', $id);
                if ($job_app2->load_relationship('rt_vacancies')) {
                    $relatedBeans = $job_app2->rt_vacancies->getBeans();
                    $vacancy = false;
                    if (!empty($relatedBeans)) {
                        reset($relatedBeans);
                        $vacancy = current($relatedBeans);
                        $vacancy = $vacancy->id;
                    }
                }
                if ($candidate) {
                    $cand = BeanFactory::getBean('RT_Candidates', $candidate);
                    $this->bean->rt_candidate_id = $candidate;
                    $this->bean->rt_candidate_name = $cand->name;
                }
                if ($vacancy) {
                    $vaca = BeanFactory::getBean('RT_Vacancies', $vacancy);
                    $this->bean->rt_vacancy_id = $vacancy;
                    $this->bean->rt_vacancy_name = $vaca->name;
                }
            }
        }
        $this->ev->process();
        echo $this->ev->display($this->showTitle);

    }
}