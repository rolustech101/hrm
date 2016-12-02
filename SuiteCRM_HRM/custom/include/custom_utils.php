<?php
require_once 'modules/InboundEmail/InboundEmail.php';
require_once 'include/clean.php';
function get_annual_balance($id)
{
    $emp_sql = "select joining_date_c from rt_employees_cstm  where id_c = '$id'";
    $emp_res = $GLOBALS['db']->query($emp_sql);
    $emp_row = $GLOBALS['db']->fetchByAssoc($emp_res);
    $emp_joining_date = $emp_row['joining_date_c'];
    $date_start = substr_replace($emp_joining_date,date('Y'),0,4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)) );
     $GLOBALS['log']->fatal($date_start .' => '.$futureDate);
 $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Annual' and deleted = '0' and  from_date_c BETWEEN '$date_start' and '$futureDate'";
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    $GLOBALS['log']->fatal('total_days'.$no_of_days);
    return $no_of_days;
}
function get_casual_balance($id)
{
    $emp_sql = "select joining_date_c from rt_employees_cstm  where id_c = '$id'";
    $emp_res = $GLOBALS['db']->query($emp_sql);
    $emp_row = $GLOBALS['db']->fetchByAssoc($emp_res);
    $emp_joining_date = $emp_row['joining_date_c'];
    $date_start = substr_replace($emp_joining_date,date('Y'),0,4);
    $futureDate = date('Y-m-d', strtotime('+1 year', strtotime($date_start)) );
    $sql = "select sum(count_days_c) as total_days from rt_leaves_cstm as lcs inner join rt_leaves as lea ON lcs.id_c = lea.id  where id_c in (
select rt_employees_rt_leavesrt_leaves_idb from rt_employees_rt_leaves_c where rt_employees_rt_leavesrt_employees_ida = '$id') and leave_type_c = 'Casual' and deleted = '0' and  from_date_c BETWEEN '$date_start' and '$futureDate'" ;
    $res = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($res);
    $no_of_days = $row['total_days'];
    $GLOBALS['log']->fatal('total_days'.$no_of_days);
    return $no_of_days;
}
function get_annual_b($emp_id)
{
    $total_annual_leaves = get_annual_balance($emp_id);
    $sql = "select * from rt_employees_cstm where id_c = '$emp_id'";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $entitled_annual = $row['entitled_annual_leaves_c'];
    $balance = $entitled_annual - $total_annual_leaves;
    $absolute_balance = abs($balance);
    return $absolute_balance;

}
function get_casual_b($emp_id)
{
    $total_casual_leaves = get_casual_balance($emp_id);
    $sql = "select * from rt_employees_cstm where id_c = '$emp_id'";
    $result = $GLOBALS['db']->query($sql);
    $row = $GLOBALS['db']->fetchByAssoc($result);
    $entitled_casual = $row['entitled_casual_leaves_c'];
    $balance = $total_casual_leaves - $entitled_casual;
    $absolute_balance = abs($balance);
    return $absolute_balance;
}
function get_filling_status_countries()
{
    return ['USA','AUSTRALIA'];
}
function get_non_filling_countries()
{
    return ['PAKISTAN','UNITED KINGDOM','CANADA'];
}
function handleCreateCandidate($email,$job_title) {
    $GLOBALS['log']->fatal('in the handleCreateCandidate AOP husnain');
    global $current_user, $mod_strings, $current_language;
    $mod_strings = return_module_language($current_language, "Emails");
    $GLOBALS['log']->fatal('In handleCreateCase in AOPInboundEmail CUSTOMMMMM');

//    if (!$this->handleCaseAssignment($email) && $this->isMailBoxTypeCreateCase()) {
    if (true) {
        $GLOBALS['log']->fatal('AOP GOING TO create case!!!!');
        $GLOBALS['log']->debug('retrieveing email');
        $email->retrieve($email->id);

        $c = BeanFactory::newBean('RT_Candidates');

        $notes = $email->get_linked_beans('notes','Notes');
        $noteIds = array();
        foreach($notes as $note){
            $noteIds[] = $note->id;
        }
        $GLOBALS['log']->fatal('print_r($notes,1)');
        $GLOBALS['log']->fatal(print_r($notes,1));
        if($email->description_html) {
//            $c->description = $this->processImageLinks(SugarCleaner::cleanHtml($email->description_html),$noteIds);
            $c->description = $email->description;
        }else{
            $c->description = $email->description;
        }
//        $c->last_name = $email->name;
        if(!empty($email->reply_to_email)) {
            $c->last_name  = $email->reply_to_email;
        } else {
            $c->last_name  = $email->from_addr;
        }

        $c->phone_mobile = '123';
        $c->save();

        $vacancy_bean = BeanFactory::getBean('RT_Vacancies');
        $job_title = trim($job_title);
        $vacancy_bean->retrieve_by_string_fields(array('name' => $job_title,'status_c'=>'new_position'));
        $GLOBALS['log']->fatal('print_r($vacancy_bean,1)');
        $GLOBALS['log']->fatal(print_r($vacancy_bean,1));
        // create new job_application
        $GLOBALS['log']->fatal('create new job application');

        $new_job_application = BeanFactory::newBean('RT_Job_Application');
        $new_job_application->status = 'new';
        $new_job_application->parent_type = 'RT_Candidates';
        $new_job_application->parent_id = $c->id;
        $new_job_application->rt_vacancy_id = $vacancy_bean->id;
        $new_job_application->save();

        // relate vacancy to job application


        foreach($notes as $note){

            $GLOBALS['log']->fatal('create new note husnain');

            $newNote = BeanFactory::newBean('Notes');
            $newNote->name = $note->name;
            $newNote->file_mime_type = $note->file_mime_type;
            $newNote->filename = $note->filename;
            $newNote->parent_type = 'RT_Job_Application';
            $newNote->parent_id = $c->id;
            $newNote->save();
            $srcFile = "upload://{$note->id}";
            $destFile = "upload://{$newNote->id}";
            copy($srcFile,$destFile);
        }
    }
    echo "End of handle create Candidate\n";
    $GLOBALS['log']->fatal('END of handle create husnain');


} // fn
?>