// to add school info
function addSchoolInfo(){
	if(document.schoolFormName.schoolName.value == "")
	{
		alert("Enter Shool Name.");
		return false;
	}
	if(document.schoolFormName.city.value == "")
	{
		alert("Enter City Name.");
		return false;
	}
	if(document.schoolFormName.tq.value == "")
	{
		alert("Enter Taluka Name.");
		return false;
	}
	if(document.schoolFormName.district.value == "")
	{
		alert("Enter District Name.");
		return false;
	}
	if(document.schoolFormName.state.value == "")
	{
		alert("Enter state Name.");
		return false;
	}
	if(document.schoolFormName.pinCode.value == "")
	{
		alert("Enter pinCode Name.");
		return false;
	}
	var letterNumber = /^[0-9]{6}$/;
	if(document.schoolFormName.pinCode.value.match(letterNumber)){
		//SchoolInfo();
    }
	else
    {
    	alert("Enter 6 Digit Valid pin code");
		return false;
    }
	if(document.schoolFormName.instituteName.value == "")
	{
		alert("Enter institute Name.");
		return false;
	}
	if(document.schoolFormName.contactP.value == "")
	{
		alert("Enter Contact Number.");
		return false;
	}	
	var letterNumber = /^[0-9]{10}$/;
    if(document.schoolFormName.contactP.value.match(letterNumber)){
	SchoolInfo();
    }
	else
    {
    	alert("Enter  10 Digit Valid Mobile Number & Enter only Numbers");
		return false;
    }
}

//del ad enqiry
function DeleteaddInfo()
{
	var input = document.getElementById('stuid'),
    list = document.getElementById('student'),
    i,fk_School_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_School_id = list.options[i].getAttribute('data-value');
    	}
	}
	var stuname = $("#stuid").val();
	
	var params = {};
	params["fkaddid"] = fk_School_id;
	//params["delschoolName"] =delschoolName;
	
	params["methodName"] = "deleteaddenq";
	
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

