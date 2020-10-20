<%@page import="com.srb.hibernate.HomeWorkTeacherDailyTaskEntryHibernate"%>
<%@page import="com.srb.dao.TeacherDailyTaskEntryDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<html>
<head>

<script src="/srb/staticContent/JS/School.js"></script>

<script type="text/javascript">
	 function Back() {
			 window.location = "HomeWork.jsp";
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
                            <h1>Delete Home Work</h1>
                            <small>Delete Home Work</small> 
                        </div>
                    </div>
                </section>
        
      <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add HomeWork </a>  
                </div>
                
            </div>                            

                    
                      

            <div class="panel-body panel-form">
                <div class="row">
	
          <form class="form-horizontal" name="subjectFormName">
			<div class="row">
				<div class="form-group">
					<!-- <div class="col-md-2 col-sm-offset-2" align="right"> -->
						<label class="col-md-2 control-label col-sm-offset-1" align="right">Select Teacher Name:</label>
						 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-folder-open"></i>
							</span> 
							
						 
					<%
					TeacherDailyTaskEntryDao dao = new TeacherDailyTaskEntryDao();
          			List listt = dao.getAllteacher();
          			%>
          			<input list="subject_drop" id="subjectName"  class="form-control" >
					<datalist id="subject_drop">
          			<%
//          			int z = 0;
          			for(int z=0;z<listt.size();z++){
          				HomeWorkTeacherDailyTaskEntryHibernate bean = (HomeWorkTeacherDailyTaskEntryHibernate)listt.get(z);
          			%> 
          			<option data-value="<%=bean.getPkTeacherDailyTaskId()%>"><%=bean.getTeacherName()%></option>
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
                        <input type="button" class="ui positive button" name="btn" value="Delete" onclick="deletehomework()">Delete</button>
                           
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