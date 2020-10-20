<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/srb/WebContent/StaticContent/CSS/css.css" rel="stylesheet">
<script src="/srb/staticContent/JS/Division.js"></script>
</head>
<body>

	<div class="container-fluid">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Division Information</h2>
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
			<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		<form class="form-horizontal">

			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='division' name="division" class="form-control"  placeholder="division">
						</div>
					</div>
					
					<div class="col-md-2"  align="right">
						<label class="control-label">Class Room No.:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='classRoom' name="classRoom" class="form-control"  placeholder="class Room">
						</div>
					</div>
					</div>
				</div>
			
			<div class="container" align="center">
				<input type="button" class="btn btn-success btn-lg" value="Save"
					onclick="DivisionInfo()"> <input
					type="button" class="btn btn-danger btn-lg" value="Cancle"
					onclick="">
			</div>

		</form>
	</div>
</body>
</html>