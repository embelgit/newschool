//Exam Entry validation
function ExamNameInfoEntryValidation(){

	if(document.examEntry.examName_id.value == "")
	{
		alert(" Please Select Exam Name.");
		return false;
	}
	if(document.examEntry.academicYear.value == "")
	{
		alert(" Please Select Academic Year.");
		return false;
	}
	if(document.examEntry.fk_class_id1.value == "")
	{
		alert(" Please Select Class Name.");
		return false;
	}
	if(document.examEntry.fk_division_id.value == "")
	{
		alert(" Please Select Division Name.");
		return false;
	}
	/*if(document.examEntry.fk_subject_id.value == "")
	{
		alert("Please Select Subject Name.");
		return false;
	}*/
	ExamInfo();
	
}

//Exam Name Entry Validation
function ExamNameEntryValidation(){
	if(document.examName.examNameEntry.value == "")
	{
		alertify.alert("Embel Technologies says --> Please Enter Exam Name.");
		return false;
	}
	ExamNameEntryInfo()
}

//Marks Entry Validation
function MarksInfoEntryValidation(){
	if(document.marksEntry.fk_examName_id1.value == "")
	{
		alert("Please Select Exam Name.");
		return false;
	}
	if(document.marksEntry.academicYear4.value == "")
	{
		alert("Please Enter Academic Year.");
		return false;
	}
	if(document.marksEntry.fk_class_id1.value == "")
	{
		alert("Please Enter Class Name.");
		return false;
	}
	if(document.marksEntry.fk_division_id.value == "")
	{
		alert("Please Enter Division Name.");
		return false;
	}
	if(document.marksEntry.fk_subject_id.value == "")
	{
		alert("Please Select Subject Name.");
		return false;
	}
	if(document.marksEntry.passingMarks.value == ""){
		alert("Passing marks required");
		return false;
	}
	if(document.marksEntry.totalMarks.value == ""){
		alert("Total marks required");
		return false;
	}
	addMarksPerSubject()
	
}

//adding of exam name

function ExamNameEntryInfo(){
var params = {};
	
	var examNameEntry = $('#examNameEntry').val();
	
	params["examNameEntry"] = examNameEntry;
	
	params["methodName"] = "getExamNameEntryInfo";
	
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


function ExamInfo()
{
	
	var params = {};
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('clas'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input = document.getElementById('examName_id'),
	list = document.getElementById('examNameId'),
	i,examName_id;
	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		examName_id = list.options[i].getAttribute('data-value');
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
	
	var input1 = document.getElementById('fk_subject_id'),
	list = document.getElementById('subjectList'),
	i,fk_subject_id;
	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_subject_id = list.options[i].getAttribute('data-value');
		}
	}

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	
	
	
	if(count < 1)
	{
	alert("Please Enter Subject Name ");
	document.getElementById("btn").disabled = false;
	return false;
	}
	
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);

	
	for (var i = 0; i < count; i++) 
	{

		var fkSubjectId = allRowsInGrid[i].fkSubjectId;
		params["fkSubjectId"+i] = fkSubjectId;
	
		var subject = allRowsInGrid[i].subject;
		params["subject"+i] = subject;
		
		var totalMarks = allRowsInGrid[i].totalMarks;
		if(Number(totalMarks=="" || totalMarks=="0" || totalMarks==undefined ))
		{
		alert("Please Enter TotalMarks In Grid");
		return false;
		}
		params["totalMarks"+i] = totalMarks;
	
		var passingMarks = allRowsInGrid[i].passingMarks;
		if(Number(passingMarks) >= Number(totalMarks))
		{		
			 var abc ="0.00"
		     alert("Please Enter Passing Marks Less than Total Marks");
			
			//$("#passingMarks").jqGrid("setCell",rowId,"abc",abc);
			document.getElementById("btn").disabled = false;
			location.reload();
			return false;
		
		
			
		}
		params["passingMarks"+i] = passingMarks;

	}
	
	if(totalMarks > 0 && (passingMarks == "" || passingMarks == undefined)){
		alert("please enter passing mark");
		return false;
	}
//	alert("totalMarks - "+totalMarks+"  passingMarks  "+passingMarks);
	params["count"] = count;
    
	var examName = $('#examName_id').val();
	var clas = $('#fk_class_id1').val();
	var division= $('#fk_division_id').val();
	var subject = $('#fk_subject_id').val();
	var academicYear = $('#academicYear').val();
	
	
	if(clas==undefined || clas== null || clas == "" ){
		clas="N/A";
	}
	if(division==undefined || division== null || division == "" ){
		division="N/A";
	}
	if(subject==undefined || subject== null || subject == "" ){
		subject="N/A";
	}
	if(academicYear==undefined || academicYear== null || academicYear == "" ){
		academicYear="N/A";
	}
	if(fk_class_id==undefined || fk_class_id== null || fk_class_id == "" ){
		fk_class_id=0;
	}
	if(fk_division_id==undefined || fk_division_id== null || fk_division_id == "" ){
		fk_division_id=0;
	}
	if(fk_subject_id==undefined || fk_subject_id== null || fk_subject_id == "" ){
		fk_subject_id=0;
	}
	
	 params["fk_class_id"] = fk_class_id;
	 params["fk_division_id"] = fk_division_id;
	// params["examName_id"] = examName_id;
	 params["examName_id"] = examName;
	 params["className"] = clas;
	 params["division"] = division;
	 params["academicYear"] = academicYear;
	 
	
	 
 	params["methodName"] = "getExamInfo";
 	
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

function reloadPage(){
	location.reload();
}

//adding marks
function addMarksPerSubject(){
	
	var params = {};
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input = document.getElementById('fk_examName_id1'),
	list = document.getElementById('examNameId'),
	i,fk_examName_idd;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_examName_idd = list.options[i].getAttribute('data-value');
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
	
	var input1 = document.getElementById('fk_subject_id'),
	list = document.getElementById('subjectList'),
	i,fk_subject_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_subject_id = list.options[i].getAttribute('data-value');
		}
	}

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var fkStudentId = allRowsInGrid[i].pkStudentId;
		params["fkStudentId"+i] = fkStudentId;
	
		var firstName = allRowsInGrid[i].firstName;
		params["firstName"+i] = firstName;
		
		var middleName = allRowsInGrid[i].middleName;
		params["middleName"+i] = middleName;
	
		var lastName = allRowsInGrid[i].lastName;
		params["lastName"+i] = lastName;

/*		var passingMarks = allRowsInGrid[i].passingMarks;
		params["passingMarks"+i] = passingMarks;*/
		
		var obtainedMarks = allRowsInGrid[i].obtainedMarks;
		var totalMarks = $('#totalMarks').val();
		if(obtainedMarks =="" || obtainedMarks ==null || obtainedMarks== undefined)
			{
			alert("Please Enter Obtained Marks In Grid");
			return false;
			
			}
		if(Number(obtainedMarks)>Number(totalMarks))
			{
			alert("Obtain Marks Should Be Less Than Total Marks");
			return false;
			}
		params["obtainedMarks"+i] = obtainedMarks;
	}
	
	params["count"] = count;
    
	var examName = $('#fk_examName_id1').val();
	var clas = $('#fk_class_id1').val();
	var division= $('#fk_division_id').val();
	var subject = $('#fk_subject_id').val();
	var academicYear = $('#academicYear4').val();
	var passingMarks = $('#passingMarks').val();
	var totalMarks = $('#totalMarks').val();
	
	if(clas==undefined || clas== null || clas == "" ){
		clas="N/A";
	}
	if(division==undefined || division== null || division == "" ){
		division="N/A";
	}
	if(subject==undefined || subject== null || subject == "" ){
		subject="N/A";
	}
	if(academicYear==undefined || academicYear== null || academicYear == "" ){
		academicYear="N/A";
	}
	if(fk_class_id==undefined || fk_class_id== null || fk_class_id == "" ){
		fk_class_id=0;
	}
	if(fk_division_id==undefined || fk_division_id== null || fk_division_id == "" ){
		fk_division_id=0;
	}
	if(fk_subject_id==undefined || fk_subject_id== null || fk_subject_id == "" ){
		fk_subject_id=0;
	}
	if(passingMarks==undefined || passingMarks== null || passingMarks == "" ){
		passingMarks=0;
	}
	if(totalMarks==undefined || totalMarks== null || totalMarks == "" ){
		totalMarks=0;
	}
	
	 params["fk_class_id"] = fk_class_id;
	 params["fk_division_id"] = fk_division_id;
	 params["fk_examName_id"] = fk_examName_idd;
	 params["examName"] = examName;
