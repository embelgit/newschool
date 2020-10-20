

$( document ).ready(function() {
	$("#pass").on('keyup', function (e) {
	    if (e.keyCode == 13) {
	    	login();
	    }
	});
	$("#uname").on('keyup', function (e) {
	    if (e.keyCode == 13) {
	    	login();
	    }
	});
});

function Logout(){
	
	var params = {};
	
	params["methodName"] = "LogOut";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	    	{   
				
		        alert ("You are logOut Successfully!!!");
				window.location.replace("/srb/JSP/login.jsp");
										
			    }
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	});
	
}

function login(){
	if(document.Login.uname.value=="")
		{
		alert("Please Enter Username");
		return false;
		
		}
	if(document.Login.pass.value==""){
		alert("Please Enter Passward");
		return false;
	}
	/*if(document.Login.user_role.value=="")
		{
		alert("Please Select User Role");
		return false;
		}*/
	login1();
}
function login1(){
	var uname = $("#uname").val();
	var pass = $("#pass").val();
	
	var params = {};
	
	params["uname"] = uname;
	params["pass"] = pass;
	
	params["methodName"] = "login";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	    	{   
	
	window.location.replace("/srb/JSP/index.jsp");
				
			    }
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	});
	
}

function language(){
	
	var language = $("#language").val();
	
	var params = {};
	
	params["language"] = language;
	
	
	params["methodName"] = "language";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
	    	{   
	
	           location.reload();
				
			    }
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	});
	
	
}
