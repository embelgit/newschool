<%@page import="com.srb.hibernate.LibraryPaymentBean"%>
<%@page import="com.srb.dao.LibraryPaymentDao"%>
<%@page import="com.srb.hibernate.TrasnportDetailsHibernate"%>
<%@page import="com.srb.dao.StudentTransportationDao"%>
<%@page import="com.srb.hibernate.ExpenditurePaymentBean"%>
<%@page import="com.srb.dao.ExpenditurePaymentDao"%>
<%@page import="com.srb.hibernate.TeacherPaymentBeanHibernate"%>
<%@page import="com.srb.dao.TeacherPaymentDao"%>
<%@page import="com.srb.hibernate.SupplierPaymentBean"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.SupplierDetailsBean"%>
<%@page import="com.srb.dao.SupplierDetailsDao"%>
<%@page import="com.srb.dao.SupplierPaymentDao"%>
<%@page import="com.srb.hibernate.StoreManagementHibernate"%>
<%@page import="com.srb.dao.StoreManagementDAO"%>
<%@page import="com.srb.hibernate.ExpenditureDetailsBean"%>
<%@page import="com.srb.dao.ExpenditureDetailsDao"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="java.util.List"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script type="text/javascript" src="/srb/staticContent/JS/cashbankbook.js"></script>
	<script type="text/javascript" src="/srb/staticContent/JS/libraryManagement.js"></script>
	<!--  <script type="text/javascript" src="/srb/staticContent/JS/cashbook.js"></script> -->
	
	<script type="text/javascript">
			function supplierPaymentList()
			{
				window.location = "supplierPaymentList_new.jsp";
			}
			function libraryPaymentList(){
				window.location = "librarypaylist.jsp";
			}
	</script>
	<script type="text/javascript">
			function isAlphabets(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))) {
		        return false;
		    }
		    return true;
			}


		</script>
		
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
			function isAlphabetsWithSpace(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
		        return false;
		    }
		    return true;
			}


		</script>


</head>
	
<%-- 	
 <!-- LABLE STYLE END -->
 <%
        Long BillNo = 1l;
	 %>
