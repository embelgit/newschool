<!DOCTYPE html>
<!-- <html lang="en"> -->

<%@page import="java.util.List"%>
<%@page import="com.srb.dao.ClassInfoDao"%>
<%-- <% boolean isHome=false;%>
<%@include file="commons/header.jsp"%> --%>
<head>
 <% 
                    // out.println(""+session.getAttribute("user"));
		             if (session.getAttribute("user")  != null) {
			
		            	 out.println("");
		           }
		             else {
							
					     response.sendRedirect("/srb/JSP/login.jsp");
					     out.println("Please Login ");
				        }
	           %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Comoatible" content="IE=edge">
  <title>Dashboard </title>
  <link rel="stylesheet" type="text/css" href="/srb/staticContent/CSS/bootstrap_aniket.css">
  <link rel="stylesheet" type="text/css" href="/srb/staticContent/CSS/style_aniket.css">
  <script src="/srb/staticContent/JS/graph.js"></script>
 
  
</head>
<body onload="getTotalStudentCountForGraph()"> 
<!--  //getTotalStudentCount() -->

  <div class="container-fluid display-table">
    <div class="row display-table-row">
      <!-- Side menu -->
      <!-- <div class="col-md-2 col-sm-1 hidden-xs display-table-cell valign-top border-bottom" id="side-menu">
          <h1 class="hidden-xs hidden-sm">Admin</h1>
          <ul>
            <li class="link">
              <a href="/srb/JSP/School.jsp">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                <span class="hidden-sm hidden-xs"> Home</span>
              </a>
              </li>
            <li class="link active">
              <a href="index.html">
                <a href="index.jsp">
                <span class="glyphicon glyphicon-th" aria-hidden="true"></span>
                <span class="hidden-sm hidden-xs"> Dashboard</span>
              </a>
            </li>

             <li class="link"> 
                <a href="#collapse-post" data-toggle="collapse" aria-controls="collapse-post"
                aria-expanded="false">
                  <span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                  <span class="hidden-sm hidden-xs">Inventory Reports</span>
                  <span class="label label-success pull-right hidden-sm hidden-xs"></span>
                </a>
                <ul id="collapse-post" class="collapse collapseable">
                  <li>
                    <a href="/srb/JSP/stockReport.jsp">
                     Stock Report                     
                    </a>
                  </li>
                  <li>
                    <a href="reports.html">
                      Report 2                      
                    </a>
                  </li>
                  <li>
                    <a href="reports.html">
                      Report 3                       
                    </a>
                  </li>
                  <li>
                    <a href="reports.html">
                       Report 4                       
                    </a>
                  </li>
                </ul>
            </li>
              
          <li class="link">
                <a href="#collapse-sales" data-toggle="collapse" aria-controls="collapse-sales"
                aria-expanded="false">
                  <span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                  <span class="hidden-sm hidden-xs">Cashbook Reports</span>
                  <span class="label label-success pull-right hidden-sm hidden-xs"></span>
                </a>
                <ul id="collapse-sales" class="collapse collapseable">
                  <li>
                    <a href="/srb/JSP/studentBalanceReports.jsp">
                     Student Balance Report                     
                    </a>
                  </li>
                  <li>
                    <a href="reports.html">
                      Report 2                      
                    </a>
                  </li>
                  <li>
                    <a href="reports.html">
                      Report 3                       
                    </a>
                  </li>
                  <li>
                    <a href="reports.html">
                       Report 4                       
                    </a>
                  </li>
                </ul>
            </li>
              
            <li class="link"> 
                <a href="/srb/JSP/certificateIssuedReport.jsp" ><span class="glyphicon glyphicon-file"></span>Certificate Issued Report
                  <span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                  <span class="hidden-sm hidden-xs">Certificate Issued Report</span>
                  <span class="label label-success pull-right hidden-sm hidden-xs"></span>
                </a>
                <ul id="collapse-post" class="collapse collapseable">
                  <li>
                    <a href="/srb/JSP/stockReport.jsp">
                     Stock Report                     
                    </a>
                  </li>
                  <li>
                    <a href="reports.html">
                      Report 2                      
                    </a>
                  </li>
                  <li>
                    <a href="reports.html">
                      Report 3                       
                    </a>
                  </li>
                  <li>
                    <a href="reports.html">
                       Report 4                       
                    </a>
                  </li>
                </ul>
            </li>
              
          </ul>
      </div> -->
      <!-- main content -->
      <div class="col-md-10 col-sm-11 display-table-cell valign-top box">
        <div class="row">
          <header id="nav-header" class="clearfix">
             <div class="col-md-5">
              <nav class="navbar-default pull-left">
                <button type="button" class="navbar-toggle collapsed" data-toggle="offcanvas" data-target="#side-menu">
                  <span class="sr-only">Toggle Navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
              </nav> 
               <h4 id="main-head" class="col-md-12" style="font-family: "ubantu;"><span class="sub-head"><i>Created By</i></span> <strong>EMBEL TECHNOLOGIES PVT LTD</strong></h4>
             </div>
             <div class="col-md-7">
               <ul class="pull-right">
                 <li id="welcome" class="hidden-xs">  
                  <input type="text" class="hidden-sm hidden-xs" id="header-feild-search"placeholder="search for something">
                 </li>
                <!--  <li class="fixed-width">
                    <a href="#" ><span class="glyphicon glyphicon-envelope area-hidden="true"></span>
                    <span class="label label-message">3</span>
                    </a>
                  </li> -->
                 <li ><a href="/srb/JSP/login.jsp" class="logout"><span class="glyphicon glyphicon-log-out" area-hidden="true"></span></a>LogOut</li>
               </ul>
             </div>
          </header> 
        </div>
        

        <div class="col-md-8">
   <%--       			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label">Class Name:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
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
					<div class="col-sm-2 col-md-offset-1" >
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								style="width: 170px;" onclick="studentResultForGraph()" value="Search" />
					</div>

				</div>
			</div> --%>
          <div class="row">
          <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
           <!--  <section id="stats" class="clearfix">
              <div class="tab panel-header">
                <button class="tablinks active" onclick="openCity(event, 'Graph')">Graph</button>
                <button class="tablinks" href="#myChart1"onclick="openCity(event, 'Pie-Chart')">Bar-Graph</button>
              </div>
                    
              <div class="panel-content">

              <div id="Graph" class="tabcontent">
               <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
              </div>

              <div id="Pie-Chart" class="tabcontent">
               
			<div id="container1" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
              </div>
              </div>
            </section> -->

          </div>
        </div>
        <div class="col-md-4">
          <div class="row clearfix">
            <div class="panel list-search">
              <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">

                <ul id="myUL" class="clearfix">
                  <li><a href="#">Adele</a></li>
                  <li><a href="#">Agnes</a></li>

                  <li><a href="#">Billy</a></li>
                  <li><a href="#">Bob</a></li>

                  <li><a href="#">Calvin</a></li>
                  <li><a href="#">Christina</a></li>
                  <li><a href="#">Cindy</a></li>
                  <li><a href="#">Cavin</a></li>
                </ul>
            </div>
          </div>
        </div>    
        <div class="col-md-6 ">
          <div class="row clearfix">
            <aside id="daily-stats">
              <div class="panel panel-left">
                <div class="panel-heading">
                  <h4 class="panel-title">Number Of Student</h4>
                </div>
                <div class="panel-body">
                  <b><output id='studentCount'></output></b>
                </div>
              </div>
            </aside> 
          </div>  
        </div>
         <div class="col-md-6 ">
          <div class="row clearfix">
            <aside id="daily-stats">
              <div class="panel panel-right">
                <div class="panel-heading">
                  <h4 class="panel-title">Number Of Present Student</h4>
                </div>
                <div class="panel-body">
                  <b><output id='studentPresent'></output></b>
                </div>
              </div>
            </aside> 
          </div>  
        </div>

            <div class="row">
             <footer id="admin-footer" class="clearfix col-md-12">
                <div class="pull-left"><b>copyright</b> &copy; 2017 </div>
                <div class="pull-right"> Admin system</div>
              </footer>
            
            </div>
      </div>  
    </div>
  </div>



  <script src="/srb/staticContent/JS/jquery_aniket.js"></script>
  <script src="/srb/staticContent/JS/bootstrap_aniket.js"></script>

  <script src="/srb/staticContent/JS/default_aniket.js"></script>
  <script src="/srb/staticContent/JS/charts_aniket.js"></script>
   <script src="/srb/staticContent/JS/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<!-- <script>

