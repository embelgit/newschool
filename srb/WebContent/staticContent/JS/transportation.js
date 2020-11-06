//get transportation detail to edit student transportation detail
function getTransportationDetails(){

	var params= {};
	
	var input = document.getElementById('studentName12'),
     list = document.getElementById('studentNameList12'),
     	i,fkRootSchoolId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootSchoolId = list.options[i].getAttribute('data-value');
			     }
	 		}
	//var studentName = $("#studentName").val();
	 		
	$("#DriverName12").append($("<input/>").attr("value","").text());
	$("#leaveDateFrom12").append($("<input/>").attr("value","").text());
	$("#ContactNo12").append($("<input/>").attr("value","").text());
	$("#leaveDateTo12").append($("<input/>").attr("value","").text());
	$("#Pincode12").append($("<input/>").attr("value","").text());
	$("#payement12").append($("<input/>").attr("value","").text());
	$("#Address12").append($("<input/>").attr("value","").text());
	
	
	
	params["studentId"]= fkRootSchoolId;
	
	
	params["methodName"] = "getTransportationDetailsToEdit";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			      document.getElementById("DriverName12").value = v.DriverName;
				  document.getElementById("leaveDateFrom12").value = v.leaveDateFrom;
			      document.getElementById("ContactNo12").value = v.ContactNo;
			      document.getElementById("leaveDateTo12").value = v.leaveDateTo;
			      document.getElementById("Pincode12").value = v.Pincode;
			      document.getElementById("payement12").value = v.payement;
			      document.getElementById("Address12").value = v.Address;
			      
			   
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    
}
function validationUpdateTransportation3(){
	if (document.edittmpd.studentName12.value == "") {
		alert("Please Select Student Name");
		return false;
	}
	if (document.edittmpd.leaveDateFrom12.value == "") {
		alert("Please Enter Date From.");
		return false;
	}
	
	if (document.edittmpd.ContactNo12.value == "") {
		alert("Please Enter Contact No.");
		return false;
	}
	var num3=/^[0-9]{10}$/;
	if(document.edittmpd.ContactNo12.value.match(num3) && document.edittmpd.ContactNo12.value!="9999999999" && document.edittmpd.ContactNo12.value!="000000000")
	{
		
	if (document.edittmpd.leaveDateTo12.value == "") {
		alert("Please Enter Date To.");
		return false;
	}
	
	if (document.edittmpd.Pincode12.value == "") {
		alert("Please Enter Pincode.");
		return false;
	}
	var num4=/^[0-9]{6}$/;
	if(document.edittmpd.Pincode12.value.match(num4) && document.edittmpd.Pincode12.value !="000000" && document.edittmpd.Pincode12.value !="999999")
		{
		if(document.edittmpd.payement12.value == "") {
			alert("Please Enter Fees.");
			return false;
		}
		if(document.edittmpd.Address12.value == "") {
			alert("Please Enter Address.");
			return false;
		}
		updateTransportationInfo2();
		}
	else
		{
		alert("Enter a valid Pincode");
		return false;
		}
	
	}
	else
	{
	alert("Please Enter Valid Contact.");
	return false;
	}
	//var num3=/^[0-9]{10}$/;
	//if(document.edittmpd.ContactNo12.value.match(num3) && document.edittmpd.ContactNo12.value!="9999999999" && document.edittmpd.ContactNo12.value!="0000000000")
		//{
		
		/*var num4=/^[0-9]{6}$/;
		if(document.edittmpd.Pincode12.value.match(num4) && document.edittmpd.Pincode12.value!="000000" && document.edittmpd12.Pincode12.value!="999999")
			{
			
			
			}
		else
			{
			alert("enter valid Pincode");
			return false;
			}
		
		}*/
	
}	


//update transportation info
function updateTransportationInfo2(){
	var params = {};
	var input1 = document.getElementById('studentName12'), list = document
	.getElementById('studentNameList12'), i, fkRootStudentId;

for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input1.value) {
	fkRootStudentId = list.options[i].getAttribute('data-value');
}
}
	var leaveDateFrom = $('#leaveDateFrom12').val();
	var DriverName = $('#DriverName12').val();
	var leaveDateTo = $('#leaveDateTo12').val();
	var ContactNo = $('#ContactNo12').val();
	var Pincode = $('#Pincode12').val();
	var payement = $('#payement12').val(); 
	var Address = $('#Address12').val();
	var params = {};
	
	params["studId1"] = fkRootStudentId;	
	params["leaveDateFrom"] = leaveDateFrom;
	params["DriverName"] = DriverName;
	params["leaveDateTo"] = leaveDateTo;
	params["ContactNo"] = ContactNo;
	params["Pincode"] = Pincode;
	params["payement"] = payement;
	params["Address"] = Address;
	//params["fk_class_id1"] = fk_class_id1;
	params["methodName"] = "updateTransportationDetails";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data){
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

//validation of Transportation
function deleteTransportationDetails()
{
	if(document.delstrpro13.field4.value==null||document.delstrpro13.field4.value==""||document.delstrpro13.field4.value==undefined)
{
alert("Please Select Field");
return false;
}
	deleteTransportationDetails1();
}

function deleteTransportationDetails1()
{
	var input = document.getElementById('field4'),
    list = document.getElementById('field_drop4'),
    i,TransportId;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	TransportId= list.options[i].getAttribute('data-value');
    	}
	}
	document.getElementById("btn").disabled=true;
	var params = {};
	params["TransportId"] =TransportId;
	
	params["methodName"] ="deletTransportation";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
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