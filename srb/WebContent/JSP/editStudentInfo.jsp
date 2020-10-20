<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
        <script src="/srb/staticContent/JS/Student.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "Student.jsp";
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


</head>
<body>


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><i class="pe-7s-world"></i></div>
                        <div class="header-title">
                            <h1>Edit Student Details</h1>
                            <small>Edit Student</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add Student</a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                


		<form class="form-horizontal" name="updatesdtv">
		<div class="row">
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Select Student Name: <sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						<%
						StudentInfoDao sdd3 = new StudentInfoDao();
							List sList4 = sdd3.getAllMainStudent();
							 %>
							 <input list="studentNameList" id="fk_Student_id" class="form-control" onchange="getStudentDetails()">
								<datalist id="studentNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
										StudentInfoHibernate sup = (StudentInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkStudentId()%>"
									value="<%=sup.getFirstName()%> <%=sup.getMiddleName()%> <%=sup.getLastName()%>">
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
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">General Registration Number: <sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='generalRegNumber' name="generalRegNumber" class="form-control" placeholder="Enter General Reg Number" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Serial Number: <sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='studentSerialNumber' name="studentSerialNumber" class="form-control"  placeholder="Enter Student Serial Number">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Student Roll Number: <sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='rollNumber' name="rollNumber" class="form-control" placeholder="Enter Roll Number" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Aadhar Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='aadharNumber' name="aadharNumber" class="form-control"  placeholder="Enter Aadhar Number">
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">First Name: <sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='firstName' name="firstName" class="form-control" placeholder="Enter first name" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Middle Name: <sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='middleName' name="middleName" class="form-control"  placeholder="Enter Middle Name">
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Last Name: <sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='lastName' name="lastName" class="form-control"  placeholder="Enter last Name"> 
						</div>
					</div>
						<div class="col-sm-2" align="right">
						<label class="control-label">Contact No.: <sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon  glyphicon-earphone"></i>
							</span>
						    <input type="text" id='contactNo' name="contactNo" class="form-control" placeholder="Enter Contact No.">
					 	</div>
					 </div>
					</div>
					</div>
				<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Gender:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='oldGender' class="form-control"  readonly="readonly" />
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">Select Gender:</label>
					</div>
					<div class="col-md-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i>
									</span>
									 <select name="department" class="form-control selectpicker"  id='gender'>
									<option value="">Gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>
						</div>
					</div>
					</div>
				</div>
				
				<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Old Date Of Birth:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text" id='oldDob' name="oldDob" class="form-control"  readonly="readonly" />
						</div>
					</div>
					<div class="col-sm-2" align="right">
					<label class="control-label">Date Of Birth:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='dob'  class="form-control"  placeholder="Enter date of birth">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Old Date Of Admission:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text" id='oldAdmissionDate' name="oldAdmissionDate" class="form-control"  readonly="readonly" />
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">Date Of Admission:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span> 
							<input type="date" id='doa' name="doa" class="form-control"  placeholder="Enter Date of admission">
						</div>
					</div>

					
					
				</div>
			</div>

			<div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Class:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='oldClass' class="form-control"  readonly="readonly" />
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">Select Class Name: <sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
					<%
						ClassInfoDao sdd = new ClassInfoDao();
						List sList = sdd.getAllMainClass();
					%>

					<input list="clas" id="fk_class_id1" class="form-control">
					<datalist id="clas">

						<%
							for (int i = 0; i < sList.size(); i++) {
								ClassInfoHibernate sup = (ClassInfoHibernate) sList.get(i);
						%>

						<option data-value="<%=sup.getPkClassId()%>"
							value="<%=sup.getClas() %>">
							<%
								}
							%>
						
					</datalist>
				</div>
			</div>
			</div>
			</div>
			<div class="row ">
			<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Division:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='oldDivision' class="form-control"  readonly="readonly" />
						</div>
					</div>
			        <div class="col-sm-2" align="right">
						<label class="control-label">Select Division: <sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
									
					<%
						DivisionInfoDao sdd1 = new DivisionInfoDao();
						List sList2 = sdd1.getAllMainDivision();
					%>

					<input list="division" id="fk_division_id" class="form-control">
					   <datalist id="division">

						<%
							for (int i = 0; i < sList2.size(); i++) {
								DivisionInfoHibernate sup = (DivisionInfoHibernate) sList2.get(i);
						%>

						<option data-value="<%=sup.getPkDivisionId()%>"
							value="<%=sup.getDivision() %>">
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
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Country:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='country' name="country" class="form-control" placeholder="Enter country">
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">State:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='state' name="state" class="form-control" placeholder="Enter state">
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Pin Code:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
						    <input type="text" id='pinCode' name="pinCode" class="form-control" placeholder="Enter pinCode">
						</div>
					</div>



					<div class="col-sm-2" align="right">
						<label class="control-label">Previous School Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='preSchoolN' name="preSchoolN" class="form-control" placeholder="Enter Previous school name">
						</div>
					</div>

				</div>
			</div>

			

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Father Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
						    <input type="text" id='fatherName' name="fatherName" class="form-control" placeholder="Enter Father name">
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Mother Name:</label>
					</div>
                     <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
						    <input type="text" id='motherName' name="motherName" class="form-control" placeholder="Enter Mother name">
					 	</div>
					 </div>
				</div>
			</div>
		<div class="row">
			<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Siblings:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='oldSiblings' class="form-control"  readonly="readonly" />
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">Select Siblings:</label>
					</div>
					<div class="col-md-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-hand-right" ></i>
								</span>
								<select id='siblings'  name="siblings1" class="form-control selectpicker">
									<option value="">Number Of Brother/Sister</option>
									<option>1</option>
									<option>2</option>
									<option>more than 2</option>
								</select> 
							</div>
						</div>
					</div>
				</div>
		</div>
		

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Permanent Address:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='permanentAddress' name="perAddress" class="form-control" placeholder="Enter Permanent address">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Present Address:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='previousAddress' name="preAddress" class="form-control" placeholder="Enter Present address">
					 	</div>
					 </div>
				</div>
			</div>
			<div class="row">
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Annual Fee(INR):</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							Rs
							</span>
						    <input type="text" id='annualFee' name="annualFee" class="form-control" placeholder="Enter Annual Fee">
					 	</div>
					 </div>
					  <div class="col-sm-2" align="right">
						<label class="control-label">Student serial ID No:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='studId' name="studId" class="form-control" placeholder="Enter Student serial ID No">
						</div>
					</div>
			</div>
			</div>
			 <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Area:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='area' name="area" class="form-control" placeholder="Enter Area">
						</div>
					</div>
					
					 <div class="col-sm-2" align="right">
						<label class="control-label">Previous School UDIAS Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='preSchoolUdias' name="preSchoolUdias" class="form-control" placeholder="Enter Previous School UDIAS Number">
						</div>
					</div>
			    </div>
			 </div>
			 
			
<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" onclick="updateStudentInformation()" >Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         </div>
                                </div>
                            </div>

</form>

</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 