function TeacherValidation() {
if (document.tdvf.designation.value == "") {
		alert("Select Designation");
		return false;
	}
	if(document.tdvf.firstName.value == "")
	{
	alert(" Enter first Name.");
		return false;
	}
	var letterNumber1 = /^[a-zA-Z]+$/;
	if(document.tdvf.firstName.value.match(letterNumber1))//1st
                    {
		if(document.tdvf.middleName.value=="")
		{
		alert("Enter Teacher Middle Name.");
		return false;
		}
		var letterNumber2 = /^[a-zA-Z]+$/;
		if(document.tdvf.middleName.value.match(letterNumber2))//2nd 
		{
		if(document.tdvf.lastName.value == "") 
		{
		alert("Enter Teacher Last Name.");
		return false;
		}
		var letterNumber3 = /^[a-zA-Z]+$/;
		if(document.tdvf.lastName.value.match(letterNumber3))//3rd
		 {
		if (document.tdvf.dob.value == "")
		 {
		alert("Please Select dob");
		return false;
		}				
		if (document.tdvf.hquqlification.value == "")
		 {
		alert("Please Enter Quqlification");
		return false;
		}		
		var letterNumber4 = /^[a-zA-Z.]+$/;
		if(document.tdvf.hquqlification.value.match(letterNumber4))//4th
		 {
			if (document.tdvf.jdate.value == "") {
			alert("Please Select Joining Date");
			return false;
			}			
			if(document.tdvf.percentage.value == "" ) {
		    	    alert(" Enter percentage.");
		    	    return false;
		    	    }			
		//var letterNumber5 = /^-?\d*[.,]?\d*$/;
			//var letterNumber5 =/^[0-9]{1,2}?((.)[0-9]{1,2})?$/ ;
			var letterNumber5=/^([1-9]?[0-9])(\.(\d{0,2}))?$/;
			if(document.tdvf.percentage.value.match(letterNumber5) && document.tdvf.percentage.value!="00" && document.tdvf.percentage.value!="0")//5th
		 {		
			  if(document.tdvf.mobnum.value == "" )
		        	{
		        	alert(" Enter mobile Number.");
		        	return false;
		        	}
		        	var letterNumber6 = /^[0-9]{10}$/;  
		        	if(document.tdvf.mobnum.value.match(letterNumber6) && document.tdvf.mobnum.value != "0000000000")//6th
		            	{
		        		if(document.tdvf.accountNumber.value=="")
		        			{
		        			alert("Enter a account Number");
		        			return false;
		        			}
		        			if(document.tdvf.bankName.value=="")
		        			{
		        			alert("Enter a bank name");
		        			return false;
		        			}
		        			var letterNumber10 =/^[a-zA-Z]+$/;
		        			if(document.tdvf.bankName.value.match(letterNumber10))//7
		        			{
		        			if(document.tdvf.ifsc.value=="")
		        			{
		        			alert("Enter a Ifsc number");
		        			return false;
		        			}
		        			var letterNumber7=/^[a-zA-Z0-9]+$/;
			        		if(document.tdvf.ifsc.value.match(letterNumber7))//7th
			    			{
			        			if(document.tdvf.aadharNumber.value=="")
			        			{
			        			alert("Enter a adhaar number");
			        			return false;
			        			}
			        			var letterNumber8 = /^[0-9]{12}$/;
			        		     if(document.tdvf.aadharNumber.value.match(letterNumber8))//8th
			        			{
			        		    	 if(document.tdvf.epfNumber.value=="")
					        			{
					        				alert("Enter a Epf Number");
					        				return false;
					        			}
					        							
					        					if(document.tdvf.Salary.value=="")
					        						{
					        						alert("Enter a salary");
					        						return false;
					        						}
					        					teacherInfo();
					        									        	 
			        			}
				        			
				        			else//8th
				        		         			{
				        		         			alert("Enter 12 digits Only in Adhar number field..!!");
				        		         			return false;
				        		         			}
				    
			        					}
			        		else//7th
			    			{
			    				alert("Enter a valid Ifsc code");
			    				return false;
			    			}
		        		}
		        		else//11
		        			{
		        			alert("Enter a valid Bank Name");
		        			return false;
		        			}
			}
			
			else//6th
		    	{
		    	alert("Enter 10 digits Only in contact number field And All 0's is invalid..!!");
		    	return false;
		    	}	
			
		}
		 else//5th
	              	 {
	                   	alert("Enter validate  Percentage/CGPA ..!!");
	                   	return false;
	                     }


		}
		else//4th
	               	{
	                   alert("Enter Alphabets Only in Highest Qualification..!!");
	                   return false;
	                     }


		}
		else//3rd
		{
		alert("Enter Alphabets Only in Last Name..!!");
		return false;
		}

		}
		 else//2nd
		     {
		        alert("Enter Alphabets Only in middle name field..!!");
		          return false;
		       }
  }
	 else//1st
	{
	 alert("Enter Alphabets Only in first name field..!!");
	 return false;
	 }
}








