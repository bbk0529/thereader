<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value=""/>" />
<title>SUMMARY</title>
<link rel="shortcut icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/billboard.css">
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="./resources/js/billboard.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	var data1 = new Array();	
	var data2 = new Array();
	data1=[];
	data2=[];

	$(function() {
		
		var chart =bb.generate({
		    "bindto": "#chart",
		    "data": {
		        "columns": [
		        ],
		        "types": {
		        	"data1": "step",
		            "data2": "area-step"
		        },
		        "colors": {
		          data1: "grey",
		          data2: "black"
		        }
		    },
		    
		    "legend": {
		        "position": "right"
		     },
			"axis": {
			    "x": {
			      "type": "category",
			      "categories": [
			    	"Openness",
			    	"Adventurousness",
			    	"Artistic_interests",
			    	"Emotionality",
			    	"Imagination",
			    	"Intellect",
			    	"Authority_challenging",
			    	"Conscientiousness",
			    	"Achievement_striving",
			    	"Cautiousness",
			    	"Dutifulness",
			    	"Orderliness",
			    	"Self_discipline",
			    	"Self_efficacy",
			    	"Extraversion",
			    	"Activity_level",
			    	"Assertiveness",
			    	"Cheerfulness",
			    	"Excitement_seeking",
			    	"Outgoing",
			    	"Gregariousness",
			    	"Agreeableness",
			    	"Altruism",
			    	"Cooperation",
			    	"Modesty",
			    	"Uncompromising",
			    	"Sympathy",
			    	"Trust",
			    	"Emotional_range",
			    	"Fiery",
			    	"Prone_to_worry",
			    	"Melancholy",
			    	"Immoderation",
			    	"Self_consciousness",
			    	"Susceptible_to_stress"
			      ]
			    }
		 }
		}); // var chart  
		
		$("#sender1").change(function() {
			var sender = $('#sender1').val();
			$('#name1').text(sender);
			readPI(sender, "data1", chart);
		}); //#sender1
	
		$("#sender2").change(function() {
			var sender = $('#sender2').val();
			$('#name2').text(sender);
			readPI(sender, "data2", chart);
		}); //#sender2
	}); // $(function)

	
	
	
	
	function readPI(sender, window, chart) {
		console.log('function readPI' + sender);
		$.ajax({
			url : "readPI",
			type : "POST",
			async : false,
			data : 'sender=' + sender,
			success : function(data) {
				console.log(data);
				document.getElementById(window).innerHTML = parser(data);
				
				if (window=="data1") { data1=datainput(data);};
				if (window=="data2") { data2=datainput(data);};
				chart.category(2, "Category 3");
				chart.load({
				    columns: [
				       data1,
				       data2
				   ]
				 }); // chart.load
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:" + error);
			}
		});
	};
	
	function datainput(data){
		var arr = new Array();		
		$.each(data, function (key,val){
			if (key=='sender') { arr.push(val); };
			if (key!='no' && key!='date' && key!='sender') {
				arr.push(val)
			};
		});
		console.log(arr);
		return arr;
	};

	function parser(data) {
		var a='';
		
		
		a+="<table class='table'>";
		$.each(data, function(key, val) {
			if (key!='no' && key!='date' && key!='sender') {
				if (val>0.9){
					a += "<tr>";
					a += "<td>" + key + "</td>";
					a += "<td>" + val + "</td>";
					a += "<td>" + barchart(val, "green") +"</td>";
					a += "</tr>";
				} else if (val>0.7) {
					a += "<tr>";
					a += "<td>" + key + "</td>";
					a += "<td>" + val + "</td>";
					a += "<td>" + barchart(val, "lgreen") +"</td>";
					a += "</tr>";
				} else {
					a += "<tr style='color:grey;'>";
					a += "<td>" + key + "</td>";
					a += "<td>" + val + "</td>";
					a += "<td>" + barchart(val, "grey") +"</td>";
					a += "</tr>";
				}
			}
		});
		a+="</table>";
		return a;
	}
	

	
	function barchart(val, color){
		var w= parseInt(val * 100);
		  return '<img src="./resources/img/point_'+ color + '.png" height="7" width="'+ w + '"/>';
	};

		
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-xs-9">
				<h2>A Bot Reading Emails</h2>
				<h4>Reading emails, analyzing personalities, retreiving
					insights for you.</h4>
			</div>
			<div class="col-sm-3 col-xs-3">
				<a href="./"> <img src="./resources/img/title.png"
					class="img-rounded" style="width: 100%">
				</a>
			</div>
		</div>
	</div>



	<!-- body started here -->
	<div class="container">
		<div class="row">
			<div class="col-sm-6">

					<h3 id="name1">sender1</h3>
					<div id="data1"></div>
					<select name="sender1" id="sender1">
						<option></option>
						<c:forEach items="${sender}" var="sn">
							<option value="${sn}"> ${sn} </option>
						</c:forEach>
					</select>
			</div>
			<div class="col-sm-6">
					
					
					<h3 id="name2">sender2</h3>
					<div id="data2"></div>
					<select name="sender2" id="sender2">
						<option></option>
						<c:forEach items="${sender}" var="sn">
							<option value="${sn}"> ${sn} </option>
						</c:forEach>
					</select>
			</div>		
		</div>
		
		

		<!--  bottom buttons here -->
		<div class="row">
			<br />
			<br />
			<div class="col-sm-12" style="text-align: center">
				 <a href="./"><button type="button" id="home"
						class="btn btn-default" "/>HOME
					</button></a>
				<button id="submit" type="button" class="btn btn-default"
					onclick="javascript:history.back()" />
				BACK
				</button>
			</div>
		</div>
	</div>


	<br />
	<br />
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-11"><div id="chart"></div></div>
	</div>
</body>
</html>