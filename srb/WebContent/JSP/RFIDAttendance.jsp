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

<!-- <script type="text/javascript">
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
	
</script> -->

<script type="text/javascript">
	function RFIDAttendanceList()
	{
		window.location="ListForRFIDAttendance.jsp";
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
                            <h1>RFID Attendance</h1>
                            <small>Add RFID Attendance</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"   onclick="RFIDAttendanceList()" accesskey="t""> <i class="fa fa-list"></i>RFID Attendance List </a>
                       
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
					<label class="control-label">Serial Number:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='studentSerialNumber' name="studentSerialNumber" class="form-control" >
						</div>
					</div>
					<div class="col-sm-2 " align="right">
						<label class="control-label">Student Id:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='rfidId' name="rfidId" class="form-control" placeholder="ID" onkeypress="return isNumber(event)"/>
						</div>
					</div>
			     </div>
		</div>	     
			<div class="row">
				<div class="form-group">
					
                   <div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Student Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='firstName' name="firstName" class="form-control" placeholder="Student Name" onkeypress="return isAlphabets(event)"/>
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

					
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='dob' name="dob" class="form-control"  placeholder="Enter Date Of Birth">
						</div>
					</div>
					<div class="col-sm-2  " align="right">
                     <label class="control-label" for="emailId">E-mail Id:<sup>*</sup></label>
                     </div>
            	  <div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-envelope"></i>
						</span>
              			<input id="emailId" name="emailId" placeholder="Email ID" class="form-control input-md " type="text">
            		</div>
            	   </div>

					
				</div>
			</div>

<%-- 			<div class="row">
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
						</datalist>

							<input list="division" id="fk_division_id" class="form-control" onchange="checkForDuplicateRollNoEntry()">
							<datalist id="division"></datalist>
							
						</div>
					</div>
				</div>
			</div> --%>

			<div class="row">
				<div class="form-group">
								
					<div class="col-sm-2 col-sm-offset-1 " align="right">
						<label class="control-label">Mobile No:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						    <input type="text" id='EmergencyContact' name="EmergencyContact" class="form-control" maxlength="10" placeholder="Mobile No" onkeypress="return isNumber(event)"/>
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
                                    <!--  <div class="or"></div>
                                   <input type="button" class="ui positive button" name="btn" value="Edit" onclick="editStudent()"  onclick="studentList()" >Edit</button>
                                    </div> -->
                           </div>
                       </div>

</form>

</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 