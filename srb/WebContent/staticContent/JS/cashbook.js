//student payment validation
function doStudentPaymentValidation(){
if(document.studentPayment.fk_class_id1.value == "")
	{
		alert("Please Enter Class Name.");
		return false;
	}
if(document.studentPayment.fk_division_id.value == "")
{
	alert(" Please Enter Division Name.");
	return false;
}
/*if(document.studentPayment.studentName.value == "")
{
	alertify.alert("Embel Technologies says --> Please Enter Student Name.");
	return false;
}*/
if(document.studentPayment.academicYear4.value == "")
{
	alert("Please Enter Academic Year.");
	return false;
}
if(document.studentPayment.accountantName.value == "")
{
	alert(" Please Enter Accountant Name.");
	return false;
}
if(document.studentPayment.payingFee.value == "")
{
	alert("Please Enter Paying Fee Amount.");
	return false;
}
if(document.studentPayment.paymentMode.value == "selected")
{
	alert(" Please Select Payment Mode.");
	return false;
}
if(document.studentPayment.expectedPaymentDate.value == "")
{
	alert(" Please Select Expected Payment Date.");
	return false;
}
doStudentPayment()
}

//add student payment
function doStudentPayment(){
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
	
	

	/*var input1 = document.getElementById('fk_Student_id'),
	list = document.getElementById('studentNameList'),
	i,fk_Student_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_Student_id = list.options[i].getAttribute('data-value');
		}
	}*/
	
	$("#fk_Student_id option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(" ");
	
	var firstName = splitText[0];
	var middleName = splitText[1];
	var lastName = splitText[2];
	var className = $('#fk_class_id1').val();
	var divisionName = $('#fk_division_id').val();
	var totalAnnualFee = $('#totalAnnualFee').val();
	var academicYear = $('#academicYear4').val();
	var remainingFee = $('#remainingFee').val();
	var accountantName = $('#accountantName').val();
	var payingFee = $('#payingFee').val();
	var expectedPaymentDate = $('#expectedPaymentDate').val();
	var paymentMode = $('#paymentMode').val();
	var chequeNum = $('#chequeNum').val();
	var nameOnCheck = $('#nameOnCheck').val();
	var cardNum = $('#cardNum').val();
	var accNum = $('#accNum').val();
	var bankName = $('#bankName').val();
	var fk_Student_id = $('#fk_Student_id').val();
	var studenttype = $('#studenttype').val();
	var namankit = $('#namankit').val();
	
	
	if(paymentMode==undefined || paymentMode== null || paymentMode == "" ){
		paymentMode="'N/A'";
	}
	
	if(chequeNum==undefined || chequeNum== null || chequeNum == "" ){
		chequeNum="'N/A'";
	}
	if(nameOnCheck==undefined || nameOnCheck== null || nameOnCheck == "" ){
		nameOnCheck="'N/A'";
	}
	if(cardNum==undefined || cardNum== null || cardNum == "" ){
		cardNum="'N/A'";
	}
	if(accNum==undefined || accNum== null || accNum == "" ){
		accNum="'N/A'";
	}
	if(bankName==undefined || bankName== null || bankName == "" ){
		bankName="'N/A'";
	}
	
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["className"] = className;
	params["divisionName"] = divisionName;
	params["fk_Student_id"] = fk_Student_id;
	params["firstName"] = firstName;
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["academicYear"] = academicYear;
	params["accountantName"] = accountantName;
	params["totalAnnualFee"] = totalAnnualFee;
	params["remainingFee"] = remainingFee;
	params["payingFee"] = payingFee;
	params["expectedPaymentDate"] = expectedPaymentDate;
	params["paymentMode"] = paymentMode;
	params["chequeNum"] = chequeNum;
	params["nameOnCheck"] = nameOnCheck;
	params["cardNum"] = cardNum;
	params["accNum"] = accNum;
	params["bankName"] = bankName;
	params["studenttype"] = studenttype;
	params["namankit"] = namankit;

	params["methodName"] = "doStudentPayment";
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
 	//		window.open("studentFeeReceiptPDF.jsp");
 			window.open("Feereceipt.jsp");
 			location.reload();
		
 			}
 		
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
}

