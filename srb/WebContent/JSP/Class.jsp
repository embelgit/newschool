
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/srb/staticContent/JS/Class.js"></script>
<script src="/srb/staticContent/JS/Division.js"></script>
<script type="text/javascript">
		
	 function editDivision() {
			 window.location = "editDivision.jsp";
		}
	 function deleteDivision() {
		 window.location = "deletedivision.jsp";
		}
		function classList1(){
			 window.location = "listForClass.jsp";
		}
		function divList(){
			 window.location = "listForDivision.jsp";
		}
		function editClassName(){
			window.location ="EditClass.jsp"
		}
		function deleteClassName(){
			window.location ="Deleteclass.jsp"
		}
</script>

<script type="text/javascript">
function checkForDuplicateClassEntry(){
          			<%
          			ClassInfoDao dao2 = new ClassInfoDao();
          			List list = dao2.getAllMainClass();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				ClassInfoHibernate bean = (ClassInfoHibernate)list.get(z);
          			%>
          			var className = "<%=bean.getClas()%>";
          			var cName=document.getElementById("clas").value;
          			
          			var className1=className.toLowerCase();
          			var cName1=cName.toLowerCase();
          			if(className1 == cName1 ){
          				alert("Class already exist...Duplicate Not allowed");
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
</script>


<script type="text/javascript">
function checkForDuplicateDivisionEntry(){
	
	
	var input = document.getElementById('fk_class_id'),
	list = document.getElementById('classId'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}
				
					
          			<%
          			DivisionInfoDao dao3 = new DivisionInfoDao();
          			List list1 = dao3.getAllMainDivision();
          			%>
          			
          			<%
          			int l = 0;
          			for(l=0;l<list1.size();l++){
          				DivisionInfoHibernate bean1 = (DivisionInfoHibernate)list1.get(l);
          			%>
          			var classId = "<%=bean1.getFkClassId()%>";
          			var division = "<%=bean1.getDivision()%>";
          			var classNum = "<%=bean1.getClassRoom()%>";
          			var dName=document.getElementById("division").value;
          			var cNum=document.getElementById("classRoom").value;
          			
          			/* var division1=division.toLowerCase(); */ 
          			if(dName == division && classId==fk_class_id ){
          				alert("Division already exist...Duplicate Not allowed");
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
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
                            <h1>Class Details</h1>
                            <small>Class Details</small> 
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
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>Class List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="divList()" accesskey="t""> <i class="fa fa-list"></i>Division List </a>  
                </div>
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		

		<ul class="nav nav-tabs">
	    	<li class="active"><a data-toggle="tab" href="#home"><h4 style="color:blue">Class Name Entry</h4></a></li>
	    	<li><a data-toggle="tab" href="#twoDates"><h4 style="color:blue">Division Entry</h4></a></li>
		</ul>
		

		
<div class="tab-content" style="float: left">
<!-- 	For class Name entry -->
	<div id="home" class="tab-pane fade in active">
		<form class="form-horizontal" name="classForName">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
					</div>
					
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span> 
<!-- 							 <input type="text" id='clas' name="clas" class="form-control" placeholder="Enter class" onchange="checkForDuplicateClassEntry()"/>  -->
						<select name="clas" class="form-control selectpicker" id='clas' onchange="checkForDuplicateClassEntry()">
									<option value="">Select Class</option>
									<option value="1th">1th</option>
									<option value="2th">2th</option>
									<option value="3th">3th</option>
									<option value="4th">4th</option>
									<option value="5th">5th</option>
									<option value="6th">6th</option>
									<option value="7th">7th</option>
									<option value="8th">8th</option>
									<option value="9th">9th</option>
									<option value="10th">10th</option>
									<option value="11th">11th</option>
									<option value="12th">12th</option>
								</select>
						
							<!-- <select class="form-control input-md" id="clas"  name="clas" class="form-control" onchange="checkForDuplicateClassEntry()" placeholder="Enter class Name">
									</select> -->
						</div>
					</div>


				  <!--   <div class="col-md-2" align="right">
						<label class="control-label">Class Room No.:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='classRoom' name="classRoom" class="form-control"  placeholder="class Room">
						</div>
					</div> -->
				</div>
			</div>

		
			
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <button class="ui positive button" name="btn" value="Save" onclick="ClassInfo(); return false;">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Edit" id="listBtn"  onclick="editClassName()">Edit</button>
                                    <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Edit" id="listBtn"  onclick="deleteClassName()">Delete</button>
                                   
                                    </div>
                                </div>
                            </div>

		</form>
	</div>
	<!-- ---	For division entry	---- -->
 		<div id="twoDates" class="tab-pane ">
		
			<form class="form-horizontal" name="divInfo">
			
			<div class="row form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
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

							<input list="classId" id="fk_class_id" class="form-control">
							<datalist id="classId">
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
					<div class="form-group">
					<div class="col-md-2" align="right">
						<label class="control-label">Division Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input type="text" id='division' name="division" class="form-control"  placeholder="division" >
						</div>
					</div>
					</div>
					</div>
			<div class="row form-group">
					<div class="col-md-2 col-sm-offset-1"  align="right">
						<label class="control-label">Class Room No:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-pencil"></i>
							</span>
							 <input type="text" id='classRoom' name="classRoom" class="form-control"  placeholder="class Room" onchange="checkForDuplicateDivisionEntry()">
						</div>
					</div>
					</div>
					
				
		
                 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" onclick="DivisionInfoValidation()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Edit" id="listBtn"  onclick="editDivision()">Edit</button>
                                   <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Delete" id="listBtn"  onclick="deleteDivision()">Delete</button>
                                   
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