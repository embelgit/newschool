//Teacher Details Report
function getTeacherDetailsSubjWise(){

	var params= {};
	
	
	/*var input1 = document.getElementById('fk_subject_id'),
	list = document.getElementById('subjectList'),
	i,fksubjectid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fksubjectid = list.options[i].getAttribute('data-value');
		}
	}
	
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('clas'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
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
	
	*/
	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherNameList'),
	i,fkteacherid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkteacherid = list.options[i].getAttribute('data-value');
		}
	}
	
	
	params["fkteacherid"] = fkteacherid;
	
	
	params["methodName"] = "getTeacherDetailSubjectWise";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		var jsonData = $.parseJSON(data);
		//alert(data.length);
		/*if(data.length <= 28){
			alertify.alert("Embel Technologies Says --> Data Not Found Your Selection.");
			 return true;
		}*/
		var catmap = jsonData.list;
		/*$(document).ready(function() {
		    
		} );
		*/
		if(catmap == "" || catmap == null || catmap == undefined){
			alert("No data available for selected field");
			return false;
		}
		$('#teacherDetailsSubj').dataTable().fnClearTable();
		$(document).ready(function() {
		 var total =   $('#teacherDetailsSubj').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
		    	
	            "sPaginationType": "full_numbers",
		    	destroy: true,
		        searching: true,
		        orderable: true,
		      
		columns: [
		            {"data": "firstName", "width": "5%"},
		          	{"data": "middleName", "width": "5%"},
		            {"data": "lastName", "width": "5%"},
	/*	            {"data": "subject", "width": "5%"},
		            {"data": "className" , "width": "5%"},
		            {"data": "division" , "width": "5%"},*/
		            {"data": "hquqlification" , "width": "5%"},
		            {"data": "jdate" , "width": "5%"},
		            {"data": "mobnum" , "width": "5%"},
		        ],
		        
		        dom : 'Bfrtip',
		          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Teacher Details Report Subject Wise";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ]  
		    } );
		
		} );
		
	var mydata = catmap;
	$('#teacherDetailsSubj').dataTable().fnAddData(mydata);
	
		}
	

	);
	
	
}
