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
            console.log(result);
        },
        error:function (res) {
          alert('Something wrong with the request');
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
            document.getElementById(theKey).value = displayValue;
        }
    }
    var id = $('#rt_employees_rt_leavesrt_employees_ida').val();
    getEntitledHolidays(id);
}

function count_no_of_days() {
    var from_date = document.getElementById('from_date_c').value;
    var to_date = document.getElementById('to_date_c').value;

    var date1 = new Date(from_date);
    var date2 = new Date(to_date);
    var timeDiff = date2.getTime() - date1.getTime();
    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
    if(diffDays<0){
        alert('Number of days cannot be Negative');
        return false;
    }
    document.getElementById('count_days_c').value = diffDays+1;
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
    var year_start = new Date(join_date.replace(join_date.substr(6),new Date().getFullYear()));
    var year_end = new Date(join_date.replace(join_date.substr(6),new Date().getFullYear()+1));
    var from_date = new Date(document.getElementById('from_date_c').value);
    var to_date = new Date(document.getElementById('to_date_c').value);
    if((from_date > year_start && from_date < year_end) && (to_date > year_start && to_date < year_end)){

    }else {
        alert('You can only create Leaves for Employee\'s Current year');
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
                alert('Something wrong with the request');
                return false;
            }
        });
    }
    return false;

}
$(document).ready(function(){
    $('#count_days_c').val('2');
    $('#count_days_c').prop('readonly',true);
    $('#annual_leave_balance').prop('readonly',true);
    $('#casual_leave_balance').prop('readonly',true);
});