//Create the chart
Highcharts.chart('container', {
 chart: {
     type: 'column'
 },
 title: {
     text: 'Student Result'
 },
 subtitle: {
     text: 'Click the columns to view versions. Source: <a href="http://netmarketshare.com">netmarketshare.com</a>.'
 },
 xAxis: {
     type: 'category'
 },
 yAxis: {
     title: {
         text: 'Total percent market share'
     }

 },
 legend: {
     enabled: false
 },
 plotOptions: {
     series: {
         borderWidth: 0,
         dataLabels: {
             enabled: true,
             format: '{point.y:.1f}%'
         }
     }
 },

 tooltip: {
     headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
     pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
 },

 series: [{
     name: 'Brands',
     colorByPoint: true,
     data: [{
         name: 'Microsoft Internet Explorer',
         y: 56.33,
         drilldown: 'Microsoft Internet Explorer'
     }, {
         name: 'Chrome',
         y: 24.03,
         drilldown: 'Chrome'
     }, {
         name: 'Firefox',
         y: 10.38,
         drilldown: 'Firefox'
     }, {
         name: 'Safari',
         y: 4.77,
         drilldown: 'Safari'
     }, {
         name: 'Opera',
         y: 0.91,
         drilldown: 'Opera'
     }, {
         name: 'Proprietary or Undetectable',
         y: 0.2,
         drilldown: null
     }]
 }],
 drilldown: {
     series: [{
         name: 'Microsoft Internet Explorer',
         id: 'Microsoft Internet Explorer',
         data: [
             [
                 'v11.0',
                 24.13
             ],
             [
                 'v8.0',
                 17.2
             ],
             [
                 'v9.0',
                 8.11
             ],
             [
                 'v10.0',
                 5.33
             ],
             [
                 'v6.0',
                 1.06
             ],
             [
                 'v7.0',
                 0.5
             ]
         ]
     }, {
         name: 'Chrome',
         id: 'Chrome',
         data: [
             [
                 'v40.0',
                 5
             ],
             [
                 'v41.0',
                 4.32
             ],
             [
                 'v42.0',
                 3.68
             ],
             [
                 'v39.0',
                 2.96
             ],
             [
                 'v36.0',
                 2.53
             ],
             [
                 'v43.0',
                 1.45
             ],
             [
                 'v31.0',
                 1.24
             ],
             [
                 'v35.0',
                 0.85
             ],
             [
                 'v38.0',
                 0.6
             ],
             [
                 'v32.0',
                 0.55
             ],
             [
                 'v37.0',
                 0.38
             ],
             [
                 'v33.0',
                 0.19
             ],
             [
                 'v34.0',
                 0.14
             ],
             [
                 'v30.0',
                 0.14
             ]
         ]
     }, {
         name: 'Firefox',
         id: 'Firefox',
         data: [
             [
                 'v35',
                 2.76
             ],
             [
                 'v36',
                 2.32
             ],
             [
                 'v37',
                 2.31
             ],
             [
                 'v34',
                 1.27
             ],
             [
                 'v38',
                 1.02
             ],
             [
                 'v31',
                 0.33
             ],
             [
                 'v33',
                 0.22
             ],
             [
                 'v32',
                 0.15
             ]
         ]
     }, {
         name: 'Safari',
         id: 'Safari',
         data: [
             [
                 'v8.0',
                 2.56
             ],
             [
                 'v7.1',
                 0.77
             ],
             [
                 'v5.1',
                 0.42
             ],
             [
                 'v5.0',
                 0.3
             ],
             [
                 'v6.1',
                 0.29
             ],
             [
                 'v7.0',
                 0.26
             ],
             [
                 'v6.2',
                 0.17
             ]
         ]
     }, {
         name: 'Opera',
         id: 'Opera',
         data: [
             [
                 'v12.x',
                 0.34
             ],
             [
                 'v28',
                 0.24
             ],
             [
                 'v27',
                 0.17
             ],
             [
                 'v29',
                 0.16
             ]
         ]
     }]
 }
});




