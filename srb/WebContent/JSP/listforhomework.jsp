<%@page import="com.srb.dao.TeacherDailyTaskEntryDao"%>
<%@page import="com.srb.bean.GetSchoolDetailBean"%>
<%@page import="com.srb.dao.SchoolInfoDao"%>
<%@page import="com.srb.hibernate.HomeWorkTeacherDailyTaskEntryHibernate" %>
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
<script type = text/javascript>

function Delete(){
	window.location = "deletehomework.jsp";
	 
}
</script>
	<!-- For datatable to pdf,print,excel etc conversion -->
	<!-- 	<script type="text/javascript" src="/srb/staticContent/jsForReport/jquery-1.12.4.js"></script>  -->
		 <script type="text/javascript" src="/srb/staticContent/jsForReport/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/dataTables.buttons.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/buttons.flash.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/jszip.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/pdfmake.min.js"></script>
		
		<script type="text/javascript" src="/srb/staticContent/jsForReport/vfs_fonts.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/buttons.html5.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/buttons.print.min.js"></script>
	

</head>
<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/list.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Home-Work List</h1>
                            <small>Add Home-Work</small> 
                        </div>
                    </div>
                </section>
        <div class="content"> 

                    <!-- alert message -->
                                        
                                        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  table area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
        
        </div>
    </div>
</div>
                </div>
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
              
                <div class="btn-group"> 
                    <a class="btn btn-success"  onclick="Back()"> <i class="fa fa-plus"></i>  Add Home-Work </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                     
                 <form class="form-horizontal" name="schoolFormName">
                 
		
		<div class="row">
				  <div class="content">  
                <div class="panel-body panel-form">
                <div class="row">       
     <!-- 
			<div class="form-group" align="right">
			    <div class="col-sm-offset-6 col-md-5 control-label">
						<div id="date">
							<label id="demo"></label>
							<script>
							   var date = new Date();
							   document.getElementById("demo").innerHTML = date.toDateString();
							</script>
						</div>
					</div>
				</div> -->
	      </div>	

           
			<%
			TeacherDailyTaskEntryDao dao=new TeacherDailyTaskEntryDao();
			List list12=dao.getAllhomeworkDetailForList();
			%>
<!-- 	
	<div id="date">
		<label id="demo"></label>
		<script>
			var date = new Date();
			document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>
 -->
	<div id="demo_jui">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				
				
				  <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="SL.NO: activate to sort column descending" style="width: 153px;">
                        Teacher Name</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Action: activate to sort column ascending" style="width: 100px;">
                        Class Name</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Doctor Name: activate to sort column ascending" style="width: 112px;">
                        Division Name</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Department Name: activate to sort column ascending" style="width: 104px;">
                        Subject Name</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Day: activate to sort column ascending" style="width: 200px;">
                        Task</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Start Time: activate to sort column ascending" style="width: 112px;">
                        Date</th></tr>
				
				
				
				
				
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						HomeWorkTeacherDailyTaskEntryHibernate sr=(HomeWorkTeacherDailyTaskEntryHibernate)list12.get(i);
				%>
				
				<tr>
					<td class="align"><%=sr.getTeacherName()%></td>
					<td class="align"><%=sr.getClassName()%></td>
					<td class="align"><%=sr.getDivision()%></td>
					<td class="align"><%=sr.getSubjectName()%></td>
					<td class="align"><%=sr.getTask()%></td>
					<td class="align"><%=sr.getInsertDate()%></td>
					
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>
                                        
   </div>
   
    <div class="row">
				<div class="form-group">

					<div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Back" onclick="Back()"  >Save</button>
                                    <div class="or"></div>
                                    <input type="button" class="ui positive button" name="btn" value="Delete" onclick="Delete()"  >Save</button>
                                 
                                       
                                </div>
                            </div>
				</div>
			</div> 
  </div>

                 </div>
                 </div>
                
             
                 
                            
                        </form>
                    </div>
               
                </div> <!-- /.content -->
       


</body>
</html>		
              

</body>

	<%@include file="commons/newFooter.jsp" %>
	
</div>