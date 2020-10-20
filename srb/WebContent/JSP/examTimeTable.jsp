<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.srb.hibernate.ExamInfoHibernate"%>
<%-- <%@page import="com.srb.hibernate.ExamNameEntryHibernate"%> --%>
<%@page import="com.srb.dao.ExamInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="java.util.Calendar" %>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     
	<!--  <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     <link rel="stylesheet" href="/srb/staticContent/y_css/jquery-ui.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
     
     <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui-min.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script>

	<script src="/srb/staticContent/JS/Class_Division_Subject_Teacher.js"></script>
	<link rel="stylesheet" href="/srb/staticContent/CSS/bootstrap.min.css">

        <link type="text/css" href="/srb/staticContent/CSS/bootstrap-timepicker.min.css" />
        
         <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script>
        <script type="text/javascript" src="/srb/staticContent/JS/bootstrap.min.js"></script>
        
        <script type="text/javascript" src="/srb/staticContent/JS/bootstrap-timepicker.min.js"></script> -->
          <!-- <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script> -->
   <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     
     <!-- <link rel="stylesheet" href="/AgriSoft/staticContent/css/ui.jqgrid.css"> -->
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
     
<!-- 	 <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script>-->
     <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
     <link type="text/css" href="/srb/staticContent/CSS/bootstrap-timepicker.min.css" />
     <script type="text/javascript" src="/srb/staticContent/JS/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
         <script type="text/javascript" src="/srb/staticContent/JS/exam.js"></script>
         <script type="text/javascript">
         function Back(){
        	 window.location = "Exam.jsp";
         }</script>
                 <script type="text/javascript">
         function listt(){
        	 window.location = "examtimetablelist.jsp";
         }
         function editt(){
        	 window.location = "editexamtimetable.jsp";
         }
         </script>
        
      <!--   <script type="text/javascript">
        Calendar now = Calendar.getInstance();
        
        
		String as =  now.get(Calendar.HOUR_OF_DAY)+now.get(Calendar.MINUTE)+ now.get(Calendar.SECOND);
                          
        //add hours to current date using Calendar.add method
        String nnn = now.add(Calendar.HOUR,3);
		System.out.println("as - "+as); 
		System.out.println("nnn - "+nnn); 

        </script> -->
</head>
<body>


<div class="container-fluid">


		<div class="row header_margin_top">
			<div align="center" style="margin-left: 310px;">
				<h2 class="form-name style_heading" style="margin-top: 80px">Exam Time Table Details</h2>
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
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>

 <form class="form-horizontal" name="ExamTimeTable">
 		<div class="row">
 		<div class="row form-group">
 					<div class="col-sm-2 col-sm-offset-2" align="right">
						<label class="control-label">Exam Name<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
							ExamInfoDao ename = new ExamInfoDao();
								List examList = ename.getAllExamNames();
							%>

							<input list="examNameId" id="fk_examName_id" class="form-control">
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
					<div class="col-md-2 " align="right">
						<label class="control-label">Academic Year:<sup>*</sup></label>
					</div>
					<%
					  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
					  			String todayDate = simpleDateFormat.format(new Date());
					  	%>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='academicYear' list="academicYear1" value="<%= todayDate%>" name="academicYear" class="form-control">
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
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-2" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
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

							<input list="clas" id="fk_class_id1" class="form-control">
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
						<label class="control-label">Division Name:<sup>*</sup></label>
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
					<div class="col-sm-2 col-sm-offset-2" align="right">
						<label class="control-label">Exam Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='examDate' name="examDate" class="form-control" />
						</div>
					</div>
					
					<div class="col-md-2 " align="right">
						<label class="control-label">Select day:</label>
						<%-- <%
						DateFormat simpleDateFormat = new SimpleDateFormat("EEEEEEE");
					  	String todayDate1 = simpleDateFormat.format(new Date());
						%> --%>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<%-- <input type="text" id='day' name="day" value="<%= todayDate1%>" class="form-control" /> --%>
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
			        <div class="form-group">
					<div class="col-sm-2 col-sm-offset-2" align="right">
							<label class="control-label">Start Time:</label>
						</div>
						
						<div class="col-md-3">
						  <div class="input-group bootstrap-timepicker timepicker">
						  <span class="input-group-addon"><i class="glyphicon glyphicon-time" ></i></span>
							<input id="startTime" type="text" class="form-control input-small">
		            
					     </div>	
					     </div>
					     
					     <div class="col-sm-2 " align="right">
							<label class="control-label">End Time:</label>
						</div>
						<div class="col-md-3">
						  <div class="input-group bootstrap-timepicker timepicker">
						   <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
		            <input id="endTime" type="text" class="form-control input-small" >
		           
					     </div>	
					     </div>
					     
					      <!-- <div class="col-sm-2 " align="right">
							<label class="control-label">End Time:</label>
						</div>
						<div class="col-md-3">
						  <div class="input-group bootstrap-timepicker timepicker">
						   <span class="input-group-addon"><i class="glyphicon glyphicon-Date"   ></i></span>
		            <input id="endTime" type="text" class="datepicker" class="form-control input-small" >
		           
					     </div>	
					     </div> -->
					 </div> 
				<!-- 	  <script>
        $(function() {
          $( ".datepicker" ).datepicker();
        });
    </script> -->
					 
					 <script type="text/javascript">
	       		 $('#startTime').timepicker();
	            $('#endTime').timepicker();
	        </script>
					 
				</div>
			
			
			<!--  <div class="row"> 
			 <div class="form-group"> 
				<div class="col-md-2 col-sm-offset-2" align="right">
							<label class="control-label">Start Time:</label>
				</div>
				<div class="col-md-3 input-group bootstrap-timepicker timepicker">
		            <input id="startTime" type="text" class="form-control input-small">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
		        </div>
		   
        		<div class="col-md-3  col-sm-offset-6" align="right">
							<label class="control-label">End Time:</label>
				</div>
				<div class="col-md-3 input-group bootstrap-timepicker timepicker">
		            <input id="endTime" type="text" class="form-control input-small" >
		            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
		        </div>
 
	        <script type="text/javascript">
	       		 $('#startTime').timepicker();
	            $('#endTime').timepicker();
	        </script>
        </div>
          </div> -->
          
          
          
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

								<input list="subjectList" id="fk_subject_id" class="form-control" onchange="gridForExamTimeTable()">
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
				</div>
			
			<br><br>
        
		  <div class="table-responsive	row col-md-offset-4">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
			<!-- </div> -->
		  </div>
			
			<!-- <div class="container" align="center">
				<input type="button" style=" height: 65px; width: 225; font-size: 25" class="btn btn-success btn-lg" value="Save" onclick="addExamTimeTable()"> 
				<input type="button" style=" height: 65px; width: 225; font-size: 25" class="btn btn-danger btn-lg" value="Cancel" onclick="">
			</div> -->
			
			<br><br><br>
                 <div class="form-group row" style="margin-left: 280px;">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button"  class="ui positive button btn large" name="btn" value="Save" onclick="addExamTimeTable()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="location.reload()">Cancel</button>
                                       <div class="or"></div> 
                                           <button class="ui positive button"  type="button" value="Back" id="listBtn"  onclick="Back()">Back</button>
                                   <div class="or"></div>
                                    <input type="button"  class="ui positive button btn large" name="btn" value="Edit" onclick="editt()">Edit</button>
             				    <div class="or"></div>
                                    <input type="button"  class="ui positive button btn large" name="btn" value="List" onclick="listt()">List</button>
                                        
                                    
                                    
                                    </div>
                                </div>
                            </div>
 </form>
	</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 