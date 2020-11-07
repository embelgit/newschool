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
				window.location="Tutorial.jsp";
			}
         </script>
</head>


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/result.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Tutorial</h1>
                            <small>Add Tutorial</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="examDetails()"  accesskey="t""> <i class="fa fa-list"></i>Tutorials</a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	

		<form class="form-horizontal">

			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Subject Title:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<input type="text" id="subject_title" class="form-control" placeholder="Main Title Name" onchange="()">
							
						</div>
					</div>
                   
                   <div class="col-md-2 " align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>
							<input list="classes" id="fk_class_id1" class="form-control" placeholder="Class Name" onchange="getDivisionNameByClassName()">

						<%-- 	<%
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
							
							</datalist> --%>
						</div>
					</div>

					
				</div>
			</div>
			<div class="row">
 			   <div class="form-group">
 			        <div class="col-sm-2 col-sm-offset-1 " align="right">
						<label class="control-label">Subject Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							
							<input list="subject_name" id="subject_name" class="form-control" placeholder="Subject Name" onchange="getSudentName()">
													
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">PDF File:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
							<input id="pdffile" type="file" name="file" accept="" >
					</div>
					
					
			   </div>
		     </div>
					
 					
 				<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Video:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							
							<input list="video" id="subject_name" class="form-control" placeholder="YouTube Embel Video URL" onchange="getSudentName()">
													
						</div>
					</div>
				
					<div class="col-sm-2" align="right">
						<label class="control-label">Upload Video:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
							<input id="videofile" type="file" name="file" accept="" >
					</div>
					
				</div>
			</div>
					
				
			
			        <div class="form-group row">
                           <div class="col-md-offset-4 col-md-4 btn-center">
                               <div class="ui buttons">
                               <input type="button" class="ui positive button" id="btn" name="btn" value="Save" onclick="StudValidation()" >
                                  
                                   <div class="or"></div>
                                    <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                                    <!--  <div class="or"></div>
                                   <input type="button" class="ui positive button" name="btn" value="Edit" onclick="editStudent()"  onclick="studentList()" >Edit</button>
                                    </div> -->
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