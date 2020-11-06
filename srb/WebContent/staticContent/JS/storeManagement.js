//grid for store management
function getGridForStoreManagement(){
	 if(document.storeManageForm.productName.value=="" ||document.storeManageForm.productName.value==null){
		 alert("Please Enter Product Name")
		 return false;
	 }
	 

	getGridForStoreManagementAsPerProduct();
}
	function getGridForStoreManagementAsPerProduct(){	
	var params= {};
	var count=0;
	var newrow;
	var rowId;

	var productName = $('#productName').val();
	//var billNo = $('#billNo').val();
	params["productName"]=productName;
	//params["billNo"]=billNo;
	params["methodName"] ="gridForStoreManagement";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		  var jsonData = $.parseJSON(data);
			
	      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
        
	     $.each(jsonData,function(i,v)
			{
	        
	         count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list4").jqGrid('getGridParam','data');
		     var ids = jQuery("#list4").jqGrid('getDataIDs');
			 
			
			  var prodName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].productName;
				
				 var rowId = ids[j];
				 var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
				
				if (prodName == jsonData.offer.productName) {
			    	/*ori_quantity = +rowdata[j].quantity+1;
			    	
			    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
			    	var grid = jQuery("#list4");
			    	grid.trigger("reloadGrid");*/
			    	newrow=false;
					alert("Product Name Already Inserted !!!");
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
			  document.getElementById('productName').value = "";

			 $("#list4").jqGrid({
			datatype: "local",
			
			colNames:['Product Name','Buy Price','Quantity','Gst','GstAmt','Total'],
			colModel:[ 
				
               
			     {	name:'productName',
			    	 width:150,
					
				},
				
			    
				{	name:'buyPrice',
			    	 width:150,
			    	 editable: true
				},
			       
			   
				{	name:'quantity',
					width:100,
					editable: true
					
				},
				{	name:'gst',
					width:100,
					editable: true
					
				},
				{	name:'gstamt',
					width:100,
					editable: false
					
				},
				{	name:'total',
					width:100,
				}
				
			],
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 800,
            //height: 350,
			shrinkToFit:true,
            rowheight: 300,
            hoverrows: true,
	        rownumbers: true,
            rowNum: 10,
            'cellEdit':true,
         	 afterSaveCell: function  grossTotal12() {
			       /* 	Calculation of total after editing quantity*/
         		 document.getElementById("grossTotal").value = 0;
			        	   // $(this).trigger('reloadGrid');
			        	   var rowId =$("#list4").jqGrid('getGridParam','selrow');  
	                       var rowData = jQuery("#list4").getRowData(rowId);
	                    	var quantity = rowData['quantity'];
	                    	var buyPrice = rowData['buyPrice'];
	                    	var gst = rowData['gst'];
	                    	var gstamt = rowData['gstamt'];
	                    	
	                    	var tota1 = 0;
	                    	var tota1 =(quantity*buyPrice);
                    		
                    		GstAmount = tota1 * (gst) / 100 ;
                    		$("#list4").jqGrid("setCell", rowId, "gstamt", GstAmount);
                    		
                    		var tota = 0;
	                    	var tota = (quantity * buyPrice)+GstAmount;
                    		$("#list4").jqGrid("setCell", rowId, "total",tota);
                    		
                    		var Total = 0;
                    		var Total1 = 0; 
                    		
                    		/*if(Total1 == "" || Total1 ==null || Total1 == undefined)
                    			{
                    			Total1 = 0;                    			
                    			}
                    		*/
                    		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		var Total1 = allRowsInGrid1[k].total;
        		        		if(Total1 != null){
        		        			Total = Total + Total1;
        		        		}
        		        		
        		        	}
        		        	document.getElementById("grossTotal").value = (Total).toFixed(2);
        		        	
	                    	
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
	                        
	                        
	                    },
	                    afterComplete: function() {
	                    var rowId =$("#list4").jqGrid('getGridParam','selrow');  
	                       var rowData = jQuery("#list4").getRowData(rowId);
	                    	var quantity = rowData['quantity'];
	                    	var buyPrice = rowData['buyPrice'];
	                    	
	                    	var tota = quantity * buyPrice;
                 		$("#list4").jqGrid("setCell", rowId, "total", tota.toFixed(2));
                 		
                 		var Total =0;
                 		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
     		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
     		        	var AllRows=JSON.stringify(allRowsInGrid1);
     		        	for (var k = 0; k < count; k++) {
     		        		var Total1 = allRowsInGrid1[k].total;
     		        		Total = +Total + +Total1;
     		        	}
     		        	document.getElementById("grossTotal").value = (Total);
	                  }
	                });
		 
		 
			   });
			
		})

}
	function addStoreManagementValidation(){
		if(document.storeManageForm.billNo.value == ""){
			alert("Please Enter BillNo");
			return false;
		}
		if(document.storeManageForm.storeDate.value == ""){
			alert("Please Select Date");
			return false;
		}
		if(document.storeManageForm.supplierName.value == ""){
			alert("Please Select supplier Name");
			return false;
		}
		addStoreManagementValidation1();
	}
//add store mangement validation 
	function addStoreManagementValidation1()
	{
		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
		
		if(count==null)
		{
			alert("Please Enter Product Name");
			//alertify.alert("Embel Technologies says --> Please Enter Product Name.");
			return false;
		}
		/*if(document.storeManageForm.productName.value==""){
			alert("Please Select Product Name");
			return false;
		}*/
		
	/*	if(document.storeManageForm.productName.value=="" ||document.storeManageForm.productName.value==null){
			alertify.alert("Embel Technologies says --> Please Enter Product Name.");
			 return false;
		 }*/
		
		
		addStoreManagement()
	}

