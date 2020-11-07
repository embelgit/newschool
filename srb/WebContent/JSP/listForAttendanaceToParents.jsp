<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.bean.ClassDivisionSubjectAssocBean"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.bean.GetSchoolDetailBean"%>
<%@page import="com.srb.dao.SchoolInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/Teacher.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "AttendanceToParents.jsp";
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
                            <h1>Parents List</h1>
                            <small>Parents List</small> 
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
                    <a class="btn btn-success"  onclick="Back()"> <i class="fa fa-plus"></i>Attendance To Parents</a>  
                </div>
            </div> 

            <div class="panel-body panel-form class-list">
                <div class="row">


			    
	<%
	DivisionInfoDao dao=new DivisionInfoDao();
	List list12=dao.getAllDivDetailForList();
	%>
	


	<div id="demo_jui ">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
					<th>Parent's ID</th>
					<th>Parent's Name</th>
					<th>Date</th>
					<th>Subject</th>
					<th>Message</th>

				</tr>
			</thead>
			
			<tbody>
   				
				
				<tr>
				   
					<td class="align">TS1234</td>
					<td class="align"></td>
					<td class="align">02/12/2020</td>
                    <td class="align"></td>
                    <td class="align"></td>
					
				</tr>
			</tbody>
		</table>
	</div>
	</div>
	<div class="row">
				<div class="form-group">

					<div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Back" onclick="Back()"  >
                                    
                                       
                                </div>
                            </div>
				</div>
			</div>
  </div>
	</div>
	</div>
</div>
</div>
</div>

</body>


	<%@include file="commons/newFooter.jsp" %>
	
</div>