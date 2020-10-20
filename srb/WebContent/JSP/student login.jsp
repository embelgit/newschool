<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/srb/staticContent/CSS/css.css" rel="stylesheet">
</head>
<body>
<div class="container">

<div class="page-header">
<h1>Student login</h1>
</div>
<form class="form-horizontal">

<div class="row">
				<div class="form-group">
												 <div class="col-md-2 col-sm-offset-1" align="center">
						<label class="control-label">Student Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='firstname' name="firstname"
								id="fn" class="form-control" placeholder="Enter Student name" />
						</div>
					</div>
	 
	 

							 <div class="col-md-2 col-sm-offset-1" align="center">
            <label class="control-label">Medium:</label>
			</div>
			 <div class="col-md-3">
                <div class="selectContainer">
                     <div class="input-group">
                       <span class="input-group-addon"><i class="glyphicon glyphicon-list" id="en"></i></span>
                              <select name="department" class="form-control selectpicker">
									<option value="">Medium</option>
									<option>Marathi</option>
									<option>Semi-english</option>
				
									<option >English</option>
									
									
							  </select>
                     </div>
                
			</div>
     </div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
									 <div class="col-md-2 col-sm-offset-1" align="center">
						<label class="control-label">Class:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='firstname' name="firstname"
								id="fn" class="form-control" placeholder="Enter Class " />
						</div>
					</div>
	 
	 

							 <div class="col-md-2 col-sm-offset-1" align="center">
						<label class="control-label">Division:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='firstname' name="firstname"
								id="fn" class="form-control" placeholder="Enter Division" />
						</div>
					</div>
	 </div>
	 </div>
			


        <div class="container" align="center">
<input type="button" class="btn btn-success btn-lg" value="Save" onclick="location.href='studentDetails.jsp'">	
<input type="button" class="btn btn-danger btn-lg"onclick="location.href='header.jsp'"value="Cancle">	
		</div>







</form>

</div>
</body>
</html>
