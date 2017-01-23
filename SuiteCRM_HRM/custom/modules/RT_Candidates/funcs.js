function create_job_offer(candidate_id) {

    $.ajax({
        type: "POST",
        url: "index.php?module=RT_Candidates&action=create_offer&candidate_id="+candidate_id,
        success: function(result){
            if(result == 'error404'){
                swal({
                    title: "Error!",
                    text: "Job Application OR Job Posting is not associated with the candidate!",
                    type: "error",
                    confirmButtonText: "OK"
                });
                return false;
            }

            swal("Success!", "Successfully Offered the Job!", "success");
            location.reload();
        },
        error:function (res) {
            swal({
                title: "Error!",
                text: SUGAR.language.languages.app_strings['LBL_HRM_AJAX_ERROR'],
                type: "error",
                confirmButtonText: "OK"
            });
        }
    });
    
}

function convert_candidate(candidate_id) {

    SUGAR.ajaxUI.loadingPanel = new YAHOO.widget.Panel("ajaxloading", {
        width: "240px",
        fixedcenter: true,
        close: false,
        draggable: false,
        constraintoviewport: false,
        modal: true,
        visible: false
    });
    SUGAR.ajaxUI.loadingPanel.setBody('<div id="loadingPage" align="center" style="vertical-align:middle;"><img src="' + SUGAR.themes.loading_image + '" align="absmiddle" /> <b>' + SUGAR.language.get('app_strings', 'LBL_LOADING_PAGE') + '</b></div>');
    SUGAR.ajaxUI.loadingPanel.render(document.body);

    if (document.getElementById('ajaxloading_c'))
        document.getElementById('ajaxloading_c').style.display = '';

    SUGAR.ajaxUI.loadingPanel.show();

    $.ajax({
        type: "GET",
        url: "index.php?module=RT_Candidates&action=convert_cand&candidate_id="+candidate_id,
        success: function(result){
            swal("Success!", "Successfully Converted to Employee!", "success");
            location.reload();
        },
        error:function (res) {
            console.log(res);
            swal({
                title: "Error!",
                text: SUGAR.language.languages.app_strings['LBL_HRM_AJAX_ERROR'],
                type: "error",
                confirmButtonText: "OK"
            });
        },
        done:function (res) {
            SUGAR.ajaxUI.loadingPanel.hide();
            if (document.getElementById('ajaxloading_c'))
                document.getElementById('ajaxloading_c').style.display = 'none';
        }
    });

}

function is_email_unique(view,formm) {

    if (check_form('EditView')) {
        var trs = $('tr[id^="RT_Candidates0emailAddressRow"]');
        var email_address = [];
        for(i=0;i<trs.length;i++){
            email_address.push($(trs[i]).find('input[type="text"]').val());
        }
        $.ajax({
            type: "POST",
            datatype: "json",
            data:{data:email_address},
            url: "index.php?module=RT_Candidates&action=is_unique_email",
            success: function(result){
                if(result == 'no'){
                    swal({
                        title: "Error!",
                        text: 'Email Already exists',
                        type: "error",
                        confirmButtonText: "OK"
                    });
                    return false;
                }
                SUGAR.ajaxUI.submitForm(formm);
                return true;
            },
            error:function (res) {
                swal({
                    title: "Error!",
                    text: SUGAR.language.languages.app_strings['LBL_HRM_AJAX_ERROR'],
                    type: "error",
                    confirmButtonText: "OK"
                });
                return false;
            }
        });

    }
    return false;

}