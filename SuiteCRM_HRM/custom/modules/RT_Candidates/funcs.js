function create_job_offer(candidate_id) {

    $.ajax({
        type: "POST",
        url: "index.php?module=RT_Candidates&action=create_offer&candidate_id="+candidate_id,
        success: function(result){
         alert('Successfully Offered the Job!');
        },
        error:function (res) {
            alert('Something wrong with the request');
        }
    });
    
}