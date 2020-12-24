
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.srb.hibernate.SupplierPaymentBean"%>
<%@page import="com.srb.hibernate.BookStockHibernate"%>
<%@page import="com.srb.dao.LibraryManagementDao"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.SupplierDetailsBean"%>
<%@page import="com.srb.dao.SupplierDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Library Management</title>
<link rel="stylesheet"
	href="/srb/staticContent/css/RadioButtonStyle.css">
    <!-- <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script> -->
   <!-- <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     
     <link rel="stylesheet" href="/AgriSoft/staticContent/css/ui.jqgrid.css">
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
     
	 <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script>
     <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script> -->
    
    <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
     
 	 <!-- <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script> -->
     <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/bootbox.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/bootbox.min.js"></script>
    
    
    
    
    
    
<script src="/srb/staticContent/JS/libraryManagement.js"></script>

<script type="text/javascript">

	function reload()
	{
		location.reload();
	}

</script>

<script type="text/javascript">
	function stockList()
	{
		window.location="LibraryStockList.jsp";
		
	}
	function BookissueList()
	{
		window.location="ListBookStudentIssue.jsp";
		
	}
	function employeebookisue()
	{
		window.location="EmployeeBookIssueList.jsp";
	}
	function employeebooReturn()
	{
		window.location="EmployeeBookReturnList.jsp";
	}
	function StudentBookReturnList()
	{
		window.location="bookReturnlist.jsp";
	}
</script>

<script type="text/javascript">
function checkForDuplicateBillEntry(){
          			
          			
	var input = document.getElementById('supplierName'),
	list = document.getElementById('dealerName_drop'),
	i,fk_supplier_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_supplier_id = list.options[i].getAttribute('data-value');
		}
	}
          			
          			<%
          			LibraryManagementDao dao2 = new LibraryManagementDao();
          			List list = dao2.getAllMainSupplierpayment();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				SupplierPaymentBean bean = (SupplierPaymentBean)list.get(z);
          			%>
          			var pksupPaymentId = "<%=bean.getPkSupPaymentId()%>";
          			var Bill1 = "<%=bean.getBillNo1()%>";
          			var fksupid = "<%=bean.getSupplier1()%>";
          			var SupName = "<%=bean.getSupplier()%>"
          			var Bill = document.getElementById("billNo").value;
          			//var	Bill = $('#billNo').val();
          			
          			//Bill = Integer.parseInt(request.getParameter("billNo"));
          			//var fk_supplier_id =document.getElementById("supplierName").value;
          			//var BillNo =Integer.toString(Bil); 
          			//var className1=className.toLowerCase();
          			//var cName1=cName.toLowerCase();
          			if(  Bill == Bill1 ){
          				alert("Bill No already exist...Duplicate Not allowed");
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
</script>

<script type="text/javascript">
	function reload()
	{
		location.reload();
	}

</script>

<!-- <script type="text/javascript">
	function clearFiled()
	{
		document.getElementById("bookName").value="";
	}


</script> -->

<!-- 
 <script src="jquery-1.3.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $("#bookName").focus();
        });
    </script>
 -->
 		<script type="text/javascript">
			function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
	   </script>
		
		<script type="text/javascript">
			function isAlphabets(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
		    {
		        return false;
		    }
		    return true;
			}


		</script>
		
		
		<script type="text/javascript">
			function isAlphabetsWithSpace(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)){
		        return false;
		    }
		    return true;
			}


		</script>

</head>

<body onload="getBookNameForIssue()">

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Library Management</h1>
                            <small>Library</small> 
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
                    <a class="btn btn-primary"  onclick="stockList()" accesskey="t""> <i class="fa fa-book"></i>Stock List</a>  
                </div>

            </div>
 		
 
 
            <div class="panel-heading no-print">
                          </div> 

            <div class="panel-body panel-form">
                <div class="row">
	

		<ul class="nav nav-tabs">
	    	<li class="active"><a data-toggle="tab" href="#bookEntry"><h4 style="color:blue">Book Entry</h4></a></li>
	    	<li><a data-toggle="tab" href="#home"><h4 style="color:blue">Student Book Issue</h4></a></li>
	    	<li><a data-toggle="tab" href="#bookReturn"><h4 style="color:blue">Student Book Return</h4></a></li>
	    	<li><a data-toggle="tab" href="#teacherBookissue"><h4 style="color:blue">Employee Book  Issue</h4></a></li>
	    	<li><a data-toggle="tab" href="#teacherBookReturn"><h4 style="color:blue">Employee Book Return</h4></a></li>
	    	
		</ul>
		

		
