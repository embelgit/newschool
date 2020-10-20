<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
 <%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<title>Teacher Daily Task Report</title>
<html>
<head>

<script src="/srb/staticContent/JS/Teacher.js"></script>
  <script type="text/javascript">
	
	 function TeacherTaskList() {
		 window.location = "ListTeacherTask.jsp";
}
</script>

</head>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/task.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Teacher Daily Task</h1>
                            <small>Daily Task</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="TeacherTaskList()" accesskey="t""> <i class="fa fa-list"></i>List </a>  
                </div>
               
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		

			<form class="form-horizontal" >
		<!-- 	<div class="row"> -->
				<div class="row form-group">
				<div class="col-md-2" align="right">
						<label class="control-label">Teacher name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
						<%
							TeacherInfoDao sdd3 = new TeacherInfoDao();
							List sList4 = sdd3.getAllMainTeacher();
							 %>
							 <input list="teacherNameList" id="fk_teacher_id" class="form-control" >
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
						
						<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Academic Year:</label>
					</div>
					<%
					  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
					  			String todayDate = simpleDateFormat.format(new Date());
					  	%>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span> 
							<input type="text" id='academicYear' list="academicYear1" value="<%= todayDate%>" name="academicYear" class="form-control">
                                   <datalist id="academicYear1">
                                     <option data-value="2011-2015" value="2017-2018">
                                     <option data-value="2016-2020" value="2018-2019">
                                     <option data-value="2016-2020" value="2019-2020">
                                     <option data-value="2015-2016" value="2020-2021">
                                     <option data-value="2006-2010" value="2021-2022">
                                    </datalist> 
						</div>
					</div>
				</div>		
				<!-- </div> -->
				
			<!-- <div class="row"> -->
				<div class="row form-group">
					<div class="col-md-2 " align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainClass();
							%>

							<input list="classes" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassName()">
							<datalist id="classes">
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


					<div class="col-sm-2 col-sm-offset-1" align="right">
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

							<input list="division" id="fk_division_id" class="form-control" >
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
							
							
							<input list="division" id="fk_division_id" class="form-control">
							<datalist id="division"></datalist>
							
						</div>
					</div>
				</div>
			<!-- </div> -->
				<div class="row form-group">
					<div class="col-sm-2  " align="right">
						<label class="control-label">Subject Name:</label>
					</div>
					<div class="col-sm-3">
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
					</div>
					
					 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="View" onclick="viewTaskImage()"></button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                        </div>
                                </div>
                            </div>
				
		</form>
	
	</div>
</body>
</html><%@include file="commons/newFooter.jsp" %> 

<!-- ---------------------------------------------------------------------------------------------------------------------- -->







<%-- <%@page import="com.srb.utility.GetImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.srb.utility.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"&gt;
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name=frm method="post" action="./InsertImage">
<table>
<tr><TD ><B>Upload Image</B></TD>
<td><input type="file" name="Image" size="20" value=""></TD>
</tr>
<tr>
<td><input type="submit" height="30" width="62"> </td>
</tr>
<tr>
<TD><b>ClickImage</b>
<%
GetImage udet = new GetImage();
Vector V_ids=new Vector();
V_ids=udet.ImageList();
for(int i=0;i<V_ids.size();i++)
{

String temp[] = new String[2];
int j=i+1;
temp=(String[])V_ids.get(i);

%></TD>
<td><a target='_blank' href='<%=response.encodeURL("RetrieveImage?Image_id="+temp[0])%>' onmouseover='_ScrollStatus("Click here for view", 1);' onmouseout='_StopScrollStatus();' onblur='_StopScrollStatus();'>
<b><%=temp[1]%></b>
</a></TD>

<%

}

%></TR>
</table>

</form>
</body>
</html> --%>





