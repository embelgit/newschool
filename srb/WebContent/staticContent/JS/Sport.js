
function validationAddSportInfo()
{
	
	
	
	var Createactivity = $('#Createactivity').val();
	var Activitydetails= $('#Activitydetails').val()
	var Organizeby = $('#Organizeby').val();
	var otherdetails = $('#otherdetails').val();
	
	if(Createactivity=="")
	{
		alert("Please enter create activity name");
		return false;
	}
	
	if(Activitydetails=="")
	{
		alert("Please enter activity details");
		return false;
	}
	if(Organizeby=="")
	{
		alert("Please enter Organizeby");
		return false;
	}
	if(otherdetails=="")
	{
		alert("Please enter Other details");
		return false;
	}
	
	addSportInfo();
	
}

function addSportInfo()
{
var params = {};
	
	document.getElementById("btn").disabled = true;

	var Createactivity = $('#Createactivity').val();
	var Activitydetails= $('#Activitydetails').val();
	
	var Organizeby = $('#Organizeby').val();
	var otherdetails= $('#otherdetails').val();
	
	if(Organizeby=="")
	{
		Organizeby = "N/A";
	}
	
	if(otherdetails=="")
	{
		otherdetails = "N/A";
	}
	
	params["Createactivity"] = Createactivity;
	params["Activitydetails"] = Activitydetails;
	
	params["Organizeby"] = Organizeby;
	params["otherdetails"] = otherdetails;

	
params["methodName"] = "SportInfo";
 	
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
		 	
		 		alert(data)
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
function getSportDetails(){
	
	var params = {};
	
	
	
	var input = document.getElementById('PkSportId'), list = document
			.getElementById('CreateactivityNameList'), i, PkSportId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			PkSportId = list.options[i].getAttribute('data-value');
		}
	}
	
	$("#activityName2").append($("<input/>").attr("value","").text());
	$("#Activitydetails").append($("<input/>").attr("value", "").text());
	$("#Organizeby").append($("<input/>").attr("value", "").text());
	$("#otherdetails").append($("<input/>").attr("value", "").text());
	
	params["PkSportId"] = PkSportId;
	
	params["methodName"] = "getSportDetailToEdit";
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
											document.getElementById("activityName2").value = v.Createactivity;
											document.getElementById("Activitydetails").value = v.Activitydetails;
											document.getElementById("Organizeby").value = v.Organizeby;
											document.getElementById("otherdetails").value = v.otherdetails;
											
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

	
}
// get  sport grid 
function getSportIntoGrid(){
	



		var params= {};
		/*var input1 = document.getElementById('fk_Student_id'),
		list = document.getElementById('studentNameList'),
		i,fk_Student_id;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_Student_id = list.options[i].getAttribute('data-value');
			}
		}*/
		
		var input1 = document.getElementById('fk_class_id'),
		list = document.getElementById('classId'),
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
		
		//var studentName = $('#fk_Student_id').val();
		/*var teacherName = $('#fk_teacher_id').val();
		*/
		//params["fk_Student_id"] = fk_Student_id;
		params["fk_class_id"] = fk_class_id;
		params["fk_division_id"] = fk_division_id;
		/*params["subjectName"] = subjectName;
		params["teacherName"] = teacherName;
		params["fkTeacherId"] = fkteacherid;
		*/
		var count=0;
		var newrow;
		var rowId;
			params["methodName"] = "getSportNameIntoGrid";
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
					
					colNames:['PkSportid','first Name','Middle Name','Last Name','Lose','Win','Award'],
					colModel:[ 
							     
							     {
							    	 name:'PkSportid',
							    	 width:150,
							    	 hidden:true
							    	 
							     },
					          
		               
							     {	name:'firstName',
							    	 width:150,
							
							     },
							     {	
							    	 name:'middleName',
							    	 width:150,
							     },
					          
		               
							     {	name:'LastName',
							    	 width:150,
							
							     },
							     {	name:'Lose',
							    	 width:150,
							    	 editable:true
							
							     },
							     {	name:'win',
							    	 width:150,
							    	 editable:true
							
							     },
							     {	name:'Award',
							    	 width:150,
							    	 editable:true
							
							     },
						
					],
						
					
					sortorder : 'desc',
					loadonce: false,
					viewrecords: true,
					width: 900,
		           // height: 350,
					shrinkToFit:true,
		            rowheight: 200,
		            hoverrows: true,
			        rownumbers: true,
		            rowNum: 10,
		            'cellEdit':true,
		           
					pager: "#jqGridPager",
					
					
					
				});
				
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
				    	
				    	//newrow=false;
						//alert("Subject Name Already Inserted !!!");
						var grid = jQuery("#list4");
					   grid.trigger("reloadGrid");
					 
				    	//return False;
					}
					else
					{
						newrow = true;
					}
				   }
				
			
				//$("#list4").addRowData(i+1,jsonData[i]);
			/*	if(count==0 || count==null)
				{
					*/ // $("#list4").addRowData(i,jsonData[i]);
					  $("#list4").addRowData(i,jsonData.offer);
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
//update sport Info
function updateSportInfo(){
var params = {};
	
var input = document.getElementById('PkSportId'),
list = document.getElementById('CreateactivityNameList'),
	i,fkRootSportId;
 		for (i = 0; i < list.options.length; ++i) {
		     if (list.options[i].value === input.value) {
		    	 fkRootSportId = list.options[i].getAttribute('data-value');
		     }
 		}
	//var Createactivity = $('#PkSportId').val();
 	var Createactivity = $('#activityName2').val();	
	var Activitydetails= $('#Activitydetails').val();
	var Organizeby = $('#Organizeby').val();
	var otherdetails= $('#otherdetails').val();
		
	/*params["Createactivity"] = Createactivity;*/
	params["sportId"] = fkRootSportId;
	params["Createactivity"] = Createactivity;
	params["Activitydetails"] = Activitydetails;
	
	params["Organizeby"] = Organizeby;
	params["otherdetails"] = otherdetails;

	
params["methodName"] = "UpdateSportInfo";
 	
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
function addSportInfoDetails()
{
if(document.schoolFormName.PkSportId.value == "")	
	{
	alert("Please Select Activity Name");
	return false;
	}
	
	 if(document.schoolFormName.SportParticipant.value == "")	
	{
	alert("Please Select Sport Participant Name");
	return false;
	}
	if(document.schoolFormName.startdate.value == "")	
	{
	alert("Please Select Start Date");
	return false;
	}

	if(document.schoolFormName.enddate.value == "")	
	{
	alert("Please Select End Date");
	return false;
	}
	fk_class_id
	if(document.schoolFormName.fk_class_id.value == "")	
	{
	alert("Please Select Class Name");
	return false;
	}
	if(document.schoolFormName.fk_division_id.value == "")	
	{
	alert("Please Select Division Name");
	return false;
	}
	/*if(document.schoolFormName.fk_Student_id.value == "")	
	{
	alert("Please Select Student Name");
	return false;
	}*/
	
	addSportInfoDetails1()
}


function addSportInfoDetails1()
{
	var params = {};
	
	
	 var input = document.getElementById('fk_division_id'),
     list = document.getElementById('division'),
     	i,fkRootdivId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootdivId = list.options[i].getAttribute('data-value');
			     }
	 		}




 var input = document.getElementById('fk_class_id'),
     list = document.getElementById('classId'),
     	i,fkRootclassId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootclassId = list.options[i].getAttribute('data-value');
			     }
	 		}



	 		
	 		 var input = document.getElementById('PkSportId'),
	 		     list = document.getElementById('CreateactivityNameList'),
	 		     	i,fkRootsportId;
	 			 		for (i = 0; i < list.options.length; ++i) {
	 					     if (list.options[i].value === input.value) {
	 					    	fkRootsportId = list.options[i].getAttribute('data-value');
	 					     }
	 			 		}
	
	
	
	
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var PkSportid = allRowsInGrid[i].PkSportid;
		params["PkSportid"+i] = PkSportid;
	
		var firstName = allRowsInGrid[i].firstName;
		params["firstName"+i] = firstName;
		
		var middleName = allRowsInGrid[i].middleName;
		params["middleName"+i] = middleName;
	
		var LastName = allRowsInGrid[i].LastName;
		params["LastName"+i] = LastName;

		var Lose = allRowsInGrid[i].Lose;
		if(Lose==undefined || Lose== null || Lose == "" ){
			alert("Enter Lose Status")
			return false;
		}
		else{
			params["Lose"+i] = Lose;
		}
		
		var win = allRowsInGrid[i].win;
		if(win==undefined || win== null || win == "" ){
			alert("Enter Win Status")
			return false;
		}
		else{
			params["win"+i] = win;
		}
		
		
		var Award = allRowsInGrid[i].Award;
		params["Award"+i] = Award;
	}
	
	params["count"] = count;
	if(count==0){
		alert("No data")
		return false;
	}
	
    var SportParticipant =$('#SportParticipant').val();
	var PkSportId = $('#PkSportId').val();
	var startdate = $('#startdate').val();
	var enddate = $('#enddate').val();
	var fk_division_id = $('#fk_division_id').val();
	var fk_class_id = $('#fk_class_id').val();
	

	
	

	 		
	 params ["PkSportId"] = fkRootsportId;
	 params["SportParticipant"]=SportParticipant;
	 params["startdate"] = startdate;
	 params["enddate"] = enddate;
	 params["fk_division_id"] = fkRootdivId;
	 params["fk_class_id"] = fkRootclassId;

	 
 	params["methodName"] = "addStoreManagementParticipantDetails";
 	
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
						$("#division").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

