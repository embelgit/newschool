<%@page import="com.srb.hibernate.TeacherDailyTaskEntryHibernate"%>
<%@page import="com.srb.dao.TeacherDailyTaskEntryDao"%>
 <%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
 <%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
 <%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/Teacher.js"></script>
  	<script type="text/javascript">
	 function Back() {
			 window.location = "teacherDailyTaskEntry.jsp";
	}

</script>
<script type="text/javascript">
			function isAlphabetsWithSpace(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if(charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)){
		        return false;
		    }
		    return true;
			}


		</script>
 <script type="text/javascript">
			function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
	   </script>


</head>
<body>


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><i class="pe-7s-world"></i></div>
                        <div class="header-title">
                            <h1>Edit Teacher Task</h1>
                            <small>edit task</small>
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                 <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Back</a>  
                </div>               
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                
                
                
                <form class="form-horizontal" name="tdvf">
		
		  <div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Teacher task Details</u></b></h5>
			        </div>
		       </div>
			</div>
		  </div>
		  <!-- <div class="row">
		    <div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
				<label class="control-label">Designation<sup>*</sup></label>
			</div>
			<div class="col-md-3">
				<div class="selectContainer">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-user"></i> </span>
						<select name="designation" class="form-control selectpicker" id="designation" onchange="getTeacherName()" >
							<option value="">Select Designation</option>
							<option>Teaching Staff</option>
							<option>Non-Teaching Staff</option>
							<option>Principal</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		  </div> -->
		  
		  
 			<div class="row">
				<div class="form-group">
				<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Select Teacher Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							<!-- <input list="division" id="fk_teacher_id" class="form-control" onchange="getStudentDetails1()">
							<datalist id="division"></datalist> -->
							<!-- <select class="form-control input-md" id="fk_teacher_id"  name="fk_teacher_id" class="form-control" onchange="getStudentDetails1()"  placeholder="Teacher Name">
									</select> -->
								
						<%
						TeacherDailyTaskEntryDao sdd3 = new TeacherDailyTaskEntryDao();
							List sList3 = sdd3.getAllTeacherDetailForList1();
							 %>
							 <input list="teacherNameList" id="fk_teacher_id" class="form-control" placeholder="please select techer Name" onchange="getTeacherdailyTask()"/>
								<datalist id="teacherNameList">
								 <%
									for (int i = 0; i < sList3.size(); i++) {
										TeacherDailyTaskEntryHibernate sup = (TeacherDailyTaskEntryHibernate) sList3.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherDailyTaskId()%>"value="<%=sup.getTeacherName()%>, <%=sup.getClassName()%>, <%=sup.getDivision()%>, <%=sup.getSubjectName()%>">
									<%
										}
									%>
								</datalist>
							</div>
						</div>
				
					<div class="col-sm-2 " align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='clsname1' name="clsname1" class="form-control"  placeholder="Enter Class Name" />
													</div>
					</div>
				
				</div>
			</div>
			<div class="row">
			<div class=" form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Division<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
								<input type="text" id='DivisionName' name="DivisionName" class="form-control"  placeholder="Enter Division Name" onkeypress="return isAlphabetsWithSpace(event)" />
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Subject Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							 <input type="text" id='subject' name="subject" class="form-control"  placeholder="Enter Subject" onkeypress="return isAlphabetsWithSpace(event)" />							 
						</div>
					</div>
					
				</div>
				</div>
			
			
			<div class="row">
			<div class=" form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Date<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							<input type="date" id='date4' name="date" class="form-control"  placeholder="select Date">
							 						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Academic Year<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='academic' name="academic" class="form-control"  placeholder="Enter Academic Year" onkeypress="return isNumber(event)" onchange="getcalculation()"/> 
						</div>
					</div>
					
				</div>
				</div>
				
				
				<div class="row">
		    <div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
				<label class="control-label">Task<sup>*</sup></label>
			</div>
			<div class="col-sm-6">
						<textarea id="taskInTextt" rows="07" cols="70"></textarea>
			</div>
			
					
		</div>
		  </div>

			
			<div class="form-group row">
                                 <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input class="ui positive button" name="btn" value="Update"  onclick="delTeacherTask()" style="width: 75px;">Save
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                                        
                                         </div>
                                </div>
                            </div>
		</form>
                
                </div>
                </div>
                </div>

</html>				
		<%@include file="commons/newFooter.jsp" %> 			
	        