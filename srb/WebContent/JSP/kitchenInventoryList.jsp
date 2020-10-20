
<%@page import="com.srb.bean.KitchenInventoryBean"%>
<%@page import="com.srb.dao.KitchenInventoryDao"%>

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
  				window.location = "store_management.jsp";
  			}
  			function delkitchen()
  			{
  				window.location = "delkitchenlist.jsp";
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
                            <h1>Inventory List</h1>
                            <small>Inventory List</small> 
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
                    <a class="btn btn-primary"  onclick="back()" accesskey="t""> <i class="fa fa-list"></i>Add Kitchen Inventory</a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="delkitchen()" accesskey="t""> <i class="fa fa-list"></i>Delete Kitchen Inventory</a>  
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
	KitchenInventoryDao dao=new KitchenInventoryDao();
	List list12=dao.getKitchenInventoryList();
	%>

	<div id="demo_jui">
		<table id="list" class="display" border="1">
			<thead>
				<tr>
					<th>Sr No</th>
					<th>Bill No</th>
	                <th>Date</th>
	             	<th>Supplier Name</th>
					<th>Product Name</th>
	                <th>Unit</th>
	                <th>Quantity</th>
					<th>Buy Price</th>
	                <th>Total</th>
					<!-- <th>Sub Total</th> -->
					<th>GST</th>
					<th>GST Amount</th>
					<th>Gross Total</th>
					
				</tr>
			</thead>
			
			<tbody>
   				<%
   					int k=0;
					for(int i=0;i<list12.size();i++){
						KitchenInventoryBean sr=(KitchenInventoryBean)list12.get(i);
						k++;
				%>
				
				<tr>
					<td class="align"><%=k%></td>
					<td class="align"><%=sr.getBillNo() %></td>
					<td class="align"><%=sr.getDate() %></td>
					<td class="align"><%=sr.getSupplierName() %></td>
					<td class="align"><%=sr.getProductName() %></td>
					<td class="align"><%=sr.getUnit() %></td>
					<td class="align"><%=sr.getQuantity() %></td>
					<td class="align"><%=sr.getBuyPrice() %></td>
					<td class="align"><%=sr.getTotal() %></td>
					<%-- <td class="align"><%=sr.getSubTotal() %></td> --%>
					<td class="align"><%=sr.getGst() %></td>
					<td class="align"><%=sr.getGstAmount() %></td>
					<td class="align"><%=sr.getGrossTotal() %></td>
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	
</body>

</html>

