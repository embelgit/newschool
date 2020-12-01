function StudValidation() {
	
	if(document.sdtv.generalRegNumber.value == "") {
		alert("please Enter General Registation Number.");
		return false;
	}
if(document.sdtv.rollNumber.value == "") {
		alert("please Enter Student Roll Number.");
		return false;
	}
if(document.sdtv.firstName.value == "")
	 {
		alert("please Enter Student First Name.");
		return false;
	}
if(document.sdtv.middleName.value =="") {
			alert("please Enter Student Middle Name.");
			return false;
		}
if(document.sdtv.lastName.value =="") {
				alert("please Enter Student Last Name.");
				return false;
			}

if(document.sdtv.dob.value =="") {
				alert("please select  date of birth");
				return false;
			}
if(document.sdtv.doa.value =="") {
					alert("Please select date Admission");
					return false;
				}
if(document.sdtv.gender.value =="") {
					alert("Please Select Gender");
					return false;
				}
if(document.sdtv.fk_class_id1.value == "") {
					alert("Please Select class");
					return false;
				}
				if(document.sdtv.fk_division_id.value == "") {
					alert("Please Select division");
					return false;
				}
if(document.sdtv.city.value == "") {
					alert("Please Enter city name");
					return false;
				}
if(document.sdtv.studentstatus.value == "") {
					alert("Please select student status");
					return false;
				}


if(document.sdtv.annualFee.value == "") {
					alert("Please Enter annualFee");
					return false;
				}
if(document.sdtv.EmergencyContact.value =="") {
					alert("Please Enter Emergency Contact Number");
					return false;
				}
var number=/^[0-9]{10}$/;
if(document.sdtv.EmergencyContact.value.match(number) && document.sdtv.EmergencyContact.value != "0000000000"  && document.sdtv.EmergencyContact.value!="9999999999")
{
	StudentInfo();


}
else
{

alert("Enter a valid Emergency contact Number");
return false;

}

}

