YAHOO.util.Event.onDOMReady(getEmployees)
function getEmployees() 
{
	var handleSuccess = function(o)
	{
		if(o.responseText !== undefined)
		{
			document.getElementById("heads").innerHTML=o.responseText;
		}
	};

	var handleFailure = function(o)
	{

		if(o.responseText !== undefined)
		{
			swal({
				title: "Error!",
				text: "Something wrong with the request!",
				type: "error",
				confirmButtonText: "OK"
			});
		}
	};
	
	var callback =
	{
	  success:handleSuccess,
	  failure: handleFailure,
	};
	var url='index.php?module=RT_Departments&action=getemployees';
	var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);
}
