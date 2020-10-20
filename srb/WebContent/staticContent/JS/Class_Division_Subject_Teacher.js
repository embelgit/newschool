//Grid for subject and teacher
function getSubjectAndTeacherIntoGrid(){


	var params= {};
	var input1 = document.getElementById('fk_subject_id'),
	list = document.getElementById('subjectList'),
	i,fksubjectid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fksubjectid = list.options[i].getAttribute('data-value');
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
	var subjectName = $('#fk_subject_id').val();
	var teacherName = $('#fk_teacher_id').val();
	
	params["fkSubjectId"] = fksubjectid;
	params["subjectName"] = subjectName;
	params["teacherName"] = teacherName;
	params["fkTeacherId"] = fkteacherid;
	
	var count=0;
	var newrow;
	var rowId;
		params["methodName"] = "getSubjectTeacherNameIntoGrid";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
			  var jsonData = $.parseJSON(data);
				
		      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		     $.each(jsonData,function(i,v)
				{
		        
		    	 count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
			     var rowdata =$("#list4").jqGrid('getGridParam','data');
			     var ids = jQuery("#list4").jqGrid('getDataIDs');
				
				  var subject1,com,packing;
				  for (var j = 0; j < count; j++) 
				  {
					  subject1 = rowdata[j].subject;
					 /* com = rowdata[j].manufacturer;
					  packing = rowdata[j].weight;*/
					
					 var rowId = ids[j];
					 var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
					
					if (subject1 == jsonData[i].subject) {
				    	
				    	newrow=false;
						alert("Subject Name Already Inserted !!!");
						var grid = jQuery("#list4");
					   grid.trigger("reloadGrid");
					 
				    	return False;
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
				  document.getElementById('fk_teacher_id').value = "";
			
			$("#list4").jqGrid({
				datatype: "local",
				
				colNames:['fk Subject Id','Subject Name','fk Teacher Id','Teacher Name'],
				colModel:[ 
						     
						     {
						    	 name:'fkSubjectId',
						    	 hidden:true,
						     },
				          
	               
						     {	name:'subject',
						    	 width:150,
						
						     },
						     {
						    	 name:'fkTeacherId',
						    	 hidden:true,
						     },
				          
	               
						     {	name:'teacherName',
						    	 width:150,
						
						     },
					
				],
					
				
				sortorder : 'desc',
				loadonce: false,
				viewrecords: true,
				width: 600,
	           // height: 350,
				shrinkToFit:true,
	            rowheight: 300,
	            hoverrows: true,
		        rownumbers: true,
	            rowNum: 10,
	            'cellEdit':true,
	           
				pager: "#jqGridPager",
				
				
				
			});
			
			
			
			if(count==0 || count==null)
			{
				 // $("#list4").addRowData(i,jsonData[i]);
				  $("#list4").addRowData(0,jsonData.offer);
			}	
			//$("#list4").addRowData(i+1,jsonData[i]);
		/*	if(count==0 || count==null)
			{
				*/ // $("#list4").addRowData(i,jsonData[i]);
				  //$("#list4").addRowData(i,jsonData.offer);
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
function ClassDivisionSubjectTeacherAssoc(){
	if(document.Class.fk_class_id1.value =="" ){
		alert("Please Select Class Name ");
		return false;
	}
	if(document.Class.fk_division_id.value ==""){
		alert("Please Select Division Name ");
		return false;
	}
	/*if(document.Class.fk_subject_id.value ==""){
		alert("Please Select Subject Name ");
		return false;
	}*/
	if(document.Class.academicYear.value ==""){
		alert("Please Select Academic Year ");
		return false;
	}
	/*if(document.Class.fk_teacher_id.value ==""){
		alert("Please Select Teacher Name ");
		return false;
	}*/
	ClassDivisionSubjectTeacherAssoc1();
}
function ClassDivisionSubjectTeacherAssoc1(){
	var params = {};
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
	

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var fkSubjectId = allRowsInGrid[i].fkSubjectId;
		params["fkSubjectId"+i] = fkSubjectId;
	
		var subject = allRowsInGrid[i].subject;
		if(subject == undefined || subject == null || subject == ""){
			alert("Please Select Subject Name")
		}
		else{
			params["subject"+i] = subject;
		}
		
		
		var fkTeacherId = allRowsInGrid[i].fkTeacherId;
		params["fkTeacherId"+i] = fkTeacherId;
		
		var teacherName = allRowsInGrid[i].teacherName;
		params["teacherName"+i] = teacherName;
	}

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
			
			params["count"] = count;
			params["className"] = className;
			params["classId"] = fk_class_id;
			params["division"] = fk_division_id;
			params["divisionName"] = divisionName;
			params["academicYear"] = academicYear


 	params["methodName"] = "ClassDivisionSubjectTeacherAssoc";
 	
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



