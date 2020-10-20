// get student details for result entry
function getStudentDetailsAsPerClassAdDivision() {
	var params = {};
	var input1 = document.getElementById('fk_class_id1'), list = document
			.getElementById('classes'), i, fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
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

	$("#studentName").empty();
	$("#studentName").append(
			$("<option></option>").attr("value", "")
					.text("Select Student Name"));
	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;

	var count = 0;
	var newrow;
	var rowId;

	params["methodName"] = "getStudentNameAsPerClassAndDiv";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {
		var jsonData = $.parseJSON(data);
		// var jsonData = jsonData.list;
		$.each(jsonData, function(i, v) {
			// document.getElementById("totalAnnualFee").value = v.totalAmt;
			$("#studentName").append(
					$("<option></option>").attr("value", v.pkStudentId)
							.text(
									v.firstName + " " + v.middleName + " "
											+ v.lastName));
		});
	})
}


//Student Fee Report Name Wise
/*function studentNameWiseReport() {
	if (document.studentWiseForm.divisionName.value == "") {
		alert("Please select division");
		return false;
	}
	if (document.studentWiseForm.divisionName.value == "") {
		alert("Please select division Name");
		return false;
	}
	studentNameWiseReport1();
}*/

function studentNameWiseReport() {
	var params = {};
	var input1 = document.getElementById('studentName'), list = document
			.getElementById('studentId'), i, studentName;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			studentName = list.options[i].getAttribute('data-value');
		}
	}

	
	var studentName = $('#studentName').val();

	params["studentId"] = studentName;

	params["methodName"] = "getStudentNameWiseReport";

	$
			.post(
					'/srb/JSP/utility/controller.jsp',
					params,
					function(data) {
						$('#studentPayment').dataTable().fnClearTable();
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
											var total = $('#studentPayment')
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
																			"data" : "computerFees",
																			"width" : "5%"
																		},
																		{
																			"data" : "examFees",
																			"width" : "5%"
																		},
																		{
																			"data" : "tuitionfees",
																			"width" : "5%"
																		},
																		{
																			"data" : "admissionfees",
																			"width" : "5%"
																		},
																		{
																			"data" : "medicalfees",
																			"width" : "5%"
																		},
																		{
																			"data" : "gymnassiumfees",
																			"width" : "5%"
																		},
																		
																		{
																			"data" : "laboratoryfees",
																			"width" : "5%"
																		},
																		{
																			"data" : "stationaryfees",
																			"width" : "5%"
																		},
																		{
																			"data" : "competitivefees",
																			"width" : "5%"
																		},
																		{
																			"data" : "hostelfees",
																			"width" : "5%"
																		},
																		{
																			"data" : "messfees",
																			"width" : "5%"
																		},
																		{
																			"data" : "uniformfees",
																			"width" : "5%"
																		},
																		{
																			"data" : "raincoat",
																			"width" : "5%"
																		},
																		{
																			"data" : "undergarments",
																			"width" : "5%"
																		},
																		{
																			"data" : "otherfees",
																			"width" : "5%"
																		},
																		{
																			"data" : "lumpsumfees",
																			"width" : "5%"
																		},
																		
																		
																		{
																			"data" : "academicYear",
																			"width" : "5%"
																		},
																		{
																			"data" : "expectedPaymentDate",
																			"width" : "5%"
																		},

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
																				return "Student Fee Structure Report";
																			},
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			titleAttr : 'PDF'
																		} ]
															});

										});

						var mydata = catmap;
						$('#studentPayment').dataTable().fnAddData(mydata);

					});
}

// Student Fee Report Class Wise
function classNameWiseReport()
{
	if (document.classForm.harshad.value == "") {
		alert("Please select Class Name");
		return false;
	}
/*	if (document.classForm.className.value == "") {
		alert("Please select Class Name");
		return false;
	}*/
	classNameWiseReport1();
}

function classNameWiseReport1() {
	var params = {};

	var input1 = document.getElementById('harshad'), list = document
	.getElementById('classes'), i, fk_class_id;

for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input1.value) {
	fk_class_id = list.options[i].getAttribute('data-value');
}
}

	var harshad = $('#harshad').val();

	params["fk_class_id"] = harshad;


	params["methodName"] = "getClassWiseReport";

	$
			.post(
					'/srb/JSP/utility/controller.jsp',
					params,
					function(data) {
						$('#classWiseFee').dataTable().fnClearTable();
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
											var total = $('#classWiseFee')
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
																		"data" : "computerFees",
																		"width" : "5%"
																	},
																	{
																		"data" : "examFees",
																		"width" : "5%"
																	},
																	{
																		"data" : "tuitionfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "admissionfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "medicalfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "gymnassiumfees",
																		"width" : "5%"
																	},
																	
																	{
																		"data" : "laboratoryfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "stationaryfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "competitivefees",
																		"width" : "5%"
																	},
																	{
																		"data" : "hostelfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "messfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "uniformfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "raincoat",
																		"width" : "5%"
																	},
																	{
																		"data" : "undergarments",
																		"width" : "5%"
																	},
																	{
																		"data" : "otherfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "lumpsumfees",
																		"width" : "5%"
																	},
																	
																	
																	{
																		"data" : "academicYear",
																		"width" : "5%"
																	},
																	{
																		"data" : "expectedPaymentDate",
																		"width" : "5%"
																	},

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
																				return "Student Fee Structure Class Wise Report";
																			},
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			titleAttr : 'PDF'
																		} ]
															});

										});

						var mydata = catmap;
						$('#classWiseFee').dataTable().fnAddData(mydata);

					});
}

