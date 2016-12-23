function check_joining_date(view, formm) {
    var joining_date = $('#joining_date').val();
    alert(joining_date);
    if (check_form('EditView')) {
        var visibility_status = $('#joining_date').parent().parent().parent().css('display');
        if(visibility_status == 'block'){
            if(joining_date !== ''){
                SUGAR.ajaxUI.submitForm(formm);
                return true;
            }else{
                alert('Please Enter Joining Date!'+joining_date);
                return false;
            }
        }else{
            SUGAR.ajaxUI.submitForm(formm);
            return true;
        }
    }
    return false;
}
$(document).ready(function () {
    $('#status').change(function () {
        var ss = $(this).val();
        if (ss == 'accepted') {
            $('#joining_date').parent().parent().parent().show();
            $("#joining_date").prop('required', true);
        } else {
            $("#joining_date").prop('required', false);
            $('#joining_date').parent().parent().parent().hide();
        }
    });
    $("#joining_date").prop('required', false);
    $('#joining_date').parent().parent().parent().hide();
});