/*function TeacherValidation() {
	if (document.tdvf.designation.value == "") {
		alert("Select Designation");
		return false;
	}
	if(document.tdvf.firstName.value == "")
	{
	alert(" Enter first Name.");
		return false;
	}	
	var letterNumber1 = /^[a-zA-Z]+$/;
	if(document.tdvf.firstName.value.match(letterNumber))
       {
		if(document.tdvf.middleName.value=="") {
			alert("Enter Teacher Middle Name.");
			return false;
		}
		var letterNumber2 = /^[a-zA-Z]+$/;
		if(document.tdvf.middleName.value.match(letterNumber)) {

			if (document.tdvf.lastName.value == "") {
				alert("Enter Teacher Last Name.");
				return false;
			}
			var letterNumber = /^[a-zA-Z]+$/;
			if(document.tdvf.lastName.value.match(letterNumber)) {
				if (document.tdvf.dob.value == "") {
					alert("Please Select dob");
					return false;
				}
				if (document.tdvf.hquqlification.value == "") {
					alert("Please Enter Quqlification");
					return false;
				}
				//var letterNumber = /^[a-zA-Z]+$/;
				var letterNumber = /^[a-zA-Z.]+$/;
				if(document.tdvf.hquqlification.value.match(letterNumber)) {
				if (document.tdvf.jdate.value == "") {
					alert("Please Select Joining Date");
					return false;
				}
				//var letterNumber =/^[0-9.,\b]+$/;
//				var letterNumber =  /^[0-9]*\.?[0-9]*$/;
//				if(document.tdvf.jdate.value.match(letterNumber)) {
				  if(document.tdvf.percentage.value == "")
		    	    {
		    	    	alert(" Enter percentage.");
		    	    return false;
		    	    }
				  //var letterNumber = /^[0-9]$/;  var z1=^[0-9]*\d$;
				 // var letterNumber =/^[0-9]d$/;
					var letterNumber = /^-?\d*[.,]?\d*$/;
				  if(document.tdvf.percentage.value.match(letterNumber)) {
				  if(document.tdvf.mobnum.value == "" )
		        	{
		        		alert(" Enter mobile Number.");
		        	return false;
		        	}
		        	var letterNumber = /^[0-9]{10}$/;  
		        	if(document.tdvf.mobnum.value.match(letterNumber) && document.tdvf.mobnum.value != "0000000000")
		            {	
		        		var letterNumber = /^[0-9]{12}$/;
		            	if(document.tdvf.aadharNumber.value.match(letterNumber))
		                {		
		        	   teacherInfo();
		            }
		            	 else
		         		{
		         			alert("Enter 12 digits Only in Adhar number field..!!");
		         			return false;
		         			}	
		            } 
		        	else
		    		{
		    			alert("Enter 10 digits Only in contact number field And All 0's is invalid..!!");
		    			return false;
		    			}	
			}
				  else
	               {
	                   alert("Enter Number Only in Percentage/CGPA..!!");
	                   return false;
	                     }
	               }
				 /*else
	               {
	                   alert("Percentage/CGPA..!!");
	                   return false;
	                     }
	               }
			*/	
/*else
	               {
	                   alert("Enter Alphabets Only in Highest Qualification..!!");
	                   return false;
	                     }
	               }
				
				else
				{
				alert("Enter Alphabets Only in Last Name..!!");
				return false;
				}
				}  
					 else
		                {
		                alert("Enter Alphabets Only in middle name field..!!");
		                return false;
		                }
		                }
		                						
		                else
		                {
		                alert("Enter Alphabets Only in first name field..!!");
		                return false;
		                }
		    			
}
*/
function validationEmployeeLeaveDetails()
{
	var params = {};
	document.empd.btn.disabled = true;
	
	
	var input1 = document.getElementById('fk_employee_id'), list = document
	.getElementById('employeeNameList'), i, fkClassId;

for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input1.value) {
	fk_employee_id = list.options[i].getAttribute('data-value');
}
}
	
	var empname = $('#fk_employee_id').val();
	var leaveDateFrom = $('#leaveDateFrom').val();
	var type = $('#type').val();
	var leaveDateTo = $('#leaveDateTo').val();
	var description = $('#description').val();
	var approvedBy = $('#approvedBy').val();

	//var lastName = $('#lastName').val(); 
	
	params["empname"] = empname;
	params["leaveDateFrom"] = leaveDateFrom;
	params["type"] = type;
	params["leaveDateTo"] = leaveDateTo;
	params["description"] = description;
	params["approvedBy"] = approvedBy;
	params["fk_employee_id"] = fk_employee_id;
	
	params["methodName"] = "teacherInfoLeave";
	
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	})



}
//update
function updateEmployeeLeaveDetails()
{
	var oldemp = $('#fk_employee_id1').val();
	var newempp = $('#fk_employee_id').val();
	
	if(oldemp=="" || oldemp==null || oldemp == undefined){
		alert("Please select employee to edit");
		return false;
	}
	
	if(newempp=="" || newempp==null || newempp== undefined){
		alert("Please select new employee");
		return false;
	}
	
	updateEmployeeLeaveDetails1()
}
function updateEmployeeLeaveDetails1()
{
	var params = {};
	document.empd.btn.disabled = true;
	
	
	var input1 = document.getElementById('fk_employee_id1'), list = document
	.getElementById('employeeNameList1'), i, fkClassId1;

for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input1.value) {
	fkClassId1 = list.options[i].getAttribute('data-value');
}
}

//
var input1 = document.getElementById('fk_employee_id'), listt = document
.getElementById('employeeNameList'), j, fkClassId;

for (j = 0; j < listt.options.length; ++j) {
if (listt.options[j].value === input1.value) {
	fkClassId = listt.options[j].getAttribute('data-value');
}
}

	var empname = $('#fk_employee_id').val();
	var leaveDateFrom1 = $('#leaveDateFrom1').val();
	var type1 = $('#type1').val();
	var leaveDateTo1 = $('#leaveDateTo1').val();
	var description1 = $('#description1').val();
	var approvedBy1 = $('#approvedBy1').val();

	//var lastName = $('#lastName').val(); 
	
	params["empname"] = empname;
	params["leaveDateFrom1"] = leaveDateFrom1;
	params["type1"] = type1;
	params["leaveDateTo1"] = leaveDateTo1;
	params["description1"] = description1;
	params["approvedBy1"] = approvedBy1;
	params["fk_employee_id"] = fkClassId;
	params["newempid"] = fkClassId1;
	
	params["methodName"] = "updateteacherInfoLeave";
	
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	})



}

