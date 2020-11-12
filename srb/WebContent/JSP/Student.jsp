<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
        <script src="/srb/staticContent/JS/Student.js"></script>
        <script type="text/javascript">
	 function editStudent() {
			 window.location = "editStudentInfo.jsp";
	}
	 function studentList() {
		 window.location = "listForStudent2.jsp";
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
		




<script type="text/javascript">
function checkForDuplicateRollNoEntry(){
          			<%
          			StudentInfoDao dao2 = new StudentInfoDao();
          			List list = dao2.getAllMainStudent();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				StudentInfoHibernate bean = (StudentInfoHibernate)list.get(z);
          			%>
          			var classId = "<%=bean.getClas()%>";
          			var divisionId = "<%=bean.getDivision()%>";
          			var rollNo  =	"<%=bean.getRollNumber()%>";
          			
          			var input = document.getElementById('fk_class_id1'),
          		    list = document.getElementById('clas'),
          		    i,fk_class_id;
          			for (i = 0; i < list.options.length; ++i) {
          		    if (list.options[i].value === input.value) {
          		    	fk_class_id = list.options[i].getAttribute('data-value');
          		    	}
          			}

          			
          			var input = document.getElementById('fk_division_id'),
          		    list = document.getElementById('division'),
          		    i,fk_division_id;

          			for (i = 0; i < list.options.length; ++i) {
          		    if (list.options[i].value === input.value) {
          		    	fk_division_id = list.options[i].getAttribute('data-value');
          		    	}
          			}
          			
          			var rollNumber=document.getElementById("rollNumber").value;
          			
          			if(fk_class_id == classId && divisionId == fk_division_id && rollNo == rollNumber ){
          				alert("Roll No already exist...Duplicate Not allowed");
          				location.reload();
          				
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
</script>

<script type="text/javascript">
function checkForDuplicateGenralEntry(){
          			<%
          			StudentInfoDao dao3 = new StudentInfoDao();
          			List list1 = dao3.getAllMainStudent();
          			%>
          			
          			<%
          			int A = 0;
          			for(A=0;A<list1.size();A++){
          				StudentInfoHibernate bean = (StudentInfoHibernate)list1.get(A);
          			%>
          			var classId = "<%=bean.getClas()%>";
          			var divisionId = "<%=bean.getDivision()%>";
          			var rollNo  =	"<%=bean.getRollNumber()%>";
          			var Genral = "<%=bean.getGeneralRegNumber()%>";
          			
          			var input = document.getElementById('fk_class_id1'),
          		    list = document.getElementById('clas'),
          		    i,fk_class_id;
          			for (i = 0; i < list.options.length; ++i) {
          		    if (list.options[i].value === input.value) {
          		    	fk_class_id = list.options[i].getAttribute('data-value');
          		    	}
          			}

          			
          			var input = document.getElementById('fk_division_id'),
          		    list = document.getElementById('division'),
          		    i,fk_division_id;

          			for (i = 0; i < list.options.length; ++i) {
          		    if (list.options[i].value === input.value) {
          		    	fk_division_id = list.options[i].getAttribute('data-value');
          		    	}
          			}
          			
          			var generalRegNumber=document.getElementById("generalRegNumber").value;
          			
          			if(generalRegNumber == Genral){
          				alert("GeneralRegNumber already exist...Duplicate Not allowed");
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
</script>

<script type="text/javascript">
	function cancelAdmission()
	{
		window.location="cancellationOFStudentAdmission.jsp";
	}
	
</script>

<script type="text/javascript">
	function documentUpload()
	{
		window.location="studentDocumentUpload.jsp";
	}
	
</script>

<script type="text/javascript">
	function CancelStudentList()
	{
		window.location="ListForCancelStudent.jsp";
	}
	
</script>


</head>
<body>


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"></div>
                        <div class="header-title">
                            <h1>Student Details</h1>
                            <small>Add Student</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="studentList()" accesskey="t""> <i class="fa fa-list"></i>Student List </a>
                       
                </div>
                
                <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="cancelAdmission()" accesskey="t""> <i class="fa fa-close"></i>Cancel Admission </a>  
                </div>
                
                
                 <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="documentUpload()" accesskey="t""> <i class="fa fa-file"></i>Document Upload </a>  
                </div>
                 
                 <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="CancelStudentList()" accesskey="t""> <i class="fa fa-list"></i>Admission Cancel StudentList</a>  
                </div>
                
            </div> 

            
            <div class="panel-body panel-form">
                <div class="row">
<!--   */for auto generated serial number*/ -->
  <%
	Long studRollNo = 1l;
%>
<%
StudentInfoDao dao1 = new StudentInfoDao();

	List bill = dao1.getAutoSerialNumber();

	for (int i = 0; i < bill.size(); i++) {
		StudentInfoHibernate sa = (StudentInfoHibernate) bill.get(i);
		studRollNo = sa.getStudentSerialNumber();
		System.out.println(studRollNo);

		studRollNo++;
		System.out.println(studRollNo);
	}
%>


		<form class="form-horizontal" name="sdtv">

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">General Registration Number:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='generalRegNumber' name="generalRegNumber" class="form-control" placeholder="Enter General Reg Number" onkeypress="return isNumber(event)" onchange="checkForDuplicateGenralEntry()" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Serial Number:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='studentSerialNumber' readonly="readonly" name="studentSerialNumber" class="form-control" value=<%=studRollNo %>>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Student Roll Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='rollNumber' name="rollNumber" class="form-control" placeholder="Enter Roll Number" onkeypress="return isNumber(event)"/>
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Aadhar Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='aadharNumber' name="aadharNumber" class="form-control" maxlength="12" onkeypress="return isNumber(event)" placeholder="Enter Aadhar Number">
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">First Name:<sup>*</sup></label>
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
						<label class="control-label">Middle Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='middleName' name="middleName" class="form-control"  placeholder="Enter Middle Name" onkeypress="return isAlphabets(event)"/>
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
							<input type="text" id='lastName' name="lastName" class="form-control"  placeholder="Enter Last Name" onkeypress="return isAlphabets(event)"/> 
						</div>
					</div>

					<div class="col-sm-2" align="right">
					<label class="control-label">Date Of Birth:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='dob' name="dob" class="form-control"  placeholder="Enter Date Of Birth">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Date Of Admission:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span> 
							<input type="date" id='doa' name="doa" class="form-control"  placeholder="Enter Date Of Admission">
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Gender:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon  glyphicon-user"></i>
								</span>
							    <select name="department" class="form-control selectpicker" id='gender'>
									<option value="">gender</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
					<%
						ClassInfoDao sdd = new ClassInfoDao();
						List sList = sdd.getAllMainClass();
					%>

					<input list="clas" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassName()">
					<datalist id="clas">

						<%
							for (int i = 0; i < sList.size(); i++) {
								ClassInfoHibernate sup = (ClassInfoHibernate) sList.get(i);
						%>

						<option data-value="<%=sup.getPkClassId()%>"
							value="<%=sup.getClas() %>">
							<%
								}
							%>
						
					</datalist>
				</div>
			</div>

			        <div class="col-sm-2" align="right">
						<label class="control-label">Division:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
				<%-- 					
					<%
						DivisionInfoDao sdd1 = new DivisionInfoDao();
						List sList2 = sdd1.getAllMainDivision();
					%>

								<input list="division" id="fk_division_id" class="form-control" onchange="checkForDuplicateRollNoEntry()">
					 		    <datalist id="division">

						<%
							for (int i = 0; i < sList2.size(); i++) {
								DivisionInfoHibernate sup = (DivisionInfoHibernate) sList2.get(i);
						%>

						<option data-value="<%=sup.getPkDivisionId()%>"
							value="<%=sup.getDivision() %>">
							<%
								}
							%>
						</datalist> --%>

							<input list="division" id="fk_division_id" class="form-control" onchange="checkForDuplicateRollNoEntry()">
							<datalist id="division"></datalist>
							
						</div>
					</div>
				</div>
			</div>

			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">City/Village:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='city' name="city" class="form-control" placeholder="Enter City/Village" onkeypress="return isAlphabetsWithSpace(event)">
						</div>
					</div>
			<!-- 	<div class="row"> -->
				<!-- <div class="form-group"> -->
					<div class="col-sm-2 " align="right">
						<label class="control-label">Taluka:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span> 
							<input type="text" id='taluka' name="taluka" class="form-control" placeholder="Enter Taluka" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
				<!-- </div> -->
					<!-- </div> -->
			</div>
		</div>
			

			<div class="row">
				<div class="form-group">

					<div class="col-sm-2  col-sm-offset-1" align="right">
						<label class="control-label">District:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
							 <input type="text" id='district' name="district" class="form-control"  placeholder="Enter District" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">State:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='state' name="state" class="form-control" placeholder="Enter State" onkeypress="return isAlphabetsWithSpace(event)">
						</div>
					</div>
					
				</div>
		</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Country:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='country' name="country" class="form-control" placeholder="Enter Country" onkeypress="return isAlphabetsWithSpace(event)""/>
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Pin Code:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='pinCode' name="pinCode" maxlength="6" class="form-control" placeholder="Enter Pincode" onkeypress="return isNumber(event)">
						</div>
					</div>

				</div>
			</div>	
						
			<div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Mother Tongue:</label>
					</div>
					<div class="col-md-3">
						
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
		    <input type="text" id='mothertongue' name="mothertongue" class="form-control" placeholder="Enter mother tongue" onkeypress="return isAlphabetsWithSpace(event)"/>		
						</div>
						</div>
						
						<div class="col-sm-2" align="right">
						<label class="control-label">Student Status:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
							<select id='studentstatus'  name="studentstatus" class="form-control selectpicker">
									<option value="">Select Student Status</option>
									<option value="present">Present Student</option>
									<option value="exstudent">Ex-Student</option>

								</select> 
						</div>
					</div>
						
						
					</div>
					</div>
			<script>
		$(document).ready(function(){
	  		 $("#studentstatus").change(function(){
	       	$(this).find("option:selected").each(function(){
	       		if($(this).attr("value")==""){
		           	$("#statuss").hide();
		          /*  	$('#leavingyr').hide(); */
		         
		           	}
	       		else if($(this).attr("value")=="present"){
	           	$("#statuss").hide();
//	           	$('#leavingyr').hide();
	         
	           	}
	          	 else if($(this).attr("value")=="exstudent"){
	          	  	$("#statuss").show();
		        //   	$('#leavingyr').show(); 
		           	
		           } 
	           	
	       });
	   }).change();
		});	
		</script>
 				<div id="statuss">	 
				<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='classname' name="classname" class="form-control" placeholder="Class Name" />
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Year of leaving:</label>
					</div>
                     <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='leavingyr' name="leavingyr" class="form-control" placeholder="Year of leaving" />
					 	</div>
					 </div>
				</div>
			</div>
				</div>
				
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Cast:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='cast' name="cast" class="form-control" placeholder="Enter Cast" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>



					<div class="col-sm-2" align="right">
						<label class="control-label">Sub-Cast:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='subCast' name="subCast" class="form-control" placeholder="Enter Sub-Cast" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>

				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Religion:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='religion' name="religion" class="form-control" placeholder="Enter Religion" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Student Type:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
		<!-- 				    <input type="text" id='studenttype' name="studenttype" class="form-control" placeholder="Enter Student type" onkeypress="return isAlphabetsWithSpace(event)"/> -->
							<select id='studenttype'  name="studenttype" class="form-control selectpicker">
									<option value="">Select Student type</option>
									<option value="Namankit">Namankit</option>
									<option value="General">General</option>
									<option value="RTE">RTE</option>
									<option value="Staff">Staff</option>
									<option value="Dhangar">Dhangar</option>
								</select> 
						</div>
					</div>
				</div>
				</div>
				<script>
		$(document).ready(function(){
	  		 $("#studenttype").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="Namankit"){
	           	$("#namakit").show(); 
	          /*  	$("#kalamnuri").show(); 
	           	$("#pandharkawda").show();
	           	$("#pusad").show();
	           	$("#aurangabad").show();
	           	$("#dharni").show(); */
	           	}
	          	 else if($(this).attr("value")=="General"){
	          		$("#namakit").hide(); 
		           	/* $("#kalamnuri").hide(); 
		           	$("#pandharkawda").hide();
		           	$("#pusad").hide();
		           	$("#aurangabad").hide();
		           	$("#dharni").hide();  */
		           }
		          	 else if($(this).attr("value")=="RTE"){
		          		$("#namakit").hide(); 
			          /*  	$("#kalamnuri").hide(); 
			           	$("#pandharkawda").hide();
			           	$("#pusad").hide();
			           	$("#aurangabad").hide();
			           	$("#dharni").hide();  */ 
		            }
		          	 else if($(this).attr("value")=="Staff"){
		          		$("#namakit").hide(); 
			           /* 	$("#kalamnuri").hide(); 
			           	$("#pandharkawda").hide();
			           	$("#pusad").hide();
			           	$("#aurangabad").hide();
			           	$("#dharni").hide(); */ 
		             }
		          	 else if($(this).attr("value")=="Dhangar"){
		          		$("#namakit").hide(); 
			           /* 	$("#kalamnuri").hide(); 
			           	$("#pandharkawda").hide();
			           	$("#pusad").hide();
			           	$("#aurangabad").hide();
			           	$("#dharni").hide();   */
		             }
		          	 else if($(this).attr("value")==""){
		          		$("#namakit").hide(); 
			           	/* $("#kalamnuri").hide(); 
			           	$("#pandharkawda").hide();
			           	$("#pusad").hide();
			           	$("#aurangabad").hide();
			           	$("#dharni").hide();  */
			             }
	           	
	       });
	   }).change();
		});	
		</script>
		
			<div id="namakit">
				<div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Namankit Type:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
		<!-- 				    <input type="text" id='studenttype' name="studenttype" class="form-control" placeholder="Enter Student type" onkeypress="return isAlphabetsWithSpace(event)"/> -->
							<select id='namankittype'  name="namankittype" class="form-control selectpicker">
									<option value="">Select Namankit type</option>
									<option value="kinwat">Kinwat</option>
									<option value="kalamnuri">Kalamnuri</option>
									<option value="pandharkawda">Pandharkawda</option>
									<option value="pusad">Pusad</option>
									<option value="aurangabad">Aurangabad</option>
									<option value="dharni">Dharni</option>
								</select> 
						</div></div>
					</div>
					</div></div>	
			<!-- <div class="row">
            	<div class="form-group">
					<div class="col-md-3 col-md-offset-3 first">	
						<input class="form-control" type="text" name="kinwat" id="kinwat" placeholder="Kinwat" />  
					</div>
					<div class="col-md-3 col-md-offset-2 first">	
					 <input class="form-control" type="text" name="kalamnuri" id="kalamnuri" placeholder="Kalamnuri" />  
						</div>
				</div>
			</div>
			<div class="row">
            	<div class="form-group">
					<div class="col-md-3 col-md-offset-3 first">	
						<input class="form-control" type="text" name="pandharkawda" id="pandharkawda" placeholder="Pandharkawda" />  
					</div>
					<div class="col-md-3 col-md-offset-2 first">	
					 <input class="form-control" type="text" name="pusad" id="pusad" placeholder="Pusad" />  
						</div>
				</div>
			</div>
			<div class="row">
            	<div class="form-group">
					<div class="col-md-3 col-md-offset-3 first">	
						<input class="form-control" type="text" name="aurangabad" id="aurangabad" placeholder="Aurangabad" />  
					</div>
					<div class="col-md-3 col-md-offset-2 first">	
					 <input class="form-control" type="text" name="dharni" id="dharni" placeholder="Dharni" />  
						</div>
				</div>
			</div> -->
			

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Father's Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='fatherName' name="fatherName" class="form-control" placeholder="Enter Father Name" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Mother's Name:</label>
					</div>
                     <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='motherName' name="motherName" class="form-control" placeholder="Enter Mother Name" onkeypress="return isAlphabetsWithSpace(event)"/>
					 	</div>
					 </div>
				</div>
			</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Contact Person No.:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-earphone"></i>
							</span>
						    <input type="text" id='contactNo' name="contactNo" class="form-control" maxlength="10" placeholder="Enter Contact No." onkeypress="return isNumber(event)">
					 	</div>
					 </div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Siblings:</label>
					</div>
					<div class="col-md-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-hand-right" ></i>
								</span>
								<select id='siblings'  name="siblings1" class="form-control selectpicker">
									<option value="">Number Of Brother/Sister</option>
									<option>0</option>
									<option>1</option>
									<option>2</option>
									<option>more than 2</option>
								</select> 
							</div>
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
						    <input type="text" id='perAddress' name="perAddress" class="form-control" placeholder="Enter Permanent Address" > 
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
						    <input type="text" id='preAddress' name="preAddress" class="form-control" placeholder="Enter Present Address">
					 	</div>
					 </div>
				</div>
			</div>
			<div class="row">
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Annual Fee(INR):<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							Rs
							</span>
						    <input type="text" id='annualFee' name="annualFee" class="form-control" placeholder="Enter Annual Fee" onkeypress="return isNumber(event)"/>
					 	</div>
					 </div>
					 
					 <div class="col-sm-2" align="right">
						<label class="control-label">Previous School Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='preSchoolN' name="preSchoolN" class="form-control" placeholder="Enter Previous School Name" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
			</div>
			</div>
			<div class="row">
			<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Place Of Birth:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='birthPlace' name="birthPlace" class="form-control" placeholder="Enter Place Of Birth" onkeypress="return isAlphabetsWithSpace(event)">
					 	</div>
					 </div>
					 
					 <div class="col-sm-2" align="right">
						<label class="control-label">Place Of Birth Taluka:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='birthtal' name="birthtal" class="form-control" placeholder="Enter Birth Taluka" onkeypress="return isAlphabetsWithSpace(event)">
						</div>
					</div>
			 </div>
			  </div>
			  
			  <div class="row">
			<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Place Of Birth District:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='birthdist' name="birthdist" class="form-control" placeholder="Enter Birth District" onkeypress="return isAlphabetsWithSpace(event)">
					 	</div>
					 </div>
					 
					 <div class="col-sm-2" align="right">
						<label class="control-label">Place Of Birth Country:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='birthcountry' name="birthcountry" class="form-control" placeholder="Enter Birth Country" onkeypress="return isAlphabetsWithSpace(event)">
						</div>
					</div>
			 </div>
			  </div>
			  
			  <div class="row">
			<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Student saral ID No:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
					    <input type="text" id='studId' name="studId" class="form-control" placeholder="Enter Student serial ID No">
					 	</div>
					 </div>
			 </div>
			  </div>
			  
			  
			  
			 <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Student Photo:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-picture"></i>
							</span>
						    <input type="file" id='studentPhoto' class="form-control" >
						</div>
					</div>
					 
					  <div class="col-sm-2" align="right">
						<label class="control-label">Previous School UDIAS Number:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='preSchoolUdias' name="preSchoolUdias" class="form-control" placeholder="Enter Previous School UDIAS Number">
						</div>
					</div>
			 </div>
		</div>
					
			 <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Area:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='area' name="area" class="form-control" placeholder="Enter Area" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Emergency Contact :<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='EmergencyContact' name="EmergencyContact" class="form-control" maxlength="10" placeholder="Enter EmergencyContact" onkeypress="return isNumber(event)"/>
						</div>
					</div>
			   </div>
			 </div>
			


			  <div class="form-group row">
                           <div class="col-md-offset-4 col-md-4 btn-center">
                               <div class="ui buttons">
                               <input type="button" class="ui positive button" id="btn" name="btn" value="Save" onclick="StudValidation()" >Save</button>
                                  
                                   <div class="or"></div>
                                    <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                                     <div class="or"></div>
                                   <input type="button" class="ui positive button" name="btn" value="Edit" onclick="editStudent()"  onclick="studentList()" >Edit</button>
                                    </div>
                           </div>
                       </div>

</form>

</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 