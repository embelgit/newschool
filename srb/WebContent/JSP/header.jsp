<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link href="/srb/WebContent/StaticContent/CSS/css.css" rel="stylesheet">
<style>
<body background="/srb/WebContent/staticContent/Images/school.jpg">

/* body  {
    background-image:"/srb/staticContent/Images/bg.jpg";
	background-repeat: no-repeat;
    background-attachment: full;
	
	background-position: center;
    background-size: cover;
} */
</style>
</head>

<body>
 
<div class="container-fluid">


  <nav class="navbar navbar-inverse">
    <div class="navbar-header">
    	<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">Home</a>
	</div>
	
	<div class="collapse navbar-collapse js-navbar-collapse">
		<ul class="nav navbar-nav">
		 <li><a href="#" onclick="location.href='ClassDetails.jsp'">Class Information</a></li>
		 
		 <li><a href="#" onclick="location.href='Course.jsp'">Course Information</a></li>
			
			
			<li class="dropdown">
				   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Exam details <span class="caret"></span></a>				
				      <ul class="dropdown-menu">
					
							<li class="dropdown-header">Exam details</li>
							<li><a href="#" onclick="location.href='add exam.jsp'">Add exam</a></li>
                            <li><a href="#" onclick="location.href='Marks entry.jsp'">Add marks</a></li>
                         
				      </ul>
		   </li>
		   
		   
		   
		   
		   <li class="dropdown">
				   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Student Information<span class="caret"></span></a>				
				      <ul class="dropdown-menu">
					
							<li><a href="#" onclick="location.href='student login.jsp'">Student

							Information</a></li>
							<li><a href="#" onclick="location.href='student registration.jsp'">Student Registration</a></li>
                            <li><a href="#" onclick="location.href='studentDetails.jsp'">Student Details</a></li>
                         
				      </ul>
		   </li>
		   
		   <li class="dropdown">
				   <a href="#" class="dropdown-toggle" data-toggle="dropdown">Staff Information<span class="caret"></span></a>				
				      <ul class="dropdown-menu">
					
							<li class="dropdown-header">Staff Information</li>
							<li><a href="#" onclick="location.href='StaffRegistration.jsp'">Staff Registration</a></li>
                            <li><a href="#" onclick="location.href='Staff management.jsp'">Staff Details</a></li>
                         
				      </ul>
		   </li>
		   
		   

				
            <li class="dropdown">
    			<a href="#" class="dropdown-toggle" data-toggle="dropdown">Result <span class="caret"></span></a>				
				<ul class="dropdown-menu">
					
    					
							<li class="dropdown-header">Result</li>
							<li><a href="#" onclick="location.href='subjectwise.jsp'">Subject wise</a></li>
                            <li><a href="#" onclick="location.href='studentwise.jsp'">Student wise</a></li>
                            
                           
					
					</ul>
					</li>
					
           
		</ul>
        <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">My account <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" onclick="location.href='login.jsp'">Logout</a></li>
           
          </ul>
        </li>
        
      </ul>
	</div><!-- /.nav-collapse -->
  </nav>
  </div>
  
  <!--<center><div class="jumbotron">
<input type="button" onClick="location.href='student registration.html'" value="Student registration" class="btn btn-default btn-lg" id="add marks">
<input type="button" onClick="location.href='studentdetails.html'" value="Student details" class="btn btn-warning btn-lg" id="add marks">
<input type="button" onClick="location.href='exam detail.html'" value="staff registration" class="btn btn-primary btn-lg" id="add marks">
<input type="button" onClick="location.href='exam detail.html'" value="Staff details" class="btn btn-primary btn-lg" id="add marks">-->

</div>
</center>
</div>
</body>
</html>
