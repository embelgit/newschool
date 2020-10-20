<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>


<html>
<head>
     <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script>
	 <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     <link rel="stylesheet" href="/srb/staticContent/y_css/jquery-ui.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
     <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui-min.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>

<script src="/srb/staticContent/JS/Class_Division_Subject.js"></script>
<link rel="stylesheet" href="/srb/staticContent/CSS/bootstrap.min.css">
<body>

	<div class="container-fluid">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Class Division Subject Association</h2>
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

 <form class="form-horizontal">

			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainClass();
							%>

							<input list="clas" id="fk_class_id1" class="form-control" onchange="getDivSubInfo()">
							<datalist id="clas">
							 <%
 	                            for (int i = 0; i < sList.size(); i++) {
 		                        ClassInfoHibernate sup = (ClassInfoHibernate) sList.get(i);
                             %>

							<option data-value="<%=sup.getPkClassId()%>"
								value="<%=sup.getClas()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision();
							     %>

							<input list="division" id="fk_division_id" class="form-control">
							<datalist id="division"> <%
									for (int i = 0; i < sList2.size(); i++) {
										DivisionInfoHibernate sup = (DivisionInfoHibernate) sList2.get(i);
								%>

							<option data-value="<%=sup.getPkDivisionId()%>"
								value="<%=sup.getDivision() %>">
								<%
										}
									%>
							
							</datalist>
						</div>
					</div>
				</div>
			</div>

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

				
		            <div class="col-sm-2" align="right">
						<label class="control-label">Academic Year:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
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
			
			<div class="table-responsive	row">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
			<!-- </div> -->
		  </div>
		
			 <div class="row form-group" >
          
          </div>

			<div class="container" align="center">
				<input type="button" class="btn btn-success btn-lg" value="Save" onclick="ClassDivisionSubjectAssoc()"> 
				<input type="button" class="btn btn-danger btn-lg" value="Cancle" onclick="">
			</div>

		</form>
	</div>
</body>
</html>