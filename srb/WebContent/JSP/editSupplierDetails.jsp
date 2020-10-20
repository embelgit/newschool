
<%@page import="com.srb.hibernate.SupplierDetailsBean"%>
<%@page import="com.srb.dao.SupplierDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>
 <meta charset="utf-8">
 <script type="text/javascript" src="/srb/staticContent/JS/supplierDetails.js"></script>
 <script type="text/javascript">
  			function Back()
  			{
  				window.location = "store_management.jsp" ;
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
                            <h1>Edit Supplier Details</h1>
                            <small>Details</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
           <div class="panel-body panel-form">
                <div class="row">
                <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="Back()" accesskey="t" "=""> <i class="fa fa-list"></i>Add Supplier </a>  
                </div>
			
	      </div>	
            </div>

      <div class="container" >
        <form class="form-horizontal" method="post" action="" name="spld1"><!-- Value of 'name' attribute is used in  supplierDetails.js  -->
          <fieldset>
          	 <div class="row form-group">
          	
           				 <label class="col-md-2 control-label" for="supplier">Supplier Name</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							
										
							<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
								SupplierDetailsDao sdd = new SupplierDetailsDao();
           						List sList =sdd.getAllSupplier();
							
							%>
							
							<input list="sup_drop" id="supplier" onchange="getSupplierDetails()" class="form-control">
				<datalist id="sup_drop">
							
							<%
					           for(int i=0;i<sList.size();i++){
					        	   SupplierDetailsBean sup =(SupplierDetailsBean)sList.get(i);
							%>
		
							<option data-value="<%=sup.getSupId()%>" value="<%=sup.getDealerName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
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
              				<input id="dealerName" name="dealerName" placeholder="Dealer Name" class="form-control input-md" type="text">
            			</div>
            		</div>

            <label class="col-md-2 control-label" for="personName"> Person Name</label>  
            	<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
						</span>
           		   		<input id="personName" name="personName" placeholder="Person Name" class="form-control input-md" type="text" >
           		 	</div>
				</div>
          </div>
         
          <div class="row form-group">
          
     <%--      <label class="col-md-2 control-label" for="salePrice"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("salePrice") %> <%}%> <%if(abc.equals("english")){%>Rate<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						Rs
						</span>
              			<input id="salePrice" name="salePrice" placeholder="Rate" class="form-control input-md" type="text" >
            		</div>
				</div> --%>
            	<label class="col-md-2 control-label" for="contactNo">Contact Number<sup>*</sup></label>
            		<div class="col-md-3">
    					<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-phone"></i>
							</span>
             				 <input id="contactNo" maxlength="10" name="contactNo" placeholder="Contact Number" class="form-control input-md " type="text"  >
           				</div>
					</div>
            
              	 <label class="col-md-2 control-label" for="landline">LandLine Number:</label>
            		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
              				<input id="landline" name="landline" placeholder="LandLine No" class="form-control input-md " type="text"  >
            			</div> 
            		</div> 
          	</div>

        
          <div class="row form-group">
            <label class="col-md-2 control-label" for="emailId">E-Mail Id:</label>
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
 			            <input id="city" name="city" placeholder="city" class="form-control input-md " type="text">
            		</div>
				</div>
          </div>

			<div class="row form-group">
            	  <label class="col-md-2 control-label" for="tinNo">Gst No:<sup>*</sup></label>
            		<div class="col-md-3">
		  				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-font"></i>
							</span>
              				<input id="tinNo" name="tinNo" placeholder="Gst No" class="form-control input-md "  type="text">
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
          	
          	
          	<%--<div class="row form-group">
            	<label class="col-md-2 control-label" for="tinNo"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("tin") %> <%}%> <%if(abc.equals("english")){%>ID No<%}%><sup>*</sup></label>
            		<div class="col-md-3">
		  				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-font"></i>
							</span>
              				<input id="IdNo" name="IdNo" placeholder="ID Number" class="form-control input-md "  type="text">
           				</div>
           			 </div>
           			<%--  <label class="col-md-2 control-label" for="address"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("address") %> <%}%> <%if(abc.equals("english")){%>Address<%}%><sup>*</sup></label>
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
 			            <input id="address" name="address" placeholder="Address" class="form-control input-md " type="text">
            		</div>
				</div> --%>
          	</div>
           	
    
          <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Update" onclick="supplierDetail1()">Save
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         </div>
                                </div>
          
          </fieldset>
         </form>
        </div>
         
         <%@include file="commons/newFooter.jsp" %>