//	 params["examName"] = fk_examName_id1;
	 params["className"] = clas;
	 params["division"] = division;
	 params["academicYear"] = academicYear;
	 params["fk_subject_id"] = fk_subject_id;
	 params["subjectName"] = subject;
	 params["passingMarks"] = passingMarks;
	 params["totalMarks"] = totalMarks;
	 
 	params["methodName"] = "addResult";
 	
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
function getGridForSubject(){

	var params= {};
	var input1 = document.getElementById('fk_subject_id'),
	list = document.getElementById('subjectList'),
	i,fksubjectid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fksubjectid = list.options[i].getAttribute('data-value');
		}
	}

	var subjectName = $('#fk_subject_id').val();
	
	params["fkSubjectId"] = fksubjectid;
	params["subjectName"] = subjectName;
	
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getSubjectIntoGrid";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		  var jsonData = $.parseJSON(data);
			
	      //$("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
      
	     $.each(jsonData,function(i,v)
			{

	        
	         count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list4").jqGrid('getGridParam','data');
		     var ids = jQuery("#list4").jqGrid('getDataIDs');
			 
			
			  var prodName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].subject;
				
				 var rowId = ids[j];
				 var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
				
				if (prodName == jsonData.offer.subject) {
			    	/*ori_quantity = +rowdata[j].quantity+1;
			    	
			    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
			    	var grid = jQuery("#list4");
			    	grid.trigger("reloadGrid");*/
			    	newrow=false;
					alert("Subject Name Already Inserted !!!");
					var grid = jQuery("#list4");
				    grid.trigger("reloadGrid");
			    	break;
				}
				else
				{
					newrow = true;
				}
			 }
			   
			  if(newrow == true)
				 {
					
				  //$("#list4").addRowData(i,jsonData[i]);
				  $("#list4").addRowData(count,jsonData.offer);
					
				 }
		
			  document.getElementById('fk_subject_id').value = "";
			  
		$("#list4").jqGrid({
			datatype: "local",
			
			colNames:['fk Subject Id','Subject Name','Total Marks','Passing Marks'],
			colModel:[ 
				
			          
					     {
					    	 name:'fkSubjectId',
					    	 hidden:true,
					     },
			          
            
					     {	name:'subject',
					    	 width:2,
					
					     },
					     {
					    	 name:'totalMarks',
					    	 width:2,
					    	 editable: true
					     },
			          
            
					     {	name:'passingMarks',
					    	 width:2,
					    	 editable: true
					     }
				
			],
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 600,
          //height: 350,
			shrinkToFit:true,
          rowheight: 300,
          hoverrows: true,
	        rownumbers: true,
          rowNum: 10,
          'cellEdit':true,
       	 afterSaveCell: function  grossTotal() {
			        //	Calculation of total after editing quantity
			        	   
			        	   // $(this).trigger('reloadGrid');
			        	   var rowId =$("#list4").jqGrid('getGridParam','selrow');  
	                       var rowData = jQuery("#list4").getRowData(rowId);
	                    	var totalMarks = rowData['totalMarks'];
	                    	var passingMarks = rowData['passingMarks'];
	                    	
	                    /*	var tota = quantity * buyPrice;
                  		$("#list4").jqGrid("setCell", rowId, "total", tota);
                  		
                  		var Total =0;
                  		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
      		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
      		        	var AllRows=JSON.stringify(allRowsInGrid1);
      		        	for (var k = 0; k < count; k++) {
      		        		var Total1 = allRowsInGrid1[k].total;
      		        		Total = +Total + +Total1;
      		        	}
      		        	document.getElementById("grossTotal").value = Total;*/
	                    	
	                    	if(Number(totalMarks) < Number(passingMarks)){
	                    		alert("Please Enter Passing Marks Less than Total Marks..");
	                    		return false;
	                    	}
	                    	if(totalMarks !=""){
								var quan = /^\d{0,10}(?:\.\d{0,2})?$/;
								if(totalMarks.match(quan))
									{
									
									}
								else {
									var total = "0";
									alert ("Please Enter In TotalMarks only Number In Grid");
									$("#list4").jqGrid("setCell",rowId, "totalMarks", total);	
									return false;
								}
								}
	                    	
	                    	if(passingMarks !=""){
								var quan1 =/^\d{0,10}(?:\.\d{0,2})?$/;
								if(passingMarks.match(quan1))
									{
									
									}
								else { 
									var pass = "0";
									alert ("Please Enter In PassingMarks only Number In Grid");
									$("#list4").jqGrid("setCell",rowId, "passingMarks", pass);	
									return false;
								}
								}
	                    	
	        	},
         
			pager: "#jqGridPager",
			
			
			
		});
		
	
		//$("#list4").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#list4").addRowData(i,jsonData[i]);
			  $("#list4").addRowData(0,jsonData.offer);
		}
		

   
		 $('#list4').navGrid('#jqGridPager',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#list4"),
						  intervalId = setInterval(
							 function() {
							         grid.trigger("reloadGrid",[{current:true}]);
							   },
							   500);
	                         
	                      
						},
						
						 recreateForm: true,
						 checkOnUpdate : true,
						 checkOnSubmit : true,
		                 closeAfterEdit: true,
						
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    }
	                },
	                
	                {
	                    closeAfterAdd: true,
	                    recreateForm: true,
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    }
	                },
	                
	                {
	                	closeAfterdel:true,
	                	checkOnUpdate : true,
						checkOnSubmit : true,
						recreateForm: true,
	                	
						reloadAftersubmit:true,	
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    }
	                		
	                });
		 
		 
			   });
			
		})

}
	
			
			
			
			/* 	    	{
			  var jsonData = $.parseJSON(data);
				
		      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
			
	        
		     $.each(jsonData,function(i,v)
				{
		        
		         count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
			     var rowdata =$("#list4").jqGrid('getGridParam','data');
			     var ids = jQuery("#list4").jqGrid('getDataIDs');
			
			$("#list4").jqGrid({
				datatype: "local",
				
				colNames:['fk Subject Id','Subject Name','Total Marks','Passing Marks'],
				colModel:[ 
						     
						     {
						    	 name:'fkSubjectId',
						    	 hidden:true,
						     },
				          
	               
						     {	name:'subject',
						    	 width:150,
						
						     },
						     {
						    	 name:'totalMarks',
						    	 width:150,
						    	 editable: true
						     },
				          
	               
						     {	name:'passingMarks',
						    	 width:150,
						    	 editable: true
						     }
					
				],
					
				
				sortorder : 'desc',
				loadonce: false,
				viewrecords: true,
				width: 1200,
	           // height: 350,
				shrinkToFit:true,
	            rowheight: 300,
	            hoverrows: true,
		        rownumbers: true,
	            rowNum: 10,
	            'cellEdit':true,
	           
				pager: "#jqGridPager",
				
				
				
			});
			
		
			//$("#list4").addRowData(i+1,jsonData[i]);
			if(count==0 || count==null)
			{
				 // $("#list4").addRowData(i,jsonData[i]);
				  $("#list4").addRowData(i,jsonData.offer);
			}
			

	     
			 $('#list4').navGrid('#jqGridPager',
		                
		                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
		                
		                {
		                    editCaption: "The Edit Dialog",
		                   
		                    afterSubmit: function () {
								
		                      var grid = $("#list4"),
							  intervalId = setInterval(
								 function() {
								         grid.trigger("reloadGrid",[{current:true}]);
								   },
								   500);
		                         
		                      
							},
							
							 recreateForm: true,
							 checkOnUpdate : true,
							 checkOnSubmit : true,
			                 closeAfterEdit: true,
							
		                    errorTextFormat: function (data) {
		                        return 'Error: ' + data.responseText
		                    }
		                },
		                
		                {
		                    closeAfterAdd: true,
		                    recreateForm: true,
		                    errorTextFormat: function (data) {
		                        return 'Error: ' + data.responseText
		                    }
		                },
		                
		                {
		                	closeAfterdel:true,
		                	checkOnUpdate : true,
							checkOnSubmit : true,
							recreateForm: true,
		                	
							reloadAftersubmit:true,	
		                    errorTextFormat: function (data) {
		                        return 'Error: ' + data.responseText
		                    }
		                		
		                });
				   });
 			})

}*/
//Get Edit For Exam GRid