//List Of Employee Leave Details 
function employeeLeaveList()
{
	var params= {};

	params["methodName"] = "getAllEmployeeLeaveList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#empLeaveDetails').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#empLeaveDetails').DataTable( {
				
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

					// Total over this page
					/*pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );*/

					// Update footer
			/*		$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);*/
					
				},

				destroy: true,
				searching: true,			      
				columns: [
					
					
				          {"data": "firstName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "middleName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "LastName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "leaveDateFrom", "width": "5%" ,"defaultContent": ""},
				          {"data": "leaveDateTo", "width": "5%" ,"defaultContent": ""},
				          {"data": "Type", "width": "5%" ,"defaultContent": ""},
				          {"data": "description" , "width": "5%" ,"defaultContent": ""},
				          {"data": "approvedBy" , "width": "5%" ,"defaultContent": ""},
				         
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Leave List";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#empLeaveDetails').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

}


function validationofTransportionDetails(){
	if (document.tmpd.fk_class_id1.value == "") {
		alert("Please Select Class Name.");
		return false;
	}
	if (document.tmpd.fk_division_id.value == "") {
		alert("Please Select Division Name.");
		return false;
	}
	if (document.tmpd.fk_Student_id.value == "") {
		alert("Please Select Student Name.");
		return false;
	}
	if (document.tmpd.DriverName.value == "") {
		alert("Please Enter Driver Name");
		return false;
	}
	if (document.tmpd.leaveDateFrom.value == "") {
		alert("Please Enter Date From.");
		return false;
	}
	var num=/^[0-9]{10}$/;
	if (document.tmpd.ContactNo.value == "") {
		alert("Please Enter Contact No.");
		return false;
	}
	var num=/^[0-9]{10}$/;
	if(document.tmpd.ContactNo.value.match(num) && document.tmpd.ContactNo.value!="9999999999" && document.tmpd.ContactNo.value!="0000000000" )
		{
		
		if (document.tmpd.leaveDateTo.value == "") {
			alert("Please Enter Date To.");
			return false;
		}
		
		
		if (document.tmpd.Pincode.value == "") {
			alert("Please Enter Pincode.");
			return false;
		}
		var num2=/^[0-9]{6}$/;
		if(document.tmpd.Pincode.value.match(num2) && document.tmpd.Pincode.value!="000000" && document.tmpd.Pincode.value!="999999")
			{
			if (document.tmpd.payement.value == "") {
				alert("Please Enter Fees.");
				return false;
			}
			validationofTransportionDetails1();
			}
		else
			{
			alert("plese Enter a Valid Pincode");
			return false;
			}
		
		}
	else
		{
		alert("Please Enter a Valid Contact Number");
		return false;
		}
	
	
}	


function validationofTransportionDetails1()
{
	
	var params = {};
	document.tmpd.btn.disabled = true;
	
	
	var input1 = document.getElementById('fk_class_id1'), list = document
	.getElementById('classes'), i, fk_class_id1;

for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input1.value) {
	fk_class_id1 = list.options[i].getAttribute('data-value');
}
}

var input1 = document.getElementById('fk_division_id'), list = document
.getElementById('division'), i, fk_division_id;

for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input1.value) {
	fk_division_id = list.options[i].getAttribute('data-value');
}
}

var input2 = document.getElementById('fk_Student_id'), 
list = document.getElementById('studentNameList'), 
i, fkstudid;

for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input2.value) {
	fkstudid = list.options[i].getAttribute('data-value');
}
}

	var leaveDateFrom = $('#leaveDateFrom').val();
	var DriverName = $('#DriverName').val();
	var leaveDateTo = $('#leaveDateTo').val();
	var ContactNo = $('#ContactNo').val();
	var Pincode = $('#Pincode').val();
//	var studentid = fkstudid;
	var studentname = $('#fk_Student_id').val();
	var payement = $('#payement').val(); 
	var Address = $('#Address').val();
	if(Address=="" || Address==null ||Address==undefined )
		{
		Address="N/A";
		}
//	var aa = document.getElementById("studentid").value;
	
	//alert("student name - "+studentname+"  aa  -  "+fkstudid);
	
	params["leaveDateFrom"] = leaveDateFrom;
	params["DriverName"] = DriverName;
	params["leaveDateTo"] = leaveDateTo;
	params["ContactNo"] = ContactNo;
	params["Pincode"] = Pincode;
	params["payement"] = payement;
	params["Address"] = Address;
	params["fk_class_id1"] = fk_class_id1;
	params["fk_division_id"] = fk_division_id ;
	params["studentid"] = fkstudid;
	params["studentname"] = studentname;
	
	params["methodName"] = "TransportionDetailsOFStrudentsNew";
	
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	})

}

// Teacher daily Task Home work Validation 
function TeacherDailyTaskValidation() {
	
	if (document.DailyTask.date3.value == "") {
		alert("Please Select  Date");
		return false;
	}
	if (document.DailyTask.fk_teacher_id.value == "") {
		alert("Please Enter Teacher Name.");
		return false;
	}
	if (document.DailyTask.academicYear.value == "") {
		alert("Please Enter Academic Year Name.");
		return false;
	}
	if (document.DailyTask.fk_class_id1.value == "") {
		alert("Please Enter Class Name.");
		return false;
	}
	if (document.DailyTask.fk_division_id.value == "") {
		alert(" Please Enter Division Name.");
		return false;
	}
	if (document.DailyTask.fk_subject_id.value == "") {
		alert("Please Enter Subject Name.");
		return false;
	}
	/*if (document.DailyTask.taskImage.value == "") {
		alert("Please Select Image.");
		return false;
	}*/
	if (document.DailyTask.taskInTextt.value == "") {
		alert("Please Enter Task");
		return false;
	}
	teacherDailyTaskEntry()
}

// add teacher info
function teacherInfo() {

	document.tdvf.btnn.disabled = true;
	var params = {};

	var designation = $('#designation').val();
	var firstName = $('#firstName').val();
	var middleName = $('#middleName').val();

	var lastName = $('#lastName').val();
	var dob = $('#dob').val();

	var hquqlification = $('#hquqlification').val();
	var jdate = $('#jdate').val();

	var specialization = $('#specialization').val();
	var percentage = $('#percentage').val();

	var mobnum = $('#mobnum').val();
	var landno = $('#landno').val();

	var perAddress = $('#perAddress').val();
	var preAddress = $('#preAddress').val();

	var accountNumber = $('#accountNumber').val();
	var bankName = $('#bankName').val();

	var ifsc = $('#ifsc').val();
	var aadharNumber = $('#aadharNumber').val();

	var panNumber = $('#panNumber').val();
	var epfNumber = $('#epfNumber').val();

	var ptNumber = $('#ptNumber').val();
	
	var Salary = $('#Salary').val();

	if (accountNumber == undefined || accountNumber == null
			|| accountNumber == "") {
		accountNumber = "'N/A'";
	}
	if (bankName == undefined || bankName == null || bankName == "") {
		bankName = "'N/A'";
	}
	if (ifsc == undefined || ifsc == null || ifsc == "") {
		ifsc = "'N/A'";
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
	if (hquqlification == undefined || hquqlification == null
			|| hquqlification == "") {
		hquqlification = "'N/A'";
	}
	if (specialization == undefined || specialization == null
			|| specialization == "") {
		specialization = "'N/A'";
	}
	if (percentage == undefined || percentage == null || percentage == "") {
		percentage = 0.0;
	}
	if (mobnum == undefined || mobnum == null || mobnum == "") {
		mobnum = 0;
	}
	if (landno == undefined || landno == null || landno == "") {
		landno = 0;
	}
	if (perAddress == undefined || perAddress == null || perAddress == "") {
		perAddress = "'N/A'";
	}
	if (preAddress == undefined || preAddress == null || preAddress == "") {
		preAddress = "'N/A'";
	}
	if (panNumber == undefined || panNumber == null || panNumber == "") {
		panNumber = "'N/A'";
	}
	if (epfNumber == undefined || epfNumber == null || epfNumber == "") {
		epfNumber = "'N/A'";
	}
	if (ptNumber == undefined || ptNumber == null || ptNumber == "") {
		ptNumber = "'N/A'";
	}

	params["designation"] = designation;
	params["firstName"] = firstName;
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["dob"] = dob;
	params["hquqlification"] = hquqlification;
	params["jdate"] = jdate;
	params["specialization"] = specialization;
	params["percentage"] = percentage;
	params["mobnum"] = mobnum;
	params["landno"] = landno;
	params["perAddress"] = perAddress;
	params["preAddress"] = preAddress;
	params["accountNumber"] = accountNumber;
	params["bankName"] = bankName;
	params["ifsc"] = ifsc;
	params["aadharNumber"] = aadharNumber;
	params["panNumber"] = panNumber;
	params["epfNumber"] = epfNumber;
	params["ptNumber"] = ptNumber;
	params["Salary"] = Salary;
	params["methodName"] = "teacherInfo";
	
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {
		alert(data);
		document.tdvf.btnn.disabled = false;
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	})
}

