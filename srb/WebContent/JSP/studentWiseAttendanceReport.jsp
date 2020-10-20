<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.dao.ExamInfoDao"%>
<%@page import="com.srb.hibernate.ExamNameEntryHibernate"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>


<!-- For datatable to pdf,print,excel etc conversion -->
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
 --> <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>

<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">
         <script type="text/javascript" src="/srb/staticContent/y_js/studentAttendance.js"></script>

</head>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Student Attendance Report</h1>
                            <small>Report</small> 
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
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>Class List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="divList()" accesskey="t""> <i class="fa fa-list"></i>Division List </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		

		<ul class="nav nav-tabs">
	    	<li class="active"><a data-toggle="tab" href="#classwiseId"><h4 style="color:blue">Class Wise</h4></a></li>
	    	<li><a data-toggle="tab" href="#studentWiseId"><h4 style="color:blue">Student Wise</h4></a></li>
		</ul>
		
</div>

<div class="tab-content" style="float: left">
<!-- Class Name wise  -->
<div id="classwiseId" class="tab-pane fade in active">
		<ul class="nav nav-tabs">
	    	<li class="active"><a data-toggle="tab" href="#singleclasswiseId"><h4 style="color:blue">Datewise</h4></a></li>
	    	<li><a data-toggle="tab" href="#rangeclasswiseId"><h4 style="color:blue">Range</h4></a></li>
		</ul>
		<div class="tab-content" style="float: left">
		<div id="singleclasswiseId" class="tab-pane fade in active">
		<div class="row"></div>
		<form class="form-horizontal" name="classWiseAttendance">
		
		 		<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
								ClassInfoDao sdd_for_class = new ClassInfoDao();
								List sList_for_class = sdd_for_class.getAllMainClass();
							%>

							<input list="classes_for_class" id="fk_class_id_for_class" class="form-control">
							<datalist id="classes_for_class">
							 <%
 	                            for (int i = 0; i < sList_for_class.size(); i++) {
 		                        ClassInfoHibernate sup_for_class = (ClassInfoHibernate) sList_for_class.get(i);
                             %>

							<option data-value="<%=sup_for_class.getPkClassId()%>"
								value="<%=sup_for_class.getClas()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>
					<div class="col-md-2 " align="right">
						<label class="control-label">Select Date:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span> 
							<input type="date" id='classWiseFirstDate' name="classWiseFirstDate" class="form-control" >
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-sm-3 col-sm-offset-2" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="classWiseStudentAttendance()" value="Search for Present Student" />
								</div>
								 <div class="col-sm-2" >
				<input type="button" id="backupBtn" name="save" class="btn btn-lg btn-success" onclick="onClickAttendanceTablecopy()" value="Click Here For Attendance Backup" />
			</div>
					
				
					<!-- <div class="col-sm-2 col-sm-offset-2" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-danger btn-md button_hw button_margin_right"
								onclick="sendMessageToAbsentStudentParent()" value="Click Here to Send Message To Absent Student Parents" />
					</div> -->
	</div>
	</div>
	
		<div class="table-responsive">
					<table id="classWiseAttendance" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>Student Attendance Id</th>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Date And Time</th>
							</tr>
						</thead>
					</table>
				</div>
</form>
</div>

<!-- Between two dates -->
<div id="rangeclasswiseId" class="tab-pane">
<div class="row"></div>
		<form class="form-horizontal" name="classWiseAttendance">
		 <!-- <div class="row form-group">
		 <div class="col-sm-2 col-sm-offset-7" >
				<input type="button" id="backupBtn" name="save" class="btn btn-lg btn-success" onclick="onClickAttendanceTablecopy()" value="Click Here For Attendance Backup" />
			</div>
		</div> -->
		<div class="row"></div>
		 		<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
								ClassInfoDao sdd_for_class_range = new ClassInfoDao();
								List sList_for_class_range = sdd_for_class_range.getAllMainClass();
							%>

							<input list="classes_for_class_range" id="fk_class_id_for_class_range" class="form-control">
							<datalist id="classes_for_class_range">
							 <%
 	                            for (int i = 0; i < sList_for_class_range.size(); i++) {
 		                        ClassInfoHibernate sup_for_class_range = (ClassInfoHibernate) sList_for_class_range.get(i);
                             %>

							<option data-value="<%=sup_for_class_range.getPkClassId()%>"
								value="<%=sup_for_class_range.getClas()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>
					<div class="col-md-2 " align="right">
						<label class="control-label">Start Date:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span> 
							<input type="date" id='classWiseFirstDate_range' name="classWiseFirstDate_range" class="form-control" >
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
				<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">End Date:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span> 
							<input type="date" id='secondDateClasswise_range' name="secondDateClasswise_range" class="form-control" >
						</div>
					</div>
					<div class="col-sm-2 " >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="classWiseStudentAttendanceBetweenTwoDate()" value="Search for Present Student" />
					</div>
					<!-- <div class="col-sm-2 col-sm-offset-2" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-danger btn-md button_hw button_margin_right"
								onclick="sendMessageToAbsentStudentParent()" value="Click Here to Send Message To Absent Student Parents" />
					</div> -->
	</div>
	</div>
	
		<div class="table-responsive">
					<table id="twoDateClassWiseAttendance" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>Student Attendance Id</th>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Date And Time</th>
							</tr>
						</thead>
					</table>
				</div>
</form>

</div>
</div>
</div>
<!-- 	For student Name entry -->
	<div id="studentWiseId" class="tab-pane">
		<div class="row"></div>
		<form class="form-horizontal">
		 		<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
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

							<input list="classes" id="fk_class_id1" class="form-control" onchange="getStudentNameAsPerClassNameForAttendance()">
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
					<label class="col-md-2 control-label"  align="right">Student Name:</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<select id="studentName" class="form-control" >
											</select>
           							 </div>
								</div>

				</div>
			</div>
			
			<div class="row form-group">
				<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Select Date:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span> 
							<input type="date" id='fisdate' name="fisdate" class="form-control" >
						</div>
					</div>
					<div class="col-sm-2" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="studentAttendanceReportForSingleDate()" value="Search" />
					</div>
			</div>

			<div class="table-responsive">
					<table id="classResult" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>Student Attendance Id</th>
								<th>Date And Time</th>
							</tr>
						</thead>
					</table>
				</div>

	</form>	
	</div>
	<!-- Student name wise  -->
	
</div>
</div>		
	<%@include file="commons/newFooter.jsp" %>