//add store management
function addStoreManagement(){
	var params = {};
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
	
	/*	var supplierName = allRowsInGrid[i].supplierName;
		params["supplierName"+i] = supplierName;*/
		
		var buyPrice = allRowsInGrid[i].buyPrice;
		if(buyPrice==undefined || buyPrice== null || buyPrice == "" ){
			alert("Enter BuyPrice")
			return false;
		}
		else{
			params["buyPrice"+i] = buyPrice;
		}
		
		var quantity = allRowsInGrid[i].quantity;
		if(quantity==undefined || quantity== null || quantity == "" ){
			alert("Enter Quantity")
			return false;
		}
		else{
			params["quantity"+i] = quantity;
		}
		
		var gst = allRowsInGrid[i].gst;
		if(gst==undefined || gst== null || gst == "" ){
			alert("Enter Gst")
			return false;
		}
		else{
			params["gst"+i] = gst;
		}
		
		var gstamt = allRowsInGrid[i].gstamt;
		params["gstamt"+i] = gstamt;

		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
	}
	
	params["count"] = count;
	
   /* var supplierName =$('#supplierName').val();*/
	var grossTotal = $('#grossTotal').val();
	var storeDate = $('#storeDate').val();
	var billNo = $('#billNo').val();
	var supplierName = $("#supplierName").val();
	
	
	 var input = document.getElementById('supplierName'),
	     list = document.getElementById('dealerName_drop'),
	     	i,fkRootsupId;
		 		for (i = 0; i < list.options.length; ++i) 
		 		{
				     if (list.options[i].value === input.value) 
				     {
				    	 fkRootsupId = list.options[i].getAttribute('data-value');
				     }
		 		}

		 		
	params ["fkSupplierId"] = fkRootsupId;
	
	params ["supplierName"] = supplierName;
	
	/*params["supplierName"]=supplierName;*/
	 params["grossTotal"] = grossTotal;
	 params["billNo"] = billNo;
	 params["storeDate"] = storeDate;
	 
 	params["methodName"] = "addStoreManagementDetails";
 	
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


//stock report 
//between two date
function stockBetweenTwoDate()
{
	var params = {};
	var fdate = $("#fdate").val();
	var sdate = $("#sdate").val();
	params["fdate"]= fdate;
	params["sdate"]= sdate;
	params["methodName"] = "getStockdetailBetweenTwoDate";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
			//To Clear Table
		$('#stockRep').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		
		
		$(document).ready(function() {
			$('#stockRep').DataTable( {

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

					
					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				

		    	
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		        "bPaginate": false,
		      
		columns: [
			        {"data": "billNo", "width": "5%"},
		            {"data": "insertDate", "width": "5%"},
		          	{"data": "productName", "width": "5%"},
		            {"data": "supplierName", "width": "5%"},
		            {"data": "buyPrice", "width": "5%"},
		            {"data": "quantity" , "width": "5%"},
		            {"data": "total" , "width": "5%"}
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Store Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );

	
	var mydata = catmap;
	$('#stockRep').dataTable().fnAddData(mydata);
		}).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
				$(loaderObj).hide();
				$(loaderObj).find('#errorDiv').show();
			}
		});
	
	
}
//
function stockproductwise()
{
	var params = {};
	
	
	var input = document.getElementById('fk_prodct'), 
	list = document.getElementById('product'), 
	i,fkRootStudentId,fkClassId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}
	var fkid = fkClassId;

	params["fkid"]= fkid;

	params["methodName"] = "getStockdetailrp";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
			//To Clear Table
		$('#stockReppr').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		
		
		$(document).ready(function() {
			$('#stockReppr').DataTable( {

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

					
					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				

		    	
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		        "bPaginate": false,
		      
		columns: [
			        {"data": "billNo", "width": "5%"},
		            {"data": "insertDate", "width": "5%"},
		          	{"data": "productName", "width": "5%"},
		            {"data": "supplierName", "width": "5%"},
		            {"data": "buyPrice", "width": "5%"},
		            {"data": "quantity" , "width": "5%"},
		            {"data": "total" , "width": "5%"}
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Store Report ";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );

	
	var mydata = catmap;
	$('#stockReppr').dataTable().fnAddData(mydata);
		}).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
				$(loaderObj).hide();
				$(loaderObj).find('#errorDiv').show();
			}
		});
	
	
}


// hostel report ----------------------
function hostelstockBetweenTwoDate()
{
	var params = {};
	var fdate = $("#fdatee").val();
	var sdate = $("#sdatee").val();
	params["fdate"]= fdate;
	params["sdate"]= sdate;

	params["methodName"] = "gethosteldetailBetweenTwoDate";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
			//To Clear Table
		$('#stockRepp').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		if(catmap == "" || catmap == null || catmap == undefined){
			alert("No data available for selected dates");
			return false;
		}
		
/*		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}*/
		
		
		$(document).ready(function() {
			$('#stockRepp').DataTable( {

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

					
					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				

		    	
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		        "bPaginate": false,
		      
		columns: [
			        {"data": "billNo", "width": "5%"},
		            {"data": "insertDate", "width": "5%"},
		          	{"data": "productName", "width": "5%"},
		            {"data": "supplierName", "width": "5%"},
		            {"data": "buyPrice", "width": "5%"},
		            {"data": "quantity" , "width": "5%"},
		            {"data": "total" , "width": "5%"}
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Hostel Inventory Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );

	
	var mydata = catmap;
	$('#stockRepp').dataTable().fnAddData(mydata);
		}).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
				$(loaderObj).hide();
				$(loaderObj).find('#errorDiv').show();
			}
		});
	
	
}





//grid for Kitchen Inventory
function getGridForKitchenInventory()
{
	 /*if(document.kitchenInventoryForm.productName2.value=="" ||document.kitchenInventoryForm.productName2.value==null){
		 alert("Please Enter Product Name")
		 return false;
	 }*/
	 

	 getGridForKitchenInventoryAsPerProduct();
}
	