//Student Fee Report Day Wise
function DayNameWiseReport() {
	
	if (document.dayWiseForm.expectedPaymentDate.value == "") {
		alert("Please select Date");
		return false;
	}
	else{
		DayNameWiseReport1();
		
	}
	
}

function DayNameWiseReport1() {
	var params = {};

	var expectedPaymentDate = $('#expectedPaymentDate').val();
	params["expectedPaymentDate"] = expectedPaymentDate;

	params["methodName"] = "getDayWiseReport";

	$
			.post(
					'/srb/JSP/utility/controller.jsp',
					params,
					function(data) {
						$('#dayWiseFee').dataTable().fnClearTable();
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
											var total = $('#dayWiseFee')
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
																		"data" : "computerFees",
																		"width" : "5%"
																	},
																	{
																		"data" : "examFees",
																		"width" : "5%"
																	},
																	{
																		"data" : "tuitionfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "admissionfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "medicalfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "gymnassiumfees",
																		"width" : "5%"
																	},
																	
																	{
																		"data" : "laboratoryfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "stationaryfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "competitivefees",
																		"width" : "5%"
																	},
																	{
																		"data" : "hostelfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "messfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "uniformfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "raincoat",
																		"width" : "5%"
																	},
																	{
																		"data" : "undergarments",
																		"width" : "5%"
																	},
																	{
																		"data" : "otherfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "lumpsumfees",
																		"width" : "5%"
																	},
																	
																	
																	{
																		"data" : "academicYear",
																		"width" : "5%"
																	},
																	{
																		"data" : "expectedPaymentDate",
																		"width" : "5%"
																	},

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
																				return "Student Fee Structure Day Wise Report";
																			},
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			titleAttr : 'PDF'
																		} ]
															});

										});

						var mydata = catmap;
						$('#dayWiseFee').dataTable().fnAddData(mydata);

					});
}

//Student Fee Report Month Wise
function MonthNameWiseReport() {
	if (document.monthWiseForm.expectedPaymentDate.value == "") {
		return false;
	}
	if (document.monthWiseForm.expectedPaymentDate.value == "") {
		alert("Please select Date Name");
		return false;
	}
	MonthNameWiseReport1();
}

function MonthNameWiseReport1() {
	var params = {};

	var expectedPaymentDate1 = $('#expectedPaymentDate1').val();
	params["expectedPaymentDate1"] = expectedPaymentDate1;

	params["methodName"] = "getMonthWiseReport";

	$.post('/srb/JSP/utility/controller.jsp',
					params,function(data) {
						$('#monthWiseFee').dataTable().fnClearTable();
						var jsonData = $.parseJSON(data);
						// alert(data.length);
						if (data.length <= 28) {
							alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
							return true;
						}
						var catmap = jsonData.list;
						/*
						 * $(document).ready(function() { } );
						 */

						$(document)
								.ready(
										function() {
											var total = $('#monthWiseFee')
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
																		"data" : "computerFees",
																		"width" : "5%"
																	},
																	{
																		"data" : "examFees",
																		"width" : "5%"
																	},
																	{
																		"data" : "tuitionfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "admissionfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "medicalfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "gymnassiumfees",
																		"width" : "5%"
																	},
																	
																	{
																		"data" : "laboratoryfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "stationaryfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "competitivefees",
																		"width" : "5%"
																	},
																	{
																		"data" : "hostelfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "messfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "uniformfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "raincoat",
																		"width" : "5%"
																	},
																	{
																		"data" : "undergarments",
																		"width" : "5%"
																	},
																	{
																		"data" : "otherfees",
																		"width" : "5%"
																	},
																	{
																		"data" : "lumpsumfees",
																		"width" : "5%"
																	},
																	
																	
																	{
																		"data" : "academicYear",
																		"width" : "5%"
																	},
																	{
																		"data" : "expectedPaymentDate",
																		"width" : "5%"
																	},

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
																				return "Student Fee Structure Month Wise Report";
																			},
																			orientation : 'landscape',
																			pageSize : 'LEGAL',
																			titleAttr : 'PDF'
																		} ]
															});

										});

						var mydata = catmap;
						$('#monthWiseFee').dataTable().fnAddData(mydata);

					});
}

