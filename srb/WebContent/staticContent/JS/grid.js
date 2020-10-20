function getProductDetailsByProductName(){

	var params= {};
	//var itemparams={};
	productId = $('#proName').val();
	
	$("#proName option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var proName = splitText[0];
	var company = splitText[1];
	var weight = splitText[2];
	
	params["proName"]= proName;
	params["company"]= company;
	params["weight"]= weight;
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getProductDetails1";
	$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
 	    	{
			  var jsonData = $.parseJSON(data);
				
		      // $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid");
			
	        
		     $.each(jsonData,function(i,v)
				{
		    	 
		    	 
		        function sumFmatter (cellvalue, options, rowObject)
		        {
		            
		        	var tax = options.rowData.vatPercentage;
		        	
		        	if(tax == 0){
		        		var tot= (options.rowData.quantity * options.rowData.salePrice);
		        		if(isNaN(tot)){
		        			tot = 0;
						}
		        	}
		        	if(tax != 0){
		        		
		        		var taxcalculation = (tax/100)* Number(options.rowData.salePrice);
		        		var newSalePrice = Number(taxcalculation) + Number(options.rowData.salePrice)
		        		var tot= (Number(options.rowData.quantity) * Number(newSalePrice));
		        		if(isNaN(tot)){
		        			tot = 0;
						}
		        	}
		        	var jam=0;
		        	
		        	
		        	count = jQuery("#list4").jqGrid('getGridParam', 'records');
		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
		        	var AllRows=JSON.stringify(allRowsInGrid1);
		        	for (var i = 0; i < count; i++) {
		        		
		            	var quantity = allRowsInGrid1[i].quantity;
		             	params["quantity"+i] = quantity;
		             	
		             	var salePrice = allRowsInGrid1[i].salePrice;
		            	params["salePrice"+i] = salePrice;
		            	
		            	var vatPercentage = allRowsInGrid1[i].vatPercentage;
		            	params["vatPercentage"+i] = vatPercentage;
		            	
		            	if(vatPercentage == 0){
		            		
		            		var totals1=(salePrice)*(quantity);
		            		if(isNaN(totals1)){
			             		totals1 = 0;
							}
			            	jam = jam + totals1;
		            	}
		            	
		                if(vatPercentage != 0){
		                	
		                	var taxcal = (vatPercentage/100) * salePrice;
		                	var newSalePrice = Number(salePrice) + Number(taxcal);
		                	var totals1=(Number(newSalePrice)*Number(quantity));
		                	if(isNaN(totals1)){
			             		totals1 = 0;
							}
			            	jam = jam + totals1;
		                }                	
		            	
	            	
	        	    }
		        	
		        		
		        		 document.getElementById("totalWithExpense").value = jam;
		        	
		            	 return tot;

		        }
		        
		         count = jQuery("#list4").jqGrid('getGridParam', 'records'); 
			     var rowdata =$("#list4").jqGrid('getGridParam','data');
			     var ids = jQuery("#list4").jqGrid('getDataIDs');
				 
				
				  var prodName,com,packing,unit;
				  for (var j = 0; j < count; j++) 
				  {
					  prodName = rowdata[j].itemName;
					  com = rowdata[j].companyName;
					  packing = rowdata[j].weight;
					  unit = rowdata[j].unitName;
					
					 var rowId = ids[j];
					 var rowData = jQuery('#list4').jqGrid ('getRowData', rowId);
					
					if (prodName == jsonData.offer.itemName && com == jsonData.offer.companyName && packing == jsonData.offer.weight && unit == jsonData.offer.unitName) {
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
			
			
			$("#list4").jqGrid({
				datatype: "local",
				
				colNames:['en','ItemName','mo','oom','pom','Quantity', 'UnitPrice','MRP','TaxPercentage' ,'Total'],
				colModel:[ 
						     {
						    	 name:'en',
						    	 hidden:true,
						     },
				          
	               
				     {	name:'itemName',
				    	 width:150,
						
					},
					
				     {	name:'mo',
				    	 width:150,
						
					},
				           
				   
					{	name:'weight',
						width:100,
						
						
					},
					{	name:'unitName',
						width:100,
						
						
					},
					{	name:'quantity',
						width:100,
						editable: true
						
					},

					{	name:'salePrice',
						width:150,
						editable: true
						
					},
					{	name:'mrp',
						width:140,
						editable: true
						
					},
					
					{	name:'vatPercentage',
						width:100,
						editable: true
						
					},
					{	name:'total',
						width:150,
						formatter: sumFmatter
					},
					
					
				],
					
				
				sortorder : 'desc',
				loadonce: false,
				viewrecords: true,
				width: 1200,
	            height: 350,
	            rowheight: 300,
	            hoverrows: true,
		        rownumbers: true,
	            rowNum: 10,
	            'cellEdit':true,
		           afterSaveCell: function () {
		        	   // $(this).trigger('reloadGrid');
		        	   var rowId =$("#list4").jqGrid('getGridParam','selrow');  
	                var rowData = jQuery("#list4").getRowData(rowId);
	             	var quantity = rowData['quantity'];
	             	var salePrice = rowData['salePrice'];
	             	
	             	var tota = quantity * salePrice;
	             	
	             	$("#list4").jqGrid("setCell", rowId, "total", tota);
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