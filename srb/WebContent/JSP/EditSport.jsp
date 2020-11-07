<%@page import="com.srb.hibernate.SportInfoHibernate"%>
<%@page import="com.srb.dao.SportInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <script src="/srb/staticContent/JS/Sport.js"></script>
<script type="text/javascript">

	
	function editSport(){
		window.location = "Sport.jsp"
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
                            <h1>Edit Sport Details</h1>
                            <small>Edit Sports</small> 
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
                    <a class="btn btn-primary" onclick="editSport()" accesskey="t""> <i class="fa fa-list"></i>Add Sport Details</a>  
                </div> 
                </div>
               
            <div class="panel-body panel-form">
                <div class="row">
	
	<form class="form-horizontal" name="schoolFormName">
		
		
		<div class="row">
	       			 <div class="row form-group">
    	     	
           				 <label class="col-md-2 control-label col-sm-offset-1">Select Activity Name:</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
							
							 <%
							SportInfoDao sdd3 = new SportInfoDao();
							List sList4 = sdd3.getAllSport();
							 %>
							 <input list="CreateactivityNameList" id="PkSportId" class="form-control" onchange="getSportDetails()">
								<datalist id="CreateactivityNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
										SportInfoHibernate sup = (SportInfoHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkSportId()%>"
									value="<%=sup.getCreateactivity()%>  ">
									<%
										}
									%>
						</datalist> 
					</div>
           		</div>	
           		</div>
           		</div>
		
		
		<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Create Activity Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-home"></i>
							</span> 
							<input type="text" id='activityName2' name="activityName2" class="form-control" placeholder="Enter Acivity Name" />
							</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Activity Details:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
                            <input type="text" id='Activitydetails' name="Activitydetails" class="form-control"  placeholder="Enter Activity Details" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Organize By:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<input type="text" id='Organizeby' name="Organizeby" class="form-control" placeholder="Enter Organize By " />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Other Details :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='otherdetails' name="otherdetails" class="form-control" placeholder="Enter Other Details" />
						</div>
					</div>
				</div>
			</div>
			<br>
			
			     <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" value="Update" onclick="updateSportInfo()">
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
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
			