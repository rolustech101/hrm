function employeesleavesClick(e,bar)
{
    if( bar !== undefined
        &&  bar[5] !== undefined
        &&  bar['object'] !== undefined
        &&  bar['object']['properties'] !== undefined
        &&  bar['object']['properties']['chart.tooltips']!== undefined
        &&  bar['object']['properties']['chart.tooltips'][bar[5]] !== undefined)
    {
        var info = bar['object']['properties']['chart.tooltips'][bar[5]];
        var stage = $(info).find('.stage').val();
        var date = $(info).find('.date').val();
        var name_employee = $(info).find('.emp_name').val();
        name_employee = 'leave of '+name_employee;
        stage = encodeURI($.trim(stage));
        date = encodeURI($.trim(date));
        window.open('index.php?module=RT_Leaves&action=index&query=true&searchFormTab=advanced_search&name='+name_employee+'&year_of_leave_advanced='+date);
    }
}
function candidatescoreClick(e,bar)
{
    if( bar !== undefined
        &&  bar[5] !== undefined
        &&  bar['object'] !== undefined
        &&  bar['object']['properties'] !== undefined
        &&  bar['object']['properties']['chart.tooltips']!== undefined
        &&  bar['object']['properties']['chart.tooltips'][bar[5]] !== undefined)
    {
        var info = bar['object']['properties']['chart.tooltips'][bar[5]];
        var stage = $(info).find('.stage').val();
        var date = $(info).find('.date').val();
        var vacancy_id = $(info).find('.posting_id').val();
        stage = encodeURI($.trim(stage));
        date = encodeURI($.trim(date));
        var candidate_name = 'interview of '+date;
        window.open('index.php?module=RT_Interviews&action=index&query=true&searchFormTab=advanced_search&name='+candidate_name+'&rt_vacancy_id_advanced='+vacancy_id);
    }
}
