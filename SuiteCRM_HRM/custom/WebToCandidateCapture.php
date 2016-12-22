<?php

if (!defined('sugarEntry') || !sugarEntry) {
    die('Not A Valid Entry Point');
}
require_once 'custom/include/custom_utils.php';
require_once('include/SugarQueue/SugarJobQueue.php');

!empty($_REQUEST['first_name']) ? $first_name = $_REQUEST['first_name'] : $first_name = '';
!empty($_REQUEST['last_name']) ? $last_name = $_REQUEST['last_name'] : $last_name = '';
!empty($_REQUEST['mobile_phone']) ? $mobile_phone = $_REQUEST['mobile_phone'] : $mobile_phone = '';
!empty($_REQUEST['home_phone']) ? $home_phone = $_REQUEST['home_phone'] : $home_phone = '';
!empty($_REQUEST['ssn']) ? $ssn = $_REQUEST['ssn'] : $ssn = '';
!empty($_REQUEST['email1']) ? $email1 = $_REQUEST['email1'] : $email1 = '';
!empty($_REQUEST['primary_address_street']) ? $primary_address_street = $_REQUEST['primary_address_street'] : $primary_address_street = '';
!empty($_REQUEST['primary_address_city']) ? $primary_address_city = $_REQUEST['primary_address_city'] : $primary_address_city = '';
!empty($_REQUEST['primary_address_state']) ? $primary_address_state = $_REQUEST['primary_address_state'] : $primary_address_state = '';
!empty($_REQUEST['primary_address_postalcode']) ? $primary_address_postalcode = $_REQUEST['primary_address_postalcode'] : $primary_address_postalcode = '';
!empty($_REQUEST['primary_address_country']) ? $primary_address_country = $_REQUEST['primary_address_country'] : $primary_address_country = '';
!empty($_REQUEST['current_employer']) ? $current_employer = $_REQUEST['current_employer'] : $current_employer = '';
!empty($_REQUEST['years_of_experience']) ? $years_of_experience = $_REQUEST['years_of_experience'] : $years_of_experience = '';
!empty($_REQUEST['education']) ? $education = $_REQUEST['education'] : $education = '';
!empty($_REQUEST['vacancy_id']) ? $vacancy_id = $_REQUEST['vacancy_id'] : $vacancy_id = '';
!empty($_REQUEST['do_not_call']) ? $do_not_call = 1 : $do_not_call = 0;
!empty($_REQUEST['currently_employed']) ? $currently_employed = 1 : $currently_employed = 0;
!empty($_REQUEST['us_citizen']) ? $us_citizen = 1 : $us_citizen = 0;
!empty($_REQUEST['visa_required']) ? $visa_required = 1 : $visa_required = 0;


function getCand($email, $phone)
{

    if (isset($email) && !empty($email)) {
        $sql = "select * from (select cand.id as cand_id, cand.phone_mobile,cand.phone_work,cand.phone_other,cand.phone_home,cand.phone_fax, e_add.id as e_id, e_add.email_address_id,e_add.bean_id from rt_candidates as cand inner join email_addr_bean_rel as e_add on e_add.bean_id = cand.id where cand.deleted = 0 AND e_add.deleted = 0 ) as tt inner join email_addresses as addresses on addresses.id = tt.email_address_id where addresses.email_address = '$email' AND addresses.deleted = 0";
        $res = $GLOBALS['db']->query($sql);
        if ($res->num_rows > 1) {
            $GLOBALS['log']->fatal('Duplicate candidates exists please delete there should be unique names!');
            return '';
        } elseif ($res->num_rows > 0 && $res->num_rows == 1) {
            $GLOBALS['log']->fatal('use existing candidate');
            $row = $GLOBALS['db']->fetchByAssoc($res);
            $cid = $row['cand_id'];
            $c = BeanFactory::getBean('RT_Candidates', $cid);
        } else {
            $GLOBALS['log']->fatal('creating new candidate');
            $c = BeanFactory::newBean('RT_Candidates');
        }
        return $c;
    } else {
        $GLOBALS['log']->fatal('Parameter Email, is empty!');
        return '';
    }

}

