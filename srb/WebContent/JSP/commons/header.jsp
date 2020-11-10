<%@page import="com.srb.hibernate.AccessControlBean"%>
<%@page import="com.srb.hibernate.UserDetailsBean"%>
<%@page import="com.srb.utility.HibernateUtility"%> 
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="description" content="" />
<% String type1= "";
    String type2= "";
                     String name1 = "";
		             if (session != null) {
			
			         if (session.getAttribute("user") != null) {
				     name1 = (String) session.getAttribute("user");
				    
			            
	            	  
		              HibernateUtility hbu1=HibernateUtility.getInstance();
		              Session session2=hbu1.getHibernateSession();
		   
		              org.hibernate.Query query1 = session2.createQuery("from AccessControlBean where userName =:usr");
		              query1.setParameter("usr", name1);
		              AccessControlBean userDetail1 = (AccessControlBean) query1.uniqueResult();
		              type1 = userDetail1.getType();
		              type2 = userDetail1.getType();
			         } 
			         else {
							
					     response.sendRedirect("/srb/JSP/login.jsp");
					     out.println("Please Login ");
				        }
			         
		           }
		             else {
							
					     response.sendRedirect("/srb/JSP/login.jsp");
					     out.println("Please Login ");
				        }
	           %>


<!-- To toggle between marathi and english version -->

<% 
   String abc = "english";
   if (session != null) {
   
   if (session.getAttribute("lan") != null) {
	   abc = (String) session.getAttribute("lan");
   }}
   else{
	   abc="english";
   }
 %>

<% String  contextPath=request.getContextPath(); %>
<% String path=""; if(isHome)path="JSP\\"; %>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<html>
	<head>
		<meta name="viewport" content="width=device-width , initial-scale=1">
 	<!-- 	<title>Embel Technologies Pvt Ltd.</title> -->
		<script src="/srb/staticContent/Js/logout.js"></script>
		<script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script>
		<script type="text/javascript"  src="/srb/staticContent/JS/bootstrap.min.js"></script>
		
  		 <!----------------------- Offline glyphicons used for footer.jsp-------------------------------------------------------- -->
  
	
		<script type="text/javascript" src="/srb/staticContent/JS/bootstrap.js"> </script>
		<script type="text/javascript" src="/srb/staticContent/JS/bootstrap.min.js"> </script>
		<script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"> </script>
		
		<script type="text/javascript" src="/srb/staticContent/JS/bootstrap-timepicker.min.js"> </script>
		<!-- For new alert box -->
		<script type="text/javascript" src="/srb/staticContent/JS/alertify.min.js"> </script>
	
		<script type="text/javascript" src="/srb/staticContent/Js/shortcut.js"> </script>
		
	
				<!------------------------------------------ Shortcut.jsp styles -------------------------------------------------->
		
		<script type="text/javascript" src="/srb/staticContent/JS/bootstrap.js"> </script>
		<script type="text/javascript" src="/srb/staticContent/JS/bootstrap.min.js"> </script>
		
 <!-------------------------------- header style -------------------------------------------------------------------------------------------------------->	
