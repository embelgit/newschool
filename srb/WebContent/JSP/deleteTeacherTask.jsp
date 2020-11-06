
<%@page import="com.srb.hibernate.TeacherDailyTaskEntryHibernate"%>
<%@page import="com.srb.dao.TeacherDailyTaskEntryDao"%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/bootstrap.min.css"> -->
<meta charset="utf-8">
<script type="text/javascript" src="/srb/staticContent/JS/Teacher.js"></script>

<script type="text/javascript">
	function Back()
	{
		window.location="ListTeacherTask.jsp";
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
                            <h1>Teacher Task Delete</h1>
                            <small>Delete</small> 
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
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Teacher Task List</a>  
                    </div>
                    
                </div>
               
            <div class="panel-body panel-form">
                <div class="row">	 	
		 	

      <!--   <form class="form-horizontal" method="post" action="" name="delkitpro"> --> <!-- Value of 'name' attribute is used in categoryDetails.js  -->

		<%-- 	<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div> --%>
			 <div class="row form-group">
           		<label class="col-md-offset-3 col-md-2 control-label" for="godown">Select Teacher Name,Class,Division<sup>*</sup></label>  
           	 		<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
						TeacherDailyTaskEntryDao sdd42 = new TeacherDailyTaskEntryDao();
							List sList42 = sdd42.getAllTeacherDetailForList1();
							 %>
							 <input list="teacherNameList42" id="fk_teacher_id42" class="form-control" placeholder="please select techer Name" onchange="getTeacherdailyTask()"/>
								<datalist id="teacherNameList42">
								 <%
									for (int i = 0; i < sList42.size(); i++) {
										TeacherDailyTaskEntryHibernate sup = (TeacherDailyTaskEntryHibernate) sList42.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherDailyTaskId()%>"value="<%=sup.getTeacherName()%>, <%=sup.getClassName()%>, <%=sup.getDivision()%>, <%=sup.getSubjectName()%>">
									<%
										}
									%>
						</datalist>        
            			</div>
           		 	</div>
				</div>
				
		
         
          <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input class="ui positive button" name="btn" value="Delete" onclick="delTeacherTask2()" style="width: 95px;">save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         </div>
                                </div>
                            </div>
       </form>
   
     
     <%@include file="commons/newFooter.jsp" %>
     
<%-- <%@include file="commons/footer.jsp" %> --%>
				