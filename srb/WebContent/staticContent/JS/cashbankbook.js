/*
 * Name : Sonal Bharti Date : 1/06/2018 Method Name : EmployeeValidation()
 * Reason : Employee Details Validation in cashBook
 */


//Adding supplier Payment
   
function validationSupplierPayment()
{
	
		var supplierName = $("#supplierId").val();
		var billNo = $('#billNo').val();
		var personname = $('#personname').val();
		var balanceAmount = $("#balanceAmount").val();
		var paidAmount = $('#paidAmount').val();
		
		
		
		var balAmount =+balanceAmount;
		var pdAmount =+paidAmount;
		
    	if(supplierName=="")
    	{
    		alert("Please select supplier name");
    		return false;
    	}
    	
    	if(billNo=="")
    	{
    		alert("Please select bill No");
    		return false;
    	}
    	
    	if(personname=="")
    	{
    		alert("Please Enter Accountant Name");
    		return false;
    	}
    	
    	if(paidAmount=="")
    	{
    		alert("Please Enter paid amount");
    		return false;
    	}
    	
    	if(balAmount < pdAmount)
    	{
    		alert("Please enter paid amount less than or equal to balance amount");
    		return false;
    	}

    	supplierPayment();

    
	}
		
   
  function	supplierPayment()
  {
	  	
			//var billNo = $('#billNo').val();
			var balanceAmount = $("#balanceAmount").val();
			var totalAmount = $('#totalAmount').val();
			var paymentType = $('#paymentType').val();
			var paymentMode = $('#paymentMode').val();
			var chequeNum = $('#chequeNum').val();
			var nameOnCheck = $('#nameOnCheck').val();
			var bankName = $('#bankName').val();
			var cardNum = $('#cardNum').val();
			var accNum = $('#accNum').val();
			var personname = $('#personname').val();
			var paidAmount = $('#paidAmount').val();
			var supplierName = $("#supplierId").val();
			var totalAmounte = $('#totalAmounte').val();
			var balanceAmounte = $('#balanceAmounte').val();
			
	
			 var input = document.getElementById('supplierId'),
			   list = document.getElementById('sup_drop'),
		     	i,fkSupId;
		 		
			 	for (i = 0; i < list.options.length; ++i) 
		 		{
				     if (list.options[i].value === input.value) 
				     {
				    	 fkSupId = list.options[i].getAttribute('data-value');
				     }
		 		}
	 			 	
			var params= {};
	
			params ["supplier"] = supplierName;
			params ["supplierId"] = fkSupId;
			//params ["billNo"] = billNo;
			params ["totalAmount"] = totalAmount;
			params ["balanceAmount"] = balanceAmount;
			params ["paymentType"] = paymentType;
			params ["paymentMode"] = paymentMode;
			params ["chequeNum"] = chequeNum;
			params ["nameOnCheck"] = nameOnCheck;
			params ["bankName"] = bankName;
			params ["cardNum"] = cardNum;
			params ["accNum"] = accNum;
			params ["personname"] = personname;
			params ["paidAmount"] = paidAmount;
			params ["totalAmounte"] = totalAmounte;
			params ["balanceAmounte"] = balanceAmounte;
			
			
			
			params["methodName"] = "regSupCashBook";
			
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
 
  
  
  
  function validationLibraryPayment()
  {
  	
  		var supplierName = $("#supplierId1").val();
  		var billNo = $('#billNo').val();
  		var personname = $('#personnamel').val();
  		var balanceAmount = $("#balanceAmountl").val();
  		var paidAmount = $('#paidAmountl').val();
  		
  		
  		
  		var balAmount =+balanceAmount;
  		var pdAmount =+paidAmount;
  		
      	if(supplierName=="")
      	{
      		alert("Please select supplier name");
      		return false;
      	}
      	
      	if(billNo=="")
      	{
      		alert("Please select bill No");
      		return false;
      	}
      	
      	if(personname=="")
      	{
      		alert("Please Enter Accountant Name");
      		return false;
      	}
      	
      	if(paidAmount=="")
      	{
      		alert("Please Enter paid amount");
      		return false;
      	}
      	
      	if(balAmount < pdAmount)
      	{
      		alert("Please enter paid amount less than or equal to balance amount");
      		return false;
      	}

      	libraryPayment();

      
  	}
  
  function	libraryPayment()
  {
	  	
			//var billNo = $('#billNo').val();
			var balanceAmountl = $("#balanceAmountl").val();
			var totalAmountl = $('#totalAmountl').val();
			var paymentTypel = $('#paymentTypel').val();
			var paymentModel = $('#paymentModel').val();
			var chequeNuml = $('#chequeNuml').val();
			var nameOnCheckl = $('#nameOnCheckl').val();
			var bankNamel = $('#bankNamel').val();
			var cardNuml = $('#cardNuml').val();
			var accNuml = $('#accNuml').val();
			var personnamel = $('#personnamel').val();
			var paidAmountl = $('#paidAmountl').val();
			var supplierName = $("#supplierId1").val();
			var totalAmountel = $('#totalAmountel').val();
			var balanceAmountel = $('#balanceAmountel').val();
			
			
			 var input = document.getElementById('supplierId1'),
			   list = document.getElementById('sup_drop1'),
		     	i,fkSupId;
		 		
			 	for (i = 0; i < list.options.length; ++i) 
		 		{
				     if (list.options[i].value === input.value) 
				     {
				    	 fkSupId = list.options[i].getAttribute('data-value');
				     }
		 		}
	 			 	
			var params= {};
	
			params ["supplier"] = supplierName;
			params ["supplierId1"] = fkSupId;
			//params ["billNo"] = billNo;
			params ["totalAmountl"] = totalAmountl;
			params ["balanceAmountl"] = balanceAmountl;
			params ["paymentTypel"] = paymentTypel;
			params ["paymentModel"] = paymentModel;
			params ["chequeNuml"] = chequeNuml;
			params ["nameOnCheckl"] = nameOnCheckl;
			params ["bankNamel"] = bankNamel;
			params ["cardNuml"] = cardNuml;
			params ["accNuml"] = accNuml;
			params ["personnamel"] = personnamel;
			params ["paidAmountl"] = paidAmountl;
			params ["totalAmountel"] = totalAmountel;
			params ["balanceAmountel"] = balanceAmountel;
			
			
			
			params["methodName"] = "regLibCashBook";
			
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
/*  function TeacherValidation()
  {
	  var balanceAmounte = $('#balanceAmounte').val();
	  
	  var empPay= $('#empPay').val();
	  
	  var balAmount =+balanceAmounte;
		var pdAmount =+empPay;
	 
	  if(pdAmount > balAmount)
		  {
		  alert("Please enter paid amount less than or equal to balance amount");
  			return false;
		  }
	  
	  
	  
  }*/
  
  function TranportationValiadation(){
	  
//	  var studentName1 = document.getElementById('studentName').value;
	    var studentName = $("#fk_studentName_id").val();
		var totalAnnualFee = $('#totalAnnualFee').val();
		var personnameT = $('#personnameT').val();
		var balanceAmountT = $('#balanceAmountT').val();
		var paymentMode3 = $('#paymentMode3').val();
		var paymentTypeT = $('#paymentTypeT').val();
		var paidAmountT = $('#paidAmountT').val();
		
		var chequeNum = $('#chequeNum').val();
		var nameOnCheck = $('#nameOnCheck').val();
		var bankName = $('#bankName').val();
		var cardNum = $('#cardNum').val();
		var accNum = $('#accNum').val();
//		alert(studentName);
		var NewBalanceAmount = Number(balanceAmountT) - Number(paidAmountT);
		
		 var balAmount = +balanceAmountT ;
		 var payamt = +paidAmountT;
	
			var clssnme = $('#fk_class_id1').val();
			var divnme = $('#fk_division_id').val();
		
			 if(clssnme == "" || clssnme == null){
				 alert("Please enter class name");
				 return false;
			 }
		 
		 if(divnme == "" || divnme == null){
			 alert("Please enter division name");
			 return false;
		 }
		 
		 
/*		 if(studentName == "" || studentName == null){
			 alert("Please enter student name");
			 return false;
		 }*/
		 
		 if(personnameT == "" || personnameT == null){
			 alert("Please enter Account name");
			 return false;
		 }
		 if(paymentMode3 == "" || paymentMode3 == null){
			 alert("Please select payment mode");
			 return false;
		 }
		 if(paymentTypeT == "" || paymentTypeT == null){
			 alert("Please select payment type");
			 return false;
		 }
		 if(paidAmountT == "" || paidAmountT == null){
			 alert("Please enter Paid Amount");
			 return false;
		 }
		 
		 
		 if(payamt > balAmount)
			 {
			 alert("Please enter paid amount less than or equal to balance amount");
			 return false;
			 }
		
		 var input = document.getElementById('fk_class_id1'),
		   list = document.getElementById('classes'),
	     	i,fkclassId;
	 		
		 	for (i = 0; i < list.options.length; ++i) 
	 		{
			     if (list.options[i].value === input.value) 
			     {
			    	 fkclassId = list.options[i].getAttribute('data-value');
			     }
	 		}
		 	
		 	 var input = document.getElementById('fk_division_id'),
			   list = document.getElementById('division'),
		     	i,fkdivisionId;
		 		
			 	for (i = 0; i < list.options.length; ++i) 
		 		{
				     if (list.options[i].value === input.value) 
				     {
				    	 fkdivisionId = list.options[i].getAttribute('data-value');
				     }
		 		}
			 	
		
			 	
				
				 
			 	
		var params= {};

		//params ["supplier"] = supplierName;
		//params ["supplierId"] = fkSupId;
		//params ["billNo"] = billNo;
		params ["totalAnnualFee"] = totalAnnualFee;
		params ["personnameT"] = personnameT;
		params ["balanceAmountT"] = balanceAmountT;
		params ["paymentMode3"] = paymentMode3;
		params ["paymentTypeT"] = paymentTypeT;
		params ["paidAmountT"] = paidAmountT;
		
		params ["chequeNum"] = chequeNum;
		params ["nameOnCheck"] = nameOnCheck;
		params ["bankName"] = bankName;
		params ["cardNum"] = cardNum;
		params ["accNum"] = accNum;
		params["NewBalanceAmount"] = NewBalanceAmount;
		
		
		params ["studentName"] = studentName;
		params ["fkclassId"] = fkclassId;
		params ["fkdivisionId"] = fkdivisionId;
		
		
		
		params["methodName"] = "TransportationDetails";
		
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
  
  function TeacherValidation() {

	var teacherName= $('#fk_teacher_id').val();
	var personName2 =$('#personName2').val();
	var empCreditAmt = $("#empPay").val();
	var empAccName = $("#personName2").val();
	var empPaymentReason = $("#reason2").val();
	var paymentType2 = $("#paymentType2").val();
	
	var balanceAmounte = $('#balanceAmounte').val();
	  
	  var empPay= $('#empPay').val();
	  
	  var balAmount =+balanceAmounte;
	  var pdAmount =+empPay;
	 
	  if(pdAmount > balAmount)
		  {
		  alert("Please enter paid amount less than or equal to balance amount");
  			return false;
		  }
	  
	
	

	if (teacherName != null && teacherName != "") {
		
		if(personName2 != null && personName2 != ""){
		
			var creditAmtRegExp = /^[0-9]+([.][0-9]+)?$/;
		if (empCreditAmt != null && empCreditAmt != "" && empCreditAmt != " ") {
			if (empCreditAmt.match(creditAmtRegExp)) {
				if (Number(empCreditAmt) > 0) {
					if (empPaymentReason != "" && empPaymentReason != " " && empPaymentReason != null) {
						if (paymentType2 != "selected2" && paymentType2 != "" && paymentType2 != " " && paymentType2 != "selected") {
							teacherPayment();
						} else {
							alert("Select Payment Type Credit or debit");
						}
					} else {
						alert("Enter Payment Reason.");
					}
				} else {
					alert("Credit Amount should be grater than 1");
				}
			} else {
				alert("Please Enter valid Credit Amount");
			}
		} else {
			alert("Please Enter Credit Amount");
		}
	}else {
		alert("Please Enter Accountant Name.")
		return false;
	}
	} else {
		alert("Please Select Teacher Name");
	}
	
	
}

//Adding Teacher Payment
function teacherPayment(){

	document.getElementById("btn3").disabled = true;

	var teacherName= $('#fk_teacher_id').val();
	
	//alert("hi this is thicher is"+teacherName);
	var empPay= $('#empPay').val();
	var personName= $('#personName2').val();
	var reason= $('#reason2').val();
	var paymentMode = $('#paymentMode2').val();
	var chequeNum = $('#chequeNum2').val();
	var nameOnCheck = $('#nameOnCheck2').val();
	var bankName = $('#bankName2').val();
	var cardNum = $('#cardNum2').val();
	var accNum = $('#accNum2').val();
	var paymentType = $('#paymentType2').val();
	var totalAmounte =$('#totalAmounte').val();
	var balanceAmounte = $('#balanceAmounte').val();

	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fkteacherid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkteacherid = list.options[i].getAttribute('data-value');
		}
	}
	
	var params= {};

	params["fkteacherid"] = fkteacherid;
	params["teacherName"] = teacherName;
	params ["empPay"] = empPay;
	params ["personName"] = personName;
	params ["reason"] = reason;
	params ["paymentMode"] = paymentMode;
	params ["chequeNum"] = chequeNum;
	params ["nameOnCheck"] = nameOnCheck;
	params ["bankName"] = bankName;
	params ["cardNum"] = cardNum;
	params ["accNum"] = accNum;
	params ["paymentType"] = paymentType;
	params["totalAmounte"] = totalAmounte;
	params["balanceAmounte"] = balanceAmounte;

	params["methodName"] = "regEmpCashBook";

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

//Expenditure validation
function expensePaymentValidation() {

	var expenseName = $("#expenseName").val();
	var serviceProvider = $("#serviceProvider").val();
	var contactNumber = $("#contactNumber").val();
	var expCredit = $("#expCredit").val();
	var expDebit = $("#expDebit").val();
	var accountantName = $("#accountantName").val();

	if (expenseName != null && expenseName != "" && expenseName != " ") 
	{
		if (serviceProvider != null && serviceProvider != "" && serviceProvider != " ") 
		{
			if (contactNumber != null && contactNumber != "" && contactNumber != " ") 
			{
				var phoneno = /^\d{10}$/;
				if (contactNumber.match(phoneno)) 
				{
					addExpense();
					/*	var amount = /[0-9]$/;
					if(expCredit.match(amount))
					{
						if(expDebit.match(amount))
						{
							addExpense();
						}
						else
						{
							alert("Please Enter Number in Debit Amount");
						}
					}
					else
					{
						alert("Please Enter Number in Credit Amount");
					}*/
				}
				else 
				{
					alert("Contact No Must be 10 digit.");
				}
			} 
			else 
			{
				alert("Enter Contact Number");
			}
		} 
		else 
		{
			alert("Enter Service Provider");
		}
	} 
	else 
	{
		alert("please Select Expenditure Name");
	}
}

/********************Adding Expenditure Payment****************/

function addExpense(){

	document.exp.btn4.disabled = true;
	var serviceProvider = $('#serviceProvider').val();
	var expCredit = $('#expCredit').val();
	var expDebit = $('#expDebit').val();
	var contactNumber = $('#contactNumber').val();
	var accountantName = $('#accountantName').val();
	var input = document.getElementById('expenseName'),
	list = document.getElementById('exp_drop'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootexpId = list.options[i].getAttribute('data-value');
		}
	}
	
	if(expCredit == "" || expCredit == null || expCredit == undefined){
		expCredit = 0;
	}
	if(expDebit == "" || expDebit == null || expDebit == undefined){
		expDebit = 0;
	}
	
	var params= {};

	params ["expenseName"] = fkRootexpId;
	params ["serviceProvider"] = serviceProvider;
	params ["expCredit"] = expCredit;
	params ["expDebit"] = expDebit;
	params ["contactNumber"] = contactNumber;
	params ["accountantName"] = accountantName;
	params["methodName"] = "regExpenseCashBook";

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

//////////////////////Reports///////////////////////////

/************ Teacher Payment Report **************/
/****** Between Two dates **********/

function getTeacherPaymentDetailsBetTwoDays(){
	var params= {};
	var teacherName= $('#fk_teacher_id').val();
	var startDate = $("#fisDate2").val();
	var endDate = $("#endDate2").val();

	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fkteacherid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkteacherid = list.options[i].getAttribute('data-value');
		}
	}
	
	
	params["teacherName"]= teacherName;
	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getTeacherPaymentReportBetweenTwoDates";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#empBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

/*		if(catmap == "" || catmap == null || catmap == undefined){
			alert("No data available for selected entry");
			return false;
		}*/
		
		$(document).ready(function() {
			$('#empBetweenTwoDates').DataTable( {

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

				destroy: true,
				searching: true,
				columns: [
				          {"data": "teacherName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "designation" , "width": "5%" ,"defaultContent": ""},
				          {"data": "insertDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentType", "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentMode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalamount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "balanceamount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "accountantName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "reason" , "width": "5%" ,"defaultContent": ""},
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ],
				                     "scroll": true,
				                	

			} );
		} );
		var mydata = catmap;
		$('#empBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

/************ Expense Payment Report **************/
/************ Between Two Dates *************/
function getExpensePaymentDetailsBetTwoDays(){
	var params= {};
	
	var startDate = $("#fisDate4").val();
	var endDate = $("#endDate4").val();
	
	var input = document.getElementById('expenseName'),
	list = document.getElementById('exp_drop'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootexpId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkRootexpId"]= fkRootexpId; 

	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	params["methodName"] = "getExpenditurePaymentReportBetweenTwoDates";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#expenseBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;


		$(document).ready(function() {
			$('#expenseBetweenTwoDates').DataTable( {

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
					.column( 3 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 3 ).footer() ).html(

							parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);	

					// Total over this page
					pageTotal1 = api
					.column( 4 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 4 ).footer() ).html(

							parseFloat(pageTotal1).toFixed(2)

					);
					console.log( pageTotal);
					var creditAmt =  parseFloat(pageTotal).toFixed(2);
					var debitAmt =  parseFloat(pageTotal1).toFixed(2);
					var remainAmt = +creditAmt - +debitAmt;

					// Update footer
					/*$( api.column( 5 ).footer() ).html(

							parseFloat(remainAmt).toFixed(2)

					);*/
				},
				destroy: true,
				searching: true,			      
				columns: [
					      {"data": "expenseName", "width": "5%" ,"defaultContent": ""},
				          {"data": "insertDate" , "width": "5%" ,"defaultContent": ""}, 
				          {"data": "serviceProviderName", "width": "5%" ,"defaultContent": ""},
				          {"data": "credit" , "width": "5%" ,"defaultContent": ""},
				          {"data": "debit" , "width": "5%" ,"defaultContent": ""},
				          {"data": "accountantName" , "width": "5%" ,"defaultContent": ""},
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Expenditure Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );

		var mydata = catmap;
		$('#expenseBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}
/*Following BillHelper() function is to get Bill no , total amount and balamce amount after selecting supplier in Supplier Payment*/
var bill = new BillHelper();
function BillHelper()
{
	//this.getAllBills =getAllBills;
	this.getTotalAmtByBills =getTotalAmtByBills;
	this.getRemainingBalane = getRemainingBalane;
	this.getAllBillsforemployee = getAllBillsforemployee;
	this.getRemainingAllBillsforemployee = getRemainingAllBillsforemployee;
	this.Trasnsportationfee = Trasnsportationfee;
	
/*	function getAllBills()
	{
		
		 var input = document.getElementById('supplier'),
	     list = document.getElementById('sup_drop'),
	     i,supplier;
	
		for (i = 0; i < list.options.length; ++i) {
	     if (list.options[i].value === input.value) {
	    	 supplier = list.options[i].getAttribute('data-value');
	     }
	 }
		
		
		
		 var input = document.getElementById('supplierId'),
		     list = document.getElementById('sup_drop'),
		     	i,fkRootsupId;
			 		
		 			for (i = 0; i < list.options.length; ++i) 
		 			{
					     if (list.options[i].value === input.value) 
					     {
					    	 fkRootsupId = list.options[i].getAttribute('data-value');
					     }
			 		}
		
	 //var supplier = supplier;
		var fk_supplier_id = $("#supplierId").val();
		$("#billNo").empty();
		$("#billNo").append($("<option></option>").attr("value","").text("Select bill"));
		var params= {};
		
		params["methodName"] = "getAllBillByVendorNames";
		
		params["supplier"]= fkRootsupId;
		
		
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
						
				{
				var total = 0;
				var jsonData = $.parseJSON(data);
				//var jsonData = jsonData.list;
				$.each(jsonData,function(i,v)
					{
						$("#billNo").append($("<option></option>").attr("value",v.billNo).text(v.billNo)); 
						//$("#billNo1").append($("<option></option>").attr("value",v.billNo).text(v.billNo)); 
						//total = +total+ +v.grossTotal;
						
						
					});
					//document.getElementById("totalAmount").value = total;
				})
				//getRemainingBalaneByVendorAfterPayment()

	}*/
	

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
		
		var input1 = document.getElementById('fk_studentName_id'),
		list = document.getElementById('studentName'),
		i,fk_Student_id;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_Student_id = list.options[i].getAttribute('data-value');
			}
		}
		
	//	var studentName = $('#studentName').val();
		var studentName = fk_Student_id;
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
		var input1 = document.getElementById('fk_studentName_id'),
		list = document.getElementById('studentName'),
		i,fk_Student_id;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_Student_id = list.options[i].getAttribute('data-value');
			}
		}
		var studentName = fk_Student_id;
//		var studentName = $('#studentName').val();
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
	
	
	function getTotalAmtByBills()
	{
		 var input = document.getElementById('supplierId'),
	     list = document.getElementById('sup_drop'),
	     i,fkRootsupId;
	
		for (i = 0; i < list.options.length; ++i) 
		{
	     if (list.options[i].value === input.value) 
	     {
	    	 fkRootsupId = list.options[i].getAttribute('data-value');
	     }
	    }
		
		var fk_supplier_id = $("#supplierId").val();
		var billNo = $("#billNo").val();
		$("#totalAmount").empty();
		$("#totalAmount").append($("<input/>").attr("value","").text());
		var params= {};
		params["methodName"] = "getTotalAmtByBillNo";
		params["billNo"]= billNo;
		params["supplier"]= fkRootsupId;
		
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
				{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
						//document.getElementById("totalAmount").value = v.grossTotal;
						document.getElementById("totalAmount").value = v.total;
				
				
						//document.getElementById("balanceAmount").value = v.balanceamount;
				
					});
				})
			
		
		getRemainingBalane();
	}
	function getRemainingBalane(){
		
		/*var input = document.getElementById('supplierId'),
	     list = document.getElementById('sup_drop'),
	     i,fkRootsupId;
	
		for (i = 0; i < list.options.length; ++i) 
		{
	     if (list.options[i].value === input.value) 
	     {
	    	 fkRootsupId = list.options[i].getAttribute('data-value');
	     }
	    }*/
		var input = document.getElementById('supplierId'),
	     list = document.getElementById('sup_drop'),
	     i,fkRootsupId;
	
		for (i = 0; i < list.options.length; ++i) {
	     if (list.options[i].value === input.value) {
	    	 fkRootsupId = list.options[i].getAttribute('data-value');
	     }
	    }
		
		var fk_supplier_id = $("#supplierId").val();
		//var billNo = $("#billNo").val();
		$("#balanceAmount").empty();
		$("#balanceAmount").append($("<input/>").attr("value","").text());
		var params= {};
		params["methodName"] = "getBalanceAmtBySupplierWise";
		//params["billNo"]= billNo;
		params["supplier"]= fkRootsupId;
		
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
				{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
						//document.getElementById("totalAmount").value = v.grossTotal;
						//document.getElementById("totalAmount").value = v.total;
				
				
						document.getElementById("balanceAmount").value = v.balance;
				
					});
				})
	}
	function getAllBillsforemployee(){
		
		var input = document.getElementById('fk_teacher_id'),
	     list = document.getElementById('teacherNameList'),
	     i,fk_teacher_id;
	
		for (i = 0; i < list.options.length; ++i) 
		{
	     if (list.options[i].value === input.value) 
	     {
	    	 fk_teacher_id = list.options[i].getAttribute('data-value');
	     }
	    }
		
		//var fk_teacher_id = $("#fk_teacher_id").val();
		//var billNo = $("#billNo").val();
		$("#totalAmounte").empty();
		$("#totalAmounte").append($("<input/>").attr("value","").text());
		$("#balanceAmounte").append($("<input/>").attr("value","").text());
		var params= {};
		params["methodName"] = "getTotalAmtByBillNoEmployee";
		//params["billNo"]= billNo;
		params["fk_teacher_id"]= fk_teacher_id;
		
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
				{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
						//document.getElementById("totalAmount").value = v.grossTotal;
						document.getElementById("totalAmounte").value = v.total
						;
				
				
						//document.getElementById("balanceAmounte").value = v.balanceAmount;
				
					});
				})
				getRemainingAllBillsforemployee()
	}
	
	function getRemainingAllBillsforemployee()
	{
		
		var input = document.getElementById('fk_teacher_id'),
	     list = document.getElementById('teacherNameList'),
	     i,fk_teacher_id;
	
		for (i = 0; i < list.options.length; ++i) 
		{
	     if (list.options[i].value === input.value) 
	     {
	    	 fk_teacher_id = list.options[i].getAttribute('data-value');
	     }
	    }
		
		//var fk_teacher_id = $("#fk_teacher_id").val();
		//var billNo = $("#billNo").val();
		$("#balanceAmounte").empty();
		//$("#totalAmounte").append($("<input/>").attr("value","").text());
		$("#balanceAmounte").append($("<input/>").attr("value","").text());
		var params= {};
		params["methodName"] = "getRemainingAllBillsforemployee";
		//params["billNo"]= billNo;
		params["fk_teacher_id"]= fk_teacher_id;
		
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
				{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
						//document.getElementById("totalAmount").value = v.grossTotal;
						//document.getElementById("totalAmounte").value = v.total;
				
				
						document.getElementById("balanceAmounte").value = v.balanceamount;
				
					});
				})
				
	}
	
		
	}
	function getRemainingBalaneByBills()
	{
		var input = document.getElementById('supplier'),
	     list = document.getElementById('sup_drop'),
	     i,fkRootsupId;
	
		for (i = 0; i < list.options.length; ++i) {
	     if (list.options[i].value === input.value) {
	    	 fkRootsupId = list.options[i].getAttribute('data-value');
	     }
	    }
		var fk_supplier_id = $("#supplier").val();
		var billNo = $("#billNo").val();
		var totalAmount = $("totalAmount").val();
		
		$("#balanceAmount").empty();
		$("#balanceAmount").append($("<input/>").attr("value","").text());
		//$("#remainAmt").append($("<input/>").attr("value","").text());
		var params= {};
		
		params["methodName"] = "getBalanceAmtByBillNo";
		
		params["billNo"]= billNo;
		params["supplier"]= fkRootsupId;
		params["totalAmount"]= totalAmount;
		
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
						{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			
	
			$.each(jsonData,function(i,v)
					{
			
					document.getElementById("balanceAmount").value = v.balance;
					//document.getElementById("remainAmt").value = v.sumoftotal;
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
							count++;
						});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
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

		$("#studentName").empty();
		$("#studentName").append($("<option></option>").attr("value","").text("Select Student Name"));
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
/*				$("#studentName").append($("<option></option>").attr("value",v.pkStudentId).text(v.firstName+" "+v.middleName+" "+v.lastName));*/
				$("#studentName").append($("<option></option>").attr("value",(v.firstName+" "+v.middleName+" "+v.lastName)).attr("data-value",(v.pkStudentId)));
					});
				})
	}

	//
	
