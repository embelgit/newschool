<%@page import="com.smt.hibernate.UserDetail"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.smt.utility.HibernateUtility"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<script src="/SMT/staticContent/js/logout.js"></script>


               <% String type1= "";
                     String name1 = "";
		             if (session != null) {
			
			         if (session.getAttribute("user") != null) {
				     name1 = (String) session.getAttribute("user");
				    
			            
	            	  
		              HibernateUtility hbu1=HibernateUtility.getInstance();
		              Session session2=hbu1.getHibernateSession();
		   
		              org.hibernate.Query query1 = session2.createQuery("from UserDetail where userName =:usr");
		              query1.setParameter("usr", name1);
		              UserDetail userDetail1 = (UserDetail) query1.uniqueResult();
		              type1 = userDetail1.getTypeId();
			         } 
			         else {
							
					     response.sendRedirect("/SMT/jsp/login.jsp");
					     out.println("Please Login ");
				        }
			         
		           }
		             else {
							
					     response.sendRedirect("/SMT/jsp/login.jsp");
					     out.println("Please Login ");
				        }
	           %>




<% String  contextPath=request.getContextPath(); %>
<% String path=""; if(isHome)path="jsp\\"; %>


<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/SMT/staticContent/guru/js/jquery.min.js"> </script> 
<link rel="stylesheet"
	href="/SMT/staticContent/y_css/bootstrap.min.css">
<title>Embel Technology</title>
<link rel="stylesheet"
	href="/SMT/staticContent/y_css/bootstrap.min.css"
	>
<%if(isHome){%>
<link rel="stylesheet" href="staticContent/y_css/style.css" />
<%}else{ %>
<link rel="stylesheet" href="../staticContent/y_css/style.css" />
<% } %>
<script
	src="/SMT/staticContent/y_js/bootstrap.min.js"></script>


<%if(isHome){%>
<link rel="stylesheet" href="staticContent/y_css/style.css" />
<%}else{ %>
<link rel="stylesheet" href="../staticContent/y_css/style.css" />
<% } %>


<meta name="viewport" content="width=device-width,initial-scale=1">

<!--  Guru fonts-->
<script type="text/javascript" src="/SMT/staticContent/guru/js/jquery.min.js"> </script> 
<link href="/SMT/staticContent/guru/css/bootstrap.css" rel="stylesheet">
<link href="/SMT/staticContent/guru/css/bootstrap.min.css" rel="stylesheet">
<link href="/SMT/staticContent/guru/css/bootstrap-theme.css" rel="stylesheet">
<link href="/SMT/staticContent/guru/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Font awesome (social icon) -->
<link href="/SMT/staticContent/guru/css/font-awesome.css" rel="stylesheet">
<link href="/SMT/staticContent/guru/css/font-awesome.min.css" rel="stylesheet">

<script type="text/javascript" src="/SMT/staticContent/guru/js/bootstrap.js" > </script>
<script type="text/javascript" src="/SMT/staticContent/guru/js/jquery.min.js"> </script> 
<script type="text/javascript" src="/SMT/staticContent/guru/js/bootstrap.min.js"> </script>
<script type="text/javascript" src="/SMT/staticContent/guru/js/npm.js"> </script>
<script type="text/javascript" src="/SMT/staticContent/guru/js/tooltip.js"> </script>


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
		
  
		<!--y_customer_feedback_list.jsp-->
        <link href="/SMT/staticContent/y_css/jquery.dataTables.css" rel="stylesheet" type="text/css" media="all" />
		<link href="/SMT/staticContent/y_css/jquery.dataTables.tableTools.css" rel="stylesheet" type="text/css" media="all" />
		<script src="/SMT/staticContent/y_js/jquery.js" type="text/javascript"></script>
		<script src="/SMT/staticContent/y_js/jquery.dataTables.js" type="text/javascript"></script>
		<script src="/SMT/staticContent/y_js/jquery.dataTables.tableTools.min.js" type="text/javascript"></script>
		<link href="/SMT/staticContent/y_css/style.css" rel="stylesheet" />
	


		<!-- header start-->
<!-- <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
<script src="/SMT/staticContent/y_js/prefixfree.min.js"></script>
<script src="/SMT/staticContent/y_js/modernizr.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/css?family=roboto:400,400italic,600,700,800);

