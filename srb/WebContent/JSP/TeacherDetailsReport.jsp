<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
<title>Teacher Details Report</title>

<!-- For datatable to pdf,print,excel etc conversion --><!-- 
        <script src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script> -->
		<script type="text/javascript" src="/srb/staticContent/JS/selectjj.js"></script>
		<script type="text/javascript" src="/srb/staticContent/JS/buttom.js"></script>
		<!-- <script src="/srb/staticContent/JS/jquery.min.js"></script> -->
		<script src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
		<script src="/srb/staticContent/JS/jquery.dataTables.js" type="text/javascript"></script>
		<script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
		

<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>  -->
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
 <script type="text/javascript" src="/srb/staticContent/JS/selectjj.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>

<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

<script type="text/javascript" src="/srb/staticContent/JS/teacherDetails.js"></script>
</head>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/list.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Teacher Details Reports</h1>
                            <small>Reports</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            

            <div class="panel-body panel-form">
                <div class="row">
	
		

             <div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Teacher Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
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
									value="<%=sup.getFirstName()%>  <%=sup.getMiddleName()%> <%=sup.getLastName()%> ">
									<%
										}
									%>
								</datalist>
							</div>
						</div>
						<div class="col-sm-2" >
                                    <input type="button" class="ui positive button" name="btn" value="Search" onclick="getTeacherDetailsSubjWise()"  >
                                       
                                </div>
					</div>
					</div>
				</div>
				</div>
				
			<div	class="table-responsive">
					<table id="teacherDetailsSubj" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
							    <th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
				<!-- 				<th>Subject Name</th>
								<th>Class Name</th>
								<th>Division Name</th> -->
								<th>Qualification</th>
								<th>Joining Date</th>
								<th>Contact Number</th>
							</tr>
						</thead>
					</table>
				</div>

			
	</form>	
</div>
	<%@include file="commons/newFooter.jsp" %>		