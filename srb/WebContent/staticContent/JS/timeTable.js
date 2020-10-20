//get grid for daily time table 
function gridForDailyTimeTable(){

	var params= {};
	var input1 = document.getElementById('fk_subject_id'),
    list = document.getElementById('subjectList'),
    i,fk_subject_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_subject_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_teacher_id = list.options[i].getAttribute('data-value');
		}
	}

	
/*	var input1 = document.getElementById('fk_class_id1'),
	list = document.getElementById('clas'),
	i,fk_class_id1;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_class_id1 = list.options[i].getAttribute('data-value');
		}
	}
	

	var input1 = document.getElementById('fk_division_id'),
	list = document.getElementById('clas'),
	i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_division_id = list.options[i].getAttribute('data-value');
		}
	}*/

	var subjectName = $('#fk_subject_id').val();
	var teacherName = $('#fk_teacher_id').val();
	var startTime = $('#startTime').val();
	var endTime = $('#endTime').val();
	var academicYear = $('#academicYear').val();
	var classname  = $('#fk_class_id1').val();
	var DivisionName = $('#fk_division_id').val();

	params["fk_subject_id"] = fk_subject_id;
	params["fk_teacher_id"] = fk_teacher_id;
	params["subjectName"] = subjectName;
	params["teacherName"] = teacherName;
	params["startTime"] = startTime;
	params["endTime"] = endTime;
	params["fk_class_id1"] = fk_class_id1;
	params["fk_division_id"] = fk_division_id;
	params["academicYear"] =  academicYear;
	params["fk_class_id1"] = classname;
	params["fk_division_id"] = DivisionName;
	
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getDailyTimeTableIntoGrid";
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
				  startTime = rowdata[j].startTime;
				
				 var rowId = ids[j];
				 var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
				
				if (subjectName == jsonData.offer.subjetName) 
				{
					
				
			    	/*ori_quantity = +rowdata[j].quantity+1;
			    	
			    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
			    	var grid = jQuery("#list4");
			    	grid.trigger("reloadGrid");*/
					
					
			    	newrow=false;
					alert("Subject Name Already Inserted !!!");
					return false;
					var grid = jQuery("#list4");
				    grid.trigger("reloadGrid");
			    	break;
				}
				else if(startTime == jsonData.offer.startTime){
					newrow=false;
					alert("Start Time Already Inserted !!!");
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
			  
		
		$("#list4").jqGrid({
			datatype: "local",
			
			colNames:['fkSubjectId','fkTeacherId','Start Time','End Time','Subject Name','Teacher Name'],
			colModel:[ 
			           {
		    	 			name:'fkSubjectId',
		    	 			 hidden:true,
		    	 				width:80,
			           	},
			            {
		    	 			name:'fkTeacherId',
		    	 			 hidden:true,
		    	 				width:80,
			           	},
			         
					     {	name:'startTime',
					    	 width:30,
					    	 //editable:true,
					     },
					     {
					    	 name:'endTime',
					    	 //editable:true,
					    	 width:30,
					    	 
					     },
					     {
					    	 name:'subjetName',
					    	 editable:false,
					    	 width:60,
					     },
					     {
					    	 name:'teacherName',
					    	 editable:false,
					    	 width:60,
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

// Edit 
function EditgridForDailyTimeTable()
{
	

	var params= {};
	var input1 = document.getElementById('fk_subject_id'),
    list = document.getElementById('subjectList'),
    i,fk_subject_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_subject_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_teacher_id = list.options[i].getAttribute('data-value');
		}
	}

	
	var input1 = document.getElementById('fk_class_id1'),
	list = document.getElementById('clas'),
	i,fk_class_id1;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_class_id1 = list.options[i].getAttribute('data-value');
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

	//var subjectName = $('#fk_subject_id').val();
	//var teacherName = $('#fk_teacher_id').val();
	var startTime = $('#startTime').val();
	var endTime = $('#endTime').val();
	var academicYear = $('#academicYear').val();
	var classname  = $('#fk_class_id1').val();
	var DivisionName = $('#fk_division_id').val();

	params["fk_subject_id"] = fk_subject_id;
	params["fk_teacher_id"] = fk_teacher_id;
	//params["subjectName"] = subjectName;
	//params["teacherName"] = teacherName;
	params["startTime"] = startTime;
	params["endTime"] = endTime;
	params["fk_class_id1"] = fk_class_id1;
	params["fk_division_id"] = fk_division_id;
	params["academicYear"] =  academicYear;
	//params["fk_class_id1"] = classname;
	//params["fk_division_id"] = DivisionName;
	
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getEditDailyTimeTableIntoGrid";
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
			
			colNames:['fkSubjectId','fkTeacherId','Start Time','End Time','Subject Name','Teacher Name'],
			/*colNames:['Start Time','End Time','Subject Name','Teacher Name'],*/
			colModel:[ 
			           {
		    	 			name:'fkSubjectId',
		    	 			 hidden:true,
		    	 				width:80,
			           	},
			            {
		    	 			name:'fkTeacherId',
		    	 			 hidden:true,
		    	 				width:80,
			           	},
			         
					     {	name:'startTime',
					    	 width:30,
					    	 editable:true,
					     },
					     {
					    	 name:'endTime',
					    	 editable:true,
					    	 width:30,
					    	 
					     },
					     {
					    	 name:'subjetName',
					    	 editable:true,
					    	 width:60,
					     },
					     {
					    	 name:'teacherName',
					    	 editable:true,
					    	 width:60,
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


//daily time table validation
function dailyTimeTableVal()
{	
	if(document.dailyTimeTable.fk_class_id1.value == "")
	{
		alert("Please Enter Class Name.");
		return false;
	}
	if(document.dailyTimeTable.fk_division_id.value == "")
	{
		alert("Please Enter Division Name.");
		return false;
	}
	if(document.dailyTimeTable.academicYear.value == "")
	{
		alert("Please Enter Academic Year.");
		return false;
	}
	if(document.dailyTimeTable.day.value == "")
	{
		alert("Please Please Select Day");
		return false;
	}
	/*if(document.dailyTimeTable.fk_subject_id.value == "")
	{
		alert("Please Enter Subject Name.");
		return false;
	}
	if(document.dailyTimeTable.fk_teacher_id.value == "")
	{
		alert("Please Enter teacher Name.");
		return false;
	}*/
	addDailyTimeTable();
}

//add daily time table 
function addDailyTimeTable(){

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
	
		var subjetName = allRowsInGrid[i].subjetName;
		params["subjetName"+i] = subjetName;
		
		var fkTeacherId = allRowsInGrid[i].fkTeacherId;
		params["fkTeacherId"+i] = fkTeacherId;
		
		var teacherName = allRowsInGrid[i].teacherName;
		params["teacherName"+i] = teacherName;
		
		var startTime = allRowsInGrid[i].startTime;
		params["startTime"+i] = startTime;
		
		var endTime = allRowsInGrid[i].endTime;
		params["endTime"+i] = endTime;
	}

			var day = $('#day').val();
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
			params["academicYear"] = academicYear;
			params["day"] = day;

 	params["methodName"] = "addDailyTimeTable";
 	
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

//report- view daily time table
function viewDailyTimeTable(){
	


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
	
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	
	params["methodName"] = "getDailyTimeTable";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#studentOne').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alertify.alert("Embel Technologies says --> Data not found your Selection.");
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
		        "bPaginate": false,
		      
		columns: [
		          	{"data": "weekDay", "width": "5%" },   
		            {"data": "startTime", "width": "5%"},
		            {"data": "endTime", "width": "5%"},
		            {"data": "subjetName" , "width": "5%"},
		            {"data": "teacherName" , "width": "5%"},
		           
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Daily Time Table Report";
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

function viewTableTimeAsPerDay(){
	var params = {};
	var input = document.getElementById('fk_class_id_day_wise'),
	list = document.getElementById('classDayWise'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input1 = document.getElementById('fk_division_id_day_wise'),
    list = document.getElementById('division_day_wise'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_division_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	var day = $("#day").val();
	//params["academicYear"]= academicYear;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["day"]= day;
	
	params["methodName"] = "getDayWiseDailyTimeTable";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#dayWise').dataTable().fnClearTable();
		
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
		 var total =   $('#dayWise').DataTable( {
			 
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
		          	{"data": "weekDay", "width": "5%"},
		            {"data": "startTime", "width": "5%"},
		            {"data": "endTime", "width": "5%"},
		            {"data": "subjetName" , "width": "5%"},
		            {"data": "teacherName" , "width": "5%"},
		           
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Daily Time Table Day Wise Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		} );
		
	var mydata = catmap;
	$('#dayWise').dataTable().fnAddData(mydata);
	}
	);
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



//get Division by Class Name
function getDivisionNameByClassNameBalanceReport()
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




//get Division by Class Name By Day Wise
function getDivisionNameByClassNameForDayWise()
{
//var type = document.getElementById('vendor').value;
	
	$("#division_day_wise").empty();
	$("#division_day_wise").append($("<option></option>").attr("value","").text("Select product"));
	
	var params= {};
	
	
		var input = document.getElementById('fk_class_id_day_wise'), list = document
		.getElementById('classDayWise'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
		
	var className = $('#fk_class_id_day_wise').val();
	
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;
	
	params["methodName"] = "getDivisionNameByClassName";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#division_day_wise").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}





//get Division by Class Name
function getDivisionNameByClassNameDailyTimeTable()
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
//Book Entry Details 
function viewBookEntryDetails(){
	
	
	var params = {};
	var input = document.getElementById('supplierName'),
	list = document.getElementById('dealerName_drop'),
	i,fk_Supplier_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_Supplier_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	
	
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_Supplier_id"]= fk_Supplier_id;
	//params["fk_division_id"]= fk_division_id;
	//params["fk_Student_id"] = fk_Student_id;
	
	params["methodName"] = "getBookEntryDetails";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#studentOneTwo').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alertify.alert("Embel Technologies says --> Data not found your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		/*$(document).ready(function() {
		    
		} );
		*/
		
		$(document).ready(function() {
		 var total =   $('#studentOneTwo').DataTable( {
			 
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
		        "bPaginate": false,
		      
		columns: [
		          	{"data": "pkBookEntryManagementId", "width": "5%" },   
		            {"data": "billNo", "width": "5%"},
		            {"data": "supplierName", "width": "5%"},
		            {"data": "insertDate" , "width": "5%"},
		            {"data": "bookName" , "width": "5%"},
		            {"data": "authorName" , "width": "5%"},
		            {"data": "publisherName" , "width": "5%"},
		            {"data": "buyPrice" , "width": "5%"},
		            {"data": "quantity" , "width": "5%"},
		            {"data": "Total" , "width": "5%"},
		           
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Daily Time Table Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#studentOneTwo').dataTable().fnAddData(mydata);
	
		}
	

	);

	
	
	
}


//get student details for book issue
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

	$("#fk_Student_id").empty();
	$("#fk_Student_id").append($("<option></option>").attr("value","").text("Select Student Name"));
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
			$("#fk_Student_id").append($("<option></option>").attr("value",v.pkStudentId).text(v.firstName+" "+v.middleName+" "+v.lastName));
				});
			})
}




//get student details for book return
function getStudentDetailsAsPerClassAdDivisionBookReturn(){
	var params= {};
	var input1 = document.getElementById('fk_class_id_day_wise'),
	list = document.getElementById('classDayWise'),
	i,fk_class_id_day_wise;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_class_id_day_wise = list.options[i].getAttribute('data-value');
		}
	}

	var input1 = document.getElementById('fk_division_id_day_wise'),
	list = document.getElementById('division_day_wise'),
	i,fk_division_id_day_wise;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_division_id_day_wise = list.options[i].getAttribute('data-value');
		}
	}

	$("#fk_Student_idReturn").empty();
	$("#fk_Student_idReturn").append($("<option></option>").attr("value","").text("Select Student Name"));
	params["fk_class_id"] = fk_class_id_day_wise;
	params["fk_division_id"] = fk_division_id_day_wise;
	
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
			$("#fk_Student_idReturn").append($("<option></option>").attr("value",v.pkStudentId).text(v.firstName+" "+v.middleName+" "+v.lastName));
				});
			})
}