function StudentInfo() {


	var params = {};

	var input = document.getElementById('fk_class_id1'), list = document
			.getElementById('clas'), i, fk_class_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	var input = document.getElementById('fk_division_id'), list = document
			.getElementById('division'), i, fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fk_division_id = list.options[i].getAttribute('data-value');
		}
	}

	var firstName = $('#firstName').val();
	var middleName = $('#middleName').val();
	var lastName = $('#lastName').val();
	var dob = $('#dob').val();
	var doa = $('#doa').val();
	var gender = $('#gender').val();
	var country = $('#country').val();
	var state = $('#state').val();
	var pinCode = $('#pinCode').val();
	var preSchoolN = $('#preSchoolN').val();
	var fatherName = $('#fatherName').val();
	var motherName = $('#motherName').val();
	var contactNo = $('#contactNo').val();
	var siblings = $('#siblings').val();
	var perAddress = $('#perAddress').val();
	var preAddress = $('#preAddress').val();
	var annualFee = $('#annualFee').val();
	var religion = $('#religion').val();
	var mothertongue = $('#mothertongue').val();
	var studenttype = $('#studenttype').val();
	var namankit = $('#namankittype').val();
	
	var studentstatus = $('#studentstatus').val();
	var exclass = $('#classname').val();
	var leavingyr = $('#leavingyr').val();
	
	
	var cast = $('#cast').val();
	var subCast = $('#subCast').val();
	var city = $('#city').val();
	var birthPlace = $('#birthPlace').val();
	var birthtal = $('#birthtal').val();
	var birthdist = $('#birthdist').val();
	var birthcountry = $('#birthcountry').val();
	var generalRegNumber = $('#generalRegNumber').val();
	var studentSerialNumber = $('#studentSerialNumber').val();
	var rollNumber = $('#rollNumber').val();
	var aadharNumber = $('#aadharNumber').val();
	var attendanceNumber = $('#attendanceNumber').val();
	var district = $('#district').val();
	var taluka = $('#taluka').val();
	var studentPhoto = $('#studentPhoto').val();
	var preSchoolUdias = $('#preSchoolUdias').val();
	var area = $('#area').val();
	var studId = $('#studId').val();
	var EmergencyContact = $('#EmergencyContact').val();

	
	if (birthPlace == undefined || birthPlace == null || birthPlace == "") {
		birthPlace = "'N/A'";
	}
	if (religion == undefined || religion == null || religion == "") {
		religion = "'N/A'";
	}
	if (cast == undefined || cast == null || cast == "") {
		cast = "'N/A'";
	}
	if (subCast == undefined || subCast == null || subCast == "") {
		subCast = "'N/A'";
	}
	if (studenttype == undefined || studenttype == null || studenttype == "") {
		studenttype = "'N/A'";
	}
	if (city == undefined || city == null || city == "") {
		city = "'N/A'";
	}
	if (district == undefined || district == null || district == "") {
		district = "'N/A'";
	}
	if (taluka == undefined || taluka == null || taluka == "") {
		taluka = "'N/A'";
	}
	if (attendanceNumber == undefined || attendanceNumber == null
			|| attendanceNumber == "") {
		attendanceNumber = "'N/A'";
	}
	if (generalRegNumber == undefined || generalRegNumber == null
			|| generalRegNumber == "") {
		generalRegNumber = "'N/A'";
	}
	if (studentSerialNumber == undefined || studentSerialNumber == null
			|| studentSerialNumber == "") {
		studentSerialNumber = "'N/A'";
	}
	if (rollNumber == undefined || rollNumber == null || rollNumber == "") {
		rollNumber = "'N/A'";
	}
	if (aadharNumber == undefined || aadharNumber == null || aadharNumber == "") {
		aadharNumber = "'N/A'";
	}
	if (firstName == undefined || firstName == null || firstName == "") {
		firstName = "'N/A'";
	}
	if (middleName == undefined || middleName == null || middleName == "") {
		middleName = "'N/A'";
	}
	if (lastName == undefined || lastName == null || lastName == "") {
		lastName = "'N/A'";
	}
	if (gender == undefined || gender == null || gender == "") {
		gender = "'N/A'";
	}
	if (country == undefined || country == null || country == "") {
		country = "'N/A'";
	}
	if (state == undefined || state == null || state == "") {
		state = "'N/A'";
	}
	if (pinCode == undefined || pinCode == null || pinCode == "") {
		pinCode = 0;
	}
	if(mothertongue == undefined || mothertongue == null || mothertongue == ""){
		mothertongue = "NA"
	}
	if (studenttype == "") {
		alert("select student type");
		return false;
	}
	if(studenttype == "Namankit" && namankit == ""){
		alert("select namankit type");
		return false;
	}
	
	if(namankit == undefined || namankit == null || namankit == ""){
		namankit = "NA";
	}
	
	if (preSchoolN == undefined || preSchoolN == null || preSchoolN == "") {
		preSchoolN = "'N/A'";
	}
	if (fatherName == undefined || fatherName == null || fatherName == "") {
		fatherName = "'N/A'";
	}
	if (motherName == undefined || motherName == null || motherName == "") {
		motherName = "'N/A'";
	}
	if (contactNo == undefined || contactNo == null || contactNo == "") {
		contactNo = 0;
	}
	if (siblings == undefined || siblings == null || siblings == "") {
		siblings = "'N/A'";
	}
	if (perAddress == undefined || perAddress == null || perAddress == "") {
		perAddress = "'N/A'";
	}
	if (preAddress == undefined || preAddress == null || preAddress == "") {
		preAddress = "'N/A'";
	}
	if (annualFee == undefined || annualFee == null || annualFee == "") {
		annualFee = 0;
	}
	if (preSchoolUdias == undefined || preSchoolUdias == null
			|| preSchoolUdias == "") {
		preSchoolUdias = "'N/A'";
	}
	if (area == undefined || area == null || area == "") {
		area = "'N/A'";
	}
	if (EmergencyContact == undefined || EmergencyContact == null || EmergencyContact == "") {
		EmergencyContact = 0;
	}
	
	if (birthtal == undefined || birthtal == null || birthtal == "") {
		birthtal = "NA";
	}
	if (birthdist == undefined || birthdist == null || birthdist == "") {
		birthdist = "NA";
	}
	if (birthcountry == undefined || birthcountry == null || birthcountry == "") {
		birthcountry = "NA";
	}
	if (studId == undefined || studId == null || studId == "") {
		studId = "'0'";
	}
	if(studentstatus == "exstudent" && classname == "" && leavingyr == ""){
		alert("please select class and leaving year of ex-student");
		return false;
	}
	document.getElementById("btn").disabled = true;
	
	
	params["mothertongue"] = mothertongue;
	params["religion"] = religion;
	params["studenttype"] = studenttype;
	params["namankit"] = namankit;
	
	params["studentstatus"] = studentstatus;
	params["ex_class"] = exclass;
	params["ex_leaving"] = leavingyr;
	
	params["cast"] = cast;
	params["subCast"] = subCast;
	params["city"] = city;
	params["birthPlace"] = birthPlace;
	params["birthtal"] = birthtal;
	params["birthdist"] = birthdist;
	params["birthcountry"] = birthcountry;
	params["district"] = district;
	params["taluka"] = taluka;
	params["attendanceNumber"] = attendanceNumber;
	params["aadharNumber"] = aadharNumber;
	params["rollNumber"] = rollNumber;
	params["studentSerialNumber"] = studentSerialNumber;
	params["generalRegNumber"] = generalRegNumber;
	params["firstName"] = firstName;
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["dob"] = dob;
	params["doa"] = doa;
	params["gender"] = gender;
	params["fk_class_id"] = fk_class_id;
	params["division"] = fk_division_id;
	params["country"] = country;
	params["state"] = state;
	params["pinCode"] = pinCode;
	params["preSchoolN"] = preSchoolN;
	params["fatherName"] = fatherName;
	params["motherName"] = motherName;
	params["contactNo"] = contactNo;
	params["siblings"] = siblings;
	params["perAddress"] = perAddress;
	params["preAddress"] = preAddress;
	params["annualFee"] = annualFee;
	params["studentPhoto"] = studentPhoto;
	params["preSchoolUdias"] = preSchoolUdias;
	params["area"] = area;
	params["studId"] = studId;
	params["EmergencyContact"] = EmergencyContact ;

	params["methodName"] = "StudentInfoo";
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
// reports
// student List as per class nd division
function studentListAsPerClassNdDiv() {

	var params = {};
	var input = document.getElementById('fk_class_id1'), list = document
			.getElementById('classes'), i, fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	var input1 = document.getElementById('fk_division_id'), list = document
			.getElementById('division'), i, fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_division_id = list.options[i].getAttribute('data-value');
		}
	}

	// var academicYear = $("#academicYear4").val();
	// params["academicYear"]= academicYear;
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["methodName"] = "getStudentListAsPerClassAndDivision";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data) {
						$('#studentOne').dataTable().fnClearTable();
						var jsonData = $.parseJSON(data);
						// alert(data.length);
						if (data.length <= 28) {
							alertify
									.alert("Embel Technologies Says --> Data Not Found Your Selection.");
							return true;
						}
						var catmap = jsonData.list;
						if(catmap == null || catmap == "" || catmap == undefined){
							alert("No data aailable for selected dates");
							return false;
						}
						/*
						 * $(document).ready(function() { } );
						 */

						$(document)
								.ready(
										function() {
											var total = $('#studentOne')
													.DataTable(
															{

																fnRowCallback : function(
																		nRow,
																		aData,
																		iDisplayIndex) {
																	$(
																			"th:first",
																			nRow)
																			.html(
																					iDisplayIndex + 1);
																	return nRow;
																},
																
																"sPaginationType" : "full_numbers",
																destroy : true,
																searching : true,
																orderable : true,

																columns : [
/*																	{
																		"data" : "sr",
																		"width" : "5%"
																	},
																		{
																			"data" : "firstName",
																			"width" : "5%"
																		},
																		{
																			"data" : "middleName",
																			"width" : "5%"
																		},
																		{
																			"data" : "lastName",
																			"width" : "5%"
																		},
																		{
																			"data" : "motherName",
																			"width" : "5%"
																		},
																		{
																			"data" : "studentSerialNumber",
																			"width" : "5%"
																		},
																		{
																			"data" : "dob",
																			"width" : "5%"
																		},
																	/*	{
																			"data" : "dateOfJoining",
																			"width" : "5%"
																		},*/
																		
																	/*	{
																			"data" : "cast",
																			"width" : "5%"
																		},
																		{
																			"data" : "subCast",
																			"width" : "5%"
																		},
																		{
																			"data" : "contactNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "aadharNumber",
																			"width" : "5%"
																		},
																		{
																			"data" : "generalRegNumber",
																			"width" : "5%"
																		},*/
																		/*{
																			"data" : "studentSerialNumber",
																			"width" : "5%"
																		},*/
																/*		{
																			"data" : "preSchoolN",
																			"width" : "5%"
																		},
																		{
																			"data" : "preSchoolUdias",
																			"width" : "5%"
																		},  */
																	
																	{
																		"data" : "sr",
																		"width" : "5%"
																	},
																	{
																		"data" : "firstName",
																		"width" : "5%"
																	},
																	{
																		"data" : "middleName",
																		"width" : "5%"
																	},
																	{
																		"data" : "lastName",
																		"width" : "5%"
																	},
																	{
																		"data" : "motherName",
																		"width" : "5%"
																	},
																	{
																		"data" : "gender",
																		"width" : "5%"
																	},
																	{
																		"data" : "className",
																		"width" : "5%"
																	},
																	{
																		"data" : "divisionName",
																		"width" : "5%"
																	},
																	{
																		"data" : "dob",
																		"width" : "5%"
																	},
																	{
																		"data" : "dateOfJoining",
																		"width" : "5%"
																	},
																	{
																		"data" : "contactNo",
																		"width" : "5%"
																	},
																	{
																		"data" : "cast",
																		"width" : "5%"
																	},
																	{
																		"data" : "subCast",
																		"width" : "5%"
																	},
																	{
																		"data" : "generalRegNumber",
																		"width" : "5%"
																	},
																	{
																		"data" : "aadharNumber",
																		"width" : "5%"
																	},
																	
																	{
																		"data" : "studentSerialNumber",
																		"width" : "5%"
																	},
																	
																	
																	{
																		"data" : "rollno",
																		"width" : "5%"
																	},
																	{
																		"data" : "studenttype",
																		"width" : "5%"
																	},
																	{
																		"data" : "namankittype",
																		"width" : "5%"
																	},
																	{
																		"data" : "birthPlace",
																		"width" : "5%"
																	},
																	{
																		"data" : "totalAnnualFee",
																		"width" : "5%"
																	},
																/*	{
																		"data" : "gender",
																		"width" : "5%"
																	},
																	{
																		"data" : "className",
																		"width" : "5%"
																	},
																	{
																		"data" : "divisionName",
																		"width" : "5%"
																	},
																	
																	{
																		"data" : "dateOfJoining",
																		"width" : "5%"
																	},
																	
																	{
																		"data" : "contactNo",
																		"width" : "5%"
																	},
																	{
																		"data" : "cast",
																		"width" : "5%"
																	},
																	{
																		"data" : "subCast",
																		"width" : "5%"
																	},
																	{
																		"data" : "generalRegNumber",
																		"width" : "5%"
																	},
																	{
																		"data" : "aadharNumber",
																		"width" : "5%"
																	},
																	*/
																	
																	],

																dom : 'Bfrtip',
																buttons : [

																		{
																			extend : 'copyHtml5',
																			footer : true
																		},
																		{
																			extend : 'excelHtml5',
																			footer : true
																		},
																		{
																			extend : 'csvHtml5',
																			footer : true
																		},
																		{
																			extend : 'pdfHtml5',
																			footer : true,
																			
																			title : function() {
																				return "Student Report";
																			},
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			titleAttr : 'PDF'
																		} ]
																
																
																   
															});

										});

						var mydata = catmap;
						$('#studentOne').dataTable().fnAddData(mydata);

					});
}

