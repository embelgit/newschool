<%@page import="com.srb.bean.ClasSubAssoBean"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.bean.ClassDivisionSubjectAssocBean"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.bean.GetSchoolDetailBean"%>
<%@page import="com.srb.dao.SchoolInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/Teacher.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "Subject.jsp";
	}

</script>

<script type="text/javascript">
	 function Delete() {
			 window.location = "deletesubject.jsp";
	}

</script>
	<!-- For datatable to pdf,print,excel etc conversion -->
<!-- 		<script type="text/javascript" src="/srb/staticContent/jsForReport/jquery-1.12.4.js"></script> 
 -->		 
 		<script type="text/javascript" src="/srb/staticContent/jsForReport/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/dataTables.buttons.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/buttons.flash.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/jszip.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/pdfmake.min.js"></script>
		
		<script type="text/javascript" src="/srb/staticContent/jsForReport/vfs_fonts.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/buttons.html5.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/jsForReport/buttons.print.min.js"></script>
		<link rel="stylesheet" href="/srb/staticContent/cssForReport/jquery.dataTables.min.css"> 
		<link rel="stylesheet" href="/srb/staticContent/cssForReport/buttons.dataTables.min.css">
		
<style type="text/css">
td {
    color:  black;
}
</style> 
</head>
<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/list.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Subject List</h1>
                            <small>Add Class</small> 
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
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add Subject </a>  
                </div>
                
            </div> 



			    
	<%
	SubjectInfoDao dao=new SubjectInfoDao();
	List list12=dao.getAllSubjectDetailForList();
	%>
	


	<div id="demo_jui ">
	<div class="table-responsive col-md-3">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
					<th>Subject Name</th>

				</tr>
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						ClasSubAssoBean sr=(ClasSubAssoBean)list12.get(i);
				%>
				
				<tr>
					<td class="align"><%=sr.getSubName()%></td>

					
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	</div>
	
	
</div>
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








	<%@include file="commons/newFooter.jsp" %>
	
</div>
</body>
</html>