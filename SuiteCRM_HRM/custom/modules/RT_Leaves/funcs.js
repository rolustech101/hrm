function getEntitledHolidays(id) {
    $.ajax({
        type: "POST",
        url: "index.php?module=RT_Leaves&action=getleaves_balance&employee_id="+id,
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(result){
            $('#annual_leave_balance').val(result.annual);
            $('#casual_leave_balance').val(result.casual);
            $('#emp_date_of_joining').val(result.joining_date);
        },
        error:function (res) {
            swal({
                title: "Error!",
                text: "Something wrong with the request!",
                type: "error",
                confirmButtonText: "OK"
            });
        }
    });
}

function set_custom_return(popupReplyData) {
    fromPopupReturn = true;
    var formName = popupReplyData.form_name;
    var nameToValueArray = popupReplyData.name_to_value_array;
    for (var theKey in nameToValueArray) {
        if (theKey == 'toJSON') {
            /* just ignore */
        } else {
            var displayValue = nameToValueArray[theKey].replace(/&amp;/gi, '&').replace(/&lt;/gi, '<').replace(/&gt;/gi, '>').replace(/&#039;/gi, '').replace(/&quot;/gi, '"');
            $('#'+theKey).val(displayValue);
        }
    }
    var id = $('#rt_employees_rt_leavesrt_employees_ida').val();
    
    getEntitledHolidays(id);
}

function count_no_of_days() {

    var from_date = $('#leave_start_date_c').val();
    var to_date = $('#to_date_c').val();
    var dateto = new Date(to_date);
    var datefrom = new Date(from_date);
    var date1_to = dateto.getFullYear() + "-" + (dateto.getMonth() + 1) + "-" + dateto.getDate();
    var date2_from = datefrom.getFullYear() + "-" + (datefrom.getMonth() + 1) + "-" + datefrom.getDate();
    var dateB = moment(date1_to);
    var dateC = moment(date2_from);
    var dur = dateB.diff(dateC, 'days');
    if(dur<0){
        swal({
            title: "Error!",
            text: "Number of days cannot be Empty OR Negative!",
            type: "error",
            confirmButtonText: "OK"
        });
        return false;
    }
    $('#count_days_c').val(dur+1);
}
function custom_function(view,formm) {

    var emp_id = $('#rt_employees_rt_leavesrt_employees_ida').val();
    var emp_doj = $('#emp_date_of_joining').val();
    var emp_name = $('#rt_employees_rt_leaves_name').val();
    var annual_balance = $('#annual_leave_balance').val();
    var casual_balance = $('#casual_leave_balance').val();
    var leave_type = $('#leave_type_c').val();
    var no_of_days = $('#count_days_c').val();
    var leave_status = $('#status_c').val();
    var join_date = $('#emp_date_of_joining').val();
    var join_date_object = new Date(join_date);
    var year_start = join_date_object.setFullYear(new Date().getFullYear());
    var year_end = join_date_object.setFullYear(new Date().getFullYear()+1);

    var from_date = new Date(document.getElementById('leave_start_date_c').value);
    var to_date = new Date(document.getElementById('to_date_c').value);
    if((moment(from_date).isAfter(year_start) && moment(from_date).isBefore(year_end)) && (moment(to_date).isAfter(year_start) && moment(to_date).isBefore(year_end))){

    }else {
        swal("You can only create Leaves for Employee Current year");
        return false;
    }
    if (check_form('EditView')) {
        $.ajax({
            type: "POST",
            url: "index.php?module=RT_Leaves&action=validate_leaves",
            data: {emp_id:emp_id,no_of_days:no_of_days,leave_type:leave_type,leave_status:leave_status},
            dataType: "json",
            success: function(result){
                if(result.statuss == 'success'){
                    SUGAR.ajaxUI.submitForm(formm);
                    return true;
                }else {
                    var is_confirmed = confirm('You do not have sufficient balance for '+leave_type+ ' Leaves\n continue anyway');
                    if(is_confirmed){
                        SUGAR.ajaxUI.submitForm(formm);
                        return true;
                    }
                    return false;
                }
            },
            error:function (res) {
                swal({
                    title: "Error!",
                    text: "Something wrong with the request!",
                    type: "error",
                    confirmButtonText: "OK"
                });
                return false;
            }
        });
    }
    return false;

}
$(document).ready(function(){
    // $('#count_days_c').val('2');
    $('#count_days_c').prop('readonly',true);
    $('#annual_leave_balance').prop('readonly',true);
    $('#casual_leave_balance').prop('readonly',true);
});