// admission enquiry report
function admissionEnquiryReport() {
	var params = {};
	var input = document.getElementById('fk_class_id1'), list = document
			.getElementById('classes'), i, fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	// var academicYear = $("#academicYear4").val();
	// params["academicYear"]= academicYear;
	params["fk_class_id"] = fk_class_id;
	params["methodName"] = "getAdmissionEnquiryAsPerClassAndDivision";
	$
			.post(
					'/srb/JSP/utility/controller.jsp',
					params,
					function(data) {
						$('#AdmissionEnq').dataTable().fnClearTable();
						var jsonData = $.parseJSON(data);
						// alert(data.length);
						if (data.length <= 28) {
							alertify
									.alert("Embel Technologies Says --> Data Not Found Your Selection.");
							return true;
						}
						var catmap = jsonData.list;
						/*
						 * $(document).ready(function() { } );
						 */

						$(document)
								.ready(
										function() {
											var total = $('#AdmissionEnq')
													.DataTable(
															{

																fnRowCallback : function(
																		nRow,
																		aData,
																		iDisplayIndex) {
																	$(
																			"th:first",
																			nRow)
																			.html(
																					iDisplayIndex + 1);
																	return nRow;
																},

																destroy : true,
																searching : true,

																columns : [
																		{
																			"data" : "studentName",
																			"width" : "5%"
																		},
																		{
																			"data" : "parentName",
																			"width" : "5%"
																		},
																		{
																			"data" : "city",
																			"width" : "5%"
																		},
																		{
																			"data" : "address",
																			"width" : "5%"
																		},
																		{
																			"data" : "preSchoolN",
																			"width" : "5%"
																		},
																		{
																			"data" : "email",
																			"width" : "5%"
																		},
																		{
																			"data" : "contactNumber",
																			"width" : "5%"
																		},
																		{
																			"data" : "insertDate",
																			"width" : "5%"
																		}

																],
																dom : 'Bfrtip',
														          buttons : [ 

														                     { extend: 'copyHtml5', footer: true },
														                     { extend: 'excelHtml5', footer: true },
														                     { extend: 'csvHtml5', footer: true },
														                     { extend : 'pdfHtml5', footer: true,
														                    	 title : function() {
														                    		 return "Admission Enquiry Report";
														                    	 },
														                    	 orientation : 'landscape',
														                    	 pageSize : 'LEGAL',
														                    	 titleAttr : 'PDF' 
														                     } ] 
															});

										});

						var mydata = catmap;
						$('#AdmissionEnq').dataTable().fnAddData(mydata);
					});
}

