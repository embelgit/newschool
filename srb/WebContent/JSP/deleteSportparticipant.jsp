<%@page import="com.srb.dao.SportInfoDao"%>
<%@page import="com.srb.bean.Sportinfo"%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/bootstrap.min.css"> -->
<meta charset="utf-8">
<script type="text/javascript" src="/srb/staticContent/JS/Student.js"></script>


<script type="text/javascript">
	function Back()
	{
		window.location="listofsportparticipant.jsp";
	}

</script>


</head>
	
	<body>
<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <div class="header-icon"><img src="/srb/staticContent/Images/deleteuser.png" style="width: 55px;"></div>
                        <div class="header-title">
                            <h1>Participant Delete</h1>
                            <small>Delete</small> 
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
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Participant List</a>  
                    </div>
                    
                </div>
               
            <div class="panel-body panel-form">
                <div class="row">	 	
		 	

         <form class="form-horizontal" method="post" action="" name="delstrpro15">  <!-- Value of 'name' attribute is used in categoryDetails.js  -->

		<%-- 	<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div> --%>
			 <div class="row form-group">
           		<label class="col-md-offset-3 col-md-2 control-label" for="godown">Select Field To Delete:<sup>*</sup></label>  
           	 		<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							SportInfoDao dao=new SportInfoDao();
							List list17 = dao.getAllSportparticipanttoDelete();

							%>
							
							<input list="delp_drop2" id="delparticipant"  class="form-control">
				            <datalist id="delp_drop2">
					
							<%
							 for(int i=0;i<list17.size();i++){
								 Sportinfo sp1 =(Sportinfo)list17.get(i);


							%>
		
								<option data-value="<%=sp1.getPkSportid()%>"value="<%=sp1.getFirstName()%>  <%=sp1.getMiddleName()%> <%=sp1.getLastName()%> <%=sp1.getSportParticipant()%>">
							<%
				      			}
				    		%>
						</datalist>        
            			</div>
           		 	</div>
				</div>
				
		
         
            <div class="form-group row">
                                <div class="col-md-offset-4 col-md-4 btn-center">
                                    <div class="ui buttons">
                                    <input type="button" class="ui positive button" name="btn" id="btn" value="Delete"  onclick=" ValidationSportParticipant() " style="width: 95px;">
                                       
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
     
<%-- <%@include file="commons/footer.jsp" %> --%>
				