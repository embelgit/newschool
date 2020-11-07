
<%@page import="com.srb.hibernate.ProductDetailsHibernate"%>
<%@page import="com.srb.dao.ProductDetailsDao"%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/bootstrap.min.css"> -->
<meta charset="utf-8">
<script type="text/javascript" src="/srb/staticContent/JS/DelSupplier.js"></script>

<script type="text/javascript">
	function Back()
	{
		window.location="productList.jsp";
	}


</script>


</head>
	
	<body>
<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/deleteuser.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Product Delete</h1>
                            <small>Delete</small> 
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
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Product List</a>  
                    </div>
                    
                </div>
               
            <div class="panel-body panel-form">
                <div class="row">	 	
		 	

        <form class="form-horizontal" method="post" action="" name="delpro"> <!-- Value of 'name' attribute is used in categoryDetails.js  -->

		<%-- 	<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div> --%>
			 <div class="row form-group">
           		<label class="col-md-offset-3 col-md-2 control-label" for="godown">Product Name<sup>*</sup></label>  
           	 		<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							ProductDetailsDao sdd = new ProductDetailsDao();
           						List sList =sdd.getAllproducts();
							
							%>
							
							<input list="sup_drop" id="supplier"  class="form-control">
				            <datalist id="sup_drop">
							
							<%
					           for(int i=0;i<sList.size();i++){
					        	   ProductDetailsHibernate sup =(ProductDetailsHibernate)sList.get(i);
							%>
		
							<option data-value="<%=sup.getPkProductId()%>" value="<%=sup.getProductName() %>">
							<%
				      			}
				    		%>
						</datalist>        
            			</div>
           		 	</div>
				</div>
				
		
         
          <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Delete" onclick="delproduct()" style="width: 95px;">
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         </div>
                                </div>
                            </div>
       </form>
       </div>
       </div>
       </div>
       </div>
       </div>
       </div>
       </body>
       
   
     
     <%@include file="commons/newFooter.jsp" %>
     
<%-- <%@include file="commons/footer.jsp" %> --%>
				