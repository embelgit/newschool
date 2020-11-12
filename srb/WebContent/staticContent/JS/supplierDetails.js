function btnhide() {
	$("#save").hide();
}
function btnShow() {
	if (document.spld.dealerName.value != "") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.spld.dealerName.value.match(letterNumber)) {
			/*if(document.spld.personName.value != "")
			{
				var letterNumber = /^[a-zA-Z, ]+$/;
				if(document.spld.personName.value.match(letterNumber))
				{*/
			if (document.spld.contactNo.value != "") {
				var contactno = /^\d{10}$/;
				if (document.spld.contactNo.value.match(contactno)) {
					/*var mobileno=$('#contactNo').val();
					if(mobileno.length<=10)
					{
						alert("Please Enter 10 Digit mobile Number")
					}*/
					if (document.spld.city.value != "") {
						var City = /^[a-zA-Z, ]+$/;
						if (document.spld.city.value.match(City)) {
							if (document.spld.tinNo.value != "") {
								var GstNo = /^[a-zA-Z,0-9]+$/;
								if (document.spld.tinNo.value.match(GstNo)) {
									$("#save").show();
								} else {
									alert(" Alphanumerics Are allowed in GST");
									return false;
								}

							} else {

								alert("Please Enter GST Number");
								return false;
							}
						} else {
							alert("Only Numbers Are allowed in City");
							return false;
						}

					} else {

						alert("Please Enter City");
						return false;
					}
				} else {
					alert("Enter 10 Digit Mobile Number ");
					return false;
				}

			} else {

				alert("Please Enter Contact Number");
				return false;
			}

		}
		/*else
		{
			alert("Enter Alphabets Only in Person name field..!!");
			return false;
		}
		}
		else
		{
		alert("Enter person Name");
		return false;
		}
		}*/
		else {
			alert("Enter Alphabets Only in Dealer name field..!!");
			return false;
		}
	} else {
		message("Enter supplier Name.");
		return false;
	}

}
function phoneno() {
	$('#contactNo').keypress(function(e) {
		var a = [];
		var k = e.which;

		for (i = 48; i < 58; i++)
			a.push(i);

		if (!(a.indexOf(k) >= 0))
			e.preventDefault();
	})
}
function lanlineNo() {
	$('#landline').keypress(function(e) {
		var a = [];
		var k = e.which;

		for (i = 48; i < 58; i++)
			a.push(i);

		if (!(a.indexOf(k) >= 0))
			e.preventDefault();
	})
}

function characters() {

	$('#city').keypress(function(e) {
		var a = [];
		var k = e.which;
		for (i = 65; i < 123; i++)
			a.push(i);

		if (!(a.indexOf(k) >= 0))
			e.preventDefault();
	})

}

function supplierDetail() {

	if (document.spld.dealerName.value != "") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.spld.dealerName.value.match(letterNumber)) {
			/*if(document.spld.personName.value != "")
			{
				var letterNumber = /^[a-zA-Z, ]+$/;
				if(document.spld.personName.value.match(letterNumber))
				{*/
			if (document.spld.contactNo.value != "") {
				var contactno = /^\d{10}$/;
				if (document.spld.contactNo.value.match(contactno)) {
					var landline=$('#landline').val();
					/*if(landline.length<=10)
					{
						alert("Please Enter 10 Digit landline Number");
						return false;
					}*/
					if (document.spld.city.value != "") {
						var City = /^[a-zA-Z, ]+$/;
						if (document.spld.city.value.match(City)) {
							if (document.spld.tinNo.value != "") {
								var GstNo = /^[a-zA-Z,0-9]+$/;
								if (document.spld.tinNo.value.match(GstNo)) {
									supDetails();
								} else {
									alert(" Alphanumerics Are allowed in GST");
									return false;
								}

							} else {

								alert("Please Enter GST Number");
								return false;
							}
						} else {
							alert("Only Alphabets Are allowed in City");
							return false;
						}

					} else {

						alert("Please Enter City");
						return false;
					}
				} else {
					alert("Enter 10 Digit Mobile Number ");
					return false;
				}

			}
						else
						{
			
							alert("Please Enter Contact Number");
							return false;
						}

		}
		/*else
		{
			alert("Enter Alphabets Only in Person name field..!!");
			return false;
		}
		}
		else
		{
		alert("Enter person Name");
		return false;
		}
		}*/
		else {
			alert("Enter Alphabets Only in Dealer name field..!!");
			return false;
		}
	} else {
		alert("Enter supplier  Name.");
		return false;
	}

}