function getGridForKitchenInventoryAsPerProduct()
{	
	var params= {};
	var count=0;
	var newrow;
	var rowId;
	
	
	   var input = document.getElementById('productName2'),
       list = document.getElementById('productName_drop'),
     	i,fkRootsupId;
 		for (i = 0; i < list.options.length; ++i) 
 		{
		     if (list.options[i].value === input.value)
		     {
		    	 fkProductId = list.options[i].getAttribute('data-value');
		     }
 		}	
 			
	

	var productName1 = $('#productName2').val();

	params["fkProductId"]=fkProductId;
	params["productName"]=productName1;
	
	params["methodName"] ="gridForKitchenInventory";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		  var jsonData = $.parseJSON(data);
			
	      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
    
	    	 
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
				
				if (prodName == productName1) 
				{
			    	/*ori_quantity = +rowdata[j].quantity+1;	
			    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
			    	var grid = jQuery("#list4");
			    	grid.trigger("reloadGrid");*/
					
			    	newrow=false;
					alert("Product Name Already Inserted !!!");
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
			  
			  document.getElementById('productName2').value = "";
		
		$("#list5").jqGrid({
			datatype: "local",
			
			colNames:['Product Name','Unit','Quantity','Buy Price','Total'],
			colModel:[ 
				
               
			     {	name:'productName',
			    	 width:150,
					
				},
				
			    
				{	name:'unit',
			    	 width:150,
			    	 
				},
			       
/*			   
				
				{	name:'totalQuantity',
					width:100,
					editable: false,
					hidden: true
					
				},
				*/
				
				
				{	name:'quantity',
					width:100,
					editable: true
					
				},
				
				{	name:'buyPrice',
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
			width: 800,
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
         		 
         		 			
         		          document.getElementById("subTotal2").value = 0;
         		 
			        	    var rowId =$("#list5").jqGrid('getGridParam','selrow');  
	                        var rowData = jQuery("#list5").getRowData(rowId);
	                    	var quantity = rowData['quantity'];
	                    	var buyPrice = rowData['buyPrice'];
	                    	
	                    	  if(  quantity !="" ||  quantity == ""){
		                    	  /* var quan =/^[0-9 ]+$/;*/
		                    	   var quan =/^\d{0,10}(?:\.\d{0,2})?$/;
		                    	   if(quantity.match(quan))
		                    		   {
		                    		   
		                    		   }
		                    	   else 
		                    		   {
		                    		   var quant ="0";
		                    		   alert("Please Enter Quantity In Numbers");
		                    		   $("#jqGrid1").jqGrid("setCell",rowId, "quantity", quant);
		                    		   return false;
		                    		   }
		                       }
	                    	  
	                    	  if(buyPrice !="" || buyPrice ==""){
		                    	  /* var quan =/^[0-9 ]+$/;*/
		                    	   var quan =/^\d{0,10}(?:\.\d{0,2})?$/;
		                    	   if(buyPrice.match(quan))
		                    		   {
		                    		   
		                    		   }
		                    	   else 
		                    		   {
		                    		   var quant ="0";
		                    		   alert("Please Enter Quantity In Numbers");
		                    		   $("#jqGrid1").jqGrid("setCell",rowId, "buyPrice", quant);
		                    		   return false;
		                    		   }
		                       }
	                    	  
	                    	
	                    	  var tota = 0;
	                    	 /* var quantity = 0;
	                    	  var buyPrice = 0;*/
	                    	
	                    	
	                    	var tota = (quantity * buyPrice);
                    		$("#list5").jqGrid("setCell", rowId, "total", tota);
                    		
                    		var Total = 0;
                    		var Total1 = 0;
         		 			//var quantity = 0;
         		 			//var buyPrice = 0;
                    		          		
                    		//var count = jQuery("#list5").jqGrid('getGridParam', 'records');
                    		var count = jQuery("#list5").jqGrid('getGridParam', 'records');
        		        	var allRowsInGrid1 = $('#list5').getGridParam('data');
        		        	var AllRows=JSON.stringify(allRowsInGrid1);
        		        	for (var k = 0; k < count; k++) {
        		        		var Total1 = allRowsInGrid1[k].total;
        		        		if(Total1 != null){
        		        			Total = Total + Total1;
        		        		}
        		        		
        		        	}
        		        	document.getElementById("gst").value = "0";
        		        	document.getElementById("gstAmount").value = "0";
        		        	document.getElementById("subTotal2").value = (Total).toFixed(2);
        		        	
        		        	document.getElementById("grossTotal2").value = (Total).toFixed(2);
	                    	
	        	},
           
			pager: "#jqGridPager5",
			
			
			
		});
		
	
		//$("#list4").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#list4").addRowData(i,jsonData[i]);
			  $("#list5").addRowData(0,jsonData.offer);
		}
		

     
		 $('#list5').navGrid('#jqGridPager5',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    
	                   
	                    /*afterSubmit: function () {
							
	                      var grid = $("#list5"),
						  intervalId = setInterval(
							 function() {
							         grid.trigger("reloadGrid",[{current:true}]);
							   },
							   500);
	                         
	                      
						},*/
						
	                	 editCaption: "The Edit Dialog",
						 recreateForm: true,
						 checkOnUpdate : true,
						 checkOnSubmit : true,
		                 closeAfterEdit: true,
						
		                 afterSubmit: function() {
		                		$('#list5').trigger( 'reloadGrid' );
							},
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
	                	//checkOnUpdate : true,
						//checkOnSubmit : true,
						recreateForm: true,
	                	
						//reloadAftersubmit:true,	
	                    errorTextFormat: function (data) {
	                        return 'Error: ' + data.responseText
	                        
	                        
	                    },
	                    afterComplete: function() {
	                    	$('#list5').trigger( 'reloadGrid' );
	                    	
	                    	
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
     		        	
     		        	for (var k = 0; k < count; k++) 
     		        	{
     		        		var Total1 = allRowsInGrid1[k].total;
     		        		Total = +Total + +Total1;
     		        	}
     		        	document.getElementById("subTotal2").value = Total;
     		        	document.getElementById("gst").value = "0";
    		        	document.getElementById("gstAmount").value = "0";
     		        	document.getElementById("grossTotal2").value = Total;
     		        	
	                  }
	                  
	                    
	                });
		 
		 
			   });
			
		})

}


