<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value=""/>" />
<title>Manually Input</title>
<link rel="shortcut icon" href="/favicon.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#submit').click(function() {
			let param = $('form').serialize();
			
			console.log('param1st stg' + param);
			param = decodeURIComponent(param);
			console.log('param2nd stg' + param);
			watsonNLU(param);			
		});		
	});
	
	
	function watsonNLU(param){
		$.ajax({
			url : "insertEmail",
			type : "POST",
			data : param,
			/* contentType : "application/json; charset=UTF-8", */
			success : function(data) {
				if(data != null) {
						alert('Your email has been successfully saved in the Database');
						/* a="<br/><center><h4>입력하신 email 이 DB에 정상적으로 잘 저장 되었습니다.</h4></center>"; */
						console.log(a); 
						/* document.getElementById("result").innerHTML = a; */
						$("form").each(function() {  
					    	this.reset();  
					    });  
				} 
			}
		});
	};
	
</script>

</head>

<body>
<form name="form" method="post">
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
	 	<div class="row">
	 		<div class="col-sm-2"><a href="./"><img src="./resources/img/email.jpg" class="img-rounded" style="width:100%"></a></div>
	 	<div class="col-sm-10">
			<div class="row">
				<div class="col-xs-4">
		    		<label for="ex1">SENDER</label>
		    		<input class="form-control" name="sender" type="text" value="bbk0529@gmail.com">
		  		</div>
		  		<div class="col-xs-4">
		    		<label for="ex2">DATE</label>
		    		<input class="form-control" name="date" type="date">
		  		</div>
		  		<div class="col-xs-4">
		    		<label for="ex2">LANGUAGE</label>
		    		<input class="form-control" name="language" type="text" value="ENGLISH ONLY" readonly>
		  		</div>
		  	</div>
		  	<div class="row">
			  	<div class="col-xs-12">
			  		<br/>
		    		<label for="ex3">SUBJECT</label>
			    	<input class="form-control" name="subject" type="text" value="untitle">
		  		</div>
		  	</div>
		</div>
		</div>
		<div class="form-group row">
			<div class="col-xs-12">
				<br/>
				<label for="ex1">CONTENTS</label>
				<textarea class="form-control col-sm-5" name="text" rows="10">your emails are written herein</textarea>
			</div>
		</div>
		<div class="row">
		<div class="col-sm-12" style="text-align: center;">
			<button id="submit" type="button" class="btn btn-primary" />SUBMIT</button>
			<button type="button" class="btn btn-default" onclick="javascript:history.back()"/>BACK</button>
			<a href="./"><button type="button" id="home" class="btn btn-default"/>HOME</button></a>
		</div>
	</div>
</form>
<div class="container" id="result">	
</div>

</body>
</html>