function getlibrayTwoDays(){
		var params= {};

		var startDate = $("#fisDate3").val();
		var endDate = $("#endDate3").val();
		
		

		params["fisDate"]= startDate;
		params["endDate"]= endDate;
		
		params["methodName"] = "getlibrartreportDates";
		$.post('/srb/JSP/utility/controller.jsp',params,function(data)
				{
			//To clear table
			$('#libTwoDates').dataTable().fnClearTable();

			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;

			if(catmap == "" || catmap == null || catmap == undefined){
				alert("No data available for selected entry");
				return false;
			}
			
			$(document).ready(function() {
				$('#libTwoDates').DataTable( {

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

					destroy: true,
					searching: true,
					columns: [
						
		/*						{"data": "pkSupPaymentId" , "width": "5%" ,"defaultContent": ""},*/
					          {"data": "supplier" , "width": "5%" ,"defaultContent": ""},
					          {"data": "personname", "width": "5%" ,"defaultContent": ""},
					          {"data": "billNo", "width": "5%" ,"defaultContent": ""},
					          {"data": "totalAmount" , "width": "5%" ,"defaultContent": ""},
					          {"data": "paidAmount" , "width": "5%" ,"defaultContent": ""},
					          {"data": "balanceamount" , "width": "5%" ,"defaultContent": ""},
					          {"data": "paymentType" , "width": "5%" ,"defaultContent": ""},
					          {"data": "paymentMode" , "width": "5%" ,"defaultContent": ""},
					          {"data": "insertDate" , "width": "5%" ,"defaultContent": ""},
					          ],
					          dom : 'Bfrtip',
					          buttons : [ 
					                     { extend: 'copyHtml5', footer: true },
					                     { extend: 'excelHtml5', footer: true },
					                     { extend: 'csvHtml5', footer: true },
					                     { extend : 'pdfHtml5', footer: true,
					                    	 title : function() {
					                    		 return "Library Payment Report";
					                    	 },
					                    	 orientation : 'landscape',
					                    	 pageSize : 'LEGAL',
					                    	 titleAttr : 'PDF' 
					                     } ],
					                     "scroll": true,
					                	

				} );
			} );
			var mydata = catmap;
			$('#libTwoDates').dataTable().fnAddData(mydata);
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {
						$(loaderObj).hide();
						$(loaderObj).find('#errorDiv').show();
					}
				});
	}

//


function gettransportBetTwoDays(){
	var params= {};
//	var teacherName= $('#fk_teacher_id').val();
	var startDate = $("#fisDate4").val();
	var endDate = $("#endDate4").val();


	
	
//	params["teacherName"]= teacherName;
	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getTransportTwoDates";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#txBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap == "" || catmap == null || catmap == undefined){
			alert("No data available for selected entry");
			return false;
		}
		
		$(document).ready(function() {
			$('#txBetweenTwoDates').DataTable( {

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

				destroy: true,
				searching: true,
				columns: [
				          {"data": "studentName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "personnameT" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalAnnualFee", "width": "5%" ,"defaultContent": ""},
				          {"data": "paidAmountT", "width": "5%" ,"defaultContent": ""},
				          {"data": "balanceAmountT" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentTypeT" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentMode3" , "width": "5%" ,"defaultContent": ""},
				          {"data": "insertDate" , "width": "5%" ,"defaultContent": ""},
	
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Transportation Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ],
				                     "scroll": true,
				                	

			} );
		} );
		var mydata = catmap;
		$('#txBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}