//GST Calculation
function gstCaluculation()
{
	var subTotal2 = $('#subTotal2').val();	
	var gst = $('#gst').val();
		
	var vat = (subTotal2)*(gst)/100;
	
	var groTotal = +subTotal2+ + vat;
		
 	document.getElementById("gstAmount").value = (vat).toFixed(2);
 	document.getElementById("grossTotal2").value = (groTotal).toFixed(2);
	
	
}



// add kitchen inventory
function validationForKitcheninventory()
{
	if(document.kitchenInventoryForm.billNo2.value=="" ||document.kitchenInventoryForm.billNo2.value==null)
	{
		 alert("Please Enter Bill No")
		 return false;
	 }
	
	if(document.kitchenInventoryForm.storeDate2.value=="" ||document.kitchenInventoryForm.storeDate2.value==null)
	{
		 alert("Please Select Date")
		 return false;
	 }
	
	if(document.kitchenInventoryForm.supplierName2.value=="" ||document.kitchenInventoryForm.supplierName2.value==null)
	{
		 alert("Please Select Supplier Name")
		 return false;
	 }
	
	/*if(document.kitchenInventoryForm.productName2.value=="" ||document.kitchenInventoryForm.productName2.value==null)
	{
		 alert("Please Select Product Name")
		 return false;
	 }*/
	
	addKitcheninventory();
	
	
}

function addKitcheninventory()
{
	
	var params = {};
	
	var count = jQuery("#list5").jqGrid('getGridParam', 'records');
	
	if(count < 1)
	{
	alert("Please Enter Product Name ");
	document.getElementById("save").disabled = false;
	return false;
	}
	var allRowsInGrid = $('#list5').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);

	for (var i = 0; i < count; i++)
	{
		

		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;

		var unit = allRowsInGrid[i].unit;
		params["unit"+i] = unit;
	
		var quantity = allRowsInGrid[i].quantity;
		if(quantity==undefined || quantity== null || quantity == "" ){
			alert("Enter Quantity")
			return false;
		}
		else{
			params["quantity"+i] = quantity;
		}

		var buyPrice = allRowsInGrid[i].buyPrice;
		if(buyPrice==undefined || buyPrice== null || buyPrice == "" ){
			alert("Enter BuyPrice")
			return false;
		}
		else{
			params["buyPrice"+i] = buyPrice;
		}
		
		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
	}
	
	
	   var input = document.getElementById('supplierName2'),
       list = document.getElementById('dealerName_drop2'),
     	i,fkRootsupId;
 		for (i = 0; i < list.options.length; ++i) 
 		{
		     if (list.options[i].value === input.value)
		     {
		    	 fksupplierId = list.options[i].getAttribute('data-value');
		     }
 		}
 		
 		
 	   var input = document.getElementById('productName2'),
       list = document.getElementById('productName_drop'),
     	i,fkRootsupId;
 		for (i = 0; i < list.options.length; ++i) 
 		{
		     if (list.options[i].value === input.value)
		     {
		    	 fkProductId = list.options[i].getAttribute('data-value');
		     }
 		}	
 		
 		
 		
 		
 		
 		
	
 		var billNo = $('#billNo2').val();
 		var storeDate = $('#storeDate2').val();
 		var productName = $('#productName2').val();
 		var subTotal = $('#subTotal2').val();
 		var gst = $('#gst').val();
 		var gstAmount = $('#gstAmount').val();
 		var grossTotal = $('#grossTotal2').val();
 		var supplierName = $('#supplierName2').val();
 		

 		
 		params["fkProductId"] = fkProductId;
 		
 		params["fksupplierId"] = fksupplierId;
 		params["billNo"] = billNo;
 		params["storeDate"] = storeDate;
 		params["supplierName"] = supplierName;
 		params["subTotal"] = subTotal;
 		params["gst"] = gst;
 		params["gstAmount"] = gstAmount;
 		params["grossTotal"] = grossTotal;
 		
 		params["count"] = count;
 		
 		 
 	 	params["methodName"] = "addKitchenInventory";
 	 	
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


