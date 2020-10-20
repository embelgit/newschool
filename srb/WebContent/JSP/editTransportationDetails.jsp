<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.hibernate.TrasnpotationSchollBus"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.SchoolInfoHibernate"%>
<%@page import="com.srb.dao.SchoolInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
  <script src="/srb/staticContent/JS/certificate.js"></script>	
  <script src="/srb/staticContent/JS/Teacher.js"></script>
  <script src="/srb/staticContent/JS/transportation.js"></script>
	<script type="text/javascript">
	function Back(){
	window.location = "TranspotationBus2.jsp";
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
                            <h1>Edit Transportation Details</h1>
                            <small>Transportation Details</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="Back()"  accesskey="t""> <i class="fa fa-list"></i>Add Transportation Details </a>  
                </div>
            </div> 

            <div class="panel-body panel-form class-list">
                <div class="row">
                	<form class="form-horizontal " name ="edittmpd">
				
				<%-- <div class="row">
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

							<%
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
							
							</datalist>
							
							
							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivision()">
							<datalist id="division"></datalist>
							
						</div>
					</div>
				</div>
			</div> --%>
				
			<div class="row">
 			<div class="form-group">
 					
 					<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Student Name:<sup>*</sup>
 					</label> 
           							  <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											
											<%
												StudentInfoDao sdd3 = new StudentInfoDao();
												List sList4 = sdd3.getAllMainStudentfromtrans();
											 %>
												 <input list="studentNameList" id="studentName" class="form-control" onchange="getTransportationDetails()">
										<datalist id="studentNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
										TrasnpotationSchollBus sup = (TrasnpotationSchollBus) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkTrasnpotationSchollBusId()%>"
<%-- 									value="<%=sup.getFirstName()%> <%=sup.getMiddleName()%> <%=sup.getLastName()%>"> --%>
								value="<%=sup.getStudentName()%>">
									<%
										}
									%>
								</datalist>
											<!-- <select id="studentName" class="form-control" onchange="getTransportationDetails()">
											</select> -->
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
						
						<!-- <div class="col-sm-2" align="right">
						<label class="control-label">Driver Name:</label><sup>*</sup>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
																					
							<input id="DriverName" name="DriverName" type="text" class="form-control" placeholder="Enter DriverName">
							
							
						</div>
					</div> -->
 				
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Driver Name:</label><sup>*</sup>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
																					
							<input id="DriverName" name="DriverName" type="text" class="form-control" placeholder="Enter DriverName">
							
							
						</div>
					</div>


					<!-- <div class="col-sm-2" align="right">
						<label class="control-label">Driver Name:</label><sup>*</sup>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
																					
							<input id="DriverName" name="DriverName" type="text" class="form-control" placeholder="Enter DriverName">
							
							
						</div>
					</div> -->
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
							<label class="control-label">Fees:<sup>*</sup></label>
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
				</div>
			
			
			
			
			
			
			 	
			
			
			
			 
<!-- 		
		 <div class="row">
				<div class="form-group">

				</div>
			</div>
		 -->
			</div>
			
			<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <button class="ui positive button" name="btn" value="Update" onclick="validationUpdateTransportationInfo()">Update</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" value="Clear" >Reset</button>
                                         
                                          </div>
                                </div>
                            </div>
				
		</form>		
                
                </div>
                </div>
                </div>

</body>
</html>				
					
	<%@include file="commons/newFooter.jsp" %>         
			