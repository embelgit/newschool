//grid for book entry
function getBookDetailIntoGrid(){
	 /*if(document.bookEntryForm.bookName.value=="" ||document.bookEntryForm.bookName.value==null){
		 alert("Please Enter Book Name")
		 return false;
	 }*/
	getBookIntoGrid();
}

function getBookIntoGrid(){
	
	var params= {};
	var count=0;
	var newrow;
	var rowId;

	var bookName = $('#bookName').val();
	params["bookName"]=bookName;
	params["methodName"] ="gridForBookEnrtyInLibraryManagement";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		  var jsonData = $.parseJSON(data);
			
	     $.each(jsonData,function(i,v)
			{
	    	 
	         count = jQuery("#list44").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list44").jqGrid('getGridParam','data');
		     var ids = jQuery("#list44").jqGrid('getDataIDs');

			
			  var prodName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].productName;
					
				 var rowId = ids[j];
				 var rowData = jQuery('#list44').jqGrid ('getRowData', rowId);
				
				if (prodName == jsonData.offer.productName) {
			    	newrow=true;
					//alert("Book Name Already Inserted !!!");
					var grid = jQuery("#list44");
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
				  $("#list44").addRowData(count,jsonData.offer);
					
				 }
			  document.getElementById('bookName').value = "";

		
		$("#list44").jqGrid({
			datatype: "local",
			
			colNames:['Book Name','Author Name','Publisher Name','Buy Price','Quantity','Total'],
			colModel:[ 
				
               
			     {	name:'bookName',
			    	 width:150,
					
				},
				 {	name:'authorName',
			    	 width:150,
			    	 editable: true
				},
				
				 {	name:'publisherName',
			    	 width:150,
			    	 editable: true
				},
				
	/*		     {	name:'supplierName',
			    	 width:150,
			    	 editable: true
				},
				*/
				
				{	name:'buyPrice',
			    	 width:150,
			    	 editable: true
				},
			       
			   
				{	name:'quantity',
					width:100,
					editable: true
					
				},
				{	name:'total',
					width:100,
				}
				
			],
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 1000,
            //height: 350,
			shrinkToFit:true,
            rowheight: 300,
            hoverrows: true,
	        rownumbers: true,
            rowNum: 10,
            'cellEdit':true,
            
            
            
         	 afterSaveCell: function  grossTotal() {
			       /* 	Calculation of total after editing quantity*/
			        	   
			        	   // $(this).trigger('reloadGrid');
         		 
		 					var rowId =$("#list44").jqGrid('getGridParam','selrow');  
		 					var rowData = jQuery("#list44").getRowData(rowId);
                    
/*			        	   var rowId =$("#list4").jqGrid('getGridParam','selrow');  
	                       var rowData = jQuery("#list4").getRowData(rowId);*/
	                       
	                    	var quantity = rowData['quantity'];
	                    	var buyPrice = rowData['buyPrice'];
	                    	
	                    	var authorName = rowData['authorName'];
	                    	var publisherName = rowData['publisherName'];
	                    	
	                    	if(quantity !=""){
	                    		var Decs = /^[0-9]+$/;
	                    		if(quantity.match(Decs))
	                    		{}
	                    		else {
	                    			
	                    				var buy ="0";
										alert("Please enter number in quantity");
			//							$("#jqGrid").jqGrid("setCell",rowId, "quantity", buy);
										location.reload();
	//								    $("#list44").jqGrid("reloadGrid");
										return false;
	                    			

	                    		}
	                    		
	                    	}
	                    	if(buyPrice !=""){
	                    		var Decs = /^[0-9]+$/;
	                    		if(buyPrice.match(Decs))
	                    		{}
	                    		else {
                    				var buy ="0";
	                    			alert("Please enter number in buy price");
				//					$("#jqGrid").jqGrid("setCell",rowId, "buyPrice", buy);
									location.reload();
//	                    		    $("#list44").jqGrid("reloadGrid");
									return false;
	                    		}             		
	                    	}
	                    	
	                    	if(authorName !="")
							{
							var Decs = /^[a-zA-Z, ]+$/;
							//var Decs = /^[yY, ]+$/;
							if(authorName.match(Decs))
							{}
							else
							{
								var setDesc="";
								alert("Please Enter  Alphabates In Author Name ....");
								location.reload();
				//				$("#jqGrid").jqGrid("setCell",rowId, "authorName", setDesc);
		//					    $("#list44").jqGrid("reloadGrid");
								return false;
								
							}
							}
							
	                    	if(publisherName !="")
							{
							var Decs = /^[a-zA-Z, ]+$/;
							
							if(publisherName.match(Decs))
							{}
							else
							{
								var setDesc="";
								alert("Please Enter  Alphabates In Publisher Name ....");
								location.reload();
					//			$("#jqGrid").jqGrid("setCell",rowId, "publisherName", setDesc);
						
			//				    $("#list44").jqGrid("reloadGrid");
								return false;
								
							}
							}
	                    	
	                    	var tota = quantity * buyPrice;
                    		$("#list44").jqGrid("setCell", rowId, "total", tota);
                    		
                    		var Total =0;
                    		var count = jQuery("#list44").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#list44').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		var Total1 = allRowsInGrid1[k].total;
        		        		if(Total1 != null){
        		        			Total = Total + Total1;
        		        		}
        		        		//Total = +Total + +Total1;
        		        	}
        		        	document.getElementById("grossTotal").value = Total;
	                    	
	        	},
           
			pager: "#jqGridPager",
			
			
			
		});
		
	
		//$("#list4").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#list4").addRowData(i,jsonData[i]);
			  $("#list44").addRowData(0,jsonData.offer);
		}
		

     
		 $('#list44').navGrid('#jqGridPager',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	               {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#list44"),
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
	                
	                /*       {
	                	closeAfterdel:true,
	                	checkOnUpdate : true,
						checkOnSubmit : true,
						recreateForm: true,
	                	
						reloadAftersubmit:true,	
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    }*/
                    
					// options for the Delete Dialogue
	                {
	                	closeAfterdel:true,
	                	checkOnUpdate : true,
						checkOnSubmit : true,
						recreateForm: true,
						

						afterComplete : function() {
						
							
							
							  var rowId =$("#list44").jqGrid('getGridParam','selrow');  
		                       var rowData = jQuery("#list44").getRowData(rowId);
		                       
		                    	var quantity = rowData['quantity'];
		                    	var buyPrice = rowData['buyPrice'];
		                    	
		                    	var tota = quantity * buyPrice;
	                    		$("#list44").jqGrid("setCell", rowId, "total", tota);
	                    		
	                    		var Total =0;
	                    		var count = jQuery("#list44").jqGrid('getGridParam', 'records');
	        		        	var allRowsInGrid1 = $('#list44').getGridParam('data');
	        		        	var AllRows=JSON.stringify(allRowsInGrid1);
	        		        	for (var k = 0; k < count; k++) {
	        		        		var Total1 = allRowsInGrid1[k].total;
	        		        		Total = +Total + +Total1;
	        		        	}
	        		        	document.getElementById("grossTotal").value = Total;
		                    	

						},
	                	
						reloadAftersubmit:true,	
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                    },
						
						onSelectRow : function(
								id) {
							if (id
									&& id !== lastSel) {
								jQuery(
										"#list44")
										.saveRow(
												lastSel,
												true,
												'clientArray');
								jQuery(
										"#list44")
										.editRow(
												id,
												true);
								lastSel = id;
								console
										.log(id);
							}
						}
	                		
	                });
		 
		 
			   });
			
		})
}

// adding Paper Details in Grid Details

