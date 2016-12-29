$(document).ready(function () {
    $("[name = 'rt_employees_rt_leaves_name[]']").removeAttr("multiple");
    $("[name = 'rt_vacancy_name[]']").removeAttr("multiple");
    var post_id = $('[name = "rt_vacancy_name[]"]').val();
    $.ajax({
        url: 'index.php?module=RT_Interviews&action=get_related_candidates&vacancy_id='+post_id,
        dataType: 'text',
        success: function (resp) {
            $("[name = 'candidates_list[]']").html(resp);
        },
        error: function (req, status, err) {
            alert('something went wrong', status, err);
        }
    });

    $("[name = 'rt_vacancy_name[]']").change(function () {

        var $vacancy_id = $(this).val();
        $.ajax({
            url: 'index.php?module=RT_Interviews&action=get_related_candidates&vacancy_id='+$vacancy_id,
            dataType: 'text',
            success: function (resp) {
                $("[name = 'candidates_list[]']").html(resp);
            },
            error: function (req, status, err) {
                alert('something went wrong', status, err);
            }
        });
    });
});