*,
html,
body,
div,
dl,
dt,
dd,
ul,
ol,
li,
h1,
h2,
h3,
h4,
h5,
h6,
pre,
form,
label,
fieldset,
input,
p,
blockquote,
th,
td {
  margin: 0;
  padding: 0;
}

article,
aside,
figure,
footer,
header,
hgroup,
nav,
section { display: block; }

* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

html { -webkit-font-smoothing: antialiased; }

a {
  color: #BA0707;
  text-decoration: none;
}

a:hover { color: #BA0707; }

body {
  
  color: #E95546;
  font: 14px "roboto", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  line-height: 1;
  width: 100%;
}

nav {
  display: block;
  background:#8c7674
}

.menu { display: block; }

.menu li {
  display: inline-block;
  position: relative;
  z-index: 100;
}

.menu li:first-child { margin-left: 0; }

.menu li a {
  font-weight: 600;
  text-decoration: none;
  padding: 20px 15px;
  display: block;
  color: #fff;
  transition: all 0.2s ease-in-out 0s;
}

.menu li a:hover,
.menu li:hover>a {
  color: #fff;
  background: cadetblue;
}

.menu ul {
  visibility: hidden;
  opacity: 0;
  margin: 0;
  padding: 0;
  width: 170px;
  position: absolute;
  left: 0px;
  background: #fff;
  z-index: 99;
  transform: translate(0, 20px);
  transition: all 0.2s ease-out;
}

.menu ul:after {
  bottom: 100%;
  left: 20%;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
  border-color: rgba(255, 255, 255, 0);
  border-bottom-color: #fff;
  border-width: 6px;
  margin-left: -6px;
}

.menu ul li {
  display: block;
  float: none;
  background: none;
  margin: 0;
  padding: 0;
}

.menu ul li a {
  font-size: 15px;
  font-weight: bold;
  display: block;
  color: #797979;
  background: #fff;
}

.menu ul li a:hover,
.menu ul li:hover>a {
  background: #FC6D58;
  color: #fff;
}

.menu li:hover>ul {
  visibility: visible;
  opacity: 1;
  transform: translate(0, 0);
}

.menu ul ul {
  left: 169px;
  top: 0px;
  visibility: hidden;
  opacity: 0;
  transform: translate(20px, 20px);
  transition: all 0.2s ease-out;
}

.menu ul ul:after {
  left: -6px;
  top: 10%;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
  border-color: rgba(255, 255, 255, 0);
  border-right-color: #fff;
  border-width: 6px;
  margin-top: -6px;
}

.menu li>ul ul:hover {
  visibility: visible;
  opacity: 1;
  transform: translate(0, 0);
}

.responsive-menu {
  display: none;
  width: 100%;
  padding: 20px 15px;
  background: #E95546;
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
}

.responsive-menu:hover {
  background: #E95546;
  color: #fff;
  text-decoration: none;
}

a.homer { background: #ab8da0; }
 @media (min-width: 768px) and (max-width: 979px) {

.mainWrap { width: 768px; }

.menu ul { top: 37px; }

.menu li a { font-size: 12px; }

a.homer { background: #E95546; }
}
 @media (max-width: 767px) {

.mainWrap {
  width: auto;
  padding: 50px 20px;
}

.menu { display: none; }

.responsive-menu { display: block; }

nav {
  margin: 0;
  background: none;
}

.menu li {
  display: block;
  margin: 0;
}

.menu li a {
  background: #fff;
  color: #797979;
}

.menu li a:hover,
.menu li:hover>a {
  background: #8c7674;
  color: #fff;
}

.menu ul {
  visibility: hidden;
  opacity: 0;
  top: 0;
  left: 0;
  width: 100%;
  transform: initial;
}

.menu li:hover>ul {
  visibility: visible;
  opacity: 1;
  position: relative;
  transform: initial;
}

.menu ul ul {
  left: 0;
  transform: initial;
}

.menu li>ul ul:hover { transform: initial; }
}
</style>
</head>

<body>
<nav class="navbar navbar-fixed-top"> 
<a id="resp-menu" class="responsive-menu" href="#"><i class="fa fa-reorder"></i> Menu</a>
  <ul class="menu">
    <li><a class="homer" href="#"><i class="fa fa-home"></i> HOME</a>
     
    </li>
    <li><a  href="/SMT/jsp/y_index.jsp"><i class="fa fa-sitemap"></i> Master</a>
      <ul class="sub-menu">
        <li><a href="#">Category</a>
           <%
    			  if(type1.equals("salesman")|| type1.equals("admin")){
    	  
            %>	
        
          <ul>
            <li><a href="<%=path%>y_category_subcategory.jsp">Add Category</a></li>
			<li><a href="<%=path%>s_category_list.jsp" >Category List</a></li>
			<%-- <li><a href="<%=path%>dynamicDemo.jsp" >Dynamic List</a></li> --%>
          </ul>
        </li>
        <li><a href="#">Add Products</a>
          <ul>
           <li><a href="<%=path%>y_product_detail.jsp" accesskey="p">Product Details</a></li>
		   <li><a href="<%=path%>s_item_list.jsp" >Item List</a></li>
		   <li><a href="<%=path%>y_offer_creation.jsp" accesskey="o">Special Offer</a></li>
		   <li><a href="<%=path%>y_shop.jsp">Add Shop</a></li>
          </ul>
        </li>
        
        <%}%>	
		  <% if(type1.equals("salesman")|| type1.equals("admin") || type1.equals("account") ){ %>	        
        
        <li><a href="#">Supplier</a>
          <ul>
            <li><a href="<%=path%>y_supplier_detail.jsp" accesskey="s">Supplier Details</a></li>
			<li><a href="<%=path%>s_supplier_list.jsp" accesskey="l">Supplier List</a></li>
			<li><a href="<%=path%>y_SupplierEdit.jsp" accesskey="l">Edit Supplier</a></li>
			<li><a href="<%=path%>y_broker.jsp">Broker Details</a></li>
			<li><a href="<%=path%>s_broker_list.jsp">Broker List</a></li>
          </ul>
        </li>
        
        <%}%>	
			<% if(type1.equals("salesman")|| type1.equals("admin")){  %>	
        
        <li><a href="#">Stock Movement</a>
          <ul>
            <li><a href="<%=path%>y_authority_slip.jsp">Authority Slip</a></li>
			<li><a href="<%=path%>y_authority_slip_shop_to_godown.jsp">Authority Slip Shop To Godown </a></li>
			<li><a href="<%=path%>s_fast_moving_item.jsp">Fast Moving Item</a></li>
          </ul>
        </li>
        
      </ul>
    </li>
   
    <%}%>	
    
    <li><a  href="#"><i class="fa fa-edit"></i> Billing</a>
      <ul class="sub-menu">
      		<%if(type1.equals("account")|| type1.equals("admin")){%>
        
        				<li><a href="<%=path%>y_customer_bill1.jsp" accesskey="c">Customer Bill</a></li>
						<li><a href="<%=path%>s_customer_bill_history.jsp" accesskey="c">All Bill Details</a></li>
						<li><a href="<%=path%>y_customer_detailsCredit.jsp">Add Credit Customer Details</a></li>
						
						<li><a href="<%=path%>y_sale_return.jsp">Sale Return</a></li>
        <%}%>
        			
      </ul>
    </li>
    
   		<li><a  href="#"><i class="fa fa-shopping-cart"></i> Purchase</a>
      		<ul class="sub-menu">
            <% if(type1.equals("salesman")|| type1.equals("admin")  ){ %>	
						<li><a href="<%=path%>s_po_details.jsp">Purchase Order</a></li>
						<li><a href="<%=path%>s_po_received.jsp" accesskey="g">PO Goods Received</a></li>
						<li><a href="<%=path%>s_grnList.jsp">PO Goods Received List</a></li>
						<li><a href="<%=path%>s_preGrnReg.jsp">Previous Goods Received</a></li>
						<li><a href="<%=path%>s_purchase_return.jsp">Purchase Return</a></li>
						<li><a href="<%=path%>s_parcel_entry.jsp">Parcel Entry</a></li>
						
				<%
					}
				%>	
          </ul>
        </li>
        
     <li><a  href="#"><i class="fa fa-user-secret"></i> HR</a>
      <ul class="sub-menu">
        
        <li><a href="#">Employee</a>
          <ul>
            <%
    
                  if(type1.equals("admin") || type1.equals("account") ||type1.equals("salesman")){
    	  
                %>	
                            	<!-- <li class="kopie"><a href="#">Employee</a></li> -->
								<li><a href="<%=path%>y_employee_details.jsp" accesskey="x">Employee Details</a></li>
								<li><a href="<%=path%>s_employee_list.jsp"  accesskey="a">Employee List</a></li>
								<li><a href="<%=path%>y_employee_attendance.jsp">Employee Attendance</a></li>	
								<li><a href="<%=path%>y_employeeAttendance.jsp">Employee Attendance 1</a></li>	
							</ul>
		</li>
        
        <li><a href="<%=path%>leave.jsp">Leave </a></li>
        
        <%}%>
        
      </ul>
    </li>
    
    
    <li><a  href="#"><i class="	fa fa-address-book-o"></i> Account</a>
      <ul class="sub-menu">
        <li><a href="<%=path%>s_supplierAccountDetails.jsp">Supplier Accont  Details</a></li>
		<li><a href="<%=path%>s_accounts.jsp">Add Other Account</a></li>
        <li><a href="#">Cash Book</a>
          <ul>
            <%
    
                  if(type1.equals("admin")|| type1.equals("account") ){
    	  
                %>	
                             	
							 <li><a href="<%=path%>s_cash_bank_book_supplier.jsp">Cash Book Supplier</a></li>
							 <li><a href="<%=path%>s_cash_bank_book_salesman.jsp">Cash Book Salesman</a></li>
							 <li><a href="<%=path%>s_cash_bank_book_credit_customer.jsp">Cash Book Credit Customer</a></li>
							 <li><a href="<%=path%>s_cash_bank_book_other.jsp">Cash Book Other</a></li>
				<%
					}
				%>
          </ul>
        </li>
        <li><a href="#">Credit Account Report</a>
          <ul>
            <%
    
                  if(type1.equals("admin")|| type1.equals("account") ){
    	  
                %>	
	           
							<li><a href="<%=path%>s_other_cash_bank_between_twodates.jsp" >Other Account Detail Report Beetween Two Days</a></li>	
							<li><a href="<%=path%>s_oheraccountdetails.jsp" >Other Account Report</a></li>
							<li><a href="<%=path%>s_customer_credit_account_details.jsp">Credit Customer Payment Report</a></li>
							<li><a href="<%=path%>s_supplier_wise_report.jsp" >Bill Wise Account Details</a></li>
								<%
				}
				%>
          </ul>
        </li>
        
        <li><a href="#">Supplier Account Report</a>
          <ul>
           <%
    
                  if(type1.equals("admin")|| type1.equals("account") ){
    	  
                %>	
	           
				
							<li><a href="<%=path%>s_supplier_account_list.jsp" >Supplier Account List</a></li>
							<li><a href="<%=path%>s_cashbankbookreport.jsp" >Supplier Account Report Between Two Date</a></li>
							<li><a href="<%=path%>s_other_cash_bank_between_twodates.jsp" >Other Account Detail Report Beetween Two Days</a></li>	
							
								<%
				}
				%>
          </ul>
        </li>
        
        <li><a href="#">Employee Account Report</a>
          <ul>
           <%
    
                  if(type1.equals("admin")|| type1.equals("account") ){
    	  
                %>	
	           
						<li><a href="<%=path%>s_employee_account_details.jsp" >Employee Account Details</a></li>
						<li><a href="<%=path%>s_salesman_cash_bank_between_twodates.jsp" >Employee Account Detail Report</a></li>
				<%
					}
				%>
          </ul>
        </li>
        
        
        <%
    
                  if(type1.equals("admin")|| type1.equals("account") ){
    	  
                %>	
						
						<li><a href="<%=path%>s_tax.jsp">Tax</a></li>
						
					
						
							<%
				}
				%>
        
      </ul>
    </li>
    
    <%
					if(type1.equals("admin") || type1.equals("account") || type1.equals("salesman"))
					
					{
				
				%>
    
   <li><a  href="#"><i class="fa fa-bar-chart"></i> Stock</a>
      <ul class="sub-menu">
        <li><a href="<%=path%>current_stock.jsp">Current Stock </a></li>
								
								<li><a href="<%=path%>s_CategoryWiseStock.jsp">CategoryWise Stock</a></li>
								<li><a href="<%=path%>s_supplierWiseStock.jsp">SupplierWise Stock</a></li>
								<li><a href="<%=path%>s_shopWiseStock.jsp">Shop Wise Stock</a></li>
								<li><a href="<%=path%>s_age_wise_stock.jsp">Age Wise Stock</a></li>
								<li><a href="<%=path%>s_item_in_shop.jsp">Item In Shop</a></li>
								<li><a href="<%=path%>s_item_in_godown.jsp">Item In Godown</a></li>
								
								
								<%
								
								}
								%>
       
      </ul>
    </li>
    
      	
    <li><a  href="#"><i class="fa fa-file-zip-o"></i> Reports</a>
      <ul class="sub-menu">
	  
				<li><a href="#">Sale Graph Report</a>
				  <ul>
									<%
			    
			                  if(type1.equals("admin") || type1.equals("account")){
			    	  
			                %>	
														<li><a href="<%=path%>s_daily_sale_graph.jsp"accesskey="d">Daily Sale Graph </a></li>
														<li><a href="<%=path%>s_week_sale_graph.jsp">Weekly Sale Graph </a></li>
														<li><a href="<%=path%>s_monthly_sale_graph.jsp">Monthly Sale Graph </a></li>
														<li><a href="<%=path%>s_daily_shop_graph.jsp">Daily Shop Sale Graph </a></li>
														<li><a href="<%=path%>s_weekly_shop_graph.jsp">Weekly Shop Sale Graph </a></li>
														<li><a href="<%=path%>s_monthly_shop_graph.jsp">Monthly Shop Sale Graph </a></li>
														<li><a href="<%=path%>s_yearly_shop_graph.jsp">Yearly Shop Sale Graph </a></li>
														<li><a href="<%=path%>s_due_date.jsp">Payment Due Date </a></li>
								<%
							}
							%>	
				  </ul>
				</li>
				
				
				<li><a href="#">Sale Report</a>
				  <ul>
				  
					<li><a href="#">Shop Related Reports</a>
								<ul>
									<li><a href="<%=path%>s_shop_wise_sale.jsp" >Shop Wise Sale</a></li>
               					 		<li><a href="<%=path%>s_shopWiseSaleByTwoDate.jsp" >Shop Sale Between Two Date</a></li>
								  </ul>
					</li>
					
					<li><a href="#">All Sale Reports</a>
								<ul>
									<li><a href="<%=path%>s_day_wise_sale.jsp" >Total Sale Report</a></li>
										<li><a href="<%=path%>s_sale_report_between_single_dates.jsp" >Date Wise Sale Report</a></li>
										<li><a href="<%=path%>s_categorywise_sale_report.jsp" >Category Wise Sale Report</a></li>
										<li><a href="<%=path%>s_subcategorywise_sale_report.jsp" >Sub-Category Wise Sale Report</a></li>
										<li><a href="<%=path%>s_itemwise_sale_report.jsp" >Product Sale Report</a></li>
										<li><a href="<%=path%>s_supplierwise_sale_report.jsp" >Supplier Wise Sale Report</a></li>
										<li><a href="<%=path%>s_itemPerformanceBeetweenTwoDays.jsp" >Item Wise Performance Between Two Dates</a></li>
										<li><a href="<%=path%>s_day_closing_payment_datewise.jsp" >Day Closing Payment Datewise</a></li>
										<li><a href="<%=path%>s_date_wise_sale_report.jsp" >Sale Report BetWeen Two Days </a></li>
										<li><a href="<%=path%>s_salereturndaywise.jsp" >Sale Return Report Using Single Date</a></li>
								  </ul>
					</li>
				<%--			<%
				}
				%>			
				   <%
    
                  if(type1.equals("admin") || type1.equals("account") ||type1.equals("salesman")){
    	  
                %>	
				
					<%
				}
				%>					
	 --%>						
					
				  </ul>
				</li>
				
				<li><a href="#">Purchase Report</a>
				  <ul>
								<li><a href="<%=path%>s_purchase_report_between_two_dates.jsp" >Purchase Report Between Two Days </a></li>
								<li><a href="<%=path%>s_purchase_report_by_shop.jsp" >Purchase Report By Shop </a></li>
								<li><a href="<%=path%>s_purchase_report_yearly.jsp" >Purchase Report Yearly </a></li>
								<li><a href="<%=path%>s_purchase_report_supplier_wise.jsp" >Purchase Report Supplier Wise </a></li>
								<li><a href="<%=path%>s_itemwise_purchase_report.jsp" >Item Wise Purchase Report</a></li>
								<li><a href="<%=path%>s_supplierwise_purchase_report.jsp" >Supplier Wise Purchase Report</a></li>
								<li><a href="<%=path%>s_purchase_report.jsp">Purchase Report</a></li>
								<li><a href="<%=path%>s_categorywise_purchase_report.jsp">Category Wise Purchase Report</a></li>
								<li><a href="<%=path%>s_subcategorywise_purchase_report.jsp">Sub-Category Wise Purchase Report</a></li>
				  </ul>
				</li>
				
				<li><a href="#">Commission Report</a>
				  <ul>
								<li><a href="<%=path%>s_date_wise_commision_for_employee.jsp" >Date Wise Commission For Employee</a></li>
								<li><a href="<%=path%>s_day_wise_salesman_commision.jsp">Day Wise Employee Commision</a></li>
				  </ul>
				</li>
				
				<li><a href="#">VAT Report</a>
				  <ul>
								<li><a href="<%=path%>s_shop1vat.jsp">Shop1 vat</a></li>
								<li><a href="<%=path%>s_shop2vat.jsp">Shop2 vat</a></li>
								<li><a href="<%=path%>s_shop3vat.jsp">Shop3 vat</a></li>
								<li><a href="<%=path%>s_shopWiseVat.jsp">Shop Wise Vat</a></li>
				  </ul>
				</li>
				
				<li><a href="<%=path%>s_barcode_detail.jsp" >Barcode Detail</a></li>
						<li><a href="<%=path%>s_day_closing_payments.jsp" >Day Closing Payments</a></li>
						<li><a href="<%=path%>s_get_all_return_bills.jsp" >All Return Bills </a></li>
		
      </ul>
    </li>
      	
      	
    <li><a  href="#"><i class="fa fa-tags"></i> CS Desk</a>
      <ul class="sub-menu">
        		<%
    
                  if(type1.equals("admin") || type1.equals("account") ||type1.equals("salesman")){
    	  
                %>
        <li><a href="#">Temporary</a>
          <ul>
            				<li><a href="<%=path%>y_temporary_stock.jsp">Temporary Stock</a></li> 
							<li><a href="<%=path%>y_temporary_stock_return.jsp">Temporary Stock Return</a></li>
							<li><a href="<%=path%>y_temporaryStockReport.jsp">Temporary Stock Details</a></li>
          </ul>
        </li>
          				<li><a href="<%=path%>y_customer_feedback.jsp">Customer Feedback</a></li>
						<li><a href="<%=path%>y_customer_feedback_list.jsp" >Customer Feedback List</a></li>
						<li><a href="<%=path%>y_loyalty_program.jsp">Loyalty Program</a></li>
						<li><a href="<%=path%>y_loyalty_program_list.jsp" >Loyalty Program List</a></li>
						<li><a href="<%=path%>y_card_point.jsp">Card Point</a></li>
						<li><a href="<%=path%>y_visitor.jsp" >Visitor</a></li>
						<li><a href="<%=path%>y_visitor_list.jsp">Visitor List</a></li>
      </ul>
    </li>
      	
    <li><a class="homer" href="#"><i class="fa fa-bell-o"></i> Notification</a>
      <ul class="sub-menu">
        <li><a href="<%=path%>birthday.jsp">s_Birthday</a></li>
		<li><a href="<%=path%>anniversary.jsp">s_Anniversary</a></li>
						
	<%
		}
		%>
      </ul>
    </li>
      	
   
	            <%
    
                  if(type1.equals("admin")){
    	  
                %>	
    <li><a  href="/SMT/jsp/create_user.jsp"><i class="fa fa-user-o"></i> Create User</a></li>
    <%
				}
				%>
				
				<%
    
                  if(type1.equals("admin") || type1.equals("account") ||type1.equals("salesman")){
    	  
                %>	
    <li><a  onclick="Logout()"><i class="fa fa-power-off"></i> Logout</a></li>
    
    
    <%
    
                  }
    %>
  </ul>
  
</nav>


<script src="/SMT/staticContent/y_js/jquery-2.1.3.min.js"></script> 
<script>
$(document).ready(function(){ 
	var touch 	= $('#resp-menu');
	var menu 	= $('.menu');
 
	$(touch).on('click', function(e) {
		e.preventDefault();
		menu.slideToggle();
	});
	
	$(window).resize(function(){
		var w = $(window).width();
		if(w > 767 && menu.is(':hidden')) {
			menu.removeAttr('style');
		}
	});
	
});
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<!-- header end -->


	
