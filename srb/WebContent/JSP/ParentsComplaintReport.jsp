<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>


<!-- For datatable to pdf,print,excel etc conversion -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
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

<script type="text/javascript" src="/srb/staticContent/JS/parentsComplaint.js"></script>
</head>


 <div class="container col-md-offset-1" style="float: left"> 
 		
 		<div class="row">
			<div align="center" style="margin-top: 75px">
				  <h2 class="form-name style_heading">Parents Complaint Reports</h2>
			</div>
				 	
			 <div class="row">
				<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color:#c1b1b1;">
				</div>	
			  </div>
		</div>
		
		<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-4" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								style="text-align: right" onclick="ParentsComReport()" value="Search" />
					</div>
				</div>
			</div>
			<div	class="table-responsive">
					<table id="parentsComplaint" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
							    <th>Parents Name</th>
							    <th>Class Name</th>
								<th>Division Name</th>
							    <th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
							    <th>Academic Year</th>
								
								<th>Student Name</th>
								<th>Your Complaint</th>
								<th>Date</th>
								
							</tr>
						</thead>
					</table>
				</div>
			
      </div>
	<%@include file="commons/newFooter.jsp" %>	