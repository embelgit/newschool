<%@page import="com.srb.dao.TransportationInfoDao"%>
<%@page import="com.srb.bean.GetTransportationDetails"%>
<%@page import="com.srb.hibernate.TrasnportDetailsHibernate" %>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/bootstrap.min.css"> -->
<meta charset="utf-8">
<script type="text/javascript" src="/srb/staticContent/JS/transportation.js"></script>


<script type="text/javascript">
	function Back()
	{
		window.location="TransportationStudentLIst.jsp";
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
                            <h1>Transportation Delete</h1>
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
                    <a class="btn btn-primary"  onclick="Back()" accesskey="t""> <i class="fa fa-list"></i>Transportation List</a>  
                    </div>
                    
                </div>
               
            <div class="panel-body panel-form">
                <div class="row">	 	
		 	

         <form class="form-horizontal" method="post" action="" name="delstrpro13">  <!-- Value of 'name' attribute is used in categoryDetails.js  -->

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
							TransportationInfoDao dao1=new TransportationInfoDao();
							List list16 = dao1.getToDeleteTransportaionDetailsLists();

							%>
							
							<input list="field_drop4" id="field4"  class="form-control">
				            <datalist id="field_drop4">
					
							<%
							 for(int i=0;i<list16.size();i++){
								 GetTransportationDetails sup1 =(GetTransportationDetails)list16.get(i);

							%>
		
								<option data-value="<%=sup1.getPkTranspaymentId()%>"value="<%=sup1.getStudentName()%>,<%=sup1.getContactNo()%>">
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
                                    <input class="ui positive button" name="btn" id="btn" value="Delete"  onclick="deleteTransportationDetails()" style="width: 95px;">
                                       
                                        <div class="or"></div>
                                         <button type="reset" class="ui button">Reset</button>
                                         </div>
                                </div>
                            </div>
       </form>
   
     
     <%@include file="commons/newFooter.jsp" %>
     
<%-- <%@include file="commons/footer.jsp" %> --%>
				