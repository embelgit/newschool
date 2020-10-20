function DivisionInfoValidation(){
	if(document.divInfo.fk_class_id.value==""){
		alert(" Please Select Class Name.");
		return false;
	
		}
	if(document.divInfo.division.value==""){
		alert("Please Enter Division Name.");
		return false;
	
		}
	if(document.divInfo.classRoom.value==""){
		alert("Please Enter Class Room No.");
		return false;
	
		}
	DivisionInfo()
}
function DivisionInfo(){
	
var params = {};
var input = document.getElementById('fk_class_id'),
list = document.getElementById('classId'),
i,fk_class_id;

for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input.value) {
	fk_class_id = list.options[i].getAttribute('data-value');
	}
}

	var division = $('#division').val();
	var classRoom= $('#classRoom').val();
	
	if(division==undefined || division== null || division == "" ){
		division="N/A";
	}
	if(classRoom==undefined || classRoom== null || classRoom == "" ){
		classRoom=0;
	}
	if(fk_class_id==undefined || fk_class_id== null || fk_class_id == "" ){
		fk_class_id=0;
	}
	
	
	params["fk_class_id"] = fk_class_id;
	params["division"] = division;
	params["classRoom"] = classRoom;
	params["methodName"] = "DivisionInfo";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
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

function getClassRoomDetails(){
	


	var params= {};
	
	var input = document.getElementById('fk_class_id'),
     list = document.getElementById('classId'),
     	i,fkRootClassId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootClassId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
/*	 		var input = document.getElementById('fk_div_id'),
	 	     list = document.getElementById('divId'),
	 	     	i,fkRootDivId;
	 		 		for (i = 0; i < list.options.length; ++i) {
	 				     if (list.options[i].value === input.value) {
	 				    	fkRootDivId = list.options[i].getAttribute('data-value');
	 				     }
	 		 		}*/
	 		
	 		
	$("#classRoom").append($("<input/>").attr("value","").text());
	
	var division = $('#fk_div_id').val();
	
	params["divisionId"]= division;
	params["classId"]= fkRootClassId;
	
	
	params["methodName"] = "getDivisionDetailToEdit";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				  document.getElementById("classRoom").value = v.classRoom;
			   
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    
}

function updateClassRoomNumber(){

	
	var params = {};
	var input = document.getElementById('fk_class_id'),
    list = document.getElementById('classId'),
    	i,fkRootClassId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootClassId = list.options[i].getAttribute('data-value');
			     }
	 		}

	 		var input = document.getElementById('fk_div_id'),
	 	    list = document.getElementById('divId'),
	 	    	i,fkRootDivId;
	 		 		for (i = 0; i < list.options.length; ++i) {
	 				     if (list.options[i].value === input.value) {
	 				    	fkRootDivId = list.options[i].getAttribute('data-value');
	 				     }
	 		 		}
	 		
		var division = $('#fk_div_id').val();
		var classRoom= $('#classRoom').val();
		
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
		params["divId"] = fkRootDivId;
		params["division"] = division;
		params["classRoom"] = classRoom;
		params["methodName"] = "updateDivisionDetails";
		
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

//delete division 
function deldivision(){

	
	var params = {};

	var input = document.getElementById('fk_class_id'), 
	list = document.getElementById('classId'), 
	i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}
		
		var division = $('#fk_div_id').val();

		params["fk_class_id"] = fkClassId;

		params["division"] = division;
	
		params["methodName"] = "deleteDivisionDetails";
		
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


//get Division by Class Name
function getDivisionNameByClassNameEditDivision()
{
//var type = document.getElementById('vendor').value;
	
	$("#divId").empty();
	$("#divId").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		var input = document.getElementById('fk_class_id'), list = document
		.getElementById('classId'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id').val();
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;
	
	params["methodName"] = "getDivisionNameByClassName";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#divId").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


//getclss

function getDivisionNameByClassNameDivision()
{
//var type = document.getElementById('vendor').value;
	
	$("#divId").empty();
	$("#divId").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		var input = document.getElementById('fk_class_id'), list = document
		.getElementById('classId'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id').val();
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;
	
	params["methodName"] = "getDivisionNameByClassNamedelete";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#divId").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}