<%@page import="com.srb.bean.GetTeacherDetailBean"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.bean.GetSchoolDetailBean"%>
<%@page import="com.srb.dao.SchoolInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/Teacher.js"></script>
  	  <script src="/srb/staticContent/JS/Student.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "Teacher.jsp";
	}

	 function Delete() {
		 window.location = "teacherdelete.jsp";
	}
	 
</script>
	<!-- For datatable to pdf,print,excel etc conversion -->
		<!-- <script type="text/javascript" src="/srb/staticContent/jsForReport/jquery-1.12.4.js"></script> --> 
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
                            <h1>Employees List</h1>
                            <small>Employees</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add Employees </a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
           
			    
	<%
	TeacherInfoDao dao=new TeacherInfoDao();
	List list12=dao.getAllTeacherDetailForList();
	%>
	

	<div id="demo_jui">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
				    <th>Designation</th>
					<th>First Name</th>
					<th>Middle Name</th>	  
					<th>Last Name</th>
					<th>Date_Of_Birth</th>
	                <th>Qualification</th>
	                <th>Specialization</th>
	                <th>Percentage/CGPA</th>
					<th>Joining_Date</th>
					<th>Mobile Number</th>
	                <th>Landline Number</th>
	                <th>Permanant Address</th>
					<th>Present Address</th>
					<th>Aadhar Number</th>
					<th>Account Number </th>
					<th>Bank_Name</th>
					<th>IFSC</th>
	                <th>PAN Number</th>
					<th>EPF Number</th>
					<th>PT Number</th>
					<th>Salary</th>
				</tr>
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						GetTeacherDetailBean sr=(GetTeacherDetailBean)list12.get(i);
				%>
				
				<tr>
				    <td class="align"><%=sr.getDesignation()%></td>
					<td class="align"><%=sr.getFirstName()%></td>
					<td class="align"><%=sr.getMiddleName()%></td>
					<td class="align"><%=sr.getLastName()%></td>
					<td class="align"><%=sr.getDob()%></td>
					<td class="align"><%=sr.getHquqlification()%></td>
					<td class="align"><%=sr.getSpecialization()%></td>
					<td class="align"><%=sr.getPercentage()%></td>
					<td class="align"><%=sr.getJdate()%></td>
					<td class="align"><%=sr.getMobnum()%></td>
					<td class="align"><%=sr.getLandno()%></td>
					<td class="align"><%=sr.getPreAddress()%></td>
					<td class="align"><%=sr.getPerAddress()%></td>
					<td class="align"><%=sr.getAadharNumber()%></td>
					<td class="align"><%=sr.getAccountNumber()%></td>
					<td class="align"><%=sr.getBankName()%></td>
					<td class="align"><%=sr.getIfsc()%></td>
					<td class="align"><%=sr.getPanNumber()%></td>
					<td class="align"><%=sr.getEpfNumber()%></td>
					<td class="align"><%=sr.getPtNumber()%></td>
					<td class="align"><%=sr.getSalary()%></td>
				
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	</div>
	
                
                
                </div>
                </div>
                </div>



<div class="row">
				<div class="form-group">

					<div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Back" onclick="Back()"  >Save</button>
                                    <div class="or"></div>
                                    <input type="button" class="ui positive button" name="btn" value="Delete" onclick="Delete()"  >Save</button>
                                 
                                       
                                </div>
                            </div>
				</div>
			</div>
</div></div>
</body>




	<%@include file="commons/newFooter.jsp" %>
	
</div>