function getGridForSubjectEdit(){

	var params= {};
	var input1 = document.getElementById('examName_id'),
	list = document.getElementById('examNameId'),
	i,fksubjectid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fksubjectid = list.options[i].getAttribute('data-value');
		}
	}

	
	var input1 = document.getElementById('fk_class_id'),
	list = document.getElementById('clas'),
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
	var subjectName = $('#fk_subject_id').val();
	var examName =$('#examName_id').val();
	var AcademicYear = $('#AcademicYear').val();
	var classname = $('#fk_class_id').val();
	var divname = $('#fk_division_id').val();
	
	params["fkSubjectId"] = fksubjectid;
	params["subjectName"] = subjectName;
	params["examName_id"] = examName;
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["AcademicYear"] = AcademicYear ;
	params["classname"] = classname;
	params["divname"] = divname;
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getSubjectIntoGridEdit";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		  var jsonData = $.parseJSON(data);

		  
	      //$("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
      
	     $.each(jsonData,function(i,v)
			{
	   
	         count = jQuery("#list5").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list5").jqGrid('getGridParam','data');
		     var ids = jQuery("#list5").jqGrid('getDataIDs');
			 
			
			  var prodName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].subject;
				
				 var rowId = ids[j];
				 var rowData = jQuery('#list5').jqGrid ('getRowData', rowId);
				
				 
				if (prodName == jsonData.offer.subject) 
				{
					
					newrow=false;
					alert("Subject Name Already Inserted !!!");
					var grid = jQuery("#list5");
				    grid.trigger("reloadGrid");
			    	break;
				}
				else
				{
					newrow = true;
				}
			 }
			  
			  if(newrow == true)
				 {
					
				  //$("#list4").addRowData(i,jsonData[i]);
				  $("#list5").addRowData(count,jsonData.offer);
					
				 }
		
		
		$("#list5").jqGrid({
			datatype: "local",
			
			colNames:['fk Subject Id','Subject Name','Total Marks','Passing Marks'],
			colModel:[ 
				
			          
					     {
					    	 name:'pkexamid',
					    	 hidden:true,
					     },
			          
            
					     {	name:'subject',
					    	 width:100,
					    	 editable: true
					
					     },
					     {
					    	 name:'totalMarks',
					    	 width:100,
					    	 editable: true
					     },
			          
            
					     {	name:'passingMarks',
					    	 width:100,
					    	 editable: true
					     }
				
			],
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 900,
          //height: 350,
			shrinkToFit:true,
          rowheight: 300,
          hoverrows: true,
	        rownumbers: true,
          rowNum: 10,
          'cellEdit':true,
/*       	 afterSaveCell: function  grossTotal() {
			        	Calculation of total after editing quantity
			        	   
			        	   // $(this).trigger('reloadGrid');
			        	   var rowId =$("#list4").jqGrid('getGridParam','selrow');  
	                       var rowData = jQuery("#list4").getRowData(rowId);
	                    	var quantity = rowData['quantity'];
	                    	var buyPrice = rowData['buyPrice'];
	                    	
	                    	var tota = quantity * buyPrice;
                  		$("#list4").jqGrid("setCell", rowId, "total", tota);
                  		
                  		var Total =0;
                  		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
      		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
      		        	var AllRows=JSON.stringify(allRowsInGrid1);
      		        	for (var k = 0; k < count; k++) {
      		        		var Total1 = allRowsInGrid1[k].total;
      		        		Total = +Total + +Total1;
      		        	}
      		        	document.getElementById("grossTotal").value = Total;
	                    	
	        	},*/
         
			pager: "#jqGridPager1",
			
			
			
		});
		
	
		//$("#list4").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#list4").addRowData(i,jsonData[i]);
			  $("#list5").addRowData(0,jsonData.offer);
		}
		

   
		 $('#list5').navGrid('#jqGridPager1',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#list5"),
						  intervalId = setInterval(
							 function() {
							         grid.trigger("reloadGrid",[{current:true}]);
							   },
							   500);
	                         
	                      
						},
						
						 recreateForm: true,
						 checkOnUpdate : true,
						 checkOnSubmit : true,
		                 closeAfterEdit: true,
						
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    }
	                },
	                
	                {
	                    closeAfterAdd: true,
	                    recreateForm: true,
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    }
	                },
	                
	                {
	                	closeAfterdel:true,
	                	checkOnUpdate : true,
						checkOnSubmit : true,
						recreateForm: true,
	                	
						reloadAftersubmit:true,	
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    }
	                		
	                });
		 
		 
			   });
			
		})
}

