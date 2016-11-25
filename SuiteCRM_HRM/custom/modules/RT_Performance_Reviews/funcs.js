k=0;
function addQuestion(){
   /* var number;
    if(num !== undefined){
        number = num;
    }else {
        number = k;
    }*/
	var i=$('table#salary_table > tbody >').children().length;
	$('table#salary_table > tbody > tr:last').after('<tr id="tr'+i+'"><td><table><tr><td width="12.5%" valign="top" scope="row">Question: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="label_question'+k+'" id="label_question'+k+'" value="" required></td></tr><tr><td width="12.5%" valign="top" scope="row">Question Type: </td><td width="33.5%" valign="top" colspan="3"> <input type="checkbox" name="question_type'+k+'" id="'+k+'" value="text_area"  class="taOpt text_area'+k+'" checked = "checked"> TextArea <input type="checkbox" name="question_type'+k+'" id="'+k+'" value="mutliple_choice" class="mcOpt muti_choice'+k+'" > Multiple Choice </td></tr><tr><td><input type="button" onclick="removeQuestion(\'tr'+i+'\');" id="remove_question" value="Remove"></td></tr></table></td></tr>');
  /*  $('#muti_choice'+k).change(function () {
        console.log('uncheck text_area'+k);
        $('#text_area'+k).attr('checked', false);
    });
    $('#text_area'+k).change(function () {
        console.log('uncheck multii'+k);
        $('#muti_choice'+k).attr('checked', false);
    });*/
  /*  $("#muti_choice"+k).change(function() {
        $("#text_area"+k).prop('checked', false);
    });
    $("#text_area"+k).change(function() {
        $("#muti_choice"+k).prop('checked', false);
    });*/

    $(".taOpt").off('change').on('change', function() {
        var id = $(this).attr('id');
        $(".muti_choice"+id).prop('checked', false);
        if($(this).is(":checked")) {
            var r_id = $(this).prop('id');
            $('#op'+r_id).remove();
            $('.muti-options'+r_id).remove();
        }
        else if($(this).is(":not(:checked)")){

            }
    });
    $(".mcOpt").off('change').on('change', function() {
        var id = $(this).attr('id');
        $(".text_area"+id).prop('checked', false);
        if($(this).is(":checked")) {
            var row = $(this).closest('tr');
            console.log(row);
            prevId = $(row).prev().find('input').attr('id');
            resss = prevId.split('n');
            console.log("checked");
            $(this).closest( "tr" ).after('<input tabindex="130" type="button" name="option_btn" id=op'+resss[1]+' value="Add option" onclick="addOptions(this,prevId,resss[1])">');
        }
        else if($(this).is(":not(:checked)")){
            var r_id = $(this).prop('id');
            $('#op'+r_id).remove();
            $('.muti-options'+r_id).remove();
        }
    });
    k++;
}

//after removing the row 
//reset ids and names of row and some fields 
function removeQuestion(id){
	$('#'+id).remove();
/*	var i=$('table#salary_table > tbody >').children().length;
	if(id == 1)//if tr was last child
	{
		while(i>0){
			j = (parseInt(id))+1;
			$('#'+j).attr('id', id);

			document.getElementById( "remove_question" ).removeAttribute( "onclick" );
			document.getElementById( "remove_question" ).setAttribute( "onClick", "javascript: removeQuestion('"+id+"');" );
			id++;
			i--;
		}
	}
	else if(1<id<i)//if tr was in between
	{
		while(id < i){
			j = (parseInt(id))+1;
			$('#'+j).attr('id', id);
			document.getElementById( "remove_question" ).removeAttribute( "onclick" );
			document.getElementById( "remove_question" ).setAttribute( "onClick", "javascript: removeQuestion('"+id+"');" );
			id++;
		}		
	}*/
}
function removeTr(id){
    $('#'+id).remove();

}
function addOptions(aftr,idd,option_id) {
    console.log(aftr.id,idd,option_id);
    var j=$('table#option_table > tbody >').children().length;
    var r_j = 'mop'+j
    /*$('table#salary_table > tbody > tr:last')*/
    $(aftr).after('<tr id="'+r_j+'" class="muti-options'+option_id+'"><td><table id="option_table"><tr><td width="12.5%" valign="top" scope="row">Option Label: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="'+idd+'_option[]" id="label_option" value=""></td></tr><tr><td><input type="button" onclick="removeTr(\''+r_j+'\');" id="remove_tr" value="Remove tr"></td></tr></table></td></tr>');
}
$(document).ready(function() {
    $('#submit-btn').click(function () {
       alert('click');
        var handleSuccess = function (o)
        {
            if (o.responseText !== undefined)
            {
                if(o.responseText == 'yes'){
                    if(confirm('Form with the same name already exists,Do you want to override?')){
                        var total = $('table#salary_table > tbody >').children().length;
                        $('#total_count').val(501);
                        document.getElementById("create_pr_form").submit();
                    }else {
                        alert('no submit');
                    }
                }else if(o.responseText == 'no'){
                    alert('new');
                    var total = $('table#salary_table > tbody >').children().length;
                    $('#total_count').val(501);
                    document.getElementById("create_pr_form").submit();
                }

            }
        };

        var handleFailure = function (o)
        {
            if (o.responseText !== undefined)
            {
                alert("Everything failed");
            }
        };

        var callback =
        {
            success: handleSuccess,
            failure: handleFailure,
        };
        var fname = $('#form_name').val();
        var url = "index.php?module=RT_Performance_Reviews&action=check_existing&form_name="+fname;
        var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);
    });
/*    $('#create_pr_form').submit(function () {
        alert('success submit');
        var total = $('table#salary_table > tbody >').children().length;
        $('#total_count').val(501);
    });*/
    $('#review_form').submit(function () {
        var id = $( "#dropdown option:selected" ).val();
        var name = $( "#dropdown option:selected" ).text();
        $('#form_id').val(id);
        $('#form_name').val(name);
    });


});

