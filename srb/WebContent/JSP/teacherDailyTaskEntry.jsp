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

<html>
<head>
<script type="text/javascript">
$(function () {
    $(":file").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = imageIsLoaded;
            reader.readAsDataURL(this.files[0]);
        }
    });
});

function imageIsLoaded(e) {
    $('#myImg').attr('src', e.target.result);
};

</script>
<script src="/srb/staticContent/JS/Teacher.js"></script>
 <script type="text/javascript">
	
	 function TeacherTaskList() {
		 window.location = "ListTeacherTask.jsp";
}
	 function editTeacherTaskList(){
		 window.location = "editTeacherTask.jsp";
}
	 function deleteTeacherTaskList(){
		 window.location = "deleteTeacherTask.jsp";
}
	 function reset()
	 {
		 document.getElementById("DailyTask").reset();
		 document.getElementById("myImg").reset();
		 
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
                            <h1>Teacher Task Details</h1>
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
                    <a class="btn btn-primary"   onclick="TeacherTaskList()" accesskey="t""> <i class="fa fa-list"></i>List </a>  
                </div>
                 <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="editTeacherTaskList()" accesskey="t""> <i class="fa fa-list"></i>Edit </a>  
                </div>
                 <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="deleteTeacherTaskList()" accesskey="t""> <i class="fa fa-list"></i>Delete </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		


			<form class="form-horizontal" method="post" enctype="multipart/form-data" name="DailyTask">
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 " align="right">
						<label class="control-label">Date<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="date" id='date3' name="buypricee" class="form-control"  placeholder="select Date"> 
						</div>
					</div>
					</div>
	
			<div class="row">
				<div class="form-group">
				<div class="col-sm-2" align="right">
						<label class="control-label">Teacher Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
						<%
							TeacherInfoDao sdd3 = new TeacherInfoDao();
							List sList4 = sdd3.getAllMainTeacher();
							 %>
							 <input list="teacherNameList" id="fk_teacher_id" class="form-control" onchange="getSubjectAndTeacherIntoGrid()">
								<datalist id="teacherNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
									TeacherInfoHibernate sup = (TeacherInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherId()%>"value="<%=sup.getFirstName()%>  <%=sup.getLastName()%>">
									<%
										}
									%>
								</datalist>
							</div>
						</div>
						
						<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Academic Year:<sup>*</sup></label>
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
                                   <!-- <datalist id="academicYear1">
                                     <option data-value="2011-2015" value="2017-2018">
                                     <option data-value="2016-2020" value="2018-2019">
                                     <option data-value="2016-2020" value="2019-2020">
                                     <option data-value="2015-2016" value="2020-2021">
                                     <option data-value="2006-2010" value="2021-2022">
                                    </datalist> --> 
						</div>
					</div>
				</div>		
				</div>
				
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
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
						<label class="control-label">Division Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%-- <%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision();
							     %>

							<input list="division" id="fk_division_id" class="form-control" onblur="getStudentDetails()">
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
							
							
							<input list="division" id="fk_division_id" class="form-control" onchange="getGridOfStudentForCheckUp()">
							<datalist id="division"></datalist>
							
							
						</div>
					</div>
				</div>
			</div>
				
				
				<div class="row">
				<div class="row form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">Subject Name:<sup>*</sup></label>
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
					
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Upload Image:</label>
					</div>
					<div class="col-sm-3">
							<input id="taskImage" type="file" name="pic" accept="image/*" >
					</div>
				</div>
				</div>
				<div class="row">
				
				<div class="row form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">Enter Task:<sup>*</sup></label>
					</div>
					<div class="col-sm-6">
						<textarea id="taskInTextt" rows="07" cols="70"></textarea>
			
						
					</div>
					<div class="col-sm-3">
						<img id="myImg" src="#" alt="your image" style="height: 250;width: 350;"/>
					</div>
				</div>
		</div>
		
		
			<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" onclick="TeacherDailyTaskValidation()">Save</button>
                                       
                                        <div class="or"></div>
                                         <input type="button" class="ui button" onclick="reset()" value="Reset">Reset</button>
                                         <div class="or"></div>
                                          <input type="button"  class="ui positive button" style="width: 12vh"  value="View" target="popup" onclick="window.open('viewTeacherDailyTask.jsp','popup'); return false;"></button>
                                    </div>
                                </div>
                            </div>
<!-- pop code -->
<!--  <a style="float:right;font-size:medium;"target="popup" onclick="window.open('viewTeacherDailyTask.jsp','popup','width=1045,height=600'); return false;">
    View Teacher daily task Image
</a> -->
		</form>
	
	</div>
</body>
</html><%@include file="commons/newFooter.jsp" %> 