//get student details for result entry
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
	//		$("#rollno").append($("<option></option>").attr("value",v.rollno));
				});
			})
}
var bill = new BillHelper();
function BillHelper(){
	//to get annual fee as per selected student
	this.getTotalAnnualFee =getTotalAnnualFee;
	this.getRemainingFeeForSelectedStudent=getRemainingFeeForSelectedStudent;
	this.StudentFeegetTotalAnnualFee = StudentFeegetTotalAnnualFee;
	this.Trasnsportationfee = Trasnsportationfee;
	
	
	function StudentFeegetTotalAnnualFee()
	{
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
		
		/*var input1 = document.getElementById('fk_Student_id'),
		list = document.getElementById('studentNameList'),
		i,fk_Student_id;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_Student_id = list.options[i].getAttribute('data-value');
			}
		}*/
		
		var fk_Student_id = $('#fk_Student_id').val();
		var selectedVal;
		$("#fk_Student_id option:selected").each(function() {
			   selectedVal = $(this).text();
			});
		
		var splitText = selectedVal.split(" ");
		var firstName = splitText[0];
		var middleName = splitText[1];
		var lastName = splitText[2];
		
		$("#totalAnnualFee").empty();
		$("#totalAnnualFee").append($("<input/>").attr("value","").text("Select Student Name"));
		params["fk_class_id"] = fk_class_id;
		params["fk_division_id"] = fk_division_id;
		//params["fk_Student_id"] = fk_Student_id;
		params["middleName"] = middleName;
		params["lastName"] = lastName;
		params["firstName"] =firstName;
		
		var count=0;
		var newrow;
		var rowId;
		
		params["methodName"] = "StudentFeegetTotalAnnualFee";
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
				//document.getElementById("totalAnnualFee").value = v.totalAmt;
				document.getElementById("totalAnnualFee").value = v.totalAnnualFee;
				document.getElementById("studenttype").value = v.studenttype;
				document.getElementById("namankit").value = v.namankittype;
				document.getElementById("rollno").value = v.rollno;
				//document.getElementById("remainingFee").value = v.totalAnnualFee;
				
				
					});
				})
			
		
		
				getRemainingFeeForSelectedStudent()
	}
	
	function Trasnsportationfee(){
		
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
		
		/*var input1 = document.getElementById('fk_Student_id'),
		list = document.getElementById('studentNameList'),
		i,fk_Student_id;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_Student_id = list.options[i].getAttribute('data-value');
			}
		}*/
		
		var studentName = $('#studentName').val();
		/*var selectedVal;
		$("#studentName option:selected").each(function() {
			   selectedVal = $(this).text();
			});
		
		var splitText = selectedVal.split(" ");
		var firstName = splitText[0];
		var middleName = splitText[1];
		var lastName = splitText[2];*/
		
		$("#totalAnnualFee").empty();
		$("#totalAnnualFee").append($("<input/>").attr("value","").text("Select Student Name"));
		params["fk_class_id"] = fk_class_id;
		params["fk_division_id"] = fk_division_id;
		params["studentName"] = studentName;
		//params["fk_Student_id"] = fk_Student_id;
		/*params["middleName"] = middleName;
		params["lastName"] = lastName;
		params["firstName"] =firstName;*/
		
		var count=0;
		var newrow;
		var rowId;
		
		params["methodName"] = "TrasnportionDetailsAllTotal";
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
				//document.getElementById("totalAnnualFee").value = v.totalAmt;
				document.getElementById("totalAnnualFee").value = v.totalAnnualFee;
				//document.getElementById("remainingFee").value = v.totalAnnualFee;
				
				
					});
				})
				TransportionBusRemainingFees();
			
	}
	
	function TransportionBusRemainingFees(){
		
		
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
		
		/*var input1 = document.getElementById('fk_Student_id'),
		list = document.getElementById('studentNameList'),
		i,fk_Student_id;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_Student_id = list.options[i].getAttribute('data-value');
			}
		}*/
		
		var studentName = $('#studentName').val();
		/*$("#studentName option:selected").each(function() {
			   selectedVal = $(this).text();
			});
		
		var splitText = selectedVal.split(" ");
		var firstName = splitText[0];
		var middleName = splitText[1];
		var lastName = splitText[2];
		*/
		$("#balanceAmountT").empty();
		params["fk_class_id"] = fk_class_id;
		params["fk_division_id"] = fk_division_id;
		params["studentName"] = studentName;
		/*params["firstName"] = firstName;
		params["middleName"] = middleName;
		params["lastName"] = lastName;*/
		
		var count=0;
		var newrow;
		var rowId;
		
		params["methodName"] = "TransportionBusRemainingFeesList";
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
		{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
				//document.getElementById("totalAnnualFee").value = v.totalAmt;
				document.getElementById("balanceAmountT").value = v.balanceFee;
					});
				})
	}
	
	
