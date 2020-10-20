
 <%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/Teacher.js"></script>
  	<script type="text/javascript">
	 function Back() {
			 window.location = "Teacher.jsp";
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
                            <h1>Edit Employee Details</h1>
                            <small>Add Employee</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add Employee </a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                
                
                
                <form class="form-horizontal" name="tdvf">
		
		  <div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Personal Details</u></b></h5>
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
						<label class="control-label">Select Employee name:</label>
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
							TeacherInfoDao sdd3 = new TeacherInfoDao();
							List sList4 = sdd3.getAllMainTeacher();
							 %>
							 <input list="teacherNameList" id="fk_teacher_id" class="form-control" onchange="getStudentDetails1()">
								<datalist id="teacherNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
									TeacherInfoHibernate sup = (TeacherInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherId()%>"
									value="<%=sup.getFirstName()%> <%=sup.getMiddleName()%> <%=sup.getLastName()%>">
									<%
										}
									%>
								</datalist>
							</div>
						</div>
				
					<div class="col-sm-2 " align="right">
						<label class="control-label">First Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='firstName' name="firstName" class="form-control" placeholder="Enter first name" />
						</div>
					</div>
				
				</div>
			</div>
			<div class="row">
			<div class=" form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Middle Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='middleName' name="middleName" class="form-control"  placeholder="Middle Name">
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Last Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='lastName' name="lastName" class="form-control"  placeholder="last Name"> 
						</div>
					</div>
					
				</div>
				</div>
				
				
				<div class="row">
		    <div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
				<label class="control-label">Designation<sup>*</sup></label>
			</div>
			<div class="col-md-3">
				<div class="selectContainer">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-user"></i> </span>
						
						<input type="text" id='old_designation' name="old_designation" class="form-control" readonly="readonly" />
								
					</div>
				</div>
			</div>
			
			<div class="col-sm-2 " align="right">
						<label class="control-label">New Designation </label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							
							<input list="designationList" name="designation" id="designation" class="form-control" placeholder="Enter designation" >
								<datalist id="designationList">
						<!-- <select name="designation" class="form-control selectpicker" id="designation" > -->
							<option value="">Select Designation</option>
							<option>Teaching Staff</option>
							<option>Non-Teaching Staff</option>
							<option>Principal</option>
						<!-- </select> -->
						</datalist>
						</div>
					</div>
					
		</div>
		  </div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Old DOB:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='oldDob' name="oldDob" class="form-control"  readonly="readonly" />
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">New DOB:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='dob' name="dob" class="form-control" placeholder="Enter DOB" />
						</div>
					</div>
				</div>
			</div>
			
			
         <div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Qualification Details</u></b></h5>
			        </div>
		       </div>
			</div>
		</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Highest Qualification:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-folder-open"></i>
							</span> 
							<input type="text" id='hquqlification' name="quqlification" class="form-control" placeholder="Enter highest qualification">
					    </div>
					</div>
				
				<div class="col-sm-2" align="right">
						<label class="control-label">Specialization:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-folder-open"></i>
							</span> 
							<input type="text" id='specialization' name="specialization" class="form-control" placeholder="Enter specialization"/>
						</div>
					</div>
				
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Percentage/CGPA<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-folder-open"></i>
							</span> 
							<input type="text" id='percentage' name="percentage" class="form-control" placeholder="Enter Percentage of Marks" />
						</div>
					</div>
				</div>
			</div>

		<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Old Joining Date:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='oldJdate' name="oldJdate" class="form-control"  readonly="readonly" />
						</div>
					</div>
			        <div class="col-sm-2" align="right">
						<label class="control-label">Joining Date:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='jdate' name="jdate" class="form-control" placeholder="Enter Joining Date"/>
					    </div>
					</div>
				</div>
			</div>

			<div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Contact Details</u></b></h5>
			        </div>
		       </div>
			</div>
		</div>
		
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Mobile Number<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-phone"></i>
							</span> 
							<input type="text" id='mobnum' name="mobnum" class="form-control" placeholder="Enter mob number">
					    </div>
					</div>
				

					<div class="col-sm-2" align="right">
						<label class="control-label">Landline No.<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-phone-alt"></i>
							</span>
						    <input type="text" id='landno' name="landno" class="form-control" placeholder="Enter Landline No." />
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Permanent Address<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='perAddress' name="perAddress" class="form-control" placeholder="Permanent address">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Present Address<sup>*</sup>
						
						</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='preAddress' name="preAddress" class="form-control" placeholder="Present address">
					 	</div>
					 </div>
				</div>
			</div>
	
	<div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Payment Details</u></b></h5>
			        </div>
		       </div>
			</div>
		</div>
		
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Account Number</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-phone"></i>
							</span> 
							<input type="text" id='accountNumber' name="accountNumber" class="form-control" placeholder="Enter Account number">
					    </div>
					</div>
				

					<div class="col-sm-2" align="right">
						<label class="control-label">Bank Name</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='bankName' name="bankName" class="form-control" placeholder="Enter Bank Name" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">IFSC Code</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='ifsc' name="ifsc" class="form-control" placeholder="Enter IFSC">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Aadhar Number<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='aadharNumber' name="preAddress" class="form-control" placeholder="Enter Aadhar Number">
					 	</div>
					 </div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">PAN Number<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='panNumber' name="panNumber" class="form-control" placeholder="Enter PAN Number">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">EPF Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='epfNumber' name="epfNumber" class="form-control" placeholder="Enter EPF Number">
					 	</div>
					 </div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">PT Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='ptNumber' name="ptNumber" class="form-control" placeholder="Enter PT Number">
					 	</div>
					 </div>
					 
					 <div class="col-sm-2 " align="right">
						<label class="control-label">Salary:</label>
					</div>
					 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='Salary' name="Salary" class="form-control" placeholder="Enter Salary">
					 	</div>
					 </div>
		       </div>
	      </div>

			  <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" onclick="updateTeacherInfo()" >Save</button>
                                       
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
	        