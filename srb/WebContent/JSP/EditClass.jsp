
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
function Back()
{
	window.location="Class.jsp";
}
</script>

</head>
<body>

	<div class="content-wrapper" style="min-height: 1134px;">
	<section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><i class="pe-7s-world"></i></div>
                        <div class="header-title">
                            <h1>Edit Class Details</h1>
                            <small>Class Details</small> 
                        </div>
                    </div>
                </section>

		<!-- <div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Edit Class Name</h2>
			</div>
		</div> -->
		<!-- <div class="row">
			<div class="form-group" align="right">
				<div class="col-sm-offset-6 col-md-5 control-label">
					<div id="date">
						<label id="demo"></label>
						<script>
							   var date = new Date();
							   document.getElementById("demo").innerHTML = date.toDateString();
							</script>
					</div>
				</div>
			</div> -->
		<!-- </div>
		     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div> -->
    
    <!-- content -->
    <div class="row">
    
    <!--  form area -->
    <div class="col-sm-12">    
    <div class="panel panel-default thumbnail">
    
    
    <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="Back()"  accesskey="t""> <i class="fa fa-list"></i>Add Class Details </a>  
                </div>
   </div>
    
		<form class="form-horizontal">
			<div class="row form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Select Class Name:</label>
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

							<input list="classId" id="fk_class_id" class="form-control" placeholder="Select  class Name" >
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
			
				
					<div class="col-md-2" align="right">
						<label class="control-label">Enter New Class Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							No
							</span>
				<!-- 			 <input type="text" id='className' name="className" class="form-control"  placeholder="Enter New class Name">
				 -->		
						<select name="className" class="form-control selectpicker" id='className' onchange="checkForDuplicateClassEntry()">
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
						
						
						</div>
					</div>
<%-- 					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

							<%
							DivisionInfoDao divDAO = new DivisionInfoDao();
								List divList = divDAO.getAllMainDivision();
							%>

							<input list="divId" id="fk_div_id" class="form-control" onchange="getClassRoomDetails()" >
							<datalist id="divId">
							 <%
 	                            for (int i = 0; i < divList.size(); i++) {
 	                            	DivisionInfoHibernate divBean = (DivisionInfoHibernate) divList.get(i);
                             %>

							<option data-value="<%=divBean.getPkDivisionId()%>"
								value="<%=divBean.getDivision()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div> --%>
					</div>
					<!-- <div class="row form-group">
					<div class="col-md-2  col-sm-offset-1"  align="right">
						<label class="control-label">Enter Class Room No.:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							No
							</span>
							 <input type="text" id='classRoom' name="classRoom" class="form-control"  placeholder="class Room">
						</div>
					</div>
					</div> -->
				
			
		<!-- 	<div class="container" align="center">
				<input type="button" class="btn btn-success btn-lg" value="Update" style=" height: 65px; width: 180; font-size: 25"
					onclick="updateClassName()"> 
				<input type="reset" class="btn btn-danger btn-lg" value="Cancel" style=" height: 65px; width: 180; font-size: 25" onclick="">
				 <input style=" height: 65px; width: 180; font-size: 25" type="button" value="Back" class="btn btn-primary" onclick="Back()" />
				
			</div> -->
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Update" onclick="updateClassName()">Update</button>
                                       
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
</body>
<%@include file="commons/newFooter.jsp" %>