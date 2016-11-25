var k=1;
function addSalary(){ 
	var i=$('table#salary_table > tbody >').children().length;
	$('table#salary_table > tbody > tr:last').after('<tr id="'+k+'"><td><table><tr><td width="12.5%" valign="top" scope="row">Label: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="label_salary[]" id="label_salary" value=""></td></tr><tr><td width="12.5%" valign="top" scope="row">Amount: </td><td width="33.5%" valign="top" colspan="3"><input type="text" name="amount_salary[]" id="amount_salary" value=""></td><td width="10%" scope="row">Taxable: </td><td width="30%" colspan="3"><input type="checkbox" class="taxable_chbox" name="taxable_salary[]" id="taxable_salary'+k+'" value="1"></td></tr><tr><td><input type="button" onclick="removeSalary(\''+k+'\');" id="remove_salary" value="Remove"></td></tr></table></td></tr>');
	k++;
}
//after removing the row 
//reset ids and names of row and some fields 
function removeSalary(id){
	$('#'+id).remove();
/*	var i=$('table#salary_table > tbody >').children().length;
	if(id == 1)//if tr was last child
	{
		while(i>0){
			j = (parseInt(id))+1;
			$('#'+j).attr('id', id);
			$('#taxable_salary'+j).attr('name', '#taxable_salary'+id);
			$('#taxable_salary'+j).attr('id', '#taxable_salary'+id);
			document.getElementById( "remove_salary" ).removeAttribute( "onclick" );
			document.getElementById( "remove_salary" ).setAttribute( "onClick", "javascript: removeSalary('"+id+"');" );
			id++;
			i--;
		}
	}
	else if(1<id<i)//if tr was in between
	{
		while(id < i){
			j = (parseInt(id))+1;
			$('#'+j).attr('id', id);
			$('#taxable_salary'+j).attr('name', '#taxable_salary'+id);
			$('#taxable_salary'+j).attr('id', '#taxable_salary'+id);
			document.getElementById( "remove_salary" ).removeAttribute( "onclick" );
			document.getElementById( "remove_salary" ).setAttribute( "onClick", "javascript: removeSalary('"+id+"');" );
			id++;
		}		
	}*/
}
//function to calculate tax of the employee
function calculateTax(){
	var $country = $('#primary_address_country').val();
	var file_status = $('#countries_filling_s').val();
    var disply = $("#countries_filling_s").css('display');
    if(disply == 'none'){
        file_status = 'any';
    }else {
        if(file_status == ''){
            alert('Please Select Filling Status!');
            return false;
        }
    }
	if($country == ''){
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
        if(taxable[i].checked){
            var obj = arr[i];
            taxable_salary += parseInt(obj.value);
			if(isNaN(taxable_salary)){
				alert('Please Enter a valid number!');
				return false;
			}
		}
	}
	if(isNaN(tax_amount)){
		alert('This salary range do not fit with the current ranges for country OR you did not define ranges for '+$country);
		return false;
	}
 	var handleSuccess = function(o)
	{
		if(o.responseText !== undefined)
		{
			var tax_data = eval('(' + o.responseText + ')');
            console.log('tax_data: '+tax_data);
			// tax_amount = (tax_data['fix_amount']/12)+((tax_data['salary_exceed']/100)*tax_data['tax']);
			tax_amount = (tax_data['fix_amount']/12)+((tax_data['salary_exceed']/100)*tax_data['tax'])/12;
			// tax_amount = tax_amount/12;
			tax_amount = tax_amount.toFixed(2);
			if(isNaN(tax_amount)){
				alert('This salary range do not fit with the current ranges for country OR you did not define ranges for '+$country);
			}else {
				document.getElementById("tax").value=tax_amount;
			}
		}
	};

	var handleFailure = function(o)
	{
		if(o.responseText !== undefined)
		{
			alert("Everything failed");
		}
	};
	
	var callback =
	{
	  success:handleSuccess,
	  failure: handleFailure,
	};
	var url='index.php?module=RT_Employees&action=calculate_tax&salary='+taxable_salary+'&country='+$country+'&file_status='+file_status;
	var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);

}
function get_filling_countries() {
    return ['USA','GERMANY','AUSTRALIA'];
}
function get_non_filling_countries() {
    return ['PAKISTAN', 'UNITED KINGDOM','CANADA'];
}
function set_taxable(arg) {
    alert('click!!!');
    var bb = $('.taxable_chbox');
    var check_arr = [];
    $.each(bb,function(index,value){
        console.log(value.checked);
        check_arr.push(value.checked);
    });
    $('#taxable_status').val(check_arr);
    return check_form("Edit View");
}
$(document).ready(function () {
	$('#primary_address_country').change(function () {

        var non_filling = get_non_filling_countries();
        var filling_countries = get_filling_countries();
        var country = $(this).val();
        if($.inArray(country,non_filling) != -1){
            list('none');
        }
        else if($.inArray(country,filling_countries) != -1){
            list(SUGAR.language.languages.app_list_strings[country+'_filling_status']);
        }else {
            $("#countries_filling_s").html('');
            $("#countries_filling_s").hide();
        }
		/*switch(country){
			case 'UNITED KINGDOM':
				list('none');
				break;
			case 'USA':
				list(SUGAR.language.languages.app_list_strings['USA_filling_status']);
				break;
			case 'PAKISTAN':
				list('none');
				break;
			case 'GERMANY':
                list(SUGAR.language.languages.app_list_strings['GERMANY_filling_status']);
				break;
			case 'AUSTRALIA':
				list(SUGAR.language.languages.app_list_strings['AUSTRALIA_filling_status']);
				break;
			case 'CANADA':
				list('none');
				break;
			default: //default child option is blank
				$("#countries_filling_s").html('');
				break;
		}*/

	});
	function list(ob)
	{
        if(ob == 'none'){
            $("#countries_filling_s").hide();
        }else {
            $("#countries_filling_s").show();
            $("#countries_filling_s").html(""); //reset child options
            for (var property in ob) {
                if (ob.hasOwnProperty(property)) {
                    console.log(property);
                    $("#countries_filling_s").append("<option value=\""+property+"\">"+ob[property]+"</option>");
                }
            }
        }

	}
});
