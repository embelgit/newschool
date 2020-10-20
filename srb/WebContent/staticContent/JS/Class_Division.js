/**
 * 
 */
function ClassDivisionAssoc(){
	
	var input = document.getElementById('fk_class_id1'),
    list = document.getElementById('clas'),
    i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_class_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	var input1 = document.getElementById('fk_division_id'),
    list = document.getElementById('division'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_division_id = list.options[i].getAttribute('data-value');
    	}
	}
var params = {};
	
	var academicYear = $('#academicYear').val();
	
	params["fk_class_id"] = fk_class_id;
	params["division"] = fk_division_id;
	
	params["academicYear"] = academicYear;
		
 	params["methodName"] = "ClassDivisionAssoc";
 	
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
		 	
		 		alert(data)
		 		
		
 			}
 		
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
 	
	
}
 	