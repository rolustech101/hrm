function showHidePanel() {

    var d = document;
    var typeIndex = d.getElementById('qualification_type_c').selectedIndex;

    if (d.getElementById('qualification_type_c').options[typeIndex].value == 'Work_Experience') {
        d.getElementById('detailpanel_1').parentNode.style.display = 'block';
        d.getElementById('detailpanel_2').parentNode.style.display = 'none';
        d.getElementById('detailpanel_3').parentNode.style.display = 'none';
    } else if (d.getElementById('qualification_type_c').options[typeIndex].value == 'Education') {
        d.getElementById('detailpanel_1').parentNode.style.display = 'none';
        d.getElementById('detailpanel_2').parentNode.style.display = 'block';
        d.getElementById('detailpanel_3').parentNode.style.display = 'none';

    }
    else if (d.getElementById('qualification_type_c').options[typeIndex].value == 'Skills') {
        d.getElementById('detailpanel_1').parentNode.style.display = 'none';
        d.getElementById('detailpanel_2').parentNode.style.display = 'none';
        d.getElementById('detailpanel_3').parentNode.style.display = 'block';
    }
}
function showHide(type) {
    var d = document;
    if (type == 'Work_Experience') {
        d.getElementById('top-panel-0').parentNode.style.display = 'block';
        d.getElementById('top-panel-1').parentNode.style.display = 'none';
        d.getElementById('top-panel-2').parentNode.style.display = 'none';
    } else if (type == 'Education') {
        d.getElementById('top-panel-0').parentNode.style.display = 'none';
        d.getElementById('top-panel-1').parentNode.style.display = 'block';
        d.getElementById('top-panel-2').parentNode.style.display = 'none';
    }
    else if (type == 'Skills') {
        d.getElementById('top-panel-0').parentNode.style.display = 'none';
        d.getElementById('top-panel-1').parentNode.style.display = 'none';
        d.getElementById('top-panel-2').parentNode.style.display = 'block';
    }
}