//get student details for result entry
function getStudentDetails(){
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

	
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getStudentDetailsIntoGrid";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		  var jsonData = $.parseJSON(data);
			
	      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
      
	     $.each(jsonData,function(i,v)
			{
	        
	         count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list4").jqGrid('getGridParam','data');
		     var ids = jQuery("#list4").jqGrid('getDataIDs');
		
		$("#list4").jqGrid({
			datatype: "local",
			
			colNames:['fkStudentId','Roll Number','First Name','Middle Name','Last Name','Obtained<br>Marks'],
			colModel:[ 
			           {
		    	 			name:'pkStudentId',
		    	 			 hidden:true,
		    	 				width:80,
			           	},
			            {
					    	 name:'rollNumber',
					    	 width:50,
					     },
					     {
					    	 name:'firstName',
					    	 width:80,
					     },
			          
             
					     {	name:'middleName',
					    	 width:80,
					
					     },
					     {
					    	 name:'lastName',
					    	 width:80,
					    	 
					     },

					     {	name:'obtainedMarks',
					    	 width:50,
					    	 editable: true
					     }
				
			],
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 800,
         // height: 350,
			shrinkToFit:true,
          rowheight: 300,
          hoverrows: true,
	        rownumbers: true,
          rowNum: 10,
          'cellEdit':true,
          
          
          afterSaveCell: function  grossTotal() {
		       /* 	Calculation of total after editing quantity*/
		        	   
		        	   // $(this).trigger('reloadGrid');
		        	   var rowId =$("#list4").jqGrid('getGridParam','selrow');  
                      var rowData = jQuery("#list4").getRowData(rowId);
                   	/*var quantity = rowData['quantity'];
                   	var buyPrice = rowData['buyPrice'];
                   	
                   	var tota = 0;
                   	var tota = quantity * buyPrice;
               		$("#list4").jqGrid("setCell", rowId, "total", tota);
               		
               		var Total = 0;
               		var Total1 = 0; 
               		
               		if(Total1 == "" || Total1 ==null || Total1 == undefined)
               			{
               			Total1 = 0;                    			
               			}
               		
               		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
   		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
   		        	var AllRows=JSON.stringify(allRowsInGrid1);
   		        	for (var k = 0; k < count; k++) {
   		        		var Total1 = allRowsInGrid1[k].total;
   		        		Total = +Total + +Total1;
   		        	}
   		        	document.getElementById("grossTotal").value = (Total).toFixed(2);*/
                      var totalMatrks = 100;
                      var obtainedMarks = rowData['obtainedMarks'];
                      
                      if(obtainedMarks > totalMatrks)
                    	  {
                    	  alert("Please Enter Less Marks in Grid ")
                    	  return false;
                    	  }
   		        	
                   	
       	},
         
			pager: "#jqGridPager",
			
			
			
		});
		
	
		//$("#list4").addRowData(i+1,jsonData[i]);
	/*	if(count==0 || count==null)
		{
			*/ // $("#list4").addRowData(i,jsonData[i]);
			  $("#list4").addRowData(i,jsonData[i]);
		/*}
		*/

				 $('#list4').navGrid('#jqGridPager',
			                
			                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
			                
			                {
			                    editCaption: "The Edit Dialog",
			                   
			                    afterSubmit: function () {
									
			                      var grid = $("#list4"),
								  intervalId = setInterval(
									 function() {
									         grid.trigger("reloadGrid",[{current:true}]);
									   },
									   500);
			                         
			                      
								},
								
								 recreateForm: true,
								 checkOnUpdate : true,
								 checkOnSubmit : true,
				                 closeAfterEdit: true,
								
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                },
			                
			                {
			                    closeAfterAdd: true,
			                    recreateForm: true,
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                },
			                
			                {
			                	closeAfterdel:true,
			                	checkOnUpdate : true,
								checkOnSubmit : true,
								recreateForm: true,
			                	
								reloadAftersubmit:true,	
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                		
			                });
					   });
	 			})

	}

//get Passing marks as per selected subject,exam and academic year
function getPassingMarks(){
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input = document.getElementById('fk_examName_id1'),
	list = document.getElementById('examNameId'),
	i,fk_examName_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_examName_id = list.options[i].getAttribute('data-value');
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
	
	var input1 = document.getElementById('fk_subject_id'),
	list = document.getElementById('subjectList'),
	i,fk_subject_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_subject_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var academicYear = $('#academicYear4').val();
	var subject = $('#fk_subject_id').val();
	
	var params= {};
	params["methodName"] = "getPassingMarks";
	
	 params["fk_class_id"] = fk_class_id;
	 params["fk_division_id"] = fk_division_id;
	 params["fk_examName_id"] = fk_examName_id;
	 params["academicYear"] = academicYear;
	 params["fk_subject_id"] = fk_subject_id;
	 params["subjectName"] = subject;
	
	 $.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			var temp=v.passingMarks;
			if(temp==null||temp==undefined || temp=="")
				{
				document.getElementById("passingMarks").value = 0;
				}
			else
				{
				document.getElementById("passingMarks").value = v.passingMarks;
				}
			var temp1=v.totalMarks; 
			if(temp1==null||temp1==undefined || temp1=="")
				{
				document.getElementById("totalMarks").value = 0;
				}
			else
				{
				document.getElementById("totalMarks").value =v.totalMarks;
				}
			//document.getElementById("passingMarks").value = v.passingMarks;
			document.getElementById("totalMarks").value =v.totalMarks;
				});
			})
	
}

//get grid for daily time table 
function gridForExamTimeTable(){

	var params= {};
	var input1 = document.getElementById('fk_subject_id'),
    list = document.getElementById('subjectList'),
    i,fk_subject_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_subject_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	var subjectName = $('#fk_subject_id').val();
	var examDate = $('#examDate').val();
	var startTime = $('#startTime').val();
	var endTime = $('#endTime').val();
	var day = $('#day').val();
	
	
	params["fk_subject_id"] = fk_subject_id;
	params["day"] = day;
	params["subjectName"] = subjectName;
	params["examDate"] = examDate;
	params["startTime"] = startTime;
	params["endTime"] = endTime;
	
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getGridForExamTimeTable";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		  var jsonData = $.parseJSON(data);
			
	      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
      
	     $.each(jsonData,function(i,v)
			{
	        
	         count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list4").jqGrid('getGridParam','data');
		     var ids = jQuery("#list4").jqGrid('getDataIDs');
		     
		     var subjectName,com,packing,unit,strttime,endtime;
			  for (var j = 0; j < count; j++) 
			  {
				  subjectName = rowdata[j].subjetName;
				 var rowId = ids[j];
				 var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
				if (subjectName == jsonData.offer.subjetName) 
				{
							
			    	newrow=false;
					alert("Subject Name Already Inserted !!!");
					return false;
					var grid = jQuery("#list4");
				    grid.trigger("reloadGrid");
			    	break;
				}
				else
				{
					newrow = true;
				}
			 }
			  
			  if(newrow == true)
				 {
					
				  //$("#list4").addRowData(i,jsonData[i]);
				  $("#list4").addRowData(count,jsonData.offer);
					
				 }
			  document.getElementById('fk_subject_id').value = "";	
		
			  $("#list4").jqGrid({
					datatype: "local",
					
					colNames:['fkSubjectId','Date','Day','Start Time','End Time','Subject Name'],
					colModel:[ 
					           {
				    	 			name:'fkSubjectId',
				    	 			 hidden:true,
				    	 				width:80,
					           	},
					           	{
				    	 			name:'examDate',
				    	 				width:80,
					           	},
					           	
					           	{
				    	 			name:'weekDay',
				    	 				width:80,
					           	},
					         
							     {	name:'startTime',
							    	 width:80,
							    	 editable:true
							
							     },
							     {
							    	 name:'endTime',
							    	 width:80,
							    	 editable:true
							    	 
							     },
							     {
							    	 name:'subjetName',
							    	 width:80,
							     }
					],
				
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 800,
         // height: 350,
			shrinkToFit:true,
          rowheight: 300,
          hoverrows: true,
	        rownumbers: true,
          rowNum: 10,
          'cellEdit':true,
         
			pager: "#jqGridPager",
			
			
			
		});
		
	
		//$("#list4").addRowData(i+1,jsonData[i]);
	/*	if(count==0 || count==null)
		{
			*/ // $("#list4").addRowData(i,jsonData[i]);
			  
		//$("#list4").addRowData(i,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#list4").addRowData(i,jsonData[i]);
			  $("#list4").addRowData(0,jsonData.offer);
		}
		/*}
		*/

				 $('#list4').navGrid('#jqGridPager',
			                
			                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
			                
			                {
			                    editCaption: "The Edit Dialog",
			                   
			                    afterSubmit: function () {
									
			                      var grid = $("#list4"),
								  intervalId = setInterval(
									 function() {
									         grid.trigger("reloadGrid",[{current:true}]);
									   },
									   500);
			                      
								},
								
								 recreateForm: true,
								 checkOnUpdate : true,
								 checkOnSubmit : true,
				                 closeAfterEdit: true,
								
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                },
			                
			                {
			                    closeAfterAdd: true,
			                    recreateForm: true,
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                },
			                
			                {
			                	closeAfterdel:true,
			                	checkOnUpdate : true,
								checkOnSubmit : true,
								recreateForm: true,
			                	
								reloadAftersubmit:true,	
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                        
			                    
			                    }
			                		
			                });
					   });
	 			})
}
//
//

