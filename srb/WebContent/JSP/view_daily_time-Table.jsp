<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
<title>Daily Time Table Report</title>

<!-- For datatable to pdf,print,excel etc conversion --><!-- 
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>  -->
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>

<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

         <script type="text/javascript" src="/srb/staticContent/JS/timeTable.js"></script>
</head>


<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/timetable.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Daily Time Table</h1>
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
                <!-- <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>Class List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="divList()" accesskey="t""> <i class="fa fa-list"></i>Division List </a>  
                </div> -->
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
	            
		<ul class="nav nav-tabs">
	    	<li class="active"><a data-toggle="tab" href="#home"><h4 style="color:blue">Class Wise</h4></a></li>
	    	<li><a data-toggle="tab" href="#twoDates"><h4 style="color:blue">Day Wise</h4></a></li>
		</ul>
		
		
	
<div class="tab-content" style="float: left">
<!-- 	For class Name entry -->
	<div id="home" class="tab-pane fade in active">
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
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

							<%
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainClass();
							%>

							<input list="classes" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassNameBalanceReport()">
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
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

			<%-- 				<%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision();
							     %>

							<input list="division" id="fk_division_id" class="form-control" onblur="getStudentDetails()">
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
							
							
							<input list="division" id="fk_division_id" class="form-control" onblur="getStudentDetails()">
							<datalist id="division"></datalist>
							
						</div>
					</div>
				</div>
			</div>
				
				
			
			<div class="row">
				<div class="form-group">
					  <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Search" onclick="viewDailyTimeTable()" >Save</button>
                                       
                                </div>
                            </div>
				</div>
			</div>
			<div	class="table-responsive">
					<table id="studentOne" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>Day</th>
								<th>Start Time</th>
								<th>End Time</th>
								<th>Subject Name</th>
								<th>Teacher Name</th>
							</tr>
						</thead>
						<!--  <tfoot>
							 <tr>
								<th colspan="7" style="text-align: right">Total Rs:</th>
								<th></th>
							</tr> 
						</tfoot> -->
					</table>
				</div>

			
		</form>
	</div>
	
	<!-- DayWise -->
		<div id="twoDates" class="tab-pane">
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
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

							<%
								ClassInfoDao classDao = new ClassInfoDao();
								List sList1 = classDao.getAllMainClass();
							%>

							<input list="classDayWise" id="fk_class_id_day_wise" class="form-control" onchange="getDivisionNameByClassNameForDayWise()">
							<datalist id="classDayWise">
							 <%
 	                            for (int i = 0; i < sList1.size(); i++) {
 		                        ClassInfoHibernate sup1 = (ClassInfoHibernate) sList1.get(i);
                             %>

							<option data-value="<%=sup1.getPkClassId()%>"
								value="<%=sup1.getClas()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%-- <%
								DivisionInfoDao divDao = new DivisionInfoDao();
								List divList2 = divDao.getAllMainDivision();
							     %>

							<input list="division_day_wise" id="fk_division_id_day_wise" class="form-control" onblur="getStudentDetails()">
							<datalist id="division_day_wise"> <%
									for (int i = 0; i < divList2.size(); i++) {
										DivisionInfoHibernate supDiv = (DivisionInfoHibernate) divList2.get(i);
								%>

							<option data-value="<%=supDiv.getPkDivisionId()%>"
								value="<%=supDiv.getDivision() %>">
								<%
										}
									%>
							
							</datalist> --%>
							
							<input list="division_day_wise" id="fk_division_id_day_wise" class="form-control" onblur="getStudentDetails()">
							<datalist id="division_day_wise"></datalist>
							
						</div>
					</div>
				</div>
			</div>
			<div class="row form-group">
				<div class="col-md-2 col-md-offset-1" align="right">
						<label class="control-label">Select day:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<select class="col-sm-12" id="day" style="height: 30;">
  								<option value="Monday">Monday</option>
								 <option value="Tuesday">Tuesday</option>
								 <option value="Wednesday">Wednesday</option>
								 <option value="Thursday">Thursday</option>
								  <option value="Friday">Friday</option>
								 <option value="Saturday">Saturday</option>
								  <option value="Sunday">Sunday</option>
							</select> 
						</div>
					</div>	
			
					<div class="col-sm-2 col-md-offset-1" >
						
								 <input type="button" class="ui positive button" name="btn" value="Search" onclick="viewTableTimeAsPerDay()" ></button>
                                       
					</div>
				</div>
				
				
			
			<div	class="table-responsive">
					<table id="dayWise" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>Day</th>
								<th>Start Time</th>
								<th>End Time</th>
								<th>Subject Name</th>
								<th>Teacher Name</th>
							</tr>
						</thead>
						<!--  <tfoot>
							 <tr>
								<th colspan="7" style="text-align: right">Total Rs:</th>
								<th></th>
							</tr> 
						</tfoot> -->
					</table>
				</div>

			
		</form>
	</div>
</div>
	<%@include file="commons/newFooter.jsp" %>		