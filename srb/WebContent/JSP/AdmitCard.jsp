<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<%@page import="com.srb.hibernate.ExamInfoHibernate"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.dao.ExamInfoDao"%>
<%@page import="com.srb.hibernate.ExamNameEntryHibernate"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>

         <script type="text/javascript" src="/srb/staticContent/JS/exam.js"></script>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <script type="text/javascript">
			function examDetails()
			{
				window.location="Exam.jsp";
			}
         </script>
</head>


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/result.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Admit Card</h1>
                            <small>Print Admit Card</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="examDetails()"  accesskey="t""> <i class="fa fa-list"></i>Exam Details</a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	

		<form class="form-horizontal" name="admitcard">

			<div class="row">
				<div class="form-group">
					<div class="col-md-2" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
								ClassInfoDao classDao = new ClassInfoDao();
								List classList = classDao.getAllMainClass();
							%>

							<input list="classes_Student" id="fk_class_id_Student" class="form-control" onchange="getDivisionNameByClassNameForResult()">
							<datalist id="classes_Student">
							 <%
 	                            for (int i = 0; i < classList.size(); i++) {
 		                        ClassInfoHibernate classBean = (ClassInfoHibernate) classList.get(i);
                             %>

							<option data-value="<%=classBean.getPkClassId()%>"
								value="<%=classBean.getClas()%>">
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
								DivisionInfoDao divDao = new DivisionInfoDao();
								List divList = divDao.getAllMainDivision();
							     %>

							<input list="division_Student" id="fk_division_id_Student" class="form-control" onchange="getSudentName()">
							<datalist id="division_Student"> <%
									for (int i = 0; i < divList.size(); i++) {
										DivisionInfoHibernate divBean = (DivisionInfoHibernate) divList.get(i);
								%>

							<option data-value="<%=divBean.getPkDivisionId()%>"
								value="<%=divBean.getDivision() %>">
								<%
										}
									%>
							
							</datalist> --%>
							
							
							<input list="division_Student" id="fk_division_id_Student" class="form-control" onchange="getSudentName()">
							<datalist id="division_Student"></datalist>
							
							
							
						</div>
					</div>
				</div>
			</div>
			<div class="row">
 			<div class="form-group">
 					
 							<label class="col-md-2 control-label"  align="right">Student Name:</label>  
           							  <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<input list="studlist" id="studentName_student_result" class="form-control" onchange="getSudentName()">
													<datalist id="studlist"></datalist>
									
           							 </div>
								</div> 
								<%-- <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						<%
						StudentInfoDao sdd3 = new StudentInfoDao();
							List sList4 = sdd3.getAllMainStudent();
							 %>
							 <input list="studentNameList" id="fk_Student_id" class="form-control" onblur="getTotalAnnualFee()">
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
							</div>
						</div> --%>
 				
						
					<div class="col-sm-2" align="right">
						<label class="control-label">Academic Year:<sup>*</sup></label>
					</div>
						<%
					  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
					  			String todayDate = simpleDateFormat.format(new Date());
//					  			String nxt = todayDate+"1";
					  			Long n = Long.parseLong(todayDate)-1;
					  			System.out.println("year "+n);
					  	%>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span> 
							<input type="text" id='academicYear' list="academicYear1" value="<%=n%>-<%=todayDate%>" name="academicYear" class="form-control">
                                   <!-- <datalist id="academicYear1">
                                    
                                     <option data-value="2017-2018" value="2017-2018">
                                     <option data-value="2018-2019" value="2018-2019">
                                     <option data-value="2019-2020" value="2019-2020">
                                     <option data-value="2020-2021" value="2020-2021">
                                     <option data-value="2021-2022" value="2021-2022">
                                   </datalist>  -->
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">From:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='examDate' name="examDate" class="form-control" />
						</div>
					</div>
				
					<div class="col-sm-2" align="right">
						<label class="control-label">To:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='examDate1' name="examDate1" class="form-control" />
						</div>
					</div>
					
				</div>
			</div>
					
				
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5">
                          <div class="ui buttons">
                          	<input type="button" id="btn" class="ui positive button" name="btn" onclick="StudentAdmitCard()" value="Print">
                           </div>
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
	<%@include file="commons/newFooter.jsp" %>	