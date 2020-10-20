<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <script src="/srb/staticContent/JS/School.js"></script>
<script type="text/javascript">

	 function editSchool() {
			 window.location = "editSchoolDetail.jsp";
	}
	function schoolList(){
		 window.location = "listForSchool.jsp";
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
		
			


</head>
<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>School Detail</h1>
                            <small>Add School</small> 
                        </div>
                    </div>
                </section>
                <!-- Main content -->
                <div class="content"> 

                    <!-- alert message -->
                                        
                                        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="schoolList()"  accesskey="t""> <i class="fa fa-list"></i>  School List </a>  
                </div>
			
	      </div>	
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                     
                 <form class="form-horizontal" name="schoolFormName">
		
		<div class="row">
				<div class="form-group">
					<div class="col-md-2 " align="right">
						<label class="control-label">School Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='schoolName' name="schoolName" class="form-control" placeholder="Enter school Name" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>

				<div class="col-md-3 " align="right">
						<label class="control-label">Sanstha Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<input type="text" id='sansthaName' name="sansthaName" class="form-control" placeholder="Enter Sanstha Name" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
					
					<!-- <div class="col-md-3 " align="right">
						<label class="control-label">School UDISE Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-home"> </i>
							</span> 
							<input type="text" id='schoolUdiseNumber' name="schoolUdiseNumber" class="form-control" placeholder="Enter School UDISE Number" />
						</div>
					</div> -->
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					
					
					<div class="col-md-2" align="right">
						<label class="control-label">School Registrations Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='schoolRegNumber' name="schoolRegNumber" class="form-control" placeholder="Enter School Registrations Number" />
						</div>
					</div>

					<!-- <div class="col-md-3" align="right">
						<label class="control-label">School Registrations Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='schoolRegNumber' name="schoolRegNumber" class="form-control" placeholder="Enter School Registrations Number" />
						</div>
					</div> -->
					<div class="col-md-3 " align="right">
						<label class="control-label">School UDISE Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-home"> </i>
							</span> 
							<input type="text" id='schoolUdiseNumber' name="schoolUdiseNumber" class="form-control" placeholder="Enter School UDISE Number" />
						</div>
					</div>
					
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group">
				<div class="col-md-2" align="right">
						<label class="control-label">City/Village:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-map-marker"></i>
							</span>
                            <input type="text" id='city' name="city" class="form-control"  placeholder="Enter city" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
					<div class="col-md-3 " align="right">
						<label class="control-label">Taluka:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-map-marker"> </i>
							</span>
							<input type="text" id='tq' name="tq" class="form-control" placeholder="Enter tq" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>

					
				</div>
			</div>
			
			 <div class="row">
				<div class="form-group">
				<div class="col-md-2" align="right">
						<label class="control-label">District:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-map-marker"></i>
							</span> 
							<input type="text" id='district' name="district" class="form-control" placeholder="Enter district" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
					<div class="col-md-3 " align="right">
						<label class="control-label">State:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-map-marker"></i>
							</span> 
							<input type="text" id='state' name="state" class="form-control" placeholder="Enter state" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>

					
				</div>
			</div>
			
			 <div class="row">
				<div class="form-group">
				<div class="col-md-2" align="right">
						<label class="control-label">Pincode:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-map-marker"></i>
							</span>
							<input type="text" id='pinCode' name="pinCode" class="form-control" maxlength="6" placeholder="pinCode" onkeypress="return isNumber(event)" />
						</div>
					</div>
					<div class="col-md-3 " align="right">
						<label class="control-label">Institute Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='instituteName' name="instituteName" class="form-control" placeholder="Enter institute Name" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>

					
				</div>
			</div>
			
			 <div class="row">
				<div class="form-group">
					<!-- <div class="col-md-2 " align="right">
						<label class="control-label">School UDISE Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-home"> </i>
							</span> 
							<input type="text" id='schoolUdiseNumber' name="schoolUdiseNumber" class="form-control" placeholder="Enter School UDISE Number" />
						</div>
					</div> -->
					<div class="col-md-2" align="right">
						<label class="control-label">Contact Number:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-phone"></i>
							</span>
							 <input type="text" id='contactP' name="contactP" class="form-control" maxlength="10" placeholder="contact Number" onkeypress="return isNumber(event)" />
						</div>
					</div>
					
					<div class="col-md-3" align="right">
						<label class="control-label">Address:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-map-marker"> </i>
							</span> 
							<input type="text" id='address' name="address" class="form-control" placeholder="Enter address" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
			       </div>
				</div>
				
			</div>             
                            <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" onclick="addSchoolInfo()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Edit" id="listBtn" onclick="editSchool()">Edit</button>
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
                </div> <!-- /.content -->
            </div>


</body>
</html>				
					
	 <%@include file="commons/newFooter.jsp" %>      
			