<%@page import="java.util.List"%>
<%@page import="com.srb.hibernate.ExpenditureDetailsBean"%>
<%@page import="com.srb.dao.ExpenditureDetailsDao"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- <script type="text/javascript" src="/srb/staticContent/JS/jquery-1.12.3.min.js"></script> -->
     <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
     <!-- <link rel="stylesheet" href="/AgriSoft/staticContent/css/ui.jqgrid.css"> -->
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
     <!-- <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script> -->
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
	<script type="text/javascript"src="/srb/staticContent/JS/expenditureDetails.js"></script>


        <script type="text/javascript">	
		function cheakForExpenditure(){
			<%
			ExpenditureDetailsDao exp = new ExpenditureDetailsDao();
				List cList1 =exp.getAllExpenseNames();
			%>
			var expenditureName = $('#expenseName').val();
    		var upExpenditureName = expenditureName.toUpperCase();
    		var duplicate;
			<%
			for(int i=0;i< cList1.size();i++){
				ExpenditureDetailsBean cat=(ExpenditureDetailsBean)cList1.get(i);
			%>
			var subCat = "<%=cat.getExpenseName()%>";
			var subcatName=document.getElementById("expenseName").value;
			var UpValue = subCat.toUpperCase();
			if(upExpenditureName == UpValue)
			{
					duplicate = "found";
			}
			if(subcatName == subCat){
				alert("Expenditure already exist...Duplicate Not allowed");
				location.reload();
				return false;
			}
			<%
			}
			%>
			if(duplicate == "found"){
    			document.expenseDetails.btn.disabled = true;	
				alert("Expenditure Name Already Exist..!!!");
				location.reload();
				document.expenseDetails.btn.disabled = false;
    			return false;
    		}
		}
	     </script>
	     
	     <script type="text/javascript">

					function expenditutrList()
					{
						window.location="ExpenditureList.jsp";
					}
					function editt()
					{
						window.location="editexpenditure.jsp";
					}

	     </script>
	     
	     
		</head>
		<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Expenditure Details</h1>
                            <small>Expenditure Details</small> 
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
                    <a class="btn btn-primary"  onclick="expenditutrList()" accesskey="t""> <i class="fa fa-list"></i>Expenditure List</a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		
	<form class="form-horizontal" method="post" action=""
		name="expenseDetails">
		<!-- Value of 'name' attribute is used in customerDetails.js  -->
		<fieldset>
			<div class="row form-group">
				<label class="col-md-3 col-md-offset-2 control-label" for="expenseName">Expenditure Name:<sup>*</sup>
				</label>
				<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon"> <i
							class="	glyphicon glyphicon-pencil"></i>
						</span>
						<%
							ExpenditureDetailsDao cdd = new ExpenditureDetailsDao();
           						List cList =cdd.getAllExpenseNames();
							%>
						<input list="cat_drop" id="expenseName" class="form-control" onchange="cheakForExpenditure()">
						<datalist id="cat_drop">
							<%
					           for(int i=0;i<cList.size();i++){
					        	   ExpenditureDetailsBean cat=(ExpenditureDetailsBean)cList.get(i);
							%>
							<option data-value="<%=cat.getPkExpenseDetailsId()%>"
								value="<%=cat.getExpenseName()%>">
								<%
				      			}
				    		%>
							
						</datalist>
					</div>
				</div>
			</div>

			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button"  class="ui positive button" name="btn" value="Save"  onclick="addExpenseDetails()" style=" width: 75px;">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                        <div class="or"></div>
                                    <input type="button"  class="ui positive button" name="btn" value="Edit"  onclick="editt()" style=" width: 75px;">Edit</button>
                              
                                       </div>
                                </div>
                            </div>
		</fieldset>
	</form>
</div>

<%@include file="commons/newFooter.jsp" %> 