function gridForExamTimeTabletoedit(){

	var params= {};
	
	var examname = $('#fk_examName_id').val();
	var clss = $('#fk_class_id1').val();
	var divv = $('#fk_division_id').val();

	
	
	params["examname"] = examname;
	params["clss"] = clss;
	params["divv"] = divv;
	
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getGridForExamTimeTableedit";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		  var jsonData = $.parseJSON(data);
			
	      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
      
	     $.each(jsonData,function(i,v)
			{
	        
	         count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list4").jqGrid('getGridParam','data');
		     var ids = jQuery("#list4").jqGrid('getDataIDs');
		     
		     var subjectName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  subjectName = rowdata[j].subjetName;
					 var rowId = ids[j];
					 var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
					if (subjectName == jsonData.offer.subjetName) 
					{
								
				    	newrow=false;
						alert("Subject Name Already Inserted !!!");
						return false;
						var grid = jQuery("#list4");
					    grid.trigger("reloadGrid");
				    	break;
					}
					else
					{
						newrow = true;
					}
				 }
				  
				  if(newrow == true)
					 {
						
					  //$("#list4").addRowData(i,jsonData[i]);
					  $("#list4").addRowData(count,jsonData.offer);
						
					 }
				  document.getElementById('fk_subject_id').value = "";	
			
			  $("#list4").jqGrid({
					datatype: "local",
					
					colNames:['fkSubjectId','Date','Day','Start Time','End Time','Subject Name'],
					colModel:[ 
					           {
				    	 			name:'pkExamTimeTableId',
				    	 			 hidden:true,
				    	 				width:80,
					           	},
					           	{
				    	 			name:'examDate',
				    	 				width:80,
								    	 editable:true
					           	},
					           	
					           	{
				    	 			name:'weekDay',
				    	 				width:80,
					           	},
					         
							     {	name:'startTime',
							    	 width:80,
							    	 editable:true
							
							     },
							     {
							    	 name:'endTime',
							    	 width:80,
							    	 editable:true
							    	 
							     },
							     {
							    	 name:'subjetName',
							    	 width:80,
							     }
					],
				
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 800,
         // height: 350,
			shrinkToFit:true,
          rowheight: 300,
          hoverrows: true,
	        rownumbers: true,
          rowNum: 10,
          'cellEdit':true,
         
			pager: "#jqGridPager",
			
			
			
		});
		
	
		//$("#list4").addRowData(i+1,jsonData[i]);
	/*	if(count==0 || count==null)
		{
			*/ // $("#list4").addRowData(i,jsonData[i]);
			  
		//$("#list4").addRowData(i,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#list4").addRowData(i,jsonData[i]);
			  $("#list4").addRowData(0,jsonData.offer);
		}
		/*}
		*/

				 $('#list4').navGrid('#jqGridPager',
			                
			                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
			                
			                {
			                    editCaption: "The Edit Dialog",
			                   
			                    afterSubmit: function () {
									
			                      var grid = $("#list4"),
								  intervalId = setInterval(
									 function() {
									         grid.trigger("reloadGrid",[{current:true}]);
									   },
									   500);
			                      
								},
								
								 recreateForm: true,
								 checkOnUpdate : true,
								 checkOnSubmit : true,
				                 closeAfterEdit: true,
								
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                },
			                
			                {
			                    closeAfterAdd: true,
			                    recreateForm: true,
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                },
			                
			                {
			                	closeAfterdel:true,
			                	checkOnUpdate : true,
								checkOnSubmit : true,
								recreateForm: true,
			                	
								reloadAftersubmit:true,	
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                        
			                    
			                    }
			                		
			                });
					   });
	 			})
}

/*//grid for exam time table
function gridForExamTimeTable(){


	var params= {};
	var input1 = document.getElementById('fk_subject_id'),
    list = document.getElementById('subjectList'),
    i,fk_subject_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_subject_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	


	var subjectName = $('#fk_subject_id').val();
	var examDate = $('#examDate').val();
	var startTime = $('#startTime').val();
	var endTime = $('#endTime').val();
	var day = $('#day').val();
	
	
	params["fk_subject_id"] = fk_subject_id;
	params["day"] = day;
	params["subjectName"] = subjectName;
	params["examDate"] = examDate;
	params["startTime"] = startTime;
	params["endTime"] = endTime;
	
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getGridForExamTimeTable";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		  var jsonData = $.parseJSON(data);
			
	      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
      
	     $.each(jsonData,function(i,v)
			{
	        
	         count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
	         //count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list4").jqGrid('getGridParam','data');
		     var ids = jQuery("#list4").jqGrid('getDataIDs');
		     
		     
		 	
			  var subjectName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  subjectName = rowdata[j].subjectName;
				
				 var rowId = ids[j];
				 var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
				
				 
				if (subjectName == jsonData[i].subjectName) {
				    	
				    	newrow=false;
						//alert("Product Name Already Inserted !!!");
						var grid = jQuery("#list4");
					    grid.trigger("reloadGrid");
				    	break;
					} 
				 
				if (subjectName == jsonData.offer.subjectName) 
				{
					
				
			    	ori_quantity = +rowdata[j].quantity+1;
			    	
			    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
			    	var grid = jQuery("#list4");
			    	grid.trigger("reloadGrid");
					
					newrow = true;
			    	newrow=false;
					alert("Exam Name Already Inserted !!!");
					return false;
					var grid = jQuery("#list5");
				    grid.trigger("reloadGrid");
			    	break;
				}
				else
				{
					newrow = true;
				}
			 }
			  
			  if(newrow == true)
				 {
					
				  //$("#list4").addRowData(i,jsonData[i]);
				  $("#list4").addRowData(count,jsonData[i]);
				 // $("#list4").addRowData(count,jsonData.offer);
					
				 }
			  
			  if(count==0 || count==null)
				{
					// $("#credit").addRowData(i,jsonData[i]);
					 $("#list4").addRowData(0,jsonData[i]);
				}
		
		$("#list4").jqGrid({
			datatype: "local",
			
			colNames:['fkSubjectId','Date','Day','Start Time','End Time','Subject Name'],
			colModel:[ 
			           {
		    	 			name:'fkSubjectId',
		    	 			 hidden:true,
		    	 				width:80,
			           	},
			           	{
		    	 			name:'examDate',
		    	 				width:80,
			           	},
			           	
			           	{
		    	 			name:'weekDay',
		    	 				width:80,
			           	},
			         
					     {	name:'startTime',
					    	 width:80,
					
					     },
					     {
					    	 name:'endTime',
					    	 width:80,
					    	 
					     },
					     {
					    	 name:'subjetName',
					    	 width:80,
					     }
			],
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 800,
         // height: 350,
			shrinkToFit:true,
          rowheight: 300,
          hoverrows: true,
	        rownumbers: true,
          rowNum: 10,
          'cellEdit':true,
         
			pager: "#jqGridPager",
			
			
			
		});
		
	
		//$("#list4").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#list4").addRowData(i,jsonData[i]);
			  $("#list4").addRowData(i,jsonData[i]);
		}
		

				 $('#list4').navGrid('#jqGridPager',
			                
			                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
			                
			                {
			                    editCaption: "The Edit Dialog",
			                   
			                    afterSubmit: function () {
									
			                      var grid = $("#list4"),
								  intervalId = setInterval(
									 function() {
									         grid.trigger("reloadGrid",[{current:true}]);
									   },
									   500);
			                         
			                      
								},
								
								 recreateForm: true,
								 checkOnUpdate : true,
								 checkOnSubmit : true,
				                 closeAfterEdit: true,
								
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                },
			                
			                {
			                    closeAfterAdd: true,
			                    recreateForm: true,
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                },
			                
			                {
			                	closeAfterdel:true,
			                	checkOnUpdate : true,
								checkOnSubmit : true,
								recreateForm: true,
			                	
								reloadAftersubmit:true,	
			                    errorTextFormat: function (data) {
			                        return 'Error: ' + data.responseText
			                    }
			                		
			                });
					   });
	 			})

}*/
function ValidationOfexamTableEntry()
{
if(document.ExamTimeTable.fk_examName_id.value ==""){
	alert("Please Select Exam Name ");
	return false;
}	
if(document.ExamTimeTable.academicYear.value ==""){
	alert("Please Select Academic Year ");
	return false;
}
if(document.ExamTimeTable.fk_class_id1.value ==""){
	alert("Please Select Class Name ");
	return false;
}
if(document.ExamTimeTable.fk_division_id.value ==""){
	alert("Please Select Division Name ");
	return false;
}
if(document.ExamTimeTable.examDate.value ==""){
	alert("Please Select Exam Date ");
	return false;
}
return true;
}

