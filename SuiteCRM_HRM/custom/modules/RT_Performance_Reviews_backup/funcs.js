k=0;
function addQuestion(){
	var i=$('table#salary_table > tbody >').children().length;
	$('table#salary_table > tbody > tr:last').after('<tr id="'+i+'"><td><table><tr><td width="12.5%" valign="top" scope="row">Question: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="label_question[]" id="label_question'+k+'" value=""></td></tr><tr><td width="12.5%" valign="top" scope="row">Question Type: </td><td width="33.5%" valign="top" colspan="3"> <input type="checkbox" name="question_type[]" value="text_area"  class="chb'+k+'" checked> TextArea <input type="checkbox" name="question_type[]" value="mutliple_choice" class="chb'+k+'" onclick="handleClick(this);"> Multiple Choice </td></tr><tr><td><input type="button" onclick="removeQuestion(\''+i+'\');" id="remove_question" value="Remove"></td></tr></table></td></tr>');
	k++;
}
//after removing the row 
//reset ids and names of row and some fields 
function removeQuestion(id){
	$('#'+id).remove();
	var i=$('table#salary_table > tbody >').children().length;
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
	}
}
function removeTr(id){
    $('#'+id).remove();
    var i=$('table#salary_table > tbody >').children().length;
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
    }
}
function addOptions(aftr,idd) {
    var j=$('table#salary_table > tbody >').children().length;
    /*$('table#salary_table > tbody > tr:last')*/
    $(aftr).after('<tr id="'+j+'"><td><table><tr><td width="12.5%" valign="top" scope="row">Option Label: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="'+idd+'_option[]" id="label_option" value=""></td></tr><tr><td><input type="button" onclick="removeTr(\''+j+'\');" id="remove_tr" value="Remove tr"></td></tr></table></td></tr>');
}

function handleClick(cb) {
    var row = $(cb).closest('tr');
    console.log(row);
     prevId = $(row).prev().find('input').attr('id');

   // genrate add tr button
    if(cb.checked){
         resss = prevId.split('n');
        console.log("checked");
        $(cb).closest( "tr" ).after('<input tabindex="130" type="button" name="option_btn" id=op'+resss[1]+' value="Add option" onclick="addOptions(this,prevId)">');
    }
    else {
        console.log("Unchecked");
         // $(cb).next('input[name="option_btn"]').remove();
        $('#op'+resss[1]).remove();
    }

    // $('#myTable tr:last').after('<tr><td>hello </td><td>husy</td></tr>');
    //$(cb).closest( "tr" ).after("<tr><td>husnain</td><td>zaheer</td></tr>");
}
$(document).ready(function() {

	$(".chb").change(function() {
		$(".chb").prop('checked', false);
		$(this).prop('checked', true);
	});
/*    idd = $( "#dropdown option:selected" ).val();
    namee = $( "#dropdown option:selected" ).text();
    $('#form_id').val(idd);
    $('#form_name').val(namee);
    $("#dropdown").change(function () {
         idd = this.value;
         namee = $( "#dropdown option:selected" ).text();
        $('#form_id').val(idd);
        $('#form_name').val(namee);



    });*/

});

