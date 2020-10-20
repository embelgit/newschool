<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoLeaveHibernate" %>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<html>
<head>

<script src="/srb/staticContent/JS/Teacher.js"></script>

<script type="text/javascript">
	 function Back() {
			 window.location = "EmployeeLeaveList.jsp";
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
                            <h1>Delete Employee Leave</h1>
                            <small>Delete Employee leave</small> 
                        </div>
                    </div>
                </section>
        
      <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add Employee Leave </a>  
                </div>
                
            </div>                            

                    
                      

            <div class="panel-body panel-form">
                <div class="row">
	
          <form class="form-horizontal" name="subjectFormName">
			<div class="row">
				<div class="form-group">
					<!-- <div class="col-md-2 col-sm-offset-2" align="right"> -->
						<label class="col-md-2 control-label col-sm-offset-1" align="right">Select Employee Name:</label>
						 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-folder-open"></i>
							</span> 
							
						 
								    <%
						    TeacherInfoDao sdd4 = new TeacherInfoDao();
							List sList5 = sdd4.getAllMainTeachertoedit();
							 %>
							 <input list="employeeNameList1" id="fk_employee_id1" class="form-control" >
								<datalist id="employeeNameList1">
								 <%
									for (int i = 0; i < sList5.size(); i++) {
										TeacherInfoLeaveHibernate sup = (TeacherInfoLeaveHibernate) sList5.get(i);
								 %>

	 
	 							<option data-value="<%=sup.getPkTeacherLeaveId()%>"
									value="<%=sup.getTeacher()%>">
		
									<%
										}
									%>
								</datalist>
          			</div>
					  </div> 
					</div>
				</div>
				
	
			  	<div class="form-group row">
                    <div class="col-md-offset-4 col-md-4 btn-center">
                        <div class="ui buttons">
                        <input type="button" class="ui positive button" name="btn" value="Delete" onclick="deleteleave()">Delete</button>
                           
                            <div class="or"></div>
                             <button type="reset" class="ui button">Reset</button>
                             </div>
                    </div>
   				</div>
				</form>

	
</div>
</div>
</div>
</div>
</body>
</html><%@include file="commons/newFooter.jsp" %> 