function addExamTimeTable()
{
if(document.ExamTimeTable.fk_examName_id.value ==""){
	alert("Please Select Exam Name ");
	return false;
}	
if(document.ExamTimeTable.academicYear.value ==""){
	alert("Please Select Academic Year ");
	return false;
}
if(document.ExamTimeTable.fk_class_id1.value ==""){
	alert("Please Select Class Name ");
	return false;
}
if(document.ExamTimeTable.fk_division_id.value ==""){
	alert("Please Select Division Name ");
	return false;
}
if(document.ExamTimeTable.examDate.value ==""){
	alert("Please Select Exam Date ");
	return false;
}
addExamTimeTable1();
}
//adding exam time table 
function addExamTimeTable1(){


	var params = {};
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('clas'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	var input = document.getElementById('fk_examName_id'),
	list = document.getElementById('examNameId'),
	i,fkExamId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fkExamId = list.options[i].getAttribute('data-value');
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
	
	
	

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var fkSubjectId = allRowsInGrid[i].fkSubjectId;
		params["fkSubjectId"+i] = fkSubjectId;
	
		var subjetName = allRowsInGrid[i].subjetName;
		params["subjetName"+i] = subjetName;
		
		var examDate = allRowsInGrid[i].examDate;
		params["examDate"+i] = examDate;
		
		var weekDay = allRowsInGrid[i].weekDay;
		params["weekDay"+i] = weekDay;
		
		var startTime = allRowsInGrid[i].startTime;
		params["startTime"+i] = startTime;
		
		var endTime = allRowsInGrid[i].endTime;
		params["endTime"+i] = endTime;
	}

			var examName = $('#fk_examName_id').val();
			var academicYear = $('#academicYear').val();
			var className = $('#fk_class_id1').val();
			var divisionName = $('#fk_division_id').val();
			
			if(academicYear==undefined || academicYear== null || academicYear == "" ){
				academicYear="'N/A'";
			}
			if(className==undefined || className== null || className == "" ){
				className="'N/A'";
			}
			if(divisionName==undefined || divisionName== null || divisionName == "" ){
				divisionName="'N/A'";
			}
			if(fk_class_id==undefined || fk_class_id== null || fk_class_id == "" ){
				fk_class_id=0;
			}
			if(fk_division_id==undefined || fk_division_id== null || fk_division_id == "" ){
				fk_division_id=0;
			}
			document.getElementById("btn").disabled = true;
			params["count"] = count;
			params["className"] = className;
			params["classId"] = fk_class_id;
			params["examId"] = fkExamId;
			params["division"] = fk_division_id;
			params["examName"] = examName;
			params["divisionName"] = divisionName;
			params["academicYear"] = academicYear
			

 	params["methodName"] = "addExamTimeTable";
 	
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
// validation of edit exam time table
function validateeditExamTimeTable1()
{
	if(document.ExamTimeTable.fk_examName_id.value ==""){
		alert("Please Select Exam Name ");
		return false;
	}	
	if(document.ExamTimeTable.academicYear.value ==""){
		alert("Please Select Academic Year ");
		return false;
	}
	if(document.ExamTimeTable.fk_class_id1.value ==""){
		alert("Please Select Class Name ");
		return false;
	}
	if(document.ExamTimeTable.fk_division_id.value ==""){
		alert("Please Select Division Name ");
		return false;
	}
	if(document.ExamTimeTable.examDate.value ==""){
		alert("Please Select Exam Date ");
		return false;
	}	
	return true;
}




function editExamTimeTable1()
{
	if(document.ExamTimeTable.fk_examName_id.value ==""){
		alert("Please Select Exam Name ");
		return false;
	}	
	if(document.ExamTimeTable.academicYear.value ==""){
		alert("Please Select Academic Year ");
		return false;
	}
	if(document.ExamTimeTable.fk_class_id1.value ==""){
		alert("Please Select Class Name ");
		return false;
	}
	if(document.ExamTimeTable.fk_division_id.value ==""){
		alert("Please Select Division Name ");
		return false;
	}
	if(document.ExamTimeTable.examDate.value ==""){
		alert("Please Select Exam Date ");
		return false;
	}	
	editExamTimeTable2();
}

function editExamTimeTable2(){


	var params = {};
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('clas'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	var input = document.getElementById('fk_examName_id'),
	list = document.getElementById('examNameId'),
	i,fkExamId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fkExamId = list.options[i].getAttribute('data-value');
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
	
	
	

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var fkSubjectId = allRowsInGrid[i].pkExamTimeTableId;
		params["fkSubjectId"+i] = fkSubjectId;
	
		var subjetName = allRowsInGrid[i].subjetName;
		params["subjetName"+i] = subjetName;
		
		var examDate = allRowsInGrid[i].examDate;
		params["examDate"+i] = examDate;
		
		var weekDay = allRowsInGrid[i].weekDay;
		params["weekDay"+i] = weekDay;
		
		var startTime = allRowsInGrid[i].startTime;
		params["startTime"+i] = startTime;
		
		var endTime = allRowsInGrid[i].endTime;
		params["endTime"+i] = endTime;
	}

			var examName = $('#fk_examName_id').val();
			var academicYear = $('#academicYear').val();
			var className = $('#fk_class_id1').val();
			var divisionName = $('#fk_division_id').val();
			
			
			params["count"] = count;
			params["className"] = className;
			params["classId"] = fk_class_id;
			params["examId"] = fkExamId;
			params["division"] = fk_division_id;
			params["examName"] = examName;
			params["divisionName"] = divisionName;
			params["academicYear"] = academicYear
			

 	params["methodName"] = "addExamTimeTableedit";
 	
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

//report- show time table
function viewExamTimeTable(){
	var params = {};
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
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
	
	
	var input1 = document.getElementById('fk_examName_id'),
    list = document.getElementById('examNameId'),
    i,fk_exam_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_exam_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	var examn = $('#fk_examName_id').val();
	var clss = $('#fk_class_id1').val();
	var divv = $('#fk_division_id').val();
//	alert(examn+" "+clss+" "+divv);
	
	params["examn"] = examn;
	params["divv"] = divv;
	params["clss"]  = clss;
	
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["fkExamId"]= fk_exam_id;
	
	params["methodName"] = "getExamTimeTable";

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
		          	
		            {"data": "examDate", "width": "5%"},
		            {"data": "weekDay", "width": "5%"},
		            {"data": "startTime", "width": "5%"},
		            {"data": "endTime" , "width": "5%"},
		            {"data": "subjetName" , "width": "5%"},
		           
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Exam Result Report";
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

}

function validateViewStudentWiseResult()
{
	
	var className = $("#fk_class_id_Student").val();
	var divisionName = $("#fk_division_id_Student").val();
	var studentName = $("#studentName_student_result").val();
	var examName = $("#fk_examName_id_student").val();

	if(className=="")
	{
		alert("Please Select Class Name");
		return false;
	}

	if(divisionName=="")
	{
		alert("Please Select Dision Name");
		return false;
	}

	if(studentName=="")
	{
		alert("Please Select Student Name");
		return false;
	}

	if(examName=="")
	{
		alert("Please Select Exam Name");
		return false;
	}
	
	viewStudentWiseResult1();
	
}



//view student wise result report
function viewStudentWiseResult()
{
	var params = {};
	var input = document.getElementById('fk_class_id_Student'),
	list = document.getElementById('classes_Student'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input1 = document.getElementById('fk_division_id_Student'),
    list = document.getElementById('division_Student'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_division_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	
	var input1 = document.getElementById('fk_examName_id_student'),
    list = document.getElementById('examNameId_student'),
    i,fk_exam_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_exam_id = list.options[i].getAttribute('data-value');
    	}
	}
	

	
	var studentName = $("#studentName_student_result").val();

	params["studentName"]= studentName;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["fkExamId"]= fk_exam_id;
	//params["fk_Student_id"] = fk_Student_id;
	
	params["methodName"] = "getStudentWiseResult";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#StudentResult').dataTable().fnClearTable();
		var jsonData = $.parseJSON(data);
		if(data.length <= 28){
			alertify.alert("Embel Technologies says --> Data not found for your Selection.");
			 return true;
		}
		var catmap = jsonData.list;

		$(document).ready(function() {
		 var total =   $('#StudentResult').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
			
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		columns: [
		          	
		            {"data": "firstName", "width": "5%"},
		            {"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
		            {"data": "subjectName" , "width": "5%"},
		        	{"data": "passingMarks" , "width": "5%"},
		            {"data": "obtainedMarks" , "width": "5%"},
		            {"data": "totalMarks" , "width": "5%"},
		           
		        ],
		      
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Exam Result Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} )
			/*}*/;
		
	var mydata = catmap;
	$('#StudentResult').dataTable().fnAddData(mydata);
	
		}
	

	);


}

//view class wise result
function viewClassWiseResult(){

	var params = {};
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
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
	
	
	var input1 = document.getElementById('fk_examName_id'),
    list = document.getElementById('examNameId'),
    i,fk_exam_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_exam_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["fkExamId"]= fk_exam_id;
	
	params["methodName"] = "getClassWiseResult";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#classResult').dataTable().fnClearTable();
		var jsonData = $.parseJSON(data);
		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found For Your Selection.");
			 return true;
		}
		var catmap = jsonData.list;

		$(document).ready(function() {
		 var total =   $('#classResult').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		columns: [
		          	
		            {"data": "firstName", "width": "5%"},
		            {"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
		            {"data": "subjectName" , "width": "5%"},
		        	{"data": "passingMarks" , "width": "5%"},
		            {"data": "obtainedMarks" , "width": "5%"},
		            {"data": "totalMarks" , "width": "5%"},
		           
		        ],
		      
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Exam Result Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} )
			/*}*/;
		
	var mydata = catmap;
	$('#classResult').dataTable().fnAddData(mydata);
	
		}
	);
}

