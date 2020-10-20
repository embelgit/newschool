<%@page import="com.srb.hibernate.TeacherDailyTaskEntryHibernate"%>
<%@page import="com.srb.dao.TeacherDailyTaskEntryDao"%>
<%@page import="com.srb.bean.GetSchoolDetailBean"%>
<%@page import="com.srb.dao.SchoolInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/Teacher.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "viewTeacherDailyTask.jsp";
	}

</script>
	<!-- For datatable to pdf,print,excel etc conversion -->
		<!-- <script type="text/javascript" src="/srb/staticContent/jsForReport/jquery-1.12.4.js"></script>  -->
		 <script type="text/javascript" src="/srb/staticContent/jsForReport/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/dataTables.buttons.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/buttons.flash.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/jszip.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/pdfmake.min.js"></script>
		
		<script type="text/javascript" src="/srb/staticContent/jsForReport/vfs_fonts.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/buttons.html5.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/buttons.print.min.js"></script>
		<link rel="stylesheet" href="/srb/staticContent/cssForReport/jquery.dataTables.min.css"> 
		<link rel="stylesheet" href="/srb/staticContent/cssForReport/buttons.dataTables.min.css"> 
<style type="text/css">
td {
    color:  black;
}
</style>
</head>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/list.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Teacher Daily Task Report</h1>
                            <small> Task List </small> 
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
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add Task</a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">

			    
	<%
	TeacherDailyTaskEntryDao dao=new TeacherDailyTaskEntryDao();
	List list12=dao.getAllTeacherDetailForList();
	%>
	

	<div id="demo_jui">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
				    <th>Teacher Name</th>
					<th>Academic Year</th>
					<th>Class Name</th>	  
					<th>Division Name</th>
					<th>Subject Name</th>
	                <th>Enter Task</th>
	           				</tr>
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						TeacherDailyTaskEntryHibernate sr=(TeacherDailyTaskEntryHibernate)list12.get(i);
				%>
				
				<tr>
				    <td class="align"><%=sr.getTeacherName()%></td>
					<td class="align"><%=sr.getAcademicYear()%></td>
					<td class="align"><%=sr.getClassName()%></td>
					<td class="align"><%=sr.getDivision()%></td>
					<td class="align"><%=sr.getSubjectName()%></td>
					<td class="align"><%=sr.getTask()%></td>
									
				
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	</div>
	
	
	<%@include file="commons/newFooter.jsp" %>
	
</div>