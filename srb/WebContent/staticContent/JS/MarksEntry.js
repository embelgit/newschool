/**
 * 
 */

function MarsEntry(){
	
	var params = {};
	
	var subject = $('#subject').val();
	var examName= $('#examName').val();
	
	var teacherName = $('#teacherName').val();
	var studentName= $('#studentName').val();
	
	var markso = $('#markso').val();
	var outomarks= $('#outomarks').val();
	
	var clas = $('#clas').val();
	var division= $('#division').val();
	
	var rollno= $('#rollno').val();
    var grade= $('#grade').val();
	
	var medium = $('#medium').val();
	var doe= $('#doe').val();
	
	

	params["subject"] = subject;
	params["examName"] = examName;
	
	params["teacherName"] = teacherName;
	params["studentName"] = studentName;

	params["markso"] = markso;
	params["outomarks"] = outomarks;
	
	params["clas"] = clas;
	params["division"] = division;
	
	params["rollno"] = rollno;
	params["grade"] = grade;
	
	params["medium"] = medium;
	params["doe"] = doe;
	
	
params["methodName"] = " MarsEntry";

$.post('/srb/jsp/utility/controller.jsp',params,function(data)
	    	{
	 	
	 		alert(data)
	 		
	
			}
		
	
	
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	})}
	
 	
 	