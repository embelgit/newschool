
<%@page import="com.srb.hibernate.ExpenditureDetailsBean"%>
<%@page import="com.srb.dao.ExpenditureDetailsDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/srb/staticContent/JS/expenditureDetails.js"></script>
<script src="/srb/staticContent/JS/Division.js"></script>
<script type="text/javascript">
function Back()
{
	window.location="expenditureDetails.jsp";
}
</script>

       <script type="text/javascript">	
		function cheakForExpenditure(){
			<%
			ExpenditureDetailsDao exp = new ExpenditureDetailsDao();
				List cList1 =exp.getAllExpenseNames();
			%>
			var expenditureName = $('#exp').val();
    		var upExpenditureName = expenditureName.toUpperCase();
    		var duplicate;
			<%
			for(int i=0;i< cList1.size();i++){
				ExpenditureDetailsBean cat=(ExpenditureDetailsBean)cList1.get(i);
			%>
			var subCat = "<%=cat.getExpenseName()%>";
			var subcatName=document.getElementById("exp").value;
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
	     
</head>
<body>

	<div class="content-wrapper" style="min-height: 1134px;">
	<section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><i class="pe-7s-world"></i></div>
                        <div class="header-title">
                            <h1>Edit Expenditure Details</h1>
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
                    <a class="btn btn-primary" onclick="Back()"  accesskey="t""> <i class="fa fa-list"></i>Add Expenditure</a>  
                </div>
   </div>
    
		<form class="form-horizontal">
			<div class="row form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Select Expenditure Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

							<%
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainexp();
							%>

							<input list="classId" id="fk_class_id" class="form-control" placeholder="Select  class Name" >
							<datalist id="classId">
							 <%
 	                            for (int i = 0; i < sList.size(); i++) {
 	                            	ExpenditureDetailsBean sup = (ExpenditureDetailsBean) sList.get(i);
                             %>

							<option data-value="<%=sup.getPkExpenseDetailsId()%>"
								value="<%=sup.getExpenseName()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>
			
				
					<div class="col-md-2" align="right">
						<label class="control-label">Enter New Expenditure:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

				 			 <input type="text" id='exp' name="exp" class="form-control"  placeholder="Enter New Expenditure" onchange="cheakForExpenditure()">
						
						
						
						</div>
					</div>
					</div>
			
<br>
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Update" onclick="updateexp()">Update</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Back" id="listBtn"  onclick="Back()">Back</button>
                                    </div>
                                </div>
                            </div>
			
		</form>
		</div>
		
		
	</div>
	</div>
	</div>
</body>
<%@include file="commons/newFooter.jsp" %>