// get student balance report
function studentBalanceAsPerClassNdDiv() {

	var params = {};
	var input = document.getElementById('fk_class_id1'), list = document
			.getElementById('classes'), i, fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	var input1 = document.getElementById('fk_division_id'), list = document
			.getElementById('division'), i, fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_division_id = list.options[i].getAttribute('data-value');
		}
	}

	// var academicYear = $("#academicYear4").val();
	// params["academicYear"]= academicYear;
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["methodName"] = "studentBalanceAsPerClassNdDiv";
	$
			.post(
					'/srb/JSP/utility/controller.jsp',
					params,
					function(data) {

						$('#studentOne').dataTable().fnClearTable();

						var jsonData = $.parseJSON(data);
						// alert(data.length);
						if (data.length <= 28) {
							alertify
									.alert("Embel Technologies Says --> Data Not Found Your Selection.");
							return true;
						}
						var catmap = jsonData.list;
						/*
						 * $(document).ready(function() { } );
						 */

						$(document)
								.ready(
										function() {
											var total = $('#studentOne')
													.DataTable(
															{

																fnRowCallback : function(
																		nRow,
																		aData,
																		iDisplayIndex) {
																	$(
																			"th:first",
																			nRow)
																			.html(
																					iDisplayIndex + 1);
																	return nRow;
																},


																"sPaginationType" : "full_numbers",
																destroy : true,
																searching : true,
																orderable : true,

																columns : [
																		{
																			"data" : "firstName",
																			"width" : "5%"
																		},
																		{
																			"data" : "middleName",
																			"width" : "5%"
																		},
																		{
																			"data" : "lastName",
																			"width" : "5%"
																		},
																		{
																			"data" : "className",
																			"width" : "5%"
																		},
																		{
																			"data" : "divisionName",
																			"width" : "5%"
																		},
																		{
																			"data" : "totalAnnualFee",
																			"width" : "5%"
																		},
																		{
																			"data" : "balanceFee",
																			"width" : "5%"
																		},
																		{
																			"data" : "paidFee",
																			"width" : "5%"
																		},
																		

																],
									dom : 'Bfrtip',
							          buttons : [ 

							                     { extend: 'copyHtml5', footer: true },
							                     { extend: 'excelHtml5', footer: true },
							                     { extend: 'csvHtml5', footer: true },
							                     { extend : 'pdfHtml5', footer: true,
							                    	 title : function() {
							                    		 return "Student Balance Report";
							                    	 },
							                    	 orientation : 'landscape',
							                    	 pageSize : 'LEGAL',
							                    	 titleAttr : 'PDF' 
							                     } ]  
															});

										});

						var mydata = catmap;
						$('#studentOne').dataTable().fnAddData(mydata);

					});
}

// get student all detail to edit
function getStudentDetails() {

	var params = {};
	var input = document.getElementById('fk_Student_id'), list = document
			.getElementById('studentNameList'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootStudentId = list.options[i].getAttribute('data-value');
		}
	}

	$("#generalRegNumber").append($("<input/>").attr("value", "").text());
	$("#studentSerialNumber").append($("<input/>").attr("value", "").text());
	$("#rollNumber").append($("<input/>").attr("value", "").text());
	$("#aadharNumber").append($("<input/>").attr("value", "").text());
	$("#firstName").append($("<input/>").attr("value", "").text());
	
	$("#middleName").append($("<input/>").attr("value", "").text());
	$("#lastName").append($("<input/>").attr("value", "").text());
	$("#oldAdmissionDate").append($("<input/>").attr("value", "").text());
	$("#oldDob").append($("<input/>").attr("value", "").text());
	$("#oldGender").append($("<input/>").attr("value", "").text());
	
	$("#oldClass").append($("<input/>").attr("value", "").text());
	$("#oldDivision").append($("<input/>").attr("value", "").text());
	$("#country").append($("<input/>").attr("value", "").text());
	$("#state").append($("<input/>").attr("value", "").text());
	$("#pinCode").append($("<input/>").attr("value", "").text());
	
	$("#preSchoolN").append($("<input/>").attr("value", "").text());
	$("#fatherName").append($("<input/>").attr("value", "").text());
	$("#motherName").append($("<input/>").attr("value", "").text());
	$("#contactNo").append($("<input/>").attr("value", "").text());
	$("#permanentAddress").append($("<input/>").attr("value", "").text());
	
	$("#previousAddress").append($("<input/>").attr("value", "").text());
	$("#annualFee").append($("<input/>").attr("value", "").text());
	$("#oldSiblings").append($("<input/>").attr("value", "").text());
	$("#area").append($("<input/>").attr("value", "").text());
	$("#studId").append($("<input/>").attr("value", "").text());
	$("#preSchoolUdias").append($("<input/>").attr("value", "").text());

	params["studentId"] = fkRootStudentId;
	params["methodName"] = "getStudentDetailToEdit";
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
											document.getElementById("generalRegNumber").value = v.generalRegNumber;
											document.getElementById("studentSerialNumber").value = v.studentSerialNumber;
											document.getElementById("rollNumber").value = v.rollNumber;
											document.getElementById("aadharNumber").value = v.aadharNumber;
											document.getElementById("firstName").value = v.firstName;
											
											document.getElementById("middleName").value = v.middleName;
											document.getElementById("lastName").value = v.lastName;
											document.getElementById("oldAdmissionDate").value = v.doa;
											document.getElementById("oldDob").value = v.dob;
											document.getElementById("oldGender").value = v.gender;
											
											document.getElementById("oldClass").value = v.clas;
											document.getElementById("fk_class_id1").value = v.clas;
											document.getElementById("oldDivision").value = v.division;
											document.getElementById("fk_division_id").value = v.division;
											document.getElementById("country").value = v.country;
											document.getElementById("state").value = v.state;
											document.getElementById("pinCode").value = v.pinCode;
											
											document.getElementById("preSchoolN").value = v.preSchoolN;
											document.getElementById("fatherName").value = v.fatherName;
											document.getElementById("motherName").value = v.motherName;
											document.getElementById("contactNo").value = v.contactNo;
											document.getElementById("permanentAddress").value = v.perAddress;
											
											document.getElementById("previousAddress").value = v.preAddress;
											document.getElementById("annualFee").value = v.annualFee;
											document.getElementById("oldSiblings").value = v.siblings;
											document.getElementById("area").value = v.area;
											document.getElementById("studId").value = v.studId;
											document.getElementById("preSchoolUdias").value = v.preSchoolUdias;

										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}

