<!DOCTYPE html>
<!-- <html lang="en"> -->

<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="java.util.List"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>

 <%-- <% 
                       // out.println(""+session.getAttribute("user"));
                 if (session.getAttribute("user")  != null) {
      
                   out.println("");
               }
                 else {
              
               response.sendRedirect("/srb/JSP/login.jsp");
               out.println("Please Login ");
                }
             %> --%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Comoatible" content="IE=edge">
  <title>Dashboard </title>
<!--   <link rel="stylesheet" href="/srb/dashboard/css/main.css" type="text/css"> -->
<link rel="stylesheet" type="text/css" href="/srb/staticContent/CSS/bootstrap_aniket.css">
  <link rel="stylesheet" type="text/css" href="/srb/staticContent/CSS/style_aniket.css">
  <script src="/srb/staticContent/JS/graph.js"></script>
  
 
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
  
</head>
<body onload="getTotalStudentCountForGraph()"> 
<!--  //getTotalStudentCount() -->

<div class="container-fluid display-table" style="padding-left: 290px;padding-top: 40px;">      
      <div class="mailsystem">
       <div class="tile">
            <h3 class="tile-title">Students ID Card</h3>
            
    <form action="" method="POST">
    <div class="row">
    <div class="col-md-6 pt-5">
    <label>Name</label>
    <input type="text" class="form-control" required placeholder="Student Name">
    </div>
    <div class="col-md-6 pt-5">
    <label> Student ID</label>
    <input type="text" class="form-control" required placeholder="Student ID">
    </div>
    </div>
    <div class="row">
    <div class="col-md-6 pt-5">
    <label>Address</label>
    <input type="text" class="form-control" required placeholder="Home Address">
    </div>
    <div class="col-md-6 pt-5">
    <label> Class</label>
    <input type="text" class="form-control" required placeholder="Class">
    </div>
    <div class="col-md-6 pt-5">
    <label> Division</label>
    <input type="text" class="form-control" required placeholder="Division">
    </div>
        <div class="col-md-6 pt-5">
    <label> Mobile No.</label>
    <input type="text" class="form-control" required placeholder="Mobile No.">
    </div>
      <!--  
    <div class="col-md-12 pt-5">
    <label>Message</label>
    <textarea name="message" rows="4" style="
    width: 100%;
    border: 1px solid #c5c1c1;
    border-radius: 10px;
"></textarea>
    </div> -->
    
    <div class="col-md-6 pt-5">
    <label>Upload Photo</label>
    <input type="file" required>
    </div>
                  <div class="col-md-12 pt-5" style="padding: 5px 0;"
                align="center">
                <input type="submit" class="btn btn-primary" value="Print ID Card">
              </div>
    </div>
    </form>
    </div>
    </div>
  
  </div>
  </body>
  
