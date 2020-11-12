<%@page import="com.srb.hibernate.SupplierPaymentBean"%>
<%@page import="com.srb.dao.LibraryManagementDao"%>
<%@page import="com.srb.hibernate.SupplierDetailsBean"%>
<%@page import="com.srb.dao.SupplierDetailsDao"%>
<%@page import="com.srb.hibernate.StoreManagementHibernate"%>
<%@page import="com.srb.dao.StoreManagementDAO"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.ProductDetailsDao"%>
<%@page import="com.srb.hibernate.ProductDetailsHibernate"%>



<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>
  <!--   <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script> -->
    <script src="/srb/staticContent/JS/Class_Division_Subject_Teacher.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/storeManagement.js"></script>
    
     <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     <!-- <link rel="stylesheet" href="/AgriSoft/staticContent/css/ui.jqgrid.css"> -->
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
	<!--  <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script> -->
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
   
 <script type="text/javascript" src="/srb/staticContent/JS/supplierDetails.js"></script>
 
 
 
 <script type="text/javascript" src="/srb/WebContent/JSP/commons/clock.jsp"></script>
 
 <script type="text/javascript" src="/srb/staticContent/JS/productDetails.js">
  </script>
  
  
 	 <script type="text/javascript">
			function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
	   </script>
		
		<script type="text/javascript">
			function isAlphabets(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))) {
		        return false;
		    }
		    return true;
			}


		</script>
		
		
		<script type="text/javascript">
			function isAlphabetsWithSpace(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
		        return false;
		    }
		    return true;
			}


		</script>
		
		<script type="text/javascript">
			function productlist()
			{
				window.location = "productList.jsp";
			}
		
		</script>
  
  	<script type="text/javascript">
		function editProductDetails()
		{
			window.location = "editProductDetails.jsp";
		}
		</script>
		<script type="text/javascript">
		function editSupplier()
		{
			
			window.location="editSupplierDetails.jsp";
		}
  	</script>
  
  
  			
         <script type="text/javascript">	
				function cheakForExpenditure(){
					<%
						ProductDetailsDao dao2 = new ProductDetailsDao();
						List listPro2 = dao2.getProductName();
					%>
					var productName = $('#productNameDetail').val();
		    		var upProductName = productName.toUpperCase();
		    		var duplicate;
					<%
						for(int i=0;i<listPro2.size();i++)
						{
							ProductDetailsHibernate bean = (ProductDetailsHibernate)listPro2.get(i);
						
					%>
					var subCat = "<%=bean.getProductName()%>";
					var subcatName=document.getElementById("productNameDetail").value;
					var UpValue = subCat.toUpperCase();

					if(upProductName == UpValue)
					{
							duplicate = "found";
					}
					if(subcatName == subCat){
						alert("Product already exist...Duplicate Not allowed");
						/* location.reload(); */
						/* var productName = $('#productName').value=""; */
						document.getElementById("productNameDetail").value="";
						return false;
					}
					<%
							}
					%>
					if(duplicate == "found"){
		    			document.expenseDetails.btn.disabled = true;	
						alert("Product Name Already Exist..!!!");
						location.reload();
						document.expenseDetails.btn.disabled = false;
		    			return false;
		    		}
				}
	     </script> 
  			
  
 
 <script type="text/javascript">
          		 function supplierlist()
          		 {
          		 	window.location = "supplierList.jsp";
          		 }
          		 function editSupplier() {
          			 window.location = "editSupplierDetails.jsp";
				}
          		 
          		 
          		function checkForDuplicateSupplierIdEntry(){
          			<%
	          			SupplierDetailsDao dao4 = new SupplierDetailsDao();
	          			List list = dao4.getAllSupplier();
          			%>
          			
          			<%
	          			int z = 0;
	          			for(z=0;z<list.size();z++)
	          			{
	          		  	  SupplierDetailsBean bean = (SupplierDetailsBean)list.get(z);
          			
          			%>
	          			var supName = "<%=bean.getDealerName()%>";          	
	          			if(document.getElementById("dealerName").value ==supName )
		          		{
	          				alert("Supplier Name already exist...Duplicate Not allowed");
	          				location.reload();
	          				return false;
	          			}
          			<%
          				}
          			%>
          			
          			} 
          		</script>
 
