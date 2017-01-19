<?php

if (!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');

class MakeLinkable
{
    function make_link($bean, $event, $arguments)
    {
        $GLOBALS['log']->fatal(print_r($bean,1));
        $bean->candidate_name = "<a href='index.php?module=RT_Candidates&action=DetailView&record=$bean->rt_candidate_id'>$bean->candidate_name</a>";
        $bean->vacancy_name = "<a href='index.php?module=RT_Vacancies&action=DetailView&record=$bean->rt_vacancy_id'>$bean->vacancy_name</a>";
    }
}
