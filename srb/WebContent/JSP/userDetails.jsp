<%@page import="com.srb.helper.UserDetailsHelper"%>
<%@page import="com.srb.dao.userDetailsDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<% boolean isHome=false;%>

<%@include file="commons/header.jsp"%>

<%-- <%
         String name = "";
		if (session != null) {
			
			if (session.getAttribute("user") != null) {
			    name = (String) session.getAttribute("user");
				out.print("Hello, " + name );
				
				
			} else {
				
				response.sendRedirect("/srb/JSP/login.jsp");
			     out.println("Please Login ");
			}
		}
	%>
	<%
	
	   HibernateUtility hbu=HibernateUtility.getInstance();
	   Session session1=hbu.getHibernateSession();
	   
	   org.hibernate.Query query = session1.createQuery("from UserDetailsBean where userName =:name");
	   query.setParameter("name", name);
	   UserDetailsBean userDetail = (UserDetailsBean) query.uniqueResult();
	   String type = userDetail.getTypeId();
	%>
	<%
    
      if(type.equals("admin")){
    	  
     %> --%>
<script type="text/javascript">
	    function ChooseContact(){
	        <%
	        UserDetailsHelper usrHelper = new UserDetailsHelper();
		   		List usrList = usrHelper.getAlluserName();
			%>
	
			<%
				for(int i=0;i<usrList.size();i++){
					UserDetailsBean usr = (UserDetailsBean)usrList.get(i);
    		%>

    		var value ="<%=usr.getUserName()%>";
				if(document.getElementById("userName").value == value)
					{
					    document.getElementById("btn").disabled = true;	
						alert("User Name Not Available..Plz Try Another Name!!!");
				        location.reload();
					}
   			<%
				}
    		%>
		}
</script>

<meta charset="utf-8">
<head>

<!-- <script type="text/javascript" src="/srb/staticContent/js/userDetails.js"></script> -->
	<script type="text/javascript">
	function openLogin(){
		 window.location = '/srb/jsp/login.jsp';
	}
	</script>
	</head>
<html>
<head>

		<script type="text/javascript" src="/srb/staticContent/js/jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" href="/srb/staticContent/css/jquery-ui.min.css">
		<link rel="stylesheet" href="/srb/staticContent/css/ui.jqgrid.css">
		<script type="text/javascript" src="/srb/staticContent/js/jquery.min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jquery-ui-min.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jquery-ui.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jqueryUi.js"></script>
		<script type="text/javascript" src="/srb/staticContent/js/jquery.jqgrid.min.js"></script>
		 <script type="text/javascript" src="/srb/staticContent/JS/cashbook.js"></script>
  <script src="/srb/staticContent/JS/Student.js"></script>
   <script src="/srb/staticContent/JS/certificate.js"></script>
   <script src="/srb/staticContent/JS/libraryManagement.js"></script>
      
        <!--  <script src="/srb/staticContent/js/employeeDetails.js"></script> -->
         <script src="/srb/staticContent/JS/Teacher.js"></script>
         <script src="/srb/staticContent/JS/userDetails.js"></script>

             <script type="text/javascript">
          		 function employeeLeaveList()
          		 {
          		 	window.location = "TransportationStudentLIst.jsp";
          		 }
          		 function editTransportation() {
          			window.location = "editTransportationDetails.jsp";
				 } 
          		</script> 
          		
          		<script type="text/javascript">
						function Back()
						{

							window.location = "EmployeeDetails.jsp";
							
						}

          		</script>
          		
        <script>
				function lettersonly(input) {
		
					var regex = /[^a-z ]/gi;
					input.value = input.value.replace(regex, "");
		
				}
		
				/* function numbersonly(input) {
					var regex = /[^0-9 .]/gi;
					input.value = input.value.replace(regex, "");
				} */
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
		    if (charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
		        return false;
		    }
		    return true;
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
                            <h1>User Details</h1>
                            <small>User Details</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
    <!--  form area -->
    <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
               <!--  <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="classList1()" accesskey="t""> <i class="fa fa-list"></i>Class List </a>  
                </div>
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="divList()" accesskey="t""> <i class="fa fa-list"></i>Division List </a>  
                </div> -->
                <!-- <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="employeeLeaveList()"  accesskey="t""> <i class="fa fa-list"></i>  Student Transportation List </a>  
                </div> -->
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
		
			<form class="form-horizontal" method="post" enctype="multipart/form-data" name="usd">
			
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">First Name:</label><sup>*</sup>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>

							<%
							userDetailsDao cdd11 = new userDetailsDao();
           						List cList11 =cdd11.getAllUsers();
							
							%>
							<input list="firstName_drop" id="firstName"  class="form-control">
				<datalist id="firstName_drop">
							<%
					           for(int i=0;i<cList11.size();i++){
					        	   UserDetailsBean cat11=(UserDetailsBean)cList11.get(i);
							%>
		
							<option data-value="<%=cat11.getUsrId()%>" value="<%=cat11.getFirstName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
						</div>
					</div>


					<div class="col-sm-2" align="right">
						<label class="control-label">Last Name:</label><sup>*</sup>
					</div>
					<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							userDetailsDao cdd1 = new userDetailsDao();
           						List cList1 =cdd1.getAllUsers();
							
							%>
							<input list="lastName_drop" id="lastName"  class="form-control">
				<datalist id="lastName_drop">
							<%
					           for(int i=0;i<cList1.size();i++){
					        	   UserDetailsBean cat1=(UserDetailsBean)cList1.get(i);
							%>
		
							<option data-value="<%=cat1.getUsrId()%>" value="<%=cat1.getLastName()%>">
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
 					
 					<label class="col-md-2 col-sm-offset-1 control-label"  align="right">Contact No.<sup>*</sup>
 					</label> 
           			<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
              				<input id="contactNo" name="contactNo" maxlength="10" placeholder="10 digit Contact No." class="form-control input-md" type="text">
            			</div>
            		</div> 
								
						
						<div class="col-sm-2" align="right">
							<label class="control-label">Address:<sup>*</sup></label>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-map-marker"></i>
							</span>
              				<input id="address1" name="address1 " placeholder="Address Line 1" class="form-control input-md" type="text" >
            				</div>
						</div>
 				
				</div>
			</div>
			
				<div class="row">
					<div class="form-group">
					
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">User Name:<sup>*</sup></label>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
								</span>
	              				<input id="userName" name="userName " placeholder="User Name" class="form-control input-md" type="text" autofocus onchange="return ChooseContact();" >
	            			</div>
						</div>

				<div class="col-sm-2" align="right">
							<label class="control-label">Password:<sup>*</sup></label>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-lock"></i>.
								</span>
              					<input id="password" name="password" placeholder="Password" class="form-control input-md" type="text" >
            				</div>
            			</div>

						
					</div>
				</div>
				
				
				<div class="row">
					<div class="form-group">
					
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Re-Password:<sup>*</sup></label>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-lock"></i>.
								</span>
              					<input id="password2" name="password2" placeholder="Re-Enter Password" class="form-control input-md" type="text" autofocus  onchange="validatePassword()">
            				</div>
            			</div>

				<div class="col-sm-2" align="right">
							<label class="control-label">City:<sup>*</sup></label>
						</div>
						<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
              			<input id="city" name="city " placeholder="City" class="form-control input-md" type="text" >
            		</div>
				</div>

						
					</div>
				</div>
				
				<div class="row">
					<div class="form-group">
					
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">PAN No.<sup>*</sup></label>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
								No.
								</span>
              					<input id="pan" name="pan" placeholder="PAN Number" class="form-control input-md" type="text" required="">
            				</div>
            			</div>

						<div class="col-sm-2" align="right">
							<label class="control-label">Type:<sup>*</sup></label>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
								</span>
              			 	<select class="form-control" id="typeId">
										<option value="selected">--Select Type--</option>
										<option value="admin">Admin</option>
										<option value="finance">Account</option>
										<!-- <option value="principal">Principal</option> -->
										<option value="teacher">Teacher</option>
										<option value="library">Library</option>
							</select>
            		</div>
				</div>

						
					</div>
				</div>
				</div>
				
				


			<!-- <div class="container" align="center">
				<input type="button"  class="btn btn-success btn-lg btnn " value="Submit" name="btn" onclick="validationofTransportionDetails()"> 
				<input type="button"  class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
				<input type="button"  value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="employeeLeaveList()">
				
				
				
				
			</div> -->
			
			<div class="form-group row">
                      <div class="col-md-offset-4 col-md-4 btn-center">
                          <div class="ui buttons">
                         	 <input type="button" class="ui positive button" name="btn" onclick="regUserDetails()" value="Save"/>
                             
                              <div class="or"></div>
                               	<button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                               		<!-- <div class="or"></div>
                               	<button class="ui positive button"  type="button" value="Edit" id="listBtn" onclick="editTransportation()">Edit</button> -->
                               	
                              </div>
                              
                              
                      </div>
                     </div>
		</form>
	
	</div>
</body>
</html><%@include file="commons/newFooter.jsp" %> 