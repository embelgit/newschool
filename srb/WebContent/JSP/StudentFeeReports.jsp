<%@page import="com.srb.dao.StudentInfoDao"%>
<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
<title>Student Fee Report</title>
		<!-- <script src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script> -->
		<script type="text/javascript" src="/srb/staticContent/JS/selectjj.js"></script>
		<script type="text/javascript" src="/srb/staticContent/JS/buttom.js"></script>
		<!-- <script src="/srb/staticContent/JS/jquery.min.js"></script> -->
		<script src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
		<script src="/srb/staticContent/JS/jquery.dataTables.js" type="text/javascript"></script>
		<script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
		
		<link href="/srb/WebContent/staticContent/CSS/dataTa.css" rel="stylesheet" type="text/css" media="all" />
		<link href="/srb/staticContent/CSS/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css" media="all">
		<link href="/srb/staticContent/CSS/select.css" rel="stylesheet" type="text/css" media="all">
		<link href="/srb/staticContent/CSS/button.css" rel="stylesheet" type="text/css" media="all">
		<link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
		<link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">

		<!-- For datatable to pdf,print,excel etc conversion -->
		<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> -->
		<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
		<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		<script type="text/javascript"src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
		
		<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
		<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">
		
		<script src="/srb/staticContent/JS/studentFeeStructureReports.js"></script>
</head>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Student Fee Reports</h1>
                            <small>Fee Reports</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-body panel-form">
                <div class="row">
	
		
  <div class="tab-pane active" id="home">

		

		<ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#supplierSingleDate"><h4 style="color: blue">Student Name Wise</h4></a></li>
		<li><a data-toggle="tab" href="#supplierBetweenTwoDate"><h4 style="color: blue">Class Wise</h4></a></li>

		<li><a data-toggle="tab" href="#dayWise"><h4 style="color: blue">Day Wise</h4></a></li>
		<li><a data-toggle="tab" href="#MonthWise"><h4 style="color: blue">Month Wise</h4></a></li>
		</ul>
	
<!---------- 	CategoryWise Fee reports -------------->

	<div class="tab-content" style="float: left">


		<div id="supplierSingleDate" class="tab-pane active">
	
			
		<form class="form-horizontal" method="post" action="" name="studentWiseForm">
			<fieldset>
			
 				<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Student Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3" style="width: 250px;">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

							<%
							StudentInfoDao sdd = new StudentInfoDao();
							List sList = sdd.getAllStudent();
							%>

							<input list="studentId" id="studentName" class="form-control">
							<datalist id="studentId">
							 <%
 	                            for (int i = 0; i < sList.size(); i++) {
 	                            StudentInfoHibernate sup = (StudentInfoHibernate)sList.get(i);
                             %>

		                     <option data-value="<%=sup.getPkStudentId()%>"
		                     value="<%=sup.getFirstName()%> <%=sup.getMiddleName()%> <%=sup.getLastName()%>">

								<%
									}
								%>
							
							</datalist>
							</div>
						</div>
						  <div class="col-md-2">
                                    <div class="ui buttons">
                                    <input type="button" id="btn" class="ui positive button" name="btn" onclick="studentNameWiseReport()" value="Search">Save</button>
                                       
                                        </div>
                                </div>
					</div>
				</div>
							
       <div class="container">
		<div class="table-responsive">
			<table id="studentPayment" class="display" style=" border: 2px solid black;border-collapse: collapse;">
				<thead>
						<tr>
							<th>First Name</th>
							<th>Middle Name</th>
							<th>Last Name</th>
							<th>Class Name</th>
							<th>Division Name</th>
							<th>Computer Fees</th>
							<th>Exam fees</th>
							<th>Tuition Fees</th>
							<th>Admission Fees</th>
							<th>Medical Fees</th>
							<th>Gymnassium Fees</th>	
							<th>Laboratory Fees</th>
							<th>Stationary Fees</th>
							<th>Competitive Fees</th>
							<th>Hostel Fees</th>
							<th>Mess Fees</th>	
							<th>Uniform Fees</th>
							<th>Raincoat Fees</th>															
							<th>Undergarments Fees</th>		
							<th>Other Fees</th>
							<th>Lump-Sum Fees</th>								
							<th>Academic Year</th>
							<th>Expected Payment Date</th>
							
						</tr>
					</thead>
				</table>
			</div>
			</div>
		</fieldset>