// update Student details
function updateStudentInformation() {
	if (document.updatesdtv.fk_Student_id.value == "") {
		alert("Please Select Student Name");
		return false;
	}
	if (document.updatesdtv.generalRegNumber.value == "") {
		alert("Please Select general Reg Number");
		return false;
	}
	if (document.updatesdtv.studentSerialNumber.value == "") {
		alert("Please Select student Serial Number");
		return false;
	}
	if (document.updatesdtv.rollNumber.value == "") {
		alert("Please Select roll Number");
		return false;
	}
	
	if (document.updatesdtv.firstName.value == "") {
		alert("Please Select firstName");
		return false;
	}
	if (document.updatesdtv.middleName.value == "") {
		alert("Please Select middle Name");
		return false;
	}
	if (document.updatesdtv.lastName.value == "") {
		alert("Please Select last Name");
		return false;
	}
	if (document.updatesdtv.contactNo.value == "") {
		alert("Please Select contact Number");
		return false;
	}
	var number= /^[0-9]{10}$/ ;
	if(document.updatesdtv.contactNo.value.match(number) && document.updatesdtv.contactNo.value != "0000000000"  && document.updatesdtv.contactNo.value!="9999999999") 
	{
	if(document.updatesdtv.fk_class_id1.value == "") {
		alert("Please Select class");
		return false;
	}
	if(document.updatesdtv.fk_division_id.value == "") {
		alert("Please Select division");
		return false;
	}
	updateStudentInfo();
	}
	else
		{
		alert("Enter a valid contact Number");
		return false;
		}
	}

function updateStudentInfo() 
{
	var input = document.getElementById('fk_division_id'), list = document
			.getElementById('division'), i, fkRootDivId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootDivId = list.options[i].getAttribute('data-value');
		}
	}

	var input = document.getElementById('fk_class_id1'), list = document
			.getElementById('clas'), i, fkRootClassId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootClassId = list.options[i].getAttribute('data-value');
		}
	}

	var input = document.getElementById('fk_Student_id'), list = document
			.getElementById('studentNameList'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootStudentId = list.options[i].getAttribute('data-value');
		}
	}

	var generalRegNumber = $('#generalRegNumber').val();
	var studentSerialNumber = $('#studentSerialNumber').val();
	var rollNumber = $('#rollNumber').val();
	var aadharNumber = $('#aadharNumber').val();
	var firstName = $('#firstName').val();
	
	var middleName = $('#middleName').val();
	var lastName = $('#lastName').val();
	var doa = $('#doa').val();
	var oldAdmissionDate = $('#oldAdmissionDate').val();
	var dob = $('#dob').val();
	var oldDob = $('#oldDob').val();
	var gender = $('#gender').val();
	var oldGender = $('#oldGender').val();
	
	var oldClass = $('#oldClass').val();
	var oldDivision = $('#oldDivision').val();
	var country = $('#country').val();
	var state = $('#state').val();
	var pinCode = $('#pinCode').val();
	
	var preSchoolN = $('#preSchoolN').val();
	var fatherName = $('#fatherName').val();
	var motherName = $('#motherName').val();
	var contactNo = $('#contactNo').val();
	var permanentAddress = $('#permanentAddress').val();
	
	var previousAddress = $('#previousAddress').val();
	var annualFee = $('#annualFee').val();
	var studId =$('#studId').val();
	var siblings = $('#siblings').val();
	var area = $('#area').val();
	var preSchoolUdias = $('#preSchoolUdias').val();

	if (studId == undefined || studId == null || studId == "") {
		studId = "'0'";
	}
	
	if (generalRegNumber == undefined || generalRegNumber == null
			|| generalRegNumber == "") {
		generalRegNumber = "'N/A'";
	}
	if (studentSerialNumber == undefined || studentSerialNumber == null
			|| studentSerialNumber == "") {
		studentSerialNumber = "'N/A'";
	}
	if (rollNumber == undefined || rollNumber == null || rollNumber == "") {
		rollNumber = "'N/A'";
	}
	if (aadharNumber == undefined || aadharNumber == null || aadharNumber == "") {
		aadharNumber = "'N/A'";
	}

	if (gender == undefined || gender == null || gender == "") {
		gender = oldGender;
	}

	if (dob == undefined || dob == null || dob == "") {
		dob = oldDob;
	}

	if (doa == undefined || doa == null || doa == "") {
		doa = oldAdmissionDate;
	}

	if (siblings == undefined || siblings == null || siblings == "") {
		siblings = "'N/A'";
	}

	var params = {};
	
	params["aadharNumber"] = aadharNumber;
	params["rollNumber"] = rollNumber;
	params["studentSerialNumber"] = studentSerialNumber;
	params["generalRegNumber"] = generalRegNumber;
	params["studentId"] = fkRootStudentId;
	params["fkClassId"] = fkRootClassId
	params["fkDivId"] = fkRootDivId;
	params["firstName"] = firstName;
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["country"] = country;
	params["state"] = state;
	params["pinCode"] = pinCode;
	params["preSchoolN"] = preSchoolN;
	params["fatherName"] = fatherName;
	params["contactNo"] = contactNo;
	params["motherName"] = motherName;
	params["permanentAddress"] = permanentAddress;
	params["previousAddress"] = previousAddress;
	params["annualFee"] = annualFee;
	params["siblings"] = siblings;
	params["doa"] = doa;
	params["dob"] = dob;
	params["gender"] = gender;
	params["studId"]=studId;
	params["area"] = area;
	params["preSchoolUdias"] = preSchoolUdias;

	params["methodName"] = "updateStudentDetails";

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
function cancelAdmission(){
	if(document.CancelAdminision.fk_class_id1.value == ""){
		alert("Please Select Class Name.");
		return false;
	}
	if(document.CancelAdminision.fk_division_id.value == ""){
		alert("Please Select Division Name.");
		return false;
	}
	if(document.CancelAdminision.fk_Student_id.value == ""){
		alert("Please Select Student Name.");
		return false;
	}
	
	cancelAdmission1();
}
// cancellation of student admission
function cancelAdmission1() {

/*	var input = document.getElementById('fk_Student_id'), list = document
	.getElementById('studentNameList'), i, fkRootDivId;
for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input.value) {
	fk_Student_id = list.options[i].getAttribute('data-value');
}
}*/
	var params = {};

	var fk_Student_id = $('#fk_Student_id').val();
	//var studentName = $('#studentName').val();

	//params["fk_Student_id"] = pkStudentId;
	params["studentName"] = fk_Student_id;

	

	params["methodName"] = "cancelStudentAdmission";

	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {
		alert(data)
		location.reload();

	}

	).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	})
}


