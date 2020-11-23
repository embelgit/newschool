<%@page import="com.srb.dao.TeacherPaymentDao"%>
<%@page import="com.srb.bean.TeacherPaymentDetailBean"%>
<%@page import="com.srb.bean.GetTransportationDetails"%>
<%@page import="com.srb.bean.TeacherLeavebean"%>
<%@page import="com.srb.dao.TeacherInfoLeaveDao"%>
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
			 window.location = "CashBankBook.jsp";
	}

	 function deletePayment()
	 {
		 window.location="DeleteEmployeePaymentDetails.jsp";
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
                            <h1>Employee Payment List</h1>
                            <small> Payment List</small> 
                        </div>
                    </div>
                </section>
        
                                        

                               <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
	 <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add Employee Payment</a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="deletePayment()" accesskey="t""> <i class="fa fa-list"></i>Delete Employee Payment</a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
           
			   
		
	<%
		TeacherPaymentDao dao1=new TeacherPaymentDao();
		List listtp = dao1.getEmployeePaymentList();
	%>
	
	<div id="demo_jui">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
					<th>Sr No</th>
					<th>Teacher_Name</th>
	                <th>Accountant Name</th>
	             	<th>Reason</th>
					<th>Paid Amount</th>
	                <th>Balance Amount</th>
	                <th>Total Amount</th>
					<th>Payment type</th>
	                <th>Cheque No</th>
					<th>Card No</th>
					<th>Account No</th>
					<th>Bank Name</th>
					<th>Payment Date</th>
					
				</tr>
			</thead>
			
			<tbody>
   				<%
   					int k = 0;
   				for(int i=0;i<listtp.size();i++){
   					TeacherPaymentDetailBean sr1=(TeacherPaymentDetailBean)listtp.get(i);
					k++;
				%>
				
				<tr>
				 	<td class="align"><%=k%></td>
					<td class="align"><%=sr1.getTeacherName() %></td>
					<td class="align"><%=sr1.getAccountantName() %></td>
					<td class="align"><%=sr1.getReason() %></td>
					<td class="align"><%=sr1.getPaymentAmount() %></td>
					<td class="align"><%=sr1.getBalanceamount() %></td>
					<td class="align"><%=sr1.getTotalamount() %></td>
					<td class="align"><%=sr1.getPaymentMode()  %></td>
					<td class="align"><%=sr1.getChequeNum() %></td>
					<td class="align"><%=sr1.getCardNum() %></td>
					<td class="align"><%=sr1.getAccNum() %></td>
					<td class="align"><%=sr1.getBankName() %></td>
					<td class="align"><%=sr1.getInsertDate() %></td>
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
                                    <input type="button" class="ui positive button" name="btn" value="Back" onclick="Back()"  >
                                 
                                       
                                </div>
                            </div>
				</div>
			</div>

	<%@include file="commons/newFooter.jsp" %>
	
</div>

 								