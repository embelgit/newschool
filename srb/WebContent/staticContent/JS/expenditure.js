function deleteExp(){
	
	var input = document.getElementById('expenseName'),
    list = document.getElementById('cat_drop'),
    i,expenseName;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	expenseName = list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	
	params["expenseName"] =expenseName;
	
	params["methodName"] = "deleteExp";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
 		if(data=="↵↵↵↵↵↵↵"){
 			alert("Not Added");
 		}
 		else{
 			alert(data);
 		}
 			location.reload();

 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
}