// get Division by Class Name
function getDivisionNameByClassName()
{
//var type = document.getElementById('vendor').value;
	
	$("#division").empty();
	$("#division").append($("<option></option>").attr("value","").text("Select product"));
	
	var params= {};
	
	
		var input = document.getElementById('fk_class_id1'), list = document
		.getElementById('clas'), i, fkRootStudentId;
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



function getGridOfStudentForCheckUp()
{
	var params = {};
	
	
	
	var input = document.getElementById('fk_class_id1'), list = document
	.getElementById('clas'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input = document.getElementById('fk_division_id'), list = document
	.getElementById('division'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkDivisionId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkClassId"] = fkClassId;
	params["fkDivisionId"] = fkDivisionId;
	
	params["methodName"] = "getGridForStudentCheckUp";
	
	var count=0;
	var newrow;
	var rowId;
	
	$.post('/srb/JSP/utility/controller.jsp', params, function(data)
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
						
						if (prodName == jsonData.offer.productName) 
						{
							
						
					    	/*ori_quantity = +rowdata[j].quantity+1;
					    	
					    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
					    	var grid = jQuery("#list4");
					    	grid.trigger("reloadGrid");*/
							
							
					    	newrow=false;
							//alert("Product Name Already Inserted !!!");
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
						  $("#list4").addRowData(count,jsonData.offer);
							
						 }
				
				
				$("#list4").jqGrid({
					datatype: "local",
					
					colNames:['First Name','Last Name','Diagnosis','Treatment','Remark'],
					colModel:[ 
						
		               
					     {	name:'fName',
					    	 width:150,
							
						},
						
					    
						{	name:'lName',
					    	 width:150,
					    	 
						},
					       
						{	name:'diagnosis',
							width:100,
							editable: true
							
						},
						{	name:'treatment',
							width:100,
							editable: true
							
						},
						
						{	name:'rmk',
							width:100,
							editable: true
							
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
		         		 
		         		 			
		         		 
					        	    var rowId =$("#list4").jqGrid('getGridParam','selrow');  
			                        var rowData = jQuery("#list4").getRowData(rowId);
			                    	
		                    		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
		        		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
		        		        	var AllRows = JSON.stringify(allRowsInGrid1);
		        		        	var diagnosis = rowData['diagnosis'];
		        		        	var treatment = rowData['treatment'];
		        		        	var rmk = rowData['rmk'];
		        		        	
		        		        	if(  diagnosis !=""){
				                    	  
				                    	   var quan = /^[a-zA-Z ]+$/;
				                    	   if(diagnosis.match(quan))
				                    		   {
				                    		   		
				                    		   	//$("#list4").jqGrid("setCell",rowId, "diagnosis", diagnosis);
				                    		   }
				                    	   else 
				                    		   {
				                    		   var quan =null;
				                    		   alert("Please Enter Diagnosis In Alphabets");
				                    		   $("#list4").jqGrid("setCell",rowId, "diagnosis", quan);
				                    		   return false;
				                    		   }
				                       }
		        		        	if(treatment !="" ){

				                    	   var quan =/^[a-zA-Z ]+$/;
				                    	   if(treatment.match(quan))
				                    		   {
				                    		   
				                    		   }
				                    	   else 
				                    		   {
				                    		   var quant =null;
				                    		   alert("Please Enter treatment In Alphabets");
				                    		   $("#list4").jqGrid("setCell",rowId, "treatment", quant);
				                    		   return false;
				                    		   }
				                       }
		        		        	
		        		        	if(rmk !="" ){
				                    	  /* var quan =/^[0-9 ]+$/;*/
				                    	   var quan =/^[a-zA-Z ]+$/;
				                    	   if(rmk.match(quan))
				                    		   {
				                    		   
				                    		   }
				                    	   else 
				                    		   {
				                    		   var quant =null;
				                    		   alert("Please Enter Remarks In Alphabets");
				                    		   $("#list4").jqGrid("setCell",rowId, "rmk", quant);
				                    		   return false;
				                    		   }
				                       }
		        		        	
		        		        	
		        		        	
		        		        	
		        		        	
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
									
			                      var grid = $("#list5"),
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
			                    var rowData = jQuery("#list5").getRowData(rowId);
			                	
		                 	
		                 		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
		     		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
		     		        	var AllRows=JSON.stringify(allRowsInGrid1);
		     		        	
		     		          }
			                });
				 
				 
					   });
					
				})
	
}
//editt 

function geteditGridOfStudentForCheckUp()
{
	var params = {};
	
	
	
	var input = document.getElementById('fk_class_id1'), list = document
	.getElementById('clas'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input = document.getElementById('fk_division_id'), list = document
	.getElementById('division'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkDivisionId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkClassId"] = fkClassId;
	params["fkDivisionId"] = fkDivisionId;
	
	params["methodName"] = "geteditGridForStudentCheckUp";
	
	var count=0;
	var newrow;
	var rowId;
	
	$.post('/srb/JSP/utility/controller.jsp', params, function(data)
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
						
						if (prodName == jsonData.offer.productName) 
						{
							
						
					    	/*ori_quantity = +rowdata[j].quantity+1;
					    	
					    	$("#list4").jqGrid("setCell", rowId, "quantity", ori_quantity);
					    	var grid = jQuery("#list4");
					    	grid.trigger("reloadGrid");*/
							
							
					    	newrow=false;
							//alert("Product Name Already Inserted !!!");
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
						  $("#list4").addRowData(count,jsonData.offer);
							
						 }
				
				
				$("#list4").jqGrid({
					datatype: "local",
					
					colNames:['First Name','Last Name','Diagnosis','Treatment','Remark','ID'],
					colModel:[ 
						
		               
					     {	name:'fName',
					    	 width:150,
							
						},
						
					    
						{	name:'lName',
					    	 width:150,
					    	 
						},
					       
						{	name:'diagnosis',
							width:100,
							editable: true
							
						},
						{	name:'treatment',
							width:100,
							editable: true
							
						},
						
						{	name:'rmk',
							width:100,
							editable: true
							
						},
						{	name:'pk_id',
							width:100,
							hidden:true
					//		editable: true
							
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
		         		 
		         		 			
		         		 
					        	    var rowId =$("#list4").jqGrid('getGridParam','selrow');  
			                        var rowData = jQuery("#list4").getRowData(rowId);
			                    	
		                    		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
		        		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
		        		        	var AllRows = JSON.stringify(allRowsInGrid1);
		        		        	var diagnosis = rowData['diagnosis'];
		        		        	var treatment = rowData['treatment'];
		        		        	var rmk = rowData['rmk'];
		        		        	
		        		        	if(  diagnosis !=""){
				                    	  
				                    	   var quan = /^[a-zA-Z ]+$/;
				                    	   if(diagnosis.match(quan))
				                    		   {
				                    		   		
				                    		   	//$("#list4").jqGrid("setCell",rowId, "diagnosis", diagnosis);
				                    		   }
				                    	   else 
				                    		   {
				                    		   var quan =null;
				                    		   alert("Please Enter Diagnosis In Alphabets");
				                    		   $("#list4").jqGrid("setCell",rowId, "diagnosis", quan);
				                    		   return false;
				                    		   }
				                       }
		        		        	if(treatment !="" ){

				                    	   var quan =/^[a-zA-Z ]+$/;
				                    	   if(treatment.match(quan))
				                    		   {
				                    		   
				                    		   }
				                    	   else 
				                    		   {
				                    		   var quant =null;
				                    		   alert("Please Enter treatment In Alphabets");
				                    		   $("#list4").jqGrid("setCell",rowId, "treatment", quant);
				                    		   return false;
				                    		   }
				                       }
		        		        	
		        		        	if(rmk !="" ){
				                    	  /* var quan =/^[0-9 ]+$/;*/
				                    	   var quan =/^[a-zA-Z ]+$/;
				                    	   if(rmk.match(quan))
				                    		   {
				                    		   
				                    		   }
				                    	   else 
				                    		   {
				                    		   var quant =null;
				                    		   alert("Please Enter Remarks In Alphabets");
				                    		   $("#list4").jqGrid("setCell",rowId, "rmk", quant);
				                    		   return false;
				                    		   }
				                       }
		        		        	
		        		        	
		        		        	
		        		        	
		        		        	
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
									
			                      var grid = $("#list5"),
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
			                    var rowData = jQuery("#list5").getRowData(rowId);
			                	
		                 	
		                 		var count = jQuery("#list4").jqGrid('getGridParam', 'records');
		     		        	var allRowsInGrid1 = $('#list4').getGridParam('data');
		     		        	var AllRows=JSON.stringify(allRowsInGrid1);
		     		        	
		     		          }
			                });
				 
				 
					   });
					
				})
	
}



function addStudentCheckUpInfo(){
	if(document.sdtv.fk_class_id1.value== ""){
		alert("Please Select Class Name.");
		return false;
	}
	if(document.sdtv.fk_division_id.value== ""){
		alert("Please Select Division Name");
		return false;
	}
	
	
	
	addStudentCheckUpInfo1();
}
function addStudentCheckUpInfo1()
{
	
	var params = {};
	
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);

	for (var i = 0; i < count; i++)
	{
		
		var fName = allRowsInGrid[i].fName;
		params["fName"+i] = fName;

		var lName = allRowsInGrid[i].lName;
		params["lName"+i] = lName;
	
		var diagnosis = allRowsInGrid[i].diagnosis;
		if(diagnosis == "" || diagnosis == null || diagnosis == undefined)
			{
			alert("Please Enter Diagnosis in Grid");
			return false;
			}
		
		params["diagnosis"+i] = diagnosis;

		var treatment = allRowsInGrid[i].treatment;
		if(treatment == "" || treatment == null || treatment == undefined)
		{
		alert("Please Enter treatment in Grid");
		return false;
		}
		params["treatment"+i] = treatment;
		
		var rmk = allRowsInGrid[i].rmk;
		if(rmk == "" || rmk ==null || rmk == undefined)
			{
			alert("Please Enter Remark In Grid ");
			return false;
			}
		params["remark"+i] = rmk;
		
		
	
	}
	
	
	
	
	var input = document.getElementById('fk_class_id1'), list = document
	.getElementById('clas'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input = document.getElementById('fk_division_id'), list = document
	.getElementById('division'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkDivisionId = list.options[i].getAttribute('data-value');
		}
	}
		document.getElementById("btn").disabled=true;
		var className = $('#fk_class_id1').val();
		var divisionName = $('#fk_division_id').val();

		
		params["className"] = className;
		params["divisionName"] = divisionName;
		
		params["fkClassId"] = fkClassId;
		params["fkDivisionId"] = fkDivisionId;
		params["count"] = count;

		params["methodName"] = "addStudentCheckUpInfo";
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
//edit

function editStudentCheckUpInfo(){
	if(document.sdtv.fk_class_id1.value== ""){
		alert("Please Select Class Name.");
		return false;
	}
	if(document.sdtv.fk_division_id.value== ""){
		alert("Please Select Division Name");
		return false;
	}
	
	
	
	editStudentCheckUpInfo1();
}
function editStudentCheckUpInfo1()
{
	
	var params = {};
	
	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);

	for (var i = 0; i < count; i++)
	{
		
		var fName = allRowsInGrid[i].fName;
		params["fName"+i] = fName;

		var lName = allRowsInGrid[i].lName;
		params["lName"+i] = lName;
	
		var diagnosis = allRowsInGrid[i].diagnosis;
		if(diagnosis == "" || diagnosis == null || diagnosis == undefined)
			{
			alert("Please Enter Diagnosis in Grid");
			return false;
			}
		
		params["diagnosis"+i] = diagnosis;

		var treatment = allRowsInGrid[i].treatment;
		if(treatment == "" || treatment == null || treatment == undefined)
		{
		alert("Please Enter treatment in Grid");
		return false;
		}
		params["treatment"+i] = treatment;
		
		var rmk = allRowsInGrid[i].rmk;
		if(rmk == "" || rmk ==null || rmk == undefined)
			{
			alert("Please Enter Remark In Grid ");
			return false;
			}
		params["remark"+i] = rmk;
		
		var pkid = allRowsInGrid[i].pk_id;
		params["pkid"+i] = pkid;
	
	}
	
	
	
	
	var input = document.getElementById('fk_class_id1'), list = document
	.getElementById('clas'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input = document.getElementById('fk_division_id'), list = document
	.getElementById('division'), i, fkRootStudentId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkDivisionId = list.options[i].getAttribute('data-value');
		}
	}
	
		var className = $('#fk_class_id1').val();
		var divisionName = $('#fk_division_id').val();

		
		params["className"] = className;
		params["divisionName"] = divisionName;
		
		params["fkClassId"] = fkClassId;
		params["fkDivisionId"] = fkDivisionId;
		params["count"] = count;

		params["methodName"] = "editStudentCheckUpInfo";
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

