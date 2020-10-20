function  parentsComplaintInfo()
{
	if(document.DailyTask.parentName.value ==""){
		alert("Please Enter ParentName");
		return false;
	}
	if(document.DailyTask.academicYear.value ==""){
		alert("Please Select Academic Year");
		return false;
	}
	if(document.DailyTask.fk_class_id1.value ==""){
		alert("Please Select Class Name ");
		return false;
	}
	if(document.DailyTask.fk_division_id.value ==""){
		alert("Please Select Division Name ");
		return false;
	}
	if(document.DailyTask.studentName.value ==""){
		alert("Please Select Student Name ");
		return false;
	}
	if(document.DailyTask.taskInText.value ==""){
		alert("Please Enter Your Complaint ");
		return false;
	}
	parentsComplaintInfo1();
}

//add parents complaint details
   function parentsComplaintInfo1(){
   	
		 var params= {};
			var input1 = document.getElementById('fk_class_id1'),
			list = document.getElementById('classes'),
			i,fk_class_id;

			for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input1.value) {
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
			
			$("#studentName option:selected").each(function() {
				   selectedVal = $(this).text();
				});
			
			var splitText = selectedVal.split(" ");
			
			var firstName = splitText[0];
			var middleName = splitText[1];
			var lastName = splitText[2];
			var className = $('#fk_class_id1').val();
			var divisionName = $('#fk_division_id').val();
			var firstName = splitText[0];
			var middleName = splitText[1];
			var lastName = splitText[2];
			var academicYear = $('#academicYear').val();
			var parentName= $('#parentName').val();
			var academicYear = $('#academicYear').val();
			var task= $('#taskInText').val();
			var taskImage = $('#taskImage').val();
			

			if(className==undefined || className== null || className == "" ){
				className="'N/A'";
			}
			if(divisionName==undefined || divisionName== null || divisionName == "" ){
				divisionName="'N/A'";
			}
			if(parentName==undefined || parentName== null || parentName == "" ){
				parentName="'N/A'";
			}
			if(academicYear==undefined || academicYear== null || academicYear == "" ){
				academicYear="'N/A'";
			}
			if(task==undefined || task== null || task == "" ){
				task="'N/A'";
			}
			if(fk_division_id==undefined || fk_division_id== null || fk_division_id == "" ){
				fk_division_id=0;
			}
			if(fk_class_id==undefined || fk_class_id== null || fk_class_id == "" ){
				fk_class_id=0;
			}
			if(taskImage==undefined || taskImage== null || taskImage == "" ){
				taskImage="'N/A'";
			}
			
			params["fk_class_id"] = fk_class_id;
			params["fk_division_id"] = fk_division_id;
			params["className"] = className;
			params["divisionName"] = divisionName;
			params["firstName"] = firstName;
			params["middleName"] = middleName;
			params["lastName"] = lastName;
			params["academicYear"] = academicYear;
			params["parentName"] = parentName;
			params["academicYear"] = academicYear;
			params["task"] = task;
			params["taskImage"] = taskImage;
			
	        params["methodName"] = "addParentsComplaint";
		 	
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
			
 //get student details for result entry
   function getStudentDetailsAsPerClassAdDivision(){
   	var params= {};
   	var input1 = document.getElementById('fk_class_id1'),
   	list = document.getElementById('classes'),
   	i,fk_class_id;

   	for (i = 0; i < list.options.length; ++i) {
   	if (list.options[i].value === input1.value) {
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

   	$("#studentName").empty();
   	$("#studentName").append($("<option></option>").attr("value","").text("Select Student Name"));
   	params["fk_class_id"] = fk_class_id;
   	params["fk_division_id"] = fk_division_id;
   	
   	var count=0;
   	var newrow;
   	var rowId;
   	
   	params["methodName"] = "getStudentNameAsPerClassAndDiv";
   	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
   	{
   		var jsonData = $.parseJSON(data);
   		//var jsonData = jsonData.list;
   		$.each(jsonData,function(i,v)
   				{
   			//document.getElementById("totalAnnualFee").value = v.totalAmt;
   			$("#studentName").append($("<option></option>").attr("value",v.pkStudentId).text(v.firstName+" "+v.middleName+" "+v.lastName));
   				});
   			})
   		
   }
  
//Get Parent by student   
function getParentByStudent(){
	var params= {};
   	

   //	var input1 = document.getElementById('studentName');
   	var studentName = $('#studentName').val();
   	
   	$("#parentName").empty();
   	$("#parentName").append($("<option></option>").attr("value","").text("Select Student Name"));
   	params["studentName"] = studentName;

   	
   	var count=0;
   	var newrow;
   	var rowId;
   	
   	params["methodName"] = "getParentNameAsPerStudent";
   	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
   	{
   		var jsonData = $.parseJSON(data);
   		//var jsonData = jsonData.list;
   		$.each(jsonData,function(i,v)
   				{
   			//document.getElementById("totalAnnualFee").value = v.totalAmt;
   			$("#parentName").append($("<option></option>").attr("value",v.pkStudentId).text(v.fatherName));
   				});
   			})
} 
   
 //Get Parents complaint Report
   function ParentsComReport(){
   	var params = {};
   	
   	params["methodName"] = "getParentsComplaintReport";

   	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
   			{
   		
   		$('#parentsComplaint').dataTable().fnClearTable();
   		
   		var jsonData = $.parseJSON(data);
   		//alert(data.length);
   		if(data.length <= 28){
   			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
   			 return true;
   		}
   		var catmap = jsonData.list;
   		/*$(document).ready(function() {
   		    
   		} );
   		*/
   		
   		$(document).ready(function() {
   		 var total =   $('#parentsComplaint').DataTable( {
   			 
   			 fnRowCallback : function(nRow, aData, iDisplayIndex){
   	                $("th:first", nRow).html(iDisplayIndex +1);
   	               return nRow;
   	            },
   			
   	        	
   		    	
   	            "sPaginationType": "full_numbers",
   		    	destroy: true,
   		        searching: true,
   		        orderable: true,
   		      
   		columns: [
   			        {"data": "parentName", "width": "5%"},
   			        {"data": "firstName", "width": "5%"},
		          	{"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
   		            {"data": "academicYear", "width": "5%"},
   		          	{"data": "className", "width": "5%"},
   		            {"data": "division", "width": "5%"},
   		            {"data": "studentName", "width": "5%"},
   		            {"data": "taskInText" , "width": "5%"},
   		            {"data": "insertDate" , "width": "5%"},
   		            
   		        ],
   		        
   		        dom : 'Bfrtip',
   		          buttons : [ 

   		                     { extend: 'copyHtml5', footer: true },
   		                     { extend: 'excelHtml5', footer: true },
   		                     { extend: 'csvHtml5', footer: true },
   		                     { extend : 'pdfHtml5', footer: true,
   		                    	 title : function() {
   		                    		 return "Parents Complaint Report";
   		                    	 },
   		                    	 orientation : 'landscape',
   		                    	 pageSize : 'LEGAL',
   		                    	 titleAttr : 'PDF' 
   		                     } ]  
   		    } );
   		
   		} );
   		
   	var mydata = catmap;
   	$('#parentsComplaint').dataTable().fnAddData(mydata);
   	
   		}
   	

   	);
   	
   	
   }
   
// get Division by Class Name
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

   
   
   