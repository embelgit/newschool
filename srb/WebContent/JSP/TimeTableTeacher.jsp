<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  <script src="grid.js"></script>
  
        <script type="jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" href="jquery-ui.min.css">
	    <link rel="stylesheet" href="ui.jqgrid.min.css">
	    <link rel="stylesheet" href="ui.jqgrid.css">
	    <script type="text/javascript" src="jquery.min.js"></script>
	    <script type="text/javascript" src="jquery.jqgrid.min.js"></script>
	
</head>
<body>

	<div class="container-fluid">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Time Table Creation For
					Teacher</h2>
			</div>
		</div>

		<div class="row">
			<div class="form-group" align="right">
				<div class="col-sm-offset-6 col-md-5 control-label">
					<div id="date">
						<label id="demo"></label>
						<script>
							   var date = new Date();
							   document.getElementById("demo").innerHTML = date.toDateString();
							</script>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>

		<div class="row" align="center" style="margin-bottom: 50px">
			<div class="col-sm-10 col-sm-offset-1">
				<div class="row margin-t-13">
					<div class="">
						<ul class=" col-sm-offset-4 nav nav-tabs">
							<li class="list-group-item list-group-item-info"><a
								data-toggle="tab" href="#home">Create Time Table</a></li>
							<li class="list-group-item list-group-item-danger"><a
								data-toggle="tab" href="#TimeTableStudent.jsp">For Student</a></li>
							<li class="list-group-item list-group-item-success"><a
								data-toggle="tab" href="#For Teacher">For Teacher</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group">
				<div class="col-sm-4 col-sm-offset-1" align="right">
					<label class="control-label">Teacher:</label>
				</div>
				<div class="col-md-3">
					<div class="selectContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-list" id="teacher"></i></span> <select
								name="teacher" id='teacher' class="form-control selectpicker">
								<option value="Teacher Name">Teacher Name</option>
								<option></option>
								<option value="Sumit">Sumit</option>
								<option value="Srimant">Srimant</option>
								<option value="Guru">Guru</option>
								<option value="Amol">Amol</option>
								<option value="popat">popat</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Sr No.:</label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-folder-open"></i>
						</span> <input type="text" id='srNo' name="srNo" id="srNo"
							class="form-control" placeholder="Enter Sr No.">
					</div>
				</div>

				<div class="col-sm-2" align="right">
					<label class="control-label">Time:</label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-time"></i></span> <input type="text"
							id='time' name="time" class="form-control" id="time"
							placeholder="Enter time" />
					</div>
				</div>
			</div>
		</div>

		<!-- <script type="text/javascript">
					$(function() {
						$('#datetimepicker3').datetimepicker({
							format : 'LT'
						});
					});
				</script> -->
			
	<div class="row">
		<div class="form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
				<label class="control-label">Day:</label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-list" id="day"></i></span> <select name="day"
						id='day' class="form-control selectpicker">
						<option value="0">Monday</option>
						<option value="1">Tuesday</option>
						<option value="2">Wednesday</option>
						<option value="3">Thursday</option>
						<option value="4">Friday</option>
						<option value="5">Saturday</option>
						<option value="6">Sunday</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	        <div class="row buttons_margin_top">
				<div align="center">
					<input type="button"
						class="btn btn-lg btn-success btn-md button_hw button_margin_right"
						name="btn" value="Generate" onclick=""/>
						 <input type="reset"
						class="btn btn-lg btn-danger btn-md button_hw button_margin_right"
						onclick="" value="Clear" />
				</div>
			</div>
	
</div>
</body>
</html>				
		<%@include file="commons/newFooter.jsp" %>				