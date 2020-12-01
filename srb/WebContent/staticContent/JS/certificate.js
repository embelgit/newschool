function leavingCertificateGenerator(){
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
	if(document.LeavingCertificate.reason.value == ""){
		/*if(document.bonafidecertificate.fk_class_id1.value == "")*/
		alert("Please Enter Reason");
		return false;
	}
/*	if(document.LeavingCertificate.idMarks.value == ""){
		if(document.bonafidecertificate.fk_class_id1.value == "")
		alert("Please Enter Identity Marks");
		return false;
	}*/
	if(document.LeavingCertificate.promotion.value == ""){
		/*if(document.bonafidecertificate.fk_class_id1.value == "")*/
		alert("Please Enter Pramotion");
		return false;
	}
	if(document.LeavingCertificate.promotion.value == ""){
		/*if(document.bonafidecertificate.fk_class_id1.value == "")*/
		alert("Please Enter Pramotion");
		return false;
	}
	if(document.LeavingCertificate.progress.value == ""){
		/*if(document.bonafidecertificate.fk_class_id1.value == "")*/
		alert("Please Enter Progress of Student");
		return false;
	}
	if(document.LeavingCertificate.dateOfLeaving.value == ""){
		/*if(document.bonafidecertificate.fk_class_id1.value == "")*/
		alert("Please Enter Date Of Leaving");
		return false;
	}
	if(document.LeavingCertificate.conduct.value == ""){
		/*if(document.bonafidecertificate.fk_class_id1.value == "")*/
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
	}
	leavingCertificateGenerator1();
}


//LC generator
function leavingCertificateGenerator1()
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
	
 	params["methodName"] = "viewLeavingCertificate";
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data) 
 			
 	    	{
 				alert(data);
 				location.reload();
//	 			window.open("view_leaving_certificate.jsp");
 				window.open("leaving_certificate.jsp"); 			
 
 				//				window.open("nirgum.jsp");	
 				/*location.reload();*/
 			}
 		
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	
 	    	})

}
function bonafideCertificateGenerator()
{

	if(document.bonafidecertificate.fk_class_id1.value == "")
	{
		alert("Please Enter Class Name.");
		return false;
	}
	if(document.bonafidecertificate.fk_division_id.value == "")
		{
		alert("Please Enter Division Name");
		return false;
		}
	if(document.bonafidecertificate.fk_Student_id.value =="")
		{
		alert("Please Enter Student Name");
		return false;
		}
	bonafideCertificateGenerator1();
	
}


//for bonafide
function bonafideCertificateGenerator1(){

	var params= {};
	
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
	
//	var input = document.getElementById('fk_Student_id'),
//	list = document.getElementById('studentNameList'),
//	i,fk_Student_id;
//
//	for (i = 0; i < list.options.length; ++i) {
//	if (list.options[i].value === input.value) {
//		fk_Student_id = list.options[i].getAttribute('data-value');
//		}
//	}
	
	var pkStudentId = $('#fk_Student_id').val();

	
	params["fk_class_id"] = fk_class_id;
	params["fk_div_id"] = fk_div_id;
	params["studentName"] = pkStudentId;
 	params["methodName"] = "viewBonafideCertificate";
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data) 
 			
 	    	{
// 			window.open("view_bonafide_certificate.jsp");
 			window.open("bonafide.jsp");			
 			location.reload();
 			}
 		
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	
 	    	})	
}

