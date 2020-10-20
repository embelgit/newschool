<%@page import="com.srb.hibernate.ExamInfoHibernate"%>
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

<title>Exam Result Report</title>
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
<!-- <script type="text/javascript" src="/srb/staticContent/JS/cashbook.js"></script> -->

         <script type="text/javascript" src="/srb/staticContent/JS/exam.js"></script>
</head>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/result.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Exam Result Report</h1>
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
	    	<li><a data-toggle="tab" href="#stud"><h4 style="color:blue">Student Wise</h4></a></li>
		</ul>
		
<div class="tab-content" style="float: left">
<!-- 	For class Name entry -->
	<div id="home" class="tab-pane fade in active">
		<div class="row"></div>
		<form class="form-horizontal">
		<div class="row">
 			 		<div class="row form-group">
 					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Exam Name<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
							ExamInfoDao ename = new ExamInfoDao();
								List examList = ename.getAllExamNames();
							%>

							<input list="examNameId" id="fk_examName_id" class="form-control">
							<datalist id="examNameId">
							 <%
 	                            for (int i = 0; i < examList.size(); i++) {
 	                            	ExamInfoHibernate ex = (ExamInfoHibernate) examList.get(i);
                             %>

							<option data-value="<%=ex.getPkExamId()%>"
								value="<%=ex.getExamName()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>
			<!-- 		<div class="col-md-2 " align="right">
						<label class="control-label">Academic Year:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='academicYear' list="academicYear1" name="academicYear" class="form-control">
                                   <datalist id="academicYear1">
                                     <option data-value="2015-2016" value="2015-2016">
                                     <option data-value="2006-2010" value="2016-2017">
                                     <option data-value="2011-2015" value="2017-2018">
                                     <option data-value="2016-2020" value="2018-2019">
                                     <option data-value="2016-2020" value="2019-2020">
                                    </datalist> 
						</div>
					</div> -->
 		</div>
 		</div>
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

							<input list="classes" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassName()">
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
<%-- 
							<%
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
					  <div class="col-md-offset-4 col-md-5 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Search" onclick="viewClassWiseResult()" >Save</button>
                                       
                                </div>
                            </div>
				</div>
			</div>
			<div	class="table-responsive">
					<table id="classResult" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Subject Name</th>
								<th>Passing Marks</th>
								<th>Obtained Marks</th>
								<th>Total Marks</th>
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
	
	<!-- Student name wise  -->
	
	<div id="stud" class="tab-pane">
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
								ClassInfoDao classDao = new ClassInfoDao();
								List classList = classDao.getAllMainClass();
							%>

							<input list="classes_Student" id="fk_class_id_Student" class="form-control" onchange="getDivisionNameByClassNameForStudentWise()">
							<datalist id="classes_Student">
							 <%
 	                            for (int i = 0; i < classList.size(); i++) {
 		                        ClassInfoHibernate classBean = (ClassInfoHibernate) classList.get(i);
                             %>

							<option data-value="<%=classBean.getPkClassId()%>"
								value="<%=classBean.getClas()%>">
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
								List divList = divDao.getAllMainDivision();
							     %>

							<input list="division_Student" id="fk_division_id_Student" class="form-control" onchange="getSudentName()">
							<datalist id="division_Student"> <%
									for (int i = 0; i < divList.size(); i++) {
										DivisionInfoHibernate divBean = (DivisionInfoHibernate) divList.get(i);
								%>

							<option data-value="<%=divBean.getPkDivisionId()%>"
								value="<%=divBean.getDivision() %>">
								<%
										}
									%>
							
							</datalist> --%>
							
							
							<input list="division_Student" id="fk_division_id_Student" class="form-control" onchange="getSudentName()">
							<datalist id="division_Student"></datalist>
							
						</div>
					</div>
				</div>
			</div>
			<div class="row">
 			<div class="form-group">
 					
 					<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Student Name:</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<select id="studentName_student_result" class="form-control">
											</select>
           							 </div>
								</div>
 				
 				<div class="col-sm-2 " align="right">
						<label class="control-label">Exam Name<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
							ExamInfoDao examName = new ExamInfoDao();
								List examNameList = examName.getAllExamNames();
							%>

							<input list="examNameId_student" id="fk_examName_id_student" class="form-control">
							<datalist id="examNameId_student">
							 <%
 	                            for (int i = 0; i < examNameList.size(); i++) {
 	                            	ExamInfoHibernate examNameListex = (ExamInfoHibernate) examNameList.get(i);
                             %>

							<option data-value="<%=examNameListex.getPkExamId()%>"
								value="<%=examNameListex.getExamName()%>">
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
					  <div class="col-md-offset-4 col-md-5 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Search" onclick="viewStudentWiseResult()" >Save</button>
                                       
                                </div>
                            </div>
				</div>
			</div>
			<div	class="table-responsive">
					<table id="StudentResult" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Subject Name</th>
								<th>Passing Marks</th>
								<th>Obtained Marks</th>
								<th>Total Marks</th>
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
</div>	
	<%@include file="commons/newFooter.jsp" %>	