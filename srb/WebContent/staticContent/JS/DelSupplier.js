function delSupplier(){
	
	if(document.delSup.supplier.value == "")
	{
		//alert("Please Select Supplier");
		//return false;
		/*$.getScript('/srb/staticContent/js/bootbox.min.js', function() 
				{
	
			var msg="Please Enter Supplier name";
			var dialog = bootbox.dialog({
				//title: "Embel Technologies Says :",
			    message: '<p class="text-center">'+msg.fontcolor("red").fontsize(5)+'<img src="/srb/staticContent/images/s1.jpg" height="50" width="50"/></p>',
			    closeButton: false
			});
			
			setTimeout(function() {
				dialog.modal('hide');
			}, 1500);
			
			return false;
			
				});*/
		
		var msg="Please Enter Supplier name";
		var dialog = bootbox.dialog({
			//title: "Embel Technologies Says :",
		    message: '<p class="text-center">'+msg.fontcolor("red").fontsize(5)+'</p>',
		    closeButton: false
		});
		
		/*setTimeout(function() {
			dialog.modal('hide');
		}, 1500);									
	 */
		return false;
	}	
	/*var letterNumber = /^[a-zA-Z]+$/;
	if(document.delCust.delCustName.value.match(letterNumber))
	{*/
	//deleteSupplier();

	
	/*else
	{
		alert("Enter Alphabates And Numbers Only in Godown name field..!!");
		return false;
	}	*/
}

function deleteSupplier(){
	document.getElementById("btn").disabled = true;
	var input = document.getElementById('supplier'),
    list = document.getElementById('sup_drop'),
    i,supplier;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	supplier = list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	
	params["supplier"] =supplier;
	
	params["methodName"] = "deletSupplier";
	
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

//


function delproduct(){
	
	if(document.delpro.supplier.value == "")
	{
		alert("Please select product Name");
		return false;
	}	
	delproduct1();
}

function delproduct1(){
	document.getElementById("btn").disabled = true;
	var input = document.getElementById('supplier'),
    list = document.getElementById('sup_drop'),
    i,supplier;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	supplier = list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	
	params["pro_id"] =supplier;
	
	params["methodName"] = "deletproducts";
	
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

//del store
function delstoreproduct(){
	
	if(document.delstrpro.supplier.value == "")
	{
		alert("Please select product Name");
		return false;
	}	
	delstoreproduct1();
}

function delstoreproduct1(){
	document.getElementById("btn").disabled = true;
	var input = document.getElementById('supplier'),
    list = document.getElementById('sup_drop'),
    i,supplier;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	supplier = list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	
	params["strpro_id"] =supplier;
	
	params["methodName"] = "deletstoreproducts";
	
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

//kitcn
function delkitchenproduct(){
	
	if(document.delkitpro.supplier.value == "")
	{
		alert("Please select product Name");
		return false;
	}	
	delkitchenproduct1();
}

function delkitchenproduct1(){
	document.getElementById("btn").disabled=true;
	var input = document.getElementById('supplier'),
    list = document.getElementById('sup_drop'),
    i,supplier;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	supplier = list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	
	params["kitpro_id"] =supplier;
	
	params["methodName"] = "deletkitchenproducts";
	
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
///


function delhostelproduct(){
	
	if(document.delkitpro.supplier.value == "")
	{
		alert("Please select product Name");
		return false;
	}	
	delhostelproduct1();
}

function delhostelproduct1(){
	
	var input = document.getElementById('supplier'),
    list = document.getElementById('sup_drop'),
    i,supplier;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	supplier = list.options[i].getAttribute('data-value');
    	}
	}
	document.getElementById("btn").disabled=true;
	var params = {};
	
	params["hostel_id"] =supplier;
	
	params["methodName"] = "delethostelproducts";
	
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
// delete supplier payment
function deleteSupplierPayment()
{
	document.getElementById("btn").disabled=true;
	var input = document.getElementById('supplierpay'),
    list = document.getElementById('supay_drop'),
    i,suppId;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	suppId= list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	params["suppId"] =suppId;
	
	params["methodName"] ="deletSupplierPayment";
	
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
//delete Teacher Payment
function deleteEmployeePayment()
{
if(document.delemppay.emppay.value==null ||	document.delemppay.emppay.value=="" || document.delemppay.emppay.value==undefined)
	{
	alert("Please Select TeacherName To Delete")
	return false;
	}
deleteEmployeePaymenet1();
}
function deleteEmployeePaymenet1()
{
	document.getElementById("btn").disabled=true;
	var input = document.getElementById('emppay'),
    list = document.getElementById('Epay_drop'),
    i,teacherPayId;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	teacherPayId= list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	params["teacherPayId"] =teacherPayId;
	
	params["methodName"] ="deletTeacherPayment";
	
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