function getProductQuantity()
{
	
	var params= {};
	
	
	   var input = document.getElementById('productName2'),
       list = document.getElementById('productName_drop'),
     	i,fkRootsupId;
 		for (i = 0; i < list.options.length; ++i) 
 		{
		     if (list.options[i].value === input.value)
		     {
		    	 fkProductId = list.options[i].getAttribute('data-value');
		     }
 		}	
 		
 		
 		var productName = $('#productName2').val();

 		params["fkProductId"] = fkProductId;
 		params["productName"] = productName;
 		
 		params["methodName"] ="getTotalQuantityForAlert";

 		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 			{
 				
		 		var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				$.each(jsonData,function(i,v)
	/*			
				var productName = v.productName;
				var unit = v.unit;
				var ProductLimit = v.ProductLimit;
				var totalQuantity = v.totalQuantity;*/
				
				
				{
					
					var totalQuantity = +v.totalQuantity;
					var ProductLimit = +v.ProductLimit;
					
					
					if(totalQuantity >= ProductLimit)
					{
						alert(v.productName+"- Monthly limit is :"+v.ProductLimit+" "+v.unit+"\nYou have exceed monthly limit.(This month :"+v.totalQuantity+" "+v.unit+")");
					}
				
					
			   
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
	
}



//Validation for kitchen Inventory report
function validationKitchenInventoryBetweenTwoDate()
{
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	

	if(startDate=="")
	{
		alert("Please select Start date");
		return false;
	}
	
	if(endDate=="")
	{
		alert("Please select End date");
		return false;
	}
	
	
	kitchenInventoryBetweenTwoDate()
}


//kitchen Inventory report 
//between two date
function kitchenInventoryBetweenTwoDate()
{
	var params = {};
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	
	params["startDate"]= startDate;
	params["endDate"]= endDate;
	params["methodName"] = "getkitchenInventoryDetailsBetweenTwoDate";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
			//To Clear Table
		$('#kitchenInvRep').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		
		
		$(document).ready(function() {
			$('#kitchenInvRep').DataTable( {

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

					
				/*	// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);*/
				},

				

		    	
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		        "bPaginate": false,
		      
		columns: [
			        {"data": "billNo", "width": "5%"},
		            {"data": "date", "width": "5%"},
		          	{"data": "productName", "width": "5%"},
		            {"data": "supplierName", "width": "5%"},
		            {"data": "quantity", "width": "5%"},
		            {"data": "buyPrice" , "width": "5%"},
		            {"data": "total" , "width": "5%"},
		            {"data": "subTotal" , "width": "5%"},
		            {"data": "gst" , "width": "5%"},
		            {"data": "gstAmount" , "width": "5%"},
		            {"data": "grossTotal" , "width": "5%"},
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Kitchen Inventory Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );

	
	var mydata = catmap;
	$('#kitchenInvRep').dataTable().fnAddData(mydata);
		}).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
				$(loaderObj).hide();
				$(loaderObj).find('#errorDiv').show();
			}
		});
	
	
}

//hostel grid
function getGridForhostelManagement(){
	 if(document.hostelForm.productName1.value=="" ||document.hostelForm.productName1.value==null){
		 alert("Please Enter Product Name")
		 return false;
	 }
	 

	getGridForhostelManagementAsPerProduct();
}
	function getGridForhostelManagementAsPerProduct(){	
	var params= {};
	var count=0;
	var newrow;
	var rowId;

	var productName = $('#productName1').val();
	//var billNo = $('#billNo').val();
	params["productName"]=productName;
	//params["billNo"]=billNo;
	params["methodName"] ="gridForhostelManagement";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		  var jsonData = $.parseJSON(data);
			
	      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
		
       
	     $.each(jsonData,function(i,v)
			{
	        
	         count = jQuery("#list10").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#list10").jqGrid('getGridParam','data');
		     var ids = jQuery("#list10").jqGrid('getDataIDs');
			 
			
			  var prodName,com,packing,unit;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].productName;
				
				 var rowId = ids[j];
				 var rowData = jQuery('#list10').jqGrid ('getRowData', rowId);
				
				if (prodName == jsonData.offer.productName) {
			    	/*ori_quantity = +rowdata[j].quantity+1;
			    	
			    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
			    	var grid = jQuery("#list4");
			    	grid.trigger("reloadGrid");*/
			    	newrow=false;
					alert("Product Name Already Inserted !!!");
					var grid = jQuery("#list10");
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
				  $("#list10").addRowData(count,jsonData.offer);
					
				 }
			  document.getElementById('productName').value = "";

			 $("#list10").jqGrid({
			datatype: "local",
			
			colNames:['Product Name','Buy Price','Quantity','Gst','GstAmt','Total'],
			colModel:[ 
				
              
			     {	name:'productName',
			    	 width:150,
					
				},
				
			    
				{	name:'buyPrice',
			    	 width:150,
			    	 editable: true
				},
			       
			   
				{	name:'quantity',
					width:100,
					editable: true
					
				},
				{	name:'gst',
					width:100,
					editable: true
					
				},
				{	name:'gstamt',
					width:100,
				//	editable: true
					
				},
				{	name:'total',
					width:100,
				}
				
			],
				
			
			sortorder : 'desc',
			loadonce: false,
			viewrecords: true,
			width: 800,
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
        		 document.getElementById("grossTotall").value = 0;
			        	   var rowId =$("#list10").jqGrid('getGridParam','selrow');  
	                       var rowData = jQuery("#list10").getRowData(rowId);
	                    	var quantity = rowData['quantity'];
	                    	var buyPrice = rowData['buyPrice'];
	                    	var gst = rowData['gst'];
	                    	var gstamt = rowData['gstamt'];
	                    	
	                    	var tota1 = 0;
	                    	var tota1 = quantity * buyPrice;
                   		
                   		GstAmount = tota1 * (gst) / 100 ;
                   		$("#list10").jqGrid("setCell", rowId, "gstamt", GstAmount);
                   		
                   		var tota = 0;
	                    	var tota = (quantity * buyPrice)+GstAmount;
                   		$("#list10").jqGrid("setCell", rowId, "total", tota);
                   		
                   		var Total = 0;
                   		var Total1 = 0; 
                   		
                   		if(Total1 == "" || Total1 ==null || Total1 == undefined)
                   			{
                   			Total1 = 0;                    			
                   			}
                   		
                   		var count = jQuery("#list10").jqGrid('getGridParam', 'records');
       		        	var allRowsInGrid1 = $('#list10').getGridParam('data');
       		        	var AllRows=JSON.stringify(allRowsInGrid1);
       		        	for (var k = 0; k < count; k++) {
       		        		var Total1 = allRowsInGrid1[k].total;
       		        		if(Total1 != null){
       		        			Total = Total + Total1;
       		        		}
       		        		
       		        	}
       		        	document.getElementById("grossTotall").value = Total;
       		        	
	                    	
	        	},
          
			pager: "#jqGridPagerr",
			
			
			
		});
		
	
		//$("#list4").addRowData(i+1,jsonData[i]);
		if(count==0 || count==null)
		{
			 // $("#list4").addRowData(i,jsonData[i]);
			  $("#list10").addRowData(0,jsonData.offer);
		}
		

    
		 $('#list10').navGrid('#jqGridPagerr',
	                
	                { edit: true, add: false, del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
	                
	                {
	                    editCaption: "The Edit Dialog",
	                   
	                    afterSubmit: function () {
							
	                      var grid = $("#list10"),
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
	                        
	                        
	                    },
	                    afterComplete: function() {
	                    var rowId =$("#list10").jqGrid('getGridParam','selrow');  
	                       var rowData = jQuery("#list10").getRowData(rowId);
	                    	var quantity = rowData['quantity'];
	                    	var buyPrice = rowData['buyPrice'];
	                    	
	                    	var tota = quantity * buyPrice;
                		$("#list10").jqGrid("setCell", rowId, "total", tota.toFixed(2));
                		
                		var Total =0;
                		var count = jQuery("#list10").jqGrid('getGridParam', 'records');
    		        	var allRowsInGrid1 = $('#list10').getGridParam('data');
    		        	var AllRows=JSON.stringify(allRowsInGrid1);
    		        	for (var k = 0; k < count; k++) {
    		        		var Total1 = allRowsInGrid1[k].total;
    		        		Total = +Total + +Total1;
    		        	}
    		        	document.getElementById("grossTotall").value = (Total).toFixed(2);
	                  }
	                });
		 
		 
			   });
			
		})

}

