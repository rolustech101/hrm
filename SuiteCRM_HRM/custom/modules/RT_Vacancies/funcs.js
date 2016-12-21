$(document).ready(function () {
    $("#job_level").parent().parent().hide();
    $('#financial_area').change(function () {
        var financial_area = $(this).val();
        switch (financial_area) {
            case 'finance':
                list(SUGAR.language.languages.app_list_strings['fn_list']);
                break;
            case 'human_resources':
                list(SUGAR.language.languages.app_list_strings['hr_list']);
                break;
            case 'information_technology':
                list(SUGAR.language.languages.app_list_strings['it_list']);
                break;
            case 'miscellaneous':
                list(SUGAR.language.languages.app_list_strings['mc_list']);
                break;
            case 'retail_operations':
                list(SUGAR.language.languages.app_list_strings['ro_list']);
                break;
            case 'warehousing':
                list(SUGAR.language.languages.app_list_strings['wh_list']);
                break;
            default: //default child option is blank
                $("#job_level").html('');
                break;
        }
    });
    function list(ob) {
        $("#job_level").parent().parent().show();
        // $("#job_level").show();
        $("#job_level").html(""); //reset child options
        for (var property in ob) {
            if (ob.hasOwnProperty(property)) {
                $("#job_level").append("<option value=\"" + property + "\">" + ob[property] + "</option>");
            }
        }
    }
});
