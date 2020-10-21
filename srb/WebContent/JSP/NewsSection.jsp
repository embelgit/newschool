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
  <title>News Section </title>
<!--   <link rel="stylesheet" href="/srb/dashboard/css/main.css" type="text/css"> -->
<link rel="stylesheet" type="text/css" href="/srb/staticContent/CSS/bootstrap_aniket.css">
  <link rel="stylesheet" type="text/css" href="/srb/staticContent/CSS/style_aniket.css">
  <script src="/srb/staticContent/JS/graph.js"></script>
  
 
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   
    <!-- Theme style -->
        <link href="/srb/staticContent/new/css/custom.css" rel="stylesheet" type="text/css">
        <link href="/srb/staticContent/new/css/font.css" rel="stylesheet" type="text/css">
        <link href="/srb/staticContent/new/css/font2.css" rel="stylesheet" type="text/css">
        <link href="/srb/staticContent/new/css/css.css" rel="stylesheet" type="text/css">
        
  
</head>
<body onload="getTotalStudentCountForGraph()"> 
<!--  //getTotalStudentCount() -->

<div class="container-fluid display-table" style="padding-left: 290px;padding-top: 40px;">  
<h2>News Section</h2>
  <div class="row">
    <div class="col-sm-6 col-md-4 ">
      <div class="blog-grid-box">
              <div class="thumb">
                <img src="https://www.adair.k12.ky.us/docs/_full_/district/school_news_banner.jpg?id=20662&thumbwidth=190&fullwidth=500" 
                alt="image">
              </div>
              <div class="title pt-3">
              <h2>Latest News</h2>
                <p>
                  A school is an educational institution designed to provide learning spaces and learning environments for the teaching of students (or "pupils") under the direction of teachers. 
                </p>
              </div>
    </div>
    </div>
    
     <div class="col-sm-6 col-md-4">
      <div class="blog-grid-box">
              <div class="thumb">
                <img src="https://image1.slideserve.com/2924326/school-and-achievement-l.jpg" 
                alt="image">
              </div>
              <div class="title pt-3"> 
                <h2>School Achivement</h2>
                <p>
                School performance or academic achievement is the extent to which a student, teacher or institution has attained their short or long-term educational goals.
                </p>
              </div>
    </div>
    </div>
    
     <div class="col-sm-6 col-md-4">
      <div class="blog-grid-box">
              <div class="thumb">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI85NpQ7vnWqt826WROIifyW3r5LgytdOxtw&usqp=CAU" 
                alt="image">
              </div>
             <div class="title pt-3"> 
               <h2>School Security</h2>         
                <p>
                School security encompasses all measures taken to combat threats to people and property in education environments.
                </p>
              </div>
    </div>
    </div>
   
</div> 
</div>   
</body>

