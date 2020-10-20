<%@page import="com.smt.hibernate.UserDetail"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.smt.utility.HibernateUtility"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>


<html>																<!-- Html start -->
<head>																<!-- Head Start -->

<!--  Guru fonts-->

<link href="/SMT/staticContent/guru/css/bootstrap.css" rel="stylesheet">
<link href="/SMT/staticContent/guru/css/bootstrap.min.css" rel="stylesheet">
<link href="/SMT/staticContent/guru/css/bootstrap-theme.css" rel="stylesheet">
<link href="/SMT/staticContent/guru/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Font awesome (social icon) -->
<link href="/SMT/staticContent/guru/css/font-awesome.css" rel="stylesheet">
<link href="/SMT/staticContent/guru/css/font-awesome.min.css" rel="stylesheet">

<script type="text/javascript" src="/SMT/staticContent/guru/js/bootstrap.js" > </script>
<script type="text/javascript" src="/SMT/staticContent/guru/js/bootstrap.min.js"> </script>
<script type="text/javascript" src="/SMT/staticContent/guru/js/npm.js"> </script>
<script type="text/javascript" src="/SMT/staticContent/guru/js/tooltip.js"> </script>
<script type="text/javascript" src="/SMT/staticContent/guru/js/jquery.min.js"> </script> 

 <!-- Fonts -->
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/fontawesome-webfont.eot"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/fontawesome-webfont.svg"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/fontawesome-webfont.ttf"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/fontawesome-webfont.woff"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/fontawesome-webfont.woff2"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/FontAwesome.otf"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.eot"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.svg"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.ttf"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.woff"/>
<link rel="stylesheet" href="/SMT/staticContent/guru/fonts/glyphicons-halflings-regular.woff2"/> 



