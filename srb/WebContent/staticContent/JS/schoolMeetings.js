function addMeetingScheduleDetails1(){
	if(document.SheduleMeeting.fk_class_id_meetings.value == ""){
		alert("Please Select Class Name");
		return false;
	}
	if(document.SheduleMeeting.fk_division_id_meetings.value == ""){
		alert("Please Select Division Name");
		return false;
	}
	
	if(document.SheduleMeeting.date31.value == ""|| document.SheduleMeeting.date31.value ==null|| document.SheduleMeeting.date31.value ==undefined){
		alert("Please Select Date");
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
	var date=$('#date31').val();
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["message"] = message;
	params["date"] =date;
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

	var startTime = $('#startTime').val();
	var endTime = $('#endTime').val();
	var message = $('#message').val();
	//alert(message);
	
	if(document.SheduleMeeting.fk_class_id_meetings.value == ""){
		alert("Please Select Class Name");
		return false;
	}
	if(document.SheduleMeeting.fk_division_id_meetings.value == ""){
		alert("Please Select Division Name");
		return false;
	}
	if(document.SheduleMeeting.date31.value == ""){
		alert("Please Select Date");
		return false;
	}

	if(document.SheduleMeeting.startTime.value == ""){
		alert("Please Select Start Time");
		return false;
	}

	if(document.SheduleMeeting.endTime.value == ""){
		alert("Please Select End Time");
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
	
	var date31 = $('#date31').val();
	var startTime = $('#startTime').val();
	var endTime = $('#endTime').val();
	
	
	var message = $('#message').val();

	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["date31"] = date31;
	params["startTime"] = startTime;
	params["endTime"] = endTime;
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

// edit Parents Meeting
function editParentsMeeting()
{

	var params = {};
	var input = document.getElementById('clsid5'), list = document
			.getElementById('clslist5'), i,meetingId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			meetingId= list.options[i].getAttribute('data-value');
		}
	}
	$("#fk_teacher_id").append($("<input/>").attr("value", "").text());
	$("#clsname2").append($("<input/>").attr("value", "").text());
	$("#DivisionName2").append($("<input/>").attr("value", "").text());
	$("#date5").append($("<input/>").attr("value", "").text());
	$("#taskInTextt2").append($("<input/>").attr("value", "").text());
	params["meetingId1"] = meetingId;
	params["methodName"] = "getparentMeetigToEdit";
	$
			.post(
					'/srb/JSP/utility/controller.jsp',
					params,
					function(data) {

						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;
						$
								.each(
										jsonData,
										function(i, v) {
											
											document.getElementById("clsname2").value =v.className;
											document.getElementById("DivisionName2").value =v.divisionName;
											document.getElementById("taskInTextt2").value =v.message;
											document.getElementById("date5").value =v.insertDate;
											
											
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}

function UpdateParentMeeting()
{
	document.getElementById("btn").disabled = true;
	var params = {};
	var input = document.getElementById('clsid5'), list = document
			.getElementById('clslist5'), i,meetingId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			meetingId = list.options[i].getAttribute('data-value');
		}
	}
	var Meeting=$('#clsid5').val();
	var clsname2 = $('#clsname2').val();
	var DivisionName2= $('#DivisionName2').val();
	var date5 = $('#date5').val();
	var taskInTextt2 = $('#taskInTextt2').val();
	if(Meeting == undefined || Meeting== null
			||Meeting== "") {
		alert("Please select Class, Division");
		return false;
	}
		if (taskInTextt2 == undefined || taskInTextt2 == null || taskInTextt2== "") {
		alert("please enter a Task");
		return false;
	}

	if(date5 ==undefined || date5 == null || date5 =="")
		{
		alert("please select Date");
		return false;
		}
	
	
	var params = {};
	params["meetingId"] =meetingId;
	params["taskInTextt3"] = taskInTextt2;
	params["date5"] = date5;
	params["methodName"] = "updateParentsMeetingDetails";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});	

}

//validation of delete Parents Meeting
function delParentMeeting()
{
	if(document.delstrpro.field.value == "" || document.delstrpro.field.value==null || document.delstrpro.field.value == undefined)
	{
		alert("Please select Field");
		return false;
	}
	delParentMeeting1();
}
function delParentMeeting1()
{
	document.getElementById("btn").disabled = true;
	var input = document.getElementById('field'),
    list = document.getElementById('field_drop'),
    i,fieldId1;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fieldId1= list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	
	params["fieldId"] =fieldId1;
	
	params["methodName"] ="deletParentsMeeting";
	
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
// delete Schedule Meeting
function deleteScheduleMeeting2()
{
	if(document.delstrpro12.field2.value == "" || document.delstrpro12.field2.value==null || document.delstrpro12.field2.value == undefined)
	{
		alert("Please select Field");
		return false;
	}
	document.getElementById("btn").disabled = true;
	var input = document.getElementById('field2'),
    list = document.getElementById('field_drop2'),
    i,fieldId;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fieldId= list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	
	params["fieldId2"] =fieldId;
	
	params["methodName"] ="deletScheduleMeeting";
	
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
//edit schedule Meeting
function editScheduleMeeting()
{

	var params = {};
	var input = document.getElementById('clsid3'), list = document
			.getElementById('clslist1'), i,meetingId1;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			meetingId1= list.options[i].getAttribute('data-value');
		}
	}
	$("#clsname3").append($("<input/>").attr("value", "").text());
	$("#DivisionName3").append($("<input/>").attr("value", "").text());
	$("#date3").append($("<input/>").attr("value", "").text());
	$("#taskInTextt3").append($("<input/>").attr("value", "").text());
	params["meetingId1"] = meetingId1;
	params["methodName"] = "getScheduleMeetigToEdit";
	$
			.post(
					'/srb/JSP/utility/controller.jsp',
					params,
					function(data) {

						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;
						$
								.each(
										jsonData,
										function(i, v) {
											
											document.getElementById("clsname3").value =v.className;
											document.getElementById("DivisionName3").value =v.divisionName;
											document.getElementById("taskInTextt3").value =v.message;
											document.getElementById("date3").value =v.insertDate;
											
											
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}
//update Schedule Meeting
function updateScheduleMeeting(){
	
	var params = {};
	var input = document.getElementById('clsid3'), list = document
			.getElementById('clslist1'), i,meetingId2;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			meetingId2 = list.options[i].getAttribute('data-value');
		}
	}
	var Meeting=$('#clsid3').val();
	var clsname3 = $('#clsname3').val();
	var DivisionName3= $('#DivisionName3').val();
	var date3 = $('#date3').val();
	var taskInTextt3 = $('#taskInTextt3').val();
	if(Meeting == undefined || Meeting== null
			||Meeting== "") {
		alert("Please select Field");
		return false;
	}
		if (taskInTextt3 == undefined || taskInTextt3 == null || taskInTextt3== "") {
		alert("please enter a Task");
		return false;
	}

	if(date3 ==undefined || date3 == null || date3 == "")
		{
		alert("please select Date");
		return false;
		}
	document.getElementById("btn").disabled = true;
	
	var params = {};
	params["meetingId2"] =meetingId2;
	params["taskInTextt3"] = taskInTextt3;
	params["date3"] = date3;
	params["methodName"] = "updateScheduleMeetingDetails";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}




