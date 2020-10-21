<%@page import="com.srb.hibernate.FeeStructureHiberenate"%>
<%@page import="com.srb.dao.FeeStructureDao"%>
<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>
 <script type="text/javascript" src="/srb/staticContent/JS/cashbook.js"></script>
 <script type="text/javascript">
 function Reset(){
	 location.reload();
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
			function isAlphabets(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
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


<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Student Fee Payment </h1>
                            <small>Fee Payment</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
           <!--  <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="doFeeStructure()" value="Print Fee Structure" accesskey="t""> <i class="fa fa-list"></i>Print Fee Structure</a>  
                </div>
            </div>  -->

            <div class="panel-body panel-form">
                <div class="row">
 		<form class="form-horizontal" name="studentPayment">
 				<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
					</div>
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


					<div class="col-sm-2" align="right">
						<label class="control-label">Division Name:<sup>*</sup></label>
					</div>
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
 				<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Student Name:<sup>*</sup></label>  
           				 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
										</span>
										<select id="fk_Student_id" class="form-control" onchange="bill.StudentFeegetTotalAnnualFee()">
										</select>
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
 				
 									<label class="col-md-2 control-label " align="right">Annual Total Fee</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="totalAnnualFee" name="totalAnnualFee" class="form-control">
           							 </div>
								</div>
				</div>
			</div>
			
			<div class="row">
 			<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Academic Year:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 	<i class="glyphicon glyphicon-stats"></i>
							</span> 
							<input type="text" id='academicYear4' list="academicYear1" name="academicYear" class="form-control">
                                   <datalist id="academicYear1">
                                     <option data-value="2011-2015" value="2017-2018">
                                     <option data-value="2016-2020" value="2018-2019">
                                     <option data-value="2016-2020" value="2019-2020">
                                     <option data-value="2015-2016" value="2020-2021">
                                     <option data-value="2006-2010" value="2021-2022">
                                   </datalist> 
						</div>
					</div>
					
				<label class="col-md-2 control-label " align="right">Remaining Fee</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="remainingFee" name="remainingFee" class="form-control">
           							 </div>
								</div>
				</div>
			</div>
			
			<div class="row">
 			<div class="form-group">
 			
 			<label class="col-md-2 control-label col-sm-offset-1 " align="right">Accountant Name<sup>*</sup></label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
           									  <input type="text" id="accountantName" name="totalAnnualFee" placeholder="Enter Accountant Name" class="form-control">
           							 </div>
								</div>
 							<label class="col-md-2 control-label " align="right">Paying Fee Amount<sup>*</sup></label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input type="text" id="payingFee" name="payingFee" class="form-control" placeholder="Enter Paying Amount" onchange="payingFeeCompaireWithRemainingFee()">
           							 </div>
								</div>
 			</div>
 			</div>
			
			  <div class="row">        
          	<div class="form-group" >
					<div class="col-md-3 control-label">
	           				<label for="paymentMode"> Payment Mode<sup>*</sup></label>  
	           		</div>
	           		
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentMode">
										<option value="selected">-Select Type--</option>
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										<option value="card">Card</option>
										<option value="neft">NEFT</option>
								</select>	
	           				</div>
						</div>
						
			<div class="col-sm-2" align="right">
						<label class="control-label">Expected Payment Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='expectedPaymentDate' name="expectedPaymentDate" class="form-control" />
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
      </div>
      <div class="row">        
          	<div class="form-group" >
					<div class="col-md-3 control-label">
	           				<label for="onlinepayment">Online Payment<sup>*</sup></label>  
	           		</div>
	           		
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="onlinepayment">
										<option value="selected">-Select Type--</option>
										<option value="debitcard">Debit Card</option>
										<option value="googlepay">Google Pay</option>
										<option value="phonepe">Phone Pe</option>
										<option value="upipayment">Upi Payment</option>
								</select>	
	           				</div>
						</div>
						
		<!-- 	<div class="col-sm-2" align="right">
						<label class="control-label">Expected Payment Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='expectedPaymentDate' name="expectedPaymentDate" class="form-control" />
						</div>
					</div> -->
            	
	 <script>
		
		$(document).ready(function(){
	  		 $("#onlinepayment").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="debitcard"){
	           	
	           	$("#cheque_no").show(); 
	           	
	           	$("#neft_acc_no").hide(); 
	           	$("#card_no").hide();
	           	}
	          	 else if($(this).attr("value")=="card"){
	           	
	          		$("#card_no").show(); 	
	          		
	          		$("#neft_acc_no").hide(); 
	        		$("#cheque_no").hide();
	           }
	          	 else if($(this).attr("value")=="googlepay"){
	                	
	           		$("#neft_acc_no").show(); 	
	           		
	           		$("#card_no").hide(); 
	        		$("#cheque_no").hide();
	            }
	          	 else if($(this).attr("value")=="phonepe"){
	             	
	            		$("#neft_acc_no").hide(); 
	            		$("#cheque_no").hide();
	            		$("#card_no").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="upipayment"){
	             	
	        		$("#neft_acc_no").hide(); 
	        		$("#cheque_no").hide();
	        		$("#card_no").hide(); 
	         }
	          
	       });
	   }).change();
		});	
		</script>
      </div>
      </div>
       
      				<div class="row">
 					<div class="form-group">
 			
 						<label class="col-md-2 control-label col-sm-offset-1 " align="right">Student Type</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
           									  <input type="text" id="studenttype" name="studenttype" placeholder="Student type" class="form-control" readonly="readonly">
           							 </div>
								</div>
 							<label class="col-md-2 control-label " align="right">Namankit Type</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
           									  <input type="text" id="namankit" name="namankit" class="form-control" placeholder="Namankit type" readonly="readonly">
           							 </div>
								</div>
 			</div>
 			</div>
      			      		
 			      		<div class="row">
 					<div class="form-group" style="display: none;">
 			
 						<label class="col-md-2 control-label col-sm-offset-1 " align="right">Roll no:</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
           									  <input type="text" id="rollno" name="rollno" placeholder="Student type" class="form-control" readonly="readonly">
           							 </div>
								</div>
							</div>
							</div>      			      		
            
          					<div class="row form-group" >

            					<div id="cheque_no" >
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNum" placeholder="Cheque No." />  
									</div>
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck" placeholder="Name On check" />  
									</div>
								</div>
											<div id="card_no" class="form-group">
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="cardNum" id="cardNum" placeholder="Card No." />  
												</div>
											</div>
											<div id="neft_acc_no" class="form-group">
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="accNum" id="accNum" placeholder="Account No." />  
												</div>
												<div class="col-md-3 col-md-offset-2 first">	
													<input class="form-control" type="text" name="bankName" id="bankName" placeholder="Name Of Bank" />  
												</div>
												</div>
					</div>
			
			
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn"  onclick="doStudentPaymentValidation()" value="Fee Receipt">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="Reset()">Reset</button>
                                         <!-- <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Edit" id="listBtn"  onclick="editDivision()">Edit</button> -->
                                    </div>
                                </div>
                            </div>
			
			 <div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Fee Structure</u></b></h5>
			        </div>
		       </div>
			</div>
		</div>
			
			<!-- <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">1st Installment:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-home"></i>
							</span> 
							<input type="text" id='firstInstallment' name="firstInstallment" class="form-control" placeholder="Enter 1st Installment" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">2nd Installment:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
                            <input type="text" id='secondInstallment' name="secondInstallment" class="form-control"  placeholder="Enter 2nd Installment" />
						</div>
					</div>
				</div>
			</div> -->
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Admission Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<input type="text" id='admissionFees' name="admissionFees" class="form-control" placeholder="Enter admission Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Tuition Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='tuitionFees' name="tuitionFees" class="form-control" placeholder="Enter tuition Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group">
							<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Library & Computer Lab Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='computerFees' name="computerFees" class="form-control" placeholder="Enter library & Computer Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Security Deposit & Medical Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='medicalFees' name="medicalFees" class="form-control" placeholder="Enter security deposit medical Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Gymnassium Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='gymnassiumFees' name="gymnassiumFees" class="form-control" placeholder="Enter gymnassium Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Laboratory Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='laboratoryFees' name="laboratoryFees" class="form-control" placeholder="Enter laboratory Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Stationary Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='stationaryFees' name="stationaryFees" class="form-control" placeholder="Enter stationary Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Exam Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='examFees' name="examFees" class="form-control" placeholder="Exam Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>
				</div>
			</div>
			
			
			 <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Competitive Exam Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='competitiveFees' name="competitiveFees" class="form-control" placeholder="Enter competitive exam Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Hostel Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='hostelFees' name="hostelFees" class="form-control" placeholder="Enter hostel Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>
				</div>
			</div>
	
	
				<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Mess Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='messFees' name="messFees" class="form-control" placeholder="Enter mess Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Uniform with Shoes & Socks Fees:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='uniformFees' name="uniformFees" class="form-control" placeholder="Uniform with Shoes & Socks Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>
				</div>
			</div>
		
		
		<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Raincoat :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='raincoat' name="raincoat" class="form-control" placeholder="Enter raincoat Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Undergarments :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='undergarments' name="undergarments" class="form-control" placeholder="Enter undergarments Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">other Fees (Tour, Parent's Day, etc):</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='otherFees' name="otherFees" class="form-control" placeholder="Enter other Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Lump - Sum:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='lumpsumFees' name="lumpsumFees" class="form-control" placeholder="Enter lump-sum Fees" onkeypress="return isNumber(event)"/>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Period of the Fee Paid:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span> 
						<!-- 	<input type="text" id='otherFees' name="otherFees" class="form-control" placeholder="Enter Activities Fees" /> -->
								<select class="form-control" id="feedue">
										<option value="NA">-Select Type--</option>
										<option value="Last Year Due">Last Year Due</option>
										<option value="Present Year Due">Present Year Due</option>
									
								</select>	
						</div>
					</div>
					</div>
					</div>
					
			
                 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn"  onclick="doFeeStructure()" value="Fee Structure">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" onclick="Reset()">Reset</button>
                                         <!-- <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Edit" id="listBtn"  onclick="editDivision()">Edit</button> -->
                                    </div>
                                </div>
                            </div>
 </form>
 </div>
 	<%@include file="commons/newFooter.jsp" %>