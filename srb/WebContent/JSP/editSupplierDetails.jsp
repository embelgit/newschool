<%@page import="com.srb.bean.StoreMAnagementBean"%>
<%@page import="com.srb.dao.StoreManagementDAO"%>
<%@page import="com.srb.bean.GetSupplierDetails"%>
<%@page import="com.srb.dao.SupplierDetailsDao"%> 
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/supplierDetails.js"></script>
  	<script type="text/javascript">
	 function Back() {
			 window.location = "store_management.jsp";
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
                            <h1>Edit Supplier Details</h1>
                            <small>edit</small>
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
                
                
                
                <form class="form-horizontal" name="sde">
		
		  <div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Supplier Details</u></b></h5>
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
		  
		  
 			<div class="row">
				<div class="form-group">
				<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Select Supplier Name:</label>
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
						SupplierDetailsDao dao=new SupplierDetailsDao();
					List list19=dao.getSupplierList();
							%>
							 <input list="SupplierList" id="supplier" class="form-control" onchange="getSupplierDetails()"/>
								<datalist id="SupplierList">
								 <%
									for (int i = 0; i < list19.size(); i++) {
										GetSupplierDetails gd=(GetSupplierDetails)list19.get(i);
								 %>

								<option data-value="<%=gd.getSupId()%>"
									value="<%=gd.getDealerName()%>">
									<%
										}
									%>
								</datalist>
							</div>
						</div>
				
					<div class="col-sm-2 " align="right">
						<label class="control-label">Person Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='prsn' name="prsn" class="form-control" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
				
				</div>
			</div>
			<div class="row">
			<div class=" form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Contact No:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='cntno' name="cntno" class="form-control" maxlength=10 placeholder="Enter Contact" onkeypress="return isNumber(event)"  />
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">LandLine</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='lndline' name="lndline" class="form-control" maxlenght=12 placeholder="Enter a Landline Number" onkeypress="return isNumber(event)"/> 
						</div>
					</div>
					
				</div>
				</div>
			
			
			<div class="row">
			<div class=" form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">EmailId:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='emlid' name="emlid" class="form-control"  placeholder="Enter EmailId"  />
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">City<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='city' name="city" class="form-control"  placeholder="Enter City" onkeypress="return isAlphabetsWithSpace(event)" /> 
						</div>
					</div>
					
				</div>
				</div>
				
				
				<div class="row">
		    <div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
				<label class="control-label">Address:</label>
			</div>
			<div class="col-md-3">
				<div class="selectContainer">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-user"></i> </span>
						
						<input type="text" id='address' name="address" class="form-control" placeholder="Enter a address" onkeypress="return isAlphabetsWithSpace(event)" />
								
					</div>
				</div>
			</div>
			
					
					<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" id="btn" value="update" onclick="supplierDetail1()" />update</button>
                                       
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
	        