function getPaperDtailsGrid(){
	
	var params= {};
	var count=0;
	var newrow;
	var rowId;

	var bookName = $('#PaperName').val();
	params["PaperName"]=PaperName;
	params["methodName"] ="GridForPaperEntry";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		  var jsonData = $.parseJSON(data);
			
	     $.each(jsonData,function(i,v)
			{
	    	 
	         count = jQuery("#list5").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list5").jqGrid('getGridParam','data');
		     var ids = jQuery("#list5").jqGrid('getDataIDs');
			 
			
			  var prodName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].productName;
				
				 var rowId = ids[j];
				 var rowData = jQuery('#list5').jqGrid ('getRowData', rowId);
				
				if (prodName == jsonData.offer.productName) {
			    	newrow=true;
					//alert("Book Name Already Inserted !!!");
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
			  document.getElementById('bookName').value = "";

		
		$("#list5").jqGrid({
			datatype: "local",
			
			colNames:['Book Name','Author Name','Publisher Name','Buy Price','Quantity','Total'],
			colModel:[ 
				
               
			     {	name:'bookName',
			    	 width:150,
					
				},
				 {	name:'authorName',
			    	 width:150,
			    	 editable: true
				},
				
				 {	name:'publisherName',
			    	 width:150,
			    	 editable: true
				},
				
	/*		     {	name:'supplierName',
			    	 width:150,
			    	 editable: true
				},
				*/
				
				{	name:'buyPrice',
			    	 width:150,
			    	 editable: true
				},
			       
			   
				{	name:'quantity',
					width:100,
					editable: true
					
				},
				{	name:'total',
					width:100,
				}
				
			],
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 1000,
            //height: 350,
			shrinkToFit:true,
            rowheight: 300,
            hoverrows: true,
	        rownumbers: true,
            rowNum: 10,
            'cellEdit':true,
         	 afterSaveCell: function  grossTotal() {
			       /* 	Calculation of total after editing quantity*/
			        	   
			        	   // $(this).trigger('reloadGrid');
			        	   var rowId =$("#list5").jqGrid('getGridParam','selrow');  
	                       var rowData = jQuery("#list5").getRowData(rowId);
	                    	var quantity = rowData['quantity'];
	                    	var buyPrice = rowData['buyPrice'];
	                    	
	                    	var tota = quantity * buyPrice;
                    		$("#list5").jqGrid("setCell", rowId, "total", tota);
                    		
                    		var Total =0;
                    		var count = jQuery("#list5").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#list5').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		var Total1 = allRowsInGrid1[k].total;
        		        		Total = +Total + +Total1;
        		        	}
        		        	document.getElementById("grossTotal").value = Total;
	                    	
	        	},
           
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
function addBookDetail(){
	if(document.bookEntryForm.billNo.value == ""){
		
		alert("Please Enter Bill No");
		return false;
	}

	if(document.bookEntryForm.supplierName.value == ""){
		alert("Please Select  Supplier Name");
		return false;
	}
	/*if(document.bookEntryForm.bookName.value ==""){
		alert("Please Enter Book Name");
		return false;
	}*/
	addBookDetail1();
	
}
//Book entry
function addBookDetail1(){
	//document.bookEntryForm.btn.disabled = true;
	var params = {};
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	
	if(count < 1)
	{
	alert("Please Enter book Name ");
	document.getElementById("save").disabled = false;
	return false;
	}
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var bookName = allRowsInGrid[i].bookName;
		params["bookName"+i] = bookName;
	
		var authorName = allRowsInGrid[i].authorName;
		params["authorName"+i] = authorName;
		
		var publisherName = allRowsInGrid[i].publisherName;
		params["publisherName"+i] = publisherName;
		
/*		var supplierName = allRowsInGrid[i].supplierName;
		params["supplierName"+i] = supplierName;
		
*/	
		var buyPrice = allRowsInGrid[i].buyPrice;
		params["buyPrice"+i] = buyPrice;
	
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i] = quantity;

		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
	}
	
	 params["count"] = count;
	 
	 
		var input1 = document.getElementById('supplierName'),
		list = document.getElementById('dealerName_drop'),
		i,fk_Supplier_id;

		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input1.value) 
			{
				fk_Supplier_id = list.options[i].getAttribute('data-value');
			}
		}
	 
	 
	 var supplierName = $('#supplierName').val();
	 var grossTotal = $('#grossTotal').val();
	 var billNo = $('#billNo').val();
	 
	 
	 params["billNo"] = billNo;
	 params["fk_Supplier_id"] = fk_Supplier_id;
	 params["supplierName"] = supplierName;
	 params["grossTotal"] = grossTotal;
//	 alert("fk_Supplier_id - "+fk_Supplier_id);
	 
 	params["methodName"] = "addBookEntryManagementDetails";
 	
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

//get student details for book issue
function getStudentDetailsAsPerClassAdDivisionForBookIssue(){
	//document.formForBookIssue.btn1.disabled = true;
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

//get student details for book return
function getStudentDetailsAsPerClassAdDivisionForBookReturn(){
	//document.formForBookReturn.btn2.disabled = true;
	var params= {};
	var input1 = document.getElementById('fk_class_id_return'),
	list = document.getElementById('classes_return'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	var input1 = document.getElementById('fk_division_id_return'),
	list = document.getElementById('division_return'),
	i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_division_id = list.options[i].getAttribute('data-value');
		}
	}

	$("#studName_return").empty();
	$("#studName_return").append($("<option></option>").attr("value","").text("Select Student Name"));
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
			$("#studName_return").append($("<option></option>").attr("value",v.pkStudentId).text(v.firstName+" "+v.middleName+" "+v.lastName));
				});
			})
		
}


// get Boook Name for Datewise

function getDateForBookWIse()
{
	var params= {};
	var input1 = document.getElementById('fk_class_id_return'),
	list = document.getElementById('classes_return'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	var input1 = document.getElementById('fk_division_id_return'),
	list = document.getElementById('division_return'),
	i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_division_id = list.options[i].getAttribute('data-value');
		}
	}

	
	
	/*var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
	var BookissueDateReturn = new Date(2008,01,12);
	var BookReturneDateReturn = new Date(2008,01,22);

	var diffDays = Math.round(Math.abs((BookissueDateReturn.getTime() - BookReturneDateReturn.getTime())/(oneDay)));
	alert(diffDays);*/

	$("#BookissueDateReturn").empty();
	//$("#BookissueDate").append($("<input/>").attr("value", "").text());
	//$("#BookReturneDate").append($("<input/>").attr("value", "").text());
	$("#BookissueDateReturn").append($("<option></option>").attr("value","").text("Select Student Name"));
	$("#BookReturneDateReturn").append($("<option></option>").attr("value","").text("Select Student Name"));
	
	
	var fkStudentId = $('#studName_return').val();
	var bookNameId = $('#bookNameForReturn').val();
	params["bookNameId"]=bookNameId;
	params["studentId"] = fkStudentId;
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getStudentDateAsPerClassAndDiv";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			document.getElementById("BookissueDateReturn").value = v.bookissueDate;
			document.getElementById("BookReturneDateReturn").value = v.BookreturnDate;
			//$("#studName_return").append($("<option></option>").attr("value",v.pkStudentId).text(v.firstName+" "+v.middleName+" "+v.lastName));
				});
			})	


}
//Teacher Book Return By Kishor 
function getDateForBookWIseForTeacher()
{
	var params= {};
	var input1 = document.getElementById('fk_teacher_idReturn'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_idReturn;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_teacher_idReturn = list.options[i].getAttribute('data-value');
		}
	}


	


	$("#TeacherBookissueDatereturn").empty();
	//$("#BookissueDate").append($("<input/>").attr("value", "").text());
	//$("#BookReturneDate").append($("<input/>").attr("value", "").text());
	$("#TeacherBookissueDatereturn").append($("<option></option>").attr("value","").text("Select Student Name"));
	$("#TeacherBookReturneDatereturnExp").append($("<option></option>").attr("value","").text("Select Student Name"));
	params["fk_teacher_idReturn"] = fk_teacher_idReturn;
	//params["fk_division_id"] = fk_division_id;
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getStudentDateAsPerTeacherwise";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			document.getElementById("TeacherBookissueDatereturn").value = v.bookissueDate;
			document.getElementById("TeacherBookReturneDatereturnExp").value = v.BookreturnDate;
			//$("#studName_return").append($("<option></option>").attr("value",v.pkStudentId).text(v.firstName+" "+v.middleName+" "+v.lastName));
				});
			})	


}

//get date Diffference  by kishor 

