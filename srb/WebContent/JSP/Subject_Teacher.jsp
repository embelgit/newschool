<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/srb/staticContent/JS/Subject_Teacher.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/srb/WebContent/StaticContent/CSS/css.css" rel="stylesheet">
</head>
<body>

	<div class="container-fluid">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Teacher Subject Association</h2>
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
						<label class="control-label">Subject Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
							SubjectInfoDao sdd2 = new SubjectInfoDao();
							List sList3 = sdd2.getAllMainSubject();
							 %>

								<input list="subject" id="fk_subject_id" class="form-control">
								<datalist id="subject">
								 <%
									for (int i = 0; i < sList3.size(); i++) {
									SubjectInfoHibernate sup = (SubjectInfoHibernate) sList3.get(i);
								 %>

								<option data-value="<%=sup.getPkSubjectId()%>"
									value="<%=sup.getSubject()%>">
									<%
										}
									%>
								
								</datalist>
						</div>
					</div>


					<div class="col-md-2" align="right">
						<label class="control-label">Teacher name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
							TeacherInfoDao sdd3 = new TeacherInfoDao();
							List sList4 = sdd3.getAllMainTeacher();
							 %>
							 <input list="teacherName" id="fk_teacher_id" class="form-control">
								<datalist id="teacherName">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
									TeacherInfoHibernate sup = (TeacherInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherId()%>"
									value="<%=sup.getFirstName()%>  <%=sup.getLastName()%>">
									<%
										}
									%>
								</datalist>
							</div>
						</div>
					</div>
				</div>
				</div>
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Academic Year:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='academicYear' list="academicYear1" name="academicYear" class="form-control">
                                   <datalist id="academicYear1">
                                     <option data-value="2015-2016" value="2015-2016">
                                     <option data-value="2006-2010" value="2016-2017">
                                     <option data-value="2011-2015" value="2017-2018">
                                     <option data-value="2016-2020" value="2018-2019">
                                     <option data-value="2016-2020" value="2019-2020">
                                    </datalist>  
						</div>
					</div>
				</div>
			</div>
			
			<div class="container" align="center">
				<input type="button" class="btn btn-success btn-lg" value="Save" onclick="SubjectTeacherAssoc()"> 
				<input type="button" class="btn btn-danger btn-lg" value="Cancle" onclick="">
			</div>

		</form>
	</div>
</body>
</html>
	<%@include file="commons/newFooter.jsp" %>