function getTotalAnnualFee(){
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
	
	var input1 = document.getElementById('fk_Student_id'),
	list = document.getElementById('studentNameList'),
	i,fk_Student_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_Student_id = list.options[i].getAttribute('data-value');
		}
	}
	
	//var studentName = $('#fk_Student_id').val();
	/*var selectedVal;
	$("#studentName option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(" ");
	var firstName = splitText[0];
	var middleName = splitText[1];
	var lastName = splitText[2];*/
	
	$("#totalAnnualFee").empty();
	$("#totalAnnualFee").append($("<input/>").attr("value","").text("Select Student Name"));
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["fk_Student_id"] = fk_Student_id;
	//params["middleName"] = middleName;
	//params["lastName"] = lastName;
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getTotalAnnualFeeOfStudent";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			//document.getElementById("totalAnnualFee").value = v.totalAmt;
			document.getElementById("totalAnnualFee").value = v.totalAnnualFee;
			//document.getElementById("remainingFee").value = v.totalAnnualFee;
			
			
				});
			})
		
			//call function to get remaining fee
			getRemainingFeeForSelectedStudent()
}

// to get remaining fee
function getRemainingFeeForSelectedStudent(){

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
	
	/*var input1 = document.getElementById('fk_Student_id'),
	list = document.getElementById('studentNameList'),
	i,fk_Student_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_Student_id = list.options[i].getAttribute('data-value');
		}
	}*/
	
	$("#fk_Student_id option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(" ");
	var firstName = splitText[0];
	var middleName = splitText[1];
	var lastName = splitText[2];
	
	$("#remainingFee").empty();
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	//params["fk_Student_id"] = fk_Student_id;
	params["firstName"] = firstName;
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getRemainingAnnualFeeOfStudent";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			//document.getElementById("totalAnnualFee").value = v.totalAmt;
			document.getElementById("remainingFee").value = v.balanceFee;
				});
			})
}
}
//compare remaining fee and paying fee
function payingFeeCompaireWithRemainingFee(){
	var remainingFee = $('#remainingFee').val();
	var payingFee = $('#payingFee').val();
	
	if(Number(payingFee)>Number(remainingFee)){
		alert("Paying Fee Should Be Less Than Remaining Fee");
		document.prd.creditSalePrice.value = null;
	}
}