<div class="tab-content" style="float: left">

<!-- 	Book issue -->
	<div id="home" class="tab-pane">
		<form class="form-horizontal" name="formForBookIssueLib">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainClass();
							%>

							<input list="classes" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassName()">
							<datalist id="classes">
							 <%
 	                            for (int i = 0; i < sList.size(); i++) {
 		                        ClassInfoHibernate sup = (ClassInfoHibernate) sList.get(i);
                             %>

							<option data-value="<%=sup.getPkClassId()%>"
								value="<%=sup.getClas()%>">
								<%
									}
								%>
							</datalist>
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							<%-- <%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision();
							     %>

							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivisionForBookIssue()">
							<datalist id="division"> <%
									for (int i = 0; i < sList2.size(); i++) {
										DivisionInfoHibernate sup = (DivisionInfoHibernate) sList2.get(i);
								%>
							<option data-value="<%=sup.getPkDivisionId()%>"
								value="<%=sup.getDivision() %>">
								<%
										}
								%>
							</datalist> --%>
							
							
							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivisionForBookIssue()">
							<datalist id="division"></datalist>
							
						</div>
					</div>
					
					
				</div>
			</div>
			<div class="row">
 			<div class="form-group">
 						<div class="col-sm-2 col-sm-offset-1" align="right">
 				<label class="control-label">Student Name:</label>  
 				</div>
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<select id="studentName" class="form-control">
											</select>
           							 </div>
								</div>
				</div>
			</div>
						<div class="row">
				<div class="form-group">
					
			<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Book Issue Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='BookissueDate' name="dob" class="form-control"  placeholder="Enter Book Issue Date">
						</div>
					</div>
					<div class="col-sm-2 " align="right">
					<label class="control-label">Expected Book Return Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='BookReturneDate' name="dob" class="form-control" onchange="getDateForBookWIse1()" placeholder="Enter Book Return Date">
						</div>
					</div>
				</div>
			</div>
			
			
		
			<div class="row">
 			<div class="form-group">
 				<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Book Name:</label>  
        				<div class="col-md-6">
						 <div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-pencil"></i>
								</span>
								<select id="bookNameForIssue" class="form-control" onchange="getBookDetailForIssueGrid()">
								</select>
         				   </div> 
				    
				       <!-- <div class="col-md-3"> -->
						<%-- <div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
						<%
						LibraryManagementDao sdd89 = new LibraryManagementDao();
							List sList44 = sdd89.getAllMainTeacher();
							 %>
							 <input list="teacherNameList" id="bookNameForIssue" class="form-control" onchange="getBookDetailForIssueGrid()">
								<datalist id="teacherNameList">
								 <%
									for (int i = 0; i < sList44.size(); i++) {
										BookStockHibernate sup = (BookStockHibernate) sList44.get(i);
								 %>

								<option data-value="<%=sup.getPkBookStockId()%>"
									value="<%=sup.getBookName()%>  <%=sup.getAuthorName()%> <%=sup.getPublisherName()%> <%=sup.getSupplierName()%> <%=sup.getQuantity()%>">
									<%
										}
									%>
								</datalist>
							</div> --%>
						<!-- </div> -->
				          </div>
				       
				</div>
			</div>
			<div class="table-responsive row col-md-offset-1">
				<table id="gridForBookIssue" ></table>
				<div id="jqGridPagerForBookIssue"></div>
		  </div>
		
			
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center" style="padding-top: 18px;">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" id="btn" onclick="addingBookIssue()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" onclick="location.reload()" class="ui button">Reset</button>
                                        <div class="or"></div>
                                          <input type="button" class="ui positive button" name="btn" value="List" id="btn" onclick="BookissueList()">Save</button>
                                        </div>
                                </div>
                            </div>
		</form>
	</div>

