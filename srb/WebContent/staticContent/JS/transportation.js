//get transportation detail to edit student transportation detail
function getTransportationDetails(){

	var params= {};
	
	var input = document.getElementById('studentName'),
     list = document.getElementById('studentNameList'),
     	i,fkRootSchoolId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootSchoolId = list.options[i].getAttribute('data-value');
			     }
	 		}
	//var studentName = $("#studentName").val();
	 		
	$("#DriverName").append($("<input/>").attr("value","").text());
	$("#leaveDateFrom").append($("<input/>").attr("value","").text());
	$("#ContactNo").append($("<input/>").attr("value","").text());
	$("#leaveDateTo").append($("<input/>").attr("value","").text());
	$("#Pincode").append($("<input/>").attr("value","").text());
	$("#payement").append($("<input/>").attr("value","").text());
	$("#Address").append($("<input/>").attr("value","").text());
	
	
	
	params["studentId"]= fkRootSchoolId;
	
	
	params["methodName"] = "getTransportationDetailsToEdit";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			      document.getElementById("DriverName").value = v.DriverName;
				  document.getElementById("leaveDateFrom").value = v.leaveDateFrom;
			      document.getElementById("ContactNo").value = v.ContactNo;
			      document.getElementById("leaveDateTo").value = v.leaveDateTo;
			      document.getElementById("Pincode").value = v.Pincode;
			      document.getElementById("payement").value = v.payement;
			      document.getElementById("Address").value = v.Address;
			      
			   
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    
}

function validationUpdateTransportationInfo(){
	
	if (document.edittmpd.studentName.value == "") {
		alert("Please Enter Student Name.");
		return false;
	}
	if (document.edittmpd.leaveDateFrom.value == "") {
		alert("Please Enter Date From.");
		return false;
	}
	if (document.edittmpd.ContactNo.value == "") {
		alert("Please Enter Contact No.");
		return false;
	}
	if (document.edittmpd.leaveDateTo.value == "") {
		alert("Please Enter Date To.");
		return false;
	}
	if (document.edittmpd.Pincode.value == "") {
		alert("Please Enter Pincode.");
		return false;
	}
	if (document.edittmpd.payement.value == "") {
		alert("Please Enter Fees.");
		return false;
	}
	if (document.edittmpd.Address.value == "") {
		alert("Please Enter Address.")
		return false;
	}
	
	
	updateTransportationInfo()
}	


//update transportation info
function updateTransportationInfo(){

	
	//document.edittmpd.btn.disabled = true;
	
	var params = {};
	document.edittmpd.btn.disabled = true;
	
	
	var input1 = document.getElementById('studentName'), list = document
	.getElementById('studentNameList'), i, fkRootStudentId;

for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input1.value) {
	fkRootStudentId = list.options[i].getAttribute('data-value');
}
}


	
	var leaveDateFrom = $('#leaveDateFrom').val();
	var DriverName = $('#DriverName').val();
	var leaveDateTo = $('#leaveDateTo').val();
	var ContactNo = $('#ContactNo').val();
	var Pincode = $('#Pincode').val();
	var studentName = $('#studentName').val();
	var payement = $('#payement').val(); 
	var Address = $('#Address').val();
	
	var params = {};
	
	params["studId"] = fkRootStudentId ;	
	params["studentName"] = studentName;
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