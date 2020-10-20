<%@page import="com.srb.bean.GetStudentDetailsBean"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<%@page import="com.srb.bean.GetTeacherDetailBean"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.bean.GetSchoolDetailBean"%>
<%@page import="com.srb.dao.SchoolInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<title>Admission Cancel List Report</title>
  	<script src="/srb/staticContent/JS/Teacher.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "Student.jsp";
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
                            <h1>Admission Cancel List Report</h1>
                            <small>Student</small> 
                        </div>
                    </div>
                </section>
        
                                        

                               <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
	 <div class="panel-heading no-print">
                
                 <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t"> <i class="fa fa-list"></i>Add Student</a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
           
			   
		
	<%
	StudentInfoDao dao=new StudentInfoDao();
	List list12=dao.getAllStudentDetailForCancelList();
	%>
	
	<div id="demo_jui">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
					<th>Sr_No</th>
					<th>Roll_No</th>
					<th>First Name</th>
					<th>Middle Name</th>	  
					<th>Last Name</th>
					<th>Date_Of_Birth</th>
	                <th>Permanent Address</th>
					<th>Present Address</th>
					<th>Gender</th>
					<th>State</th>
					<th>Country</th>
					<th>Pin Code</th>
					<th>Father_Name</th>
					<th>Mother_Name</th>
					<th>Siblings</th>
					<th>Contact Number</th>
					<th>Previous School Name</th>
					<th>Previous school UDISE Number</th>
					<th>Area</th>
					<th>Date_Of_Admission</th>
					<th>Annual Fee</th>
					<th>Class Name</th>
					<th>Division Name</th>
				</tr>
			</thead>
			
			<tbody>
   				<%
   					int k=1;
					for(int i=0;i<list12.size();i++){
						GetStudentDetailsBean sr=(GetStudentDetailsBean)list12.get(i);
				%>
				
				<tr>
					<td class="align"><%=k++%></td>
					<td class="align"><%=sr.getRollNumber()%></td>
					<td class="align"><%=sr.getFirstName()%></td>
					<td class="align"><%=sr.getMiddleName()%></td>
					<td class="align"><%=sr.getLastName()%></td>
					<td class="align"><%=sr.getDob()%></td>
					<td class="align"><%=sr.getPerAddress()%></td>
					<td class="align"><%=sr.getPreAddress()%></td>
					<td class="align"><%=sr.getGender()%></td>
					<td class="align"><%=sr.getState()%></td>
					<td class="align"><%=sr.getCountry()%></td>
					<td class="align"><%=sr.getPinCode()%></td>
					<td class="align"><%=sr.getFatherName()%></td>
					<td class="align"><%=sr.getMotherName()%></td>
					<td class="align"><%=sr.getSiblings()%></td>
					<td class="align"><%=sr.getContactNo()%></td>
					<td class="align"><%=sr.getPreSchoolN()%></td>
					<td class="align"><%=sr.getClas()%></td>
					<td class="align"><%=sr.getDivision()%></td>
					<td class="align"><%=sr.getDoa()%></td>
					<td class="align"><%=sr.getAnnualFee()%></td>
				    <td class="align"><%=sr.getPreSchoolUdias()%></td>
				    <td class="align"><%=sr.getArea()%></td>
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