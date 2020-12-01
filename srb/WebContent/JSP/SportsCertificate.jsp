
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>
 <script type="text/javascript" src="/srb/staticContent/JS/cashbook.js"></script>
  <script src="/srb/staticContent/JS/Student.js"></script>
  <script src="/srb/staticContent/JS/certificate.js"></script>
   
   <script type="text/javascript">
	function leavingCertificate()
	{
		window.location="CopyleavingCertificate.jsp";
	}

   </script>
   <script>
   function nirgum(){
	   window.location = "nirgum.jsp";
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
                            <h1>Sports Certificate</h1>
                            <small>Sports Certificate</small> 
                        </div>
                    </div>
                </section>
        
                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            
         <!--    <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="leavingCertificate()"  accesskey="t""> <i class="fa fa-list"></i>Copy</a>  
                </div>

                
            </div>-->
            <div class="panel-body panel-form">
                <div class="row">
	
	

 <form class="form-horizontal" name="sportcertificate">
 			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
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


					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:<sup>*</sup></label>
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

							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivision()">
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
 					
 					<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Student Name:<sup>*</sup></label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<select id="fk_Student_id" class="form-control" >
											</select>
           							 </div>
								</div>
								
					<!-- <div class="col-sm-2" align="right">
						<label class="control-label">Reason:<sup>*</sup></label>
					</div>
					 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <textarea type="text" id="reason"  rows="3" cols="35" name="reason" class="form-control" placeholder="Enter Reason"></textarea>
   					 <input type="text" id="reason" name="reason" class="form-control" placeholder="Enter Reason">
					 	</div>
					 </div>			 -->
 				
				</div>
			</div>
			
<!-- 			<div class="row">
				<div class="form-group"> -->
					<!-- <div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Identity marks:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id="idMarks" name="idMarks" class="form-control" placeholder="Enter Identity marks">
					 	</div>
					 </div> -->

<!-- 					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Reason:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <textarea type="text" id="reason"  rows="3" cols="35" name="reason" class="form-control" placeholder="Enter Reason"></textarea>
   					 <input type="text" id="reason" name="reason" class="form-control" placeholder="Enter Reason">
					 	</div>
					 </div>
				</div>
			</div> -->
			
			<!-- <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Promotion:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id="promotion" name="promotion" class="form-control" placeholder="Enter Promotion">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Progress of Student:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
							<select name="progress" class="form-control selectpicker" id="progress">
									<option value=""></option>
									<option value="Good">Good</option>
									<option value="Average">Average</option>
									<option value="Bad">Bad</option>
									<option value="Excellent">Excellent</option>
								</select>
						    <input type="text" id="progress"name="progress" class="form-control" placeholder="Enter Progress of Student">
					 	</div>
					 </div>
				</div>
			</div> -->
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="date" id="dateOfLeaving" name="dateOfLeaving" class="form-control" placeholder="Enter Date Of Leaving">
					 	</div>
					 </div>

					<!-- <div class="col-sm-2" align="right">
						<label class="control-label">Conduct:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id="conduct"name="conduct" class="form-control" placeholder="Enter Conduct">
					 	</div>
					 </div> -->
				</div>
			</div>
						<div class="row">
							<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Sport Name <sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id="sport" name="sport" class="form-control" placeholder="Enter Sport Name">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Grade:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id="grade" name="grade" class="form-control" placeholder="Grade">
					 	</div>
					 </div>
				</div>
			</div>
			
			
			
		
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" id="btn" onclick="SportCertificateGenerator()" value="Print">
                                       
                                        <div class="or"></div>
                                         <button type="reset" onclick="location.reload()" class="ui button">Reset</button>
                                          
                                        </div>
                                </div>
                            </div>
	</form>
</div>
<%@include file="commons/newFooter.jsp" %>

