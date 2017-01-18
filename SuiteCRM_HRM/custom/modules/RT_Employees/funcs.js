var k = 1;
function addSalary() {
    $.ajax({
        url: 'index.php?module=RT_Employees&action=get_increment_options',
        dataType: 'json',
        success: function (resp) {
            var sal_options = "<select name='label_salary[]' id = 'label_salary'>";
            for (var key in resp) {
                if (resp.hasOwnProperty(key)) {
                    sal_options += ("<option value=\"" + key + "\">" + resp[key] + "</option>");
                }
            }
            sal_options += "</select>";

            var i = Math.floor(Math.random() * (89951) + 50);
            var ii = $('table#salary_table > tbody >').children().length;
            $('table#salary_table > tbody > tr:last').after('<tr id="' + i + '"><td><table><tr><td width="12.5%" valign="top" scope="row">Label: </td><td width="33.5%" valign="top" colspan="3">' + sal_options + '</td></tr><tr><td width="12.5%" valign="top" scope="row">Amount: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="amount_salary[]" id="amount_salary" value=""></td><td width="10%" scope="row">Taxable: </td><td width="30%" colspan="3"><input type="checkbox" class="taxable_chbox" name="taxable_salary[]" id="taxable_salary' + i + '" value="1"></td></tr><tr><td><input type="button" onclick="removeSalary(\'' + i + '\');" id="remove_salary" value="Remove"></td></tr></table></td></tr>');

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
    k++;
}
function removeSalary(id) {
    $('#' + id).remove();
}
//function to calculate tax of the employee
function calculateTax() {
    var country = $('#primary_address_country').val();
    var file_status = $('#filling_status').val();
    var disply = $("#filling_status").css('display');
    if (disply == 'none') {
        file_status = 'any';
    } else {
        if (file_status == '') {
            swal("Please Select Filling Status!");
            return false;
        }
    }
    if (country == '') {
        swal("please select country first!");
        return false;
    }
    var taxable_salary = 0;
    var data = [];
    var tax_amount = 0;
    data = $('[name="amount_salary[]"]');
    var taxable = [];
    taxable = $('[name="taxable_salary[]"]');
    for (var i = 0; i < data.length; i++) {
        if (taxable[i].checked) {
            var obj = data[i];
            taxable_salary += parseInt(obj.value);
            if (isNaN(taxable_salary)) {
                swal("Please Enter a valid number!");
                return false;
            }
        }
    }
    if (isNaN(tax_amount)) {
        swal({
            title: "Error!",
            text: "This salary range do not fit with the current ranges for country OR you did not define ranges for" + country,
            type: "error",
            confirmButtonText: "OK"
        });
        return false;
    }
    var handleSuccess = function (o) {
        if (o.responseText !== undefined) {
            var tax_data = eval('(' + o.responseText + ')');
            // tax_amount = (tax_data['fix_amount']/12)+((tax_data['salary_exceed']/100)*tax_data['tax']);
            tax_amount = (tax_data['fix_amount'] / 12) + ((tax_data['salary_exceed'] / 100) * tax_data['tax']) / 12;
            // tax_amount = tax_amount/12;
            tax_amount = tax_amount.toFixed(2);
            if (isNaN(tax_amount)) {
                swal({
                    title: "Error!",
                    text: "This salary range do not fit with the current ranges for country OR you did not define ranges for" + country,
                    type: "error",
                    confirmButtonText: "OK"
                });
            } else {
                $('#tax').val(tax_amount);
            }
        }
    };

    var handleFailure = function (o) {
        if (o.responseText !== undefined) {
            swal({
                title: "Error!",
                text: SUGAR.language.languages.app_strings['LBL_HRM_AJAX_ERROR'],
                type: "error",
                confirmButtonText: "OK"
            });
        }
    };

    var callback =
    {
        success: handleSuccess,
        failure: handleFailure,
    };
    var url = 'index.php?module=RT_Employees&action=calculate_tax&salary=' + taxable_salary + '&country=' + country + '&file_status=' + file_status;
    var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);

}
function get_filling_countries() {
    return ['USA', 'GERMANY', 'AUSTRALIA'];
}
function get_non_filling_countries() {
    return ['PAKISTAN', 'UNITED KINGDOM', 'CANADA'];
}
function set_taxable(arg, formm) {

    if (check_form('EditView')) {
        var file_status = $('#filling_status').val();
        var disply = $("#filling_status").css('display');
        if (disply == 'none') {
            file_status = 'any';
        } else {
            if (file_status == '') {
                swal("Please Select Filling Status!");
                return false;
            }
        }
        var collec = $("[name='label_salary[]']");
        var test_duplidcate = [];
        for (var j = 0; j < collec.length; j++) {
            var selected_item = collec[j].selectedOptions[0].value;
            test_duplidcate.push(selected_item);
        }
        var sorted_array = test_duplidcate.sort();

        var reportDuplicate = [];
        for (var i = 0; i < sorted_array.length - 1; i++) {
            if (sorted_array[i + 1] == sorted_array[i]) {
                reportDuplicate.push(sorted_array[i]);
            }
        }
        if (reportDuplicate.length > 0) {
            swal("Salary Labels Must be unique!");
            return false;
        }
        if (collec.length > 0) {
            $("#tax").prop('required', true);
        }

        var bb = $('.taxable_chbox');
        var check_arr = [];
        $.each(bb, function (index, value) {
            check_arr.push(value.checked);
        });
        $('#taxable_status').val(check_arr);
        SUGAR.ajaxUI.submitForm(formm);
        return true;
    }
    return false;

}
function show_salary_panel() {
    $('#LBL_EDITVIEW_SALARY_INFO').show();
    $('#LBL_EDITVIEW_TAX').show();
}
function hide_salary_panel() {
    $('#LBL_EDITVIEW_SALARY_INFO').hide();
    $('#LBL_EDITVIEW_TAX').hide();
}
function is_fixed_monthly_onchange() {
    $("#is_fixed_monthly").off('change').on('change', function () {
        if (this.checked) {
            removeFromValidate('EditView', 'hourly_rate');
            show_salary_panel();
            $('#is_hourly').prop('checked', false);
            $("#hourly_rate").parent("div").parent("div").hide();

        } else {
            hide_salary_panel();
        }
    });

}
function is_hourly_onchange() {
    $("#is_hourly").off('change').on('change', function () {
        if (this.checked) {
            if (!checkValidate('EditView', 'hourly_rate')) {
                addToValidate('EditView', 'hourly_rate', 'currency', true, SUGAR.language.languages.RT_Employees['LBL_HOURLY_RATE']);
            }
            $('#is_fixed_monthly').prop('checked', false);
            $("#hourly_rate").parent("div").parent("div").show();

            hide_salary_panel();
        } else {
            removeFromValidate('EditView', 'hourly_rate');
            $("#hourly_rate").parent("div").parent("div").hide();
            show_salary_panel();
        }
    });

}
$(document).ready(function () {
    console.log(SUGAR.config.filling_countries);
    $("#filling_status").hide();
    $("#stipend").parent("div").parent("div").hide();
    $("#is_hourly").parent("div").parent("div").hide();
    $("#is_fixed_monthly").parent("div").parent("div").hide();
    $("#hourly_rate").parent("div").parent("div").hide();

    var emp_type = $('#employment_type_c').val();
    var is_monthly = $('#is_fixed_monthly').val();
    var is_hourly = $('#is_hourly').val();
    if (emp_type == 'Internship') {
        $("#stipend").parent("div").parent("div").show();
    } else if (emp_type == 'Part_Time') {
        $("#is_hourly").parent("div").parent("div").show();
        $("#is_fixed_monthly").parent("div").parent("div").show();
        $("#hourly_rate").parent("div").parent("div").hide();
        var check_hourly = $('#is_hourly').prop('checked');
        if (check_hourly) {
            $("#hourly_rate").parent("div").parent("div").show();
        }
    } else {
        // do nothing rest will be handled in view file
    }
    is_hourly_onchange();
    is_fixed_monthly_onchange();

    $('#employment_type_c').change(function () {
        var employement_status = $(this).val();
        if (employement_status == 'Part_Time') {
            removeFromValidate('EditView', 'stipend');
            $('#is_hourly').prop('checked', false);
            $('#is_fixed_monthly').prop('checked', true);
            show_salary_panel();
            $("#stipend").parent("div").parent("div").hide();
            $("#is_fixed_monthly").parent("div").parent("div").show();
            $("#is_hourly").parent("div").parent("div").show();
            is_hourly_onchange();
            is_fixed_monthly_onchange();

        } else if (employement_status == 'Internship') {
            $("#hourly_rate").parent("div").parent("div").hide();
            $('#is_fixed_monthly').prop('checked', false);
            if (!checkValidate('EditView', 'stipend')) {
                addToValidate('EditView', 'stipend', 'currency', true, SUGAR.language.languages.RT_Employees['LBL_STIPEND']);
            }
            hide_salary_panel();
            $("#is_fixed_monthly").parent("div").parent("div").hide();
            $("#is_hourly").parent("div").parent("div").hide();
            $("#stipend").parent("div").parent("div").show();

        } else {
            removeFromValidate('EditView', 'stipend');
            $('#is_fixed_monthly').prop('checked', false);
            $("#stipend").parent("div").parent("div").hide();
            $("#is_hourly").parent("div").parent("div").hide();
            $("#is_fixed_monthly").parent("div").parent("div").hide();
            $("#hourly_rate").parent("div").parent("div").hide();
            show_salary_panel();
        }
    });
    $('#primary_address_country').change(function () {
        var non_filling = get_non_filling_countries();
        var filling_countries = get_filling_countries();
        var country = $(this).val();
        if ($.inArray(country, non_filling) != -1) {
            generate_filling_status_list('none');
        }
        else if ($.inArray(country, filling_countries) != -1) {
            generate_filling_status_list(SUGAR.language.languages.app_list_strings[country + '_filling_status']);
        } else {
            $("#filling_status").html('');
            $("#filling_status").hide();
        }
    });
    function generate_filling_status_list(ob) {
        if (ob == 'none') {
            $("#filling_status").hide();
        } else {
            $("#filling_status").show();
            $("#filling_status").html(""); //reset child options
            for (var property in ob) {
                if (ob.hasOwnProperty(property)) {
                    $("#filling_status").append("<option value=\"" + property + "\">" + ob[property] + "</option>");
                }
            }
        }

    }
});