// Add Teacher Daily Home Work Task entry
function teacherDailyTaskEntry() {

	var params = {};
	var input1 = document.getElementById('fk_class_id1'), list = document
			.getElementById('classes'), i, fkClassId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}

	var input1 = document.getElementById('fk_teacher_id'), list = document
			.getElementById('teacherNameList'), i, fkteacherid;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkteacherid = list.options[i].getAttribute('data-value');
		}
	}
	var input1 = document.getElementById('fk_division_id'), list = document
			.getElementById('division'), i, fkDivisionId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkDivisionId = list.options[i].getAttribute('data-value');
		}
	}

	var className = $('#fk_class_id1').val();
	var division = $('#fk_division_id').val();
	var subject = $('#fk_subject_id').val();
	var teacherName = $('#fk_teacher_id').val();
	var academicYear = $('#academicYear').val();
	var date3=$('#date3').val();
	var task = $('#taskInTextt').val();
	var taskImage = $('#taskImage').val();
	
	if (className == undefined || className == null || className == "") {
		className = "'N/A'";
	}
	if (division == undefined || division == null || division == "") {
		division = "'N/A'";
	}
	if (subject == undefined || subject == null || subject == "") {
		subject = "'N/A'";
	}
	if (teacherName == undefined || teacherName == null || teacherName == "") {
		teacherName = "'N/A'";
	}
	if (academicYear == undefined || academicYear == null || academicYear == "") {
		academicYear = "'N/A'";
	}
	if (task == undefined || task == null || task == "") {
		task = "'N/A'";
	}

	if (fkDivisionId == undefined || fkDivisionId == null || fkDivisionId == "") {
		fkDivisionId = 0;
	}
	/*if (fkteacherid == undefined || fkteacherid == null || fkteacherid == "") {
		fkteacherid = 0;
	}*/
	if (fkClassId == undefined || fkClassId == null || fkClassId == "") {
		fkClassId = 0;
	}
	
	params["className"] = className;
	params["division"] = division;
	params["subject"] = subject;
	params["teacherName"] = teacherName;
	params["academicYear"] = academicYear;
	params["task"] = task;
	params["taskImage"] = taskImage;
	params["fkDivisionId"] = fkDivisionId;
	params["fkteacherid"] = fkteacherid;
	params["fkClassId"] = fkClassId;
	params["date3"] = date3;
	params["methodName"] = "addTeacherDailyTask";

	$.post('/srb/JSP/utility/controller.jsp', params, function(data)

	{
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

function HomeWorkteacherDailyTaskEntry()
{
	if (document.DailyTask.fk_teacher_id.value == "") {
		alert("Please Enter Teacher Name.");
		return false;
	}
	if (document.DailyTask.academicYear.value == "") {
		alert("Please Enter Academic Year Name.");
		return false;
	}
	if (document.DailyTask.fk_class_id1.value == "") {
		alert("Please Enter Class Name.");
		return false;
	}
	if (document.DailyTask.fk_division_id.value == "") {
		alert(" Please Enter Division Name.");
		return false;
	}
	if (document.DailyTask.fk_subject_id.value == "") {
		alert("Please Enter Subject Name.");
		return false;
	}
/*	if (document.DailyTask.taskImage.value == "") {
		alert("Please Select Image.");
		return false;
	}*/
	if (document.DailyTask.taskInText.value == "") {
		alert("Please Enter Task");
		return false;
	}
	HomeWorkteacherDailyTaskEntry1()
}
function HomeWorkteacherDailyTaskEntry1()
{
	
	var params = {};
	var input1 = document.getElementById('fk_class_id1'), list = document
			.getElementById('classes'), i, fkClassId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}

	var input1 = document.getElementById('fk_teacher_id'), list = document
			.getElementById('teacherNameList'), i, fkteacherid;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkteacherid = list.options[i].getAttribute('data-value');
		}
	}
	var input1 = document.getElementById('fk_division_id'), list = document
			.getElementById('division'), i, fkDivisionId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkDivisionId = list.options[i].getAttribute('data-value');
		}
	}

	var className = $('#fk_class_id1').val();
	var division = $('#fk_division_id').val();
	var subject = $('#fk_subject_id').val();
	var teacherName = $('#fk_teacher_id').val();
	var academicYear = $('#academicYear').val();
	var task = $('#taskInText').val();
	var taskImage = $('#taskImage').val();

	if (className == undefined || className == null || className == "") {
		className = "'N/A'";
	}
	if (division == undefined || division == null || division == "") {
		division = "'N/A'";
	}
	if (subject == undefined || subject == null || subject == "") {
		subject = "'N/A'";
	}
	if (teacherName == undefined || teacherName == null || teacherName == "") {
		teacherName = "'N/A'";
	}
	if (academicYear == undefined || academicYear == null || academicYear == "") {
		className = "'N/A'";
	}
	if (task == undefined || task == null || task == "") {
		className = "'N/A'";
	}

	if (fkDivisionId == undefined || fkDivisionId == null || fkDivisionId == "") {
		fkDivisionId = 0;
	}
	if (fkteacherid == undefined || fkteacherid == null || fkteacherid == "") {
		fkteacherid = 0;
	}
	if (fkClassId == undefined || fkClassId == null || fkClassId == "") {
		fkClassId = 0;
	}

	params["className"] = className;
	params["division"] = division;
	params["subject"] = subject;
	params["teacherName"] = teacherName;
	params["academicYear"] = academicYear;
	params["task"] = task;
	params["taskImage"] = taskImage;
	params["fkDivisionId"] = fkDivisionId;
	params["fkteacherid"] = fkteacherid;
	params["fkClassId"] = fkClassId;

	params["methodName"] = "addHomeWorkTeacherDailyTask";

	$.post('/srb/JSP/utility/controller.jsp', params, function(data)

	{
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
//


function edithome()
{
	
	var params = {};
	var input1 = document.getElementById('fk_subject_id'), list = document
			.getElementById('subjectList'), i, fkClassId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}

	var subid = fkClassId;
	var className = $('#fk_class_id1').val();
	var division = $('#fk_division_id').val();
	var subject = $('#fk_subject_id').val();
	var teacherName = $('#fk_teacher_id').val();
	var academicYear = $('#academicYear').val();
	var task = $('#taskInText').val();
//	var taskImage = $('#taskImage').val();
	if (teacherName == undefined || teacherName == null || teacherName == "") {
		alert("Please select Teacher Name");
		return false;
	}
	if (className == undefined || className == null || className == "") {
		alert("Please Select Class Name");
		return false;
	}
	if (division == undefined || division == null || division == "") {
		alert("Please Select Division");
		return false;
	}
	if (subject == undefined || subject == null || subject == "") {
		alert("Please Select subject");
		return false;
	}
	if (task == undefined || task == null || task == "") {
		alert("Please Enter Homework");
		return false;
	}

	params["className"] = className;
	params["division"] = division;
	params["subject"] = subject;
	params["teacherName"] = teacherName;
	params["academicYear"] = academicYear;
	params["task"] = task;
//	params["taskImage"] = taskImage;
	params["subid"] = subid;


	params["methodName"] = "editHomeWorkTeacherDailyTask";

	$.post('/srb/JSP/utility/controller.jsp', params, function(data)

	{
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


//get Teacher Name 
function getTeacherName(){
	
	var params = {};

	/*var input = document.getElementById('fk_teacher_id'), list = document
			.getElementById('teacherNameList'), i, fkRootTeacherId;
	for (i = 0; i < list.options.length; ++i) {l
		if (list.options[i].value === input.value) {
			fkRootTeacherId = list.options[i].getAttribute('data-value');
		}
	}*/
	var designation = $('#designation').val();

	/*$("#designation").append($("<input/>").attr("value", "").text());*/
	
	$("#fk_teacher_id").append($("<option></option>").attr("value","").text("Select Employee"));
	/*$("#middleName").append($("<input/>").attr("value", "").text());
	$("#lastName").append($("<input/>").attr("value", "").text());
*/
	params["designation"] = designation;
	
	params["methodName"] = "getTeacherDetailWiseToEdit";

	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {

		var count = 1;
		var jsonData = $.parseJSON(data);
		//var catmap = jsonData.list;
		$.each(jsonData, function(i, v) {
			/*document.getElementById("designation").value = v.designation;*/
			
		//	document.getElementById("fk_teacher_id").value = v.firstName + v.middleName + v.lastName;
			$("#fk_teacher_id").append($("<option></option>").attr("value",count).text(v.firstName +" "+v.middleName +" "+v.lastName));
			count++;
	
			
			
			
		});
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});
	
}

// get teacher detail for edit
//get student all detail to edit
function getStudentDetails1() {

	var params = {};
	var input = document.getElementById('fk_teacher_id'), list = document
			.getElementById('teacherNameList'), i, fkRootTeacherId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootTeacherId = list.options[i].getAttribute('data-value');
		}
	}
	var old_designation = $('#old_designation').val();
	//var designation = $('#designation').val();
	
	$("#old_designation").append($("<input/>").attr("value", "").text());
	//$("#designation").append($("<input/>").attr("value", "").text());
	$("#firstName").append($("<input/>").attr("value", "").text());
	$("#middleName").append($("<input/>").attr("value", "").text());
	$("#lastName").append($("<input/>").attr("value", "").text());
	$("#oldDob").append($("<input/>").attr("value", "").text());

	$("#hquqlification").append($("<input/>").attr("value", "").text());
	$("#specialization").append($("<input/>").attr("value", "").text());
	$("#percentage").append($("<input/>").attr("value", "").text());
	$("#oldJdate").append($("<input/>").attr("value", "").text());
	$("#mobnum").append($("<input/>").attr("value", "").text());

	$("#landno").append($("<input/>").attr("value", "").text());
	$("#perAddress").append($("<input/>").attr("value", "").text());
	$("#preAddress").append($("<input/>").attr("value", "").text());
	
	$("#accountNumber").append($("<input/>").attr("value", "").text());
	$("#bankName").append($("<input/>").attr("value", "").text());
	$("#ifsc").append($("<input/>").attr("value", "").text());
	$("#aadharNumber").append($("<input/>").attr("value", "").text());
	$("#panNumber").append($("<input/>").attr("value", "").text());
	$("#epfNumber").append($("<input/>").attr("value", "").text());
	$("#ptNumber").append($("<input/>").attr("value", "").text());
	$("#Salary").append($("<input/>").attr("value", "").text());

	params["teacherId"] = fkRootTeacherId;
	params["methodName"] = "getTeacherDetailToEdit1";
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
											document.getElementById("old_designation").value = v.designation;
											document.getElementById("firstName").value = v.firstName;
											document.getElementById("middleName").value = v.middleName;
											document.getElementById("lastName").value = v.lastName;
											document.getElementById("oldDob").value = v.dob;
											document.getElementById("hquqlification").value = v.hquqlification;
											document.getElementById("specialization").value = v.specialization;
											document.getElementById("percentage").value = v.percentage;
											document.getElementById("oldJdate").value = v.jdate;

											document.getElementById("mobnum").value = v.mobnum;
											document.getElementById("landno").value = v.landno;
											document.getElementById("perAddress").value = v.perAddress;
											document.getElementById("preAddress").value = v.preAddress;

											document.getElementById("accountNumber").value = v.accountNumber;
											document.getElementById("bankName").value = v.bankName;
											document.getElementById("ifsc").value = v.ifsc;
											document.getElementById("aadharNumber").value = v.aadharNumber;
											document.getElementById("panNumber").value = v.panNumber;
											document.getElementById("epfNumber").value = v.epfNumber;
											document.getElementById("ptNumber").value = v.ptNumber;
											document.getElementById("Salary").value = v.Salary;
											document.getElementById("teacherId").value = v.teacherId;
								

										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}
/*function getTeacherDetails() {

	var params = {};

	var input = document.getElementById('fk_teacher_id'), list = document
			.getElementById('teacherNameList'), i, fkRootTeacherId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootTeacherId = list.options[i].getAttribute('data-value');
		}
	}
	var designation = $('#designation').val();

	$("#designation").append($("<input/>").attr("value", "").text());
	$("#firstName").append($("<input/>").attr("value", "").text());
	$("#middleName").append($("<input/>").attr("value", "").text());
	$("#lastName").append($("<input/>").attr("value", "").text());
	$("#oldDob").append($("<input/>").attr("value", "").text());

	$("#hquqlification").append($("<input/>").attr("value", "").text());
	$("#specialization").append($("<input/>").attr("value", "").text());
	$("#percentage").append($("<input/>").attr("value", "").text());
	$("#oldJdate").append($("<input/>").attr("value", "").text());
	$("#mobnum").append($("<input/>").attr("value", "").text());

	$("#landno").append($("<input/>").attr("value", "").text());
	$("#perAddress").append($("<input/>").attr("value", "").text());
	$("#preAddress").append($("<input/>").attr("value", "").text());
	
	$("#accountNumber").append($("<input/>").attr("value", "").text());
	$("#bankName").append($("<input/>").attr("value", "").text());
	$("#ifsc").append($("<input/>").attr("value", "").text());
	$("#aadharNumber").append($("<input/>").attr("value", "").text());
	$("#panNumber").append($("<input/>").attr("value", "").text());
	$("#epfNumber").append($("<input/>").attr("value", "").text());
	$("#ptNumber").append($("<input/>").attr("value", "").text());
	$("#Salary").append($("<input/>").attr("value", "").text());

	params["designation"] = designation;

	params["methodName"] = "getTeacherDetailToEdit";

	$.post('/srb/JSP/utility/controller.jsp', params, function(data) {

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData, function(i, v) {
			document.getElementById("designation").value = v.designation;
			document.getElementById("firstName").value = v.firstName;
			document.getElementById("middleName").value = v.middleName;
			document.getElementById("lastName").value = v.lastName;
			document.getElementById("oldDob").value = v.dob;
			document.getElementById("hquqlification").value = v.hquqlification;
			document.getElementById("specialization").value = v.specialization;
			document.getElementById("percentage").value = v.percentage;
			document.getElementById("oldJdate").value = v.jdate;

			document.getElementById("mobnum").value = v.mobnum;
			document.getElementById("landno").value = v.landno;
			document.getElementById("perAddress").value = v.perAddress;
			document.getElementById("preAddress").value = v.preAddress;

			document.getElementById("accountNumber").value = v.accountNumber;
			document.getElementById("bankName").value = v.bankName;
			document.getElementById("ifsc").value = v.ifsc;
			document.getElementById("aadharNumber").value = v.aadharNumber;
			document.getElementById("panNumber").value = v.panNumber;
			document.getElementById("epfNumber").value = v.epfNumber;
			document.getElementById("ptNumber").value = v.ptNumber;
			document.getElementById("Salary").value = v.Salary;

		});
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}*/


// update teacher info
function updateTeacherInfo() {
	document.getElementById("btn").disabled = true;
	var input = document.getElementById('fk_teacher_id'), list = document
			.getElementById('teacherNameList'), i, fkRootTeacherId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootTeacherId = list.options[i].getAttribute('data-value');
		}
	}

	var old_designation = $('#old_designation').val();
	var designation = $('#designation').val();
	var firstName = $('#firstName').val();
	var middleName = $('#middleName').val();
	var lastName = $('#lastName').val();
	var hquqlification = $('#hquqlification').val();
	var specialization = $('#specialization').val();
	var percentage = $('#percentage').val();
	var jdate = $('#jdate').val();
	var dob = $('#dob').val();

	var mobnum = $('#mobnum').val();
	var landno = $('#landno').val();

	var perAddress = $('#perAddress').val();
	var preAddress = $('#preAddress').val();
	
	var accountNumber = $('#accountNumber').val();
	var bankName = $('#bankName').val();

	var ifsc = $('#ifsc').val();
	var aadharNumber = $('#aadharNumber').val();
	var panNumber = $('#panNumber').val();
	var epfNumber = $('#epfNumber').val();
	var ptNumber = $('#ptNumber').val();
	var Salary = $('#Salary').val(); 
	if (mobnum == undefined || mobnum == null
			|| landno == "") {
		mobnum = "0";
	}
	if (landno == undefined || landno == null
			|| landno == "") {
		landno = "0";
	}
	if (preAddress == undefined || preAddress == null
			|| preAddress == "") {
		preAddress = "N/A";
	}
	if (perAddress == undefined || perAddress == null
			|| perAddress == "") {
		perAddress = "N/A";
	}
	if (accountNumber == undefined || accountNumber == null
			|| accountNumber == "") {
		accountNumber = "N/A";
	}
	if (bankName == undefined || bankName == null || bankName == "") {
		bankName = "N/A";
	}
	if (ifsc == undefined || ifsc == null || ifsc == "") {
		ifsc = "N/A";
	}
	if (aadharNumber == undefined || aadharNumber == null || aadharNumber == "") {
		aadharNumber = "'N/A'";
	}
	if (panNumber == undefined || panNumber == null || panNumber == "") {
		panNumber = "'N/A'";
	}
	if (epfNumber == undefined || epfNumber == null || epfNumber == "") {
		epfNumber = "'N/A'";
	}
	if (ptNumber == undefined || ptNumber == null || ptNumber == "") {
		ptNumber = "'N/A'";
	}

	var params = {};
	params["teacherId"] = fkRootTeacherId;
	params["old_designation"] = old_designation;
	params["designation"] = designation;
	params["firstName"] = firstName;
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["hquqlification"] = hquqlification;
	params["specialization"] = specialization;
	params["percentage"] = percentage;
	params["dob"] = dob;
	params["jdate"] = jdate;
	params["mobnum"] = mobnum;
	params["landno"] = landno;
	params["perAddress"] = perAddress;
	params["preAddress"] = preAddress;

	params["accountNumber"] = accountNumber;
	params["bankName"] = bankName;
	params["ifsc"] = ifsc;
	params["aadharNumber"] = aadharNumber;
	params["panNumber"] = panNumber;
	params["epfNumber"] = epfNumber;
	params["ptNumber"] = ptNumber;
	params["Salary"] = Salary;
	params["methodName"] = "updateTeacherDetails";
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