</form>
		</div>
		
	<!------ 	Class Wise ----->
		<div id="supplierBetweenTwoDate" class="tab-pane fade">

			


			<form class="form-horizontal" method="post" action="" name="classForm">
				<fieldset>
				<div class="row">
				 <div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3" style="width: 250px;">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
								ClassInfoDao sdd2 = new ClassInfoDao();
								List sList1 = sdd2.getAllMainClass();
							%>

							<input list="classes" id="harshad" class="form-control" >
							<datalist id="classes">
							 <%
 	                            for (int i = 0; i < sList1.size(); i++) {
 		                        ClassInfoHibernate sup = (ClassInfoHibernate)sList1.get(i);
                             %>

							<option data-value="<%=sup.getPkClassId()%>"
								value="<%=sup.getClas()%>">
								<%
									}
								%>
							</datalist>
						</div>
				</div>
				 <div class="col-md-2">
                                    <div class="ui buttons">
                                    <input type="button" id="btn1" class="ui positive button" name="btn" onclick="classNameWiseReport()" value="Search">Save</button>
                                       
                                        </div>
                                </div>
			</div>
		</div>
		
		<div class="container">
			<div class="table-responsive">
				<table class="table table-bordered table-striped table-condensed cf" id="classWiseFee" class="display"
					style="border: 2px solid black; border-collapse: collapse;">
					<thead>
								<tr>
								<th>First Name</th>
							<th>Middle Name</th>
							<th>Last Name</th>
							<th>Class Name</th>
							<th>Division Name</th>
							<th>Computer Fees</th>
							<th>Exam fees</th>
							<th>Tuition Fees</th>
							<th>Admission Fees</th>
							<th>Medical Fees</th>
							<th>Gymnassium Fees</th>	
							<th>Laboratory Fees</th>
							<th>Stationary Fees</th>
							<th>Competitive Fees</th>
							<th>Hostel Fees</th>
							<th>Mess Fees</th>	
							<th>Uniform Fees</th>
							<th>Raincoat Fees</th>															
							<th>Undergarments Fees</th>		
							<th>Other Fees</th>
							<th>Lump-Sum Fees</th>								
							<th>Academic Year</th>
							<th>Expected Payment Date</th>
							</tr>

							</thead>
						</table>
					</div>
					</div>
				</fieldset>
			</form>
		</div>
		
		<!-- this is Report is for Day Wise -->

     <div id="dayWise" class="tab-pane fade">


		<form class="form-horizontal" method="post" action="" name="dayWiseForm">
			<fieldset>
				<div class="row">
				 <div class="form-group">
					<div class="col-md-3 col-sm-offset-1"  align="right">
						<label class="control-label">Expected Payment Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3" style="width: 250px;">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='expectedPaymentDate' name="expectedPaymentDate" class="form-control" />
						</div>
					</div>
					
				<div class="col-md-2">
                                    <div class="ui buttons">
                                    <input type="button" id="btn" class="ui positive button" name="btn" onclick="DayNameWiseReport();" value="Search">Save</button>
                                       
                                        </div>
                                </div>
					</div>
				</div>
			
				<div class="container">
				<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="dayWiseFee" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
								<th>First Name</th>
							<th>Middle Name</th>
							<th>Last Name</th>
							<th>Class Name</th>
							<th>Division Name</th>
							<th>Computer Fees</th>
							<th>Exam fees</th>
							<th>Tuition Fees</th>
							<th>Admission Fees</th>
							<th>Medical Fees</th>
							<th>Gymnassium Fees</th>	
							<th>Laboratory Fees</th>
							<th>Stationary Fees</th>
							<th>Competitive Fees</th>
							<th>Hostel Fees</th>
							<th>Mess Fees</th>	
							<th>Uniform Fees</th>
							<th>Raincoat Fees</th>															
							<th>Undergarments Fees</th>		
							<th>Other Fees</th>
							<th>Lump-Sum Fees</th>								
							<th>Academic Year</th>
							<th>Expected Payment Date</th>
							</tr>

							</thead>

						</table>
					</div>
				</div>
			</fieldset>
		</form>
	 </div>


	

<!-- this is Report is for Month Wise -->

     <div id="MonthWise" class="tab-pane fade">


		<form class="form-horizontal" method="post" action="" name="monthWiseForm">
			<fieldset>
				<div class="row">
				 <div class="form-group">
					<div class="col-md-3 col-sm-offset-1" align="right">
						<label class="control-label">Expected Payment Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3" style="width: 250px;">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='expectedPaymentDate1' name="expectedPaymentDate" class="form-control" />
						</div>
					</div>
					
					
				<div class="col-md-2">
                                    <div class="ui buttons">
                                    <input type="button" id="btn" class="ui positive button" name="btn" onclick="MonthNameWiseReport()" value="Search">Save</button>
                                       
                                        </div>
                                </div>
					</div>
				</div>
				
		
				<div class="container">
				<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="monthWiseFee" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
								<th>First Name</th>
							<th>Middle Name</th>
							<th>Last Name</th>
							<th>Class Name</th>
							<th>Division Name</th>
							<th>Computer Fees</th>
							<th>Exam fees</th>
							<th>Tuition Fees</th>
							<th>Admission Fees</th>
							<th>Medical Fees</th>
							<th>Gymnassium Fees</th>	
							<th>Laboratory Fees</th>
							<th>Stationary Fees</th>
							<th>Competitive Fees</th>
							<th>Hostel Fees</th>
							<th>Mess Fees</th>	
							<th>Uniform Fees</th>
							<th>Raincoat Fees</th>															
							<th>Undergarments Fees</th>		
							<th>Other Fees</th>
							<th>Lump-Sum Fees</th>								
							<th>Academic Year</th>
							<th>Expected Payment Date</th>
							</tr>

							</thead>

						</table>
					</div>
				</div>
			</fieldset>
		</form>
	 </div>
</div> 
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>


<%@include file="commons/newFooter.jsp"%>