<script src="/srb/staticContent/JS/prefixfree.min.js"></script>
<script src="/srb/staticContent/JS//modernizr.min.js"></script>
<script src="/srb/staticContent/JS/logout.js"></script>

        <!-- Favicon and touch icons -->
       
        <link rel="shortcut icon" href="http://hospitalnew.bdtask.com/demo6/assets/images/icons/77a6d497de707b3241647556f9fd92ca.png">

		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- jquery ui css -->
        <link href="/srb/staticContent/new/css/jquery-ui.min.css" rel="stylesheet" type="text/css">

        <!-- Bootstrap --> 
        <link href="/srb/staticContent/new/css/bootstrap.min.css" rel="stylesheet" type="text/css">
         <link href="/srb/staticContent/new/css/font-awesome.min.css" rel="stylesheet">


        <!-- Font Awesome 4.7.0 -->
        <link href="/srb/staticContent/new/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- semantic css -->
        <link href="/srb/staticContent/new/css/semantic.min.css" rel="stylesheet" type="text/css"> 
        <!-- sliderAccess css -->
        <link href="/srb/staticContent/new/css/jquery-ui-timepicker-addon.min.css" rel="stylesheet" type="text/css"> 
        <!-- slider  -->
        <link href="/srb/staticContent/new/css/select2.min.css" rel="stylesheet" type="text/css"> 
        <!-- DataTables CSS -->
        <link href="/srb/staticContent/new/css/dataTables.min.css" rel="stylesheet" type="text/css"> 
  

        <!-- pe-icon-7-stroke -->
        <link href="/srb/staticContent/new/css/pe-icon-7-stroke.css" rel="stylesheet" type="text/css"> 
        <!-- themify icon css -->
        <link href="/srb/staticContent/new/css/themify-icons.css" rel="stylesheet" type="text/css"> 
        <!-- Pace css -->
        <link href="/srb/staticContent/new/css/flash.css" rel="stylesheet" type="text/css">

        <!-- Theme style -->
        <link href="/srb/staticContent/new/css/custom.css" rel="stylesheet" type="text/css">
        <link href="/srb/staticContent/new/css/font.css" rel="stylesheet" type="text/css">
        <link href="/srb/staticContent/new/css/font2.css" rel="stylesheet" type="text/css">
        <link href="/srb/staticContent/new/css/css.css" rel="stylesheet" type="text/css">
        
        

        <!-- jQuery  -->
        <script src="new/js/jquery.min.js.download" type="text/javascript"></script>

    <style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style></head>


</head>
    <body class="sidebar-mini  pace-done"><div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
  <div class="pace-progress-inner"></div>
