function validationProductDetailsNew()
{
	/*var productName = $("#productName").val();
	var unit = $("#unit").val();
	var quantityLimit = $("#quantityLimit").val();
	*/
	
	if(document.Productname.productNameDetail.value =="")
	{
		alert("Please enter product name");
		return false;
	}
	
	if(document.Productname.unit.value =="")
	{
		alert("Please select unit");
		return false;
	}
	
	if(document.Productname.quantityLimit.value =="")
	{
		alert("Please enter Quantity Limit");
		return false;
	}
	
	
	addProductDetails();
}

function addProductDetails()
{
	var productNameDetail = $("#productNameDetail").val();
	var unit = $("#unit").val();
	var quantityLimit = $("#quantityLimit").val();
	var Description = $("#Description").val();
	var param = {};
	
	param["productNameDetail"] = productNameDetail;
	param["unit"] = unit;
	param["quantityLimit"] = quantityLimit;
	param["Description"] = Description;
	param["methodName"] = "addProductDetails";
 	
	$.post('/srb/JSP/utility/controller.jsp',param,function(data)
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


function getProductDetails()
{
	
	$("#newProductName").append($("<input/>").attr("value","").text());
	$("#unit").append($("<input/>").attr("value","").text());
	$("#quantityLimit").append($("<input/>").attr("value","").text());
	$("#unit").append($("<input/>").attr("value","").text());
	$("#desp").append($("<input/>").attr("value","").text());
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
		
		
	params["fkProductId"] = fkProductId;
	
	params["methodName"] = "getProductDetails";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
			
				  document.getElementById("newProductName").value = v.productName;
				document.getElementById("unit").value = v.unit;
				 // $("#unit").append($("<option></option>").attr("value",v.unit).text(v.unit)); 
				 // $("#unit").append($("<option></option>").attr("value",(v.unit)).attr("data-value",(v.unit)));
				  document.getElementById("quantityLimit").value = v.ProductLimit;
				  document.getElementById("desp").value = v.description;
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
	
}

//update Product Details
function updateProductDetails()
{

	
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
		
		
		
	var productName2 = $("#productName2").val();
	var newProductName = $("#newProductName").val();
	
	var unit = $("#unit").val();
	var quantityLimit = $("#quantityLimit").val();
	var desp= $("#desp").val();
	
	
	var param = {};
	
	param["fkProductId"] = fkProductId;
	param["productName"] = productName2;
	
	param["newProductName"] = newProductName;
	param["unit"] = unit;
	param["quantityLimit"] = quantityLimit;
	param["desp"] = desp;
	param["methodName"] = "updateProductDetails";
 	
	$.post('/srb/JSP/utility/controller.jsp',param,function(data)
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












