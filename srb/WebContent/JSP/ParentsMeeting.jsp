<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>
<title>Parent Meeting</title>

<script type="text/javascript" src="/srb/staticContent/JS/bootstrap-timepicker.min.js"></script>
 <script type="text/javascript" src="/srb/staticContent/JS/schoolMeetings.js"></script>
 <script type="text/javascript">
 function List()
 {
	 
	 window.location="listforMeeting.jsp";
	 
 }
 function editList()
 {
	 window.location="editParentsMeeting.jsp";
 }
 function del()
 {
	 window.location="deleteParentMeeting.jsp";
 }
 
 </script>
</head>

<body>
<script type="text/javascript">

		$('.clockpicker').clockpicker();
</script>
<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Parents Meetings</h1>
                            <small>Meetings</small> 
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
                    <a class="btn btn-primary"  onclick="List()" accesskey="t""> <i class="fa fa-list"></i>Meeting List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="editList()" accesskey="t""> <i class="fa fa-list"></i>Edit List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="del()" accesskey="t""> <i class="fa fa-list"></i>Delete</a>  
                </div>
            </div> 
 			

            <div class="panel-body panel-form">
                <div class="row">
	

 		<form class="form-horizontal" name="SheduleMeeting">
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

							<input list="classes_meetings" id="fk_class_id_meetings" class="form-control" onchange="getDivisionNameByClassName()">
							<datalist id="classes_meetings">
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
							
														
							
							

						<%-- 	<%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision();
							     %>

							<input list="division_meetings" id="fk_division_id_meetings" class="form-control">
							<datalist id="division_meetings"> <%
									for (int i = 0; i < sList2.size(); i++) {
										DivisionInfoHibernate sup = (DivisionInfoHibernate) sList2.get(i);
								%>

							<option data-value="<%=sup.getPkDivisionId()%>"
								value="<%=sup.getDivision() %>">
								<%
										}
									%>
							
							</datalist> --%>
							
							<input list="division_meetings" id="fk_division_id_meetings" class="form-control" onchange="getGridOfStudentForCheckUp()">
							<datalist id="division_meetings"></datalist>
							
							
						</div>
					</div>
				</div>
			</div>
		
			<div class="row form-group">
			<div class="col-md-2 col-sm-offset-1" align="right">
					<label class="control-label" for="message">Date:</label>
			</div>
		 	 <div class="col-md-3">
      			<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="date" id='date31' name="date31" class="form-control"  placeholder="select Date"> 
						</div>
			</div>
		</div>											
			<div class="row">
			<div class="form-group">
			           <!--  <label class="col-md-2 col-sm-offset-1  control-label"  style="margin-left: 108px;">Start Time:<sup>*</sup>
						</label> -->
						<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Start Time:<sup>*</sup></label>
				     	</div>
						<div class="col-md-3  bootstrap-timepicker timepicker" >
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-time"></i>
								</span> 
								 <input id="startTime" type="text" class="form-control input-small">
							</div>
						</div>

			  <!--   <label class="col-md-2  control-label" for="endDate" align="right">End Time:<sup>*</sup>
				</label> -->
				     <div class="col-sm-2" align="right">
						<label class="control-label">End Time:<sup>*</sup></label>
				     	</div>
				      <div class="col-md-3 bootstrap-timepicker timepicker">
						<div class="input-group">
							<span class="input-group-addon"> <i
									class="glyphicon glyphicon-time"></i>
								</span>
								  <input id="endTime" type="text" class="form-control input-small" >
							</div>
						</div>
			</div>
			</div>
	        <script type="text/javascript">
	       		 $('#startTime').timepicker();
 	            $('#endTime').timepicker(); 

/* 			 document.getElementById("endTime").value = "2:15 PM"; */
	        
	        </script>
		<div class="row form-group">
			<div class="col-md-2 col-sm-offset-1" align="right">
					<label class="control-label" for="message">Message:</label>
			</div>
		 	 <div class="col-md-5">
      			<textarea class="form-control" rows="07" id="message"></textarea>
			</div>
		</div>
		
		<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" id="btn" value="Save" onclick="addMeetingScheduleDetailsParents()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         </div>
                                </div>
                            </div>
		
 </form>
 </div>
 	<%@include file="commons/newFooter.jsp" %>