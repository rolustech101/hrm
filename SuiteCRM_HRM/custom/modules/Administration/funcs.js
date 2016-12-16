var k=1;
function addEmail(){
	var i = Math.floor(Math.random() * (89951) + 50);
	var ii=$('table#email_table > tbody >').children().length;
	$('table#email_table > tbody > tr:last').after('<tr id="e' + i + '"><td><table><tr><td width="33.5%" valign="top" colspan="3"><input type="text" name="sm_email[]" id="sm_email" value=""></td></tr><tr><td><input type="button" onclick="removeEmail(\'e' + i + '\');" id="remove_email" value="Remove"></td></tr></table></td></tr>');
	k++;
}
function addSalary(){
	var i = Math.floor(Math.random() * (89951) + 50);
	var ii=$('table#salary_table > tbody >').children().length;
	$('table#salary_table > tbody > tr:last').after('<tr id="s' + i + '"><td><table><tr><td width="33.5%" valign="top" colspan="3"><input type="text" name="salary_types[]" id="salary_types" value=""></td></tr><tr><td><input type="button" onclick="removeEmail(\'s' + i + '\');" id="remove_email" value="Remove"></td></tr></table></td></tr>');
	k++;
}
function removeEmail(id){
	$('#'+id).remove();
}

