<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value=""/>" />
<title>Insert title here</title>
<link rel="shortcut icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#callwatson').click(function() {
			let sender=$('#sender').text();
			let date=$('#date').text();
			let text=$('#text').serialize();
			text = decodeURIComponent(text);
			watsonNLU(sender, date, text);		
		})
		
		var num=0;
		$("input:hidden").each(function(){
	    	console.log($(this).val());
	    	num+=parseInt($(this).val());
	    });	
		$("#wordcount").append("TOTAL WORDS :"+ num);
		if (num<600) {
			$("#comment").append("For better result, add more email(s) to sum up to more than 600 words");	
		}
	})
	
	function children(data){
		var a='';
		a +="<div class='container'><div class='row'><div class='col-xs-12'>";
		a +="<table class='table'>";
		a +="<thead><th>PERSONALITY</th><th>PERCENTILE</th><th>GRAPH</th></thead>";
		a +="<tbody>";
		
		var cur=0;
		$.each(data, function(key, val) {
				cur++;
				$.each(val, function(key, val) {
					if(key=="name"){
						a +="<tr>";
						if (cur%7==1) {
							a +="<td><b>" +  val + "</b></td>";	
						} else {
							a +="<td>" + "_____" + val + "</td>";
						}
					};
					if( key=="percentile"){
						a +="<td>" + val + "</td>";
						a += "<td>";				
						if (cur%7==1) {
							a +=barchart_blue(val);
						} else {	
							a +=barchart(val);
						}
						a +="</td></tr>";
					};
				});
		});
		a +="</tbody></table></div></div></div>";		
		return a;
	};
	
	function barchart(val){
		var w= parseInt(val * 200);
		return '<img src="./resources/img/point_red.png" height="7" width=" '+ w + '"/>';
	};
	
	function barchart_blue(val){
		var w= parseInt(val * 200);
		return '<img src="./resources/img/point_blue.png" height="10" width=" '+ w + '"/>';
	};
	
	function watsonNLU(sender, date, text){
		console.log('sender' + sender);
		console.log('date' + date);
		/* //console.log('text' + text); */
		$.ajax({
			url : "callWatson",
			type : "POST",
			data : '&sender=' + sender +'&date=' + date + '&text=' + text,
			success : function(data) {
				if(data != null) {
					console.log(data);
					var a='';
					a=children(data);					
					console.log(a); 
					document.getElementById("result").innerHTML = a;
					
					
				} else {
					alert('data is null');
				}
			},			
			error : function(request, status, error) {
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
</script>

</head>
<body>

<div class="container">	
		<div class="row">
	 	<div class="col-sm-9 col-xs-9">
	 		<h2> A Bot Reading Emails </h2>
			<h4> Reading emails, analyzing personalities, retreiving insights for you. </h4>
	 	</div>
	 	<div class="col-sm-3 col-xs-3">
	 		<a href="./">
	 		<img src="./resources/img/title.png" class="img-rounded" style="width:100%">
	 		</a>
	 	</div>
		</div>
</div>
<div class="container">
	<div class="row">
	<div class="col-sm-12">
		<div class="row">
			<div class="col-sm-3">
				<h3>SENDER</h3>
				<p  name="sender" id="sender">${vo.sender}</p>
			</div>
			<div class="col-sm-2">
				<h3>DATE</h3>
				<p  name="date" id="date">${vo.date}</p>
			</div>
			<div class="col-sm-7">
				<h3>SUBJECT</h3>
				<p  name="subject">${vo.subject}</p>
				<input type="hidden" value="${vo.wordcount}">
			</div>	
		</div>		
		<div class="row">
			<div class="col-sm-12">
				<h3>TEXT</h3>
			</div>
			<div class="form-group row">
			<div class="col-xs-12">
				<textarea class="form-control col-sm-5" id="text" name="text" rows="10" readonly>${vo.text}</textarea>
			</div>
		</div>
			
		</div>
		<div class="row">
			<div class="col-lg-3 col-sm-3" id="wordcount"></div>
			<div class="col-lg-8 col-sm-9" id="comment"></div>
		</div>
				
		
		
	</div>
	</div>	
	<div class="row">
			<br/><br/>
			<div class="col-sm-12" style="text-align: center">
				<button type="button" class="btn btn-primary"/ id="callwatson"> WATSON</button></>
				<a href="./"><button type="button" id="home" class="btn btn-default""/>HOME</button></a>		
				<button id="submit" type="button" class="btn btn-default" onclick="javascript:history.back()"/>BACK</button>
			</div>			
	</div>
</div>
	
		
<form name="classify_form" method="post">
</form>
<br/><br/>
<div id="result"></div>
</body>
</html>