<!-- <link rel="stylesheet" href="/SMT/staticContent/y_css/bootstrap.min.css">
  <script src="/SMT/staticContent/y_js/jquery.min.js"></script>
  <script src="/SMT/staticContent/y_js/bootstrap.min.js"></script> -->

 
 
 <!-- glyphocons  -->
 
 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
  

		 

      <!-- y_temporary_stock.jsp -->
      
    <script src="/SMT/staticContent/y_js/TemporaryStock.js"></script>
	<script src="/SMT/staticContent/y_js/jquery-1.12.3.min.js"></script>
    <!-- <link href="/SMT/jsp/temporary_stock.jsp" rel="stylesheet"/>-->
	
	<link rel="stylesheet" href="/SMT/staticContent/y_css/jquery-ui.min.css">
    <link rel="stylesheet" href="/SMT/staticContent/y_css/ui.jqgrid.min.css">
    <script src="/SMT/staticContent/y_js/jquery.min.js"></script>
    <script src="/SMT/staticContent/y_js/jquery.jqgrid.min.js"></script>
      
	<!-- y_temporary_stock_return.jsp -->
	
	<script src="/SMT/staticContent/y_js/jquery-1.12.3.min.js"></script>

 <script src="/SMT/staticContent/y_js/temporaryStockReturn.js"></script>

 <link rel="stylesheet" href="/SMT/staticContent/y_css/jquery-ui.min.css">
 
    <link rel="stylesheet" href="/SMT/staticContent/y_css/ui.jqgrid.min.css">
    <script src="/SMT/staticContent/y_js/jquery.min.js"></script>
    <!-- <script src="/SMT/staticContent/y_js/jquery.jqgrid.min.js"></script> -->
    
    
    <!--y_temporaryStockReport.jsp-->
    
    
    <link rel="stylesheet" href="/SMT/staticContent/y_css/jquery-ui.min.css">
    <link rel="stylesheet" href="/SMT/staticContent/y_css/ui.jqgrid.min.css">
    <script src="/SMT/staticContent/y_js/jquery.min.js"></script>
    <!-- <script src="/SMT/staticContent/y_js/jquery.jqgrid.min.js"></script> -->
 	<script src="/SMT/staticContent/y_js/jquery.dataTables.js" type="text/javascript"></script>
	<script type="text/javascript" src="/SMT/staticContent/y_js/jqueryUi.js"></script>
	<link href="/SMT/WebContent/staticContent/y_css/dataTa.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/SMT/staticContent/y_css/dataTables.jqueryui.min.css"  rel="stylesheet" type="text/css" media="all">
		
		<!-- Customer Feedback -->
	<!-- <script src="/SMT/staticContent/y_js/jquery-1.12.3.min.js"></script> -->
	<script src="/SMT/staticContent/y_js/customerfeed.js"></script>	
  
		<!--y_customer_feedback_list.jsp-->
        <link href="/SMT/staticContent/y_css/jquery.dataTables.css" rel="stylesheet" type="text/css" media="all" />
		<link href="/SMT/staticContent/y_css/jquery.dataTables.tableTools.css" rel="stylesheet" type="text/css" media="all" />
		<script src="/SMT/staticContent/y_js/jquery.js" type="text/javascript"></script>
		<script src="/SMT/staticContent/y_js/jquery.dataTables.js" type="text/javascript"></script>
		<script src="/SMT/staticContent/y_js/jquery.dataTables.tableTools.min.js" type="text/javascript"></script>
		<link href="/SMT/staticContent/y_css/style.css" rel="stylesheet" />
		
		<!--y_loyalty_program.jsp-->
		<!-- <script src="/SMT/staticContent/y_css/adi.css"></script> -->
    	<script src="/SMT/staticContent/y_js/loyaltyProgram.js"></script>
    	
    	<!-- y_card_point.jsp -->
    	<script src="/SMT/staticContent/y_js/cardpoint.js"></script>
		<!-- <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script> -->
    	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css"> -->
    	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.13.3/css/ui.jqgrid.min.css"> -->
    	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
    	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.13.3/js/jquery.jqgrid.min.js"></script> -->
    	
    	<!-- y_visitor.jsp -->
    	<!-- <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script> -->
		<script src="/SMT/staticContent/js/visitor.js"></script>
		<!-- <link href="/SMT/staticContent/css/style.css" rel="stylesheet"/> -->
		
		<!-- Category.jsp -->
		<script src="/SMT/staticContent/y_js/category.js"></script>
		<!-- <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.13.3/css/ui.jqgrid.min.css">
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.13.3/js/jquery.jqgrid.min.js"></script> -->
		 
		<!-- y_subcategory.js -->
		<script src="/SMT/staticContent/y_js/subcategory.js"></script>
	    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css"> -->
	    <script src="/SMT/staticContent/y_js/uppercase.js"></script>
	    
	    <!-- Product Detail -->
	    <!-- <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script> -->
		<script src="/SMT/staticContent/y_js/productDetail.js"></script>
		<script src="/SMT/staticContent/y_js/ItemDetail.js"></script>
		<!-- <link rel="stylesheet" href="/SMT/staticContent/css/jquery-ui.min.css">
	    <link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.min.css">
	    <link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.css">
	    <script src="/SMT/staticContent/js/jquery.min.js"></script>
	    <script src="/SMT/staticContent/js/jquery.jqgrid.min.js"></script> -->
    	
    	 <!-- y_offer_creation.jsp -->
		<script src="/SMT/staticContent/y_js/offerDetail.js" > </script>
		
		 <!-- y_shop.jsp -->
		<!--  <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
   		 <script src="/SMT/staticContent/css/adi.css"></script> -->
    	 <script src="/SMT/staticContent/y_js/shopdetail.js"></script>
    	 
    	 <!-- supplier_details.jsp -->
			<!-- <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script> -->
			<script src="/SMT/staticContent/y_js/supplier.js"></script>
			
		 <!-- y_SupplierEdit.jsp -->
		<!--  <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script> -->
		 <script src="/SMT/staticContent/y_js/supplier.js"></script>
		 
		 <!-- y_broker.jsp -->
		<!-- <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script> -->
	   <!--  <script src="/SMT/staticContent/css/adi.css"></script>  -->
	    <script src="/SMT/staticContent/y_js/broker.js"></script>
	    <link href="/SMT/jsp/y_broker.jsp" rel="stylesheet"/>
	    
	    <!-- y_authority_slip.jsp -->
			<script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
			<script src="/SMT/staticContent/y_js/authorityslip.js"></script>
		   	<link rel="stylesheet" href="/SMT/staticContent/css/jquery-ui.min.css">
		    <link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.min.css">
		    <link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.css">
		    <script src="/SMT/staticContent/js/jquery.min.js"></script>
		    <script src="/SMT/staticContent/js/jquery.jqgrid.min.js"></script>
		    
		   <!--  y_authority_slip_shop_to_godown.jsp -->
		    <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
			<script src="/SMT/staticContent/y_js/AuthorityShoptoGodown.js"></script>
		   	<link rel="stylesheet" href="/SMT/staticContent/css/jquery-ui.min.css">
		    <link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.min.css">
		    <link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.css">
		    <script src="/SMT/staticContent/js/jquery.min.js"></script>
		    <script src="/SMT/staticContent/js/jquery.jqgrid.min.js"></script>
		    
		    <!-- Billing -->
		    <!-- y_customer_bill1.jsp -->
		     <script src="/SMT/staticContent/js/customerOrder.js"></script>
		    <script src="/SMT/staticContent/js/jquery-1.12.3.min.js"></script>
		    <meta name="viewport" content="width=device-width,initial-scale=1">
		    <link rel="stylesheet" href="/SMT/staticContent/css/jquery-ui.min.css">
		    <link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.min.css">
		    <link rel="stylesheet" href="/SMT/staticContent/css/ui.jqgrid.css">
		    <script src="/SMT/staticContent/js/jquery.min.js"></script>
		    <script src="/SMT/staticContent/js/jquery.jqgrid.min.js"></script>
		    <script src="/SMT/staticContent/js/jquery-ui.min.js"></script>
		    
		 
		 
 </head>



		
