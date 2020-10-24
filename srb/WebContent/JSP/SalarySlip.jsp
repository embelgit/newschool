
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
                        <div class="header-icon"><i class="fa fa-print"></i></div>
                        <div class="header-title">
                            <h1>Salary Slip</h1>
                            <small>Print Salary Slip</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">

            <div class="panel-body panel-form">
                <div class="row">
                
                
                
                <form class="form-horizontal" name="tdvf">
		  
		  
 			<div class="row">
				<div class="form-group">
				<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Employee Id:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							<input list="division" id="fk_teacher_id" class="form-control" onchange="getStudentDetails1()">
							<!-- <datalist id="division"></datalist> -->
							<!-- <select class="form-control input-md" id="fk_teacher_id"  name="fk_teacher_id" class="form-control" onchange="getStudentDetails1()"  placeholder="Teacher Name">
									</select> -->
									</div>
									</div>
				<div class="col-md-2" align="right">
						<label class="control-label">Employee name:<sup>*</sup></label>
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
								<%-- <datalist id="teacherNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
									TeacherInfoHibernate sup = (TeacherInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherId()%>"
									value="<%=sup.getFirstName()%> <%=sup.getMiddleName()%> <%=sup.getLastName()%>">
									<%
										}
									%>
								</datalist> --%>
							</div>
						</div>
				
				</div>
			</div>
			
			

			<div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
				<label class="control-label">Designation:<sup>*</sup></label>
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
							 <input type="date" id='salaryDate' name="salaryDate" class="form-control" />
						</div>
					</div>
					
					<label class="col-md-2 control-label" for="paymentMode"> Payment Type<sup>*</sup></label>  
	           		       <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentMode2">
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										<option value="credit">Credit Card</option>
										<option value="card">Dabit Card</option>
										<option value="Onlinepayment">Online Payment</option>
								</select>	
	           				</div>
						</div>
					
				</div>
			</div>
						
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Salary Amount:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='ptNumber' name="ptNumber" class="form-control" placeholder="Enter Amount">
					 	</div>
					 </div>
					 
					 <div class="col-sm-2 " align="right">
						<label class="control-label">Amount in words:<sup>*</sup></label>
					</div>
					 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='Salary' name="Salary" class="form-control" placeholder="Enter Words Amount">
					 	</div>
					 </div>
		       </div>
	      </div>
	                    <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" onclick="leavingCertificateGenerator()" value="Print">
                                       
                                        <div class="or"></div>
                                         <button type="reset" onclick="location.reload()" class="ui button">Reset</button>
                                           
                                        </div>
                                </div>
                            </div>
			</form>
                
                </div>
                </div>
                </div>

</html>				
		<%@include file="commons/newFooter.jsp" %> 			
	        