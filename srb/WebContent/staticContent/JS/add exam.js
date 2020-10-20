/**
 * 
 */

function AddExam(){
	
	var params = {};
	
	var subject = $('#subject').val();
	var examName= $('#examName').val();
	
	var teacherName = $('#teacherName').val();
	var doe= $('#doe').val();
	
	var mmarksreq = $('#mmarksreq').val();
	var outomarks= $('#outomarks').val();
	
	var clas = $('#clas').val();
	var division= $('#division').val();
	
	

	params["subject"] = subject;
	params["examName"] = examName;
	
	params["teacherName"] = teacherName;
	params["doe"] = doe;

	params["mmarksreq"] = mmarksreq;
	params["outomarks"] = outomarks;
	
	params["clas"] = clas;
	params["division"] = division;
	
params["methodName"] = "AddExam";
 	
 	
 	
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
 	