function getDateForBookWIse1()
{
	var params= {};
	var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
	var BookissueDateReturn = $('#BookissueDateReturn').val();
	//var fk_class_id_return = $("#fk_class_id_return").val();
	var BookReturneDateReturn = $('#BookReturneDateReturn').val();
	var BookReturneDateNew = $('#BookReturneDateNew').val();
	
	
	var BookissueDateReturn = new Date(BookissueDateReturn);
	var BookReturneDateReturn = new Date(BookReturneDateReturn);
	var BookReturneDateNew = new Date(BookReturneDateNew);

	var diffDays = Math.round(Math.abs((BookissueDateReturn.getTime() - BookReturneDateNew.getTime())/(oneDay)));
	//alert(diffDays);
	var days = 7;
	var Fix = 2 ;
	var newTotal = Number(days) - Number(diffDays) ; 
	if(Number)
	var FinalTotal = -Number(newTotal) * Number(Fix);
	
	//alert(FinalTotal);
	document.getElementById("LateCharges").value = FinalTotal;
	
} 
//get all book detail for issue
function getBookNameForIssue(){

	$("#bookNameForIssue").empty();
	$("#bookNameForIssue").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	params["methodName"] = "getAllBookNameForDropdown";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{// var count = 1;
			
		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				{
			$("#bookNameForIssue").append($("<option></option>").attr("value",v.pkBookId).text("Book Name= "+v.bookName + ",Author Name= "+v.authorName+",Publisher Name= "+v.publisherName+",Suplier Name= "+v.supplierName+",Quantity= "+v.quantity)); 
				//count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

//get all book detail for return
function getBookNameForReturn(){

	$("#bookNameForReturn").empty();
	$("#bookNameForReturn").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	var fkStudentId = $('#studName_return').val();
	params["studentId"] = fkStudentId;
	params["methodName"] = "getAllBookNameForDropdownForReturn";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{// var count = 1;
			
		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				{
			$("#bookNameForReturn").append($("<option></option>").attr("value",v.pkBookId).text("Book Name= ,"+v.bookName + ",Author Name= ,"+v.authorName+",Publisher Name= ,"+v.publisherName+",Suplier Name= ,"+v.supplierName+",Issued Quantity= ,"+v.quantity)); 
				//count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


// get all Teacher Book details 
function getBookNameForReturnTeacher(){

	var params= {};
	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_teacher_id = list.options[i].getAttribute('data-value');
		}
	}
	$("#TeacherbookNameForReturnEmployeeNew").empty();
	$("#TeacherbookNameForReturnEmployeeNew").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	var fkStudentId = $('#fk_teacher_id').val();
	params["studentId"] = fkStudentId;
	params["fk_teacher_id"] = fk_teacher_id;
	params["methodName"] = "getAllBookNameForDropdownForReturnTeacher";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{// var count = 1;
			
		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				{
			$("#TeacherbookNameForReturnEmployeeNew").append($("<option></option>").attr("value",v.pkBookId).text("Book Name= ,"+v.bookName + ",Author Name= ,"+v.authorName+",Publisher Name= ,"+v.publisherName+",Suplier Name= ,"+v.supplierName+",Issued Quantity= ,"+v.quantity)); 
				//count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

// get all teacher book Name by Teacher Id 
function getBookNameForReturnTeacherBook()
{
	
	var params= {};
	var input1 = document.getElementById('fk_teacher_idReturn'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_idReturn;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_teacher_idReturn = list.options[i].getAttribute('data-value');
		}
	}
	$("#employeebookNameForReturnEMployee").empty();
	$("#employeebookNameForReturnEMployee").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	//var fkStudentId = $('#fk_teacher_id').val();
	//params["studentId"] = fkStudentId;
	params["fk_teacher_idReturn"] = fk_teacher_idReturn;
	params["methodName"] = "getAllBookNameForDropdownForReturnTeacherBook";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{// var count = 1;
			
		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				{
			$("#employeebookNameForReturnEMployee").append($("<option></option>").attr("value",v.pkBookId).text("Book Name= ,"+v.bookName + ",Author Name= ,"+v.authorName+",Publisher Name= ,"+v.publisherName+",Suplier Name= ,"+v.supplierName+",Issued Quantity= ,"+v.quantity)); 
				//count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});






}

//grid for book issue
function getBookDetailForIssueGrid(){
	var params= {};
	

	var bookNameId = $('#bookNameForIssue').val();
	params["bookNameId"]=bookNameId;
	params["methodName"] ="getBookDetailForIssue";
	/*var count=0;
	var newrow;
	var rowId;*/

	var count = 0;
	var proCount = 0;
	var newrow;
	var rowId;
	var cmpQty;
	var NewCount;
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
		//	$.post('/srb/JSP/utility/controller.jsp',itemparams,function(data)
			
			{ 
		
		//$.post('/processSoft/jsp/utility/controller.jsp',itemparams,function(data) {
		var jsonData = $.parseJSON(data);
		
		$.each(jsonData,function(i, v)
				
		{
			
		
			 count = jQuery("#gridForBookIssue").jqGrid('getGridParam', 'records'); 
			
		     var rowdata =$("#gridForBookIssue").jqGrid('getGridParam','data');
		     var ids = jQuery("#gridForBookIssue").jqGrid('getDataIDs');
		     
		     var rowId = $("#gridForBookIssue").jqGrid('getGridParam','selrow');
				var rowData = jQuery("#gridForBookIssue").getRowData(rowId);
				var ids = jQuery("#gridForBookIssue").jqGrid('getDataIDs');
				 //NewCount = jQuery("#gridForBookIssue").jqGrid('getGridParam', 'records'); 
				
		    var BooName ;
			var Quantt;
			var GridQty;
			var pkId;
			var Qty = 1;
			var NewQty;
			for (var j = 0; j < count; j++)
			{
				
				pkId = rowdata[j].pkBookId;
				Quantt = rowdata[j].Quantity;
				BooName =  rowdata[j].bookName;
				GridQty = rowdata[j].quantityInGrid;
				authorName = rowdata[j].authorName;
				publisherName =   rowdata[j].publisherName;
				pknewId = rowdata[j].pkBookId;
				//var newpkid = jsonData.offer.pkBookId;

				var rowId = ids[j];
				var rowData = jQuery('#gridForBookIssue').jqGrid('getRowData',rowId);				
				
				//alert("v.bookName ===> "+v.bookName);
				//alert("pkId ==> "+pkId+"\nv.pkBookId ==> "+v.pkBookId);
				if (pkId == bookNameId) 
				{
			    	/*ori_quantity = +rowdata[j].quantity+1;	
			    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
			    	var grid = jQuery("#list4");
			    	grid.trigger("reloadGrid");*/
					
			    	newrow=false;
					alert("Book Name Already Inserted !!!");
					var grid = jQuery("#gridForBookIssue");
				    grid.trigger("reloadGrid");
			    	break;
				}
				else
				{
					newrow = true;
				}
				
				
				if(pkId == v.pkBookId)
				{
					proCount++;
					//alert(BooName+"     "+proCount+" == "+Quantt);
					if(proCount == Quantt)
					{
						alert("Book Name Quantity Is Less Than You Have Selected");
						newrow = false;
						return false;
					}					
				}
				else
				{
					newrow = true;
				}
				
				
				
			}


			//alert(newrow);
		   
		  
		     
			if (newrow == true)
			{
				//$("#gridForBookIssue").addRowData(count,jsonData.offer);
				  $("#gridForBookIssue").addRowData(0,jsonData[i]);
			}
//			document.getElementById("bookNameForIssue").value = "";
			
			$("#gridForBookIssue").jqGrid({  
				datatype:"local",
			

				colNames: ['pkBookStockId','Book Name','Author Name','Publisher Name','Quantity','Supplier Name','Quantity','quantityInGrid'],
				
				/*colNames: ['pkBookStockId','Book Name','Author Name','Publisher Name','Supplier Name'],*/

				colModel: [ 
								{	name:'pkBookId',
									 width:40,
									 hidden:true
								},
						     {	name:'bookName',
						    	 width:150,
								
							},
							 {	name:'authorName',
						    	 width:150,
						    	 editable: true
							},
							
							 {	name:'publisherName',
						    	 width:150,
						    	 editable: true
							},
							{	name:'quantityInGrid',
								width:100,
								//editable: true
								 hidden:true
							},
							
						     {	name:'supplierName',
						    	 width:150,
						    	 //editable: true
						    	 hidden:true
							},
							 {	name:'Quantity',
						    	 width:150,
						    	 //editable: true
						    	 hidden:true
							},
							 {	name:'quantityInGrid',
						    	 width:150,
						    	 //editable: true
						    	 hidden:true
							}
						   
							
				           ],


				           sortorder : 'desc',
				           loadonce: true,
				           viewrecords: true,
				           width: 900,
				          // height: 250,
				           shrinkToFit :true,
				           rowheight: 300,
				            hoverrows: true,
					        rownumbers: true,
				            rowNum: 10,
				          
				            'cellEdit':true,
				        
				       	 afterSaveCell: function  grossTotal() {
						       /* 	Calculation of total after editing quantity*/
						        	   
						        	   // $(this).trigger('reloadGrid');
						        	   var rowId =$("#gridForBookIssue").jqGrid('getGridParam','selrow');  
				                       var rowData = jQuery("#gridForBookIssue").getRowData(rowId);
				                    	
				                       	var quantityInGrid = rowData['quantityInGrid'];
				                    	var pkBookId = rowData['pkBookId'];
				                    	var bookName = rowData['bookName'];
				                    	var Quantt = rowData['Quantity'];
				                    	var GridQty = rowData['quantityInGrid'];
				                    	
				                         var newQty;
				                         
				                    	
				                         newQty = Number(Quantity) - Number(GridQty);
				                         alert(newQty);
				                    	
				                    	
				        	},

				        	  pager: "#jqGridPagerForBookIssue",
				           
			});

			count = jQuery("#gridForBookIssue").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#gridForBookIssue").jqGrid('getGridParam','data');
		     var ids = jQuery("#gridForBookIssue").jqGrid('getDataIDs');

		/*	if (count == 0 || count == null) {
				// $("#list4").addRowData(i,jsonData[i]);
				$("#gridForBookIssue").addRowData(0,
						jsonData.offer);
			}
			newrow = true;*/
			
			 if(count == null || count == 0 )
			 {
				  //alert("1st row");
				  $("#gridForBookIssue").addRowData(0,jsonData[i]);	
				  proCount++;
			 }
/*		     if(newrow == true)
			 {
	
			  $("#gridForBookIssue").addRowData(count,jsonData[i]);
				
			 }  
*/			  
			
			
			$('#gridForBookIssue').navGrid('#jqGridPagerForBookIssue',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					{
						
						afterSaveCell: function () {
							  $(this).trigger('reloadGrid');
						},
						editCaption: "The Edit Dialog",
						recreateForm: true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfteredit: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						}
					},
					// options for the Delete Dialogue
					{
						closeAfterdel:true,
						recreateForm: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						},
						
						

						onSelectRow: function(id) {
							if (id && id !== lastSel) {
								jQuery("#gridForBookIssue").saveRow(lastSel, true, 'clientArray');
								jQuery("#gridForBookIssue").editRow(id, true);
								
								lastSel = id;
								console.log(id);
							}
						}
						
						
					});
					});

			})
		
		/*var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i, v) {
							count = jQuery("#gridForBookIssue").jqGrid('getGridParam', 'records');
							var rowdata = $("#gridForBookIssue").jqGrid('getGridParam', 'data');
							var ids = jQuery("#gridForBookIssue").jqGrid('getDataIDs');

							var prodName;
							for (var j = 0; j < count; j++) {
								prodName = rowdata[j].productName;

								var rowId = ids[j];
								var rowData = jQuery('#gridForBookIssue').jqGrid('getRowData',rowId);

								if (prodName == jsonData.offer.productName) {

									newrow = false;
									alert("Product Name Already Inserted !!!");
									var grid = jQuery("#gridForBookIssue");
									grid.trigger("reloadGrid");
									break;
								} else {
									if(count > 0){
										alert("Product Name Already Inserted !!!");
										return false;
									}else {
									newrow = true;
									}
								}
							}

							if (newrow == true) {
								$("#gridForBookIssue").addRowData(count,
										jsonData.offer);
							}

							$("#gridForBookIssue").jqGrid({ datatype : "local",
								
								colNames: ['pkBookStockId','Book Name','Author Name','Publisher Name','Quantity','Supplier Name'],
								colNames: ['pkBookStockId','Book Name','Author Name','Publisher Name','Supplier Name'],

								colModel: [ 
												{	name:'pkBookId',
													 width:40,
													 hidden:true
												},
										     {	name:'bookName',
										    	 width:150,
												
											},
											 {	name:'authorName',
										    	 width:150,
										    	 editable: true
											},
											
											 {	name:'publisherName',
										    	 width:150,
										    	 editable: true
											},
											{	name:'quantityInGrid',
												width:100,
												//editable: true
												 hidden:true
											},
											
										     {	name:'supplierName',
										    	 width:150,
										    	 //editable: true
										    	 hidden:true
											},
									
										   
											
								           ],

												sortorder : 'desc',
												loadonce : false,
												viewrecords : true,
												width : 950,
												shrinktofit : true,
												rowheight : 300,
												hoverrows : true,
												rownumbers : true,
												rowNum : 10,
												'cellEdit' : true,
												
													
												
												afterSaveCell : function()
												{
													document.getElementById("discountAmount1").value = 0;
													document.getElementById("discount1").value = 0;
													document.getElementById("hamaliExpence3").value = 0;
													document.getElementById("hamaliExpence1").value = 0;
														
													// $(this).trigger('reloadGrid');
													var rowId = $("#gridForBookIssue").jqGrid('getGridParam','selrow');
													var rowData = jQuery("#gridForBookIssue").getRowData(rowId);
													var okquantity = rowData['okquantity'];
													//cmpQty = rowData['okquantity'];
													var count1 = jQuery("#gridForBookIssue").jqGrid('getGridParam','records');
													
													var pkBookId = rowData['pkBookId'];		
													var bookName =rowData['bookName'];
													var quantityInGrid =rowData['quantityInGrid'];
													var   operation =rowData['operation'];
													var TaxAmount = rowData['TaxAmount'];
													var buyPrice = rowData['buyPrice'];
													var gst = rowData['Gst'];
													var Igst = rowData['IGst'];
													var vatAmt = 0;
													var discount = 0;
													var tota = 0;
													var totAmt = 0;
													var ids = jQuery("#gridForBookIssue").jqGrid('getDataIDs');
													
													
													var okquantity1 = rowData['okquantity1'];
													if(Number(okquantity) > Number(okquantity1))
													{
														alert("Available Stock ="+okquantity1);
														$("#gridForBookIssue").jqGrid("setCell",rowId,"okquantity",okquantity1);	
														return false;
													}
													
													
												
												
													
												
												
											
										

												},

												pager : "#jqGridPagerForBookIssue",

											});

							$("#gridForBookIssue").addRowData(i+1,jsonData[i]);
							if (count == 0 || count == null) {
								 $("#gridForBookIssue").addRowData(i,jsonData[i]);
								//$("#gridForBookIssue").addRowData(0,jsonData.offer);
							}

							$('#gridForBookIssue').navGrid('#jqGridPagerForBookIssue',

											{
												edit : true,
												add : false,
												del : true,
												search : true,
												refresh : true,
												view : true,
												position : "left",
												cloneToTop : false
											},

											{
												editCaption : "The Edit Dialog",

												afterSubmit : function() {

													var grid = $("#gridForBookIssue"), intervalId = setInterval(
															function() {
																grid
																		.trigger(
																				"reloadGrid",
																				[ {
																					current : true
																				} ]);
															},
															500);

												},

												recreateForm : true,
												checkOnUpdate : true,
												checkOnSubmit : true,
												closeAfterEdit : true,

												errorTextFormat : function(
														data) {
													return 'Error: '
															+ data.responseText
												}
											},

											{
												closeAfterAdd : true,
												recreateForm : true,
												errorTextFormat : function(
														data) {
													return 'Error: '
															+ data.responseText
												}
											},

											{
												closeAfterdel : true,
												recreateForm : true,
												afterSubmit : function() {
													$('#list4')
															.trigger(
																	'reloadGrid');
												},
												errorTextFormat : function(
														data) {
													return 'Error: '
															+ data.responseText
												},
												afterComplete : function() {
													$('#gridForBookIssue')
															.trigger(
																	'reloadGrid');

													// $(this).trigger('reloadGrid');
													var rowId = $(
															"#gridForBookIssue")
															.jqGrid(
																	'getGridParam',
																	'selrow');
													var rowData = jQuery(
															"#gridForBookIssue")
															.getRowData(
																	rowId);
													var count = jQuery(
															"#gridForBookIssue")
															.jqGrid(
																	'getGridParam',
																	'records');
													var itemName = rowData['productName'];
													var bundel = rowData['bundel'];
													var quantity = rowData['quantity'];
													
												},

												onSelectRow : function(
														id) {
													if (id
															&& id !== lastSel) {
														jQuery(
																"#gridForBookIssue")
																.saveRow(
																		lastSel,
																		true,
																		'clientArray');
														jQuery(
																"#gridForBookIssue")
																.editRow(
																		id,
																		true);
														lastSel = id;
														console
																.log(id);
													}
												}

											});

						});*/
	/*})*/
}

//get grid for book return
function getBookDetailGridForBookReturn(){

	var params= {};
	var count=0;
	var newrow;
	var rowId;

	var StudentNameId = $('#studName_return').val();
	var BookReturneDateNew = $('#BookReturneDateNew').val();
	params["studName_return"]=StudentNameId;
	params["BookReturneDateNew"] = BookReturneDateNew;
	
	params["methodName"] ="getBookDetailForReturn";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{ 
		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				{
			$("#gridForBookReturn").jqGrid({
				datatype:"local",

				/*colNames: ['Book Name','Author Name','Publisher Name','Supplier Name','Quantity'],*/
				colNames: ['Book Name','Author Name','Publisher Name','Supplier Name','Quantity','BookIssuedate','BookReturnDate','Late Charges','Status','pkbookissueid'],

				colModel: [ 
						     {	name:'bookName',
						    	 width:100,
								
							},
							 {	name:'authorName',
						    	 width:100,
						    	 editable: true
							},
							
							 {	name:'publisherName',
						    	 width:100,
						    	 editable: true
							},
							
						     {	name:'supplierName',
						    	 width:100,
						    	 //editable: true
						    	 hidden: true
							},
					
						   
							{	name:'quantityInGrid',
								width:100,
								//editable: true
								hidden: true
								
							},
							{	name:'BookIssuedate',
								width:100,
								//editable: true
								//hidden: true
								
							},
							{	name:'BookReturnDate',
								width:100,
								//editable: true
								//hidden: true
								
							},
							{	name:'DateDifference',
								width:100,
								//editable: true
								hidden: true
								
							},
							{	name:'Status',
								width:100,
								editable: true
								//hidden: true
								
							},
							{	name:'pkBookId',
								width:100,
								//editable: true
								hidden: true
								
							},
				           ],


				           sortorder : 'desc',
				           
				           loadonce: true,
				           viewrecords: true,
				           width: 1000,
				          // height: 250,
				           shrinkToFit :true,
				           rowNum: 10,

				           pager: "#jqGridPagerForBookReturn",
				           'cellEdit':true,
				           afterSaveCell: function  grossTotal() {
						        	//Calculation of total after editing quantity
						        	   
						        	   // $(this).trigger('reloadGrid');
						        	   var rowId =$("#gridForBookReturn").jqGrid('getGridParam','selrow');  
				                       var rowData = jQuery("#gridForBookReturn").getRowData(rowId);
				                    	var Status = rowData['Status'];
				                    	//var buyPrice = rowData['buyPrice'];
				                    	
				                    	/*var tota = quantity * buyPrice;
				                    	$("#jqGrid").jqGrid("setCell", rowId, "Total", tota);*/
				                    	
				                    	/*if(Status !="")
										{
										//var Decs = /^[a-zA-Z, ]+$/;
										var Decs = /^[yY, ]+$/;
										if(Status.match(Decs))
										{}
										else
										{
											//var setDesc="abc";
											alert("Please Enter  Alphabates In Grid Status....");
											//location.reload();
											//$("#jqGrid").jqGrid("setCell",rowId, "description", setDesc);	
											return false;
										}
									}*/
				                    	
//				                    	if(Status != 'Y' && Status != 'y')
				                    	/*if(Status != "yes" || Status != "no")
				                    	{
				                    			var setStatus = null;
				                    			alert("Enter values in 'Yes or no' ")
				                    			$("#gridForBookReturn").jqGrid("setCell",rowId, "Status", setStatus);
				                    			return false;
				                    			
				                    		}*/
				                    	
				                    	if(Status == 'Y' || Status == 'y' || Status == 'N' || Status == 'n')
				                    		{
				                    		
				                    		}
				                    	else
				                    	{
				                    			var setStatus = null;
				                    			alert("Enter values in 'Y or N' ")
				                    			$("#gridForBookReturn").jqGrid("setCell",rowId, "Status", setStatus);
				                    			return false;
				                    			
				                    	}
				                    	
				                    	
				        	}
				           
				           
			});

			count = jQuery("#gridForBookReturn").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#gridForBookReturn").jqGrid('getGridParam','data');
		     var ids = jQuery("#gridForBookReturn").jqGrid('getDataIDs');
			 
 
		     var BooName;
				for (var j = 0; j < count; j++) {
					BooName = rowdata[j].bookName;

					var rowId = ids[j];
					var rowData = jQuery('#gridForBookReturn').jqGrid('getRowData',rowId);

					if (BooName == jsonData.offer.bookName) {

						newrow = false;
						alert("Book Name Already Inserted !!!");
						var grid = jQuery("#gridForBookReturn");
						grid.trigger("reloadGrid");
						break;
					} else {
						if(count > 0){
							alert("Book Name Already Inserted !!!");
							return false;
						}else {
						newrow = true;
						}
					}
				}
				/*newrow = true;
				if (newrow == true) {
					//$("#employeegridForBookReturn").addRowData(count,jsonData.offer);
					 $("#employeegridForBookReturn").addRowData(count,jsonData[i]);
				
				}
				if(count==0 || count==null)
				{
					 $("#gridForBookIssue").addRowData(0,jsonData[i]);
				}*/
				 $("#gridForBookReturn").addRowData(count,jsonData[i]);
		     
			$('#gridForBookReturn').navGrid('#jqGridPagerForBookReturn',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					{
						
						afterSaveCell: function () {
							  $(this).trigger('reloadGrid');
						},
						editCaption: "The Edit Dialog",
						recreateForm: true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfteredit: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						}
					},
					// options for the Delete Dialogue
					{
						closeAfterdel:true,
						recreateForm: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						},

						onSelectRow: function(id) {
							if (id && id !== lastSel) {
								jQuery("#gridForBookReturn").saveRow(lastSel, true, 'clientArray');
								jQuery("#gridForBookReturn").editRow(id, true);
								
								lastSel = id;
								console.log(id);
							}
						}
						
						
					});
					});

			})

}
// get all Teacher Book Issue ENtry
function getBookDetailGridForBookReturnTeacher()
{
	
	var params= {};
	var count=0;
	var proCount = 0;
	var newrow;
	var rowId;

	var bookNameId = $('#TeacherbookNameForReturnEmployeeNew').val();
	params["bookNameId"]=bookNameId;
	params["methodName"] ="getBookDetailForReturnForTeacher";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{ 
		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				{
			
			

			 count = jQuery("#TeachergridForBookReturn").jqGrid('getGridParam', 'records'); 
			
		     var rowdata =$("#TeachergridForBookReturn").jqGrid('getGridParam','data');
		     var ids = jQuery("#TeachergridForBookReturn").jqGrid('getDataIDs');
		     
		     var rowId = $("#TeachergridForBookReturn").jqGrid('getGridParam','selrow');
				var rowData = jQuery("#TeachergridForBookReturn").getRowData(rowId);
				var ids = jQuery("#TeachergridForBookReturn").jqGrid('getDataIDs');
				 //NewCount = jQuery("#gridForBookIssue").jqGrid('getGridParam', 'records'); 
				
		    var BooName ;
			var Quantt;
			var GridQty;
			var pkId;
			var Qty = 1;
			var NewQty;
			for (var j = 0; j < count; j++)
			{
				
				pkId = rowdata[j].pkBookId;
				Quantt = rowdata[j].Quantity;
				BooName =  rowdata[j].bookName;
				GridQty = rowdata[j].quantityInGrid;
				authorName = rowdata[j].authorName;
				publisherName =   rowdata[j].publisherName;
				pknewId = rowdata[j].pkBookId;
				//var newpkid = jsonData.offer.pkBookId;

				var rowId = ids[j];
				var rowData = jQuery('#TeachergridForBookReturn').jqGrid('getRowData',rowId);				
				
				//alert("v.bookName ===> "+v.bookName);
				//alert("pkId ==> "+pkId+"\nv.pkBookId ==> "+v.pkBookId);
				
/*				if(pkId == v.pkBookId)
				{
					proCount++;
					//alert(BooName+"     "+proCount+" == "+Quantt);
					if(proCount == Quantt)
					{
						alert("Book Name Quantity Is Less Than You Have Selected");
						newrow = false;
						return false;
					}					
				}*/
				if (pkId == bookNameId) 
				{
			    	/*ori_quantity = +rowdata[j].quantity+1;	
			    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
			    	var grid = jQuery("#list4");
			    	grid.trigger("reloadGrid");*/
					
			    	newrow=false;
					alert("Book Name Already Inserted !!!");
				/*	var grid = jQuery("#gridForBookIssue");
				    grid.trigger("reloadGrid");
			    	break;*/
					return false;
				}
				else
				{
					newrow = true;
				}
				
				
				
			}


			//alert(newrow);
		   
		  
		     
			if (newrow == true)
			{
				//$("#gridForBookIssue").addRowData(count,jsonData.offer);
				  $("#TeachergridForBookReturn").addRowData(0,jsonData[i]);
			}
			
			document.getElementById("TeacherbookNameForReturnEmployeeNew").value ="";
			
//			$("#TeacherbookNameForReturnEmployeeNew").empty();

			$("#TeachergridForBookReturn").jqGrid({
				datatype:"local",

				/*colNames: ['Book Name','Author Name','Publisher Name','Supplier Name','Quantity'],*/
				colNames: ['pkBookStockId','Book Name','Author Name','Publisher Name','Supplier Name','Quantity','Quantity'],

				colModel: [ 
							{	name:'pkBookId',
								 width:40,
								 hidden:true
							},
						    {	   name:'bookName',
						    	 width:100,
								
							},
							 {	name:'authorName',
						    	 width:100,
						    	 editable: true
							},
							
							 {	name:'publisherName',
						    	 width:100,
						    	 editable: true
							},
							
						     {	name:'supplierName',
						    	 width:100,
						    	 //editable: true
						    	 hidden: true
							},
					
						   
							{	name:'quantityInGrid',
								width:100,
								//editable: true
								hidden: true
								
							},
							{	name:'Quantity',
								width:100,
								//editable: true
								hidden: true
								
							}
				           ],


				           sortorder : 'desc',
				           
				           loadonce: true,
				           viewrecords: true,
				           width: 1000,
				          // height: 250,
				           shrinkToFit :true,
				           rowNum: 10,

				           pager: "#TeacherjqGridPagerForBookReturn",
				           'cellEdit':true,
				  /*         afterSaveCell: function  grossTotal() {
						        	Calculation of total after editing quantity
						        	   
						        	   // $(this).trigger('reloadGrid');
						        	   var rowId =$("#jqGrid").jqGrid('getGridParam','selrow');  
				                       var rowData = jQuery("#jqGrid").getRowData(rowId);
				                    	var quantity = rowData['quantity'];
				                    	var buyPrice = rowData['buyPrice'];
				                    	
				                    	var tota = quantity * buyPrice;
				                    	$("#jqGrid").jqGrid("setCell", rowId, "Total", tota);
				        	}*/
				           
				           
			});

			count = jQuery("#TeachergridForBookReturn").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#TeachergridForBookReturn").jqGrid('getGridParam','data');
		     var ids = jQuery("#TeachergridForBookReturn").jqGrid('getDataIDs');
			 
			
			 /* var prodName,com,packing;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].productName;
				
				
				 var rowId = ids[j];
				 var rowData = jQuery('#gridForBookIssue').jqGrid ('getRowData', rowId);
				
				if (prodName == jsonData[i].productName) {
			    	
			    	newrow=false;
					alert("Book Name Already Inserted !!!");
					var grid = jQuery("#jqGrid");
				    grid.trigger("reloadGrid");
			    	break;
				}
				else
				{
					newrow = true;
				}
			   }*/
		    /* newrow = true;
			  if(newrow == true)
				 {
					
				  $("#TeachergridForBookReturn").addRowData(count,jsonData[i]);
					
				 } */ 
		     if(count == null || count == 0 )
			 {
				  //alert("1st row");
				  $("#TeachergridForBookReturn").addRowData(0,jsonData[i]);	
				  proCount++;
			 }
			 /* if(count==0 || count==null)
				{
					 $("#gridForBookIssue").addRowData(0,jsonData[i]);
				}*/
			
			$('#TeachergridForBookReturn').navGrid('#TeacherjqGridPagerForBookReturn',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					{
						
						afterSaveCell: function () {
							  $(this).trigger('reloadGrid');
						},
						editCaption: "The Edit Dialog",
						recreateForm: true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfteredit: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						}
					},
					// options for the Delete Dialogue
					{
						closeAfterdel:true,
						recreateForm: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						},

						onSelectRow: function(id) {
							if (id && id !== lastSel) {
								jQuery("#TeachergridForBookReturn").saveRow(lastSel, true, 'clientArray');
								jQuery("#TeachergridForBookReturn").editRow(id, true);
								
								lastSel = id;
								console.log(id);
							}
						}
						
						
					});
					});

			})	
}