//Report Of Student CleanUp Report by Class And Division

function checkUpReportByClassAndDivision()
{
	var params = {};
	
	
	var input = document.getElementById('fk_class_id1'), list = document
	.getElementById('clas'), i, fkClassId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input = document.getElementById('fk_division_id'), list = document
	.getElementById('division'), i, fkDivisionId;
	for (i = 0; i < list.options.length; ++i)
	{
		if (list.options[i].value === input.value) 
		{
			fkDivisionId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkClassId"]= fkClassId;
	params["fkDivisionId"]= fkDivisionId;
	
	params["methodName"] = "checkupReportByClassAndDivision";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
			//To Clear Table
				$('#studCheckUpRep').dataTable().fnClearTable();
				
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
			if(catmap == "" || catmap==null || catmap == undefined){
				alert("No data available for selected dates");
				return false;
			}	
				
/*		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		*/
		
		$(document).ready(function() {
			$('#studCheckUpRep').DataTable( {

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

					
					/*
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
*/
				
				},
		    	
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		        "bPaginate": false,
		      
		columns: [
			        {"data": "fName", "width": "5%"},
		            {"data": "lName", "width": "5%"},
		          	{"data": "diagnosis", "width": "5%"},
		            {"data": "rmk", "width": "5%"},
		           
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Student CheckUp Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );

	
	var mydata = catmap;
	$('#studCheckUpRep').dataTable().fnAddData(mydata);
		}).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
				$(loaderObj).hide();
				$(loaderObj).find('#errorDiv').show();
			}
		});
	
	
}



