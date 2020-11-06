<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.dao.StudentInfoDao"%>

<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

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
          		 function editTransportation() {
          			window.location = "editTransportationDetails.jsp";
				 } 
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

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Student Transportation Bus</h1>
                            <small>Student Transportation Bus</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
               <!--  <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>Class List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="divList()" accesskey="t""> <i class="fa fa-list"></i>Division List </a>  
                </div> -->
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="employeeLeaveList()"  accesskey="t""> <i class="fa fa-list"></i>  Student Transportation List </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		
			<form class="form-horizontal" method="post" enctype="multipart/form-data" name="tmpd">
			
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
           							  <!-- <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<select id="studentid" class="form-control">
											</select>
           							 </div>
								</div> --> 
								 <div class="col-md-3">
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
						</div>
						
						<div class="col-sm-2" align="right">
							<label class="control-label">Driver Name:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
								
									<input id="DriverName" name="DriverName" type="text" class="form-control" onkeypress="return isAlphabetsWithSpace(event)" placeholder="Enter DriverName">
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
	           		 			<input type="text" id='ContactNo' name="ContactNo" maxlength="10" onkeypress="return isNumber(event)"placeholder="Enter ContactNo" class="form-control" />
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
	           		 			<input type="text" id='Pincode' name="Pincode" maxlength="6" onkeypress="return isNumber(event)" placeholder="Enter Pincode" class="form-control" />
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
								<input type="text" id="payement" name="payement" class ="form-control" onkeypress="return isNumber(event)" placeholder="Enter Fees">
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
                               	<button class="ui positive button"  type="button" value="Edit" id="listBtn" onclick="editTransportation()">Edit</button>
                               	
                              </div>
                              
                              
                      </div>
                     </div>
		</form>
	
	</div>
</body>
</html><%@include file="commons/newFooter.jsp" %> 