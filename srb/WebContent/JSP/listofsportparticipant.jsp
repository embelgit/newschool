<%@page import="com.srb.hibernate.SportParticipantDetails"%>
<%@page import="com.srb.dao.SportInfoDao"%>
<%@page import="com.srb.bean.GetSchoolDetailBean"%>
<%@page import="com.srb.dao.SchoolInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/School.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "Sportparticipant.jsp";
	}

</script>
	<!-- For datatable to pdf,print,excel etc conversion -->
		<script type="text/javascript" src="/srb/staticContent/jsForReport/jquery-1.12.4.js"></script> 
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
                            <h1>Sport List</h1>
                            <small>List</small> 
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
                    <a class="btn btn-primary" onclick="Back()"  accesskey="t""> <i class="fa fa-list"></i>Add Sports</a>  
                </div>
                </div>
               
            <div class="panel-body panel-form">
                <div class="row">
	


			<%
			SportInfoDao dao=new SportInfoDao();
			List list12=dao.getAllSportparticipantForList();
			%>
	
	<div id="demo_jui">
	<div class="panel-body-search table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
					<th> First Name</th>
					<th>Middle Name</th>
					<th>Last Name</th>	  
					<th>Lose</th> 
				 	<th>Win</th>
	                <th>Award</th> 
	                <th>Sport Participant</th>
	                <th>Start Date</th> 
	                <th>End Date</th> 
					
				</tr>
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						SportParticipantDetails sr=(SportParticipantDetails)list12.get(i);
				%>
				
				<tr>
					<td class="align"><%=sr.getFirstName()%></td>
					<td class="align"><%=sr.getMiddleName()%></td>
					<td class="align"><%=sr.getLastName()%></td>
					<td class="align"><%=sr.getLose()%></td>
					<td class="align"><%=sr.getWin()%></td>
					<td class="align"><%=sr.getAward()%></td>
					<td class="align"><%=sr.getSportParticipant()%></td>
					<td class="align"><%=sr.getStartdate()%></td>
					<td class="align"><%=sr.getEnddate()%></td>
					 
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
	</div>
	</div>
	</div>
	</body>
	
	<%@include file="commons/newFooter.jsp" %>
	
</div>