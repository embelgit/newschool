
<%@page import="com.srb.bean.ExamNameList"%>
<%@page import="com.srb.dao.NoticeInfoDao"%>
<%@page import="com.srb.hibernate.NoticeInfoHibernate"%>
<%@page import="com.srb.bean.SuppliersPaymentBean"%>
<%@page import="com.srb.dao.SupplierPaymentDao"%>

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
	
		<title>Supplier List</title>
		
  		
  		<script type="text/javascript">
  			function back()
  			{
  				window.location = "Notice.jsp";
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
                            <h1>Notice</h1>
                            <small>Notice List</small> 
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
                    <a class="btn btn-primary"  onclick="back()" accesskey="t""> <i class="fa fa-list"></i>Notice</a>  
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
						
					}],
					   
					   dom : 'Bfrtip',
				          buttons : [ 

		                     { extend: 'copyHtml5', footer: true },
		                     { extend: 'excelHtml5', footer: true },
		                     { extend: 'csvHtml5', footer: true },
		                     { extend : 'pdfHtml5', footer: true,
		                    	 title : function() {
		                    		 return "Supplier Payment List";
		                    	 },
		                    	 orientation : 'landscape',
		                    	 pageSize : 'LEGAL',
		                    	 titleAttr : 'PDF' 
		                     } ],
		                     
		                     "scrollY": "200px",
		                	 "scrollCollapse": true,
		                	 "paging": false,
				});
					$(tableTools.fnContainer()).insertBefore('#list_wrapper');
			});
	</script>

<body id="dt_example" style="min-height:300px;">
		
	<%
	NoticeInfoDao dao=new NoticeInfoDao();
		List list12 = dao.getnoticeList();
	%>

	<div id="demo_jui">
		<table id="list" class="display" border="1">
			<thead>
				<tr>

	                <th>Class Name</th>
	             	<th>Division Name</th>
			
	         		<th>Academic Year</th>
	                <th>Notice Date</th>
	                <th>Task</th>
					
					
				</tr>
			</thead>
			
			<tbody>
   				<%
//   					int k=0;
					for(int i=0;i<list12.size();i++){
						NoticeInfoHibernate sr=(NoticeInfoHibernate)list12.get(i);
	//					k++;
				%>
				
				<tr>
		
					<td class="align"><%=sr.getClassName() %></td>
					<td class="align"><%=sr.getDivision()%></td>
					<td class="align"><%=sr.getAcademicYear()%></td>
					<td class="align"><%=sr.getNoticeDate()%></td>
					<td class="align"><%=sr.getTask()%></td>
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	
</body>

</html>

