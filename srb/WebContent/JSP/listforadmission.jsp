<%@page import="com.srb.hibernate.AdmissionEnquiryHibernate"%>
<%@page import="com.srb.dao.AdmissionEnquiryDAO"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/School.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "admission_enquiry_form.jsp";
			 
			 
	}
	 function deleteadd() {
		 window.location = "deleteaddenquiry.jsp";
		 		 
}

</script>
<!-- <script type = text/javascript>

function Delete(){
	window.location = "SchoolDelete.jsp";
	 
}
</script> -->
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
                            <h1>Admission Enquiry List</h1>
                            <small>Add Class</small> 
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
                    <a class="btn btn-success"  onclick="Back()"> <i class="fa fa-plus"></i>  Addmission Enquiry </a>  
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
			AdmissionEnquiryDAO dao=new AdmissionEnquiryDAO();
			List list12=dao.getAlladmissionenquiryForList();
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
				
				
				  <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="SL.NO: activate to sort column descending" style="width: 43px;">
                        ID</th>
				        <th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="SL.NO: activate to sort column descending" style="width: 43px;">
                        Class Name</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Action: activate to sort column ascending" style="width: 46px;">
                        Student Name</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Doctor Name: activate to sort column ascending" style="width: 82px;">
                        Parent Name</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Department Name: activate to sort column ascending" style="width: 104px;">
                        Email</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Day: activate to sort column ascending" style="width: 54px;">
                        Contact No</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Start Time: activate to sort column ascending" style="width: 52px;">
                        Address</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="End Time: activate to sort column ascending" style="width: 45px;">
                        Previous School Name</th><th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Per Patient Time: activate to sort column ascending" style="width: 86px;">
                        City</th>
				
				
				
				
				
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						AdmissionEnquiryHibernate sr=(AdmissionEnquiryHibernate)list12.get(i);
				%>
				
				<tr>
					<td class="align"><%=sr.getPkAdmissionEnquiryId()%></td>
					<td class="align"><%=sr.getClassName()%></td>
					<td class="align"><%=sr.getStudentName()%></td>
					<td class="align"><%=sr.getParentName()%></td>
					<td class="align"><%=sr.getEmail()%></td>
					<td class="align"><%=sr.getContactNumber()%></td>
					<td class="align"><%=sr.getAddress()%></td>
					<td class="align"><%=sr.getPreSchoolN()%></td>
					<td class="align"><%=sr.getCity()%></td>
					
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
                                    <input type="button" class="ui positive button" name="btn" value="Back" onclick="Back()" >Back</button>
                                    <div class="or"></div>
                              <input type="button" class="ui positive button" name="btn" value="Delete" onclick="deleteadd()" >Delete</button>
                                 
                                       
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