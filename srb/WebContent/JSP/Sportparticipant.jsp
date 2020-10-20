<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.SportInfoHibernate"%>
<%@page import="com.srb.dao.SportInfoDao"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


  <!--   <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script> -->
     <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     <!-- <link rel="stylesheet" href="/AgriSoft/staticContent/css/ui.jqgrid.css"> -->
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
	 <!-- <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script> -->
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>

  <script src="/srb/staticContent/JS/Sport.js"></script>
<script type="text/javascript">

	 function editSport() {
			 window.location = "EditSport.jsp";
	}
	function sportsList(){
		 window.location = "listofsportparticipant.jsp";
	}
	function sports1(){
		window.location = "listofsportparticipant.jsp"
	}
</script>	

<script type="text/javascript">

function reload()
{
	location.reload();
	
}

</script>

<script type="text/javascript">
	function back()
	{
		window.location="Sport.jsp";
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
                            <h1>Sport Participant Details</h1>
                            <small>Participant Details</small> 
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
                    <a class="btn btn-primary" onclick="sports1()" accesskey="t""> <i class="fa fa-list"></i>Sport Participant List</a>  
                </div>
                
                  <!-- <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="sportsParticipant()" accesskey="t""> <i class="fa fa-trophy"></i>Sport Participant</a>  
                </div> -->
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	


	<form class="form-horizontal" name="schoolFormName">
		
		<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Activity Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-home"></i>
							</span> 
														<%
							SportInfoDao sdd1 = new SportInfoDao();
							List sList1 = sdd1.getAllSport();
							 %>
							 <input list="CreateactivityNameList" id="PkSportId" name="ActivityName" class="form-control" placeholder="Enter Activity Name" class="form-control" onchange="getSportDetails()">
								<datalist id="CreateactivityNameList">
								 <%
									for (int i = 0; i < sList1.size(); i++) {
										SportInfoHibernate sup = (SportInfoHibernate) sList1.get(i);
								 %>

								<option data-value="<%=sup.getPkSportId()%>"
									value="<%=sup.getCreateactivity()%>  ">
									<%
										}
									%>
								</datalist>
							
							<!-- <input type="text" id='ActivityName' name="ActivityName" class="form-control" placeholder="Enter Activity Name" /> -->
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Sport Participant:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
                            <input type="text" id='SportParticipant' name="SportParticipant" class="form-control"  placeholder="Enter Sport Participant" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-3" col-sm-offset-1" align="right">
						<label class="control-label">Start Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='startdate' name="dob" class="form-control" placeholder="Enter Start Date " />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">End Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='enddate' name="dob" class="form-control" placeholder="Enter End Date" />
						</div>
					</div>
				</div>
			</div>
				<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
								<%
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainClass();
							%>

							<input list="classId" id="fk_class_id" class="form-control"  name="classname" class="form-control" onchange="getDivisionNameByClassName()">
							<datalist id="classId">
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
							<!-- <input type="text" id='classname' name="classname" class="form-control" placeholder="Enter Class Name " /> -->
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-hand-right"></i>
							</span> 
<%-- 							<%
						DivisionInfoDao sdd2 = new DivisionInfoDao();
						List sList2 = sdd2.getAllMainDivision();
					%>

					<input list="division" id="fk_division_id" name="divisionname" class="form-control" placeholder="Enter Division Name "  class="form-control" onchange="checkForDuplicateRollNoEntry()">
					   <datalist id="division">

						<%
							for (int i = 0; i < sList2.size(); i++) {
								DivisionInfoHibernate sup = (DivisionInfoHibernate) sList2.get(i);
						%>

						<option data-value="<%=sup.getPkDivisionId()%>"
							value="<%=sup.getDivision() %>">
							<%
								}
							%>
						</datalist> --%>
						
						
						<input list="division" id="fk_division_id" class="form-control" onchange="getSportIntoGrid()"> <!-- ;getGridOfStudentForCheckUp() -->
						<datalist id="division"></datalist>
						
						
							<!-- <input type="text" id='divisionname' name="divisionname" class="form-control" placeholder="Enter Division Name " /> -->
						</div>
					</div>
				</div>
			</div>
<%-- 			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Student Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<%
						StudentInfoDao sdd3 = new StudentInfoDao();
							List sList4 = sdd3.getAllMainStudent();
							 %>
							 <input list="studentNameList" id="fk_Student_id" name="StudentName" class="form-control" placeholder="Select Student Name " class="form-control" >
								<datalist id="studentNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
										StudentInfoHibernate sup = (StudentInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkStudentId()%>"
									value="<%=sup.getFirstName()%> <%=sup.getMiddleName()%> <%=sup.getLastName()%>">
									<%
										}
									%>
								</datalist>
							<!-- <input type="text" id='StudentName' name="StudentName" class="form-control" placeholder="Enter StudentName " /> -->
						</div>
					</div>

					
				</div>
			</div> --%>
			 <div class="table-responsive	row col-md-offset-1">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
			<!-- </div> -->
		  </div>
			
			

			</div>
			
			<div class="form-group row">
                  <div class="col-md-offset-4 col-md-4 btn-center">
                      <div class="ui buttons">
                      <input type="button" class="ui positive button" name="btn" value="Save" onclick="addSportInfoDetails()">Save</button>
                         
                          <div class="or"></div>
                           <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                           <div class="or"></div>
                            <input type="button" class="ui positive button" name="btn" value="Back" onclick="back()">Back</button>
                           </div>
                  </div>
              </div>
			
		</form>		
</div>
</body>
</html>				
					
	 <%@include file="commons/newFooter.jsp" %>      
			