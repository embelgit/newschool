//featch username and password from userDetails
function getUserDetails(){
	var params= {};
	var name= $('#EmpName').val();
	
	var userId=name.split(",")[0];
	var empname=name.split(",")[1];


	$("#userName").append($("<input/>").attr("value","").text());
	$("#password").append($("<input/>").attr("value","").text());
	
	
	params["userId"]= userId;
	params["empname"]= empname;
	params["methodName"] = "getUserDetailsToAccessControl";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data){

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			document.getElementById("userName").value = v.userName;
			document.getElementById("password").value = v.password;


				});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {

		}
	});

}

//save Access Control
function AddAccessControlDetails(){

	//document.getElementById("save").disabled = true;
	
	var EmpName = $('#EmpName').val();
	var userid= EmpName.split(",")[0];
	var employeeName = EmpName.split(",")[1];
	
	var userName = $('#userName').val();
	var password = $('#password').val();
	var type = $('#type').val();
	
	//var shopname  = $('#shopname').val();
	//var shopid= shopname.split(",")[0];
	//var shop= shopname.split(",")[1];

	var params = {};


	params["userid"] =userid;
	params["EmpName"] =employeeName;
	params["userName"] =userName;
	params["password"] =password;
	params["type"] = type;
	//params["shopid"] =shopid;
	//params["shopname"] =shop;  

	params["methodName"] = "AddAccessControl";
	$.post('/srb/JSP/utility/controller.jsp',params,function(data) 			 	    	{
		alert(data);
		location.reload();
		if(document.usd)
		{
			document.usd.reset();
		}	
		//document.usd.btn.disabled =false;
		 document.getElementById("btn").disabled = false;	
	}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}
