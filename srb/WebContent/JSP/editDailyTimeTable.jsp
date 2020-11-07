<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--     <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script>
 -->    <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     <!-- <link rel="stylesheet" href="/AgriSoft/staticContent/css/ui.jqgrid.css"> -->
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
<!-- 	 <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script>
 -->    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
	<script src="/srb/staticContent/JS/Class_Division_Subject_Teacher.js"></script>
	<link rel="stylesheet" href="/srb/staticContent/CSS/bootstrap.min.css">
        <link type="text/css" href="/srb/staticContent/CSS/bootstrap-timepicker.min.css" />
<!--         <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script>
        <script type="text/javascript" src="/srb/staticContent/JS/bootstrap.min.js"></script> -->
        <script type="text/javascript" src="/srb/staticContent/JS/bootstrap-timepicker.min.js"></script>
        
         <script type="text/javascript" src="/srb/staticContent/JS/timeTable.js"></script>
</head>
<body>

<script type="text/javascript">

	function editTimeTable()
	{
		 window.location = "editDailyTimeTable";
	}

</script>

<script type="text/javascript">

	function back()
	{
		window.location = "dailyTimeTable.jsp";
	}

</script>

<script type="text/javascript">
		function clearFiled()
		{
		   /*  document.getElementById("startTime").value="";
		    document.getElementById("endTime").value=""; */
		    document.getElementById("fk_subject_id").value="";
		    document.getElementById("fk_teacher_id").value="";
		    
		}	
	</script>
	
<div class="container-fluid">

		<div class="row header_margin_top">
			<div align="center" style="margin-left: 310px;">
				<h2 class="form-name style_heading" style="margin-top: 30px">Edit Daily Time Table Details</h2>
			</div><hr>
		</div>
		
		<!--   <div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div> -->
		
		
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

       

 <form class="form-horizontal" name="dailyTimeTable">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-2" align="right">
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

							<input list="clas" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassNameDailyTimeTable()">
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

							<%-- <%
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
							
							</datalist> --%>
							
							
							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivision()">
							<datalist id="division"></datalist>
							
						</div>
					</div>
				</div>
			</div>
			
				
				<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-2" align="right">
						<label class="control-label">Academic Year:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
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
					
					<div class="col-md-2" align="right">
						<label class="control-label">Select day:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span> 
							<select class="col-sm-12" id="day" style="height: 30;">
  								<option value="Monday">Monday</option>
								 <option value="Tuesday">Tuesday</option>
								 <option value="Wednesday">Wednesday</option>
								 <option value="Thursday">Thursday</option>
								  <option value="Friday">Friday</option>
								 <option value="Saturday">Saturday</option>
								  <option value="Sunday">Sunday</option>
							</select> 
						</div>
					</div>
				</div>
			</div>
			<div class="row">
			<div class=" form-group">
			<label class="col-md-3 col-sm-offset-1  control-label"  ">Start Time::<sup>*</sup>
						</label>
						<div class="col-md-3  bootstrap-timepicker timepicker" >
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-time"></i>
								</span> 
								 <input id="startTime" type="text" class="form-control input-small">
							</div>
						</div>

			<label class="col-md-2   control-label"  for="endDate" align="right">End Time:<sup>*</sup>
				</label>
				   <div class="col-md-3 bootstrap-timepicker timepicker">
						<div class="input-group">
							<span class="input-group-addon"> <i
									class="glyphicon glyphicon-time"></i>
								</span>
								  <input id="endTime" type="text"  class="form-control input-small" >
							</div>
						</div>
			</div>
			</div>
	        <script type="text/javascript">
	       		 $('#startTime').timepicker();
	            $('#endTime').timepicker();
	        </script>
     
						
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-2" align="right">
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

								<input list="subjectList" id="fk_subject_id" class="form-control">
								<datalist id="subjectList">
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
							 <input list="teacherNameList" id="fk_teacher_id" class="form-control" onchange="EditgridForDailyTimeTable()">
								<datalist id="teacherNameList">
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
			
			
        
		  <div class="table-responsive	row col-md-offset-4" style="margin-top: 20px;">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
			<!-- </div> -->
		  </div>
			
			<!-- <div class="container" align="center">
				<input type="button" style=" height: 65px; width: 225; font-size: 25" class="btn btn-success btn-lg" value="Save" onclick="dailyTimeTableVal()"> 
				<input type="button" style=" height: 65px; width: 225; font-size: 25" class="btn btn-danger btn-lg" value="Cancel" onclick="location.reload();">
				<input style=" height: 65px; width: 180; font-size: 25" type="button" value="Back" id="listBtn" class="btn btn-primary" onclick="back()" />
				
			</div> -->
			 <div class="form-group row">
                                <div class="col-md-offset-5 col-md-5 btn-center" style=" padding-top: 15px;">
                                    <div class="ui buttons">
                                    <button class="ui positive button" name="btn" value="Save" style=" font-size: 15px;" onclick="dailyTimeTableVal();  return false;">Save</button>
                                       
                                        <div class="or"></div>
                                       
                                         <input type="button"  class="ui button" value="Cancel" style=" font-size: 15px;" onclick="location.reload();">
                                         <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Edit" id="listBtn" style=" font-size: 15px;" onclick="back()">Back</button>
                                    </div>
                                </div>
                            </div>
 </form>
    </div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 