function supDetails() 
{

	document.getElementById('btn2').disabled = true;

	var IdNo = $('#IdNo').val();
	var dealerName = $('#dealerName').val();
	var contactNo = $('#contactNo').val()
	var landline = $('#landline').val();
	var emailId = $('#emailId').val();
	var personName = $('#personName').val();
	var city = $('#city').val();
	var tinNo = $('#tinNo').val();
	var address = $('#address').val();
	

	var params = {};
	
	if(personName=="" |personName==null |personName=="undefined")
	{
		personName="N/A";
	}
	if(landline=="" |landline==null |landline=="undefined" )
		{
		landline="00"
		}

	

	params["dealerName"] = dealerName;
	params["personName"] = personName;
	params["contactNo"] = contactNo;
	params["landline"] = landline;
	params["emailId"] = emailId;
	params["tinNo"] = tinNo;
	params["city"] = city;
	params["address"] = address;
	params["IdNo"] = IdNo;

	params["methodName"] = "supplierDetails";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data) {
		alert(data);
		if (document.spld) {
			
			document.spld.reset();
			location.reload();
		}
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

function reset() {
	document.spld.reset();

}

/********* Edit Supplier Details ************/
function getSupplierDetails() {
	var params = {};

	var input = document.getElementById('supplier'), list = document
			.getElementById('SupplierList'), i, fkRootSupId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootSupId = list.options[i].getAttribute('data-value');
		}
	}

	$("#prsn").append($("<input/>").attr("value", "").text());
	$("#cntno").append($("<input/>").attr("value", "").text());
	$("#lndline").append($("<input/>").attr("value", "").text());
	$("#emlid").append($("<input/>").attr("value", "").text());
	$("#city").append($("<input/>").attr("value", "").text());
	$("#address").append($("<input/>").attr("value", "").text());

	params["SupplierId"] = fkRootSupId;
	params["methodName"] = "getSupplierDetailsToEdit";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data) {

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData, function(i, v) {
			document.getElementById("prsn").value = v.personName;
			document.getElementById("cntno").value = v.contactNo;
			document.getElementById("lndline").value = v.landline;
			document.getElementById("emlid").value = v.email;
			document.getElementById("city").value = v.city;
			document.getElementById("address").value = v.address;

		});
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}
//Edit suplier details validation
function supplierDetail1() {
	if(document.sde.supplier.value==null || document.sde.supplier.value=="" || document.sde.supplier.value==undefined)
		{
		alert("please select Supplier Name");
		return false;
		}
	
	if (document.sde.prsn.value != "") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.sde.prsn.value.match(letterNumber)) {

			if (document.sde.cntno.value != "") {
				var contactno = /^\d{10}$/;
				if (document.sde.cntno.value.match(contactno) && document.sde.cntno.value!="0000000000" && document.sde.cntno.value!="9999999999") {
					if (document.sde.city.value != "") {
						var City = /^[a-zA-Z, ]+$/;
						if (document.sde.city.value.match(City)) {
						
							updateSupplierDetails();
							} 
						
						
						else {
							alert("Only Alphabets Are allowed in City");
							return false;
						}
					} else {

						alert("Please Enter City");
						return false;
					}

				} else {
					alert("Enter Valid Mobile Number ");
					return false;
				}

			} else {
				alert("Please Enter Contact Number");
				return false;
			}
		} else {
			alert("Enter Alphabets Only in Dealer name field..!!");
			return false;
		}

	} else {
		alert("Please Enter Dealer  Name.");
		return false;
	}

}

function updateSupplierDetails() {

	document.getElementById("btn").disabled = true;

	var input = document.getElementById('supplier'), list = document
	.getElementById('SupplierList'), i, fkRootSupId;
for (i = 0; i < list.options.length; ++i) {
if (list.options[i].value === input.value) {
	fkRootSupId = list.options[i].getAttribute('data-value');
}
}

	
	var personName = $('#prsn').val();
	var contactNo = $('#cntno').val();
	var landline = $('#lndline').val();
	var emailId = $('#emlid').val();
	var city = $('#city').val();
	var address = $('#address').val();
	//var IdNo = $('#IdNo').val();

	var params = {};
	
	if(personName=="" |personName==null |personName=="undefined")
	{
		personName="N/A";
	}
	if(landline=="" |landline==null |landline=="undefined")
		{
		landline="00"
		}

	params["supplierId"] = fkRootSupId;

	params["personName"] = personName;
	params["contactNo"] = contactNo;
	params["landline"] = landline;
	params["emailId"] = emailId;
	params["city"] = city;
	params["address"] = address;

	params["methodName"] = "updateSupplierDetails";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data) {
		alert(data);
		if (document.sde) {
			document.sde.reset();
		}
		document.sde.btn.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {

		/*alert("Data Added Successfully..");
		location.reload();
		document.ccd.btn.disabled =false;*/

		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}
