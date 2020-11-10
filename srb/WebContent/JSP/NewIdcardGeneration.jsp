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
	
	 function IdCardGenerationlist() {
		 window.location = "ListOfidCardGeneration.jsp";
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
                            <h1>ID Card Generation</h1>
                            <small>Add ID Card Generation</small> 
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
                    <a class="btn btn-primary"   onclick="IdCardGenerationlist()" accesskey="t""> <i class="fa fa-list"></i>Id Card Generation List </a>  
                </div>
                <!--  <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="editTeacherTaskList()" accesskey="t""> <i class="fa fa-list"></i>Edit </a>  
                </div>
                 <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="deleteTeacherTaskList()" accesskey="t""> <i class="fa fa-list"></i>Delete </a>  
                </div> -->
            </div> 

            <div class="panel-body panel-form">
                <div class="row">

			<form class="form-horizontal" method="post" enctype="multipart/form-data" name="DailyTask">
			<!-- <div class="row">
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
					</div> -->
	
			   <div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1 " align="right">
						<label class="control-label">Student Id:<sup>*</sup></label>
					</div>
					<div class="col-sm-3 ">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='Id' name="Id" class="form-control" placeholder="ID" onkeypress="return isNumber(event)"/>
						</div>
					</div>
					 <div class="col-sm-2" align="right">
						<label class="control-label">Student Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='firstName' name="firstName" class="form-control" placeholder="Student Name" onkeypress="return isAlphabets(event)"/>
						</div>
					</div>
				</div>		
				</div>
				
			   <div class="row">
				<div class="form-group">
				  <div class="col-sm-2 col-sm-offset-1"  align="right">
						<label class="control-label">Address:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='address' name="address" class="form-control" placeholder="Enter Address" onkeypress="return isNumber(event)"/>
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">Mobile No:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='mobileno' name="mobileno" maxlength="10" class="form-control" placeholder="Enter Mobile No" onkeypress="return isNumber(event)">
						</div>
					</div>
					
					
				</div>		
				</div>
				
			<div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Date Of Birth:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='dob' name="dob" class="form-control"  placeholder="Enter Date Of Birth">
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">Gender:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon  glyphicon-user"></i>
								</span>
							    <select name="department" class="form-control selectpicker" id='gender'>
									<option value="">gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>
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
					<div class="col-sm-2 " align="right">
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
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Upload Image:</label>
					</div>
					<div class="col-sm-3">
							<input id="taskImage" type="file" name="pic" accept="image/*" >
					</div>
				    <div class="col-sm-3 ">
						<img id="myImg" src="#" alt="your image" style="height: 200;width: 250;"/>
					</div>
				</div>
				</div>
				
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-md-offset-5">
                          <div class="ui buttons">
                          	<input type="button" id="btn" class="ui positive button" name="btn" onclick="validateViewStudentWiseResult()" value="Print">
                           </div>
                      </div>
				</div>
			</div>
		
		
		
			               <!--   <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" onclick="TeacherDailyTaskValidation()">
                                       
                                         <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         <div class="or"></div>
                                         <input type="button" class="ui positive button" style="width: 12vh"  value="View" target="popup" onclick="window.open('viewTeacherDailyTask.jsp','popup'); return false;">
                                    </div>
                                </div>
                            </div> -->
                            
		</form>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		
		
		
	
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 