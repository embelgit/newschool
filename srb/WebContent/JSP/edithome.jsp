<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.HomeWorkTeacherDailyTaskEntryHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<html>
<title>Edit Home Work</title>
<head>
<script type="text/javascript">

$(function () 
{
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
<script type="text/javascript">
function schoolList(){
	 window.location = "listforhomework.jsp";
}
</script>
<script src="/srb/staticContent/JS/Teacher.js"></script>
</head>
<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1> Home Work Details </h1>
                            <small>Edit Home Work</small> 
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
                    <a class="btn btn-primary" onclick="schoolList()"  accesskey="t""> <i class="fa fa-list"></i>  Home-Work List </a>  
                </div>
			
	      </div>	
            </div> 
            </div> 


                <div class="row">
	
		
			<form class="form-horizontal" method="post" enctype="multipart/form-data" name="DailyTask">
			
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
							List sList4 = sdd3.gethomeTeacheredit();
							 %>
							 <input list="teacherNameList" id="fk_teacher_id" class="form-control" onchange="getSubjectAndTeacherIntoGrid()">
								<datalist id="teacherNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
										HomeWorkTeacherDailyTaskEntryHibernate sup = (HomeWorkTeacherDailyTaskEntryHibernate) sList4.get(i);
								 %>

 								<option data-value="<%=sup.getPkTeacherDailyTaskId()%>"
									value="<%=sup.getTeacherName()%>  "> 
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
							<input type="text" id='academicYear' list="academicYear1"  value="<%= todayDate%>" name="academicYear" class="form-control">
                                   <!-- <datalist id="academicYear1">
                                     <option data-value="2011-2015" value="2017-2018">
                                     <option data-value="2016-2020" value="2018-2019">
                                     <option data-value="2016-2020" value="2019-2020">
                                     <option data-value="2015-2016" value="2020-2021">
                                     <option data-value="2006-2010" value="2021-2022">
                                    </datalist>  -->
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
								List sList = sdd.getAllMainClass10();
							%>

							<input list="classes" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassName()">
							<datalist id="classes">
							 <%
 	                            for (int i = 0; i < sList.size(); i++) {
 	                            	HomeWorkTeacherDailyTaskEntryHibernate sup = (HomeWorkTeacherDailyTaskEntryHibernate) sList.get(i);
                             %>

							<option data-value="<%=sup.getPkTeacherDailyTaskId()%>"
								value="<%=sup.getClassName()%>">
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

							 <%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision10();
							     %>

							<input list="division" id="fk_division_id" class="form-control" onblur="getStudentDetails()">
							<datalist id="division"> <%
									for (int i = 0; i < sList2.size(); i++) {
										HomeWorkTeacherDailyTaskEntryHibernate sup = (HomeWorkTeacherDailyTaskEntryHibernate) sList2.get(i);
								%>

							<option data-value="<%=sup.getPkTeacherDailyTaskId()%>"
								value="<%=sup.getDivision() %>">
								<%
										}
									%>
							
							</datalist> 
							
							
<!-- 							<input list="division" id="fk_division_id" class="form-control" onblur="getStudentDetails()">
							<datalist id="division"></datalist> -->
							
							
						</div>
					</div>
				</div>
			</div>
				
				
				<div class="row">
				<div class=" form-group">
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
							List sList3 = sdd2.getAllMainSubject10();
							 %>

								<input list="subjectList" id="fk_subject_id" class="form-control" onchange="gettask();">
								<datalist id="subjectList">
								 <%
									for (int i = 0; i < sList3.size(); i++) {
										HomeWorkTeacherDailyTaskEntryHibernate sup = (HomeWorkTeacherDailyTaskEntryHibernate) sList3.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherDailyTaskId()%>"
									value="<%=sup.getSubjectName()%>">
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
				<!-- <div class="row form-group">
				</div> -->
				<div class="row">
				<div class="row form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">Enter Home Work:</label>
					</div>
					<div class="col-sm-6">
						<textarea id="taskInText" rows="07" cols="70"></textarea>
					</div>
				<!-- 	<div class="col-sm-3">
					<img id="myImg" src="#" alt="your image" />
					</div> -->
				</div>
					</div>
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <button class="ui positive button" name="btn" value="Update" onclick="edithome(); return false;">Update</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                       </div>
                                </div>
                            </div>
		</form>
	
	</div>
</body>
</html><%@include file="commons/newFooter.jsp" %> 