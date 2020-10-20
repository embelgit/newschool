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

<title>Certificate Issue Report</title>
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
 --> <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
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


 <div class="container col-md-offset-2" style="float: left"> 
 		
 		<div class="row">
			<div align="center" style="margin-top: 75px">
				  <h2 class="form-name style_heading">Certificate Issued Report</h2>
			</div>
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
		</ul>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		<div class="row"></div>
		
<div class="tab-content" style="float: left">
<!-- 	For class Name entry -->
	<div id="home" class="tab-pane fade in active">
		<form class="form-horizontal">

			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
								ClassInfoDao classDao = new ClassInfoDao();
								List classList = classDao.getAllMainClass();
							%>

							<input list="classes_Student" id="fk_class_id_Student" class="form-control" onchange="getDivisionNameByClassNameLeavingCertificateReport()">
							<datalist id="classes_Student">
							 <%
 	                            for (int i = 0; i < classList.size(); i++) {
 		                        ClassInfoHibernate classBean = (ClassInfoHibernate) classList.get(i);
                             %>

							<option data-value="<%=classBean.getPkClassId()%>"
								value="<%=classBean.getClas()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

						<%-- 	<%
								DivisionInfoDao divDao = new DivisionInfoDao();
								List divList = divDao.getAllMainDivision();
							     %>

							<input list="division_Student" id="fk_division_id_Student" class="form-control" onchange="getSudentName()">
							<datalist id="division_Student"> <%
									for (int i = 0; i < divList.size(); i++) {
										DivisionInfoHibernate divBean = (DivisionInfoHibernate) divList.get(i);
								%>

							<option data-value="<%=divBean.getPkDivisionId()%>"
								value="<%=divBean.getDivision() %>">
								<%
										}
									%>
							
							</datalist> --%>
							
							
							<input list="division_Student" id="fk_division_id_Student" class="form-control" onchange="getSudentName()">
							<datalist id="division_Student"></datalist>
							
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="viewLCIssued()" value="View LC Report" />
					</div>
				</div>
			</div>
			<div class="table-responsive">
					<table id="lc" class="display" style=" border: 2px solid black;border-collapse: collapse;">
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
	
		<!-- For Bonafied -->
		<div id="bonafide" class="tab-pane">
		<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
								ClassInfoDao bonaDao = new ClassInfoDao();
								List bonaList = bonaDao.getAllMainClass();
							%>

							<input list="classes_Bona" id="fk_class_id_Bona" class="form-control" onchange="getDivisionNameByClassNameBonafideCertificateReport()">
							<datalist id="classes_Bona">
							 <%
 	                            for (int i = 0; i < bonaList.size(); i++) {
 		                        ClassInfoHibernate bonaBean = (ClassInfoHibernate) bonaList.get(i);
                             %>

							<option data-value="<%=bonaBean.getPkClassId()%>"
								value="<%=bonaBean.getClas()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%-- <%
								DivisionInfoDao divBonaDao = new DivisionInfoDao();
								List divBonaList = divBonaDao.getAllMainDivision();
							     %>

							<input list="division_Student_bona" id="fk_division_id_Student_bona" class="form-control" onchange="getSudentName()">
							<datalist id="division_Student_bona"> <%
									for (int i = 0; i < divBonaList.size(); i++) {
										DivisionInfoHibernate divBonaBean = (DivisionInfoHibernate) divBonaList.get(i);
								%>

							<option data-value="<%=divBonaBean.getPkDivisionId()%>"
								value="<%=divBonaBean.getDivision() %>">
								<%
										}
									%>
							
							</datalist> --%>
							
							
							<input list="division_Student_bona" id="fk_division_id_Student_bona" class="form-control" onchange="getSudentName()">
							<datalist id="division_Student_bona"></datalist>
							
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="viewBonafideIssued()" value="View Bonafide Report" />
					</div>
				</div>
			</div>
						<div class="table-responsive">
					<table id="bonafideTable" class="display" style=" border: 2px solid black;border-collapse: collapse;">
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

	<!-- nirgum -------------------------------  -->
	
			<div id="nirgum" class="tab-pane">
		<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
								ClassInfoDao bonaDaoo = new ClassInfoDao();
								List bonaListt = bonaDaoo.getAllMainClass();
							%>

							<input list="classes_nir" id="fk_class_id_nir" class="form-control" onchange="getDivisionNameByClassNamenirgumCertificateReport();">
							<datalist id="classes_nir">
							 <%
 	                            for (int i = 0; i < bonaListt.size(); i++) {
 		                        ClassInfoHibernate bonaBean = (ClassInfoHibernate) bonaList.get(i);
                             %>

							<option data-value="<%=bonaBean.getPkClassId()%>"
								value="<%=bonaBean.getClas()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							
							<input list="division_Student_nir" id="fk_division_id_Student_nir" class="form-control" onchange="getSudentName()">
							<datalist id="division_Student_nir"></datalist>
							
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="viewnirgumIssued()" value="View Nirgum Report" />
					</div>
				</div>
			</div>
						<div class="table-responsive">
					<table id="nirgumTable" class="display" style=" border: 2px solid black;border-collapse: collapse;">
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
	<%@include file="commons/newFooter.jsp" %>