//get Division by Class Name
function getDivisionNameByClassNameBalanceReport()
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


//get Division by Class Name For Student Report
function getDivisionNameByClassNameStudentReport()
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





//get Division by Class Name
function getDivisionNameByClassNameCancellationAdmission()
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
// delete Sport Participant
function ValidationSportParticipant()
{
	 if(document.delstrpro15.delparticipant.value=="" || document.delstrpro15.delparticipant.value==null || document.delstrpro15.delparticipant.value==undefined) 
		 {
		 alert("Please Select Field");
		 return false;
		 }
	 DeleteParticipant()
}

function DeleteParticipant()
{
	document.getElementById("btn").disabled = true;
	var input = document.getElementById('delparticipant'),
    list = document.getElementById('delp_drop2'),
    i,delparticipantId;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	delparticipantId= list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	params["delparticipantId"] =delparticipantId;
	
	params["methodName"] ="deletParticipant";
	
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

// delete Sport
function ValidationSporttoDel()
{
	if(document.delsport.delsport1.value=="" || document.delsport.delsport1.value==null || document.delsport.delsport1.value==undefined) 
	 {
	 alert("Please Select Field");
	 return false;
	 }
DeleteSport()

}


function DeleteSport()
{
	document.getElementById("btn").disabled = true;
	var input = document.getElementById('delsport1'),
    list = document.getElementById('dels_drop2'),
    i,delSportId;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	delSportId= list.options[i].getAttribute('data-value');
    	}
	}
	
	var params = {};
	params["delSportId"] =delSportId;
	
	params["methodName"] ="deletSportList";
	
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

// health checkup validation
function deleteHealthcheckup()
{
if(document.hltcheckup.studId.value=="" || document.hltcheckup.studId.value==undefined || document.hltcheckup.studId.value==null)
	{
	alert("Please select Student Name to Delete");
	return false;
	}
deleteHealthCheckup1();
}
function deleteHealthCheckup1()
{
document.getElementById("btn").disabled=true;
var input=document.getElementById("studId"),
list =document.getElementById("checkup_list"),
i,checkupid;

for(i=0;i<list.options.length;i++)
	{
	 if (list.options[i].value === input.value) {
		 checkupid= list.options[i].getAttribute('data-value');
	    	}
	}
var params = {};
params["checkupid"] =checkupid;

params["methodName"] ="deletStudentCheckup";

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

// for Sport Certificate
function getDivisionNameByClassName1()
{
//var type = document.getElementById('vendor').value;
	
	$("#fk_division_id").empty();
	$("#fk_division_id").append($("<option></option>").attr("value","").text("Select product"));
	
	var params= {};
	
	
		var input = document.getElementById('fk_class_id1'), list = document
		.getElementById('clas'), i, fkRootStudentId;
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
						$("#fk_division_id").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


