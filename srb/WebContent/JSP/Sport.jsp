<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sport Activity</title>
  <script src="/srb/staticContent/JS/Sport.js"></script>
<script type="text/javascript">

	 function editSport() {
			 window.location = "EditSport.jsp";
	}
	function sportsList(){
		 window.location = "ListofSport.jsp";
	}
</script>	

<script type="text/javascript">
	function sportsParticipant()
	{
		window.location="Sportparticipant.jsp";
		
	}

</script>
</head>

<body>
<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/sports.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Sport Details</h1>
                            <small>Sports</small> 
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
                    <a class="btn btn-primary" onclick="sportsList()" accesskey="t""> <i class="fa fa-list"></i>Sport Details List</a>  
                </div>
                
                  <div class="btn-group"> 
                    <a class="btn btn-primary" onclick="sportsParticipant()" accesskey="t""> <i class="fa fa-trophy"></i>Sport Participant</a>  
                </div>
                
                </div>
               
            <div class="panel-body panel-form">
                <div class="row">
	

	<form class="form-horizontal" name="schoolFormName">
		
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
							<input type="text" id='Createactivity' name="Createactivity" class="form-control" placeholder="Enter Create Activity Name" />
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
			
			

			</div>
			
			
			     <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" id ="btn" value="Save" onclick="validationAddSportInfo()">Save</button>
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         <div class="or"></div>
                                          <button class="ui positive button"  type="button" value="Edit" id="listBtn" onclick="editSport()">Edit</button>
                                    </div>
                                </div>
                            </div>
		</form>		
</div>
</body>
</html>				
					
	 <%@include file="commons/newFooter.jsp" %>      
			