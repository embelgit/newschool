//get Division by Class Name
function getDivisionNameByClassNameng()
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
	
	params["methodName"] = "getDivisionNameByClassNameng";
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


//get student details for result entry
function getStudentDetailsAsPerClassAdDivisionng(){
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
	
	params["methodName"] = "getStudentNameAsPerClassAndDivng";
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


//savenirgum

function nirgumCertificateGenerator(){
	if(document.LeavingCertificate.fk_class_id1.value == ""){
		/*if(document.bonafidecertificate.fk_class_id1.value == "")*/
		alert("Please Select Class Name.");
		return false;
	}
	if(document.LeavingCertificate.fk_division_id.value == ""){
		/*if(document.bonafidecertificate.fk_class_id1.value == "")*/
		alert("Please Select Division Name.");
		return false;
	}
	if(document.LeavingCertificate.fk_Student_id.value == ""){
		/*if(document.bonafidecertificate.fk_class_id1.value == "")*/
		alert("Please Select Student Name.");
		return false;
	}
	
	if(document.LeavingCertificate.nirgumdate.value == ""){
		alert("Please Select nirgum date");
		return false;
	}
	
	if(document.LeavingCertificate.place.value == ""){
		alert("Please Select place");
		return false;
	}
/*	if(document.LeavingCertificate.reason.value == ""){
		if(document.bonafidecertificate.fk_class_id1.value == "")
		alert("Please Enter Reason");
		return false;
	}*/
/*	if(document.LeavingCertificate.idMarks.value == ""){
		if(document.bonafidecertificate.fk_class_id1.value == "")
		alert("Please Enter Identity Marks");
		return false;
	}*/
/*	if(document.LeavingCertificate.promotion.value == ""){

		alert("Please Enter Pramotion");
		return false;
	}*/
	/*if(document.LeavingCertificate.promotion.value == ""){

		alert("Please Enter Pramotion");
		return false;
	}
	if(document.LeavingCertificate.progress.value == ""){

		alert("Please Enter Progress of Student");
		return false;
	}
	if(document.LeavingCertificate.dateOfLeaving.value == ""){

		alert("Please Enter Date Of Leaving");
		return false;
	}
	if(document.LeavingCertificate.conduct.value == ""){

		alert("Please Enter Conduct");
		return false;
	}
	if(document.LeavingCertificate.attendance.value == ""){
		alert("Please Enter attendance");
		return false;
	}
	if(document.LeavingCertificate.workingday.value == ""){
		alert("Please Enter working day");
		return false;
	}*/
	nirgumCertificateGenerator1();
}


//LC generator
function nirgumCertificateGenerator1()
{	
	var pkStudentId = $('#fk_Student_id').val();
	
	
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
	i,fk_class_id;


	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input = document.getElementById('fk_division_id'),
	list = document.getElementById('division'),
	i,fk_div_id;

	
	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_div_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	
	var idMarks = $('#idMarks').val();
	if(idMarks == "" || idMarks == null || idMarks == undefined){
		idMarks = "NA";
	}
	var reason = $('#reason').val();
	var promotion = $('#promotion').val();
	var progress = $('#progress').val();
	var conduct = $('#conduct').val();
	var dateOfLeaving = $('#dateOfLeaving').val();
	var attendance = $('#attendance').val();
	var workingday = $('#workingday').val();
	var addclass = $('#addclass').val();
	var officer = $('#officer').val();
	var nirgumclass = $('#nirgumclass').val();
	var nirgumdate = $('#nirgumdate').val();
	var place= $('#place').val();

	if(reason == "" || reason == null || reason == undefined){
		reason = "NA";
	}
	if(promotion == "" || promotion == null || promotion == undefined){
		promotion = "NA";
	}
	if(progress == "" || progress == null || progress == undefined){
		progress = "NA";
	}
	if(conduct == "" || conduct == null || conduct == undefined){
		conduct = "NA";
	}
	if(dateOfLeaving == "" || dateOfLeaving == null || dateOfLeaving == undefined){
		dateOfLeaving = "2020-01-01";
	}
	if(attendance == "" || attendance == null || attendance == undefined){
		attendance = "00";
	}
	if(workingday == "" || workingday == null || workingday == undefined){
		workingday = "00";
	}
	
	if(addclass == "" || addclass == null || addclass == undefined){
		addclass = "NA";
	}
	if(officer == "" || officer == null || officer == undefined){
		officer = "NA";
	}
	if(nirgumclass == "" || nirgumclass == null || nirgumclass == undefined){
		nirgumclass = "NA";
	}
	
	var params= {};
	
	params["fk_class_id"] = fk_class_id;
	params["fk_div_id"] = fk_div_id;
	params["idMarks"] = idMarks;
	params["reason"] = reason;
	params["promotion"] = promotion;
	params["progress"] = progress;
	params["conduct"] = conduct;
	params["dateOfLeaving"] = dateOfLeaving;
	params["attendance"] = attendance;
	params["workingday"] = workingday;
	params["pkStudentId"] = pkStudentId;
	
	params["addclass"] = addclass;
	params["officer"] = officer;
	params["nirgumclass"] = nirgumclass;
	params["nirgumdate"] = nirgumdate;
	params["place"]= place;
	
	
//	alert(nirgumdate);
	
 	params["methodName"] = "viewnirgumCertificate";
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data) 
 			
 	    	{
 				alert(data);
 				
//	 			window.open("view_leaving_certificate.jsp");
// 				window.open("leaving_certificate.jsp"); 			
 				window.open("nirgum.jsp");	
 				/*location.reload();*/
 				location.reload();
 			}
 		
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	
 	    	})

}