$is_attachment = false;
$target_dir = __DIR__ . "/uploads/";
$FileType = pathinfo(basename($_FILES["fileToUpload"]["name"]), PATHINFO_EXTENSION);
$target_file = $target_dir . $email1 . '.' . $FileType; //basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
clearstatcache();
$check = filesize($_FILES["fileToUpload"]["tmp_name"]);
if ($check !== false) {
//    echo "File is an Valid - " . $check["mime"] . ".";
    $uploadOk = 1;
} else {
    echo "not a valid file type.";
    $uploadOk = 0;
}
//}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 5000000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
if ($FileType != "pdf" && $FileType != "doc" && $FileType != "docx"
    && $FileType != "odt" && $FileType != "txt" && $FileType != "rtf"
) {
    echo "Sorry, only pdf, doc, docx & odt, txt, rtf files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
    die;
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        $is_attachment = true;
        // echo "The file " . basename($_FILES["fileToUpload"]["name"]) . " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
        die;
    }
}


$candidate = getCand($email1, $mobile_phone);
$candidate->first_name = $first_name;
$candidate->last_name = $last_name;
$candidate->phone_mobile = $mobile_phone;
$candidate->phone_home = $home_phone;
$candidate->ssn = $ssn;
$candidate->email1 = $email1;
$candidate->primary_address_street = $primary_address_street;
$candidate->primary_address_city = $primary_address_city;
$candidate->primary_address_state = $primary_address_state;
$candidate->primary_address_postalcode = $primary_address_postalcode;
$candidate->primary_address_country = $primary_address_country;
$candidate->currently_employed = $currently_employed;
$candidate->current_employer = $current_employer;
$candidate->years_of_experience = $years_of_experience;
$candidate->us_citizen = $us_citizen;
$candidate->education = $education;
$candidate->visa_required = $visa_required;
$candidate->save();

// create new job_application
$GLOBALS['log']->fatal('create new job application');

$new_job_application = BeanFactory::newBean('RT_Job_Application');
$new_job_application->status = 'new';
$new_job_application->parent_type = 'RT_Candidates';
$new_job_application->parent_id = $candidate->id;
$new_job_application->rt_vacancy_id = $vacancy_id;
$new_job_application->save();


if ($is_attachment) {
    $GLOBALS['log']->fatal('create new note husnain');

    $newNote = BeanFactory::newBean('Notes');
    $newNote->name = $_FILES["fileToUpload"]["name"];
    $newNote->file_mime_type = $_FILES["fileToUpload"]["type"];
    $newNote->filename = $_FILES["fileToUpload"]["name"];
    $newNote->parent_type = 'RT_Job_Application';
    $newNote->parent_id = $new_job_application->id;
    $newNote->save();
//    $srcFile = "upload://{$note->id}";
    $srcFile = "$target_file";
    $destFile = "upload://{$newNote->id}";
    copy($srcFile, $destFile);
}

$candi_name = $first_name . ' ' . $last_name;

$emailObj = new Email();
$defaults = $emailObj->getSystemDefaultEmail();
$template_name = 'Notify Candidate JA';
$email_address = $email1;
$template = new EmailTemplate();
$template->retrieve_by_string_fields(array('name' => $template_name, 'type' => 'email'));

$template->body_html = str_replace('{name}', $candi_name, $template->body_html);
$template->body_html = str_replace('{position}', 'N/A', $template->body_html);
$mail = new SugarPHPMailer();
$mail->IsHTML(true);
$mail->setMailerForSystem();
$mail->From = $defaults['email'];
$mail->FromName = $defaults['name'];
$mail->Subject = $template->subject;
$mail->Body = from_html($template->body_html);
$mail->prepForOutbound();
$mail->AddAddress($email_address);
$send = $mail->Send();
if (!$send) {
    $GLOBALS['log']->fatal("Could not send Mail:  " . $mail->ErrorInfo);
}



// send email to HR
send_email($candidate->id, $new_job_application->id, $vacancy_id);

$vacancy_bean = BeanFactory::getBean('RT_Vacancies',$vacancy_id);
if($vacancy_bean->status_c == 'closed_filled'){
    echo "The job you applied for has been closed but we submitted your application for further considerations";
}else{
    echo "Your Application is Submitted!\nThank You, For Your Time...";
}




