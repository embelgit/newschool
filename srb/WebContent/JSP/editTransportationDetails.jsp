<%@page import="com.srb.bean.GetTransportationDetails"%>
<%@page import="com.srb.hibernate.TrasnpotationSchollBus" %>
<%@page import="com.srb.dao.TransportationInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/transportation.js"></script>
  	<script type="text/javascript">
	 function Back() {
			 window.location = "TranspotationBus2.jsp";
	}

</script>
<script type="text/javascript">
			function isAlphabetsWithSpace(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if(charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)){
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
                        <div class="header-icon"><img src="/srb/staticContent/Images/list.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Edit Transportation Details</h1>
                            <small>edit Transportation</small>
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
            
		
		  <div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Transportation Details</u></b></h5>
			        </div>
		       </div>
			</div>
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
		  
		  
 			<form class="form-horizontal" method="post" name="edittmpd">
			
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label><sup>*</sup>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
							TransportationInfoDao sdd = new TransportationInfoDao();
								List sList = sdd.getListToEditTransportaionDetails();
							%>

							<input list="studentNameList12" id="studentName12" class="form-control" onchange="getTransportationDetails()">
							<datalist id="studentNameList12">
							 <%
 	                            for (int i = 0; i < sList.size(); i++) {
 	                            	GetTransportationDetails gt = (GetTransportationDetails) sList.get(i);
                             %>

							<option data-value="<%=gt.getPkTranspaymentId()%>"
								value="<%=gt.getStudentName()%> ,<%=gt.getContactNo()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>

					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Driver Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							 <input type="text" id='DriverName12' name="DriverName12" class="form-control"  placeholder="Enter Driver Name" />							 
						</div>
					</div>
					
				</div>
				</div>
			
				
				<div class="row">
					<div class="form-group">
					
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> 
								<i class="glyphicon glyphicon-calendar"></i>
								</span>
								<input type="date" id='leaveDateFrom12' name="leaveDateFrom12" class="form-control">
							</div>
						</div>

				<div class="col-sm-2" align="right">
							<label class="control-label">Contact No:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
							<!-- 	
							 <select class="form-control" id="type">
	           		 			
	           		 				<option selected="selected" value="">--Select Type--</option>
	           		 				<option value="sick">Sick</option>
	           		 				<option value="casual">Casual</option>
	           		 				<option value="paid">Paid</option>
	           		 			
	           		 			</select> -->
	           		 			<input type="text" id='ContactNo12' name="ContactNo12" maxlength="10" onkeypress="return isNumber(event)"placeholder="Enter ContactNo" class="form-control" />
							</div>
						</div>

						
					</div>
				</div>
				
				
				<div class="row">
					<div class="form-group">
					<h4 style="margin-left: 80vh;margin-top: -5px;">TO</h4>
						<div class="col-sm-3 col-sm-offset-3" style="padding-top: 8px;">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
						 <input type="date" id='leaveDateTo12' name="leaveDateTo12" class="form-control" />
							</div>
							
						</div>
						
							<div class="col-sm-2" align="right">
							<label class="control-label">Pincode:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
							<!-- 	
							 <select class="form-control" id="type">
	           		 			
	           		 				<option selected="selected" value="">--Select Type--</option>
	           		 				<option value="sick">Sick</option>
	           		 				<option value="casual">Casual</option>
	           		 				<option value="paid">Paid</option>
	           		 			
	           		 			</select> -->
	           		 			<input type="text" id='Pincode12' name="Pincode12" maxlength="6" onkeypress="return isNumber(event)" placeholder="Enter Pincode" class="form-control" />
							</div>
						</div>
						
						
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
					
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Fees:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> 
								<i class="glyphicon glyphicon-hand-right"></i>
								</span>
								<input type="text" id="payement12" name="payement12" class ="form-control" onkeypress="return isNumber(event)" placeholder="Enter Fees">
								<!-- <textarea id='description' name="description" class="form-control" placeholder="enter description" onchange="getHrBillingGrid();clearHrCalculation();clearField()" rows="2" cols="10"></textarea> -->
							</div>
						</div>

						<div class="col-sm-2" align="right">
							<label class="control-label">Address:</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
								
									<!-- <input id="approvedBy" name="approvedBy" type="text" class="form-control" placeholder="Approved by"> -->
									<textarea id='Address12' name="Address12" class="form-control" placeholder="Enter Address"  rows="2" cols="10"></textarea>
							</div>
						</div>
</div>
						
					</div>
				</div>
				
				
			<div class="form-group row">
                                 <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input class="ui positive button" name="btn" id="btn" value="Update"  onclick="validationUpdateTransportation3()" style="width: 90px;">save
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
	        