</div>
<div class="pace-activity"></div></div>
        <div class="se-pre-con" style="display: none;"></div>

        <!-- Site wrapper -->
        <div class="wrapper">
            <header class="main-header"> 

                              

                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top">
                    <!-- <a href="http://hospitalnew.bdtask.com/demo6/dashboard/home#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> Sidebar toggle button -->
                         <a href="" class="sidebar-toggle" data-toggle="offcanvas" role="button"> <!-- Sidebar toggle button-->
                        <span class="sr-only">Toggle navigation</span>
                        <img src="/srb/staticContent/Images/manu.png" style="width: 25px;">
                    </a>
                   
                    <a  class="sidebar-toggle"  role="button"> <!-- Sidebar toggle button-->
                     
                        <img src="/srb/staticContent/Images/shortcut.png" style="width: 25px;">
                    </a>
                    <div class="navbar-custom-menu">
                    
                        <ul class="nav navbar-nav">
                            <!-- settings -->
                            <li class="dropdown dropdown-user">
                                <a class="dropdown-toggle" data-toggle="dropdown"><img src="/srb/staticContent/Images/loading-gears-animation-2.gif" style="width: 20px;padding-top: 5px;"></a>
                                <ul class="dropdown-menu">
                                    <li><a><i class="pe-7s-users"></i> Profile</a></li>
                                    <li><a><i class="pe-7s-settings"></i> Edit Profile</a></li>
                                    <li><a onclick="Logout()"><i   class="pe-7s-key"></i> Log Out</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!--     <div class="form-group" align="right">
						<div id="date">
							<label id="demo"></label>
							<script>
							   var date = new Date();
							   document.getElementById("demo").innerHTML = date.toDateString();
							</script>
				</div> -->
                </nav>
            </header>

            <!-- =============================================== -->
            <!-- Left side column. contains the sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar -->
                <div class="sidebar" style="height: auto;">
                    <!-- Sidebar user panel -->
                    <div class="user-panel text-center">
                        <div class="image">
                            <img src="/srb/staticContent/Images/Logo School.jpg" class="img-circle" alt="User Image">
                        </div>
                        <div class="info">
                        <!--     <p>VENKATRAMANA HI-TECH <br>ENGLISH SCHOOL</p> -->
                        <p>GODAVARI MANAR <br> PUBLIC HIGH SCHOOL <br> and Junior College</p>
                            <a><i class="fa fa-circle text-success"></i>
                            Admin</a>
                        </div>
                    </div> 

                    <!-- sidebar menu -->
                    <ul class="sidebar-menu"> 
						<%
    			  			if(type1.equals("admin")){
    	  
      					%>	
                        <li class="">
                            <a href="index.jsp" ><i class="fa fa ti-home"></i> Dashboard</a>
                        </li> 
						<%}%>
									<%
    			  			if(type1.equals("admin")){
    	  
      					%>	
                        <li class="">
                            <a href="gallary.jsp" ><i class='fa fa-image'></i> Gallery</a>
                        </li> 
                        <%
    			  			if(type1.equals("admin")){
    	  
      					%>	
      					
      					 <li class="">
                            <a href="RFIDAttendance.jsp" ><i class="fa fa-edit"></i>RFID Attendance</a>
                        </li> 
						<%}%>
						<%}%>
												<%
    			  			if(type1.equals("admin")){
    	  
      					%>	
                        <li class="">
                            <a href="AttendanceToParents.jsp" ><i class='fa fa-mail-bulk'></i> Attendance Alert</a>
                        </li> 
						<%}%>
									<%
    			  			if(type1.equals("admin")){
    	  
      					%>	
                        <li class="">
                            <a href="NewIdcardGeneration.jsp" ><i class="fas fa-id-card-alt"></i> ID Card Generation</a>
                        </li> 
						<%}%>
						
							<%
    			  			if(type1.equals("admin")){
    	  
      					%>	
                        <li class="">
                            <a href="NewsSection.jsp" ><i class="fa fa-newspaper"></i> News Section</a>
                        </li> 
						<%}%>
						
						<%
    			  			if(type1.equals("admin")){
    	  
      					%>	
      					
      					 <li class="">
                            <a href="Thoughts.jsp" ><i class="fa fa-edit"></i>Thoughts</a>
                        </li> 
						<%}%>
						
						<%
    			  			if(type1.equals("admin")){
    	  
      					%>	
      					
      					 <li class="">
                            <a href="Penalty.jsp" ><i class="fa fa-money"></i>Penalty</a>
                        </li> 
						<%}%>
						
						<%
    			  			if(type1.equals("admin")){
    	  
      					%>	
      					
      					 <li class="">
                            <a href="Tutorial.jsp" ><i class="fa fa-file-movie-o"></i>Tutorial</a>
                        </li> 
						<%}%>
						<%
    			  			if(type1.equals("admin")){
    	  
      					%>	
      		
      					
      					<%-- <li><a href="<%=path%>School.jsp" accesskey="t">School Details</a></li> --%>
                        <li class="treeview active">
                            <a >
                                <i class="fa fa-sitemap"></i> <span>School Administration</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu" style="display: none;">
                                <li><a href="<%=path%>School.jsp" accesskey="t">School Details</a></li>
                                <li><a  href="<%=path%>Class.jsp" accesskey="t">Class Entry</a></li> 
                                <li><a  href="<%=path%>Teacher.jsp" accesskey="t">Employee Details </a></li>
                                <li><a  href="<%=path%>Subject.jsp" accesskey="t">Subject Details</a></li> 
                                <li><a  href="<%=path%>EmployeeLeave.jsp" accesskey="t">Employee Leave Details </a></li>
                                <li><a  href="<%=path%>Student.jsp" accesskey="t">Student Details</a></li> 
                                <li><a  href="<%=path%>admission_enquiry_form.jsp" accesskey="t">Addmission Enquiry</a></li>
                                 <li><a  href="<%=path%>store_management.jsp" accesskey="t">Store Management</a></li>
                                <li><a  href="<%=path%>expenditureDetails.jsp" accesskey="t">Expenditure Details</a></li> 
                              	<li><a class="padding" href="<%=path%>ParentsComplaint.jsp" accesskey="n">Parents Complaint</a></li>
                               <%--  <li><a class="padding" href="<%=path%>productDetails.jsp" accesskey="n">Product Details</a></li> --%>
                                <li><a class="padding" href="<%=path%>StudentHealthCheckup.jsp" accesskey="n">Student Health Checkup</a></li>
                    
                                
                              <%--   <li><a  href="<%=path%>cancellationOFStudentAdmission.jsp" accesskey="t">Cancle Admission</a></li> --%> 
                                
                                
                               <%--  <li><a  href="<%=path%>studentDocumentUpload.jsp" accesskey="t">Document Upload</a></li> --%> 
                                
                              
                                
                                
                            </ul>
                        </li>
                        <%}%>
						
						
						<%
    			  			if(type1.equals("admin") || type1.equals("teacher")){
    	  
      					%>
                        <li class="treeview ">
                            <a >
                                <i class="fa fa-user-md"></i> <span>School Academics</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                               <li><a  href="<%=path%>Class_Division_Subject_Teacher.jsp" accesskey="t">Class Details</a></li>
                               <li><a class="padding" href="<%=path%>HomeWork.jsp" accesskey="n">Home Work</a></li>
			      			<%-- 	<li><a class="padding" href="<%=path%>ExamNameEntry.jsp" accesskey="n">Exam Name Entry</a></li> --%>
							    <li><a class="padding" href="<%=path%>Exam.jsp" accesskey="n">Exam Details</a></li>
							    <li><a class="padding" href="<%=path%>Notice.jsp" accesskey="n">Notice Details</a></li>
							    <%-- <li><a class="padding" href="<%=path%>marksEntry.jsp" accesskey="n">Result Entry</a></li> --%>
							    <li><a class="padding" href="<%=path%>teacherDailyTaskEntry.jsp" accesskey="n">Teacher Task Detail</a></li>
							   <%--  <li><a class="padding" href="<%=path%>subjectSyllabusEntry.jsp" accesskey="n">Subject wise Syllabus Entry</a></li> --%>
							    <li><a class="padding" href="<%=path%>dailyTimeTable.jsp" accesskey="n">Daily time Table</a></li>
								<li><a class="padding" href="<%=path%>meetingSchedule.jsp" accesskey="n">Schedule Meetings</a></li>
								<li><a class="padding" href="<%=path%>ParentsMeeting.jsp" accesskey="n">Parents Meetings</a></li>
								<li><a  href="<%=path%>Sport.jsp" accesskey="t">Sport Activity</a></li>
								<li><a  href="<%=path%>TranspotationBus2.jsp" accesskey="t">Students Transportation Details </a></li>
								<%-- <li><a class="padding" href="<%=path%>Sportparticipant.jsp" accesskey="n">Sport Participant</a></li> --%>
								
                            </ul>
                        </li>
						<%}%>
						
						<% if(type1.equals("admin") || type1.equals("finance")){ %>						
                        <li class="treeview ">
                        	
                            <a >
                                <i class="fa fa-wheelchair"></i> <span>Finance Management</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                 <li><a class="padding" href="<%=path%>CashBankBook.jsp" accesskey="n">Cash Book</a></li>
      	  						 <li><a class="padding" href="<%=path%>studentCashbook.jsp" accesskey="t">Student Fee</a></li>
                            </ul>
                        </li> 
                         <%}%>
                        
                        
						<%
    			  			if(type1.equals("admin") || type1.equals("library")){
    	  
      					%>                        
                         <li class="treeview ">
                            <a class="padding" href="<%=path%>libraryManagement.jsp" accesskey="n">
                                <i class="fa fa-wheelchair"></i> <span>Library Management</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                           </li>
                         <%}%>
                         

                        <%
    			  			if(type1.equals("admin")){
    	  
      					%>
                        <li class="treeview ">
                            <a>
                                <i class="fa fa ti-calendar"></i> <span>Certificates</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                              	<li><a class="padding" class="padding" href="<%=path%>leavingCertificate.jsp">Leaving Certificate</a></li>
 				<li><a class="padding" class="padding" href="<%=path%>bonafideCertificate.jsp">Bonafide Certificate</a></li>
 				<li><a class="padding" class="padding" href="<%=path%>nirgumcertificate.jsp">Nirgum Certificate</a></li>
 				<li><a class="padding" class="padding" href="<%=path%>SportsCertificate.jsp">Sports Certificate</a></li>
 				<%-- <li><a class="padding" class="padding" href="<%=path%>CopyleavingCertificate.jsp"> Copy Leaving Certificate</a></li>
 				<li><a class="padding" class="padding" href="<%=path%>CopybonafideCertificate.jsp">Copy Bonafide Certificate</a></li> --%>
                            </ul>
                        </li>
                        <%}%>
                          

						<%
    			  			if(type1.equals("admin")){
    	  
      					%>
                        <li class="treeview ">
                            <a >
                                <i class="fa fa ti-pencil-alt"></i> <span>Reports</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                               <%--  <li><a class="padding" href="<%=path%>viewStudentResult.jsp">Print Student Result</a></li> --%>
                              <li class="treeview "><a class="padding" href="<%=path%>TeacherPaymentReport.jsp">
                              
                              <i class="fa fa ti-pencil-alt"></i> <span>CashBook Reports</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span></a>
                                 <ul class="treeview-menu">
                                 
	                                <li><a class="padding" href="<%=path%>TeacherPaymentReport.jsp">Employee Payment Report</a></li>
	                                <li><a class="padding" href="<%=path%>StudentFeeReports.jsp">Student Fee Reports</a></li>
						            <li><a class="padding" href="<%=path%>studentBalanceReports.jsp">Student Balance Report</a></li>
						           
						            <li><a class="padding" href="<%=path%>ExpenditurePaymentReport.jsp">Expenditure Payment Report</a></li>
						             <li><a class="padding" href="<%=path%>SupplierPaymentList.jsp">Supplier Payment Report</a></li>
  						             <li><a class="padding" href="<%=path%>librarypayreport.jsp">Library Payment Report</a></li>    
					                 <li><a class="padding" href="<%=path%>transportpayreport.jsp">Transport Payment Report</a></li>      
						             
						             
						            <%-- <li><a class="padding" href="<%=path%>ExpenditurePaymentReport.jsp">Supplier Payment Report</a></li>
						            <li><a class="padding" href="<%=path%>ExpenditurePaymentReport.jsp">Employee Salary Slip</a></li>
						             --%>
					            </ul>
					            </li>
					            <li><a class="padding" href="<%=path%>class_wise_report.jsp">Result Report</a></li>
					            <li><a class="padding" href="<%=path%>view_daily_time-Table.jsp">Daily Time Table</a></li>
					            <li><a class="padding" href="<%=path%>view_exam_time_table.jsp">Exam Time Table</a></li>
						        <li><a class="padding" href="<%=path%>studentReports.jsp">Student Detail Report</a></li>	
						        <li><a class="padding" href="<%=path%>viewTeacherDailyTask.jsp">Teacher Daily Task</a></li>
						        <li><a class="padding" href="<%=path%>viewSubjectWiseSyllabus.jsp">Subject wise Syllabus File</a></li>
						        <li><a class="padding" href="<%=path%>BookEntryReports.jsp">Library Management Reports</a></li>
				
						         
<%-- 					            <li><a class="padding" href="<%=path%>studentWiseAttendanceReport.jsp">Student Attendance Report</a></li>	 --%>
				
				
					            <li><a class="padding" href="<%=path%>certificateIssuedReport.jsp">Certificate Issued Report</a></li>
			                   <li><a class="padding" href="<%=path%>certificate_issued_rangewise.jsp">Certificate Issued Range wise</a></li>
			                 	<li><a class="padding" href="<%=path%>admissionEnquiryReport.jsp">Admission Enquiry Report</a></li>
				          		<li><a class="padding" href="<%=path%>TeacherDetailsReport.jsp">Teacher Details Report</a></li>
				          		<li><a class="padding" href="<%=path%>employeeleavereprt.jsp">Employee Leave Report</a></li>
				 				<li><a class="padding" href="<%=path%>stockReport.jsp">Store Inventory Report</a></li>	
				 				<li><a class="padding" href="<%=path%>StudentCheckupReport.jsp">Student CheckUp Report</a></li>
					 			<li><a class="padding" href="<%=path%>kitchenInventoryReport.jsp">Kitchen Inventory Report</a></li>
						    	<li><a class="padding" href="<%=path%>hostelReport.jsp">Hostel Inventory Report</a></li> 
						    	<li><a class="padding" href="<%=path%>transaportreport.jsp">Transportation Report</a></li> 
					 			<li><a class="padding" href="<%=path%>ListForCancelStudent.jsp">Admission Cancel Report</a></li>
					 			
					 			
					 			
					 			
					 			
                            </ul>
                        </li> 
                        <%}%>
                        
                        
                        <%
    			  			if(type1.equals("finance")){
    	  
      					%>
                        <li class="treeview ">
                            <a >
                                <i class="fa fa ti-pencil-alt"></i> <span>Reports</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                               <%--  <li><a class="padding" href="<%=path%>viewStudentResult.jsp">Print Student Result</a></li> --%>
                              <li class="treeview "><a class="padding" href="<%=path%>TeacherPaymentReport.jsp">
                              
                              <i class="fa fa ti-pencil-alt"></i> <span>CashBook Reports</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span></a>
                                 <ul class="treeview-menu">
                                 
	                                <li><a class="padding" href="<%=path%>TeacherPaymentReport.jsp">Employee Payment Report</a></li>
	                                <li><a class="padding" href="<%=path%>StudentFeeReports.jsp">Student Fee Reports</a></li>
						            <li><a class="padding" href="<%=path%>studentBalanceReports.jsp">Student Balance Report</a></li>
						           
						            <li><a class="padding" href="<%=path%>ExpenditurePaymentReport.jsp">Expenditure Payment Report</a></li>
						             <li><a class="padding" href="<%=path%>SupplierPaymentList.jsp">Supplier Payment Report</a></li>
						            <%-- <li><a class="padding" href="<%=path%>ExpenditurePaymentReport.jsp">Supplier Payment Report</a></li>
						            <li><a class="padding" href="<%=path%>ExpenditurePaymentReport.jsp">Employee Salary Slip</a></li>
						             --%>
					            </ul>
					            </li>
					            			 					 			
					 			
					 			
                            </ul>
                        </li> 
                        <%}%>
                        
                        
                        
                        <%
    			  			if(type1.equals("teacher")){
    	  
      					%>
                        <li class="treeview ">
                            <a >
                                <i class="fa fa ti-pencil-alt"></i> <span>Reports</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                               <%--  <li><a class="padding" href="<%=path%>viewStudentResult.jsp">Print Student Result</a></li> --%>
                              
					            <li><a class="padding" href="<%=path%>class_wise_report.jsp">Result Report</a></li>
					            <li><a class="padding" href="<%=path%>view_daily_time-Table.jsp">Daily Time Table</a></li>
					            <li><a class="padding" href="<%=path%>view_exam_time_table.jsp">Exam Time Table</a></li>
						        <li><a class="padding" href="<%=path%>studentReports.jsp">Student Detail Report</a></li>	
						        <li><a class="padding" href="<%=path%>viewTeacherDailyTask.jsp">Teacher Daily Task</a></li>
						        <li><a class="padding" href="<%=path%>viewSubjectWiseSyllabus.jsp">Subject wise Syllabus File</a></li>
						        
					 			
                            </ul>
                        </li> 
                        <%}%>
                        
                        
                        <%
    			  			if(type1.equals("library")){
    	  
      					%>
                        <li class="treeview ">
                            <a >
                                <i class="fa fa ti-pencil-alt"></i> <span>Reports</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                               <%--  <li><a class="padding" href="<%=path%>viewStudentResult.jsp">Print Student Result</a></li> --%>
                              
					            
						        <li><a class="padding" href="<%=path%>BookEntryReports.jsp">Library Management Reports</a></li>
						         
					            
					 			
                            </ul>
                        </li> 
                        <%}%>
                        
                        
                        <%
    			  			if(type1.equals("admin")){
    	  
      					%>
                        <li class="treeview ">
                            <a>
                                <i class="fa fa ti-calendar"></i> <span>HR</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                              	<li><a class="padding" class="padding" href="<%=path%>userDetails.jsp">User Details</a></li>
 				<li><a class="padding" class="padding" href="<%=path%>AccessControl.jsp">Access Control</a></li>
 				
 				<%-- <li><a class="padding" class="padding" href="<%=path%>CopyleavingCertificate.jsp"> Copy Leaving Certificate</a></li>
 				<li><a class="padding" class="padding" href="<%=path%>CopybonafideCertificate.jsp">Copy Bonafide Certificate</a></li> --%>
                            </ul>
                        </li>
                        <%}%>
                      <%--    <li class="treeview ">
                            <a>
                                <i class="fa fa ti-calendar"></i> <span>Copy</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                              	<li><a class="padding" class="padding" href="<%=path%>leavingCertificate.jsp">Leaving Certificate Copy</a></li>
 				<li><a class="padding" class="padding" href="<%=path%>bonafideCertificate.jsp">Bonafide Certificate Copy</a></li>
 				
 				<li><a class="padding" class="padding" href="<%=path%>CopyleavingCertificate.jsp"> Copy Leaving Certificate</a></li>
 				<li><a class="padding" class="padding" href="<%=path%>CopybonafideCertificate.jsp">Copy Bonafide Certificate</a></li>
                            </ul>
                        </li> --%>
					<%-- <li class="treeview ">
                            <a class="padding" href="<%=path%>libraryManagement.jsp" accesskey="n">
                                <i class="fa ti-calendar"></i> <span>Logout</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                           </li> --%>

 <%-- 
                        <li class="treeview ">
                            <a href="http://hospitalnew.bdtask.com/demo6/dashboard/home#">
                                <i class="fa fa-money"></i> <span>Copy</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                               <li><a class="padding" href="<%=path%>LeavingCertificateCopy.jsp">Leaving Certificate Copy</a></li>
                			   <li><a class="padding" href="<%=path%>BonafideCertificateCopy.jsp">Bonafide Certificate Copy</a></li> 
                			     <li><a class="padding" href="<%=path%>StudentfeeCopy.jsp">Student Fee Copy</a></li>
                			   <li><a class="padding" href="<%=path%>StudentResultCopy.jsp">Student Result Copy</a></li> 
                            </ul>
                        </li>  --%>


                </div> <!-- /.sidebar -->
            </aside>
