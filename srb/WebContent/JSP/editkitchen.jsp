<%@page import="com.srb.bean.KitchenInventoryBean"%>
<%@page import="com.srb.dao.KitchenInventoryDao"%>
 
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/storeManagement.js"></script>
  	<script type="text/javascript">
	 function Back() {
			 window.location = "kitchenInventoryList.jsp";
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
			function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
	   </script>



</head>
<body>


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><i class="pe-7s-world"></i></div>
                        <div class="header-title">
                            <h1>Edit Kitchen Inventory Details</h1>
                            <small>edit Kitchen</small>
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                 <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Back</a>  
                </div>               
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                
                
                
                <form class="form-horizontal" name="tdvf">
		
		  <div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5 style="width:250px"><b><u>Kitchen Inventory Details</u></b></h5>
			        </div>
		       </div>
			</div><hr>
		  </div>
		  <!-- <div class="row">
		    <div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
				<label class="control-label">Designation<sup>*</sup></label>
			</div>
			<div class="col-md-3">
				<div class="selectContainer">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-user"></i> </span>
						<select name="designation" class="form-control selectpicker" id="designation" onchange="getTeacherName()" >
							<option value="">Select Designation</option>
							<option>Teaching Staff</option>
							<option>Non-Teaching Staff</option>
							<option>Principal</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		  </div> -->
		  
		  
 			<div class="row">
				<div class="form-group">
				<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Select Product Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							<!-- <input list="division" id="fk_teacher_id" class="form-control" onchange="getStudentDetails1()">
							<datalist id="division"></datalist> -->
							<!-- <select class="form-control input-md" id="fk_teacher_id"  name="fk_teacher_id" class="form-control" onchange="getStudentDetails1()"  placeholder="Teacher Name">
									</select> -->
								
						<%
						KitchenInventoryDao dao=new KitchenInventoryDao();
						List list16=dao.getKitchenInventoryList();
							%>
							 <input list="kitchenInventoryList" id="kitchenLists" class="form-control" onchange="getKitchenInventory1()"/>
								<datalist id="kitchenInventoryList">
								 <%
									for (int i = 0; i < list16.size(); i++) {
										KitchenInventoryBean sr=(KitchenInventoryBean)list16.get(i);
								 %>

								<option data-value="<%=sr.getProductName()%>"
									value="<%=sr.getProductName()%>">
									<%
										}
									%>
								</datalist>
							</div>
						</div>
				
					<div class="col-sm-2 " align="right">
						<label class="control-label">Bill No:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='billno1' name="billno" class="form-control" readonly="readonly" />
						</div>
					</div>
					
				
				</div>
			</div>
			<div class="row">
			<div class=" form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">supplier name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='supplierName1' name="supplierName" class="form-control"  placeholder="Enter Supplier Name" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Date<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="date" id='date1' name="buypricee" class="form-control"  placeholder="select Date"> 
						</div>
					</div>
					
				</div>
				</div>
			
			<div class="row">
			<div class=" form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Quantity<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='quantity1' name="quantity" class="form-control"  placeholder="Enter Quantity"  onkeypress="return isNumber(event)" onchange="getcalculation1()"/>
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Buy Price<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='buy_price1' name="buypricee" class="form-control"  placeholder="Buy Price" onkeypress="return isNumber(event)" onchange="getcalculation1()"/> 
						</div>
					</div>
					
				</div>
				</div>
				
				
				<div class="row">
		    <div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
				<label class="control-label">Gst percentage<sup>*</sup></label>
			</div>
			<div class="col-md-3">
				<div class="selectContainer">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-user"></i> </span>
						
						<input type="text" id='gst1' name="gst" class="form-control" placeholder="Enter a percentage" onkeypress="return isNumber(event)"  onchange="getcalculation1()" />
								
					</div>
				</div>
			</div>
			<div class="col-sm-2" align="right">
						<label class="control-label">Store Id:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text" id='storeid' name="total" class="form-control" readonly="readonly" />
						</div>
					</div>
					
		</div>
		  </div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Gst Amount:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text" id='gstamt1' name="gstamount" class="form-control"  readonly="readonly" />
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Total:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text" id='gross_total1' name="total" class="form-control" readonly="readonly" />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="update" id="btn" onclick="updatekitchenInventory()" >save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                                         
                                        
                                         </div>
                                </div>
                            </div>
			
			
         			</form>
                
                </div>
                </div>
                </div>

</html>				
		<%@include file="commons/newFooter.jsp" %> 			
	        