.<%@page import="com.srb.hibernate.TeacherInfoHibernate"%>
<%@page import="com.srb.dao.TeacherInfoDao"%>
<%@page import="com.srb.dao.AdmissionEnquiryDAO" %>
<%@page import="com.srb.hibernate.AdmissionEnquiryHibernate"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <script src="/srb/staticContent/JS/Teacher.js"></script>
   <script src="/srb/staticContent/JS/School.js"></script>
	<script type="text/javascript">
	function Back(){
		 window.location = "admission_enquiry_form.jsp";
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
                            <h1>Delete Admission Enquiry</h1>
                            <small>Delete Admission Enquiry</small> 
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
                    <a class="btn btn-primary" onclick="Back()"  accesskey="t""> <i class="fa fa-list"></i>Add Addmission Enquiry </a>  
                </div>
            </div> 

            <div class="panel-body panel-form class-list">
                <div class="row">
                	<form class="form-horizontal " name ="editSchool">
				<div class="row">
	       			 <div class="row form-group">
    	     	
           				 <label class="col-md-2 control-label col-sm-offset-1">Select Student Name:</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
							
							<%
							AdmissionEnquiryDAO sd = new AdmissionEnquiryDAO();
								List sListt = sd.getAllStudent();
							%>

							<input list="student" id="stuid" class="form-control" onchange="getstudentDetails()">
							<datalist id="student">
							 <%
 	                            for (int i = 0; i < sListt.size(); i++) {
 	                            	AdmissionEnquiryHibernate sp = (AdmissionEnquiryHibernate) sListt.get(i);
                             %>

							<option data-value="<%=sp.getPkAdmissionEnquiryId()%>"
								value="<%=sp.getStudentName()%>">
								<%
									}
								%>
							
							</datalist> 
					</div>
           		</div>	
           		</div>
           		</div>
           		
       
			</div>
			
			<div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <button class="ui positive button" name="btn" value="Delete" onclick="DeleteaddInfo()">Delete</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button" value="Clear" >Reset</button>
                                         
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
			