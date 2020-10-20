
function reloadPage(){
	location.reload();
}
function ClassInfo(){
	if(document.classForName.clas.value=="")
	{
		//alertify.alert("Embel Technologies says --> Please Enter Class Name.");
	alert("Please Enter Class Name.");
		return false;
	}	
	addClassInfo();
}
function addClassInfo(){
var params = {};
	
	var clas = $('#clas').val();
	var classRoom= $('#classRoom').val();
	
	if(classRoom==undefined || classRoom== null || classRoom == "" ){
		classRoom=0;
	}
	
	
	params["clas"] = clas;
	params["classRoom"] = classRoom;
	
	
	params["methodName"] = "ClassInfo";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
				/*alertify.alert(data);*/	
			alert(data);
				location.reload();
 			}
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
}
// update class name by kishor
function updateClassName()
{
	
	
	var params = {};
	var input = document.getElementById('fk_class_id'),
    list = document.getElementById('classId'),
    	i,fkRootClassId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootClassId = list.options[i].getAttribute('data-value');
			     }
	 		}

	 		
		var division = $('#fk_class_id').val();
		var classname = $('#className').val();
/*		if(division==undefined || division== null || division == "" ){
			division="N/A";
		}
		if(classRoom==undefined || classRoom== null || classRoom == "" ){
			classRoom=0;
		}
		if(fk_class_id==undefined || fk_class_id== null || fk_class_id == "" ){
			fk_class_id=0;
		}*/
		
		
		params["fk_class_id"] = fkRootClassId;
		params["className"] = classname;
	
		params["methodName"] = "updateClassName";
		
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	 	    	{
			 	
			 		alert(data)
			 		location.reload();
			
	 			}
	 		
	 	    	).error(function(jqXHR, textStatus, errorThrown){
	 	    		if(textStatus==="timeout") {
	 	    			$(loaderObj).hide();
	 	    			$(loaderObj).find('#errorDiv').show();
	 	    		}
	 	    	})
	 	
	}

//delete
function deleteClassName()
{
	
	
	var params = {};
	var input = document.getElementById('fk_class_id'),
    list = document.getElementById('classId'),
    	i,fkRootClassId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootClassId = list.options[i].getAttribute('data-value');
			     }
	 		}

	 		
		var division = $('#fk_class_id').val();
		var classname = $('#className').val();
		
		params["fk_class_id"] = fkRootClassId;
		params["className"] = classname;
	
		params["methodName"] = "deleteClassName";
		
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	 	    	{
			 	
			 		alert(data)
			 		location.reload();
			
	 			}
	 		
	 	    	).error(function(jqXHR, textStatus, errorThrown){
	 	    		if(textStatus==="timeout") {
	 	    			$(loaderObj).hide();
	 	    			$(loaderObj).find('#errorDiv').show();
	 	    		}
	 	    	})
	 	
	}