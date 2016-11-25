
// var i=document.getElementById("tax_settings").rows.length-5;
  		var i= $('#tax_settings tr').length-5;
console.log('i is :::'+i);
		function addRow(){
            var country = $('#country').val();
            var non_filling_countries = get_non_filling_countries();
            if($.inArray(country,non_filling_countries) != -1){
                var v = $('#tax_settings tr').length-4;
                var table = document.getElementById("tax_settings");
                var rowCount = table.rows.length;
                console.log(rowCount);
                rowCount = rowCount-3;
                var row = table.insertRow(rowCount);
                var cell1 = row.insertCell(0);
                cell1.innerHTML="  Tax Rate:";

                var cell2 = row.insertCell(1);
                cell2.innerHTML = '<input type="text" required name="tax_rate[]" id="tax_rate'+v+'" value="0" size="5">%';

                var cell3 = row.insertCell(2);
                cell3.innerHTML = 'Salary From:  <input type="text" required name="sal_from[]" id="sal_from'+v+'" value="0"  onchange="checksalaryfrom('+v+');">';

                var cell4 = row.insertCell(3);
                cell4.innerHTML = 'Salary To:  <input type="text" required name="sal_to[]" id="sal_to'+v+'" value=""  onchange="checksalaryto('+v+');">';

                var cell5 = row.insertCell(4);
                cell5.innerHTML = 'Fix Amount:  <input type="text" name="fix_amount[]" id="fix_amount'+v+'" value="0"  >&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="delete_row" value="Delete" onClick="deleteRow('+v+')">';
            }else {
                var k= $('#tt tr').length;
                // var table = document.getElementById("tax_settings");

                var tr = '<td>Tax Rate:</td><td> <input type="text" required name="tax_rate[]" id="tax_rate'+k+'" value="0" size="5">%</td>';
                tr = tr + '<td>Salary From: <input type="text" required name="sal_from[]" id="sal_from'+k+'" value="0"  onchange="checksalaryfrom('+k+');" ></td>';
                tr = tr + '<td> Salary To: <input type="text" required name="sal_to[]" id="sal_to'+k+'" value=""  onchange="checksalaryto('+k+');"  ></td>';
                tr = tr + '<td> Fix Amount: <input type="text" name="fix_amount[]" id="fix_amount'+k+'" value="0"  > &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="delete_row" value="Delete" onClick="deleteRow('+k+')" ></td>';
                $('#tt tr:last').after('<tr>'+tr+'</tr>');

            }
           /* var table = document.getElementById("tt");
            var rowCount = table.rows.length;
            console.log(rowCount);
			rowCount = rowCount-3;
            var row = table.insertRow(rowCount);
            var cell1 = row.insertCell(0);
            cell1.innerHTML="  Tax Rate:";
 
            var cell2 = row.insertCell(1);
            cell2.innerHTML = '<input type="text" required name="tax_rate[]" id="tax_rate'+k+'" value="0" size="5">%';
			
            var cell3 = row.insertCell(2);
			cell3.innerHTML = 'Salary From:  <input type="text" required name="sal_from[]" id="sal_from'+k+'" value="0"  onchange="checksalaryfrom('+k+');">';

            var cell4 = row.insertCell(3);
			cell4.innerHTML = 'Salary To:  <input type="text" required name="sal_to[]" id="sal_to'+k+'" value="0"  onchange="checksalaryto('+k+');">';

            var cell5 = row.insertCell(4);
			cell5.innerHTML = 'Fix Amount:  <input type="text" name="fix_amount[]" id="fix_amount'+k+'" value="0"  >&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="delete_row" value="Delete" onClick="deleteRow('+k+')">';*/

        }
