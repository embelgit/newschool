
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
<title>Stock List</title> 

<!-- For datatable to pdf,print,excel etc conversion -->
<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>  -->
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>

<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

<script src="/srb/staticContent/JS/libraryManagement.js"></script>
  	
  	<script>
	     $(document).ready(function(){
	    	 stockList();
	}); 
	</script>
	
	<script type="text/javascript">
		function bookEntry()
		{
			window.location="libraryManagement.jsp";	
		}
	</script>

</head>

<body>

<div class="content-wrapper" style="min-height: 1134px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">

                    <div class="p-l-30 p-r-30">
                        <!-- <div class="header-icon"><img src="/srb/staticContent/Images/timetable.png" style="width: 55px;"></div> -->
                        <div class="header-title">
                            <h1>Stock List</h1>
                            <small>List</small> 
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
                    <a class="btn btn-primary"  onclick="bookEntry()" accesskey="t""> <i class="fa fa-book"></i>Book Entry</a>  
                </div>
            </div> 



            <div class="panel-body panel-form">
                <div class="row">

		<form class="form-horizontal">

			<div class="row">
				<div class="form-group">

				</div>
			</div>
			
			
			<div	class="table-responsive">
					<table id="stockList" class="display" style=" border: 2px solid black;border-collapse: collapse;">
						<thead>
							<tr>
								<th>Sr No</th>
								<th>Book Name</th>
								<th>Quantity</th>
								<th>Author Name</th>
								<th>Publisher Name</th>
								
								
							</tr>
						</thead>
					<!--  <tfoot>
							 <tr>
								<th colspan="7" style="text-align: right">Total Rs:</th>
								<th></th>
							</tr> 
						</tfoot> -->
					</table>
				</div>

			
	</form>	
</div>
	<%@include file="commons/newFooter.jsp" %>		