// to show task image
function viewTaskImage() {

	var params = {};
	var input1 = document.getElementById('fk_class_id1'), list = document
			.getElementById('classes'), i, fkClassId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClassId = list.options[i].getAttribute('data-value');
		}
	}

	var input1 = document.getElementById('fk_teacher_id'), list = document
			.getElementById('teacherNameList'), i, fkteacherid;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkteacherid = list.options[i].getAttribute('data-value');
		}
	}
	var input1 = document.getElementById('fk_division_id'), list = document
			.getElementById('division'), i, fkDivisionId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkDivisionId = list.options[i].getAttribute('data-value');
		}
	}

	var className = $('#fk_class_id1').val();
	var division = $('#fk_division_id').val();
	var subject = $('#fk_subject_id').val();
	var teacherName = $('#fk_teacher_id').val();
	var academicYear = $('#academicYear').val();

	params["subject"] = subject;
	params["academicYear"] = academicYear;
	params["fkClassId"] = fkClassId;
	params["fkteacherid"] = fkteacherid;
	params["fkDivisionId"] = fkDivisionId;

	params["methodName"] = "viewTeacherDailyTask";

	$.post('/srb/JSP/utility/controller.jsp', params, function(data)

	{
		window.open("showTeacherTaskImage.jsp");
		location.reload();
	}

	).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}

	})
}

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

	$("#studentid").empty();
	$("#studentid").append(
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
			$("#studentid").append(
					$("<option></option>").attr("value", v.pkStudentId).text(v.firstName + " " + v.middleName + " "+ v.lastName));
		});    
		/*v.pkStudentId*/
	})

}

