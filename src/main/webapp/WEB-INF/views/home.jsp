<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>The Bot Reading Emails</title>
<link rel="shortcut icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://d3js.org/d3.v4.min.js"></script>
<script src="./resources/js/billboard.js"></script>
<link rel="stylesheet" href="<c:url value=""/>" />
<link rel="stylesheet" href="./resources/css/billboard.css">
<script type="text/javascript">
 /* 
$(document).ready(function(){
	bb.generate({
	    bindto: "#chart",
	    data: {
	        columns: [
	            ["data1", 30, 200, 100, 170, 150, 250],
	            ["data2", 130, 100, 140, 35, 110, 50]
	        ],
	        types: {
	          data1: "line",
	          data2: "area-spline"
	        },
	        colors: {
	          data1: "grey",
	          data2: "black"
	        }
	    }
	});
});  */


</script>


</head>


<body>
<br/><br/><br/><br/>
<div class="container">	
<div class="row">
	<div class="jumbotron">
	<div class="col-sm-12">
 		<h1>The Bot Reading Emails </h1></center>
 		<p>Reading, Analyzing, and getting insights for you. </p>
 		<br/><br/>
 	</div> 
 	</div>
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-sm-2 col-xs-2"></div>
		<div class="col-sm-2 col-xs-2" style="text-align: center;">
			<a href="searchdata?keyword=">
			<img src="./resources/img/1.jpg" class="img-rounded" style="width:100%">
			<h3>DATABASE</h3>
			<p name="list">bbk0529@gmail.com</p></a>
		</div>
		<div class="col-sm-2 col-xs-2" style="text-align: center;">
			<a href="insert">
			<img src="./resources/img/2.jpg" class="img-rounded" style="width:100%">
			<h3>INPUT</h3>
			<p  name="insert">Input emails manually</p></a>
		</div>
		<div class="col-sm-2 col-xs-2" style="text-align: center;">
			<img src="./resources/img/3.jpg" class="img-rounded" style="width:100%">
			<h3  >IMPORTING</h3>
			<p  name="summary">Scrapping your emails</p>
		</div>
		<div class="col-sm-2 col-xs-2" style="text-align: center;">
			<a href="summary">
			<img src="./resources/img/4.jpg" class="img-rounded" style="width:100%">
			<h3>SUMMARY</h3>
			<p  name="summary">Summary of Analysis</p></a>
		</div>		
	</div>

	<div class="row">
	<div class="col-sm-1 col-sx-1"></div>
		<div id="chart"></div>
	<div class="col-sm-1 col-sx-1"></div>
	</div>
</div>
</body>
</html>