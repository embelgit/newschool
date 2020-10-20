//Adding expense detail
function addExpenseDetails(){
	if(document.expenseDetails.expenseName.value == "")
	{
		alert("Please Enter Expenditure Name");
		return false;
	}	
	var letterNumber = /^[a-zA-Z0-9, ]+$/;
	if(document.expenseDetails.expenseName.value.match(letterNumber))
	{
		addExpense();
	}
	else
	{
		alert("Enter Alphabates And Numbers Only in Expense name field..!!");
		return false;
	}	
}

function addExpense() {

	document.expenseDetails.btn.disabled = true;
	var expenseName = $('#expenseName').val();
	var params = {};

	params["expenseName"] = expenseName;
	params["methodName"] = "addExpenseDetails";

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


//For deleting expenditure
function deleteExp(){
	
	var input = document.getElementById('expenseName'),
    list = document.getElementById('cat_drop'),
    i,expenseName;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	expenseName = list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	
	params["expenseName"] =expenseName;
	
	params["methodName"] = "deleteExp";
	
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


function reset() {
	document.expenseDetails.reset();
}

function addExpenseForBillingAndGoodsReceive() {

	document.expenseDetails1.btn1.disabled = true;
	var expenseName = $('#expenseNameForBilling').val();
	var params = {};

	params["expenseName"] = expenseName;
	params["methodName"] = "addExpenseDetailsForBilling";

	$.post('/Fertilizer/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		if (document.expenseDetails1) {
			document.expenseDetails1.reset();
		}
		document.expenseDetails1.btn1.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

//

function updateexp()
{
	var oldexp = $('#fk_class_id').val();
	var exp = $('#exp').val();
	if(oldexp=="" || oldexp == null || oldexp==undefined)
	{
		alert("Please select Expenditure Name");
		return false;
	}
	if(exp=="" || exp == null || exp==undefined)
	{
		alert("Please Enter New Expenditure");
		return false;
	}
	updateexp1();
}
function updateexp1()
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

	 		

		var exp = $('#exp').val();
		
		params["fk_class_id"] = fkRootClassId;
		params["expname"] = exp;
	
		params["methodName"] = "updateexpendt";
		
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