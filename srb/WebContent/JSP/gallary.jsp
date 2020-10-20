<!DOCTYPE html>
<!-- <html lang="en"> -->

<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="java.util.List"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%
	boolean isHome = false;
%>
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
<title>Dashboard</title>
<!--   <link rel="stylesheet" href="/srb/dashboard/css/main.css" type="text/css"> -->
<link rel="stylesheet" type="text/css"
	href="/srb/staticContent/CSS/bootstrap_aniket.css">
<link rel="stylesheet" type="text/css"
	href="/srb/staticContent/CSS/style_aniket.css">
<script src="/srb/staticContent/JS/graph.js"></script>


<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body onload="getTotalStudentCountForGraph()">
	<!--  //getTotalStudentCount() -->

	<div class="container-fluid display-table"
		style="padding-left: 290px; padding-top: 40px;">
		<div id="myNav" class="overlay">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<div class="overlay-content" style="width: 40%;">
				<div class="tile">
					<h3 class="tile-title">Add New Gallery</h3>
					<form action="" class="form-group" method="post">
						<div class="row">
							<div class="col-md-12 pt-5">
								<label style="padding: 5px 0;">Upload Photo</label> <input
									type="file" style="padding: 5px 0;">
							</div>
							<div class="col-md-12 pt-5" style="padding: 5px 0;"
								align="center">
								<input type="submit" class="btn btn-primary" value="Submit">
							</div>
						</div>
					</form>

				</div>
			</div>
		</div>

		<button class="addnew" onclick="openNav()">
			<i class='fa fa-plus-circle pr-1' style='color: #fff'></i>Add New
		</button>
		<div class="row">

			<div class="column">
				<img
					src="https://billabonghighkanpur.com/wp/wp-content/uploads/2017/02/2017-sports-day-Full-Compress.jpg"
					alt="Sport" style="width: 100%" onclick="myFunction(this);">
			</div>
			<div class="column">
				<img
					src="https://walnut.school/wp-content/uploads/2019/02/IMG_6848-1024x683.jpg"
					alt="Anual Event" style="width: 100%" onclick="myFunction(this);">
			</div>
			<div class="column">
				<img
					src="https://www.udaipurblog.com/news/wp-content/uploads/2016/03/technoholix-550x388.jpg"
					alt="Technical Event" style="width: 100%"
					onclick="myFunction(this);">
			</div>
			<div class="column">
				<img
					src="https://cdn.shortpixel.ai/client/q_lossy,ret_img,w_720,h_480/https://www.dsu.edu.pk/wp-content/uploads/2019/05/3-1.jpg"
					alt="Farewell" style="width: 100%" onclick="myFunction(this);">
			</div>
		</div>


		<span onclick="this.parentElement.style.display='none'"
			class="closebtn">&times;</span> <img id="expandedImg"
			style="width: 100%">
		<div id="imgtext"></div>

	</div>
	<script>
		function myFunction(imgs) {
			var expandImg = document.getElementById("expandedImg");
			var imgText = document.getElementById("imgtext");
			expandImg.src = imgs.src;
			imgText.innerHTML = imgs.alt;
			expandImg.parentElement.style.display = "block";
		}
	</script>
	<script>
		function openNav() {
			document.getElementById("myNav").style.width = "80%";
		}

		function closeNav() {
			document.getElementById("myNav").style.width = "0%";
		}
	</script>
</body>