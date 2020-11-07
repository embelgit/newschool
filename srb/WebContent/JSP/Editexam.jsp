<%@page import="com.srb.hibernate.ExamInfoHibernate"%>
<%@page import="com.srb.dao.ExamInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!--    <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script>
 -->     <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     <!-- <link rel="stylesheet" href="/AgriSoft/staticContent/css/ui.jqgrid.css"> -->
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
<!-- 	 <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script>
 -->    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
    
       	<script type="text/javascript" src="/srb/staticContent/JS/exam.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "Exam.jsp";
	}

</script>
<script type="text/javascript">

function reload()
{
	location.reload();
}

</script>

</head>
<body>
<div class="content-wrapper" style="min-height: 597px;">
              <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Edit Exam Details</h1>
                            <small>Exam Details</small> 
                        </div>
                    </div>
                </section>
                
                <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="Back()" accesskey="t" "=""> <i class="fa fa-list"></i>Add Exam Details</a>  
                </div>
               
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
         <form class="form-horizontal" name="updatesdtv">
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label" >Select Exam Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>	
										<%
							ExamInfoDao ename = new ExamInfoDao();
								List examList = ename.getAllExamNames();
							%>

							<input list="examNameId" id="examName_id" class="form-control" placeholder="Select Exam Name" onchange="getexamdetails();"  placeholder="Select Exam Name">
							<datalist id="examNameId">
							 <%
 	                            for (int i = 0; i < examList.size(); i++) {
 	                            	ExamInfoHibernate ex = (ExamInfoHibernate) examList.get(i);
                             %>

							<option data-value="<%=ex.getPkExamId()%>" value="<%=ex.getExamName()%>">
								<%
									}
								%>
								</datalist>
							</div>
						</div>
							<div class="col-sm-2 " align="right">
						<label class="control-label">Academic Year:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon  glyphicon-calendar"></i>
							</span> 
							<input type="text" id='AcademicYear' name="Academic Year" class="form-control" placeholder="Academic Year" />
						</div>
					</div>
			</div>
			
						<div class="row">
				<div class="form-group">
					

					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
														

							<%
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainClass();
							%>

							<input list="clas" id="fk_class_id" class="form-control" >
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
						<!-- 	 <input type="text" id='ClassName' name="Class Name" class="form-control"  placeholder="Class Name"> onchange="getDivisionAsPerClass()-->
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
								<%
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
							
							</datalist>
							<!-- <input type="text" id='divisionName' name="divisionName" class="form-control" placeholder="Division Name" /> -->
						</div>
					</div>
					
				</div>
			</div>
			
 		<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Subject Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-book"></i>
							</span>

							<%
							SubjectInfoDao sdd2 = new SubjectInfoDao();
							List sList3 = sdd2.getAllMainSubject();
							 %>

							<input list="subjectList" id="fk_subject_id" class="form-control" autofocus="autofocus">
							<datalist id="subjectList"> <%
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
			</div>

			
		<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Total Marks:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='totalmarks' name="totalmarks" class="form-control" placeholder="totalmarks" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Passing Marks:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='Passingmarks' name="Passingmarks" class="form-control"  placeholder="Passingmarks">
						</div>
					</div>
				</div>
			</div>
					  <div class="table-responsive	row col-md-offset-1" style="margin-left: 260px">
				<table id="list5" ></table>
				<div id="jqGridPager1"></div>
			<!-- </div> -->
		  </div>
		<br><br>
		        <div class="form-group row">
                        <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" onclick="updateExamName()">Save
                                       
                                        <div class="or"></div>
                                         <button type="reset" onclick="location.reload()" class="ui button"  >Reset</button>
                                        </div>
                                </div>
                   </div>
</form>
</div>
</div>
</div>
 </div>
 </div>
 </div>
<%-- 
<div class="container-fluid">

		

</div> --%>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 