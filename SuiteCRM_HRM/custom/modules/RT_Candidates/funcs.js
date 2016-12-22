function create_job_offer(candidate_id) {

    $.ajax({
        type: "POST",
        url: "index.php?module=RT_Candidates&action=create_offer&candidate_id="+candidate_id,
        success: function(result){
            if(result == 'error404'){
                alert('Job Application OR Job Posting is not associated with the candidate!')
                return false;
            }
         alert('Successfully Offered the Job!');
            location.reload();
        },
        error:function (res) {
            alert('Something wrong with the request');
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
        type: "POST",
        url: "index.php?module=RT_Candidates&action=convert_cand&candidate_id="+candidate_id,
        success: function(result){
            alert('Successfully Converted to Employee!');
            location.reload();
        },
        error:function (res) {
            alert('Something wrong with the request');
        },
        done:function (res) {
            SUGAR.ajaxUI.loadingPanel.hide();
            if (document.getElementById('ajaxloading_c'))
                document.getElementById('ajaxloading_c').style.display = 'none';
        }
    });

}