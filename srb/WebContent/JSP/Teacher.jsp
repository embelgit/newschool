<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/srb/staticContent/JS/Teacher.js"></script>
<script type="text/javascript">
	 function teacherList() {
			 window.location = "listForTeacher.jsp";
	}
	 function editTeacher() {
		 window.location = "editTeacherDetail_new.jsp";
}
</script>

<script type="text/javascript">
function checkForDuplicateTeacherEntry(){
          			<%
          			TeacherInfoDao dao2 = new TeacherInfoDao();
          			List list = dao2.getAllMainTeacher();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				TeacherInfoHibernate   bean = (TeacherInfoHibernate)list.get(z);
          			%>
          			var firstName = "<%=bean.getFirstName()%>";
          			var middleName = "<%=bean.getMiddleName()%>";
          			var lastName = "<%=bean.getLastName()%>";
          			var fName=document.getElementById("firstName").value;
          			var mName=document.getElementById("middleName").value;
          			var lName=document.getElementById("lastName").value;
          			
          			var firstName1=firstName.toLowerCase();
          			var middleName1=middleName.toLowerCase();
          			var lastName1=lastName.toLowerCase();
          			var fName1=fName.toLowerCase();
          			var mName1=mName.toLowerCase();
          			var lName1=lName.toLowerCase();
          			if(firstName1 == fName1 && middleName1==mName1 && lastName1==lName1){
          				alert("Teacher already exist...Duplicate Not allowed");
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
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
		
<!-- 		<script type="text/javascript">
			function isAlphabets(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))) {
		        return false;
		    }
		    return true;
			}


		</script> -->
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
		
		function isNumberKey(evt,id)
		{
			try{
		        var charCode = (evt.which) ? evt.which : event.keyCode;
		  
		        if(charCode==46){
		            var txt=document.getElementById(id).value;
		            if(!(txt.indexOf(".") > -1)){
			
		                return true;
		            }
		        }
		        if (charCode > 31 && (charCode < 48 || charCode > 57) )
		            return false;

		        return true;
			}catch(w){
				alert(w);
			}
		}
		
		</script>
		
		
		<!-- <script type="text/javascript">
			function isAlphabetsWithSpace(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))) {
		        return false;
		    }
		    return true;
			}


		</script> -->

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
<body>


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/employees.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Employee Details</h1>
                            <small>Add Employee</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="teacherList()"  accesskey="t""> <i class="fa fa-list"></i>Employee List </a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
                
                
                
		<form class="form-horizontal" name="tdvf">
		
		
		  <div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Personal Details</u></b></h5>
			        </div>
		       </div>
			</div>
		  </div>
		    <div class="row ">
		  <div class=" form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
				<label class="control-label">Designation<sup>*</sup></label>
			</div>
			<div class="col-md-3">
				<div class="selectContainer">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-user"></i> </span>
						<select name="designation" class="form-control selectpicker" id='designation'>
							<option value="">Select Designation</option>
							<option>Teaching Staff</option>
							<option>Non-Teaching Staff</option>
							<option>Principal</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		  </div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">First Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='firstName' name="firstName" class="form-control" placeholder="Enter First Name" onkeypress="return isAlphabets(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Middle Name<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='middleName' name="middleName" class="form-control"  placeholder="Middle Name" onkeypress="return isAlphabets(event)"/>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Last Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='lastName' name="lastName" class="form-control"  placeholder="last Name" onkeypress="return isAlphabets(event)" onchange="checkForDuplicateTeacherEntry()"/>
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">DOB:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='dob' name="dob" class="form-control" placeholder="Enter DOB" />
						</div>
					</div>
				</div>
			</div>
			
			
         <div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Qualification Details</u></b></h5>
			        </div>
		       </div>
			</div>
		</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Highest Qualification:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-folder-open"></i>
							</span> 
							<!-- <input type="text" id='hquqlification' name="quqlification" class="form-control" placeholder="Enter highest qualification" onkeypress="return isAlphabetsWithSpace(event)""> -->
					   	<input type="text" id='hquqlification' name="quqlification" class="form-control" placeholder="Enter highest qualification" >
					   
					    </div>
					</div>
					
				
			        <div class="col-sm-2" align="right">
						<label class="control-label">Joining Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='jdate' name="date" class="form-control" placeholder="Enter Joining Date"/>
					    </div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Specialization:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-folder-open"></i>
							</span> 
							<input type="text" id='specialization' name="specialization" class="form-control" placeholder="Enter specialization"/>
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Percentage/CGPA:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-folder-open"></i>
							</span> 
							<input type="text" id='percentage' name="percentage" class="form-control" placeholder="Enter Percentage of Marks" onkeypress="return isNumberKey(evt,id)" />
						</div>
					</div>
				</div>
			</div>


			<div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Contact Details</u></b></h5>
			        </div>
		       </div>
			</div>
		</div>
		
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Mobile Number:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-phone"></i>
							</span> 
							<input type="text" id='mobnum' name="mobnum" class="form-control" placeholder="Enter mob number" maxlength="10" onkeypress="return isNumber(event)">
					    </div>
					</div>
				

					<div class="col-sm-2" align="right">
						<label class="control-label">Landline Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-phone-alt"></i>
							</span>
						    <input type="text" id='landno' name="landno" class="form-control" placeholder="Enter Landline No." maxlength="10" onkeypress="return isNumber(event)" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Permanent Address:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='perAddress' name="perAddress" class="form-control" placeholder="Permanent address">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Present Address:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='preAddress' name="preAddress" class="form-control" placeholder="Present address">
					 	</div>
					 </div>
				</div>
			</div>
			
		<div class="row">
		    <div class="form-group">
			   <div class="col-sm-2 col-sm-offset-1" align="center">
			        <div align=center-left">
				       <h5><b><u>Payment Details</u></b></h5>
			        </div>
		       </div>
			</div>
		</div>
		
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Account Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-phone"></i>
							</span> 
							<input type="text" id='accountNumber' name="accountNumber" class="form-control" placeholder="Enter Account number" onkeypress="return isNumber(event)">
					    </div>
					</div>
				

					<div class="col-sm-2" align="right">
						<label class="control-label">Bank Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='bankName' name="bankName" class="form-control" onkeypress="return isAlphabetsWithSpace(event)" placeholder="Enter Bank Name" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">IFSC Code:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='ifsc' name="ifsc" class="form-control" placeholder="Enter IFSC">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Aadhar Number:<sup>*</sup>
						</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='aadharNumber' name="preAddress" maxlength="12" class="form-control" placeholder="Enter Aadhar Number" onkeypress="return isNumber(event)">
					 	</div>
					 </div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">PAN Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='panNumber' name="panNumber" class="form-control" placeholder="Enter PAN Number">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">EPF Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='epfNumber' name="epfNumber" class="form-control" placeholder="Enter EPF Number">
					 	</div>
					 </div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">PT Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='ptNumber' name="ptNumber" class="form-control" placeholder="Enter PT Number">
					 	</div>
					 </div>
					 
					 <div class="col-sm-2 " align="right">
						<label class="control-label">Salary:</label>
					</div>
					 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='Salary' name="Salary" class="form-control" placeholder="Enter Salary" onkeypress="return isNumber(event)">
					 	</div>
					 </div>
				 </div>
				 
				 
				
				  <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btnn" value="Save" onclick="TeacherValidation()" >Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         
                                        <div class="or"></div>
                                         <input type="button" class="ui positive button" name="btn" value="Edit" onclick="editTeacher()" >Edit</button>
                                       
                                         </div>
                                </div>
                            </div>
				
				
			</div>
			
			
			</form>
                </div>
                </div>


</body>

</html>				
		<%@include file="commons/newFooter.jsp" %> 			
	        