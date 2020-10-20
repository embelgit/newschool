function uploadStudentScanDocument(){
	if(document.Stddocuplod.fk_class_id1.value ==""){
		alert("Please Select Class Name");
		return false;
	}
	
	if(document.Stddocuplod.fk_division_id.value ==""){
		alert("Please Select Division Name");
		return false;
	}
	if(document.Stddocuplod.fk_Student_id.value ==""){
		alert("Please Select Student Name");
		return false;
	}
	/*if(document.Stddocuplod.aadhar.value ==""){
		alert("Please upload Aadhar Card Photo ");
		return false;
	}
	if(document.Stddocuplod.studentPhoto.value ==""){
		alert("Please upload Student Photo ");
		return false;
	}*/
	
	uploadStudentScanDocument1()
}
//add student scan document
function uploadStudentScanDocument1(){


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
	
	/*var input1 = document.getElementById('fk_Student_id'),
	list = document.getElementById('studentNameList'),
	i,fk_Student_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_Student_id = list.options[i].getAttribute('data-value');
		}
	}*/
	
	var className = $('#fk_class_id1').val();
	var division= $('#fk_division_id').val();
	var fk_Student_id = $('#fk_Student_id').val();

	var aadhar= $('#aadhar').val();
	var cast= $('#cast').val();
	var lc= $('#lc').val();
	var studentPhoto= $('#studentPhoto').val();
	var extraDoc= $('#extraDoc').val();
	
/*	if(className==undefined || className== null || className == "" ){
		className="'N/A'";
	}
	if(division==undefined || division== null || division == "" ){
		division="'N/A'";
	}
	if(subject==undefined || subject== null || subject == "" ){
		subject="'N/A'";
	}
	if(teacherName==undefined || teacherName== null || teacherName == "" ){
		teacherName="'N/A'";
	}
	if(academicYear==undefined || academicYear== null || academicYear == "" ){
		academicYear="'N/A'";
	}
	if(syllabus==undefined || syllabus== null || syllabus == "" ){
		syllabus="'N/A'";
	}
   
	if(fkDivisionId==undefined || fkDivisionId== null || fkDivisionId == "" ){
		fkDivisionId=0;
	}
	if(fkteacherid==undefined || fkteacherid== null || fkteacherid == "" ){
		fkteacherid=0;
	}
	if(fkClassId==undefined || fkClassId== null || fkClassId == "" ){
		fkClassId=0;
	}*/
	
	
	
/*	params["className"] = className;
	params["division"] = division;
	params["subject"] = subject;
	params["teacherName"] = teacherName;
	params["academicYear"] = academicYear;*/
	
	params["aadhar"] = aadhar;
	params["cast"] = cast;
	params["lc"] = lc;
	params["studentPhoto"] = studentPhoto;
	params["extraDoc"] = extraDoc;
	params["fkDivisionId"] = fkDivisionId;
	params["fk_Student_id"] = fk_Student_id;
	params["fkClassId"] = fkClassId;
	
 	params["methodName"] = "addStudentScannedDocuments";
 	
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
function getDivisionNameByClassNameDocument()
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



