function create_job_offer(candidate_id) {

    $.ajax({
        type: "POST",
        url: "index.php?module=RT_Candidates&action=create_offer&candidate_id="+candidate_id,
        success: function(result){
         alert('Successfully Offered the Job!');
            location.reload();
        },
        error:function (res) {
            alert('Something wrong with the request');
        }
    });
    
}

function convert_candidate(candidate_id) {

    $.ajax({
        type: "POST",
        url: "index.php?module=RT_Candidates&action=convert_cand&candidate_id="+candidate_id,
        success: function(result){
            alert('Successfully Converted to Employee!');
            location.reload();
        },
        error:function (res) {
            alert('Something wrong with the request');
        }
    });

}