// add parents complaint details
function parentsComplaintInfo() {

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

	$("#studentName option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(" ");

	var firstName = splitText[0];
	var middleName = splitText[1];
	var lastName = splitText[2];
	var className = $('#fk_class_id1').val();
	var divisionName = $('#fk_division_id').val();
	var firstName = splitText[0];
	var middleName = splitText[1];
	var lastName = splitText[2];
	var academicYear = $('#academicYear').val();
	var parentName = $('#parentName').val();
	var academicYear = $('#academicYear').val();
	var task = $('#taskInText').val();
	var taskImage = $('#taskImage').val();

	if (className == undefined || className == null || className == "") {
		className = "'N/A'";
	}
	if (division == undefined || division == null || division == "") {
		division = "'N/A'";
	}
	if (subject == undefined || subject == null || subject == "") {
		subject = "'N/A'";
	}
	if (parentName == undefined || parentName == null || parentName == "") {
		parentName = "'N/A'";
	}
	if (academicYear == undefined || academicYear == null || academicYear == "") {
		className = "'N/A'";
	}
	if (task == undefined || task == null || task == "") {
		className = "'N/A'";
	}
	if (fkDivisionId == undefined || fkDivisionId == null || fkDivisionId == "") {
		fkDivisionId = 0;
	}
	if (fkClassId == undefined || fkClassId == null || fkClassId == "") {
		fkClassId = 0;
	}

	params["fk_class_id"] = fk_class_id;
	params["fk_division_id"] = fk_division_id;
	params["className"] = className;
	params["divisionName"] = divisionName;
	params["firstName"] = firstName;
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["academicYear"] = academicYear;
	params["parentName"] = parentName;
	params["academicYear"] = academicYear;
	params["task"] = task;
	params["taskImage"] = taskImage;

	params["methodName"] = "addParentsComplaint";

	$.post('/srb/JSP/utility/controller.jsp', params, function(data)

	{
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
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


//get Division by Class Name
function getDivisionNameByClassName2()
{
//var type = document.getElementById('vendor').value;
	
	$("#division1").empty();
	$("#division1").append($("<option></option>").attr("value","").text("Select Division"));
	var params= {};
	
	
		var input = document.getElementById('clsname'), list = document
		.getElementById('clsList'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#clsname').val();
	
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

///
function gettask()
{
//var type = document.getElementById('vendor').value;
	
	$("#taskInText").empty();
	$("#taskInText").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		/*var input = document.getElementById('fk_class_id1'), list = document
		.getElementById('classes'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}*/
		
	var teacher = $('#fk_teacher_id').val();
	var class1 = $('#fk_class_id1').val();
	var division = $('#fk_division_id').val();
	var subject = $('#fk_subject_id').val();

	params["teacher"] = teacher;
	params["class1"] = class1;
	params["division"] = division;
	params["subject"] = subject;
	
	params["methodName"] = "gettaskedit";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ 
		//var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						document.getElementById('taskInText').value = v.task;
/*						$("#taskInText").append($("<option></option>").attr("value",(v.task))); */
/*						$("#taskInText").append($("<option></option>").attr("value",(v.task)).attr("data-value",(v.pkTeacherDailyTaskId)));*/
	//					count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

function DeleteTechInfo()
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
	params["fktechid"] = fk_School_id;
	//params["delschoolName"] =delschoolName;
	
	params["methodName"] = "deleteTeacher";
	
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

function getteacherdett(){

	var params= {};
	
	var input = document.getElementById('fk_employee_id1'),
     list = document.getElementById('employeeNameList1'),
     	i,fkRootSchoolId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootSchoolId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
//	var teacher = document.getElementById('fk_employee_id1');
	
	$("#oldleaveDateFrom").append($("<input/>").attr("value","").text());
	$("#oldtype").append($("<input/>").attr("value","").text());
	$("#oldleaveDateTo").append($("<input/>").attr("value","").text());
	$("#description1").append($("<input/>").attr("value","").text());
	$("#approvedBy1").append($("<input/>").attr("value","").text());
	
	
//	params["teacher"]= teacher;
	params["teacherid"] = fkRootSchoolId;
	
	params["methodName"] = "getemployeeToEdit";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{

			
			
			      document.getElementById("oldleaveDateFrom").value = v.FirstDate;
				  document.getElementById("oldtype").value = v.LeaveType;
			      document.getElementById("oldleaveDateTo").value = v.LastDate;
			      document.getElementById("description1").value = v.Description;
			      document.getElementById("approvedBy1").value = v.ApprovedBy;
			    
			   
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    
}

function deleteleave()
{
	var input = document.getElementById('fk_employee_id1'),
    list = document.getElementById('employeeNameList1'),
    i,fk_Subject_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	fk_Subject_id = list.options[i].getAttribute('data-value');
    	}
	}
//	var delsubjectName = $("#subjectName").val();
	
	var params = {};
	params["empid"] = fk_Subject_id;
	//params["delschoolName"] =delschoolName;
	
	params["methodName"] = "deleteempleave";
	
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

function transportBetweenTwoDate()
{
	var params = {};
	var fdate = $("#fdate").val();
	var sdate = $("#sdate").val();
	params["fdate"]= fdate;
	params["sdate"]= sdate;
	params["methodName"] = "gettransportdetailBetweenTwoDate";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
			//To Clear Table
		$('#stockRep').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		
		
		$(document).ready(function() {
			$('#stockRep').DataTable( {

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

				

		    	
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		        "bPaginate": false,
		      
		columns: [
			        {"data": "studentName", "width": "5%"},
		            {"data": "ContactNo", "width": "5%"},
		          	{"data": "DriverName", "width": "5%"},
		            {"data": "payement", "width": "5%"},
		            {"data": "Address", "width": "5%"},
		            {"data": "leaveDateFrom" , "width": "5%"},
		            {"data": "leaveDateTo" , "width": "5%"}
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Transport Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );

	
	var mydata = catmap;
	$('#stockRep').dataTable().fnAddData(mydata);
		}).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
				$(loaderObj).hide();
				$(loaderObj).find('#errorDiv').show();
			}
		});
	
	
}

//

function employeeBetweenTwoDate()
{
	var params = {};
	var fdate = $("#fdate").val();
	var sdate = $("#sdate").val();
	params["fdate"]= fdate;
	params["sdate"]= sdate;
	params["methodName"] = "getempleavedetailBetweenTwoDate";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
			//To Clear Table
		$('#stockRepps').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		
		
		$(document).ready(function() {
			$('#stockRepps').DataTable( {

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

					
					// Total over this page
					/*pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);*/
				},

				

		    	
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		        "bPaginate": false,
		      
		columns: [
			        {"data": "firstName", "width": "5%"},
		            {"data": "MiddleName", "width": "5%"},
		          	{"data": "LastName", "width": "5%"},
		            {"data": "Leavetype", "width": "5%"},
		            {"data": "firstDate", "width": "5%"},
		            {"data": "LastDate" , "width": "5%"},
		            {"data": "Approvedby" , "width": "5%"},
		            {"data": "Description" , "width": "5%"}		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Employee leave Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );

	
	var mydata = catmap;
	$('#stockRepps').dataTable().fnAddData(mydata);
		}).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
				$(loaderObj).hide();
				$(loaderObj).find('#errorDiv').show();
			}
		});
	
	
}
// get teacher Daily task to update
function getTeacherdailyTask() {

	var params = {};
	var input = document.getElementById('fk_teacher_id'), list = document
			.getElementById('teacherNameList'), i,fkteacherID;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkteacherID= list.options[i].getAttribute('data-value');
		}
	}
	$("#fk_teacher_id").append($("<input/>").attr("value", "").text());
	$("#clsname1").append($("<input/>").attr("value", "").text());
	$("#DivisionName").append($("<input/>").attr("value", "").text());
	$("#subject").append($("<input/>").attr("value", "").text());
	$("#academic").append($("<input/>").attr("value", "").text());
	$("#date4").append($("<input/>").attr("value", "").text());
	$("#taskInTextt").append($("<input/>").attr("value", "").text());
	params["fkteacherID"] = fkteacherID;
	
	params["methodName"] = "getTeacherDailyTaskToEdit";
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
											
											document.getElementById("clsname1").value =v.className;
											document.getElementById("DivisionName").value =v.division;
											document.getElementById("subject").value =v.subjectName;
											document.getElementById("academic").value =v.academicYear;
											document.getElementById("date4").value =v.insertDate;
											document.getElementById("taskInTextt").value =v.task;
											
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}
// update Teacher Task
function updateteacherDailyTask1(){
	var params = {};
	var input = document.getElementById('fk_teacher_id'), list = document
			.getElementById('teacherNameList'), i, fkteacherID1;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkteacherID1 = list.options[i].getAttribute('data-value');
		}
	}
	var TeacherName=$('#fk_teacher_id').val();
	var clsname1 = $('#clsname1').val();
	var DivisionName1= $('#DivisionName').val();
	var subject1 = $('#subject').val();
	var date41 = $('#date4').val();
	var academic1= $('#academic').val();
	var taskInTextt1 = $('#taskInTextt').val();
	if(TeacherName == undefined || TeacherName== null
			||TeacherName== "") {
		alert("Please select Teacher Name,Class, Division");
		return false;
	}
	if (clsname1 == undefined || clsname1== null
			||clsname1== "") {
		alert("please Enter class  name to Update");
		return false;
	}
	if (DivisionName1 == undefined || DivisionName1 == null || DivisionName1 == "") {
		alert("please Enter Division  name to Update");
		return false;
	}
	if (subject1 == undefined || subject1 == null || subject1 == "") {
		alert("please enter a Subject to Update");
		return false;
	}
	if (academic1 == undefined || academic1 == null || academic1 == "") {
		alert("please enter academic year to Update");
		return false;
	}
	if (taskInTextt1 == undefined || taskInTextt1 == null || taskInTextt1== "") {
		alert("please enter a Task");
		return false;
	}

	if(date41 ==undefined || date41 == null || date41 == "")
		{
		alert("please select Date");
		return false;
		}
	
	
	var params = {};
	params["fkteacherID1"] =fkteacherID1 ;
	params["clsname"] =clsname1 ;
	params["taskInTextt"] = taskInTextt1;
	params["academic"] = academic1;
	params["DivisionName"] = DivisionName1;
	params["subject"] = subject1;
	params["date4"] = date41;
	params["methodName"] = "updateTeacherTaskDetails";
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
 // delete Teacher task
function delTeacherTask2(){
	
	/*if(document.teacherNameList2.fk_teacher_id2.value == "" || document.teacherNameList2.fk_teacher_id2.value == null || document.teacherNameList2.fk_teacher_id2.value == undefined)
	{
		alert("Please select From Options");
		return false;
	}*/	
	var input = document.getElementById('fk_teacher_id42'), list = document
			.getElementById('teacherNameList42'), i, fkteacherID2;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkteacherID2 = list.options[i].getAttribute('data-value');
		}
	}
	
	var params = {};
	
	params["fkteacherID2"] =fkteacherID2;
	
	params["methodName"] = "deletTeacherdailyTask";
	
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




