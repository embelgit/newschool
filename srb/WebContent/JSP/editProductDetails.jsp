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
		    if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
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
			function Back(){
				window.location = "store_management.jsp";
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
 		
 				<div class="row">
				<div class="form-group">
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
							
							<input list="productName_drop" id='productName2' class="form-control" placeholder="Please Select Product Name" style='text-transform:uppercase' onchange="getProductDetails()"/>
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
							
						</div>
					</div>

				</div>
			</div>
 		
 		
 		
 		
 				<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Product Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>
							
								<input type="text" id="newProductName" class="form-control" name="newProductName" style='text-transform:uppercase' onkeypress="return isAlphabetsWithSpace(event)" placeholder="Enter Product New Name"> 
							
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Unit: <sup>*</sup></label>
					</div>
						<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>
							
								<input type="text" id="unit" class="form-control" name="unit" '  placeholder="Enter Unit Name"> 
							
						</div>
					</div>
					<!-- <div class="col-md-3">
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
					</div> -->
				</div>
			</div>
		<div class="row">
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
			
			<div class="col-sm-2" align="right">
						<label class="control-label">Description: <sup>*</sup></label>
					</div>
						<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>
							
								<input type="text" id="desp" class="form-control" name="desp"  placeholder="Enter Description "> 
							
						</div>
					</div>
					
		</div>
		</div>
		
		<div class="form-group row">
                 <div class="col-md-offset-4 col-md-4 btn-center">
                     <div class="ui buttons">
                     <input type="button" class="ui positive button" name="btn" id="btn" value="Update" onclick="updateProductDetails()">Update</button>
                        <div class="or"></div>
                           		<button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                          <div class="or"></div>
                        <button class="ui positive button"  type="button" value="Back" id="listBtn"  onclick="Back()">Back</button>
                 </div>
             </div>
		
 </form>
 </div>
 	<%@include file="commons/newFooter.jsp" %>