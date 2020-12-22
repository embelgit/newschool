
 <%@page import="com.srb.bean.GetBookDetails"%>
    
    <%@page import="com.srb.dao.LibraryManagementDao"%>

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
	
		<title>Employee Book Return List</title>
		
  		
  		<script type="text/javascript">
  			function Back()
  			{
  				window.location = "libraryManagement.jsp" ;
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
                            <h1>Employee Book Return List</h1>
                            <small>Employee Book Return List</small> 
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
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Add  </a>  
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
   LibraryManagementDao dao=new LibraryManagementDao();
	List lidtdo=dao.getEmployeeBookReturnList();
	%>

	<div id="demo_jui">
		<table id="list" class="display" border="1">
			<thead>
				<tr>
					<th>Employee Name</th>
					<th>Book issue date</th>
	                <th>book return date</th>
	                <th>Book name</th>
	                 <th>Author name</th>
	                 <th>Publisher name</th>
	                 <th>Supplier name</th>
	                 <th>Quantity</th>
	              <!--   <th>LandLine No</th> -->
	               
					
					
				</tr>
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<lidtdo.size();i++){
						GetBookDetails sr=(GetBookDetails)lidtdo.get(i);
				%>
				
			<tr>
					<td class="align"><%=sr.getEmployeeName()%></td>
					<td class="align"><%=sr.getBookIssuedate()%></td>
					<td class="align"><%=sr.getBookReturnDate()%></td>
					<td class="align"><%=sr.getBookName()%></td>
					<%-- <td class="align"><%=sr.getLandline()%></td> --%>
					<td class="align"><%=sr.getAuthorName()%></td>
					<td class="align"><%=sr.getPublisherName()%></td>
					<td class="align"><%=sr.getSupplierName()%></td>
					<td class="align"><%=sr.getQuantity()%></td>
					<%-- <td class="align"><%=sr.getTin()%></td> --%>
					
				</tr>
	
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	
</body>

</html>