function get_filling_countries() {
    return ['USA','GERMANY','AUSTRALIA'];
}
function get_non_filling_countries() {
    return ['PAKISTAN', 'UNITED KINGDOM','CANADA'];
}
  		function checksalaryfrom(id){
            var country = $('#country').val();
            var non_filling_countries = get_non_filling_countries();
            if($.inArray(country,non_filling_countries) != -1){
                var m= $('#tax_settings tr').length-5;
            }else {
                var m= $('#tt tr').length-1;
            }

            if(m!=1){//there is only 1 row...so no need to check
				try{
					var currentval = document.getElementById("sal_from"+id).value;
				}
				catch(err){	
					currentval = 0;
				}
				var j=1;
				while(j<m){
					if(j!=id){ //do not compare same field value
						var val = document.getElementById("sal_from"+j).value;
						var toval = document.getElementById("sal_to"+j).value;
						if(val.trim() == currentval.trim() || toval.trim() == currentval.trim()){
							alert(currentval+" has already been entered");
							document.getElementById("sal_from"+id).value = "";
							return;
						}
					}
					j++;
				}
			}
			
		}
  		function checksalaryto(id){
            var country = $('#country').val();
            var non_filling_countries = get_non_filling_countries();
            if($.inArray(country,non_filling_countries) != -1){
                var m= $('#tax_settings tr').length-5;
            }else {
                var m= $('#tt tr').length-1;
            }
			if(m!=1){//there is only 1 row...so no need to check
				try{
					var currentval = document.getElementById("sal_to"+id).value;
				}
				catch(err){	
					currentval = 0;
				}
				var j=1;
				while(j<m){
					if(j!=id){ //do not compare same field value
						var val = document.getElementById("sal_to"+j).value;
						var fromval = document.getElementById("sal_from"+j).value;
						if(val.trim() == currentval.trim() || fromval.trim() == currentval.trim()){
							alert(currentval+" has already been entered");
							document.getElementById("sal_to"+id).value = "";
							return;
						}
					}
					j++;
				}
			}
			
		}  		
		function Checkfields(){
 				var j=0;
				while(j<i){
						var salfval = document.getElementById("sal_from"+j).value;
						var saltval = document.getElementById("sal_to"+j).value;
						var taxval = document.getElementById("tax_rate"+j).value;
						var prov = document.getElementById("provident_fund").value;
						if(salfval=="" || saltval=="" || taxval=="" || prov==""){
							ajaxStatus.flashStatus("Some input field is empty",10000);
							return false;
						}
					
					j++;
				}
		}		
        function deleteRow(id) {
            var country = $('#country').val();
            var sal_from = document.getElementById("sal_from"+id).value;
			var sal_to = document.getElementById("sal_to"+id).value;
			var tax = document.getElementById("tax_rate"+id).value;
            var status = $('#filling_status').val();
			var handleSuccess = function(o)
			{
				if(o.responseText !== undefined)
				{
                    alert('Successfully Deleted');
					window.location.reload();
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
			var url='index.php?module=RT_SalarySetting&action=delete_range&rangefrom='+sal_from+'&rangeto='+sal_to+'&tax_country='+country+'&file_status='+status+'&tax_rate='+tax;
			var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);			
        }
$(document).ready(function () {
    $(document).on('click', '#save-btn', function () {

        var non_filling_countries = get_non_filling_countries();
        var country = $('#country').val();
        if($.inArray(country,non_filling_countries) != -1){
            var index = $('#tax_settings tr').length-5;
            $('#tax_settings tr:last').prev().prev().prev().find('#sal_to'+index).prop('required',false)
        }else {
            var no = $('#tt tr').length-1;
            $('#tt tr:last').find('#sal_to'+no).prop('required',false);
        }
    });

	$('#country').change(function () {
		var country = $(this).val();
        var handleSuccess = function(o)
        {
            if(o.responseText !== undefined)
            {
                $('#populate_data').html(o.responseText);
				$('#tax_country').val(country);
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
        var url='index.php?module=RT_SalarySetting&action=get_country_data&sugar_body_only=true&tax_country='+country;
        var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);

	});

		$(document).on('change', '#filling_status', function () {
			var country = $('#country').val();
			var filling_status = $(this).val();

			var handleSuccess = function(o)
			{
				if(o.responseText !== undefined)
				{
                    if(o.responseText == ''){
                        $('#tt').html('<tr><td></td></tr>');
                    }else {
                        $('#tt').html(o.responseText);
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
			var url='index.php?module=RT_SalarySetting&action=get_filling_data&sugar_body_only=true&tax_country='+country+'&file_status='+filling_status;
			var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);

		});



});