<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.StoreManagementHibernate"%>

<% boolean isHome=false;%>        
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
<title>Stock Report</title>

<!-- For datatable to pdf,print,excel etc conversion -->
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>  -->
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<!-- <script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script> -->

<!-- <script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script> -->
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
                            <h1>Store Report</h1>
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
<ul class="nav nav-tabs">
	    	<li class="active"><a data-toggle="tab" href="#home"><h4 style="color:blue">Range Wise</h4></a></li>
	    	<li><a data-toggle="tab" href="#bonafide"><h4 style="color:blue">Product Name Wise</h4></a></li>
	
		</ul>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		<div class="row"></div>
         
         
         
    <!--         <div class="panel-body panel-form"> -->
    
    <div class="tab-content" style="float: left">
<!-- 	For class Name entry -->
	<div id="home" class="tab-pane fade in active">
	
		
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
							 <input type="date" id='fdate' name="fdate" class="form-control"  >
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
							 <input type="date" id='sdate' name="sdate" class="form-control">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-6" >
						
								 <input type="button" class="ui positive button" name="btn" value="Search" onclick="stockBetweenTwoDate()" >
                                       
                                </div>
					</div>
				</div>
			
			
			<div id="dataTab">
			 <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf"
					 	id="stockRep" class="display"
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
	<!-- product ------------------------------------------------------- -->
	
	
			<div id="bonafide" class="tab-pane">
		<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Product Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
								ClassInfoDao bonaDao = new ClassInfoDao();
								List bonaList = bonaDao.getAllproduct();
							%>

							<input list="product" id="fk_prodct" class="form-control">
							<datalist id="product">
							 <%
 	                            for (int i = 0; i < bonaList.size(); i++) {
 	                            	StoreManagementHibernate bonaBean = (StoreManagementHibernate) bonaList.get(i);
                             %>

							<option data-value="<%=bonaBean.getPkStoreManagementId()%>"
								value="<%=bonaBean.getProductName()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>
						 <div class="col-sm-2" align="right">
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="stockproductwise()" value="Search" style="margin-left: 100px;"/>
					</div> 
				</div>
			</div>

			<!-- <div class="row">
				<div class="form-group">
					 <div class="col-sm-2" align="right">
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="stockproductwise()" value="Search" style="margin-left: 100px;"/>
					</div> 
				</div>
			</div> -->
			
			<div id="dataTab1">
			 <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf"
					 	id="stockReppr" class="display"
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
	
</div>
	<%@include file="commons/newFooter.jsp" %>		