//to get student name as per class and div
function getSudentName(){

	var params= {};
	var input1 = document.getElementById('fk_class_id_Student'),
	list = document.getElementById('classes_Student'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	var input1 = document.getElementById('fk_division_id_Student'),
	list = document.getElementById('division_Student'),
	i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_division_id = list.options[i].getAttribute('data-value');
		}
	}

	$("#studentName_student_result").empty();
	$("#studentName_student_result").append($("<option></option>").attr("value","").text("Select Student Name"));
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	
	
	var newrow;
	var rowId;
	
	params["methodName"] = "getStudentNameAsPerClassAndDiv";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		var count=1;
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			//document.getElementById("totalAnnualFee").value = v.totalAmt;
			$("#studlist").append($("<option></option>").attr("value",(v.firstName+" "+v.middleName+" "+v.lastName)).attr("data-value",(v.pkStudentId)));
			count++;
				});
			})
		

}

//print student result
function viewStudentWiseResult1(){

	var params = {};
	var input = document.getElementById('fk_class_id_Student'),
	list = document.getElementById('classes_Student'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input1 = document.getElementById('fk_division_id_Student'),
    list = document.getElementById('division_Student'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_division_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	
	var input1 = document.getElementById('fk_examName_id_student'),
    list = document.getElementById('examNameId_student'),
    i,fk_exam_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_exam_id = list.options[i].getAttribute('data-value');
    	}
	}

	var input1 = document.getElementById('fk_Student_id'),
    list = document.getElementById('studentNameList'),
    i,fk_Student_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_Student_id = list.options[i].getAttribute('data-value');
    	}
	}

	
	var studentName = $("#studentName_student_result").val();
	params["studentName"]= studentName;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["fkExamId"]= fk_exam_id;
	params["fk_Student_id"] = fk_Student_id;
	
	
	params["methodName"] = "getStudentWiseResultPDF";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
			window.open("studentResultPDF.jsp");
			location.reload();
	
			}
		
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	})
	
}
// edit exam by kishor


function getexamdetails()
{
	var params = {};
	var input = document.getElementById('examName_id'), list = document
			.getElementById('examNameId'), i, examName_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			examName_id = list.options[i].getAttribute('data-value');
		}
	}

	$("#AcademicYear").append($("<input/>").attr("value", "").text());
	$("#fk_class_id").append($("<input/>").attr("value", "").text());
	$("#fk_division_id").append($("<input/>").attr("value", "").text());
	$("#SubjectName").append($("<input/>").attr("value", "").text());
	//$("#totalmarks").append($("<input/>").attr("value", "").text());
	//$("#Passingmarks").append($("<input/>").attr("value", "").text());
	
	

	params["examName_id"] = examName_id;
	params["methodName"] = "getExamdetailstoEdit";
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
											document.getElementById("AcademicYear").value = v.academicYear;
								//			document.getElementById("fk_class_id").value = v.className;
											//document.getElementById("fk_division_id").value = v.division;
											/*document.getElementById("SubjectName").value = v.subjectName;*/
											/*document.getElementById("totalmarks").value = v.totalMarks;
											document.getElementById("Passingmarks").value = v.passingMarks;*/
											
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}

//validation of exam details
function updateExamName1()
{
	if(document.updatedx.examName_id.value==null || document.updatedx.examName_id.value==undefined || document.updatedx.examName_id.value=="")
		{
		alert("Please Select Exam Name");
		return false;
		}
	if(document.updatedx.fk_class_id.value==null || document.updatedx.fk_class_id.value==undefined || document.updatedx.fk_class_id.value=="")
	{
	alert("Please Select Class Name");
	return false;
	}
	if(document.updatedx.fk_division_id.value==null || document.updatedx.fk_division_id.value==undefined || document.updatedx.fk_division_id.value=="")
	{
	alert("Please Select Division");
	return false;
	}
	updateExamName2();
}