//get all grid Detail for return
function getBookDetailGridForBookReturnemployeeReturn()
{
	var params= {};
	
	var input1 = document.getElementById('fk_teacher_idReturn'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_idReturn;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_teacher_idReturn = list.options[i].getAttribute('data-value');
		}
	}
	var count=0;
	var newrow;
	var rowId;

	//var fk_teacher_idReturn = $('fk_teacher_idReturn').val();
	//var bookNameId = $('#employeebookNameForReturnEMployee').val();
	//params["bookNameId"]=bookNameId;
	params["fk_teacher_idReturn"] = fk_teacher_idReturn; 
	params["methodName"] ="getBookDetailForEmployeeReturn";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{ 
		var jsonData = $.parseJSON(data);
		$.each(jsonData,function(i,v)
				{
			$("#employeegridForBookReturn").jqGrid({
				datatype:"local",

				/*colNames: ['Book Name','Author Name','Publisher Name','Supplier Name','Quantity'],*/
				colNames: ['Book Name','Author Name','Publisher Name','Supplier Name','Quantity','BookIssuedate','BookReturnDate'],

				colModel: [ 
						     {	name:'bookName',
						    	 width:100,
								
							},
							 {	name:'authorName',
						    	 width:100,
						    	 editable: true
							},
							
							 {	name:'publisherName',
						    	 width:100,
						    	 editable: true
							},
							
						     {	name:'supplierName',
						    	 width:100,
						    	 //editable: true
						    	 hidden: true
							},
					
						   
							{	name:'quantityInGrid',
								width:100,
								//editable: true
								hidden: true
								
							},
							{	name:'BookIssuedate',
								width:100,
								editable: true
								//hidden: true
								
							},
							{	name:'BookReturnDate',
								width:100,
								editable: true
								//hidden: true
								
							},
				           ],


				           sortorder : 'desc',
				           
				           loadonce: true,
				           viewrecords: true,
				           width: 1000,
				          // height: 250,
				           shrinkToFit :true,
				           rowNum: 10,

				           pager: "#employeejqGridPagerForBookReturn",
				           'cellEdit':true,
				  /*         afterSaveCell: function  grossTotal() {
						        	Calculation of total after editing quantity
						        	   
						        	   // $(this).trigger('reloadGrid');
						        	   var rowId =$("#jqGrid").jqGrid('getGridParam','selrow');  
				                       var rowData = jQuery("#jqGrid").getRowData(rowId);
				                    	var quantity = rowData['quantity'];
				                    	var buyPrice = rowData['buyPrice'];
				                    	
				                    	var tota = quantity * buyPrice;
				                    	$("#jqGrid").jqGrid("setCell", rowId, "Total", tota);
				        	}*/
				           
				           
			});

			count = jQuery("#employeegridForBookReturn").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#employeegridForBookReturn").jqGrid('getGridParam','data');
		     var ids = jQuery("#employeegridForBookReturn").jqGrid('getDataIDs');
			 
			
		     var BooName;
				for (var j = 0; j < count; j++) {
				BooName = rowdata[j].bookName;

					var rowId = ids[j];
					var rowData = jQuery('#employeegridForBookReturn').jqGrid('getRowData',rowId);

					if (BooName == jsonData.offer.bookName) {

						newrow = false;
						alert("Book Name Already Inserted !!!");
						var grid = jQuery("#employeegridForBookReturn");
						grid.trigger("reloadGrid");
						break;
					} else {
						if(count > 0){
							alert("Book Name Already Inserted !!!");
							return false;
						}else {
						newrow = true;
						}
					}
				}
				/*newrow = true;
				if (newrow == true) {
					//$("#employeegridForBookReturn").addRowData(count,jsonData.offer);
					 $("#employeegridForBookReturn").addRowData(count,jsonData[i]);
				
				}
				if(count==0 || count==null)
				{
					 $("#gridForBookIssue").addRowData(0,jsonData[i]);
				}*/
				 $("#employeegridForBookReturn").addRowData(count,jsonData[i]);
		     
			 
			
			$('#employeegridForBookReturn').navGrid('#employeegridForBookReturn',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					{
						
						afterSaveCell: function () {
							  $(this).trigger('reloadGrid');
						},
						editCaption: "The Edit Dialog",
						recreateForm: true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfteredit: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						}
					},
					// options for the Delete Dialogue
					{
						closeAfterdel:true,
						recreateForm: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						},

						onSelectRow: function(id) {
							if (id && id !== lastSel) {
								jQuery("#employeegridForBookReturn").saveRow(lastSel, true, 'clientArray');
								jQuery("#employeegridForBookReturn").editRow(id, true);
								
								lastSel = id;
								console.log(id);
							}
						}
						
						
					});
					});

			})		




}

