<%@page import="com.srb.hibernate.ExpenditureDetailsBean"%>
<%@page import="com.srb.dao.ExpenditureDetailsDao"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
<title>Expenditure Payment Report</title>
<!-- For datatable to pdf,print,excel etc conversion --><!-- 
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>  -->
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
<script type="text/javascript" src="/srb/staticContent/JS/cashbankbook.js"></script>

    <script>
	     $(document).ready(function(){
	    	 getExpensePaymentDetailsBetTwoDays();
	}); 
	</script>
	</head>
	
<body class="sidebar-mini  pace-done"><div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
<div class="pace-progress-inner"></div>
</div>
<div class="pace-activity"></div></div>
        <div class="se-pre-con" style="display: none;"></div>

        <!-- Site wrapper -->
        <div class="wrapper">
      


            <!-- =============================================== -->
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper" style="min-height: 497px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><i class="pe-7s-world"></i></div>
                        <div class="header-title">
                            <h1>Expenditure Payment Report</h1>
                            <small> Between Two Dates</small> 
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
	
                <!-- Main content -->
                <div class="content"> 

                    <!-- alert message -->
                                        
                   
		
	<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
								<label class="col-md-1 control-label" for="expenditureName">Expenditure Name:</label>
								</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>
										<%
											ExpenditureDetailsDao exdd = new ExpenditureDetailsDao();
											List exList = exdd.getAllExpenseName();
										%>
										<input list="exp_drop" id="expenseName" class="form-control">
										<datalist id="exp_drop">
											<%
												for (int i = 0; i < exList.size(); i++) {
													ExpenditureDetailsBean expbean = (ExpenditureDetailsBean) exList
															.get(i);
											%>
											<option data-value="<%=expbean.getPkExpenseDetailsId()%>"
												value="<%=expbean.getExpenseName()%>">
												<%
													}
												%>
											
										</datalist>
									</div>
								</div>
								
								<div class="col-md-2"  align="right">
									<label class="control-label">Start Date:</label>
									</div>
										<div class="col-sm-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="date" id="fisDate4" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>
								</div>
							</div>


            <div class="row">
				<div class="form-group">
										<label class="col-md-3 control-label" for="endDate">End Date:</label>
									
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="date" id="endDate4" placeholder="End Date"
													class="form-control input-md ac_district" type="text">
											</div>
										</div>
											
									
                                <div class="col-md-2 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" onclick="getExpensePaymentDetailsBetTwoDays()" value="Search">
                                         </div>
                                </div>
                            </div>    
						
							</div>
						</div>


	<table class="table table-bordered table-striped table-condensed cf" id="expenseBetweenTwoDates" class="display" style="border: 2px solid black; border-collapse: collapse;">
					<thead>
											<tr>
											   <th>Expense Name</th>
												<th>Payment Date</th>
												<th>Service Provider</th>
												<th>Credit Amount</th>
												<th>Debit Amount</th>
												<th>Accountant Name</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th colspan="3" style="text-align: right">Total:</th>
												<th></th>
												<th></th>
												<th></th>
											</tr>
										</tfoot>
			</form>
		</div>
	</body>
</html>