<script type="text/javascript">
	function clearProductName()
	{
		document.getElementById("productName").value="";
	}

 </script>
 
 <script type="text/javascript">
	function clearProductName1()
	{
		document.getElementById("productName1").value="";
	}

 </script>
 <script type="text/javascript">
 function hostelInventorylist(){
	 window.location = "HostelInventoryList.jsp";
 }
 </script>
 
 <script type="text/javascript">
		function kitchenInventorylist()
		{
			window.location="kitchenInventoryList.jsp";
			
		}

 </script>
 <script type="text/javascript">
		function StoreInventryList()
		{
			window.location="StoreInventryList.jsp";
			
		}

 </script>
 <script type="text/javascript">
			function isAlphabetsWithSpace(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
		        return false;
		    }
		    return true;
			}


		</script>
		
		<script type="text/javascript">
function checkForDuplicateBillEntry(){
          			
          			
	var input = document.getElementById('supplierName'),
	list = document.getElementById('dealerName_drop'),
	i,fk_supplier_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_supplier_id = list.options[i].getAttribute('data-value');
		}
	}
          			
          			<%
          			LibraryManagementDao dao3 = new LibraryManagementDao();
          			List list1 = dao3.getAllMainSupplierpayment();
          			%>
          			
          			<%
          			int A = 0;
          			for(A=0;A<list1.size();A++){
          				SupplierPaymentBean bean = (SupplierPaymentBean)list1.get(A);
          			%>
          			var pksupPaymentId = "<%=bean.getPkSupPaymentId()%>";
          			var Bill1 = "<%=bean.getBillNo1()%>";
          			var fksupid = "<%=bean.getSupplier1()%>";
          			var SupName = "<%=bean.getSupplier()%>"
          			var Bill = document.getElementById("billNo").value;
          			//var	Bill = $('#billNo').val();
          			
          			//Bill = Integer.parseInt(request.getParameter("billNo"));
          			//var fk_supplier_id =document.getElementById("supplierName").value;
          			//var BillNo =Integer.toString(Bil); 
          			//var className1=className.toLowerCase();
          			//var cName1=cName.toLowerCase();
          			if(  Bill == Bill1 ){
          				alert("Bill No already exist...Duplicate Not allowed");
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
</script>
<script type="text/javascript">
function checkForDuplicateBillEntryForKitchenInventry()
{

	<%
	LibraryManagementDao dao5 = new LibraryManagementDao();
	List list2 = dao5.getAllMainSupplierpayment();
	%>
	
	<%
	int B = 0;
	for(B=0;B<list1.size();B++){
		SupplierPaymentBean bean = (SupplierPaymentBean)list1.get(B);
	%>
	var pksupPaymentId = "<%=bean.getPkSupPaymentId()%>";
	var Bill1 = "<%=bean.getBillNo1()%>";
	var fksupid = "<%=bean.getSupplier1()%>";
	var SupName = "<%=bean.getSupplier()%>"
	var Bill = document.getElementById("billNo2").value;
	//var	Bill = $('#billNo').val();
	
	//Bill = Integer.parseInt(request.getParameter("billNo"));
	//var fk_supplier_id =document.getElementById("supplierName").value;
	//var BillNo =Integer.toString(Bil); 
	//var className1=className.toLowerCase();
	//var cName1=cName.toLowerCase();
	if(  Bill == Bill1 ){
		alert("Bill No already exist...Duplicate Not allowed");
		location.reload();
		return false;
	}
	<%
	}
	%>
	
	}



</script>
 
 
<%--   <!-- LABLE STYLE END -->
 <%
 Double BillNo = 1d;
	 %>
<%
StoreManagementDAO data = new StoreManagementDAO();
		List stkList  = data.getLastBillNo();
		
		for(int i=0;i<stkList.size();i++){
			
			StoreManagementHibernate st = (StoreManagementHibernate)stkList.get(i);
			BillNo = st.getBillNo();
			System.out.println("hi this is Kishor  billno is ++++++"+BillNo);
			
			BillNo++;
			System.out.println( BillNo);
			
		}      
	        
         %> 
 
 --%> 
 
</head>
<body>
<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Purchase Receive</h1>
                            <small>Purchase Receive</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
          		<div class="panel-heading no-print">
	                <div class="btn-group"> 
	                    <a class="btn btn-primary"  onclick="supplierlist()" accesskey="t""> <i class="fa fa-list"></i>Supplier List </a>  
	                </div>
	                
	                 <div class="btn-group"> 
	                    <a class="btn btn-primary"  onclick="productlist()" accesskey="t""> <i class="fa fa-list"></i>Product List </a>  
	                </div>
	                <div class="btn-group"> 
	                    <a class="btn btn-primary"  onclick="StoreInventryList()" accesskey="t""> <i class="fa fa-list"></i>Store Inventory List </a>  
	                </div>
	                
	                <div class="btn-group"> 
	                    <a class="btn btn-primary"  onclick="kitchenInventorylist()" accesskey="t""> <i class="fa fa-list"></i>Kitchen Inventory List </a>  
	                </div>
	                <div class="btn-group"> 
	                    <a class="btn btn-primary"  onclick="hostelInventorylist()" accesskey="t""> <i class="fa fa-list"></i>Hostel Inventory List </a>  
	                </div>
                </div>
               
            <div class="panel-body panel-form">
                <div class="row">
		<ul class="nav nav-tabs"><li class="active"><a data-toggle="tab" href="#supp"><h4 style="color:blue">Supplier Details</h4></a></li>
	    	<li><a data-toggle="tab" href="#Product"><h4 style="color:blue">Product Details</h4></a></li>
	    	<li><a data-toggle="tab" href="#messages"><h4 style="color:blue">Store Inventory</h4></a></li>
	    	<li><a data-toggle="tab" href="#kitchen"><h4 style="color:blue">Kitchen Inventory</h4></a></li>
	    		<li><a data-toggle="tab" href="#hostel"><h4 style="color:blue">Hostel Inventory</h4></a></li>
		</ul>
<!-- body onload="getGridForStoreManagement()"> -->
<div class="container-fluid">
<div class="row" style="min-height:300px;">
            <!-- Tab panes -->
    <div class="tab-content">
    
    
		<!------------------------------  Store Management ----------------------->
<div class="tab-pane" id="messages">
 	<form class="form-horizontal" name="storeManageForm">
		    	
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Bill No:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='billNo' name="billNo" class="form-control" placeholder="Enter Bill No" onchange="checkForDuplicateBillEntry()" >
				        </div>
			       </div>
				
				<div class="col-sm-2" align="right">
						<label class="control-label">Date:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='storeDate' name="storeDate" class="form-control" >
						</div>
					</div>
				</div>
			</div>	
					
			
		  <div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-md-offset-1 " align="right">
						<label class="control-label">Product Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='productName' name="productName" autofocus="autofocus" class="form-control" placeholder="Enter Product name" onchange="getGridForStoreManagement();clearProductName()"/>
						</div>
					</div>
				
					<div class="col-sm-2 "  align="right">
						<label class="control-label">Supplier Name<sup>*</sup></label>
					</div>
					<!-- <div class="col-sm-3" >
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='supplierName' name="supplierName" class="form-control" placeholder="Enter supplier name" />
						</div>
					</div> -->
					    	<div class="col-md-3">
            				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao productdao1 = new SupplierDetailsDao();
           						List productList1 =productdao1.getAllSupplier();
							
							%>
							<input list="dealerName_drop" id="supplierName"  class="form-control" " >
							<datalist id="dealerName_drop">
							<%
					           for(int i=0;i<productList1.size();i++){
					        	   SupplierDetailsBean productbean1 =(SupplierDetailsBean)productList1.get(i);
							%>
		
							<option data-value="<%=productbean1.getSupId()%>" value="<%=productbean1.getDealerName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>
					
						
					
					
			 	</div>
		 </div>
<div class="row">
		  <div class="table-responsive	row col-md-offset-3">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
		  </div>
		         <div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal" name="grossTotal"  class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
            	
            	</div>
            	</div>
<!-- 		  	<div class="row buttons_margin_top">
				<div align="center">
					<input type="button" class="btn btn-lg btn-success btn-md button_hw button_margin_right" name="btn" value="Save" onclick="addStoreManagementValidation()" style=" height: 65px; width: 180; font-size: 25"/>
					<input type="reset" class="btn btn-lg btn-danger btn-md button_hw button_margin_right" onclick="reloadPage()" value="Clear" style=" height: 65px; width: 180; font-size: 25"/>
				<input style=" height: 65px; width: 225; font-size: 25" type="button" value="Edit Teacher Info" id="listBtn" class="btn btn-primary" onclick="editTeacher()" />
				<input type="button" style=" height: 65px; width: 180; font-size: 25" value="List" id="listBtn" class="btn btn-primary" onclick="teacherList()" />
				</div>
			</div>
			 -->
			  <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input class="ui positive button" name="btn" value="Save" id="btn1" onclick="addStoreManagementValidation()" style="width: 75px;">Save
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                                        
                                         </div>
                                </div>
                            </div>
	</form>
	</div>
	
	

 
	<!-- ------------------------------Supplier Details------------------------------------  -->
	 <div class="tab-pane active " id="supp">
	  <form class="form-horizontal" method="post" action="" name="spld" ><!-- Value of 'name' attribute is used in  supplierDetails.js  -->
       
       		<%-- 	<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div> --%>
	
				
			<div class="row form-group">
				 <label class="col-md-2 control-label" for="emailId"> Supplier Code: </label>  
            	<div class="col-md-3 ">
					<div class="input-group">
						<span class="input-group-addon">
									<i class="	glyphicon glyphicon-hand-right"></i>
							
						</span>
             				 <input id="IdNo" name="IdNo " placeholder="Supplier Code" class="form-control input-md" type="text">
            		</div>
				</div> 
				
			</div>
			
        	<div class="row form-group">
            	<label class="col-md-2 control-label" for="dealerName">Supplier Name:<sup>*</sup></label>  
            		<div class="col-md-3">
            				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao productdao2 = new SupplierDetailsDao();
           						List productList2 =productdao2.getAllSupplier();
							
							%>
							<input list="dealerName_drop" id="dealerName"  class="form-control" onchange="checkForDuplicateSupplierIdEntry()" >
							<datalist id="dealerName_drop">
							<%
					           for(int i=0;i<productList2.size();i++)
					           {
					        	   SupplierDetailsBean productbean2 =(SupplierDetailsBean)productList2.get(i);
							%>
		
							<option data-value="<%=productbean2.getSupId()%>" value="<%=productbean2.getDealerName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>

            <label class="col-md-2 control-label" for="personName">Person Name</label>  
            	<div class="col-md-3">
           		 	<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao persondao1 = new SupplierDetailsDao();
           						List personList1 =persondao1.getAllSupplier();
							
							%>
							<input list="personName_drop" id="personName"  class="form-control" onkeypress="return isAlphabetsWithSpace(event)">
					<datalist id="personName_drop" >
							<%
					           for(int i=0;i<personList1.size();i++){
					        	   SupplierDetailsBean personBean =(SupplierDetailsBean)personList1.get(i);
							%>
		
							<option data-value="<%=personBean.getSupId()%>" value="<%=personBean.getPersonName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
				</div>
          </div>
         
          <div class="row form-group">
          
              
            	<label class="col-md-2 control-label" for="contactNo">Contact Number:<sup>*</sup></label>
            		<div class="col-md-3">
    					<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-phone"></i>
							</span>
             				 <input id="contactNo" maxlength="10" name="contactNo" placeholder="Contact Number" class="form-control input-md " onkeypress="phoneno()" type="text">
           				</div>
					</div>
            
               <label class="col-md-2 control-label" for="landline">LandLine Number:</label>
            		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
              				<input id="landline" name="landline" maxlength="10" placeholder="LandLine No" class="form-control input-md " onkeypress="lanlineNo()" type="text" >
            			</div> 
            		</div>
          	</div>

        
          <div class="row form-group">
            <label class="col-md-2 control-label" for="emailId">E-mail Id:</label>
            	<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-envelope"></i>
						</span>
              			<input id="emailId" name="emailId" placeholder="Email ID" class="form-control input-md " type="text">
            		</div>
            	</div>

           <label class="col-md-2 control-label" for="city">City:<sup>*</sup></label>
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
 			            <input id="city" name="city" placeholder="city" class="form-control input-md" onkeypress="characters()" type="text">
            		</div>
				</div>
          </div>

			<div class="row form-group">
            	<label class="col-md-2 control-label" for="tinNo">GST No:<sup>*</sup></label>
            		<div class="col-md-3">
		  				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-font"></i>
							</span>
              				<input id="tinNo" name="tinNo" placeholder="GST No" class="form-control input-md "  type="text">
           				</div>
           			 </div>
           			 <label class="col-md-2 control-label" for="address">Address:</label>
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
 			            <input id="address" name="address" placeholder="Address" class="form-control input-md " type="text">
            		</div>
				</div>
          	</div>
          	
          	


         		<div class="form-group row">
                    <div class="col-md-offset-4 col-md-4 btn-center">
                        <div class="ui buttons">
                        <input type="button" class="ui positive button" name="btn" value="Save" id="btn2" onclick="supplierDetail()" style="width: 75px;">Save
                        <div class="or"></div>
                         <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                         <div class="or"></div>
                         <input type="button" class="ui positive button" name="btn" value="Edit" onclick="editSupplier()" style="width: 75px;">Edit
                         <!-- <div class="or"></div>
                         <button type="reset" class="ui positive button" onclick="editSupplier()">Edit</button> -->
                         </div>
                    </div>
                </div>
       </form>
       </div>
       
       
       
       		<!------------------------------  Kitchen Inventory ----------------------->
<div class="tab-pane " id="kitchen">
 	<form class="form-horizontal" name="kitchenInventoryForm">
		    	
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Bill No:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='billNo2' name="billNo2" class="form-control" placeholder="Enter Bill No" onchange="checkForDuplicateBillEntryForKitchenInventry()" >
				 </div>
			</div>
				
				<div class="col-sm-2" align="right">
						<label class="control-label">Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='storeDate2' name="storeDate2" class="form-control" >
						</div>
					</div>
				</div>
			</div>	
					
			
		  <div class="row">
				<div class="form-group">
				
					<div class="col-sm-2 col-sm-offset-1"  align="right">
						<label class="control-label">Supplier Name<sup>*</sup></label>
					</div>
					<!-- <div class="col-sm-3" >
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='supplierName' name="supplierName" class="form-control" placeholder="Enter supplier name" />
						</div>
					</div> -->
					    	<div class="col-md-3">
            				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao productdao11 = new SupplierDetailsDao();
           						List productList11 =productdao11.getAllSupplier();
							
							%>
							<input list="dealerName_drop" id="supplierName2"  class="form-control">
							<datalist id="dealerName_drop2">
							<%
					           for(int i=0;i<productList11.size();i++){
					        	   SupplierDetailsBean productbean1 =(SupplierDetailsBean)productList11.get(i);
							%>
		
							<option data-value="<%=productbean1.getSupId()%>" value="<%=productbean1.getDealerName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>
					
						<div class="col-sm-2 " align="right">
						<label class="control-label">Product Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<%
								ProductDetailsDao dao1 = new ProductDetailsDao();
								List listPro1 = dao1.getProductName();
							%>
							
							<input list="productName_drop" id='productName2' autofocus="autofocus" class="form-control"  onchange="getGridForKitchenInventory();getProductQuantity();clearProductName()"/>
							 <datalist id="productName_drop">
							<%
								for(int i=0;i<listPro1.size();i++)
								{
									ProductDetailsHibernate bean = (ProductDetailsHibernate)listPro1.get(i);
								
							%>
									<option data-value="<%=bean.getPkProductId() %>" value="<%=bean.getProductName() %>">
							<%
									}
							%>
							</datalist>
						
						</div>
					</div>
					
					
			 	</div>
		 </div>
	<div class="row">
		  <div class="table-responsive	row col-md-offset-3">
				<table id="list5" ></table>
				<div id="jqGridPager5"></div>
		  </div>
		         <div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="subTotal"><h4><b>Sub Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="subTotal2" name="subTotal2"  class="form-control input-md" type="text" style="font-size: 15px;  height: 40px;">
	            			</div>
	            		</div>
            	
            	</div>
            	</div>
            	
          <div class="row">
		  <div class="table-responsive	row col-md-offset-1">
				<table id="list5" ></table>
				<div id="jqGridPager5"></div>
		  </div>
		         <div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>GST</b></h4></label>  
			           	 <div class="col-md-1" style=" width: 120px;">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="gst" name="gst"  class="form-control input-md" type="text" style="font-size: 15px;  height: 40px;" onchange="gstCaluculation()">
	            			</div>
	            		</div>
	            		
	            		
	            		
	            	   <div class="col-md-1"  style=" width: 164px;">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="gstAmount" name="gstAmount"  class="form-control input-md" type="text" style="font-size: 15px;  height: 40px;">
	            			</div>
	            		</div>
            	
            	</div>
            	</div>
            	
<!--             	
            	
          <div class="row">
		  <div class="table-responsive	row col-md-offset-1">
				<table id="list5" ></table>
				<div id="jqGridPager5"></div>
		  </div>
		         <div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>GST Amount</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="gstAmount" name="gstAmount"  class="form-control input-md" type="text" style="font-size: 15px;  height: 40px;">
	            			</div>
	            		</div>
            	
            	</div>
            	</div> -->
            	
            		<div class="row">
		  <div class="table-responsive	row col-md-offset-1">
				<table id="list5" ></table>
				<div id="jqGridPager5"></div>
		  </div>
		         <div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal2" name="grossTotal2"  class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
            	
            	</div>
            	</div>

			  <div class="form-group row">
                  <div class="col-md-offset-4 col-md-4 btn-center">
                      <div class="ui buttons">
                      <input type="button" class="ui positive button" name="btn" value="Save"  id="btn3" onclick="validationForKitcheninventory()" style="width: 75px;">Save
                          <div class="or"></div>
                           		<button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                          
                          </div>
                  </div>
              </div>
		</form>
	</div>
  	
		<!-- -------------Product Details -->
	<div class="tab-pane" id="Product">
		<form class="form-horizontal" name="Productname">
 				<!-- <div class="row"> -->
				<div class="row form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Product Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>
							
								<%
								ProductDetailsDao dao = new ProductDetailsDao();
								List listPro = dao.getProductName();
							%>
							
							<input list="productName_drop" id='productNameDetail' class="form-control" onchange="cheakForExpenditure()"/>
							 <datalist id="productName_drop">
							<%
								for(int i=0;i<listPro.size();i++)
								{
									ProductDetailsHibernate bean = (ProductDetailsHibernate)listPro.get(i);
								
							%>
									<option data-value="<%=bean.getPkProductId() %>" value="<%=bean.getProductName() %>">
							<%
									}
							%>
							</datalist>
							
							
							
								<!-- <input type="text" id="productName" class="form-control" name="productName" style='text-transform:uppercase' onkeypress="return isAlphabetsWithSpace(event)" placeholder="Enter Product Name"> --> 
							
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Unit: <sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							<select id="unit" class="form-control">
								<option value="">--Select Unit--</option>
								<option value="kg">Kg</option>
								<option value="lit">Lit</option>
								<option value="pcs">Pcs</option>
								
							</select>

							
						</div>
					</div>
				</div>
			<!-- </div> -->

		<div class="row form-group">
			<div class="col-md-2 col-sm-offset-1" align="right">
					<label class="control-label" for="message">Quantity Limit:<sup>*</sup></label>
			</div>
			
		 	 <div class="col-md-3">
		 	 <div class="input-group">
				<span class="input-group-addon">
				 <i class="glyphicon glyphicon-stats"></i>
				</span>
		 	 
      			<input type="text" id="quantityLimit" name="limit" placeholder="Enter Quantity limit " class="form-control" onkeypress="return isNumber(event)">  
			</div>
			</div>
			<div class="col-md-2 " align="right">
					<label class="control-label" for="message">Description:</label>
			</div>
			
		 	 <div class="col-md-3">
		 	 <div class="input-group">
				<span class="input-group-addon">
				 <i class="glyphicon glyphicon-stats"></i>
				</span>
		 	 
      			<input type="text" id="Description" name="Description" placeholder="Enter Description " class="form-control" ">  

			</div>
		</div>
		</div>
		
		<div class="form-group row">
                 <div class="col-md-offset-4 col-md-4 btn-center">
                     <div class="ui buttons">
                     <input type="button" class="ui positive button" name="btn" id="btn4" value="Save" onclick="validationProductDetailsNew()">Save</button>
                        
                           <div class="or"></div>
                           	<button type="reset" class="ui button"onclick="location.reload()">Reset</button>
                           	 <div class="or"></div>
                           	
                           	<input type="button" class="ui positive button" name="btn" value="Edit" onclick="editProductDetails()">Edit</button>
                           </div>
                 </div>
             </div>
		
 </form>
 </div>
 
 <!-- hostel inventory -->
 
 	<div class="tab-pane" id="hostel">
 	<form class="form-horizontal" name="hostelForm">
		    	
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Bill No:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='billNoo' name="billNoo" class="form-control" placeholder="Enter Bill No" onchange="checkForDuplicateBillEntry()" >
				        </div>
			       </div>
				
				<div class="col-sm-2" align="right">
						<label class="control-label">Date:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='storeDatee' name="storeDatee" class="form-control" >
						</div>
					</div>
				</div>
			</div>	
					
			
		  <div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-md-offset-1 " align="right">
						<label class="control-label">Product Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='productName1' name="productName1" autofocus="autofocus" class="form-control" placeholder="Enter Product name" onchange="getGridForhostelManagement();clearProductName1();"/>
						</div>
					</div>
				
					<div class="col-sm-2 "  align="right">
						<label class="control-label">Supplier Name<sup>*</sup></label>
					</div>
					<!-- <div class="col-sm-3" >
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='supplierName' name="supplierName" class="form-control" placeholder="Enter supplier name" />
						</div>
					</div> -->
					    	<div class="col-md-3">
            				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao productdao10 = new SupplierDetailsDao();
           						List productList10 =productdao10.getAllSupplier();
							
							%>
							<input list="dealerNamee_drop" id="supplierNamee"  class="form-control" " >
							<datalist id="dealerNamee_drop">
							<%
					           for(int i=0;i<productList10.size();i++){
					        	   SupplierDetailsBean productbean1 =(SupplierDetailsBean)productList10.get(i);
							%>
		
							<option data-value="<%=productbean1.getSupId()%>" value="<%=productbean1.getDealerName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>
					
						
					
					
			 	</div>
		 </div>
<div class="row">
		  <div class="table-responsive	row col-md-offset-3">
				<table id="list10" ></table>
				<div id="jqGridPagerr"></div>
		  </div>
		         <div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotall" name="grossTotall"  class="form-control input-md" type="text" style="font-size: 25px;  height: 55px; ">
	            			</div>
	            		</div>
            	
            	</div>
            	</div>

			  <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input class="ui positive button" name="btn" value="Save" id="btn5" onclick="addhostelManagementValidation()" style="width: 75px;">Save
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                                        
                                         </div>
                                </div>
                            </div>
	</form>
	</div>
 
 
 
	</div>
	</div>
	</div>	
</div>
	<%@include file="commons/newFooter.jsp" %>
<!-- </body> -->