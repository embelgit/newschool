<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%-- <% boolean isHome=false;%>
<%@include file="commons/header.jsp"%> --%>
<html>
<head>

<script src="/srb/staticContent/JS/notice.js"></script>

<script type="text/javascript">
function editnotice(){
	window.location = "Editnotice.jsp";
}
</script>
<script>
function listnot(){
	window.location = "noticelist.jsp";
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
                            <h1>Notice Details</h1>
                            <small>Details</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
             <!--    <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>Class List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="divList()" accesskey="t""> <i class="fa fa-list"></i>Division List </a>  
                </div> -->
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
	
			
			<form class="form-horizontal" method="post"  name="notice">
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">Class Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-pencil"></i>
							</span>

							<%
								ClassInfoDao sdd = new ClassInfoDao();
								List sList = sdd.getAllMainClass();
							%>

							<input list="classes" id="fk_class_id1" class="form-control" autofocus="autofocus" onchange="getDivisionNameByClassName()">
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


					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Division Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span>

							<%-- <%
								DivisionInfoDao sdd1 = new DivisionInfoDao();
								List sList2 = sdd1.getAllMainDivision();
							     %>

							<input list="division" id="fk_division_id" class="form-control" onblur="getStudentDetails()">
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
							
							<input list="division" id="fk_division_id" class="form-control" onchange="getGridOfStudentForCheckUp()">
							<datalist id="division"></datalist>
							
							
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
				<div class="col-sm-2" align="right">
				<label class="control-label">Academic Year:<sup>*</sup></label>
					</div>
					<%
					  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy");
					  			String todayDate = simpleDateFormat.format(new Date());
					  	%>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span> 
							<input type="text" id='academicYear' list="academicYear1" value="<%= todayDate%>" name="academicYear" class="form-control">
                                   <!-- <datalist id="academicYear1">
                                     <option data-value="2011-2015" value="2017-2018">
                                     <option data-value="2016-2020" value="2018-2019">
                                     <option data-value="2016-2020" value="2019-2020">
                                     <option data-value="2015-2016" value="2020-2021">
                                     <option data-value="2006-2010" value="2021-2022">
                                    </datalist> --> 
						</div>
					</div>
				
				
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Notice Date:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
							 <input type="date" id='noticeDate' name="noticeDate" class="form-control"  placeholder="Notice Date" >
						</div>
					</div>
				</div>
				</div>
				
			
			
			<div class="row form-group">
				</div>
				<div class="row form-group">
					<div class="col-sm-2" align="right">
						<label class="control-label">Enter Notice Details:</label>
					</div>
					<div class="col-sm-6">
						<textarea id="taskInText" rows="07" cols="70"></textarea>
					</div>
				</div>
				
			 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Save" onclick="NoticeValidation()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                              <div class="or"></div>
                                    <input type="button" class="ui positive button" name="btn" value="List" onclick="listnot()">List</button> 
                              <div class="or"></div>
                                    <input type="button" class="ui positive button" name="btn" value="Edit" onclick="editnotice()">Edit</button> 
                                       
                                      
                                        </div>
                                </div>
                            </div>
			
			</form>
				

</div>

</html>				
		<%@include file="commons/newFooter.jsp" %> 			
	        