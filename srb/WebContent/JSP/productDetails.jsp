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
				function cheakForExpenditure(){
					<%
						ProductDetailsDao dao2 = new ProductDetailsDao();
						List listPro2 = dao2.getProductName();
					%>
					var productName = $('#productName').val();
		    		var upProductName = productName.toUpperCase();
		    		var duplicate;
					<%
						for(int i=0;i<listPro2.size();i++)
						{
							ProductDetailsHibernate bean = (ProductDetailsHibernate)listPro2.get(i);
						
					%>
					var subCat = "<%=bean.getProductName()%>";
					var subcatName=document.getElementById("productName").value;
					var UpValue = subCat.toUpperCase();

					if(upProductName == UpValue)
					{
							duplicate = "found";
					}
					if(subcatName == subCat){
						alert("Product already exist...Duplicate Not allowed");
						/* location.reload(); */
						/* var productName = $('#productName').value=""; */
						document.getElementById("productName").value="";
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
  			
  
  
  
  

</head>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Product Details</h1>
                            <small>Product</small> 
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
	                    <a class="btn btn-primary"  onclick="productlist()" accesskey="t""> <i class="fa fa-list"></i>Product List </a>  
	                </div>
                </div>
            <div class="panel-body panel-form">
                <div class="row">
	

 		<form class="form-horizontal">
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
							
							<input list="productName_drop" id='productName' class="form-control" onchange="cheakForExpenditure()"/>
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
                     <input type="button" class="ui positive button" name="btn" value="Save" onclick="validationProductDetails()">Save</button>
                        
                           <div class="or"></div>
                           	<button type="reset" class="ui button">Reset</button>
                           	 <div class="or"></div>
                           	
                           	<input type="button" class="ui positive button" name="btn" value="Edit" onclick="editProductDetails()">Edit</button>
                           </div>
                 </div>
             </div>
		
 </form>
 </div>
 	<%@include file="commons/newFooter.jsp" %>