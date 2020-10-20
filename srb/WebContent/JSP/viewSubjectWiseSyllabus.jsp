<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<html>
<head>
<title>Subject Wise Syllabus Report</title>
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
<script src="/srb/staticContent/JS/Subject.js"></script>
</head>


<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/list.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Subject Wise Syllabus Report</h1>
                            <small>Syllabus Report</small> 
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
                    <a class="btn btn-primary"   onclick="TeacherTaskList()" accesskey="t""> <i class="fa fa-list"></i>List </a>  
                </div>
                -->
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		
			<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
				<div class="col-md-2" align="right">
						<label class="control-label">Teacher name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
						<%
							TeacherInfoDao sdd3 = new TeacherInfoDao();
							List sList4 = sdd3.getAllMainTeacher();
							 %>
							 <input list="teacherNameList" id="fk_teacher_id" class="form-control" onchange="getSubjectAndTeacherIntoGrid()">
								<datalist id="teacherNameList">
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
						
						<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Academic Year:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='academicYear' list="academicYear1" name="academicYear" class="form-control">
                                   <datalist id="academicYear1">
                                     <option data-value="2011-2015" value="2017-2018">
                                     <option data-value="2016-2020" value="2018-2019">
                                     <option data-value="2016-2020" value="2019-2020">
                                     <option data-value="2015-2016" value="2020-2021">
                                     <option data-value="2006-2010" value="2021-2022">
                                    </datalist> 
						</div>
					</div>
				</div>		
				</div>
				
			<div class="row">
				<div class="form-group">
					<div class="col-md-2" align="right">
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


					<div class="col-sm-2 col-sm-offset-1" align="right">
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
			<div class="row ">
				<div class=" form-group">
					<div class="col-md-2" align="right">
						<label class="control-label">Subject Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
							SubjectInfoDao sdd2 = new SubjectInfoDao();
							List sList3 = sdd2.getAllMainSubject();
							 %>

								<input list="subjectList" id="fk_subject_id" class="form-control">
								<datalist id="subjectList">
								 <%
									for (int i = 0; i < sList3.size(); i++) {
									SubjectInfoHibernate sup = (SubjectInfoHibernate) sList3.get(i);
								 %>

								<option data-value="<%=sup.getPkSubjectId()%>"
									value="<%=sup.getSubject()%>">
									<%
										}
									%>
								
								</datalist>
						</div>
					</div>
				</div>
				</div>
				
				 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="View" onclick="viewSyllabusImage()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                       </div>
                                </div>
                            </div>
                            
         		
				<div id="dataTab">
			 <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf"
					 	id="studentOne" class="display"
					  style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>Teacher</th>
								<th>Class Name</th>
								<th>Division</th>
								<th>Syllabus</th>	
								<th>Date</th>
							</tr>
						</thead>
						<tfoot>
						</tfoot>
					</table>
			 </div>
		 </div>
				
			</form>
		</div>
		</body>
		</html>
			<%@include file="commons/newFooter.jsp" %>