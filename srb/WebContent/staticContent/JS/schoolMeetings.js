function addMeetingScheduleDetails1(){
	if(document.SheduleMeeting.fk_class_id_meetings.value == ""){
		alert("Please Select Class Name");
		return false;
	}
	if(document.SheduleMeeting.fk_division_id_meetings.value == ""){
		alert("Please Select Division Name");
		return false;
	}
	if(document.SheduleMeeting.message.value == ""){
		alert("Please Enter Message");
		return false;
	}
	
	
	addMeetingScheduleDetails2();
	
}
//add school meeting schedules and send message to parent
function addMeetingScheduleDetails2(){

	document.getElementById("btn").disabled = true;
	var params = {};
	var input = document.getElementById('fk_class_id_meetings'),
    list = document.getElementById('classes_meetings'),
    i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_class_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	var input = document.getElementById('fk_division_id_meetings'),
    list = document.getElementById('division_meetings'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_division_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	var message = $('#message').val();

	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["message"] = message;

 	params["methodName"] = "scheduleMeetingAndSendMessage";
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
		 	
 			alert(data);
			location.reload();
			document.getElementById("btn").disabled = false;
 			}
 		
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
}

function addMeetingScheduleDetailsParents()
{

	if(document.SheduleMeeting.fk_class_id_meetings.value == ""){
		alert("Please Select Class Name");
		return false;
	}
	if(document.SheduleMeeting.fk_division_id_meetings.value == ""){
		alert("Please Select Division Name");
		return false;
	}
	if(document.SheduleMeeting.message.value == ""){
		alert("Please Enter Message");
		return false;
	}
	addMeetingScheduleDetailsParents1()
}

function addMeetingScheduleDetailsParents1()
{
	document.getElementById("btn").disabled = true;
	var params = {};
	var input = document.getElementById('fk_class_id_meetings'),
    list = document.getElementById('classes_meetings'),
    i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_class_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	var input = document.getElementById('fk_division_id_meetings'),
    list = document.getElementById('division_meetings'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_division_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	var message = $('#message').val();

	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["message"] = message;

 	params["methodName"] = "scheduleMeetingAndSendMessageParents";
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
		 	
 			alert(data);
			location.reload();
			document.getElementById("btn").disabled = false;
 			}
 		
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})




}


//get Division by Class Name
function getDivisionNameByClassName()
{
//var type = document.getElementById('vendor').value;
	
	$("#division_meetings").empty();
	$("#division_meetings").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		var input = document.getElementById('fk_class_id_meetings'), list = document
		.getElementById('classes_meetings'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id_meetings').val();
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;
	
	params["methodName"] = "getDivisionNameByClassName";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#division_meetings").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