//add school details
function SchoolInfo(){

var params = {};
	
	var schoolName = $('#schoolName').val();
	var city= $('#city').val();
	var tq = $('#tq').val();
	var district= $('#district').val();
	var state = $('#state').val();
	var pinCode= $('#pinCode').val();
	var instituteName = $('#instituteName').val();
	var contactP= $('#contactP').val();
	var address = $('#address').val();
	var sansthaName = $('#sansthaName').val();
	var schoolRegNumber= $('#schoolRegNumber').val();
	var schoolUdiseNumber = $('#schoolUdiseNumber').val();
	
	if(schoolName==undefined || schoolName== null || schoolName == "" ){
		schoolName="N/A";
	}
	if(city==undefined || city== null || city == "" ){
		city="N/A";
	}
	if(tq==undefined || tq== null || tq == "" ){
		tq="N/A";
	}
	if(district==undefined || district== null || district == "" ){
		district="N/A";
	}
	
	if(state==undefined || state== null || state == "" ){
		state="N/A";
	}
	if(pinCode==undefined || pinCode== null || pinCode == "" ){
		pinCode=0;
	}
	if(instituteName==undefined || instituteName== null || instituteName == "" ){
		instituteName="N/A";
	}
	if(contactP==undefined || contactP== null || contactP == "" ){
		contactP="N/A";
	}
	if(address==undefined || address== null || address == "" ){
		address="N/A";
	}
	if(sansthaName==undefined || sansthaName== null || sansthaName == "" ){
		sansthaName="N/A";
	}
	if(schoolRegNumber==undefined || schoolRegNumber== null || schoolRegNumber == "" ){
		schoolRegNumber="N/A";
	}
	if(schoolUdiseNumber==undefined || schoolUdiseNumber== null || schoolUdiseNumber == "" ){
		schoolUdiseNumber="N/A";
	}
	
	params["schoolName"] = schoolName;
	params["city"] = city;
	
	params["tq"] = tq;
	params["district"] = district;

	params["state"] = state;
	params["pinCode"] = pinCode;
	
	params["instituteName"] = instituteName;
	params["contactP"] = contactP;
	
	params["address"] = address;
	params["sansthaName"] = sansthaName;
	
	params["schoolRegNumber"] = schoolRegNumber;
	params["schoolUdiseNumber"] = schoolUdiseNumber;
	
params["methodName"] = "SchoolInfo";
 	
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

//get school detail to edit school detail
function getSchoolDetails(){

	var params= {};
	
	var input = document.getElementById('schoolName'),
     list = document.getElementById('schoolName_drop'),
     	i,fkRootSchoolId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootSchoolId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	$("#schoolName2").append($("<input/>").attr("value","").text());
	$("#city").append($("<input/>").attr("value","").text());
	$("#tq").append($("<input/>").attr("value","").text());
	$("#district").append($("<input/>").attr("value","").text());
	$("#state").append($("<input/>").attr("value","").text());
	$("#pinCode").append($("<input/>").attr("value","").text());
	$("#instituteName").append($("<input/>").attr("value","").text());
	$("#contactP").append($("<input/>").attr("value","").text());
	$("#address").append($("<input/>").attr("value","").text());
	$("#sansthaName").append($("<input/>").attr("value","").text());
	$("#schoolRegNumber").append($("<input/>").attr("value","").text());
	$("#schoolUdiseNumber").append($("<input/>").attr("value","").text());
	
	
	params["schoolId"]= fkRootSchoolId;
	
	
	params["methodName"] = "getSchoolDetailsToEdit";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			      document.getElementById("schoolName2").value = v.schoolName;
				  document.getElementById("city").value = v.city;
			      document.getElementById("tq").value = v.tq;
			      document.getElementById("district").value = v.district;
			      document.getElementById("state").value = v.state;
			      document.getElementById("pinCode").value = v.pinCode;
			      document.getElementById("instituteName").value = v.instituteName;
			      document.getElementById("contactP").value = v.contactP;
			      document.getElementById("address").value = v.address;
			      document.getElementById("sansthaName").value = v.sansthaName;
			      document.getElementById("schoolRegNumber").value = v.schoolRegNumber;
			      document.getElementById("schoolUdiseNumber").value = v.schoolUdiseNumber;
			   
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    
}

//update school info
function updateSchoolInfo(){

	
	document.editSchool.btn.disabled = true;
	
	var input = document.getElementById('schoolName'),
    list = document.getElementById('schoolName_drop'),
    	i,fkRootSchoolId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootSchoolId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	var schoolName = $('#schoolName2').val();
	var city = $('#city').val();
	var tq = $('#tq').val();
	var district = $('#district').val();				
	var state = $('#state').val();
	var pinCode = $('#pinCode').val();
	var instituteName = $('#instituteName').val();
	var contactP = $('#contactP').val();
	var address = $('#address').val();
	var sansthaName = $('#sansthaName').val();
	var schoolRegNumber = $('#schoolRegNumber').val();
	var schoolUdiseNumber = $('#schoolUdiseNumber').val();
	
	var params = {};
	
	params["schoolId"] = fkRootSchoolId;
	params["schoolName"] = schoolName;
	params["city"] = city;	
	params["tq"] = tq;
	params["district"] = district;
	params["state"] = state;
	params["pinCode"] =pinCode;
	params["instituteName"] = instituteName;
	params["contactP"] = contactP;
	params["address"] = address;
	params["sansthaName"] = sansthaName;
	params["schoolRegNumber"] = schoolRegNumber;
	params["schoolUdiseNumber"] = schoolUdiseNumber;
	
	
	params["methodName"] = "updateSchoolDetails";

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
//admission enquiry validatiom
function addAdmissionEnquiryValidation(){
	if(document.schoolFormName.fk_class_id1.value == "")
	{
		alert("Please Enter Class Name.");
		return false;
	}	
	if(document.schoolFormName.studentName.value == "")
	{
		alert(" Please Enter Student Name.");
		return false;
	}	
	if(document.schoolFormName.city.value == "")
	{
		alert(" Please Enter Village Name.");
		return false;
	}	
	if(document.schoolFormName.contactNumber.value == "")
	{
		alert(" Please Contact number.");
		return false;
	}
	if(document.schoolFormName.preSchoolN.value == ""){
		alert(" Please Enter Previous School Name");
		return false;
	}
	/* var letterNumber = /^[a-zA-Z]+$/;
	    if(document.schoolFormName.city.value.match(letterNumber)){
	    	//addAdmissionEnquiryInfo();
	    }
		else
	    {
	    	alert("Enter  Only Alphabates in Village Name ");
			return false;
	    }*/
	
	var letterNumber = /^[0-9]{10}$/;
    if(document.schoolFormName.contactNumber.value.match(letterNumber)){
    	//addAdmissionEnquiryInfo();
    }
	else
    {
    	alert("Enter  10 Digit Valid Mobile Number & Enter only Numbers");
		return false;
    }
   // var letterNumber = /^[a-zA-Z]+$/;
    var letterNumber = /^[a-zA-Z ]*$/;
    if(document.schoolFormName.preSchoolN.value.match(letterNumber)){
    	addAdmissionEnquiryInfo();
    }
	else
    {
    	alert("Enter  Only Alphabates in Previous School Name ");
		return false;
    }
}
//
function getstudentDetails(){

	var params= {};
	
	var input = document.getElementById('stuid'),
     list = document.getElementById('student'),
     	i,fkRootstuId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootstuId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	$("#classn").append($("<input/>").attr("value","").text());
	$("#studentName1").append($("<input/>").attr("value","").text());
	$("#email1").append($("<input/>").attr("value","").text());
	$("#parentName1").append($("<input/>").attr("value","").text());
	$("#city1").append($("<input/>").attr("value","").text());
	$("#contactNumber1").append($("<input/>").attr("value","").text());
	$("#address1").append($("<input/>").attr("value","").text());
	$("#preSchoolN1").append($("<input/>").attr("value","").text());
	$("#comments1").append($("<input/>").attr("value","").text());
	
	
	params["stuId"]= fkRootstuId;
	
	
	params["methodName"] = "getadmisiionToEdit";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{	
				document.getElementById("classn").value = v.className;
		
				  document.getElementById("studentName1").value = v.studentName;
			      document.getElementById("email1").value = v.email;
			      document.getElementById("parentName1").value = v.parentName;
			      document.getElementById("city1").value = v.city;
			      document.getElementById("contactNumber1").value = v.contactNumber;
			      document.getElementById("address1").value = v.address;
			      document.getElementById("preSchoolN1").value = v.preSchoolN;
			      document.getElementById("comments1").value = v.comments;
			   
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    
}


//add admission enquiry 
function addAdmissionEnquiryInfo(){

	var params = {};
	var input1 = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
	i,fkClassId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkClassId = list.options[i].getAttribute('data-value');
		}
	}

		var email = $('#email').val();
		var address= $('#address').val();
		var contactNumber = $('#contactNumber').val();
		var city= $('#city').val();
		var parentName = $('#parentName').val();
		var studentName= $('#studentName').val();
		var className = $('#fk_class_id1').val();
		var preSchoolN = $('#preSchoolN').val();
		
		var comments = $('#comments').val();
		
		
		if(email==undefined || email== null || email == "" ){
			email="'N/A'";
		}
		if(address==undefined || address== null || address == "" ){
			address="'N/A'";
		}
		if(contactNumber==undefined || contactNumber== null || contactNumber == "" ){
			contactNumber=0;
		}
		if(city==undefined || city== null || city == "" ){
			city="'N/A'";
		}
		
		if(parentName==undefined || parentName== null || parentName == "" ){
			parentName="'N/A'";
		}
		if(studentName==undefined || studentName== null || studentName == "" ){
			studentName="'N/A'";
		}
		if(className==undefined || className== null || className == "" ){
			className="'N/A'";
		}
		if(preSchoolN==undefined || preSchoolN== null || preSchoolN == "" ){
			preSchoolN="'N/A'";
		}

		if(comments==undefined || comments== null || comments == "" ){
			comments="N/A";
		}
		
		params["email"] = email;
		params["address"] = address;
		params["contactNumber"] = contactNumber;
		params["city"] = city;
		params["parentName"] = parentName;
		params["studentName"] = studentName;
		params["className"] = className;
		params["preSchoolN"] = preSchoolN;
		params["fkClassId"] = fkClassId;
		params["comments"] = comments;
		
	params["methodName"] = "addAdmissionEnquiryInfo";
	 	
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
//update
function updateaddInfo(){

	if(document.schoolFormName.fk_class_id1.value == "")
	{
		alert("Enter Class Name.");
		return false;
	}
	
	var params = {};
	var input1 = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
	i,fkClassId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkClassId = list.options[i].getAttribute('data-value');
		}
	}

	var input = document.getElementById('stuid'),
    list = document.getElementById('student'),
    	i,fkRootstuId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootstuId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	
		var email = $('#email1').val();
		var address= $('#address1').val();
		var contactNumber = $('#contactNumber1').val();
		var city= $('#city1').val();
		var parentName = $('#parentName1').val();
		var studentName= $('#studentName1').val();
		var className = $('#fk_class_id1').val();
		var preSchoolN = $('#preSchoolN1').val();
		
		var comments = $('#comments1').val();
		
		
		if(email==undefined || email== null || email == "" ){
			email="'N/A'";
		}
		if(address==undefined || address== null || address == "" ){
			address="'N/A'";
		}
		if(contactNumber==undefined || contactNumber== null || contactNumber == "" ){
			contactNumber=0;
		}
		if(city==undefined || city== null || city == "" ){
			city="'N/A'";
		}
		
		if(parentName==undefined || parentName== null || parentName == "" ){
			parentName="'N/A'";
		}
		if(studentName==undefined || studentName== null || studentName == "" ){
			studentName="'N/A'";
		}
		if(className==undefined || className== null || className == "" ){
			className="'N/A'";
		}
		if(preSchoolN==undefined || preSchoolN== null || preSchoolN == "" ){
			preSchoolN="'N/A'";
		}

		if(comments==undefined || comments== null || comments == "" ){
			comments="N/A";
		}
		
		params["email"] = email;
		params["address"] = address;
		params["contactNumber"] = contactNumber;
		params["city"] = city;
		params["parentName"] = parentName;
		params["studentName"] = studentName;
		params["className"] = className;
		params["preSchoolN"] = preSchoolN;
		params["fkClassId"] = fkClassId;
		params["comments"] = comments;
		params["pkid"] = fkRootstuId;
	
	params["methodName"] = "updateaddenqDetails";

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



function DeleteSchoolInfo()
{
	var input = document.getElementById('schoolName'),
    list = document.getElementById('schoolName_drop'),
    i,fk_School_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_School_id = list.options[i].getAttribute('data-value');
    	}
	}
	var delschoolName = $("#schoolName").val();
	
	var params = {};
	params["fk_School_id"] = fk_School_id;
	//params["delschoolName"] =delschoolName;
	
	params["methodName"] = "deleteSchool";
	
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
function deleteparentvalidation()
{
	if(document.editSchool.schoolName.value=="" || document.editSchool.schoolName.value==undefined || document.editSchool.schoolName.value==null)
		{
		alert("please select to Delete");
		return false;
		}
	DeleteparentInfo();
}
function DeleteparentInfo()
{
	var input = document.getElementById('schoolName'),
    list = document.getElementById('schoolName_drop'),
    i,fk_School_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_School_id = list.options[i].getAttribute('data-value');
    	}
	}
//	var delschoolName = $("#schoolName").val();
	document.getElementById("btn").disabled = true;
	var params = {};
	params["fk_School_id"] = fk_School_id;
	//params["delschoolName"] =delschoolName;
	
	params["methodName"] = "deleteparent";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)

			{
		/*if(data=="↵↵↵↵↵↵↵"){
 			alert("Not Added");
 		}
 		else{
 			alert(data);
 		}*/
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



//del homewrk

function deletehomework()
{
	var input = document.getElementById('subjectName'),
    list = document.getElementById('subject_drop'),
    i,fk_Subject_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_Subject_id = list.options[i].getAttribute('data-value');
    	}
	}
	var delsubjectName = $("#subjectName").val();
	
	var params = {};
	params["fk_home_id"] = fk_Subject_id;
	
	params["methodName"] = "deletehomework";
	
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
