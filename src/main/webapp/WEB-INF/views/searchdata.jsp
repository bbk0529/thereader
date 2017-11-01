<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<c:url value=""/>" />
	<title>LISTING EMAILS </title>
	<link rel="shortcut icon" href="/favicon.ico" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">

$(document).ready(function() {
    var param=getUrlParams();
	
	$(".clickable-row").click(function() {
        window.location = $(this).data("href");
        $(this).data
    });
    
    $("#sender").change(function(){
    	$(location).attr('href','searchdata?keyword=' + $('#sender').val());
    })
    
    $("#emaildate").change(function(){
    	$(location).attr('href','searchdata?keyword=' + $('#emaildate').val());
    })

	$('#keyword').keypress(function(e){ 
		if (e.which === 13){
			if ($('#keyword').val()=='') {
					alert('please enter your keyword(s)');
			}
			else 
				$(location).attr('href','searchdata?keyword=' + $('#keyword').val());
		}
	});
    
    $("#search").click(function() {
		$(location).attr('href','searchData?keyword=' + $('#keyword').val());		 
    });
    
    
    $("#multidetail").click(function() {
    	let param="";
    	var i=0;
		$(".chkclass :checked").each(function(){
			param+=$(this).val() + ',';
			i++;
		});
		if (i<2) { 
			alert('Needs at least 2 emails for merging');
		}	else {
				$(location).attr('href','multidetail?param=' + param);
	    	}
    });
    
    $('#chkall').click(function () {    
        $('input:checkbox').prop('checked', this.checked);    
    });
 
});


function getUrlParams() {
	var params = {};
	window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, 	
			function(str, key, value){ 
				params[key] = value; 
			});
	return params;
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
	<div class="col-sm-12 col-xs-12">
	<table class="table table-hover">
	    <thead>	    		
		 <tr>
	    	<th></th>
	    	<th></th>
	    	<th>
		    	<select name="sender" id="sender">
		    	<option></option>		    	
		    	<c:forEach items="${sender}" var="sn">
	    				<c:choose>
							<c:when test="${sn==param.keyword}">
								<option value="${sn}" selected> ${sn} </option>
							</c:when>
							<c:when test="${sn==';'}">								
							</c:when>
							<c:otherwise>
								<option value="${sn}"> ${sn} </option>
							</c:otherwise>
						</c:choose>
				</c:forEach>
				</select>
			</th>			
			<th>
				<select name="emaildate" id="emaildate">
				<option></option>
				<c:forEach items="${emaildate}" var="date">
						<fmt:formatDate value="${date}" var="fordate" type="date" pattern="yyyy-MM-dd" />
						<c:choose>
							<c:when test="${fordate==param.keyword}">
								<option value="${fordate}" selected>  ${fordate}</option>
							</c:when>
							<c:otherwise>
								<option value="${fordate}"> ${fordate}</option>
							</c:otherwise>
						</c:choose>
						
				</c:forEach>
				</select>				
			</th>			
			<th></th>			
			<th></th>
			<th></th>
		</tr>
		<tr>
	    	<th><input type="checkbox" id="chkall" ></th>
	    	<th>NO</th>
			<th class="col-sm-1 col-xs-1">SENDER</th>
			<th class="col-sm-2 col-xs-2">DATE</th>
			<th class="col-sm-4 col-xs-4">SUBJECT</th>
			<!-- <th>TEXT</th> -->
			<th class="col-sm-1 col-xs-1">WORDS</th>
			<!-- <th>REMARK</th> -->
		</tr>
		</thead>		
		<tbody>
		
		 <c:forEach items="${list}" var="list">
		 <tr class="chkclass">
		 <%-- <tr class='clickable-row' data-href='detail?no=${list.no}'> --%>
			<td><input type="checkbox" id="chk" value="${list.no}"></td>
			<td onclick="window.location.assign('detail?no=${list.no}');">${list.no}</td>
			<td onclick="window.location.assign('detail?no=${list.no}');">${list.sender}</td>
			<td onclick="window.location.assign('detail?no=${list.no}');" class="col-xs-2">${list.date}</td>
			<td onclick="window.location.assign('detail?no=${list.no}');">${list.subject}</td>
			<td onclick="window.location.assign('detail?no=${list.no}');">${list.wordcount}</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
	
	
	<div class="row">
		<div class="col-sm-3 col-xs-3"></div>
		<div class="col-sm-6 col-xs-6"><input class="form-control" id="keyword" name="keyword" type="text" autofocus/></div>			
		<div class="col-sm-1 col-xs-1"><button id="search" class="btn btn-default">SEARCH </button></div>
	</div>
		
	<br/><br/>
	<div class="row">
		<div class="col-sm-12 col-xs-12" style="text-align: center;">
			<button type="button" id="multidetail" class="btn btn-primary"/>MERGE</button></a>
			<button id="submit" type="button" class="btn btn-default" onclick="javascript:history.back()"/>BACK</button>
			<a href="./"><button type="button" id="home" class="btn btn-default"/>HOME</button></a>
		</div>
	</div>
<div id="result"></div>

</body>
</html>