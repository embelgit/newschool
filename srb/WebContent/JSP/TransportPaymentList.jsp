
<%@page import="com.srb.bean.TrasnpotationSchollBusBean"%>
<%@page import="com.srb.dao.TransportationInfoDao"%>

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
	
		<title>Transport List</title>
		
  		
  		<script type="text/javascript">
  			function back()
  			{
  				window.location = "CashBankBook.jsp";
  			}
			function del()
			{
				window.location="DeleteTransportationPayment.jsp"
			}
  		</script>
		
<style>

.scroll{
overflow-x: auto;
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
                            <h1>Transportation Payment List</h1>
                            <small> Payment List</small> 
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
                    <a class="btn btn-primary"  onclick="back()" accesskey="t""> <i class="fa fa-list"></i>Add Transportation Payment</a>  
                </div>
					<div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="del()" accesskey="t""> <i class="fa fa-list"></i>Delete Transportation Payment</a>  
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

<div id="dt_example" style="min-height:300px;">
		
	<%
	TransportationInfoDao dao=new TransportationInfoDao();
		List tid = dao.getTransportationPaymentList();
	%>
<div class="container-fluid"> 
<div class="scroll">
	<div id="demo_jui">
		<table id="list" class="display" border="1">
			<thead>
				<tr>
					<th>Sr No</th>
					<th>Student Name</th>
	             	<th>Total Fees</th>
					<th>Balance</th>
	                <th>Paid Amount</th>
	                <th>Accountant Name</th>
					<th>Payment type</th>
	               <th>Date</th>
					
				</tr>
			</thead>
			
			<tbody>
   				<%
   					int k=0;
					for(int i=0;i<tid.size();i++){
						TrasnpotationSchollBusBean sr=(TrasnpotationSchollBusBean)tid.get(i);
						k++;
				%>
				
				<tr>
					<td class="align"><%=k%></td>
					<td class="align"><%=sr.getStudentName() %></td>
					<td class="align"><%=sr.getTotalAnnualFee() %></td>
					<td class="align"><%=sr.getBalanceAmountT() %></td>
					<td class="align"><%=sr.getPaidAmountT() %></td>
					<td class="align"><%=sr.getPersonnameT() %></td>
					<td class="align"><%=sr.getPaymentMode3() %></td>
					<td class="align"><%=sr.getInsertDate() %></td>				
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
</body>

</html>