//Adding Fee structure Details
function doFeeStructure(){

	if(document.studentPayment.fk_class_id1.value == "")
	{
		alert("Please Enter Class Name.");
		return false;
	}
if(document.studentPayment.fk_division_id.value == "")
{
	alert(" Please Enter Division Name.");
	return false;
}
/*if(document.studentPayment.studentName.value == "")
{
	alertify.alert("Embel Technologies says --> Please Enter Student Name.");
	return false;
}*/
/*if(document.studentPayment.totalAnnualFee.value == "")
{
	alert("Please Enter Total Annual Fee");
	return false;
}*/
if(document.studentPayment.academicYear4.value == "")
{
	alert("Please Enter Academic Year.");
	return false;
}
if(document.studentPayment.accountantName.value == "")
{
	alert(" Please Enter Accountant Name.");
	return false;
}
if(document.studentPayment.payingFee.value == "")
{
	alert("Please Enter Paying Fee Amount.");
	return false;
}
if(document.studentPayment.paymentMode.value == "selected")
{
	alert(" Please Select Payment Mode.");
	return false;
}
if(document.studentPayment.expectedPaymentDate.value == "")
{
	alert(" Please Select Expected Payment Date.");
	return false;
}

doFeeStructure1();

}

function doFeeStructure1(){
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
	
	
	$("#fk_Student_id option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(" ");
	
	var firstName = splitText[0];
	var middleName = splitText[1];
	var lastName = splitText[2];
	var className = $('#fk_class_id1').val();
	var divisionName = $('#fk_division_id').val();
	var totalAnnualFee = $('#totalAnnualFee').val();
	var academicYear = $('#academicYear4').val();
	var remainingFee = $('#remainingFee').val();
	var expectedPaymentDate = $('#expectedPaymentDate').val();
	var rollno = $('#rollno').val();

	/*var firstInstallment = $('#firstInstallment').val();
	var secondInstallment = $('#secondInstallment').val();*/
	var firstInstallment = 0;
	var secondInstallment = 0;
	
	var admissionfees = $('#admissionFees').val();
	var tuitionfees = $('#tuitionFees').val();	
	var medicalfees = $('#medicalFees').val();
	
//	var gatheringFees = $('#gatheringFees').val();
	
	var computerfees = $('#computerFees').val();
	var gymnassiumfees = $('#gymnassiumFees').val();
	var laboratoryfees = $('#laboratoryFees').val();
	var stationaryfees = $('#stationaryFees').val();
	
//	var activityFees = $('#activityFees').val();
	var examfees = $('#examFees').val();
	var competitivefees = $('#competitiveFees').val();
	var hostelfees = $('#hostelFees').val();
	var messfees = $('#messFees').val();
	
	var uniformfees = $('#uniformFees').val();
	var raincoat = $('#raincoat').val();
	var undergarments = $('#undergarments').val();
	var otherfees = $('#otherFees').val();
	
	var lumpsumfees = $('#lumpsumFees').val();
	var feedue = $('#feedue').val();
	

	
	/*if(firstInstallment==undefined || firstInstallment== null || firstInstallment == "" ){
		firstInstallment="'N/A'";
	}
	
	if(secondInstallment==undefined || secondInstallment== null || secondInstallment == "" ){
		secondInstallment="'N/A'";
	}*/

	if(admissionfees==undefined || admissionfees== null || admissionfees == "" ){
		admissionfees="0";
	}
	if(tuitionfees==undefined || tuitionfees== null || tuitionfees == "" ){
		tuitionfees="0";
	}
	if(medicalfees==undefined || medicalfees== null || medicalfees == "" ){
		medicalfees="0";
	}
	if(computerfees==undefined || computerfees== null || computerfees == "" ){
		computerfees="0";
	}
	if(gymnassiumfees==undefined || gymnassiumfees== null || gymnassiumfees == "" ){
		gymnassiumfees="0";
	}
	if(laboratoryfees==undefined || laboratoryfees== null || laboratoryfees == "" ){
		laboratoryfees="0";
	}
	if(stationaryfees==undefined || stationaryfees== null || stationaryfees == "" ){
		stationaryfees="0";
	}
	if(examfees==undefined || examfees== null || examfees == "" ){
		examfees="0";
	}
	
	if(competitivefees==undefined || competitivefees== null || competitivefees == "" ){
		competitivefees="0";
	}
	if(hostelfees==undefined || hostelfees== null || hostelfees == "" ){
		hostelfees="0";
	}
	if(messfees==undefined || messfees == null || messfees == "" ){
		messfees="0";
	}
	if(uniformfees==undefined || uniformfees== null || uniformfees == "" ){
		uniformfees="0";
	}
	if(raincoat==undefined || raincoat== null || raincoat == "" ){
		raincoat="0";
	}
	if(undergarments==undefined || undergarments== null || undergarments == "" ){
		undergarments="0";
	}
	if(otherfees==undefined || otherfees== null || otherfees == "" ){
		otherfees="0";
	}
	if(lumpsumfees==undefined || lumpsumfees== null || lumpsumfees == "" ){
		lumpsumfees="0";
	}
		
	if(totalAnnualFee == undefined || totalAnnualFee== null || totalAnnualFee == ""){
		totalAnnualFee = 0;
	}

	var aa = +admissionfees + +tuitionfees + +medicalfees + +computerfees + +gymnassiumfees + +laboratoryfees;
	var bb = +stationaryfees + +examfees + +competitivefees + +hostelfees + +messfees + +uniformfees + +raincoat + +undergarments + +otherfees + +lumpsumfees;
	
	var tot = +aa + +bb;
	
	if(+totalAnnualFee < +tot){
		alert("fee structure amount should be less than Annual fee amount");
		return false;
	}
	
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["className"] = className;
	params["divisionName"] = divisionName;
	/*params["fk_student_id"] = fk_student_id;*/
	params["firstName"] = firstName;
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["academicYear"] = academicYear;
	params["totalAnnualFee"] = totalAnnualFee;
	params["remainingFee"] = remainingFee;
	params["expectedPaymentDate"] = expectedPaymentDate;
	params["rollno"] = rollno;
	params["firstInstallment"] = firstInstallment;
	params["secondInstallment"] = secondInstallment;

	
//	params["gatheringFees"] = gatheringFees;
	
	params["admissionfees"] = admissionfees;
	params["tuitionfees"] = tuitionfees;
	params["medicalfees"] = medicalfees;
	params["computerfees"] = computerfees;
	params["gymnassiumfees"] = gymnassiumfees;
	params["laboratoryfees"] = laboratoryfees;
	params["stationaryfees"] = stationaryfees;
	params["examfees"] = examfees;
	params["competitivefees"] =competitivefees
	params["hostelfees"] = hostelfees;
	params["messfees"] = messfees;
	params["uniformfees"] = uniformfees;
	params["raincoat"] = raincoat;
	params["undergarments"] = undergarments;
	params["otherfees"] = otherfees;
	params["lumpsumfees"] = lumpsumfees;
	params["feedue"] = feedue;
//	alert("rollno - "+rollno);
	params["methodName"] = "doFeeStructure";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		//	   window.open("feeStructurePDF.jsp");

				
				//window.open("fee_structure.jsp");
				window.open("feestructure.jsp");
				location.reload();
	
		       
			}
 		
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
}

//get student details for result entry for Leaving Copy
function getStudentDetailsAsPerClassAdDivisionCopy(){
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

	$("#studentNameDrop").empty();
	$("#studentNameDrop").append($("<option></option>").attr("value","").text("Select Student Name"));
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	
	var count=0;
	var newrow;
	var rowId;
	
	params["methodName"] = "getStudentNameAsPerClassAndDivCopy";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			//document.getElementById("totalAnnualFee").value = v.totalAmt;
			$("#studentNameDrop").append($("<option></option>").attr("value",(v.firstName+" "+v.middleName+" "+v.lastName)).attr("data-value",(v.pkStudentId)));
/*			$("#division").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
*/			
				});
			})
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
//						$("#fk_division_id").append($("<option></option>").attr("value",(v.divisionName)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}



//get Division by Class Name for Duplicate Leaving Certificate
function getDivisionNameByClassNameForDuplicatrLeavingCertificate()
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




