
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/srb/staticContent/JS/Subject.js"></script>
<script src="/srb/staticContent/JS/Division.js"></script>
<script type="text/javascript">
function Back()
{
	window.location="Subject.jsp";
}
</script>

</head>
<body>

	<div class="content-wrapper" style="min-height: 1134px;">
	<section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><i class="pe-7s-world"></i></div>
                        <div class="header-title">
                            <h1>Edit Subject Edit</h1>
                            <small>Subject Edit</small> 
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
                    <a class="btn btn-primary" onclick="Back()"  accesskey="t""> <i class="fa fa-list"></i>Add Subject </a>  
                </div>
   </div>
    
		<form class="form-horizontal">
			<div class="row form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Select Subject Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"></i>
							</span>

							<%
							SubjectInfoDao sdd = new SubjectInfoDao();
								List sList = sdd.getAllsubject();
							%>

							<input list="classId" id="fk_class_id" class="form-control" placeholder="Select  class Name" >
							<datalist id="classId">
							 <%
 	                            for (int i = 0; i < sList.size(); i++) {
 	                            	SubjectInfoHibernate sup = (SubjectInfoHibernate) sList.get(i);
                             %>

							<option data-value="<%=sup.getPkSubjectId()%>"
								value="<%=sup.getSubject()%>">
								<%
									}
								%>
							
							</datalist>
						</div>
					</div>
			
				
					<div class="col-md-2" align="right">
						<label class="control-label">Enter New Subject Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							No
							</span>
							 <input type="text" id='subname' name="subname" class="form-control"  placeholder="Enter New Subject Name">
						
						</div>
					</div>
<br><br>
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Update" onclick="updatesubName()">Update</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Back" id="listBtn"  onclick="Back()">Back</button>
                                    </div>
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