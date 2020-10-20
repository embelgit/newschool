/**
 * 
 */

function ClassSubjectTeacherAssoc(){
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('clas'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
	var input1 = document.getElementById('fk_subject_id'),
	list = document.getElementById('subject'),
	i,fk_subject_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_subject_id = list.options[i].getAttribute('data-value');
		}
	}
	
	var input1 = document.getElementById('fk_teacher_id'),
	list = document.getElementById('teacherName'),
	i,fk_teacher_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fk_teacher_id = list.options[i].getAttribute('data-value');
		}
	}
	
var params = {};
	
var clas = $('#fk_class_id1').val();
var subject = $('#fk_subject_id').val();
var teacherName = $('#fk_teacher_id').val();
var academicYear = $('#academicYear').val();
	
	
        params["fk_class_id"] = fk_class_id;
		params["teacherName"] = teacherName;
		params["subject"] = subject;
		params["academicYear"] = academicYear;
		
 	params["methodName"] = "ClassSubjectTeacherAssoc";
 	
 	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
 	    	{
		 	
		 		alert(data)
		 		
		
 			}
 		
 	
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	})
}