<%
SupplierPaymentDao data = new SupplierPaymentDao();
		List stkList  = data.getLastBillNo();
		
		for(int i=0;i<stkList.size();i++){
			
			StoreManagementHibernate st = (StoreManagementHibernate)stkList.get(i);
			BillNo = st.getBillNo();
			System.out.println("hi this is Kishor  billno is ++++++"+BillNo);
			
			BillNo++;
			System.out.println( BillNo);
			
		}      
	        
         %> 	 --%>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Cashbook</h1>
                            <small>Cashbook</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 <ul class="nav nav-tabs">
	    	<li class="active"><a data-toggle="tab" href="#sup"><h4 style="color:blue">Supplier Payment</h4></a></li>
	    	<li><a data-toggle="tab" href="#messages"><h4 style="color:blue">Employee Payment</h4></a></li>
	    	<li><a data-toggle="tab" href="#settings"><h4 style="color:blue">Expenditure Payment</h4></a></li>
	    	<li><a data-toggle="tab" href="#transportation"><h4 style="color:blue">Transportation Payment</h4></a></li>
	    	<li><a data-toggle="tab" href="#lib"><h4 style="color:blue">Library Payment</h4></a></li>
		</ul>
     

           <div class="panel-body panel-form">
                <div class="row">

    <div  class="col-md-12">
       
    <div class="tab-content">
    	
    	     <div class="tab-pane " id="messages">
   
           		<form class="form-horizontal" method="post" action="" name="emp">
   	    		<%
								Long Txid3 = 1l;
						%>
						<%
								TeacherPaymentDao dao3=new TeacherPaymentDao();
								List listtxid3=dao3.getTeacherPaymentTxid();
								

								for (int i = 0; i < listtxid3.size(); i++) {
									
									TeacherPaymentBeanHibernate bean=(TeacherPaymentBeanHibernate) listtxid3.get(i);
								Txid3=bean.getTxid();
								Txid3++;
							
							}
						%>
						
					<div>
						
						<div align="right">
								<h3 style="color: black; padding-right: 100px;">
								Transaction ID ::
								<%
									out.println(Txid3);
								%>
								</h3>
						</div><br>
				
					</div>
		    
    	     	 <div class="row form-group">
           				 <label class="col-md-3 control-label" for="employeename">Employee Name<sup>*</sup></label>  
          				<div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
									</span>
						    <%
							TeacherInfoDao sdd3 = new TeacherInfoDao();
							List sList4 = sdd3.getAllMainTeacher();
							 %>
							 <input list="teacherNameList" id="fk_teacher_id" class="form-control" onchange="bill.getAllBillsforemployee()">
								<datalist id="teacherNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
									TeacherInfoHibernate sup = (TeacherInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkTeacherId()%>"
									value="<%=sup.getFirstName()%>  <%=sup.getLastName()%>">
									<%
										}
									%>
								</datalist>
							</div>
						</div>
						
							<div class="row form-group">
           				<label class="col-md-2  name" for="totalAmt"> Total Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="totalAmounte" name="totalAmount" class="form-control" placeholder="Total Amount">
           							 </div>
								</div>
            	
            		  </div>
            		   <label class="col-md-2  col-md-offset-6 name" for="balanceAmt"> Balance Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="balanceAmounte" name="balanceAmount" class="form-control" placeholder="Balance Amount">
           							 </div>
								</div>
            
           		 <label class="col-md-2 col-md-offset-1 control-label" for="personName">Accountant Name<sup>*</sup> </label>  
	          			<div class="col-md-3">
						 <div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
	           		 	 <input id="personName2" name="personName" placeholder="Accountant Name" class="form-control input-md" type="text">
	           		 </div>
				</div>
			</div>
			
         	  	<div class="row form-group">
					<label class="col-md-3 control-label" for="reason2">Reason<sup>*</sup></label>  
	          			<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
								 <i class="glyphicon glyphicon-user"></i>
								</span>
	           		 	 <input id="reason2" name="reason2" placeholder="Reason" class="form-control input-md" type="text">
	           		       </div>
				      </div>
								
					<label class="col-md-2 control-label" for="paymentMode"> Payment Mode<sup>*</sup></label>  
	           		       <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentMode2">
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										<option value="card">Card</option>
										<option value="neft">NEFT</option>
								</select>	
	           				</div>
						</div>
			 	</div>
	 <script>
		$(document).ready(function(){
	  		 $("#paymentMode2").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="cheque"){
	           	$("#cheque_no2").show(); 
	           	$("#neft_acc_no2").hide(); 
	           	$("#card_no2").hide();
	           	}
	          	 else if($(this).attr("value")=="card"){
	          		$("#card_no2").show(); 	
	          		$("#neft_acc_no2").hide(); 
	        		$("#cheque_no2").hide();
	           }
	          	 else if($(this).attr("value")=="neft"){
	           		$("#neft_acc_no2").show(); 	
	           		$("#card_no2").hide(); 
	        		$("#cheque_no2").hide();
	            }
	          	 else if($(this).attr("value")=="cash"){
	            		$("#neft_acc_no2").hide(); 
	            		$("#cheque_no2").hide();
	            		$("#card_no2").hide(); 
	             }
	       });
	   }).change();
		});	
		</script>
		<div class="row form-group">
				  <label class="col-md-3 control-label" for="paymentMode">Payment Type:<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentType2">
									
										<option value="credit">Credit</option>
										<option value="debit">Debit</option>
										
								</select>	
	           				</div>
						</div>
						
				  <div class="col-sm-2" align="right">
						<label class="control-label">Amount </label>
						</div>
						   <div class="col-sm-3">
						   <div class="input-group">
							 <span class="input-group-addon">
									Rs
								</span>
           					 <input  id="empPay" name="empPay" class="form-control" placeholder="Enter Amount">
           				  </div>
						</div>
			     </div>
			      				  
          	<div class="row form-group" >
            	<div id="cheque_no2" >
					<div class="col-md-3 col-md-offset-3 first">	
						<input class="form-control" type="text" name="chequeNum" id="chequeNum2" placeholder="Cheque No." />  
					</div>
					<div class="col-md-3 col-md-offset-2 first">	
					 <input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck2" placeholder="Name On Cheque" />  
						</div>
				</div>
									<div id="card_no2" class="form-group">
										<div class="col-md-3 col-md-offset-3 first">	
											<input class="form-control" type="text" name="cardNum" id="cardNum2" placeholder="Card No." onkeypress="return isNumber(event)"/>  
										</div>
									</div>
									<div id="neft_acc_no2" class="form-group">
										<div class="col-md-3 col-md-offset-3 first">	
											<input class="form-control" type="text" name="accNum" id="accNum2" placeholder="Account No." />  
										</div>
										<div class="col-md-3 col-md-offset-2 first">	
											<input class="form-control" type="text" name="bankName" id="bankName2" placeholder="Name Of Bank" />  
										</div>
									</div>
								</div>
	
        
        	 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" id="btn3" class="ui positive button" name="btn"   onclick="TeacherValidation(); return false;" value="Save"></button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         </div>
                                </div>
                            </div>   
         </form>    	    
 </div>
 
         
	<!------------ Employee Payment end ---------->
       
       <!------------------   Expenditure Payment ------------>
       <div class="tab-pane" id="settings">
		<form method="post" class="form-horizontal" action="" name="exp">
		
		<%
								Long Txid4 = 1l;
						%>
						<%
						
						
								ExpenditurePaymentDao dao4=new ExpenditurePaymentDao();
								List listtxid4=dao4.getExpenditurePaymentTxid();
								

								for (int i = 0; i < listtxid4.size(); i++) {
									
									ExpenditurePaymentBean bean=(ExpenditurePaymentBean) listtxid4.get(i);
									Txid4=bean.getTxId();
									Txid4++;
							
							}
						%>
						
					<div>
						
						<div align="right">
								<h3 style="color: black; padding-right: 100px;">
								Transaction ID ::
								<%
									out.println(Txid4);
								%>
								</h3>
						</div>
				
					</div><br>
			
		<div class="row form-group">
           	<label class="col-md-2 col-sm-offset-1 control-label" for="expenditureName">Expenditure Name<sup>*</sup></label>  
           	 	      		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
							<%
							ExpenditureDetailsDao exdd = new ExpenditureDetailsDao();
           						List exList =exdd.getAllExpenseName();
							%>
							<input list="exp_drop" id="expenseName" class="form-control" onkeypress="return isAlphabetsWithSpace(event)">
				<datalist id="exp_drop">
							<%
					           for(int i=0;i<exList.size();i++){
					        	   ExpenditureDetailsBean expbean =(ExpenditureDetailsBean)exList.get(i);
							%>
							<option data-value="<%=expbean.getPkExpenseDetailsId()%>" value="<%=expbean.getExpenseName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
           	 	<label class="col-md-2 control-label" for="serviceProvider">Service Provider<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
             				<input id="serviceProvider" name="serviceProvider" placeholder="Service Provider" class="form-control input-md" type="text" onkeypress="return isAlphabetsWithSpace(event)">	
           				 </div>
					</div>
			</div>
			<div class="row form-group">
					<label class="col-md-2 col-sm-offset-1 control-label" for="contactNumber">Contact Number<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
             					 <input id="contactNumber" maxlength="10" name="contactNumber" placeholder="Contact Number" class="form-control input-md" type="text" >
           				 </div>
					</div>
				<label class="col-md-2 control-label" for="expCredit">Credit Amount </label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								Rs
							</span>
             					 <input id="expCredit" name="expCredit" placeholder="Credit Amount" class="form-control input-md" type="text" value="0" onkeypress="return isNumber(event)">
           				 </div>
					</div>
			</div>
				
			<div class="row form-group">
				 <label class="col-md-2 col-sm-offset-1 control-label" for="personName">Accountant Name </label>  
	          		 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
	           		 			<input type="text" id="accountantName" name="personName" class="form-control"  placeholder="Accountant Name"  onkeypress="return isAlphabetsWithSpace(event)">
	           		 		
	           			</div>
					</div>
			
				<label class="col-md-2 control-label" for="expDebit">Debit Amount </label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								Rs
							</span>
             					 <input id="expDebit" name="expDebit" placeholder="Debit Amount" class="form-control input-md" type="text" value="0" onkeypress="return isNumber(event)">
           				 </div>
					</div>
			</div>	

	 		 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" id="btn4" class="ui positive button" name="btn"  onclick="expensePaymentValidation(); return false;" value="Save"></button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         </div>
                                </div>
                            </div>    	
     </form>
	</div>
	
	
               <!---------------------------- Transportation Form  ----------------------------------------------------->
 <div class="tab-pane" id="transportation">
		<form method="post" class="form-horizontal" action="" name="trns">
		<%
								Long Txid2 = 1l;
						%>
						<%
						
						
								StudentTransportationDao dao2=new StudentTransportationDao();
								List listtxid2=dao2.getTransactionPaymentTxid();
								

								for (int i = 0; i < listtxid2.size(); i++) {
									
									TrasnportDetailsHibernate bean=(TrasnportDetailsHibernate) listtxid2.get(i);
									Txid2=bean.getTxid();
									Txid2++;
							
							}
						%>
						
					<div>
						
						<div align="right">
								<h3 style="color: black; padding-right: 100px;">
								Transaction ID ::
								<%
									out.println(Txid2);
								%>
								</h3>
						</div>
				
					</div><br>	
		<%-- <div class="row form-group">
           	<label class="col-md-2 col-sm-offset-1 control-label" for="expenditureName">Expenditure Name<sup>*</sup></label>  
           	 	      		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
							<%
							ExpenditureDetailsDao exdd1 = new ExpenditureDetailsDao();
           						List exList1 =exdd1.getAllExpenseName();
							%>
							<input list="exp_drop" id="expenseName" class="form-control">
				<datalist id="exp_drop">
							<%
					           for(int i=0;i<exList.size();i++){
					        	   ExpenditureDetailsBean expbean =(ExpenditureDetailsBean)exList.get(i);
							%>
							<option data-value="<%=expbean.getPkExpenseDetailsId()%>" value="<%=expbean.getExpenseName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
           	 	<label class="col-md-2 control-label" for="serviceProvider">Service Provider<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
             				<input id="serviceProvider" name="serviceProvider" placeholder="Service Provider" class="form-control input-md" type="text" >	
           				 </div>
					</div>
			</div> --%>
			
			
			<div class="row">
				<div class="form-group">
					
					<label class="col-md-2 col-md-offset-1 name " for="class ">Class Name:<sup>*</sup></label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
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


					<label class="col-md-2  name" for="division">Division Name:<sup>*</sup></label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

						<%-- 	<%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision();
							     %>

							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivision()">
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
							
							<input list="division" id="fk_division_id" class="form-control" onchange="getStudentDetailsAsPerClassAdDivision()">
							<datalist id="division"></datalist>
							
							
						</div>
					</div>
				</div>
			</div>
			<div class="row">
 			<div class="form-group">
 				<label class="col-md-2 name col-md-offset-1" for="student name">Student Name:<sup>*</sup></label>  
           				 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
										</span>
							<input list="studentName" id="fk_studentName_id" class="form-control" onchange="bill.Trasnsportationfee()">
							<datalist id="studentName"></datalist>
		<!-- 								<select id="studentName" class="form-control" onchange="bill.Trasnsportationfee()"> 
										</select>-->
           							 </div>
								</div> 
						<%-- 		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						<%
						StudentInfoDao sdd3 = new StudentInfoDao();
							List sList4 = sdd3.getAllMainStudent();
							 %>
							 <input list="studentNameList" id="fk_Student_id" class="form-control" onchange="bill.getTotalAnnualFee()">
								<datalist id="studentNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
										StudentInfoHibernate sup = (StudentInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkStudentId()%>"
									value="<%=sup.getFirstName()%> <%=sup.getMiddleName()%> <%=sup.getLastName()%>">
									<%
										}
									%>
								</datalist>
							</div>
						</div> --%>
 				
 									<label class="col-md-2  name" for="total">Total Fee</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="totalAnnualFee" name="totalAnnualFee" class="form-control" placeholder="Total fee">
           							 </div>
								</div>
				</div>
			</div>
			<div class="row">
				<div class=" form-group">
						 <label class="col-md-2 name col-md-offset-1" for="personname">Accountant Name<sup>*</sup> </label>  
			           		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
			           		   <input id="personnameT" name="personname" placeholder="Accountant Name" class="form-control input-md" type="text" onkeypress="return isAlphabetsWithSpace(event)">
			           		 </div>
						</div>
				
			
          					 <label class="col-md-2 name" for="balanceAmt"> Balance Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="balanceAmountT" name="balanceAmount" class="form-control" placeholder="Balance Amount">
           							 </div>
								</div>
									  						
					</div>
				</div>
				<div class = "row">
			<div class=" form-group">
				
				<label class="col-md-2 name col-md-offset-1" for="paymentMode"> Payment Mode<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentMode3">
										<option value="cash1">Cash</option>
										<option value="cheque1">Cheque</option>
										<option value="card1">Card</option>
										<option value="neft1">NEFT</option>
								</select>	
	           				</div>
						</div>
	
	<script>
		
		$(document).ready(function(){
	  		 $("#paymentMode3").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="cheque1"){
	           	
	           	$("#cheque_no1").show(); 
	           	
	           	$("#neft_acc_no1").hide(); 
	           	$("#card_no1").hide();
	           	}
	          	 else if($(this).attr("value")=="card1"){
	           	
	          		$("#card_no1").show(); 	
	          		
	          		$("#neft_acc_no1").hide(); 
	        		$("#cheque_no1").hide();
	           }
	          	 else if($(this).attr("value")=="neft1"){
	                	
	           		$("#neft_acc_no1").show(); 	
	           		
	           		$("#card_no1").hide(); 
	        		$("#cheque_no1").hide();
	            }
	          	 else if($(this).attr("value")=="cash1"){
	             	
	            		$("#neft_acc_no1").hide(); 
	            		$("#cheque_no1").hide();
	            		$("#card_no1").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="selected"){
	             	
	        		$("#neft_acc_no1").hide(); 
	        		$("#cheque_no1").hide();
	        		$("#card_no1").hide(); 
	         }
	          
	       });
	   }).change();
		});	
		</script>
				
			          </div>
			          </div>
			          
			          <div class ="row">
			     <div class=" form-group">
				
				  <label class="col-md-2 name col-md-offset-1" for="paymentMode"> Payment Type<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentTypeT">
										<!-- <option value="selected">-Select Type--</option> -->
										<option value="credit">Credit</option>
										<option value="debit">Debit</option>
										
								</select>	
	           				</div>
						</div>
						
						<label class="col-md-2" for="paymentMode"> Paid Amount<sup>*</sup></label>
						<div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input  id="paidAmountT" name="paidAmount" class="form-control" placeholder="Enter Paid Amount">
           							 </div>
						</div>
		  						
			     
			     </div>
			      </div>
			     
			     
			        <!--   <div class ="row">
		    	<div class=" form-group" >

            					<div id="cheque_no" >
            						<div class="col-md-2">										
										<label class="name" style="align:">Cheque No.:</label>
									</div>
										
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNum1" placeholder="Cheque No." />  
									</div>
								
									<div class="col-md-1">
										<label class="name">Date:</label>
									</div>
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="cdate" id="chequedate" placeholder="yyyy-mm-dd" />  
									</div>
									<div class="col-md-2">
										<label class="name">Name:</label>
									</div>
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck1" placeholder="Name On Cheque" />  
									</div>
								</div>
											
											<div id="card_no" class="form-group">
												<div class="col-md-2 ">
													<label class="name">Card No:</label>
												</div>
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="cardNum" id="cardNum1" placeholder="Card No." />  
												</div>
												
											</div>
											
											<div id="neft_acc_no" class="form-group">
												<div class="col-md-2 ">
													<label class="name">Account No:</label>
												</div>
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="accNum" id="accNum1" placeholder="Account No." />  
												</div>
												<div class="col-md-2 ">
													<label class="name">Bank Name</label>
												</div>
												<div class="col-md-3 col-md-offset-2 first">	
													<input class="form-control" type="text" name="bankName" id="bankName1" placeholder="Name Of Bank" />  
												</div>
												</div>
								</div>
								</div> -->

	 		 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" id="btn4" class="ui positive button" name="btn"  onclick="TranportationValiadation(); return false;" value="Save"></button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                                         </div>
                                </div>
                            </div>    	
     </form>
	</div>
	
	
	<!------------------------------------------ Supplier Pyment  ----------------------------------------->
	
	    	<div class="tab-pane active " id="sup" >
  	<form  method="post" action="" name="spmt" class="form-horizontal">
  
						
				<%
								Long Txid = 1l;
						%>
						<%
								SupplierPaymentDao dao=new SupplierPaymentDao();
								List listtxid=dao.getSupplierPaymentTxid();
								

								for (int i = 0; i < listtxid.size(); i++) {
									
								SupplierPaymentBean bean=(SupplierPaymentBean) listtxid.get(i);
								Txid=bean.getTxId();
								Txid++;
							
							}
						%>
						
						<div>
						
						<div align="right">
								<h3 style="color: black; padding-right: 100px;">
								Transaction ID ::
								<%
									out.println(Txid);
								%>
								</h3>
						</div>
				
					</div><br>
								
  	<!--  <div class="row"> --> 
       	       <div class="row form-group">
           				 <label class="col-md-2 col-md-offset-1 name " for="supplier">Supplier Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							
										
							<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
								
								SupplierDetailsDao sdd1 = new SupplierDetailsDao();
           						List sList1 =sdd1.getAllSupplier();
							
							%>
							
							<input list="sup_drop" id="supplierId" onchange="bill.getTotalAmtByBills()" class="form-control">
							<datalist id="sup_drop">
							
							<%
					           for(int i=0;i<sList1.size();i++){
					        	   SupplierDetailsBean sup =(SupplierDetailsBean)sList1.get(i);
							%>
		
							<option data-value="<%=sup.getSupId()%>" value="<%=sup.getDealerName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
            
           			 	    <!-- <label class="col-md-2 name" for="bill_no"> Bill No<sup>*</sup> </label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										No
									</span>
           		 					
           		 					<select class="form-control input-md" id='billNo'  name="billNo" onchange="bill.getTotalAmtByBills()">
									</select>
													
								<select class="selectpicker" multiple>
								<option>Mustard</option>
							  <option>Ketchup</option>
							  <option>Relish</option>
								</select>
									
           						 </div>
							</div>  -->
							
							<label class="col-md-2  name" for="totalAmt"> Total Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="totalAmount" name="totalAmount" class="form-control" placeholder="Total Amount">
           							 </div>
								</div>
						  </div> 
					<!--  </div>  -->
					<div class="row form-group">
           				<!-- <label class="col-md-2 col-md-offset-6 name" for="totalAmt"> Total Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="totalAmount" name="totalAmount" class="form-control" placeholder="Total Amount">
           							 </div>
								</div> -->
            	
            		  </div>
						  
				<div class="row form-group">
						 <label class="col-md-2 name col-md-offset-1" for="personname">Accountant Name<sup>*</sup> </label>  
			           		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
			           		   <input id="personname" name="personname" placeholder="Accountant Name" class="form-control input-md" type="text" >
			           		 </div>
						</div>
				
			
          					 <label class="col-md-2 name" for="balanceAmt"> Balance Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="balanceAmount" name="balanceAmount" class="form-control" placeholder="Balance Amount">
           							 </div>
								</div>
									  						
					</div>
      	  
						  
	 <div class="row form-group">
				
				<label class="col-md-2 name col-md-offset-1" for="paymentMode"> Payment Mode<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentMode">
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										<option value="card">Card</option>
										<option value="neft">NEFT</option>
								</select>	
	           				</div>
						</div>
	
	<script>
		
		$(document).ready(function(){
	  		 $("#paymentMode").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="cheque"){
	           	
	           	$("#cheque_no").show(); 
	           	
	           	$("#neft_acc_no").hide(); 
	           	$("#card_no").hide();
	           	}
	          	 else if($(this).attr("value")=="card"){
	           	
	          		$("#card_no").show(); 	
	          		
	          		$("#neft_acc_no").hide(); 
	        		$("#cheque_no").hide();
	           }
	          	 else if($(this).attr("value")=="neft"){
	                	
	           		$("#neft_acc_no").show(); 	
	           		
	           		$("#card_no").hide(); 
	        		$("#cheque_no").hide();
	            }
	          	 else if($(this).attr("value")=="cash"){
	             	
	            		$("#neft_acc_no").hide(); 
	            		$("#cheque_no").hide();
	            		$("#card_no").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="selected"){
	             	
	        		$("#neft_acc_no").hide(); 
	        		$("#cheque_no").hide();
	        		$("#card_no").hide(); 
	         }
	          
	       });
	   }).change();
		});	
		</script>
				
			          </div>  
		
			     <div class="row form-group">
				
				  <label class="col-md-2 name col-md-offset-1" for="paymentMode"> Payment Type<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentType">
										<!-- <option value="selected">-Select Type--</option> -->
										<option value="credit">Credit</option>
										<option value="debit">Debit</option>
										
								</select>	
	           				</div>
						</div>
						
						<label class="col-md-2" for="paymentMode"> Paid Amount<sup>*</sup></label>
						<div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input  id="paidAmount" name="paidAmount" class="form-control" placeholder="Enter Paid Amount">
           							 </div>
						</div>
		  						
			     
			     </div>
			     
			     
			          
		    	<div class="row form-group" >

            					<div id="cheque_no" >
            						<!-- <div class="col-md-2">										
										<label class="name" style="align:">Cheque No.:</label>
									</div> -->
										
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNum" placeholder="Cheque No." />  
									</div>
								
									<!-- <div class="col-md-1">
										<label class="name">Date:</label>
									</div>
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="cdate" id="chequedate" placeholder="yyyy-mm-dd" />  
									</div> -->
									<!-- <div class="col-md-2">
										<label class="name">Name:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck" placeholder="Name On Cheque" />  
									</div>
								</div>
											
											<div id="card_no" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Card No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="cardNum" id="cardNum" placeholder="Card No.." onkeypress="return isNumber(event)"/>  
												</div>
												
											</div>
											
											<div id="neft_acc_no" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Account No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="accNum" id="accNum" placeholder="Account No." />  
												</div>
												<!-- <div class="col-md-2 ">
													<label class="name">Bank Name</label>
												</div> -->
												<div class="col-md-3 col-md-offset-2 first">	
													<input class="form-control" type="text" name="bankName" id="bankName" placeholder="Name Of Bank" />  
												</div>
												</div>
								</div>
			          
		

 			<div class="form-group row">
                      <div class="col-md-offset-4 col-md-4 btn-center">
                          <div class="ui buttons">
                         	 <input type="button" class="ui positive button" name="btn" onclick="validationSupplierPayment()" value="Save"/>
                             
                              <div class="or"></div>
                               	<button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                               		<div class="or"></div>
                               	<input type="button" class="ui positive button" onclick="supplierPaymentList()" value="List">
                               	
                              </div>
                              
                              
                      </div>
                     </div>    	    
	</form>
  </div>
  
  <!------------------------------------------ Library Payment  ----------------------------------------->
	
	    	<div class="tab-pane active1 " id="lib" >
  	<form class="form-horizontal" method="post" action="" name="lmpt">
  
						
				<%
								Long Txidl = 1l;
						%>
						<%
								LibraryPaymentDao daol=new LibraryPaymentDao();
								List listtxidl=daol.getlibraryPaymentTxid();
								

								for (int i = 0; i < listtxidl.size(); i++) {
									
								LibraryPaymentBean bean=(LibraryPaymentBean) listtxidl.get(i);
								Txidl=bean.getTxId();
								Txidl++;
							
							}
						%>
						
						<div>
						
						<div align="right">
								<h3 style="color: black; padding-right: 100px;">
								Transaction ID ::
								<%
									out.println(Txidl);
								%>
								</h3>
						</div>
				
					</div><br>
								
  	<!--  <div class="row"> --> 
       	       <div class="row form-group">
           				 <label class="col-md-2 col-md-offset-1 name " for="library">Supplier Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							
										
							<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
								
								SupplierDetailsDao sdd2 = new SupplierDetailsDao();
           						List sList2 =sdd2.getAllSupplier();
							
							%>
							
							<input list="sup_drop1" id="supplierId1" onchange="getLibTotalAmtByBills()" class="form-control">
							<datalist id="sup_drop1">
							
							<%
					           for(int i=0;i<sList2.size();i++){
					        	   SupplierDetailsBean sup =(SupplierDetailsBean)sList2.get(i);
							%>
		
							<option data-value="<%=sup.getSupId()%>" value="<%=sup.getDealerName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
            
           			 	   							
							<label class="col-md-2  name" for="totalAmtLib"> Total Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="totalAmountl" name="totalAmount" class="form-control" placeholder="Total Amount">
           							 </div>
								</div>
						  </div> 
					<!--  </div>  -->
					
						  
				<div class="row form-group">
						 <label class="col-md-2 name col-md-offset-1" for="personname">Accountant Name<sup>*</sup> </label>  
			           		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
			           		   <input id="personnamel" name="personname" placeholder="Accountant Name" class="form-control input-md" type="text" >
			           		 </div>
						</div>
				
			
          					 <label class="col-md-2 name" for="balanceAmtLib"> Balance Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="balanceAmountl" name="balanceAmount" class="form-control" placeholder="Balance Amount">
           							 </div>
								</div>
									  						
					</div>
      	  
						  
	 <div class="row form-group">
				
				<label class="col-md-2 name col-md-offset-1" for="paymentMode"> Payment Mode<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentModel">
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										<option value="card">Card</option>
										<option value="neft">NEFT</option>
								</select>	
	           				</div>
						</div>
	
	<script>
		
		$(document).ready(function(){
	  		 $("#paymentModel").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="cheque"){
	           	
	           	$("#cheque_nol").show(); 
	           	
	           	$("#neft_acc_nol").hide(); 
	           	$("#card_nol").hide();
	           	}
	          	 else if($(this).attr("value")=="card"){
	           	
	          		$("#card_nol").show(); 	
	          		
	          		$("#neft_acc_nol").hide(); 
	        		$("#cheque_nol").hide();
	           }
	          	 else if($(this).attr("value")=="neft"){
	                	
	           		$("#neft_acc_nol").show(); 	
	           		
	           		$("#card_nol").hide(); 
	        		$("#cheque_nol").hide();
	            }
	          	 else if($(this).attr("value")=="cash"){
	             	
	            		$("#neft_acc_nol").hide(); 
	            		$("#cheque_nol").hide();
	            		$("#card_nol").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="selected"){
	             	
	        		$("#neft_acc_nol").hide(); 
	        		$("#cheque_nol").hide();
	        		$("#card_nol").hide(); 
	         }
	          
	       });
	   }).change();
		});	
		</script>
				
			          </div>  
		
			     <div class="row form-group">
				
				  <label class="col-md-2 name col-md-offset-1" for="paymentModel"> Payment Type<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentTypel">
										<!-- <option value="selected">-Select Type--</option> -->
										<option value="credit">Credit</option>
										<option value="debit">Debit</option>
										
								</select>	
	           				</div>
						</div>
						
						<label class="col-md-2" for="paymentMode"> Paid Amount<sup>*</sup></label>
						<div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input  id="paidAmountl" name="paidAmount" class="form-control" placeholder="Enter Paid Amount">
           							 </div>
						</div>
		  						
			     
			     </div>
			     
			     
			          
		    	<div class="row form-group" >

            					<div id="cheque_nol" >
            						
										
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNuml" placeholder="Cheque No." />  
									</div>
								
									
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheckl" placeholder="Name On Cheque" />  
									</div>
								</div>
											
								<div id="card_nol" class="form-group">
												
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="cardNum" id="cardNuml" placeholder="Card No." onkeypress="return isNumber(event)"/>  
												</div>
												
								</div>											
								<div id="neft_acc_nol" class="form-group">
												
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="accNum" id="accNuml" placeholder="Account No." />  
												</div>
												
												<div class="col-md-3 col-md-offset-2 first">	
													<input class="form-control" type="text" name="bankName" id="bankNamel" placeholder="Name Of Bank" />  
												</div>
								</div>
						</div>
			     
				
			          
		

 			<div class="form-group row">
                      <div class="col-md-offset-4 col-md-4 btn-center">
                          <div class="ui buttons">
                         	 <input type="button" class="ui positive button" name="btn" onclick="validationLibraryPayment()" value="Save"/>
                             
                              <div class="or"></div>
                               	<button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                               		<div class="or"></div>
                               	<input type="button" class="ui positive button" onclick="libraryPaymentList()" value="List">
                               	
                              </div>
                              
                              
                      </div>
                     </div>    	    
	</form>
  </div>
  
	
   </div>
  </div> 
 </div>
</div>
        <%@include file="commons/newFooter.jsp" %> 	
</div>
</div>
</div>

</div>

</body>
</html>		