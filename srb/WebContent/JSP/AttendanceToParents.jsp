<%@page import="com.srb.hibernate.DivisionInfoHibernate"%>
<%@page import="com.srb.dao.DivisionInfoDao"%>
<%@page import="com.srb.hibernate.ClassInfoHibernate"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%@page import="com.srb.dao.SubjectInfoDao"%>
<%@page import="com.srb.hibernate.SubjectInfoHibernate"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>
 <script type="text/javascript" src="/srb/staticContent/JS/schoolMeetings.js"></script>
<script type="text/javascript">
function AttendanaceToParentslist()
{
window.location="listForAttendanaceToParents.jsp";	
	
}

</script>
</head>
<title>Monthly Attendance To Parent</title>
<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/clipboard.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Monthly Attendance To Parent</h1>
                            <small>Monthly Attendance</small> 
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
	                    <a class="btn btn-primary"  onclick="AttendanaceToParentslist()" accesskey="t""> <i class="fa fa-list"></i>Parent's List </a>  
	                </div>
	                
            </div> 

            <div class="panel-body panel-form">
                <div class="row">
	

 		<form class="form-horizontal" name="Attendance">
 				<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Parent's Id:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='parentsId' name="parentsId" class="form-control" placeholder="ID" onkeypress="return isNumber(event)"/>
						</div>
					</div>
					
                   <div class="col-sm-2" align="right">
						<label class="control-label">Parent's Name:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='patentsName' name="patentsName" class="form-control" placeholder="Parent's Name" onkeypress="return isAlphabets(event)"/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
			    <div class="col-md-2 col-sm-offset-1" align="right">
					<label class="control-label" for="message">Date:<sup>*</sup></label>
			    </div>
		 	    <div class="col-md-3">
      			       <div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="date" id='date31' name="date31" class="form-control"  placeholder="select Date"> 
						</div>
			     </div>
			        <div class="col-sm-2" align="right">
						<label class="control-label">Subject:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='subject' name="subject" class="form-control" placeholder="Subject" onkeypress="return isAlphabets(event)"/>
						</div>
					</div>
		     </div>
		     </div>

		<div class="row">
		  <div class="form-group">
			<div class="col-md-2 col-sm-offset-1" align="right">
					<label class="control-label" for="message">Message:<sup>*</sup></label>
			</div>
		 	 <div class="col-md-5">
      			<textarea class="form-control" rows="07" id="message"></textarea>
			</div>
		    </div>
		</div>
		
		<div class="row">
				<div class="form-group">
			
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Attendance File:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
							<input id="taskfile" type="file" name="file" accept="" >
					</div>
		</div>
		</div>
		
		                 <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" id="btn" value="Save" onclick="()">Save</button>
                                       
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
 
 	<%@include file="commons/newFooter.jsp" %>