<script type="text/javascript"> 
$(window).on('load', function(){
    //line chart
    var ctx = document.getElementById("lineChart");
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
            datasets: [
                {
                    label: "Patient",
                    borderColor: "#2C3136",
                    borderWidth: "1",
                    backgroundColor: "rgba(0,0,0,.07)",
                    pointHighlightStroke: "rgba(26,179,148,1)",
                    data: [
                        2, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,                     ]
                },
                {
                    label: "Appointment",
                    borderColor: "#73BC4D",
                    borderWidth: "1",
                    backgroundColor: "#73BC4D",
                    pointHighlightStroke: "rgba(26,179,148,1)",
                    data: [
                        3, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  
                    ]
                }
            ]
        },
        options: {
            responsive: true,
            tooltips: {
                mode: 'index',
                intersect: false
            },
            hover: {
                mode: 'nearest',
                intersect: true
            }

        }
    });
});
</script>
 
         
        <!-- jquery-ui js -->
        <script src="/srb/staticContent/new/js/jquery-ui.min.js.download" type="text/javascript"></script> 
        <!-- bootstrap js -->
        <script src="/srb/staticContent/new/js/bootstrap.min.js.download" type="text/javascript"></script>  
        <!-- pace js -->
        <script src="/srb/staticContent/new/js/pace.min.js.download" type="text/javascript"></script>  
        <!-- SlimScroll -->
        <script src="/srb/staticContent/new/js/jquery.slimscroll.min.js.download" type="text/javascript"></script>  

        <!-- bootstrap timepicker -->
        <script src="/srb/staticContent/new/js/jquery-ui-sliderAccess.js.download" type="text/javascript"></script> 
        <script src="/srb/staticContent/new/js/jquery-ui-timepicker-addon.min.js.download" type="text/javascript"></script> 
        <!-- select2 js -->
        <script src="/srb/staticContent/new/js/select2.min.js.download" type="text/javascript"></script>

        <script src="/srb/staticContent/new/js/sparkline.min.js.download" type="text/javascript"></script> 
        <!-- Counter js -->
        <script src="/srb/staticContent/new/js/waypoints.js.download" type="text/javascript"></script>
        <script src="/srb/staticContent/new/js/jquery.counterup.min.js.download" type="text/javascript"></script>

        <!-- ChartJs JavaScript -->
        <script src="/srb/staticContent/new/js/Chart.min.js.download" type="text/javascript"></script>
        
        <!-- semantic js -->
        <script src="/srb/staticContent/new/js/semantic.min.js.download" type="text/javascript"></script>
        <!-- DataTables JavaScript -->
        <script src="/srb/staticContent/new/js/dataTables.min.js.download"></script>
        <!-- tinymce texteditor -->
        <script src="/srb/staticContent/new/js/tinymce.min.js.download" type="text/javascript"></script> 
        <!-- Table Head Fixer -->
        <script src="/srb/staticContent/new/js/tableHeadFixer.js.download" type="text/javascript"></script> 

        <!-- Admin Script -->
        <script src="/srb/staticContent/new/js/frame.js.download" type="text/javascript"></script> 

        <!-- Custom Theme JavaScript -->
        <script src="/srb/staticContent/new/js/custom.js.download" type="text/javascript"></script>
    
