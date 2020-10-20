<%@page import="com.srb.hibernate.StudentInfoHibernate"%>
<%@page import="com.srb.dao.StudentInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

		 <link rel="stylesheet" href="/srb/staticContent/CSS/jquery-ui.min.css">
	     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.min.css">
	     <!-- <link rel="stylesheet" href="/AgriSoft/staticContent/css/ui.jqgrid.css"> -->
	     
	     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
	     <link rel="stylesheet" href="/srb/staticContent/CSS/ui.jqgrid.css">
		<!--  <script type="text/javascript" src="/srb/staticContent/JS/jquery.min.js"></script> -->
	    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.min.js"></script>
	    <script type="text/javascript" src="/srb/staticContent/JS/jquery-ui.js"></script>
	    <script type="text/javascript" src="/srb/staticContent/JS/jqueryUi.js"></script>
	    <script type="text/javascript" src="/srb/staticContent/JS/jquery.jqgrid.min.js"></script>
	   


        <script src="/srb/staticContent/JS/Student.js"></script>
        <script type="text/javascript">
	 function backk() {
			 window.location = "StudentHealthCheckup.jsp";
	}
	 function studentList() {
		 window.location = "listForStudent.jsp";
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
		

		<script type="text/javascript">
			function cancelAdmission()
			{
				window.location="cancellationOFStudentAdmission.jsp";
			}
			
		</script>
		
		<script type="text/javascript">
			function documentUpload()
			{
				window.location="studentDocumentUpload.jsp";
			}
			
		</script>
		
		<script type="text/javascript">
			function studentCheckUpList()
			{
				window.location = "StudentHealthCheckup.jsp";
			}

		</script>
		
		


</head>
<body>


<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"></div>
                        <div class="header-title">
                            <h1>Edit Student Health Checkup</h1>
                            <small>Health Checkup</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
            
                <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="studentCheckUpList()" accesskey="t""> <i class="fa fa-list"></i>Add Student Health Checkup </a>
                </div>
            </div>
            </div> 

            
     <div class="panel-body panel-form">
         <div class="row">

		<form class="form-horizontal" name="sdtv">

			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
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
	
								<input list="clas" id="fk_class_id1" class="form-control" onchange="getDivisionNameByClassName()">
								<datalist id="clas">

						<%
							for (int i = 0; i < sList.size(); i++) {
								ClassInfoHibernate sup = (ClassInfoHibernate) sList.get(i);
						%>

						<option data-value="<%=sup.getPkClassId()%>"
							value="<%=sup.getClas() %>">
							<%
								}
							%>
						
					</datalist>
				</div>
			</div>

			        <div class="col-sm-2" align="right">
						<label class="control-label">Division:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
			
					
							<input list="division" id="fk_division_id" class="form-control" onchange="geteditGridOfStudentForCheckUp()">
							<datalist id="division"></datalist>
							
							  
					   
						</div>
					</div>
				</div>
			</div>
			
		  <div class="table-responsive	row col-md-offset-1" style="margin-left: 325px;">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
		  </div>
		  

			

			  <div class="form-group row">
                      <div class="col-md-offset-4 col-md-4 btn-center" style="padding-top: 15px;">
                          <div class="ui buttons">
                          <input type="button" class="ui positive button" name="btn" value="Update" onclick="editStudentCheckUpInfo()" >Update</button>
                             
                              <div class="or"></div>
                               <button type="reset" class="ui button" onclick="location.reload()">Reset</button>
                               <div class="or"></div>
                              <input type="button" class="ui positive button" name="btn" value="Back" onclick="backk()" >Back</button> 
                              
                               </div>
                      </div>
                  </div>

</form>

</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 