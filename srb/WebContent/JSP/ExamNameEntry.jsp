<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<html>
<head>
<script src="/srb/staticContent/JS/exam.js"></script>
</head>
<body>
<div class="container">

		<div class="container-fluid">

			<div class="row header_margin_top">
				<div align="center">
					<h2 class="form-name style_heading" style="margin-top: 80px">Exam Name Entry</h2>
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

			<form class="form-horizontal" name="examName">

				
			
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Exam Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='examNameEntry' name="examNameEntry" class="form-control" placeholder="Enter Exam Name Entry" />
						 </div>
					  </div>
				</div>
			</div>
	
		
		<div class="form-group row" >
		    <div class="col-md-14 text-center">
			   <input type="button" id="btn1" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn1" onclick="ExamNameEntryValidation()" value="Submit">
		       <input type="reset" id="save" style="font-size: 25" class="btn btn-large btn-danger button-height-width" name="btn1" value="Cancel">
			</div>
		</div>
				
		</form>
	</div>
	</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %>