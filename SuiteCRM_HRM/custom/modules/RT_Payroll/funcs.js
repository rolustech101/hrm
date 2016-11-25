YAHOO.util.Event.onDOMReady(getEmployees)
function getEmployees() 
{
	var handleSuccess = function(o)
	{

		if(o.responseText !== undefined)
		{
			document.getElementById("abc_c").innerHTML=o.responseText;
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
	var url='index.php?module=RT_Payroll&action=getemployees';
	var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);
}
$(document).ready(function () {
	$('#print-btn').click(function () {
		$(this).hide();
		window.print();
		$(this).show();
	});
});
