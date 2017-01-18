<?php

array_push($job_strings, 'job_posting_close_date');
function job_posting_close_date()
{
    $sql = "select *, date_format(close_date ,'%m-%d') as close_datee from rt_vacancies inner join rt_vacancies_cstm ON id = id_c where date_format(close_date ,'%m-%d') = date_format(now() ,'%m-%d') and rt_vacancies.deleted = 0";
    $res = $GLOBALS['db']->query($sql);
    while ($row = $GLOBALS['db']->fetchByAssoc($res)) {
        $id = $row['id'];
        $u_sql = "update rt_vacancies_cstm set status_c = 'closed_filled' where id_c = '$id'";
        $result = $GLOBALS['db']->query($u_sql);
        $GLOBALS['log']->info('This job posting has been closed and marked as closed_filled => ' . $id);
    }
    return true;
}