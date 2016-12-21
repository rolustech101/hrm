function applyincrement(rid, eid, inc_date,inc_type){
	var handleSuccess = function(o)
	{
		if(o.responseText !== undefined)
		{
			if(o.responseText == 'no'){
				alert(inc_type+" Salary Type is not defined for this Employee!\n" +
					"Tip:Please try any other type or define this type in employee");
				return false;
			}
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
	var url='index.php?module=RT_Increment_History&action=updatestatus&rid='+rid+'&eid='+eid+'&inc_date='+inc_date+'&inc_type='+inc_type;
	var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);
}