//add book issue
function addingBookIssue1(){
	var params = {};
	
	var input1 = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
	i,fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input1 = document.getElementById('fk_division_id'),
	list = document.getElementById('division'),
	i,fk_div_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_div_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var count = jQuery("#gridForBookIssue").jqGrid('getGridParam', 'records');
	if(count == "" || count ==null || count ==undefined){
		alert("No Book Available For Issue....");
		location.reload();
		return false;
		
		
	}
	var allRowsInGrid = $('#gridForBookIssue').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pkBookId = allRowsInGrid[i].pkBookId;
		params["pkBookId"+i] = pkBookId;
		
		var bookName = allRowsInGrid[i].bookName;
		params["bookName"+i] = bookName;
	
		var authorName = allRowsInGrid[i].authorName;
		params["authorName"+i] = authorName;
		
		var publisherName = allRowsInGrid[i].publisherName;
		params["publisherName"+i] = publisherName;
		
		var supplierName = allRowsInGrid[i].supplierName;
		params["supplierName"+i] = supplierName;
	
		var quantityInGrid = allRowsInGrid[i].quantityInGrid;
		params["quantityInGrid"+i] = quantityInGrid;
	}
	
	var studentName = $('#studentName').val();
	var dateOfBookIssue= $('#dateOfBookIssue').val();
	var BookissueDate = $('#BookissueDate').val();
	var BookReturneDate = $('#BookReturneDate').val();
	params["count"] = count;
	params["fk_div_id"] = fk_div_id;
	params["fk_cat_id"] = fk_cat_id;
	params["studentId"] = studentName;
	params["dateOfBookIssue"] = dateOfBookIssue;
	params["BookissueDate"] = BookissueDate;
	params["BookReturneDate"] = BookReturneDate;
 	params["methodName"] = "addBookIssueDetails";
 	
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
function addBookReturn(){
	
	var fk_class_id_return = $("#fk_class_id_return").val();
  	var fk_division_id_return = $("#fk_division_id_return").val();
  	var studName_return = $('#studName_return').val();
  	var bookNameForReturn = $('#bookNameForReturn').val();
  	
	if(document.formForBookIssueReturn.fk_class_id_return.value == ""){
		alert("Please Select Class Name");
		return false;
	}
	if(document.formForBookIssueReturn.fk_division_id_return.value == ""){
		alert("Please Select Division Name");
		return false;
	}
	if(document.formForBookIssueReturn.BookReturneDateNew.value == ""){
		alert("Please Select Date");
		return false;
	}
	if(document.formForBookIssueReturn.studName_return.value == ""){
		alert("Please Select Student Name");
		return false;
	}
	/*if(document.formForBookIssueReturn.bookNameForReturn.value == ""){
		alert("Please Select Book Name");
		return false;
	}*/
	addBookReturn1()	
}
//adding book return
function addBookReturn1(){
	var params = {};
	
	var input1 = document.getElementById('fk_class_id_return'),
	list = document.getElementById('classes_return'),
	i,fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input1 = document.getElementById('fk_division_id_return'),
	list = document.getElementById('division_return'),
	i,fk_div_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_div_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var count = jQuery("#gridForBookReturn").jqGrid('getGridParam', 'records');
	if(count == "" || count ==null || count ==undefined){
		alert("No Book Available For Return....");
		location.reload();
		return false;
		
		
	}
	var allRowsInGrid = $('#gridForBookReturn').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {
		
		var pkBookId = allRowsInGrid[i].pkBookId;
		params["pkBookId"+i] = pkBookId;
		
		var bookName = allRowsInGrid[i].bookName;
		if(bookName == "" || bookName == null || bookName ==undefined )
			{
			alert("please Select Valid Student For Book Return");
			//document.getElementById("save").disabled = false;
					return false;
			}
		
		params["bookName"+i] = bookName;
	
		var authorName = allRowsInGrid[i].authorName;
		params["authorName"+i] = authorName;
		
		var publisherName = allRowsInGrid[i].publisherName;
		params["publisherName"+i] = publisherName;
		
		var supplierName = allRowsInGrid[i].supplierName;
		params["supplierName"+i] = supplierName;
	
		var quantityInGrid = allRowsInGrid[i].quantityInGrid;
		params["quantityInGrid"+i] = quantityInGrid;
		
		var BookIssuedate = allRowsInGrid[i].BookIssuedate;
		params["BookIssuedate"+i] = BookIssuedate;
		
		var BookReturnDate = allRowsInGrid[i].BookReturnDate;
		params["BookReturnDate"+i] = BookReturnDate;
	
		var DateDifference = allRowsInGrid[i].DateDifference;
		params["DateDifference"+i] = DateDifference;
		
		var Status = allRowsInGrid[i].Status;
		if(Status =="" || Status == null || Status == undefined)
			{
			alert("Please Enter Grid Status In 'Y' or 'N'");
			return false;
			
			}
		params["Status"+i] = Status;
		
	}
	
	
	
		
	
	
	var studentName = $('#studName_return').val();
	//var BookissueDateReturn = $('#BookissueDateReturn').val();
	//var BookReturneDateReturn = $('#BookReturneDateReturn').val();
	//var LateCharges = $('#LateCharges').val();
	var BookReturneDateNew = $('#BookReturneDateNew').val();
	
	
	
	
	
	params["count"] = count;
	params["fk_div_id"] = fk_div_id;
	params["fk_cat_id"] = fk_cat_id;
	params["studentId"] = studentName;
	
	//params["BookissueDateReturn"] = BookissueDateReturn;
	//params["BookReturneDateReturn"] = BookReturneDateReturn;
	//params["LateCharges"] = LateCharges;
	params["BookReturneDateNew"] = BookReturneDateNew;
 	params["methodName"] = "addBookReturnDetails";
 	
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

// adding Teacher BookIssue 
function addBookReturnTeacherIssue()
{
 	
var params = {};
	
	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_teacher_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	
	var count = jQuery("#TeachergridForBookReturn").jqGrid('getGridParam', 'records');
	if(count == "" || count ==null || count ==undefined){
		alert("No Book Available For Issue....");
		location.reload();
		return false;
		
		
	}
	var allRowsInGrid = $('#TeachergridForBookReturn').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pkBookId = allRowsInGrid[i].pkBookId;
		params["pkBookId"+i] = pkBookId;
		
		var bookName = allRowsInGrid[i].bookName;
		params["bookName"+i] = bookName;
	
		var authorName = allRowsInGrid[i].authorName;
		params["authorName"+i] = authorName;
		
		var publisherName = allRowsInGrid[i].publisherName;
		params["publisherName"+i] = publisherName;
		
		var supplierName = allRowsInGrid[i].supplierName;
		params["supplierName"+i] = supplierName;
	
		var quantityInGrid = allRowsInGrid[i].quantityInGrid;
		params["quantityInGrid"+i] = quantityInGrid;
	}
	
	//var fk_teacher_id = $('#fk_teacher_id').val();
	var TeacherBookIssueDateNew= $('#TeacherBookIssueDateNew').val();
	var TeacherBookReturneDateNew = $('#TeacherBookReturneDateNew').val();
	var TeacherbookNameForReturnEmployeeNew = $('#TeacherbookNameForReturnEmployeeNew').val();
	params["count"] = count;
	//params["fk_div_id"] = fk_div_id;
	params["fk_teacher_id"] = fk_teacher_id;
	params["TeacherBookIssueDateNew"] = TeacherBookIssueDateNew;
	params["TeacherBookReturneDateNew"] = TeacherBookReturneDateNew;
	params["TeacherbookNameForReturnEmployeeNew"] = TeacherbookNameForReturnEmployeeNew;
	//params["BookReturneDate"] = BookReturneDate;
 	params["methodName"] = "TeacheraddBookIssueDetails";
 	
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

// adding teacher Book issue Return

function addTeacherIssueBookReturn()
{
var params = {};
	
	var input1 = document.getElementById('fk_teacher_idReturn'),
	list = document.getElementById('teacherNameList'),
	i,fk_teacher_idReturn;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_teacher_idReturn = list.options[i].getAttribute('data-value');
		}
	}
	
	
	
	var count = jQuery("#employeegridForBookReturn").jqGrid('getGridParam', 'records');
	if(count == "" || count ==null || count ==undefined){
		alert("No Book Available For Return....");
		location.reload();
		return false;
		
		
	}
	var allRowsInGrid = $('#employeegridForBookReturn').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pkBookId = allRowsInGrid[i].pkBookId;
		params["pkBookId"+i] = pkBookId;
		
		var bookName = allRowsInGrid[i].bookName;
		params["bookName"+i] = bookName;
	
		var authorName = allRowsInGrid[i].authorName;
		params["authorName"+i] = authorName;
		
		var publisherName = allRowsInGrid[i].publisherName;
		params["publisherName"+i] = publisherName;
		
		var supplierName = allRowsInGrid[i].supplierName;
		params["supplierName"+i] = supplierName;
	
		var quantityInGrid = allRowsInGrid[i].quantityInGrid;
		params["quantityInGrid"+i] = quantityInGrid;
		
		var BookIssuedate = allRowsInGrid[i].BookIssuedate;
		params["BookIssuedate"+i] = BookIssuedate;
		
		var BookReturnDate = allRowsInGrid[i].BookReturnDate;
		params["BookReturnDate"+i] = BookReturnDate;
	}
	
	
	
	//var fk_teacher_id = $('#fk_teacher_id').val();
	//var TeacherBookReturneDateNewToday= $('#TeacherBookReturneDateNewToday').val();
	//var TeacherBookissueDatereturn = $('#TeacherBookissueDatereturn').val();
	//var TeacherBookReturneDatereturnExp = $('#TeacherBookReturneDatereturnExp').val();
	var employeebookNameForReturnEMployee = $('#employeebookNameForReturnEMployee').val();
	params["count"] = count;
	//params["fk_div_id"] = fk_div_id;
	params["fk_teacher_idReturn"] = fk_teacher_idReturn;
	//params["TeacherBookReturneDateNewToday"] = TeacherBookReturneDateNewToday;
	//params["TeacherBookissueDatereturn"] = TeacherBookissueDatereturn;
	//params["TeacherBookReturneDatereturnExp"] = TeacherBookReturneDatereturnExp;
	params["employeebookNameForReturnEMployee"] = employeebookNameForReturnEMployee;
	//params["BookReturneDate"] = BookReturneDate;
 	params["methodName"] = "TeacheraddBookIssueDetailsReturn";
 	
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