//for report
//for LC report
function viewLCIssued(){
	var params = {};
	var input = document.getElementById('fk_class_id_Student'),
	list = document.getElementById('classes_Student'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input1 = document.getElementById('fk_division_id_Student'),
    list = document.getElementById('division_Student'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_division_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["methodName"] = "getLCGeneratedStudentList";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#lc').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		/*$(document).ready(function() {
		    
		} );
		*/
		
		$(document).ready(function() {
		 var total =   $('#lc').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
		    	
		    	destroy: true,
		        searching: true,
		      
		columns: [
		          	{"data": "firstName", "width": "5%"},
		            {"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
		            {"data": "leavingDate" , "width": "5%"},
		            {"data": "issuedDate" , "width": "5%"},
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Leaving Certificate Issued Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#lc').dataTable().fnAddData(mydata);
	
		}
	

	);

}
//range wise leaving
function viewLCIssuedrangewise(){
	var params = {};
	var stdate = $('#stdate').val();
	var endate = $('#endate').val();

	params["stdate"]= stdate;
	params["endate"]= endate;
	params["methodName"] = "getLCGeneratedStudentListrangewise";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#lcdate').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		
		//alert(data.length);
		if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		if(catmap == null || catmap == "" || catmap == undefined){
			alert("No data available for selected dates");
			return false;
		}
		/*$(document).ready(function() {
		    
		} );
		*/
		
		$(document).ready(function() {
		 var total =   $('#lcdate').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
		    	
		    	destroy: true,
		        searching: true,
		      
		columns: [
		          	{"data": "firstName", "width": "5%"},
		            {"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
		            {"data": "leavingDate" , "width": "5%"},
		            {"data": "issuedDate" , "width": "5%"},
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Leaving Certificate Issued Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#lcdate').dataTable().fnAddData(mydata);
	
		}
	

	);

}





//report for bonafide
function viewBonafideIssued(){

	var params = {};
	var input = document.getElementById('fk_class_id_Bona'),
	list = document.getElementById('classes_Bona'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input1 = document.getElementById('fk_division_id_Student_bona'),
    list = document.getElementById('division_Student_bona'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_division_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["methodName"] = "getBonafideGeneratedStudentList";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#bonafideTable').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		/*$(document).ready(function() {
		    
		} );
		*/
		
		$(document).ready(function() {
		 var total =   $('#bonafideTable').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
		    	
		    	destroy: true,
		        searching: true,
		      
		columns: [
		          	{"data": "firstName", "width": "5%"},
		            {"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
		           // {"data": "leavingDate" , "width": "5%"},
		            {"data": "issuedDate" , "width": "5%"},
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Bonafied Certificate issued Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#bonafideTable').dataTable().fnAddData(mydata);
	
		}
	);
}
//
function viewnirgumIssued(){

	var params = {};
	var input = document.getElementById('fk_class_id_nir'),
	list = document.getElementById('classes_nir'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var input1 = document.getElementById('fk_division_id_Student_nir'),
    list = document.getElementById('division_Student_nir'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fk_division_id = list.options[i].getAttribute('data-value');
    	}
	}
	
	//var academicYear = $("#academicYear4").val();
	//params["academicYear"]= academicYear;
	params["fk_class_id"]= fk_class_id;
	params["fk_division_id"]= fk_division_id;
	params["methodName"] = "getnirgumGeneratedStudentList";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#nirgumTable').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		/*$(document).ready(function() {
		    
		} );
		*/
		
		$(document).ready(function() {
		 var total =   $('#nirgumTable').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
		    	
		    	destroy: true,
		        searching: true,
		      
		columns: [
		          	{"data": "firstName", "width": "5%"},
		            {"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
		           // {"data": "leavingDate" , "width": "5%"},
		            {"data": "issuedDate" , "width": "5%"},
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Nirgum Certificate issued Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#nirgumTable').dataTable().fnAddData(mydata);
	
		}
	);
}

// range wise bonafide
function viewBonafideIssuedrangewise(){

	var params = {};
	var stdatee = $('#stdatee').val();
	var endatee = $('#endatee').val();
	
	params["stdatee"]= stdatee;
	params["endatee"]= endatee;
	params["methodName"] = "getBonafideGeneratedStudentListrangewise";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#bonafideTablerange').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		if(catmap == null || catmap == "" || catmap == undefined){
			alert("No data available for selected dates");
			return false;
		}
		/*$(document).ready(function() {
		    
		} );
		*/
		
		$(document).ready(function() {
		 var total =   $('#bonafideTablerange').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
		    	
		    	destroy: true,
		        searching: true,
		      
		columns: [
		          	{"data": "firstName", "width": "5%"},
		            {"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
		            {"data": "issuedDate" , "width": "5%"},
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Bonafied Certificate issued Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#bonafideTablerange').dataTable().fnAddData(mydata);
	
		}
	);
}
//
function viewnirgumIssuedrangewise(){

	var params = {};
	var stdateee = $('#stdateee').val();
	var endateee = $('#endateee').val();
	
	params["stdateee"]= stdateee;
	params["endateee"]= endateee;
	params["methodName"] = "getnirgumGeneratedStudentListrangewise";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		$('#nirgumTablerange').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		if(data.length <= 28){
			alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}
		var catmap = jsonData.list;
		if(catmap == null || catmap == "" || catmap == undefined){
			alert("No data available for selected dates");
			return false;
		}
		
		
		$(document).ready(function() {
		 var total =   $('#nirgumTablerange').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
		    	
		    	destroy: true,
		        searching: true,
		      
		columns: [
		          	{"data": "firstName", "width": "5%"},
		            {"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
		            {"data": "issuedDate" , "width": "5%"},
		            
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Nirgum Certificate issued Report";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#nirgumTablerange').dataTable().fnAddData(mydata);
	
		}
	);
}

function CopybonafideCertificateGenerator(){
	
	var studentName = $('#fk_Student_id').val();
	var params = {};
	params["studentNa"] = studentName;

	params["methodName"] = "BonafideCopyMethod";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			 {
		location.reload(true);
//		window.open("Copyview_bonafide_certificate.jsp");
		window.open("bonafide.jsp");			
		
			 }).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

function CopyleavingCertificateGenerator(){
	
	var studentName = $('#studentName').val();
	var params = {};
	
	var input1 = document.getElementById('studentName'),
    list = document.getElementById('studentNameDrop'),
    i,fk_division_id;

	for (i = 0; i < list.options.length; ++i) 
	{
	    if (list.options[i].value === input1.value) 
	    {
	    	fk_student_id = list.options[i].getAttribute('data-value');
	   	}
	}
	
	params["studentNa"] = studentName;
	params["fk_student_id"] = fk_student_id;
	
	params["methodName"] = "LeavingCopyMethod";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	{
		
//		window.open("Copyview_leaving_certificate.jsp");
		window.open("leaving_certificate.jsp"); 		
		
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
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
function getDivisionNameByClassNameBonafide()
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




//get Division by Class Name for leaving certificate Report
function getDivisionNameByClassNameLeavingCertificateReport()
{
//var type = document.getElementById('vendor').value;
	
	$("#division_Student").empty();
	$("#division_Student").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		var input = document.getElementById('fk_class_id_Student'), list = document
		.getElementById('classes_Student'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id_Student').val();
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;
	
	params["methodName"] = "getDivisionNameByClassName";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#division_Student").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}




//get Division by Class Name for bonafide certificate Report
function getDivisionNameByClassNameBonafideCertificateReport()
{
//var type = document.getElementById('vendor').value;
	
	$("#division_Student_bona").empty();
	$("#division_Student_bona").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		var input = document.getElementById('fk_class_id_Bona'), list = document
		.getElementById('classes_Bona'), i, fkRootStudentId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id_Bona').val();
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;
	
	params["methodName"] = "getDivisionNameByClassName";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#division_Student_bona").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}
//
function getDivisionNameByClassNamenirgumCertificateReport()
{
//var type = document.getElementById('vendor').value;
	
	$("#division_Student_nir").empty();
	$("#division_Student_nir").append($("<option></option>").attr("value","").text("Select product"));
	var params= {};
	
	
		var input = document.getElementById('fk_class_id_nir'), 
		list = document.getElementById('classes_nir'), 
		i, fkRootStudentId,fkClassId;
		for (i = 0; i < list.options.length; ++i)
		{
			if (list.options[i].value === input.value) 
			{
				fkClassId = list.options[i].getAttribute('data-value');
			}
		}
		
	var className = $('#fk_class_id_nir').val();
	
	params["fkClassId"] = fkClassId;
	params["className"] = className;

	params["methodName"] = "getDivisionNameByClassName1";
	$.post('/srb/JSP/utility/controller.jsp', params, function(data) 	
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				
						
						/*$("#vendorList_Drop").append($("<option></option>").attr("value",(v.vendorName))); */
						$("#division_Student_nir").append($("<option></option>").attr("value",(v.divisionName)).attr("data-value",(v.pkDivisionId)));
						count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

//get Division by Class Name
function getDivisionNameByClassNameCopyBonafide()
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

function SportCertificateGenerator()
{
if(document.sportcertificate.fk_class_id1.value==null || document.sportcertificate.fk_class_id1.value==undefined || document.sportcertificate.fk_class_id1.value=="")
{
	alert("Please Select Class");
	return false;
}	
if(document.sportcertificate.fk_division_id.value==null || document.sportcertificate.fk_division_id.value==undefined || document.sportcertificate.fk_division_id.value=="")
	{
	alert("Please Select Devision");
	return false;
	}
if(document.sportcertificate.fk_Student_id.value==null || document.sportcertificate.fk_Student_id.value==undefined || document.sportcertificate.fk_Student_id.value=="")
{
alert("Please Select StudentName")
return false;
}

if(document.sportcertificate.dateOfLeaving.value==null || document.sportcertificate.dateOfLeaving.value==undefined || document.sportcertificate.dateOfLeaving.value=="")
{
alert("Please Insert Date");
return false;

}
if(document.sportcertificate.sport.value==null || document.sportcertificate.sport.value==undefined || document.sportcertificate.sport.value=="")
{
alert("Please Enter Sport Name");
return false;
}
SportCertificateGenerator1();
}

function SportCertificateGenerator1()
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
	
	
	
	var grade = $('#grade').val();
	if(grade == "" || grade == null || grade == undefined){
		grade = "NA";
	}
	document.getElementById("btn").disabled=true;
	var dateOfLeaving = $('#dateOfLeaving').val();
	var sport = $('#sport').val();
	var params= {};
	params["pkStudentId"]=pkStudentId;
	params["fk_class_id"] = fk_class_id;
	params["fk_div_id"] = fk_div_id;
	params["grade"] = grade;
	params["sport"] = sport;
	params["dateOfLeaving"] = dateOfLeaving;
	
 	params["methodName"] = "viewSportCertificate";
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data) 
 			
 	    	{
 				//alert(data);
 				//location.reload();
	 			window.open("sport_certificatepdf.jsp");
 				//window.open("leaving_certificate.jsp"); 			
 
 				//				window.open("nirgum.jsp");	
 			location.reload();
 			}
 		
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	
 	    	})




}