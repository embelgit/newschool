.<%@page import="com.srb.hibernate.SchoolInfoHibernate"%>
<%@page import="com.srb.dao.SchoolInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <script src="/srb/staticContent/JS/School.js"></script>
	<script type="text/javascript">
	function Back(){
	window.location = "School.jsp";
	}
	</script>
</head>
<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><i class="pe-7s-world"></i></div>
                        <div class="header-title">
                            <h1>Edit School Details</h1>
                            <small>Add Class</small> 
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
                    <a class="btn btn-primary" onclick="Back()"  accesskey="t""> <i class="fa fa-list"></i>Add School </a>  
                </div>
            </div> 

            <div class="panel-body panel-form class-list">
                <div class="row">
                	<form class="form-horizontal " name ="editSchool">
				<div class="row">
	       			 <div class="row form-group">
    	     	
           				 <label class="col-md-2 control-label col-sm-offset-1">Select School Name:</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
							
							 <%
							 SchoolInfoDao eedd = new SchoolInfoDao();
           						List mList =eedd.getAllSchoolName();
							
							%>
						<input list="schoolName_drop" id="schoolName"  class="form-control" onchange="getSchoolDetails()">
				<datalist id="schoolName_drop">
							
							<%
					           for(int i=0;i<mList.size();i++){
					        	   SchoolInfoHibernate detailsBean =(SchoolInfoHibernate)mList.get(i);
							%>
		
						<option data-value="<%=detailsBean.getPkSchoolId()%>" ><%=detailsBean.getSchoolName()%></option>
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
						<label class="control-label">School Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<input type="text" id='schoolName2' name="schoolName" class="form-control" placeholder="Enter School Name" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Sanstha Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<input type="text" id='sansthaName' name="sansthaName" class="form-control" placeholder="Enter Sanstha Name" />
						</div>
					</div>
				</div>
			</div>
           		
           		
           		
           		<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">School Registrations Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='schoolRegNumber' name="schoolRegNumber" class="form-control" placeholder="Enter School Registrations Number" />
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">City/Village:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-user"></i>
							</span>
                            <input type="text" id='city' name="city" class="form-control"  placeholder="Enter city" />
						</div>
					</div>
					
					
				</div>
			</div>
			
			
			
			
           		<div class="row">
           		 <div class="row form-group">

					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Address:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"> </i>
							</span> 
							<input type="text" id='address' name="address" class="form-control" placeholder="Enter address" />
						</div>
						</div>
						
					<div class="col-sm-2" align="right">
						<label class="control-label">Taluka:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"> </i>
							</span>
							<input type="text" id='tq' name="tq" class="form-control" placeholder="Enter tq" />
						</div>
					</div>
						
					
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group">


					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">District:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='district' name="district" class="form-control" placeholder="Enter district" />
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">State:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='state' name="state" class="form-control" placeholder="Enter state" />
						</div>
					</div>
					
				</div>
			</div>
			
			
			
			
			 <div class="row">
				<div class="form-group">


					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Pincode:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							<input type="text" id='pinCode' name="pinCode" class="form-control" placeholder="pinCode" />
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Institute Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='instituteName' name="instituteName" class="form-control" placeholder="Enter institute Name" />
						</div>
					</div>
					
				</div>
			</div>
			
			
			
			
			
			 <div class="row">
				<div class="form-group">


					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Contact Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-phone"></i>
							</span>
							 <input type="text" id='contactP' name="contactP" class="form-control" placeholder="contact Number" />
						</div>
					</div>
					
				<div class="col-sm-2" align="right">
						<label class="control-label">School UDISE Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-home"> </i>
							</span> 
							<input type="text" id='schoolUdiseNumber' name="schoolUdiseNumber" class="form-control" placeholder="Enter School UDISE Number" />
						</div>
					</div>
					
					
				</div>
			</div>
<!-- 		
		 <div class="row">
				<div class="form-group">

				</div>
			</div>
		 -->
			</div>
			
			<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <button class="ui positive button" name="btn" value="Save" onclick="updateSchoolInfo()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" value="Clear" >Reset</button>
                                         
                                          </div>
                                </div>
                            </div>
				
		</form>		
                
                </div>
                </div>
                </div>
<%-- 
<div class="container-fluid">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Edit School Details</h2>
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
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>

		<form class="form-horizontal " name ="editSchool">
		
	       			 <div class="row form-group">
    	     	
           				 <label class="col-md-2 control-label col-sm-offset-1">Select School Name</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
							
							 <%
							 SchoolInfoDao eedd = new SchoolInfoDao();
           						List mList =eedd.getAllSchoolName();
							
							%>
						<input list="schoolName_drop" id="schoolName"  class="form-control" onchange="getSchoolDetails()">
				<datalist id="schoolName_drop">
							
							<%
					           for(int i=0;i<mList.size();i++){
					        	   SchoolInfoHibernate detailsBean =(SchoolInfoHibernate)mList.get(i);
							%>
		
						<option data-value="<%=detailsBean.getPkSchoolId()%>" ><%=detailsBean.getSchoolName()%></option>
							<%
				      			}
				    		%>
						</datalist> 
					</div>
           		</div>	
           		</div>
           		
           		<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Sanstha Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<input type="text" id='sansthaName' name="sansthaName" class="form-control" placeholder="Enter Sanstha Name" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">School Registrations Number</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='schoolRegNumber' name="schoolRegNumber" class="form-control" placeholder="Enter School Registrations Number" />
						</div>
					</div>
				</div>
			</div>
           		
           		 <div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">City/Village:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-user"></i>
							</span>
                            <input type="text" id='city' name="city" class="form-control"  placeholder="Enter city" />
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">Address:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"> </i>
							</span> 
							<input type="text" id='address' name="address" class="form-control" placeholder="Enter address" />
						</div>
					</div>
				</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Taluka:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"> </i>
							</span>
							<input type="text" id='tq' name="tq" class="form-control" placeholder="Enter tq" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">District:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i	class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='district' name="district" class="form-control" placeholder="Enter district" />
						</div>
					</div>
				</div>
			</div>
			
			 <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">State:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='state' name="state" class="form-control" placeholder="Enter state" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Pincode:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-calendar"></i>
							</span>
							<input type="text" id='pinCode' name="pinCode" class="form-control" placeholder="pinCode" />
						</div>
					</div>
				</div>
			</div>
			
			 <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Institute Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='instituteName' name="instituteName" class="form-control" placeholder="Enter institute Name" />
						</div>
					</div>

					<div class="col-sm-2" align="right">
						<label class="control-label">Contact Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-phone"></i>
							</span>
							 <input type="text" id='contactP' name="contactP" class="form-control" placeholder="contact Number" />
						</div>
					</div>
				</div>
			</div>
		
		 <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">School UDISE Number:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-home"> </i>
							</span> 
							<input type="text" id='schoolUdiseNumber' name="schoolUdiseNumber" class="form-control" placeholder="Enter School UDISE Number" />
						</div>
					</div>
				</div>
			</div>
			<div class="row buttons_margin_top">
				<div align="center">
					<input type="button" style=" height: 65px; width: 180; font-size: 25"
						class="btn btn-lg btn-success btn-md button_hw button_margin_right"
						name="btn" value="Save" onclick="updateSchoolInfo()"/>
						 <input type="reset" style=" height: 65px; width: 180; font-size: 25"
						class="btn btn-lg btn-danger btn-md button_hw button_margin_right"
						 value="Clear" />
						 <input style=" height: 65px; width: 180; font-size: 25" type="button" value="Back" class="btn btn-primary" onclick="Back()" />
				</div>
			</div>
		</form>		
</div> --%>
</body>
</html>				
					
	<%@include file="commons/newFooter.jsp" %>         
			