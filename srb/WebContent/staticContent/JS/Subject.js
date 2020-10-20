/**
 * 
 */
function updatesubName()
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
		var subname = $('#subname').val();
		
		params["subid"] = fkRootClassId;
		params["subname"] = subname;
	
		params["methodName"] = "updatesubject";
		
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

function SubjectInfo(){
	if(document.subjectFormName.subject.value == ""){
		alert("Embel Technologies says -->Enter Subject Name.");
		return false;
	}
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(document.subjectFormName.subject.value.match(letterNumber))
	{
		
	}
	else {
		//alert("Embel Technologies says -->Enter Subject Name.");
		alert("Please Enter Only  Alphabates In Subject Name");
		return false;
	}
	addSubjectInfo();
}

function addSubjectInfo(){
var params = {};

	
	var subject = $('#subject').val();
	
	if(subject==undefined || subject== null || subject == "" ){
		subject= "N/A";
	}
	
	params["subject"] = subject;
	
	params["methodName"] = "SubjectInfo";
	
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

//subjectwise syllabus entry validation 
function subjectwiseSyllabusEntryVal(){
	if(document.subWiseSyllabus.fk_teacher_id.value == "")
	{
		alert("Enter teacher Name.");
		return false;
	}
	if(document.subWiseSyllabus.academicYear.value == "")
	{
		alert("Enter Academic Year.");
		return false;
	}
	if(document.subWiseSyllabus.fk_class_id1.value == "")
	{
		alert("Enter Class Name.");
		return false;
	}
	if(document.subWiseSyllabus.fk_division_id.value == "")
	{
		alert("Enter Division Name.");
		return false;
	}
	if(document.subWiseSyllabus.fk_subject_id.value == "")
	{
		alert("Enter Subject Name.");
		return false;
	}
/*	if(document.subWiseSyllabus.syllabusFile.value == "")
	{
		alert("Please Select File");
		return false;
	}*/
	subjectwiseSyllabusEntry();
}

//Subject wise syllabus entry
function subjectwiseSyllabusEntry(){

	var params= {};
	var input1 = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
	i,fkClassId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkClassId = list.options[i].getAttribute('data-value');
		}
	}
	
	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fkteacherid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkteacherid = list.options[i].getAttribute('data-value');
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
	var subject = $('#fk_subject_id').val();
	var teacherName= $('#fk_teacher_id').val();
	var academicYear = $('#academicYear').val();
	var syllabus= $('#syllabus').val();
	var syllabusFile= $('#syllabusFile').val();
	
	if(className==undefined || className== null || className == "" ){
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
	}
	
	
	
	params["className"] = className;
	params["division"] = division;
	params["subject"] = subject;
	params["teacherName"] = teacherName;
	params["academicYear"] = academicYear;
	params["syllabus"] = syllabus;
	params["syllabusFile"] = syllabusFile;
	params["fkDivisionId"] = fkDivisionId;
	params["fkteacherid"] = fkteacherid;
	params["fkClassId"] = fkClassId;
	
 	params["methodName"] = "addSubjectWiseSyllabus";
 	
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

//to view subject wise syllabus
function viewSyllabusImage(){
	var params= {};
	
	var input1 = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
	i,fkClassId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkClassId = list.options[i].getAttribute('data-value');
		}
	}
	
	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fkteacherid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkteacherid = list.options[i].getAttribute('data-value');
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
	
	var teacher = $('#fk_teacher_id').val();
	var classid = $('#fk_class_id1').val();
	var divid = $('#fk_division_id').val();
	
	
	var subject = $('#fk_subject_id').val();
	var academicYear = $('#academicYear').val();
	
	params["academicYear"] = academicYear;
	params["subjectName"] = subject;
	params["divId"] = divid;
	params["teacherId"] = teacher;
	params["classId"] = classid;
	
 	params["methodName"] = "viewSubjectWiseSyllabus";
 	
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data) 
 	{
 	
 		$('#studentOne').dataTable().fnClearTable();
	
	var jsonData = $.parseJSON(data);
	//alert(data.length);
	if(data.length <= 28){
		alertify.alert("Embel Technologies says --> Data not found for your Selection.");
		 return true;
	}
	var catmap = jsonData.list;
	/*$(document).ready(function() {
	    
	} );
	*/
	
	$(document).ready(function() {
	 var total =   $('#studentOne').DataTable( {
		 
		 fnRowCallback : function(nRow, aData, iDisplayIndex){
                $("th:first", nRow).html(iDisplayIndex +1);
               return nRow;
            },
		
        	
/*				 "footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api(), data;
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ?
		                        i : 0;
		            };
		 
		            // Total over all pages
		             total = api
		                .column( 6 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 ); 
		 			console.log(total); 
		            // Total over this page
		            
		            
		          pageTotal = api
		                .column( 7 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            Update footer
		            $( api.column( 7 ).footer() ).html(
		            		
		              parseFloat(pageTotal).toFixed(2)
		               
		            );
		            console.log( pageTotal);
	            
	        },*/
            "sPaginationType": "full_numbers",
	    	destroy: true,
	        searching: true,
	        orderable: true,
	      
	columns: [
	          	
	            {"data": "teacherName", "width": "5%"},
	            {"data": "className", "width": "5%"},
	            {"data": "division", "width": "5%"},
	            {"data": "syllabus" , "width": "5%"},
	            {"data": "insertDate" , "width": "5%"},
	           
	        ],
	        
	        dom : 'Bfrtip',
	          buttons : [ 

	                     { extend: 'copyHtml5', footer: true },
	                     { extend: 'excelHtml5', footer: true },
	                     { extend: 'csvHtml5', footer: true },
	                     { extend : 'pdfHtml5', footer: true,
	                    	 title : function() {
	                    		 return "Syllabus Report";
	                    	 },
	                    	 orientation : 'landscape',
	                    	 pageSize : 'LEGAL',
	                    	 titleAttr : 'PDF' 
	                     } ]  
	    } );
	
	} );
	
var mydata = catmap;
$('#studentOne').dataTable().fnAddData(mydata);

	}


);
 			
/* 	    	{
 			window.open("showSubjectwiseSyllabusFile.jsp");
 			location.reload();
 			}*/
 		
 	
/* 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	
 	    	})*/
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




//get Division by Class Name
function getDivisionNameByClassNameSyllabus()
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

//deletesub
function deletesubject()
{
	var input = document.getElementById('subjectName'),
    list = document.getElementById('subject_drop'),
    i,fk_Subject_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_Subject_id = list.options[i].getAttribute('data-value');
    	}
	}
	var delsubjectName = $("#subjectName").val();
	
	var params = {};
	params["fk_subject_id"] = fk_Subject_id;
	//params["delschoolName"] =delschoolName;
	
	params["methodName"] = "deleteSubject";
	
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


