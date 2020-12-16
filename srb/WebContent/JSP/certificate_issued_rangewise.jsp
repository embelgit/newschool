<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.dao.ExamInfoDao"%>
<%@page import="com.srb.hibernate.ExamNameEntryHibernate"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
<title>Certificate Issue Range wise Report</title>
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

<script type="text/javascript" src="/srb/staticContent/JS/certificate.js"></script>
         <script type="text/javascript" src="/srb/staticContent/JS/exam.js"></script>
</head>

<body>
 <!-- <div class="container col-md-offset-2" style="float: left"> --> 
 	<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/list.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Certificate Issued Range wise Report</h1>
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
                <!-- <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>Class List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="divList()" accesskey="t""> <i class="fa fa-list"></i>Division List </a>  
                </div> -->
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
 		
 		<div class="row">
			<!-- <div align="center" style="margin-top: 75px">
				  <h2 class="form-name style_heading">Certificate Issued Range wise Report</h2>
			</div> -->
			<div id="report" style="text-align: center">
				<label id="demo" align=></label>
				<script>
				   var date = new Date();
				   document.getElementById("demo").innerHTML = date.toDateString();
				</script>
			</div> 	

		</div>
		<ul class="nav nav-tabs">
	    	<li class="active"><a data-toggle="tab" href="#home"><h4 style="color:blue">Leaving Certificate</h4></a></li>
	    	<li><a data-toggle="tab" href="#bonafide"><h4 style="color:blue">Bonafide Certificate</h4></a></li>
	    		    	<li><a data-toggle="tab" href="#nirgum"><h4 style="color:blue">Nirgum Certificate</h4></a></li>
	    		    	<li><a data-toggle="tab" href="#sport"><h4 style="color:blue">Sport Certificate</h4></a></li>
		</ul>
		<!-- <div class="row">
			<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div> -->
	
		
<div class="tab-content" style="float: left">
<!-- 	For class Name entry -->
	<div id="home" class="tab-pane fade in active">
		<div class="row"></div>
		<form class="form-horizontal">

			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Date From:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>
						 <input type="date" id='stdate' name="stdate" class="form-control">
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Date To:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							 <input type="date" id='endate' name="endate" class="form-control"  >
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="viewLCIssuedrangewise()" value="View LC Report" />
					</div>
				</div>
			</div>
			<div class="table-responsive">
					<table id="lcdate" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Date of leaving</th>
								<th>Issued date</th>
							</tr>
						</thead>
					</table>
				</div>
		</form>	
	</div>
	
		<!-- For Bonafied -- --------------------------------------------------------------------------------------------------->
		
		
		<div id="bonafide" class="tab-pane">
		<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Date From:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

						 <input type="date" id='stdatee' name="stdatee" class="form-control">
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Date To:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

						 <input type="date" id='endatee' name="endatee" class="form-control">		
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="viewBonafideIssuedrangewise()" value="View Bonafide Report" />
					</div>
				</div>
			</div>
						<div class="table-responsive">
					<table id="bonafideTablerange" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Issued date</th>
							</tr>
						</thead>
					</table>
				</div>
		</form>	
		
		</div>

<!-- ----------------------------Sport----------------------  -->
<div id="Sport" class="tab-pane">
		<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Date From:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

						 <input type="date" id='stdatee' name="stdatee" class="form-control">
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Date To:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

						 <input type="date" id='endatee' name="endatee" class="form-control">		
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="viewBSportscertiIssuedrangewise()" value="View Bonafide Report" />
					</div>
				</div>
			</div>
						<div class="table-responsive">
					<table id="sporttablerange" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Issued date</th>
							</tr>
						</thead>
					</table>
				</div>
		</form>	
		
		</div>








	
	<!-- nirgum ===================== -->
	
			<div id="nirgum" class="tab-pane">
		<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Date From:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

						 <input type="date" id='stdateee' name="stdateee" class="form-control">
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Date To:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

						 <input type="date" id='endateee' name="endateee" class="form-control">		
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="viewnirgumIssuedrangewise()" value="View Nirgum Report" />
					</div>
				</div>
			</div>
						<div class="table-responsive">
					<table id="nirgumTablerange" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Issued date</th>
							</tr>
						</thead>
					</table>
				</div>
		</form>	
		
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