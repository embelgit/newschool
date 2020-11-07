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
      <!--   <script type="text/javascript">
	 function editStudent() {
			 window.location = "editStudentInfo.jsp";
	}
	 function studentList() {
		 window.location = "listForStudent2.jsp";
}
</script> -->

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
	function PenaltyList()
	{
		window.location="ListofPenalty.jsp";
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
                            <h1>Penalty</h1>
                            <small>Add Penalty</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="PenaltyList()" accesskey="t""> <i class="fa fa-list"></i>Penalty List </a>
                       
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
					 <div class="col-sm-2 " align="right">
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
			     </div>
		</div>	     
			<!-- <div class="row">
				<div class="form-group">		
                  
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
			</div> -->

			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>
							<input list="classes" id="fk_class_id1" class="form-control" placeholder="Class Name" onchange="getDivisionNameByClassName()">

						<%-- 	<%
								ClassInfoDao classDao = new ClassInfoDao();
								List classList = classDao.getAllMainClass();
							%>

							<input list="classes_Student" id="fk_class_id_Student" class="form-control" onchange="getDivisionNameByClassNameForResult()">
							<datalist id="classes_Student">
							 <%
 	                            for (int i = 0; i < classList.size(); i++) {
 		                        ClassInfoHibernate classBean = (ClassInfoHibernate) classList.get(i);
                             %>

							<option data-value="<%=classBean.getPkClassId()%>"
								value="<%=classBean.getClas()%>">
								<%
									}
								%>
							
							</datalist> --%>
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
							<input list="division_Student" id="fk_division_id_Student" class="form-control" placeholder="Division Name" onchange="getSudentName()">
						
							
							
							
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='Date' name="Date" class="form-control" />
						</div>
					</div>
				
					<div class="col-sm-2" align="right">
						<label class="control-label">Penalty Amount:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="text" id='amount' name="amount" class="form-control" placeholder="Amount"/>
						</div>
					</div>
					
				</div>
				</div>
				<div class="row">
		       <div class="form-group">
			   <div class="col-md-2 col-sm-offset-1" align="right">
					<label class="control-label" for="message">Reason:<sup>*</sup></label>
			   </div>
		 	 <div class="col-md-5">
      			<textarea class="form-control" rows="07" id="message"></textarea>
			</div>
		    </div>
		</div>

			<!-- <div class="row">
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
			 </div> -->
			


			        <div class="form-group row">
                           <div class="col-md-offset-4 col-md-4 btn-center">
                               <div class="ui buttons">
                               <input type="button" class="ui positive button" id="btn" name="btn" value="Save" onclick="StudValidation()" >
                                  
                                   <div class="or"></div>
                                    <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                                    <!--  <div class="or"></div>
                                   <input type="button" class="ui positive button" name="btn" value="Edit" onclick="editStudent()"  onclick="studentList()" >Edit</button>
                                    </div> -->
                           </div>
                       </div>
                       </div>

</form>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 