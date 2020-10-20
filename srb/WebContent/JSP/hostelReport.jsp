<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>

<title>Hostel Inventory Report</title>
<!-- For datatable to pdf,print,excel etc conversion -->
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>  -->
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

<script type="text/javascript" src="/srb/staticContent/JS/storeManagement.js"></script>
</head>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Hostel Report</h1>
                            <small>Report</small> 
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
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>Class List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="divList()" accesskey="t""> <i class="fa fa-list"></i>Division List </a>  
                </div> -->
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		
		<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Start Date:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calender"></i>
							</span>
							 <input type="date" id='fdatee' name="fdatee" class="form-control"  >
						</div>
					</div>

					<div class="col-sm-2" align="right">
					<label class="control-label">End Date:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calender"></i>
							</span>
							 <input type="date" id='sdatee' name="sdatee" class="form-control">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5" >
						
								 <input type="button" class="ui positive button" name="btn" value="Search" onclick="hostelstockBetweenTwoDate()" style="margin-left: 185px;">
                                       
                                </div>
					</div>
				</div>
				</form>
			</div>
			
			<div id="dataTab">
			 <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf"
					 	id="stockRepp" class="display"
					  style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
							   
							    <th>Bill Number</th>
							    <th>Purchase Date</th>
								<th>Product Name</th>
								<th>Supplier Name</th>
								<th>Buy Price</th>
								<th>Quantity</th>
								<th>Total Amount</th>
								
							</tr>
						</thead>
						<tfoot>
						</tfoot>
					</table>
			 </div>
		 </div>
			
	</form>	
</div>
	<%@include file="commons/newFooter.jsp" %>		