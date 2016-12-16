var k = 1;
function addSalary() {
    $.ajax({
        url: 'index.php?module=RT_Employees&action=get_increment_options',
        dataType: 'json',
        success: function (resp) {
            var sal_options = "<select name='label_salary[]' id = 'label_salary'>";
            for (var key in resp) {
                if (resp.hasOwnProperty(key)) {
                    console.log(key + " -> " + resp[key]);
                    sal_options += ("<option value=\"" + key + "\">" + resp[key] + "</option>");
                }
            }
            sal_options += "</select>";
            console.log(sal_options);

            var i = Math.floor(Math.random() * (89951) + 50);
            var ii = $('table#salary_table > tbody >').children().length;
            $('table#salary_table > tbody > tr:last').after('<tr id="' + i + '"><td><table><tr><td width="12.5%" valign="top" scope="row">Label: </td><td width="33.5%" valign="top" colspan="3">' + sal_options + '</td></tr><tr><td width="12.5%" valign="top" scope="row">Amount: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="amount_salary[]" id="amount_salary" value=""></td><td width="10%" scope="row">Taxable: </td><td width="30%" colspan="3"><input type="checkbox" class="taxable_chbox" name="taxable_salary[]" id="taxable_salary' + i + '" value="1"></td></tr><tr><td><input type="button" onclick="removeSalary(\'' + i + '\');" id="remove_salary" value="Remove"></td></tr></table></td></tr>');

        },
        error: function (req, status, err) {
            console.log('something went wrong', status, err);
        }
    });
    k++;
}
function removeSalary(id) {
    $('#' + id).remove();
}
//function to calculate tax of the employee
function calculateTax() {
    var $country = $('#primary_address_country').val();
    // var file_status = $('#countries_filling_s').val();
    var file_status = $('#filling_status').val();
    // var disply = $("#countries_filling_s").css('display');
    var disply = $("#filling_status").css('display');
    if (disply == 'none') {
        file_status = 'any';
    } else {
        if (file_status == '') {
            alert('Please Select Filling Status!');
            return false;
        }
    }
    if ($country == '') {
        alert('please select country first!');
        return false;
    }
    var taxable_salary = 0;
    var arr = [];
    var tax_amount = 0;
    arr = document.getElementsByName("amount_salary[]");
    var taxable = [];
    taxable = $('[name="taxable_salary[]"]');
    for (var i = 0; i < arr.length; i++) {
        if (taxable[i].checked) {
            var obj = arr[i];
            taxable_salary += parseInt(obj.value);
            if (isNaN(taxable_salary)) {
                alert('Please Enter a valid number!');
                return false;
            }
        }
    }
    if (isNaN(tax_amount)) {
        alert('This salary range do not fit with the current ranges for country OR you did not define ranges for ' + $country);
        return false;
    }
    var handleSuccess = function (o) {
        if (o.responseText !== undefined) {
            var tax_data = eval('(' + o.responseText + ')');
            console.log('tax_data: ' + tax_data);
            // tax_amount = (tax_data['fix_amount']/12)+((tax_data['salary_exceed']/100)*tax_data['tax']);
            tax_amount = (tax_data['fix_amount'] / 12) + ((tax_data['salary_exceed'] / 100) * tax_data['tax']) / 12;
            // tax_amount = tax_amount/12;
            tax_amount = tax_amount.toFixed(2);
            if (isNaN(tax_amount)) {
                alert('This salary range do not fit with the current ranges for country OR you did not define ranges for ' + $country);
            } else {
                document.getElementById("tax").value = tax_amount;
            }
        }
    };

    var handleFailure = function (o) {
        if (o.responseText !== undefined) {
            alert("Everything failed");
        }
    };

    var callback =
    {
        success: handleSuccess,
        failure: handleFailure,
    };
    var url = 'index.php?module=RT_Employees&action=calculate_tax&salary=' + taxable_salary + '&country=' + $country + '&file_status=' + file_status;
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

        alert('hello');
        var file_status = $('#filling_status').val();
        var disply = $("#filling_status").css('display');
        if (disply == 'none') {
            file_status = 'any';
        } else {
            if (file_status == '') {
                alert('Please Select Filling Status!');
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
            alert('Salary Labels Must be unique!');
            return false;
        }
        if (collec.length > 0) {
            // alert('Please Calculate the Tax of the salary!\nTip:just click on Calculate Tax button');
            $("#tax").prop('required', true);
        }


        //////////////////
        var bb = $('.taxable_chbox');
        var check_arr = [];
        $.each(bb, function (index, value) {
            console.log(value.checked);
            check_arr.push(value.checked);
        });
        $('#taxable_status').val(check_arr);
        SUGAR.ajaxUI.submitForm(formm);
        return true;
    }
    return false;

}
$(document).ready(function () {
    $("#filling_status").hide();
    $('#primary_address_country').change(function () {

        var non_filling = get_non_filling_countries();
        var filling_countries = get_filling_countries();
        var country = $(this).val();
        if ($.inArray(country, non_filling) != -1) {
            list('none');
        }
        else if ($.inArray(country, filling_countries) != -1) {
            list(SUGAR.language.languages.app_list_strings[country + '_filling_status']);
        } else {
            // $("#countries_filling_s").html('');
            // $("#countries_filling_s").hide();
            $("#filling_status").html('');
            $("#filling_status").hide();
        }

    });
    function list(ob) {
        if (ob == 'none') {
            // $("#countries_filling_s").hide();
            $("#filling_status").hide();
        } else {
            // $("#countries_filling_s").show();
            $("#filling_status").show();
            // $("#countries_filling_s").html(""); //reset child options
            $("#filling_status").html(""); //reset child options
            for (var property in ob) {
                if (ob.hasOwnProperty(property)) {
                    console.log(property);
                    // $("#countries_filling_s").append("<option value=\""+property+"\">"+ob[property]+"</option>");
                    $("#filling_status").append("<option value=\"" + property + "\">" + ob[property] + "</option>");
                }
            }
        }

    }
});
