


<%@page import="com.srb.bean.BookReturnBean "%>
<%@page import="com.srb.dao.bookreturnDao "%>

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
	
		<title>Book Return List</title>
		
  		
  		<script type="text/javascript">
  			function Back()
  			{
  				window.location = "libraryManagement.jsp";
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
                            <h1>Book Return List</h1>
                            <small>Book Return List</small> 
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
	bookreturnDao  dao=new bookreturnDao ();
	List list12=dao.getbookReturnlist();
	%>

	<div id="demo_jui">
		<table id="list" class="display" border="1">
			<thead>
			
		<tr>
					<th>Student Name</th>
					<th>Actual Date</th>
					<th>Class Name</th>
					<th>Division Name</th>
					
		</tr>
			</thead>
			
			<tbody>
			
   				<% 
   					int k=0;
					for(int i=0;i<list12.size();i++){
						BookReturnBean  sr=(BookReturnBean )list12.get(i);
						k++;
				%>
				
				<tr>
					<td class="align"><%=sr.getStudentName()%></td>
					<td class="align"><%=sr.getActualDate()%></td>
					<td class="align"><%=sr.getClassName()%></td>
					<td class="align"><%=sr.getDivisionName()%></td>
					
					
					
				
					
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

tml>