function updateExamName2() {
	var params = {};
	
	var input = document.getElementById('fk_class_id'),
	list = document.getElementById('clas'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input = document.getElementById('examName_id'),
	list = document.getElementById('examNameId'),
	i,examName_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		examName_id = list.options[i].getAttribute('data-value');
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
	

	var count = jQuery("#list5").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list5').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pkexamid = allRowsInGrid[i].pkexamid;
		params["pkexamid"+i] = pkexamid;
	
		var subject = allRowsInGrid[i].subject;
		params["subject"+i] = subject;
		
		var totalMarks = allRowsInGrid[i].totalMarks;
		params["totalMarks"+i] = totalMarks;
	
		var passingMarks = allRowsInGrid[i].passingMarks;
		if(Number(passingMarks) >= Number(totalMarks))
		{		
			 var abc ="0.00"
			alert("Please Enter Passing Marks Less than Total Marks");
			
			//$("#passingMarks").jqGrid("setCell",rowId,"abc",abc);
			document.getElementById("btn1").disabled = false;
			location.reload();
			return false;			
		}
		params["passingMarks"+i] = passingMarks;
	
	}
		document.getElementById("btn").disabled = true;
		


		params["count"] = count;


	var examName_id = $('#examName_id').val();
	var AcademicYear = $('#AcademicYear').val();
	var ClassName = $('#fk_class_id').val();
	var divisionName = $('#fk_division_id').val();
	
	/*var SubjectName = $('#SubjectName').val();
	var totalmarks = $('#totalmarks').val();
	var SubjectName = $('#SubjectName').val();
	var Passingmarks = $('#Passingmarks').val();
	*///var middleName = $('#middleName').val();
	
	


	params["examName_id"] = examName_id;
	params["AcademicYear"] = AcademicYear;
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
/*	params["SubjectName"] = SubjectName;
	params["totalmarks"] = totalmarks;
	params["Passingmarks"] = Passingmarks;*/
	params["methodName"] = "updateExamDetails1";

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


//get Division by Class Name
function getDivisionNameByClassName()
{
//var type = document.getElementById('vendor').value;
	
	$("#division").empty();
	$("#division").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		var input = document.getElementById('fk_class_id1'), list = document
		.getElementById('clas'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id1').val();
	
	alert("ID  :: "+fkClassId+"\nClass  :: "+className);
	
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



//get Division by Class Name for Student Wise
function getDivisionNameByClassNameForStudentWise()
{
//var type = document.getElementById('vendor').value;
	
	$("#division_Student").empty();
	$("#division_Student").append($("<option></option>").attr("value","").text("Select product"));
	
	var params= {};
	
	
		var input = document.getElementById('fk_class_id_Student'), list = document
		.getElementById('classes_Student'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id_Student').val();
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;
	
	params["methodName"] = "getDivisionNameByClassName";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#division_Student").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}




//get Division by Class Name For Exam
function getDivisionNameByClassNameForExam()
{
//var type = document.getElementById('vendor').value;
	
	$("#division").empty();
	$("#division").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		var input = document.getElementById('fk_class_id1'), list = document
		.getElementById('clas'), i, fkRootStudentId;
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





//get Division by Class Name For Result
function getDivisionNameByClassNameForResult()
{
//var type = document.getElementById('vendor').value;
	
	$("#division_Student").empty();
	$("#division_Student").append($("<option></option>").attr("value","").text("Select product"));
	
	var params= {};
	
	
		var input = document.getElementById('fk_class_id_Student'), list = document
		.getElementById('classes_Student'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id_Student').val();
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;
	
	params["methodName"] = "getDivisionNameByClassName";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#division_Student").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}






//get Division by Class Name
function getDivisionNameByClassNameExam()
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
//Validation of Admit Card
function StudentAdmitCard()
{
	if(document.admitcard.fk_class_id_Student.value=="" || document.admitcard.fk_class_id_Student.value==null || document.admitcard.fk_class_id_Student.value==undefined)
		{		
		alert("Please Select Class Name");
		return false;
		}
	if(document.admitcard.fk_division_id_Student.value=="" || document.admitcard.fk_division_id_Student.value==null || document.admitcard.fk_division_id_Student.value==undefined)
	{		
	alert("Please Select Division");
	return false;
	}
	if(document.admitcard.studentName_student_result.value=="" || document.admitcard.studentName_student_result.value==null || document.admitcard.studentName_student_result.value==undefined)
	{		
	alert("Please Select Student Name");
	return false;
	}
	if(document.admitcard.examDate.value=="" || document.admitcard.examDate.value==null || document.admitcard.examDate.value==undefined)
	{		
	alert("Please Enter Exam Date From ");
	return false;
	}
	if(document.admitcard.examDate1.value=="" || document.admitcard.examDate1.value==null || document.admitcard.examDate1.value==undefined)
	{		
	alert("Please Enter Exam Date To");
	return false;
	}
	StudentAdmitCard1();

}
//print Admit Card Function
function StudentAdmitCard1()
{
var params= {};
	
	var input = document.getElementById('fk_class_id_Student'),
	list = document.getElementById('classes_Student'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input = document.getElementById('fk_class_id_Student'),
	list = document.getElementById('studlist'),
	i,studNameId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		studNameId = list.options[i].getAttribute('data-value');
		}
	}
	
	var className = $('#fk_class_id_Student').val();
	var divsion = $('#fk_division_id_Student').val();
	var studName = $('#studentName_student_result').val();
	var Academic = $('#academicYear').val();
	var fromDate = $('#examDate').val();
	var Todate = $('#examDate1').val();
	params["studNameId"] = studNameId;
	params["className"] = className;
	params["divsion"] = divsion;
	params["studName"] = studName;
	params["Academic"] = Academic;
	params["fromDate"] = fromDate;
	params["Todate"] = Todate;
 	params["methodName"] = "AdmitcardDetails";
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data) 
 			
 	    	{
// 			window.open("view_bonafide_certificate.jsp");
 		window.open("printAdmitCard.jsp");			
 			location.reload();
 			}
 		
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	
 	    	})		

}



//get div
/*
function getDivisionAsPerClass()
{
	var params = {};
	var input = document.getElementById('fk_class_id'), 
	list = document.getElementById('clas'), 
	i, class_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			class_id = list.options[i].getAttribute('data-value');
		}
	}

	$("#AcademicYear").append($("<input/>").attr("value", "").text());

	params["examName_id"] = examName_id;
	params["methodName"] = "getExamdetailstoEdit";
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
											document.getElementById("AcademicYear").value = v.academicYear;
											document.getElementById("fk_class_id").value = v.className;
											//document.getElementById("fk_division_id").value = v.division;
											/*document.getElementById("SubjectName").value = v.subjectName;
											document.getElementById("totalmarks").value = v.totalMarks;
											document.getElementById("Passingmarks").value = v.passingMarks;
											
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}*/

//get Exam Details to Edit

/*function getExamDetailsToEdit()
{
	var input = document.getElementById('examName_id'), 
	list = document.getElementById('examNameId'), 
	i, examId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			examId = list.options[i].getAttribute('data-value');
		}
	}

	var input = document.getElementById('fk_class_id'), 
	list = document.getElementById('clas'), 
	i, class_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			class_id = list.options[i].getAttribute('data-value');
		}
	}

	var input = document.getElementById('fk_subject_id'), 
	list = document.getElementById('subjectList'), 
	i, subId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			subId = list.options[i].getAttribute('data-value');
		}
	}

	var params= {};
	$("#totalmarks").append($("<input/>").attr("value","").text());
	$("#Passingmarks").append($("<input/>").attr("value","").text());
	
	params["subId"]= subId;
	params["examId"]= examId;
	params["class_id"]= class_id;
	
	params["methodName"] = "getexamDetailsToEdit";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				document.getElementById("totalmarks").value = v.TotalMarks;
				document.getElementById("Passingmarks").value = v.passingMarks;
								
				});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
		}
	});



}

//update Exam Details
function updateExam12()
{
	var totalmarks = $('#totalmarks').val();
	var Passingmarks = $('#Passingmarks').val();
	if(totalmarks==null || totalmarks==undefined || totalmarks=="")
	{
		totalmarks="0";
	}
	if(Passingmarks==null || Passingmarks==undefined || Passingmarks=="")
	{
		Passingmarks="0";
	}
	if(Number(Passingmarks)>Number(totalmarks))
		{
		alert("Please Enter Passing Marks less Than Total");
		return false;
		}
	var params = {};
	
	params['totalmarks'] = totalmarks;
	params['Passingmarks'] = Passingmarks;
	
	
	params["methodName"] = "updateExamsDetailas";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data)
 	    	{
			alert(data);
			location.reload();
		}
 	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});


}
*/