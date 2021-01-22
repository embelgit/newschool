
<%@page import="com.srb.hibernate.ExpenditureDetailsBean"%>
<%@page import="com.srb.dao.ExpenditureDetailsDao"%>

<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/bootstrap.min.css"> -->
<meta charset="utf-8">
<script type="text/javascript" src="/srb/staticContent/JS/expenditureDetails.js"></script>


 <script type="text/javascript">
  			function Back()
  			{
  				window.location = "expenditureDetails.jsp" ;
  			}
  			
  			function expenditutrList()
			{
				window.location="ExpenditureList.jsp";
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
                            <h1>Expenditure Delete</h1>
                            <small>Expenditure Delete</small> 
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
           						List cList =cdd.getAllExpenseNames1();
							%>
						<input list="cat_drop" id="expenseName" class="form-control">
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
                        <input type="button" class="ui positive button" name="btn" value="Delete" onclick="deleteExp()">Delete</button>
                           
                            <div class="or"></div>
                             <button type="reset" class="ui button">Reset</button>
                             </div>
                    </div>
   				</div>
		</fieldset>
	</form>
</div>

<%@include file="commons/newFooter.jsp" %> 
	