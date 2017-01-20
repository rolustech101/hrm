<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}

class ShowApplicants
{
    function show_no_of_applicants($bean, $event, $arguments)
    {
        $sql = "select count(*) as total from rt_job_application where rt_vacancy_id = '$bean->id' AND deleted = 0";
        $res = $GLOBALS['db']->query($sql);
        $row = $GLOBALS['db']->fetchByAssoc($res);
        $bean->no_of_applicant = $row['total'];
    }
}

?>
