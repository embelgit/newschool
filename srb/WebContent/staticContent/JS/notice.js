//Teacher daily Task Home work Validation
 function NoticeValidation(){
		
		
		if(document.notice.fk_class_id1.value == "")
		{
		alert("Please Enter Class Name.");
			return false;
		}
		if(document.notice.fk_division_id.value == "")
		{
			alert("Please Enter Division Name.");
			return false;
		}
		if(document.notice.academicYear.value == "")
		{
			alert("Please Enter Academic Year Name.");
			return false;
		}
		if(document.notice.noticeDate.value == "")
		{
		alert("Please Select Date");
			return false;
		}
		if(document.notice.taskInText.value == ""){
			alert("Please Enter Notice Details");
			return false;
		}
		noticeEntry()
 }
 
 //Add Notice entry
 function noticeEntry(){
  	
		var params= {};
		var input1 = document.getElementById('fk_class_id1'),
		list = document.getElementById('classes'),
		i,fkClassId;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
		var input1 = document.getElementById('fk_division_id'),
		list = document.getElementById('division'),
		i,fkDivisionId;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkDivisionId = list.options[i].getAttribute('data-value');
			}
		}
		
		var className = $('#fk_class_id1').val();
		var division= $('#fk_division_id').val();
		var academicYear = $('#academicYear').val();
		var task= $('#taskInText').val();
		var noticeDate= $('#noticeDate').val();
	
		if(className==undefined || className== null || className == "" ){
			className="'N/A'";
		}
		if(division==undefined || division== null || division == "" ){
			division="'N/A'";
		}
		if(academicYear==undefined || academicYear== null || academicYear == "" ){
			className="'N/A'";
		}
		if(task==undefined || task== null || task == "" ){
			className="'N/A'";
		}
		if(fkDivisionId==undefined || fkDivisionId== null || fkDivisionId == "" ){
			fkDivisionId=0;
		}
		if(fkClassId==undefined || fkClassId== null || fkClassId == "" ){
			fkClassId=0;
		}
		
		params["className"] = className;
		params["division"] = division;
		params["academicYear"] = academicYear;
		params["task"] = task;
		params["fkDivisionId"] = fkDivisionId;
		params["fkClassId"] = fkClassId;
		params["noticeDate"] = noticeDate;
		
	 	params["methodName"] = "addNoticeEntry";
	 	
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
 function getDivisionNameByClassName()
 {
 //var type = document.getElementById('vendor').value;
 	
 	$("#division").empty();
 	$("#division").append($("<option></option>").attr("value","").text("Select product"));
 	var params= {};
 	
 	
 		var input = document.getElementById('fk_class_id1'), list = document
 		.getElementById('classes'), i, fkRootStudentId;
 		for (i = 0; i < list.options.length; ++i)
 		{
 			if (list.options[i].value === input.value) 
 			{
 				fkClassId = list.options[i].getAttribute('data-value');
 			}
 		}
 		
 	var className = $('#fk_class_id1').val();
 	
 	params["fkClassId"] = fkClassId;
 	params["className"] = className;
 	
 	params["methodName"] = "getDivisionNameByClassName";
 	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
 			{ var count = 1;

 			var jsonData = $.parseJSON(data);
 			$.each(jsonData,function(i,v)
 					{
 				
 						
 						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
 						$("#division").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
 						count++;
 					});
 			}).error(function(jqXHR, textStatus, errorThrown){
 				if(textStatus==="timeout") {

 				}
 			});
 }


 //edit
 function getnoticeDetails(){

		var params= {};
		
	/*	var input = document.getElementById('stuid'),
	     list = document.getElementById('student'),
	     	i,fkRootstuId;
		 		for (i = 0; i < list.options.length; ++i) {
				     if (list.options[i].value === input.value) {
				    	 fkRootstuId = list.options[i].getAttribute('data-value');
				     }
		 		}*/
 	 	var className = $('#fk_class_id1').val();
 	 	var divname = $('#fk_division_id').val();
 	 	
 	 	$("#noticeDatee").append($("<input/>").attr("value","").text());
		$("#taskInText").append($("<input/>").attr("value","").text());
		$("#pkid").append($("<input/>").attr("value","").text());
				
		
		params["classname"]= className;
		params["divname"]= divname;
		
		params["methodName"] = "getnoticeToEdit";
		
		$.post('/srb/JSP/utility/controller.jsp',params,function(data){
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			$.each(jsonData,function(i,v)
					{	
				  document.getElementById("pkid").value = v.pkNoticeId;
				  document.getElementById("noticeDatee").value = v.noticeDate;
				  document.getElementById("taskInText").value = v.task;

				   
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
	 	    
	}
 
 //
 function editnotice(){
	 
		if(document.notice.fk_class_id1.value == "")
		{
		alert("Please Enter Class Name.");
			return false;
		}
		if(document.notice.fk_division_id.value == "")
		{
			alert("Please Enter Division Name.");
			return false;
		}
/*		if(document.notice.academicYear.value == "")
		{
			alert("Please Enter Academic Year Name.");
			return false;
		}
		if(document.notice.noticeDate.value == "")
		{
		alert("Please Select Date");
			return false;
		}
		if(document.notice.taskInText.value == ""){
			alert("Please Enter Notice Details");
			return false;
		}*/
	 
	 editnotice1();
 }
 
 function editnotice1(){
	  	
		var params= {};
		var input1 = document.getElementById('fk_class_id1'),
		list = document.getElementById('classes'),
		i,fkClassId;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
		var input1 = document.getElementById('fk_division_id'),
		list = document.getElementById('division'),
		i,fkDivisionId;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkDivisionId = list.options[i].getAttribute('data-value');
			}
		}
		
		
		var className = $('#fk_class_id1').val();
		var division= $('#fk_division_id').val();
		var academicYear = $('#academicYear').val();
		var task= $('#taskInText').val();
		var noticeDate= $('#noticeDate').val();
		var pkid = $('#pkid').val();

		if(academicYear==undefined || academicYear== null || academicYear == "" ){
			className="'N/A'";
		}
		if(task==undefined || task== null || task == "" ){
			className="'N/A'";
		}
		if(fkDivisionId==undefined || fkDivisionId== null || fkDivisionId == "" ){
			fkDivisionId=0;
		}
		if(fkClassId==undefined || fkClassId== null || fkClassId == "" ){
			fkClassId=0;
		}
		
		params["className"] = className;
		params["division"] = division;
		params["academicYear"] = academicYear;
		params["task"] = task;
		params["fkDivisionId"] = fkDivisionId;
		params["fkClassId"] = fkClassId;
		params["noticeDate"] = noticeDate;
		params["pkid"] = pkid;
	 	params["methodName"] = "editNoticeEntry";
	 	
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