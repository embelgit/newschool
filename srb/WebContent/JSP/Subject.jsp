<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<html>
<head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/srb/WebContent/StaticContent/CSS/css.css" rel="stylesheet"> -->
<script src="/srb/staticContent/JS/Subject.js"></script>
<script type="text/javascript">
function subjectList(){
	 window.location = "listForSubject.jsp";
}
</script>
<script type="text/javascript">
function checkForDuplicateSubjectEntry(){
          			<%
          			SubjectInfoDao dao2 = new SubjectInfoDao();
          			List list = dao2.getAllMainSubject();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				SubjectInfoHibernate bean = (SubjectInfoHibernate)list.get(z);
          			%>
          			var subjectName = "<%=bean.getSubject()%>";
          			var sName=document.getElementById("subject").value;
          			
          			var subjectName1=subjectName.toLowerCase();
          			var sName1=sName.toLowerCase();
          			if(subjectName1 == sName1 ){
          				alert("subject already exist...Duplicate Not allowed");
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
</script>

<script type="text/javascript">
	function syllabusDetails()
	{
		window.location="subjectSyllabusEntry.jsp";
	}
	
	function edit()
	{
		window.location="subjectedit.jsp";
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
                            <h1>Subject Details</h1>
                            <small>Add Subject</small> 
                        </div>
                    </div>
                </section>
        
                                        

                    <!-- content -->
                    <div class="row">
                    
                        <div class="col-sm-12">
        <div class="panel panel-default thumbnail">
 
            <div class="panel-heading no-print">
                <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="subjectList()"  accesskey="t""> <i class="fa fa-list"></i>Subject List </a>  
                </div>
                
                  <div class="btn-group"> 
                    <a class="btn btn-primary"  onclick="syllabusDetails()"  accesskey="t""> <i class="fa fa-book"></i>Syllabus Details </a>  
                </div>
                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	
          <form class="form-horizontal" name="subjectFormName">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-2" align="right">
						<label class="control-label"> Subject Name:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-folder-open"></i>
							</span> 
							<input type="text" id='subject' name="subject" class="form-control" placeholder="Enter subject Name" autofocus="autofocus" onchange="checkForDuplicateSubjectEntry()"/>
						 </div>
					  </div>
				</div>
			</div>
	
	
			  	<div class="form-group row">
                    <div class="col-md-offset-4 col-md-4 btn-center">
                        <div class="ui buttons">
                        <input type="button" class="ui positive button" name="btn" value="Save" onclick="SubjectInfo()">Save</button>
                           
                            <div class="or"></div>
                             <button type="reset" class="ui button">Reset</button>
                             <div class="or"></div>
                             <input type="button" class="ui positive button" name="btn" value="Edit" onclick="edit()">Edit</button>
                       
                             </div>
                    </div>
   				</div>
				</form>


</div>
</div>

</body>
</html><%@include file="commons/newFooter.jsp" %> 