<!-- ---	Book Return	---- -->
 		<div id="bookReturn" class="tab-pane">
					<form class="form-horizontal" name="formForBookIssueReturn">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
								ClassInfoDao returnDao = new ClassInfoDao();
								List returnList = returnDao.getAllMainClass();
							%>

							<input list="classes_return" id="fk_class_id_return" class="form-control" onchange="getDivisionNameByClassNameReturn()">
							<datalist id="classes_return">
							 <%
 	                            for (int i = 0; i < returnList.size(); i++) {
 		                        ClassInfoHibernate returnBean = (ClassInfoHibernate) returnList.get(i);
                             %>
							<option data-value="<%=returnBean.getPkClassId()%>"
								value="<%=returnBean.getClas()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
<%-- 
							<%
								DivisionInfoDao returnDivDao = new DivisionInfoDao();
								List returnDivList = returnDivDao.getAllMainDivision();
							     %>

							<input list="division_return" id="fk_division_id_return" class="form-control" onchange="getStudentDetailsAsPerClassAdDivisionForBookReturn()">
							<datalist id="division_return"> <%
									for (int i = 0; i < returnDivList.size(); i++) {
										DivisionInfoHibernate returnDivBean = (DivisionInfoHibernate) returnDivList.get(i);
								%>

							<option data-value="<%=returnDivBean.getPkDivisionId()%>"
								value="<%=returnDivBean.getDivision() %>">
								<%
										}
									%>
							</datalist> --%>
							
							<input list="division_return" id="fk_division_id_return" class="form-control" onchange="getStudentDetailsAsPerClassAdDivisionForBookReturn()">
							<datalist id="division_return"></datalist>
							
							
						</div>
					</div>
				</div>
			</div>
				<div class="row">
 			<div class="form-group">
 				<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Student Name:</label>  
           							 <div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
											<select id="studName_return" class="form-control" onchange="getBookDetailGridForBookReturn();getDateForBookWIse1();return false;">
											</select>
											<!-- <select id="studName_return" class="form-control" >
											</select> -->
           							 </div>
								</div>
				</div>
			</div>
	
			
				
				<!-- 	<div class="row">
				<div class="form-group">
					
			<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Book Issue Date:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text"  id='BookissueDateReturn' name="dob" class="form-control" readonly="readonly"   placeholder=" Book Issue Date">
						</div>
					</div>
					<div class="col-sm-2 " align="right">
					<label class="control-label">Expected Book Return Date:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='BookReturneDate' name="dob" class="form-control"  placeholder="Enter Book Return Date">
							  <input type="text"  id='BookReturneDateReturn' name="dob" class="form-control" readonly="readonly"  placeholder="Book Return Date">
							 
						</div>
					</div>
				</div>
			</div> -->
			<div class="row">
				<div class="form-group">
				
				<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Actual Date:<sup>*</sup></label>
					<%
					  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					  			String todayDate = simpleDateFormat.format(new Date());
					  		%>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							  <input type="date" id='BookReturneDateNew' name="dob" value="<%= todayDate%>"  class="form-control"  placeholder="Enter Book Return Date"> <!-- onchange="getBookDetailGridForBookReturn();getDateForBookWIse1();" --> 
							  <!-- <input readonly="readonly" id='BookReturneDate' name="dob" class="form-control"  placeholder="Book Return Date"> -->
						</div>
					</div>
					
			<!-- <div class="col-sm-2 " align="right">
					<label class="control-label">late Charges:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text" id='LateCharges' name="dob" class="form-control" readonly="readonly" placeholder=" Late Charges" onchange="getDateForBookWIse1()"()>
						</div>
					</div> -->
					
					
					
				</div>
			</div>
		
		
		<!-- 	<div class="row">
 			<div class="form-group">
 				<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Book Name:</label>  
           							 <div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-pencil"></i>
											</span>
											<select id="bookNameForReturn" class="form-control" onchange="getBookDetailGridForBookReturn();getDateForBookWIse();">
											</select>
											<select id="bookNameForReturn" class="form-control" >
											</select>
           							 </div>
								</div>
				</div>
			</div> -->
			
			<div class="table-responsive row col-md-offset-1" style="margin-left: 80px;margin-top: 20px;margin-bottom: 20px;">
				<table id="gridForBookReturn" ></table>
				<div id="jqGridPagerForBookReturn"></div>
		  </div>
		  
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" id="btn1" onclick="addBookReturn()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" onclick="location.reload()" class="ui button">Reset</button>
                                         <div class="or"></div>
                                         <input type="button" class="ui positive button" name="btn" value="List" id="btn1" onclick="StudentBookReturnList()">Save</button>
                                        </div>
                                </div>
                            </div>
		</form>
		</div>

<!-- 		BOOK ENTRY -->
	
		<div id="bookEntry" class="tab-pane  in active">
		<div class="row">
		<form class="form-horizontal" name="bookEntryForm">
			<div class="row">
				<div class="form-group">

					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Bill No<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span> 
							<input type="text" id='billNo' name="billNo" class="form-control" placeholder="Enter Bill No" onchange="checkForDuplicateBillEntry()" onkeypress="return isNumber(event)"/>
						</div>
					</div>
					
					
				<div class="col-sm-2" align="right">
						<label class="control-label">Supplier Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span> 
							<!-- <input type="text" id='bookName' name="bookName" class="form-control" placeholder="Enter Book name" onchange="getBookDetailIntoGrid();clearFiled()"/> -->
							
							<%
							SupplierDetailsDao productdao1 = new SupplierDetailsDao();
           						List productList1 =productdao1.getAllSupplier();
							
							%>
							<input list="dealerName_drop" id="supplierName"  class="form-control" " >
							<datalist id="dealerName_drop">
							<%
					           for(int i=0;i<productList1.size();i++){
					        	   SupplierDetailsBean productbean1 =(SupplierDetailsBean)productList1.get(i);
							%>
		
							<option data-value="<%=productbean1.getSupId()%>" value="<%=productbean1.getDealerName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
							
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">

				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Book Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span> 
							<!-- <input type="text" id='bookName' name="bookName" autofocus="autofocus"; class="form-control" placeholder="Enter Book name" onchange="getBookDetailIntoGrid();clearFiled()"/> -->
							<input type="text" id='bookName' name="bookName"  class="form-control" placeholder="Select Book name" onchange="getBookDetailIntoGrid()"/>
						</div>
					</div>

				</div>
			</div>
			
			
		  
		  <div class="table-responsive	row col-md-offset-1">
				<table id="list44" ></table>
				<div id="jqGridPager"></div>
		  </div>
		  
		  <div class="row form-group"> </div>
		            		<div class="row">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal" name="grossTotal"  class="form-control input-md" type="text" style="font-size: 20px; width: 140px;  height: 40px;">
	            			</div>
	            		</div>
            	</div>
 
				
				 <div class="form-group row">
                       <div class="col-md-offset-4 col-md-4 btn-center">
                           <div class="ui buttons">
                           <input type="button" class="ui positive button" name="btn" value="Save" id="btn2" onclick="addBookDetail()">Save</button>
                              
                               <div class="or"></div>
                                <button type="reset" onclick="location.reload()" class="ui button">Reset</button>
                               </div>
                       </div>
                   </div>
			 </form>
			</div>
		</div>
		
		
		<!-- -----------Teacher Book Issue -->
		
			<div id="teacherBookissue" class="tab-pane">
					<form class="form-horizontal" name="TeacherformForBookIssue">


			<div class="row">
				<div class="form-group">
				<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Employee name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							<!-- <select class="form-control input-md" id="fk_teacher_id"  name="TeacherName" class="form-control" onchange="getTeacherDetails()"  placeholder="Teacher Name">
									</select> -->
								
						 <%
							TeacherInfoDao sdd3 = new TeacherInfoDao();
							List sList4 = sdd3.getAllMainTeacher();
							 %>
							 <input list="teacherNameList" id="fk_teacher_id" class="form-control" onchange="getBookNameForReturnTeacher()">
								<datalist id="teacherNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
									TeacherInfoHibernate sup = (TeacherInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherId()%>"
									value="<%=sup.getFirstName()%> <%=sup.getMiddleName()%> <%=sup.getLastName()%>">
									<%
										}
									%>
								</datalist> 
							</div>
						</div>
						<div class="col-sm-2 " align="right">
					<label class="control-label">Book Issue Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							  <input type="date" id='TeacherBookIssueDateNew' name="dob" class="form-control"  placeholder="Enter Book Return Date"> 
							  <!-- <input readonly="readonly" id='BookReturneDate' name="dob" class="form-control"  placeholder="Book Return Date"> -->
						</div>
					</div>
					
				
				</div>
			</div>
				<div class="row">
 			<div class="form-group">
			<div class="col-sm-2 col-md-offset-1" align="right">
					<label class="control-label">Expected Book Return Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							  <input type="date" id='TeacherBookReturneDateNew' name="dob" class="form-control"  placeholder="Enter Book Return Date"> 
							  <!-- <input readonly="readonly" id='BookReturneDate' name="dob" class="form-control"  placeholder="Book Return Date"> -->
						</div>
					</div>	
					</div>
			</div>		
			
			<div class="row">
 			<div class="form-group">
 				<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Book Name:</label>  
           							 <div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-pencil"></i>
											</span>
											<select id="TeacherbookNameForReturnEmployeeNew" class="form-control" onchange="getBookDetailGridForBookReturnTeacher()">
											</select>
           							 </div>
								</div>
				</div>
			</div>
			
			<div class="table-responsive row col-md-offset-1">
				<table id="TeachergridForBookReturn" ></table>
				<div id="TeacherjqGridPagerForBookReturn"></div>
		  </div>
		  
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" id="btn3" onclick="addBookReturnTeacherIssue()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" onclick="location.reload()" class="ui button">Reset</button>
                                         <div class="or"></div>
                                         <input type="button" class="ui positive button" name="btn" value="List" id="btn3" onclick="employeebookisue()">List</button>
                                         
                                        </div>
                                </div>
                            </div>
		</form>
		</div>
		
		
		<!-- -----Teacher Book Return  -->
		
		<div id="teacherBookReturn" class="tab-pane">
					<form class="form-horizontal" name="TeacherformForBookIssueReturn">


			<div class="row">
				<div class="form-group">
				<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Employee name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>
							<!-- <select class="form-control input-md" id="fk_teacher_id"  name="TeacherName" class="form-control" onchange="getTeacherDetails()"  placeholder="Teacher Name">
									</select> -->
								
						 <%
							TeacherInfoDao sdd4 = new TeacherInfoDao();
							List sList5 = sdd4.getAllMainTeacher();
							 %>
							 <input list="teacherNameList" id="fk_teacher_idReturn" class="form-control" onchange="getBookNameForReturnTeacherBook();getDateForBookWIseForTeacher();">
								<datalist id="teacherNameList">
								 <%
									for (int i = 0; i < sList5.size(); i++) {
									TeacherInfoHibernate sup = (TeacherInfoHibernate) sList5.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherId()%>"
									value="<%=sup.getFirstName()%> <%=sup.getMiddleName()%> <%=sup.getLastName()%>">
									<%
										}
									%>
								</datalist> 
							</div>
						</div>
						<div class="col-sm-2 " align="right">
					<label class="control-label">Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							  <input type="date" id='employeebookNameForReturnEMployee' name="dob" class="form-control" onchange="getBookDetailGridForBookReturnemployeeReturn();getDateForBookWIse1()" placeholder="Enter Book Return Date"> 
							  <!-- <input readonly="readonly" id='BookReturneDate' name="dob" class="form-control"  placeholder="Book Return Date"> -->
						</div>
					</div>
					
				
				</div>
			</div>	
			
			<!-- 	<div class="row">
				<div class="form-group">
					
			<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Book Issue Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text" id='TeacherBookissueDatereturn' name="dob" class="form-control" readonly="readonly" placeholder="Enter Book Issue Date">
						</div>
					</div>
					<div class="col-sm-2 " align="right">
					<label class="control-label">Expected Book Return Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text" id='TeacherBookReturneDatereturnExp' name="dob" class="form-control" readonly="readonly" onchange="getDateForBookWIse1()" placeholder="Enter Book Return Date">
						</div>
					</div>
				</div>
			</div> -->		
			
			<!-- <div class="row">
 			<div class="form-group">
 				<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Book Name:</label>  
           							 <div class="col-md-6">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-pencil"></i>
											</span>
											<select id="employeebookNameForReturnEMployee" class="form-control" onchange="getBookDetailGridForBookReturnemployeeReturn()">
											</select>
           							 </div>
								</div>
				</div>
			</div> -->
			
			<div class="table-responsive row col-md-offset-1" style="margin-left: 80px;margin-top: 20px;margin-bottom: 20px;">
				<table id="employeegridForBookReturn" ></table>
				<div id="employeejqGridPagerForBookReturn"></div>
		  </div>
		  
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" id="btn4" onclick="addTeacherIssueBookReturn()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" onclick="location.reload()" class="ui button">Reset</button>
                                         <div class="or"></div>
                                         <input type="button" class="ui positive button" name="btn" value="List" id="btn3" onclick="employeebooReturn()">List</button>
                                        </div>
                                </div>
                            </div>
		</form>
		</div>
		
		
		
		
		
	</div>
	</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 