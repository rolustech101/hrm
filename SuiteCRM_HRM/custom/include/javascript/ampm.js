function change_applicant_status(id,status) {
    $.ajax({
        url: 'index.php?module=RT_Candidates&action=change_status&candidate_id='+id+'&status='+status,
        success: function (resp) {
            var status_name = SUGAR.language.languages.app_list_strings['job_app_status_list'][status];
            swal('Status changed to '+status_name);
            location.reload();
        },
        error: function (req, status, err) {
            swal({
                title: "Error!",
                text:  SUGAR.language.languages.app_strings['LBL_HRM_AJAX_ERROR'],
                type: "error",
                confirmButtonText: "OK"
            });
        }
    });
}