// save hostel --------------------
	
	function addhostelManagementValidation(){
		if(document.hostelForm.billNoo.value == ""){
			alert("Please Enter BillNo");
			return false;
		}
		if(document.hostelForm.storeDatee.value == ""){
			alert("Please Select Date");
			return false;
		}
		if(document.hostelForm.supplierNamee.value == ""){
			alert("Please Select supplier Name");
			return false;
		}
		addhostelManagementValidation1();
	}

	function addhostelManagementValidation1()
	{
		var count = jQuery("#list10").jqGrid('getGridParam', 'records');
		
		if(count==null)
		{
			alert("Please Enter Product Name");
			//alertify.alert("Embel Technologies says --> Please Enter Product Name.");
			return false;
		}
		
		addhostelManagement()
	}

//add hostel management
function addhostelManagement(){
	var params = {};
	var count = jQuery("#list10").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list10').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
	
	/*	var supplierName = allRowsInGrid[i].supplierName;
		params["supplierName"+i] = supplierName;*/
		
		var buyPrice = allRowsInGrid[i].buyPrice;
		if(buyPrice==undefined || buyPrice== null || buyPrice == "" ){
			alert("Enter BuyPrice");
			return false;
		}
		else{
			params["buyPrice"+i] = buyPrice;
		}
		
		var quantity = allRowsInGrid[i].quantity;
		if(quantity==undefined || quantity== null || quantity == "" ){
			alert("Enter Quantity");
			return false;
		}
		else{
			params["quantity"+i] = quantity;
		}
		
		var gst = allRowsInGrid[i].gst;
		if(gst==undefined || gst== null || gst == "" ){
			alert("Enter Gst")
			return false;
		}
		else{
			params["gst"+i] = gst;
		}
		
		var gstamt = allRowsInGrid[i].gstamt;
		params["gstamt"+i] = gstamt;

		var total = allRowsInGrid[i].total;
		params["total"+i] = total;
	}
	
	params["count"] = count;
	
   /* var supplierName =$('#supplierName').val();*/
	var grossTotal = $('#grossTotall').val();
	var storeDate = $('#storeDatee').val();
	var billNo = $('#billNoo').val();
	var supplierName = $("#supplierNamee").val();
	
	
	 var input = document.getElementById('supplierNamee'),
	     list = document.getElementById('dealerNamee_drop'),
	     	i,fkRootsupId;
		 		for (i = 0; i < list.options.length; ++i) 
		 		{
				     if (list.options[i].value === input.value) 
				     {
				    	 fkRootsupId = list.options[i].getAttribute('data-value');
				     }
		 		}

		 		
	params ["fkSupplierId"] = fkRootsupId;
	
	params ["supplierName"] = supplierName;
	
	/*params["supplierName"]=supplierName;*/
	 params["grossTotal"] = grossTotal;
	 params["billNo"] = billNo;
	 params["storeDate"] = storeDate;
	 
 	params["methodName"] = "addhostelManagementDetails";
 	
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
//ready to edit store inventory
function getStoreInventory1() {

	var params = {};
	var input = document.getElementById('storeLists1'), list = document
			.getElementById('storeInventoryList1'), i, fkstoreId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkstoreId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	$("#supplierName4").append($("<input/>").attr("value", "").text());
	$("#date4").append($("<input/>").attr("value", "").text());
	$("#billno4").append($("<input/>").attr("value", "").text());
	//$("#designation").append($("<input/>").attr("value", "").text());
	$("#quantity4").append($("<input/>").attr("value", "").text());
	$("#buy_price4").append($("<input/>").attr("value", "").text());
	$("#gst4").append($("<input/>").attr("value", "").text());
	$("#gstamt4").append($("<input/>").attr("value", "").text());
	$("#gross_total4").append($("<input/>").attr("value", "").text());
	params["fkstoreId"] = fkstoreId;
	params["methodName"] = "getstoreDetailToEdit1";
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
											
											document.getElementById("storeLists1").value = v.productName;
											document.getElementById("billno4").value = v.billNo;
											document.getElementById("quantity4").value = v.quantity;
											document.getElementById("buy_price4").value = v.buyPrice;
											document.getElementById("gst4").value = v.gst;
											var total=(v.quantity*v.buyPrice)/100*v.gst;
											document.getElementById("gstamt4").value = total;
											document.getElementById("gross_total4").value =(v.quantity*v.buyPrice)+total;
											document.getElementById("supplierName4").value = v.supplierName;
											document.getElementById("date4").value =v.insertDate;
											
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}
// calculation for store inventory
function getcalculation()
{
	var gst=document.getElementById("gst4").value;
	var quant=document.getElementById("quantity4").value;
	var buyprice=document.getElementById("buy_price4").value
	var total=(quant*buyprice)/100*gst;
	document.getElementById("gstamt4").value = total;
	var tota1=0;
	tota1=(quant*buyprice)+total;
	document.getElementById("gross_total4").value =tota1;
}

