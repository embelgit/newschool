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
  <title>Thoughts </title>
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
 <div class="heading " >    
    <h2>Thoughts</h2>
    </div>
   <div class="row">
      <div class="col-sm-6 col-sm-4 ">
       <div class="thought">
          <h3>I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel</q></h3>
          <h5 class="author text-right">- Maya Angelou</h5>
          <h6>21/10/2020</h6>
          
       </div>
       </div>
       
        <div class="col-sm-6 col-sm-4">
       <div class="thought">
          <h3>Fairy tales are more than true: not because they tell us that dragons exist, but because they tell us that dragons can be beaten.</h3>
          <h5 class="author text-right">- Neil Gaiman</h5>
          <h6>21/10/2020</h6>
       </div>
       </div>
       
        <div class="col-sm-6 col-sm-4">
       <div class="thought">
          <h3>Be yourself; everyone else is already taken.</h3>
          <h5 class="author text-right">- Oscar Wilde</h5>
          <h6>21/10/2020</h6>
       </div>
       </div>
   </div>
   
</div>

</body> 
