<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
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
<script>
function classList1(){
	window.location="parentcomplist.jsp";
}
</script>

<script src="/srb/staticContent/JS/parentsComplaint.js"></script>
</head>
<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Parents Complaints</h1>
                            <small>Complaints</small> 
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
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>List </a>  
                </div>
                
            </div> </div>

            <div class="panel-body panel-form">
                <div class="row">
	
		
			<form class="form-horizontal" method="post" enctype="multipart/form-data" name="DailyTask">
			
				
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">Class Name:</label>
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
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
<%-- 
							<%
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
							
							</datalist>
							 --%>
							
							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivision()">
							<datalist id="division"></datalist>
							
						</div>
					</div>
				</div>
			</div>
				<div class="row">
				<div class="row form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">Student Name:</label>
					</div>
					<!-- <div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
						<select id="studentName" class="form-control" >
						</select>
						</div>
					</div> -->
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<select class="form-control input-md" id="studentName"  name="studentName" class="form-control" placeholder="Student Name" onchange="getParentByStudent()">
									</select>
						<%-- <%
						StudentInfoDao sdd3 = new StudentInfoDao();
							List sList4 = sdd3.getAllMainStudent();
							 %>
							 <input list="studentNameList" id="studentName" class="form-control" >
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
								</datalist> --%>
							</div>
						</div>
					
					 <div class="col-sm-2 col-sm-offset-1" align="right">
					 	<label class="control-label">Parents Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
							<select class="form-control input-md" id="parentName"  name="parentName" class="form-control" placeholder="Parent Name" >
									</select>
							<!-- <input type="text" id='parentName' name="parentName" class="form-control" placeholder="Enter Parent Name"/>
							</div> -->
						</div>
						
				</div>
					</div>
					
					<div class="row">
				<div class="form-group">
				<div class="col-sm-2" align="right">
						<label class="control-label">Upload Image:</label>
					</div>
					<div class="col-sm-3">
							<input id="taskImage" type="file" name="pic" accept="image/*" >
					</div>
						
						<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Academic Year:</label>
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
                                    </datalist>  -->
						</div>
					</div>
				</div>		
				</div>
					
				<!-- <div class="row form-group">
				</div> -->
				<div class="row form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">Enter Your Complaint:</label>
					</div>
					<div class="col-sm-6">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
					
						<textarea id="taskInText" rows="3" cols="60"></textarea>
					</div>
					</div>
				<!-- 	<div class="col-sm-3">
					<img id="myImg" src="#" alt="your image" />
					</div> -->
				</div>
			
				
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <button class="ui positive button" name="btn" value="Save" onclick="parentsComplaintInfo(); return false;">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
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