function stockList()
{

	var params= {};

	params["methodName"] = "getAllStockList";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)		
			{
		
		$('#stockList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		
		$(document).ready(function() {
			$('#stockList').DataTable( {

				"bPaginate": false,
				
				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};
/*
					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );*/

					
				},

				destroy: true,
				searching: true,			      
				columns: [
					
						  {"data": "srNo" , "width": "1%" ,"defaultContent": ""},	
				          {"data": "bookName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "Quantity", "width": "5%" ,"defaultContent": ""},
				          {"data": "authorName", "width": "5%" ,"defaultContent": ""},
				          {"data": "publisherName", "width": "5%" ,"defaultContent": ""},
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Stock List";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#stockList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


function addingBookIssue()
{
	var fk_class_id1 = $("#fk_class_id1").val();
  	var fk_division_id = $("#fk_division_id").val();
  	var studentName = $('#studentName').val();
  	var bookNameForIssue = $('#bookNameForIssue').val();
	
	
	if(document.formForBookIssueLib.fk_class_id1.value==""){
		alert("Please Select Class Name ");
		return false;
	}
	if(document.formForBookIssueLib.fk_division_id.value == ""){
		alert("Please Select Division Name ");
		return false;
	}
	if(document.formForBookIssueLib.BookissueDate.value == ""){
		alert("Please Enter Book Issue Date ");
		return false;
	}
	if(document.formForBookIssueLib.BookReturneDate.value == ""){
		alert("Please Enter Expected Book Return Date ");
		return false;
	}
	if(document.formForBookIssueLib.studentName.value == ""){
		alert("Please Select Student Name ");
		return false;
	}
/*	if(document.formForBookIssueLib.bookNameForIssue.value == ""){
		alert("Please Select Book Name ");
		return false;
	}*/
	addingBookIssue1();
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
function getDivisionNameByClassNameReturn()
{
//var type = document.getElementById('vendor').value;
	
	$("#division_return").empty();
	$("#division_return").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		var input = document.getElementById('fk_class_id_return'), list = document
		.getElementById('classes_return'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id_return').val();
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;
	
	params["methodName"] = "getDivisionNameByClassName";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#division_return").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

function getLibTotalAmtByBills()
{
	 var input = document.getElementById('supplierId1'),
     list = document.getElementById('sup_drop1'),
     i,fkRootsupId;

	for (i = 0; i < list.options.length; ++i) 
	{
     if (list.options[i].value === input.value) 
     {
    	 fkRootsupId = list.options[i].getAttribute('data-value');
     }
    }
	
	var fk_supplier_id = $("#supplierId1").val();
	var billNo = $("#billNo").val();
	$("#totalAmount").empty();
	$("#totalAmount").append($("<input/>").attr("value","").text());
	var params= {};
	params["methodName"] = "getLibraryTotalAmtByBillNo";
	params["billNo"]= billNo;
	params["supplier"]= fkRootsupId;
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
					//document.getElementById("totalAmount").value = v.grossTotal;
					document.getElementById("totalAmountl").value = v.total;
			
			
					//document.getElementById("balanceAmount").value = v.balanceamount;
			
				});
			})
		
	
	getLibRemainingBalane();
}

function getLibRemainingBalane(){
	
	/*var input = document.getElementById('supplierId'),
     list = document.getElementById('sup_drop'),
     i,fkRootsupId;

	for (i = 0; i < list.options.length; ++i) 
	{
     if (list.options[i].value === input.value) 
     {
    	 fkRootsupId = list.options[i].getAttribute('data-value');
     }
    }*/
	var input = document.getElementById('supplierId1'),
     list = document.getElementById('sup_drop1'),
     i,fkRootsupId;

	for (i = 0; i < list.options.length; ++i) {
     if (list.options[i].value === input.value) {
    	 fkRootsupId = list.options[i].getAttribute('data-value');
     }
    }
	
	var fk_supplier_id = $("#supplierId1").val();
	//var billNo = $("#billNo").val();
	$("#balanceAmount").empty();
	$("#balanceAmount").append($("<input/>").attr("value","").text());
	var params= {};
	params["methodName"] = "getLibraryBalanceAmtBySupplierWise";
	//params["billNo"]= billNo;
	params["supplier"]= fkRootsupId;
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
					//document.getElementById("totalAmount").value = v.grossTotal;
					//document.getElementById("totalAmount").value = v.total;
			
			
					document.getElementById("balanceAmountl").value = v.balance;
			
				});
			})
}