//get total student count for dashboard
function getTotalStudentCount(){
	 var params= {};
	$("#studentCount").append($("<output/>").attr("value","").text());
	
	params["methodName"] = "getStudentCountForDashboard";
	
	$.post('/srb/JSP/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				  document.getElementById("studentCount").value = v.studentCount;
			   
				});
			})/*.error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});*/
}

//student result for graph
function studentResultForGraph(){
	var params = {};
	var input = document.getElementById('fk_class_id1'),
	list = document.getElementById('classes'),
	i,fk_class_id;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input.value) {
		fk_class_id = list.options[i].getAttribute('data-value');
		}
	}

	params["fk_class_id"]= fk_class_id;
	
	params["methodName"] = "studentResultForGraph";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		var sss = $.map(catmap, function(el) { return el.price });
		var ddd = $.map(catmap, function(el) { return el.weekDays });
		
		
		$(function () {
		    Highcharts.chart('container', {
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: 'Daily Fertilizer Sale'
		        },
		        subtitle: {
		            text: 'Source: embel.co.in'
		        },
		        xAxis: {
		        	categories: ddd
		          
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: 'Price (Rs)'
		            }
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                '<td style="padding:0"><b>{point.y:.1f} Rs</b></td></tr>',
		            footerFormat: '</table>',
		            shared: true,
		            useHTML: true
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.2,
		                borderWidth: 0
		            }
		        },
		        series: [{
		            
		            name: 'Price',
		            data: sss

		       

		        }]
		    });
		});
		
			});

}

function getTotalStudentCountForGraph(){
	var params = {};
	params["methodName"] = "gerAllStudentCountForGraph";

	$.post('/srb/JSP/utility/controller.jsp',params,function(data)
			{
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		var sss = $.map(catmap, function(el) { return el.studentCount });
		var ddd = $.map(catmap, function(el) { return el.className });
		
		$(function () {
		    Highcharts.chart('container', {
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: 'Student As Per Class'
		        },
		        subtitle: {
		            text: 'Source: embel.co.in'
		        },
		        xAxis: {
		        	categories: ddd
		          
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: 'Number Of Students'
		            }
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                '<td style="padding:0"><b>{point.y:.1f} Rs</b></td></tr>',
		            footerFormat: '</table>',
		            shared: true,
		            useHTML: true
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.2,
		                borderWidth: 0
		            }
		        },
		        series: [{
		            
		            name: 'Class',
		            data: sss
		        }]
		    });
		});
		
			});
}