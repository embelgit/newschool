
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

	<div class="container-fluid">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Edit Division</h2>
			</div>
		</div>
		<div class="row">
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
			</div>
		</div>
		     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
		<form class="form-horizontal">
			<div class="row form-group">
					<div class="col-md-2 col-sm-offset-2" align="right">
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

							<input list="classId" id="fk_class_id" class="form-control" onchange="getDivisionNameByClassNameEditDivision()">
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
						<label class="control-label">Select Division Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

						<%-- 	<%
							DivisionInfoDao divDAO = new DivisionInfoDao();
								List divList = divDAO.getAllMainDivision();
							%>

							<input list="divId" id="fk_div_id" class="form-control" onchange="getClassRoomDetails()">
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
							
							</datalist> --%>
							
							
							
							<input list="divId" id="fk_div_id" class="form-control" onchange="getClassRoomDetails()">
							<datalist id="divId"></datalist>
							
							
						</div>
					</div>
					</div>
					<div class="row form-group">
					<div class="col-md-2  col-sm-offset-2"  align="right">
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
					</div>
				
			
		<!-- 	<div class="container" align="center">
				<input type="button" class="btn btn-success btn-lg" value="Update" style=" height: 65px; width: 180; font-size: 25"
					onclick="updateClassRoomNumber()"> 
				<input type="reset" class="btn btn-danger btn-lg" value="Cancel" style=" height: 65px; width: 180; font-size: 25" onclick="">
				 <input style=" height: 65px; width: 180; font-size: 25" type="button" value="Back" class="btn btn-primary" onclick="Back()" />
				
			</div> -->
			<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Update" onclick="updateClassRoomNumber()">Update</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Back" id="listBtn"   onclick="Back()">Back</button>
                                    </div>
                                </div>
                            </div>
		</form>
	</div>
</body>
<%@include file="commons/newFooter.jsp" %>