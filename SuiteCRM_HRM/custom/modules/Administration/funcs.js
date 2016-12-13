var k=1;
function addEmail(){
	var i=$('table#email_table > tbody >').children().length;
	$('table#email_table > tbody > tr:last').after('<tr id="' + k + '"><td><table><tr><td width="33.5%" valign="top" colspan="3"><input type="text" name="sm_email[]" id="sm_email" value=""></td></tr><tr><td><input type="button" onclick="removeEmail(\'' + k + '\');" id="remove_email" value="Remove"></td></tr></table></td></tr>');
	k++;
}
function removeEmail(id){
	$('#'+id).remove();
}

