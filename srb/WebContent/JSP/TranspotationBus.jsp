<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="org.hibernate.Session"%>

<html>

 
<head>

		<script type="text/javascript" src="/srb/staticContent/js/jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" href="/srb/staticContent/css/jquery-ui.min.css">
		<link rel="stylesheet" href="/srb/staticContent/css/ui.jqgrid.css">
		<script type="text/javascript" src="/srb/staticContent/js/jquery.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jquery-ui-min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jquery-ui.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jqueryUi.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jquery.jqgrid.min.js"></script>
		 <script type="text/javascript" src="/srb/staticContent/JS/cashbook.js"></script>
  <script src="/srb/staticContent/JS/Student.js"></script>
   <script src="/srb/staticContent/JS/certificate.js"></script>
   <script src="/srb/staticContent/JS/libraryManagement.js"></script>
      
        <!--  <script src="/srb/staticContent/js/employeeDetails.js"></script> -->
         <script src="/srb/staticContent/JS/Teacher.js"></script>

             <script type="text/javascript">
          		 function employeeLeaveList()
          		 {
          		 	window.location = "TransportationStudentLIst.jsp";
          		 }
          		 /* function editEmployee() {
          			 window.location = "editEmployeeDetails.jsp";
				} */
          		</script> 
          		
          		<script type="text/javascript">
						function Back()
						{

							window.location = "EmployeeDetails.jsp";
							
						}

          		</script>
          		
        <script>
				function lettersonly(input) {
		
					var regex = /[^a-z ]/gi;
					input.value = input.value.replace(regex, "");
		
				}
		
				/* function numbersonly(input) {
					var regex = /[^0-9 .]/gi;
					input.value = input.value.replace(regex, "");
				} */
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

	<div class="container-fluid">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Student Transportation Bus</h2>
			</div>
		</div>

		<div class="row">
			<div class="form-group" align="right">
				<div class="col-sm-offset-6 col-md-5 control-label">
					<div id="date">
						<label id="demo"></label>
						<script>
							   var date = new Date();
							   document.getElementById("demo").innerHTML = date.toDateString();
							</script>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
	

		<form class="form-horizontal" name="tmpd">
		
		
		<%-- <div class="row">
				<div class="form-group">
      				 <label class="col-md-3 control-label" for="employeename">Employee Name<sup>*</sup></label>  
          				<div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
						    <%
						    TeacherInfoDao sdd3 = new TeacherInfoDao();
							List sList4 = sdd3.getAllMainTeacher();
							 %>
							 <input list="employeeNameList" id="fk_employee_id" class="form-control" >
								<datalist id="employeeNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
										TeacherInfoHibernate sup = (TeacherInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherId()%>"
									value="<%=sup.getFirstName()%>  <%=sup.getLastName()%>">
									
									<%
										}
									%>
								</datalist>
							</div>
						</div>

				</div>
			</div> --%>
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
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainClass();
							%>

							<input list="classes" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassNameBonafide()">
							<datalist id="classes">
							 <%
 	                            for (int i = 0; i < sList.size(); i++) {
 		                        ClassInfoHibernate sup = (ClassInfoHibernate) sList.get(i);
                             %>

							<option data-value="<%=sup.getPkClassId()%>"
								value="<%=sup.getClas()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:</label><sup>*</sup>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%-- <%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision();
							     %>

							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivision()">
							<datalist id="division"> <%
									for (int i = 0; i < sList2.size(); i++) {
										DivisionInfoHibernate sup = (DivisionInfoHibernate) sList2.get(i);
								%>

							<option data-value="<%=sup.getPkDivisionId()%>"
								value="<%=sup.getDivision() %>">
								<%
										}
									%>
							
							</datalist> --%>
							
							
							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivision()">
							<datalist id="division"></datalist>
							
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
 			<div class="form-group">
 					
 					<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Student Name:<sup>*</sup>
 					</label> 
           							  <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<select id="studentName" class="form-control">
											</select>
           							 </div>
								</div> 
								<%-- <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						<%
						StudentInfoDao sdd3 = new StudentInfoDao();
							List sList4 = sdd3.getAllMainStudent();
							 %>
							 <input list="studentNameList" id="fk_Student_id" class="form-control">
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
						</div> --%>
						
						<div class="col-sm-2" align="right">
							<label class="control-label">Driver Name:</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
								
									<input id="DriverName" name="DriverName" type="text" class="form-control" placeholder="Enter DriverName">
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
								<input type="date" id='leaveDateFrom' name="leaveDateFrom" class="form-control">
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
	           		 			<input type="text" id='ContactNo' name="ContactNo"  placeholder="Enter ContactNo" class="form-control" />
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
						 <input type="date" id='leaveDateTo' name="leaveDateTo" class="form-control" />
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
	           		 			<input type="text" id='Pincode' name="Pincode"  placeholder="Enter Pincode" class="form-control" />
							</div>
						</div>
						
						
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
					
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Fees:</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> 
								<i class="glyphicon glyphicon-hand-right"></i>
								</span>
								<input type="text" id="payement" name="payement" class ="form-control" placeholder="Enter Fees">
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
									<textarea id='Address' name="Address" class="form-control" placeholder="Enter Address" onchange="getHrBillingGrid();clearHrCalculation();clearField()" rows="2" cols="10"></textarea>
							</div>
						</div>

						
					</div>
				</div>
	
				
			<!-- <div class="container" align="center">
				<input type="button"  class="btn btn-success btn-lg btnn " value="Submit" name="btn" onclick="validationofTransportionDetails()"> 
				<input type="button"  class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
				<input type="button"  value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="employeeLeaveList()">
					
			</div> -->
			
			<div class="form-group row">
                      <div class="col-md-offset-4 col-md-4 btn-center">
                          <div class="ui buttons">
                         	 <input type="button" class="ui positive button" name="btn" onclick="validationofTransportionDetails()" value="Save"/>
                             
                              <div class="or"></div>
                               	<button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                               		<div class="or"></div>
                               	<input type="button" class="ui positive button" onclick="employeeLeaveList()" value="List">
                               	
                              </div>
                              
                              
                      </div>
                     </div>
		</form>
				</div>		
		
	
</body>
</html>

<%@include file="commons/newFooter.jsp"%>