</script> -->
 <!--  <script>
function openCity(evt, statsType) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(statsType).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>


<script type="text/javascript">
 Highcharts.chart('container', {
    chart: {
        type: 'area'
    },
    title: {
        text: 'Sales , Purchase and Expences'
    },
    subtitle: {
        text: 'Source: <a href="https://http://www.embel.co.in">EMBEL TECHNOLOGIES</a>'
    },
    xAxis: {
        allowDecimals: false,
        labels: {
            formatter: function () {
                return this.value; // clean, unformatted number for year
            }
        }
    },
    yAxis: {
        title: {
            text: 'Figures (In Lakhs)'
        },
        labels: {
            formatter: function () {
                return this.value / 500 + 'k';
            }
        }
    },
    tooltip: {
        pointFormat: '{series.name} produced <b>{point.y:,.0f}</b><br/>warheads in {point.x}'
    },
    plotOptions: {
        area: {
            pointStart: 2015,
            marker: {
                enabled: false,
                symbol: 'circle',
                radius: 2,
                states: {
                    hover: {
                        enabled: true
                    }
                }
            }
        }
    },
    series: [{
        name: 'Year 2015',
        data: [133, 156, 947, ]
    }, {
        name: 'Year 2016 ',
        data: [1052, 954, 4250,]
    },
     {
        name: 'Year 2017',
        data: [152, 1954, 450, ]
    },]
});
</script>
<script type="text/javascript">
  // Build the chart
Highcharts.chart('container1', {
    chart: {
        type: 'bar'
    },
    title: {
        text: 'Sales , Purchase and Expences'
    },
    subtitle: {
        text: 'Source: <a href="https://http://www.embel.co.in">EMBEL TECHNOLOGIES</a>'
    },
    xAxis: {
        categories: ['Year 2015 ', 'Year 2016', 'Year 2017 ',],
        title: {
            text: null
        }
    },
    yAxis: {
        min: 0,
        title: {
            text: 'Sales (In Lakhs)',
            align: 'high'
        },
        labels: {
            overflow: 'justify' 
        }

    },
    tooltip: {
        valueSuffix: ' Lakhs'
    },
    plotOptions: {
        bar: {
            dataLabels: {
                enabled: true
            }
        }
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -40,
        y: 80,
        floating: true,
        borderWidth: 1,
        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        shadow: true
    },
    credits: {
        enabled: false
    },
    series: [ {
        name: 'Year 2015',
        data: [133, 156, 947, ]
    }, {
        name: 'Year 2016',
        data: [1052, 954, 4250, ]
    },
    {
        name: 'Year 2017',
        data: [152, 1954, 450, ]
    },]
});
</script>

<script>
function myFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";

        }
    }
}
</script>
 -->
</body>
