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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#sender1").change(function() {
			var sender = $('#sender1').val();
			$('#name1').text(sender);
			readPI(sender, "report1");
		})
	});
	
	$(document).ready(function() {
		$("#sender2").change(function() {
			var sender = $('#sender2').val();
			$('#name2').text(sender);
			readPI(sender, "report2");
		})
	});
	

	function readPI(sender, showwindow) {
		console.log('function readPI' + sender);
		$.ajax({
			url : "readPI",
			type : "POST",
			async : false,
			data : 'sender=' + sender,
			success : function(data) {
				console.log(data);
				document.getElementById(showwindow).innerHTML = parser(data);
			},
			error : function(request, status, error) {

				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
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
					
					<select name="sender1" id="sender1">
						<option></option>
						<c:forEach items="${sender}" var="sn">
							<option value="${sn}"> ${sn} </option>
						</c:forEach>
					</select>
					<h3 id="name1">sender1</h3>
					<div id="report1"></div>
			</div>
			<div class="col-sm-6">
					
					<select name="sender2" id="sender2">
						<option></option>
						<c:forEach items="${sender}" var="sn">
							<option value="${sn}"> ${sn} </option>
						</c:forEach>
					</select>
					<h3 id="name2">sender2</h3>
					<div id="report2"></div>
			</div>
			<%-- <div class="col-sm-4">
					<h3>sender1</h3>
					<select name="sender3" id="sender3">
						<option></option>
						<c:forEach items="${sender}" var="sn">
							<option value="${sn}"> ${sn} </option>
						</c:forEach>
					</select>
					<div id="report3"></div>
			</div> --%>
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
	<div id="result"></div>
</body>
</html>