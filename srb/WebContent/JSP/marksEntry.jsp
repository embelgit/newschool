<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.srb.hibernate.ExamNameEntryHibernate"%>
<%@page import="com.srb.hibernate.ExamInfoHibernate"%>
<%@page import="com.srb.dao.ExamInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.dao.ResultDao" %>
<%@page import="com.srb.hibernate.ResultHibernate"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--      <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script>
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
		<!-- <link rel="stylesheet" href="/srb/staticContent/CSS/bootstrap.min.css"> -->
		
		
		   		<script type="text/javascript">
					function back()
					{
						window.location="Exam.jsp";
					}
          		</script>
			<script type="text/javascript">
function checkForDuplicateEntryOfResult(){
          			<%
          			ResultDao dao2 = new ResultDao();
          			List list1 = dao2.getResultEntry();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list1.size();z++){
          				ResultHibernate   bean = (ResultHibernate)list1.get(z);
          			%>
          			var className= "<%=bean.getClassName()%>";
          			var DevisionName = "<%=bean.getDivisionName()%>";
          			var SubjectName = "<%=bean.getSubjectName()%>";
          			var cname=document.getElementById("fk_class_id1").value;
          			var dname=document.getElementById("fk_division_id").value;
          			var sname=document.getElementById("fk_subject_id").value;
          			if(className== cname && DevisionName==dname && SubjectName==sname)
          				{
          				alert("Result already Inserted for this Subject");
          				document.getElementById("fk_subject_id").value="";
          				return false;
          				}
          			
          			<%
          			}
          			%>
          			
          			}
</script>
			
		
</head>
<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Result Entry</h1>
                            <small>Result</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
               <!--  <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>Class List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="divList()" accesskey="t""> <i class="fa fa-list"></i>Division List </a>  
                </div> -->
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	

 <form class="form-horizontal" name="marksEntry">
 
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Exam Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
							ExamInfoDao ename = new ExamInfoDao();
								List examList = ename.getAllExamNames();
							%>

							<input list="examNameId" id="fk_examName_id1" class="form-control" >
							<datalist id="examNameId">
							 <%
 	                            for (int i = 0; i < examList.size(); i++) {
 	                            	ExamInfoHibernate ex = (ExamInfoHibernate) examList.get(i);
                             %>

							<option data-value="<%=ex.getPkExamId()%>"
								value="<%=ex.getExamName()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Academic Year:<sup>*</sup></label>
					</div>
					<%
					  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
					  			String todayDate = simpleDateFormat.format(new Date());
					  			Long n = Long.parseLong(todayDate)-1;
					  			System.out.println("year "+n);
					  	%>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span> 
							<input type="text" id='academicYear4' list="academicYear1" value="<%=n%>-<%=todayDate %>" name="academicYear" class="form-control">
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
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
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

							<input list="classes" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassNameExam()">
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


					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
<%-- 
							<%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision();
							     %>

							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetails()">
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
							
							
							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetails()">
							<datalist id="division"></datalist>
							
							
							
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
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
							SubjectInfoDao sdd2 = new SubjectInfoDao();
							List sList3 = sdd2.getAllMainSubject();
							 %>

							<input list="subjectList" id="fk_subject_id" class="form-control" onchange="checkForDuplicateEntryOfResult();getPassingMarks(); return false">
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
					
					<div class="col-md-2" align="right">
						<label class="control-label">Passing Marks:</label>
					</div>
					 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												No
											</span>
           									  <input readonly id="passingMarks" name="passingMarks" class="form-control" value=40>
           							 </div>
								</div>
				</div>
			</div> 
		<div class="row form-group">
			<div class="col-md-2 col-md-offset-6" align="right">
						<label class="control-label">Total Marks:</label>
					</div>
					 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												No
											</span>
           									  <input readonly id="totalMarks" name="totalMarks" class="form-control" value=100>
           							 </div>
								</div>
		</div>
		  <div class="table-responsive	row col-md-offset-1" style="margin-left: 195px;">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
			<!-- </div> -->
		  </div>

		<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center" style=" padding-top: 23px;">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" onclick="MarksInfoEntryValidation()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="reload()">Reset</button>
                                         <div class="or"></div>
                                         <input type="button" class="ui positive button" name="btn" value="Back" onclick="back()">Back</button>
                                        </div>
                                </div>
                            </div>
		
		</form>
	</div>
</body>
<script type="text/javascript">
	function reload()
	{
		location.reload();
	}

</script>
</html>



<%@include file="commons/newFooter.jsp" %> 