// update store inventory
function updatestoreInventory() {
	
	var params = {};
	var input = document.getElementById('storeLists1'), list = document
			.getElementById('storeInventoryList1'), i, fkstoreId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkstoreId = list.options[i].getAttribute('data-value');
		}
	}

	var productName4 = $('#storeLists1').val();
	var billno4 = $('#billno4').val();
	var quantity4 = $('#quantity4').val();
	var buy_price4 = $('#buy_price4').val();
	var gst4 = $('#gst4').val();
	var gstamt4 = $('#gstamt4').val();
	var gross_total4 = $('#gross_total4').val();
	var date4= $('#date4').val();
	var supplierName4 = $('#supplierName4').val();
	if (productName4 == undefined || productName4 == null
			|| productName4 == "") {
		alert("please select product name to Update");
		return false;
	}
	if (billno4 == undefined || billno4 == null || billno4 == "") {
		billno4 = "N/A";
	}
	if (quantity4 == undefined || quantity4 == null || quantity4 == "") {
		alert("please enter a Quantity to Update");
		return false;
	}
	if (buy_price4 == undefined || buy_price4 == null || buy_price4 == "") {
		alert("please enter buy price to Update");
		return false;
	}
	if (supplierName4 == undefined || supplierName4 == null || supplierName4 == "") {
		alert("please enter a supplier Name");
		return false;
	}
	if (gst4 == undefined || gst4 == null || gst4 == "") {
		gst4 = "'N/A'";
	}
	if (gstamt4 == undefined || gstamt4 == null || gstamt4 == "") {
		gstamt4 = "'N/A'";
	}
	if (gross_total4 == undefined || gross_total4 == null || gross_total4 == "") {
		gross_total4 = "'N/A'";
	}

	if(date4 ==undefined || date4 == null || date4 == "")
		{
		alert("please select Date");
		return false;
		}
	
	
	var params = {};
	params["fkstoreId"] = fkstoreId;
	params["productName4"] = productName4;
	params["billno4"] = billno4;
	params["quantity4"] = quantity4;
	params["buy_price4"] = buy_price4;
	params["gst4"] = gst4;
	params["gstamt4"] = gstamt4;
	params["gross_total4"] = gross_total4;
	params["date4"] = date4;
	params["supplierName4"] = supplierName4;
	params["methodName"] = "updateStoreInventoryDetails";
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




//edit kitchen inventory
function getKitchenInventory1() {

	var params = {};
	var input = document.getElementById('kitchenLists'), list = document
			.getElementById('kitchenInventoryList'), i, fkstoreId1;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkstoreId1 = list.options[i].getAttribute('data-value');
		}
	}
	
	$("#storeid").append($("<input/>").attr("value", "").text());
	$("#supplierName1").append($("<input/>").attr("value", "").text());
	$("#date1").append($("<input/>").attr("value", "").text());
	$("#billno1").append($("<input/>").attr("value", "").text());
	$("#quantity1").append($("<input/>").attr("value", "").text());
	$("#buy_price1").append($("<input/>").attr("value", "").text());
	$("#gst1").append($("<input/>").attr("value", "").text());
	$("#gstamt1").append($("<input/>").attr("value", "").text());
	$("#gross_total1").append($("<input/>").attr("value", "").text());
	params["fkstoreId1"] = fkstoreId1;
	params["methodName"] = "getKitchenDetailToEdit1";
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
											
											document.getElementById("kitchenLists").value = v.productName;
											document.getElementById("billno1").value = v.billNo;
											document.getElementById("quantity1").value = v.quantity;
											document.getElementById("buy_price1").value = v.buyPrice;
											document.getElementById("gst1").value = v.gst;
											var total=(v.quantity*v.buyPrice)/100*v.gst;
											document.getElementById("gstamt1").value = total;
											document.getElementById("gross_total1").value =(v.quantity*v.buyPrice)+total;
											document.getElementById("supplierName1").value = v.supplierName;
											document.getElementById("date1").value =v.date;
											document.getElementById("storeid").value =v.pk_store_management_id;
											
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}
// calculation for kitchen inventory
function getcalculation1()
{
	var gst=document.getElementById("gst1").value;
	var quant=document.getElementById("quantity1").value;
	var buyprice=document.getElementById("buy_price1").value
	var total=(quant*buyprice)/100*gst;
	document.getElementById("gstamt1").value = total;
	var tota1=0;
	tota1=(quant*buyprice)+total;
	document.getElementById("gross_total1").value =tota1;
}

