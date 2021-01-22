<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <script src="/srb/staticContent/JS/School.js"></script>
<script type="text/javascript">

	function admissionList(){
		 window.location = "listforadmission.jsp";
	}
	function editAdmissionEnquiryValidation(){
		window.location = "editadmissionenquiry.jsp"
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
                            <h1>Admission Enquiry</h1>
                            <small>Admission</small> 
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
                    <a class="btn btn-primary" onclick="admissionList()"  accesskey="t""> <i class="fa fa-list"></i>  Admission Enquiry List </a>  
                </div>
			
	      </div>	
            </div> 

 

		<form class="form-horizontal" name="schoolFormName">
					<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
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

							<input list="classes" id="fk_class_id1" class="form-control" >
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


					<!-- <div class="col-sm-2" align="right">
						<label class="control-label">E-mail Id:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-envelope"></i>
							</span> 
							<input type="text" id='email' name="email" class="form-control" placeholder="Enter Email Id" />
						</div>
					</div> -->
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Student Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='studentName' name="studentName" class="form-control" placeholder="Enter student Name" onkeypress="return isAlphabetsWithSpace(event)"/>
						</div>
					</div>
				</div>
			</div>
		<div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">E-mail Id:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-envelope"></i>
							</span> 
							<input type="text" id='email' name="email" class="form-control" placeholder="Enter Email Id" />
						</div>
					</div>
					<!-- <div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Student Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='studentName' name="studentName" class="form-control" placeholder="Enter student Name" />
						</div>
					</div> -->

					<div class="col-sm-2" align="right">
						<label class="control-label">Parent Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-user"></i>
							</span>
                            <input type="text" id='parentName' name="parentName" class="form-control"  placeholder="Enter Parent Name" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">City/Village<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<input type="text" id='city' name="city" class="form-control" placeholder="Enter city" onkeypress="return isAlphabetsWithSpace(event)" />
						</div>
					</div>

						<div class="col-sm-2" align="right">
						<label class="control-label">Contact Number:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon  glyphicon-phone"></i>
							</span>
							 <input type="text" id='contactNumber' name="contactNumber" class="form-control" placeholder="Contact Number" maxlength="10" onkeypress="return isNumber(event)" />
						</div>
					</div>
				</div>
			</div>
		    
			
			 <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Address:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<input type="text" id='address' name="address" class="form-control" placeholder="Enter address" />
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Previous School Name:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span>
						    <input type="text" id='preSchoolN' name="preSchoolN" class="form-control" placeholder="Enter Previous School Name" onkeypress="return isAlphabetsWithSpace(event)">
						</div>
					</div>
				</div>
			</div>
			
			 <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Comments:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-hand-right"> </i>
							</span>
							<input type="text" id='comments' name="comments" class="form-control" placeholder="Enter Comment" />
						</div>
					</div>
					<div class="col-sm-2" align="right">
						<label class="control-label">Alternate Contact Number:<sup></sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon  glyphicon-phone"></i>
							</span>
							 <input type="text" id='alternateContactNumber' name="alternateContactNumber" class="form-control" placeholder="Alternate Contact Number" maxlength="10" onkeypress="return isNumber(event)" />
						</div>
					</div>
					</div>
					</div>
					
					
          <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button"  class="ui positive button" name="btn" value="Save" onclick="addAdmissionEnquiryValidation()" style="width: 95px;">
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                   	<div class="or"></div>
                                    <input type="button"  class="ui positive button" name="btn" value="Edit" onclick="editAdmissionEnquiryValidation()" style="width: 95px;">
                                   
                                         </div>
                                </div>
                            </div>
		</form>		
</div>
</body>
</html>				
					
	<%@include file="commons/newFooter.jsp" %>         
			