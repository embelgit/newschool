<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoLeaveHibernate" %>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="org.hibernate.Session"%>

<html>

 
<head>

		<!-- <script type="text/javascript" src="/srb/staticContent/js/jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" href="/srb/staticContent/css/jquery-ui.min.css">
		<link rel="stylesheet" href="/srb/staticContent/css/ui.jqgrid.css">
		<script type="text/javascript" src="/srb/staticContent/js/jquery.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jquery-ui-min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jquery-ui.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jqueryUi.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jquery.jqgrid.min.js"></script> -->
      
        <!--  <script src="/srb/staticContent/js/employeeDetails.js"></script> -->
         <script src="/srb/staticContent/JS/Teacher.js"></script>

             <script type="text/javascript">
          		 function employeeLeaveList()
          		 {
          		 	window.location = "EmployeeLeaveList.jsp";
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


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Employee Leave Approval</h1>
                            <small>Employee Leave </small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
             
            </div> 

            <div class="panel-body panel-form">
                <div class="row">

	<div class="container-fluid">
	
	

		<form class="form-horizontal" name="empd">
		
		
			<div class="row">
				<div class="form-group">
      				 <label class="col-md-3 control-label" for="employeename">Select Employee Name<sup>*</sup></label>  
          				<div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
						    <%
						    TeacherInfoDao sdd4 = new TeacherInfoDao();
							List sList5 = sdd4.getAllMainTeachertoedit();
							 %>
							 <input list="employeeNameList1" id="fk_employee_id1" class="form-control" onchange="getteacherdett()">
								<datalist id="employeeNameList1">
								 <%
									for (int i = 0; i < sList5.size(); i++) {
										TeacherInfoLeaveHibernate sup = (TeacherInfoLeaveHibernate) sList5.get(i);
								 %>

	 
	 							<option data-value="<%=sup.getPkTeacherLeaveId()%>"
									value="<%=sup.getTeacher()%>">
		
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
      				 <label class="col-md-3 control-label" for="employeename"> New Employee Name<sup>*</sup></label>  
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
								<input type="text" id='oldleaveDateFrom' name="oldleaveDateFrom1" class="form-control" readonly="readonly" >
							</div>
						</div>

				<div class="col-sm-2" align="right">
							<label class="control-label">Leave Type:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
											 <input type="text" id='oldtype' class="form-control"  readonly="readonly" />
							 
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
						 <input type="text" id='oldleaveDateTo' name="oldleaveDateTo" class="form-control" readonly="readonly" />
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
								<input type="date" id='leaveDateFrom1' name="leaveDateFrom1" class="form-control">
							</div>
						</div>

				<div class="col-sm-2" align="right">
							<label class="control-label">Leave Type:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
								
							 <select class="form-control" id="type1">
	           		 			
	           		 				<option selected="selected" value="">--Select Type--</option>
	           		 				<option value="sick">Sick</option>
	           		 				<option value="casual">Casual</option>
	           		 				<option value="paid">Paid</option>
	           		 			
	           		 			</select>
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
						 <input type="date" id='leaveDateTo1' name="leaveDateTo1" class="form-control" />
							</div>
							
						</div>
						
						
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
					
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Description:</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> 
								<i class="glyphicon glyphicon-hand-right"></i>
								</span>
								<textarea id='description1' name="description1" class="form-control" placeholder="enter description"  rows="2" cols="10"></textarea>
								<!-- <textarea id='description' name="description" class="form-control" placeholder="enter description" onchange="getHrBillingGrid();clearHrCalculation();clearField()" rows="2" cols="10"></textarea> -->
							</div>
						</div>

				<div class="col-sm-2" align="right">
							<label class="control-label">Approved By:</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
								
									<input id="approvedBy1" name="approvedBy1" type="text" class="form-control" placeholder="Approved by">
							</div>
						</div>

						
					</div>
				</div>
				</div>
				
				


			<!-- <div class="container" align="center">
				<input type="button"  class="btn btn-success btn-lg btnn " id ="btn" value="Submit" name="btn" onclick="validationEmployeeLeaveDetails()"> 
				<input type="button"  class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
				<input type="button"  value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="employeeLeaveList()">
				
				
				
				
			</div> -->
			
			<div class="form-group row">
                      <div class="col-md-offset-4 col-md-4 btn-center">
                          <div class="ui buttons">
                         	 <input type="button" class="ui positive button" name="btn" onclick="updateEmployeeLeaveDetails()" value="Save"/>
                             
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