// update Kitchen Inventory
function updatekitchenInventory() {
	var params = {};
	var input = document.getElementById('kitchenLists'), list = document
			.getElementById('kitchenInventoryList'), i, fkstoreId1;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkstoreId1 = list.options[i].getAttribute('data-value');
		}
	}

	var productName1 = $('#kitchenLists').val();
	var billno1 = $('#billno1').val();
	var quantity1 = $('#quantity1').val();
	var buy_price1 = $('#buy_price1').val();
	var gst1 = $('#gst1').val();
	var gstamt1 = $('#gstamt1').val();
	var gross_total1 = $('#gross_total1').val();
	var date1= $('#date1').val();
	var supplierName1 = $('#supplierName1').val();
	var storeid = $('#storeid').val();
	if (productName1 == undefined || productName1 == null
			|| productName1 == "") {
		alert("please select product to Update");
		return false;
	}
	if (billno1 == undefined || billno1 == null || billno1 == "") {
		billno1 = "N/A";
	}
	if (quantity1 == undefined || quantity1 == null || quantity1 == "") {
		alert("please enter a Quantity to Update");
		return false;
	}
	if (buy_price1 == undefined || buy_price1 == null || buy_price1 == "") {
		alert("please enter buy price to Update");
		return false;
	}
	if (supplierName1 == undefined || supplierName1 == null || supplierName1 == "") {
		alert("please enter a supplier Name");
		return false;
	}
	if (gst1 == undefined || gst1 == null || gst1 == "") {
		gst1 = "'N/A'";
	}
	if (gstamt1 == undefined || gstamt1 == null || gstamt1 == "") {
		gstamt1 = "'N/A'";
	}
	if (gross_total1 == undefined || gross_total1 == null || gross_total1 == "") {
		gross_total1 = "'N/A'";
	}

	if(date1 ==undefined || date1 == null || date1 == "")
		{
		alert("please select Date");
		return false;
		}
	var params = {};
	params["fkstoreId1"] = fkstoreId1;
	params["productName1"] = productName1;
	params["billno1"] = billno1;
	params["quantity1"] = quantity1;
	params["buy_price1"] = buy_price1;
	params["gst1"] = gst1;
	params["gstamt1"] = gstamt1;
	params["gross_total1"] = gross_total1;
	params["date1"] = date1;
	params["supplierName1"] = supplierName1;
	params["storeid"] = storeid;
	params["methodName"] = "updateKitchenInventoryDetails";
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

//get hostel Inventory to edit
function gethostelInventory1() {

	var params = {};
	var input = document.getElementById('HostelLists'), list = document
			.getElementById('HostelInventoryList'), i, fkhostelreId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkhostelreId = list.options[i].getAttribute('data-value');
		}
	}
	
	$("#billno2").append($("<input/>").attr("value", "").text());
	$("#supplierName2").append($("<input/>").attr("value", "").text());
	$("#hostelid").append($("<input/>").attr("value", "").text());
	
	//$("#designation").append($("<input/>").attr("value", "").text());
	$("#quantity2").append($("<input/>").attr("value", "").text());
	$("#buy_price2").append($("<input/>").attr("value", "").text());
	$("#total2").append($("<input/>").attr("value", "").text());
	params["fkhostelreId"] = fkhostelreId;
	params["methodName"] = "gethostelDetailToEdit1";
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
											
											document.getElementById("HostelLists").value = v.productName;
											document.getElementById("billno2").value = v.billNo;
											document.getElementById("supplierName2").value = v.supplierName;
											document.getElementById("hostelid").value = v.pkhostelid;
											document.getElementById("buy_price2").value = v.buyPrice;
											document.getElementById("quantity2").value = v.quantity;
											var total=(v.quantity*v.buyPrice);
											document.getElementById("total2").value = total;
											document.getElementById("date2").value =v.insertDate;
											
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}
// calculation for Hostel inventory
function getcalculation3()
{
	var quant=document.getElementById("quantity2").value;
	var buyprice=document.getElementById("buy_price2").value
	var total=(quant*buyprice);
	document.getElementById("total2").value =total;
}
//update Hostel inventory

function updateHostelInventory1(){
	var params = {};
	var input = document.getElementById('HostelLists'), list = document
			.getElementById('HostelInventoryList'), i, fkhostelreId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkhostelreId = list.options[i].getAttribute('data-value');
		}
	}
	var productName2 = $('#HostelLists').val();
	var billno2 = $('#billno2').val();
	var quantity2 = $('#quantity2').val();
	var buy_price2 = $('#buy_price2').val();
	var total2 = $('#total2').val();
	var date2= $('#date2').val();
	var supplierName2 = $('#supplierName2').val();
	var hostelid = $('#hostelid').val();
	if (productName2 == undefined || productName2 == null
			|| productName2 == "") {
		alert("please select product name to Update");
		return false;
	}
	if (billno2 == undefined || billno2 == null || billno2 == "") {
		billno2 = "N/A";
	}
	if (quantity2 == undefined || quantity2 == null || quantity2 == "") {
		alert("please enter a Quantity to Update");
		return false;
	}
	if (buy_price2 == undefined || buy_price2 == null || buy_price2 == "") {
		alert("please enter buy price to Update");
		return false;
	}
	if (supplierName2 == undefined || supplierName2 == null || supplierName2 == "") {
		alert("please enter a supplier Name");
		return false;
	}
	if (total2 == undefined || total2 == null || total2 == "") {
		total2 = "'N/A'";
	}

	if(date2 ==undefined || date2 == null || date2 == "")
		{
		alert("please select Date");
		return false;
		}
	var params = {};
	params["fkhostelreId"]= fkhostelreId;
	params["productName2"] = productName2;
	params["billno2"] = billno2;
	params["quantity2"] = quantity2;
	params["buy_price2"] = buy_price2;
	params["total2"] =total2;
	params["date2"] = date2;
	params["supplierName2"] = supplierName2;
	params["hostelid"] = hostelid;
	params["methodName"] = "updateHostelInventoryDetails";
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



