//getting all Student Issue Details
function viewBookIsuueDetails()
{
	

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
	
	/*var input1 = document.getElementById('fk_Student_id');
    list = document.getElementById('studentNameList'),
    i,fk_Student_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_Student_id = list.options[i].getAttribute('data-value');
    	}
	}*/
	
	var fk_Student_id = $("#fk_Student_id").val();
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["fk_Student_id"] = fk_Student_id;
	
	params["methodName"] = "getBookIssueDetailsReports";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#studentOne').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alertify.alert("Embel Technologies says --> Data not found your Selection.");
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
		        "bPaginate": false,
		      
		columns: [
		          	{"data": "FirstName", "width": "5%" },   
		            {"data": "middleName", "width": "5%"},
		            {"data": "LastName", "width": "5%"},
		            {"data": "BookIssueDate" , "width": "5%"},
		            {"data": "BookReturnDate" , "width": "5%"},
		            {"data": "bookName" , "width": "5%"},
		            {"data": "autherName" , "width": "5%"},
		            {"data": "PublisherName" , "width": "5%"},
		            {"data": "Quantity" , "width": "5%"},
		           
		        ],
		    	
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Daily Time Table Report";
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

//get Book Student Book Return Details 

function ViewStudentBookReturn(){
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
	
	/*var input1 = document.getElementById('fk_Student_idReturn'),
    list = document.getElementById('studentNameList'),
    i,fk_Student_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_Student_id = list.options[i].getAttribute('data-value');
    	}
	}*/
	
	
	var fk_Student_idReturn = $("#fk_Student_idReturn").val();
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["fk_Student_id"] = fk_Student_idReturn;
	
	params["methodName"] = "getBookReturnDetailsReports";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#dayWise').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alertify.alert("Embel Technologies says --> Data not found your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		/*$(document).ready(function() {
		    
		} );
		*/
		
		$(document).ready(function() {
		 var total =   $('#dayWise').DataTable( {
			 
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
		        "bPaginate": false,
		      
		columns: [
		          	{"data": "FirstName", "width": "5%" },   
		            {"data": "middleName", "width": "5%"},
		            {"data": "LastName", "width": "5%"},
		            {"data": "BookIssueDate" , "width": "5%"},
		            {"data": "BookReturnDate" , "width": "5%"},
		            {"data": "bookName" , "width": "5%"},
		            {"data": "autherName" , "width": "5%"},
		            {"data": "PublisherName" , "width": "5%"},
		            {"data": "Quantity" , "width": "5%"},
		           
		        ],
		    	
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Daily Time Table Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#dayWise').dataTable().fnAddData(mydata);
	
		}
	

	);

}
//get Employee Book Issue 
function viewBookEmployeeIsuueDetails()
{
	var params = {};
	var input = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_teacher_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	
	
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_teacher_id"]= fk_teacher_id;
	//params["fk_division_id"]= fk_division_id;
	//params["fk_Student_id"] = fk_Student_id;
	
	params["methodName"] = "getEmployeeBookEntryDetails";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#studentOneThree').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alertify.alert("Embel Technologies says --> Data not found your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		/*$(document).ready(function() {
		    
		} );
		*/
		
		$(document).ready(function() {
		 var total =   $('#studentOneThree').DataTable( {
			 
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
		        "bPaginate": false,
		      
		columns: [
		          	{"data": "srNo", "width": "5%" },   
		            {"data": "firstName", "width": "5%"},
		            {"data": "MiddleName", "width": "5%"},
		            {"data": "LastName", "width": "5%"},
		            {"data": "BookIssueDate" , "width": "5%"},
		            {"data": "BookRetutndate" , "width": "5%"},
		            {"data": "bookName" , "width": "5%"},
		            {"data": "authorName" , "width": "5%"},
		            {"data": "publisherName" , "width": "5%"},
		           /* {"data": "buyPrice" , "width": "5%"},*/
		            {"data": "quantity" , "width": "5%"},
		         /*   {"data": "Total" , "width": "5%"},*/
		           
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Daily Time Table Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#studentOneThree').dataTable().fnAddData(mydata);
	
		}
	

	);


}
//get Employee Book Return 
function viewEmployeeBookReturnIsuueDetails()
{
	
	var params = {};
	var input = document.getElementById('fk_teacher_idReeturn'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_teacher_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	
	
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_teacher_id"]= fk_teacher_id;
	//params["fk_division_id"]= fk_division_id;
	//params["fk_Student_id"] = fk_Student_id;
	
	params["methodName"] = "getEmployeeBookReturnDetails";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#studentOneFour').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alertify.alert("Embel Technologies says --> Data not found your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		/*$(document).ready(function() {
		    
		} );
		*/
		
		$(document).ready(function() {
		 var total =   $('#studentOneFour').DataTable( {
			 
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
		        "bPaginate": false,
		      
		columns: [
		          	{"data": "srNo", "width": "5%" },   
		            {"data": "firstName", "width": "5%"},
		            {"data": "MiddleName", "width": "5%"},
		            {"data": "LastName", "width": "5%"},
		            {"data": "BookIssueDate" , "width": "5%"},
		            {"data": "BookRetutndate" , "width": "5%"},
		            {"data": "bookName" , "width": "5%"},
		            {"data": "authorName" , "width": "5%"},
		            {"data": "publisherName" , "width": "5%"},
		           /* {"data": "buyPrice" , "width": "5%"},*/
		            {"data": "quantity" , "width": "5%"},
		         /*   {"data": "Total" , "width": "5%"},*/
		           
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Daily Time Table Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#studentOneFour').dataTable().fnAddData(mydata);
	
		}
	

	);





}



//


function getDivisionNameByClass()
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
	
	params["methodName"] = "getDivisionNameClass";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#divId").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.fkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

//

function deltimetable(){

	
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
	
		params["methodName"] = "deletetimetableDetails";
		
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