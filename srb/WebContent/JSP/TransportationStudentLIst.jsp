<%@page import="com.srb.bean.GetTransportationDetails"%>
<%@page import="com.srb.bean.TeacherLeavebean"%>
<%@page import="com.srb.dao.TeacherInfoLeaveDao"%>
<%@page import="com.srb.dao.TransportationInfoDao"%>
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
  	<script src="/srb/staticContent/JS/Teacher.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "TranspotationBus2.jsp";
	}
	 function del()
	 {
		 window.location="DeleteTranspotationBus2.jsp";
		 
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
                            <h1>Transportation Bus Details List</h1>
                            <small>Transportation Bus Details</small> 
                        </div>
                    </div>
                </section>
        
                                        

                               <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
	 <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add Transportaion Bus Details</a>  
                </div>
                 <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="del()" accesskey="t""> <i class="fa fa-list"></i>Delete Details</a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
           
			   
		
	<%
	TransportationInfoDao dao=new TransportationInfoDao();
	List list=dao.getAllTransportaionDetailsLists();
	%>
	
	<div id="demo_jui">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
								<th>Sr No</th> 
								<th>First Name</th>
							    <th>Middle Name</th>
							    <th>Last Name</th>
							   	<th>ClassName</th>
								<th>Division Name</th>
								<th>Date From  </th>
								<th>Date To</th>
								<th>Contact No </th>
								<th>PinCode </th>
								<th>Payment</th>
								<th>Address </th>
								<th>ChargesPerKm</th>
								
				</tr>
			</thead>
			
			<tbody>
   				<%
   					int k = 1;
					for(int i=0;i<list.size();i++){
						GetTransportationDetails sr=(GetTransportationDetails)list.get(i);
				%>
				
				<tr>
				 	<td class="align"><%=k++%></td> 
					<td class="align"><%=sr.getFirstName()%></td>
					<td class="align"><%=sr.getMiddleName()%></td>
					<td class="align"><%=sr.getLastName()%></td>
					<td class="align"><%=sr.getClassName()%></td>
					<td class="align"><%=sr.getDivisionName()%></td>
					<td class="align"><%=sr.getLeaveDateFrom()%></td>
					<td class="align"><%=sr.getLeaveDateTo()%></td>
					<td class="align"><%=sr.getContactNo()%></td>
					<td class="align"><%=sr.getPincode()%></td>
					<td class="align"><%=sr.getPayement()%></td>
					<td class="align"><%=sr.getAddress()%></td>
					<td class="align"><%=sr.getChargesPerKm()%></td>
					
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	</div>
	<div class="row">
				<div class="form-group">

					<div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Back" onclick="Back()"  >Save</button>
                                 
                                       
                                </div>
                            </div>
				</div>
			</div>

	<%@include file="commons/newFooter.jsp" %>
	
</div>

 								