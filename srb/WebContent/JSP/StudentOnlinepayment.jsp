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

</div>      
    
</body> 
