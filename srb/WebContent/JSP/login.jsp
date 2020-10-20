<!DOCTYPE html>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>

<%-- <%
   String abc = "english";
%> --%>

<% 
   String abc = "english";
   if (session != null) {
   
   if (session.getAttribute("lan") != null) {
	   abc = (String) session.getAttribute("lan");
   }}
   else{
	   abc="english";
   }
 %>


<head>

   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="description" content="" />
   
    <title>Login Page</title>
<script src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script>
<script src="/srb/staticContent/JS/logout.js"></script>

    <!-- jQuery -->
    <script src="/srb/staticContent/JS/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/srb/staticContent/JS/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/srb/staticContent/JS/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/srb/staticContent/JS/sb-admin-2.js"></script>
        <link rel="shortcut icon" href="http://hospitalnew.bdtask.com/demo6/assets/images/icons/77a6d497de707b3241647556f9fd92ca.png">

        <!-- Bootstrap --> 
        <link href="/srb/staticContent/new/css/bootstrap.min.css" rel="stylesheet" type="text/css">
                
        <!-- 7 stroke css -->
        <link href="/srb/staticContent/new/css/pe-icon-7-stroke.css" rel="stylesheet" type="text/css">

        <!-- style css -->
        <link href="/srb/staticContent/new/css/custom.css" rel="stylesheet" type="text/css">
        

</head>


 <body>
        <!-- Content Wrapper -->
        <div class="login-wrapper"> 
            <div class="container-center">
                <div class="panel panel-bd">
                    <div class="panel-heading">
                        <div class="view-header">
                            <div class="header-icon">
                                <img src="/srb/staticContent/Images/school.jpg" style="
    width: 75px;
">
                            </div>
                            <div class="header-title">
                                <h3> School</h3>
                                <small><strong>Please Log In</strong></small>
                            </div>
                        </div>
                        <div class="">
                        <br><br>
                            <!-- alert message -->
                                                        
                                                        
                             
                        </div>
                    </div>


                    <div class="panel-body">
                        <form name="Login" action="http://hospitalnew.bdtask.com/demo6/login" id="loginForm" novalidate="" method="post" accept-charset="utf-8">
<input type="hidden" name="csrf_stream_token" value="8fca9ec16bb8b44790d437776804814a">                             
                            <div class="form-group">
                                <label class="control-label" for="email">User Name</label>
                                <input type="text" placeholder="User Name" name="uname" id="uname" type="text" autofocus class="form-control"> 
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="password">Password</label>
                                <input type="password" placeholder="Password" name="pass" id="pass"  value="" class="form-control"> 
                            </div>
                            <!-- <div class="form-group">
                                <label class="control-label" for="user_role">User Role</label>
                                <select name="user_role" class="form-control" id="user_role">
<option value="" selected="selected">Select User Role</option>
<option value="1">Admin</option>
<option value="2">Principle</option>
<option value="3">Teacher</option>

</select>
                            </div>  -->
                            <div> 
                                <button type="button" onclick="login()" class="btn btn-success">Log In</button> 
                                 <button type="reset"  class="btn btn-md  btn-danger"> <span class=""></span>Reset</button>
                                 <!--  <button type="reset"  class="btn btn-md  btn-success"> <span class=""></span>Clear</button> -->
                            </div>
                        </form>
                    </div>




                </div>
            </div>
        </div>
<!-- 
<body background="/srb/staticContent/Images/background.jpg" style="
    background-repeat: no-repeat;
    background-position: center;
">
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="font-weight: bold;">Please Login :</h3>
                                                                            
                    </div>
                    <div class="panel-body">
                        <form action="Login" method="post">
                            <div>
                                <div class="form-group">
									<label><span class="glyphicon glyphicon-user"></span>User Name :</label>
                                    <input class="form-control" placeholder="Username" name="uname" id="uname" type="text" autofocus>
                                </div>
                                <div class="form-group">
									<label><span class="glyphicon glyphicon-eye-open"></span>Password :</label>
                                    <input class="form-control" placeholder="Password" name="pass" id="pass" type="password" value="">
                                </div>
                              
                                Change this to a button or input when using this as a form
                                <div class="wrapper">
	                                <button type="button" onclick="login()" class="btn btn-md btn-lg btn-success"> <span class="glyphicon glyphicon-ok-circle"></span>Login</button>
	                                <button type="reset"  class="btn btn-md btn-lg btn-danger"> <span class="glyphicon glyphicon-remove-circle"></span>Reset</button>
	                            </div>
	                            <div class="form-group">
	                            <a href="/Fertilizer/jsp/userDetails.jsp">New User Registration</a>
	                            </div> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="float: right;">
            	<div class="col-md-2">
            		<label>Select language:</label>
            	</div>
            	<div class="col-md-2">
            		<select class="selectpicker" id="language" name="language" data-style="btn-primary" onchange="language()">
            		    <option value="select">select Language</option>
 						<option value="marathi">Marathi</option>
 						<option value="english">English</option>
					</select>
            	</div>
            </div>
        </div>
    </div> -->
</body>
</html>