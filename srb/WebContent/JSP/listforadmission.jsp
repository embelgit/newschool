
<%@page import="com.srb.hibernate.AdmissionEnquiryHibernate"%>
<%@page import="com.srb.dao.AdmissionEnquiryDAO"%>
<%@page import="com.srb.bean.AdmissionEnquiryBean"%>

<%@page import="java.util.List"%>
  	<% boolean isHome=false;%>
	<%@include file="commons/header.jsp"%>
	
	<link href="/srb/WebContent/staticContent/CSS/dataTa.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/srb/staticContent/CSS/dataTables.jqueryui.min.css "  rel="stylesheet" type="text/css" media="all">
	<link rel="stylesheet" href="/srb/staticContent/css/tabDemo.css">
 	<link rel="stylesheet" href="/srb/staticContent/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/srb/staticContent/css/ui.jqgrid.min.css">
<!--     
    <script src="/srb/staticContent/JS/jquery.min.js"></script> -->
    <script src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
	<script src="/srb/staticContent/JS/jquery.dataTables.js" type="text/javascript"></script>
	<script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
	
	
	
<html>
	<head>
	
		<title>Book Issue List</title>
		
  		
  		<script type="text/javascript">
  		 function Back() {
			 window.location = "admission_enquiry_form.jsp";
			 
			 
	}
	 function deleteadd() {
		 window.location = "deleteaddenquiry.jsp";
		 		 
}  			
  		</script>
		

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
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
           <div class="panel-heading no-print">
                <div class="btn-group"> 
                   
                </div>
                </div>
               
            <div class="panel-body-search panel-form">
                <div class="row">
		
	<script type="text/javascript"> 
		$(document).ready(function () {
	         var table=$("#list").dataTable();
			 var tableTools = new $.fn.dataTable.TableTools(table, {
				 'sSwfPath':'//cdn.datatables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf',
				 	'aButtons':['copy','print','csv',{
					 'sExtends':'xls',
					 'sFileName':'Data.xls',
					 'sButtonText': 'Save to Excel'
						}
					]
				});
					$(tableTools.fnContainer()).insertBefore('#list_wrapper');
			});
	</script>

<body id="dt_example" style="min-height:300px;">
		
	<%
			AdmissionEnquiryDAO dao=new AdmissionEnquiryDAO();
			List list16=dao.getAlladmissionenquiryForList1();
			%>
	<div id="demo_jui">
		<table id="list" class="display" border="1">
			<thead>
				<tr>
				   <th>Class Name</th>
					<th>Student Name</th>
					<th>Parent Name</th>
					<th>Email</th>
					<th>Contact Number</th>
					<th>Address</th>
					<th>Previous School Name</th>
					<th>City</th>
					<th> Alternate Contact Number</th>
					
					
				</tr>
			</thead>
			
			<tbody>
   				<%
   				for(int i=0;i<list16.size();i++){
					AdmissionEnquiryBean sr1=(AdmissionEnquiryBean)list16.get(i);
				%>
				
				
						
				<tr>
					
					<td class="align"><%=sr1.getClassName()%></td>
					<td class="align"><%=sr1.getStudentName()%></td>
					<td class="align"><%=sr1.getParentName()%></td>
					<td class="align"><%=sr1.getEmail()%></td>
					<td class="align"><%=sr1.getContactNumber()%></td>
					<td class="align"><%=sr1.getAddress()%></td>
					<td class="align"><%=sr1.getPreSchoolN()%></td>
					<td class="align"><%=sr1.getCity()%></td>
					<td class="align"><%=sr1.getAlternateContactNumber()%></td>
				</tr>
					
				
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>

<div class="row">
				<div class="form-group">

					<div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Back" onclick="Back()"  >Save</button>
                                 
                            </div>
				</div>
			</div>
				<%@include file="commons/newFooter.jsp" %>
			
	

	
</body>

</html>



