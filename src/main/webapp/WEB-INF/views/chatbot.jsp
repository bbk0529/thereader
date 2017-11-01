<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="../favicon.ico" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/bubbles.css"/>">
	<script src="<c:url value="/resources/js/jquery-3.2.1.js" />"> </script>
	<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<style>
#dropzone
{
    border:2px dotted #3292A2;
    width:90%;
    height:50px;
    color:#92AAB0;
    text-align:center;
    font-size:24px;
    padding-top:12px;
    margin-top:10px;
}
</style>
<script type="text/javascript">


$(function () {
    var obj = $("#dropzone");

    obj.on('dragenter', function (e) {
         e.stopPropagation();
         e.preventDefault();
         $(this).css('border', '2px solid #5272A0');
    });

    obj.on('dragleave', function (e) {
         e.stopPropagation();
         e.preventDefault();
         $(this).css('border', '2px dotted #8296C2');
    });

    obj.on('dragover', function (e) {
         e.stopPropagation();
         e.preventDefault();
    });

    obj.on('drop', function (e) {
         e.preventDefault();
         $(this).css('border', '2px dotted #8296C2');

         var files = e.originalEvent.dataTransfer.files;
         if(files.length < 1)
              return;

         F_FileMultiUpload(files, obj);
    });

});

$(document).ready(function(){
	ajax_process("");
	
	$('#txt_isay').keypress(function(e){ 
		if (e.which === 13){
			if ($('#txt_isay').val()=='') {
					alert('please enter your message');
			}
			else conversation();	
		}
		
	});
	
	$('#btn_isay').click(function(){
		conversation();
	});
});

function conversation(){
	var _isay = $('#txt_isay').val();
	
	var isay = '<p class="triangle-border right">' + _isay + '</p>';
	$('#said').append(isay);
	$('#txt_isay').val('');
	ajax_process(_isay);
}


function ajax_process(_isay){
	var obj = new Object(); // JSON형식으로 변환 할 오브젝트
	obj.writer = $('#writer').val();
	obj.text = $('#text').val();
	 
	var json_data = JSON.stringify(obj); // form의 값을 넣은 오브젝트를 JSON형식으로 변환
	
	$.ajax({
		type :'POST',
		url	 :'watson',
		data : json_data,
		dataType:"json",
		success : function(data){
			console.log(data);
			var watsonsay = '<p class="triangle-border left">' + data.output.text + '</p>';
			$('#said').append(watsonsay);
			$('html, body').animate({scrollTop: $(document).height()}, 500);
			/* alert($(document).height()); */
		}
	});
	
}

</script>


</head>
<body>
<div id="said"></div>
<input type="text" id="text" class="triangle-border center" autofocus="autofocus"/>  
<input type="text" id="writer"/>
<button type="button" id="btn_isay"  class="btn btn-default">전송</button>


<div id="dropzone">Drag & Drop Files Here</div>

</body>
</html>