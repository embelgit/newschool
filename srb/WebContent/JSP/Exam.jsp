<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.srb.hibernate.ExamInfoHibernate"%>
<%@page import="com.srb.dao.ExamInfoDao"%>
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
    <!-- <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script> -->
     <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     <!-- <link rel="stylesheet" href="/AgriSoft/staticContent/css/ui.jqgrid.css"> -->
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
	<!--  <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script> -->
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
    
		<script type="text/javascript" src="/srb/staticContent/JS/exam.js"></script>
		
		<!-- <link rel="stylesheet" href="/srb/staticContent/CSS/bootstrap.min.css"> -->
		
		
		
		<script>
		function resetGrid()
		{
			/* $("#list4").jqGrid("clearGridData", true).trigger("reloadGrid") */
			location.reload();
			
		}
		function  editExam()
		{
			window.location ="Editexam.jsp"
		}
		function Examlist()
		{
			window.location = "ExamNameList.jsp";
		}
		
		</script>
		 <script type="text/javascript">
          	function checkForDuplicateProductEntry(){
          					<%
          					ExamInfoDao dao1 = new ExamInfoDao();
                  			List list = dao1.getAllExamName();
          					%>
          					
          					<%
          					int z = 0;
                  			for(z=0;z<list.size();z++){
                  				ExamInfoHibernate bean = (ExamInfoHibernate)list.get(z);
          					%>
          					var idNo = "<%=bean.getFkExamNameId()%>";
          					var pro = "<%=bean.getExamName()%>";
          					var acadmic ="<%=bean.getAcademicYear()%>";
          					var className ="<%=bean.getClassName()%>";
          					var division ="<%=bean.getDivision()%>";
          					
          					
          					
          					proId = $('#examName_id').val();
          					classID = $('#fk_class_id1').val();
          					divisionId = $('#fk_division_id').val();
          					
          				
          				$("#pidno option:selected" ).each(function() {
          					   selectedVal = $(this).text();
          					});
          				
          				/*  var splitText = selectedVal.split(",");  
          				
          				var supId = splitText[0];*/
          					
          					if(document.getElementById("examName_id").value ==pro && idNo != pro && document.getElementById("fk_class_id1").value ==className && idNo != className && document.getElementById("fk_division_id").value == division && idNo != division  ){
          						alert("Exam name already exist...Duplicate Not allowed");
          						location.reload();
          						return false;
          					}
          					<%
          					}
          					%>
          					}
          			 
          		</script>
       
          		<script type="text/javascript">
					function resultDetails()
					{
						window.location="marksEntry.jsp";
					}
          		</script>
          		
          		<script type="text/javascript">
					function markSheet()
					{
						window.location="viewStudentResult.jsp";
						
					}

          		</script>
          		<script type="text/javascript">
          		function timetable(){
          			window.location="examTimeTable.jsp";
          		}
          		</script>
          		<script type="text/javascript">
          		function admitCard(){
          			window.location="AdmitCard.jsp";
          		}
          		</script>
          		
          		<!-- <script type="text/javascript">

						function clearField()
						{
							document.getElementById("fk_subject_id").value="";
						}


          		</script> -->
          		
		
</head>
<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Exam Details</h1>
                            <small>Details</small> 
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
                    <a class="btn btn-primary"  onclick="resultDetails()" accesskey="t""> <i class="fa fa-graduation-cap"></i>Result Details </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" accesskey="t" onclick="timetable()"> <i class="fa fa-calendar"></i>Exam Time Table </a>  
                </div>
                
                 <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="markSheet()" accesskey="t""> <i class="fa fa-calendar"></i>MarkSheet</a>  
                </div>
                
                 <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="admitCard()" accesskey="t""> <i class="fa fa-calendar"></i>Admit Card</a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		
 <form class="form-horizontal" name="examEntry">
 
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Exam Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

							<%
							ExamInfoDao ename = new ExamInfoDao();
								List examList = ename.getAllExamNames();
							%>

							<!-- <input list="examNameId" id="examName_id" class="form-control"  style="text-transform: uppercase"  onblur="checkForDuplicateProductEntry()"  > -->
							<input list="examNameId" id="examName_id" class="form-control"  autofocus="autofocus"  onblur="checkForDuplicateProductEntry()"  >
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
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Academic Year:<sup>*</sup></label>
					</div>
						<%
					  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
					  			String todayDate = simpleDateFormat.format(new Date());
//					  			String nxt = todayDate+"1";
					  			Long n = Long.parseLong(todayDate)+1;
					  			System.out.println("year "+n);
					  	%>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span> 
							<input type="text" id='academicYear' list="academicYear1" value="<%=todayDate%>-<%=n%>" name="academicYear" class="form-control">
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
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

							<%
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainClass();
							%>

							<input list="clas" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassNameForExam()"><!--  onchange="getDivisionAsPerClass()" -->
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
								class="glyphicon glyphicon-hand-right"></i>
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
							
							
							<input list="division" id="fk_division_id" class="form-control">
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
								class="glyphicon glyphicon-book"></i>
							</span>

							<%
							SubjectInfoDao sdd2 = new SubjectInfoDao();
							List sList3 = sdd2.getAllMainSubject();
							 %>

							<input list="subjectList" id="fk_subject_id" class="form-control" autofocus="autofocus"  onchange="getGridForSubject();clearField()">
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

		  <div class="table-responsive	row col-md-offset-3" >
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
			<!-- </div> -->
		  </div>		
                 <div class="form-group row">
                       <div class="col-md-offset-4 col-md-4 btn-center" style="margin-top: 12px;">
                           <div class="ui buttons">
                           <input type="button" class="ui positive button" id="btn" name="btn" value="Save" onclick="ExamNameInfoEntryValidation()">Save</button>
                              
                               <div class="or"></div>
                                <button type="reset" onclick="location.reload()" class="ui button">Reset</button>
                                <div class="or"></div>
                                 <button class="ui positive button"  type="button" value="Edit" id="listBtn"  onclick="editExam()">Edit</button>
                         
                            <div class="or"></div>
                                 <button class="ui positive button"  type="button" value="List" id="listBtn"  onclick="Examlist()">List</button>
                           </div>
                       </div>
                   </div>
		
		</form>
	</div> 
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 