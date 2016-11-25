function applyincrement(rid, eid, inc_date){

	var handleSuccess = function(o)
	{
		if(o.responseText !== undefined)
		{
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
	var url='index.php?module=RT_Increment_History&action=updatestatus&rid='+rid+'&eid='+eid+'&inc_date='+inc_date;
	var request = YAHOO.util.Connect.asyncRequest('GET', url, callback);
}


